/*
	SQLOS: SQL SERVER Operation System

	Relational Engine:
	Relational Engine is responsible for running queries in the most optimized way. It consists of the following components.

	Parser:
	The Command Pharser's role is to handle T-SQL language events.It first checks the syntax and returns
	any errors back to the Protocol layer to send to the Client.
	If the syntax is valid, then the next step is to generate a query plan OR find an existing plan.
	
	Algebrizing OR Binding:
	SQL Server performs several operations on the parse tree and then generates a query tree is passed on to the
	Query Optmizer
	
	The steps performed during algebrizing:
		
		1. Name Resolution - Confirms that all objects exist and are visible in the security context of the user.
		also checks if the tables and columns names are checked to ensure that they exist and that the user has 
		access to them.
		
		2. Types Derivation - Determines the final type for each node in the parse tree.
		
		3. Aggregate binding - Determines where to do any aggregations.
		
		4. Group binding - Binds any aggreations to the appropriate select list.

	
	Query Optimizer:
	The job of the Query Optimizer is to take the query tree that was output from the algebrizer and find a GOOD way to retrieve 
	the data(Results) needed. Query Optimizer looks for a GOOD ENOUGH plan, and uses that.
	 
	 Stages:
	 	
		1. Pre-optimization (Trivial Plans) - The optimizer will stop at this stage when the statement is simple enough
		that there can only be one optimal plan, removing the need for additional costing.
		Eg: Basic queries with no joins. "SELECT name FROM customers"
		
		2. Phase 0 - Explore basic rules, and hash and nested join options.
			   - The optimizer will stop here if the cost of the plan is < 0.2. Called (Transaction Plan)
		
		3. Phase 1 - Uses a subset of the possible optimization rules and looks for common patterns for which it already
		has a plan.
			   - The optimizer will stop here if the cost of the plan is < 1.0. Called (Quick Plans)
			   
		4. Phase 2 - The optimizer pulls out all the stops and is able to use all of its optimization rules. It also looks at
		parallelism and indexed views.
		           - Plans created in this phase have an optimization level of FULL.
	 
	 
	Query Executor: 
	Query executer execute the query, it executes the query plan by working through each step it contains and interacting with 
	Storage Engine to retrieve or modify data.
*/
	
