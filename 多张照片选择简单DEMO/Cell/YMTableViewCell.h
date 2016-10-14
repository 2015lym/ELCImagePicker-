//
//  YMTableViewCell.h
//  多张照片选择简单DEMO
//
//  Created by Lym on 16/8/1.
//  Copyright © 2016年 Lym. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCImagePickerController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface YMTableViewCell : UITableViewCell<ELCImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, copy) NSArray *chosenImages;                  //图片数组

@end
