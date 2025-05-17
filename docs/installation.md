# Installing AlfredGTD

This guide provides detailed instructions for installing and setting up the AlfredGTD workflow.

## Prerequisites

Before installing AlfredGTD, ensure you have:

- **macOS 10.14 (Mojave)** or later
- **Alfred 4 or 5** with Powerpack (paid version)
- Default applications:
  - Apple Reminders (for tasks and projects)
  - Apple Notes (for reference materials)

## Installation Steps

### Method 1: Direct Download (Recommended)

1. Visit the [Releases page](https://github.com/thomasvincent/AlfredGTD/releases) on GitHub
2. Download the latest `.alfredworkflow` file
3. Double-click the downloaded file to open it with Alfred
4. Click "Import" when prompted by Alfred
5. The workflow is now installed and ready to use

### Method 2: Manual Installation

1. Download or clone the [GitHub repository](https://github.com/thomasvincent/AlfredGTD)
2. Navigate to the `workflow` directory
3. Double-click the `info.plist` file or create a new workflow in Alfred and import this file

## Post-Installation Setup

### First-Time Configuration

1. Open Alfred Preferences (⌘+Space, then type "alfred preferences")
2. Navigate to the "Workflows" tab
3. Find and select "AlfredGTD" in the left sidebar
4. The workflow is pre-configured to use Apple Reminders and Notes by default

### Customizing Your GTD Applications

If you prefer using different applications for your GTD system, you can modify the configuration:

1. Right-click on the AlfredGTD workflow in Alfred Preferences
2. Select "Open in Finder"
3. Open the `config.json` file in a text editor
4. Modify the application settings according to your preferences
5. Save the file and restart Alfred

Example `config.json` for different application configurations:

```json
{
  "task_app": "things",  // Options: "reminders", "things", "omnifocus", "todoist"
  "note_app": "notes",   // Options: "notes", "evernote", "devonthink", "notion"
  "inbox_list": "GTD Inbox",
  "projects_location": "Projects"
}
```

## Troubleshooting Installation

### Common Issues

- **Workflow Not Working**: Ensure you have the Alfred Powerpack by checking in Alfred Preferences → Powerpack
- **Script Errors**: Make sure macOS has permission to run scripts from the workflow
  - Go to System Preferences → Security & Privacy → Privacy → Automation
  - Ensure Alfred has permission to control Apple Reminders and Notes (or your selected apps)
- **Application Not Found**: Verify that the applications configured in `config.json` are installed on your system

### Getting Help

If you encounter any issues during installation:

1. Check the [GitHub Issues](https://github.com/thomasvincent/AlfredGTD/issues) for similar problems
2. If your issue isn't listed, create a new issue with details about your system and the problem you're experiencing