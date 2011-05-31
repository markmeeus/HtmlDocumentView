//
//  TestOQuery.m
//  TestOQuery
//
//  Created by Mark Meeus on 31/05/11.
//  Copyright 2011 Protime. All rights reserved.
//

#import "TestOQSelectorChainBuilder.h"
#import "OQSelectorChainBuilder.h"
#import "OQElementSelector.h"
#import "OQAttributeValueSelector.h"

@implementation TestOQuery

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testBuildSingleNameElementSelector;
{
    NSArray *chain = [OQSelectorChainBuilder buildSelectorChainForString:@"p"];
    STAssertNotNil(chain,@"chain should not be nil");    
    STAssertTrue([chain count] == 1U, @"the chain should have 1 item");
    
    id firstItemInChain = [chain objectAtIndex:0];
    
    STAssertTrue([firstItemInChain isKindOfClass:[OQElementSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([firstItemInChain elementName], @"p",@"");
}

- (void)testBuildMultipleNameElementSelector;
{
    NSArray *chain = [OQSelectorChainBuilder buildSelectorChainForString:@"p ul section li"];
    STAssertNotNil(chain,@"chain should not be nil");    
    STAssertEquals([chain count], 4U, @"the chain should have 4 items");
    
    id thirdChild = [chain objectAtIndex:2];
    STAssertTrue([thirdChild isKindOfClass:[OQElementSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([thirdChild elementName], @"section",@"");
}

-(void)testBuildSingleClassElementSelector
{    
    NSArray *chain = [OQSelectorChainBuilder buildSelectorChainForString:@".avatar"];
    STAssertNotNil(chain,@"chain should not be nil");    
    STAssertTrue([chain count] == 1U, @"the chain should have 1 item");
    
    id firstItemInChain = [chain objectAtIndex:0];    
    STAssertTrue([firstItemInChain isKindOfClass:[OQElementSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([firstItemInChain elementName], @"",@"");
    id attributeSelector = [[firstItemInChain attributeValueSelectors]objectAtIndex:0];
    STAssertTrue([attributeSelector isKindOfClass:[OQAttributeValueSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([attributeSelector attributeName], @"class",@"");
    STAssertEqualObjects([attributeSelector attributeValue], @"avatar",@"");
}


-(void)testBuildMultipleClassSelector
{    
    NSArray *chain = [OQSelectorChainBuilder buildSelectorChainForString:@"ul.user-list li.user-item img.avatar.first-user p"];
    STAssertNotNil(chain,@"chain should not be nil");    
    STAssertTrue([chain count] == 4U, @"the chain should have 1 item");
    
    id thirdItemInChain = [chain objectAtIndex:2];    
    STAssertTrue([thirdItemInChain isKindOfClass:[OQElementSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([thirdItemInChain elementName], @"img",@"");
    id firstAttributeSelector = [[thirdItemInChain attributeValueSelectors]objectAtIndex:0];
    STAssertTrue([firstAttributeSelector isKindOfClass:[OQAttributeValueSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([firstAttributeSelector attributeName], @"class",@"");
    STAssertEqualObjects([firstAttributeSelector attributeValue], @"avatar",@"");
    
    id secondAttributeSelector = [[thirdItemInChain attributeValueSelectors]objectAtIndex:1];
    STAssertTrue([secondAttributeSelector isKindOfClass:[OQAttributeValueSelector class]] ,@"the selector should be a OQNameElementSelector");
    STAssertEqualObjects([secondAttributeSelector attributeName], @"class",@"");
    STAssertEqualObjects([secondAttributeSelector attributeValue], @"first-user",@"");

}

@end
