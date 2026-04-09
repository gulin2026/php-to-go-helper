package service

import (
    "errors"
    "time"

    "github.com/gulin2026/php-to-go-helper-demo/internal/config"
    "github.com/gulin2026/php-to-go-helper-demo/internal/model"
    "github.com/gulin2026/php-to-go-helper-demo/internal/request"

    "github.com/golang-jwt/jwt/v5"
    "golang.org/x/crypto/bcrypt"
    "gorm.io/gorm"
)

type AuthService struct {
    db  *gorm.DB
    cfg *config.Config
}

func NewAuthService(db *gorm.DB, cfg *config.Config) *AuthService {
    return &AuthService{db: db, cfg: cfg}
}

func (s *AuthService) Register(req request.RegisterRequest) (*model.User, error) {
    var count int64
    if err := s.db.Model(&model.User{}).Where("email = ?", req.Email).Count(&count).Error; err != nil {
        return nil, err
    }
    if count > 0 {
        return nil, errors.New("email already exists")
    }

    hashedPassword, err := bcrypt.GenerateFromPassword([]byte(req.Password), bcrypt.DefaultCost)
    if err != nil {
        return nil, err
    }

    user := &model.User{
        Name:     req.Name,
        Email:    req.Email,
        Password: string(hashedPassword),
    }

    if err := s.db.Create(user).Error; err != nil {
        return nil, err
    }

    return user, nil
}

func (s *AuthService) Login(req request.LoginRequest) (*model.User, string, error) {
    var user model.User
    if err := s.db.Where("email = ?", req.Email).First(&user).Error; err != nil {
        if errors.Is(err, gorm.ErrRecordNotFound) {
            return nil, "", errors.New("invalid credentials")
        }
        return nil, "", err
    }

    if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.Password)); err != nil {
        return nil, "", errors.New("invalid credentials")
    }

    token, err := s.generateJWT(user.ID, user.Email)
    if err != nil {
        return nil, "", err
    }

    return &user, token, nil
}

func (s *AuthService) GetUserByID(id uint) (*model.User, error) {
    var user model.User
    if err := s.db.First(&user, id).Error; err != nil {
        return nil, err
    }

    return &user, nil
}

func (s *AuthService) generateJWT(userID uint, email string) (string, error) {
    claims := jwt.MapClaims{
        "sub":   userID,
        "email": email,
        "exp":   time.Now().Add(time.Duration(s.cfg.JWTExpiresIn) * time.Hour).Unix(),
        "iat":   time.Now().Unix(),
    }

    token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
    return token.SignedString([]byte(s.cfg.JWTSecret))
}
