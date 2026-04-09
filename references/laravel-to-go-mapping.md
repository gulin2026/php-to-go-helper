# Laravel to Go Mapping

## Core Mappings
- Eloquent Model -> GORM model struct
- FormRequest -> request DTO with binding/validation tags
- Controller -> handler + service
- Middleware -> Gin middleware
- Auth guard -> JWT middleware
- Resource collection -> response DTO / JSON envelope

## Practical Notes
- Prefer explicit dependency injection over static facades.
- Keep request validation close to DTOs.
- Use service layer for business logic, not handlers.
- Return consistent JSON envelopes for success and error cases.
