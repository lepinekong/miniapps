Red [
    Title: "prestations.red"
]

ligne-titres: [
    text right ""
    text right "1981"
    text right "2018"
    text right "delta"
    text right "delta%"
]

ligne-PIB: [
    text  "PIB (Milliards)" 
    pib-1981: field right "511" 
    pib-2018: field right "2300"
    delta: field right react [face/data: to-integer pib-2018/data - to-integer pib-1981/data]
    delta-pc: field right react [face/data: to-percent round/to (to-float delta/data / to-float pib-1981/data) 0.01]
]

ligne-Population: [
    text  "Population (Millions)" 
    pop-1981: field right "55.4" 
    pop-2018: field right "67.2"
    delta-pop: field right react [face/data: to-integer pop-2018/data - to-integer pop-1981/data]
    delta-pc-pop: field right react [face/data: to-percent round/to (to-float delta-pop/data / to-float pop-1981/data) 0.01]
]

Title: "Prestations Sociales"
win: layout compose [

    title (Title)
    panel ligne-titres
    return
    panel ligne-PIB
    return
    panel ligne-Population
    do [

    ]
    
]

view win
