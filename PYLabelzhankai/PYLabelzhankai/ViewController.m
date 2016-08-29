//
//  ViewController.m
//  PYLabelzhankai
//
//  Created by Apple on 16/8/1.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *myArray;
@end

@implementation ViewController
#pragma mark = 懒加载
- (NSMutableArray *)myArray {
    if (!_myArray) {
        _myArray = [NSMutableArray array];
        NSDictionary *dic_1 = [NSDictionary dictionaryWithObjectsAndKeys:@"cell点击收起", @"title", @"OneViewController", @"controller", nil];
        [_myArray addObject:dic_1];
        NSDictionary *dic_2 = [NSDictionary dictionaryWithObjectsAndKeys:@"cell中文字高度自适应", @"title", @"TwoViewController", @"controller", nil];
        [_myArray addObject:dic_2];
        NSDictionary *dic_3 = [NSDictionary dictionaryWithObjectsAndKeys:@"整个TableView中只有一个Cell有展开收起功能", @"title", @"ThreeViewController", @"controller", nil];
        [_myArray addObject:dic_3];
    }
    return _myArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self layoutViews];
}

#pragma mark = 加载视图
- (void)layoutViews{
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _myTableView.delegate = self;
    _myTableView.dataSource= self;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = [_myArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@", indexPath.row + 1, [dic objectForKey:@"title"]];
    cell.selectionStyle = NO;//选择风格
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头 
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 80;
}

#pragma mark = 页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [_myArray objectAtIndex:indexPath.row];
    Class typeVC = NSClassFromString([dic objectForKey:@"controller"]);
    UIViewController *typeC = [[typeVC alloc] init];
    typeC.title = [dic objectForKey:@"title"];
    [self.navigationController pushViewController:typeC animated:NO];
}























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
