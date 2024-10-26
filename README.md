# README

Challenges faced with implementing post likes:
1. Tried both approaches of HABTM and :through -> both didn't quite work the way I wanted it to.
2. has_many :through is creating distinct User / Post objects instead of likes for User / Post objects
3. Was struggling to create new records for Likes in HABTM association

Solution:
1. Used HABTM, and created likes using "<<" method, which allows me to directly pass @post objects into "@user.liked_posts" -> "@user.liked_posts << @post"