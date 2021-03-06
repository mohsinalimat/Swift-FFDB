//
//  Delete.swift
//  Swift-FFDB
//
//  Created by Fidetro on 2018/5/30.
//  Copyright © 2018年 Fidetro. All rights reserved.
//

import Foundation
public struct Delete:STMT {
    let stmt: String
    

    
    public init(_ stmt: String?=nil) {
        if let stmt = stmt {
            self.stmt = "delete" +
                        " " +
                        stmt +
                        " "
        }else{
            self.stmt = "delete" +
                        " "
        }
    }
    

    
}

//MARK: - From
extension Delete {
    
    public func from(_ table:FFObject.Type) -> From {
        return From(stmt, table: table)
    }
    
    public func from(_ from:String) -> From {
        return From(stmt, format: from)
    }
}
