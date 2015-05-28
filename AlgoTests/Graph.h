//
//  Graph.h
//  AlgoTests
//
//  Created by Tim Harris on 4/6/14.
//  Copyright (c) 2014 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LinkList;
@class GraphNode;
@class Queue;

@interface Graph : NSObject{
    NSMutableArray *vertexList;
    
}
@property NSMutableArray * vertexList, *visted;
@property LinkList *bfsPath;
@property Queue *bfsQueue;
@property int Time;

-(id)init;
-(void)insertVertex:(GraphNode*) newNode;
-(void)insertEdge:(GraphNode*) newEdge connectingToVertex:(GraphNode*) vertex;
-(void)vertexNeighbors:(GraphNode*) vertex;
-(NSString *)description;
-(NSString *)descriptionBFS;
-(void)BreadthFirstSearch:(GraphNode*) currNode;
-(void)DepthFirstSearch;
-(void)DepthFirstSearchVistVertex:(GraphNode*) currVertex;
@end
