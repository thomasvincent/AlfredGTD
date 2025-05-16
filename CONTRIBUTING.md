# Contributing to AlfredGTD

Thank you for your interest in contributing to AlfredGTD!

## Development Process

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests with `tests/run_tests.sh`
5. Commit your changes with conventional commits (see below)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Conventional Commits

This project uses conventional commits to generate the changelog. Please format your commit messages as follows:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, indentation)
- `refactor`: Code refactoring (no functional changes)
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Example:
```
feat(tasks): add support for OmniFocus

Added integration with OmniFocus for task management
using AppleScript and URL schemes.
```

## Testing

All new features and bug fixes should be covered by tests. Run the test suite with:

```bash
./tests/run_tests.sh
```

## Code Style

Please follow the existing code style:

- Use 2 space indentation
- Follow AppleScript best practices
- Comment complex logic
- Use meaningful variable and function names

## License

By contributing to AlfredGTD, you agree that your contributions will be licensed under the project's MIT License.