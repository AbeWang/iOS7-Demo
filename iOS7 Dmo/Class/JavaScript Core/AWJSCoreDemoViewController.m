#import "AWJSCoreDemoViewController.h"

@implementation AWJSCoreDemoViewController
{
    UITableView *table;
}

- (void)loadView
{
    [super loadView];
    self.title = @"JavaScriptCore";
    
    table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)inTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Id = @"Id";
    UITableViewCell *cell = [inTableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    cell.textLabel.text = (indexPath.row) ? @"JavaScript -> Obj-C" : @"Obj-C -> JavaScript";
    return cell;
}

- (void)tableView:(UITableView *)inTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [inTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
