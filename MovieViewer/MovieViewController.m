//
//  MovieViewController.m
//  MovieViewer
//
//  Created by Li Li on 6/9/14.
//  Copyright (c) 2014 Li Li. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailViewController.h"

#define CELL_HEIGHT 110

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray* movies;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Movies";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = CELL_HEIGHT;
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.movies = object[@"movies"];
        NSLog(@"num of movies: %d", self.movies.count);
        NSLog(@"%@", self.movies[0]);
        
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//TODO Need to reuse the cell
    UITableViewCell* cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSDictionary* movie = self.movies[indexPath.row];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 61, 91)];
    NSString *imageUrl = movie[@"posters"][@"thumbnail"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    [imageView setImageWithURL:url];
    [cell addSubview:imageView];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, self.view.frame.size.width - 80 - 10, 30)];
    titleLabel.text = movie[@"title"];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:16];
    [cell addSubview:titleLabel];
    
    UILabel* synopsisLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 45, self.view.frame.size.width - 80 - 10, CELL_HEIGHT - 45 - 10)];
    synopsisLabel.textAlignment = UITextAlignmentLeft;
    synopsisLabel.lineBreakMode = UILineBreakModeTailTruncation;
    synopsisLabel.numberOfLines = 3;
    synopsisLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:13];
    
    synopsisLabel.text = movie[@"synopsis"];
    [cell addSubview:synopsisLabel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailViewController* md = [[MovieDetailViewController alloc] initWithMovieDetail: self.movies[indexPath.row]];
    [self.navigationController pushViewController:md animated:YES];
}

@end
