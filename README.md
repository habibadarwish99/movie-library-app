# Movie Library 

A Flutter movie catalog with local poster artwork, live title and genre search, list and two-column grid layouts, and a shared tappable views badge.

## What this project demonstrates

- `Movie` uses final fields and a const named constructor. `movies` contains eight movies.
- `MovieCard` is a reusable `StatelessWidget` with a themed `Container`, rounded clipping and shadow, and a `Stack` with rating, bookmark, and year overlays.
- `HomePage` owns the search query, layout choice, and shared views value. It filters with `.where()` and `.toList()`, then uses `ListView.builder` or `GridView.builder`.
- Each card receives the same views value and a `VoidCallback`. Tapping the value calls `setState()` in `HomePage`, updating all cards together.
- Posters are stored in `assets/posters/` and loaded with `Image.asset()`.

## Run

From Android Studio, open this folder, wait for project sync, select an Android emulator, and run `lib/main.dart`.

Or from the project root:

```sh
flutter pub get
flutter run
```

Search for `action` to see title and genre matching. Tap the AppBar icon to switch layouts and tap a `20 views` badge to decrement the shared value.

Do not include the `build/` directory in a GitHub submission.
