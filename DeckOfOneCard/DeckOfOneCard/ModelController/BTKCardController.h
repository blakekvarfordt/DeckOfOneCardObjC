//
//  BTKCardController.h
//  DeckOfOneCard
//
//  Created by Blake kvarfordt on 8/20/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTKCard.h"


NS_ASSUME_NONNULL_BEGIN

@interface BTKCardController : NSObject

+ (BTKCardController *)shared;

- (void) drawANewCard:(NSInteger)card completion: (void (^) (NSArray<BTKCard *> *cards, NSError *error))completion;


- (void) fetchCardImage:(BTKCard *)card completion: (void (^) (UIImage *image, NSError *error))completion;


@end

NS_ASSUME_NONNULL_END
