import SwiftUI

/// Главный экран — список контактов с поиском
struct ContentView: View {
    @State private var contacts: [Contact] = Contact.samples
    @State private var searchText = ""
    @State private var showingAddContact = false

    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        }
        return contacts.filter { contact in
            contact.fullName.localizedCaseInsensitiveContains(searchText)
                || contact.phone.contains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredContacts) { contact in
                    NavigationLink(value: contact) {
                        ContactRow(contact: contact)
                    }
                }
                .onDelete(perform: deleteContacts)
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText, prompt: "Search contacts")
            .navigationDestination(for: Contact.self) { contact in
                ContactDetailView(contact: contact) { updatedContact in
                    if let index = contacts.firstIndex(where: { $0.id == updatedContact.id }) {
                        contacts[index] = updatedContact
                    }
                }
            }
            .overlay {
                if filteredContacts.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: AboutView()) {
                        Image(systemName: "info.circle")
                            .accessibilityLabel("About")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            showingAddContact = true
                        }) {
                            Image(systemName: "plus")
                        }
                        .accessibilityLabel("Add Contact")
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddContact) {
                AddContactView { newContact in
                    contacts.append(newContact)
                }
            }
        }
    }

    private func deleteContacts(at offsets: IndexSet) {
        let contactsToDelete = offsets.map { filteredContacts[$0] }
        for contact in contactsToDelete {
            if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
                contacts.remove(at: index)
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
