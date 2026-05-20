# Notita

Notita es una utilidad de escritorio para abrir notas flotantes, discretas y persistentes sobre el entorno de trabajo.

## Comando instalado

```bash
notita
```

## Atajo actual

```text
Alt + Shift + N
```

## Componentes

- Comando instalado: `~/.local/bin/notita`
- Wrapper del proyecto: `notita`
- Aplicacion principal: `src/notita`
- Lanzador de menu: `~/.local/share/applications/notita.desktop`
- Icono: `~/.local/share/icons/hicolor/scalable/apps/notita.svg`
- Estado persistente: `~/.local/state/notita/history.json`

## Instalacion local

```bash
./install-local.sh
```

## Comportamiento

- Abre una nota vacia y editable.
- Aparece cerca del cursor, con fallback al centro.
- Mantiene historial local con restauracion por cantidad.
- Soporta mover, resize, opacidad, colores, fuente y modo solo lectura.
- Soporta formato persistente por seleccion: negrita, italica, subrayado,
  tachado, codigo, resaltado, titulo y tamano relativo.
- Incluye barra superior auto-ocultable con opciones de formato.
- Permite insertar imagenes y GIFs animados como elementos flotantes; se pueden
  mover, redimensionar, ajustar a la nota o eliminar desde su menu.
- Permite soltar imagenes desde el gestor de archivos para agregarlas a la nota.
- Permite guardar la nota como `.txt` o `.md`; en Markdown copia las imagenes a
  una carpeta de assets junto al archivo.
- Muestra notas recientes en el menu Historial para abrirlas/restaurarlas con un clic.
- En X11 puede dejar pasar clics a las ventanas debajo con modo click-through.

## Uso

```bash
notita
notita --restore
notita --restore 2
notita --restore all
notita --read-only
notita --click-through "recordatorio visible pero no interactivo"
```

En modo click-through, el cuerpo de la nota deja pasar los clics. Los grips
inferiores siguen activos para poder mover, redimensionar o abrir el menu.

El soporte de arrastrar imagenes usa una `.venv` local con `tkinterdnd2`. El
instalador la crea si falta y el wrapper `notita` la usa automaticamente.

Atajos utiles dentro del texto: `Ctrl+A` selecciona todo, `Ctrl+C/X/V` copia,
corta y pega, `Ctrl+B/I/U` alterna negrita, italica y subrayado, `Ctrl+E`
alterna codigo, y `Ctrl+Z/Y` hace undo/redo.

## Licencia

GPL-3.0-or-later. Ver [LICENSE](LICENSE).
