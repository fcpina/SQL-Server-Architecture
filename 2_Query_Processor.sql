/*
	SQLOS: SQL SERVER Operation System

	Relational Engine OR Query Processor:
	Relational Engine is responsible for running queries in the most optimized way. 
	It consists of the following components.

	CMS Parser:
	The Command Pharser's role is to handle T-SQL language events.It first checks the syntax and returns
	any errors back to the Protocol layer to send to the Client.
	If the syntax is valid, then the next step is to generate a query plan OR find an existing plan.
	
	Algebrizing OR Biding:
	SQL Server performs several operations on the parse tree and then generates a query tree is passed on to the
	Query Optmizer
	
	The steps performed during algebrizing:
		1. Name Resolution - Confirms that all objects exist and are visible in the security context of the user.
		also checks if the tables and columns names are checked to ensure that they exist and that the user has 
		access to them.
		
		2. Types Derivation - Determines the final type for each node in the parse tree.
		
		3. Aggregate binding - Determines where to do any aggregations.
		
		4. Group binding - Binds any aggreations to the appropriate select list

	
	Query Optimization:
	The job of the Query Optimizer is to take the query tree that was output from the algebrizer and find a GOOD way to retrieve 
	the data(Results) needed.
	 

		
	Query Executor: 
	Query executer calls Access Method. It provides an execution plan for data fetching logic required for execution. 
	Once data is received from Storage Engine, the result gets published to the Protocol layer. 
	Finally, data is sent to the end user.

*/
	
