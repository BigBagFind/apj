//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:18],
                                 NSForegroundColorAttributeName:[UIColor whiteColor]
                                 };
    self.navigationBar.titleTextAttributes = attributes;
    
}



@end
