# Notita flotante discreta (Openbox)

Fecha: 2026-04-30

## Objetivo
Crear una utilidad invocable por comando/atajo para capturar texto rápido y mostrarlo como notita flotante, discreta, movible, redimensionable y apta para múltiples instancias simultáneas.

## Entregables
- Comando unico: `/home/chema/.local/bin/notita`
- Fuente principal del proyecto: `/home/chema/proyectos/notita/src/notita`
- Wrapper estable del proyecto: `/home/chema/proyectos/notita/notita`
- Atajo Openbox: `Alt+Shift+N` (`A-S-n`)

## Comportamiento
- Si ejecutas `notita` sin argumentos, pide el texto en un input.
- Si pasas texto, crea la nota directo.
- Cada nota:
  - no forzada a siempre visible (más sigilo),
  - diseño sobrio y pequeño,
  - arrastre por barra superior,
  - resize por esquina inferior derecha,
  - cierre con `Esc` o botón `×`.
- Soporta muchas notas abiertas a la vez (una ventana por proceso).

## Máxima del proyecto: máximo sigilo
- Se cambió a **modo fantasma real** (sin look de post-it).
- Sin barra, sin botones, sin marco visible.
- Opacidad dual:
  - inactiva: `0.18` (casi invisible)
  - activa/en foco: `0.72`
- Mover: `Alt + arrastrar clic izquierdo`.
- Redimensionar: arrastrar el grip discreto en esquina inferior derecha.
- Redimensionar alterno: `Ctrl+Alt + arrastrar clic izquierdo`.
- Cerrar: `Esc` o `Ctrl+Q`.
- Colores neutros/grises para no llamar la atención.

## Flujo actualizado
- `notita` abre directamente una nota vacia editable (sin paso de input previo).
- Al abrir, fuerza foco y modo edicion de forma permanente por defecto.
- Solo sale de edicion si se usa `--read-only`.
- Edicion del texto en caliente siempre activa.
- Clic derecho abre menu contextual de configuracion.
- Cada cambio se guarda en historial local para restauracion posterior.
- Posicion de apertura: cerca del cursor; fallback al centro de la pantalla.
- Tamano inicial por defecto minimo para nota vacia: `140x70`.

## Historial y restauracion
- Archivo de estado: `~/.local/state/notita/history.json`
- Al cerrar o editar, cada nota guarda:
  - texto
  - posicion (`x`,`y`)
  - tamano (`width`,`height`)
  - opacidades
  - colores
  - fuente
  - topmost
- No se guardan notas vacias: si el texto queda vacio, se elimina del historial.
- Al restaurar, cada nota reaparece en su lugar/tamano guardado.

Comandos:
```bash
notita --restore          # abre un input para elegir cuantas restaurar
notita --restore 2        # restaura 2 recientes
notita --restore 8        # restaura 8 recientes
notita --restore all      # restaura todas
```

## Menu contextual (clic derecho)
- Nueva nota vacia
- Duplicar nota
- Historial:
  - Restaurar 2 recientes
  - Restaurar N...
  - Restaurar todas
  - Limpiar historial (confirmacion escribiendo `LIMPIAR`)
- Limpiar texto
- Editar ancho/alto
- Fuente (+) / Fuente (-)
- Cambiar fuente... (familia y tamano)
- Opacidad:
  - Mas visible
  - Mas sigilo
  - Set opacidad activa
  - Set opacidad inactiva
- Colores:
  - Color de fondo
  - Color de texto
- Siempre encima (toggle)
- Bloquear edicion (toggle)
- Cerrar nota

Notas:
- El estado de bloqueo de edicion tambien se guarda en historial y se restaura.

## Ajustes recientes de UX
- Se elimino el lanzador legado `notita-rapida`; ahora todo es `notita`.
- El atajo `Alt+Shift+N` lanza directamente `/home/chema/.local/bin/notita`.
- Se anadio icono de arrastre en esquina inferior izquierda.
- Se corrigio el bug de arrastre: cursor y nota ahora permanecen sincronizados al mover.
- Se anadio modo "atravesable": la nota permanece visible encima pero deja pasar clics a la ventana de abajo.

## Flags utiles
```bash
notita --restore
notita --restore 2
notita --restore all
notita --read-only
notita --no-topmost
notita --frameless
```

Notas de flags:
- `--frameless` existe como opcion avanzada; puede afectar el enfoque/escritura segun WM.
- `topmost` esta activo por defecto.

## Uso
```bash
notita-rapida
notita-rapida "Recordar llamada 18:00"
notita --width 300 --height 180 --opacity 0.9 "Nota"
```

## Atajo configurado
Archivo: `/home/chema/.config/openbox/rc.xml`

Bloque agregado:
```xml
<keybind key="A-S-n">
  <action name="Execute">
    <command>/home/chema/.local/bin/notita</command>
  </action>
</keybind>
```

Se recargó Openbox con:
```bash
openbox --reconfigure
```

## Mapa de desarrollo aplicado (resumen)
1. Idea base: notita flotante mínima y discreta.
2. Restricciones: bajo consumo visual, sin dependencias externas.
3. Criterio mínimo de éxito: crear nota con input y mover/resize.
4. Primer logro crítico: lanzar nota por comando estable.
5. Necesidad cubierta: captura de recordatorios no intrusivos.
6. Investigación: stack nativo (Python + Tkinter) disponible en sistema.
7. Recursos: sin logos ni assets; UI minimalista.
8. Diseño: paleta neutra y tamaño compacto.
9. Lenguaje/entorno: Python 3 en Linux/Openbox.
10. Sintaxis: argparse + tkinter.
11. Paradigma: script simple, instancia por nota.
12. Documentación a mano: ayuda CLI (`--help`) y este archivo.
13. Arquitectura: input -> ventana -> eventos drag/resize/cierre.
14. Especificaciones: parámetros `--width`, `--height`, `--opacity`.
15. Plan: implementar, enlazar atajo, verificar ejecución.
16. Ejecución: scripts creados en `~/.local/bin`.
17. Testing: `py_compile`, `--help`, recarga Openbox.
18. Correcciones: ajuste de atajo a `Alt+Shift+N`.
19. Deploy: operativo en sesión actual tras `openbox --reconfigure`.
