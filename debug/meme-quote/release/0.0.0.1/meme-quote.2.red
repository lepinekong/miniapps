Red [
    Title: "meme-quote.red"
    Build: 0.0.0.1
    Builds: [
        0.0.0.1.1 {Signature}
    ]
    Iterations: [
        0.0.0.1.0 {Initial version}
        0.0.0.1.1 {Signature - Pb: quote is truncated}
    ]    
]

bigRect: 1023x728

blue-marine: 47.63.142
dark-grey: 54.54.54

;for text on dark-grey
dark-green-pale: 152.215.216

font-quote: make font! [ name: "Lucida Calligraphy" size: 36 color: white]
quote-position: 70x266
quote-size: make pair! compose [(bigRect/1 - (2 * quote-position/1)) (bigRect/2 - (2 * quote-position/2))]

font-signature: make font! [ name: "Lucida Calligraphy" size: 18 color: white]
signature-position: 368x556
signature-size: make pair! compose [(bigRect/1 - (2 * signature-position/1)) 50]

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

        at (quote-position)
        text (quote-size) font (font-quote) wrap center
        {We will never transform our prevailing system of management without transforming the prevailing system of education — they are the same system.}      
    
        at (signature-position)
        text (signature-size) font (font-signature) wrap center
        {- Edwards Deming}
    ]

]

view layout compose/deep win