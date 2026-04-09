# 响应风格规范

## 成功响应
```json
{
  "message": "success",
  "data": {}
}
```

## 错误响应
```json
{
  "message": "validation failed",
  "errors": {
    "field": ["reason"]
  }
}
```

## 建议
- 顶层响应结构尽量保持稳定。
- 字段名优先机器友好、前后端一致。
- message 保持简洁，不要堆过多描述。
