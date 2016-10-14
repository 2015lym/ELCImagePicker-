//
//  YMTableViewCell.m
//  多张照片选择简单DEMO
//
//  Created by Lym on 16/8/1.
//  Copyright © 2016年 Lym. All rights reserved.
//

#import "YMTableViewCell.h"

@implementation YMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

/* ---按钮点击事件---*/
- (IBAction)click:(id)sender {
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    
    elcPicker.maximumImagesCount = 9;     /* ---LYM 最多选中多少张---*/
    elcPicker.returnsOriginalImage = YES;
    elcPicker.returnsImage = YES;
    elcPicker.onOrder = YES;
    elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
    
    elcPicker.imagePickerDelegate = self;
    
    [self.viewController presentViewController:elcPicker animated:YES completion:nil];
}

/* ---选择照片后点击确定---*/
#pragma mark ELCImagePickerControllerDelegate
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
 
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
    
    for (UIView *v in [_scrollView subviews]) {
        [v removeFromSuperview];
    }
    
    CGRect workingFrame = _scrollView.frame;
    workingFrame.origin.x = 0;
    workingFrame.origin.y = 0;
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[info count]];
    
    for (NSDictionary *dict in info) {
        UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
    
        /* ---如果图片长度或宽度大于1000，则压缩图片宽度为200，高度保持原比例---*/
        if (image.size.width>1000 || image.size.height>1000) {
            [images addObject:[self imageCompressForWidth:image targetWidth:200]];
        }
        else{
            [images addObject:image];
        }
        UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
        [imageview setContentMode:UIViewContentModeScaleToFill];
        imageview.frame = CGRectMake(workingFrame.origin.x, 7, _photoBtn.frame.size.width, _photoBtn.frame.size.height);
        [_scrollView addSubview:imageview];
        
        workingFrame.origin.x = workingFrame.origin.x + _photoBtn.frame.size.width+10;
    }
    UIButton *addPhotoBtn=[[UIButton alloc]initWithFrame: CGRectMake(workingFrame.origin.x, 7, _photoBtn.frame.size.width, _photoBtn.frame.size.height)];
    [addPhotoBtn setBackgroundImage:[UIImage imageNamed:@"添加照片"] forState:UIControlStateNormal];
    [addPhotoBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:addPhotoBtn];
    
    workingFrame.origin.x = workingFrame.origin.x + _photoBtn.frame.size.width+10;
    
    self.chosenImages = images;
    
    [_scrollView setContentSize:CGSizeMake(workingFrame.origin.x, workingFrame.size.height)];
    
}

/* ---选择照片后点击取消---*/
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

/* ---图片大小压缩LYM---*/
-(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
