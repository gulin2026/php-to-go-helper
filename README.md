# php-to-go-helper

> 面向 Laravel / PHP 后端开发者的 AgentSkill，帮助你把现有 PHP 后端模式迁移为更贴近生产实践的 Go 实现。

`php-to-go-helper` 主要服务于已经熟悉 Laravel / PHP、希望系统学习和落地 Go 后端开发的开发者。它不仅提供讲解，还提供迁移参考、目录约定、代码模板、脚手架思路，以及逐步升级为自动化工具链的基础结构。

## 亮点

- **面向 PHP 开发者思维方式设计**，不是纯 Go 教材式输出
- **强调 Laravel -> Go 对照迁移**，更容易上手
- **默认采用 Gin + GORM + JWT** 的常见工程组合
- **兼顾教学与落地**，既能解释，也能生成结构化代码
- **已经具备 references / templates / scripts / tests 骨架**，适合持续演进

## 适合谁

这个 skill 适合以下人群：

- 已经在用 Laravel / Symfony / 原生 PHP 做后端
- 想转向 Go，但不希望从零碎教程开始
- 想把现有 Laravel 模块逐步迁移到 Go
- 希望有一套稳定的 Gin + GORM 项目结构参考
- 希望把常见场景沉淀成模板和脚本，提高复用效率

## 能解决什么问题

- 把 Laravel 的模型、控制器、请求验证、路由翻译成 Go 写法
- 生成 Gin + GORM + JWT 的登录注册示例
- 生成标准 RESTful CRUD 模块骨架
- 清晰解释 PHP 与 Go 的架构差异与取舍
- 提醒 PHP 开发者转 Go 时常见的坑
- 提供可复用的 starter 模板、代码片段和参考文档

## 默认技术栈

- Gin
- GORM v2
- JWT
- Zap
- Viper
- Validator
- Docker（可选）

## 快速了解

当前仓库已经不是只有一个 `SKILL.md` 的说明型 skill，而是一个带有完整扩展骨架的版本，包含：

- **参考资料**：统一迁移思路和项目约定
- **模板目录**：沉淀高频代码结构
- **脚本目录**：为后续自动化生成留好入口
- **示例目录**：帮助稳定风格和输出方式
- **测试目录**：用于回归核对输入和预期输出

## 仓库结构

```text
php-to-go-helper/
├── SKILL.md
├── README.md
├── LICENSE
├── .gitignore
├── references/
├── templates/
│   ├── gin-gorm-jwt-starter/
│   ├── gin-gorm-crud-resource/
│   ├── laravel-user-to-go/
│   └── snippets/
├── scripts/
├── examples/
└── tests/
```

## 目录导航

### `SKILL.md`
skill 的核心契约文件，定义：
- 何时使用这个 skill
- 响应结构
- 执行策略
- 推荐技术栈和规则

### `references/`
稳定知识库，用来让输出结果更一致。

包含：
- Laravel 到 Go 的映射说明
- Gin + GORM 项目约定
- JWT 认证模式
- PHP 开发者常见 Go 坑点
- CRUD 检查清单
- 响应风格规范

### `templates/`
常见场景的可复用模板目录。

#### `templates/gin-gorm-jwt-starter/`
完整登录注册起步模板，覆盖：
- register
- login
- JWT 鉴权
- 当前用户接口
- config / router / middleware / service 分层

#### `templates/gin-gorm-crud-resource/`
通用 CRUD 资源模板，适合这些资源：
- User
- Product
- Article
- Advertisement

#### `templates/laravel-user-to-go/`
面向迁移场景的模板，重点把 Laravel User/Auth 结构翻译成 Gin + GORM 风格代码。

#### `templates/snippets/`
可复用代码片段，例如：
- 分页
- 密码处理
- 错误包装
- validator 初始化
- 基础响应封装

### `scripts/`
让这个 skill 更具操作性的辅助脚本目录。

当前脚本主要是脚手架占位，用于：
- 初始化 starter 项目
- 生成 CRUD 模块
- 翻译 Laravel User
- 格式化项目
- 验证项目

### `examples/`
人类可读的案例说明，用来稳定输出风格、结构和迁移方式。

### `tests/`
用于回归核对的输入样例和预期输出。

## 中文使用示例

你可以用下面这些自然语言请求来触发这个 skill 的典型能力：

- “帮我把 Laravel User CRUD 翻译成 Go”
- “写一个完整的 Gin + GORM 登录注册示例”
- “把这个 Laravel API 模块改成 Gin + GORM”
- “PHP 开发者在 Go 里应该怎么组织 service？”
- “生成一个带 JWT 保护的 Go CRUD 模块”
- “参考 Laravel 的 FormRequest，改写成 Go 的 request DTO 和校验结构”
- “把 Laravel 的用户认证流程翻译成 Gin + GORM + JWT 版本”

## 设计目标

这个 skill 不只是用来解释概念，它希望同时具备这些能力：

- 教学
- 迁移方案设计
- 代码生成
- 脚手架搭建
- 可重复的项目结构输出

## 当前状态

这个仓库目前已经具备完整的 skill 骨架结构，包括：

- references
- templates
- scripts
- examples
- tests

其中部分模板和脚本目前还是轻量占位版本，这样做是为了先把目录结构和职责边界稳定下来，再逐步补齐自动化能力。

## 推荐下一步

如果你想让这个仓库马上更强，优先建议继续做这几件事：

1. 把 `templates/gin-gorm-jwt-starter/` 填成真正可运行的 starter
2. 把 `scripts/generate_crud.sh` 实现成真实可用的生成器
3. 补充更完整的 Laravel -> Go 映射参考文档
4. 增加一个由模板生成出来的顶层示例项目
5. 增加 `go fmt`、`go test`、`go vet` 的验证脚本

## 发布建议

如果你想把这个仓库直接作为 GitHub 仓库长期维护，推荐保持仓库根目录直接包含这些内容：

- `SKILL.md`
- `README.md`
- `LICENSE`
- `.gitignore`
- `references/`
- `templates/`
- `scripts/`
- `examples/`
- `tests/`

## License

当前仓库已经使用 `MIT License`。如果后续你希望改成别的开源协议，可以再调整。
