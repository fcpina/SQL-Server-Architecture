# **SQLOS: SQL SERVER Operation System** 
SQL Server Network Interface (SNI)

![](https://github.com/fcpina/SQL-Server-Architecture/blob/master/images/Protocol.png?raw=true)

## Shared Memory:
The protocol used when the Client and Server are on the same machine. You cannot configure. 
You can only disable it. If you are using the server where the SQL server is installed as a 
client, by default the SQL server attempts to connect to the instance using this protocol.
	
## Named Pipes:
This protocol is used when the Client and Server are on the same LAN. It uses the TCP 445 port. 
It can be used in environments where there is no TCP / IP protocol.
	
## TCP / IP:
The most widely used and accepted protocol all over the world. When a client connecting to a 
SQL Server uses an IP or server name and port (eg 11.34.32.12,1433). 
The default TCP port of SQL Server is 1433.
	
## Virtual Interface Adapter (VIA):
You cannot see this protocol in SQL Server Configuration Manager. 
Although it is a high-performance protocol, it is not preferred because it requires additional hardware in the client and server.

## What is TDS?
Now that we know that there are three types of Client-Server Architecture, lets us have a glance at TDS:
TDS stands for Tabular Data Stream.
All 3 protocols use TDS packets. TDS is encapsulated in Network packets. This enables data transfer from the client machine to the server machine.


# Relational Engine
Relational Engine is responsible for running queries in the most optimized way. It consists of the following components.

![](https://github.com/fcpina/SQL-Server-Architecture/blob/6f3853d2c86a1ab990c0aaef1161b0f00d83c756/images/Query%20Processor.png?raw=true)
## Parser
The Command Pharser's role is to handle T-SQL language events. It first checks the syntax and returns any errors back to the Protocol layer to send to the Client. If the syntax is valid, then the next step is to generate a **Query Plan** or FIND an existing one in the buffer pool. If no cached plan is found, then the Command Parser generates a query tree based on the T-SQL. 
	
## Algebrizer/Binding
During the algebrizing, SQL Server performs several operations on the parse tree and then generates a **query tree** that is passed on to the Query Optimizer.
  
The steps performed during algebrizing:
		
1. **Name Resolution** - Confirms that all objects exist and are visible in the security context of the user.
also checks if the tables and columns names are checked to ensure that they exist and that the user has access to them.
		
2. **Types Derivation** - Determines the final type for each node in the parse tree.
		
3. **Aggregate binding** - Determines where to do any aggregations.
		
4. **Group binding** - Binds any aggregations to the appropriate select list.

	
## Query Optimizer
The job of the Query Optimizer is to take the query tree that was output from the algebrizer and find a **GOOD** way to retrieve the data(Results) needed. Query Optimizer looks for a **GOOD ENOUGH** plan and uses that.
	 
Phases:
	 	
1. **Pre-optimization** (**Trivial Plans**) - The optimizer will stop at this stage when the statement is simple enough
that there can only be one optimal plan, removing the need for additional costing.
           Eg: Basic queries with no joins. "SELECT name FROM customers"
		
2. **Phase 0** - Explore basic rules, and hash and nested join options.
	   - The optimizer will stop here if the cost of the plan is < 0.2. Called (Transaction Plan)
		
3. **Phase 1** - Uses a subset of the possible optimization rules and looks for common patterns for which it already
has a plan.
	   - The optimizer will stop here if the cost of the plan is < 1.0. Called (Quick Plans)
			   
4. **Phase 2** - The optimizer pulls out all the stops and is able to use all of its optimization rules. It also looks at
parallelism and indexed views.
           - Plans created in this phase have an optimization level of FULL.
	  
## Query Executor 
Query executer execute the query, it executes the query plan by working through each step it contains and interacting with 
Storage Engine to retrieve or modify data.

Query Optimizer:

Examples: https://github.com/fcpina/SQL-Server-Architecture/blob/master/2_Query_Processor.sql
