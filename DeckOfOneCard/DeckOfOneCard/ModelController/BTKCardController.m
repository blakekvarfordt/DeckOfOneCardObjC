//
//  BTKCardController.m
//  DeckOfOneCard
//
//  Created by Blake kvarfordt on 8/20/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

#import "BTKCardController.h"
#import <UIKit/UIKit.h>
@class BTKCard;


@implementation BTKCardController

+ (BTKCardController *) shared {
    static BTKCardController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [BTKCardController new];
    });
    return shared;
}


- (void) drawANewCard:(NSInteger)numberOfCards completion: (void (^) (NSArray<BTKCard *> *cards, NSError *error))completion
{
    
    
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    NSURL *baseURL = [[NSURL alloc] initWithString: @"https://deckofcardsapi.com/api/deck/new/draw"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:@"count" value:cardCount];
    
    components.queryItems = @[queryItem];
    
    NSURL *finalURL = components.URL;
    
    
    
    NSLog(@"Final URL: %@", finalURL);
    
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { NSLog(@"Error: %@, Localized Description: %@", error, error.localizedDescription); completion(nil, error); return; }
        
        if (!data) { completion(nil, error); return; }
        
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *cardsArray = topLevelDictionary[@"cards"];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray new];
        
        for (NSDictionary *cardDictionaries in cardsArray);
        {
            BTKCard *card = [[BTKCard alloc] initWithCardDictionary:topLevelDictionary];
            [cardsPlaceholder addObject:card];
            
        }
        
        completion(cardsPlaceholder, nil);
        
    }]resume];
      
      }


- (void) fetchCardImage:(BTKCard *)card completion: (void (^) (UIImage *image, NSError *error))completion;
{
    
    NSURL *imageURL = [NSURL URLWithString:card.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) { NSLog(@"Error: %@, Localized Description: %@", error, error.localizedDescription); completion(nil, error); return; }
        
        if (!data) { completion(nil, error); return; }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        
        completion(cardImage, nil);
        
        
    }]resume];
}

@end
