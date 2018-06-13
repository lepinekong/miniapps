
# miniApps.red


### ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)

[http://miniapps.red/doc/eurusd/index.red](https://github.com/lepinekong/miniapps/blob/master/doc/eurusd/index.red)


### eurusd

![https://i.imgur.com/BiQZrzI.png](https://i.imgur.com/BiQZrzI.png)
                    

### Pre-requisites


- Download [red-lang](https://www.red-lang.org/p/download.html) on [red-lang.org](https://www.red-lang.org) (only 1 Mb)
- Or paste this oneliner in [powershell](http://www.powertheshell.com/topic/learnpowershell/firststeps/console/):




```

New-Item -ItemType Directory -Force -Path C:\red;(New-Object System.Net.WebClient).DownloadFile('https://static.red-lang.org/dl/win/red-063.exe','c:\red\red.exe');Start-Process -Filepath 'c:\red\red.exe'            
        
```


Then type in red console any of these commands: 


```


            do read http://miniapps.red/eurusd.red
            do read http://miniapps.red/eurusd           
        
```



### Usage


Rate is the latest 24h official rate based on

- [currex.info](https://currex.info/)
                        

You can change any field in any order, no need to validate, the others will update automatically.

By default USD is initialized with 400$ (ATM limit in some countries like Cambodia):
![https://i.imgur.com/veP9ZMr.png](https://i.imgur.com/veP9ZMr.png)
                    
You can set EUR for example to 500€ and USD amount will be automatically refreshed:
![https://i.imgur.com/HPdBGk5.png](https://i.imgur.com/HPdBGk5.png)
                    
You can also override the default rate for example to 1.15:
![https://i.imgur.com/XbMfhq6.png](https://i.imgur.com/XbMfhq6.png)
                    

### Source Code

- [https://github.com/lepinekong/miniapps/blob/master/eurusd.red](https://github.com/lepinekong/miniapps/blob/master/eurusd.red)
                        
![https://i.imgur.com/rPAjM1y.png](https://i.imgur.com/rPAjM1y.png)
                    


```

Red [
    Title: "eurusd.red"
]

records: copy [] ; ["EUR" "USD" (rate/rate)] 

do read http://redlang.red/json
rates: load-json read https://api.currex.info/json/latest/USD/
rates: rates/rates
forall rates [
    rate: rates/1
    if rate/currency = "EUR" [
        append/only records compose ["EUR" "USD" (rate/rate)] 
        break
    ]
]

record: make reactor! [
    row: 1
    Base-Currency: is [ records/(row)/1]
    Target-Currency: is [ records/(row)/2]
    Rate: is [ records/(row)/3]
]

header: [
    panel [
        text react [face/data: rejoin [record/Base-Currency "/" record/Target-Currency]] ; EUR/USD
        the-rate: field right 
        return
        Currency1: text react [face/data: record/Base-Currency]
        q1: field right react [face/data: if (not none? q2/data) [round/to ((to-float q2/data) / (to-float either none? the-rate/data [1][the-rate/data])) 0.01]]
        return
        Currency2: text react [face/data: record/Target-Currency]
        q2: field right react [face/data: if (not none? q1/data) [round/to ((to-float q1/data) * (to-float either none? the-rate/data [1][the-rate/data])) 0.01]]
    ]
]

Title: "EUR/USD"
win: layout compose [
    title (Title)
    panel header 
    do [
        the-rate/data: record/rate
        q2/data: "400"
    ]
    
]

view win
            
        
```


