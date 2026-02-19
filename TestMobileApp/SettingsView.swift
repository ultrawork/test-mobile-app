import SwiftUI

/// Экран настроек приложения
struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("appLanguage") private var appLanguage = "ru"

    var body: some View {
        Form {
            // Секция оформления
            Section(header: Text("Appearance")) {
                Toggle(isOn: $isDarkMode) {
                    HStack(spacing: 12) {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24)
                        Text("Dark Mode")
                    }
                }
            }

            // Секция уведомлений
            Section(header: Text("Notifications")) {
                Toggle(isOn: $notificationsEnabled) {
                    HStack(spacing: 12) {
                        Image(systemName: notificationsEnabled ? "bell.fill" : "bell.slash.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24)
                        Text("Enable Notifications")
                    }
                }
            }

            // Секция языка
            Section(header: Text("Language")) {
                Picker(selection: $appLanguage) {
                    Text("Russian").tag("ru")
                    Text("English").tag("en")
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "globe")
                            .foregroundColor(.blue)
                            .frame(width: 24)
                        Text("Interface Language")
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
