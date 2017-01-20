//
//  NSString+Tools.h
//  tool
//
//  Created by Tony on 16/9/6.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (Tools)
/**
 *  判断是否符合手机格式
 *  @return 是否符合手机格式
 */
- (BOOL)isValidateTelNumber;

/**
 *  判断是否符合邮件格式
 *  @return 是否符合邮件格式
 */
- (BOOL)isValidateEmail;

/**
 *  检测字符串是否为身份证号
 *  @return 如果为身份证号返回YES,否则返回NO
 */
- (BOOL)isValidateIdentityCard;

/**
 *  检测用户名是否符合要求
 *  @return 如果符合要求返回YES,否则返回NO
 */
- (BOOL)isValidateUserName;

/**
 *  检测用户密码是否符合要求
 *  @return 如果符合要求返回YES,否则返回NO
 */
- (BOOL)isValidatePassword;

/**
 *  判断是否符合中英文数字标点符号
 *  @return 是否符合英文数字标点符号
 */
- (BOOL)isValidateInput;

/**
 *  判断长度是否在min和max之间
 */
- (BOOL)lengthBetweenMin:(NSUInteger)min
                     max:(NSUInteger)max;
/**
 *  判断字符串非空
 */
- (BOOL)notEmpty;

/**
 *  符合时间格式的字符转成时间
 */
- (NSString *)timeString;

/**
 *  带日期的时间格式
 */
- (NSString *)timeStringWithHour;

/**
 *  html字符转意
 */
- (NSString *)escapeHTML;

/**
 *  字符串md5
 *  @return md5
 */
- (NSString *)md5;


@end
