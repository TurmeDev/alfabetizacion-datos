from pathlib import Path

import pypdfium2 as pdfium


PDF = Path("entregas/entregable-1/generated/Guia_Entregable_1_Startup_Educativa_COMPLETADA_CriterIA.pdf")
OUT_DIR = Path("entregas/entregable-1/generated/completed-guide-pdf-pages")


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    doc = pdfium.PdfDocument(str(PDF))
    print("pages", len(doc))
    for index, page in enumerate(doc):
        bitmap = page.render(scale=2.0).to_pil()
        output = OUT_DIR / f"page-{index + 1:02d}.png"
        bitmap.save(output)
        print(output)


if __name__ == "__main__":
    main()
