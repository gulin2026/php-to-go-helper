package service

import "github.com/gulin2026/php-to-go-helper-demo/internal/model"

// ProductService owns demo product business logic.
type ProductService struct{}

func NewProductService() *ProductService {
    return &ProductService{}
}

func (s *ProductService) List() []model.Product {
    return []model.Product{
        {ID: 1, Name: "Demo Product A", Price: 1999},
        {ID: 2, Name: "Demo Product B", Price: 2999},
    }
}
