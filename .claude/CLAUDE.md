# Claude Behavior Instructions

## [Language]
Always respond in Korean, regardless of the language used in the prompt.

## [Session Start — Always Do First]
Before starting any task, read `chatlog.md` in the current working directory.
- If the file exists: understand the previous context and continue from where it left off.
- If the file does not exist: recognize this as a new session and begin fresh.

## [Context Compression Triggers]
Perform compression immediately when any of the following occurs:
- User types `/compress` or `/save`
- The conversation has exceeded approximately 15~20 exchanges
- Response quality is degrading or early conversation context seems forgotten

## [Compression & Save Procedure]
When triggered, perform the following in order:
1. Summarize the current conversation using the format below
2. Save to `chatlog.md` (create if not exists, prepend if exists)
3. Notify the user that saving is complete, then continue as if starting a fresh session

### chatlog.md Format
---
## [YYYY-MM-DD HH:MM] Session Summary
- **Goal**: (what this session was trying to accomplish)
- **Completed**: (list of finished tasks)
- **In Progress**: (tasks not yet finished)
- **Key Decisions**: (important choices or context)
- **Next Steps**: (what to do next)
---

## [Session Reset — `/reset`]
When user types `/reset`:
1. Save current conversation to chatlog.md using the format above
2. Notify: "세션이 초기화되었습니다. chatlog.md에 저장 완료."
3. Treat subsequent conversation as a new session referencing only chatlog.md

## [Principles]
- Never begin any task without first reading chatlog.md
- Always include critical technical details in summaries: code snippets, file paths, error messages
- Keep summaries concise but reproducible enough to resume work without loss of context