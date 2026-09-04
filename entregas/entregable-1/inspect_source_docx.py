from pathlib import Path

from docx import Document


SOURCE = Path(r"C:\Users\User\Downloads\Guia_Entregable_1_Startup_Educativa.docx")


def clean(text: str) -> str:
    return " / ".join(part.strip() for part in text.splitlines() if part.strip())


def main() -> None:
    print("exists", SOURCE.exists(), "size", SOURCE.stat().st_size if SOURCE.exists() else None)
    doc = Document(str(SOURCE))
    print("paragraphs", len(doc.paragraphs), "tables", len(doc.tables), "sections", len(doc.sections))
    for i, paragraph in enumerate(doc.paragraphs):
        text = clean(paragraph.text)
        if text:
            print(f"P{i:03d} [{paragraph.style.name}] {text[:240]}")
    print("--- TABLES ---")
    for ti, table in enumerate(doc.tables):
        print(f"TABLE {ti}: rows={len(table.rows)} cols={len(table.columns)}")
        for ri, row in enumerate(table.rows[:20]):
            cells = [clean(cell.text)[:120] for cell in row.cells]
            print(f"  R{ri:02d}: {cells}")


if __name__ == "__main__":
    main()
