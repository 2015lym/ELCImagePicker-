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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{//几个cell
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{//每个section下几个cell
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{//每个section的高度
        return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{//每个cell高度
    if (indexPath.section==0) {
        return 60;
    }
    else if(indexPath.section==1){
        return 80;
    }
    else if(indexPath.section==2){
        return 100;
    }
    else {
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{//点击事件
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
