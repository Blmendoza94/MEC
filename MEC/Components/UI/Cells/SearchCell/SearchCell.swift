import UIKit

protocol SearchCellDelegate: AnyObject {
    func searchItem(_ searchText: String)
}

class SearchCell: UITableViewCell {
    private let searchTextField = PaddingTextField(frame: .zero)
    private let searchButton = PrimaryButton(frame: .zero)

    weak var delegate: SearchCellDelegate?

    var viewData: SearchCellViewData? {
        didSet {
            searchTextField.placeholder = viewData?.placeHolder
            searchButton.setTitle(viewData?.buttonTitle ?? .empty, for: .normal)
        }
    }

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

        searchTextField.layer.borderWidth = SearchCellConstants
            .SearchTextField.borderWidth
        searchTextField.layer.cornerRadius = SearchCellConstants
            .SearchTextField.cornerRadius
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchTextField.delegate = self

        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: SearchCellConstants.SearchTextField.topAnchor
            ),
            searchTextField.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: SearchCellConstants.SearchTextField.leadingAnchor
            ),
            searchTextField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: SearchCellConstants.SearchTextField.trailingAnchor
            ),
            searchTextField.heightAnchor.constraint(
                equalToConstant: SearchCellConstants.SearchTextField.heightAnchor
            ),
        ])
    }

    private func prepareSearchButton() {
        contentView.addAutoLayout(searchButton)

        searchButton.backgroundColor = .baseBlue
        searchButton.layer.cornerRadius = SearchCellConstants
            .SearchButton.cornerRadius
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.isEnabled = false
        searchButton.addTarget(
            self,
            action: #selector(searchButtonTapped),
            for: .touchUpInside
        )

        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(
                equalTo: searchTextField.bottomAnchor,
                constant: SearchCellConstants.SearchButton.topAnchor
            ),
            searchButton.leadingAnchor.constraint(
                equalTo: searchTextField.leadingAnchor,
                constant: SearchCellConstants.SearchButton.leadingAnchor
            ),
            searchButton.trailingAnchor.constraint(
                equalTo: searchTextField.trailingAnchor,
                constant: SearchCellConstants.SearchButton.trailingAnchor
            ),
            searchButton.heightAnchor.constraint(
                equalToConstant: SearchCellConstants.SearchButton.heightAnchor
            ),
            searchButton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: SearchCellConstants.SearchButton.bottomAnchor
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
