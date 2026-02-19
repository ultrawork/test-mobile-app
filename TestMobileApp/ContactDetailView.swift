import SwiftUI

/// Экран деталей контакта
struct ContactDetailView: View {
    let contact: Contact
    var onUpdate: ((Contact) -> Void)?

    var body: some View {
        VStack(spacing: 24) {
            // Аватар
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 100, height: 100)
                Text(contact.initials)
                    .font(.system(size: 40, weight: .medium))
                    .foregroundColor(.blue)
            }
            .padding(.top, 32)

            // Имя
            Text(contact.fullName)
                .font(.title)
                .fontWeight(.bold)

            // Контактная информация
            VStack(spacing: 0) {
                DetailRow(icon: "phone.fill", label: "Phone", value: contact.phone)
                Divider().padding(.leading, 56)
                DetailRow(icon: "envelope.fill", label: "Email", value: contact.email)
            }
            .background(Color(.systemGroupedBackground))
            .cornerRadius(12)
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Contact")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditContactView(contact: contact) { updatedContact in
                    onUpdate?(updatedContact)
                }) {
                    Text("Edit")
                }
                .accessibilityIdentifier("editButton")
            }
        }
    }
}

/// Строка с деталями
struct DetailRow: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.body)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(contact: Contact.samples[0])
    }
}
