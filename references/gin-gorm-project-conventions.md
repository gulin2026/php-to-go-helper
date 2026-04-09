# Gin + GORM Project Conventions

## Structure
- cmd/api: entrypoint
- internal/config: configuration loading
- internal/database: database bootstrap
- internal/model: GORM models
- internal/request: request DTOs
- internal/response: response helpers / DTOs
- internal/service: business logic
- internal/handler: HTTP handlers
- internal/middleware: auth / logging / recovery middleware
- internal/router: route registration

## Style
- Handlers should stay thin.
- Services own business logic.
- Models should not contain transport concerns.
- Prefer explicit errors and wrapped error messages.
- Keep naming singular for model files and plural for grouped routes.
