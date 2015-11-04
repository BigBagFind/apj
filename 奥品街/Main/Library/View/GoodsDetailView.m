//
//  GoodsDetailView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/30.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "GoodsDetailView.h"
static NSString *identityTop = @"goodsDetailCell";
static NSString *identityMid = @"orderCell";
static NSString *identityBottom = @"bottomCell";
@implementation GoodsDetailView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _configurateSelf];
    }
    return self;
}

- (void)_configurateSelf{
    self.delegate = self;
    self.dataSource = self;
    self.sectionFooterHeight = 0;
    
    [self registerNib:[UINib nibWithNibName:@"GoodsDetailCell" bundle:nil] forCellReuseIdentifier:identityTop];
    [self registerNib:[UINib nibWithNibName:@"OrdersCell" bundle:nil] forCellReuseIdentifier:identityMid];
    [self registerNib:[UINib nibWithNibName:@"BottomCell" bundle:nil] forCellReuseIdentifier:identityBottom];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        GoodsDetailCell *topCell = [tableView dequeueReusableCellWithIdentifier:identityTop forIndexPath:indexPath];
        return topCell;
    }else if(indexPath.section == 1){
         OrdersCell *midCell = [tableView dequeueReusableCellWithIdentifier:identityMid forIndexPath:indexPath];
        return midCell;
    }else{
        BottomCell *bottomCell = [tableView dequeueReusableCellWithIdentifier:identityBottom forIndexPath:indexPath];
        return bottomCell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 0.1;
    }
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 190;
    }else if(indexPath.section == 1){
        return 150;
    }else
        return 110;
}



@end
