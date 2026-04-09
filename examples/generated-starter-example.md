# Gin + GORM + JWT Starter 示例说明

`templates/gin-gorm-jwt-starter/` 现在已经是一套可运行的认证起步模板，同时 `scripts/init_gin_gorm_jwt.sh` 也可以把它真正渲染到目标目录。

## 脚本用法

```bash
./scripts/init_gin_gorm_jwt.sh [--force] <target-dir> <module-name> [app-name] [db-name]
```

例如：

```bash
./scripts/init_gin_gorm_jwt.sh /tmp/demo-app github.com/acme/demo demo-app demo_app
```

如果目标文件已存在，默认会阻止覆盖。需要明确覆盖时：

```bash
./scripts/init_gin_gorm_jwt.sh --force /tmp/demo-app github.com/acme/demo demo-app demo_app
```

## 生成后的建议步骤

```bash
cd /tmp/demo-app
cp .env.example .env
go mod tidy
go run ./cmd/api
```

## 适用场景

- 生成一个最小可运行的 Go 用户认证项目
- 作为 Laravel 用户认证迁移的起点
- 用来继续扩展用户 CRUD、角色权限、刷新 token
