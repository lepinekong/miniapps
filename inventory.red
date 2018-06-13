Red [
    Title: "inventory.red"
]

do read http://redlang.red/crud-csv.red

if not exists? config-file: %config/inventory.config.red [



]

if not exists? data-file: %db/inventory.csv [
    make-dir %db
    write data-file read http://miniapps.red/db/inventory.csv
    print rejoin ["Created " clean-path data-file]
]

lines: Read/lines data-file
csv-header: first lines
lines: skip lines 1
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

        text "quantity:" quantity: field right react [face/data: record/quantity]
        return
    
        text "price:" price: field right react [face/data: record/price]
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

    button "first" [
        record/row: 1
    ]

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

    button "last" [
        record/row: length? records
    ]

    button "Add" [
        append/only records [
            {} {} {} {}
            {} {} {} {}
        ]
        record/row: length? records
    ]

    button "save" [

        record/entry-date: entry-date/text
        record/type: type/text
        record/End-Garantee: End-Garantee/text
        record/description: description/text
        record/quantity: quantity/text
        record/price: price/text
        record/reference: reference/text
        record/note: note/text

        block-record: copy []
        append block-record record/Entry-Date
        append block-record record/End-Garantee
        append block-record record/type
        append block-record record/description
        append block-record record/quantity
        append block-record record/price
        append block-record record/reference
        append block-record record/note

        record-number: to-integer field-record-number/data

        records: update-csv records record-number block-record
        
        lines: copy []
        forall records [
            line-block: records/1
            line: copy ""
            forall line-block [
                element: line-block/1
                line: rejoin [line "," element]
            ]
            remove line
            append lines line
        ]
        save-csv/header lines %db/inventory.csv csv-header
        print "Record saved"

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
