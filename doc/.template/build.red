Red [
    Title: "build.red"
]

do read http://redlang.red/authoring.red

template: read %index.template.red
app: "eurusd"
out: build-markup template
write-clipboard out
