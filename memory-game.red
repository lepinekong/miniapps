Red [
    Title: "memory-game.red"
    Needs: 'View
    References: [
        https://www.packtpub.com/mapt/book/all_books/9781789130706/9/ch09lvl1sec79/a-faces-walkthrough
        http://www.rebol.com/how-to/btns-cust.html
    ]

    Free-icons: [
        https://www.iconfinder.com/icons/2308049/application_friends_photos_publications_snapchat_snaps_icon
        https://www.iconfinder.com/icons/2308040/logo_videos_watch_wbesite_youtube_youtube2_icon
    ]
    Free-images: [
        https://www.freepik.com/free-vector/funny-animals-collection_765907.htm
        https://www.freepik.com/free-vector/set-of-funny-cartoon-animals_683237.htm
        https://image.freepik.com/free-vector/funny-animals-collection_23-2147505702.jpg
        https://www.sketchappsources.com/free-source/3073-crypto-currency-alt-coins-vector-logo-sketch-freebie-resource.html
    ]
]


cell-size: 128x128
img1: load http://miniapps.red/images/snapchat_128.png
img2: load http://miniapps.red/images/youtube_128.png

view layout compose [
    title "Memory Game"
    backdrop silver
    style cell: image (cell-size) (img1) on-over [
        img: face/image
        either img = (img1) [
            face/image: (img2)
        ][
            face/image: (img1)
        ]
    ] 
    cell "1" cell "2" cell "3" cell "4" return
    cell "5" cell "6" cell "7" cell "8" return
    cell "9" cell "10" cell "11" cell "12" return
    cell "13" cell "14" cell "15" cell "16" 
]
