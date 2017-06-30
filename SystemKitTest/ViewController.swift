//
//  ViewController.swift
//  SystemKitTest
//
//  Created by 孔祥波 on 16/11/2016.
//  Copyright © 2016 beltex. All rights reserved.
//

import UIKit
import SystemKitiOS
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func test()  {
        print("// MACHINE STATUS")
        
        print("\n-- CPU --")
        print("\tPHYSICAL CORES:  \(System.physicalCores())")
        print("\tLOGICAL CORES:   \(System.logicalCores())")
        
        var sys = System()
        let cpuUsage = sys.usageCPU()
        print("\tSYSTEM:          \(Int(cpuUsage.system))%")
        print("\tUSER:            \(Int(cpuUsage.user))%")
        print("\tIDLE:            \(Int(cpuUsage.idle))%")
        print("\tNICE:            \(Int(cpuUsage.nice))%")
        
        
        print("\n-- MEMORY --")
        print("\tPHYSICAL SIZE:   \(System.physicalMemory())GB")
        
        let memoryUsage = System.memoryUsage()
        func memoryUnit(_ value: Double) -> String {
            if value < 1.0 { return String(Int(value * 1000.0))    + "MB" }
            else           { return NSString(format:"%.2f", value) as String + "GB" }
        }
        
        print("\tFREE:            \(memoryUnit(memoryUsage.free))")
        print("\tWIRED:           \(memoryUnit(memoryUsage.wired))")
        print("\tACTIVE:          \(memoryUnit(memoryUsage.active))")
        print("\tINACTIVE:        \(memoryUnit(memoryUsage.inactive))")
        print("\tCOMPRESSED:      \(memoryUnit(memoryUsage.compressed))")
        
        
        print("\n-- SYSTEM --")
        print("\tMODEL:           \(System.modelName())")
        let names = System.uname()
        print("\tSYSNAME:         \(names.sysname)")
        print("\tNODENAME:        \(names.nodename)")
        print("\tRELEASE:         \(names.release)")
        print("\tVERSION:         \(names.version)")
        print("\tMACHINE:         \(names.machine)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

