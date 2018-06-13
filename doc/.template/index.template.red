Red [
    Title: "<%app%>"
]

Article: [

    Title: {miniApps.red}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/<%app%>/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/<%app%>/index.red)
        }
        .Published-Urls: [
            http://miniapps.red/<%app%>.red 
            http://miniapps.red/<%app%>        
        ]
    ]  

    Screen-copies: [
        .title: {<%app%>}
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
        .text: {Then run and type in red console any of these commands: }
        .code: {

            do read http://miniapps.red/<%app%>.red
            do read http://miniapps.red/<%app%>           
        }
        

    ]

    Usage: [

        .title: {Usage}
        .text: {Type one of command examples:

            - <%app%>       
        }
    
    ]    
]

do read http://readablehumanformat.com/lib.red
markdown-gen 