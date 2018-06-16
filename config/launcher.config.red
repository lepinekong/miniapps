Config: [

    title "Launcher"
    backdrop gold
    style cell: image (cell-size)
    style cell-with-caption: cell font-name "algerian" font-size 14

    google: cell (img-google) [
        browse http://google.com
    ]

    twitter: cell (img-twitter) [
        browse http://twitter.com/lepinekong
    ]

    facebook: cell (img-facebook) [
        browse http://facebook.com
    ]    

    youtube: cell (img-youtube) [
        browse http://youtube.com
    ]

    return

    officeonline-Word: cell-with-caption (img-officeonline) font-color blue "Word" [
        browse https://office.live.com/start/Word.aspx
    ]

    officeonline-Excel: cell-with-caption (img-officeonline) font-color leaf "Excel" [
        browse https://office.live.com/start/Excel.aspx
    ]

    officeonline-Powerpoint: cell-with-caption (img-officeonline) font-color maroon "Powerpoint" [
        browse https://office.live.com/start/PowerPoint.aspx
    ]

    officeonline-Onenote: cell-with-caption (img-officeonline) font-color purple "Onenote" [
        browse https://www.onenote.com/notebooks
    ]

    return

    Winword: cell (img-winword) [
        call/shell {"C:\Program Files (x86)\Microsoft Office\Office12\WINWORD.EXE"}
    ]

    Excel: cell (img-excel) [
        call/shell {"C:\Program Files (x86)\Microsoft Office\Office12\EXCEL.EXE"}
    ]

    Powerpoint: cell (img-powerpoint) [
        call/shell {"C:\Program Files (x86)\Microsoft Office\Office12\POWERPNT.EXE"}
    ]

    Onenote: cell (img-onenote) [
        call/shell {"C:\Program Files (x86)\Microsoft Office\Office12\ONENOTE.EXE"}
    ]     

    return

    Pomodoro: cell-with-caption (img-redlang) font-color white "Pomodoro" [
        do read http://miniapps.red/pomodoro
    ]

    Note: cell-with-caption (img-redlang) font-color white "Note" [
        do read http://miniapps.red/note
    ]            

    Weather: cell-with-caption (img-redlang) font-color white "Weather" [
        do read http://miniapps.red/weather
    ]

    EURUSD: cell-with-caption (img-redlang) font-color white "EUR/USD" [
        do read http://miniapps.red/eurusd
    ]

]
