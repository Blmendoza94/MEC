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
                equalTo: contentView.topAnchor,
                constant: HeaderCellConstants.ProductImageView.topAnchor
            ),
            productImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HeaderCellConstants.ProductImageView.leadingAnchor
            ),
            productImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: HeaderCellConstants.ProductImageView.trailingAnchor
            ),
            productImageView.heightAnchor.constraint(
                equalToConstant: HeaderCellConstants.ProductImageView.heightAnchor
            ),
        ])
    }

    private func prepareNameLabel() {
        contentView.addAutoLayout(nameLabel)

        nameLabel.textColor = .black
        nameLabel.numberOfLines = .zero

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(
                equalTo: productImageView.bottomAnchor,
                constant: HeaderCellConstants.NameLabel.topAnchor
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HeaderCellConstants.NameLabel.leadingAnchor
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: HeaderCellConstants.NameLabel.trailingAnchor
            ),
        ])
    }

    private func preparePricelabel() {
        contentView.addAutoLayout(priceLabel)

        priceLabel.textColor = .black

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: HeaderCellConstants.Pricelabel.topAnchor
            ),
            priceLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: HeaderCellConstants.Pricelabel.leadingAnchor
            ),
            priceLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: HeaderCellConstants.Pricelabel.trailingAnchor
            ),
            priceLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: HeaderCellConstants.Pricelabel.bottomAnchor
            ),
        ])
    }
}
