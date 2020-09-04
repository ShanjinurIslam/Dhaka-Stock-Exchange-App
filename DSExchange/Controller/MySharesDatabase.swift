//
//  MySharesDatabase.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

import SQLite

class MySharesDatabase{
    private var db:Connection!
    var shares:Table!
    var id:Expression<Int64>
    var instrument:Expression<String>
    var total:Expression<Int>
    var saleable:Expression<Int>
    var cost:Expression<Double>
    var totalcost:Expression<Double>
    
    init() {
        db = try? Connection("db.sqlite3")
        shares = Table("shares")
        id = Expression<Int64>("id")
        instrument = Expression<String>("instrument")
        total = Expression<Int>("total")
        saleable = Expression<Int>("saleable")
        cost = Expression<Double>("cost")
        totalcost = Expression<Double>("totalcost")
        
        try! db.run(shares.create(ifNotExists: true) { t in
            t.column(id,primaryKey: true)
            t.column(instrument)
            t.column(total)
            t.column(saleable)
            t.column(cost)
            t.column(totalcost)
        })
    }
    
    func addShare(myshare:MyShare)->MyShare{
        let insert = shares.insert(or: .replace,instrument <- myshare.instrument,total<-myshare.total,saleable<-myshare.saleable,cost<-myshare.cost,totalcost<-myshare.totalcost)
        
        let rowid = try! db.run(insert)
        
        var temp:MyShare = myshare
        temp.id = rowid
        
        return temp
    }
    
    func getMyShares() -> [MyShare] {
        var myShares:[MyShare] = [MyShare]()
        
        for share in try! db.prepare(shares) {
            var temp:MyShare = MyShare()
            temp.id = share[id]
            temp.instrument = share[instrument]
            temp.total = share[total]
            temp.saleable = share[saleable]
            temp.cost = share[cost]
            temp.totalcost = share[totalcost]
            
            myShares.append(temp)
        }
        
        return myShares
    }
    
    func updateShare(myshare:MyShare){
        let share = shares.filter(id==myshare.id)
        try! db.run(share.update(instrument <- myshare.instrument,total<-myshare.total,saleable<-myshare.saleable,cost<-myshare.cost,totalcost<-myshare.totalcost))
    }
    
    func deleteShare(shareID:Int64){
        let share = shares.filter(id==shareID)
        try! db.run(share.delete())
    }
}
