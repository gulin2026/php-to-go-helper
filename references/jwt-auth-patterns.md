# JWT 认证模式

## 默认 Access Token 方案
- Authorization 头格式：Bearer <token>
- 常见 claims：sub、email、exp、iat
- 签名算法：HS256

## 建议
- 示例项目可以先只做 access token。
- 生产环境建议补 refresh token 流程。
- token 解析和 claim 提取应封装在 middleware 中。
- 中间件解析成功后，应把 user id 等必要信息写入 Gin context。
