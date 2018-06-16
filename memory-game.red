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
img-back: load http://miniapps.red/images/brain_128.png

img-1: load http://miniapps.red/images/google_128.png
img-2: load http://miniapps.red/images/twitter_128.png
img-3: load http://miniapps.red/images/facebook_128.png
img-4: load http://miniapps.red/images/youtube_128.png
img-5: load http://miniapps.red/images/winword_128.png
img-6: load http://miniapps.red/images/excel_128.png
img-7: load http://miniapps.red/images/powerpoint_128.png
img-8: load http://miniapps.red/images/onenote_128.png
img-9: load http://miniapps.red/images/google_128.png
img-10: load http://miniapps.red/images/twitter_128.png
img-11: load http://miniapps.red/images/facebook_128.png
img-12: load http://miniapps.red/images/youtube_128.png
img-13: load http://miniapps.red/images/winword_128.png
img-14: load http://miniapps.red/images/excel_128.png
img-15: load http://miniapps.red/images/powerpoint_128.png
img-16: load http://miniapps.red/images/onenote_128.png

i: 1
view layout compose [
    title "Memory Game"
    backdrop black
    style cell: image (cell-size) (img-back) on-over [
        img: face/image
        either img = (img-back) [
            id: face/text
            img-id: to-word rejoin ["img-" id]
            ?? img-id
            face/image: get img-id
        ][
            face/image: (img-back)
        ]
    ] extra 0 on-create [i: 1 + face/extra: i]

    cell "1" cell "2" cell "3" cell "4" return
    cell "5" cell "6" cell "7" cell "8" return
    cell "9" cell "10" cell "11" cell "12" return
    cell "13" cell "14" cell "15" cell "16" 
]
