# Tài liệu Đặc tả - Social Media Feed Feature

## 1. REQUIREMENTS

### 1.1 Functional Requirements (FR)

#### FR-001: Feed Navigation & Filtering
**Mô tả:** User có thể điều hướng giữa các loại feed khác nhau

**Mô tả chi tiết:**
- System hiển thị 3 tabs chính: Friends, Community, Latest
- User có thể chuyển đổi giữa các tabs bằng cách tap
- Tab được chọn sẽ hiển thị underline indicator
- Mỗi tab hiển thị nội dung tương ứng:
  - Friends: Posts từ bạn bè
  - Community: Posts từ cộng đồng với Hot Topics
  - Latest: Posts mới nhất theo thời gian

**Sub-requirements:**
- Active tab highlighting với underline
- Smooth transition animation khi chuyển tab
- Maintain scroll position khi quay lại tab

**Acceptance Criteria:**
1. User có thể tap vào bất kỳ tab nào để chuyển đổi
2. Active tab được highlight rõ ràng
3. Content load đúng theo tab được chọn
4. Scroll position được giữ khi switch giữa các tabs

---

#### FR-002: Hot Topics Display
**Mô tả:** Hiển thị các chủ đề trending trong Community tab

**Mô tả chi tiết:**
- Hiển thị section "🔥 Hot Topic" ở đầu Community feed
- Mỗi topic hiển thị:
  - Thumbnail image
  - Hashtag name (e.g., #Sayhi2025, #Giaoluuamnhac)
  - Số lượng bài viết (e.g., "120k bài viết")
- Layout: 2 columns grid
- Topics được sắp xếp theo độ phổ biến

**Sub-requirements:**
- Real-time update số lượng bài viết
- Clickable topics để xem chi tiết
- Lazy loading cho topic thumbnails
- Cache topic data để tăng performance

**Acceptance Criteria:**
1. Hot Topics chỉ hiển thị trong Community tab
2. Hiển thị tối thiểu 4 topics phổ biến nhất
3. Click vào topic sẽ navigate đến topic detail page
4. Số lượng bài viết được format (k, m) cho dễ đọc

---

#### FR-003: Post Display
**Mô tả:** Hiển thị danh sách posts trong feed

**Mô tả chi tiết:**
- Mỗi post card hiển thị:
  - Avatar của người đăng
  - Tên người đăng
  - Thời gian đăng (relative time: "4 giờ", "5 giờ")
  - Nội dung text
  - Media content (images/video/audio nếu có)
  - Action buttons: Like, Comment (với số lượng), Share
  - Menu button (...)
- Support multiple media types:
  - Single/multiple images (carousel)
  - Video với video icon
  - Audio với waveform player
- Infinite scroll để load more posts

**Sub-requirements:**
- Image gallery với swipe gesture
- Video thumbnail với play indicator
- Audio player với play/pause controls
- Text truncation với "see more" option
- Optimistic UI updates cho interactions

**Acceptance Criteria:**
1. Posts load theo batch (10-20 posts/lần)
2. Media được lazy load khi scroll vào viewport
3. Video không auto-play (chỉ khi user click)
4. Audio player có controls: play/pause, progress bar
5. Like/Comment count update real-time

---

#### FR-004: Post Interactions
**Mô tả:** User có thể tương tác với posts

**Mô tả chi tiết:**
- **Like:** 
  - Tap icon tim để like/unlike
  - Icon đổi màu khi đã like (fill heart)
  - Animation khi like
- **Comment:**
  - Tap icon comment để xem/thêm comment
  - Hiển thị số lượng comments hiện tại
  - Navigate đến comment section
- **Share:**
  - Tap icon share để mở sharing options
  - Support share đến platform khác hoặc trong app

**Sub-requirements:**
- Double tap vào image để quick like
- Long press để react với emoji (optional)
- Comment count update real-time
- Share tracking

**Acceptance Criteria:**
1. Like state được save và sync across devices
2. Unlike sẽ remove like ngay lập tức
3. Comment count phản ánh số lượng chính xác
4. Share action tracked cho analytics

---

#### FR-005: Create Post (FAB)
**Mô tả:** User có thể tạo post mới từ feed

**Mô tả chi tiết:**
- Floating Action Button (FAB) màu hồng với icon bút
- Position: bottom-right của màn hình
- Tap để mở create post screen
- FAB hiển thị trên tất cả các tabs
- FAB ẩn khi scroll down, hiện khi scroll up (optional)

**Sub-requirements:**
- Smooth animation khi show/hide
- Tap ripple effect
- Navigate đến create post flow

**Acceptance Criteria:**
1. FAB luôn accessible trên mọi tabs
2. Tap FAB mở create post screen
3. FAB không che khuất nội dung quan trọng

---

#### FR-006: Post Menu Actions
**Mô tả:** User có thể truy cập thêm actions qua menu

**Mô tả chi tiết:**
- Icon "..." ở góc phải mỗi post
- Tap để mở bottom sheet/menu với options:
  - Save post
  - Report post
  - Hide post
  - Copy link
  - (Nếu là post của mình: Edit, Delete)

**Sub-requirements:**
- Different menu cho own posts vs others' posts
- Confirmation dialog cho destructive actions
- Report flow với categories

**Acceptance Criteria:**
1. Menu hiển thị đúng options dựa trên ownership
2. Delete action cần confirmation
3. Report action mở report flow
4. Menu dismiss khi tap outside

---

#### FR-007: Media Gallery View
**Mô tả:** Xem images trong post ở chế độ carousel/gallery

**Mô tả chi tiết:**
- Multiple images hiển thị dạng carousel
- User có thể swipe để xem ảnh tiếp theo
- Tap vào image để xem fullscreen
- Small preview thumbnails nếu có nhiều ảnh

**Sub-requirements:**
- Swipe gesture support
- Pinch to zoom trong fullscreen
- Image indicator (dots/counter)
- Preload adjacent images

**Acceptance Criteria:**
1. Smooth swipe animation giữa các ảnh
2. Fullscreen mode với zoom support
3. Image loading state với placeholder
4. Back gesture để thoát fullscreen

---

#### FR-008: Video Player
**Mô tả:** Phát video inline trong feed

**Mô tả chi tiết:**
- Video hiển thị với thumbnail và play icon
- Tap để play video inline
- Video player controls:
  - Play/Pause
  - Progress bar
  - Mute/Unmute
  - Fullscreen option
- Video icon indicator ở góc (🎥)

**Sub-requirements:**
- Auto-pause khi scroll out of view
- Muted by default
- Quality selection (optional)
- Picture-in-picture (optional)

**Acceptance Criteria:**
1. Video không auto-play khi load
2. Only 1 video playing tại một thời điểm
3. Video pause khi minimize app
4. Progress saved khi navigate away

---

#### FR-009: Audio Player
**Mô tả:** Phát audio posts trong feed

**Mô tả chi tiết:**
- Hiển thị waveform visualization
- Player controls:
  - Play/Pause button
  - Progress indicator
  - Current time/Duration
  - Seek bar với waveform
- Play state indicator khi đang phát

**Sub-requirements:**
- Background audio playback (optional)
- Playback speed control (optional)
- Skip forward/backward 15s (optional)
- Mini player khi scroll away (optional)

**Acceptance Criteria:**
1. Audio player có basic controls: play/pause, seek
2. Waveform reflect playback progress
3. Only 1 audio playing tại một thời điểm
4. Audio stop khi navigate away from feed

---

#### FR-010: Search Functionality
**Mô tả:** Tìm kiếm posts, users, hashtags

**Mô tả chi tiết:**
- Search icon ở top-right navigation
- Tap để mở search screen
- Support search:
  - Posts by content
  - Users by name
  - Hashtags
- Search suggestions khi typing
- Recent searches

**Sub-requirements:**
- Real-time search results
- Search filters (posts/users/tags)
- Search history
- Clear search history option

**Acceptance Criteria:**
1. Search results xuất hiện sau khi typing ít nhất 2 ký tự
2. Results được categorize: Posts, Users, Hashtags
3. Tap result để navigate đến detail
4. Recent searches được saved locally

---

#### FR-011: Notifications
**Mô tả:** Hiển thị và quản lý notifications

**Mô tả chi tiết:**
- Bell icon ở top-right navigation
- Badge indicator nếu có unread notifications
- Tap để xem danh sách notifications
- Notification types:
  - Likes trên posts của user
  - Comments trên posts của user
  - Mentions
  - New followers
  - System notifications

**Sub-requirements:**
- Real-time notification updates
- Mark as read functionality
- Notification preferences/settings
- Push notifications

**Acceptance Criteria:**
1. Unread count hiển thị chính xác trên badge
2. Notifications update real-time
3. Tap notification navigate đến relevant content
4. Mark all as read option available

---

### 1.2 Non-Functional Requirements (NFR)

#### NFR-001: Performance
**Loại:** Performance

**Mô tả chi tiết:**
- Feed initial load time: < 2 seconds
- Infinite scroll load time: < 1 second
- Image loading: Progressive loading với placeholder
- Video buffer time: < 3 seconds for standard quality
- Smooth scrolling: 60 FPS
- App launch to feed display: < 3 seconds
- API response time: < 500ms (p95)
- Database query time: < 100ms

---

#### NFR-002: Scalability
**Loại:** Scalability

**Mô tả chi tiết:**
- Support lên đến 10 million users
- Feed có thể handle 100k+ posts per day
- Concurrent users: 100k simultaneously
- Database sharding strategy cho user data
- CDN cho media files
- Caching strategy:
  - Redis cho hot data (trending topics, recent posts)
  - Client-side cache cho user feed
- Rate limiting: 100 requests/minute per user

---

#### NFR-003: Security
**Loại:** Security

**Mô tả chi tiết:**
- Authentication: JWT tokens với refresh mechanism
- Authorization: Role-based access control (RBAC)
- Data encryption: TLS 1.3 cho data in transit
- Sensitive data encryption at rest
- Content moderation: AI-powered filtering
- Report & block functionality
- Rate limiting để prevent spam/abuse
- CSRF protection
- XSS protection cho user-generated content
- SQL injection prevention với parameterized queries

---

#### NFR-004: Availability
**Loại:** Availability & Reliability

**Mô tả chi tiết:**
- Uptime: 99.9% (43 minutes downtime/month max)
- Graceful degradation khi services down
- Offline mode: Cached feed accessible
- Auto-retry failed requests
- Circuit breaker pattern cho external services
- Health checks cho all services
- Multi-region deployment
- Disaster recovery plan

---

#### NFR-005: Usability
**Loại:** Usability & Accessibility

**Mô tả chi tiết:**
- Intuitive navigation
- Responsive design cho all screen sizes
- Support dark mode
- Accessibility:
  - Screen reader support
  - Sufficient color contrast (WCAG AA)
  - Touch targets: minimum 44x44 points
  - Alt text cho images
- Multi-language support (i18n)
- Error messages rõ ràng và actionable

---

#### NFR-006: Compatibility
**Loại:** Compatibility

**Mô tả chi tiết:**
- iOS: 14.0 trở lên
- Android: API level 24 (Android 7.0) trở lên
- Support các screen sizes: từ 4.7" đến tablets
- Orientation: Portrait primary, landscape optional
- Browser (web version): Chrome, Safari, Firefox, Edge (latest 2 versions)

---

## 2. USE CASES

### UC-001: View Feed

**Actor:** User (authenticated)

**Preconditions:**
- User đã đăng nhập
- User có internet connection
- Feed service đang hoạt động

**Main Flow:**
1. User mở app
2. System kiểm tra authentication status
3. System load user's default feed (Friends tab)
4. System fetch posts từ server:
   - Query posts từ friends của user
   - Sort by timestamp (newest first)
   - Limit 20 posts per batch
5. System hiển thị posts trong feed với:
   - User info (avatar, name, timestamp)
   - Post content (text, media)
   - Interaction counts (likes, comments)
   - Action buttons
6. User scroll xuống để xem thêm posts
7. System detect scroll position gần bottom
8. System fetch batch tiếp theo (next 20 posts)
9. System append posts vào feed
10. User tiếp tục browsing

**Alternative Flows:**

**AF-001: No Internet Connection**
- 4a. Nếu không có internet:
  - System hiển thị cached posts từ local storage
  - System show banner "Offline mode - showing cached content"
  - User có thể view cached posts nhưng không interact
  - System retry connection periodically
  - When online: System refresh feed và remove banner

**AF-002: Empty Feed**
- 4a. Nếu user chưa có friends hoặc friends chưa có posts:
  - System hiển thị empty state
  - System suggest actions:
    - "Find friends to follow"
    - "Explore Community tab"
  - Provide CTA buttons để discover users

**AF-003: Feed Load Error**
- 4a. Nếu API error:
  - System show error message "Unable to load feed"
  - System provide "Retry" button
  - User tap retry
  - System retry API call
  - If success: continue from step 5
  - If fail after 3 retries: Show support contact

**AF-004: Slow Connection**
- 4a. Nếu connection chậm (> 5s):
  - System hiển thị loading skeleton
  - System show progress indicator
  - Continue loading in background
  - Timeout after 30s → show error

**Postconditions:**
- Feed hiển thị với posts từ friends
- User có thể scroll và xem posts
- Scroll position được save
- Cache được update với latest posts

---

### UC-002: Switch Feed Tabs

**Actor:** User

**Preconditions:**
- User đang ở feed screen
- App đã load initial feed

**Main Flow:**
1. User tap vào tab khác (Community hoặc Latest)
2. System highlight tab được chọn
3. System check cache cho tab đó
4. If cache exists và còn fresh (< 5 minutes):
   - System hiển thị cached content ngay lập tức
5. System fetch latest posts cho tab đó in background:
   - Community: Posts từ all users + Hot Topics section
   - Latest: All posts sorted by timestamp
6. System update feed với fresh data
7. System scroll feed về top
8. User xem content của tab mới

**Alternative Flows:**

**AF-001: No Cache Available**
- 4a. Nếu chưa có cache:
  - System show loading indicator
  - System fetch posts từ server
  - System hiển thị posts khi ready

**AF-002: Background Fetch Fails**
- 5a. Nếu fetch fails:
  - System keep hiển thị cached content
  - System show subtle error indicator
  - System không interrupt user experience
  - User có thể pull-to-refresh để retry

**Postconditions:**
- Tab mới được active và highlighted
- Content tương ứng được hiển thị
- Previous tab state được save
- User có thể switch back với preserved scroll position

---

### UC-003: Like a Post

**Actor:** User

**Preconditions:**
- User đang xem feed
- User đã authenticated
- Post visible trên screen

**Main Flow:**
1. User tap vào heart icon của post
2. System immediately update UI (optimistic update):
   - Heart icon fill với màu (animated)
   - Like count tăng 1
3. System send like request đến server:
   - POST /api/posts/{post_id}/like
   - Include user_id, post_id, timestamp
4. Server validate request:
   - Check user authentication
   - Check post exists
   - Check user chưa like post này
5. Server create like record trong database
6. Server update post's like count
7. Server send notification đến post author (if not self)
8. Server return success response
9. System confirm UI state
10. System update local cache

**Alternative Flows:**

**AF-001: Unlike Post**
- 1a. Nếu user đã like và tap lại:
  - System remove fill từ heart icon (animated)
  - Like count giảm 1
  - System send unlike request: DELETE /api/posts/{post_id}/like
  - Server remove like record
  - Server update post's like count

**AF-002: Network Error**
- 3a. Nếu request fails:
  - System rollback UI state
  - Heart icon về trạng thái ban đầu
  - Like count về số ban đầu
  - System show toast "Unable to like post"
  - System queue action để retry later

**AF-003: Duplicate Like**
- 4a. Nếu user đã like (race condition):
  - Server return 409 Conflict
  - System keep UI state (already liked)
  - No error shown to user

**AF-004: Post Deleted**
- 4a. Nếu post đã bị xóa:
  - Server return 404 Not Found
  - System rollback UI
  - System remove post from feed
  - System show toast "Post no longer available"

**Postconditions:**
- Like state được save trên server
- UI reflect correct like state
- Post author nhận notification (if applicable)
- Like count updated accurately

---

### UC-004: Comment on Post

**Actor:** User

**Preconditions:**
- User đang xem feed
- User đã authenticated

**Main Flow:**
1. User tap vào comment icon hoặc comment count
2. System navigate đến Post Detail screen
3. System hiển thị:
   - Full post content
   - Existing comments (load from server)
   - Comment input box at bottom
4. User tap vào comment input box
5. System show keyboard
6. User type comment text
7. User tap "Send" button
8. System validate comment:
   - Minimum 1 character
   - Maximum 500 characters
   - Check for spam/inappropriate content
9. System show comment optimistically trong list
10. System send request đến server:
    - POST /api/posts/{post_id}/comments
    - Body: {text, user_id, timestamp}
11. Server validate và save comment
12. Server increment post's comment count
13. Server send notification đến post author
14. Server return comment object with ID
15. System update comment với server ID
16. System clear input box
17. System hide keyboard

**Alternative Flows:**

**AF-001: Empty Comment**
- 8a. Nếu comment empty:
  - System disable Send button
  - User cannot submit

**AF-002: Comment Too Long**
- 8a. Nếu text > 500 characters:
  - System show character count indicator
  - System show error "Comment too long (500 max)"
  - Send button disabled until user reduce text

**AF-003: Network Error**
- 10a. Nếu request fails:
  - System show comment với "pending" indicator
  - System show toast "Unable to post comment"
  - System provide retry option
  - Comment saved locally để retry
  - When online: Auto retry

**AF-004: Inappropriate Content Detected**
- 8a. Nếu AI detect inappropriate content:
  - System show warning "Comment contains inappropriate content"
  - System không allow submit
  - User phải edit comment

**AF-005: Post Deleted**
- 2a. Nếu post đã bị xóa khi navigate:
  - System show error "Post no longer available"
  - System navigate back to feed
  - System remove post from feed

**Postconditions:**
- Comment được save trên server
- Comment hiển thị trong comment list
- Comment count tăng 1
- Post author nhận notification
- User có thể continue commenting

---

### UC-005: View Hot Topics

**Actor:** User

**Preconditions:**
- User đang ở Community tab
- Hot topics available

**Main Flow:**
1. User vào Community tab
2. System fetch hot topics từ server:
   - GET /api/topics/trending
   - Parameters: limit=4, timeframe=24h
3. Server calculate trending topics based on:
   - Number of posts in last 24h
   - Engagement rate (likes + comments)
   - Growth velocity
4. Server return top 4 topics với:
   - Topic ID, hashtag, thumbnail, post count
5. System hiển thị "🔥 Hot Topic" section
6. System display topics trong 2-column grid
7. User tap vào một topic (e.g., #Sayhi2025)
8. System navigate đến Topic Detail screen
9. System fetch posts tagged với hashtag đó
10. System hiển thị:
    - Topic header (thumbnail, hashtag, post count)
    - List of posts với tag đó
    - Option to follow topic
11. User browse posts trong topic

**Alternative Flows:**

**AF-001: No Trending Topics**
- 2a. Nếu không có trending topics:
  - System hide Hot Topic section
  - System show regular community posts

**AF-002: Topic Load Error**
- 2a. Nếu API error:
  - System show cached topics nếu có
  - System show generic topics as fallback
  - System retry in background

**AF-003: Topic Has No Posts**
- 9a. Nếu topic không còn posts:
  - System show empty state
  - System suggest similar topics
  - System provide back button

**Postconditions:**
- User xem được trending topics
- User có thể explore topic details
- Topic engagement được tracked
- User có thể follow topics (optional)

---

### UC-006: Create New Post

**Actor:** User (Post Creator)

**Preconditions:**
- User đã authenticated
- User có quyền create posts

**Main Flow:**
1. User tap FAB button (pink create button)
2. System navigate đến Create Post screen
3. System hiển thị:
   - Text input area (placeholder: "What's on your mind?")
   - Media attachment options (Photo, Video, Audio)
   - Privacy selector
   - Hashtag suggestions
   - Post button (disabled initially)
4. User type post content
5. (Optional) User tap media attachment icon
6. (Optional) System open media picker
7. (Optional) User select media files
8. (Optional) System upload media to temp storage
9. (Optional) System show upload progress
10. User tap "Post" button
11. System validate post:
    - Text: 1-5000 characters (if no media)
    - Media: Valid formats, max size check
    - Check for spam/inappropriate content
12. System show loading indicator
13. System create post request:
    - POST /api/posts
    - Body: {text, media_urls, privacy, hashtags, user_id}
14. Server validate và save post
15. Server process media:
    - Generate thumbnails
    - Encode videos
    - Process audio files
16. Server create post record trong database
17. Server distribute post đến followers' feeds
18. Server return post object
19. System navigate back to feed
20. System insert new post at top của feed
21. System show success toast "Post created"

**Alternative Flows:**

**AF-001: Empty Post**
- 11a. Nếu text empty và no media:
  - System show error "Post cannot be empty"
  - System không allow submit
  - Post button remains disabled

**AF-002: Media Upload Fails**
- 8a. Nếu media upload fails:
  - System show error "Unable to upload media"
  - System provide retry option
  - User có thể remove media và post text only
  - Or cancel và draft saved locally

**AF-003: Inappropriate Content**
- 11a. Nếu AI detect inappropriate content:
  - System show warning
  - System highlight problematic parts
  - System không allow submit
  - User phải edit or cancel

**AF-004: Network Error During Post**
- 13a. Nếu post request fails:
  - System show error "Unable to create post"
  - System save post as draft locally
  - System provide retry option
  - User có thể:
    - Retry immediately
    - Save draft and post later
    - Discard post

**AF-005: Rate Limit Exceeded**
- 13a. Nếu user post too frequently:
  - Server return 429 Too Many Requests
  - System show error "Please wait before posting again"
  - System show countdown timer
  - User phải wait before retry

**AF-006: User Cancels**
- At any step, user tap back/cancel:
  - System show confirmation "Discard post?"
  - Options: Discard, Save Draft, Continue Editing
  - If Discard: return to feed, delete temp data
  - If Save Draft: save locally, return to feed
  - If Continue: stay on create screen

**Postconditions:**
- Post created và visible trên server
- Post distributed đến followers
- Post appears trong user's profile
- Media processed và accessible
- User có thể edit/delete post later

---

### UC-007: Share Post

**Actor:** User (Sharer)

**Preconditions:**
- User đang xem một post
- User đã authenticated

**Main Flow:**
1. User tap share icon trên post
2. System show bottom sheet với share options:
   - Share to internal feed (repost)
   - Copy link
   - Share to external apps (WhatsApp, Messenger, etc.)
3. User chọn share option

**Option A: Share to Feed (Repost)**
4a. User select "Share to Feed"
5a. System open compose screen với:
   - Original post embedded/quoted
   - Text input để add comment
6a. User add optional comment
7a. User tap "Share" button
8a. System create repost:
   - POST /api/posts/repost
   - Body: {original_post_id, comment, user_id}
9a. Server create repost record
10a. Server notify original author
11a. System add repost to user's feed
12a. System show success toast

**Option B: Copy Link**
4b. User select "Copy link"
5b. System generate shareable link:
   - Format: https://app.com/posts/{post_id}
6b. System copy link to clipboard
7b. System show toast "Link copied"
8b. User có thể paste link anywhere

**Option C: Share External**
4c. User select external app (e.g., WhatsApp)
5c. System generate share content:
   - Post text preview (first 100 chars)
   - Post link
   - Thumbnail image nếu có
6c. System open system share sheet
7c. User select app để share
8c. External app opens với pre-filled content
9c. User complete sharing trong app đó

**Alternative Flows:**

**AF-001: Post Privacy Restricted**
- 1a. Nếu post có privacy = private:
  - System disable share button
  - Or chỉ allow "Copy link" (link yêu cầu login)

**AF-002: Network Error**
- 8a. Nếu repost fails:
  - System show error "Unable to share post"
  - System provide retry option
  - Or save as draft

**AF-003: User Cancels**
- At step 2: User tap outside bottom sheet:
  - Bottom sheet dismisses
  - No action taken

**Postconditions:**
- Share action được tracked
- Original post's share count increases (if tracked)
- Link/repost accessible by recipients
- Original author notified (for reposts)

---

## 3. SEQUENCE DIAGRAMS

### SD-001: View Feed Sequence

```
User -> App: Open app
App -> AuthService: Verify token
AuthService -> App: Token valid

App -> FeedService: GET /api/feed/friends
FeedService -> Database: Query posts from friends
Database -> FeedService: Return posts data
FeedService -> MediaService: Get media URLs
MediaService -> FeedService: Return signed URLs
FeedService -> App: Return feed response (20 posts)

App -> UI: Render posts
UI -> User: Display feed

User -> UI: Scroll to bottom
UI -> App: Trigger load more
App -> FeedService: GET /api/feed/friends?offset=20
FeedService -> Database: Query next batch
Database -> FeedService: Return posts
FeedService -> App: Return next 20 posts
App -> UI: Append posts
UI -> User: Display more posts
```

---

### SD-002: Like Post Sequence

```
User -> UI: Tap like button
UI -> App: Like post event

App -> UI: Optimistic update (fill heart, +1 count)

App -> APIService: POST /api/posts/{id}/like
APIService -> AuthMiddleware: Verify token
AuthMiddleware -> APIService: Authorized

APIService -> LikeService: Create like
LikeService -> Database: INSERT like record
Database -> LikeService: Success

LikeService -> Database: UPDATE post like_count
Database -> LikeService: Success

LikeService -> NotificationService: Notify post author
NotificationService -> Database: Create notification
NotificationService -> PushService: Send push notification
PushService -> FCM/APNS: Deliver notification

LikeService -> APIService: Return success
APIService -> App: 200 OK

App -> CacheService: Update cache
App -> UI: Confirm like state

--- Alternative: Network Error ---
APIService -> App: Network error
App -> UI: Rollback UI (unfill heart, -1 count)
App -> UI: Show toast "Unable to like"
App -> QueueService: Queue retry
```

---

### SD-003: Create Post with Media Sequence

```
User -> UI: Tap FAB button
UI -> App: Navigate to create post

App -> UI: Show create post screen
UI -> User: Display editor

User -> UI: Type text & select media
UI -> App: Text + media files

App -> MediaService: Upload media
MediaService -> StorageService: Upload to temp storage
StorageService -> CDN: Store files
CDN -> StorageService: Return temp URLs
StorageService -> MediaService: Return URLs
MediaService -> App: Upload complete

App -> UI: Show upload progress
UI -> User: Display progress

User -> UI: Tap "Post" button
UI -> App: Submit post

App -> ValidationService: Validate content
ValidationService -> App: Valid

App -> APIService: POST /api/posts
APIService -> AuthMiddleware: Verify token
AuthMiddleware -> APIService: Authorized

APIService -> PostService: Create post
PostService -> Database: INSERT post record
Database -> PostService: Return post_id

PostService -> MediaService: Move media to permanent storage
MediaService -> StorageService: Move files
StorageService -> MediaService: Success

PostService -> MediaService: Process media
MediaService -> VideoEncoder: Encode video (async)
MediaService -> ThumbnailGenerator: Generate thumbnails (async)

PostService -> FeedService: Distribute to followers
FeedService -> Database: Get followers list
Database -> FeedService: Return followers
FeedService -> CacheService: Invalidate followers' caches
FeedService -> QueueService: Queue feed updates

PostService -> APIService: Return post object
APIService -> App: 201 Created

App -> UI: Navigate to feed
App -> UI: Insert post at top
UI -> User: Show success toast

--- Background ---
VideoEncoder -> CDN: Upload encoded video
ThumbnailGenerator -> CDN: Upload thumbnails
QueueService -> FeedService: Update followers' feeds
```

---

### SD-004: View Hot Topics Sequence

```
User -> UI: Tap "Community" tab
UI -> App: Switch to community tab

App -> CacheService: Check cache for hot topics
CacheService -> App: Cache miss or stale

App -> APIService: GET /api/topics/trending
APIService -> TopicService: Get trending topics

TopicService -> Database: Query topic engagement
TopicService -> Database: Calculate trending score
Database -> TopicService: Return raw data

TopicService -> AnalyticsService: Calculate trends
AnalyticsService -> TopicService: Return scored topics

TopicService -> Database: Get post counts
Database -> TopicService: Return counts

TopicService -> MediaService: Get topic thumbnails
MediaService -> TopicService: Return thumbnail URLs

TopicService -> APIService: Return top 4 topics
APIService -> App: 200 OK with topics

App -> CacheService: Cache topics (5 min TTL)
App -> UI: Render hot topics section
UI -> User: Display topics

User -> UI: Tap topic "#Sayhi2025"
UI -> App: Navigate to topic detail

App -> APIService: GET /api/topics/{tag}/posts
APIService -> TopicService: Get posts by tag
TopicService -> Database: Query posts with hashtag
Database -> TopicService: Return posts
TopicService -> APIService: Return posts

APIService -> App: 200 OK with posts
App -> UI: Render topic posts
UI -> User: Display topic feed
```

---

### SD-005: Comment on Post Sequence

```
User -> UI: Tap comment icon
UI -> App: Navigate to post detail

App -> APIService: GET /api/posts/{id}
APIService -> PostService: Get post details
PostService -> Database: Query post + comments
Database -> PostService: Return data
PostService -> APIService: Return post with comments

APIService -> App: 200 OK
App -> UI: Render post + comments
UI -> User: Display post detail

User -> UI: Tap comment input
UI -> User: Show keyboard

User -> UI: Type comment text
UI -> App: Text input

User -> UI: Tap "Send"
UI -> App: Submit comment

App -> ValidationService: Validate comment
ValidationService -> App: Valid (1-500 chars)

App -> UI: Optimistic insert comment in list

App -> APIService: POST /api/posts/{id}/comments
APIService -> AuthMiddleware: Verify token
AuthMiddleware -> APIService: Authorized

APIService -> CommentService: Create comment
CommentService -> Database: INSERT comment record
Database -> CommentService: Return comment_id

CommentService -> Database: UPDATE post comment_count
Database -> CommentService: Success

CommentService -> NotificationService: Notify post author
NotificationService -> Database: Create notification
NotificationService -> PushService: Send push

CommentService -> APIService: Return comment object
APIService -> App: 201 Created

App -> UI: Update comment với server ID
App -> UI: Clear input
UI -> User: Show updated comments

--- Alternative: Inappropriate Content ---
ValidationService -> App: Invalid (inappropriate)
App -> UI: Show error "Inappropriate content"
UI -> User: Display error, cannot submit
```

---

## 4. DATABASE DESIGN & ARCHITECTURE

### 4.1 Database Schema

#### Table: users
```sql
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    display_name VARCHAR(100),
    avatar_url TEXT,
    bio TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    last_active_at TIMESTAMP,
    is_active BOOLEAN DEFAULT true,
    is_verified BOOLEAN DEFAULT false,
    follower_count INT DEFAULT 0,
    following_count INT DEFAULT 0,
    post_count INT DEFAULT 0,
    
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_created_at (created_at)
);
```

#### Table: posts
```sql
CREATE TABLE posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content TEXT,
    media_type ENUM('none', 'image', 'video', 'audio'),
    privacy ENUM('public', 'friends', 'private') DEFAULT 'public',
    like_count INT DEFAULT 0,
    comment_count INT DEFAULT 0,
    share_count INT DEFAULT 0,
    view_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP NULL,
    
    INDEX idx_user_id (user_id),
    INDEX idx_created_at (created_at),
    INDEX idx_privacy (privacy),
    INDEX idx_deleted_at (deleted_at),
    FULLTEXT INDEX idx_content (content)
);
```

#### Table: post_media
```sql
CREATE TABLE post_media (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    media_url TEXT NOT NULL,
    media_type ENUM('image', 'video', 'audio') NOT NULL,
    thumbnail_url TEXT,
    width INT,
    height INT,
    duration INT, -- for video/audio in seconds
    file_size BIGINT,
    mime_type VARCHAR(100),
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_post_id (post_id),
    INDEX idx_media_type (media_type)
);
```

#### Table: post_hashtags
```sql
CREATE TABLE post_hashtags (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    hashtag VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_post_id (post_id),
    INDEX idx_hashtag (hashtag),
    UNIQUE KEY unique_post_hashtag (post_id, hashtag)
);
```

#### Table: likes
```sql
CREATE TABLE likes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_user_id (user_id),
    INDEX idx_post_id (post_id),
    INDEX idx_created_at (created_at),
    UNIQUE KEY unique_user_post_like (user_id, post_id)
);
```

#### Table: comments
```sql
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    parent_comment_id UUID NULL REFERENCES comments(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    like_count INT DEFAULT 0,
    reply_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP NULL,
    
    INDEX idx_post_id (post_id),
    INDEX idx_user_id (user_id),
    INDEX idx_parent_comment_id (parent_comment_id),
    INDEX idx_created_at (created_at),
    INDEX idx_deleted_at (deleted_at)
);
```

#### Table: follows
```sql
CREATE TABLE follows (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    follower_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    following_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_follower_id (follower_id),
    INDEX idx_following_id (following_id),
    INDEX idx_created_at (created_at),
    UNIQUE KEY unique_follow (follower_id, following_id),
    
    -- Prevent self-follow
    CHECK (follower_id != following_id)
);
```

#### Table: notifications
```sql
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    actor_id UUID REFERENCES users(id) ON DELETE CASCADE,
    type ENUM('like', 'comment', 'follow', 'mention', 'system') NOT NULL,
    entity_type ENUM('post', 'comment', 'user') NULL,
    entity_id UUID NULL,
    content TEXT,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_user_id (user_id),
    INDEX idx_actor_id (actor_id),
    INDEX idx_type (type),
    INDEX idx_is_read (is_read),
    INDEX idx_created_at (created_at)
);
```

#### Table: trending_topics
```sql
CREATE TABLE trending_topics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    hashtag VARCHAR(100) UNIQUE NOT NULL,
    post_count INT DEFAULT 0,
    engagement_score DECIMAL(10, 2) DEFAULT 0,
    thumbnail_url TEXT,
    calculated_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_hashtag (hashtag),
    INDEX idx_engagement_score (engagement_score DESC),
    INDEX idx_calculated_at (calculated_at)
);
```

#### Table: user_feed_cache
```sql
CREATE TABLE user_feed_cache (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    score DECIMAL(10, 2) DEFAULT 0, -- for ranking
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_user_id (user_id),
    INDEX idx_post_id (post_id),
    INDEX idx_score (score DESC),
    INDEX idx_created_at (created_at),
    UNIQUE KEY unique_user_post_feed (user_id, post_id)
);
```

#### Table: post_shares
```sql
CREATE TABLE post_shares (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    share_type ENUM('repost', 'link', 'external') NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    
    INDEX idx_post_id (post_id),
    INDEX idx_user_id (user_id),
    INDEX idx_created_at (created_at)
);
```

---

### 4.2 API Design

#### Base URL
```
https://api.example.com/v1
```

#### Authentication
All authenticated endpoints require Bearer token:
```
Authorization: Bearer {jwt_token}
```

---

#### API Endpoints

### 1. Feed APIs

#### GET /api/feed/friends
**Description:** Lấy feed của bạn bè

**Authentication:** Required

**Query Parameters:**
```
- offset: int (default: 0)
- limit: int (default: 20, max: 50)
- since: timestamp (optional, for pull-to-refresh)
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "posts": [
      {
        "id": "uuid",
        "user": {
          "id": "uuid",
          "username": "craig_curtis",
          "display_name": "Craig Curtis",
          "avatar_url": "https://cdn.example.com/avatars/..."
        },
        "content": "When it comes to home decor...",
        "media": [
          {
            "id": "uuid",
            "type": "image",
            "url": "https://cdn.example.com/media/...",
            "thumbnail_url": "https://cdn.example.com/thumbnails/...",
            "width": 1080,
            "height": 1080
          }
        ],
        "hashtags": ["#homedecor", "#interior"],
        "like_count": 245,
        "comment_count": 13,
        "share_count": 5,
        "is_liked": false,
        "created_at": "2025-11-24T15:02:00Z",
        "privacy": "public"
      }
    ],
    "has_more": true,
    "next_offset": 20
  }
}
```

**Error Responses:**
- 401: Unauthorized
- 500: Internal server error

---

#### GET /api/feed/community
**Description:** Lấy community feed với hot topics

**Authentication:** Required

**Query Parameters:**
```
- offset: int (default: 0)
- limit: int (default: 20, max: 50)
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "hot_topics": [
      {
        "id": "uuid",
        "hashtag": "#Sayhi2025",
        "post_count": 120000,
        "thumbnail_url": "https://cdn.example.com/topics/...",
        "engagement_score": 98.5
      }
    ],
    "posts": [...],
    "has_more": true
  }
}
```

---

#### GET /api/feed/latest
**Description:** Lấy latest feed (all posts)

**Authentication:** Required

**Query Parameters:** Same as /feed/friends

**Response:** Similar structure to /feed/friends

---

### 2. Post APIs

#### POST /api/posts
**Description:** Tạo post mới

**Authentication:** Required

**Request Body:**
```json
{
  "content": "Post content text",
  "media_urls": [
    "https://temp-storage.com/uuid1.jpg",
    "https://temp-storage.com/uuid2.jpg"
  ],
  "privacy": "public",
  "hashtags": ["#tag1", "#tag2"]
}
```

**Validation:**
- content: 1-5000 characters (required if no media)
- media_urls: max 10 items
- privacy: enum [public, friends, private]
- hashtags: max 30 tags, each max 100 chars

**Response 201:**
```json
{
  "success": true,
  "data": {
    "post": {
      "id": "uuid",
      "user": {...},
      "content": "...",
      "media": [...],
      "created_at": "2025-11-24T01:48:19Z"
    }
  }
}
```

**Error Responses:**
- 400: Validation error
- 401: Unauthorized
- 413: Media too large
- 429: Rate limit exceeded
- 500: Internal server error

---

#### GET /api/posts/{post_id}
**Description:** Lấy chi tiết một post

**Authentication:** Required

**Path Parameters:**
- post_id: UUID

**Response 200:**
```json
{
  "success": true,
  "data": {
    "post": {
      "id": "uuid",
      "user": {...},
      "content": "...",
      "media": [...],
      "hashtags": [...],
      "like_count": 100,
      "comment_count": 25,
      "share_count": 10,
      "is_liked": true,
      "created_at": "...",
      "updated_at": "..."
    }
  }
}
```

**Error Responses:**
- 404: Post not found
- 403: Access denied (private post)

---

#### PUT /api/posts/{post_id}
**Description:** Cập nhật post (chỉ owner)

**Authentication:** Required

**Request Body:**
```json
{
  "content": "Updated content",
  "privacy": "friends"
}
```

**Response 200:** Updated post object

**Error Responses:**
- 403: Not post owner
- 404: Post not found

---

#### DELETE /api/posts/{post_id}
**Description:** Xóa post (soft delete)

**Authentication:** Required

**Response 204:** No content

**Error Responses:**
- 403: Not post owner
- 404: Post not found

---

### 3. Like APIs

#### POST /api/posts/{post_id}/like
**Description:** Like một post

**Authentication:** Required

**Path Parameters:**
- post_id: UUID

**Response 201:**
```json
{
  "success": true,
  "data": {
    "like": {
      "id": "uuid",
      "user_id": "uuid",
      "post_id": "uuid",
      "created_at": "2025-11-24T01:48:19Z"
    },
    "like_count": 246
  }
}
```

**Error Responses:**
- 404: Post not found
- 409: Already liked

---

#### DELETE /api/posts/{post_id}/like
**Description:** Unlike một post

**Authentication:** Required

**Response 200:**
```json
{
  "success": true,
  "data": {
    "like_count": 245
  }
}
```

**Error Responses:**
- 404: Post not found or not liked

---

### 4. Comment APIs

#### GET /api/posts/{post_id}/comments
**Description:** Lấy comments của post

**Authentication:** Required

**Query Parameters:**
```
- offset: int (default: 0)
- limit: int (default: 20)
- sort: enum [newest, oldest, popular] (default: newest)
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "comments": [
      {
        "id": "uuid",
        "user": {
          "id": "uuid",
          "username": "john_doe",
          "display_name": "John Doe",
          "avatar_url": "..."
        },
        "content": "Great post!",
        "like_count": 5,
        "reply_count": 2,
        "created_at": "2025-11-24T01:30:00Z",
        "is_liked": false
      }
    ],
    "has_more": true
  }
}
```

---

#### POST /api/posts/{post_id}/comments
**Description:** Thêm comment vào post

**Authentication:** Required

**Request Body:**
```json
{
  "content": "Comment text",
  "parent_comment_id": "uuid" // optional, for replies
}
```

**Validation:**
- content: 1-500 characters, required

**Response 201:**
```json
{
  "success": true,
  "data": {
    "comment": {
      "id": "uuid",
      "user": {...},
      "content": "...",
      "created_at": "..."
    },
    "comment_count": 26
  }
}
```

**Error Responses:**
- 400: Validation error
- 404: Post not found
- 429: Rate limit exceeded

---

#### DELETE /api/posts/{post_id}/comments/{comment_id}
**Description:** Xóa comment

**Authentication:** Required

**Response 204:** No content

**Error Responses:**
- 403: Not comment owner
- 404: Comment not found

---

### 5. Topic APIs

#### GET /api/topics/trending
**Description:** Lấy trending topics

**Authentication:** Required

**Query Parameters:**
```
- limit: int (default: 4, max: 20)
- timeframe: int (hours, default: 24)
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "topics": [
      {
        "id": "uuid",
        "hashtag": "#Sayhi2025",
        "post_count": 120000,
        "thumbnail_url": "...",
        "engagement_score": 98.5,
        "calculated_at": "2025-11-24T01:00:00Z"
      }
    ]
  }
}
```

---

#### GET /api/topics/{hashtag}/posts
**Description:** Lấy posts theo hashtag

**Authentication:** Required

**Path Parameters:**
- hashtag: string (without #)

**Query Parameters:**
```
- offset: int
- limit: int
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "topic": {
      "hashtag": "#Sayhi2025",
      "post_count": 120000
    },
    "posts": [...]
  }
}
```

---

### 6. Share APIs

#### POST /api/posts/{post_id}/share
**Description:** Share một post

**Authentication:** Required

**Request Body:**
```json
{
  "share_type": "repost",
  "comment": "Optional comment for repost"
}
```

**Validation:**
- share_type: enum [repost, link, external]
- comment: max 500 chars (optional)

**Response 201:**
```json
{
  "success": true,
  "data": {
    "share": {
      "id": "uuid",
      "post_id": "uuid",
      "share_type": "repost",
      "created_at": "..."
    },
    "share_count": 11,
    "share_url": "https://app.com/posts/uuid"
  }
}
```

---

### 7. Notification APIs

#### GET /api/notifications
**Description:** Lấy danh sách notifications

**Authentication:** Required

**Query Parameters:**
```
- offset: int
- limit: int
- type: enum [like, comment, follow, mention, system] (optional)
- unread_only: boolean (default: false)
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "notifications": [
      {
        "id": "uuid",
        "type": "like",
        "actor": {
          "id": "uuid",
          "username": "jane_doe",
          "avatar_url": "..."
        },
        "entity_type": "post",
        "entity_id": "uuid",
        "content": "liked your post",
        "is_read": false,
        "created_at": "2025-11-24T01:45:00Z"
      }
    ],
    "unread_count": 5,
    "has_more": true
  }
}
```

---

#### PUT /api/notifications/{notification_id}/read
**Description:** Đánh dấu notification đã đọc

**Authentication:** Required

**Response 200:**
```json
{
  "success": true
}
```

---

#### PUT /api/notifications/read-all
**Description:** Đánh dấu tất cả notifications đã đọc

**Authentication:** Required

**Response 200:**
```json
{
  "success": true,
  "data": {
    "marked_count": 15
  }
}
```

---

### 8. Media APIs

#### POST /api/media/upload
**Description:** Upload media files

**Authentication:** Required

**Request:** multipart/form-data
```
- file: File (required)
- type: enum [image, video, audio]
```

**Validation:**
- Images: max 10MB, formats: jpg, png, gif, webp
- Videos: max 100MB, formats: mp4, mov, avi
- Audio: max 20MB, formats: mp3, wav, m4a

**Response 200:**
```json
{
  "success": true,
  "data": {
    "media": {
      "id": "uuid",
      "url": "https://temp-storage.com/uuid.jpg",
      "thumbnail_url": "https://temp-storage.com/thumb_uuid.jpg",
      "type": "image",
      "width": 1920,
      "height": 1080,
      "file_size": 2048576,
      "expires_at": "2025-11-24T02:48:19Z"
    }
  }
}
```

**Error Responses:**
- 400: Invalid file type
- 413: File too large
- 415: Unsupported media type

---

### 9. Search APIs

#### GET /api/search
**Description:** Tìm kiếm posts, users, hashtags

**Authentication:** Required

**Query Parameters:**
```
- q: string (required, min 2 chars)
- type: enum [all, posts, users, hashtags] (default: all)
- offset: int
- limit: int
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "posts": [...],
    "users": [...],
    "hashtags": [...],
    "has_more": {
      "posts": true,
      "users": false,
      "hashtags": true
    }
  }
}
```

---

### Error Response Format

All errors follow this structure:
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable error message",
    "details": {
      "field": "Specific field error"
    }
  }
}
```

**Common Error Codes:**
- `UNAUTHORIZED`: Missing or invalid authentication
- `FORBIDDEN`: Insufficient permissions
- `NOT_FOUND`: Resource not found
- `VALIDATION_ERROR`: Request validation failed
- `RATE_LIMIT_EXCEEDED`: Too many requests
- `INTERNAL_ERROR`: Server error

---