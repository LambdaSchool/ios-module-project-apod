//
//  APIController.m
//  AstronomyPicOfTheDay
//
//  Created by Chad Parker on 8/13/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

#import "APIController.h"
#import "PicOfTheDay.h"
#import "LSIErrors.h"

static NSString *const PicOfTheDayBaseURLString = @"https://api.nasa.gov/planetary/apod";

@implementation APIController

- (void)fetchPicOfTheDay:(NSDate *)date completion:(nonnull APIControllerCompletionHandler)completion
{
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSString *dateString = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)dateComponents.year, (long)dateComponents.month, (long)dateComponents.day];

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:PicOfTheDayBaseURLString];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"date" value:dateString],
        [NSURLQueryItem queryItemWithName:@"api_key" value:@"nXg5CGfYuvmnhnOLOeBSMRxZKELcqwrum51uYUEg"],
    ];

    [[NSURLSession.sharedSession dataTaskWithURL:urlComponents.URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error fetching pic of the day: %@", error);

            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });

            return;
        }

        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);

            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, jsonError);
            });

            return;
        }

        PicOfTheDay *picOfTheDay = [[PicOfTheDay alloc] initWithDictionary:dictionary];
        if (!picOfTheDay) {
            NSError *apiError = errorWithMessage(@"Invalid JSON dictionary", LSIAPIError);
            NSLog(@"Error decoding results dictionary: %@", apiError);

            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, apiError);
            });

            return;
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            completion(picOfTheDay, nil);
        });
    }] resume];
}

@end
