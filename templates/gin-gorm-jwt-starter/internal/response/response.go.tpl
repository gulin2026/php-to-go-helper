package response

// Envelope is the default API response envelope.
type Envelope struct {
    Message string `json:"message"`
    Data any `json:"data,omitempty"`
}
