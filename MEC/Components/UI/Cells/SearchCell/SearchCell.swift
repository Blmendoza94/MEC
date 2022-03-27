import UIKit

protocol SearchCellDelegate: AnyObject {
    func searchItem(_ searchText: String)
}

class SearchCell: UITableViewCell {
    private let searchTextField = PaddingTextField(frame: .zero)
    private let searchButton = PrimaryButton(frame: .zero)

    weak var delegate: SearchCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepare()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func prepare() {
        selectionStyle = .none
        prepareSearchTextField()
        prepareSearchButton()
    }

    private func prepareSearchTextField() {
        contentView.addAutoLayout(searchTextField)

        searchTextField.layer.borderWidth = 1
        searchTextField.layer.cornerRadius = 4
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchTextField.placeholder = "Buscar productos, marcas y más..."
        searchTextField.delegate = self

        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            searchTextField.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            searchTextField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            searchTextField.heightAnchor.constraint(
                equalToConstant: 50
            ),
        ])
    }

    private func prepareSearchButton() {
        contentView.addAutoLayout(searchButton)

        searchButton.backgroundColor = .baseBlue
        searchButton.layer.cornerRadius = 4
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.setTitle("Ir a buscar", for: .normal)
        searchButton.isEnabled = false
        searchButton.addTarget(
            self,
            action: #selector(searchButtonTapped),
            for: .touchUpInside
        )

        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(
                equalTo: searchTextField.bottomAnchor,
                constant: 16
            ),
            searchButton.leadingAnchor.constraint(
                equalTo: searchTextField.leadingAnchor,
                constant: 32
            ),
            searchButton.trailingAnchor.constraint(
                equalTo: searchTextField.trailingAnchor,
                constant: -32
            ),
            searchButton.heightAnchor.constraint(
                equalToConstant: 45
            ),
            searchButton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -16
            ),
        ])
    }

    @objc private func searchButtonTapped() {
        delegate?.searchItem(searchTextField.text ?? .empty)
    }
}

extension SearchCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text?.removeAll()
        searchButton.isEnabled = false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let isEmpty = textField.text?.isEmpty, !isEmpty else {
            return
        }
        searchButton.isEnabled = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
}
