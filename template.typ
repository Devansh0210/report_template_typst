#let title_page(
    title: "",
    authors: "",
    body
) = {

    align(center)[
        #text(title, size: 30pt)
    ]

    align(center)[
        #authors
    ]

    body
}


#let project(
  title: "",
  abstract: [],
  authors: (),
  logo: none,
  body
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set text(font: "New Computer Modern", lang: "en")
  show math.equation: set text(weight: 400)
  set heading(numbering: "1.1")
  set par(justify: true)

  // Title page.
  v(0.25fr)
  align(center)[
    #text(2em, weight: 700, title)
  ]

  // Author information.
  pad(
    top: 0.7em,
    grid(
      columns: (1fr),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.email \
        #author.affiliation \
        #author.postal \
        #author.phone
      ]),
    ),
  )

  // Logo
  if logo != none {
    v(0.25fr)
    align(center, image(logo, width: 26%))
    v(0.50fr)
  } else {
    v(0.75fr)
  }
  
  pagebreak()

  // Abstract page.
  set page(numbering: "I", number-align: center)
  v(1fr)
  align(center)[
    #heading(
      outlined: false,
      numbering: none,
      text(0.85em, smallcaps[Abstract]),
    )
  ]
  abstract
  v(1.618fr)
  counter(page).update(1)
  pagebreak()

  // Table of contents.
  outline(depth: 3, indent: true)
  pagebreak()


  // Main body.
  set page(numbering: "1", number-align: center)
  set par(first-line-indent: 20pt)
//   set page(header: getHeader())
  counter(page).update(1)
  body
}