# AlfredGTD

An Alfred workflow that implements GTD (Getting Things Done) functionality with idiomatic Alfred design principles.

## Features

- **Quick Capture**: Rapidly add tasks, notes, and projects to your GTD system
- **Process Inbox**: Guide for processing your GTD inbox following standard GTD methodology
- **Configurable**: Works with multiple GTD apps (Reminders, Things, OmniFocus, Todoist)
- **Cross-Platform**: Support for various note-taking applications (Notes, Evernote, DEVONthink)
- **Efficient**: Keyboard-driven workflow that stays out of your way

## Requirements

- Alfred 4 or later with Powerpack
- macOS 10.14 or later
- Optional: Various GTD apps (supports Apple Reminders by default)

## Installation

1. Download the latest release from the [Releases page](https://github.com/thomasvincent/AlfredGTD/releases)
2. Double-click the `.alfredworkflow` file to install it in Alfred
3. Configure your preferred GTD apps in the workflow settings

## Usage

### Quick Capture

- `task [text]` - Create a new task in your GTD inbox
- `note [text]` - Create a new note in your reference system
- `project [text]` - Create a new project

### GTD Processing

- `gtd process` - Process your GTD inbox following the GTD methodology

### Additional Commands (Upcoming)

- `gtd review` - Start a weekly review
- `gtd next` - View next actions
- `gtd waiting` - View delegated items
- `gtd someday` - View someday/maybe list

## Configuration

The workflow uses Apple's built-in applications by default:

- Tasks: Apple Reminders
- Notes: Apple Notes
- Projects: Apple Reminders (as lists)

You can modify the `config.json` file in the workflow directory to use other applications:

- Tasks: Things, OmniFocus, Todoist
- Notes: Evernote, DEVONthink, Notion
- Projects: Things, OmniFocus, Todoist

## Development

### Structure

- `workflow/` - The Alfred workflow files
  - `info.plist` - Workflow configuration
  - `scripts/` - AppleScript and JavaScript files
  - `icons/` - Workflow icons
- `tests/` - Test files

### Testing

The workflow includes comprehensive test coverage:

```bash
cd tests
./run_tests.sh
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT