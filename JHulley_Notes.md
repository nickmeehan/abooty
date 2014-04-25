##JHulley Notes

##Overall Notes
* There are some README files hanging around that aren't needed
* Our own README needs to be written

##Feature Notes
* I can't unfavorite something
* I can reboot one of my aboots, I shouldn't be able to do that
* I can't see a list of my followers
* I can't see a list of people I'm following
* I can't see a list of my favorite tweets
* My news feed is everyone's tweets, it should only be my followers' tweets and my follower's retweets

##Code Notes

###Controllers
1. app/controllers/aboots.rb: 
       1: This should not render a partial or homepage, it shoul...

2. app/controllers/aboots.rb: 
       2: To see all aboots, this get route should be '/' or red...

3. app/controllers/aboots.rb: 
       8: This should redirect to the news feed ('/')

4. app/controllers/aboots.rb: 
      14: This should redirect to the news feed ('/')

5. app/controllers/favorites.rb: 
       1: This should redirect to news feed ('/')

6. app/controllers/index.rb: 
       1: This should render index.erb and be '/', repeat?

7. app/controllers/index.rb: 
       7: This route should be '/favourites'

8. app/controllers/index.rb: 
       8: Should render index.erb file calling helper method to ...

9. app/controllers/index.rb: 
      15: Is there a _profile_page partial? This should be a nor...

10. app/controllers/sessions.rb: 
       1: Good place for some helper methods

11. app/controllers/sessions.rb: 
      11: There is a lot of logic here, we can refactor

12. app/controllers/sessions.rb: 
      17: Shouldn't save something before it's valid

13. app/controllers/sessions.rb: 
      21: Should redirect to '/'

14. app/controllers/sessions.rb: 
      22: Add success message?

15. app/controllers/sessions.rb: 
      30: Check login helper method here?

###Models
16. app/models/user.rb: 
      25: This could be a one-liner

###Views
17. app/views/_aboot_detail.erb: 
     2: A lot of logic for a view

18. app/views/_aboot_detail.erb: 
    25: Need timestamps

19. app/views/_aboot_detail.erb: 
    26: Retweeted by?

20. app/views/_aboot_list.erb: 
     2: We should put this reverse logic in a helper method fo...

21. app/views/_aboot_list.erb: 
     5: Change this to passing a local

22. app/views/_favorites_list.erb: 
     4: Can pass this in using the locals argument with partials

23. app/views/_footer.erb: 
     0: Use semantic HTML5 tags

24. app/views/_gravatar_image.erb: 
     0: This partial exists, why do we have logic somewhere else?

25. app/views/_header.erb: 
     0: Use semantic HTML5 tags

26. app/views/_home_page.erb: 
     0: Is this the same as index? Consolodation needed

27. app/views/_profile_page.erb: 
     0: There is a lot going on here, any partialing possible?

28. app/views/index.erb: 
     2: News feed if logged in?

##New things to add

###Helper Methods
Method that gets all appropriate aboots for news feed
Method that gets current user
Method that gets all favourited tweets
Method that checks login?