-- AlfredGTD: Add Task Script
-- This script adds a new task to your GTD system

on run argv
    set taskText to item 1 of argv
    
    -- Exit if the user didn't enter anything
    if taskText is "" then
        display notification "No text entered. Task not created." with title "AlfredGTD"
        return
    end if
    
    -- Configuration (this could be moved to a separate config file)
    -- Possible values: "reminders", "todoist", "things", "omnifocus"
    set taskApp to "reminders" 
    
    if taskApp is "reminders" then
        addTaskToReminders(taskText)
    else if taskApp is "todoist" then
        addTaskToTodoist(taskText)
    else if taskApp is "things" then
        addTaskToThings(taskText)
    else if taskApp is "omnifocus" then
        addTaskToOmniFocus(taskText)
    else
        -- Default to Reminders if no valid app is selected
        addTaskToReminders(taskText)
    end if
end run

on addTaskToReminders(taskText)
    tell application "Reminders"
        -- Make sure Reminders is running
        launch
        -- Try to find the Inbox list, or use the first list as fallback
        set inboxList to null
        try
            set inboxList to list "Inbox"
        on error
            try
                -- Get the first list as a fallback
                set allLists to every list
                if (count of allLists) > 0 then
                    set inboxList to first item of allLists
                end if
            end try
        end try
        
        -- Create the reminder
        if inboxList is not null then
            tell inboxList
                make new reminder with properties {name:taskText}
            end tell
            
            -- Notify the user
            display notification "Task added to Reminders: " & taskText with title "AlfredGTD"
        else
            -- If no suitable list was found
            display notification "Could not find a suitable Reminders list." with title "AlfredGTD Error"
        end if
    end tell
end addTaskToReminders

on addTaskToTodoist(taskText)
    -- This would use Todoist API or app integration
    display notification "Adding to Todoist not implemented yet." with title "AlfredGTD"
end addTaskToTodoist

on addTaskToThings(taskText)
    -- Implementation using Things URL scheme
    set thingsURL to "things:///add?title=" & encodeText(taskText) & "&list=Inbox"
    do shell script "open " & quoted form of thingsURL
    display notification "Task added to Things: " & taskText with title "AlfredGTD"
end addTaskToThings

on addTaskToOmniFocus(taskText)
    -- Implementation using OmniFocus automation
    tell application "OmniFocus"
        tell default document
            set theInbox to inbox
            set theTask to make new inbox task with properties {name:taskText}
        end tell
    end tell
    display notification "Task added to OmniFocus: " & taskText with title "AlfredGTD"
end addTaskToOmniFocus

-- Helper function to URL encode text
on encodeText(theText)
    set theTextEnc to ""
    repeat with eachChar in characters of theText
        set useChar to eachChar
        set eachCharNum to ASCII number of eachChar
        if eachCharNum = 32 then -- space
            set useChar to "+"
        else if (eachCharNum ≥ 48 and eachCharNum ≤ 57) or ¬
            (eachCharNum ≥ 65 and eachCharNum ≤ 90) or ¬
            (eachCharNum ≥ 97 and eachCharNum ≤ 122) then -- 0-9A-Za-z
            set useChar to eachChar
        else
            set useChar to "%" & my toHex(eachCharNum)
        end if
        set theTextEnc to theTextEnc & useChar
    end repeat
    return theTextEnc
end encodeText

-- Helper function to convert to hex
on toHex(theNum)
    set hexChars to "0123456789ABCDEF"
    set theHex to ""
    repeat with i from 0 to 1
        set theInt to theNum div (16 ^ (1 - i)) mod 16 + 1
        set theHex to theHex & character theInt of hexChars
    end repeat
    return theHex
end toHex