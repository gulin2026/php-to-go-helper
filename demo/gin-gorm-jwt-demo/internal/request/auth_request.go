package request

type RegisterRequest struct {
    Name            string `json:"name" binding:"required,min=2,max=100"`
    Email           string `json:"email" binding:"required,email,max=150"`
    Password        string `json:"password" binding:"required,min=6,max=64"`
    PasswordConfirm string `json:"password_confirm" binding:"required,eqfield=Password"`
}

type LoginRequest struct {
    Email    string `json:"email" binding:"required,email,max=150"`
    Password string `json:"password" binding:"required,min=6,max=64"`
}
