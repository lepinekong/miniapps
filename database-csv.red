Red [
    Title: "database-csv.red"
]

do read http://redlang.red/crud-csv

.create-database-csv: function [>file-path >list-columns [block! string!]][

    records: copy []
    records: add-csv-record records >list-columns
    save-csv >file-path records
]

create-database-csv: :.create-database-csv

create-database-csv %db/temp.csv {"a", "b", "c"}
