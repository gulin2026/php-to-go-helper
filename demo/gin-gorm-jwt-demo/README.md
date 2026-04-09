# gin-gorm-jwt-demo

这是一个由 `php-to-go-helper` 自动生成并继续扩展的示例项目，用来展示 **starter + CRUD generator** 的联动效果。

## 当前包含

### 认证起步能力
- 用户注册
- 用户登录
- JWT 鉴权中间件
- 当前用户接口
- GORM User 模型
- 配置加载
- 统一响应结构

### 资源模块扩展示例
当前 demo 还额外包含一个已经接入主路由的 `Product` 资源模块示例，包含：

- `internal/model/product.go`
- `internal/handler/product_handler.go`
- `internal/service/product_service.go`
- `internal/request/product_request.go`
- `internal/response/product_response.go`
- `internal/router/product_routes.go`

## 运行步骤

```bash
cp .env.example .env
go mod tidy
go run ./cmd/api
```

## 当前可访问接口

### 认证接口
- `POST /api/auth/register`
- `POST /api/auth/login`
- `GET /api/user/me`

### Product 示例接口
- `GET /api/products`

## 关于 Product 模块

`Product` 模块用于展示：

- starter 生成后如何继续扩展标准资源模块
- CRUD generator 生成的骨架如何接入真实项目
- 后续如何逐步把骨架补成真正业务模块

目前它仍然是 demo 级实现：

- 先提供最小字段
- 先返回内存中的演示数据
- 用来展示结构和路由接入方式

## 说明

这个 demo 的重点是展示项目结构、认证起步方案，以及 starter + CRUD generator 的联动方式。
后续还可以继续扩：

- refresh token
- 用户 CRUD
- Product 的 create / update / delete
- 数据库持久化
- 角色与权限
- 更完整的错误处理
- Swagger / OpenAPI
