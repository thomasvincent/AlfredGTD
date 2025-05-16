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
    set processingSteps to "GTD Inbox Processing:
    
1. Review each item one by one
2. For each item, ask:
   - What is it?
   - Is it actionable?
   
3. If NOT actionable:
   - Trash it, or
   - File as reference, or
   - Add to Someday/Maybe list
   
4. If actionable:
   - Do it now (if < 2 minutes)
   - Delegate it (add to Waiting For list)
   - Defer it (add to calendar)
   - Add to appropriate project or context list"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processRemindersInbox

on processThingsInbox()
    -- Open Things to its Inbox
    do shell script "open things:///inbox"
    
    -- Show GTD processing guide in a dialog
    set processingSteps to "GTD Inbox Processing:
    
1. Review each item one by one
2. For each item, ask:
   - What is it?
   - Is it actionable?
   
3. If NOT actionable:
   - Trash it, or
   - File as reference, or
   - Add to Someday/Maybe list
   
4. If actionable:
   - Do it now (if < 2 minutes)
   - Delegate it (add to Waiting For list)
   - Defer it (add to calendar)
   - Add to appropriate project or area"
    
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
    set processingSteps to "GTD Inbox Processing:
    
1. Review each item one by one
2. For each item, ask:
   - What is it?
   - Is it actionable?
   
3. If NOT actionable:
   - Trash it, or
   - File as reference, or
   - Add to Someday/Maybe list
   
4. If actionable:
   - Do it now (if < 2 minutes)
   - Delegate it (assign and defer)
   - Defer it (add to calendar)
   - Add to appropriate project or context"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processOmniFocusInbox

on processTodoistInbox()
    -- Open Todoist to its Inbox (using web URL as fallback)
    do shell script "open https://todoist.com/app/inbox"
    
    -- Show GTD processing guide in a dialog
    set processingSteps to "GTD Inbox Processing:
    
1. Review each item one by one
2. For each item, ask:
   - What is it?
   - Is it actionable?
   
3. If NOT actionable:
   - Trash it, or
   - File as reference, or
   - Add to Someday/Maybe list
   
4. If actionable:
   - Do it now (if < 2 minutes)
   - Delegate it (assign)
   - Defer it (schedule)
   - Add to appropriate project or label"
    
    display dialog processingSteps buttons {"OK"} default button "OK" with title "AlfredGTD: Process Inbox"
end processTodoistInbox