//
//  TCGameCollectionViewDataSource.m
//  Tic-Tac-Collection
//
//  Created by Joshua Howland on 6/11/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TCGameCollectionViewDataSource.h"
#import "TCGameController.h"

static NSString * const PieceIdentifier = @"PieceIdentifier";

@implementation TCGameCollectionViewDataSource

- (void)registerCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:PieceIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PieceIdentifier forIndexPath:indexPath];
    
    for (UIView *subview in cell.contentView.subviews) {
        [subview removeFromSuperview];
    }
    
    UILabel *play = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    play.textAlignment = NSTextAlignmentCenter;
    play.text = [[TCGameController sharedInstance] playAtIndex:indexPath.row];
    [cell.contentView addSubview:play];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

@end
