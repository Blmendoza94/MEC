import UIKit

class HeaderCell: UITableViewCell {
    private let productImageView = UIImageView(frame: .zero)
    private let nameLabel = UILabel(frame: .zero)
    private let priceLabel = UILabel(frame: .zero)

    var viewData: HeaderCellViewData? {
        didSet {
            nameLabel.text = viewData?.productName
            priceLabel.text = viewData?.productPrice

            if let imageURL = viewData?.imageURL {
                productImageView.loadImage(url: imageURL)
            }
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
        prepareProductImageView()
        prepareNameLabel()
        preparePricelabel()
    }

    private func prepareProductImageView() {
        contentView.addAutoLayout(productImageView)

        productImageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 16
            ),
            productImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 40
            ),
            productImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -40
            ),
            productImageView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }

    private func prepareNameLabel() {
        contentView.addAutoLayout(nameLabel)

        nameLabel.textColor = .black
        nameLabel.numberOfLines = .zero

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(
                equalTo: productImageView.bottomAnchor, constant: 40
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
        ])
    }

    private func preparePricelabel() {
        contentView.addAutoLayout(priceLabel)

        priceLabel.textColor = .black

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor, constant: 20
            ),
            priceLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 16
            ),
            priceLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -16
            ),
            priceLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -50
            ),
        ])
    }
}
