package middleware

import (
    "net/http"
    "strings"

    "github.com/gulin2026/php-to-go-helper-demo/internal/config"

    "github.com/gin-gonic/gin"
    "github.com/golang-jwt/jwt/v5"
)

func JWTAuth(cfg *config.Config) gin.HandlerFunc {
    return func(c *gin.Context) {
        authHeader := c.GetHeader("Authorization")
        if authHeader == "" {
            c.JSON(http.StatusUnauthorized, gin.H{"message": "missing authorization header"})
            c.Abort()
            return
        }

        parts := strings.SplitN(authHeader, " ", 2)
        if len(parts) != 2 || parts[0] != "Bearer" {
            c.JSON(http.StatusUnauthorized, gin.H{"message": "invalid authorization format"})
            c.Abort()
            return
        }

        tokenStr := parts[1]
        token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (any, error) {
            return []byte(cfg.JWTSecret), nil
        })
        if err != nil || !token.Valid {
            c.JSON(http.StatusUnauthorized, gin.H{"message": "invalid token"})
            c.Abort()
            return
        }

        claims, ok := token.Claims.(jwt.MapClaims)
        if !ok {
            c.JSON(http.StatusUnauthorized, gin.H{"message": "invalid token claims"})
            c.Abort()
            return
        }

        c.Set("user_id", uint(claims["sub"].(float64)))
        c.Set("user_email", claims["email"].(string))
        c.Next()
    }
}
