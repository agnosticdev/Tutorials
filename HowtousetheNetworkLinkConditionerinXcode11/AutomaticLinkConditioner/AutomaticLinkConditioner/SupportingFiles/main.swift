//
//  main.swift
//  AutomaticLinkConditioner
//
//  Created by Matt Eaton on 6/10/19.
//  Copyright © 2019 Matt Eaton. All rights reserved.
//

import UIKit

// Could be dead

setenv("CFNETWORK_DIAGNOSTICS", "3", 1)


UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(AutomaticLinkConditioner.self),
    NSStringFromClass(AppDelegate.self)
)
