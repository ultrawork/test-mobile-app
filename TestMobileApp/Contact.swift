import Foundation

/// Модель контакта
struct Contact: Identifiable, Hashable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let phone: String
    let email: String

    var fullName: String {
        "\(firstName) \(lastName)"
    }

    var initials: String {
        let first = firstName.prefix(1)
        let last = lastName.prefix(1)
        return "\(first)\(last)"
    }
}

/// Примеры контактов
extension Contact {
    static let samples: [Contact] = [
        Contact(firstName: "Alice", lastName: "Johnson", phone: "+1 (555) 123-4567", email: "alice@example.com"),
        Contact(firstName: "Bob", lastName: "Smith", phone: "+1 (555) 234-5678", email: "bob@example.com"),
        Contact(firstName: "Carol", lastName: "Williams", phone: "+1 (555) 345-6789", email: "carol@example.com"),
        Contact(firstName: "David", lastName: "Brown", phone: "+1 (555) 456-7890", email: "david@example.com"),
        Contact(firstName: "Eve", lastName: "Davis", phone: "+1 (555) 567-8901", email: "eve@example.com"),
        Contact(firstName: "Frank", lastName: "Miller", phone: "+1 (555) 678-9012", email: "frank@example.com"),
        Contact(firstName: "Grace", lastName: "Wilson", phone: "+1 (555) 789-0123", email: "grace@example.com")
    ]
}
