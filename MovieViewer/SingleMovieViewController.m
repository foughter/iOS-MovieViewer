//
//  SingleMovieViewController.m
//  MovieViewer
//
//  Created by Li Li on 6/15/14.
//  Copyright (c) 2014 Li Li. All rights reserved.
//

#import "SingleMovieViewController.h"

#import "UIImageView+AFNetworking.h"

#define INSET_LEFT 10
#define INSET_RIGHT 10
#define SCROLL_VIEW_CONTENT_OFFSET_TOP 100


@interface SingleMovieViewController ()

@property (nonatomic, retain) NSDictionary* movie;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation SingleMovieViewController

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
    
    CGRect fullScreenRect=[[UIScreen mainScreen] applicationFrame];
    
    
    NSString *imageUrl = self.movie[@"posters"][@"original"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithFrame:fullScreenRect];
    [backgroundImageView setImageWithURL:url];
    [self.view addSubview:backgroundImageView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:fullScreenRect];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 100);
    self.scrollView.contentInset=UIEdgeInsetsMake(44.0, INSET_LEFT, 0, INSET_RIGHT);
    [self.view addSubview:self.scrollView];
    
    // the background view in scroll view
    UIView* scrollBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(INSET_LEFT, SCROLL_VIEW_CONTENT_OFFSET_TOP, self.view.frame.size.width - INSET_LEFT - INSET_RIGHT, self.view.frame.size.height)];
    scrollBackgroundView.backgroundColor = [UIColor colorWithWhite:0.05 alpha:0.5];
    [self.scrollView addSubview:scrollBackgroundView];
    
    // the title label
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(INSET_LEFT*2, 100, self.view.frame.size.width-INSET_LEFT*2-INSET_RIGHT*2, 30)];
    titleLabel.text = self.movie[@"title"];
    [titleLabel setTextColor: [UIColor whiteColor]];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:17];
    [self.scrollView addSubview:titleLabel];
    
    // the synopsis label
    UILabel* synopsisLabel = [[UILabel alloc] initWithFrame:CGRectMake(INSET_LEFT*2, 125, self.view.frame.size.width-INSET_LEFT*2-INSET_RIGHT*2, 300 )];
    synopsisLabel.text = self.movie[@"synopsis"];
    [synopsisLabel setTextColor: [UIColor whiteColor]];
    synopsisLabel.lineBreakMode = NSLineBreakByWordWrapping;
    synopsisLabel.numberOfLines = 0;
    synopsisLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    [self.scrollView addSubview:synopsisLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
