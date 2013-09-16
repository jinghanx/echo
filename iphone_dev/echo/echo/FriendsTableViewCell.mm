//
//  FriendsTableViewCell.m
//  echo
//
//  Created by Jinghan Xu on 4/4/13.
//
//

#import "FriendsTableViewCell.h"

@implementation FriendsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)dealloc {
    [_profileImage release];
    [_name release];
    [super dealloc];
}
@end
