# Laravel 到 Go 迁移案例说明

这里建议记录真实迁移案例，帮助后续输出更贴近实战。

建议至少包含：

- 原 Laravel 模块结构
- 迁移目标技术栈（Gin / GORM / JWT / Zap / Viper）
- 字段映射规则
- 路由映射方式
- 认证与权限处理方式
- 迁移过程中的问题、取舍和重构点

## 推荐迁移顺序

1. 先生成 starter 项目或确认目标 Go 项目结构
2. 使用 Laravel User 迁移模板生成 User/Auth 骨架
3. 根据真实模型字段补 request / service / handler
4. 接入 JWT 和主路由
5. 再逐步迁移其他资源模块
