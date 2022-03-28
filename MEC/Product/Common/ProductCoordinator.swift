protocol ProductCoordinator: Coordinator {
    func goToProductList(_ searchText: String)
    func goToProductDetail(_ productId: String)
}
