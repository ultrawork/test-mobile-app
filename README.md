# TestMobileApp

A minimal SwiftUI iOS app displaying a contacts list. Used for E2E testing with Ultrawork.

## Requirements

- Xcode 15.4+
- iOS 17.0+

## Build

```bash
xcodebuild -project TestMobileApp.xcodeproj -scheme TestMobileApp -sdk iphonesimulator -configuration Debug build
```

## Features

- **Contacts List**: Displays 5 sample contacts with name, phone number, and avatar initials
- **SwiftUI**: Built with modern SwiftUI and NavigationStack

