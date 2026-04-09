# Response Style Guide

## Success
```json
{
  "message": "success",
  "data": {}
}
```

## Error
```json
{
  "message": "validation failed",
  "errors": {
    "field": ["reason"]
  }
}
```

## Notes
- Use a stable top-level envelope.
- Prefer machine-friendly field names.
- Keep human-readable message concise.
