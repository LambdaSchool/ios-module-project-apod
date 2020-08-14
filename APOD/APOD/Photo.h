//
//  Photo.h
//  APOD
//
//  Created by Matthew Martindale on 8/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (nonatomic, readonly, copy)NSString *title;
@property (nonatomic, readonly, copy)NSString *url;

- (instancetype)initWithTitle:(NSString *)title
                  url:(NSString *)url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
