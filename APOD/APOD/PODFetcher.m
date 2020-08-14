//
//  PODFetcher.m
//  APOD
//
//  Created by Matthew Martindale on 8/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "PODFetcher.h"
#import "Photo.h"

static NSString *const APIKey = @"CrGyhe4SzkbgKB2Ahw17krmCKU9JbRToEUxkc1Yh";

@implementation PODFetcher

- (void)fetchPhotoOfTheDay:(NSDate *)date completionHandler:(FetchPhotoCompletionHandler)completionHandler
{
    if (!completionHandler) return;
    
    NSURL *baseURL = [NSURL URLWithString:@"https://api.nasa.gov/planetary/apod"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSLog(@"Date: %@", date);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSURLQueryItem *dateItem = [NSURLQueryItem queryItemWithName:@"date" value:dateString];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value:APIKey];
    urlComponents.queryItems = @[dateItem, apiKeyItem];
    
    NSURL *requestURL = urlComponents.URL;
    
    NSLog(@"%@", requestURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error fetching photo: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        NSError *jsonError;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        Photo *photo = [[Photo alloc] initWithDictionary:jsonDictionary];
        if (!photo) {
            NSLog(@"Error parsing Photo data: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(photo, nil);
        });
        
    }]resume];
}

@end
