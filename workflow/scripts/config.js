#!/usr/bin/env osascript -l JavaScript

// AlfredGTD Configuration Manager
// Used to read and write workflow configuration

function run(argv) {
    try {
        // Load configuration
        const configPath = ObjC.unwrap($.NSString.stringWithString('config.json')).stringByStandardizingPath;
        const fm = $.NSFileManager.defaultManager;
        
        // Get script's directory
        const scriptPath = $.NSString.stringWithString($.NSProcessInfo.processInfo.environment.objectForKey('PWD')).stringByStandardizingPath;
        const fullConfigPath = scriptPath + '/' + configPath;
        
        // Check if config file exists
        if (!fm.fileExistsAtPath(fullConfigPath)) {
            return JSON.stringify({
                error: "Configuration file not found at " + fullConfigPath
            });
        }
        
        // Read config file
        const configData = $.NSData.dataWithContentsOfFile(fullConfigPath);
        const configStr = $.NSString.alloc.initWithDataEncoding(configData, $.NSUTF8StringEncoding);
        
        // Parse JSON
        const config = JSON.parse(ObjC.unwrap(configStr));
        
        // Handle different commands
        const command = argv[0] || "get";
        
        if (command === "get") {
            // Return entire config or specific setting
            if (argv.length > 1) {
                const key = argv[1];
                const value = key.split('.').reduce((obj, prop) => obj && obj[prop], config);
                return JSON.stringify({
                    key: key,
                    value: value
                });
            } else {
                return JSON.stringify(config);
            }
        } else if (command === "set") {
            // Set a specific setting
            if (argv.length < 3) {
                return JSON.stringify({
                    error: "Set command requires key and value parameters"
                });
            }
            
            const key = argv[1];
            const value = argv[2];
            
            // Parse value as JSON if possible
            let parsedValue;
            try {
                parsedValue = JSON.parse(value);
            } catch (e) {
                parsedValue = value;
            }
            
            // Set nested property
            const props = key.split('.');
            const lastProp = props.pop();
            const obj = props.reduce((obj, prop) => obj[prop] = obj[prop] || {}, config);
            obj[lastProp] = parsedValue;
            
            // Write updated config back to file
            const updatedConfigStr = $.NSString.stringWithString(JSON.stringify(config, null, 2));
            updatedConfigStr.writeToFileAtomicallyEncodingError(fullConfigPath, true, $.NSUTF8StringEncoding, null);
            
            return JSON.stringify({
                success: true,
                message: `Updated ${key} to ${value}`
            });
        }
        
        return JSON.stringify({
            error: "Unknown command: " + command
        });
        
    } catch (error) {
        return JSON.stringify({
            error: error.message
        });
    }
}