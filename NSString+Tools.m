//
//  NSString+Tools.m
//  tool
//
//  Created by Tony on 16/9/6.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "NSString+Tools.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (Tools)
- (BOOL)isValidateTelNumber {
    NSString *strRegex = @"^1(3[0-9]|5[0-9]|8[0-9]|4[0-9]|7[0-9])\\d{8}$";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex];
    return [regex evaluateWithObject:self];
}

- (BOOL)isValidateEmail {
    NSString *strRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex];
    return [regex evaluateWithObject:self];
}

-(BOOL)isValidateIdentityCard{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

-(BOOL)isValidateUserName{
    //用户名需为2-16个字符或汉字组成,且不能以数字开头,不能包含空格/特殊字符
    NSString *nameRegex = @"^[a-zA-Z\\u4E00-\\u9FA5\\uF900-\\uFA2D]\\w{2,16}$";
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    return [namePredicate evaluateWithObject:self];
}

-(BOOL)isValidatePassword{
    //用户密码需为6-16为数字或字符组成，不能包含特殊符号
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}

- (BOOL)isValidateInput {
    NSString *strRegex1 = @"[a-z0-9A-Z]";
    NSPredicate *regex1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex1];
    
    NSString *strRegex2 = @"[\u4e00-\u9fa5]";
    NSPredicate *regex2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex2];
    
    NSString *strRegex3 = @"[,\\.;:\"'!。“”、？?]";
    NSPredicate *regex3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strRegex3];
    return ([regex1 evaluateWithObject:self] || [regex2 evaluateWithObject:self] || [regex3 evaluateWithObject:self]);
}

/**
 *  判断长度是否在min和max之间
 */
- (BOOL)lengthBetweenMin:(NSUInteger)min
                     max:(NSUInteger)max {
    NSUInteger length = self.length;
    if (length >= min && length <= max) {
        return YES;
    }
    return NO;
}

- (BOOL)notEmpty {
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [self stringByTrimmingCharactersInSet:charSet];
    return trimmed.length > 0;
}


/**
 *  符合时间格式的字符转成时间
 */
- (NSString *)timeString {
    if ([self length] == 0) {
        return @"";
    }
    NSTimeInterval time = [self doubleValue];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSTimeInterval nowTime = [[NSDate date] timeIntervalSinceDate:publishDate];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    if ([[dateFormatter stringFromDate:publishDate] isEqualToString:[dateFormatter stringFromDate:[NSDate date]]]) {
        if (nowTime < 60*60) {
            int second = nowTime/60;
            if (second == 0) {
                return @"刚刚";
            }
            return [NSString stringWithFormat:@"%d分钟前",second];
        }
        else {
            int hours = nowTime/(60*60);
            return [NSString stringWithFormat:@"%d小时前",hours];
        }
    }
    else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        return [dateFormatter stringFromDate:publishDate];
    }
}

/**
 *  带日期的时间格式
 */
- (NSString *)timeStringWithHour {
    if ([self length] == 0) {
        return @"";
    }
    NSTimeInterval time = [self doubleValue];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSDate *publishDate = [NSDate dateWithTimeIntervalSince1970:time];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    return [dateFormatter stringFromDate:publishDate];
}

- (NSString *)escapeHTML {
    NSMutableString *result = [[NSMutableString alloc] initWithString:self];
    [result replaceOccurrencesOfString:@"&" withString:@"&amp;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@"<" withString:@"&lt;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@">" withString:@"&gt;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@"\"" withString:@"&quot;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@"'" withString:@"&#39;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    return result;
}

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}



@end
