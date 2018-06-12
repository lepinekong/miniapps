Red [
    Title: "inventory.red"
]

if not exists? data-file: %db/inventory.csv [
    make-dir %db
    write data-file read http://miniapps.red/db/inventory.csv
    print rejoin ["Created " clean-path data-file]
]

lines: skip Read/lines data-file 1
records: copy []

forall lines [
    append/only records split lines/1 ","
]

n: (to-string length? records)

;using red reactive programming
;reactor allows to define the current record
;"is" is called reactive relation.
record: make reactor! [

    row: 1

    Entry-Date: is [ records/(row)/1]
    type: is [ records/(row)/2]
    description: is [ records/(row)/3]
    Quantity: is [ records/(row)/4]
    Price: is [ records/(row)/5]
    Reference: is [ records/(row)/6]
    Note: is [ records/(row)/7]

]

header: [
        panel [
        ;text "Description:" field 250x24 data records/1/3
        text "Description:" field 250x24 react [face/data: record/description]
        return
        text "Type:" field 250x24 react [face/data: record/type]
        return        
    ]

    panel [
        text "Entry Date:" field react [face/data: record/entry-date]
        return
    ]  
]

body-left: [

        text "Quantity / Price"
        return

        text "quantity:" field react [face/data: record/quantity]
        return
    
        text "price:" field react [face/data: record/price]
        return    
]

body-right: [

        text "Complements"
        return

        text "Reference:" field 250x24 react [face/data: record/reference]
        return

        text "Note:" field 250x24 react [face/data: record/note]
        return        
]

footer: [

    across middle
    button "previous" [
        either (record/row = 1) [
            record/row: length? records
        ][
            record/row: record/row - 1
        ]
    ]

    text 10x15 react [face/data: record/row] 

    button "next" [
        either (record/row < length? records) [
            record/row: record/row + 1
        ][
            record/row: 1
        ]
    ]
    
]

Title: "Inventory"

win: layout compose [

    title (Title)

    panel header 

    return 

    panel body-left 
    panel body-right

    return

    panel footer
    
]

view win
