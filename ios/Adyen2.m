#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Adyen2, NSObject)

    RCT_EXTERN_METHOD(encryptCard:(NSDictionary *)params
                      resolver:(RCTPromiseResolveBlock)resolve
                      rejecter:(RCTPromiseRejectBlock)reject
                     )

@end

// #import "Adyen2.h"


// @implementation Adyen2

// RCT_EXPORT_MODULE()

// RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
// {
// 	callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
// }

// @end
