#import <UIKit/UIKit.h>

%hook UIWebView

- (void)loadRequest:(NSURLRequest *)request {
    NSURL *url = [request URL];
    NSString *urlString = [url absoluteString];

    if ([urlString hasPrefix:@"https://cydia.saurik.com"]) {
        NSMutableURLRequest *newRequest = [request mutableCopy];

        NSString *modified = [urlString stringByReplacingOccurrencesOfString:@"https://cydia.saurik.com"
                                                                  withString:@"http://192.168.0.159:8888"];

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

    // replicate: objc_msgSend(window, "setValue:forKey:", cydia, @"cydia");
    [window setValue:cydia forKey:@"cydia"];

    %orig;
}

%end
