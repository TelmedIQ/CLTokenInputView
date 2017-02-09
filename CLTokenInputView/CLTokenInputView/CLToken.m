//
//  CLToken.m
//  CLTokenInputView
//
//  Created by Rizwan Sattar on 2/24/14.
//  Copyright (c) 2014 Cluster Labs, Inc. All rights reserved.
//

#import "CLToken.h"

@implementation CLToken

- (id)initWithAttributedDisplayText:(NSAttributedString *)attributedDisplayText context:(NSObject *)context {
    self = [super init];
    if (self) {
        self.attributedDisplayText = attributedDisplayText;
        self.context = context;
        self.displayText = [attributedDisplayText string];
    }
    return self;
}

- (id)initWithDisplayText:(NSString *)displayText context:(NSObject *)context
{
    self = [super init];
    if (self) {
        self.displayText = displayText;
        self.context = context;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[CLToken class]]) {
        return NO;
    }

    CLToken *otherObject = (CLToken *)object;
    if ([otherObject.attributedDisplayText isEqualToAttributedString:self.attributedDisplayText] &&
        [otherObject.displayText isEqualToString:self.displayText] &&
        [otherObject.context isEqual:self.context]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    if (self.displayText) {
        return self.displayText.hash + self.context.hash;
    } else if (self.attributedDisplayText) {
        return self.attributedDisplayText.hash + self.context.hash;
    }
    
    return 0;
}

@end
