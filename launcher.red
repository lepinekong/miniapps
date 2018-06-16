Red [
    Title: ""
    Needs: 'View
]

cell-size: 128x128

img-google: http://miniapps.red/images/google_128.png
img-twitter: http://miniapps.red/images/twitter_128.png
img-youtube: http://miniapps.red/images/youtube_128.png


view layout compose [
    title "Memory Game"
    backdrop gold
    style cell: image (cell-size)

    google: cell (img-google) [
        browse http://google.com
    ]

    twitter: cell (img-twitter) [
        browse http://twitter.com
    ]

    youtube: cell (img-youtube) [
        browse http://youtube.com
    ]

    
    cell "4" 
    
    return

    cell "5" cell "6" cell "7" cell "8" return
    cell "9" cell "10" cell "11" cell "12" return
    cell "13" cell "14" cell "15" cell "16" 
]
