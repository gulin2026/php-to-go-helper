package request

// UserRegisterRequest 对应 Laravel 注册请求验证。
type UserRegisterRequest struct {
    Name            string `json:"name" binding:"required,min=2,max=100"`
    Email           string `json:"email" binding:"required,email,max=150"`
    Password        string `json:"password" binding:"required,min=6,max=64"`
    PasswordConfirm string `json:"password_confirm" binding:"required,eqfield=Password"`
}

// UserLoginRequest 对应 Laravel 登录请求验证。
type UserLoginRequest struct {
    Email    string `json:"email" binding:"required,email,max=150"`
    Password string `json:"password" binding:"required,min=6,max=64"`
}
