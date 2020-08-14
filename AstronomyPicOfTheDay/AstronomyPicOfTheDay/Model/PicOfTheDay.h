//
//  PicOfTheDay.h
//  AstronomyPicOfTheDay
//
//  Created by Chad Parker on 8/13/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PicOfTheDay : NSObject

@property (nonatomic, readonly, copy) NSString *copyright;
@property (nonatomic, readonly, copy) NSString *dateString;
@property (nonatomic, readonly, copy) NSString *explanation;
@property (nonatomic, readonly, copy) NSString *mediaType;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *urlString;

- (instancetype)initWithCopyright:(NSString *)copyright
                       dateString:(NSString *)dateString
                      explanation:(NSString *)explanation
                        mediaType:(NSString *)mediaType
                            title:(NSString *)title
                       urlString:(NSString *)urlString;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
