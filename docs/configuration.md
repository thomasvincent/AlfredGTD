# Configuring AlfredGTD

This guide explains how to customize AlfredGTD to work with your preferred applications and workflow.

## Configuration File

AlfredGTD uses a JSON configuration file located at:

```
/path/to/workflow/config.json
```

You can access this file by:
1. Opening Alfred Preferences
2. Going to the Workflows tab
3. Right-clicking on AlfredGTD
4. Selecting "Open in Finder"
5. Locating the `config.json` file

## Default Configuration

The default configuration uses Apple's built-in applications:

```json
{
  "task_app": "reminders",
  "note_app": "notes",
  "project_app": "reminders",
  "inbox_list": "GTD Inbox",
  "projects_folder": "Projects",
  "reference_folder": "Reference",
  "someday_list": "Someday/Maybe",
  "waiting_list": "Waiting For",
  "use_due_dates": true,
  "use_priorities": true,
  "use_contexts": true
}
```

## Configuration Options

### Task Applications

| Option | Description |
|--------|-------------|
| `"reminders"` | Apple Reminders (default) |
| `"things"` | Things by Cultured Code |
| `"omnifocus"` | OmniFocus by Omni Group |
| `"todoist"` | Todoist |

### Note Applications

| Option | Description |
|--------|-------------|
| `"notes"` | Apple Notes (default) |
| `"evernote"` | Evernote |
| `"devonthink"` | DEVONthink |
| `"notion"` | Notion |

### General Settings

| Setting | Type | Description |
|---------|------|-------------|
| `inbox_list` | String | Name of your GTD inbox list |
| `projects_folder` | String | Name of your projects folder/list |
| `reference_folder` | String | Name of your reference folder |
| `someday_list` | String | Name of your someday/maybe list |
| `waiting_list` | String | Name of your waiting for list |
| `use_due_dates` | Boolean | Enable/disable due dates |
| `use_priorities` | Boolean | Enable/disable priority flags |
| `use_contexts` | Boolean | Enable/disable contexts (@home, @work, etc.) |

## Advanced Configuration

### Custom Scripts

You can customize the AppleScript files located in the `scripts` folder:

- `add_task.scpt` - Script for adding tasks
- `add_note.scpt` - Script for adding notes
- `add_project.scpt` - Script for creating projects
- `process_inbox.scpt` - Script for processing the inbox

### Example: Things Configuration

```json
{
  "task_app": "things",
  "note_app": "notes",
  "project_app": "things",
  "inbox_list": "Inbox",
  "projects_folder": "Projects",
  "reference_folder": "Reference Notes",
  "someday_list": "Someday",
  "waiting_list": "Waiting",
  "use_due_dates": true,
  "use_priorities": true,
  "use_contexts": true
}
```

### Example: OmniFocus Configuration

```json
{
  "task_app": "omnifocus",
  "note_app": "devonthink",
  "project_app": "omnifocus",
  "inbox_list": "Inbox",
  "projects_folder": "Projects",
  "reference_folder": "Reference",
  "someday_list": "Someday/Maybe",
  "waiting_list": "Waiting",
  "use_due_dates": true,
  "use_priorities": true,
  "use_contexts": true
}
```

## Context Tags

When `use_contexts` is enabled, AlfredGTD recognizes these context tags:

- `@home` - Tasks to do at home
- `@work` - Tasks to do at work
- `@phone` - Phone calls to make
- `@email` - Emails to send
- `@computer` - Computer-based tasks
- `@errands` - Tasks to do while out
- `@meeting` - Meeting-related tasks
- `@reading` - Reading materials
- `@waiting` - Waiting for someone else

You can create custom contexts by using the @ symbol followed by any word.

## Priority Levels

When `use_priorities` is enabled, AlfredGTD recognizes these priority indicators:

- `!` - Low priority
- `!!` - Medium priority
- `!!!` - High priority

Example: `task !!! Finish quarterly report`

## Troubleshooting Configuration

If you encounter issues after changing your configuration:

1. Verify JSON syntax is correct (no missing commas or brackets)
2. Ensure the specified applications are installed
3. Check that list and folder names exist in your task/note applications
4. Try resetting to the default configuration
5. Restart Alfred after making changes