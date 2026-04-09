package router

import (
    "{{MODULE_NAME}}/internal/handler"

    "github.com/gin-gonic/gin"
)

// RegisterUserRoutes 展示 Laravel 用户认证接口迁移后的路由组织。
func RegisterUserRoutes(api *gin.RouterGroup, userHandler *handler.UserHandler, jwtMiddleware gin.HandlerFunc) {
    auth := api.Group("/auth")
    {
        auth.POST("/register", userHandler.Register)
        auth.POST("/login", userHandler.Login)
    }

    user := api.Group("/user")
    user.Use(jwtMiddleware)
    {
        user.GET("/me", userHandler.Me)
    }
}
