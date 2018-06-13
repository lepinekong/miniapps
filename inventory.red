Red [
    Title: "inventory.red"
]

do read http://redlang.red/dev/crud-csv-dev.red

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
    End-Garantee: is [ records/(row)/2]
    type: is [ records/(row)/3]
    description: is [ records/(row)/4]
    Quantity: is [ records/(row)/5]
    Price: is [ records/(row)/6]
    Reference: is [ records/(row)/7]
    Note: is [ records/(row)/8]

]

header: [
        panel [
        ;text "Description:" field 250x24 data records/1/3
        ;data-binding using react keyword
        text "Description:" description: field 250x24 react [face/data: record/description]
        return
        text "Type:" type: field 250x24 react [face/data: record/type]
        return        
    ]

    panel [
        text "Entry Date:" entry-date: field react [face/data: record/entry-date]
        return
        text "End Garantee:" end-garantee: field react [face/data: record/end-garantee]       
    ]  
]

body-left: [

        text "Quantity / Price"
        return

        text "quantity:" quantity: field react [face/data: record/quantity]
        return
    
        text "price:" price: field react [face/data: record/price]
        return    
]

body-right: [

        text "Complements"
        return

        text "Reference:" reference: field 250x24 react [face/data: record/reference]
        return

        text "Note:" note: field 250x24 react [face/data: record/note]
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

    field-record-number: text 10x15 react [face/data: record/row] 

    button "next" [
        either (record/row < length? records) [
            record/row: record/row + 1
        ][
            record/row: 1
        ]
    ]

    button "save" [
        record/type: type/data
        record-number: to-integer field-record-number/data
        ?? record   

        ?? records

        records: update-csv records record-number record  
        records: head records

        record1: records/1
        record2: records/2
        ?? records
        ?? record1
        ?? record2
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
