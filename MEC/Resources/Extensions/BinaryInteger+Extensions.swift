import Foundation

extension BinaryInteger {
    var toCLP: String {
        return "$\(Formatter.withSeparator.string(for: self) ?? .empty)"
    }
}
