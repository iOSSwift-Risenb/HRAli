//
//  AliHelper.m
//  HRAli
//
//  Created by Obgniyum on 2018/3/27.
//

#import "AliHelper.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation AliHelper

// MARK:-
+ (instancetype)allocWithZone:(NSZone *)zone{
    return [AliHelper shared];
}

+ (instancetype)shared{
    static AliHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:nil] init];
    });
    return instance;
}

- (instancetype)copyWithZone:(NSZone *)zone{
    return [AliHelper shared];
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone{
    return [AliHelper shared];
}

// MARK:-
- (void)openURL:(NSURL *)url {
    // 支付宝
    if ([url.host isEqualToString:@"safepay"] && [url.absoluteString hasPrefix:self.scheme]) {
        
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            if ([resultDic[@"resultStatus"] isEqualToString:@"9000"]) {
                if (self.paySuccessBlock) {
                    self.paySuccessBlock();
                }
            } else {
                if (self.payFailureBlock) {
                    self.payFailureBlock();
                }
            }
        }];
    }
}


@end
