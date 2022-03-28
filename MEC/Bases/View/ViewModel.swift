import Foundation

protocol ViewModel: AnyObject {
    var coordinator: Coordinator? { get set }
}
