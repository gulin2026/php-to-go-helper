package config

import (
    "log"
    "strings"

    "github.com/joho/godotenv"
    "github.com/spf13/viper"
)

type Config struct {
    AppName      string
    AppEnv       string
    AppPort      string
    DBHost       string
    DBPort       string
    DBName       string
    DBUser       string
    DBPassword   string
    JWTSecret    string
    JWTExpiresIn int
}

func Load() *Config {
    _ = godotenv.Load()

    viper.AutomaticEnv()
    viper.SetEnvKeyReplacer(strings.NewReplacer(".", "_"))

    cfg := &Config{
        AppName:      viper.GetString("APP_NAME"),
        AppEnv:       viper.GetString("APP_ENV"),
        AppPort:      viper.GetString("APP_PORT"),
        DBHost:       viper.GetString("DB_HOST"),
        DBPort:       viper.GetString("DB_PORT"),
        DBName:       viper.GetString("DB_NAME"),
        DBUser:       viper.GetString("DB_USER"),
        DBPassword:   viper.GetString("DB_PASSWORD"),
        JWTSecret:    viper.GetString("JWT_SECRET"),
        JWTExpiresIn: viper.GetInt("JWT_EXPIRES_IN"),
    }

    if cfg.AppName == "" {
        cfg.AppName = "{{APP_NAME}}"
    }
    if cfg.AppEnv == "" {
        cfg.AppEnv = "local"
    }
    if cfg.AppPort == "" {
        cfg.AppPort = "8080"
    }
    if cfg.JWTExpiresIn == 0 {
        cfg.JWTExpiresIn = 24
    }
    if cfg.JWTSecret == "" {
        log.Fatal("JWT_SECRET is required")
    }

    return cfg
}
