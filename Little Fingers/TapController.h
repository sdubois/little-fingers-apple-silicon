//
//  TapController.h
//  Little Fingers
//
//  Created by Shaun Inman on 2/3/17.
//  Copyright © 2017 Shaun Inman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TapController : NSObject

+(BOOL)isAccessibilityEnabled;
+(BOOL)isLocked;
+(void)promptForAccessibility;

@end
