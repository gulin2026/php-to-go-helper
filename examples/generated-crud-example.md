# CRUD 生成示例说明

`scripts/generate_crud.sh` 现在可以基于 `templates/gin-gorm-crud-resource/` 生成一套资源模块骨架。

## 脚本用法

```bash
./scripts/generate_crud.sh [--force] <target-internal-dir> <ResourceName> [resource_table] [resource_name_plural] [resource_var]
```

例如：

```bash
./scripts/generate_crud.sh /tmp/demo-app/internal Product products Products product
```

如果目标文件已存在，默认会阻止覆盖。需要明确覆盖时：

```bash
./scripts/generate_crud.sh --force /tmp/demo-app/internal Product products Products product
```

## 默认会生成

- `model/<resource>.go`
- `handler/<resource>_handler.go`
- `service/<resource>_service.go`
- `request/<resource>_request.go`
- `response/<resource>_response.go`
- `router/<resource>_routes.go`

## 生成后的建议步骤

- 完善模型字段
- 补请求校验
- 填充 service 业务逻辑
- 把路由挂进主 router
- 按需要补鉴权和分页
