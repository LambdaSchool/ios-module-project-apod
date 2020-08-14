//
//  Photo.m
//  APOD
//
//  Created by Matthew Martindale on 8/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithTitle:(NSString *)title url:(NSString *)url
{
    if (self = [super init]) {
        _title = title;
        _url = url;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = [dictionary objectForKey:@"title"];
    if (![title isKindOfClass:NSString.class]) return nil;
    
    NSString *url = [dictionary objectForKey:@"url"];
    if (![url isKindOfClass:NSString.class]) return nil;
    
    return [self initWithTitle:title url:url];
}

@end
