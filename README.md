# Bryan Reinosa Herrera
# Desarrollo de aplicaciones móviles


# Taller de persistencia

En este taller estamos haciendo una aplicación en Flutter que muestra
un catálogo de productos. Al entrar a un producto, podemos escribir
una nota personal y escoger una prioridad

# Herramientas utilizadas

- Flutter y Dart para crear la aplicación
- HTTP y JSON para traer los productos de internet
- Drift y SQLite para guardar las notas en el celular
- Firebase Firestore para enviar y guardar una copia de las notas

 # iniciar App

1. Tener instalados Flutter, Android Studio y el SDK de Android
2. Abrir la carpeta del proyecto en VS Code
3. Abrir un emulador de Android
4. En la terminal, ejecutar:

   flutter pub get
   flutter run

# Respuestas:

1. ¿Para qué sirve pendingSync?

Sirve para saber si una nota está pendiente de enviarse a Firebase.
Si está en true, está pendiente; si está en false, ya se sincronizó.

# 2. ¿Por qué se guarda primero en Drift?

Para que la nota quede guardada en el dispositivo asi no haya internet
o falle Firebase.

# 3. ¿Qué función cumple el Repository?

Organiza el acceso a los datos. La pantalla le pide al Repository que
consulte o guarde la nota, y el repository se encarga de usar Drift y Firebase.

# 4. ¿Qué ocurre si Firebase falla?

La nota queda guardada en el dispositivo (local) y marcada como pendiente.
Después se puede intentar enviar con el botón de sincronización.