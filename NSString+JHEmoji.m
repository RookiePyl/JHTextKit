//
//  NSString+JHEmoji.m
//  MaxLength
//
//  Created by Rookie-Red on 2019/9/6.
//  Copyright © 2019. All rights reserved.
//

#import "NSString+JHEmoji.h"

@implementation NSString (JHEmoji)

- (BOOL)isEmoji
{
    NSString *emojiPattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSPredicate *emojiPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emojiPattern];
    BOOL isEmojiMatch = [emojiPredicate evaluateWithObject:self];

    NSString *yanTextPattern = @"[^\\u4e00-\\u9fa5a-zA-Z\\d,\\,.，。!！;；*%￥$?？]+";
    NSPredicate *yanTextPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", yanTextPattern];
    BOOL isYanTextMatch = [yanTextPredicate evaluateWithObject:self];

    return isEmojiMatch || isYanTextMatch;

}

- (BOOL)containsEmoji
{
    __block BOOL containsEmoji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if ([substring isEmoji])
        {
            containsEmoji = YES;
            *stop = YES;
        }
    }];
    return containsEmoji;
}

- (NSString *)removeEmoji
{
    __block NSString *buffer = [[NSMutableString alloc] initWithCapacity:self.length];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (![substring isEmoji])
        {
            buffer = [buffer stringByAppendingString:substring];
        }
    }];
    return buffer;
}


@end
