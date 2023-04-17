#let title_page(
    title: "",
    authors: "",
    body
) = {

    set page(
        paper: "a4",
        margin: (x: 2cm, y: 2cm),
    )

    set heading(numbering: "1.1.1")
    show heading: it => block[
        #v(0.5em)
        #it.body
        #v(0.3em)
    ]

    set par(justify: true)

    set text(font: "Noto Serif", size: 12pt)

    v(1fr)
    align(right)[
        #text(title, size: 30pt)

        #text(authors, size: 15pt)
    ]
    v(1fr)
    pagebreak()

    counter(page).update(0)
    // counter(page).update(0)
    
    

    outline(
        title: "Table of Contents",
        depth: 3,
        indent: true,
        fill: repeat[.]
    )

    page(footer: [
            #align(center)[#line(length: 100%, angle: 0deg)]
            #set align(right)
            #set text(8pt)
            #counter(page).display(
                "1 / 1",
                both: true,
            )
        ],
        body
    )
}


#show: title_page.with(
    title: "Digital Control System",
    authors: "Devansh Tanna",
)

= Introduction
#lorem(200)

== Section-2
#lorem(100)

= Conclusions
#lorem(400)