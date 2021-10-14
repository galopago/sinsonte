# REPRODUCTOR DE SONIDO BASADO EN RPI PICO

Reproductor de sonido basado en Rpi Pico. Almacena los datos de sonido en la memoria interna. Requiere muy pocos componentes externos y faciles de ensamblar. Fue diseñado con el objetivo de permanecer en modo espera durante muy largo tiempo alimentado por baterias. Puede usarse en relojes de pared musicales o como voz para alguna muñeca o juguete. Facil de ensamblar

![TARJETA](sinsonte.jpg)


Materializado de forma rapida y robusta mediante el sistema de prototipado [TUSISTEMITA](https://github.com/galopago/TUSISTEMITA).


Lea esto en otros idiomas: [English](../README.md)

## Estructura de directorios

* El directorio software contiene el codigo fuente del programa.
* El directorio hardware contiene el esquematico y circuito impreso.
* El directorio docs contiene archivos adicionales

## Como usar este repositorio
Hardware: El proyecto esta desarrollado en KiCad V6.3
* El directorio /hardware/ contiene el proyecto completo en KiCad.
* El directorio /hardware/gerber contiene los archivos de fabricacion del circuito impreso.
* El directorio /hardware/modules contiene footprints adicionales necesarios para poder editar el circuito impreso.
* El directorio /hardware/library contiene simbolos adicionales necesarios para poder editar el esquematico.

Software: 
* Copie el instalador de CircuitPython del directorio utils a la unidad de memoria USB.
* Copie el contenido del directorio lib al directorio lib de la unidad de memoria USB.
* Copie el archivo keys.conf al directorio raiz de la unidad de memoria USB.
* Copie el archivo code.py al directorio raiz de la unidad de memoria USB.(sobreescriba el archivo existente)
* Desconecte el puerto USB y conecte nuevamente
* Listo para usar!

## Enloquecio el puerto USB!
Si por alguna razon experimentando con el codigo se comete algun error, el puerto usb no responde o envia secuencias de teclas de forma muy rapida, se puede "formatear" la memoria haciendo lo siguiente: Desconecte el Rpi Pico, presione bootsel y mantenga presionado, conecte al computador y deje de presionar bootsel. Copi el archivo flash_nuke.uf2 que se encuentra en la carpeta util al directorio raiz de la unidad de memoria USB. Ahora el Rpi Pico esta como nuevo.

## Licencia
Este es un proyecto de Software Libre y esta licenciado bajo una licencia [MIT License](https://spdx.org/licenses/MIT.html)
