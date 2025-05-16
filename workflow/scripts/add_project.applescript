-- AlfredGTD: Add Project Script
-- This script adds a new project to your GTD system

on run argv
    set projectName to item 1 of argv
    
    -- Exit if the user didn't enter anything
    if projectName is "" then
        display notification "No text entered. Project not created." with title "AlfredGTD"
        return
    end if
    
    -- Configuration (this could be moved to a separate config file)
    -- Possible values: "reminders", "things", "omnifocus", "todoist"
    set projectApp to "reminders" 
    
    if projectApp is "reminders" then
        addProjectToReminders(projectName)
    else if projectApp is "things" then
        addProjectToThings(projectName)
    else if projectApp is "omnifocus" then
        addProjectToOmniFocus(projectName)
    else if projectApp is "todoist" then
        addProjectToTodoist(projectName)
    else
        -- Default to Reminders if no valid app is selected
        addProjectToReminders(projectName)
    end if
end run

on addProjectToReminders(projectName)
    tell application "Reminders"
        -- In Reminders, a project is essentially a list
        -- Create a new list with the project name
        make new list with properties {name:projectName}
        
        -- Notify the user
        display notification "Project created in Reminders: " & projectName with title "AlfredGTD"
    end tell
end addProjectToReminders

on addProjectToThings(projectName)
    -- Implementation using Things URL scheme
    set thingsURL to "things:///add-project?title=" & encodeText(projectName)
    do shell script "open " & quoted form of thingsURL
    display notification "Project added to Things: " & projectName with title "AlfredGTD"
end addProjectToThings

on addProjectToOmniFocus(projectName)
    -- Implementation using OmniFocus automation
    tell application "OmniFocus"
        tell default document
            set theFolder to folder "Projects" -- Adjust this to your preferred folder
            tell theFolder
                make new project with properties {name:projectName}
            end tell
        end tell
    end tell
    display notification "Project added to OmniFocus: " & projectName with title "AlfredGTD"
end addProjectToOmniFocus

on addProjectToTodoist(projectName)
    -- This would use Todoist API or app integration
    display notification "Adding project to Todoist not implemented yet." with title "AlfredGTD"
end addProjectToTodoist

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