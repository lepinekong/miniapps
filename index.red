Red [
    Title: "miniApps.red"
]

Source: [
.title: {ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)}
.text: {[http://miniapps.red/index.red](https://github.com/lepinekong/miniapps/blob/master/index.red)
}
.Published-Url: http://miniapps.red/index
            ]
            
Article: [

    Title: {miniApps.red}

    Pre-Requisites: [

        .title: {Pre-requisite}
        .text: {
            - Download [red-lang](https://www.red-lang.org/p/download.html) on [red-lang.org](https://www.red-lang.org) (only 1 Mb)
            - Or paste this oneliner in [powershell](http://www.powertheshell.com/topic/learnpowershell/firststeps/console/):
        }
        .code: {
New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        }
        
    ]    
    
    Infos-Apps: [
        .title: {Infos Apps} 
        .links: [
            {do read http://miniapps.red/weather ![https://i.imgur.com/FZ3BTKy.png](https://i.imgur.com/FZ3BTKy.png)} %./doc/weather/
            {do read http://miniapps.red/eurusd ![https://i.imgur.com/HZucmAf.png](https://i.imgur.com/HZucmAf.png)} %./doc/eurusd/            
        ]    
    ]     

    Productivity-Apps: [
        .title: {Productivity Apps} 
        .links: [
            {do read http://miniapps.red/pomodoro ![https://i.imgur.com/uKb1Iyr.png](https://i.imgur.com/uKb1Iyr.png)} 
            %./doc/countdown/
            {do read http://miniapps.red/note ![https://i.imgur.com/a4vpErj.png](https://i.imgur.com/a4vpErj.png)} %./doc/jotnote/
        ]    
    ]

    Stats-Apps: [
        .title: {Stats Apps} 
        .links: [
            {do read http://miniapps.red/piechart ![https://i.imgur.com/aIWrtIo.png](https://i.imgur.com/aIWrtIo.png)} %./doc/piechart/
        ]    
    ]


]
        
do read http://readablehumanformat.com/lib.red
markdown-gen
