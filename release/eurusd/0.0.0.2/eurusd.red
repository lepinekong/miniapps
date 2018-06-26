Red [
    Title: "eurusd.red"
    version: [0.0.0.2 {fixer.io support}]
    Build: [0.0.0.2.14 {Cleaning: fixer.io support}]
]

do read http://redlang.red/json

records: copy []

either exists? config-file: %config/eurusd.config.red [
    do read config-file
    if not value? 'fixerio-url [
        print [{Your fixer.io API Key cannot be found in} clean-path %config-file]
        print [{With fixer.io API Key, you can get hourly rate for free.}]
        print [{Will request daily rates from https://api.currex.info/json/latest/USD/}]
    ]

][
    make-dir/deep %config
    write config-file read http://miniapps.red/config/eurusd.config.template.red
    print [{created} clean-path %config-file]
    API-Key: ask {If you have a fixer.io Key (optional) enter it here or edit config file. Just type enter for none: }
    n: (length? API-Key)
    ?? n
    either (n = 32) [
        do read http://redlang.red/templating
        write/lines/append config-file .expand-string
        {fixerio-url: http://data.fixer.io/api/latest?access_key=<%replace-with-your-api-key%>&base=EUR&symbols=USD,AUD,THB&format=1}
        compose [
            replace-with-your-api-key: (API-Key)
        ]
        print [{Your fixer.io API Key has been written to} clean-path %config-file]
    ][
        print [{You can add your fixer.io API Key later on in} clean-path %config-file]   
    ]
    do read config-file

]

; fill records with for example [["EUR" "USD" 1.167952]]
either value? 'fixerio-url [
    json-data: load-json read fixerio-url
    rates: json-data/rates
    print [{querying fixer.io...}]
    ?? rates
    append/only records compose ["EUR" "USD" (rates/USD)] 
][
    rates: load-json read https://api.currex.info/json/latest/USD/

    rates: rates/rates
    forall rates [
        rate: rates/1
        if rate/currency = "EUR" [
            append/only records compose ["EUR" "USD" (rate/rate)] 
            break
        ]
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

if error? try [
    view win
][
    print "Service not available, try again in a few seconds... (use arrow up key to repeat command)"
]

