-- =====================================================
-- ConnectSphere — Dummy Data for Testing
-- =====================================================
-- Password for ALL users: 123456
-- Bcrypt hash: $2a$10$atE.TpXs/cCfIz2q/e7IUeP6S5bp6ev9pEeYx8QsqcO0eUERUFORe
-- =====================================================

-- ─────────────────────────────────────────────────────
-- 1. USERS (5 users: 1 admin, 1 moderator, 3 regular)
-- ─────────────────────────────────────────────────────
INSERT INTO users (email, user_name, password, full_name, bio, profile_pic, location, website, role, status, post_count, follower_count, following_count, email_verified, created_at, updated_at)
VALUES
    ('admin@connectsphere.com', 'admin_manish', '$2a$10$atE.TpXs/cCfIz2q/e7IUeP6S5bp6ev9pEeYx8QsqcO0eUERUFORe', 'Manish Kumar', 'Platform Admin | Full-Stack Developer', 'https://i.pravatar.cc/150?u=admin', 'Bangalore, India', 'https://manish.dev', 'ADMIN', 'ACTIVE', 3, 4, 2, true, '2026-01-01 10:00:00', '2026-04-01 10:00:00'),

    ('mod@connectsphere.com', 'mod_priya', '$2a$10$atE.TpXs/cCfIz2q/e7IUeP6S5bp6ev9pEeYx8QsqcO0eUERUFORe', 'Priya Sharma', 'Content Moderator | Keeping it clean 🛡️', 'https://i.pravatar.cc/150?u=priya', 'Mumbai, India', NULL, 'MODERATOR', 'ACTIVE', 2, 3, 3, true, '2026-01-05 12:00:00', '2026-03-28 15:00:00'),

    ('john@example.com', 'john_doe', '$2a$10$atE.TpXs/cCfIz2q/e7IUeP6S5bp6ev9pEeYx8QsqcO0eUERUFORe', 'John Doe', 'Backend dev | Kafka enthusiast ☕', 'https://i.pravatar.cc/150?u=john', 'Delhi, India', 'https://johndoe.dev', 'USER', 'ACTIVE', 3, 3, 3, true, '2026-01-10 09:00:00', '2026-04-02 18:00:00'),

    ('jane@example.com', 'jane_dev', '$2a$10$atE.TpXs/cCfIz2q/e7IUeP6S5bp6ev9pEeYx8QsqcO0eUERUFORe', 'Jane Smith', 'Full-stack dev | React + Spring Boot 🚀', 'https://i.pravatar.cc/150?u=jane', 'Pune, India', NULL, 'USER', 'ACTIVE', 2, 2, 3, true, '2026-02-01 14:00:00', '2026-04-01 20:00:00'),

    ('alex@example.com', 'alex_codes', '$2a$10$atE.TpXs/cCfIz2q/e7IUeP6S5bp6ev9pEeYx8QsqcO0eUERUFORe', 'Alex Rivera', 'DevOps | Docker | Jenkins 🐳', 'https://i.pravatar.cc/150?u=alex', 'Hyderabad, India', 'https://alexcodes.io', 'USER', 'ACTIVE', 2, 2, 3, true, '2026-02-15 11:00:00', '2026-03-30 09:00:00');


-- ─────────────────────────────────────────────────────
-- 2. REFRESH TOKENS
-- ─────────────────────────────────────────────────────
INSERT INTO refresh_tokens (user_id, token, expires_at, is_revoked, created_at)
VALUES
    (1, 'rt_admin_token_abc123def456ghi789', '2026-04-10 10:00:00', false, '2026-04-03 10:00:00'),
    (3, 'rt_john_token_xyz987uvw654rst321', '2026-04-10 09:00:00', false, '2026-04-03 09:00:00'),
    (3, 'rt_john_old_token_expired_one', '2026-03-25 09:00:00', true, '2026-03-18 09:00:00'),
    (4, 'rt_jane_token_mno456pqr789stu012', '2026-04-10 14:00:00', false, '2026-04-03 14:00:00');


-- ─────────────────────────────────────────────────────
-- 3. POSTS (12 posts across 5 users)
-- ─────────────────────────────────────────────────────
INSERT INTO posts (user_id, content, img_url, like_count, comment_count, is_deleted, created_at, updated_at, deleted_at)
VALUES
-- Manish (admin) posts
(1, 'Welcome to ConnectSphere! 🌐 This platform is built with Spring Boot, Kafka, and Redis. Excited to launch! #springboot #launch', NULL, 5, 3, false, '2026-03-01 10:00:00', '2026-03-01 10:00:00', NULL),
(1, 'Just set up the CI/CD pipeline with Jenkins. Auto-deploy on every push 🚀 #devops #jenkins #docker', 'https://picsum.photos/seed/cicd/800/400', 3, 1, false, '2026-03-15 14:30:00', '2026-03-15 14:30:00', NULL),
(1, 'Old test post — deleted', NULL, 0, 0, true, '2026-02-20 08:00:00', '2026-03-01 08:00:00', '2026-03-01 08:00:00'),

-- Priya (moderator) posts
(2, 'Reminder: Keep it respectful everyone! Our community guidelines are here to make ConnectSphere a safe space 🛡️ #community', NULL, 4, 2, false, '2026-03-10 12:00:00', '2026-03-10 12:00:00', NULL),
(2, 'Loving the new moderation dashboard! Makes reviewing reports so much easier 🎯 #moderation', NULL, 2, 0, false, '2026-03-25 16:00:00', '2026-03-25 16:00:00', NULL),

-- John posts
(3, 'Deep diving into Apache Kafka today. Partitions, consumer groups, exactly-once semantics — mind blown 🤯 #kafka #backend #java', 'https://picsum.photos/seed/kafka/800/400', 4, 2, false, '2026-03-20 09:30:00', '2026-03-20 09:30:00', NULL),
(3, 'Spring Security + JWT is a beast to configure but so powerful once it clicks 🔐 #springboot #security #java', NULL, 3, 1, false, '2026-03-28 11:00:00', '2026-03-28 11:00:00', NULL),
(3, 'Beautiful sunset from my balcony today 🌅', 'https://picsum.photos/seed/sunset/800/400', 5, 2, false, '2026-04-01 18:30:00', '2026-04-01 18:30:00', NULL),

-- Jane posts
(4, 'Just built my first full-stack app with React + Spring Boot! Frontend and backend finally talking 🎉 #react #springboot #fullstack', 'https://picsum.photos/seed/fullstack/800/400', 5, 3, false, '2026-03-22 15:00:00', '2026-03-22 15:00:00', NULL),
(4, 'Redis caching reduced our API response time from 800ms to 15ms. Absolutely insane 🔥 #redis #performance', NULL, 4, 1, false, '2026-04-02 20:00:00', '2026-04-02 20:00:00', NULL),

-- Alex posts
(5, 'Dockerized the entire ConnectSphere stack today — Postgres, Redis, Kafka, and the app. One command to rule them all 🐳 #docker #devops', 'https://picsum.photos/seed/docker/800/400', 5, 2, false, '2026-03-18 10:00:00', '2026-03-18 10:00:00', NULL),
(5, 'Jenkins pipeline running smooth: build → test → package → docker → deploy. Zero downtime! ✅ #jenkins #cicd #devops', NULL, 3, 1, false, '2026-04-01 09:00:00', '2026-04-01 09:00:00', NULL);


-- ─────────────────────────────────────────────────────
-- 4. HASHTAGS
-- ─────────────────────────────────────────────────────
INSERT INTO hashtags (name, post_count, created_at)
VALUES
    ('springboot', 4, '2026-03-01 10:00:00'),
    ('launch', 1, '2026-03-01 10:00:00'),
    ('devops', 3, '2026-03-15 14:30:00'),
    ('jenkins', 2, '2026-03-15 14:30:00'),
    ('docker', 2, '2026-03-15 14:30:00'),
    ('community', 1, '2026-03-10 12:00:00'),
    ('moderation', 1, '2026-03-25 16:00:00'),
    ('kafka', 1, '2026-03-20 09:30:00'),
    ('backend', 1, '2026-03-20 09:30:00'),
    ('java', 2, '2026-03-20 09:30:00'),
    ('security', 1, '2026-03-28 11:00:00'),
    ('react', 1, '2026-03-22 15:00:00'),
    ('fullstack', 1, '2026-03-22 15:00:00'),
    ('redis', 1, '2026-04-02 20:00:00'),
    ('performance', 1, '2026-04-02 20:00:00'),
    ('cicd', 1, '2026-04-01 09:00:00');


-- ─────────────────────────────────────────────────────
-- 5. POST_HASHTAGS (junction table)
-- ─────────────────────────────────────────────────────
INSERT INTO post_hashtags (post_id, hashtag_id)
VALUES
-- Post 1: #springboot #launch
(1, 1), (1, 2),
-- Post 2: #devops #jenkins #docker
(2, 3), (2, 4), (2, 5),
-- Post 4: #community
(4, 6),
-- Post 5: #moderation
(5, 7),
-- Post 6: #kafka #backend #java
(6, 8), (6, 9), (6, 10),
-- Post 7: #springboot #security #java
(7, 1), (7, 11), (7, 10),
-- Post 9: #react #springboot #fullstack
(9, 12), (9, 1), (9, 13),
-- Post 10: #redis #performance
(10, 14), (10, 15),
-- Post 11: #docker #devops
(11, 5), (11, 3),
-- Post 12: #jenkins #cicd #devops
(12, 4), (12, 16), (12, 3);


-- ─────────────────────────────────────────────────────
-- 6. LIKES
-- ─────────────────────────────────────────────────────
INSERT INTO likes (post_id, user_id, created_at)
VALUES
-- Post 1 (Welcome post) — 5 likes from everyone
(1, 2, '2026-03-01 11:00:00'),
(1, 3, '2026-03-01 11:30:00'),
(1, 4, '2026-03-01 12:00:00'),
(1, 5, '2026-03-01 13:00:00'),
(1, 1, '2026-03-01 10:05:00'),

-- Post 6 (Kafka post by John) — 4 likes
(6, 1, '2026-03-20 10:00:00'),
(6, 2, '2026-03-20 10:30:00'),
(6, 4, '2026-03-20 11:00:00'),
(6, 5, '2026-03-20 12:00:00'),

-- Post 9 (Jane fullstack post) — 6 likes
(9, 1, '2026-03-22 16:00:00'),
(9, 2, '2026-03-22 16:30:00'),
(9, 3, '2026-03-22 17:00:00'),
(9, 5, '2026-03-22 17:30:00'),
(9, 4, '2026-03-22 15:05:00'),

-- Post 8 (Sunset by John) — 5 likes
(8, 1, '2026-04-01 19:00:00'),
(8, 2, '2026-04-01 19:30:00'),
(8, 4, '2026-04-01 20:00:00'),
(8, 5, '2026-04-01 20:30:00'),

-- Post 11 (Docker by Alex) — 5 likes
(11, 1, '2026-03-18 11:00:00'),
(11, 2, '2026-03-18 11:30:00'),
(11, 3, '2026-03-18 12:00:00'),
(11, 4, '2026-03-18 13:00:00'),

-- Scattered likes on other posts
(2, 3, '2026-03-15 15:00:00'),
(2, 4, '2026-03-15 16:00:00'),
(2, 5, '2026-03-15 17:00:00'),
(4, 1, '2026-03-10 13:00:00'),
(4, 3, '2026-03-10 14:00:00'),
(4, 5, '2026-03-10 15:00:00'),
(4, 4, '2026-03-10 16:00:00'),
(5, 1, '2026-03-25 17:00:00'),
(5, 3, '2026-03-25 18:00:00'),
(7, 1, '2026-03-28 12:00:00'),
(7, 4, '2026-03-28 13:00:00'),
(7, 5, '2026-03-28 14:00:00'),
(10, 1, '2026-04-02 21:00:00'),
(10, 3, '2026-04-02 21:30:00'),
(10, 5, '2026-04-02 22:00:00'),
(10, 2, '2026-04-02 22:30:00'),
(12, 1, '2026-04-01 10:00:00'),
(12, 3, '2026-04-01 11:00:00'),
(12, 4, '2026-04-01 12:00:00');


-- ─────────────────────────────────────────────────────
-- 7. COMMENTS
-- ─────────────────────────────────────────────────────
INSERT INTO comments (post_id, user_id, content, is_deleted, created_at, updated_at, deleted_at)
VALUES
-- Comments on Post 1 (Welcome post) — 3 comments
(1, 3, 'Congrats on the launch! This looks amazing 🔥', false, '2026-03-01 11:30:00', '2026-03-01 11:30:00', NULL),
(1, 4, 'Love the tech stack! Spring Boot + Kafka is a killer combo', false, '2026-03-01 12:00:00', '2026-03-01 12:00:00', NULL),
(1, 5, 'Can''t wait to see the Docker setup!', false, '2026-03-01 13:00:00', '2026-03-01 13:00:00', NULL),

-- Comments on Post 4 (Community guidelines) — 2 comments
(4, 3, 'Great initiative! Safety first 🛡️', false, '2026-03-10 14:00:00', '2026-03-10 14:00:00', NULL),
(4, 1, 'Thanks Priya for keeping our community safe!', false, '2026-03-10 15:00:00', '2026-03-10 15:00:00', NULL),

-- Comments on Post 6 (Kafka post) — 2 comments
(6, 1, 'Wait till you try Kafka Streams! 🤯', false, '2026-03-20 10:00:00', '2026-03-20 10:00:00', NULL),
(6, 5, 'Consumer groups are so elegant once you get them', false, '2026-03-20 12:00:00', '2026-03-20 12:00:00', NULL),

-- Comments on Post 7 (Security post) — 1 comment
(7, 4, 'JWT refresh token rotation took me 3 days to get right 😅', false, '2026-03-28 13:00:00', '2026-03-28 13:00:00', NULL),

-- Comments on Post 8 (Sunset) — 2 comments
(8, 4, 'Stunning! What camera did you use? 📸', false, '2026-04-01 20:00:00', '2026-04-01 20:00:00', NULL),
(8, 2, 'Beautiful colors! Nature is the best artist 🎨', false, '2026-04-01 19:30:00', '2026-04-01 19:30:00', NULL),

-- Comments on Post 9 (Fullstack post) — 3 comments
(9, 1, 'This is exactly what production apps look like. Great work Jane!', false, '2026-03-22 16:00:00', '2026-03-22 16:00:00', NULL),
(9, 3, 'React + Spring Boot is my favourite combo too!', false, '2026-03-22 17:00:00', '2026-03-22 17:00:00', NULL),
(9, 5, 'Would love to see the repo! 👀', false, '2026-03-22 17:30:00', '2026-03-22 17:30:00', NULL),

-- Comments on Post 10 (Redis post) — 1 comment
(10, 3, '15ms response time is insane! Redis is magic ✨', false, '2026-04-02 21:30:00', '2026-04-02 21:30:00', NULL),

-- Comments on Post 11 (Docker post) — 2 comments
(11, 1, 'docker-compose up -d is the best command ever invented', false, '2026-03-18 11:00:00', '2026-03-18 11:00:00', NULL),
(11, 3, 'How are you handling volume persistence for Postgres?', false, '2026-03-18 12:00:00', '2026-03-18 12:00:00', NULL),

-- Comments on Post 2 (CI/CD post) — 1 comment
(2, 5, 'Jenkins + Docker is a solid combo for CD! 🔄', false, '2026-03-15 17:00:00', '2026-03-15 17:00:00', NULL),

-- Comments on Post 12 (Jenkins post) — 1 comment
(12, 1, 'Zero downtime deploys are the dream. Nice work Alex! 🎯', false, '2026-04-01 10:00:00', '2026-04-01 10:00:00', NULL),

-- A deleted comment
(8, 5, 'This comment was removed', true, '2026-04-01 21:00:00', '2026-04-01 22:00:00', '2026-04-01 22:00:00');


-- ─────────────────────────────────────────────────────
-- 8. FOLLOWS (everyone follows each other mostly)
-- ─────────────────────────────────────────────────────
INSERT INTO follows (follower_id, following_id, created_at)
VALUES
-- Manish (1) follows: Priya, John
(1, 2, '2026-01-05 12:30:00'),
(1, 3, '2026-01-10 09:30:00'),

-- Priya (2) follows: Manish, John, Jane
(2, 1, '2026-01-06 10:00:00'),
(2, 3, '2026-01-10 10:00:00'),
(2, 4, '2026-02-01 15:00:00'),

-- John (3) follows: Manish, Priya, Alex
(3, 1, '2026-01-11 08:00:00'),
(3, 2, '2026-01-11 08:30:00'),
(3, 5, '2026-02-15 12:00:00'),

-- Jane (4) follows: Manish, John, Alex
(4, 1, '2026-02-02 09:00:00'),
(4, 3, '2026-02-02 09:30:00'),
(4, 5, '2026-02-15 13:00:00'),

-- Alex (5) follows: Manish, John, Jane
(5, 1, '2026-02-16 10:00:00'),
(5, 3, '2026-02-16 10:30:00'),
(5, 4, '2026-02-16 11:00:00');


-- ─────────────────────────────────────────────────────
-- 9. NOTIFICATIONS
-- ─────────────────────────────────────────────────────
INSERT INTO notifications (user_id, actor_id, type, message, target_id, target_type, is_read, created_at)
VALUES
-- Like notifications
(1, 3, 'POST_LIKED', 'john_doe liked your post', 1, 'POST', true, '2026-03-01 11:30:00'),
(1, 4, 'POST_LIKED', 'jane_dev liked your post', 1, 'POST', true, '2026-03-01 12:00:00'),
(3, 1, 'POST_LIKED', 'admin_manish liked your post', 6, 'POST', true, '2026-03-20 10:00:00'),
(4, 1, 'POST_LIKED', 'admin_manish liked your post', 9, 'POST', true, '2026-03-22 16:00:00'),
(4, 3, 'POST_LIKED', 'john_doe liked your post', 9, 'POST', false, '2026-03-22 17:00:00'),
(5, 1, 'POST_LIKED', 'admin_manish liked your post', 11, 'POST', false, '2026-03-18 11:00:00'),

-- Comment notifications
(1, 3, 'POST_COMMENTED', 'john_doe commented on your post', 1, 'POST', true, '2026-03-01 11:30:00'),
(1, 4, 'POST_COMMENTED', 'jane_dev commented on your post', 1, 'POST', true, '2026-03-01 12:00:00'),
(3, 1, 'POST_COMMENTED', 'admin_manish commented on your post', 6, 'POST', true, '2026-03-20 10:00:00'),
(4, 1, 'POST_COMMENTED', 'admin_manish commented on your post', 9, 'POST', false, '2026-03-22 16:00:00'),
(4, 5, 'POST_COMMENTED', 'alex_codes commented on your post', 9, 'POST', false, '2026-03-22 17:30:00'),

-- Follow notifications
(2, 1, 'NEW_FOLLOWER', 'admin_manish started following you', NULL, NULL, true, '2026-01-05 12:30:00'),
(3, 1, 'NEW_FOLLOWER', 'admin_manish started following you', NULL, NULL, true, '2026-01-10 09:30:00'),
(1, 3, 'NEW_FOLLOWER', 'john_doe started following you', NULL, NULL, true, '2026-01-11 08:00:00'),
(1, 4, 'NEW_FOLLOWER', 'jane_dev started following you', NULL, NULL, true, '2026-02-02 09:00:00'),
(1, 5, 'NEW_FOLLOWER', 'alex_codes started following you', NULL, NULL, false, '2026-02-16 10:00:00'),
(3, 4, 'NEW_FOLLOWER', 'jane_dev started following you', NULL, NULL, false, '2026-02-02 09:30:00'),
(3, 5, 'NEW_FOLLOWER', 'alex_codes started following you', NULL, NULL, false, '2026-02-16 10:30:00'),

-- System notification (no actor)
(1, NULL, 'CONTENT_REMOVED', 'A reported post has been removed by moderators', 3, 'POST', true, '2026-03-05 09:00:00');


-- ─────────────────────────────────────────────────────
-- 10. NOTIFICATION PREFERENCES
-- ─────────────────────────────────────────────────────
INSERT INTO notification_preferences (user_id, like_notification, comment_notification, follow_notification, mention_notification, email_on_comment, email_on_follow, email_on_mention, updated_at)
VALUES
    (1, true, true, true, true, true, true, true, '2026-01-01 10:00:00'),
    (2, true, true, true, true, true, true, true, '2026-01-05 12:00:00'),
    (3, true, true, true, true, false, true, true, '2026-03-15 10:00:00'),   -- John disabled email on comment
    (4, true, true, true, true, true, true, true, '2026-02-01 14:00:00'),
    (5, false, true, true, true, false, false, true, '2026-03-01 11:00:00'); -- Alex disabled like notifs + some emails


-- ─────────────────────────────────────────────────────
-- 11. CONVERSATIONS (user1_id < user2_id always)
-- ─────────────────────────────────────────────────────
INSERT INTO conversations (user1_id, user2_id, last_message_id, user1_unread_count, user2_unread_count, created_at, updated_at)
VALUES
-- Manish (1) ↔ John (3)
(1, 3, NULL, 1, 0, '2026-03-01 12:00:00', '2026-04-02 15:00:00'),

-- Manish (1) ↔ Jane (4)
(1, 4, NULL, 0, 1, '2026-03-22 16:30:00', '2026-04-01 10:00:00'),

-- John (3) ↔ Alex (5)
(3, 5, NULL, 0, 0, '2026-03-18 12:30:00', '2026-03-28 14:00:00'),

-- Priya (2) ↔ Manish (1)
(1, 2, NULL, 0, 0, '2026-01-06 10:30:00', '2026-03-25 17:00:00');


-- ─────────────────────────────────────────────────────
-- 12. MESSAGES
-- ─────────────────────────────────────────────────────
INSERT INTO messages (conversation_id, sender_id, content, is_read, is_deleted, created_at, deleted_at)
VALUES
-- Conversation 1: Manish ↔ John
(1, 1, 'Hey John! Loved your Kafka post 🔥', true, false, '2026-03-20 10:30:00', NULL),
(1, 3, 'Thanks Manish! It took me a while to understand partitions', true, false, '2026-03-20 10:45:00', NULL),
(1, 1, 'The official docs are great. Also check out Confluent tutorials', true, false, '2026-03-20 11:00:00', NULL),
(1, 3, 'Will do! Are you using Kafka in ConnectSphere?', true, false, '2026-03-20 11:15:00', NULL),
(1, 1, 'Yeah for notifications, feed updates, and event processing', true, false, '2026-03-20 11:30:00', NULL),
(1, 3, 'Hey, have you seen the new Spring Boot 3.3 release?', false, false, '2026-04-02 15:00:00', NULL),

-- Conversation 2: Manish ↔ Jane
(2, 4, 'Hi Manish! Your platform is incredible. Can I contribute?', true, false, '2026-03-22 16:30:00', NULL),
(2, 1, 'Of course! Check the GitHub repo, lots of open issues', true, false, '2026-03-22 17:00:00', NULL),
(2, 4, 'I can help with the React frontend!', true, false, '2026-03-22 17:15:00', NULL),
(2, 1, 'That would be amazing. Let me set up the repo for you', false, false, '2026-04-01 10:00:00', NULL),

-- Conversation 3: John ↔ Alex
(3, 3, 'Alex, your Docker setup post was super helpful!', true, false, '2026-03-18 12:30:00', NULL),
(3, 5, 'Glad it helped! Let me know if you need help with compose', true, false, '2026-03-18 13:00:00', NULL),
(3, 3, 'How do you handle secrets in docker-compose?', true, false, '2026-03-28 14:00:00', NULL),
(3, 5, 'I use .env files locally and Docker secrets in production', true, false, '2026-03-28 14:30:00', NULL),

-- Conversation 4: Priya ↔ Manish
(4, 2, 'Hi Manish, got 3 new reports today. All spam.', true, false, '2026-03-25 17:00:00', NULL),
(4, 1, 'Thanks Priya. Go ahead and dismiss the obvious ones.', true, false, '2026-03-25 17:15:00', NULL);


-- Update conversations with last_message_id
UPDATE conversations SET last_message_id = 6 WHERE conversation_id = 1;
UPDATE conversations SET last_message_id = 10 WHERE conversation_id = 2;
UPDATE conversations SET last_message_id = 14 WHERE conversation_id = 3;
UPDATE conversations SET last_message_id = 16 WHERE conversation_id = 4;


-- ─────────────────────────────────────────────────────
-- 13. REPORTS
-- ─────────────────────────────────────────────────────
INSERT INTO reports (reporter_id, target_type, target_id, reason, description, status, created_at, updated_at)
VALUES
-- Resolved report — spam post (soft-deleted post #3)
(3, 'POST', 3, 'SPAM', 'This post contains suspicious links and looks like spam', 'REVIEWED', '2026-03-01 07:00:00', '2026-03-05 09:00:00'),

-- Pending report — harassment in a comment
(4, 'COMMENT', 19, 'HARASSMENT', 'This comment is rude and targeted at me personally', 'PENDING', '2026-04-01 22:30:00', '2026-04-01 22:30:00'),

-- Dismissed report — false report
(5, 'POST', 7, 'MISINFORMATION', 'I think the security advice in this post is wrong', 'DISMISSED', '2026-03-29 08:00:00', '2026-03-30 10:00:00'),

-- Pending report — potential spam user
(3, 'USER', 5, 'SPAM', 'This account keeps posting promotional content', 'PENDING', '2026-04-02 10:00:00', '2026-04-02 10:00:00');


-- ─────────────────────────────────────────────────────
-- 14. MODERATION LOGS
-- ─────────────────────────────────────────────────────
INSERT INTO moderation_logs (moderator_id, report_id, action, note, target_user_id, target_type, target_id, created_at)
VALUES
-- Report 1: Priya removed the spam post
(2, 1, 'REMOVE_CONTENT', 'Confirmed spam. Post contained phishing links. Content removed and user warned.', 1, 'POST', 3, '2026-03-05 09:00:00'),

-- Report 3: Priya dismissed the false report
(2, 3, 'DISMISS', 'The security advice in the post is accurate. No action needed.', NULL, 'POST', 7, '2026-03-30 10:00:00'),

-- Direct admin action: Manish promoted Priya to MODERATOR
(1, NULL, 'ROLE_CHANGE', 'Promoted priya_sharma to MODERATOR role for content moderation duties.', 2, 'USER', 2, '2026-01-05 12:00:00');
