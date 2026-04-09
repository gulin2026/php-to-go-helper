# Gin 认证示例说明

这个示例主要描述一套典型的 Gin + GORM + JWT 认证结构，适合作为登录注册模块的起点。

通常应包含：

- 用户注册
- 用户登录
- JWT 生成
- JWT middleware
- 当前用户接口
- 统一响应结构

建议输出时保持 handler / service / middleware 分层清晰。
