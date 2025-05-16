-- AlfredGTD: Helper Functions
-- Common functions used throughout the workflow

-- Parse a date from natural language
on parseDate(dateString)
    set theDate to current date
    set dateString to dateString as string
    
    -- Simple date parsing for common formats
    if dateString contains "tomorrow" then
        set theDate to theDate + (1 * days)
    else if dateString contains "next week" then
        set theDate to theDate + (7 * days)
    else if dateString contains "next month" then
        set theDate to theDate + (30 * days)
    else if dateString contains "today" then
        -- Keep today's date
    end if
    
    return theDate
end parseDate

-- Extract any dates or contexts from task text
on extractMetadata(taskText)
    set metadata to {taskText:taskText, date:missing value, context:missing value}
    
    -- Look for date patterns like @tomorrow, @nextweek
    if taskText contains "@" then
        set atParts to my splitText(taskText, "@")
        if (count of atParts) > 1 then
            set dateOrContext to item 2 of atParts
            if dateOrContext contains " " then
                set dateOrContext to first word of dateOrContext
            end if
            
            -- Check if it's a date term
            if dateOrContext is in {"today", "tomorrow", "nextweek", "nextmonth"} then
                set metadata's date to my parseDate(dateOrContext)
                set metadata's taskText to my replaceText(taskText, "@" & dateOrContext, "")
            else
                -- Assume it's a context
                set metadata's context to dateOrContext
                set metadata's taskText to my replaceText(taskText, "@" & dateOrContext, "")
            end if
        end if
    end if
    
    -- Look for #project tag
    if taskText contains "#" then
        set hashParts to my splitText(taskText, "#")
        if (count of hashParts) > 1 then
            set projectName to item 2 of hashParts
            if projectName contains " " then
                set projectName to first word of projectName
            end if
            
            set metadata's project to projectName
            set metadata's taskText to my replaceText(taskText, "#" & projectName, "")
        end if
    end if
    
    -- Clean up extra whitespace
    set metadata's taskText to my trimText(metadata's taskText)
    
    return metadata
end extractMetadata

-- Trim whitespace from text
on trimText(theText)
    set theText to do shell script "echo " & quoted form of theText & " | sed 's/^[ \t]*//;s/[ \t]*$//'"
    return theText
end trimText

-- Split text by delimiter
on splitText(theText, theDelimiter)
    set AppleScript's text item delimiters to theDelimiter
    set theTextItems to every text item of theText
    set AppleScript's text item delimiters to ""
    return theTextItems
end splitText

-- Replace text in a string
on replaceText(theText, searchText, replacementText)
    set AppleScript's text item delimiters to searchText
    set theTextItems to every text item of theText
    set AppleScript's text item delimiters to replacementText
    set theText to theTextItems as string
    set AppleScript's text item delimiters to ""
    return theText
end replaceText

-- Load configuration
on loadConfig()
    -- We'd normally call the JavaScript config script here,
    -- but for simplicity we'll just return a hardcoded config
    set config to {taskApp:"reminders", noteApp:"notes", projectApp:"reminders"}
    return config
end loadConfig