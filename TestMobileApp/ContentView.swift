import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let initials: String

    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
        let parts = name.split(separator: " ")
        self.initials = parts.map { String($0.prefix(1)) }.joined()
    }
}

struct ContentView: View {
    let contacts: [Contact] = [
        Contact(name: "Alice Johnson", phone: "+1 (555) 123-4567"),
        Contact(name: "Bob Smith", phone: "+1 (555) 234-5678"),
        Contact(name: "Carol Williams", phone: "+1 (555) 345-6789"),
        Contact(name: "David Brown", phone: "+1 (555) 456-7890"),
        Contact(name: "Eve Davis", phone: "+1 (555) 567-8901")
    ]

    var body: some View {
        NavigationStack {
            List(contacts) { contact in
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
                        Text(contact.name)
                            .font(.body)
                            .fontWeight(.medium)
                        Text(contact.phone)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Contacts")
        }
    }
}

#Preview {
    ContentView()
}
