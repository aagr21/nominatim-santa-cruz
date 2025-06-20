# Usa la imagen base oficial de Nominatim
FROM mediagis/nominatim:5.0

# Crea un directorio dentro del contenedor para los archivos
WORKDIR /nominatim

# Copia el archivo .osm.pbf al contenedor (asegúrate de tenerlo en el mismo directorio que el Dockerfile)
COPY santa_cruz.osm.pbf /nominatim/santa_cruz.osm.pbf

# Establece variables de entorno
ENV PBF_PATH=/nominatim/santa_cruz.osm.pbf \
    IMPORT_STYLE=full

# Ejecuta la importación al construir (opcional; puedes hacerlo manualmente si prefieres)
RUN ./init.sh /nominatim/santa_cruz.osm.pbf

# Expone el puerto de Nominatim
EXPOSE 8080

# Comando por defecto al iniciar el contenedor
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
