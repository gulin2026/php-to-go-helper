package request

// RegisterRequest is the DTO for register input.
type RegisterRequest struct {
    Name string `json:"name"`
    Email string `json:"email"`
    Password string `json:"password"`
}
