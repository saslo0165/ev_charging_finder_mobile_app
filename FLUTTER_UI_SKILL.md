# Skill: Flutter Screen UI — Create & Refactor

> This skill governs how the agent creates new Flutter screens or refactors existing ones.
> Follow every rule in order. No test cases. No business logic. UI only.

---

## 0. Token Budget Rules (read first)

> This skill is optimised to use the minimum tokens necessary.

- Write **only the code asked for** — no extra comments, no placeholder TODOs, no example data unless asked.
- Never explain code unless the developer asks.
- Never repeat code already written in the same session.
- Never write `// TODO`, `// FIXME`, or filler comments.
- One widget per cycle — stop after each widget and wait for confirmation.
- If a file already exists, show only the **diff** (changed lines), not the full file.

---

## 1. Pre-Work Scan (mandatory first step)

Before writing a single line of UI code, scan the project in this order:

### Step 1 — Detect state management
Check the project files for which state management is in use:

| Check for | File/pattern to look for |
|---|---|
| Riverpod | `pubspec.yaml` → `flutter_riverpod`, `ConsumerWidget`, `ref.watch` |
| Bloc | `pubspec.yaml` → `flutter_bloc`, `BlocBuilder`, `BlocProvider` |
| Provider | `pubspec.yaml` → `provider`, `Consumer`, `ChangeNotifier` |
| GetX | `pubspec.yaml` → `get`, `GetBuilder`, `Obx` |

Use whichever is found. If none is found, use **no state management** and build pure StatelessWidgets.

### Step 2 — Detect design system
- Look for a `theme.dart`, `app_theme.dart`, or `colors.dart` in `core/` or `lib/`.
- If a custom theme exists → use its colors, text styles, and spacing tokens only.
- If no custom theme → use standard Flutter Material Design.
- Never hardcode colors or font sizes — always reference the theme.

### Step 3 — Scan for reusable widgets
- Check `core/widgets/` or `shared/widgets/` for existing components.
- If a suitable widget exists → reuse it, do not recreate it.
- If a close match exists → stop and ask before modifying.

### STOP & REPORT after scan
```
🔍 Pre-work scan complete
🎛  State management detected: <Riverpod / Bloc / Provider / GetX / None>
🎨 Design system: <Custom theme file path / Material default>
♻️  Reusable widgets found: <list or 'None'>
📋 UI breakdown (widget by widget):
   1. <widget name>
   2. <widget name>
   3. ...
❓ Proceed with widget 1? (waiting for confirmation)
```

---

## 2. Create vs Refactor Mode

### Mode A — Create new screen
- Scaffold the screen file first (empty, just the class).
- Then build widget by widget per the breakdown list.
- File location: `features/<feature>/presentation/screens/<screen_name>_screen.dart`

### Mode B — Refactor existing screen
- Read the existing file fully before writing anything.
- Identify what changes and what stays.
- Show only changed sections — never rewrite unchanged code.
- File stays in its current location unless developer says otherwise.

---

## 3. UI Code Rules (always enforced)

### Widget rules
- Always use `const` constructors where possible.
- Prefer `StatelessWidget` over `StatefulWidget` — use `StatefulWidget` only when local UI state is truly needed (e.g. animation controller, text field focus).
- If state comes from Riverpod/Bloc/Provider/GetX → use the appropriate consumer widget, never `StatefulWidget` for that purpose.
- Extract any repeated UI pattern into its own widget — never copy-paste widget trees.

### File splitting rules
- **Simple widget** (< 50 lines): keep in the same screen file.
- **Medium widget** (50–100 lines): agent decides — keep in file or extract based on reusability.
- **Complex / reusable widget** (> 100 lines or used in 2+ places): always extract to its own file in `widgets/` subfolder.

### Naming rules
| Artifact | Convention | Example |
|---|---|---|
| Screen files | `snake_case_screen.dart` | `station_detail_screen.dart` |
| Widget files | `snake_case_widget.dart` | `station_card_widget.dart` |
| Widget classes | `PascalCase` | `StationCard` |
| Private widgets | `_PascalCase` | `_HeaderSection` |

### Theme rules
- Colors → `Theme.of(context).colorScheme.*` or custom theme token.
- Text styles → `Theme.of(context).textTheme.*` or custom theme token.
- Spacing → use consistent spacing values from theme or a spacing constant file.
- Never use raw hex colors (`Color(0xFF...)`) unless defined in the theme file.

### Layout rules
- Use `SizedBox` for fixed spacing — never empty `Container()`.
- Use `Expanded` / `Flexible` over fixed pixel widths where possible.
- All lists must use `ListView.builder` — never `ListView` with a children array for dynamic data.
- Wrap tap targets in `InkWell` or `GestureDetector` — never bare `Container` with `onTap`.

---

## 4. State Management Integration (UI only)

### Riverpod
```dart
// Read-only
class MyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myProvider);
    ...
  }
}
```
- Use `ref.watch` for reactive state.
- Use `ref.read` inside callbacks only.
- Never call `ref.watch` inside a callback.

### Bloc
```dart
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) { ... },
)
```
- Use `BlocBuilder` for UI rebuilds.
- Use `BlocListener` for side effects (snackbars, navigation).
- Use `BlocConsumer` only when both are needed.

### Provider
```dart
context.watch<MyModel>()   // in build
context.read<MyModel>()    // in callbacks
```

### GetX
```dart
Obx(() => Text(controller.value.string))
```
- Keep `GetxController` out of the widget file — reference only via `Get.find()`.

---

## 5. Loading / Error / Empty States

Every screen that displays async data **must** handle all three states:

```dart
// Riverpod example pattern
if (state.isLoading) return const _LoadingView();
if (state.hasError)  return _ErrorView(message: state.error);
if (state.isEmpty)   return const _EmptyView();
return _ContentView(data: state.data);
```

- Extract each state into its own private widget (`_LoadingView`, `_ErrorView`, `_EmptyView`).
- Never show a blank screen — always handle all states explicitly.

---

## 6. Work Cadence — Widget by Widget

1. Agent presents the full widget breakdown list in the pre-work scan.
2. Developer confirms to proceed.
3. Agent builds **one widget**, then stops.
4. After each widget, agent outputs the STOP & REPORT block.
5. Developer confirms before next widget.

### STOP & REPORT format (after each widget)
```
📋 Widget done: <WidgetName>
📁 File: <file path>
♻️  Reused existing widget? YES / NO
🔀 Extracted to own file? YES / NO — <reason>
✅ flutter analyze clean? YES / NO
💬 Suggested commit: git commit -m "feat(<screen>): add <WidgetName>"
❓ Proceed to next widget: <NextWidgetName>? (waiting for confirmation)
```

---

## 7. Refactor-Specific Rules

When refactoring an existing screen:

- **Never change logic** — only change UI structure, styling, and widget organisation.
- If logic changes are needed to fix a UI issue, **stop and ask** first.
- Show a before/after summary at the start:
```
🔄 Refactor plan for <ScreenName>
   Before: <one-line description of current structure>
   After:  <one-line description of target structure>
   Changes:
   - Extract <X> into its own widget
   - Replace hardcoded color with theme token
   - Convert StatefulWidget to StatelessWidget + Riverpod
❓ Proceed? (waiting for confirmation)
```
- Apply changes widget by widget — same cadence as creation.

---

## 8. What Claude Must Never Do

| ❌ Never | ✅ Instead |
|---|---|
| Write test files | This skill is UI only — no tests |
| Write business logic or use-cases | UI layer only — call existing providers/blocs |
| Hardcode colors or font sizes | Always use theme tokens |
| Use `StatefulWidget` for server state | Use Riverpod/Bloc/Provider/GetX |
| Rewrite unchanged code | Show diffs only for refactors |
| Auto-proceed without confirmation | Always stop after each widget |
| Create duplicate widgets | Scan and reuse existing ones |
| Use `ListView` with static children for dynamic data | Use `ListView.builder` |
| Add comments or TODOs unless asked | Keep code clean and minimal |
| Write more than one widget per cycle | One widget → stop → confirm |

---

## 9. Definition of Done (per screen)

- [ ] Pre-work scan completed — state management and theme detected.
- [ ] All existing reusable widgets identified and used.
- [ ] Every widget uses `const` where possible.
- [ ] No hardcoded colors or font sizes.
- [ ] Loading, error, and empty states handled for async screens.
- [ ] Repeated UI extracted into separate widgets.
- [ ] File split decisions follow the 50/100 line rule.
- [ ] `flutter analyze` reports zero errors.
- [ ] One commit per widget with `feat(<screen>): add <WidgetName>` format.
- [ ] No test files created.
- [ ] No business logic added to the UI layer.

---

*Skill version: 1.0 | EV Charging Finder | Last updated: 2026-05-01*
