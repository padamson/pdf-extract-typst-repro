use std::fs;

fn main() {
    let bytes = fs::read("sample.pdf").expect("read sample.pdf");
    let text = pdf_extract::extract_text_from_mem(&bytes).expect("extract text");
    println!("{text}");
}
