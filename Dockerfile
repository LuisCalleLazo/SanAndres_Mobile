# Usa la imagen oficial de Flutter (con Android SDK incluido)
FROM cirrusci/flutter:stable

# Configura el entorno de Android (acepta licencias)
RUN yes | sdkmanager --licenses && \
    flutter doctor --android-licenses

# Copia el código fuente al contenedor
WORKDIR /app
COPY . .

# Instala dependencias y compila la app
RUN flutter pub get