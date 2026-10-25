//
//  LoginItems.m
//  Little Fingers
//
//  Rewritten to use SMAppService (macOS 13+). The original
//  LSSharedFileList API no longer works on modern macOS.
//

#import "LoginItems.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation LoginItems

+(BOOL)appAlreadyExists
{
	return SMAppService.mainAppService.status == SMAppServiceStatusEnabled;
}

+(void)addApp
{
	NSError *error = nil;
	if (![SMAppService.mainAppService registerAndReturnError:&error]) {
		NSLog(@"Little Fingers: could not add login item: %@", error);
	}
}

+(void)removeApp
{
	NSError *error = nil;
	if (![SMAppService.mainAppService unregisterAndReturnError:&error]) {
		NSLog(@"Little Fingers: could not remove login item: %@", error);
	}
}

@end
