
# Piechart

![https://i.imgur.com/aIWrtIo.png](https://i.imgur.com/aIWrtIo.png)
                    

### ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)

[http://miniapps.red/doc/piechart/index.read](https://github.com/lepinekong/miniapps/blob/master/doc/piechart/index.read)

Published urls:
- [http://miniapps.red/piechart.red](http://miniapps.red/piechart.red)
                        
- [http://miniapps.red/piechart](http://miniapps.red/piechart)
                        
Repo url:
- [https://github.com/lepinekong/miniapps/blob/master/piechart.red](https://github.com/lepinekong/miniapps/blob/master/piechart.red)
                        

### Pre-requisite


- Download [red-lang](https://www.red-lang.org/p/download.html) on [red-lang.org](https://www.red-lang.org) (only 1 Mb)
- Or paste this oneliner in [powershell](http://www.powertheshell.com/topic/learnpowershell/firststeps/console/):



```

New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        
```


Then run and type in red console: 


```


            do read http://miniapps.red/piechart.red

        
```



### Usage

Type one of command examples:

- piechart ; for help
- piechart [label1 10 "label 2" 20] ; for one line data block
- piechart [ ; for multiple lines data block
label1 10 
"label 2" 20
]
- piechart/title [Salary 5000 Financials 1000] "My Revenues"
- piechart/title "My Revenues" [Salary 5000 Financials 1000]
- piechart/clipboard ; for string of data from clipboard without bracket
- For passing data variable, embed variable with () for example:
.data: [label1 10 "label 2" 20]
piechart (.data)   

