Red [
    Title: ""
    Needs: 'View
]

cell-size: 128x128

img-google: http://miniapps.red/images/google_128.png
img-twitter: http://miniapps.red/images/twitter_128.png
img-facebook: http://miniapps.red/images/facebook_128.png
img-youtube: http://miniapps.red/images/youtube_128.png
img-office365: http://miniapps.red/images/office365_128.png


view layout compose [

    title "Launcher"
    backdrop gold
    style cell: image (cell-size)

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

    office365-Excel: cell "Excel" (img-office365) [
        browse https://office.live.com/start/Excel.aspx
    ]
    cell "6" 
    cell "7" 
    cell "8" 
    return
    cell "9" cell "10" cell "11" cell "12" return
    cell "13" cell "14" cell "15" cell "16" 
]
