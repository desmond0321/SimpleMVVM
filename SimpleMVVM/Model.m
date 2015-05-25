//
//  Model.m
//  SimpleMVVM
//
//  Created by Rafael on 18/05/15.
//  Copyright (c) 2015 RightCloud. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (id)sharedInstance {
    // this prevents duplicated instances and create a shared one
    // ideal when working with databases
    
    static Model *data = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        data = [[self alloc] init];
    });
    
    return data;
}

- (id)init {
    self = [super init];
    
    if (self) {
        // do your initialization stuff here
        [self loadData];
    }
    
    return self;
}

- (void)loadData {
    // setting the initial data, observed with NSKeyValueObservingOptionInitial
    [self setValue:@[@"first", @"second", @"third"] forKey:@"dataArray"];
    
    // setting new values after 3 seconds, just for the sake of this example!
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setValue:@[@"FIRST", @"SECOND", @"THIRD"] forKey:@"dataArray"];
    });
}

@end
