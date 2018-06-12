Red [
    Title: ".system.apps.weather"
]

weather: function ['.city [string! word! unset!] /out][

    .default.city: "paris"

    switch/default type?/word get/any '.city [
        unset! [
            .city: .default.city
            weather (.city)
        ]
        word! string! [

            .city: form .city

            if not value? '.system [
                sysRead: :read
            ]
            output: sysRead to-url rejoin ["http://wttr.in/" .city]

            parse output [(cum: copy "") thru "<pre>" 
            [some [copy text [to "<" | to "</"] (append cum text) [thru ">" | thru "/>"] ]] 
            copy text to "</pre>" (append cum text)]

            replace/all cum {&quot;} {"}
            parse cum [copy output to "Follow @igor_chubin"]

            either out [
                return output
            ][
                print output
            ]       

        ]
    ][
        throw-error 'script 'expect-arg .city
    ]

]

w: :weather

if not value? '.system [
    weather
]
