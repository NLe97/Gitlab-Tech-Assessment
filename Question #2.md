# 2. A user is complaining that it's taking a long time to load a page on our web application. In your own words, write down and discuss the possible cause(s) of the slowness. Also, describe how you would begin to troubleshoot this issue.
Keep the following information about the environment in mind:

* The web application is written in a modern MVC web framework.

* Application data is stored in a relational database.

* All components (web application, web server, database) are running on a single Linux box with 8GB RAM, 2 CPU cores, and SSD storage with ample free space.

* You have root access to this Linux box.

We are interested in learning about your experience with modern web applications, and your ability to reason about system design and architectural trade-offs. There are no right and wrong answers to this question. Feel free to write as much or as little as you feel is necessary.

# Answer

- Causes of Slowness Based on Information Given:
 * Network error experienced by the Relational Database.
 * The architecture of the database is not meeting the standards of the MVC framework model of the web app by poor design.
 * The web app is running on only two cores and 8 gb of rams which could be too low to handle the high series of request made to the database, ultimately the memory ultility is causing response from the web app to be too slow.
 * There are only two core specified for the web app which limits the ammount of threads as, requests coming through are only limited to two threads to handle.
 * 
