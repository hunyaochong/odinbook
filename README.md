# README

Challenges faced with implementing post likes:
1. Tried both approaches of HABTM and :through -> both didn't quite work the way I wanted it to.
2. has_many :through is creating distinct User / Post objects instead of likes for User / Post objects
3. Was struggling to create new records for Likes in HABTM association

Solution:
1. Used HABTM, and created likes using "<<" method, which allows me to directly pass @post objects into "@user.liked_posts" -> "@user.liked_posts << @post"

# TODO
1. ~~Insert nav bar ~~
2. ~~Insert "# of likes" status for each post~~
4. ~~Implement navbar (title, sign in, register) with CSS~~
5. ~~Format header of home page (reposition "new post" button)~~
7. *Implement test for associations*
8. ~~Implement a comment view page~~
9. ~~Create a turbo frame between comment button and comment input frames~~
11. To add ability for user to request to follow, instead of directly following.
12. ~~Tweak the user model omniauth function to allow for profile image from google~~
13. ~~Add sign in with google looking button~~ 
14. ~~Introduce avatarly gem for users that sign up natively within the app (not via google) [https://github.com/lucek/avatarly]
15. ~~Design post "cards"~~
17. ~~Add profile page for users~~
19. ~~To tailor feed to only view users whom they are following~~
20. ~~Sort post by created date (by recency)~~
21. ~~Fix comment/index error~~
22. Set up email with letter opener gem
23. Format user settings page
24. Add turbo stream to like and unlike features


# BUMP
18. ~~Use turbo frame or something to allow content to be populated based on whether post / reply is clicked in user profile page~~
16. Add a feature where the buttons would remain glowing (e.g. orange effect) when user has pressed the like button
10. Repetition in calling likes (check if require use of includes? to solve N+1 problem)
6. Format flash message
3. ~~Implement "unlike" feature~~

