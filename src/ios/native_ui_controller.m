//
//  native_ui_controller.m
//  sm64ios
//
//  Created by Christian Kosman on 9/26/21.
//

#include "native_ui_controller.h"

UIViewController *rootVc;

void present_viewcontroller(NSString *vcName) {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:vcName];
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController presentViewController:vc animated:YES completion:nil];
}
