//
//  ItemCell.m
//  Homepwner
//
//  Created by Shaofeng Mo on 7/10/15.
//  Copyright (c) 2015 Seanmok. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (IBAction)showImage:(id)sender {
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end
