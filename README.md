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
3. Implement "unlike" feature
4. ~~Implement navbar (title, sign in, register) with CSS~~
5. Format header of home page (reposition "new post" button)
6. Format flash message
7. *Implement test for associations*
8. ~~Implement a comment view page~~
9. Create a turbo frame between comment button and comment input frames
10. Repetition in calling likes (check if require use of includes? to solve N+1 problem)
11. To add ability for user to request to follow, instead of directly following.
12. Tweak the user model omniauth function to allow for profile image from google