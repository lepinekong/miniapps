Red [
    Title: "Quiz"
    Description: {Take Web Screenshot by command line (just requires latest Google Chrome installed)}
    Platforms: [
        Windows: yes
        Mac: TOTEST
        Linux: TOTEST
    ]
    Build: 0.0.0.2
    History: [
        0.0.0.1 {Initial version}
        0.0.0.2 {D: Adding Answers Panel}
    ]
    References: [
        https://twitter.com/Jamal7x7Jamal/status/1008269417124331520
        https://pbs.twimg.com/media/Df4XIenXkAAhZRo.jpg:large
    ]
]

.center-rectangle: function[>position >parent-rectangle-size][

]

Title: "Quiz App"
font-title: make font! [ name: "Arial" ]

Quiz-title: "Quiz on Programming"
font-quiz-title: make font! [ name: "Arial" ]

Question: "What is the size of Red?"
font-question-label: make font! [ name: "Arial" size: 13 color: white]

font-letter: make font! [ name: "Arial" size: 18]
font-answer: make font! [ name: "Arial" size: 18 color: white]

darkest-blue: 1.23.64
lightest-blue: 104.172.248
lightest-magenta: 170.164.234

light-blue: 88.160.244
light-magenta: 153.152.232

base-size: 1024x728

bigRect-pos1: 0x0
bigRect-pos2: base-size

dark-blue: 6.38.89
darker-blue: 5.35.85

blue-highlight: 86.152.233

win: compose/deep [

    title (title)
    
    origin 0x0 space 0x0

    base (base-size)

    draw [

        pen off ; will remove black border for shapes

        ;----------------------------------------------
        fill-pen (darkest-blue) 
        box (bigRect-pos1) (bigRect-pos2)

        fill-pen (lightest-blue) 
        box 227x148 287x258

        fill-pen linear (light-blue) (light-magenta) 0x0 800x0
        box 286x148 792x258

        fill-pen (lightest-magenta)
        box 732x148 793x258
        ;----------------------------------------------
        ; External Rectangles
        ;----------------------------------------------

        font font-letter 

        fill-pen (darker-blue) 
        box 227x258 287x418
        text 248x320 "A"

        fill-pen (darker-blue) 
        box 732x258 793x418 
        text 756x320 "B"   

        fill-pen (darker-blue) 
        box 732x418 793x578
        text 756x480 "C"   

        fill-pen (blue-highlight)
        box 227x418 287x578
        text 248x480 "D"        

        ;----------------------------------------------
        ; Inner Rectangles
        ;----------------------------------------------
        
        fill-pen (dark-blue) 
        box 287x258 512x418 

        fill-pen (dark-blue) 
        box 512x258 732x418   

        fill-pen (dark-blue) 
        box 512x418 732x578 

        ;fill-pen radial (150.122.189) (84.162.253)
        ;I want center at 511x417 but this doesn't work
        ;fill-pen linear (84.162.253) (150.122.189)
        pen off fill-pen linear 150.122.189 84.162.253 200x0 -50x165
        box 287x418 512x578                 

        ;----------------------------------------------
        pen (1.30.80)
        line-width 2
        line 227x418 793x418
        line 512x258 512x578
        ;----------------------------------------------

        fill-pen linear (150.122.189) (84.162.253) 
        pen off
        circle 511x420 50

        fill-pen (black) ; what's the matter:
        circle 511x420 47 ; can't see this circle ?

        ;----------------------------------------------
        pen white 
        
        font font-title 
        text 400x70 (Quiz-title)

        font font-quiz-title
        text 380x190 (Question)

        ;----------------------------------------------
    ]

    ; Question 
    ;box 286x148 792x258
    at 286x148 panel [
        backdrop (dark-blue) 
        size 95x30
        at 15x5 
        text font (font-question-label) 
        {Question} 
        [print "question hint"] extra "hint"
    ]

    ; Answer A
        at 288x258 
        panel 185x125 [
        backdrop (dark-blue) 
        size 185x125
        at 10x60
        text font (font-answer) wrap
        { > 500 Mb} 
        extra true
        [print "Answer A"]         
    ]

    ; Answer B
        ;box 512x258 732x418  
        at 543x258 
        panel 185x125 [
        backdrop (dark-blue) 
        size 185x125
        at 10x60
        text font (font-answer) wrap
        { > 100 Mb} 
        extra true
        [print "Answer B"]         
    ]

    ; Answer C
        ;box 732x418 793x578 
        at 553x450
        panel 170x125 [
        backdrop (dark-blue) 
        at 10x35
        text font (font-answer) wrap
        { > 10 Mb} 
        extra true
        [print "Answer C"]         
    ] 

    ; Answer D
        ;box 227x418 287x578
        at 288x450
        panel 180x100 [
        backdrop (150.122.189) 
        at 10x30
        text font (font-answer) wrap
        { > 1 Mb} 
        extra true
        [print "Answer D"]         
    ]         

]

view layout win
