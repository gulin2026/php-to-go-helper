package response

import "github.com/gulin2026/php-to-go-helper-demo/internal/model"

// ProductListResponse is the demo response for product listing.
type ProductListResponse struct {
    Items []model.Product `json:"items"`
}
