param(
    [Parameter(Mandatory = $true)][string]$SourceDocx,
    [Parameter(Mandatory = $true)][string]$OutputDocx,
    [Parameter(Mandatory = $true)][string]$DiagramPng
)

$ErrorActionPreference = 'Stop'
Copy-Item -LiteralPath $SourceDocx -Destination $OutputDocx -Force
$word = New-Object -ComObject Word.Application
$word.Visible = $false

function Replace-ParagraphByPrefix {
    param($Document, [string]$Prefix, [string]$Replacement)
    $range = $Document.Content
    if (-not $range.Find.Execute($Prefix)) { throw "No se encontró el párrafo: $Prefix" }
    $paragraph = $range.Paragraphs.Item(1).Range
    $paragraph.End = $paragraph.End - 1
    $paragraph.Text = $Replacement
}

try {
    $doc = $word.Documents.Open((Resolve-Path $OutputDocx).Path)
    Replace-ParagraphByPrefix $doc 'Tipo de flujograma utilizado:' 'Tipo de flujograma utilizado:   ☐ Vertical    ☒ Horizontal    ☐ Otro: no aplica'
    Replace-ParagraphByPrefix $doc 'Flujograma del proceso:' 'Flujograma del proceso: ver Anexo 1 al final del documento. Se presenta en una hoja horizontal única, conservando las nueve actividades y todos sus subprocesos.'
    Replace-ParagraphByPrefix $doc 'Justificación de la elección:' 'Justificación de la elección: se utiliza una disposición horizontal de una sola hoja para conservar el detalle del flujograma formal sin dividirlo en segmentos. Cada bloque mantiene sus subprocesos, resultado y control; las flechas conectan la secuencia completa por filas.'

    $annex = $doc.Content
    if (-not $annex.Find.Execute('Anexo 1. Flujograma formal del proceso')) { throw 'No se encontró el Anexo 1.' }
    $annexStart = $annex.Start
    # The source annex starts after a manual page break. Remove that break so
    # the section break below is the sole page transition.
    $beforeAnnex = $doc.Range([Math]::Max(0, $annexStart - 6), $annexStart)
    $beforeAnnex.Text = $beforeAnnex.Text -replace [string][char]12, ''
    $replaceAnnex = $doc.Range($annexStart, $doc.Content.End - 1)
    $replaceAnnex.Text = ''

    # Begin a new final section at the Annex so the rest of the guide retains
    # its original portrait layout.
    $breakRange = $doc.Range($doc.Content.End - 1, $doc.Content.End - 1)
    $breakRange.InsertBreak(2) # wdSectionBreakNextPage
    $finalSection = $doc.Sections.Item($doc.Sections.Count)
    $finalSection.PageSetup.Orientation = 1 # wdOrientLandscape
    $finalSection.PageSetup.TopMargin = 28.8
    $finalSection.PageSetup.BottomMargin = 28.8
    $finalSection.PageSetup.LeftMargin = 28.8
    $finalSection.PageSetup.RightMargin = 28.8

    $imageRange = $doc.Range($doc.Content.End - 1, $doc.Content.End - 1)
    $shape = $doc.InlineShapes.AddPicture((Resolve-Path $DiagramPng).Path, $false, $true, $imageRange)
    $shape.LockAspectRatio = $true
    $shape.Width = 690

    $doc.Save()
    $doc.Close()
} finally {
    $word.Quit()
}
