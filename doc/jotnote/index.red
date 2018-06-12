Red [
    Title: "Jotnote"
]

Article: [

    Title: {Jotnote}

    Screen-copies: [
        .image: https://i.imgur.com/a4vpErj.png
    ]       

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/jotnote/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/jotnote/index.red)
        }

        .text: {Published urls:}
        .Links: [
            http://miniapps.red/jotnote.red
            http://miniapps.red/note.red  
            http://miniapps.red/jotnote   
            http://miniapps.red/note       
        ]
        .text: {Repo url:}
        .Links: [
            https://github.com/lepinekong/miniapps/blob/master/jotnote.red
        ]         

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

            do read http://miniapps.red/jotnote.red
            do read http://miniapps.red/jotnote
            do read http://miniapps.red/note            
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