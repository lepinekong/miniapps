Red [
    Title: "niko.tomaas.red"
    References: [
        https://gitter.im/red/help?at=5b2a71567d3bca737af5ab8f
    ]
]

Sprint: 33
happy: at load-thru http://miniapps.red/images/moods/android/happy_48.png 1152
angry: at load-thru http://miniapps.red/images/moods/android/angry_48.png 1152
neutral: at load-thru http://miniapps.red/images/moods/android/neutral_48.png 1152

niko-calendar: [
    Member "Lucinda"
    Mon: Happy
    Tue: Happy
    Wed: Happy
    Thur: Neutral
    Fri: Neutral
    Mon: Happy
    Tue: Happy
    Wed: Neutral
    Mon: Happy
    Tue: Happy
    return
    Member "Theodore"
    Mon: Angry
    Tue: Neutral
    Wed: Angry
    Thur: Angry
    Fri: Angry
    Mon: Neutral
    Tue: Happy
    Wed: Neutral
    Thur: Angry
    Fri: Neutral  
    return
    Member "Virginia"
    Mon: Neutral
    Tue: Neutral
    Wed: Neutral
    Thur: Neutral
    Fri: Angry
    Mon: Happy
    Tue: Neutral
    Wed: Happy
    Thur: Happy
    Fri: Happy  
    return          
]
win: copy [
    title "niko calendar: Agile team's moods"
    backdrop white
    style Sprint: image 200x24 font-name "arial" font-size 12 
    style Day: image 48x24 font-name "arial" font-size 12 
    style Member: image 200x24 font-name "arial" font-size 12     
    style Happy: image 48x24 (happy)  
    style Angry: image 48x24 (angry) 
    style Neutral: image 48x24 (neutral)   

    Sprint (rejoin ["Sprint " Sprint])
    Mon: Day "Mon"
    Tue: Day "Tue"
    Wed: Day "Wed"
    Thur: Day "Wed"
    Thur: Day "Fri"
    Mon: Day "Mon"
    Tue: Day "Tue"  
    Wed: Day "Wed"
    Thur: Day "Wed"
    Fri: Day "Fri"
    return             
]
append win niko-calendar
view layout compose win