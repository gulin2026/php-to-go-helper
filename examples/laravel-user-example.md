# Laravel User 迁移示例

这个示例用于说明如何把 Laravel 中的 `User` 模型和认证流程迁移成更符合 Go 习惯的结构。

## 推荐迁移拆分

- `User` 模型 -> `model.User`
- 注册 / 登录请求 -> `request.UserRegisterRequest` / `request.UserLoginRequest`
- 登录注册逻辑 -> `service.UserService`
- HTTP 接口 -> `handler.UserHandler`
- 鉴权 -> JWT middleware
- 路由组织 -> `router.RegisterUserRoutes`

## 迁移时需要特别注意

- `fillable` 只代表可写字段，不应直接照搬成业务逻辑边界
- `hidden` 应在 Go 中通过 `json:"-"` 控制输出
- 密码校验不再依赖 Laravel `Hash`，而是改用 bcrypt
- 控制器不应再承担太多业务逻辑，应拆到 service 层

## 目标

这个模板组的目标不是做机械翻译，而是帮助把 Laravel User/Auth 模块迁移成更清晰、可维护的 Gin + GORM 结构。
