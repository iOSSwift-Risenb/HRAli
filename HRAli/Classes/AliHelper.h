//
//  AliHelper.h
//  HRAli
//
//  Created by Obgniyum on 2018/3/27.
//

#import <Foundation/Foundation.h>

@interface AliHelper : NSObject

@property(nonatomic, copy, nonnull) NSString *scheme;

- (void)openURL:(NSURL * __nonnull)url;

@property (nonatomic, copy, nullable)void(^paySuccessBlock)();
@property (nonatomic, copy, nullable)void(^payFailureBlock)();

@end
