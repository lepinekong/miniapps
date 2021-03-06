Red [
    Title: "countdown.red"
]

Article: [

    Title: {Countdown}

    Screen-copies: [
        .image: https://i.imgur.com/uKb1Iyr.png 
    ]    
        

    Source: [
        .title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
        .text: {[http://miniapps.red/doc/countdown/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/countdown/index.red)
        }
        .Published-Url: http://miniapps.red/countdown.red

        .text: {Published urls:}
        .Links: [
            http://miniapps.red/countdown.red 
            http://miniapps.red/countdown   
            http://miniapps.red/pomodoro.red 
            http://miniapps.red/pomodoro                    
        ]
        .text: {Repo url:}
        .Links: [
            https://github.com/lepinekong/miniapps/blob/master/countdown.red
        ]     
    ]    



    Pre-Requisites: [

        .title: {Pre-requisite}
        .text: {
            - Download [red-lang](https://www.red-lang.org/p/download.html) on [red-lang.org](https://www.red-lang.org) (only 1 Mb)
            - Or paste this oneliner in [powershell](http://www.powertheshell.com/topic/learnpowershell/firststeps/console/):

        }
        .code: {
New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        }
        .text: {Then type in red console any of these commands: }
        .code: {

            do read http://miniapps.red/countdown.red
            do read http://miniapps.red/countdown
            do read http://miniapps.red/pomodoro.red
            do read http://miniapps.red/pomodoro
        }
        

    ]

    Usage: [

        .title: {Usage}
        .text: {Type one of command examples:

            - Countdown 00:25:00
            - Countdown 00:25:00 "Pomodoro"
            - Pomodoro        
        }
    
    ]

]

do read http://readablehumanformat.com/lib.red
markdown-gen 

