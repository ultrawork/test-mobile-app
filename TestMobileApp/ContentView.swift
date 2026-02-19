import SwiftUI

/// Главный экран — список контактов с поиском
struct ContentView: View {
    @State private var searchText = ""

    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return Contact.samples
        }
        return Contact.samples.filter { contact in
            contact.fullName.localizedCaseInsensitiveContains(searchText)
                || contact.phone.contains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredContacts) { contact in
                NavigationLink(value: contact) {
                    ContactRow(contact: contact)
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText, prompt: "Search contacts")
            .navigationDestination(for: Contact.self) { contact in
                ContactDetailView(contact: contact)
            }
            .overlay {
                if filteredContacts.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }
}

/// Строка контакта в списке
struct ContactRow: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 48, height: 48)
                Text(contact.initials)
                    .font(.headline)
                    .foregroundColor(.blue)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(contact.fullName)
                    .font(.body)
                    .fontWeight(.medium)
                Text(contact.phone)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
