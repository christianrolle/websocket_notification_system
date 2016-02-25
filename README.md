## Problem explanation

In our system users can follow other users, create and like projects.

We want to build a notification system where when a user A is following
a user B, we want to notify the former with the activities taken by the
latter.

For example, suppose Alice is following Bob. When Bob follows Tom;
creates and likes a project, Alice expects to see the following
notifications:

    * Bob started following Tom
    * Bob created the project "In the Wonderland"
    * Bob liked the project "In the Wonderland"

## General notes

As you work on your solutions, you should make commits to the repository
along the way, just as you would on a 'real' project. This is so we can
see the progression of how you came to the solutions you did.

This folder already contains an empty git repository.

Have fun, and feel free to ask questions if anything is unclear.




## Answer:

This is quick prove of concept for a notification system based on web sockets.
I used ActionCable of Rails 5. So that was new to me and absolutely fun.

I'm sorry, that the project is somewhat basic, since there I'm bit busy at the 
moment.
Sure there is real authentication (Devise) and layout (Bootstrap) missing. 
Also the test suite is rather basic (just unit tests for models). But I'm sure 
you get me.

## Setup:

You can make it run by migrating the database and starting the servers:

* redis-server (please make sure it is installed)
* rails s
* ./bin/cable (this is puma for pushing the notifications over web sockets)

Open two browsers and authenticate as a user (say Bob).
Follow a user (say Alice). 
Authenticate as that followed user (Alice) and add a project and so on. 
Watch the Bobs notifications.

Please let me know, what you didn't like or which expectactions I failed.

Kind regards
Christian


