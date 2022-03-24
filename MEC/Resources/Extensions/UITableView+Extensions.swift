import UIKit

extension UITableView {
    func registerNib(forCellClass cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }

    func registerNib(forHeaderFooterViewClass viewClass: UITableViewHeaderFooterView.Type) {
        let className = String(describing: viewClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell ?? Cell()
        return cell
    }

    func register<Cell: UITableViewCell>(with type: Cell.Type) {
        let identifier = String(describing: type)
        register(type, forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(with type: Cell.Type, for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: type)
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell ?? Cell()
        return cell
    }

    func dequeueReusableView<ViewType: UIView>(withClass viewClass: ViewType.Type) -> ViewType {
        let identifier = String(describing: viewClass)
        let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? ViewType ?? ViewType()
        return view
    }

    func dequeueReusableView<ViewType: UIView>() -> ViewType {
        let identifier = String(describing: ViewType.self)
        let view = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? ViewType ?? ViewType()
        return view
    }
}
