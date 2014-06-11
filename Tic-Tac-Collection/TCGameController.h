//
//  TCGameController.h
//  Tic-Tac-Collection
//
//  Created by Joshua Howland on 6/11/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCGameController : NSObject

+ (TCGameController *)sharedInstance;

- (BOOL)lastPlay;

- (BOOL)isPlayWinAtIndex:(NSInteger)index;
- (NSString *)playAtIndex:(NSInteger)index;

- (void)resetGame;

@end
