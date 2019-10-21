# Ponylang extension README

This extension provides basic support for Pony language in vscode.

## Features

* Syntax highlighting (based on grammar definition from https://github.com/ponylang/sublime-pony)

* Problem matcher, which utilizes ponyc output to highlight errors in editor

## Example build task

In order to utilize problem matcher, you have to declare it in your tasks.json. See example below:
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build debug",
            "group": "build",
            "type": "shell",
            "options": {
                "cwd": "${fileDirname}",
            },
            "command": "ponyc --debug -o bin",
            "problemMatcher": "$ponyc-matcher"
        }
    ]
}
```

## Release Notes

### 0.1.0 (02.10.2019)

Initial release





