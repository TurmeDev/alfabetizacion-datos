import argparse
from pathlib import Path

import pypdfium2 as pdfium

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_PDF = ROOT / "entregas" / "entregable-1" / "generated" / "Equipo_CriterIA_Entregable_1_StartupEducativa_PREVIEW.pdf"
DEFAULT_OUT = ROOT / "entregas" / "entregable-1" / "generated" / "pdf-pages"


def main() -> None:
    parser = argparse.ArgumentParser(description="Renderiza un PDF como imágenes PNG.")
    parser.add_argument("pdf", nargs="?", type=Path, default=DEFAULT_PDF)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()

    pdf_path = args.pdf.expanduser().resolve()
    output_dir = args.output_dir.expanduser().resolve()
    if not pdf_path.is_file():
        parser.error(f"No se encontró el PDF de entrada: {pdf_path}")

    output_dir.mkdir(parents=True, exist_ok=True)
    pdf = pdfium.PdfDocument(str(pdf_path))
    try:
        for index, page in enumerate(pdf, start=1):
            bitmap = page.render(scale=1.6)
            image = bitmap.to_pil()
            output = output_dir / f"page-{index:02d}.png"
            image.save(output)
            print(output)
        print(f"pages={len(pdf)}")
    finally:
        pdf.close()


if __name__ == "__main__":
    main()
