# Suitmedia Mobile Developer Intern Test - Flutter

A professional, commercial-grade Flutter application built for the **Suitmedia Mobile Developer Intern Test**. The application is architected using **Feature-Driven Clean Architecture** and managed with **Provider** state management, adhering strictly to the **DRY (Don't Repeat Yourself)** and **SRP (Single Responsibility Principle)** software engineering guidelines.

---

## 🛠️ Tech Stack & Dependencies

- **Framework:** Flutter (v3.32+ or above)
- **State Management:** Provider `^6.1.2`
- **Network Client:** HTTP `^1.2.0`
- **Typography:** Google Fonts `^6.1.0` (Global Poppins configuration)
- **Image Performance:** Cached Network Image `^3.4.1` (Disk cache capability)
- **UX Shimmer Loader:** Shimmer `^3.0.0` (Skeleton view loading)

---

## 📐 Architecture & Directory Structure

The project strictly isolates dependencies, core functions, business logic, and visual presentations using the Clean Architecture paradigm:

    lib/
    ├── core/
    │   ├── constants/        # Global API routes and hardcoded endpoints
    │   ├── theme/            # Global application styles and font bindings
    │   └── utils/            # Pure computational utilities (e.g., Palindrome helper)
    ├── data/
    │   ├── models/           # Serializable network data layers (User Model)
    │   ├── repositories/     # Data abstraction boundaries connecting services to state
    │   └── services/         # Raw API communication clients
    ├── providers/            # Central application state orchestrators
    ├── screens/              # Feature-isolated modular screen components
    │   ├── first/
    │   ├── second/
    │   └── third/
    ├── widgets/              # Reusable UI buttons and text fields (DRY)
    └── main.dart             # Application root bootstrapper

---

## 🧪 Running Automated Unit Tests

To run the automated verification unit tests for the Palindrome validation algorithm execution, trigger the command in your terminal:

    flutter test test/palindrome_test.dart

---

## 🏁 Getting Started & Execution

1. Clone this repository into your workspace environment:
   ```bash
   git clone https://github.com/rezaluthfi/suitmedia-mobile-dev-intern
   ```

2. Navigate into the application root folder directory:
   ```bash
   cd suitmedia_mobile_dev_intern
   ```

3. Initialize dependency setups and pull configurations:
   ```bash
   flutter pub get
   ```

4. Run the development environment target instance:
   ```bash
   flutter run
   ```
