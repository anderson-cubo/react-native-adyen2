import { NativeModules, Platform } from 'react-native'

const { Adyen2 } = NativeModules

// export default Adyen2

export const encryptCard = async ({
  number,
  expiryMonth,
  expiryYear,
  cvc,
  publicKey
}) => {
  if (
    !number ||
    !expiryYear ||
    !expiryMonth ||
    !cvc ||
    !publicKey
  ) {
    throw new Error('You should send number, expiryMonth, expiryYear and publicKey')
  }
  const parameters = {
    number: String(number).replace(/[^0-9]/g, ''),
    expiryYear: Platform.select({
      ios: String(expiryYear).replace(/[^0-9]/g, ''),
      android: Number(String(expiryYear).replace(/[^0-9]/g, ''))
    }),
    expiryMonth: Platform.select({
      ios: String(expiryMonth).replace(/[^0-9]/g, ''),
      android: Number(String(expiryMonth).replace(/[^0-9]/g, ''))
    }),
    cvc: String(cvc).replace(/[^0-9]/g, ''),
    publicKey: String(publicKey)
  }

  return Adyen2.encryptCard(parameters)
}
