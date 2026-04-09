package main

import (
    "fmt"

    "github.com/gulin2026/php-to-go-helper-demo/internal/config"
    "github.com/gulin2026/php-to-go-helper-demo/internal/database"
    "github.com/gulin2026/php-to-go-helper-demo/internal/handler"
    "github.com/gulin2026/php-to-go-helper-demo/internal/router"
    "github.com/gulin2026/php-to-go-helper-demo/internal/service"

    "go.uber.org/zap"
)

func main() {
    cfg := config.Load()

    logger, _ := zap.NewProduction()
    defer logger.Sync()

    db := database.NewDB(cfg)
    authService := service.NewAuthService(db, cfg)
    authHandler := handler.NewAuthHandler(authService)
    r := router.SetupRouter(cfg, authHandler)

    addr := fmt.Sprintf(":%s", cfg.AppPort)
    logger.Info("server starting", zap.String("addr", addr), zap.String("env", cfg.AppEnv))

    if err := r.Run(addr); err != nil {
        logger.Fatal("server failed to start", zap.Error(err))
    }
}
