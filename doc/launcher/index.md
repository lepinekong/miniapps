
# Launcher


### ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)

[http://miniapps.red/doc/elauncher/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/launcher/index.red)


### Launcher (fully customizable list of apps)

![https://i.imgur.com/eBnrBW5.png](https://i.imgur.com/eBnrBW5.png)
                    

### Pre-requisites


- Download [red-lang](https://www.red-lang.org/p/download.html) on [red-lang.org](https://www.red-lang.org) (only 1 Mb)
- Or paste this oneliner in [powershell](http://www.powertheshell.com/topic/learnpowershell/firststeps/console/):




```

New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        
```


Then type in red console any of these commands: 


```


            do read http://miniapps.red/launcher.red
            do read http://miniapps.red/launcher           
        
```



### Usage


After executing do read http://miniapps.red/launcher,
just click on an icon to launch the website or app.


### Customization


If wanted you can customize the apps and icons list in %config sub-folder 
(paths shown in console depending on where you installed red.)

![https://i.imgur.com/Ur49IHz.png](https://i.imgur.com/Ur49IHz.png)
                    
See examples for:
- [launcher.apps-list.red](https://github.com/lepinekong/miniapps/blob/master/config/launcher.apps-list.red)
                        
- [launcher.apps-icons-list.red](https://github.com/lepinekong/miniapps/blob/master/config/launcher.apps-icons-list.red)
                        

### Source Code

- [https://github.com/lepinekong/miniapps/blob/master/launcher.red](https://github.com/lepinekong/miniapps/blob/master/launcher.red)
                        
![https://i.imgur.com/FHxDskh.png](https://i.imgur.com/FHxDskh.png)
                    


```

Red [
    Title: "launcher.red"
    Needs: 'View
    References: [{Rebol/Red Color Names} http://rebol2.blogspot.com/2012/03/color-names.html]
]

if not exists? apps-list-file: %config/launcher.apps-list.red [
    make-dir %config
    write apps-list-file read http://miniapps.red/config/launcher.apps-list.red
]

do read apps-list-file

if not exists? apps-icons-list-file: %config/launcher.apps-icons-list.red [
    make-dir %config
    write apps-icons-list-file read http://miniapps.red/config/launcher.apps-icons-list.red
]

do read apps-icons-list-file

win: copy [
    title "Launcher"
    backdrop gold
    style cell: image (cell-size)
    style cell-with-caption: cell font-name "algerian" font-size 14    
]

append win apps-list

print rejoin [
    "You can customize the apps list in " 
    {"}
    to-local-file clean-path apps-list-file
    {"}
    newline
    "You can customize the apps icons list in " 
    {"}
    to-local-file clean-path apps-icons-list-file
    {"}    
]

view layout compose win            
        
```


