package router

import (
    "github.com/gulin2026/php-to-go-helper-demo/internal/handler"

    "github.com/gin-gonic/gin"
)

// RegisterProducts mounts demo product routes.
func RegisterProducts(api *gin.RouterGroup, productHandler *handler.ProductHandler) {
    products := api.Group("/products")
    {
        products.GET("", productHandler.Index)
    }
}
