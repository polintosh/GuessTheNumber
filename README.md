# GuessTheNumber

<img width="1221" alt="Captura de pantalla 2025-05-03 a las 16 08 58" src="https://github.com/user-attachments/assets/a9224f30-466b-4c31-9770-7974d01d892a" />

## Estructura del Projecte

Aquesta aplicació segueix una arquitectura **MVVM (Model-View-ViewModel)** per separar les responsabilitats i millorar l'organització del codi.

*   **`lib/`**: Conté tot el codi font Dart de l'aplicació.
    *   **`main.dart`**: Punt d'entrada de l'aplicació. Inicialitza Flutter i configura el widget principal (`MainApp`), incloent el `ChangeNotifierProvider` per al `ViewModel`.
    *   **`model/`**: Defineix les dades i la lògica de negoci.
        *   `game.dart`: Conté la classe `Game`, que gestiona tota la lògica del joc (valor objectiu, puntuació, rondes, càlcul de punts, gestió de marques).
        *   `mark.dart`: Defineix la classe `Mark` per representar una puntuació guardada.
        *   `app_colors.dart`: Centralitza els colors personalitzats de l'aplicació.
    *   **`view/`**: Conté els widgets que formen la interfície d'usuari (UI).
        *   `content_view.dart`: El widget principal interactiu, mostra el número objectiu, el slider i el botó "TRY". Gestiona l'estat local del slider.
        *   `background_view.dart`: Mostra els elements de fons com els botons de reinici/marques i la informació de puntuació/ronda.
        *   `components/`: Conté widgets reutilitzables per a la UI.
            *   `slider_widget.dart`: Un slider personalitzat amb etiquetes de mínim/màxim.
            *   `number_view.dart`: Mostra una etiqueta i un valor numèric dins d'un quadre.
            *   `rounded_view.dart`: Mostra una icona dins d'un cercle.
            *   `marks_view.dart`: Una pantalla separada per mostrar les millors puntuacions.
    *   **`viewmodel/`**: Connecta la Vista amb el Model.
        *   `view_model.dart`: La classe `ViewModel` que gestiona l'estat de la UI, exposa les dades del `Game` a la `View` i gestiona les accions de l'usuari (calcular punts, reiniciar, guardar marca) notificant els canvis a la UI mitjançant `ChangeNotifier`.

## Com funciona

1.  `main.dart` inicia l'app i proporciona el `ViewModel`.
2.  La `View` (`ContentView`, `BackgroundView` i els seus components) es construeix observant (`context.watch`) les dades del `ViewModel`.
3.  L'usuari interactua amb la `View` (mou el `SliderWidget`, prem botons).
4.  Les accions de la `View` criden mètodes del `ViewModel`.
5.  El `ViewModel` delega la lògica de negoci a la classe `Game` del `Model`.
6.  El `Model` actualitza el seu estat intern (puntuació, ronda, etc.).
7.  El `ViewModel` obté l'estat actualitzat del `Model` i notifica (`notifyListeners()`) a la `View` que les dades han canviat.
8.  La `View` es reconstrueix automàticament per reflectir el nou estat.
