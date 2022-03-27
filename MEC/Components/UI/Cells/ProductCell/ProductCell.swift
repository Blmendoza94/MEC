import UIKit

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
                constant: ProductCellConstants.ProductImageView.topAnchor
            ),
            productImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: ProductCellConstants.ProductImageView.leadingAnchor
            ),
            productImageView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor,
                constant: ProductCellConstants.ProductImageView.bottomAnchor
            ),
            productImageView.heightAnchor.constraint(
                equalToConstant: ProductCellConstants.ProductImageView.heightAnchor
            ),
            productImageView.widthAnchor.constraint(
                equalToConstant: ProductCellConstants.ProductImageView.widthAnchor
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
                constant: ProductCellConstants.NameLabel.leadingAnchor
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: ProductCellConstants.NameLabel.trailingAnchor
            ),
        ])
    }

    private func preparePriceLabel() {
        contentView.addAutoLayout(priceLabel)

        priceLabel.textColor = .black

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: ProductCellConstants.PriceLabel.topAnchor
            ),
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: ProductCellConstants.PriceLabel.trailingAnchor
            ),
            priceLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: ProductCellConstants.PriceLabel.bottomAnchor
            ),
        ])
    }
}
