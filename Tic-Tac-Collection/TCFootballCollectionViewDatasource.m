//
//  TCFootballCollectionViewDatasource.m
//  Tic-Tac-Collection
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TCFootballCollectionViewDatasource.h"

@implementation TCFootballCollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    [cell setFrame:CGRectMake(0, 0, 10, 10)];
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}

- (void) registerCollectionView: (UICollectionView *)collectionView{
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
}

@end
