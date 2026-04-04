#import <UIKit/UIKit.h>

static BOOL tweakEnabled;
static NSString *customURL;

static NSString *GetModifiedURL(NSString *original) {
    if (!customURL || [customURL length] == 0) {
        customURL = @"http://cydia.saurik.com";
    }

    if ([original hasPrefix:@"https://cydia.saurik.com"]) {
        return [original stringByReplacingOccurrencesOfString:@"https://cydia.saurik.com"
                                                   withString:customURL];
    }

    return original;
}

static void preferencesChanged() {
    NSDictionary *prefs = [[NSUserDefaults standardUserDefaults]
        persistentDomainForName:@"com.lukezgd.cydiawebviewmodifierprefs"];

    tweakEnabled = [[prefs objectForKey:@"tweakEnabled"] ?: [NSNumber numberWithBool:YES] boolValue];

    id value = [prefs objectForKey:@"customURL"];
    if ([value isKindOfClass:[NSString class]] && [value length] > 0) {
        customURL = value;
    } else {
        customURL = @"http://cydia.saurik.com";
    }
}

%ctor {
    preferencesChanged();

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesChanged, CFSTR("com.lukezgd.cydiawebviewmodifierprefs-updated"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

%hook UIWebView

- (void)loadRequest:(NSURLRequest *)request {
    if (!tweakEnabled) {
        %orig(request);
        return;
    }

    NSURL *url = [request URL];
    NSString *urlString = [url absoluteString];

    NSString *modified = GetModifiedURL(urlString);

    if (![modified isEqualToString:urlString]) {
        NSMutableURLRequest *newRequest = [request mutableCopy];
        NSURL *newURL = [NSURL URLWithString:modified];
        [newRequest setURL:newURL];
        request = newRequest;
    }

    %orig(request);
}

%end


%hook CydiaWebViewController

+ (void)didClearWindowObject:(id)window
                    forFrame:(id)frame
                   withCydia:(id)cydia {

    [window setValue:cydia forKey:@"cydia"];

    %orig;
}

%end
