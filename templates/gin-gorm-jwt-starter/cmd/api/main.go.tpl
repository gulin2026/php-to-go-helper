package main

import (
    "fmt"

    "{{MODULE_NAME}}/internal/config"
    "{{MODULE_NAME}}/internal/database"
    "{{MODULE_NAME}}/internal/handler"
    "{{MODULE_NAME}}/internal/router"
    "{{MODULE_NAME}}/internal/service"

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
