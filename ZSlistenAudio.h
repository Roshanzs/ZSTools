//
//  ZSlistenAudio.h
//  疯子助手
//
//  Created by 紫贝壳 on 2016/11/17.
//  Copyright © 2016年 紫贝壳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSlistenAudio : NSObject
+(instancetype)shareAudio;
-(void)listenWithText:(NSString *)text;
-(void)stop;
@end
