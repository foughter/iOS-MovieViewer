//
//  MovieDetailViewController.m
//  MovieViewer
//
//  Created by Li Li on 6/9/14.
//  Copyright (c) 2014 Li Li. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()

@property (nonatomic, weak) NSDictionary* movie;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation MovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithMovieDetail: (NSDictionary*)movie
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.movie = movie;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *imageUrl = self.movie[@"posters"][@"original"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    
    [self.backgroundImageView setImageWithURL:url];
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"synopsis"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
