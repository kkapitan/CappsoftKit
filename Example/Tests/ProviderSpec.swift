//
//  ProviderSpec.swift
//  CappsoftKit
//
//  Created by Krzysztof Kapitan on 24.12.2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CappsoftKit

class ProviderSpec: QuickSpec {
    class ReusableCell: UITableViewCell, Reusable {}
    
    override func spec() {
        describe("Provider") {
            
            context("when initializing") {
                var provider: Provider<TestErrorFetcher>!
                var fetcher: TestErrorFetcher!
                beforeEach {
                    fetcher = TestErrorFetcher()
                    provider = Provider<TestErrorFetcher>(fetcher: fetcher)
                }
                
                it("stores the fetcher") {
                    expect(provider.fetcher).notTo(beNil())
                }
            }
            
            context("when loading results in error") {
                var provider: Provider<TestErrorFetcher>!
                beforeEach {
                    provider = Provider<TestErrorFetcher>(fetcher: TestErrorFetcher())
                }
                
                it("calls the completion") {
                    var completionCalled = false
                    
                    provider.loadItems(completion: { _ in
                        completionCalled = true
                    })
                    
                    expect(completionCalled).to(beTrue())
                }
                
                it("returns an error in completion") {
                    provider.loadItems(completion: { (result) in
                        if case .error(let error) = result, let nsError = error as? NSError {
                            expect(nsError).to(equal(provider.fetcher.error))
                        } else {
                            fail("did not end with failure")
                        }
                    })
                }
                
                it("do not change items") {
                    let items = provider.items
                    
                    provider.loadItems(completion: { _ in })
                    
                    expect(items).to(equal(provider.items))
                }
            }
            
            context("when fetching results in success") {
                context("when data is not paged") {
                    var provider: Provider<TestSuccessFetcher>!
                    beforeEach {
                        provider = Provider<TestSuccessFetcher>(fetcher: TestSuccessFetcher())
                    }

                    it("calls the completion") {
                        var completionCalled = false
                        
                        provider.loadItems(completion: { _ in
                            completionCalled = true
                        })
                        
                        expect(completionCalled).to(beTrue())
                    }
                
                    it("returns items in completion") {
                        provider.loadItems(completion: { (result) in
                            if case .success(let items) = result {
                                expect(items).to(equal(provider.fetcher.data))
                            } else {
                                fail("did not end with success")
                            }
                        })
                    }
                    
                    it("stores items as property") {
                        provider.loadItems(completion: { _ in })
                        
                        expect(provider.items).to(equal(provider.fetcher.data))
                    }
                }
                
                context("when data is paged") {
                    var provider: Provider<TestSuccessPagedFetcher>!
                    beforeEach {
                        provider = Provider<TestSuccessPagedFetcher>(fetcher: TestSuccessPagedFetcher())
                    }
                    
                    it("calls the completion") {
                        var completionCalled = false
                        provider.loadFirst(completion: { _ in
                            completionCalled = true
                        })
                        
                        expect(completionCalled).to(beTrue())
                        
                        completionCalled = false
                        provider.loadMore(completion: { _ in
                            completionCalled = true
                        })
                        
                        expect(completionCalled).to(beTrue())
                    }
                    
                    it("returns first page in completion when loading first") {
                        provider.loadFirst(completion: { (result) in
                            if case .success(let items) = result {
                                expect(items).to(equal(provider.fetcher.data1))
                            } else {
                                fail("did not end with success")
                            }
                        })
                    }
                    
                    it("returns next page in completion when loading more") {
                        provider.loadFirst(completion: {_ in })
                        
                        provider.loadMore(completion: { (result) in
                            if case .success(let items) = result {
                                expect(items).to(equal(provider.fetcher.data2))
                            } else {
                                fail("did not end with success")
                            }
                        })
                    }
                    
                    it("stores first page as property") {
                        provider.loadFirst(completion: { _ in })
                        
                        expect(provider.items).to(equal(provider.fetcher.data1))
                    }
                    
                    it("appends next page to other items") {
                        provider.loadFirst(completion: { _ in })
                        provider.loadMore(completion: { _ in })
                        
                        var data = provider.fetcher.data1
                        data.append(contentsOf: provider.fetcher.data2)
                        
                        expect(provider.items).to(equal(data))
                    }
                }
            }

        
        }
    }
}

