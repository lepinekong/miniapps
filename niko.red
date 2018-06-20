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

win: copy [
    title "niko calendar"
    backdrop gray
    style Sprint: image 200x48 font-name "arial" font-size 12
    style Day: image 48x48 font-name "arial" font-size 12   
    style Member: image 200x48 font-name "arial" font-size 12    
    style Mood: image 48x48
    style Happy: Mood (happy)  
    style Angry: Mood (angry) 
    style Neutral: Mood (neutral)   

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

append win team-list

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

view layout compose win