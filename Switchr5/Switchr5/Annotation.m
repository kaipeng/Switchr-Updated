//
//  Annotation.m
//  vamanos
//
//  Created by Kai Peng on 11/8/11.
//  Copyright (c) 2011 University Of Pennsylvania. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize name = _name;
@synthesize address = _address;
@synthesize coordinate = _coordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        _name = [name copy];
        _address = [address copy];
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return _name;
}

- (NSString *)subtitle {
    return _address;
}

- (void)dealloc
{
 }

@end