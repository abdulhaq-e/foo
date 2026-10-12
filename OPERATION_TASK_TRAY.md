# Operation Task Tray - Design Notes

Notes on whether the operations work (commit `554c652`, `operation_poller.dart` +
`JsonRemoteMessageHandlerHelper.createCommandHandler`) supports a non-blocking
"task tray" UX, like the bottom drawer / top notification bar in Google
Workspace Admin or the GCP console: the user fires a long-running command, a
tray tracks its progress, and the user keeps navigating the app freely.

Status: **deferred**. Plain inline polling (`awaitOperation: true`) ships first;
the tray comes later on top of it.

## Verdict

The design is not off. The current primitives are the right foundation; the
tray is an additional layer on top, not a rework. What is missing is an
app-level owner for in-flight operations and a few hooks on `pollOperation`.

## What already supports it

- **Polling does not block the UI.** `createCommandHandler` returns a `Future`,
  and `pollOperation` is an `await sleep(...)` + HTTP loop on the event loop.
  Blocking is purely a UI decision (a modal spinner, or awaiting inside a
  page's `onPressed`).
- **Fire-and-forget exists.** `awaitOperation: false` resolves on the 202 and
  passes the body to `fromJsonT`, so the caller can extract `operationId` and
  hand it to something else.
- **`pollOperation` is public and exported** (`api.dart` →
  `operation_poller.dart`), so an app-level service that outlives the page
  that fired the command can drive it.
- **`Operation` carries display data.** `label` and `commandType` are what a
  tray row needs.
- **Error semantics already fit.** A failed operation throws
  `ProblemDetailsException`; a timeout throws
  `OperationPollingTimeoutException`, which means "unknown", not "failed" —
  a natural "still running, check later" state in a tray.

## Gaps for the tray

1. **No registry of in-flight operations.** Nothing holds a list/stream of
   tracked operations that a widget above the `Navigator` can listen to. Each
   `pollOperation` call is a standalone Future; only its awaiter learns the
   outcome.
2. **Terminal-only visibility.** `pollOperation` exposes nothing while the
   operation is `pending` — no per-poll callback or stream, and no progress
   field on `Operation`. The tray can show spinner → done/failed, but not
   "3 of 10" or a percentage. Real progress needs backend support first.
3. **No cancellation.** If the user dismisses a tracked task or logs out, the
   loop keeps polling until it completes or times out.
4. **Timeout default is for the inline case.** 30s suits awaiting inline;
   background tasks need a much longer `pollingOptions.timeout`.
5. **No survival across reloads.** On Flutter web a refresh drops every
   in-flight operation. Console-style UIs recover by listing the user's
   pending operations from the backend. `Operation` has `actorId`, but the
   package only has a client for `GET api/queries/v1/operations/{id}`; whether
   nawat exposes a list endpoint needs checking.
6. **Getting the id out is clumsy.** With `awaitOperation: false`, each call
   site has to decode `operationId` inside `fromJsonT` itself.

## Proposed shape (later)

An `OperationTracker` (`ChangeNotifier` or stream-based), provided above the
router (e.g. `MaterialApp.router(builder: ...)` or a shell route):

```dart
// Call site: fire, hand off, return immediately.
final accepted = await importEmployeesHandler(command); // awaitOperation: false
tracker.track(accepted.operationId, label: 'Importing 240 employees');

// Tracker internally:
//   pollOperation(apiClient, id, options: longTimeout + cancellation)
// Exposes:
//   List<TrackedOperation> { id, label, state, error }
//   state: pending | succeeded | failed | unknown (timed out)
```

The tray / banner widget listens to the tracker and renders the list.

### Small additions needed in this package

- `pollOperation`: optional `onPoll(Operation)` callback for intermediate
  states.
- `pollOperation`: cancellation (`bool Function() isCancelled`, or a
  `Future<void>` that completes on cancel).
- Optionally: a `createCommandHandler` variant (or helper) that returns the
  `operationId` directly when the command is accepted with 202.
- Optionally, if the backend supports it: a client for listing the current
  actor's pending operations, to rehydrate the tray after a reload.
