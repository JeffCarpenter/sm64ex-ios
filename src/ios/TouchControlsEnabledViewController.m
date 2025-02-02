//
//  TouchControlsEnabledViewController.m
//  sm64ios
//
//  Created by Christian Kosman on 9/27/21.
//

#import "TouchControlsEnabledViewController.h"
#import "../pc/configfile.h"


@implementation TouchControlsEnabledViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    for (size_t i = 0; i < 3; i++)
    {
        if (i == configTouchMode)
        {
            self.m_last_selected = i;
        }
    }

    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.m_last_selected inSection:0]];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((unsigned int)indexPath.row != configTouchMode)
    {
        UITableViewCell* old_cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.m_last_selected inSection:0]];
        [old_cell setAccessoryType:UITableViewCellAccessoryNone];
        
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        
        configTouchMode = (unsigned int)indexPath.row;
        configfile_save(configfile_name());
        
        self.m_last_selected = indexPath.row;
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
