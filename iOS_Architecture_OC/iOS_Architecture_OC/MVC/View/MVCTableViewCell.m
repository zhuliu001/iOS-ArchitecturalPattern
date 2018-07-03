//
//  MVCTableViewCell.m
//  iOS_Architecture_OC
//
//  Created by MountainX on 2018/7/3.
//  Copyright © 2018年 MTX Software Technology Co.,Ltd. All rights reserved.
//

#import "MVCTableViewCell.h"
#import "MVCModel.h"

@interface MVCTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *logoIv;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureIv;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureLeadingConstraint;

@end

@implementation MVCTableViewCell

static NSString *cellID = @"MVCTableViewCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    MVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MVCTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

#pragma mark - Setter
- (void)setModel:(MVCModel *)model {
    _model = model;
    
    _logoIv.image = [UIImage imageNamed:model.logo];
    _nameLabel.text = model.name;
    _timeStampLabel.text = model.timeStamp;
    UIImage *picure = [UIImage imageNamed:model.picture];
    _pictureIv.image = picure;
    
    CGFloat pictureMaxWidth = [UIScreen mainScreen].bounds.size.width - 2 * _pictureLeadingConstraint.constant;
    if (picure.size.width > pictureMaxWidth) {
        _pictureWidthConstraint.constant = pictureMaxWidth;
    } else {
        _pictureWidthConstraint.constant = picure.size.width;
    }
    
    CGFloat pictureHeight = _pictureWidthConstraint.constant / picure.size.width * picure.size.height;
    CGFloat pictureMaxHeight = [UIScreen mainScreen].bounds.size.height / 3 * 2;
    _pictureHeightConstraint.constant = pictureHeight > pictureMaxHeight ? pictureMaxHeight : pictureHeight;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _logoIv.layer.cornerRadius = 30.f;
    _logoIv.clipsToBounds = YES;
    _logoIv.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _logoIv.layer.borderWidth = .5f;
    
    _pictureIv.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
