//
//  OGMColorDescription.m
//  Colorboard
//
//  Created by Omri Meshulam on 3/25/15.
//  Copyright (c) 2015 Omri Meshulam. All rights reserved.
//

#import "OGMColorDescription.h"

@implementation OGMColorDescription

- (instancetype)init
{
    self = [super init];
    if (self){
        _color = [UIColor colorWithRed:0
                                 green:0
                                  blue:1
                                 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
