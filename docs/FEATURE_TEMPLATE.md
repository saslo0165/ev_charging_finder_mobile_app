# Feature Implementation Template

> Copy-paste this header at the top of every spec you give to Claude.

---

## 🛠️ How to use this template

1. Fill in `[FEATURE NAME]` and the `Spec` section.
2. Paste the whole block as your message to Claude.
3. Claude will load the `ev-flutter-wow` skill automatically and follow the Ways of Working.

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
> 2. Break the spec into single-behaviour TDD cycles and list them.
> 3. Implement ONE cycle at a time.
> 4. Use the mandatory STOP & REPORT format after every cycle.
> 5. Do NOT proceed without explicit confirmation.
