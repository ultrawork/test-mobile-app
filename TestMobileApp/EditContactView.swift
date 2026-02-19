import SwiftUI

/// Экран редактирования контакта
struct EditContactView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstName: String
    @State private var lastName: String
    @State private var phone: String
    @State private var email: String
    @State private var showingValidationAlert = false

    let contact: Contact
    var onSave: (Contact) -> Void

    init(contact: Contact, onSave: @escaping (Contact) -> Void) {
        self.contact = contact
        self.onSave = onSave
        _firstName = State(initialValue: contact.firstName)
        _lastName = State(initialValue: contact.lastName)
        _phone = State(initialValue: contact.phone)
        _email = State(initialValue: contact.email)
    }

    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("First Name", text: $firstName)
                    .accessibilityIdentifier("firstNameField")
                TextField("Last Name", text: $lastName)
                    .accessibilityIdentifier("lastNameField")
            }

            Section(header: Text("Contact Info")) {
                TextField("Phone", text: $phone)
                    .keyboardType(.phonePad)
                    .accessibilityIdentifier("phoneField")
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .accessibilityIdentifier("emailField")
            }
        }
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    if firstName.trimmingCharacters(in: .whitespaces).isEmpty {
                        showingValidationAlert = true
                    } else {
                        var updated = contact
                        updated.firstName = firstName.trimmingCharacters(in: .whitespaces)
                        updated.lastName = lastName.trimmingCharacters(in: .whitespaces)
                        updated.phone = phone
                        updated.email = email
                        onSave(updated)
                        dismiss()
                    }
                }
                .accessibilityIdentifier("saveButton")
            }
        }
        .alert("Validation Error", isPresented: $showingValidationAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("First name is required.")
        }
    }
}

#Preview {
    NavigationStack {
        EditContactView(contact: Contact.samples[0]) { _ in }
    }
}
