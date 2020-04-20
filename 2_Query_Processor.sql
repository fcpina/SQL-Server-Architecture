	/*	
	
	Database: AdventureWork2012
	Download: https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15
	After running each query, check the MESSAGE TAB on Microsft SQL Server Studio
	
	*/
	-- Query optimizer examples:
	
	DBCC TRACEON(3604) -- Trace flag 3604 to redirect the trace output to the client executing the command, 
			      in this case to the Messages tab in SQL Server Management Studio. 
	
	-- Trivial plan:
	SELECT BusinessEntityID,
	       PersonType ModifiedDate
	FROM Person.Person
	WHERE BusinessEntityID = 1
	OPTION(RECOMPILE, QUERYTRACEON 2372);
	GO


	-- Search 0: stage "TP" or transaction processing
	SELECT PB.BusinessEntityID
	FROM Person.BusinessEntity PB
	JOIN Person.Person P 	   ON PB.BusinessEntityID = P.BusinessEntityID
	JOIN Person.PersonPhone PP ON P.BusinessEntityID  = PP.BusinessEntityID
	WHERE PB.BusinessEntityID = 200
	OPTION(RECOMPILE, QUERYTRACEON 2372);
	GO

	-- Search 1: QuickPlan
	SELECT PB.BusinessEntityID
	FROM Person.BusinessEntity PB
	JOIN Person.Person P
	ON PB.BusinessEntityID = P.BusinessEntityID
	JOIN Person.PersonPhone PP
	ON P.BusinessEntityID = PP.BusinessEntityID 
	OPTION(RECOMPILE, QUERYTRACEON 2372);
	GO


	-- Search 2: stage "Full" 
	SELECT PB.BusinessEntityID,
	       PB.rowguid,
	       PB.ModifiedDate,
	       P.BusinessEntityID
	FROM Person.BusinessEntity PB
	    JOIN Person.Person P
		ON PB.BusinessEntityID = P.BusinessEntityID
	    JOIN Person.PersonPhone PP
		ON P.BusinessEntityID = PP.BusinessEntityID
	UNION
	SELECT PB.BusinessEntityID,
	       PB.rowguid,
	       PB.ModifiedDate,
	       P.BusinessEntityID
	FROM Person.BusinessEntity PB
	    JOIN Person.Person P
		ON PB.BusinessEntityID = P.BusinessEntityID
	    JOIN Person.PersonPhone PP
		ON P.BusinessEntityID = PP.BusinessEntityID
	OPTION(RECOMPILE, QUERYTRACEON 2372);
	GO
