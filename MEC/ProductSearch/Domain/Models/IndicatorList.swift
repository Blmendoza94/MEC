import Foundation

// swiftlint:disable identifier_name
struct IndicatorList: Codable {
    let version: String?
    let author: String?
    let date: String?
    let uf: Indicator?
    let ivp: Indicator?
    let dollar: Indicator?
    let changeDollar: Indicator?
    let euro: Indicator?
    let ipc: Indicator?
    let utm: Indicator?
    let imacec: Indicator?
    let tpm: Indicator?
    let poundCopper: Indicator?
    let unemploymentRate: Indicator?
    let bitcoin: Indicator?

    enum CodingKeys: String, CodingKey {
        case version
        case author = "autor"
        case date = "fecha"
        case uf
        case ivp
        case dollar = "dolar"
        case changeDollar = "dolar_intercambio"
        case euro
        case ipc
        case utm
        case imacec
        case tpm
        case poundCopper = "libra_cobre"
        case unemploymentRate = "tasa_desempleo"
        case bitcoin
    }
}
