# lab1

The main purpose of this laboratory work was to crate two databases and maintenance plans for them.

# Task 1

  I created a path SQL/MyDocuments for creating there all sub-folders for setting there all files that was required to create (Data, Logs, SQL_reports)
I created a path MyDocuments/Data where I stored all databases. After I created database with required properties ( min, max size ) , and filegroup for secondary files,
also with required properties. 

  Every file from task 1 has _ex1 at the end of its name and is placed in path MyDocuments/Data.

# Task 2
  
  I created second database with two files : database and log, with changed name to "Not log" ( which differs from his logical name ),
and changed its acces property for one user at moment. 
  
  Log file is in path MyDocuments/Log , other file in MyDocuments/Data marked as _ex2.  

# Task 3

  I launched Agent SQl Server,after in Control folder I chose Maintenance plan, where I launched Maintenance plan wizard.

  Using this wizard, I set time of making shrink of memory operation for every friday at 2:00:00 
(limit for shrinking was set as 2000 mb and percentage of eliberation was set as 10%). This plan was successfully created, 
but any try of running this plan ended with error (all reports about runnning those plans were sent to SQL_reports sub-folder).

# Task 4

  In task 4 I made the same procedure, but with choosing three options to make at every first Sunday of month: rebuilding
indexes, with check of tables only (and 10% of free space), getting statistics and deleting history of operations over this server after 
each 6 weeks.

Plan was created successfully with successful run of this plan.
