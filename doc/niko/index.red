Red [
    Title: "niko.red"
]

Article: [

    Title: {niko calendar: Agile team's moods}

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/eniko/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/niko/index.red)
        }
        .Published-Urls: [
            http://miniapps.red/niko.red 
            http://miniapps.red/niko        
        ]
    ]  

    Screen-copies: [
        .title: {niko}
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

            do read http://miniapps.red/niko.red
            do read http://miniapps.red/niko           
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
            https://github.com/lepinekong/miniapps/blob/master/niko.red
        ]
        .image: 
        .code: {
            
        }
    ]  
]

do read http://readablehumanformat.com/lib.red
markdown-gen 