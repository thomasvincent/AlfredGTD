-- AlfredGTD: Add Note Script
-- This script adds a new note to your GTD reference system

on run argv
    set noteText to item 1 of argv
    
    -- Exit if the user didn't enter anything
    if noteText is "" then
        display notification "No text entered. Note not created." with title "AlfredGTD"
        return
    end if
    
    -- Configuration (this could be moved to a separate config file)
    -- Possible values: "notes", "evernote", "devonthink", "notion"
    set noteApp to "notes" 
    
    if noteApp is "notes" then
        addNoteToAppleNotes(noteText)
    else if noteApp is "evernote" then
        addNoteToEvernote(noteText)
    else if noteApp is "devonthink" then
        addNoteToDevonthink(noteText)
    else if noteApp is "notion" then
        addNoteToNotion(noteText)
    else
        -- Default to Apple Notes if no valid app is selected
        addNoteToAppleNotes(noteText)
    end if
end run

on addNoteToAppleNotes(noteText)
    tell application "Notes"
        -- Create new note in the default folder
        set newNote to make new note with properties {body:noteText}
        -- Try to use a specific folder if needed
        -- set gtdFolder to folder "GTD"
        -- tell gtdFolder to make new note with properties {body:noteText}
        
        -- Notify the user
        display notification "Note added to Apple Notes" with title "AlfredGTD"
    end tell
end addNoteToAppleNotes

on addNoteToEvernote(noteText)
    tell application "Evernote"
        -- Create a new note in the default notebook
        create note with text noteText
        -- Alternatively, you could specify a notebook:
        -- create note with text noteText notebook "GTD"
        
        -- Notify the user
        display notification "Note added to Evernote" with title "AlfredGTD"
    end tell
end addNoteToEvernote

on addNoteToDevonthink(noteText)
    -- This would require DEVONthink scripting which is more complex
    -- For now, just show a notification
    display notification "Adding to DEVONthink not implemented yet." with title "AlfredGTD"
end addNoteToDevonthink

on addNoteToNotion(noteText)
    -- Notion does not have direct AppleScript support, would need web API
    -- For now, just show a notification
    display notification "Adding to Notion not implemented yet." with title "AlfredGTD"
end addNoteToNotion