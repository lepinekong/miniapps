Red [
    Title: "niko calendar"
]

if not exists? team-list-file: %config/niko/team-list.red [
    make-dir/deep %config/niko
    write team-list-file read http://miniapps.red/config/niko/team-list.red
]

do read team-list-file

if not exists? team-icons-list-file: %config/niko/team-icons-list.red [
    make-dir %config
    write team-icons-list-file read http://miniapps.red/config/niko/team-icons-list.red
]

do read team-icons-list-file

win: copy [
    title "niko"
    backdrop gold
    style cell: image (cell-size)
    style cell-with-caption: cell font-name "algerian" font-size 14    
]

append win team-list

print rejoin [
    "You can customize the apps list in " 
    {"}
    to-local-file clean-path team-list-file
    {"}
    newline
    "You can customize the apps icons list in " 
    {"}
    to-local-file clean-path team-icons-list-file
    {"}    
]

view layout compose win