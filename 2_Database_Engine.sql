/*
	SQLOS: SQL SERVER Operation System

	Database Engine

	Relational Engine(Query Processor):
	Relational Engine is responsible for running queries in the most optimized way. 
	It consists of the following components.

	CMD Parser:
	Data once received from Protocol Layer is then passed to Relational Engine. 
	"CMD Parser" is the first component of Relational Engine to receive the Query data. 
	The principal job of CMD Parser is to check the query for Syntactic and Semantic error. 
	Finally, it generates a Query Tree. Let's discuss in detail.

		1. Syntactic check: Checks the syntactic.
		2. Semantic check: Checks if the column exist and if you have access to it and etc..
		3. Create Query Tree: Generates different execution tree in which query can be run

	Optimizer: 
	Optimization is done for DML (Data Modification Language) commands like SELECT, INSERT, DELETE, and UPDATE. 
	The work of the optimizer is to create an execution plan for the user's query. 
	This is the plan that will determine how the user query will be executed.

		Optimizer phases:
		1. Phase 0: Search for Trivial Plans.
		2. Phase 1: Search for Transaction processing plans.
		3. Phase 2: Parallel Processing and Optimization.
*/
		Eg:
		SELECT *
		INTO after_query_optimizer_info
		FROM sys.dm_exec_query_optimizer_info
		GO
		SELECT *
		INTO before_query_optimizer_info
		FROM sys.dm_exec_query_optimizer_info
		GO
		DROP TABLE before_query_optimizer_info
		DROP TABLE after_query_optimizer_info
		GO
		-- real execution starts
		GO
		SELECT *
		INTO before_query_optimizer_info
		FROM sys.dm_exec_query_optimizer_info
		GO
		
		-- INSERT YOUR QUERY HERE:
		SELECT * FROM ...

		SELECT *
		INTO after_query_optimizer_info
		FROM sys.dm_exec_query_optimizer_info
		GO
		SELECT a.counter,
		(a.occurrence - b.occurrence) AS occurrence,
		 (a.occurrence * a.value - b.occurrence *
		 b.value) AS value
		FROM before_query_optimizer_info b
		 JOIN after_query_optimizer_info a
		 ON b.counter = a.counter
		WHERE b.occurrence <> a.occurrence
		DROP TABLE before_query_optimizer_info
		DROP TABLE after_query_optimizer_info
/*
	Query Executor: 
	Query executer calls Access Method. It provides an execution plan for data fetching logic required for execution. 
	Once data is received from Storage Engine, the result gets published to the Protocol layer. 
	Finally, data is sent to the end user.


	Storage Engine:
	It is responsible for storing data.

	Buffer Manager: 
	The process of transferring data that is not in memory from disk to memory and 
	rewriting the changed data from memory to disk is managed here.

	Transaction Services:
        Ensures that transactions meet ACID rules.
        Write Ahead Logging (WAL) is managed here. 
        Concurrency controls are managed here 
    
	Lock Manager: 
	All lock types are managed here.  

	File Manager: 
	Responsible for allocating space for data in the database.
*/

