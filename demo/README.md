# Demo 项目说明

这个目录用于放置由 `php-to-go-helper` 模板和脚本真实生成出来的示例项目。

当前包含：

- `gin-gorm-jwt-demo/`：由 starter 模板生成的 Gin + GORM + JWT 认证示例项目
- demo 内额外包含一个由 CRUD 生成器生成并已接入主路由的 `Product` 资源模块示例

## 作用

这个 demo 目录有两个目的：

1. 证明模板和脚本不仅能写说明，还能真实生成项目
2. 让使用者快速看到 skill 最终会产出怎样的目录结构和代码组织

## 当前展示的能力

- starter 项目初始化
- JWT 认证起步结构
- CRUD 资源模块生成
- starter + generator 联动后的项目形态
- 资源模块接入主 router 的方式

## 推荐用法

你可以直接阅读这个 demo，也可以把它作为继续扩展 User CRUD、Product 模块、角色权限、刷新 token 的起点。
