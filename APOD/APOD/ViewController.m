//
//  ViewController.m
//  APOD
//
//  Created by Matthew Martindale on 8/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

#import "ViewController.h"
#import "PODFetcher.h"

@interface ViewController ()

@property PODFetcher *podFetcher;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.podFetcher = [[PODFetcher alloc] init];
    
    [self.podFetcher fetchPhotoOfTheDay:self.datePicker.date completionHandler:^(Photo * _Nullable photo, NSError * _Nullable error) {
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: photo.url]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [UIImage imageWithData: data];
            });
        });

        dispatch_async(dispatch_get_main_queue(), ^{
            self.titleLabel.text = photo.title;
        });
    }];
}

- (IBAction)selectedDate:(UIDatePicker *)sender {
    [self.podFetcher fetchPhotoOfTheDay:self.datePicker.date completionHandler:^(Photo * _Nullable photo, NSError * _Nullable error) {
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: photo.url]];
            if ( data == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [UIImage imageWithData: data];
            });
        });

        dispatch_async(dispatch_get_main_queue(), ^{
            self.titleLabel.text = photo.title;
        });
    }];
}

@end
