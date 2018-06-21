Red [
    Title: "Web Screenshot"
    Description: {Take Web Screenshot by command line (just requires latest Google Chrome installed)}
    Platforms: [
        Windows: yes
        Mac: TOTEST
        Linux: TOTEST
    ]
    Build: 0.0.0.1
    History: [
        0.0.0.1 {Initial version}
    ]
    References: [
        http://mycodesnippets.space/headlesschrome/take-screenshot {
            call {"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"  --screenshot=C:\rebol\.system\test\test.png http://miniapps.red/ --headless --disable-gpu"}
        }
    ]
]

do read http://redlang.red/web-screenshot
do read http://redlang.red/file-io.red
do read http://redlang.red/expand-string.red

; .web-screenshot: function[>Url >Output-folder >Output-file /no-wait][

;     Url: >Url ; http://miniapps.red/
;     Output-folder: >Output-folder ; {C:\rebol\.system\test\} 
;     Output-file: >Output-file ; %test-new.png 

;     if not exists? red-output-folder: to-red-file Output-folder [
;         make-dir/deep red-output-folder
;     ]    

;     ; call {"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"  
;     ; --screenshot=C:\rebol\.system\test\test-new.png http://miniapps.red/ 
;     ; --headless --disable-gpu"}

;     command: .expand-string {<%Chrome%> --screenshot=<%Output-folder%><%Output-file%> <%Url%> --headless --disable-gpu} [
;         Chrome: {"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"}
;         Url: >Url ; http://miniapps.red/
;         Output-folder: >Output-folder ; {C:\rebol\.system\test\} 
;         Output-file: >Output-file ; %test-new.png        
;     ]

;     ?? command

;     either no-wait [
;         call command
;     ][
;         call/wait command
;     ]
; ]

; Web-Screenshot: :.web-screenshot

fld-size: make pair! compose [400 24]

win: compose/deep [
    title "Web Screenshot"
    text "url" fld-Url: field (fld-size) btn-Go: button "Go" [
        .url: fld-url/data
        .folder: fld-folder/data
        .filename: fld-filename/data
        either exists? to-red-file Web-Screenshot .url .folder .filename [
            print "ok!"
        ][
            print "error!"
        ]
        ;image/data: load to-red-file rejoin [.folder .filename]
    ]
    return
    text "folder" fld-folder: field  (fld-size) button "Select" []
    return
    text "file name" fld-filename: field  (fld-size) button "Save" []
    return
    img: image 0x0; (load to-red-file "C:\rebol\.system\test\test-new.png")
    return

    do [
        fld-url/data: http://google.com
        target-folder: clean-path rejoin [%./screenshot/]
        fld-folder/data: to-local-file target-folder
        fld-filename/data: %google.png
    ]
]

either (system/console = none) [ 
    ; for compiled version (no console)
    view/flags win ['resize]
][ 
    either system/console/gui? [
        ; for interpreted version with gui console
        view/flags/no-wait win ['resize]
    ][
        ; for interpreted version with non-gui console (vscode) 
        view/flags win ['resize]
    ]

] 

