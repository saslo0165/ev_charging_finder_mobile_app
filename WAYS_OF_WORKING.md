# Ways of Working — EV Charging Finder

> This document is the single source of truth for how features are built on this project.
> Every implementation session **must** follow these rules, in order.

---

## 1. Golden Rule: TDD First, Always

```
🔴 RED   → Write a failing test that captures the requirement
🟢 GREEN → Write the minimal Dart/Flutter code to make it pass
🔵 BLUE  → Refactor for readability & clean architecture
🔁 REPEAT one small behaviour at a time
```

**Never write implementation code before a test exists.**  
If you cannot write a test, you do not yet understand the requirement — stop and ask.

---

## 2. Step-by-Step Cadence (mandatory)

Each cycle **must** produce the following output, in order:

### Step 1 – RED (failing test)
- Write only as much test code as needed to capture **one** behaviour.
- Name the test after the behaviour: `should_returnStationList_whenApiSucceeds`.
- Follow AAA: **Arrange → Act → Assert**.
- Confirm test **fails** before moving on.

### Step 2 – GREEN (minimal implementation)
- Write the smallest amount of production code that makes the test pass.
- No premature abstractions, no gold-plating.
- Confirm all tests pass.

### Step 3 – REFACTOR
- Eliminate duplication, improve naming, improve structure.
- All tests must remain green after every refactor step.
- One refactor change at a time.

### Step 4 – STOP & REPORT
After each cycle, output exactly:

```
📋 Step done: <one-line description>
🧪 Test: <test file path>::<test name>
✅ All tests green? YES/NO
💬 Suggested commit: git commit -m "<type>(<scope>): <message>"
❓ Proceed to next step? (waiting for confirmation)
```

> **Do NOT auto-proceed.** Wait for explicit approval before the next cycle.

---

## 3. Work Size

- One logical change per cycle (one method, one use-case, one provider state, etc.).
- Never generate a full feature in one shot.
- If a spec requires multiple behaviours, break them into a numbered list and implement one at a time.

---

## 4. Architecture Constraints (Clean Architecture)

```
Presentation  →  Domain  →  Data
   (UI)          (logic)    (API / DB)
```

### Layer rules
| Layer | Allowed | Forbidden |
|---|---|---|
| **Presentation** (`features/<f>/presentation/`) | Widgets, Riverpod providers, ViewModels | Direct Dio calls, DB access |
| **Domain** (`features/<f>/domain/`) | Entities, Use-cases, Repository interfaces | Flutter imports, Dio, Hive |
| **Data** (`features/<f>/data/`) | Repository impls, DTOs, remote/local datasources | Business logic, UI code |
| **Core** (`core/`) | Shared utilities, theme, router, network, error | Feature-specific logic |

### Dependency rules
- Use-cases depend on **interfaces** only (Liskov, DIP).
- State is managed via **Riverpod** (`flutter_riverpod ^3`).
- All async results use **`fpdart` Either<Failure, T>** — never raw exceptions propagated to UI.
- DTOs ↔ Entities via `toDomain()` / `fromJson()` — never leak DTOs into domain.

---

## 5. Naming Conventions

| Artifact | Convention | Example |
|---|---|---|
| Files | `snake_case` | `station_repository.dart` |
| Classes | `PascalCase` | `StationRepository` |
| Variables / params | `camelCase` | `stationList` |
| Test files | `<subject>_test.dart` | `station_repository_test.dart` |
| Test names | `should_<outcome>_when_<condition>` | `should_returnFailure_whenNetworkError` |
| Providers | noun + `Provider` | `stationListProvider` |
| Use-cases | verb + noun | `GetStationListUseCase` |
| Failures | noun + `Failure` | `NetworkFailure`, `ServerFailure` |

---

## 6. Testing Standards

### Test layers
| What to test | Test type | Package |
|---|---|---|
| Use-cases, repositories | Unit | `flutter_test` + `mockito` |
| Providers, state | Unit | `flutter_riverpod` `ProviderContainer` |
| Widgets | Widget | `testWidgets` |
| Full flows | Integration | `integration_test` |

### Mocking rules
- Mock **only interfaces/abstract classes**, never concrete implementations.
- Use `mockito` generated mocks (`@GenerateMocks`) or manual fakes.
- Never let real network calls happen in unit/widget tests.

### Test file location
```
test/
  features/
    <feature>/
      domain/          # use-case tests
      data/            # repository impl tests
      presentation/    # widget + provider tests
  core/               # shared utility tests
```

### Required assertions per use-case test
1. Happy path returns `Right(expectedData)`.
2. Network error returns `Left(NetworkFailure(...))`.
3. Server error (4xx/5xx) returns `Left(ServerFailure(...))`.

---

## 7. Commit Message Format

```
<type>(<scope>): <imperative short description>
```

| Type | When |
|---|---|
| `feat` | New feature / new passing test |
| `test` | Failing test added (RED step) |
| `refactor` | Code restructured, no behaviour change |
| `fix` | Bug fix |
| `chore` | Tooling, deps, config |
| `docs` | Documentation only |

**Examples:**
```
test(station): add failing test for GetStationListUseCase happy path
feat(station): implement GetStationListUseCase to pass happy path test
refactor(station): extract pagination params to value object
```

---

## 8. Definition of Done (per feature)

- [ ] All new behaviours have a failing test written first.
- [ ] All tests are green.
- [ ] No layer-boundary violations (no DTO in domain, no Dio in presentation).
- [ ] `fpdart` Either used for all async results in domain & data layers.
- [ ] Riverpod provider wired and testable via `ProviderContainer`.
- [ ] Widget test covers at least: loading state, success state, error state.
- [ ] `flutter analyze` reports zero errors.
- [ ] Each logical change has its own commit.
- [ ] `WAYS_OF_WORKING.md` consulted and followed throughout.

---

## 9. What to Do When Unclear

> **Ask, do not assume.**

If any part of the spec is ambiguous:
1. List the specific ambiguity.
2. Propose 2–3 options with trade-offs.
3. Wait for the developer to choose before writing any code.

---

## 10. Anti-Patterns (never do these)

| ❌ Anti-pattern | ✅ Correct approach |
|---|---|
| Write implementation before test | Write test → watch fail → implement |
| Generate full feature at once | One behaviour per TDD cycle |
| Use `dynamic` or `var` for domain types | Use explicit types and sealed classes |
| Call Dio directly in presentation | Use repository interface via use-case |
| Catch all exceptions and swallow | Return `Left(Failure)` with typed errors |
| Skip the refactor step | Always review for duplication after green |
| Mix layers (DTO in domain) | Respect layer boundaries strictly |
| Auto-proceed without confirmation | Always stop and ask after each cycle |

---

*Last updated: 2026-04-29 | Maintained by the dev team*
