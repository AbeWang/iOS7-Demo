#import "AWDemoViewController.h"
#import "AWTransitionOneViewController.h"
#import "AWBlurredBackgroundViewController.h"
#import "AWDynamicDemoViewController.h"
#import "AWMotionEffectsViewController.h"
#import "AWJSCoreDemoViewController.h"

@implementation AWDemoViewController
{
    UITableView *tableView;
}

- (void)loadView
{
    [super loadView];
    self.title = @"iOS7 Demo";
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)inTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Id = @"Identifier";
    
    UITableViewCell *cell = [inTableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    
    NSArray *titles = @[@"Custom Transitions", @"Blurred Background", @"UIKit Dynamics", @"Motion Effects", @"JS Core"];
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

#pragma mark - TableView Delegates

- (void)tableView:(UITableView *)inTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [inTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        // Custom Transitions
        case 0:
        {
            AWTransitionOneViewController *controller = [[AWTransitionOneViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        // Blurred Background
        case 1:
        {
            AWBlurredBackgroundViewController *controller = [[AWBlurredBackgroundViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        // UIKit Dynamics
        case 2:
        {
            AWDynamicDemoViewController *controller = [[AWDynamicDemoViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        // Motion Effects
        case 3:
        {
            AWMotionEffectsViewController *controller = [[AWMotionEffectsViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
        // JavaScriptCore
        case 4:
        {
            AWJSCoreDemoViewController *controller = [[AWJSCoreDemoViewController alloc] init];
            [[self navigationController] pushViewController:controller animated:YES];
        }
            break;
    }
}

@end
