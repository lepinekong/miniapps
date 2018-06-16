Red [
    Title: "launcher.red"
    Needs: 'View
    References: [
        {Rebol/Red Color Names} http://rebol2.blogspot.com/2012/03/color-names.html
    ]
]

if not exists? apps-list-file: %config/launcher.apps-list.red [
    make-dir %config
    write apps-list-file read http://miniapps.red/config/launcher.apps-list.red
]

do read apps-list-file

if not exists? apps-icons-list-file: %config/launcher.apps-icons-list.red [
    make-dir %config
    write apps-icons-list-file read http://miniapps.red/config/launcher.apps-icons-list.red
]

do read apps-icons-list-file

win: copy [
    title "Launcher"
    backdrop gold
    style cell: image (cell-size)
    style cell-with-caption: cell font-name "algerian" font-size 14    
]

append win apps-list

print rejoin [
    "You can customize the apps list in " 
    {"}
    to-local-file clean-path apps-list-file
    {"}
    newline
    "You can customize the apps icons list in " 
    {"}
    to-local-file clean-path apps-icons-list-file
    {"}    
]

view layout compose win