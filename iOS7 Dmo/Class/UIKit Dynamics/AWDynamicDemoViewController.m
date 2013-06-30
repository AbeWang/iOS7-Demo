#import "AWDynamicDemoViewController.h"
#import "AWGravityCollisionViewController.h"
#import "AWAttachmentViewController.h"
#import "AWGravityCollisionSpringViewController.h"
#import "AWDynamicItemViewController.h"
#import "AWSnapViewController.h"

@implementation AWDynamicDemoViewController
{
    UITableView *tableView;
    NSArray *demoItems;
}

- (void)loadView
{
    [super loadView];
    self.title = @"UIKit Dynamics";
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    demoItems = @[@"Gravity + Collision", @"Attachment", @"Gravity + Collision + Spring", @"Dynamic Item", @"Snap"];
}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return demoItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)inTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Id = @"Identifier";
    
    UITableViewCell *cell = [inTableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    cell.textLabel.text = demoItems[indexPath.row];
    
    return cell;
}

#pragma mark - TableView Delegates

- (void)tableView:(UITableView *)inTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [inTableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            AWGravityCollisionViewController *controller = [[AWGravityCollisionViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        case 1:
        {
            AWAttachmentViewController *controller = [[AWAttachmentViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        case 2:
        {
            AWGravityCollisionSpringViewController *controller = [[AWGravityCollisionSpringViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        case 3:
        {
            AWDynamicItemViewController *controller = [[AWDynamicItemViewController alloc] init];
            [self.navigationController  pushViewController:controller animated:YES];
        }
            break;
        case 4:
        {
            AWSnapViewController *controller = [[AWSnapViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
