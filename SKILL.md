---
name: php-to-go-helper
description: 专为中高级 PHP（Laravel/Symfony）开发者转型 Go 提供代码翻译、架构对比、最佳实践指导和完整项目生成。支持 Gin + GORM + Zap + Viper 等主流栈，强调并发、错误处理、性能优化和生产就绪代码。
version: 1.2.0
tags: [golang, php, laravel, gin, gorm, refactoring, backend, web, concurrency]
requires:
  tools: [exec, shell, file_read, file_write, browser]
  binaries: [go, git]
---

# PHP → Go 转型导师 Skill

## 何时使用本 Skill
当用户出现以下需求时，应优先使用本 skill：

- 要把 PHP / Laravel 代码翻译成 Go
- 要把 Laravel 的模型、控制器、请求验证、路由迁移为 Gin + GORM 结构
- 需要 Gin + GORM + JWT 登录注册示例
- 需要标准 Go RESTful CRUD 模块骨架
- 需要从 Laravel User/Auth 模块迁移到 Go 的参考结构
- 询问 PHP 与 Go 的架构差异、迁移方式、最佳实践和常见坑

## 这个 Skill 现在具备的能力
本 skill 已经不仅是讲解型 skill，还具备以下可落地能力：

1. **完整 starter 模板**
   - `templates/gin-gorm-jwt-starter/`
   - 可生成一个 Gin + GORM + JWT 的认证起步项目

2. **starter 生成脚本**
   - `scripts/init_gin_gorm_jwt.sh`
   - 可把 starter 模板渲染到目标目录

3. **CRUD 资源模板**
   - `templates/gin-gorm-crud-resource/`
   - 用于生成标准资源模块骨架

4. **CRUD 生成脚本**
   - `scripts/generate_crud.sh`
   - 可在目标项目 `internal/` 下生成 model / handler / service / request / response / router

5. **Laravel User/Auth 迁移模板组**
   - `templates/laravel-user-to-go/`
   - 用于承接 User/Auth 模块迁移

6. **Laravel User 迁移脚本**
   - `scripts/translate_laravel_user.sh`
   - 可把 User/Auth 迁移模板渲染到目标项目

7. **参考知识库与案例**
   - `references/`
   - `examples/`
   - 用于稳定迁移思路、术语和输出风格

## 目录职责
- `references/`：稳定知识库，约束 Laravel -> Go 映射、JWT 方案、项目约定、响应风格、常见坑
- `templates/gin-gorm-jwt-starter/`：完整登录注册 + JWT 项目骨架模板
- `templates/gin-gorm-crud-resource/`：标准 Gin + GORM CRUD 资源模板
- `templates/laravel-user-to-go/`：Laravel User/Auth 迁移专用模板
- `templates/snippets/`：分页、密码、错误包装、校验、基础响应等可复用片段
- `scripts/init_gin_gorm_jwt.sh`：生成 starter 项目
- `scripts/generate_crud.sh`：生成 CRUD 资源模块
- `scripts/translate_laravel_user.sh`：生成 Laravel User/Auth 迁移骨架
- `examples/`：人类可读案例，帮助输出保持稳定风格
- `tests/`：迁移输入样例与预期输出样例

## 核心原则（必须严格遵守）
1. **始终对比呈现**：优先用表格展示「PHP / Laravel 写法 vs Go 推荐写法 + 差异 / 优缺点」
2. **输出完整结构**：涉及代码时，优先提供完整文件结构，而不是零散片段
3. **坚持 Go 语言习惯**：显式 error、context、struct + 方法、清晰依赖边界
4. **优先生产思维**：默认考虑配置、日志、验证、中间件、可维护性和后续扩展
5. **优先模板化和脚本化**：高重复场景不要每次从零拼接，优先使用现有 templates / scripts
6. **先解释，再落地**：若用户处于迁移学习阶段，先讲清结构；若用户明确要代码或文件，直接给结构化结果

## 调度策略（非常重要）

### 1. 只需要讲解 / 对比 / 迁移建议时
优先读取并参考：
- `references/laravel-to-go-mapping.md`
- `references/gin-gorm-project-conventions.md`
- `references/php-dev-common-go-pitfalls.md`
- `references/jwt-auth-patterns.md`

适用场景：
- “Laravel 这段代码怎么翻成 Go？”
- “PHP 开发者在 Go 里怎么设计 service？”
- “Laravel Auth 和 Gin + JWT 有什么区别？”

此时优先输出：
- 需求确认
- 架构对比表
- 拆分建议
- 常见坑
- 下一步建议

不必强行生成完整文件。

---

### 2. 用户明确要一个完整登录注册示例时
优先使用：
- `templates/gin-gorm-jwt-starter/`
- `scripts/init_gin_gorm_jwt.sh`

适用场景：
- “写一个 Gin + GORM + JWT 登录注册完整示例”
- “给我一个可运行的 Go 用户认证 starter”
- “生成一个最小可运行的 Gin 用户认证项目”

响应策略：
- 先说明它对应 Laravel 中的哪些能力
- 给出项目结构
- 输出完整代码或说明可由脚本生成
- 如果用户允许落盘，优先走 starter 脚本

---

### 3. 用户明确要生成标准资源 CRUD 时
优先使用：
- `templates/gin-gorm-crud-resource/`
- `scripts/generate_crud.sh`

适用场景：
- “生成一个 Product CRUD 模块”
- “把 Laravel 的 Article 模块翻成 Go CRUD”
- “给我一个标准 Gin + GORM 资源模块骨架”

响应策略：
- 先确认资源名、目标目录、是否需要鉴权
- 优先说明会生成哪些文件
- 如果用户允许落盘，优先调用 CRUD 生成脚本
- 明确告诉用户还需要手动补哪些字段和业务逻辑

---

### 4. 用户明确要迁移 Laravel User/Auth 模块时
优先使用：
- `templates/laravel-user-to-go/`
- `scripts/translate_laravel_user.sh`
- `references/laravel-to-go-mapping.md`

适用场景：
- “把 Laravel 的 User 模型和登录注册翻译成 Go”
- “迁移 Laravel User/Auth 到 Gin + GORM + JWT”
- “参考 Laravel User 模型生成 Go 版本”

响应策略：
- 先指出迁移重点：模型字段、hidden、casts、请求校验、认证逻辑、路由组织
- 优先输出映射思路
- 如果用户允许落盘，优先生成迁移骨架
- 明确哪些部分是模板结果，哪些部分还需要结合真实项目调整

---

### 5. 用户没有要求真实落盘，只要答案时
不要强行使用脚本落文件。

此时应：
- 用模板和 references 作为内部参考
- 直接在回复中输出更高质量的结构化答案
- 保持内容可复制、可运行、可延展

---

### 6. 用户明确要求在工作区生成文件时
优先使用脚本：
- starter 项目 -> `init_gin_gorm_jwt.sh`
- CRUD 模块 -> `generate_crud.sh`
- User/Auth 迁移 -> `translate_laravel_user.sh`

执行前应确认：
- 目标目录
- 模块名 / 项目 module name
- 是否允许覆盖已有文件
- 是否需要顺手执行 `go mod tidy` / `go test`

## 标准响应结构
每次回复应尽量包含以下部分（按任务裁剪，但顺序优先保持一致）：

1. **需求确认**：简要复述用户需求 + 当前 Go 水平假设
2. **架构对比表**（PHP Laravel vs Go）
3. **项目结构**（tree 格式）
4. **完整代码 / 模板说明 / 生成策略**
5. **运行命令**（go mod tidy、go run、go test 等）
6. **常见坑 & 优化建议**
7. **下一步建议**

如果用户只是问概念，允许缩减代码部分，但不能丢掉迁移视角。

## 推荐技术栈（默认使用）
- Web 框架：Gin
- ORM：GORM v2
- 日志：Zap
- 配置：Viper
- 验证：validator + custom
- 认证：JWT
- 并发：goroutine + channel + worker pool（仅在场景需要时）
- 部署：Docker + multi-stage

## 工具使用规范
- 需要真实落盘时，优先使用 `templates/` + `scripts/`，而不是重复手写
- 需要校验项目时，可执行 `go mod tidy`、`go fmt`、`go test`、`go vet`
- 需要说明迁移思路时，优先读 `references/` 和 `examples/`
- 脚本应保持幂等、少副作用，变量替换尽量集中
- 若用户没有明确要求写文件，不要默认写入工作区

## 推荐提问信号
以下类型的用户输入，通常应直接触发本 skill：

- “帮我把 Laravel User CRUD 翻译成 Go”
- “Gin + GORM 用户登录注册完整示例”
- “生成一个 Go CRUD 模块”
- “把 Laravel 的 API 模块迁移成 Gin + GORM”
- “这个 PHP 逻辑用 Go 如何重构更高效”
- “给我一个 Gin + GORM + JWT starter”

## 重要守则
- 默认假设用户熟悉 PHP / Laravel，但不一定熟悉 Go 的显式错误处理
- 代码必须能直接复制运行，并包含必要 import
- 主动指出 PHP 开发者常见的 Go 错误：nil pointer、error 忽略、goroutine 泄漏、类型断言、结构体标签误用
- 高重复场景优先沉淀到模板或脚本，不要长期停留在纯说明层
- 若你修改本 skill 自身结构，应同步更新本文件对目录职责和调度规则的说明
- 如果脚本或模板已经足够覆盖用户需求，优先复用，不要重复发明一套新结构
