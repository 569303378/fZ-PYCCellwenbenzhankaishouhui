//
//  TwoTableViewCell.h
//  PYLabelzhankai
//
//  Created by Apple on 16/8/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol TwoTableViewCellDellgate <NSObject>

- (void)remarksCellShowContrntWithDic:(NSDictionary *)dic andCellIndexPath:(NSIndexPath *)indexPath;

@end
@interface TwoTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *openButton;
@property (nonatomic, assign) id<TwoTableViewCellDellgate>delegate;

- (void)setCellContent:(NSString *)contentStr andIsShow:(BOOL)isShow andCellIndexPath:(NSIndexPath *)indexPath;
@end
