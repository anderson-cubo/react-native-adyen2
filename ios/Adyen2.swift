import Foundation
import Adyen

@objc(Adyen2)
class Adyen2: NSObject {
    @objc
    func encryptCard(
          _ cardInfo:NSDictionary,
          resolver resolve: RCTPromiseResolveBlock,
          rejecter reject: RCTPromiseRejectBlock
        ) -> Void {
            let card = CardEncryptor.Card(
                number: cardInfo["number"] as? String,
                securityCode: cardInfo["cvc"] as? String,
                expiryMonth: cardInfo["expiryMonth"] as? String,
                expiryYear: cardInfo["expiryYear"] as? String
            )
            
            let publicKey = cardInfo["publicKey"] as! String;
            
            let encryptedCard = CardEncryptor.encryptedCard(for: card, publicKey: publicKey)
            
            resolve([
                "number": encryptedCard.number,
                "expiryYear": encryptedCard.expiryYear,
                "expiryMonth": encryptedCard.expiryMonth,
                "cvc": encryptedCard.securityCode
            ])
    }
}
