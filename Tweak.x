#import <UIKit/UIKit.h>

static NSString *gCustomBalance = @"1 500 279,79 rub";

%hook UIView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    %orig;
    if (touches.count >= 2) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            UIViewController *top = window.rootViewController;
            while (top.presentedViewController) {
                top = top.presentedViewController;
            }
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ozon Fake" message:@"Введи баланс:" preferredStyle:UIAlertControllerStyleAlert];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *tf) {
                tf.text = gCustomBalance;
            }];
            [alert addAction:[UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleDefault handler:^(UIAlertAction *act) {
                UITextField *tf = alert.textFields.firstObject;
                if (tf.text.length > 0) {
                    gCustomBalance = [tf.text copy];
                }
            }]];
            if (top) [top presentViewController:alert animated:YES completion:nil];
        });
    }
}
%end

%hook UILabel
- (void)setText:(NSString *)text {
    if (text != nil) {
        if ([text containsString:@"279"] || [text containsString:@"rub"]) {
            text = gCustomBalance;
        }
    }
    %orig(text);
}
%end
