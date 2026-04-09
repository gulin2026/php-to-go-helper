# PHP 开发者常见 Go 坑点

- 忽略函数返回的 error
- 误以为 nil 在所有场景都等同于 PHP 的 null
- 不小心把密码哈希返回到 JSON 里
- 把传输层 DTO 和持久化模型混在一起
- 让 handler 承担过多业务逻辑
- 忘记在下游调用中传递 context
- 使用 goroutine 时没有考虑取消、回收和背压
- 对 JWT claims 做类型断言时出错
