//
//  BTKCard.h
//  DeckOfOneCard
//
//  Created by Blake kvarfordt on 8/20/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTKCard : NSObject

@property (copy, nonatomic, readonly) NSString *suit;
@property (copy, nonatomic, readonly) NSString *imageURL;


- (instancetype) initWithSuit:(NSString *)suit imageURL:(NSString *)imageURL;

@end



@interface BTKCard (NSJSONConvertible)

- (instancetype)initWithCardDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
