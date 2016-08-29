//
//  ThreeViewController.m
//  PYLabelzhankai
//
//  Created by Apple on 16/8/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ThreeViewController.h"
#import "TwoModel.h"
#import "TwoTableViewCell.h"

@interface ThreeViewController () <UITableViewDelegate, UITableViewDataSource, TwoTableViewCellDellgate>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSString *str;
@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, assign) BOOL isShow;//展开状态
@end

@implementation ThreeViewController
- (NSString *)str {
    if (!_str) {
        _str = @"而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。";
    }
    return _str;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    _myTableView = [[UITableView alloc] init];
    _myTableView.frame = [UIScreen mainScreen].bounds;
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
}

#pragma mark = tab代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 2) {
        return 2;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    } else if (indexPath.section == 1) {
        return [TwoModel cellHeightWith:self.str andIsShow:self.isShow andLableWidth:self.view.frame.size.width - 30 andFont:12 andDefaultHeight:52 andFixedHeight:42 andIsShowBtn:8];
    } else {
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell1"];
        }
        cell.backgroundColor = [UIColor cyanColor];
        return cell;
    } else if (indexPath.section == 1) {
        TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[TwoTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell2"];
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell setCellContent:self.str andIsShow:self.isShow andCellIndexPath:indexPath];
        return cell;
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell3"];
        }
        cell.backgroundColor = [UIColor orangeColor];
        return cell;
    }
}

#pragma mark button代理
- (void)remarksCellShowContrntWithDic:(NSDictionary *)dic andCellIndexPath:(NSIndexPath *)indexPath {
    //获取button是否展开
    _isShow = [[NSString stringWithFormat:@"%@", [dic objectForKey:@"isShow"]] boolValue];
    [_myTableView reloadData];
}

@end
