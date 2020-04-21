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

