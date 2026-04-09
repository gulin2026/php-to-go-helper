# Laravel User 迁移脚本示例

`scripts/translate_laravel_user.sh` 现在可以把 `templates/laravel-user-to-go/` 渲染到目标项目中，帮助快速搭建 User/Auth 迁移骨架。

## 脚本用法

```bash
./scripts/translate_laravel_user.sh [--force] <target-dir> <module-name> [source-model-name] [resource-name]
```

例如：

```bash
./scripts/translate_laravel_user.sh /tmp/demo-app github.com/acme/demo App\\Models\\User User
```

如果目标文件已存在，默认会阻止覆盖。需要明确覆盖时：

```bash
./scripts/translate_laravel_user.sh --force /tmp/demo-app github.com/acme/demo App\\Models\\User User
```

## 默认生成内容

- `internal/handler/user_handler.go`
- `internal/service/user_service.go`
- `internal/request/user_request.go`
- `internal/router/user_routes.go`
- `docs/migration/user_model_mapping.md`

## 生成后的建议步骤

- 根据真实 Laravel User 字段调整 request 和 model 映射
- 把 user 路由挂进主 router
- 将 service 对接真实数据库和 JWT 方案
- 按项目需要补角色、权限、刷新 token
