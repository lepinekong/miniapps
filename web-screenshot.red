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

do read http://redlang.red/web-screenshot ; requires google chrome installed in usual directory

fld-size: make pair! compose [400 24]

win: compose/deep [
    title "Web Screenshot"
    text "url" fld-Url: field (fld-size) btn-Go: button "Go" [
        .url: fld-url/data
        .folder: fld-folder/data
        .filename: fld-filename/data
        either exists? img-file: .Web-Screenshot .url .folder .filename [
            print to-local-file img-file
            img/data: load img-file
            img/size: 400x400
        ][print "error!"]
    ]
    return
    text "folder" fld-folder: field  (fld-size) button "Select" [] return
    text "file name" fld-filename: field  (fld-size) button "Save" [] return
    img: image 0x0; (load to-red-file "C:\rebol\.system\test\test-new.png") return

    do [
        fld-url/data: http://miniapps.red
        target-folder: clean-path rejoin [%./screenshot/]
        fld-folder/data: to-local-file target-folder
        fld-filename/data: %miniapps.png
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

