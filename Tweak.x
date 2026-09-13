#import <UIKit/UIKit.h>

%hook UILabel
- (void)setText:(NSString *)text {
    if (text != nil) {
        if ([text containsString:@"279"]) {
            text = @"1 500 279,79 rub";
        }
    }
    %orig(text);
}
%end
