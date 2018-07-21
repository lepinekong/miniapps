Red [
    Title: "screenshot.1.red"
    Build: [0.0.0.1.1 {Initial version}]
]

do https://redlang.red/chrome/take-screenshot.red

system/lexer/pre-load: func [src part][
    parse src [
        any [
            s: [
                ["take-screenshot:" | "take-screenshot." | "Usage: take-screenshot" | "sysTake-Screenshot" | ":take-screenshot"] 
            ] skip
            |
            s: [
                [   [
                        "take-screenshot" | "make-screenshot"
                        |
                        ["takescreenshot" | 
                        ["take" | "make" | "do" | "create"] 
                        some space ["a" some space |] ["web" any space |]
                        "screen" any space "shot"
                        ]
                        | "shoot"
                        | "screenshot" 
                        | "screencopy" 
                        | "webscreenshot" 
                    ] [ some space "of" | ]  some space copy arg1 to some space 
                    [ some space "in" some space | some space "to" some space | some space ] 
                    copy arg2 [to newline | to end ]
                ] (new: rejoin ["take-screenshot" { } arg1 { } arg2] )
            ] e: (s: change/part s new e) :s            
            | skip
        ]
    ]
]

; do {take-screenshot https://google.com c:\test\test.png} ; ok
; do {take-screenshot of https://google.com in c:\test\test.png} ; ok
; do {take screenshot https://google.com c:\test\test.png} ; ok
; do {take screenshot of https://google.com in c:\test\test.png} ; ok
; do {take webscreenshot of https://google.com in c:\test\test.png} ; ok
; do {take web screenshot of https://google.com in c:\test\test.png} ; ok
