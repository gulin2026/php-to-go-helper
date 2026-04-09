# Gin + GORM 项目约定

## 目录结构
- cmd/api: 入口程序
- internal/config: 配置加载
- internal/database: 数据库初始化
- internal/model: GORM 模型
- internal/request: 请求 DTO
- internal/response: 响应 DTO / 辅助方法
- internal/service: 业务逻辑
- internal/handler: HTTP 处理器
- internal/middleware: 鉴权 / 日志 / 恢复中间件
- internal/router: 路由注册

## 风格约定
- handler 应尽量保持轻量。
- service 负责承接业务逻辑。
- model 不应混入过多传输层细节。
- 优先返回显式错误，并补充有上下文的信息。
- 模型文件建议用单数命名，路由注册可按资源分组。
