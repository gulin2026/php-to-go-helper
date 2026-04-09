# CRUD 检查清单

- 模型字段是否已从源领域正确映射
- 是否考虑 migration / schema 设计
- 是否包含请求验证
- 是否实现 service 层
- handler 是否覆盖 list / show / create / update / delete
- 路由是否已按鉴权规则挂载
- 响应包装是否统一
- 是否定义分页策略
- 错误是否正确映射到 HTTP 状态码
- 是否附带基本验证命令
