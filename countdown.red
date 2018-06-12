Comment {

Redlang: https://red-lang.org
Tutorials: [
    https://dev.to/lepinekong/red-for-hopeless-programmers---part-i-3g0
    https://dev.to/lepinekong/red-for-hopeless-programmers---part-ii-258
] 

Demo-Instruction: {
    - Script below Red^[^] can be pasted directly in Redlang Console (1 Mb download https://www.red-lang.org/p/download.html) 

    - if you just want to see demo without downloading, type in Red console:

        do read https://gist.githubusercontent.com/lepinekong/08021f2b8ecdd3e0dc09685ef0b0c03f/raw/c7b41adc9a3815f77c4bca815af35b598f920bc1/.system.user.apps.countdown.red
        Countdown 00:25:00 Pomodoro
    - If you want to execute locally instead of :
        do .system.user.apps.countdown.red
    rather execute:
        do read .system.user.apps.countdown.red ; otherwise Red doesn't like comment above Red^[^] header
}

}

Red [

    Title: ".system.user.apps.countdown.red"
    Description: "Countdown with Voice alert on Windows (to adapt for Linux and MacOS)"
    History: {
        - [x][1.0]. Countdown with optional duration parameter (default is one minute)
        - [x][1.1]. Countdown with optional title (see Pomodoro Usage example below)
        - [x][1.2]. Don't need to remove /no-wait manually any more for compiled version
        - [ ][1.x]. More features coming depending... on my moods :) (autostart, pre-register frequent timers,...)
    }
    Usage: {
        Countdown ; 1 min countdown by default
        Countdown 0:03:00 ; 3 min perfect boiled egg
        Countdown 0:25:00 Pomodoro; Pomodoro title (use "" if any space)
    }
    Needs: 'View ; not needed for interpreter in Red console (only for compiler)
    
]

if not value? '.speak [
    .speak: function[message [string!]][
        Command: rejoin [{(New-Object –ComObject SAPI.SPVoice).Speak("} message {")}]
        replace/all Command {"} {\"}
        call cmd: rejoin ["powershell -command " {"} Command {"}]
    ]
]

Countdown: function['.duration [time! unset!] '.title [word! string! unset!]][
    
    <=default-duration: 0:01 ; 1 min duration by default
    switch/default type?/word get/any '.duration [
        time! [
            <=duration: .duration ; I use <= prefix convention to tag external variables inputs
        ]
    ][
        <=duration: <=default-duration
    ]

    <=refresh-rate: 10

    switch/default type?/word get/any '.title [
    unset! [
        <=title: "Countdown"
    ]

    word! string! [
        <=title: form .title
    ]
    ][
        throw error 'script 'expect-arg .title
    ]
    
    clock: Make object! [

        ; below is just my very own convention
        ; in case you believe it's some Redlang special idioms
        ; local variables <= external variables
        duration: <=duration
        refresh-rate: <=refresh-rate
        title: <=title

        text-duration: to-string duration
        text-duration-to-speak: copy ""
        either (duration/minute > 0) [
            text-duration-to-speak: rejoin [duration/minute " minutes "]
            either (duration/second > 0) [
                text-duration-to-speak: rejoin [text-duration-to-speak " and " duration/second " seconds elapsed"]
            ][
                text-duration-to-speak: rejoin [text-duration-to-speak " elapsed"]
            ]
        ][
            text-duration-to-speak: rejoin [duration/second " seconds elapsed"]
        ]

        t:  start-time: diff: rest: minutes: seconds: pause-time: pause-duration: 0
        b1: b2: none ; for buttons start/stop pause/continue

        window: compose [ ; compose will evaluate expressions in ()
            title (title)
            ; example t: text "00:25:00"
            t: text (text-duration) on-time [
                diff: difference now start-time 
                rest: (duration) - diff
                minutes: pad/left/with (rest/minute) 2 #"0" 
                seconds: pad/left/with (round/to rest/second 1) 2 #"0" 
                t/text: rejoin [minutes ":" seconds]
                if (rest < 0:0:0) [
                    t/rate: none t/text: "00:00" b1/text: "Start"
                    .speak (text-duration-to-speak)
                ]
            ]
            b1: button "start" [
                either b1/text = "Start" [ 
                    b1/text: "Stop" t/rate: (refresh-rate) start-time: now
                ][
                    b1/text: "Start" t/rate: none t/text: (text-duration)
                ]                
            ]
            b2: button "pause" [
                either (b2/text = "Pause") [
                    b2/text: "Continue" t/rate: none
                    pause-time: now
                ][  
                    pause-duration: difference now pause-time
                    start-time: start-time + pause-duration
                    b2/text: "Pause" t/rate: (refresh-rate)
                ] 
            ]
        ]

        either (system/console = none) [
            view window
        ][
            view/no-wait window
        ]

        print rejoin ["Running Countdown..."]

    ]
]

if (system/console = none) [; for compiled version
    Countdown 00:25:00 "Pomodoro"; 
    ;Countdown 00:03:00 ; for perfect boiled egg :)
    ;Countdown ; if you're lazy (coming default duration configuration)
]

Pomodoro: function [][
    Countdown 00:25:00 "Pomodoro";
]

if not value? '.system [
    print {
        Command examples:
        - Countdown ; 1 min by default
        - Countdown 00:25:00
        - Countdown 00:25:00 "Pomodoro"
        - Pomodoro
    }
]
