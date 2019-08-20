//
//  BTKCard.m
//  DeckOfOneCard
//
//  Created by Blake kvarfordt on 8/20/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKCard.h"

static NSString * const suitKey = @"suit";
static NSString * const imageURLKey = @"image";
static NSString * const cardsKey = @"cards";



@implementation BTKCard

- (instancetype)initWithSuit:(NSString *)suit imageURL:(NSString *)imageURL
{
    self = [super init];
    
    if (self != nil) {
        _suit = suit;
        _imageURL = imageURL;
        
    }
    return self;
}

@end


@implementation BTKCard (NSJSONConvertible)

- (instancetype)initWithCardDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *suit = dictionary[suitKey];
    NSString *imageURL = dictionary[imageURLKey];
    
    return [self initWithSuit:suit imageURL:imageURL];
    
    
    
}

@end
