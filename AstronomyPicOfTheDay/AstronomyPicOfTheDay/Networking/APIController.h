//
//  APIController.h
//  AstronomyPicOfTheDay
//
//  Created by Chad Parker on 8/13/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PicOfTheDay;

typedef void(^APIControllerCompletionHandler)(PicOfTheDay *_Nullable picOfTheDay, NSError *_Nullable error);

@interface APIController : NSObject

- (void)fetchPicOfTheDay:(nonnull NSDate *)date completion:(nonnull APIControllerCompletionHandler)completion;

@end
