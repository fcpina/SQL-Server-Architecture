/*
	SQLOS: SQL SERVER Operation System

	SQL Server Network Interface (SNI)

	Shared Memory:
	The protocol used when the Client and Server are on the same machine. You cannot configure. 
	You can only disable it. If you are using the server where the sql server is installed as a 
	client, by default the sql server attempts to connect to the instance using this protocol.

	Named Pipes:
	This protocol is used when Client and Server are on the same LAN. It uses the TCP 445 port. 
	It can be used in environments where there is no TCP / IP protocol.

	TCP / IP:
	The most widely used and accepted protocol all over the world. When a client connecting to a 
	sql server, it uses an IP or server name and port (eg 11.34.32.12,1433). 
	The default tcp port of SQL Server is 1433.

	Virtual Interface Adapter (VIA):
	You cannot see this protocol in SQL Server Configuration Manager. 
	Although it is a high performance protocol, it is not preferred because it requires 
	additional hardware in client and server.

	What is TDS?
	Now that we know that there are three types of Client-Server Architecture, lets us have a glance at TDS:
	TDS stands for Tabular Data Stream.
	All 3 protocols use TDS packets. TDS is encapsulated in Network packets. This enables data transfer from the client machine 
	to the server machine.


*/
----------------------------------------------------------------------------------------------------------------------------
-- CHECK WHICH PROTOCOL IS ENABLE 
----------------------------------------------------------------------------------------------------------------------------
SELECT 'Named Pipes' AS [Protocol], iif(value_data = 1, 'Yes', 'No') AS isEnabled
FROM sys.dm_server_registry
WHERE registry_key LIKE '%np' AND value_name = 'Enabled'
UNION
SELECT 'Shared Memory', iif(value_data = 1, 'Yes', 'No')
FROM sys.dm_server_registry
WHERE registry_key LIKE '%sm' AND value_name = 'Enabled'
UNION
SELECT 'TCP/IP', iif(value_data = 1, 'Yes', 'No')
FROM sys.dm_server_registry
WHERE registry_key LIKE '%tcp' AND value_name = 'Enabled'
UNION
SELECT 'VIA/Virtual Interface Adapter', iif(value_data = 1, 'Yes', 'No')
FROM sys.dm_server_registry
WHERE registry_key LIKE '%via' AND value_name = 'Enabled'

----------------------------------------------------------------------------------------------------------------------------
-- CHECK SESSION INFORMATION (RUN WHILE THE PROGRAM IS RUNNING)
----------------------------------------------------------------------------------------------------------------------------
SELECT   
    c.session_id, c.net_transport, c.encrypt_option,   
    c.auth_scheme, s.host_name, s.program_name,   
    s.client_interface_name, s.login_name, s.nt_domain,   
    s.nt_user_name, s.original_login_name, c.connect_time,   
    s.login_time   
FROM sys.dm_exec_connections AS c  
JOIN sys.dm_exec_sessions AS s  
    ON c.session_id = s.session_id  



