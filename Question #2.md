# 2. A user is complaining that it's taking a long time to load a page on our web application. In your own words, write down and discuss the possible cause(s) of the slowness. Also, describe how you would begin to troubleshoot this issue.
Keep the following information about the environment in mind:

* The web application is written in a modern MVC web framework.

* Application data is stored in a relational database.

* All components (web application, web server, database) are running on a single Linux box with 8GB RAM, 2 CPU cores, and SSD storage with ample free space.

* You have root access to this Linux box.

We are interested in learning about your experience with modern web applications, and your ability to reason about system design and architectural trade-offs. There are no right and wrong answers to this question. Feel free to write as much or as little as you feel is necessary.

# Answer

Causes of Slowness Based on Information Given:
 * The Relational Database might be experiencing network issues.
 * The architecture of the database is not meeting the standards of the MVC framework model of the web app; by poor design.
 * The web app is running on only two cores and 8 gb of rams; which could be too low to handle the high series of request made to the database, ultimately the memory utility is causing response from the web app to be too slow.
 * There are only two core specified for the web app which limits the amount of threads as requests coming through are only limited to two threads to handle.
 * Requests are failing to go through with 500 status error and this could build up and stop the app from responding to further requests.

How I would trouble shoot:

1. I would start out by trying to replicate the issue on my end by loading the web application on my local machine. If the the behavior is expected as reported by the user, this would indicate that the error is a global issue experienced by all users to this web app. If the issue is not reproducible on my end it would indicate that the issue might be on the client side and this would require further partnering with the user to troubleshoot. If the issue is an Global issue I would proceed internally via the following steps. 
2. Furthermore given that I have root access to the Linux box, I can try to log into the linux server and try to see how long it take to log me into or if logging into the server is stalled. Any signs of stalling would potentially point to high workload being passed on the server.
3. Going back to the low ram specs, I would check the linux box to make sure that there is sufficient ram for the web app. I can do this by running the htop command in the SSH terminal. This would allow me to view the number of proccessed running and to see if any are putting a strain on the storage. If I notice that certain processes are causing problems for the system, I can safely restart the Linux machine without disrupting any important traffic, as long as the system can restart smoothly. I am can also partner with members of the DevOps or teams in charge of infrasture to possibly increase strained resources and this can be brought about via and JIRA submission to the respective team. 
4. First, I would check if the memory usage and system load are not too high. Then, I would move on to checking the connection on the database by pinging it and observing how long it takes to get a response. This would give me an indication if there are any issues with the database connection.
5. If everything seems fine with the database connection, my next step would be to look at the application logs using the logging tools for the MVC web framework we're using. This would give me a clear idea of any errors that might be happening and where they could be originating from.






 
