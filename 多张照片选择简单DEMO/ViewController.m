//
//  ViewController.m
//  多张照片选择简单DEMO
//
//  Created by Lym on 16/8/1.
//  Copyright © 2016年 Lym. All rights reserved.
//

#import "ViewController.h"
#import "YMTableViewCell.h"

#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController
#pragma mark -----生命周期-----
- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView=[[UITableView alloc]init];
    _tableView.frame=CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-100);
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"YMTableViewCell" bundle:nil] forCellReuseIdentifier:@"YMTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -----TableView delegate&dataSource-----
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
        return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 60;
    } else if (indexPath.section==1){
        return 80;
    } else if (indexPath.section==2){
        return 100;
    } else {
        return 120;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //分割线设置
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    YMTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"YMTableViewCell" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone]; //去除点击阴影
    return cell;
}



@end
