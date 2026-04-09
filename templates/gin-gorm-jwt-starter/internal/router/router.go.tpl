package router

import (
    "{{MODULE_NAME}}/internal/config"
    "{{MODULE_NAME}}/internal/handler"
    "{{MODULE_NAME}}/internal/middleware"

    "github.com/gin-gonic/gin"
)

func SetupRouter(cfg *config.Config, authHandler *handler.AuthHandler) *gin.Engine {
    r := gin.Default()

    api := r.Group("/api")
    {
        auth := api.Group("/auth")
        {
            auth.POST("/register", authHandler.Register)
            auth.POST("/login", authHandler.Login)
        }

        user := api.Group("/user")
        user.Use(middleware.JWTAuth(cfg))
        {
            user.GET("/me", authHandler.Me)
        }
    }

    return r
}
