package router

import (
    "github.com/gulin2026/php-to-go-helper-demo/internal/config"
    "github.com/gulin2026/php-to-go-helper-demo/internal/handler"
    "github.com/gulin2026/php-to-go-helper-demo/internal/middleware"
    "github.com/gulin2026/php-to-go-helper-demo/internal/service"

    "github.com/gin-gonic/gin"
)

func SetupRouter(cfg *config.Config, authHandler *handler.AuthHandler) *gin.Engine {
    r := gin.Default()
    productHandler := handler.NewProductHandler(service.NewProductService())

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

        RegisterProducts(api, productHandler)
    }

    return r
}
