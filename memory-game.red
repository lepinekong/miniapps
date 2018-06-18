Red [
    Title: "memory-game.red"
    Needs: 'View
    Iteration: 0.0.1.1
    Purpose: {
        FIX: *** Script Error: img-none has no value
        set clicked of previous-face-clicked to true
        to previous-face from flipping
    }
    Code: {
            if img-clicked = previous-image-clicked [
                previous-face-clicked/image: img-clicked
                previous-face-clicked/extra: update-readable previous-face-clicked/extra 'clicked true
                exit
            ]     
    }
    References: [
        https://www.packtpub.com/mapt/book/all_books/9781789130706/9/ch09lvl1sec79/a-faces-walkthrough
        http://www.rebol.com/how-to/btns-cust.html
    ]

    Credits: [
        https://www.iconfinder.com/icons/2730389/brain_divide_inkcontober_sains_icon
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

do read http://redlang.red/range
do read http://redlang.red/crud-readable.red

cell-size: 128x128
img-back: load http://miniapps.red/images/brain_128.png

icons-list: [
    %google_128.png
    %twitter_128.png
    %facebook_128.png
    %youtube_128.png
    %winword_128.png
    %excel_128.png
    %powerpoint_128.png
    %onenote_128.png
    %google_128.png
    %twitter_128.png
    %facebook_128.png
    %youtube_128.png
    %winword_128.png
    %excel_128.png
    %powerpoint_128.png
    %onenote_128.png
]

base-url: http://miniapps.red/images/

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
random/seed now
shuffled-img: random .range 1 16

previous-image-clicked: none
img-clicked: none

previous-id-clicked: none
id-clicked: none

previous-face-clicked: none
face-clicked: none

view layout compose [
    title "Memory Game"
    backdrop white
    style cell: image (cell-size) (img-back) on-over [
        clicked: select face/extra 'clicked
        if clicked = true [
            previous-image-clicked: img-clicked
            img-clicked: face/image
            previous-id-clicked: id-clicked
            id-clicked: select face/extra 'id
            previous-face-clicked: face-clicked
            face-clicked: face
            if img-clicked = previous-image-clicked [
                previous-face-clicked/image: img-clicked
                previous-face-clicked/extra: update-readable previous-face-clicked/extra 'clicked true
                exit
            ]
        ]
        img: face/image
        either img = (img-back) [
            img-number: select face/extra 'img-number ; set in on-create
            img-id: to-word rejoin ["img-" img-number]
            face/image: get img-id
        ][
            face/image: (img-back)
        ]
    ]

    on-down [
        face/extra: update-readable face/extra 'clicked true
    ]

    extra 0 on-create [
        i: 1 + i 
        face/extra: copy []
        append face/extra compose [(to-set-word "id") (i)]
        append face/extra compose [(to-set-word "img-number") (shuffled-img/:i)]
        append face/extra compose [(to-set-word "clicked") false]
    ]

    panel [
        cell cell cell cell return
        cell cell cell cell return
        cell cell cell cell return
        cell cell cell cell 
    ]
    return
    panel 400x40 [
        button "Play" [
            Play-Status: true
        ]
    ] 

    do [
        Play-Status: False
    ]

]
