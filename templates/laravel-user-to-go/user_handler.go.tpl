package handler

import (
    "net/http"

    "{{MODULE_NAME}}/internal/request"
    "{{MODULE_NAME}}/internal/response"
    "{{MODULE_NAME}}/internal/service"

    "github.com/gin-gonic/gin"
)

// UserHandler 用于承接从 Laravel User/Auth 模块迁移过来的接口。
type UserHandler struct {
    authService *service.AuthService
}

func NewUserHandler(authService *service.AuthService) *UserHandler {
    return &UserHandler{authService: authService}
}

func (h *UserHandler) Register(c *gin.Context) {
    var req request.UserRegisterRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        response.Error(c, http.StatusBadRequest, err.Error())
        return
    }

    user, err := h.authService.RegisterUser(req)
    if err != nil {
        response.Error(c, http.StatusBadRequest, err.Error())
        return
    }

    response.JSON(c, http.StatusCreated, "register success", gin.H{"user": user})
}

func (h *UserHandler) Login(c *gin.Context) {
    var req request.UserLoginRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        response.Error(c, http.StatusBadRequest, err.Error())
        return
    }

    user, token, err := h.authService.LoginUser(req)
    if err != nil {
        response.Error(c, http.StatusUnauthorized, err.Error())
        return
    }

    response.JSON(c, http.StatusOK, "login success", gin.H{
        "user":  user,
        "token": token,
    })
}

func (h *UserHandler) Me(c *gin.Context) {
    userID := c.GetUint("user_id")

    user, err := h.authService.GetUserByID(userID)
    if err != nil {
        response.Error(c, http.StatusNotFound, "user not found")
        return
    }

    response.JSON(c, http.StatusOK, "success", gin.H{"user": user})
}
