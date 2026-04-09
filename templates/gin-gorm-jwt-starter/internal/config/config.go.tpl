package config

// Config is the application configuration template for {{APP_NAME}}.
type Config struct {
    AppName string
    AppPort string
    JWTSecret string
}
