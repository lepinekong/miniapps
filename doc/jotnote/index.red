Red [
    Title: "Jotnote"
]

Article: [

    Title: {Miniapps.Space}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://myminiapps.space/doc/jotnote/index.red](https://github.com/lepinekong/myminiapps/blob/master/doc/jotnote/index.red)
        }
        .Published-Urls: [
            http://myminiapps.space/jotnote.red 
            http://myminiapps.space/jotnote
            http://myminiapps.space/note         
        ]
    ]  

    Screen-copies: [
        .title: {Jotnote}
        .image: https://i.imgur.com/a4vpErj.png
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

            do read http://myminiapps.space/jotnote.red
            do read http://myminiapps.space/jotnote
            do read http://myminiapps.space/note            
        }
        

    ]

    Usage: [

        .title: {Usage}
        .text: {Type one of command examples:

            - Jot
            - Jotnote
            - note        
        }
    
    ]    
]

do read http://readablehumanformat.com/lib.red
markdown-gen 