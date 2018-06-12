Comment {
	Redlang: https://red-lang.org
	Tutorials: [
		https://dev.to/lepinekong/red-for-hopeless-programmers---part-i-3g0
		https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258
	] 
	Demo-Instruction: {

        - Install Red:
            - Download and install from https://www.red-lang.org/p/download.html
            - or copy and paste this oneliner in Powershell https://gist.github.com/lepinekong/d895d64528ee85e6aac4b13bdf3437bc
            
        - Script can be pasted directly in Redlang Console
        - or without downloading, type in Red console:
            do read https://gist.githubusercontent.com/lepinekong/346c45238ef0a75fb11f3986ed67e0c8/raw/28c9f01cea9fe219f6bb1a66d382443164b6aeba/.system.user.apps.jot.note.red
					
	}
    
	Compile-Instruction: {
        - TODO: coming soon
	}
}

Red [
    Title: ".system.user.apps.jot.note.red"
    Description: {quick note taking app with options to stay always on top and timestamp}
    Github-Url: https://gist.github.com/lepinekong/346c45238ef0a75fb11f3986ed67e0c8
    History: [

        v1.0: [ 
            .url: https://gist.githubusercontent.com/lepinekong/346c45238ef0a75fb11f3986ed67e0c8/raw/fec7f096f5f75c00159ccbbb6b97514d38a60ad3/.system.user.apps.jot.note.red
            .description: {

                ### this version 
                - allows user to resize/maximize window

                ### TODO: 
                - option to ask confirmation for save on close
            }
        ]        
        v0.9: [ 
            .url: https://gist.githubusercontent.com/lepinekong/346c45238ef0a75fb11f3986ed67e0c8/raw/fec7f096f5f75c00159ccbbb6b97514d38a60ad3/.system.user.apps.jot.note.red
            .description: {initial version

                ### which supports: 
                - topmost window (by default or use Jot/no-topmost)
                - timestamp (by default or use Jot/no-timestamp)
                - save on close

                ### TODO: 
                - allow user to resize/maximize window
                - option to ask confirmation for save on close
            }
        ]
    ]
    Flowchart: [
        Main: [
            Jot -> Jot-already-launched? [
                Yes: [Set-Jot-to-Foreground -> Jot-Launched] 
                No: [Launch-Jot -> load-note-file -> Jot-Launched] 
            ]
        ]

        Jot-Launched: [
            Click-Save?: [Save-note-file -> Jot-Launched]
            Date-Stamp?: [Append-Date-Stamp -> Jot-Launched]
            Close?: [Save-note-file -> End]
        ]
    ]
]

;===========================================================================================
; PREAMBLE
;===========================================================================================

;self script path

script-path: system/options/script


;library
set-topmost: function [.hwnd-file /show][ ; uses win32 API

    command: {function Set-TopMost($handle) {$FnDef = '[DllImport("user32.dll")] public static extern bool SetWindowPos(int hWnd, int hAfter, int x, int y, int cx, int cy, uint Flags);';$user32 = Add-Type -MemberDefinition $FnDef -Name 'User32' -Namespace 'Win32' -PassThru;$user32::SetWindowPos($handle, -1, 0,0,0,0, 3)};Add-Type  'using System;using System.Runtime.InteropServices;using System.Text; public class APIFuncs {[DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]public static extern int GetWindowText(IntPtr hwnd,StringBuilder lpString, int cch);[DllImport("user32.dll", SetLastError=true, CharSet=CharSet.Auto)] public static extern IntPtr GetForegroundWindow();[DllImport("user32.dll", SetLastError=true, CharSet=CharSet.Auto)] public static extern Int32 GetWindowThreadProcessId(IntPtr hWnd,out Int32 lpdwProcessId);[DllImport("user32.dll", SetLastError=true, CharSet=CharSet.Auto)] public static extern Int32 GetWindowTextLength(IntPtr hWnd);}';while(1){$w = [apifuncs]::GetForegroundWindow();Write-Host $w.toString();$len = [apifuncs]::GetWindowTextLength($w);$sb = New-Object text.stringbuilder -ArgumentList ($len + 1);$rtnlen = [apifuncs]::GetWindowText($w,$sb,$sb.Capacity);write-host "Window Title: $($sb.tostring())";$windowTitle=$sb.tostring();if ($windowTitle -eq "Jot Note:") {Set-TopMost($w);$w.toString() | Out-File -filepath  ".hwnd-file" -Encoding "UTF8";exit};sleep 1}}
    replace/all command {"} {\"}
    replace command ".hwnd-file" (to-local-file .hwnd-file)
    powershell-command: rejoin [{powershell -command} { } {"} command {"}]
    
    either show [
        call/show powershell-command ; if non gui console otherwise doesn't seem to work
    ][
        call powershell-command ; if gui console otherwise show ugly powershell console
    ]
]

set-active-window: function[.hwnd][

    command: {$sig = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);[DllImport("user32.dll")]  public static extern int SetForegroundWindow(IntPtr hwnd);';if ($Maximize) { $Mode = 3 } else { $Mode = 4 };$type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru;$hwnd = .hwnd;$null = $type::ShowWindowAsync($hwnd, $Mode);$null = $type::SetForegroundWindow($hwnd)}
    replace/all command {"} {\"}
    replace command ".hwnd" .hwnd
    powershell-command: rejoin [{powershell -command} { } {"} command {"}] 
    call powershell-command
]

window-opened?: function[.window-title][

    out: copy ""
    call/output {powershell -command "Get-Process | Where-Object {$_.MainWindowTitle -ne \"\"} | Select-Object MainWindowTitle"} out
    if find out .window-title [
        return true
    ]
    return false

]

;===========================================================================================
; PROGRAM
;===========================================================================================

.app.jot.note: function [ /no-topmost /no-timestamp  /local static-path 
/extern note-file event-handler text-area resized-window resized-window-width; extern necessary when using view/no-wait
][

    ; this is to memorize the path of the script as Red has no way to know it :(
    ; as in some context the path is not always the current dir nor .system/options/script
    static-path: [] 
    ; initialization
    if empty? static-path [

        if error? try [
            append static-path split-path .system/context/script ; context execution is within the .system 
        ][
            either system/options/script [
                append static-path split-path system/options/script ; context execution is script standalone
            ][
                ; system/options/script = none if code pasted in console
                append static-path compose [ (what-dir) none ]
            ]
        ]
    ]    

    hwnd-file: rejoin [static-path/1 %hwnd.txt] ; for passing back hwnd to Win32
    note-file: rejoin [static-path/1 %note.txt] ; for saving note file

    if window-opened? "Jot Note:" [
        ; if Jot launched already, Set Jot to Foreground
        if (exists? hwnd-file) [ ; hwnd file has been created to store Win32 window handle when Set-Topmost is called
            hwnd: read hwnd-file ; have to read from a file as a layman's way to do interop
            set-active-window hwnd ; Set Jot to Foreground calling win32 
            return false ; false means not created            
        ]
    ]

    Title: "Jot Note:" ; title of window bar
    Area-Size: 270x700 ; vertical jot note
    note: copy rejoin ["# " now/date " " now/time ] ; date stamp
    append note newline append note newline ; for nicer formatting

    if (exists? note-file) [ ; first time note-file doesn't exist
        note: read note-file
        
        unless (note = "") [ append note newline]
        unless no-timestamp [
            append note rejoin ["# " now/date " " now/time ]
            append note newline append note newline
        ]
    ]

    on-events: func [face event /local static-counter] compose [ 

        case [
            'close = event/type [
                write note-file text-area/text
                remove-event-func :event-handler
                return none                
            ]

            'resize = event/type [

                static-counter: []; to fix a weird behavior in resize first time in some context (.system context)

                either empty? static-counter [
                    append static-counter 0
                ][
                    static-counter/1: static-counter/1 + 1  
                    unless ((value? '.system) and (static-counter/1 = 1)) [ ; to fix a weird behavior in resize first time in some context
                        resized-window: event/window
                        resized-window-width: first resized-window/size
                        text-area/size: to-pair rejoin [ (resized-window-width - 20) "x" (second text-area/size)]
                    ]
                ]

            ]            
        ]
        return event   
    ]    

    win: copy[]
    
    append win compose/deep [
        title (Title)
        text-area: area (Area-Size) note
        return
        button "save" [
            write note-file text-area/text
            print "saved"
        ]
        button "DateStamp" [
            text-area/text: rejoin [text-area/text "# " now/date " " now/time newline newline]
        ]

        do [ event-handler: insert-event-func :on-events ]
    ] 

    either (system/console = none) [ 
        ; for compiled version (no console)
        unless no-topmost [set-topmost/show hwnd-file]
        view/flags win ['resize]
    ][ 
        either system/console/gui? [
            ; for interpreted version with gui console
            unless no-topmost [set-topmost hwnd-file]
            view/flags/no-wait win ['resize]
        ][
            ; for interpreted version with non-gui console (vscode)
            unless no-topmost [set-topmost/show hwnd-file]  
            view/flags win ['resize]
        ]

    ]    

]

Jot-Note: :.app.jot.note ; alias
Jot: :.app.jot.note ; alias
Note: :.app.jot.note ; alias

if not value? '.system [
    Jot
]




