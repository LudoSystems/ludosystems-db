# About

These scripts are used to create a PostgreSQL database for the Ludo.Systems project.

# Setup

This assumes "flyway" is installed locally. If it's installed elsewhere, adjust accordingly. If it's not installed at all, running the sql files sequentially should get you up and running (but note this isn't ideal for further development).

1. Run the db_init.sql file or the commands within it on your PostgreSQL database.
2. Connect to the new ludosystems database and run the db_init-2.sql file or commands within it.
2. Edit the flyway.conf file in the root directory as appropriate.
3. Run `flyway migrate` from the directory.

That's it! You can also run `sample_data.sql` to insert some sample data to your new ludosystems database.