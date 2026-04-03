#import <Foundation/Foundation.h>
#import "CWMRootListController.h"

@implementation CWMRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
