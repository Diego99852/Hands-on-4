#!/bin/bash
listar_directorio() {
    echo -n "Introduce la ruta absoluta del directorio: "
    read directorio
    if [ -d "$directorio" ]; then
        ls -l "$directorio"
    else
        echo "El directorio no existe."
    fi
}

crear_archivo() {
    echo -n "Introduce el nombre del archivo a crear: "
    read archivo
    echo -n "Introduce la línea de texto para almacenar en el archivo: "
    read texto
    echo "$texto" > "$archivo"
    echo "Archivo '$archivo' creado con éxito."
}

comparar_archivos() {
    echo -n "Introduce la ruta del primer archivo: "
    read archivo1
    echo -n "Introduce la ruta del segundo archivo: "
    read archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
        if [ $? -eq 0 ]; then
            echo "Los archivos son iguales."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no existen."
    fi
}

uso_awk() {
    echo "Ejemplo de uso de 'awk':"
    echo "Introduce la ruta del archivo de texto: "
    read archivo
    if [ -f "$archivo" ]; then
        echo "Contenido de la primera columna del archivo:"
        awk '{print $1}' "$archivo"
    else
        echo "El archivo no existe."
    fi
}

uso_grep() {
    echo "Ejemplo de uso de 'grep':"
    echo -n "Introduce la palabra a buscar: "
    read palabra
    echo -n "Introduce la ruta del archivo de texto: "
    read archivo
    if [ -f "$archivo" ]; then
        echo "Resultados de la búsqueda:"
        grep "$palabra" "$archivo"
    else
        echo "El archivo no existe."
    fi
}

while true; do
    echo "==============================="
    echo "       Menú de Servicios"
    echo "==============================="
    echo "1) Listar contenido de un fichero (directorio)"
    echo "2) Crear un archivo de texto con una línea"
    echo "3) Comparar dos archivos de texto"
    echo "4) Mostrar uso básico del comando 'awk'"
    echo "5) Mostrar uso básico del comando 'grep'"
    echo "6) Salir"
    echo -n "Elige una opción: "
    read opcion

    case $opcion in
        1) listar_directorio ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) uso_awk ;;
        5) uso_grep ;;
        6) exit 0 ;;
        *) echo "Opción no válida. Inténtalo de nuevo." ;;
    esac
done
