import SwiftUI

/// Экран "О приложении"
struct AboutView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            // Иконка приложения
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 100, height: 100)
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 48))
                    .foregroundColor(.blue)
            }

            // Название приложения
            Text("TestMobileApp")
                .font(.title)
                .fontWeight(.bold)

            // Версия
            Text("Версия 1.0.0")
                .font(.subheadline)
                .foregroundColor(.secondary)

            // Описание
            Text("Тестовое мобильное приложение для проверки E2E тестирования")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal, 32)

            Spacer()

            // Кнопка "Назад"
            Button(action: {
                dismiss()
            }) {
                Text("Назад")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
        }
        .navigationTitle("О приложении")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
