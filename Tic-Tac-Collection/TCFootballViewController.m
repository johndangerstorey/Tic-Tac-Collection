//
//  TCFootballViewController.m
//  Tic-Tac-Collection
//
//  Created by John D. Storey on 6/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TCFootballViewController.h"
#import "TCFootballCollectionViewDatasource.h"

@interface TCFootballViewController ()

@property (strong,nonatomic) UICollectionView *collectionView;
@property (strong,nonatomic) TCFootballCollectionViewDatasource *dataSource;

@end

@implementation TCFootballViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.dataSource = [TCFootballCollectionViewDatasource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor blueColor];
    collectionView.dataSource = self.dataSource;
    self.collectionView = collectionView;
    [self.dataSource registerCollectionView:self.collectionView];
    [self.view addSubview:collectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
