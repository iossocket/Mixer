//
//  AddRatingManagerBridge.m
//  Mixer
//
//  Created by XueliangZhu on 21/06/2017.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AddRatingManager, NSObject)

RCT_EXTERN_METHOD(dismissPresentedViewController:(nonnull NSNumber *)reactTag)
RCT_EXTERN_METHOD(save:(nonnull NSNumber *)reactTag rating:(NSInteger *)rating forIdentifier:(NSInteger *)forIdentifier)

@end
