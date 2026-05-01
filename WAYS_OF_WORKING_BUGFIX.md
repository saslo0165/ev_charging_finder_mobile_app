# Ways of Working — Bug Fixes & Hotfixes

> This document governs how **all bug fixes and hotfixes** are handled on the EV Charging Finder project.
> Follow every section in order. Do not skip steps.

---

## 0. Pre-Fix Reuse & Impact Check (mandatory first step)

> **Before touching any code, always scan and understand the full blast radius.**

### Check order
1. `features/<feature>/domain/` — is the bug in a use-case or entity logic?
2. `features/<feature>/data/` — is it a repository impl, DTO mapping, or datasource issue?
3. `features/<feature>/presentation/` — is it a widget, provider, or ViewModel issue?
4. `core/` — is it a shared utility, network layer, or router issue?

### Reuse & duplication scan
- Check if the **same or similar bug pattern exists elsewhere** in the codebase before fixing just one instance.
- Check if a **fix already exists** in another feature that can be reused.

### STOP & REPORT format for pre-fix scan
```
🔍 Pre-fix scan complete
📁 Bug located at: <file path(s)>
🧩 Root cause: <one-line description>
🔁 Same bug elsewhere? YES / NO — <file paths if YES>
⚠️  Fix will affect: <list of files/layers that will change>
❓ Proceed with fix? (waiting for confirmation)
```

> **Do NOT write any fix code until the developer confirms.**

---

## 1. Bug Severity Levels

Every bug report must be classified before work begins.

| Severity | Definition | Examples |
|---|---|---|
| 🔴 **Critical** | App crash or data loss | Null pointer on launch, corrupted local storage, payment data lost |
| 🟠 **High** | Feature completely broken, no workaround | Map fails to load, charging stations never appear, auth loop |
| 🟡 **Medium** | Feature broken but workaround exists | Filter resets on back-navigate, price shows wrong currency |
| 🔵 **Low** | Cosmetic or minor annoyance | Wrong icon colour, text truncated by 1px, minor spacing off |

### Classification rules
- Claude must state the severity in every STOP & REPORT output.
- If severity is unclear, Claude must ask — never assume.
- **Critical & High** bugs: fix immediately, minimal scope.
- **Medium & Low** bugs: fix only if developer confirms it's worth doing now.

---

## 2. Pre-Fix Protocol (mandatory — all four steps)

> Never write a fix without completing all four steps first.

### Step 1 — Reproduce
- Describe exactly how the bug manifests: what input triggers it, what screen, what state.
- If Claude cannot determine how to reproduce it from the report, **stop and ask** for reproduction steps.
- State: *"This bug reproduces when: ..."*

### Step 2 — Identify root cause
- Trace the bug to its **exact origin** — not just where it surfaces, but where it is caused.
- Common root cause locations:
  - Wrong assumption in a use-case
  - DTO field missing or misnamed (`fromJson` / `toDomain`)
  - Provider state not reset between sessions
  - Missing null-check in a widget
  - Race condition in async Riverpod provider
- State: *"Root cause: ..."*

### Step 3 — Check for recurrence
- Search the codebase for the same pattern that caused this bug.
- If found elsewhere, list all affected files and ask the developer if all instances should be fixed.

### Step 4 — Scope the fix
- List every file that will be touched.
- If the fix requires changing anything **outside the direct bug scope**, stop and ask first.
- Never refactor, rename, or restructure unrelated code during a bug fix.

---

## 3. Fix Cadence (mandatory)

### Step 1 – FIX
- Apply the minimal change that resolves the root cause.
- Touch **only** the files scoped in Step 4 of the Pre-Fix Protocol.
- No cleanup, no unrelated improvements, no gold-plating.

### Step 2 – VERIFY
- Confirm the bug no longer reproduces with the exact steps from Step 1 of Pre-Fix Protocol.
- Confirm `flutter analyze` is clean.
- Confirm no regressions in adjacent code paths.

### Step 3 – REFACTOR (optional, ask first)
- Only if the fix introduced duplication or left code messy.
- Must be a **separate step** after the fix is verified — never mixed in with the fix itself.
- Ask the developer before doing any refactor during a bug fix session.

### Step 4 – STOP & REPORT
After every fix cycle, output exactly:

```
📋 Fix done: <one-line description of what was fixed>
🔴/🟠/🟡/🔵 Severity: <Critical / High / Medium / Low>
📁 Files changed: <list of file paths>
🔁 Same bug fixed elsewhere? YES / NO
✅ flutter analyze clean? YES / NO
💬 Suggested commit: git commit -m "<type>(<scope>): <message>"
❓ Proceed to next step? (waiting for confirmation)
```

> **Do NOT auto-proceed.** Wait for explicit approval before moving on.

---

## 4. Fix Scope Rules (strict)

| Situation | Rule |
|---|---|
| Fix only touches the bug's root cause file | Proceed after pre-fix confirmation |
| Fix requires changing a shared `core/` utility | **Stop and ask** — shared code affects all features |
| Fix requires changing a domain interface | **Stop and ask** — interface changes have wide impact |
| Claude notices an unrelated bug while fixing | **Report it separately**, do NOT fix it in the same cycle |
| Claude notices unrelated code quality issues | **Do not touch them** — report at end of session if needed |
| Fix requires a dependency version bump | **Stop and ask** — version changes can introduce regressions |

> **One bug, one fix, one commit. Always.**

---

## 5. Architecture Constraints (Clean Architecture)

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
- Use-cases depend on **interfaces** only (DIP).
- State is managed via **Riverpod** (`flutter_riverpod ^3`).
- All async results use **`fpdart` Either<Failure, T>** — never raw exceptions propagated to UI.
- DTOs ↔ Entities via `toDomain()` / `fromJson()` — never leak DTOs into domain.

---

## 6. Naming Conventions

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
| `fix` | Bug fix — the primary type for this document |
| `hotfix` | Critical / High severity fix on production |
| `refactor` | Code restructured after fix, no behaviour change |
| `chore` | Tooling, deps, config |
| `docs` | Documentation only |

**Examples:**
```
fix(station): resolve null crash when station list is empty
hotfix(auth): prevent infinite login loop on token expiry
fix(map): correct DTO latitude field mapping from API response
refactor(station): extract null-guard to shared utility after fix
```

---

## 8. Performance & Optimization Guidelines

### Widget rendering
- Prefer `const` constructors wherever possible to avoid unnecessary rebuilds.
- Use `select()` on Riverpod providers to subscribe to only the slice of state a widget needs.
- Avoid building heavy widgets inside `build()` — extract into separate widgets.
- Use `ListView.builder` / `SliverList` for any list that can exceed ~20 items.

### State & data
- Never fetch the same data twice in one screen lifecycle — cache at the provider level.
- Debounce search/filter inputs (≥ 300 ms) before triggering API calls.
- Paginate API results; do not load unbounded lists.

### Images & assets
- Use `cached_network_image` for all remote images.
- Compress and resize assets at build time; avoid oversized PNGs in the bundle.

---

## 9. Logging & Monitoring Guidelines

### Log levels
| Level | When to use |
|---|---|
| `verbose` | Detailed trace info (dev only, never in release) |
| `debug` | State transitions, API payloads (dev only) |
| `info` | Key user actions, navigation events |
| `warning` | Recoverable errors, unexpected-but-handled states |
| `error` | Unrecoverable errors, `Left(Failure)` paths that surface to the user |

### Rules
- Use `core/utils/logger.dart` — never call `print()` in production code.
- Always log the **feature + action** as context: `[StationList] fetching page 2`.
- Log `Left(Failure)` results at `warning` or `error` level with the failure type and message.
- Never log PII (user emails, tokens, location coordinates beyond city level).
- Every bug fix should include a log entry at the point of the fix so the fix is traceable in production.

### Crash & error monitoring
- Wire unhandled exceptions to the crash reporter in `main.dart` via `FlutterError.onError`.
- Every `Left(Failure)` surfaced to the UI should also be sent to the crash reporter with non-PII context.

---

## 10. Definition of Done (per bug fix)

- [ ] Bug reproduced and root cause identified before any code written.
- [ ] Same bug pattern checked across entire codebase.
- [ ] Fix scope confirmed by developer before implementation.
- [ ] Only files in the agreed scope were touched.
- [ ] Bug no longer reproduces with original steps.
- [ ] No layer-boundary violations introduced.
- [ ] `fpdart` Either used for all async results — no raw exceptions.
- [ ] Log entry added at fix location.
- [ ] `flutter analyze` reports zero errors.
- [ ] One commit per bug fix with correct `fix` or `hotfix` type.
- [ ] Any other bug instances found reported separately.

---

## 11. Anti-Patterns (never do these)

| ❌ Anti-pattern | ✅ Correct approach |
|---|---|
| Fix the bug without identifying root cause | Always trace to origin before touching code |
| Skip the reproduction step | Always confirm how the bug reproduces first |
| Fix multiple bugs in one commit | One bug, one fix, one commit |
| Fix unrelated issues noticed while fixing | Report them separately, never fix in same cycle |
| Refactor during a fix | Fix first, refactor separately and only if asked |
| Touch shared `core/` code without asking | Always stop and ask — shared code has wide impact |
| Change a domain interface without asking | Interfaces affect all layers — confirm first |
| Auto-proceed without confirmation | Always stop and ask after each cycle |
| Call `print()` in production code | Use `core/utils/logger.dart` abstraction |
| Load unbounded lists | Paginate all API results |
| Use `dynamic` or `var` for domain types | Use explicit types and sealed classes |
| Call Dio directly in presentation | Use repository interface via use-case |
| Catch all exceptions and swallow | Return `Left(Failure)` with typed errors |

---

## 12. What to Do When Unclear

> **Ask, do not assume.**

If any part of the bug report is ambiguous:
1. List the specific ambiguity.
2. Propose 2–3 options with trade-offs.
3. Wait for the developer to choose before writing any code.

Common ambiguities to always clarify:
- Which device / OS version does the bug reproduce on?
- Is this a regression (it worked before) or a never-worked issue?
- Is there a related ticket, PR, or commit that may have introduced this?

---

*Last updated: 2026-04-30 | Maintained by the dev team*
