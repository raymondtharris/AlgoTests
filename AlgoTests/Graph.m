//
//  Graph.m
//  AlgoTests
//
//  Created by Tim Harris on 4/6/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import "Graph.h"
#import "LinkList.h"
#import "GraphNode.h"
#import "Queue.h"

@implementation Graph

@synthesize vertexList = _vertexList;
@synthesize Time=_Time;
-(id)init{
    self = [super init];
    if (self) {
        self.vertexList = [[NSMutableArray alloc] init];
        self.visted = [[NSMutableArray alloc]init];
    }
    return self;
}
-(void)insertVertex:(GraphNode *)newNode{
    LinkList *edgelist = [[LinkList alloc]init];
    [edgelist insertNode:newNode];
    [self.vertexList addObject:edgelist];
    newNode.indexKey =  (int)self.vertexList.count-1;
}
-(void)insertEdge:(GraphNode *)newEdge connectingToVertex:(GraphNode*) vertex{
    [self.vertexList[vertex.indexKey] insertNode:[[GraphNode alloc] initWithKey:newEdge.key andIndexKey:(int)newEdge.indexKey]];
}

-(void)vertexNeighbors:(GraphNode *)vertex{
    for (LinkList * edglist in self.vertexList) {
        if ([edglist.Head.key intValue] == [vertex.key intValue]) {
            GraphNode * curr = (GraphNode*)edglist.Head;
            while (curr.successor != nil) {
                curr = (GraphNode*)curr.successor;
                NSLog(@"%@", curr.key);
            }
        }
    }
}

-(NSString *)description{
    NSString *returnString = @"";
    for (LinkList * edgelist in self.vertexList) {
        NSLog(@"%@",edgelist);
    }
    return returnString;
}
-(NSString *)descriptionBFS{
    NSString *returnString = @"[";
    for (LinkList * edgelist in self.vertexList) {
        returnString = [NSString stringWithFormat:@"%@ %@:%li",returnString,[(GraphNode*)[edgelist Head] key], [(GraphNode*)[edgelist Head] distance]];
        //NSLog(@"%@ : %li ",[(GraphNode*)[edgelist Head] key], [(GraphNode*)[edgelist Head] distance]);
        //NSLog(@"%@ : %li/%li ",[(GraphNode*)[edgelist Head] key], [(GraphNode*)[edgelist Head] distance], [(GraphNode*)[edgelist Head] f]);
    }
    returnString =[NSString stringWithFormat:@"%@ ]", returnString];
    return returnString;
}

-(void)BreadthFirstSearch:(GraphNode *)currNode{
    for (int i=0; i<self.vertexList.count; i++) {
        GraphNode *curr = (GraphNode*)[self.vertexList[i] Head];
        [curr setNodeColor:@"white"];
        [curr setDistance:INTMAX_MAX];
        
    }
    
    [currNode setNodeColor:@"gray"];
    [currNode setDistance:0];
    self.bfsQueue = [[Queue alloc ]init];
    [self.bfsQueue enqueue: [NSNumber numberWithInt: currNode.indexKey]];
    while (![self.bfsQueue isEmpty]) {
        Node *t = [self.bfsQueue dequeue];
        //NSLog(@"%@",t);
        GraphNode *pos = (GraphNode*)[self.vertexList[[t.key intValue]] Head];
        /*for (LinkList *elist in self.vertexList) {
            if (elist.Head.key == t.key) {
                pos = (GraphNode*)elist.Head;
            }
        }
         */
        int posI = pos.indexKey;
        while (pos != nil) {
            if([[(GraphNode*)[self.vertexList[pos.indexKey] Head] nodeColor] isEqualToString:@"white"] ){
                [(GraphNode*)[self.vertexList[pos.indexKey] Head] setNodeColor:@"gray"];
                //if(i==2){
                //  NSLog(@"%li",[(GraphNode*)[self.vertexList[i] Head] distance] +1);
                //}
                [(GraphNode*)[self.vertexList[pos.indexKey] Head] setDistance:[(GraphNode*)[self.vertexList[posI] Head] distance]+1];
                [self.bfsQueue enqueue:[NSNumber numberWithInt: pos.indexKey]];
            }
            pos = (GraphNode*)pos.successor;
        }
        [(GraphNode*)[self.vertexList[posI] Head] setNodeColor:@"black"];
    }
    
    /*
    for (int i = 0; i<self.vertexList.count; i++) {
        GraphNode *post = (GraphNode*)[self.vertexList[i] Head];
        //NSLog(@"%li", post.distance);
        while (post != nil) {
            //NSLog(@"%@", [(GraphNode*)[self.vertexList[post.indexKey] Head] nodeColor] );
            if([[(GraphNode*)[self.vertexList[post.indexKey] Head] nodeColor] isEqualToString:@"white"] ){
                [(GraphNode*)[self.vertexList[post.indexKey] Head] setNodeColor:@"gray"];
                //if(i==2){
                  //  NSLog(@"%li",[(GraphNode*)[self.vertexList[i] Head] distance] +1);
                //}
                [(GraphNode*)[self.vertexList[post.indexKey] Head] setDistance:[(GraphNode*)[self.vertexList[i] Head] distance]+1];
                
            }
            post = (GraphNode*)post.successor;
        }
        [(GraphNode*)[self.vertexList[i] Head] setNodeColor:@"black"];
    }
    */
}

-(void)DepthFirstSearch{
    for (int i=0; i<self.vertexList.count; i++) {
        GraphNode *curr = (GraphNode*)[self.vertexList[i] Head];
        [curr setNodeColor:@"white"];
    }
    self.Time = 0;
    for (int i=0; i<self.vertexList.count; i++) {
        GraphNode *curr = (GraphNode*)[self.vertexList[i] Head];
        if ([[curr nodeColor] isEqualToString:@"white"]) {
            
            [self DepthFirstSearchVistVertex:curr];
        }
    }
}

-(void)DepthFirstSearchVistVertex:(GraphNode *)currVertex{
    self.Time = self.Time +1;
    [currVertex setDistance:self.Time];
    [currVertex setNodeColor:@"gray"];
    GraphNode *pos = currVertex;
    while (pos.successor != nil) {
        //NSLog(@"%@",pos);
        if([[pos nodeColor] isEqualToString:@"white"]){
            
            [self DepthFirstSearchVistVertex:pos];
        }
        pos  =  (GraphNode*)pos.successor;
    }
    [currVertex setNodeColor:@"black"];
    self.Time = self.Time+1;
    [currVertex setF:self.Time];
}


@end
