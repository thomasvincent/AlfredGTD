-- AlfredGTD: Process Inbox Script
-- This script guides the user through processing their GTD inbox

on run
    -- Configuration (this could be moved to a separate config file)
    -- Possible values: "reminders", "things", "omnifocus", "todoist"
    set taskApp to "reminders" 
    
    if taskApp is "reminders" then
        processRemindersInbox()
    else if taskApp is "things" then
        processThingsInbox()
    else if taskApp is "omnifocus" then
        processOmniFocusInbox()
    else if taskApp is "todoist" then
        processTodoistInbox()
    else
        -- Default to Reminders if no valid app is selected
        processRemindersInbox()
    end if
end run

on processRemindersInbox()
    -- Simply open Reminders app to the Inbox list
    tell application "Reminders"
        activate
        -- Try to select the Inbox list
        try
            set selectedList to list "Inbox"
            set list view selection to {selectedList}
        end try
    end tell
    
    -- Show GTD processing guide in a dialog
    set processingSteps to "GTD Inbox Processing:\n\n1. Review each item one by one\n2. For each item, ask:\n   - What is it?\n   - Is it actionable?\n   \n3. If NOT actionable:\n   - Trash it, or\n   - File as reference, or\n   - Add to Someday/Maybe list\n   \n4. If actionable:\n   - Do it now (if < 2 minutes)\n   - Delegate it (add to Waiting For list)\n   - Defer it (add to calendar)\n   - Add to appropriate project or context list"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processRemindersInbox

on processThingsInbox()
    -- Open Things to its Inbox
    do shell script "open things:///inbox"
    
    -- Show GTD processing guide in a dialog
    set processingSteps to "GTD Inbox Processing:\n\n1. Review each item one by one\n2. For each item, ask:\n   - What is it?\n   - Is it actionable?\n   \n3. If NOT actionable:\n   - Trash it, or\n   - File as reference, or\n   - Add to Someday/Maybe list\n   \n4. If actionable:\n   - Do it now (if < 2 minutes)\n   - Delegate it (add to Waiting For list)\n   - Defer it (add to calendar)\n   - Add to appropriate project or area"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processThingsInbox

on processOmniFocusInbox()
    -- Open OmniFocus to its Inbox
    tell application "OmniFocus"
        activate
        tell default document
            set perspective name to "Inbox"
        end tell
    end tell
    
    -- Show GTD processing guide in a dialog
    set processingSteps to "GTD Inbox Processing:\n\n1. Review each item one by one\n2. For each item, ask:\n   - What is it?\n   - Is it actionable?\n   \n3. If NOT actionable:\n   - Trash it, or\n   - File as reference, or\n   - Add to Someday/Maybe list\n   \n4. If actionable:\n   - Do it now (if < 2 minutes)\n   - Delegate it (assign and defer)\n   - Defer it (add to calendar)\n   - Add to appropriate project or context"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processOmniFocusInbox

on processTodoistInbox()
    -- Open Todoist to its Inbox (using web URL as fallback)
    do shell script "open https://todoist.com/app/inbox"
    
    -- Show GTD processing guide in a dialog
    set processingSteps to "GTD Inbox Processing:\n\n1. Review each item one by one\n2. For each item, ask:\n   - What is it?\n   - Is it actionable?\n   \n3. If NOT actionable:\n   - Trash it, or\n   - File as reference, or\n   - Add to Someday/Maybe list\n   \n4. If actionable:\n   - Do it now (if < 2 minutes)\n   - Delegate it (assign)\n   - Defer it (schedule)\n   - Add to appropriate project or label"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processTodoistInbox