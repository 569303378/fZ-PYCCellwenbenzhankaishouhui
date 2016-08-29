//
//  TwoTableViewCell.m
//  PYLabelzhankai
//
//  Created by Apple on 16/8/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "TwoTableViewCell.h"
#import "Masonry.h"


@interface TwoTableViewCell ()
@property (nonatomic, strong)NSIndexPath *cellIndexPath;//当前cell下标
@end

@implementation TwoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //加载视图
        [self PYloadView];
    }
    return self;
}

#pragma mark = 加载视图
- (void)PYloadView {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"标题";
    _titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
//        make.right.mas_equalTo(self.contentView.mas_right).offset(15);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(15);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width/2);
        make.height.mas_equalTo(12);
    }];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.numberOfLines = 3;
    _contentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_contentLabel];

    _openButton = [[UIButton alloc] init];
//    _openButton.backgroundColor = [UIColor cyanColor];
    [_openButton setImage:[UIImage imageNamed:@"xiala"] forState:(UIControlStateNormal)];
    [_openButton setImage:[UIImage imageNamed:@"shq"] forState:(UIControlStateNormal)];
    [_openButton addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [_openButton setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 0, 0))];
    [self.contentView addSubview:_openButton];
    [_openButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left);
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(-10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo(30);
    }];
}

#pragma mark = 点击事件
- (void)buttonAction {
    self.openButton.selected = !self.openButton.selected;
    if (self.openButton.selected) {
        [self.openButton setImage:[UIImage imageNamed:@"xiala"] forState:(UIControlStateNormal)];
    } else {
        [self.openButton setImage:[UIImage imageNamed:@"shq"] forState:(UIControlStateNormal)];
    }
    
    //记录当前按钮的选中状态,并传递给控制器
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithInteger:_cellIndexPath.row] forKey:@"row"];
    [dic setObject:[NSNumber numberWithBool:self.openButton.selected] forKey:@"isShow"];
    
    //协议回调,改变控制器中存放cell的展开收起状态的字典
    if (self.delegate && [self.delegate respondsToSelector:@selector(remarksCellShowContrntWithDic:andCellIndexPath:)]) {
        [self.delegate remarksCellShowContrntWithDic:dic andCellIndexPath:_cellIndexPath];
    }
}

#pragma mark = 代理
- (void)setCellContent:(NSString *)contentStr andIsShow:(BOOL)isShow andCellIndexPath:(NSIndexPath *)indexPath {
    _contentLabel.text = contentStr;
    _cellIndexPath = indexPath;
    
    CGRect rect = [_contentLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
    if (rect.size.height > 52) {//文本默认高度
        //文字大于三行,显示展开收起按钮
        self.openButton.hidden = NO;
        if (isShow) {
            _contentLabel.numberOfLines = 0;
            [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.contentView.mas_left).offset(15);
                make.top.mas_equalTo(_titleLabel.mas_bottom).offset(5);//展开向上+5
                make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 30);
                make.height.mas_equalTo(rect.size.height);
            }];
        } else {
            [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.contentView.mas_left).offset(15);
                make.top.mas_equalTo(_titleLabel.mas_bottom).offset(5);
                make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 30);
                make.height.mas_equalTo(52);
            }];
        }
    } else {
        //文字小于三行,隐藏展开收起按钮
        _contentLabel.numberOfLines = 3;
        self.openButton.hidden = YES;
        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(15);
            make.top.mas_equalTo(_titleLabel.mas_bottom).offset(5);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 30);
            make.height.mas_equalTo(rect.size.height + 1);//由于系统计算的那个高度有时候会有1像素到2像素的误差,所以这里高度+1
        }];
    }
}
















@end
