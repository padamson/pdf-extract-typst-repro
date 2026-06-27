# pdf-extract-typst-repro

Minimal reproduction of a text-extraction regression in
[`pdf-extract`](https://github.com/jrmuizel/pdf-extract) `0.12.0`:
`extract_text_from_mem` returns substitution-cipher text for multi-page
typst-generated PDFs. `0.10.0` extracts the same bytes correctly.

## Reproduce

```bash
cargo run
```

The committed `sample.pdf` is two pages. The second page should read
`The cat and the dog and the bird and the fish.` but comes out garbled on
`0.12.0`.

To confirm `0.10.0` is clean, change the dependency in `Cargo.toml` to
`pdf-extract = "=0.10.0"` and run again.

## What's here

- `sample.pdf` — the committed two-page PDF the repro runs against.
- `sample.typ` — the typst source it was generated from (typst 0.14.2, bundled
  fonts only).
- `src/main.rs` — reads `sample.pdf` and prints `extract_text_from_mem`.

The cause and a suggested fix are written up in the upstream issue:
https://github.com/jrmuizel/pdf-extract/issues/151.
