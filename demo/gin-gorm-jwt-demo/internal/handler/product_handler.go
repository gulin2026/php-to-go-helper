package handler

import (
    "net/http"

    "github.com/gulin2026/php-to-go-helper-demo/internal/response"
    "github.com/gulin2026/php-to-go-helper-demo/internal/service"

    "github.com/gin-gonic/gin"
)

// ProductHandler provides demo REST handlers.
type ProductHandler struct {
    productService *service.ProductService
}

func NewProductHandler(productService *service.ProductService) *ProductHandler {
    return &ProductHandler{productService: productService}
}

func (h *ProductHandler) Index(c *gin.Context) {
    items := h.productService.List()
    response.JSON(c, http.StatusOK, "success", response.ProductListResponse{Items: items})
}
