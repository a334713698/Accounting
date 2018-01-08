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

@implementation HDJAddCategoryController{
    HDJIncomeExpensesModel* _selectModel;
}

- (NSMutableArray<HDJIncomeExpensesModel*> *)itemsArr{
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
        _addCategoryTopView = [[HDJAddCategoryTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, adaptHeight(50))];
        [self.view addSubview:_addCategoryTopView];
    }
    return _addCategoryTopView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CGFloat width = ICON_SIZE;
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
    
    if (self.editModel) {
        _selectModel = self.editModel;
        self.addCategoryTopView.cateTextField.text = _selectModel.name;
    }else{
        _selectModel = self.itemsArr.firstObject;
    }
    
    self.addCategoryTopView.iconImageView.image = [UIImage imageNamed:_selectModel.icon];
}

- (void)initNav{
    self.navTitle = @"添加类别";
    
    self.view.backgroundColor = WHITE_COLOR;
    
    self.navButtonLeft.frame = CGRectMake(0, 0, NavigationBarIcon + NAVIGATIONBAR_HEIGHT, NAVIGATIONBAR_HEIGHT);
    [self.navButtonLeft setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [self.navButtonLeft setTitle:@"" forState:UIControlStateNormal];
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
    HDJIncomeExpensesModel* itemModel = self.itemsArr[indexPath.item];
    HDJCateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"addCateCell" forIndexPath:indexPath];
    cell.iconImageView.image = [UIImage imageNamed:itemModel.icon];
    return cell;
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HDJIncomeExpensesModel* model = self.itemsArr[indexPath.item];
    _selectModel = model;
    self.addCategoryTopView.iconImageView.image = [UIImage imageNamed:model.icon];
    
}



- (void)navRightPressed:(id)sender {
    DLog(@"=> navRightPressed !");
    if (!self.addCategoryTopView.cateTextField.text.length) {
        DLog(@"分类名称未输入");
        [MBProgressHUD showInfo:@"分类名称未输入"];
        return;
    }
    DLog(@"准备插入数据");
    
    [self.dbMgr.database open];
    
    if (self.isEdit) {
        
        HDJDSQLSearchModel* newModel_1 = [HDJDSQLSearchModel new];
        newModel_1.attriName = @"icon";
        newModel_1.symbol = @"=";
        newModel_1.specificValue = [NSString stringWithFormat:@"\'%@\'",_selectModel.icon];

        HDJDSQLSearchModel* newModel_2 = [HDJDSQLSearchModel new];
        newModel_2.attriName = @"name";
        newModel_2.symbol = @"=";
        newModel_2.specificValue = [NSString stringWithFormat:@"\'%@\'",self.addCategoryTopView.cateTextField.text];

        
        [self.dbMgr updateDataIntoTableWithName:inuse_income_expenses_table andSearchModel:[HDJDSQLSearchModel createSQLSearchModelWithAttriName:@"cate_id" andSymbol:@"=" andSpecificValue:[NSString stringWithFormat:@"%ld",self.editModel.cate_id]] andNewModelArr:@[newModel_1,newModel_2]];
        
    }else{
        
        NSMutableDictionary* dic = [NSMutableDictionary dictionary];
        
        [dic setValue:[NSString stringWithFormat:@"%ld",self.type] forKey:@"type_id"];
        [dic setValue:[NSString stringWithFormat:@"\'%@\'",_selectModel.icon] forKey:@"icon"];
        [dic setValue:[NSString stringWithFormat:@"\'%@\'",self.addCategoryTopView.cateTextField.text] forKey:@"name"];

        [self.dbMgr insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:[dic copy]];
    }
    
    [self.dbMgr.database close];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
