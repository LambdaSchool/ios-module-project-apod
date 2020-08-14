//
//  PicOfTheDay.m
//  AstronomyPicOfTheDay
//
//  Created by Chad Parker on 8/13/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "PicOfTheDay.h"

@implementation PicOfTheDay

- (instancetype)initWithCopyright:(NSString *)copyright
                       dateString:(NSString *)dateString
                      explanation:(NSString *)explanation
                        mediaType:(NSString *)mediaType
                            title:(NSString *)title
                       urlString:(NSString *)urlString
{
    if (self = [super init]) {
        _copyright = copyright;
        _dateString = dateString;
        _explanation = explanation;
        _mediaType = mediaType;
        _title = title;
        _urlString = urlString;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *copyright = dictionary[@"copyright"];
    if (![copyright isKindOfClass:NSString.class]) return nil;

    NSString *dateString = dictionary[@"date"];
    if (![dateString isKindOfClass:NSString.class]) return nil;

    NSString *explanation = dictionary[@"explanation"];
    if (![explanation isKindOfClass:NSString.class]) return nil;

    NSString *mediaType = dictionary[@"media_type"];
    if (![mediaType isKindOfClass:NSString.class]) return nil;

    NSString *title = dictionary[@"title"];
    if (![title isKindOfClass:NSString.class]) return nil;

    NSString *urlString = dictionary[@"url"];
    if (![urlString isKindOfClass:NSString.class]) return nil;

    return [self initWithCopyright:copyright
                        dateString:dateString
                       explanation:explanation
                         mediaType:mediaType
                             title:title
                         urlString:urlString];
}

@end
