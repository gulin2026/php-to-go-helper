# Laravel User 到 Go 的模型映射

源模型：`{{SOURCE_MODEL}}`
目标模型：`{{RESOURCE_NAME}}`

## 字段映射建议

- `id` -> `ID uint`
- `name` -> `Name string`
- `email` -> `Email string`
- `password` -> `Password string`
- `created_at` -> `CreatedAt time.Time`
- `updated_at` -> `UpdatedAt time.Time`

## 迁移关注点

- Laravel 的 `fillable` 对应 Go 中允许写入的字段边界
- Laravel 的 `hidden` 应映射为 Go 中的 `json:"-"`
- Laravel 的 `casts` 应映射为明确的 Go 类型
- 认证逻辑不要继续耦合在模型里，应迁移到 service 层

## 推荐做法

- 模型只负责字段与持久化标签
- 请求校验放到 request DTO
- 登录注册逻辑放到 AuthService
- JWT 解析放到 middleware
