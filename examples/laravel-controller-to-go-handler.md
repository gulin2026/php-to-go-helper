# Laravel Controller 到 Go Handler 的转换说明

这个示例用于说明 Laravel 控制器方法如何拆分为更符合 Go 习惯的结构。

推荐拆分方式：

- Controller 方法中的参数读取 -> request DTO
- Controller 方法中的业务逻辑 -> service
- Controller 方法中的响应输出 -> handler + response helper
- 中间件相关逻辑 -> Gin middleware

目标不是机械翻译，而是把职责边界拆得更清楚。
