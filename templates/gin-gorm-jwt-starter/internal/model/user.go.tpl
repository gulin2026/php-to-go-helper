package model

// User is the base auth user model for {{APP_NAME}}.
type User struct {
    ID uint
    Name string
    Email string
    Password string
}
