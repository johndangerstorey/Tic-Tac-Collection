//
//  TCGameViewController.m
//  Tic-Tac-Collection
//
//  Created by Joshua Howland on 6/11/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TCGameViewController.h"

#import "TCGameCollectionViewDataSource.h"

#import "TCGameController.h"

@interface TCGameViewController () <UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) TCGameCollectionViewDataSource *datasource;


@end

@implementation TCGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nibBundleOrNil];
    if (self) {
        self.datasource = [TCGameCollectionViewDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Tic Tac Collection";
    self.navigationController.navigationBar.translucent = NO;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.datasource registerCollectionView:self.collectionView];
    
    [self.collectionView setDataSource:self.datasource];
    [self.collectionView setDelegate:self];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    [self.view addSubview:self.collectionView];
    
    UIButton *newGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    newGameButton.frame = CGRectMake(60, self.view.frame.size.height - 200, 200, 50);
    [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [newGameButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:newGameButton];

    [newGameButton addTarget:self action:@selector(newGame) forControlEvents:UIControlEventTouchUpInside];
}

- (void)newGame {

    [[TCGameController sharedInstance] resetGame];
    [self.collectionView reloadData];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([[TCGameController sharedInstance] lastPlay]) {
      
        if (![[TCGameController sharedInstance] isPlayWinAtIndex:indexPath.row]) {
        
            [[[UIAlertView alloc] initWithTitle:@"Time for a new game" message:nil delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
            [self newGame];

        } else {
        
            [[[UIAlertView alloc] initWithTitle:@"You barely won!" message:nil delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
            [self newGame];

        }
        
    } else {

        if ([[TCGameController sharedInstance] isPlayWinAtIndex:indexPath.row]) {
            [[[UIAlertView alloc] initWithTitle:@"You won!" message:nil delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil] show];
            [self newGame];
        }

    }
    

    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
