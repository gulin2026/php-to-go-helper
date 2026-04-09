package model

import "time"

// Product is the demo CRUD resource model.
type Product struct {
    ID        uint      `json:"id"`
    Name      string    `json:"name"`
    Price     int64     `json:"price"`
    CreatedAt time.Time `json:"created_at"`
    UpdatedAt time.Time `json:"updated_at"`
}
