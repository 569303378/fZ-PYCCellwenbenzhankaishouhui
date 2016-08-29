//
//  TwoViewController.m
//  PYLabelzhankai
//
//  Created by Apple on 16/8/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoTableViewCell.h"
#import "TwoModel.h"
@interface TwoViewController () <UITableViewDelegate, UITableViewDataSource, TwoTableViewCellDellgate>
@property (nonatomic, strong) NSMutableDictionary *cellDic;//存放cell视图展开状态的字典
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *myArray;
@end

@implementation TwoViewController
- (NSMutableDictionary *)cellDic {
    if (!_cellDic) {
        self.cellDic = [NSMutableDictionary dictionary];
    }
    return _cellDic;
}
- (NSMutableArray *)myArray {
    if (!_myArray) {
        _myArray = [NSMutableArray array];
        [_myArray addObject:@"Cell中文字高度自适应啊十分。"];
        
        [_myArray addObject:@"Cell点开收起会尽快哈十分卡是弗拉斯柯达减肥挥洒的离开回来哈拉哈发神经的发哈龙卷风白金卡拉斯办法是健康的发布拉斯交换机快来撒会分开就老大说废话接口里黄金卡和收割机卡萨离开家黄金卡是刘德华。"];
        
        [_myArray addObject:@"Cell中文字高度自适应啊十分就爱上恢复健康萨拉丁干红辣椒撒刚回来交水电费。"];
        
        [_myArray addObject:@"Cell中文字高度自适应啊十分就爱上恢复健康萨拉丁干红辣椒撒刚回来交水电。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏中文字高度自适应啊十分就爱上恢复健康萨拉丁干红辣椒撒刚回来交水电。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个九嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个九嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。"];
        
        [_myArray addObject:@"而服务就开个房hi未公开差距是过节费嘎达是骄傲的很据是否故意给五分与我共分为与恢复噶啥可减肥哈萨克较高的更好看的撒娇规范和骄傲是快递费工商局和开发干烧烤间谍飞哥物业费古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我一uegfeuawusi很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个一uyuwegfduhjkghkasgfaysufgyewugfyuewogf九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿王力宏。"];
        
        [_myArray addObject:@"古二维和法国和看 规划局卡萨发噶烧烤就反感看好几个和会计师法国因为规范业务规范严肃更快捷回复噶啥会计法嘎鱼我一uegfeuawusi很快就挨个送粉红色就爱看个啥尽快发噶山东黄金开发个一uyuwegfduhjkghkasgfaysufgyewugfyuewogf九 嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦个一苏打绿发过会儿。"];
        
        [_myArray addObject:@"发个啊发生九嘎哈是控件覆盖赛风购物IE欧GFUI哦噶松德股份哦工行收发货撒旦。"];
        
        [_myArray addObject:@"爱使股份温哥华继往开来嘎哈烧烤就好挂虽有过绯闻我月服务业股份为很快就会发生了开放后无恶意不hiouaFHUOQYRH0WPJFM OGuafoigahsuif。"];
        
        [_myArray addObject:@"afweiluhgluighejehjfdsuhgsyugysugewuygdfshjkdhjkjgyiugiuyfyughughhihoiuhouihijlhjlihuihiugkhuigyuifgtuyjguykghkuyguiygiyfygfigjhvgigiuyhbjkbiuhiuhjkhnjkhiu。"];
        
        [_myArray addObject:@"jlhjlihuihiugkhuigyuifgtuyjguykghkuyguiygiyfygfigjhvgigiuyhbjkbiuhiuhjkhnjkhiu。。。"];
    }
    return _myArray;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    self.myTableView = [[UITableView alloc] init];
    _myTableView.frame = [UIScreen mainScreen].bounds;
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
}

#pragma mark = tab代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
    if (!cell) {
        cell = [[TwoTableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"twoCell"];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setCellContent:[self.myArray objectAtIndex:indexPath.row] andIsShow:[[self.cellDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]] boolValue] andCellIndexPath:indexPath];
    return cell;
}

//行高
/*
 * contentStr：Lable内容
 * isShow：是否展开
 * width：Lable的宽度
 * font：字号
 * defaultHeight：默认高度，若大于该高度则显示展开收起按钮，低于该高度则正常显示文字高度
 * fixedHeight：其他控件固定高度
 * btnHeight：展开收起按钮高度 15(距上) + 12(标题) + 52(文本) - 10 + 30 + 1
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TwoModel cellHeightWith:[self.myArray objectAtIndex:indexPath.row] andIsShow:[[self.cellDic objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]] boolValue] andLableWidth:[UIScreen mainScreen].bounds.size.width - 30 andFont:12 andDefaultHeight:52 andFixedHeight:42 andIsShowBtn:8];
}

#pragma mark = button代理
- (void)remarksCellShowContrntWithDic:(NSDictionary *)dic andCellIndexPath:(NSIndexPath *)indexPath {
    [self.cellDic setObject:[dic objectForKey:@"isShow"] forKey:[NSString stringWithFormat:@"%@", [dic objectForKey:@"row"]]];
    [_myTableView reloadData];
}













@end
