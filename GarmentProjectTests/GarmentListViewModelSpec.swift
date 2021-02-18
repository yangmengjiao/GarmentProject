//
//  GarmentListViewModelSpec.swift
//  GarmentProjectTests
//
//  Created by mengjiao on 2/17/21.
//


import Quick
import Nimble
import RealmSwift
@testable import GarmentProject

/*
 Test Data base layer
 */
class GarmentListViewModelSpec: QuickSpec {
    var realm: Realm!
    var sut: GarmentListViewModel!
    override func spec() {
        super.spec()
        // set up system under test
        beforeEach {
            self.realm = try! Realm()
            // clean database before test
            try! self.realm.write {
                self.realm.deleteAll()
            }
            
            self.sut = GarmentListViewModel()
            
        }
        
        // tear down
        afterEach {
            self.realm = nil
            self.sut = nil
        }
        
        describe("viewModel") {
            it("view can fetch data correctly") {
                // 1. Store some Garments
                GarmentDB.save("Test1")
                GarmentDB.save("Test2")
                GarmentDB.save("Test1")
                GarmentDB.save("Test2")
                
                // 2. Get the garments lists
                let list = self.sut.garmentsByDate
            
                // 3. check
                expect(list.count) == 4 
            }
        }
    }
}

