# This file used igraph package to analysis graph and the related parameter
# Created by HosseinAli (Saeed) Rahmani

# Load igraph package to calculate parameter that implement in igraph
library(igraph)

# load sources need to read and ...
source("F:/Final Thesis/Impeliments/source/read_data.R")

# load data and get igraph object
graph_object = readGraph("F:/Final Thesis/FinalData/Breast-Normal.csv")
subgraph_object = readSubgraph("F:/Final Thesis/FinalData/Kidney-Cancer.csv")

# find number of vertecies and edges in graph
graph_vertex_count <- vcount(graph_object)
graph_edge_count <- ecount(graph_object)

print(paste0("Graph Vertex Count: ",graph_vertex_count))
print(paste0("Graph Edge Count: ",graph_edge_count))

# find number of vertecies and edges in subgraph
subgraph_vertex_count <- vcount(subgraph_object)
subgraph_edge_count <- ecount(subgraph_object)

print(paste0("Subraph Vertex Count: ",subgraph_vertex_count))
print(paste0("Subraph Edge Count: ",subgraph_edge_count))

# calculate closeness centrality for each node
# for print closeness of each nodes use 'print(closeness)'
closeness <- closeness(subgraph_object,weights = NULL)

# Reduse function of base in R, that calculate a operator in a input list
# paste0 function use to print a text with variable
print(paste0("Closeness Centrality: ",Reduce("+",closeness)))


# Connectivity that divide to edge and vertex connectivity
# calculate edge connectivity, another function is vertex_connectivity
print(paste0("Vertex Connectivity: ",cohesion(subgraph_object)))
# calculate edge connectivity, another function is edge_connectivity
print(paste0("Edge Connectivity: ",adhesion(subgraph_object)))

# calculate Diameter of graph
GD <- diameter(graph_object)
print(paste0("Graph Diameter: ",GD))

# calculate Radius of graph
GR <- radius(graph_object)
print(paste0("Graph Radius: ",GR))

# calculate of Index of Aggregation
IoA <- (subgraph_vertex_count / graph_vertex_count)
print(paste0("Index of Aggregation: ",IoA))

# calculate of Connectivity
A <- graph_edge_count
B <- (graph_vertex_count*(graph_vertex_count-1))/2
C <- A/B
print(paste0("Connectivity: ",C))

# calculate of Graph Centrality (Eccentrisity)
print(paste0("Graph Centrality: ",mean(1/eccentricity(graph_object))))

# calculate of Number of edges divided by the number of vertices
NeNv <- subgraph_edge_count/subgraph_vertex_count
print(paste0("Number of edges divided by the number of vertices: ",NeNv))

# Degree Centrality Distribution, calculate mean of Degree.
# we can show degree distribution with table(graph_degree)
# show plot of Degree Distribution and Mean: plot(graph_degree, col="red")
graph_degree <- degree(graph_object)
mean_graph_degree <- mean(graph_degree)
print(paste0("Mean of Graph Degree: ",mean_graph_degree))

# Cluster Coefficient
avrageClusterCoefficient = mean(transitivity(graph_object, type = "localundirected", weights = NULL,isolates = "zero"))
print(paste0("Cluster Coefficient: ", avrageClusterCoefficient ))

# Betweenness Centrality
betweennessMean = mean(betweenness(graph_object,weights = NULL))
print(paste0("Betweenness: ", betweennessMean ))

#Subgraph Centrality
print(paste0("Subgraph Centrality: ",mean(subgraph_centrality(graph_object))))

# Hub
table_graph_degree <- graph_degree
sum_of_hub_5 <- sum(table_graph_degree > 5)
sum_of_hub_8 <- sum(table_graph_degree > 8)
sum_of_hub_12 <- sum(table_graph_degree > 12)
sum_of_hub_20 <- sum(table_graph_degree > 20)
print(paste0("Count of Hub(Degree > 5): ",sum_of_hub_5))
print(paste0("Count of Hub(Degree > 8): ",sum_of_hub_8))
print(paste0("Count of Hub(Degree > 12): ",sum_of_hub_12))
print(paste0("Count of Hub(Degree > 20): ",sum_of_hub_20))
