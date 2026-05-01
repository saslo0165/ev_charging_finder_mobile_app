# Ways of Working — EV Charging Finder

> This document is the single source of truth for how features are built on this project.
> Every implementation session **must** follow these rules, in order.

---

## 0. Pre-Implementation Reuse Check (mandatory first step)

> **Before writing a single line of code, always scan the codebase for existing work.**

### Check order (search in this sequence)
1. `features/<feature>/domain/` — existing use-cases, entities, repository interfaces
2. `features/<feature>/data/` — existing repository implementations, DTOs, datasources
3. `features/<feature>/presentation/` — existing widgets, providers, ViewModels
4. `core/` — shared widgets, utilities, theme, router, network helpers

### Decision rules
| Finding | Action |
|---|---|
| Exact match found | Reuse as-is. Do NOT create a duplicate. |
| Close match found (needs small changes) | **Stop. Report what was found and ask developer before modifying.** |
| Nothing relevant found | Proceed to implement from scratch. |

### STOP & REPORT format for reuse findings
```
🔍 Reuse scan complete
📁 Found relevant code: <file path(s)>
📋 What it does: <one-line description>
⚠️  Needs changes? YES/NO — <describe what would change>
❓ Modify existing or create new? (waiting for confirmation)
```

> **Do NOT write new code until the developer confirms the reuse decision.**

---

## 1. Golden Rule: One Behaviour at a Time

Implement one small, well-defined behaviour per cycle. Never generate a full feature in one shot.

---

## 2. Step-by-Step Cadence (mandatory)

Each cycle **must** produce the following output, in order:

### Step 1 – IMPLEMENT
- Write the minimal production code that satisfies **one** behaviour.
- No premature abstractions, no gold-plating.

### Step 2 – REFACTOR
- Eliminate duplication, improve naming, improve structure.
- One refactor change at a time.

### Step 3 – STOP & REPORT
After each cycle, output exactly:

```
📋 Step done: <one-line description>
✅ flutter analyze clean? YES/NO
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
| Providers | noun + `Provider` | `stationListProvider` |
| Use-cases | verb + noun | `GetStationListUseCase` |
| Failures | noun + `Failure` | `NetworkFailure`, `ServerFailure` |

---

## 7. Commit Message Format

```
<type>(<scope>): <imperative short description>
```

| Type | When |
|---|---|
| `feat` | New feature |
| `refactor` | Code restructured, no behaviour change |
| `fix` | Bug fix |
| `chore` | Tooling, deps, config |
| `docs` | Documentation only |

**Examples:**
```
feat(station): implement GetStationListUseCase
refactor(station): extract pagination params to value object
fix(station): handle empty list response from API
```

---

## 9. Performance & Optimization Guidelines

### Widget rendering
- Prefer `const` constructors wherever possible to avoid unnecessary rebuilds.
- Use `select()` on Riverpod providers to subscribe to only the slice of state a widget needs.
- Avoid building heavy widgets inside `build()` — extract them into separate widgets or cache with `useMemoized` / `ref.watch` selectors.
- Use `ListView.builder` / `SliverList` for any list that can exceed ~20 items.

### State & data
- Never fetch the same data twice in one screen lifecycle — cache at the provider level.
- Debounce search/filter inputs (≥ 300 ms) before triggering API calls.
- Paginate API results; do not load unbounded lists.

### Images & assets
- Use `cached_network_image` for all remote images.
- Compress and resize assets at build time; avoid oversized PNGs in the bundle.

### Build & compile
- Run `flutter build apk --analyze-size` before shipping a release to catch size regressions.
- Keep unused dependencies out of `pubspec.yaml`.

---

## 10. Logging & Monitoring Guidelines

### Log levels
| Level | When to use |
|---|---|
| `verbose` | Detailed trace info (dev only, never in release) |
| `debug` | State transitions, API payloads (dev only) |
| `info` | Key user actions, navigation events |
| `warning` | Recoverable errors, unexpected-but-handled states |
| `error` | Unrecoverable errors, `Left(Failure)` paths that surface to the user |

### Rules
- Use a single logger abstraction (`core/utils/logger.dart`) — never call `print()` in production code.
- Always log the **feature + action** as context: `[StationList] fetching page 2`.
- Log `Left(Failure)` results at `warning` or `error` level with the failure type and message.
- Never log PII (user emails, tokens, location coordinates beyond city level).
- Strip `verbose` and `debug` logs in release builds via the logger abstraction.

### Crash & error monitoring
- Wire unhandled exceptions to the crash reporter in `main.dart` via `FlutterError.onError` and `PlatformDispatcher.instance.onError`.
- Every `Left(Failure)` surfaced to the UI should also be sent to the crash reporter with non-PII context.

---

## 11. Definition of Done (per feature)

- [ ] Pre-implementation reuse scan completed and documented.
- [ ] Existing code/UI reused wherever available; new code written only when nothing suitable exists.
- [ ] No layer-boundary violations (no DTO in domain, no Dio in presentation).
- [ ] `fpdart` Either used for all async results in domain & data layers.
- [ ] Riverpod provider wired and working.
- [ ] Performance guidelines followed (const widgets, pagination, image caching).
- [ ] Logging added for key actions and all `Left(Failure)` paths.
- [ ] `flutter analyze` reports zero errors.
- [ ] Each logical change has its own commit.

---

## 12. What to Do When Unclear

> **Ask, do not assume.**

If any part of the spec is ambiguous:
1. List the specific ambiguity.
2. Propose 2–3 options with trade-offs.
3. Wait for the developer to choose before writing any code.

---

## 13. Anti-Patterns (never do these)

| ❌ Anti-pattern | ✅ Correct approach |
|---|---|
| Skip the reuse scan | Always scan all 4 layers before writing new code |
| Modify existing code without asking | Stop, report the finding, wait for confirmation |
| Write duplicate widgets/use-cases | Reuse what already exists |
| Write any test code | No tests on this project |
| Generate full feature at once | One behaviour per cycle |
| Use `dynamic` or `var` for domain types | Use explicit types and sealed classes |
| Call Dio directly in presentation | Use repository interface via use-case |
| Catch all exceptions and swallow | Return `Left(Failure)` with typed errors |
| Skip the refactor step | Always review for duplication after implementation |
| Mix layers (DTO in domain) | Respect layer boundaries strictly |
| Auto-proceed without confirmation | Always stop and ask after each cycle |
| Call `print()` in production code | Use `core/utils/logger.dart` abstraction |
| Load unbounded lists | Paginate all API results |

---

*Last updated: 2026-04-29 | Maintained by the dev team*
