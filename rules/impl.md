# Implementation Patterns – Coding Agent Ruleset

## Core Values
- **Communication**: Code is for humans first, computers second.
- **Simplicity**: Remove what’s unnecessary.
- **Flexibility**: Design for actual needs, not speculative ones.

---

## Principles
- **Local Consequences**: Keep changes isolated.
- **Minimize Repetition**: Reduce duplication in logic and data.
- **Logic and Data Together**: Keep logic close to the data it uses.
- **Symmetry**: Make structures and naming consistent.
- **Declarative Expression**: Use declarative styles when possible.
- **Rate of Change**: Group code by how frequently it changes.

---

## Class Design
- Use short, metaphor-rich names for core classes.
- Subclass names should clarify similarities and differences.
- Add abstract interfaces only when justified by need.
- Interfaces should express clear roles and intent.
- Prefer abstract classes for evolutionary flexibility.
- Create versioned interfaces using extension.
- Use immutable value objects for fixed data.
- Avoid mixing mutable and immutable behavior.
- Subclass only when it clarifies intent and reduces duplication.
- Use polymorphism to express variation cleanly.
- Use inner classes for local, tightly related logic.
- Avoid per-instance behavior unless necessary.
- Use conditionals sparingly and locally.
- Replace complex conditionals with delegation where appropriate.
- Use pluggable selectors via reflection only as a last resort.
- Use anonymous inner classes for simple local variations.
- Use static utility classes when no better home exists.

---

## State and Variables
- Compute values unless storage is truly needed.
- Use direct access internally; use indirect access (methods) externally.
- Represent common state clearly using fields.
- Prefer fixed fields to variable maps unless required.
- Store extrinsic state externally using maps.
- Name variables by role, not by type or scope.
- Declare local variables close to first use.
- Declare fields consistently in one location.
- Pass state via parameters, not shared globals.
- Use collecting parameters for accumulating results.
- Simulate optional parameters with overloading.
- Use varargs to simplify parameter handling.
- Group related parameters into parameter objects.
- Use `static final` for constants; avoid magic numbers.
- Declare general types where useful—no more than needed.
- Use eager initialization unless lazy init is clearly better.
- Use lazy init for costly or rarely used data.

---

## Behavior and Control Flow
- Make main logic flow obvious.
- Use method calls to structure behavior clearly.
- Favor polymorphic message sending over conditionals.
- Use double dispatch to separate cross-cutting behaviors.
- Decompose long logic into smaller message methods.
- Ensure symmetry in related operations.
- Provide inviting extension points for future variation.
- Name helper methods for clarity and purpose.
- Separate exceptional paths using exceptions and guard clauses.
- Use guard clauses to exit early and flatten logic.
- Use exceptions for failures that can’t be handled locally.
- Use checked exceptions when coordination is critical.
- Propagate exceptions with context-sensitive wrapping.

---

## Methods
- Compose methods from calls at the same abstraction level.
- Name methods for intent, not implementation details.
- Use the narrowest visibility that works (start `private`).
- Use `final` or `static` only with intent and purpose.
- Use method objects to refactor large methods.
- Override methods only when needed; use `super` carefully.
- Use overloads only when the purpose is the same.
- Return the most abstract type needed.
- Use code structure and naming over comments.
- Use private helpers to reduce duplication and reveal structure.
- Override `toString()` for debug printing.
- Use `asOtherType()` conversion methods sparingly.
- Prefer conversion constructors for scalable conversions.

---

## Object Creation
- Provide complete constructors to build ready-to-use objects.
- Use factory methods when creation needs abstraction or logic.
- Use internal factories for conditional or lazy creation.
- Funnel multiple constructors into one core constructor.
- Name factory methods to clarify their purpose and usage.

---

## Collections
- Declare using the most general interface that makes sense.
- Choose implementations based on actual access and performance needs.
- Use `ArrayList` and `HashSet` by default.
- Use collection wrappers to prevent mutation if needed.
- Return iterators or filtered views, not raw collections.
- Avoid subclassing collection types—prefer delegation.
- Use factory methods like `singletonList()` or `emptyList()` for clarity.

---

## Framework Design
- Avoid breaking client code—prefer backward compatibility.
- Stage breaking changes with deprecation first.
- Encapsulate behavior behind stable method interfaces.
- Hide internals; expose only intended APIs.
- Use abstract classes with protected hooks for extension.
- Support multiple use styles: instantiation, configuration, implementation.
- Prefer static factories over constructors for flexibility.
- Group creation logic into factory objects if needed.
- Favor intention-revealing methods over raw setters/getters.
- Use enums or single-parameter setters to future-proof API changes.
- Avoid deep interface trees that burden clients.
- Base frameworks on real, recurring examples—not theoretical needs.

