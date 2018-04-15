# This file use to read data from CSV file, we set compelete path to read file,
# in relative path will be use of setwe() to set current folder for
# Working Directory

# Load igraph package to get adjacency matrix and graph object in igraph
library(igraph)

# read Graph function
readGraph <- function(GraphPath){
  graph_data = read.csv(file = GraphPath)
  return(get_graph_object(graph_data))
}

# function for read Subgraph
readSubgraph <- function(SubgraphPath){
  subgraph_data = read.csv(file = SubgraphPath)
  return(get_subgraph_object(subgraph_data))
}

# get graph object of igraph package
get_graph_object <- function(graph_data){
  graph_adjacency <- get.adjacency(graph.edgelist(as.matrix(graph_data), directed=FALSE))
  graph_object <- graph.adjacency(graph_adjacency,mode="undirected")
  return(graph_object)
}

# get subgraph object of igraph package
get_subgraph_object <- function(subgraph_data){
  subgraph_adjacency <- get.adjacency(graph.edgelist(as.matrix(subgraph_data), directed=FALSE))
  subgraph_object <- graph.adjacency(subgraph_adjacency,mode="undirected")
  return(subgraph_object)
}