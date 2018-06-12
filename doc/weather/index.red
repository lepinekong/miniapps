Red [
    Title: "weather"
]

Article: [

    Title: {Miniapps.Space}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/weather/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/weather/index.red)
        }
        .Published-Urls: [
            http://miniapps.red/weather.red 
            http://miniapps.red/weather        
        ]
    ]  

    Screen-copies: [
        .title: {weather}
        .image: https://i.imgur.com/FZ3BTKy.png
    ]         
    
    Pre-Requisites: [

        .title: {Pre-requisite}
        .text: {
            - Download [red-lang on red-lang.org](https://www.red-lang.org/p/download.html) (only 1 Mb)
            or
            - Paste this oneliner in Powershell:
        }
        .code: {
New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        }
        .text: {Then run and type in red console any of these commands: }
        .code: {

            do read http://miniapps.red/weather.red
            do read http://miniapps.red/weather           
        }
        

    ]

    Usage: [

        .title: {Usage}
        .text: {Type one of command examples:

            - weather   
            - w    
        }
    
    ]    
]

do read http://readablehumanformat.com/lib.red
markdown-gen 