# CRUD 资源模板说明

## 可用变量
- `{{RESOURCE_NAME}}`
- `{{RESOURCE_NAME_PLURAL}}`
- `{{RESOURCE_VAR}}`
- `{{RESOURCE_TABLE}}`

## 用途
当你需要为 Gin + GORM 项目快速生成一个标准资源模块时，优先使用这组模板。

它默认会生成：
- model
- handler
- service
- request DTO
- response DTO
- router

## 适合场景
- 从零搭一个标准 CRUD 模块
- 把 Laravel 资源模块迁移到 Go
- 先生成骨架，再逐步补充字段和业务逻辑
