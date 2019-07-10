package com.reactlibrary;

import com.adyen.checkout.cse.Card;
import com.adyen.checkout.cse.EncryptionException;
import com.adyen.checkout.cse.Encryptor;
import com.adyen.checkout.cse.EncryptedCard;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class Adyen2Module extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public Adyen2Module(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Adyen2";
    }

    @ReactMethod
    public void encryptCard (ReadableMap cardInfo, Promise promise) {
      Card.Builder card = new Card.Builder();
      card.setNumber(cardInfo.getString("number"));
      card.setExpiryDate(cardInfo.getInt("expiryMonth"), cardInfo.getInt("expiryYear"));
      card.setSecurityCode(cardInfo.getString("cvc"));
  
      try {
        EncryptedCard encryptedCard = Encryptor.INSTANCE.encryptFields(card.build(), cardInfo.getString("publicKey"));
  
        WritableMap map = Arguments.createMap();
  
        map.putString("number", encryptedCard.getEncryptedNumber());
        map.putString("expiryMonth", encryptedCard.getEncryptedExpiryMonth());
        map.putString("expiryYear", encryptedCard.getEncryptedExpiryYear());
        map.putString("cvc", encryptedCard.getEncryptedSecurityCode());
  
        promise.resolve(map);
      } catch (EncryptionException e) {
        // e.printStackTrace();
        promise.reject(Integer.toString(e.hashCode()), e.getMessage());
      }
    }
}
