//
//  MovieCell.m
//  MovieViewer
//
//  Created by Li Li on 6/9/14.
//  Copyright (c) 2014 Li Li. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
        self.posterView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 80, 130)];
        self.posterView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
        //self.posterView.
        
        [self addSubview:self.posterView];
        //self.titleLabel = [UILabel alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
