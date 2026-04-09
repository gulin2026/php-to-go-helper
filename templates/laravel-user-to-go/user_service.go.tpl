package service

import (
    "errors"

    "{{MODULE_NAME}}/internal/model"
    "{{MODULE_NAME}}/internal/request"

    "golang.org/x/crypto/bcrypt"
    "gorm.io/gorm"
)

// UserService 展示 Laravel 用户认证逻辑迁移到 Go 后的 service 组织方式。
type UserService struct {
    db *gorm.DB
}

func NewUserService(db *gorm.DB) *UserService {
    return &UserService{db: db}
}

func (s *UserService) RegisterUser(req request.UserRegisterRequest) (*model.User, error) {
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

func (s *UserService) LoginUser(req request.UserLoginRequest) (*model.User, error) {
    var user model.User
    if err := s.db.Where("email = ?", req.Email).First(&user).Error; err != nil {
        return nil, err
    }

    if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.Password)); err != nil {
        return nil, errors.New("invalid credentials")
    }

    return &user, nil
}
