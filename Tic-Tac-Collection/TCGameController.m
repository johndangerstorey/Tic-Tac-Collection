//
//  TCGameController.m
//  Tic-Tac-Collection
//
//  Created by Joshua Howland on 6/11/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TCGameController.h"

@interface TCGameController ()

@property (nonatomic, strong) NSMutableArray *boardPlays;
@property (nonatomic, strong) NSString *currentTurn;

@end

@implementation TCGameController

+ (TCGameController *)sharedInstance {
    static TCGameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TCGameController alloc] init];
        
        [sharedInstance resetGame];
        
    });
    return sharedInstance;
}


- (void)resetGame {
    
    self.currentTurn = @"X";
    self.boardPlays = @[@"", @"", @"", @"", @"", @"", @"", @"", @""].mutableCopy;

}


- (BOOL)lastPlay {
    BOOL playCount = 0;
    for (NSString *play in self.boardPlays) {
        if (![play isEqualToString:@""]) {
            playCount++;
        }
    }
    return playCount == 8;
}

- (BOOL)isPlayWinAtIndex:(NSInteger)index {
    self.boardPlays[index] = self.currentTurn;

    BOOL gameOver = [self isGameOver];
    
    if ([self.currentTurn isEqualToString:@"X"]) {
        self.currentTurn = @"O";
    } else {
        self.currentTurn = @"X";
    }
 
    return gameOver;
    
}

- (NSString *)playAtIndex:(NSInteger)index {
    return self.boardPlays[index];
}

-(BOOL)isGameOver {
    NSArray *winCombinations = [[NSArray alloc] initWithObjects:    @[@1,@2,@3], @[@4,@5,@6], @[@7,@8,@9],
                                @[@1,@4,@7], @[@2,@5,@8], @[@3,@6,@9],
                                @[@1,@5,@9], @[@3,@5,@7], nil];
    
    for (NSArray *winCombination in winCombinations) {
        BOOL isWinner = TRUE;
        for (NSNumber *winIndex in winCombination) {
            NSInteger winIndexInteger = [winIndex integerValue]-1;
            if (![self.boardPlays[winIndexInteger] isEqualToString:self.currentTurn]) {
                isWinner = FALSE;
            }
        }
        if (isWinner == TRUE) return TRUE;
    }
    
    return FALSE;
}

@end
