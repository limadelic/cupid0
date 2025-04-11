# Pro Week Rules

## Core Values
- **Test First**: No implementation without a failing test
- **YOLO Flow**: Test && Commit && Push || Revert
- **Simplicity**: Remove what's unnecessary
- **Communication**: Code is for humans first, computers second

## Workflow Rules
1. Start with feature/acceptance test (Gherkin)
2. Run test, see it fail
3. Write implementation
4. Run `tcr verb:description` to validate
   - Tests pass → Auto-commit and push
   - Tests fail → Auto-revert

## Commit Message Format
- Must be `verb:description`
- Verb must be lowercase
- Examples:
  - `add:user authentication`
  - `test:password validation`
  - `fix:login error`

## Code Style
- Short, metaphor-rich names for core classes
- Keep logic close to the data it uses
- Minimize repetition in logic and data
- Group code by rate of change
- Use declarative expressions when possible
- Avoid mixing mutable and immutable behavior

## Testing Guidelines
- Feature tests drive development
- Tests should be readable and intention-revealing
- One behavior per test
- No implementation without failing test
- No unit tests before feature tests
