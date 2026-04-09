# 中文使用示例

下面是一些适合触发 `php-to-go-helper` 的中文请求示例，风格尽量保持明确、可执行、便于稳定输出。

## Laravel 模型迁移

- 帮我把 Laravel 的 User 模型翻译成 Gin + GORM 版本
- 把这个 Eloquent 模型改写成 Go struct，并补上 GORM 标签
- 参考 Laravel 的 `fillable` 和 `casts`，生成对应的 Go 模型

## 登录注册

- 写一个 Gin + GORM + JWT 的用户登录注册完整示例
- 把 Laravel 的登录注册流程改成 Go 版本，要求包含 JWT 认证
- 生成一个 Go 用户认证模块，包含 register、login、me 接口

## CRUD 模块生成

- 帮我把 Laravel 的 Article CRUD 翻译成 Gin + GORM 版本
- 生成一个带请求验证的 Go RESTful CRUD 模块
- 参考 Laravel Controller + FormRequest，生成 handler + service + DTO

## 架构讲解

- Laravel 的 Controller、Request、Model 在 Go 里应该怎么拆分？
- PHP 开发者转 Go 时，service 层应该怎么设计？
- Laravel 的中间件和 Go 的 Gin middleware 在职责上有什么区别？

## 迁移建议

- 这个 Laravel API 模块如果迁移到 Go，推荐怎样分阶段做？
- 帮我对比一下 Laravel Auth 和 Gin + JWT 的实现思路
- 给我一份 Laravel -> Go 的项目结构迁移建议

## 推荐提问方式

如果你希望这个 skill 输出更稳定，建议在提问时补充这些信息：

- 现有框架：Laravel / Symfony / 原生 PHP
- 目标技术栈：Gin / GORM / JWT / Zap / Viper
- 目标结果：讲解、示例、模板、真实代码、项目骨架
- 是否需要完整可运行代码
- 是否需要按现有 Laravel 字段结构一比一迁移

## 一个更完整的提问示例

> 请使用 Gin + GORM + JWT，把 Laravel 的 User 模型和登录注册流程翻译成 Go，要求包含项目结构、完整代码、运行命令，以及 PHP 与 Go 的对照说明。
