# Laravel 到 Go 的映射说明

## 核心映射
- Eloquent Model -> GORM model struct
- FormRequest -> 带绑定和校验标签的 request DTO
- Controller -> handler + service
- Middleware -> Gin middleware
- Auth guard -> JWT middleware
- Resource collection -> response DTO / JSON 响应包装

## 实践建议
- 优先使用显式依赖注入，而不是静态门面式调用。
- 请求校验应尽量靠近 DTO 定义。
- 业务逻辑应放在 service 层，而不是 handler 层。
- 成功和错误响应建议保持统一的 JSON 包装结构。
