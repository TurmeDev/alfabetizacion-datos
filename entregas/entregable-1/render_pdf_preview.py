from pathlib import Path

import pypdfium2 as pdfium

ROOT = Path(__file__).resolve().parents[2]
PDF = ROOT / "entregas" / "entregable-1" / "generated" / "Equipo_CriterIA_Entregable_1_StartupEducativa_PREVIEW.pdf"
OUT = ROOT / "entregas" / "entregable-1" / "generated" / "pdf-pages"
OUT.mkdir(parents=True, exist_ok=True)

pdf = pdfium.PdfDocument(str(PDF))
for i, page in enumerate(pdf, start=1):
    bitmap = page.render(scale=1.6)
    pil = bitmap.to_pil()
    path = OUT / f"page-{i:02d}.png"
    pil.save(path)
    print(path)
print(f"pages={len(pdf)}")
