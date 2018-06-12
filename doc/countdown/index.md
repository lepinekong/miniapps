
# Miniapps.Space


### Countdown

![https://i.imgur.com/uKb1Iyr.png](https://i.imgur.com/uKb1Iyr.png)
                    

### ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)

[http://myminiapps.space/doc/countdown/index.red](https://github.com/lepinekong/myminiapps/blob/master/doc/countdown/index.red)


### Pre-requisite


- Download [red-lang on red-lang.org](https://www.red-lang.org/p/download.html) (only 1 Mb)
or
- Paste this oneliner in Powershell:



```

New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        
```


Then run and type in red console any of these commands: 


```


            do read http://myminiapps.space/countdown.red
            do read http://myminiapps.space/countdown
            do read http://myminiapps.space/pomodoro.red
            do read http://myminiapps.space/pomodoro
        
```



### Usage

Type one of command examples:

- Countdown 00:25:00
- Countdown 00:25:00 "Pomodoro"
- Pomodoro

