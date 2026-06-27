// Minimal trigger for the pdf-extract 0.12 font-cache regression.
//
// The bug needs two pages where the SAME font-resource name (typst emits
// /f0, /f1, ... per page in first-use order) maps to a DIFFERENT font on
// each page:
//
//   page 1: heading first  -> /f0 = New Computer Modern, /f1 = Libertinus
//   page 2: body first      -> /f0 = Libertinus
//
// pdf-extract 0.12 caches /f0 -> New Computer Modern from page 1 and reuses
// it on page 2, so page 2's body text is decoded with the wrong font's
// ToUnicode CMap and comes out as a substitution cipher.
//
// Both fonts are bundled with typst, so this compiles with
// `typst compile --ignore-system-fonts sample.typ sample.pdf`
// (committed PDF generated with typst 0.14.2).

#set page(width: 10cm, height: 6cm, margin: 1cm)
#set text(font: "Libertinus Serif")
#show heading: set text(font: "New Computer Modern")

= Heading in a different font

The cat and the dog.

#pagebreak()

The cat and the dog and the bird and the fish.
