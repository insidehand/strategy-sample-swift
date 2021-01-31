import Foundation
public class Cart {
    struct CartError: LocalizedError {
        internal init(_ errorDescription: String) {
            self.errorDescription = errorDescription
        }

        var errorDescription: String
    }

    public init() {}

    public func shippingFee(_ shipper: String, _ length: Double, _ width: Double, _ height: Double, _ weight: Double) throws -> Double {
        switch shipper {
        case "black cat":
            if weight > 20 {
                return 500
            } else {
                return 100 + weight * 10
            }
        case "hsinchu":
            let size: Double = length * width * height
            if length > 100 || width > 100 || height > 100 {
                return size * 0.0000353 * 1100 + 500
            } else {
                return size * 0.0000353 * 1200
            }
        case "post office":
            let feeByWeight: Double = 80 + weight * 10
            let size = length * width * height
            let feeBySize = size * 0.0000353 * 1100
            return Swift.min(feeByWeight, feeBySize)
        default:
            throw CartError("shipper not exist")
        }
    }
}
