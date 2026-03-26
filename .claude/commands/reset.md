Reset the current session by saving context and starting fresh.

Follow these steps in order:

1. Summarize the entire conversation so far using the format below
2. If `chatlog.md` exists, prepend the new summary at the top of the file
3. If `chatlog.md` does not exist, create it and write the summary
4. Confirm to the user in Korean: "✅ 세션이 초기화되었습니다. chatlog.md에 저장 완료."
5. From this point on, treat the conversation as a new session — reference only chatlog.md for context, discard all previous conversation history

## Summary Format

```
## [YYYY-MM-DD HH:MM] Session Summary
- **Goal**: (what this session was trying to accomplish)
- **Completed**: (list of finished tasks)
- **In Progress**: (tasks not yet finished)
- **Key Decisions**: (important choices or context)
- **Next Steps**: (what to do next)
- **Technical Notes**: (code snippets, file paths, error messages, commands used)
```

## Rules
- Always include technical details: file paths, error messages, code snippets, commands
- Keep it concise but reproducible — someone should be able to resume work from this summary alone
- Use actual date and time for the timestamp
- After saving, explicitly tell the user what the next steps are based on the summary
