Red [
    Title: "voice.1.red"
    Builds: [
        0.0.0.1.3 {Demo changed}
        0.0.0.1.2 {/no-print-by-default}
        0.0.0.1.1 {Initial version}
    ]
]

user.app.speak:  function[.message [word! string!] /no-print-by-default /print
][

    if (.message = "from-clipboard") [
        .message: read clipboard
    ]

    CONFIG_NO_PRINT_BY_DEFAULT: []
    if no-print-by-default [
        if empty? CONFIG_NO_PRINT_BY_DEFAULT [
            append CONFIG_NO_PRINT_BY_DEFAULT true
        ]
    ]

    either empty? CONFIG_NO_PRINT_BY_DEFAULT [
        no-print-by-default?: false
    ][
        no-print-by-default?: CONFIG_NO_PRINT_BY_DEFAULT/1
    ]

    DEFAULT_RATE: 0
    ;-------------------------------------------------
    .rate: DEFAULT_RATE
    ;-------------------------------------------------
    message: replace/all .message "“" "" ; Cortana doesn't recognize "“"
    message: replace/all .message "”" "" ; Cortana doesn't recognize "”"
    rate: .rate
    ;-------------------------------------------------

    if not value? '.to-powershell [
        do https://redlang.red/to-powershell
    ]

    template: .to-powershell [ 
        {Add-Type -AssemblyName System.speech}
        {$speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer}
        {$speaker.rate=<%rate%>}
        {$Speaker.Speak("<%message%>")}        
    ]

    if not value? '.string.expand [
        do https://redlang.red/string-expand
    ]

    powershell-command: .string.expand template [ 
        message: (message)
        rate: (rate)
    ]
    
    if not value? '.refresh-screen [
        do https://redlang.red/refresh-screen
    ]
    .refresh-screen

    unless no-print-by-default? [
        system/words/print .message ; since print is used as refinement one should call system/words/print
        .refresh-screen ; defined in library as .do-events/no-wait  
    ]

    if print [
        system/words/print .message ; since print is used as refinement one should call system/words/print
        .refresh-screen ; defined in library as .do-events/no-wait
    ]

    call/wait powershell-command ; /wait waits for speak to finish sentence  
]

speak: :user.app.speak; speak is clone of user.app.speak method
say: :user.app.speak

demo: does [
    msg: {Hello, I'm Marc, a natural voice for Windows 10. Type say and the sentence you want me to speech.
    If you want me to read from the clipboard type "say from-clipboard".
    }

    ; say/print msg ; /print is a refinement for printing message before speaking
    ; ; it's shortcut for {print msg .refresh-screen speak msg .refresh-screen}

    ; msg: {Note that you can change the DEFAULT RATE of speed in program. 0 is normal speed, 1 is faster.}
    ; say/print msg

    ; msg: "Now, try: paste something to say in clipboard, Press a key when done..."
    ; say/print msg
    ; ask "Press a key when done..."

    ; msg: read-clipboard
    ; say/print msg

    ; print {you can type command "speak/print read-clipboard" at any time}
]

demo