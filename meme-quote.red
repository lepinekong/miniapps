Red [
    Title: "meme-quote.red"
    Build: 0.0.0.1
    Builds: [
        0.0.0.1 {Quote + Signature + Glyph}
    ]
    Iterations: [
        0.0.0.1.0 {Initial version}
        0.0.0.1.1 {Signature - Pb: quote is truncated}
        0.0.0.1.3 {Done: fix quote truncated
            quote bottom should be max just above signature
        }  
        0.0.0.1.4 {Plan: Glyph “
        at (glyph-position)
        text (glyph-size) font (font-glyph) center {“}        
        }                  
    ] 

    Resources: [
        https://gitter.im/red/help?at=5b309c7c6ceffe4eba308906
        https://www.granneman.com/webdev/coding/css/fonts-and-formatting/default-fonts#windows
        https://superuser.com/questions/760627/how-to-list-installed-font-families
    ]   
]

;text variables:
quote: {We will never transform our prevailing system of management without transforming the prevailing system of education — they are the same system.}      
signature: {Edwards Deming}
signature-decoration-before: {-- } 
signature-decoration-after: {}

;image:
image-background: load https://i.imgur.com/OKiw0yU.jpg


;resources
font-courrier: "Courier New"
font-lucida-calligraphy: "Lucida Calligraphy"
font-georgia: "Georgia"

bigRect: 1023x728

blue-marine: 47.63.142
dark-grey: 54.54.54

;for text on dark-grey
dark-green-pale: 152.215.216

glyph-position: 466x100
quote-position: 50x266
signature-position: 0x600

font-quote: make font! [ name: font-courrier size: 36 color: white]

quote-size: make pair! compose [(bigRect/1 - (2 * quote-position/1)) (signature-position/2)]

font-signature: make font! [ name: font-quote/name 
    size: ((36 / 3) * 2) 
color: font-quote/color]

signature-size: make pair! compose [(bigRect/1 - (2 * signature-position/1)) 100]

font-glyph: make font! [ name: font-georgia size: 144 color: white]
glyph-size: make pair! compose [(bigRect/1 - (2 * glyph-position/1)) 100]

win: [

    title {Miniapps.red - Meme Quote}

    origin 0x0 space 0x0

    base (bigRect) 
    draw [
        ;fill-pen linear 0.0.0 (blue-marine) 0x0 (big-rectangle) 
        fill-pen (blue-marine)
        box 0x0 (bigRect)
    ]

    at 0x0
    panel (bigRect) [

        backdrop (blue-marine)
        at 0x0 image (image-background)

        at (quote-position)
        text (quote-size) font (font-quote) wrap center
        (quote)

        at (signature-position)
        text (signature-size) font (font-signature) wrap center
        (rejoin [signature-decoration-before signature signature-decoration-after])

        at (glyph-position)
        text (glyph-size) font (font-glyph) center {“}
    ]

]

view layout compose/deep win