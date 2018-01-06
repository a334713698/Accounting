//
//  HDJRecordView.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJRecordView.h"
#import "HDJRecordCollectionViewCell.h"
#import "HDJIncomeExpensesModel.h"

@interface HDJRecordView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<HDJIncomeExpensesModel*> *itemsArr;

@end

@implementation HDJRecordView

- (DJDatabaseManager *)dbMgr{
    if (!_dbMgr) {
        _dbMgr = [DJDatabaseManager sharedDJDatabaseManager];
    }
    return _dbMgr;
}

- (NSMutableArray<HDJIncomeExpensesModel*> *)itemsArr{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
        [self.dbMgr.database open];

        [_itemsArr addObjectsFromArray:[HDJIncomeExpensesModel mj_objectArrayWithKeyValuesArray:[self.dbMgr getAllTuplesFromTabel:inuse_income_expenses_table andSearchModel:[HDJDSQLSearchModel createSQLSearchModelWithAttriName:@"type_id" andSymbol:@"=" andSpecificValue:[NSString stringWithFormat:@"%ld",self.type]]]]];
        DLog(@"%ld",_itemsArr.count);
        [self.dbMgr.database close];

    }
    return _itemsArr;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat width = SCREEN_WIDTH / 5.0;
        CGFloat height = width;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(width, height);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[HDJRecordCollectionViewCell class] forCellWithReuseIdentifier:@"recordCell"];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = YES;
        _collectionView.scrollEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self addSubview:_collectionView];
        WS(weakSelf)
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.recordTopView.mas_bottom);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _collectionView;
}

- (HDJRecordTopView *)recordTopView{
    if (!_recordTopView) {
        _recordTopView = [[HDJRecordTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATIONBAR_HEIGHT + STATUSBAR_HEIGHT)];
        [self addSubview:_recordTopView];
    }
    return _recordTopView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (instancetype)initWithType:(HDJProjectType)type{
    self = [super init];
    if (self) {
        _type = type;
        [self initSubView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView{
    self.recordTopView.hidden = NO;
    self.collectionView.hidden = NO;
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemsArr.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HDJRecordCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recordCell" forIndexPath:indexPath];
    if (indexPath.item == self.itemsArr.count) {
        cell.iconImageView.image = [UIImage imageNamed:@"icon_add"];
        cell.nameLabel.text = @"编辑";
    }else{
        HDJIncomeExpensesModel* model = self.itemsArr[indexPath.item];
        cell.iconImageView.image = [UIImage imageNamed:model.icon];
        cell.nameLabel.text = model.name;
    }
    return cell;
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == self.itemsArr.count) {
        DLog(@"点击编辑");
        if ([self.delegate respondsToSelector:@selector(editWithRecordView:)]) {
            [self.delegate editWithRecordView:self];
        }
    }else{
        DLog(@"点击cell");
        HDJIncomeExpensesModel* model = self.itemsArr[indexPath.item];
        HDJRecordCollectionViewCell *cell = (HDJRecordCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
        if ([self.delegate respondsToSelector:@selector(recordView:chooseItemWithImage:andTitle:)]) {
            [self.delegate recordView:self chooseItemWithImage:[cell.iconImageView.image deepCopy]  andTitle:model.name];
        }
    }
}

#pragma mark -Method
- (void)updateData{
    _itemsArr = nil;
    [self.collectionView reloadData];
}

@end
