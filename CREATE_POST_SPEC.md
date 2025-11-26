# TÀI LIỆU ĐẶC TẢ TÍNH NĂNG ĐĂNG BÀI (CREATE POST)

---

## 1. FUNCTIONAL REQUIREMENTS (FR)

### FR-001: Tạo bài viết mới
**Mô tả:** User có thể tạo một bài viết mới với nội dung text, hashtags, và media (images, videos, audio).

**Chi tiết:**
- User mở màn hình "Create a post" từ bottom sheet
- User có thể nhập nội dung text tự do (multi-line)
- User có thể đính kèm media: ảnh, video, hoặc audio
- User có thể thêm hashtags để phân loại bài viết
- User có thể chọn quyền riêng tư (Public hoặc Only me)
- User nhấn "Post" để đăng bài

**Acceptance Criteria:**
1.  Bài viết phải có ít nhất một trong các thành phần: text, image, video, hoặc audio
2. Bài viết được tạo thành công và hiển thị trong feed
3. Notification được gửi đến followers (nếu là Public)
4. Media được upload thành công lên server

---

### FR-002: Nhập nội dung text
**Mô tả:** User có thể nhập nội dung text cho bài viết. 

**Chi tiết:**
- TextField với placeholder "What's new?"
- Hỗ trợ multi-line text
- Không giới hạn độ dài (hoặc limit theo backend)
- Text hiển thị màu đen, size 15
- Tự động focus khi mở màn hình

**Validation:**
- Cho phép text rỗng nếu có media đính kèm
- Trim whitespace ở đầu và cuối

**Acceptance Criteria:**
1.  User có thể nhập và chỉnh sửa text tự do
2. Text được lưu khi đăng bài thành công

---

### FR-003: Thêm hashtags vào bài viết
**Mô tả:** User có thể thêm hashtags để phân loại và tăng khả năng discover cho bài viết.

**Chi tiết:**
- Hiển thị section "Hot hashtag" ở bottom của màn hình
- Có button "# Thêm chủ đề" màu hồng nhạt để mở màn hình Add hashtag
- Hiển thị các hot hashtags gợi ý: "# Sayhi2025", "# Giao lưu am nhạc"
- User có thể tap vào hot hashtag để thêm vào bài viết
- Hashtags được chọn hiển thị màu primary (E56C8C) bên cạnh user name trong content area
- Hashtags có format: "# <tên hashtag>"

**Sub-requirements:**
- **FR-003.1:** Màn hình Add hashtag
  - Search bar với placeholder "Search for trending hashtags"
  - Danh sách "Hot hashtag" với các trending hashtags
  - User có thể tap để chọn hashtag
  - User có thể search để tìm hashtag cụ thể
  - Sau khi chọn, return về màn hình Create post với hashtag đã chọn

- **FR-003.2:** Hiển thị hashtags đã chọn
  - Hashtags hiển thị inline với text content
  - Màu primary (#E56C8C)
  - Font size 15, weight 400
  - Có thể xóa hashtag đã chọn (TODO: cần design)

**Acceptance Criteria:**
1. User có thể thêm nhiều hashtags vào bài viết
2. Hashtags được lưu cùng bài viết
3. Bài viết có thể được tìm thấy qua hashtag search

---

### FR-004: Thêm ảnh vào bài viết
**Mô tả:** User có thể chọn và đính kèm nhiều ảnh từ thư viện vào bài viết.

**Chi tiết:**
- Button icon gallery (màu xám) để mở image picker
- Hỗ trợ multiple selection
- Giới hạn tối đa 10 ảnh
- Image quality: 100%
- Hiển thị ảnh đã chọn dưới dạng grid 2 cột
- Aspect ratio: 0.75 (portrait)
- Border radius: 12px
- Spacing giữa ảnh: 8px

**Sub-requirements:**
- **FR-004.1:** Preview ảnh đã chọn
  - Hiển thị thumbnail của ảnh
  - Button "X" ở góc trên bên phải để xóa ảnh
  - Button có background đen opacity 0.6, icon trắng, size 18
  - Có thể xóa từng ảnh riêng lẻ

- **FR-004.2:** Upload ảnh
  - Ảnh được upload lên server khi user nhấn "Post"
  - Hiển thị loading indicator trong quá trình upload
  - Xử lý lỗi nếu upload failed

**Validation:**
- Kiểm tra file size (TODO: define limit)
- Kiểm tra format (jpg, png, heic...)
- Tối đa 10 ảnh

**Acceptance Criteria:**
1.  User có thể chọn nhiều ảnh từ gallery
2. Ảnh được preview chính xác trước khi đăng
3. User có thể xóa ảnh đã chọn
4. Ảnh được upload và lưu thành công

---

### FR-005: Thêm video vào bài viết
**Mô tả:** User có thể chọn và đính kèm video từ thư viện vào bài viết.

**Chi tiết:**
- Button icon video (màu xám) để mở video picker
- Hỗ trợ chọn 1 video tại một thời điểm (có thể chọn nhiều videos)
- Giới hạn thời lượng video: tối đa 300 giây (5 phút)
- Hiển thị video đã chọn dưới dạng grid 1 cột
- Aspect ratio: 1:1 hoặc theo video aspect ratio
- Border radius: 12px
- Background: đen

**Sub-requirements:**
- **FR-005.1:** Video player preview
  - Video controller được initialize tự động
  - Hiển thị CircularProgressIndicator màu primary khi đang load
  - Hiển thị video thumbnail khi ready
  - User có thể tap để play/pause video
  - Play/Pause icon overlay (background đen opacity 0.5, icon trắng, size 32)
  - Icon play chỉ hiển thị khi video đang pause

- **FR-005.2:** Xóa video
  - Button "X" ở góc trên bên phải
  - Background đen opacity 0.6, icon trắng, size 18
  - Dispose video controller khi xóa
  - Update indices của các video controllers còn lại

**Validation:**
- Kiểm tra thời lượng video ≤ 300 giây
- Kiểm tra file size (TODO: define limit)
- Kiểm tra format (mp4, mov...)

**Error Handling:**
- Hiển thị SnackBar nếu có lỗi: "Lỗi khi chọn video: <error message>"

**Acceptance Criteria:**
1. User có thể chọn video từ gallery
2. Video được preview với player controls
3. User có thể play/pause video trong preview
4. User có thể xóa video đã chọn
5. Video được upload và lưu thành công

---

### FR-006: Ghi âm và đính kèm audio vào bài viết
**Mô tả:** User có thể ghi âm và đính kèm audio recordings vào bài viết. 

**Chi tiết:**
- Button icon microphone (màu xám) để mở Audio Recorder Bottom Sheet
- User ghi âm trong bottom sheet
- Audio được return về dưới dạng file path và duration
- Hiển thị audio player preview trong content area
- Hỗ trợ nhiều audio recordings

**Sub-requirements:**
- **FR-006.1:** Audio Recorder Bottom Sheet (chi tiết trong spec riêng)
  - Giao diện ghi âm
  - Start/Stop/Pause recording
  - Playback preview
  - Confirm/Cancel

- **FR-006.2:** Audio player preview
  - Container với background xám nhạt, border radius 30
  - Play/Pause button: background đen, icon trắng, size 48
  - Waveform visualization (50 bars)
  - Progress bar dựa trên waveform
  - Time display: current position / total duration
  - Format: MM:SS
  - Button "X" để xóa audio

- **FR-006.3:** Waveform visualization
  - 50 bars với width 3px
  - Bars có height khác nhau tạo wave pattern
  - Bars đã play: màu đen
  - Bars chưa play: màu xám 300
  - User có thể tap vào waveform để seek position

- **FR-006.4:** Audio playback controls
  - Play/Pause toggle
  - Auto pause khi play xong
  - Reset position về 0 khi complete
  - Seek to position khi tap vào waveform

**Validation:**
- Kiểm tra file path hợp lệ
- Kiểm tra file tồn tại
- Xử lý error nếu file không load được

**Error Handling:**
- Hiển thị placeholder UI với text "Audio Recording" và duration nếu có lỗi
- Log error ra console

**Acceptance Criteria:**
1. User có thể ghi âm thành công
2. Audio được preview với player controls
3. User có thể play/pause audio trong preview
4. User có thể seek position bằng cách tap vào waveform
5. User có thể xóa audio đã chọn
6. Audio được upload và lưu thành công

---

### FR-007: Chọn quyền riêng tư cho bài viết
**Mô tả:** User có thể chọn ai có thể xem bài viết: Public hoặc Only me.

**Chi tiết:**
- Dropdown button ở bottom section
- 2 options: "Public" và "Only me"
- Default: Public
- Icon:
  - Public: Icons. public
  - Only me: Icons.lock
- Text mô tả:
  - Public: "Anyone can view your post."
  - Only me: "Only you can view this post."
- Button style: border xám 300, border radius 20, padding 12x6

**Sub-requirements:**
- **FR-007.1:** Privacy dropdown menu
  - Hiển thị menu khi tap vào button
  - 2 items: Public và Only me
  - Mỗi item có icon, text, và check mark nếu được chọn
  - Check mark màu primary
  - Item được chọn có text màu primary và font weight 600
  - Menu có border radius 12

- **FR-007.2:** Cập nhật UI khi chọn
  - Icon button thay đổi theo option
  - Text button thay đổi theo option
  - Text mô tả thay đổi theo option
  - State được lưu trong `_isPublic` boolean

**Acceptance Criteria:**
1. User có thể chọn Public hoặc Only me
2. UI cập nhật chính xác theo lựa chọn
3.  Privacy setting được lưu cùng bài viết
4. Bài viết chỉ hiển thị cho đúng audience

---

### FR-008: Đăng bài viết
**Mô tả:** User hoàn tất và đăng bài viết lên hệ thống.

**Chi tiết:**
- Button "Post" ở góc trên bên phải header
- Background: màu primary (#E56C8C)
- Border radius: 24px
- Padding: 4x4
- Text: "Post", màu trắng, size 16, weight 600
- Button disabled (màu xám) nếu không có content

**Validation trước khi đăng:**
1. Phải có ít nhất một trong các thành phần:
   - Text content (không rỗng sau khi trim)
   - Ít nhất 1 ảnh
   - Ít nhất 1 video
   - Ít nhất 1 audio
2. Nếu có media, kiểm tra files hợp lệ

**Flow khi nhấn Post:**
1.  Validate content
2. Hiển thị loading indicator (TODO: design needed)
3. Upload media files lên server (parallel)
4. Tạo post record với:
   - User ID
   - Text content
   - Hashtags
   - Media URLs
   - Privacy setting
   - Timestamp
5. Gửi notification đến followers (nếu Public)
6. Đóng bottom sheet
7. Refresh feed để hiển thị bài viết mới

**Error Handling:**
- Hiển thị error message nếu upload failed
- Cho phép retry
- Không đóng bottom sheet nếu có lỗi

**Acceptance Criteria:**
1.  Bài viết được tạo thành công
2. Bài viết hiển thị trong feed của user
3. Bài viết hiển thị trong feed của followers (nếu Public)
4.  Media được upload và accessible
5. Notification được gửi đúng audience

---

### FR-009: Hủy tạo bài viết
**Mô tả:** User có thể hủy quá trình tạo bài viết và đóng màn hình.

**Chi tiết:**
- Button "Hủy" ở góc trên bên trái header
- Text màu xám 800, size 17, weight 400
- Khi nhấn: đóng bottom sheet

**Confirmation (nếu có content):**
- Nếu user đã nhập content hoặc chọn media
- Hiển thị dialog xác nhận: "Bạn có chắc muốn hủy?  Nội dung sẽ không được lưu."
- 2 buttons: "Hủy bỏ" và "Tiếp tục chỉnh sửa"

**Cleanup khi đóng:**
- Dispose tất cả video controllers
- Dispose tất cả audio players
- Clear selected images, videos, audios
- Clear text controller

**Acceptance Criteria:**
1. User có thể hủy tạo bài viết
2. Confirmation hiển thị nếu có content
3. Resources được cleanup đúng cách
4. Không có memory leak

---

## 2. NON-FUNCTIONAL REQUIREMENTS (NFR)

### NFR-001: Performance - Upload Media
**Loại:** Performance

**Mô tả:**
- Upload media files phải nhanh và hiệu quả
- Upload multiple files song song (parallel)
- Sử dụng compression cho ảnh và video

**Yêu cầu cụ thể:**
- Ảnh:
  - Resize về max width/height: 1920px (giữ aspect ratio)
  - Compress với quality: 85%
  - Upload time: < 3 giây cho 1 ảnh (với network tốt)
- Video:
  - Compress về max bitrate: 2 Mbps
  - Upload time: < 30 giây cho 1 phút video (với network tốt)
- Audio:
  - Format: M4A hoặc MP3
  - Bitrate: 128 kbps
  - Upload time: < 5 giây cho 1 phút audio

**Hiển thị progress:**
- Loading indicator khi đang upload
- Progress percentage nếu có thể
- Cancel button để hủy upload

---

### NFR-002: Performance - UI Responsiveness
**Loại:** Performance

**Mô tả:**
- UI phải mượt mà, không lag khi scroll hoặc interact
- Video và audio player không làm block UI

**Yêu cầu cụ thể:**
- Frame rate: >= 60 FPS
- Image loading: sử dụng cached_network_image
- Video initialization: không block UI thread
- Audio playback: sử dụng background isolate nếu cần

---

### NFR-003: Security - Media Storage
**Loại:** Security

**Mô tả:**
- Media files được lưu trữ an toàn trên cloud storage
- URLs được signed hoặc có access control

**Yêu cầu cụ thể:**
- Sử dụng Firebase Storage hoặc AWS S3
- Media URLs có expiration time (optional cho public posts)
- Private posts: media chỉ accessible bởi owner
- Scan media files để phát hiện malware (server-side)

---

### NFR-004: Scalability - Media Storage
**Loại:** Scalability

**Mô tả:**
- Hệ thống phải hỗ trợ lưu trữ hàng triệu media files

**Yêu cầu cụ thể:**
- Sử dụng CDN để serve media
- Implement caching strategy
- Lazy load media trong feed
- Cleanup unused media files (orphaned files)

---

### NFR-005: Usability - Input Validation
**Loại:** Usability

**Mô tả:**
- Cung cấp feedback rõ ràng về validation errors
- Giúp user hiểu rõ yêu cầu của hệ thống

**Yêu cầu cụ thể:**
- Error messages phải clear và actionable
- Hiển thị error message bằng tiếng Việt
- Disable "Post" button nếu content không hợp lệ với visual feedback

---

### NFR-006: Accessibility
**Loại:** Accessibility

**Mô tả:**
- Đảm bảo tính năng accessible cho người dùng khuyết tật

**Yêu cầu cụ thể:**
- Tất cả buttons có semantic labels
- Images có alt text
- Sử dụng sufficient color contrast
- Support screen reader

---

## 3. USE CASES

### UC-001: Đăng bài viết với text và hashtags

**Actor:** User (Authenticated)

**Preconditions:**
- User đã đăng nhập
- User có quyền tạo bài viết
- User mở màn hình Create Post

**Main Flow:**
1. User nhấn vào text field "What's new?"
2. System focus vào text field và hiển thị keyboard
3. User nhập nội dung bài viết
4. User nhấn vào "# Thêm chủ đề"
5. System hiển thị màn hình Add hashtag
6. System hiển thị search bar và danh sách Hot hashtags
7. User chọn 1 hoặc nhiều hashtags từ danh sách
8.  System return về màn hình Create Post với hashtags đã chọn
9. System hiển thị hashtags đã chọn bên cạnh user name (màu primary)
10. User review nội dung và hashtags
11. User nhấn button "Post"
12. System validate content (có text hoặc media)
13. System tạo post record với:
    - user_id
    - content text
    - hashtags
    - privacy setting (default: public)
    - created_at timestamp
14. System lưu post vào database
15. System gửi notification đến followers (nếu public)
16. System đóng bottom sheet
17. System refresh feed và hiển thị bài viết mới ở top
18. System hiển thị success message: "Đã đăng bài viết"

**Alternative Flows:**

**AF-001: Content rỗng**
- 12a.  Nếu text rỗng và không có media:
  - System giữ button "Post" ở trạng thái disabled (màu xám)
  - System không cho phép submit
  - Use case continues at step 3

**AF-002: User hủy trong quá trình nhập**
- *a. User nhấn "Hủy" bất kỳ lúc nào:
  - System kiểm tra có content chưa
  - Nếu có content: System hiển thị confirmation dialog
  - User chọn "Hủy bỏ": System đóng màn hình, content bị mất
  - User chọn "Tiếp tục": Use case continues

**AF-003: Network error khi đăng bài**
- 14a.  Nếu có network error:
  - System hiển thị error message: "Không thể đăng bài.  Vui lòng kiểm tra kết nối."
  - System giữ content trong màn hình
  - User có thể retry
  - Use case continues at step 11

**AF-004: User search hashtag**
- 6a. User nhập text vào search bar:
  - System filter danh sách hashtags theo keyword
  - System hiển thị kết quả match
  - User chọn hashtag từ kết quả search
  - Use case continues at step 8

**Postconditions:**
- Bài viết mới được tạo và lưu trong database
- Bài viết hiển thị trong feed của user
- Bài viết hiển thị trong feed của followers (nếu public)
- Followers nhận được notification (nếu public)
- Hashtags được associate với bài viết
- Bài viết có thể được discover qua hashtag

---

### UC-002: Đăng bài viết với ảnh

**Actor:** User (Authenticated)

**Preconditions:**
- User đã đăng nhập
- User có quyền tạo bài viết
- User mở màn hình Create Post
- User có ảnh trong thư viện

**Main Flow:**
1. User nhấn vào icon gallery (icon ảnh)
2. System mở image picker từ thư viện
3.  System cho phép user chọn multiple images (tối đa 10)
4. User chọn 1 hoặc nhiều ảnh
5. User confirm selection trong image picker
6. System đóng image picker
7. System add ảnh vào `_selectedImages` list
8. System hiển thị ảnh trong grid 2 cột với:
   - Aspect ratio 0.75
   - Border radius 12px
   - Spacing 8px
   - Button "X" ở góc trên phải mỗi ảnh
9.  User có thể nhập text content (optional)
10. User có thể thêm hashtags (optional)
11. User review ảnh và content
12. User nhấn button "Post"
13. System validate content (có ảnh)
14. System hiển thị loading indicator
15. System compress ảnh (max 1920px, quality 85%)
16. System upload ảnh lên cloud storage (parallel)
17. System nhận media URLs từ storage
18. System tạo post record với:
    - user_id
    - content text (if any)
    - hashtags (if any)
    - media_urls (array of image URLs)
    - media_type: "image"
    - privacy setting
    - created_at timestamp
19. System lưu post vào database
20. System gửi notification đến followers (nếu public)
21. System đóng bottom sheet
22. System refresh feed và hiển thị bài viết mới
23. System hiển thị success message

**Alternative Flows:**

**AF-001: User xóa ảnh đã chọn**
- 11a. User nhấn button "X" trên ảnh:
  - System xóa ảnh khỏi `_selectedImages` list
  - System update UI, remove ảnh khỏi grid
  - Use case continues at step 9

**AF-002: User chọn quá 10 ảnh**
- 4a.  Nếu user chọn > 10 ảnh:
  - System chỉ lấy 10 ảnh đầu tiên
  - Hoặc system hiển thị message: "Chỉ có thể chọn tối đa 10 ảnh"
  - Use case continues at step 5

**AF-003: Upload ảnh failed**
- 16a. Nếu upload 1 hoặc nhiều ảnh failed:
  - System retry upload (max 3 lần)
  - Nếu vẫn failed:
    - System hiển thị error: "Không thể upload ảnh. Vui lòng thử lại."
    - System cancel quá trình đăng bài
    - System giữ content và ảnh trong màn hình
    - User có thể retry
  - Use case continues at step 12

**AF-004: Image picker bị hủy**
- 5a. User hủy image picker:
  - System đóng image picker
  - System không add ảnh nào
  - Use case continues at step 1

**AF-005: Permission denied**
- 2a.  Nếu app không có quyền truy cập thư viện:
  - System hiển thị permission dialog
  - User grant permission: Use case continues at step 2
  - User deny permission:
    - System hiển thị error: "Cần cấp quyền truy cập thư viện để chọn ảnh"
    - Use case ends

**Postconditions:**
- Bài viết với ảnh được tạo và lưu
- Ảnh được upload và lưu trữ trên cloud
- Bài viết hiển thị trong feed với ảnh
- Media URLs được associate với post
- Ảnh có thể xem được trong post detail

---

### UC-003: Đăng bài viết với video

**Actor:** User (Authenticated)

**Preconditions:**
- User đã đăng nhập
- User có quyền tạo bài viết
- User mở màn hình Create Post
- User có video trong thư viện (thời lượng ≤ 5 phút)

**Main Flow:**
1. User nhấn vào icon video
2. System mở video picker từ thư viện
3.  User chọn 1 video
4. User confirm selection trong video picker
5. System validate thời lượng video ≤ 300 giây
6. System đóng video picker
7. System add video vào `_selectedVideos` list
8. System initialize VideoPlayerController cho video
9. System load video và prepare preview
10. System hiển thị video preview với:
    - Background đen
    - Border radius 12px
    - Aspect ratio theo video
    - CircularProgressIndicator trong quá trình load
11.  Khi video ready:
    - System hiển thị video thumbnail
    - System hiển thị play icon overlay (center)
    - System hiển thị button "X" ở góc trên phải
12. User có thể tap video để play/pause (optional preview)
13. User có thể nhập text content (optional)
14.  User có thể thêm hashtags (optional)
15. User review video và content
16. User nhấn button "Post"
17. System validate content (có video)
18. System hiển thị loading indicator
19. System compress video (max bitrate 2 Mbps)
20. System upload video lên cloud storage
21. System nhận media URL từ storage
22. System tạo post record với:
    - user_id
    - content text (if any)
    - hashtags (if any)
    - media_urls (array with video URL)
    - media_type: "video"
    - video_duration
    - video_thumbnail_url
    - privacy setting
    - created_at timestamp
23.  System lưu post vào database
24. System dispose VideoPlayerController
25. System gửi notification đến followers (nếu public)
26. System đóng bottom sheet
27.  System refresh feed và hiển thị bài viết mới
28. System hiển thị success message

**Alternative Flows:**

**AF-001: Video quá dài**
- 5a. Nếu video duration > 300 giây:
  - System hiển thị error: "Video không được dài quá 5 phút"
  - System không add video
  - Use case continues at step 1

**AF-002: User xóa video đã chọn**
- 15a. User nhấn button "X" trên video:
  - System dispose VideoPlayerController
  - System xóa video khỏi `_selectedVideos` list
  - System update indices của controllers còn lại
  - System update UI, remove video preview
  - Use case continues at step 1

**AF-003: Video initialization failed**
- 8a.  Nếu video controller initialization failed:
  - System log error
  - System hiển thị error message trong preview area
  - System cho phép user xóa video này
  - Use case continues at step 1

**AF-004: Upload video failed**
- 20a. Nếu upload video failed:
  - System retry upload (max 3 lần)
  - Nếu vẫn failed:
    - System hiển thị error: "Không thể upload video.  Vui lòng thử lại."
    - System cancel quá trình đăng bài
    - System giữ content và video trong màn hình
    - User có thể retry
  - Use case continues at step 16

**AF-005: User play/pause video trong preview**
- 12a. User tap vào video:
  - System toggle play/pause video
  - System show/hide play icon overlay
  - Use case continues at step 13

**AF-006: Video picker bị hủy**
- 4a. User hủy video picker:
  - System đóng video picker
  - System không add video
  - Use case continues at step 1

**AF-007: Permission denied**
- 2a. Nếu app không có quyền truy cập thư viện:
  - System hiển thị permission dialog
  - User grant permission: Use case continues at step 2
  - User deny permission:
    - System hiển thị error: "Cần cấp quyền truy cập thư viện để chọn video"
    - Use case ends

**Postconditions:**
- Bài viết với video được tạo và lưu
- Video được upload và lưu trữ trên cloud
- Video thumbnail được generate và lưu
- Bài viết hiển thị trong feed với video player
- Video có thể play được trong post detail
- VideoPlayerController được dispose đúng cách

---

### UC-004: Đăng bài viết với audio

**Actor:** User (Authenticated)

**Preconditions:**
- User đã đăng nhập
- User có quyền tạo bài viết
- User mở màn hình Create Post
- Device có microphone

**Main Flow:**
1. User nhấn vào icon microphone (audio)
2. System hiển thị Audio Recorder Bottom Sheet
3. System request microphone permission (nếu chưa có)
4. User grant microphone permission
5. System initialize audio recorder
6. User nhấn button "Record" để bắt đầu ghi âm
7. System bắt đầu ghi âm và hiển thị:
   - Recording indicator (đỏ, nhấp nháy)
   - Timer đang chạy
   - Waveform visualization real-time
8. User nhấn button "Stop" để dừng ghi âm
9. System dừng ghi âm
10. System save audio file vào temporary storage
11. System hiển thị playback preview với play/pause controls
12. User review audio recording
13. User nhấn "Confirm" để sử dụng audio
14. System return về màn hình Create Post với audio data:
    - filePath: đường dẫn file audio
    - duration: thời lượng audio
15. System đóng Audio Recorder Bottom Sheet
16. System add audio vào `_selectedAudios` list
17. System initialize AudioPlayer cho audio
18. System hiển thị audio player preview với:
    - Background xám nhạt, border radius 30
    - Play/Pause button (đen, icon trắng)
    - Waveform visualization (50 bars)
    - Time display: 00:00 / duration
    - Button "X" để xóa
19. User có thể play/pause audio để kiểm tra (optional)
20. User có thể nhập text content (optional)
21. User có thể thêm hashtags (optional)
22. User review audio và content
23. User nhấn button "Post"
24. System validate content (có audio)
25. System hiển thị loading indicator
26. System upload audio lên cloud storage
27.  System nhận media URL từ storage
28. System tạo post record với:
    - user_id
    - content text (if any)
    - hashtags (if any)
    - media_urls (array with audio URL)
    - media_type: "audio"
    - audio_duration
    - privacy setting
    - created_at timestamp
29. System lưu post vào database
30. System dispose AudioPlayer
31. System delete temporary audio file
32. System gửi notification đến followers (nếu public)
33. System đóng bottom sheet
34. System refresh feed và hiển thị bài viết mới
35. System hiển thị success message

**Alternative Flows:**

**AF-001: User hủy recording**
- 13a. User nhấn "Cancel" trong Audio Recorder:
  - System dừng recording (nếu đang record)
  - System delete temporary audio file
  - System đóng Audio Recorder Bottom Sheet
  - System không add audio
  - Use case continues at step 1

**AF-002: User xóa audio đã chọn**
- 22a. User nhấn button "X" trên audio player:
  - System dispose AudioPlayer
  - System xóa audio khỏi `_selectedAudios` list
  - System update indices của players còn lại
  - System delete temporary audio file
  - System update UI, remove audio preview
  - Use case continues at step 1

**AF-003: Audio file không load được**
- 17a. Nếu audio file path không hợp lệ hoặc file không tồn tại:
  - System set `_hasError = true`
  - System hiển thị placeholder UI với:
    - Icon microphone
    - Text "Audio Recording"
    - Duration
    - Button "X" để xóa
  - System log error
  - Use case continues at step 19

**AF-004: Upload audio failed**
- 26a. Nếu upload audio failed:
  - System retry upload (max 3 lần)
  - Nếu vẫn failed:
    - System hiển thị error: "Không thể upload audio.  Vui lòng thử lại."
    - System cancel quá trình đăng bài
    - System giữ content và audio trong màn hình
    - User có thể retry
  - Use case continues at step 23

**AF-005: User play/pause audio trong preview**
- 19a. User tap vào play button:
  - System toggle play/pause audio
  - System update play icon ↔ pause icon
  - System update waveform progress theo position
  - System update time display
  - Use case continues at step 20

**AF-006: User seek audio position**
- 19b. User tap vào waveform:
  - System calculate position dựa trên tap location
  - System seek audio đến position đó
  - System update waveform progress
  - System update time display
  - Use case continues at step 20

**AF-007: Microphone permission denied**
- 4a. User deny microphone permission:
  - System hiển thị error: "Cần cấp quyền microphone để ghi âm"
  - System đóng Audio Recorder Bottom Sheet
  - Use case ends

**AF-008: Recording initialization failed**
- 5a. Nếu không thể initialize recorder:
  - System hiển thị error: "Không thể khởi tạo ghi âm"
  - System đóng Audio Recorder Bottom Sheet
  - Use case ends

**Postconditions:**
- Bài viết với audio được tạo và lưu
- Audio được upload và lưu trữ trên cloud
- Bài viết hiển thị trong feed với audio player
- Audio có thể play được trong post detail
- AudioPlayer được dispose đúng cách
- Temporary audio file được cleanup

---

### UC-005: Chọn quyền riêng tư cho bài viết

**Actor:** User (Authenticated)

**Preconditions:**
- User đã đăng nhập
- User đang trong màn hình Create Post
- User đã nhập content hoặc chọn media

**Main Flow:**
1. User review privacy setting hiện tại (default: Public)
2. System hiển thị:
   - Text: "Anyone can view your post."
   - Button: icon public + "Public" + arrow down
3. User nhấn vào privacy button
4. System hiển thị dropdown menu với 2 options:
   - "Public" (icon public, check mark nếu đang chọn)
   - "Only me" (icon lock, check mark nếu đang chọn)
5. User chọn "Public" hoặc "Only me"
6. System update `_isPublic` state
7. System đóng dropdown menu
8. System update UI:
   - Button icon: public ↔ lock
   - Button text: "Public" ↔ "Only me"
   - Description text: "Anyone can view your post." ↔ "Only you can view this post."
9. User nhấn "Post" để đăng bài
10. System tạo post với privacy setting đã chọn
11.  Nếu Public:
    - System publish post to followers' feed
    - System gửi notification đến followers
12. Nếu Only me:
    - System chỉ hiển thị post trong profile của user
    - System không gửi notification
13. System đóng bottom sheet
14. System refresh feed

**Alternative Flows:**

**AF-001: User đổi privacy nhiều lần**
- 5a. User chọn option khác:
  - Use case continues at step 6
  - User có thể thay đổi nhiều lần trước khi post

**AF-002: User chọn lại option hiện tại**
- 5a. User chọn option đang active:
  - System đóng menu
  - State không thay đổi
  - Use case continues at step 1

**AF-003: User tap ra ngoài menu**
- 5a. User tap ra ngoài dropdown menu:
  - System đóng menu
  - State không thay đổi
  - Use case continues at step 1

**Postconditions:**
- Privacy setting được lưu với post
- Post chỉ visible cho đúng audience:
  - Public: all users, followers' feed
  - Only me: chỉ owner có thể xem
- Notification chỉ gửi nếu là Public post

---

## 4.  SEQUENCE DIAGRAMS

### SD-001: Đăng bài viết với text và hashtags

```
User -> UI: Nhấn "Create Post"
UI -> System: Mở CreatePostBottomSheet

User -> UI: Nhập text vào TextField
UI -> State: Update _textController

User -> UI: Nhấn "# Thêm chủ đề"
UI -> RouterHelper: pushScreen(AddHashtagScreen)
RouterHelper -> AddHashtagScreen: Navigate

User -> AddHashtagScreen: Chọn hashtag
AddHashtagScreen -> UI: Return hashtag
UI -> State: Add to _selectedHashtags
State -> UI: Update display

User -> UI: Nhấn "Post"
UI -> System: Validate content
System -> System: Check text not empty OR media exists

alt Content hợp lệ
    System -> API: POST /api/posts/create
    API -> Database: Insert post record
    Database -> API: Return post_id
    
    API -> NotificationService: Send to followers
    NotificationService -> Database: Get follower list
    Database -> NotificationService: Return followers
    NotificationService -> FCM: Push notifications
    
    API -> UI: Success response
    UI -> State: Dispose controllers
    UI -> Navigator: Pop bottom sheet
    UI -> FeedScreen: Refresh feed
    FeedScreen -> API: GET /api/posts/feed
    API -> FeedScreen: Return posts (include new post)
    FeedScreen -> UI: Display feed
    UI -> User: Hiển thị success message
else Content không hợp lệ
    System -> UI: Keep "Post" button disabled
end
```

---

### SD-002: Đăng bài viết với ảnh

```
User -> UI: Nhấn icon gallery
UI -> ImageHelper: pickImages(multiple: true, limit: 10)
ImageHelper -> ImagePicker: Pick from gallery
ImagePicker -> User: Show gallery picker

User -> ImagePicker: Chọn ảnh
ImagePicker -> ImageHelper: Return List<XFile>
ImageHelper -> UI: Return images

UI -> State: Add to _selectedImages
State -> UI: Display grid preview

loop For each image
    UI -> FileImage: Load image preview
    FileImage -> UI: Display thumbnail
end

User -> UI: (Optional) Xóa ảnh
UI -> State: Remove from _selectedImages
State -> UI: Update grid

User -> UI: Nhấn "Post"
UI -> System: Validate content
System -> System: Check images. isNotEmpty

alt Content hợp lệ
    UI -> User: Show loading indicator
    
    par Upload images parallel
        loop For each image
            System -> ImageProcessor: Compress image
            ImageProcessor -> System: Return compressed file
            System -> CloudStorage: Upload image
            CloudStorage -> System: Return image URL
        end
    end
    
    System -> API: POST /api/posts/create with media_urls
    API -> Database: Insert post record
    API -> Database: Insert media records
    Database -> API: Return post_id
    
    API -> NotificationService: Send to followers (if public)
    
    API -> UI: Success response
    UI -> State: Clear _selectedImages
    UI -> Navigator: Pop bottom sheet
    UI -> FeedScreen: Refresh feed
    FeedScreen -> UI: Display feed with new post
    UI -> User: Hiển thị success message
else Upload failed
    CloudStorage -> System: Error response
    System -> UI: Show error message
    UI -> User: "Không thể upload ảnh.  Vui lòng thử lại."
    UI -> System: Keep content in screen
end
```

---

### SD-003: Đăng bài viết với video

```
User -> UI: Nhấn icon video
UI -> VideoHelper: pickVideo(maxDuration: 300)
VideoHelper -> ImagePicker: Pick video from gallery
ImagePicker -> User: Show video picker

User -> ImagePicker: Chọn video
ImagePicker -> VideoHelper: Return XFile
VideoHelper -> System: Validate duration

alt Duration <= 300s
    VideoHelper -> UI: Return video
    UI -> State: Add to _selectedVideos
    
    State -> VideoPlayerController: Initialize controller
    VideoPlayerController -> File: Load video file
    File -> VideoPlayerController: Video ready
    VideoPlayerController -> State: Notify initialized
    
    State -> UI: Update display
    UI -> User: Show video preview with play icon
    
    User -> UI: (Optional) Play video
    UI -> VideoPlayerController: play()
    VideoPlayerController -> UI: Update isPlaying state
    UI -> User: Show video playing, hide play icon
    
    User -> UI: Nhấn "Post"
    UI -> System: Validate content
    
    alt Content hợp lệ
        UI -> User: Show loading indicator
        
        System -> VideoProcessor: Compress video
        VideoProcessor -> System: Return compressed file
        
        System -> VideoProcessor: Generate thumbnail
        VideoProcessor -> System: Return thumbnail file
        
        par Upload video and thumbnail
            System -> CloudStorage: Upload video
            CloudStorage -> System: Return video URL
            
            System -> CloudStorage: Upload thumbnail
            CloudStorage -> System: Return thumbnail URL
        end
        
        System -> API: POST /api/posts/create
        Note right of API: Include video_url,\nthumbnail_url,\nduration
        
        API -> Database: Insert post record
        API -> Database: Insert media record
        Database -> API: Return post_id
        
        API -> NotificationService: Send to followers (if public)
        
        API -> UI: Success response
        
        UI -> State: Dispose VideoPlayerController
        UI -> State: Clear _selectedVideos
        UI -> Navigator: Pop bottom sheet
        UI -> FeedScreen: Refresh feed
        UI -> User: Hiển thị success message
    else Upload failed
        CloudStorage -> System: Error response
        System -> UI: Show error message
        UI -> System: Keep content in screen
    end
else Duration > 300s
    VideoHelper -> UI: Return error
    UI -> User: Show error "Video không được dài quá 5 phút"
end
```

---

### SD-004: Đăng bài viết với audio

```
User -> UI: Nhấn icon microphone
UI -> System: Show AudioRecorderBottomSheet
System -> PermissionHandler: Request microphone permission

alt Permission granted
    System -> AudioRecorder: Initialize recorder
    
    User -> UI: Nhấn "Record"
    UI -> AudioRecorder: startRecording()
    AudioRecorder -> UI: Update recording state
    
    loop While recording
        AudioRecorder -> UI: Update timer
        AudioRecorder -> UI: Update waveform
    end
    
    User -> UI: Nhấn "Stop"
    UI -> AudioRecorder: stopRecording()
    AudioRecorder -> FileSystem: Save audio file
    FileSystem -> AudioRecorder: Return file path
    
    AudioRecorder -> AudioPlayer: Initialize for playback
    User -> UI: Review audio (play/pause)
    
    User -> UI: Nhấn "Confirm"
    UI -> CreatePostBottomSheet: Return audio data
    Note right of UI: {filePath, duration}
    
    CreatePostBottomSheet -> State: Add to _selectedAudios
    State -> AudioPlayer: Initialize player
    AudioPlayer -> File: Load audio file
    
    alt File valid
        File -> AudioPlayer: Audio ready
        AudioPlayer -> State: Notify initialized
        State -> UI: Display audio player preview
        
        User -> UI: (Optional) Play audio
        UI -> AudioPlayer: play()
        
        loop While playing
            AudioPlayer -> UI: Update position
            UI -> UI: Update waveform progress
            UI -> UI: Update time display
        end
        
        User -> UI: Nhấn "Post"
        UI -> System: Validate content
        
        alt Content hợp lệ
            UI -> User: Show loading indicator
            
            System -> CloudStorage: Upload audio file
            CloudStorage -> System: Return audio URL
            
            System -> API: POST /api/posts/create
            Note right of API: Include audio_url,\nduration
            
            API -> Database: Insert post record
            API -> Database: Insert media record
            Database -> API: Return post_id
            
            API -> NotificationService: Send to followers (if public)
            
            API -> UI: Success response
            
            UI -> State: Dispose AudioPlayer
            UI -> State: Clear _selectedAudios
            UI -> FileSystem: Delete temp audio file
            UI -> Navigator: Pop bottom sheet
            UI -> FeedScreen: Refresh feed
            UI -> User: Hiển thị success message
        else Upload failed
            CloudStorage -> System: Error response
            System -> UI: Show error message
            UI -> System: Keep content in screen
        end
    else File invalid
        File -> State: Error
        State -> UI: Display error placeholder
        UI -> User: Show "Audio Recording" with duration
    end
else Permission denied
    PermissionHandler -> UI: Permission denied
    UI -> User: Show error "Cần cấp quyền microphone để ghi âm"
    UI -> System: Close AudioRecorderBottomSheet
end
```

---

### SD-005: Chọn quyền riêng tư

```
User -> UI: Review post content
UI -> User: Display current privacy (default: Public)
Note right of UI: "Anyone can view your post. "\nButton: Public ↓

User -> UI: Nhấn privacy button
UI -> System: Show privacy dropdown menu

System -> UI: Display menu
Note right of UI: Options:\n- Public (✓ if selected)\n- Only me (✓ if selected)

User -> UI: Chọn option
UI -> State: Update _isPublic

alt Public selected
    State -> State: _isPublic = true
    State -> UI: Update display
    Note right of UI: Icon: public\nText: "Public"\nDescription: "Anyone can view your post."
else Only me selected
    State -> State: _isPublic = false
    State -> UI: Update display
    Note right of UI: Icon: lock\nText: "Only me"\nDescription: "Only you can view this post."
end

UI -> System: Close dropdown menu

User -> UI: Nhấn "Post"
UI -> System: Create post with privacy setting

alt Public post
    System -> API: POST /api/posts/create (is_public: true)
    API -> Database: Insert with is_public = true
    API -> NotificationService: Send to followers
    NotificationService -> Database: Get follower list
    loop For each follower
        NotificationService -> FCM: Push notification
    end
    API -> FeedService: Add to followers' feed
else Private post (Only me)
    System -> API: POST /api/posts/create (is_public: false)
    API -> Database: Insert with is_public = false
    API -> System: Skip notification
    API -> System: Only add to owner's profile
end

API -> UI: Success response
UI -> Navigator: Pop bottom sheet
UI -> FeedScreen: Refresh feed
```

---

## 5. DATABASE DESIGN & ARCHITECTURE

### 5.1.  Database Design / Data Model

#### Table: posts

Lưu trữ thông tin bài viết

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| post_id | UUID | PRIMARY KEY | ID duy nhất của bài viết |
| user_id | UUID | NOT NULL, FOREIGN KEY (users.user_id) | ID của user tạo bài viết |
| content | TEXT | NULLABLE | Nội dung text của bài viết |
| is_public | BOOLEAN | NOT NULL, DEFAULT true | Quyền riêng tư (true: Public, false: Only me) |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian tạo bài viết |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian cập nhật cuối |
| deleted_at | TIMESTAMP | NULLABLE | Soft delete timestamp |
| media_count | INTEGER | DEFAULT 0 | Số lượng media đính kèm |
| like_count | INTEGER | DEFAULT 0 | Số lượng likes |
| comment_count | INTEGER | DEFAULT 0 | Số lượng comments |
| view_count | INTEGER | DEFAULT 0 | Số lượng views |

**Indexes:**
- `idx_posts_user_id` on `user_id`
- `idx_posts_created_at` on `created_at DESC`
- `idx_posts_is_public` on `is_public`
- `idx_posts_deleted_at` on `deleted_at` (for soft delete queries)

---

#### Table: post_media

Lưu trữ media files đính kèm bài viết

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| media_id | UUID | PRIMARY KEY | ID duy nhất của media |
| post_id | UUID | NOT NULL, FOREIGN KEY (posts.post_id) | ID của bài viết |
| media_type | ENUM | NOT NULL | Loại media: 'image', 'video', 'audio' |
| media_url | TEXT | NOT NULL | URL của media file |
| thumbnail_url | TEXT | NULLABLE | URL của thumbnail (cho video) |
| duration | INTEGER | NULLABLE | Thời lượng (seconds) cho video/audio |
| width | INTEGER | NULLABLE | Chiều rộng (cho image/video) |
| height | INTEGER | NULLABLE | Chiều cao (cho image/video) |
| file_size | BIGINT | NULLABLE | Kích thước file (bytes) |
| mime_type | VARCHAR(100) | NULLABLE | MIME type của file |
| display_order | INTEGER | NOT NULL, DEFAULT 0 | Thứ tự hiển thị |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian tạo |

**Indexes:**
- `idx_post_media_post_id` on `post_id`
- `idx_post_media_type` on `media_type`
- `idx_post_media_display_order` on `display_order`

---

#### Table: post_hashtags

Bảng trung gian liên kết posts và hashtags (many-to-many)

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| post_id | UUID | NOT NULL, FOREIGN KEY (posts. post_id) | ID của bài viết |
| hashtag_id | UUID | NOT NULL, FOREIGN KEY (hashtags. hashtag_id) | ID của hashtag |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian add hashtag |

**Primary Key:** Composite key (`post_id`, `hashtag_id`)

**Indexes:**
- `idx_post_hashtags_post_id` on `post_id`
- `idx_post_hashtags_hashtag_id` on `hashtag_id`

---

#### Table: hashtags

Lưu trữ danh sách hashtags

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| hashtag_id | UUID | PRIMARY KEY | ID duy nhất của hashtag |
| hashtag_name | VARCHAR(255) | NOT NULL, UNIQUE | Tên hashtag (không có #) |
| usage_count | INTEGER | DEFAULT 0 | Số lần hashtag được sử dụng |
| is_trending | BOOLEAN | DEFAULT false | Có phải trending hashtag không |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian tạo |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian cập nhật |

**Indexes:**
- `idx_hashtags_name` on `hashtag_name`
- `idx_hashtags_trending` on `is_trending`
- `idx_hashtags_usage_count` on `usage_count DESC`

---

#### Table: user_feed

Lưu trữ feed của mỗi user (denormalized for performance)

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| feed_id | UUID | PRIMARY KEY | ID duy nhất |
| user_id | UUID | NOT NULL, FOREIGN KEY (users.user_id) | ID của user nhận feed |
| post_id | UUID | NOT NULL, FOREIGN KEY (posts.post_id) | ID của bài viết |
| author_id | UUID | NOT NULL, FOREIGN KEY (users.user_id) | ID của người đăng bài |
| created_at | TIMESTAMP | NOT NULL | Timestamp của bài viết |
| added_to_feed_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian add vào feed |

**Indexes:**
- `idx_user_feed_user_id_created_at` on `(user_id, created_at DESC)`
- `idx_user_feed_post_id` on `post_id`

**Note:** Bảng này được populate khi:
- User tạo public post → add vào feed của tất cả followers
- User follow người khác → backfill recent posts vào feed

---

#### Table: post_notifications

Lưu trữ notifications cho bài viết mới

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| notification_id | UUID | PRIMARY KEY | ID duy nhất |
| recipient_user_id | UUID | NOT NULL, FOREIGN KEY (users.user_id) | ID của user nhận notification |
| post_id | UUID | NOT NULL, FOREIGN KEY (posts.post_id) | ID của bài viết |
| author_id | UUID | NOT NULL, FOREIGN KEY (users.user_id) | ID của người đăng bài |
| notification_type | VARCHAR(50) | NOT NULL | Loại: 'new_post' |
| is_read | BOOLEAN | DEFAULT false | Đã đọc chưa |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | Thời gian tạo |
| read_at | TIMESTAMP | NULLABLE | Thời gian đọc |

**Indexes:**
- `idx_notifications_recipient_created_at` on `(recipient_user_id, created_at DESC)`
- `idx_notifications_is_read` on `is_read`
- `idx_notifications_post_id` on `post_id`

---

### 5.2. API Design

#### POST /api/posts/create

Tạo bài viết mới

**Authentication:** Required (Bearer token)

**Request:**

```json
{
  "content": "I'm back, everyone!",
  "hashtags": ["Làm quen nha", "Sayhi2025"],
  "media": [
    {
      "media_type": "image",
      "media_url": "https://storage.example.com/images/abc123.jpg",
      "width": 1920,
      "height": 1080,
      "file_size": 524288,
      "mime_type": "image/jpeg",
      "display_order": 0
    },
    {
      "media_type": "video",
      "media_url": "https://storage.example.com/videos/def456.mp4",
      "thumbnail_url": "https://storage. example.com/thumbnails/def456_thumb.jpg",
      "duration": 120,
      "width": 1920,
      "height": 1080,
      "file_size": 10485760,
      "mime_type": "video/mp4",
      "display_order": 1
    },
    {
      "media_type": "audio",
      "media_url": "https://storage.example.com/audios/ghi789.m4a",
      "duration": 60,
      "file_size": 1048576,
      "mime_type": "audio/mp4",
      "display_order": 2
    }
  ],
  "is_public": true
}
```

**Validation:**
- `content`: optional, max 5000 characters
- `hashtags`: optional, array of strings, max 10 hashtags, mỗi hashtag max 50 characters
- `media`: optional, array, max 10 items
- `is_public`: required, boolean
- Phải có ít nhất một trong: `content` (not empty) hoặc `media` (not empty)

**Response 201 Created:**

```json
{
  "success": true,
  "data": {
    "post_id": "550e8400-e29b-41d4-a716-446655440000",
    "user_id": "660e8400-e29b-41d4-a716-446655440001",
    "content": "I'm back, everyone!",
    "is_public": true,
    "created_at": "2025-11-26T19:02:00Z",
    "updated_at": "2025-11-26T19:02:00Z",
    "media_count": 3,
    "like_count": 0,
    "comment_count": 0,
    "view_count": 0,
    "hashtags": [
      {
        "hashtag_id": "770e8400-e29b-41d4-a716-446655440002",
        "hashtag_name": "Làm quen nha"
      },
      {
        "hashtag_id": "880e8400-e29b-41d4-a716-446655440003",
        "hashtag_name": "Sayhi2025"
      }
    ],
    "media": [
      {
        "media_id": "990e8400-e29b-41d4-a716-446655440004",
        "media_type": "image",
        "media_url": "https://storage.example.com/images/abc123.jpg",
        "display_order": 0
      },
      {
        "media_id": "aa0e8400-e29b-41d4-a716-446655440005",
        "media_type": "video",
        "media_url": "https://storage.example.com/videos/def456.mp4",
        "thumbnail_url": "https://storage.example.com/thumbnails/def456_thumb.jpg",
        "duration": 120,
        "display_order": 1
      },
      {
        "media_id": "bb0e8400-e29b-41d4-a716-446655440006",
        "media_type": "audio",
        "media_url": "https://storage.example.com/audios/