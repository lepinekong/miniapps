Red [
    Title: "launcher.red"
    Needs: 'View
    References: [
        {Rebol/Red Color Names} http://rebol2.blogspot.com/2012/03/color-names.html
    ]
]

if not exists? config-file: %config/launcher.config.red [
    make-dir %config
    write config-file read http://miniapps.red/config/launcher.config.red
]

print rejoin [
    "You can customize the apps config in " 
    {"}
    to-local-file clean-path config-file
    {"}
]

do read config-file

view layout compose Config