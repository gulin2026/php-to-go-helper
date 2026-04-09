package handler

import "github.com/gin-gonic/gin"

type AuthHandler struct{}

func NewAuthHandler() *AuthHandler { return &AuthHandler{} }
func (h *AuthHandler) Register(c *gin.Context) {}
func (h *AuthHandler) Login(c *gin.Context) {}
func (h *AuthHandler) Me(c *gin.Context) {}
