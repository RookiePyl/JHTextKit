//
//  NSString+JHEmoji.h
//  MaxLength
//
//  Created by Rookie-Red on 2019/9/6.
//  Copyright © 2019. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JHEmoji)

- (BOOL)containsEmoji;
- (BOOL)isEmoji;
- (NSString *)removeEmoji;

@end

NS_ASSUME_NONNULL_END
