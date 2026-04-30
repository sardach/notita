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

- Aplicacion principal instalada: `~/.local/bin/notita`
- Lanzador de menu: `~/.local/share/applications/notita.desktop`
- Icono: `~/.local/share/icons/hicolor/scalable/apps/notita.svg`
- Estado persistente: `~/.local/state/notita/history.json`

## Comportamiento

- Abre una nota vacia y editable.
- Aparece cerca del cursor, con fallback al centro.
- Mantiene historial local con restauracion por cantidad.
- Soporta mover, resize, opacidad, colores, fuente y modo solo lectura.

## Uso

```bash
notita
notita --restore
notita --restore 2
notita --restore all
notita --read-only
```
