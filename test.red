Red [
    Title: "eurusd.red"
]

records: copy []

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
