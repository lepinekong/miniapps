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
        .image: 
        .code: {
            
        }
    ]  
]

do read http://readablehumanformat.com/lib.red
markdown-gen 