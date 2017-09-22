//
//  FFDB.swift
//  Swift-FFDB
//
//  Created by Fidetro on 2017/8/20.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

extension FIDRuntime {
    var subType: Any.Type {
        let mirror  = Mirror(reflecting: self)
        return mirror.subjectType
    }
    fileprivate static func propertyOfSelf() -> Array<String> {
        let selfProtocol = self.init();
        let mirror  = Mirror(reflecting: selfProtocol)
        var propertys = Array<String>()
        
        for case let (label?, _) in mirror.children {
            propertys.append(label)
        }
        return propertys
    }
    fileprivate static  func className() -> String {
        let mirror  = Mirror(reflecting: self)
        return String(describing: mirror.subjectType)
    }
    
    func valueFrom(_ key: String) -> Any {
        let mirror = Mirror(reflecting: self)
        
         for case let (label?, value) in mirror.children {
            if label == key {
                return value
            }
        }
        
        return ""
    }
    func allValue() -> Array<Any> {
        let mirror = Mirror(reflecting: self)
        var values = Array<Any>();
    
        for case let (_, value) in mirror.children {
            values.append(value)
        }
        
        return values
    }
}

extension FFDataBaseModel {
    var subType: FFDataBaseModel.Type {
        let mirror  = Mirror(reflecting: self)
        return mirror.subjectType as! FFDataBaseModel.Type
    }
    static  func tableName() -> String {
        let tableName = self.className().replacingOccurrences(of: ".Type", with: "")
        return tableName
    }
    
    static func columnsOfSelf() -> Array<String> {
        var columns = self.propertyOfSelf()
        if let index = columns.index(of: "primaryID") {
            columns.remove(at: index)
        }
        return columns
    }
   
}
