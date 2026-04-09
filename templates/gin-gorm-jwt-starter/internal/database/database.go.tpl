package database

import (
    "fmt"
    "log"

    "{{MODULE_NAME}}/internal/config"
    "{{MODULE_NAME}}/internal/model"

    "gorm.io/driver/mysql"
    "gorm.io/gorm"
)

func NewDB(cfg *config.Config) *gorm.DB {
    dsn := fmt.Sprintf(
        "%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
        cfg.DBUser,
        cfg.DBPassword,
        cfg.DBHost,
        cfg.DBPort,
        cfg.DBName,
    )

    db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
    if err != nil {
        log.Fatalf("failed to connect database: %v", err)
    }

    if err := db.AutoMigrate(&model.User{}); err != nil {
        log.Fatalf("failed to migrate database: %v", err)
    }

    return db
}
