import SwiftUI

/// Экран добавления нового контакта
struct AddContactView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var showingValidationAlert = false

    var onSave: (Contact) -> Void

    var body: some View {
        NavigationStack {
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
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if firstName.trimmingCharacters(in: .whitespaces).isEmpty {
                            showingValidationAlert = true
                        } else {
                            let contact = Contact(
                                firstName: firstName.trimmingCharacters(in: .whitespaces),
                                lastName: lastName.trimmingCharacters(in: .whitespaces),
                                phone: phone,
                                email: email
                            )
                            onSave(contact)
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
}

#Preview {
    AddContactView { _ in }
}
