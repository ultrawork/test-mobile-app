import SwiftUI

/// Экран "О приложении"
struct AboutView: View {
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
            }

            // Название приложения
            Text("TestMobileApp")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Версия
            Text("Version 1.0.0")
                .font(.headline)
                .foregroundColor(.secondary)

            // Описание
            Text("A simple contact management app for iOS. Browse, search and view your contacts with ease.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 32)

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
