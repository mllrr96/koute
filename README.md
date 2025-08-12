# Picked - Quote of the Day App

A simple, polished "Quote of the Day / Explore quotes" Flutter application.

## Features

- **Landing (Splash) Screen**: A welcoming screen with app branding.
- **Explore Screen**: Browse quotes with tag-based filtering and infinite scrolling.
- **Quote Detail Screen**: View full quote details, share, favorite, and get a new random quote.
- **Favorites Screen**: Offline storage and display of your favorite quotes.
- **Theming**: Supports light and dark themes.

## Tech Stack

- **Flutter**: UI Toolkit.
- **State Management**: `flutter_bloc`.
- **Networking**: `dio`.
- **Offline Storage**: `shared_preferences` for favorites.
- **Routing**: `auto_route`.
- **Dependency Injection**: `get_it` + `injectable`.
- **Typography**: `google_fonts` (Playfair Display, Manrope).
- **Sharing**: `share_plus`.
- **Pagination**: `infinite_scroll_pagination`.

## Project Structure

```
lib/
  core/ (constants, theme, failure)
  data/ (models, api, repositories)
  features/
    landing/
    explore/
    detail/
    favorites/
  widgets/ (reusable UI components)
```

## API

This app uses the [Quotable API](https://github.com/lukePeavey/quotable) for fetching quotes and tags. It's a free API with no authentication required.

**Endpoints Used:**
- `GET https://api.quotable.io/random`
- `GET https://api.quotable.io/quotes?tags={tag}&page={page}&limit=20`
- `GET https://api.quotable.io/tags`

## Build and Run

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd Picked
    ```

2.  **Get dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Generate code (for `freezed`, `injectable`, `auto_route`):**
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

    To run on a specific device:
    ```bash
    flutter run -d <device_id>
    ```
    (You can get device IDs by running `flutter devices`)

## Assets

This project expects the following placeholder assets in the `assets/images/` directory:

-   `landing_illustration.png`: A simple monochrome illustration for the landing screen.
-   `avatar_placeholder.png`: A small circular avatar placeholder used on quote cards (currently a simple `Icon` is used in `QuoteCard` for simplicity, but you can replace it with an `Image.asset` if you add this file).

**Note:** You will need to add these image files to the `assets/images/` directory for them to be displayed.

## Favorites Storage

Favorite quotes are stored locally using `shared_preferences`. They are saved as a list of JSON objects under the key `favorites_v1`. To clear favorites, you can typically clear the app data through your device's settings or uninstall and reinstall the app.

## App Icon and Signing for Google Play

To prepare your app for publishing to Google Play, you'll need to:

1.  **Add an App Icon:**
    -   Place your app icon files in the `android/app/src/main/res/mipmap-xxxx/` directories (e.g., `mipmap-hdpi`, `mipmap-mdpi`, etc.).
    -   Ensure your `android/app/src/main/AndroidManifest.xml` points to the correct icon (`android:icon="@mipmap/ic_launcher"`).
    -   For iOS, update `ios/Runner/Assets.xcassets/AppIcon.appiconset/`.

2.  **Generate a Keystore and Sign Your App:**
    -   Follow the official Flutter documentation for [signing your Android app](https://docs.flutter.dev/deployment/android#sign-the-app).
    -   This involves generating a keystore, creating a `key.properties` file, and configuring your `android/app/build.gradle` for signing.

3.  **Build for Release:**
    ```bash
    flutter build apk --release
    # or for AppBundle
    flutter build appbundle --release
    ```
    For iOS, build for release via Xcode.

## License

The Quotable API is free to use and does not require attribution. Please refer to their GitHub repository for any specific licensing details if you plan to use it in a commercial product.