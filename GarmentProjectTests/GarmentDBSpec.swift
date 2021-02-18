//
//  GarmentDBSpec.swift
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
class GarmentDBSpec: QuickSpec {
    var realm: Realm!
    override func spec() {
        super.spec()
        // set up system under test
        beforeEach {
            self.realm = try! Realm()
            // clean database before test
            try! self.realm.write {
                self.realm.deleteAll()
            }
        }
        
        // tear down
        afterEach {
            self.realm = nil
        }
        
        describe("save") {
            it("saves object to database correctly") {
                // 1. Create a Garment name
                let garmentName = "Shirt"
                
                // 2. Call the save method
                GarmentDB.save(garmentName)
                
                // 3. Expect the garment to be saved to database
                let lastGarment = self.realm.objects(GarmentDB.self).last
                expect(lastGarment?.name) == garmentName
            }
        }
    }
}
