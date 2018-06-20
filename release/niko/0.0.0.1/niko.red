Red [
    Title: "niko calendar"
    References: [
        https://www.agilealliance.org/glossary/nikoniko/
    ]
]

if not exists? team-list-file: %config/niko/team-list.red [
    make-dir/deep %config/niko
    write team-list-file read http://miniapps.red/config/niko/team-list.red
]

do read team-list-file

if not exists? team-icons-list-file: %config/niko/icons-list.red [
    make-dir %config
    write team-icons-list-file read http://miniapps.red/config/niko/icons-list.red
]

do read team-icons-list-file

img-happy: load happy
img-angry: load angry
img-neutral: load neutral

win: copy [
    title "niko calendar: Agile team's moods"
    backdrop gray
    style Sprint: image 200x48 font-name "arial" font-size 12
    style Day: image 48x48 font-name "arial" font-size 12 
    style Member: image 200x48 font-name "arial" font-size 12   
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

append win niko-calendar

print rejoin [
    "You can customize the team list in " 
    {"}
    to-local-file clean-path team-list-file
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