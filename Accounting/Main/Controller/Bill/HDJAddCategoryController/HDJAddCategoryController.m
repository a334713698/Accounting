//
//  HDJAddCategoryController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/22.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJAddCategoryController.h"
#import "HDJCateCollectionViewCell.h"
#import "HDJAddCategoryTopView.h"
#import "HDJIncomeExpensesModel.h"

@interface HDJAddCategoryController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) HDJAddCategoryTopView *addCategoryTopView;
@property (nonatomic, strong) NSMutableArray<HDJIncomeExpensesModel*> *itemsArr;

@end

@implementation HDJAddCategoryController

- (NSMutableArray *)itemsArr{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
        [self.dbMgr.database open];
        [_itemsArr addObjectsFromArray:[HDJIncomeExpensesModel mj_objectArrayWithKeyValuesArray:[self.dbMgr getAllTuplesFromTabel:all_income_expenses_table]]];
        DLog(@"%ld",_itemsArr.count);
        [self.dbMgr.database close];
    }
    return _itemsArr;
}

- (HDJAddCategoryTopView *)addCategoryTopView{
    if(!_addCategoryTopView){
        _addCategoryTopView = [[HDJAddCategoryTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adaptHeight(NAVIGATIONBAR_HEIGHT))];
        [self.view addSubview:_addCategoryTopView];
    }
    return _addCategoryTopView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat width = CATE_ITEM_SIZE;
        CGFloat height = width;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 20;
        layout.itemSize = CGSizeMake(width, height);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[HDJCateCollectionViewCell class] forCellWithReuseIdentifier:@"addCateCell"];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = YES;
        _collectionView.scrollEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        WS(weakSelf)
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.addCategoryTopView.mas_bottom);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav];
    
    self.collectionView.hidden = NO;
}

- (void)initNav{
    self.navTitle = @"添加类别";
    
    self.view.backgroundColor = WHITE_COLOR;
    
    self.navButtonLeft.frame = CGRectMake(0, 0, NavigationBarIcon + NAVIGATIONBAR_HEIGHT, NAVIGATIONBAR_HEIGHT);
    [self.navButtonLeft setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [self.navButtonLeft setTitle:@"返回" forState:UIControlStateNormal];
    [self.navButtonRight setTitle:@"确定" forState:UIControlStateNormal];
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HDJCateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"addCateCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}



- (void)navRightPressed:(id)sender {
    DLog(@"=> navRightPressed !");
    
    
}


@end
