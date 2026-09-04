param(
  [Parameter(Mandatory = $true)]
  [string]$Source
)

$ErrorActionPreference = "Stop"

$OutDir = Join-Path $PSScriptRoot "generated"
$DocxOut = Join-Path $OutDir "Guia_Entregable_1_Startup_Educativa_COMPLETADA_CriterIA.docx"
$PdfOut = Join-Path $OutDir "Guia_Entregable_1_Startup_Educativa_COMPLETADA_CriterIA.pdf"

$FlowImages = @(
  (Join-Path $OutDir "flujograma-01_inicio_actividad_1.png"),
  (Join-Path $OutDir "flujograma-02_actividad_2_3.png"),
  (Join-Path $OutDir "flujograma-03_actividad_4.png"),
  (Join-Path $OutDir "flujograma-04_actividad_5.png"),
  (Join-Path $OutDir "flujograma-05_actividad_6.png"),
  (Join-Path $OutDir "flujograma-06_actividad_7.png"),
  (Join-Path $OutDir "flujograma-07_actividad_8.png"),
  (Join-Path $OutDir "flujograma-08_actividad_9_fin.png")
)

$Description = @'
"Dos Tonos" es una experiencia de alfabetización de datos para estudiantes de educación media dentro de la Estación 2 del proyecto Startup Educativa. El estudiante realiza una consulta sobre candidatos políticos y observa dos respuestas generadas a partir de la misma base de información verificada. Una respuesta se presenta en tono neutro y otra con un encuadre intencionalmente diferente, para que el estudiante compare cómo cambia la percepción cuando se resaltan u omiten ciertos aspectos. La actividad no busca orientar el voto, sino enseñar que los datos, aunque sean los mismos, pueden comunicarse de maneras distintas. Durante la estación, el equipo guía la comparación, registra observaciones acordadas con Control de Gestión y deja evidencia del proceso para su evaluación posterior.
'@

$Conclusion = @'
Al analizar "Dos Tonos" como un proceso de servicio, el equipo CriterIA aprendió tres cosas centrales. Primero, descomponer la Estación 2 en actividades discretas hace visibles dependencias que podrían pasar desapercibidas: la demostración depende de contar con una herramienta operativa, una base de información verificada, apoyo de facilitación, condiciones logísticas y datos definidos para evaluación. Segundo, los puntos de control son tan importantes como las actividades mismas: cada avance debe cerrar con una verificación concreta, como guía comprendida, dinámica educativa confirmada, fichas verificadas, chatbot validado, estación lista, datos registrados y evidencia ordenada. Tercero, el servicio debe explicar la IA sin tecnicismo excesivo: el aprendizaje central no es programar un modelo, sino observar que una misma base de datos puede presentarse con distintos tonos y producir percepciones diferentes.

Los principales aspectos a mejorar antes de la implementación son: definir con precisión el alcance del sub-equipo B, completar la revisión humana de las tres fichas ficticias, confirmar la herramienta de apoyo, probar el chatbot en condiciones reales y acordar con Control de Gestión qué datos se registrarán. El flujograma ayuda a distinguir qué puede prepararse en paralelo y qué depende de una secuencia obligatoria.
'@

$Activities = @(
  @("1", "Analizar la guía y el contexto", "Todos", "Reunión inicial", "Guía, mapa visual y consignas del docente", "Guía comprendida y dudas listadas"),
  @("2", "Diseñar el servicio", "Todos", "Sesión de diseño", "Notas de la actividad 1", "Dinámica educativa definida y explicable"),
  @("3", "Seleccionar la herramienta de apoyo", "Lucas y Diego", "Trabajo individual y puesta en común", "Acceso a herramientas de IA", "Herramienta elegida para la estación"),
  @("4", "Preparar fichas de candidatos ficticios", "Arnold y Mathias", "Trabajo individual y revisión cruzada", "ADR-0003, plantilla y checklist", "Tres fichas sintéticas aprobadas"),
  @("5", 'Preparar el chatbot "Dos Tonos"', "Lucas y Mathias", "Trabajo de preparación", "Base de candidatos y herramienta seleccionada", "Chatbot listo para demostración"),
  @("6", "Preparar la demostración de la Estación 2", "Todos + sub-equipo B", "Trabajo previo al evento", "Guion y lista de verificación", "Estación lista para operar"),
  @("7", "Prestar el servicio en el colegio", "Todos + sub-equipo B", "Colegio asignado", "Chatbot, dispositivo e internet", "Experiencia realizada y datos registrados"),
  @("8", "Cerrar la estación y ordenar evidencia", "Mathias y Arnold + Módulo 5", "Cierre posterior", "Observaciones, incidencias y datos", "Evidencia ordenada y usable"),
  @("9", "Elaborar el informe académico", "CriterIA completo", "Trabajo final", "Evidencia del servicio y guía", "Documento completo y alineado al servicio")
)

$Intervenientes = @(
  @("Equipo CriterIA (sub-equipo A, Módulo 2)", "Diseña el servicio, prepara el chatbot, valida la estación, acompaña la demostración y elabora el informe."),
  @("Sub-equipo B de Módulo 2", "Apoya la preparación de contenidos, materiales y facilitación durante la Estación 2."),
  @("Módulo 3: Logística y operación", "Coordina condiciones del evento: espacios, tiempos, movilidad, recepción y soporte operativo."),
  @("Módulo 5: Evaluación y análisis", "Define y recibe los datos/evidencias necesarios para analizar resultados e impacto."),
  @("Estudiantes de educación media", "Participan en la experiencia, realizan consultas y comparan las dos respuestas del chatbot.")
)

$Recursos = @(
  @("Guía del Entregable 1", "1, 2 y 9", "Equipo CriterIA"),
  @("Mapa visual del proyecto", "1, 2, 6 y 7", "CriterIA, sub-equipo B y Módulo 3"),
  @("Herramienta de IA / chatbot", "3, 5, 6 y 7", "Equipo CriterIA"),
  @("ADR-0003, plantilla y fichas sintéticas", "4 y 5", "Arnold y Mathias"),
  @("Base documental de candidatos", "4, 5 y 7", "Equipo CriterIA"),
  @("Guion de demostración y lista de verificación", "6 y 7", "CriterIA y sub-equipo B"),
  @("Dispositivo e internet", "6 y 7", "CriterIA y Módulo 3"),
  @("Registro de observaciones, incidencias y datos", "7 y 8", "CriterIA y Módulo 5")
)

$Controles = @(
  @("Comprensión inicial del encargo", "Si la guía, alcance y rol del equipo están claros.", "Equipo CriterIA", "Si hay dudas, se revisa la guía/mapa antes de diseñar."),
  @("Diseño del servicio", "Si la dinámica explica alfabetización de datos sin tecnicismo excesivo.", "Equipo CriterIA", "Si no es claro, se ajusta el objetivo educativo y el guion."),
  @("Herramienta de apoyo", "Si la herramienta permite operar el chatbot en la estación.", "Delegados + CriterIA", "Si no es viable, se elige otra opción disponible."),
  @("Base de candidatos", "Si las fichas están completas y verificadas.", "Delegados + revisión cruzada", "Si falta información, se corrige antes de preparar el chatbot."),
  @("Validación del chatbot", "Si ambos tonos leen la misma base y la diferencia está en la presentación.", "Equipo CriterIA", "Si falla, se corrigen instrucciones, ejemplos o fichas."),
  @("Registro para evaluación", "Si se guardaron observaciones y datos acordados con Módulo 5.", "CriterIA + Módulo 5", "Si falta evidencia, se registra la incidencia y se completa lo posible.")
)

function Set-ParagraphText {
  param($Paragraph, [string]$Text)
  $Paragraph.Range.Text = $Text + "`r"
}

function Set-CellText {
  param($Cell, [string]$Text, [int]$Size = 9)
  $Cell.Range.Text = $Text
  $Cell.Range.Font.Size = $Size
}

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
foreach ($Image in $FlowImages) {
  if (-not (Test-Path -LiteralPath $Image)) {
    throw "No existe la imagen requerida: $Image"
  }
}

$Word = New-Object -ComObject Word.Application
$Word.Visible = $false
$Word.DisplayAlerts = 0

try {
  $Doc = $Word.Documents.Open($Source, $false, $false)

  $DescriptionFilled = $false
  $FlowFilled = $false
  $ConclusionFilled = $false

  for ($i = 1; $i -le $Doc.Paragraphs.Count; $i++) {
    $Paragraph = $Doc.Paragraphs.Item($i)
    $Text = $Paragraph.Range.Text.Trim([char]13, [char]7, [char]11, " ")

    if ($Text.StartsWith("Equipo:")) {
      Set-ParagraphText $Paragraph "Equipo: CriterIA — Sub-equipo A del Módulo 2 (Contenido y Demostraciones)."
    } elseif ($Text.StartsWith("Tema:")) {
      Set-ParagraphText $Paragraph "Tema: Módulos 1 y 2 / Estación 2: Alfabetización de Datos — chatbot y base documental."
    } elseif ($Text.StartsWith("Nombre:")) {
      Set-ParagraphText $Paragraph 'Nombre: "Dos Tonos"'
    } elseif ($Text.StartsWith("________________________________________________________________") -and -not $DescriptionFilled) {
      Set-ParagraphText $Paragraph $Description
      $DescriptionFilled = $true
    } elseif ($Text.StartsWith("Nombre del proceso:")) {
      Set-ParagraphText $Paragraph "Nombre del proceso: Diseño, preparación y prestación de la Estación 2: Alfabetización de Datos."
    } elseif ($Text.StartsWith("Inicio del proceso:")) {
      Set-ParagraphText $Paragraph "Inicio del proceso: el equipo CriterIA recibe el componente asignado y define el objetivo educativo de la estación."
    } elseif ($Text.StartsWith("Fin del proceso:")) {
      Set-ParagraphText $Paragraph "Fin del proceso: estudiantes de educación media completan la experiencia y se registran los datos acordados para evaluación."
    } elseif ($Text.StartsWith("Usuario/beneficiario:")) {
      Set-ParagraphText $Paragraph "Usuario/beneficiario: estudiantes de educación media que recorren la Estación 2."
    } elseif ($Text.StartsWith("Resultado esperado:")) {
      Set-ParagraphText $Paragraph "Resultado esperado: experiencia educativa clara, guiada y medible sobre distintas formas de presentar una misma información."
    } elseif ($Text -eq "[Insertar aquí el diagrama]") {
      Set-ParagraphText $Paragraph "Diagrama preliminar del proceso: INICIO → analizar guía/contexto → diseñar servicio → seleccionar herramienta → recopilar fichas → preparar chatbot → preparar demostración → prestar servicio → ordenar evidencia → elaborar informe → FIN. Controles principales: ¿guía comprendida? → ¿objetivo claro? → ¿herramienta apta? → ¿información verificada? → ¿chatbot validado? → ¿estación lista? → ¿datos registrados? → ¿evidencia usable?"
      $FlowFilled = $true
    } elseif ($Text.StartsWith("Tipo de flujograma utilizado:")) {
      Set-ParagraphText $Paragraph "Tipo de flujograma utilizado:   ☒ Vertical    ☐ Horizontal    ☐ Otro: segmentado para lectura en Word/PDF"
    } elseif ($Text.StartsWith("Flujograma del proceso:")) {
      Set-ParagraphText $Paragraph "Flujograma del proceso: ver Anexo 1 al final del documento. Se presenta en segmentos para mantener la lectura. La secuencia completa corresponde a un flujograma vertical con decisiones y controles."
    } elseif ($Text.StartsWith("Justificación de la elección:")) {
      Set-ParagraphText $Paragraph "Justificación de la elección: se utiliza un flujograma vertical porque permite leer el proceso de arriba hacia abajo, siguiendo la secuencia natural de preparación, prestación y cierre del servicio. La simbología distingue actividades, decisiones/controles y resultados. Para evitar que el diagrama formal quede ilegible en una sola página, se presenta segmentado en el documento."
    } elseif ($Text.StartsWith("________________________________________________________________") -and $FlowFilled -and -not $ConclusionFilled) {
      Set-ParagraphText $Paragraph $Conclusion
      $ConclusionFilled = $true
    } elseif ($Text.StartsWith("Nombre del archivo:")) {
      Set-ParagraphText $Paragraph "Nombre del archivo sugerido: Equipo_CriterIA_Entregable_1_StartupEducativa.pdf"
    }
  }

  $Table = $Doc.Tables.Item(1)
  for ($r = 0; $r -lt $Activities.Count; $r++) {
    for ($c = 0; $c -lt 6; $c++) {
      Set-CellText $Table.Cell($r + 2, $c + 1) $Activities[$r][$c] 8
    }
  }

  $Table = $Doc.Tables.Item(2)
  while ($Table.Rows.Count -lt ($Intervenientes.Count + 1)) { $Table.Rows.Add() | Out-Null }
  for ($r = 0; $r -lt $Intervenientes.Count; $r++) {
    Set-CellText $Table.Cell($r + 2, 1) $Intervenientes[$r][0] 9
    Set-CellText $Table.Cell($r + 2, 2) $Intervenientes[$r][1] 9
  }

  $Table = $Doc.Tables.Item(3)
  while ($Table.Rows.Count -lt ($Recursos.Count + 1)) { $Table.Rows.Add() | Out-Null }
  for ($r = 0; $r -lt $Recursos.Count; $r++) {
    for ($c = 0; $c -lt 3; $c++) {
      Set-CellText $Table.Cell($r + 2, $c + 1) $Recursos[$r][$c] 8
    }
  }

  $Table = $Doc.Tables.Item(4)
  while ($Table.Rows.Count -lt ($Controles.Count + 1)) { $Table.Rows.Add() | Out-Null }
  for ($r = 0; $r -lt $Controles.Count; $r++) {
    for ($c = 0; $c -lt 4; $c++) {
      Set-CellText $Table.Cell($r + 2, $c + 1) $Controles[$r][$c] 8
    }
  }

  $EndRange = $Doc.Content
  $EndRange.Collapse(0)
  $EndRange.InsertBreak(7)
  $EndRange.InsertAfter("Anexo 1. Flujograma formal del proceso`r")
  $EndRange.InsertAfter("El flujograma se divide en segmentos para que pueda leerse en Word/PDF sin reducirlo hasta volverlo ilegible.`r")

  for ($idx = 0; $idx -lt $FlowImages.Count; $idx++) {
    if ($idx -gt 0) {
      $EndRange = $Doc.Content
      $EndRange.Collapse(0)
      $EndRange.InsertBreak(7)
    }
    $EndRange = $Doc.Content
    $EndRange.Collapse(0)
    $EndRange.InsertAfter("Segmento $($idx + 1) del flujograma formal.`r")
    $EndRange.Collapse(0)
    $Shape = $Doc.InlineShapes.AddPicture($FlowImages[$idx], $false, $true, $EndRange)
    $Shape.LockAspectRatio = $true
    $Shape.Width = 457
    $EndRange = $Doc.Content
    $EndRange.Collapse(0)
    $EndRange.InsertAfter("`r")
  }

  if (Test-Path -LiteralPath $DocxOut) { Remove-Item -LiteralPath $DocxOut -Force }
  if (Test-Path -LiteralPath $PdfOut) { Remove-Item -LiteralPath $PdfOut -Force }
  $Doc.SaveAs2($DocxOut, 16)
  $Doc.ExportAsFixedFormat($PdfOut, 17)
  $Doc.Close($false)
  Write-Output $DocxOut
  Write-Output $PdfOut
} finally {
  $Word.Quit()
}
