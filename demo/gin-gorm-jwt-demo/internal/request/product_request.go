package request

// ProductRequest is the DTO for demo product create/update input.
type ProductRequest struct {
    Name  string `json:"name" binding:"required,min=2,max=100"`
    Price int64  `json:"price" binding:"required,min=0"`
}
