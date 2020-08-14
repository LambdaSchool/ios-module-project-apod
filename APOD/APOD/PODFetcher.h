//
//  PODFetcher.h
//  APOD
//
//  Created by Matthew Martindale on 8/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@class Photo;

typedef void(^FetchPhotoCompletionHandler)(Photo *_Nullable photo, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface PODFetcher : NSObject

- (void)fetchPhotoOfTheDay:(NSDate *)date
         completionHandler:(FetchPhotoCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
