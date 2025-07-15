
# WayFinder

WayFinder is a powerful and flexible routing library for SwiftUI, built on top of [UIPilot](https://github.com/canopas/UIPilot) and [NavigationPilot](https://github.com/Promal-B/NavigationPilot). It simplifies navigation in your SwiftUI apps, making it easy to manage complex navigation flows with a clean and declarative API.

## Features

- [x] **Declarative Routing:** Define your navigation routes using a simple enum.
- [x] **Associated Values:** Pass data between views using associated values in your routes.
- [x] **Configuration Options:** Choose between `UINavigationController` (`uiKit`), `NavigationStack` (`navigationStack`), or let the library decide automatically (`automatic`).
- [x] **Service-Based Navigation:** Centralize your navigation logic in a dedicated service class.
- [x] **TabView Support:** Use multiple `WayFinder` instances in a `TabView` for independent navigation stacks.
- [x] **Programmatic Navigation:** Push, pop, and pop to root programmatically.

## Installation

You can add WayFinder to your project using Swift Package Manager. In Xcode, go to **File > Add Packages...** and enter the following URL:

```
https://github.com/your-username/WayFinder.git
```

## Usage

### Basic Usage

1.  **Define your routes:**

```swift
import WayFinder

enum AppRoute: String, Hashable {
    case home
    case profile
    case settings
}
```

2.  **Create a `WayFinder` instance:**

```swift
import SwiftUI
import WayFinder

struct ContentView: View {
    @StateObject private var wayFinder = WayFinder<AppRoute>(initial: .home)

    var body: some View {
        WayFinderHost(wayFinder) { route in
            switch route {
            case .home:
                HomeView()
            case .profile:
                ProfileView()
            case .settings:
                SettingsView()
            }
        }
    }
}
```

3.  **Navigate between views:**

```swift
struct HomeView: View {
    @EnvironmentObject var wayFinder: WayFinder<AppRoute>

    var body: some View {
        VStack {
            Text("Home")
            Button("Go to Profile") {
                wayFinder.push(.profile)
            }
        }
    }
}
```

### Custom Routes with Associated Values

You can pass data between views using associated values in your routes:

```swift
enum CustomRoute: Equatable, Hashable {
    case home
    case userProfile(userId: String)
    case productDetail(productId: Int)
}
```

### Configuration Options

WayFinder can be configured to use `UINavigationController` (`.uiKit`), `NavigationStack` (`.navigationStack`), or let the library decide automatically (`.automatic`).

```swift
@StateObject private var wayFinder = WayFinder<AppRoute>(
    initial: .home,
    configuration: .automatic // or .uiKit, .navigationStack
)
```

### Service-Based Navigation

For more complex applications, you can centralize your navigation logic in a dedicated service class:

```swift
class NavigationService: ObservableObject {
    @Published var mainWayFinder = WayFinder<AppRoute>(initial: .home)

    func goToProfile() {
        mainWayFinder.push(.profile)
    }
}

struct AppView: View {
    @StateObject private var navigationService = NavigationService()

    var body: some View {
        WayFinderHost(navigationService.mainWayFinder) { route in
            // ...
        }
        .environmentObject(navigationService)
    }
}
```

### TabView Support

You can use multiple `WayFinder` instances in a `TabView` for independent navigation stacks:

```swift
struct MainView: View {
    @StateObject private var mainWayFinder = WayFinder<AppRoute>(initial: .home)
    @StateObject private var profileWayFinder = WayFinder<AppRoute>(initial: .profile)

    var body: some View {
        TabView {
            WayFinderHost(mainWayFinder) { route in
                // ...
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            WayFinderHost(profileWayFinder) { route in
                // ...
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
    }
}
```

## API

### `WayFinder<Route: Hashable>`

The main class for managing navigation. It takes a generic `Route` type that must conform to `Hashable`.

-   `init(initial: Route, configuration: WayFinder.Configuration = .automatic)`
-   `func push(_ route: Route)`
-   `func pop()`
-   `func popToRoot()`

### `WayFinderHost<Route: Hashable, Content: View>`

A view that hosts the navigation stack.

-   `init(_ wayFinder: WayFinder<Route>, @ViewBuilder content: @escaping (Route) -> Content)`

## Examples

The `Sample` directory contains a sample app demonstrating the features of WayFinder.

