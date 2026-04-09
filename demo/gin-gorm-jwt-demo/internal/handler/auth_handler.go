package handler

import (
    "net/http"

    "github.com/gulin2026/php-to-go-helper-demo/internal/request"
    "github.com/gulin2026/php-to-go-helper-demo/internal/response"
    "github.com/gulin2026/php-to-go-helper-demo/internal/service"

    "github.com/gin-gonic/gin"
)

type AuthHandler struct {
    authService *service.AuthService
}

func NewAuthHandler(authService *service.AuthService) *AuthHandler {
    return &AuthHandler{authService: authService}
}

func (h *AuthHandler) Register(c *gin.Context) {
    var req request.RegisterRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        response.Error(c, http.StatusBadRequest, err.Error())
        return
    }

    user, err := h.authService.Register(req)
    if err != nil {
        response.Error(c, http.StatusBadRequest, err.Error())
        return
    }

    response.JSON(c, http.StatusCreated, "register success", gin.H{"user": user})
}

func (h *AuthHandler) Login(c *gin.Context) {
    var req request.LoginRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        response.Error(c, http.StatusBadRequest, err.Error())
        return
    }

    user, token, err := h.authService.Login(req)
    if err != nil {
        response.Error(c, http.StatusUnauthorized, err.Error())
        return
    }

    response.JSON(c, http.StatusOK, "login success", gin.H{
        "user":  user,
        "token": token,
    })
}

func (h *AuthHandler) Me(c *gin.Context) {
    userID := c.GetUint("user_id")

    user, err := h.authService.GetUserByID(userID)
    if err != nil {
        response.Error(c, http.StatusNotFound, "user not found")
        return
    }

    response.JSON(c, http.StatusOK, "success", gin.H{"user": user})
}
