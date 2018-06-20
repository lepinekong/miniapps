Red [
    Title: "niko calendar"
    Build: 0.0.0.2
    History: [
        0.0.0.1 {Initial version}
        0.0.0.2 {BEFORE day-columns}
    ]
    References: [
        https://www.agilealliance.org/glossary/nikoniko/
    ]
]

if not exists? team-list-file: %config/niko/team-list.red [
    make-dir/deep %config/niko
    write team-list-file read http://miniapps.red/config/niko/team-list.red
]

do read team-list-file

if not exists? niko-data-file: %db/niko/niko.data.red [
    make-dir/deep %db/niko
    write niko-data-file read http://miniapps.red/db/niko/niko.data.red
]

do read http://redlang.red/do-trace

if not value? 'Sprint [
    data: load niko-data-file
    Sprint: select data 'Sprint
    oData: make object! data
    team-members: remove words-of oData ; remove first word (Sprint)
    team-records: remove values-of oData ; remove first value (Sprint value)

    do read http://redlang.red/do-trace

    niko-calendar: copy []
    forall team-members [
        i: index? team-members
        append niko-calendar compose [
            Member (to-string team-members/1)
            (team-records/:i)
            return
        ] 
        
    ]
]


if not exists? team-icons-list-file: %config/niko/icons-list.red [
    make-dir %config
    write team-icons-list-file read http://miniapps.red/config/niko/icons-list.red
]

do read team-icons-list-file

img-happy: load-thru happy
img-angry: load-thru angry
img-neutral: load-thru neutral

label-size: make pair! compose [(icon-size/1 * 4) (icon-size/2)]

win: copy [
    title "niko calendar: Agile team's moods"
    backdrop gray
    style Sprint: image (label-size) font-name "arial" font-size 12 (label-align-with-icon)
    style Day: image (icon-size) font-name "arial" font-size 12 (label-align-with-icon)
    style Member: image (label-size) font-name "arial" font-size 12 (label-align-with-icon)  
    style Mood: image (icon-size)
    style Happy: Mood (img-happy)
    style Angry: Mood (img-angry)
    style Neutral: Mood (img-neutral)  

    Sprint (rejoin ["Sprint " Sprint])
    Mon: Day "Mon"
    Tue: Day "Tue"
    Wed: Day "Wed"
    Thur: Day "Wed"
    Thur: Day "Fri"
    Mon: Day "Mon"
    Tue: Day "Tue"  
    Wed: Day "Wed"
    Thur: Day "Wed"
    Fri: Day "Fri"
    return             
]

forall day-columns [

]

append win niko-calendar

print rejoin [
    "You can set the data in " 
    {"}
    to-local-file clean-path niko-data-file
    {"}
    newline
    "You can customize the mood icons in " 
    {"}
    to-local-file clean-path team-icons-list-file
    {"}    
]

.niko-app: function[][
    view/tight layout compose/deep win
]

niko: :.niko-app
niko-calendar: :.niko-app
agile-mood: :.niko-app

niko

; h: happy
; view/tight [
;     base red 30x30 
;     at 30x0 panel [size 50x50 at 0x-20 image h]
; ]