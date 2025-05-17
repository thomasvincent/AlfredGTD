# Using AlfredGTD

This guide covers how to use the AlfredGTD workflow to implement the Getting Things Done (GTD) methodology effectively.

## GTD Quick Reference

AlfredGTD follows David Allen's GTD methodology with these key phases:

1. **Capture**: Collect what has your attention
2. **Clarify**: Process what it means
3. **Organize**: Put it where it belongs
4. **Reflect**: Review frequently
5. **Engage**: Take action

## Basic Commands

### Capturing Items

| Command | Description | Example |
|---------|-------------|---------|
| `task [text]` | Add a task to your GTD inbox | `task Buy milk` |
| `note [text]` | Create a reference note | `note Ideas for presentation` |
| `project [text]` | Create a new project | `project Website redesign` |

### Processing Your GTD System

| Command | Description |
|---------|-------------|
| `gtd process` | Start interactive inbox processing |

## Detailed Usage Guide

### Capturing Tasks

1. Trigger Alfred (default: ⌘+Space)
2. Type `task` followed by your task description
3. Press Enter to save the task to your inbox
4. A notification will confirm the task was captured

**Advanced Task Syntax:**

- **Contexts**: `task Call Jim @phone` (adds "@phone" context)
- **Projects**: `task Design logo +website` (associates with "+website" project)
- **Priority**: `task !Urgent meeting` (adds priority flag)

### Creating Notes

1. Trigger Alfred
2. Type `note` followed by your note text
3. Press Enter to save the note
4. The note will be saved in your configured notes application

**Note Features:**

- For short notes, simply type the content after the keyword
- For longer notes, a text input dialog will appear
- Notes are automatically titled based on the first line

### Creating Projects

1. Trigger Alfred
2. Type `project` followed by the project name
3. Press Enter to create the project
4. A new project will be created in your task management system

**Project Options:**

- Projects are created with an empty next actions list
- You can add tasks directly to projects using the task syntax: `task New homepage design +website`

### Processing Your Inbox

1. Trigger Alfred
2. Type `gtd process`
3. Press Enter to start the processing workflow
4. Follow the on-screen prompts to process each item

**Inbox Processing Flow:**

1. Each inbox item is displayed
2. You're prompted with processing options:
   - **Do it** (if it takes less than 2 minutes)
   - **Delegate it** (mark as waiting for someone)
   - **Defer it** (schedule for later)
   - **Next action** (move to appropriate action list)
   - **Reference** (move to reference system)
   - **Someday/Maybe** (move to someday list)
   - **Trash** (delete the item)

## Keyboard Shortcuts During Processing

When processing your GTD inbox, use these keyboard shortcuts:

| Key | Action |
|-----|--------|
| `1` | Do it now |
| `2` | Delegate it |
| `3` | Defer it |
| `4` | Next action |
| `5` | Reference |
| `6` | Someday/Maybe |
| `D` | Delete item |
| `Esc` | Exit processing |

## Integration with Other Applications

AlfredGTD works seamlessly with various task and note applications. Depending on your configuration, the commands will interact with your preferred apps.

### Supported Task Applications

- **Apple Reminders**: Default integration
- **Things**: Full support with Things URL schemes
- **OmniFocus**: Support via Omni Automation
- **Todoist**: Integration via Todoist API

### Supported Notes Applications

- **Apple Notes**: Default integration
- **Evernote**: Full support
- **DEVONthink**: Integration via AppleScript
- **Notion**: Basic support

## Tips for Effective Use

1. **Quick Capture**: Use AlfredGTD whenever something comes to mind - don't try to process it immediately
2. **Regular Processing**: Schedule time to process your inbox daily
3. **Weekly Review**: Perform a weekly review of all your projects and next actions
4. **Contexts**: Use contexts (@home, @work, @phone) to group related tasks
5. **Projects**: Any outcome requiring more than one action should be tracked as a project