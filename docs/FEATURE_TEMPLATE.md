# Feature Implementation Template

> Copy-paste this header at the top of every spec you give to Claude.

---

## 🛠️ How to use this template

1. Fill in `[FEATURE NAME]` and the `Spec` section.
2. Paste the whole block as your message to Claude.
3. Claude will **first run a reuse scan** across all feature layers before writing any new code.
4. Claude will follow the Ways of Working — tests only if you explicitly ask for them.

---

## 📋 Implementation Request

**Feature:** [FEATURE NAME]

**Skill to activate:** `ev-flutter-wow` — follow `WAYS_OF_WORKING.md` strictly.

### Spec
```
<paste your feature requirements here>
```

### Acceptance criteria
- [ ] <criterion 1>
- [ ] <criterion 2>

### Known constraints / decisions
- State manager: Riverpod
- Error handling: fpdart Either<Failure, T>
- Architecture: Clean (Presentation → Domain → Data)

---

> **Reminder to Claude:**
> 1. Read WAYS_OF_WORKING.md before writing any code.
> 2. **Run the Pre-Implementation Reuse Check (Section 0) first** — scan all 4 layers and report findings before writing anything.
> 3. If existing code or UI is found that needs changes, stop and ask before modifying.
> 4. Break the spec into single-behaviour cycles and list them.
> 5. Implement ONE cycle at a time.
> 6. Use the mandatory STOP & REPORT format after every cycle.
> 7. Do NOT write tests unless explicitly asked.
> 8. Do NOT proceed without explicit confirmation.
