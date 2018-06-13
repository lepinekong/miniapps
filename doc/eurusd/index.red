Red [
    Title: "eurusd"
]

Article: [

    Title: {miniApps.red}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/eurusd/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/eurusd/index.red)
        }
        .Published-Urls: [
            http://miniapps.red/eurusd.red 
            http://miniapps.red/eurusd        
        ]
    ]  

    Screen-copies: [
        .title: {eurusd}
        .image: https://i.imgur.com/BiQZrzI.png
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
        .text: {Then run and type in red console any of these commands: }
        .code: {

            do read http://miniapps.red/eurusd.red
            do read http://miniapps.red/eurusd           
        }
        

    ]

    Usage: [

        .title: {Usage}
        .text: {
            Rate is the latest 24h official rate based on
        }
        .link: [
            https://api.currex.info/json/latest/USD/
        ]
        .text: {
            You can change any field, the others will update automatically.
        }
    
    ]  

    Source-Code: [
        .title: {Source Code:}
        .link: [
            https://github.com/lepinekong/miniapps/blob/master/eurusd.red
        ]
        .image: https://i.imgur.com/ASmQW7Y.png
    ]  
]

do read http://readablehumanformat.com/lib.red
markdown-gen 