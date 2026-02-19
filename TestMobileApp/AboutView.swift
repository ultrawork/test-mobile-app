import SwiftUI

/// Экран "О приложении"
struct AboutView: View {
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }

    private var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Иконка приложения
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 100, height: 100)
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.blue)
                    .accessibilityLabel("App Icon")
            }
            .accessibilityElement(children: .combine)

            // Название приложения
            Text("TestMobileApp")
                .font(.largeTitle)
                .fontWeight(.bold)
                .accessibilityIdentifier("appName")

            // Версия
            Text("Version \(appVersion) (\(buildNumber))")
                .font(.headline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("appVersion")

            // Описание
            Text("A simple contact management app for iOS. Browse, search and view your contacts with ease.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 32)
                .accessibilityIdentifier("appDescription")

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
