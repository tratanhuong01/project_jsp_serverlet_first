<%@page import="StringUtil.StringCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Facebook</title>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/profile.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
        <link rel="stylesheet" href="css/about.css">
        <script src="js/scrollbar1.js"></script>
        <script src="js/clickEventAbout.js"></script>
    </head>

    <body>

        <%@include file="/WEB-INF/modalOfHeader.jspf" %>
        <div id="main">
            <%@include file="/WEB-INF/header.jspf" %>
            <% String id = StringCheck.Check(request.getParameter("ID")); %>
            <% if (!user.getIdUser().equals(id)) {%>
            <% Users user1 = userDao.getUserById(id);%>
            <style>
                #closeEdit {
                    display: none;
                }
                .header-2 {
                    padding-bottom: 1em;
                }
            </style>
            <form action="action">
                <div class="profile">

                    <div class="wrapper-profile">
                        <div class="cover-images cv-img">
                            <a href=""><img src="anhbia.jpg" alt=""></a>
                        </div>
                        <div class="avatar-user">
                            <a href=""><img src="<%= user1.getLinkImage()%>" alt=""></a>
                            <h1><%= user1.getFirstName() + " " + user1.getLastName()%></h1>
                        </div>
                    </div>
                </div>
            </form>
            <% } else {%>
            <div class="profile">
                <div class="wrapper-profile">
                    <form action="ProcessBia" method="post" enctype="multipart/form-data">
                        <div class="cover-images cv-img">
                            <a href=""><img id="anhBia" src="<%= user.getLinkimagebia()%>" alt=""></a>
                        </div>
                        <div id="change-cover-images">
                            <input onchange="changeBia(event)" name="fileBia" type="file" accept="image" id="changeB" style="display: none">
                            <label for="changeB"><i class="fas fa-camera"></i>&nbsp;&nbsp;Chỉnh sửa ảnh bìa</label>
                        </div>
                        <div id="showSubmitBia">
                            <a href="">Hủy</a>
                            <input type="submit" value="Lưu Thay Đổi" />
                        </div>
                        <script>
                            function changeBia(event) {
                                var path = URL.createObjectURL(event.target.files[0]);
                                var showBia = document.getElementById("showSubmitBia");
                                document.getElementById("anhBia").src = path;
                                showBia.style.display = 'block';
                            }
                        </script>
                    </form>
                    <form id="UpdateAvatars" action="UpdateAvatar" method="post" enctype="multipart/form-data">
                        <div class="avatar-user">
                            <a href=""><img id="avatar-main" src="<%= user.getLinkImage()%>" alt=""></a>
                                <div id="change-avatar-images">
                                    <input onchange="changeAvatar(event)" name="files" type="file" accept="image" id="changeavt" style="display: none">
                                    <label for="changeavt"><i class="fas fa-camera"></i></label>
                                </div>
                                <script>
                                    function changeAvatar(event) {
                                        var prepare_post = document.getElementById("prepare-post");
                                        prepare_post.style.display = 'block';
                                        var path = URL.createObjectURL(event.target.files[0]);
                                        document.getElementById("avt-opactity").src = path;
                                        document.getElementById("avt-opactity-none").src = path;
                                    }
                                </script>
                                <div id="prepare-post" style="display: none;">

                                    <div id="prepare-post-top">
                                        <h2>Cập nhật ảnh đại diện</h2>
                                    </div>
                                    <hr>
                                    <br>
                                    <div class="prepare-post-center-1">
                                        <textarea name="content" id="" placeholder="Nhập mô tả"></textarea>
                                    </div>
                                    <div class="prepare-post-center-2">
                                        <div id="pre-post-c-main">
                                            <img id="avt-opactity" src="" alt="">
                                        </div>
                                    </div>
                                    <div id="opactity-post">
                                        <img id="avt-opactity-none" src="" alt="">
                                    </div>
                                    <div class="prepare-posy-submit">
                                        <button>Hủy</button>
                                        <button onclick="load()" style="background-color: #1766F2;color: white;margin-left: 1em;" type="submit">Lưu</button>
                                    </div>
                                </div>
                            <script>
                                function load() {
                                    document.getElementById("UpdateAvatars").submit();
                                    var path = URL.createObjectURL(event.target.files[0]);
                                    document.getElementById("avatar-main").src = path;
                                }
                            </script>
                            <h1><%= user.getFirstName() + " " + user.getLastName()%></h1>
                        </div>
                    </form>
                </div>
            </div>
            <% } %>
            <div class="profile">
                <div class="wrapper-profile header-2">
                    <span>Trying To Achieve The Purpose</span>
                    <br>
                    <div id="closeEdit" style="padding: 10px 0px;">
                        <a style="color: #1876F2;font-size: 19px;padding: 10px 0px;" href="">Chỉnh sửa</a>
                    </div>
                    <br>
                    <hr>
                </div>
            </div>
            <% Users user_main = (Users) session.getAttribute("users");
                if (id.equals(user_main.getIdUser())) { %> %>
            <style>
                .stateFriend {
                    display: none;
                }
            </style>
            <% } %>
            <% String ssss = null; %>
            <% if (userDao.checkStateRequest(id, user_main.getIdUser(), 1) == true) {%>
            <div class="profile">
                <div class="wrapper-profile stateFriend">
                    <div class="stateFriend-1">
                        <p>Hãy theo dõi Tân để xem bài viết công khai của anh ấy trên Bảng tin của bạn.</p>
                    </div>
                    <div class="stateFriend-2">
                        <a id="addFriendButton" href="cancel?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Hủy Lời Mời</a>
                        <a id="FollowButton"  href="">Đã Theo Dõi</a>
                    </div>
                    <hr>
                </div>
            </div>  
            <% } else if (userDao.checkStateRequest(id, user_main.getIdUser(), 2) == true) {%>
            <div class="profile">
                <div class="wrapper-profile stateFriend">
                    <div class="stateFriend-1">
                        <p>Hãy theo dõi Tân để xem bài viết công khai của anh ấy trên Bảng tin của bạn.</p>
                    </div>
                    <div class="stateFriend-2">
                        <a id="FollowButton"  href="accp?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Chấp Nhận Lời Mời</a>
                        <a id="addFriendButton" href="">Xóa Lời Mời</a>
                    </div>
                    <hr>
                </div>
            </div>  
            <% } else if (userDao.checkF(user_main.getIdUser(), id, String.valueOf(3)) == false) {%>
            <div class="profile">
                <div class="wrapper-profile stateFriend">
                    <div class="stateFriend-1">
                        <p>Hãy theo dõi Tân để xem bài viết công khai của anh ấy trên Bảng tin của bạn.</p>
                    </div>
                    <div class="stateFriend-2">
                        <a id="FollowButton"  href="add?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Thêm Bạn Bè</a>
                        <a id="addFriendButton" href="">Theo Dõi</a>
                    </div>
                    <hr>
                </div>
            </div>  
            <% } else if (userDao.checkF(user_main.getIdUser(), id, String.valueOf(3)) == true) { %>
            <div class="profile">
                <div class="wrapper-profile stateFriend">
                    <div class="stateFriend-1">

                    </div>
                    <div class="stateFriend-2">
                        <a id="FollowButton"  href="">Bạn Bè</a>
                    </div>
                    <hr>
                </div>
            </div>  
            <% }%>
            <div class="profile">
                <div class="wrapper-profile">
                    <ul class="list">
                        <li><a href="acc?ID=<%= StringCheck.Check(request.getParameter("ID")) %>">Dòng thời gian</a></li>
                        <li><a href="about?ID=<%= StringCheck.Check(request.getParameter("ID")) %>">Giới Thiệu</a></li>
                        <li><a href="friends?ID=<%= user.getIdUser()%>">Bạn Bè</a></li>
                        <li><a href="">Ảnh / Video</a></li>
                    </ul>
                </div>
            </div>
            <div class="profile">
                <div class="wrapper-profile">
                    <% Users users_about = userDao.getUserById(StringCheck.Check(request.getParameter("ID")));  %>
                    <form action="" method="post">
                        <div class="info">
                            <div class="ho">
                                <label for="">Họ</label><br>
                                <input type="text" name="firstName" placeholder="Họ" value="<%= users_about.getFirstName() %>">
                            </div>
                            <div class="ho">
                                <label for="">Tên</label><br>
                                <input type="text" name="lastName" placeholder="Tên" value="<%= users_about.getLastName() %>">
                            </div>
                            <div class="ho">
                                <label for="">Email</label><br>
                                <input type="email" name="email" placeholder="Email của bạn" value="<%= users_about.getEmail() %>">
                            </div>
                            <div class="ho">
                                <label for="">Số Điện Thoại</label><br>
                                <input type="num" name="numberPhone" placeholder="Số điện thoại của bạn" value="<%= users_about.getNumberPhone() %>">
                            </div>
                            <div class="ho">
                                <label for="">Mật khẩu</label><br>
                                <input type="password" name="pass" placeholder="Mật khẩu mới của bạn">
                            </div>
                            <div class="ho">
                                <label for="">Nhập Lại Mật Khẩu Mới</label><br>
                                <input type="password" name="passnew-again" placeholder="Nhập lại mật khẩu mới của bạn">
                            </div>
                        </div>
                        <div class="ho-ba">
                            <div class="ho-b">
                                <label for="">Giới Tính</label><br>
                                <select style="width: 100%" name="gioiTinh" id="gioiTinh-se">
                                    <option value="" selected="selected"><%= "-" + users_about.getGender() + "-" %></option>
                                    <option value="">Nam</option>
                                    <option value="">Nữ</option>
                                    <option value="">Khác</option>
                                </select>
                            </div>
                            <div class="ho-b">
                                <label for="">Ngày Sinh</label><br>
                                <div class="form_4">
                                    <select onchange="checkYear(this)"name="year" id="year-se">
                                        <option value=""></option>
                                    </select>
                                    <select onchange="checkMonth(this)" name="month" id="month-se">
                                    </select>
                                    <select name="day" id="day-se">
                                        <option value="">Ngày</option>
                                    </select>
                                </div>
                            </div>
                            <div class="ho-b">
                                <label for="">Tình Trạng</label><br>
                                <select style="width: 100%" name="states" id="state-se">
                                    <option value="" selected="selected"><%= "-" + users_about.getState()+ "-" %></option>
                                    <option value="">Độc Thân</option>
                                    <option value="">Đã Kết Hôn</option>
                                    <option value="">Đã Ly Hôn</option>
                                </select>
                            </div>
                        </div>
                        <div class="info">
                            <div class="max-ho">
                                <label for="">Học Tại</label><br>
                                <input type="text" name="education" placeholder="Hiện tại bạn đạng học ở đâu ??"
                                       value="<%= users_about.getEducation() %>">
                            </div>
                            <div class="max-ho">
                                <label for="">Đang Làm Việc Tại</label><br>
                                <input type="text" name="work" placeholder="Hiện tại bạn đạng làm việc ở đâu ??"
                                       value="<%= users_about.getWork() %>">
                            </div>
                            <div class="max-ho">
                                <label for="">Đang Sống Tại</label><br>
                                <input type="text" name="address_user" placeholder="Hiện tại bạn đạng sống ở đâu ??"
                                       value="<%= users_about.getAddress() %> %>">
                            </div>
                        </div>
                        <div style="padding: 1em;text-align: center;">
                            <button style="padding:1em;border-radius: 10px;border: none;background-color: green;
                                    font-weight: bold;color: white;font-size: 15px;" 
                                    type="submit">Cập Nhật Thông Tin</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script language="javascript">
        var day_se = document.getElementById("day-se");
        var month_se = document.getElementById("month-se");
        var year_se = document.getElementById("year-se");
        day_se.disabled = true;
        month_se.disabled = true;
        for (var i = 1920; i <= 2020; i++) {
            var option = document.createElement('option');
            option.innerHTML = i;
            year_se.appendChild(option);
        }
        function checkYear(obj) {
            day_se.disabled = true;
            var y = obj.value;
            if (y === "") {
                month_se.disabled = true;
            } else {
                for (var i = 1; i <= 12; i++) {
                    var option = document.createElement('option');
                    option.innerHTML = "Tháng " + i;
                    month_se.appendChild(option);
                }
                month_se.disabled = false;
            }
        }
        function checkMonth(obj) {
            day_se.disabled = false;
            var y = obj.value;
            if (y == 1 || y == 3 || y == 5 || y == 7 || y == 8 || y == 10 || y == 12) {
                for (var i = 1; i <= 31; i++) {
                    var option = document.createElement('option');
                    option.innerHTML = "Ngày " + i;
                    day_se.appendChild(option);
                }
            } else if (y == 4 || y == 6 || y == 9 || y == 11) {
                for (var i = 1; i <= 31; i++) {
                    var option = document.createElement('option');
                    option.innerHTML = "Ngày " + i;
                    day_se.appendChild(option);
                }
            } else {
                if (year_se.value % 4 == 0) {
                    for (var i = 1; i <= 29; i++) {
                        var option = document.createElement('option');
                        option.innerHTML = "Ngày " +i;
                        day_se.appendChild(option);
                    }
                } else {
                    for (var i = 1; i <= 28; i++) {
                        var option = document.createElement('option');
                        option.innerHTML =  "Ngày " + i;
                        day_se.appendChild(option);
                    }
                }
            }

        }
    </script>
</html>