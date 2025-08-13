# Koute - Quote of the Day App

A simple, polished "Quote of the Day / Explore quotes" Flutter application.

## Features

- **Landing (Splash) Screen**: A welcoming screen with app branding.
- **Explore Screen**: Browse quotes with tag-based filtering and infinite scrolling.
- **Quote Detail Screen**: View full quote details, share, and favorite.
- **Favorites Screen**: Offline storage and display of your favorite quotes.
- **Theming**: Supports light and dark themes.

## Tech Stack

- **Flutter**: UI Toolkit.
- **State Management**: `flutter_bloc`.
- **Networking**: `dio`.
- **Offline Storage**: `shared_preferences` for favorites.
- **Routing**: `auto_route`.
- **Dependency Injection**: `get_it` + `injectable`.
- **Typography**: `google_fonts
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
- `GET https://api.quotable.io/quotes/random`
- `GET https://api.quotable.io/quotes?tags={tag}&page={page}&limit=20`
- `GET https://api.quotable.io/tags`

## Build and Run

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/mllrr96/koute
    cd koute
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

## License
This project is licensed under the MIT License. See the [LICENSE](https://github.com/mllrr96/koute/blob/main/LICENSE) file for details.
