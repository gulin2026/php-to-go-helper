# JWT Auth Patterns

## Default Access Token Pattern
- Authorization header: Bearer <token>
- Claims: sub, email, exp, iat
- Signing method: HS256

## Recommendations
- Start with access token only for demos.
- Add refresh token flow for production systems.
- Keep token parsing and claim extraction inside middleware.
- Store user id in Gin context after successful parse.
