Red [
    Title: "<%short-filename-without-extension%>"
]

Article: [

    Title: {<%short-filename-without-extension%>}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .links: [{http://miniapps.red/doc/<%short-filename-without-extension%>/index.red} https://github.com/lepinekong/miniapps/blob/master/doc/<%short-filename-without-extension%>/index.red]
        .Published-Urls: [
            http://miniapps.red/<%short-filename-without-extension%>.red 
            http://miniapps.red/<%short-filename-without-extension%>        
        ]
    ]  

    Screen-copies: [
        .title: {<%short-filename-without-extension%>}
        .image: 
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

            do read http://miniapps.red/<%short-filename-without-extension%>.red
            do read http://miniapps.red/<%short-filename-without-extension%>           
        }
    ]

    Usage: [

        .title: {Usage}
        .text: {
            
        }
        .links: [
            {} https://...
        ]
        .text: {
            You can change any field in any order, no need to validate, the others will update automatically.
        }
        .text: {}
        .image: 
        .text: {}
        .image: 
        .text: {}
        .image: 
    
    ]  

    Source-Code: [
        .title: {Source Code}
        .links: [
            https://github.com/lepinekong/miniapps/blob/master/<%short-filename-without-extension%>.red
        ]
        .image: 
        .code: {
            
        }
    ]  
]

do read http://readablehumanformat.com/lib.red
markdown-gen 