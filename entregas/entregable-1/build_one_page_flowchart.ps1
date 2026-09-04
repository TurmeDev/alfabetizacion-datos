param(
    [Parameter(Mandatory = $true)][string]$SourceDocx,
    [Parameter(Mandatory = $true)][string]$OutputDocx,
    [Parameter(Mandatory = $true)][string]$OutputPng,
    [string]$DiagramSourcePng
)

$ErrorActionPreference = 'Stop'

if ([System.Environment]::OSVersion.Platform -ne [System.PlatformID]::Win32NT) {
    throw 'build_one_page_flowchart.ps1 requiere Windows porque utiliza System.Drawing/GDI+.'
}

try {
    Add-Type -AssemblyName System.Drawing -ErrorAction Stop
} catch {
    throw "No se pudo cargar System.Drawing/GDI+ en Windows: $($_.Exception.Message)"
}

function Draw-CenteredText {
    param($Graphics, [string]$Text, $Font, $Brush, [System.Drawing.Rectangle]$Rect)
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    $format.Trimming = [System.Drawing.StringTrimming]::EllipsisWord
    $rectF = New-Object System.Drawing.RectangleF($Rect.X, $Rect.Y, $Rect.Width, $Rect.Height)
    $Graphics.DrawString($Text, $Font, $Brush, $rectF, $format)
    $format.Dispose()
}

function Draw-Arrow {
    param($Graphics, [int]$X1, [int]$Y1, [int]$X2, [int]$Y2, $Color)
    $pen = New-Object System.Drawing.Pen($Color, 3)
    $cap = New-Object System.Drawing.Drawing2D.AdjustableArrowCap(8, 9, $true)
    $pen.CustomEndCap = $cap
    $Graphics.DrawLine($pen, $X1, $Y1, $X2, $Y2)
    $cap.Dispose(); $pen.Dispose()
}

function Draw-Loop {
    param($Graphics, [int]$X, [int]$Top, [int]$Bottom, [bool]$LeftSide)
    $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(230, 69, 76), 2)
    $cap = New-Object System.Drawing.Drawing2D.AdjustableArrowCap(6, 7, $true)
    $pen.CustomEndCap = $cap
    $offset = if ($LeftSide) { -48 } else { 48 }
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddLines([System.Drawing.Point[]]@(
        (New-Object System.Drawing.Point($X, $Bottom)),
        (New-Object System.Drawing.Point(($X + $offset), $Bottom)),
        (New-Object System.Drawing.Point(($X + $offset), $Top)),
        (New-Object System.Drawing.Point($X, $Top))
    ))
    $Graphics.DrawPath($pen, $path)
    $path.Dispose(); $cap.Dispose(); $pen.Dispose()
}

$targetDir = Split-Path -Parent $OutputDocx
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
$pngDir = Split-Path -Parent $OutputPng
New-Item -ItemType Directory -Force -Path $pngDir | Out-Null

# A4 portrait at 150 dpi. The diagram is deliberately a one-page overview;
# detailed substeps remain documented in the body of the deliverable.
$width = 1654; $height = 2339
$bitmap = New-Object System.Drawing.Bitmap($width, $height)
$bitmap.SetResolution(150, 150)
$g = [System.Drawing.Graphics]::FromImage($bitmap)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
$g.Clear([System.Drawing.Color]::White)

$blue = [System.Drawing.Color]::FromArgb(218, 235, 255)
$blueStroke = [System.Drawing.Color]::FromArgb(28, 116, 234)
$yellow = [System.Drawing.Color]::FromArgb(255, 246, 202)
$yellowStroke = [System.Drawing.Color]::FromArgb(232, 168, 0)
$green = [System.Drawing.Color]::FromArgb(225, 247, 235)
$greenStroke = [System.Drawing.Color]::FromArgb(24, 137, 79)
$dark = [System.Drawing.Color]::FromArgb(28, 37, 53)
$gray = [System.Drawing.Color]::FromArgb(90, 99, 112)

$titleFont = New-Object System.Drawing.Font('Arial', 22, [System.Drawing.FontStyle]::Bold)
$subFont = New-Object System.Drawing.Font('Arial', 11, [System.Drawing.FontStyle]::Regular)
$nodeFont = New-Object System.Drawing.Font('Arial', 10, [System.Drawing.FontStyle]::Bold)
$smallFont = New-Object System.Drawing.Font('Arial', 8, [System.Drawing.FontStyle]::Regular)
$tinyFont = New-Object System.Drawing.Font('Arial', 7, [System.Drawing.FontStyle]::Regular)
$g.DrawString('Flujograma del proceso - Estación 2: Alfabetización de Datos', $titleFont, (New-Object System.Drawing.SolidBrush($dark)), 112, 45)
$g.DrawString('Equipo CriterIA | Flujo principal de preparación, prestación y cierre', $subFont, (New-Object System.Drawing.SolidBrush($gray)), 112, 86)

# Compact legend.
$legendPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(190, 200, 212), 1)
$g.DrawRectangle($legendPen, 112, 126, 1430, 72)
$g.FillEllipse((New-Object System.Drawing.SolidBrush($blue)), 145, 147, 28, 20)
$g.DrawEllipse((New-Object System.Drawing.Pen($blueStroke, 2)), 145, 147, 28, 20)
$g.DrawString('Operación', $smallFont, (New-Object System.Drawing.SolidBrush($dark)), 181, 149)
$g.FillRectangle((New-Object System.Drawing.SolidBrush($yellow)), 390, 145, 28, 24)
$g.DrawRectangle((New-Object System.Drawing.Pen($yellowStroke, 2)), 390, 145, 28, 24)
$g.DrawString('Inspección / control', $smallFont, (New-Object System.Drawing.SolidBrush($dark)), 427, 149)
$g.FillPolygon((New-Object System.Drawing.SolidBrush($green)), [System.Drawing.Point[]]@((New-Object System.Drawing.Point(719,145)),(New-Object System.Drawing.Point(745,157)),(New-Object System.Drawing.Point(719,170)),(New-Object System.Drawing.Point(693,157))))
$g.DrawString('Inicio / fin', $smallFont, (New-Object System.Drawing.SolidBrush($dark)), 757, 149)
$g.DrawString('Sí: continuar | No: corregir y repetir la actividad indicada', $smallFont, (New-Object System.Drawing.SolidBrush($gray)), 1010, 149)
$legendPen.Dispose()

$leftX = 150; $rightX = 910; $nodeW = 570; $nodeH = 66; $controlH = 54
$rows = @(300, 605, 910, 1215, 1520)
$leftActivities = @(
    '1. Analizar la guía y el contexto del proyecto',
    '2. Diseñar el servicio y la dinámica educativa',
    '3. Seleccionar la herramienta de apoyo',
    '4. Recopilar fichas de candidatos verificadas',
    '5. Preparar el chatbot “Dos Tonos”'
)
$leftControls = @(
    '¿Guía comprendida?',
    '¿Objetivo y dinámica claros?',
    '¿Herramienta apta para la estación?',
    '¿Fichas completas y verificadas?',
    '¿Chatbot validado?'
)
$rightRows = @(300, 690, 1080, 1470)
$rightActivities = @(
    '6. Preparar la demostración de la Estación 2',
    '7. Prestar el servicio: demostración en el colegio',
    '8. Cerrar la estación y ordenar la evidencia',
    '9. Elaborar el informe académico del proceso'
)
$rightControls = @(
    '¿Estación lista para operar?',
    '¿Experiencia y datos registrados?',
    '¿Evidencia completa y usable?',
    '¿Documento explica el servicio?'
)

function Draw-Stage {
    param([int]$X, [int]$Y, [string]$Activity, [string]$Control, [bool]$LoopLeft)
    $activityRect = [System.Drawing.Rectangle]::new($X, $Y, $nodeW, $nodeH)
    $g.FillEllipse((New-Object System.Drawing.SolidBrush($blue)), $activityRect)
    $g.DrawEllipse((New-Object System.Drawing.Pen($blueStroke, 3)), $activityRect)
    Draw-CenteredText $g $Activity $nodeFont (New-Object System.Drawing.SolidBrush($dark)) $activityRect
    Draw-Arrow $g ($X + [int]($nodeW / 2)) ($Y + $nodeH) ($X + [int]($nodeW / 2)) ($Y + 108) ([System.Drawing.Color]::FromArgb(50,55,64))
    $controlRect = [System.Drawing.Rectangle]::new(($X + 30), ($Y + 110), ($nodeW - 60), $controlH)
    $g.FillRectangle((New-Object System.Drawing.SolidBrush($yellow)), $controlRect)
    $g.DrawRectangle((New-Object System.Drawing.Pen($yellowStroke, 2)), $controlRect)
    Draw-CenteredText $g $Control $nodeFont (New-Object System.Drawing.SolidBrush($dark)) $controlRect
    if ($LoopLeft) { $labelX = $X + $nodeW + 8; $loopX = $X } else { $labelX = $X - 90; $loopX = $X + $nodeW }
    $g.DrawString('No: corregir', $tinyFont, (New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(210,50,55))), $labelX, ($Y + 132))
    Draw-Loop $g $loopX ($Y + 33) ($Y + 137) $LoopLeft
}

# Start symbol.
$start = New-Object System.Drawing.Rectangle(350, 215, 170, 42)
$g.FillPolygon((New-Object System.Drawing.SolidBrush($green)), [System.Drawing.Point[]]@((New-Object System.Drawing.Point(435,215)),(New-Object System.Drawing.Point(520,236)),(New-Object System.Drawing.Point(435,257)),(New-Object System.Drawing.Point(350,236))))
$g.DrawPolygon((New-Object System.Drawing.Pen($greenStroke, 2)), [System.Drawing.Point[]]@((New-Object System.Drawing.Point(435,215)),(New-Object System.Drawing.Point(520,236)),(New-Object System.Drawing.Point(435,257)),(New-Object System.Drawing.Point(350,236))))
Draw-CenteredText $g 'INICIO' $smallFont (New-Object System.Drawing.SolidBrush($dark)) $start
Draw-Arrow $g 435 257 435 296 ([System.Drawing.Color]::FromArgb(50,55,64))

for ($i = 0; $i -lt $leftActivities.Count; $i++) {
    Draw-Stage $leftX $rows[$i] $leftActivities[$i] $leftControls[$i] $true
    if ($i -lt ($leftActivities.Count - 1)) { Draw-Arrow $g 435 ($rows[$i] + 164) 435 ($rows[$i+1] - 4) ([System.Drawing.Color]::FromArgb(50,55,64)) }
}

# Connector across columns after activity 5.
$g.DrawLine((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(50,55,64), 3)), 435, 1684, 435, 1835)
$g.DrawLine((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(50,55,64), 3)), 435, 1835, 1195, 1835)
Draw-Arrow $g 1195 1835 1195 296 ([System.Drawing.Color]::FromArgb(50,55,64))
$g.DrawString('continuación', $tinyFont, (New-Object System.Drawing.SolidBrush($gray)), 760, 1818)

for ($i = 0; $i -lt $rightActivities.Count; $i++) {
    Draw-Stage $rightX $rightRows[$i] $rightActivities[$i] $rightControls[$i] $false
    if ($i -lt ($rightActivities.Count - 1)) { Draw-Arrow $g 1195 ($rightRows[$i] + 164) 1195 ($rightRows[$i+1] - 4) ([System.Drawing.Color]::FromArgb(50,55,64)) }
}

$finishY = 1715
Draw-Arrow $g 1195 1634 1195 $finishY ([System.Drawing.Color]::FromArgb(50,55,64))
$finish = New-Object System.Drawing.Rectangle(1095, $finishY, 200, 50)
$finishPoints = [System.Drawing.Point[]]@(
    [System.Drawing.Point]::new(1195, $finishY),
    [System.Drawing.Point]::new(1295, ($finishY + 25)),
    [System.Drawing.Point]::new(1195, ($finishY + 50)),
    [System.Drawing.Point]::new(1095, ($finishY + 25))
)
$g.FillPolygon((New-Object System.Drawing.SolidBrush($green)), $finishPoints)
$g.DrawPolygon((New-Object System.Drawing.Pen($greenStroke, 2)), $finishPoints)
Draw-CenteredText $g 'FIN: servicio cerrado y documentado' $smallFont (New-Object System.Drawing.SolidBrush($dark)) $finish

$note = New-Object System.Drawing.Rectangle(145, 1990, 1365, 145)
$g.FillRectangle((New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(246,248,251))), $note)
$g.DrawRectangle((New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(190,200,212), 1)), $note)
$noteText = 'Nota: el flujograma muestra el proceso principal en una sola página. Los subpasos y recursos de cada actividad se detallan en las partes II a IV del entregable; los retornos “No” obligan a corregir la actividad antes de continuar.'
Draw-CenteredText $g $noteText $smallFont (New-Object System.Drawing.SolidBrush($gray)) $note
$g.DrawString('Simbología basada en la convención de operaciones, controles e inicio/fin utilizada en la Unidad VI.', $tinyFont, (New-Object System.Drawing.SolidBrush($gray)), 145, 2180)

$bitmap.Save($OutputPng, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bitmap.Dispose()
if ($DiagramSourcePng) { Copy-Item -LiteralPath $DiagramSourcePng -Destination $OutputPng -Force }

# Patch a copy of the original package: retain page/body formatting, replace the
# first segment with the one-page image, and remove the remaining segment blocks.
Copy-Item -LiteralPath $SourceDocx -Destination $OutputDocx -Force
$unpack = Join-Path $targetDir 'docx-one-page-unpacked'
if (Test-Path $unpack) { Remove-Item -LiteralPath $unpack -Recurse -Force }
Expand-Archive -LiteralPath $OutputDocx -DestinationPath $unpack -Force
Copy-Item -LiteralPath $OutputPng -Destination (Join-Path $unpack 'word\media\image10.png') -Force

$docPath = Join-Path $unpack 'word\document.xml'
[xml]$doc = Get-Content -LiteralPath $docPath -Raw
$ns = New-Object System.Xml.XmlNamespaceManager($doc.NameTable)
$ns.AddNamespace('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
$ns.AddNamespace('a', 'http://schemas.openxmlformats.org/drawingml/2006/main')
$ns.AddNamespace('r', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships')
$ns.AddNamespace('wp', 'http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing')

foreach ($p in @($doc.SelectNodes('//w:p', $ns))) {
    $text = (($p.SelectNodes('.//w:t', $ns) | ForEach-Object { $_.InnerText }) -join '')
    if ($text -match '^El flujograma se divide en segmentos' -or $text -match '^Segmento 1 del flujograma formal') {
        $p.ParentNode.RemoveChild($p) | Out-Null
        continue
    }
    $replacement = switch -Regex ($text) {
        '^Tipo de flujograma utilizado:' { if ($DiagramSourcePng) { 'Tipo de flujograma utilizado:   ☐ Vertical    ☒ Horizontal    ☐ Otro: no aplica' } else { 'Tipo de flujograma utilizado:   ☒ Vertical    ☐ Horizontal    ☐ Otro: no aplica' }; break }
        '^Flujograma del proceso:' { if ($DiagramSourcePng) { 'Flujograma del proceso: ver Anexo 1 al final del documento. Se presenta en una hoja horizontal única, conservando las nueve actividades y todos sus subprocesos.' } else { 'Flujograma del proceso: ver Anexo 1 al final del documento. Se presenta en una sola página, con dos columnas conectadas para mantener una lectura vertical y legible.' }; break }
        '^Justificación de la elección:' { if ($DiagramSourcePng) { 'Justificación de la elección: se utiliza una disposición horizontal de una sola hoja para conservar el detalle del flujograma formal sin dividirlo en segmentos. Cada bloque mantiene sus subprocesos, resultado y control; las flechas conectan la secuencia completa de izquierda a derecha y por filas.' } else { 'Justificación de la elección: se utiliza un flujograma vertical porque permite leer el proceso de arriba hacia abajo, siguiendo la secuencia natural de preparación, prestación y cierre del servicio. Se organiza en dos columnas conectadas en una sola página para conservar la legibilidad sin fragmentar el proceso.' }; break }
        default { $null }
    }
    if ($null -ne $replacement) {
        $runs = @($p.SelectNodes('.//w:r', $ns))
        foreach ($run in $runs) { $p.RemoveChild($run) | Out-Null }
        $r = $doc.CreateElement('w', 'r', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
        $t = $doc.CreateElement('w', 't', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
        $t.InnerText = $replacement
        $r.AppendChild($t) | Out-Null; $p.AppendChild($r) | Out-Null
    }
}

$drawings = @($doc.SelectNodes('//w:p[.//a:blip]', $ns))
for ($i = 0; $i -lt $drawings.Count; $i++) {
    if ($i -eq 0) {
        $blip = $drawings[$i].SelectSingleNode('.//a:blip', $ns)
        $blip.SetAttribute('embed', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships', 'rId19')
        foreach ($extent in @($drawings[$i].SelectNodes('.//wp:extent | .//a:xfrm/a:ext', $ns))) {
            if ($DiagramSourcePng) { $extent.SetAttribute('cx', '8800000'); $extent.SetAttribute('cy', '6110000') } else { $extent.SetAttribute('cx', '4572000'); $extent.SetAttribute('cy', '6450000') }
        }
    } else {
        $drawings[$i].ParentNode.RemoveChild($drawings[$i]) | Out-Null
    }
}
foreach ($p in @($doc.SelectNodes('//w:p', $ns))) {
    $text = (($p.SelectNodes('.//w:t', $ns) | ForEach-Object { $_.InnerText }) -join '')
    if ($text -match '^Segmento [2-8] del flujograma formal') { $p.ParentNode.RemoveChild($p) | Out-Null }
}
# The original annex used a page break after each segment. Removing those
# breaks keeps the replacement as one continuous, one-page annex.
$sibling = $drawings[0].NextSibling
while ($null -ne $sibling) {
    $next = $sibling.NextSibling
    if ($sibling.LocalName -eq 'p' -and $null -ne $sibling.SelectSingleNode('.//w:br[@w:type="page"]', $ns)) {
        $sibling.ParentNode.RemoveChild($sibling) | Out-Null
    }
    $sibling = $next
}

if ($DiagramSourcePng) {
    $anexo = $doc.SelectSingleNode('//w:p[.//w:t[starts-with(., "Anexo 1.")]]', $ns)
    $finalSect = $doc.SelectSingleNode('/w:document/w:body/w:sectPr', $ns)
    $previousSect = $finalSect.CloneNode($true)
    $sectionType = $doc.CreateElement('w', 'type', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
    $sectionType.SetAttribute('val', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main', 'nextPage')
    $previousPageSize = $previousSect.SelectSingleNode('./w:pgSz', $ns)
    $previousSect.InsertBefore($sectionType, $previousPageSize) | Out-Null
    $sectionParagraph = $doc.CreateElement('w', 'p', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
    $sectionProperties = $doc.CreateElement('w', 'pPr', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
    $sectionProperties.AppendChild($previousSect) | Out-Null
    $sectionParagraph.AppendChild($sectionProperties) | Out-Null
    $anexo.ParentNode.InsertBefore($sectionParagraph, $anexo) | Out-Null
    $pgSz = $finalSect.SelectSingleNode('./w:pgSz', $ns)
    $pgSz.SetAttribute('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main', '15840')
    $pgSz.SetAttribute('h', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main', '12240')
    $pgSz.SetAttribute('orient', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main', 'landscape')
    $pgMar = $finalSect.SelectSingleNode('./w:pgMar', $ns)
    foreach ($margin in @('top', 'right', 'bottom', 'left')) { $pgMar.SetAttribute($margin, 'http://schemas.openxmlformats.org/wordprocessingml/2006/main', '540') }
}
$doc.Save($docPath)

$relsPath = Join-Path $unpack 'word\_rels\document.xml.rels'
[xml]$rels = Get-Content -LiteralPath $relsPath -Raw
$rel = $rels.CreateElement('Relationship', 'http://schemas.openxmlformats.org/package/2006/relationships')
$rel.SetAttribute('Id', 'rId19')
$rel.SetAttribute('Type', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image')
$rel.SetAttribute('Target', 'media/image10.png')
$rels.DocumentElement.AppendChild($rel) | Out-Null
$rels.Save($relsPath)

Remove-Item -LiteralPath $OutputDocx -Force
Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $OutputDocx -Force
