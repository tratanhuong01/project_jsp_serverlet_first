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
        <link rel="stylesheet" href="css/friends.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
        <script src="js/scrollbar1.js"></script>
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
                            <a href=""><img src="<%= user1.getLinkimagebia()%>" alt=""></a>
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
                            <input type="submit" value="Lưu" />
                        </div>
                        <script>
                            function changeBia(event) {
                                var path = URL.createObjectURL(event.target.files[0]);
                                document.getElementById("anhBia").src = path;
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
                        <li><a href="acc?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Dòng thời gian</a></li>
                        <li><a href="about?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Giới Thiệu</a></li>
                        <li><a href="friends?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Bạn Bè</a></li>
                        <li><a href="">Ảnh / Video</a></li>
                    </ul>
                </div>
            </div>
            <div class="profile">
                <div class="wrapper-profile">
                    <div class="friends-top">
                        <div style="font-weight: bold;font-size: 18px;width: 35%;padding: 10px 0px;">
                            <p>Bạn Bè</p>
                        </div>
                        <div style="width: 20%;font-weight: bold;padding: 10px 0px;"><a style="color: #1876F2;" href="">Lời mời kết bạn</a></div>
                        <div class="input-friendss">
                            <form action="" method="post">
                                <input type="text" name="" id="" placeholder="Tìm kiếm">
                                <button type="submit">Tìm bạn bè</button>
                            </form>
                        </div>
                    </div>
                    <div class="friends-bottom">
                        <% List<Users> listUser = userDao.getUserByIDFriend(request.getParameter("ID")); %>
                        <%
                            if (listUser.size() != 0) {
                                for (int i = 0; i < listUser.size(); i++) {
                        %>

                        <div class="friends-bottom-listgeti">
                            <div class="avatar-listgeti">
                                <a href=""><img src="<%= listUser.get(i).getLinkImage()%>" alt=""></a>
                            </div>
                            <div class="number-mutual-friends">
                                <p style="font-family: Arial, Helvetica, sans-serif"><b>
                                        <a style="font-size: 17px;" href="acc?ID=<%= listUser.get(i).getIdUser()%>"
                                           ><%= listUser.get(i).getFirstName() + " " + listUser.get(i).getLastName()%></a></b></p>
                                <p style="color: #65687B;font-size: 14px;"><%= userDao.countMutualFriends(user.getIdUser(), listUser.get(i).getIdUser())%> bạn chung</p>
                            </div>
                            <div class="isFriends">
                                <a href="">Bạn Bè</a>
                            </div>
                        </div>

                        <% }
                    } else {%>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>