# Souq Al-Khamis Admin App

## Overview
Souq Al-Khamis Admin is a complete Flutter-based mobile application designed to operate as the administrative dashboard for an e-commerce platform. It provides comprehensive controls for managing store categories, user items/products, orders, user notifications, and global application settings. This README serves as a technical breakdown to help AI models and developers quickly understand the project's architecture, dependencies, and structure.

## Architecture & Tech Stack
The project adheres to a clean, feature-driven modular architecture. It heavily leverages the **GetX** ecosystem for state management, dependency injection, and centralized routing.

### Core Technologies
- **Framework:** Flutter (SDK `^3.6.0`)
- **State Management, Routing & DI:** GetX
- **Backend Services:** Firebase (Authentication, Cloud Firestore, Cloud Messaging)
- **Local Storage:** SQLite (`sqflite`) & Shared Preferences
- **Mapping & Location:** Google Maps Flutter, Geolocator, Geocoding
- **Network Requests:** HTTP & Dio
- **Image Handling:** Cached Network Image, Image Picker, Image Compress, SVG rendering
- **UI & Animations:** Lottie, Auto Animated, Show Up Animation, Velocity X

---

## Folder Structure Summary

The codebase is organized primarily within the `lib/` directory:

```text
lib/
 ├── binding/      # Initial global bindings (dependency injection via GetX)
 ├── controller/   # Global controllers managing app-wide states
 ├── core/         # Core utilities and shared resources
 │   ├── class/         # Custom classes (e.g., API status, handling endpoints)
 │   ├── constant/      # Global constants (Colors, Theme, AppRoutes, API links)
 │   ├── function/      # Reusable helper functions (input validation, alerts, exit dialogs)
 │   ├── localization/  # Multi-language implementation (`ChangeLocal` controller)
 │   ├── middleware/    # Route guards (Authentication / App initialization checks)
 │   ├── services/      # Core global services (SharedPreferences, Firebase setup)
 │   └── shared/        # Shared presentation widgets across multiple features
 ├── data/         # Data layer (Repositories, Remote, and Local data sources)
 ├── features/     # Feature-based architecture housing main UI and logic modules
 │   ├── auth/          # Login workflow
 │   ├── categories/    # Product Categories (View, Add, Edit)
 │   ├── home/          # Admin Dashboard / Main Landing Page
 │   ├── items/         # Products/Items Inventory (View, Add, Edit)
 │   ├── notification/  # Push Notifications UI and handling logic
 │   ├── order/         # Order lists, order tracking, and status assignment
 │   └── setting/       # Administrative user preferences
 ├── firebase_options.dart # Firebase CLI-generated configuration
 ├── main.dart     # Application entry point, `GetMaterialApp` configuration
 └── routs.dart    # Centralized routing registry map
```

---

## Technical Deep Dive

### 1. Routing & Middleware
Routing is decoupled using GetX `GetPage` definitions found in `lib/routs.dart`.
Middleware (`Mymiddleware`) intercepts the initial route (`/`) to determine the user's login state via `SharedPreferences`. If already logged in, the user is redirected to `AppRoute.home`, bypassing the login screen.

### 2. State Management & Controllers
State is handled using the `GetxController` lifecycle.
Each module within `lib/features/` typically includes its own:
- **`view/`**: The declarative UI map.
- **`controller/`**: The View-Model logic.
- **`bindings/`**: The localized dependency definitions to initialize controllers lazily upon route entry.

### 3. Backend Integration (Firebase)
The admin panel interacts directly with Firebase services:
- **FCM (Firebase Cloud Messaging):** Handled in the `notification` feature.
- **Firestore/Storage:** Handled within `items` and `categories` logic to store image assets and product definitions.

### 4. Localization (`core/localization/`)
The app features built-in multi-language string tables. It leverages `GetMaterialApp`'s localization capabilities powered by a dedicated `LocaleController` handling the active theme and language preferences from local storage.

---

## Getting Started

### Prerequisites
- Install Flutter SDK `^3.6.0`
- Have an active Firebase Project configured for Android/iOS.
- API keys set for Google Maps integration.

### Setup Instructions
1. Clone the repository.
2. Install packages:
   ```bash
   flutter pub get
   ```
3. Add native Firebase config files:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
4. Run the project directly using:
   ```bash
   flutter run
   ```

## Development & Contribution Guidelines
- **Modularity:** Always keep new features encapsulated inside their respective `features/my_feature` folder, split into `view`, `controller`, and `bindings`.
- **Reusable Components:** If a widget is used in more than one feature, declare it in `lib/core/shared/`.
- **Strings and Constants:** Hardcoded strings/styles/colors should go into the `core/constant/` file definitions to uphold consistency and ease of future localization or theming.
