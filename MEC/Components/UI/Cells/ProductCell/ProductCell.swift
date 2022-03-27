import UIKit

struct ProductCellViewData {
    var productImageURL: URL? = URL(fileURLWithPath: .empty)
    var productName: String = .empty
    var productPrice: String = .empty
}

class ProductCell: UITableViewCell {
    private let productImageView = UIImageView(frame: .zero)
    private let nameLabel = UILabel(frame: .zero)
    private let priceLabel = UILabel(frame: .zero)

    var viewData: ProductCellViewData? {
        didSet {
            nameLabel.text = viewData?.productName
            priceLabel.text = viewData?.productPrice

            if let imageURL = viewData?.productImageURL {
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
        preparePriceLabel()
    }

    private func prepareProductImageView() {
        contentView.addAutoLayout(productImageView)

        productImageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            productImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            productImageView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor,
                constant: -32
            ),
            productImageView.heightAnchor.constraint(
                equalToConstant: 90
            ),
            productImageView.widthAnchor.constraint(
                equalToConstant: 80
            ),
        ])
    }

    private func prepareNameLabel() {
        contentView.addAutoLayout(nameLabel)

        nameLabel.textColor = .black
        nameLabel.numberOfLines = .zero

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: productImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(
                equalTo: productImageView.trailingAnchor,
                constant: 32
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
        ])
    }

    private func preparePriceLabel() {
        contentView.addAutoLayout(priceLabel)

        priceLabel.textColor = .black

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 16
            ),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            priceLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -32
            ),
        ])
    }
}
