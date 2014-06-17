//
//  MovieViewController.h
//  MovieViewer
//
//  Created by Li Li on 6/9/14.
//  Copyright (c) 2014 Li Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPullToRefresh.h"

@interface MovieViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, CustomPullToRefreshDelegate>

@end
