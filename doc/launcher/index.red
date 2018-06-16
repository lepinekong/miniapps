Red [
    Title: "launcher"
]

Article: [

    Title: {Launcher}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/elauncher/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/launcher/index.red)
        }
        .Published-Urls: [
            http://miniapps.red/launcher.red 
            http://miniapps.red/launcher        
        ]
    ]  

    Screen-copies: [
        .title: {Launcher (fully customizable list of apps)}
        .image: https://i.imgur.com/eBnrBW5.png
    ]         
    
    Pre-Requisites: [

        .title: {Pre-requisites}
        .text: {
            - Download [red-lang](https://www.red-lang.org/p/download.html) on [red-lang.org](https://www.red-lang.org) (only 1 Mb)
            - Or paste this oneliner in [powershell](http://www.powertheshell.com/topic/learnpowershell/firststeps/console/):

        }
        .code: {
New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        }
        .text: {Then type in red console any of these commands: }
        .code: {

            do read http://miniapps.red/launcher.red
            do read http://miniapps.red/launcher           
        }
        

    ]

    Usage: [

        .title: {Usage}
        .text: {
            After executing do read http://miniapps.red/launcher,
            just click on an icon to launch the website or app.
        }
    ]  

    Customization: [
        .title: {Customization}
        .text: {
            If wanted you can customize the apps and icons list in %config sub-folder 
            (paths shown in console depending on where you installed red.)
        }
        .image: https://i.imgur.com/Ur49IHz.png
        .text: {See examples for:}
        .links: [
            {launcher.apps-list.red} https://github.com/lepinekong/miniapps/blob/master/config/launcher.apps-list.red
            {launcher.apps-icons-list.red} https://github.com/lepinekong/miniapps/blob/master/config/launcher.apps-icons-list.red
        ]
    ]

    Source-Code: [
        .title: {Source Code}
        .links: [
            https://github.com/lepinekong/miniapps/blob/master/launcher.red
        ]
        .image: https://i.imgur.com/FHxDskh.png
        .code: {
Red [
    Title: "launcher.red"
    Needs: 'View
    References: [{Rebol/Red Color Names} http://rebol2.blogspot.com/2012/03/color-names.html]
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
        }
    ]  
]

do read http://readablehumanformat.com/lib.red
markdown-gen 