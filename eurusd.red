Red [
    Title: "eurusd.red"
]


records: copy [
    ;["EUR" "USD" 1.17459]
]

do read http://redlang.red/json

url-rates: https://api.currex.info/json/latest/USD/
rates: load-json read url-rates
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

        label: text react [face/data: rejoin [record/Base-Currency "/" record/Target-Currency]] ; EUR/USD
        
        the-rate: field right 
        
        return

        Currency1: text react [face/data: record/Base-Currency]
        amount1: field right react [
            face/data: if not none? amount2/data [round/to ((to-float amount2/data) / (to-float the-rate/data)) 0.01]
        ]
        return
        Currency2: text react [face/data: record/Target-Currency]
        amount2: field right react [
            face/data: if not none? amount1/data [round/to ((to-float amount1/data) * (to-float the-rate/data)) 0.01]
        ]
    ]

]


Title: "EUR/USD"

win: layout compose [

    title (Title)

    panel header 

    do [
        the-rate/data: record/rate
        amount2/data: "400"
    ]
    
]

view win
