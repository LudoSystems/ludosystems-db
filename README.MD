# Setup

This assumes "flyway" is installed locally. If it's installed elsewhere, adjust accordingly. If it's not installed at all, running the sql files sequentially should get you up and running (but note this isn't ideal for further development).

1. Run the db_init.sql file or the commands within it on your PostgreSQL database. 
2. Edit the flyway.conf file in the root directory
3. Run `flyway migrate` from the directory.

That's it!