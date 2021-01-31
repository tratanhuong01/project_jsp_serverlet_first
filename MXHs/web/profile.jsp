
<%@page import="StringUtil.StringCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Facebook</title>
        <link rel="stylesheet" type="text/css"  href="css/header.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/profile.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
        <script src="js/scrollbar.js"></script>

    </head>

    <body>

        <%@include file="/WEB-INF/modalOfHeader.jspf" %>
        <div id="modal-post">
            <form action="" method="post">
                <div id="wrapper-post">
                    <div class="modal-header">
                        <p style="font-size: 25px;font-weight: bold;padding: 10px;">Tạo bài viết</p>
                        <span onclick="closePost()" style="border-radius: 50%;background-color: aliceblue;
                              padding: 4px 12px;font-size: 25px;font-weight: bold;
                              position: absolute;right: 15px;top: 7px;cursor: pointer;">&times;</span>
                        <hr>
                    </div>
                    <div class="modal-mode">
                        <div class="modal-mode-left">
                            <a href=""><img style="width: 50px;height: 50px;border-radius: 50%;padding-top: 5px;"
                                            src="avatar.jpg" alt=""></a>
                        </div>
                        <div class="modal-mode-right">
                            <p style="padding: 5px;">Trà Hưởng</p>
                            <div id="right-ax">
                                <ul>
                                    <li><i class="fas fa-globe-europe"></i></li>
                                    <li><b>&nbsp;Công Khai&nbsp;&nbsp;</b></li>
                                    <li><i style="position: absolute;top: 5px;" class="fas fa-sort-down"></i></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                    <div class="modal-text-post">
                        <textarea id="textarea-post" name="" id="" placeholder="Hưởng ơi, Bạn đang nghĩ gì thế?"></textarea>
                    </div>
                    <div class="modal-footer">
                        <h3 style="padding-left: 10px;">Thêm vào bài viết</h3>
                        <div id="add-post">
                            <div class="add-post-main" style="margin-right:2%">
                                <ul>
                                    <li><i style="color: #9567EF;" class="fas fa-video"></i> &nbsp;&nbsp; <b>Tạo phòng hộp
                                            mặt</b></li>
                                    <li><i style="color: #1771E6;" class="fas fa-user-tag"></i> &nbsp;&nbsp; <b>Gắn thẻ bạn
                                            bè</b></li>
                                    <li><i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                                        &nbsp;&nbsp; <b>Check in</b></li>
                                    <li><i style="color: #28B19E;padding-right: 6px;" class="fas fa-radiation"></i>
                                        &nbsp;&nbsp; <b>GIF</b></li>
                                </ul>
                            </div>
                            <div class="add-post-main">
                                <ul>
                                    <li><i style="color: #45B560;" class="far fa-image"></i> &nbsp;&nbsp; <b>Ảnh / Video</b>
                                    </li>
                                    <li><i style="color: #EAB026;" class="fas fa-smile"></i> &nbsp;&nbsp; <b>Cảm xúc / Hoạt
                                            động</b></li>
                                    <li><i style="color: #E42645;" class="fas fa-video"></i> &nbsp;&nbsp; <b>Video trực
                                            tiếp</b></li>
                                    <li><i style="color: #856CC1;" class="fas fa-eye"></i> &nbsp;&nbsp; <b>Xem chung</b>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="button-post">
                        <button type="submit"><b>Đăng</b></button>
                    </div>
                </div>
            </form>
        </div>
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
                            <a href=""><img src="<%= user1.getLinkimagebia() %>" alt=""></a>
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
                                    <button onclick="load()" style="background-color: #1766F2;color: white;margin-left: 1em;"
                                            type="submit">Lưu</button>
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
            <% }%>            <div class="profile">
                <div class="wrapper-profile">
                    <ul class="list">
                        <li><a href="acc?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Dòng thời gian</a></li>
                        <li><a href="about?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Giới Thiệu</a></li>
                        <li><a href="friends?ID=<%= StringCheck.Check(request.getParameter("ID"))%>">Bạn Bè</a></li>
                        <li><a href="">Ảnh / Video</a></li>
                    </ul>
                </div>
            </div>
            <div class="profile" style="background-color: #F0F2F5;">
                <div class="wrapper-profile wrapper-profile-clone">
                    <div class="intro-user-full">
                        <div class="intro-user">
                            <h2 style="padding-left: 10px;">Giới thiệu</h2>
                            <ul>
                                <li><i class="fas fa-briefcase"></i>&nbsp;&nbsp;
                                    Học tại <b><%= user.getEducation()%></b>
                                </li>
                                <li><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;
                                    Sống tại <b><%= user.getAddress()%></b>
                                </li>
                                <li><i class="fas fa-heart"></i></i>&nbsp;&nbsp;
                                    <b><%= user.getState()%></b>
                                </li>
                                <li><i class="fas fa-clock"></i>&nbsp;&nbsp;
                                    <% String[] arr = user.getTimeCreated().split("-");%>
                                    <b>Đã tham gia facebook vào tháng <%= arr[1]%> năm <%= arr[0]%></b>
                                </li>
                                <li>
                                    <img style="width: 20px;height: 20px;" src="img/follow.png" alt="">&nbsp;&nbsp;
                                    Có &nbsp;<b>501</b>&nbsp; người theo dõi
                                </li>
                            </ul>
                        </div>
                        <div class="list-friends_s" style="margin: 10px;">
                            <div class="list-friends-top">
                                <div style="float: left;margin-top: 10px;margin-right: 10px;">
                                    <b>Ảnh</b><br>
                                </div>
                                <div style="float: right;margin-top: 10px;margin-right: 20px;">
                                    <a href=""><b style="color: #1876F2;">Xem tất cả</b></a>
                                </div>
                            </div>
                            <div class="list-friends-right">
                                <div class="fr-us">
                                    <div>
                                        <a href=""><img src="avatar.jpg" alt=""></a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="list-friends_s" style="margin: 10px;">
                            <div class="list-friends-top">
                                <div style="float: left;">
                                    <b>Bạn bè</b><br>
                                    <b>1.802 người bạn</b>
                                </div>
                                <div style="float: right;margin-top: 10px;margin-right: 10px;">
                                    <a href="friends?ID=<%= request.getParameter("ID")%>"><b style="color: #1876F2;">Xem tất cả</b></a>
                                </div>
                            </div>
                            <div class="list-friends-right">
                                <% List<Users> listUser = userDao.getUserByIDFriend(user.getIdUser()); %>
                                <%
                                    if (listUser.size() != 0) {
                                        for (int i = 0; i < listUser.size(); i++) {
                                %>
                                <div class="fr-us">
                                    <div>
                                        <a href="acc?ID=<%= listUser.get(i).getIdUser()%>"><img src="<%= listUser.get(i).getLinkImage()%>" alt=""></a>
                                    </div>
                                    <div>
                                        <a href="acc?ID=<%= listUser.get(i).getIdUser()%>"><b><%= listUser.get(i).getFirstName() + " " + listUser.get(i).getLastName()%></b></a>
                                    </div>
                                </div>
                                <% }
                                } else { %>

                                <% }%>
                            </div>
                        </div>

                    </div>

                    <div id="update-state">
                        <div class="post-state-top">
                            <div class="state-left">
                                <a href=""><img src="avatar.jpg" alt=""></a>
                            </div>
                            <div class="state-right">
                                <input onclick="openPost()" type="text" placeholder="Hưởng ơi, Bạn Đang Nghĩ Gì Thế?">
                            </div>
                        </div>
                        <hr>
                        <div class="post-state-bottom">
                            <ul>
                                <li><i style="color: #E42645;font-size: 18px;" class="fas fa-video"></i> <b>Video Trực
                                        Tiếp</b></li>
                                <li><i style="color: #41B35D;font-size: 18px;" class="far fa-image"></i> <b>Ảnh / Video</b>
                                </li>
                                <li><i style="color: #F7B928;font-size: 18px;" class="fas fa-smile"></i> <b>Cảm Xúc / Hoạt
                                        Động</b></li>
                            </ul>
                        </div>
                        <div class="friends-post">
                            <div class="friends-post-top">
                                <div class="top-left">
                                    <a href=""><img src="\img\avatarImage\10000000021000000057.jpg" alt=""></a>
                                </div>
                                <div class="top-center">
                                    <p style="margin-bottom: 8px;"><a href=""><b>Trà Hưởng</b></a></p>
                                    <p style="font-size: 13px;"><a href=""><b>22 tháng 8</b></a>
                                        <span id="mode" style="padding-left: 1em;">
                                            <i class="fas fa-globe-europe"></i>
                                        </span>
                                    </p>
                                </div>
                                <div class="top-right">
                                    <i class="fas fa-ellipsis-h"></i>
                                </div>
                            </div>
                            <div class="friends-post-text">
                                <p>Phê 😂😂</p>
                            </div>
                            <div class="friends-post-images">
                                <img src="\img\avatarImage\10000000021000000057.jpg" alt="">
                            </div>
                            <div class="friends-post-feel">
                                <div style="width: 100%;padding: 0px 0px 10px 0px;display: flex;">
                                    <div style="width: 49%;display: flex;padding-left: 1%;">
                                        <i style="font-size: 20px;color: red;cursor: pointer;" class="fas fa-heart"></i>
                                        <strong>&nbsp;<span style="cursor: pointer;">123</span></strong>
                                    </div>
                                    <div style="width: 49%;text-align: right;padding-right: 1%;">

                                        <strong style="cursor: pointer;">&nbsp;<span>12</span>&nbsp;bình luận</strong>
                                    </div>
                                </div>
                                <ul>
                                    <li><i class="fas fa-heart"></i> &nbsp; Tym</li>
                                    <li><i class="far fa-comment-alt"></i> &nbsp; Bình Luận</li>
                                    <li><i class="fas fa-share"></i> &nbsp; Chia Sẽ</li>
                                </ul>
                            </div>
                            <div class="friends-post-coment">
                                <p><a href=""><b>Xem Bình Luận</b></a></p>
                            </div>
                        </div>
                        <div class="friends-post">
                            <div class="friends-post-top">
                                <div class="top-left">
                                    <a href=""><img src="\img\avatarImage\10000000021000000057.jpg" alt=""></a>
                                </div>
                                <div class="top-center">
                                    <p style="margin-bottom: 8px;"><a href=""><b>Trà Hưởng</b></a></p>
                                    <p style="font-size: 13px;"><a href=""><b>22 tháng 8</b></a>
                                        <span id="mode" style="padding-left: 1em;">
                                            <i class="fas fa-globe-europe"></i>
                                        </span>
                                    </p>
                                </div>
                                <div class="top-right">
                                    <i class="fas fa-ellipsis-h"></i>
                                </div>
                            </div>
                            <div class="friends-post-text">
                                <p>Phê 😂😂</p>
                            </div>
                            <div class="friends-post-images">
                                <img src="\img\avatarImage\10000000021000000057.jpg" alt="">
                            </div>
                            <div class="friends-post-feel">
                                <div style="width: 90%;display: flex;padding: 3%;margin-bottom: 4%;margin-left: 4%;border: 1px solid #ccc;background-color: white;">
                                    <div class="top-left">
                                        <a href=""><img src="\img\avatarImage\10000000021000000057.jpg" alt=""></a>
                                    </div>
                                    <div class="top-center">
                                        <p style="margin-bottom: 8px;"><a href=""><b>Trà Hưởng</b></a></p>
                                        <p style="font-size: 13px;"><a href=""><b>22 tháng 8</b></a>
                                            <span id="mode" style="padding-left: 1em;">
                                                <i class="fas fa-globe-europe"></i>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                                <div style="width: 100%;padding: 0px 0px 10px 0px;display: flex;">
                                    <div style="width: 49%;display: flex;padding-left: 1%;">
                                        <i style="font-size: 20px;color: red;cursor: pointer;" class="fas fa-heart"></i>
                                        <strong>&nbsp;<span style="cursor: pointer;">123</span></strong>
                                    </div>
                                    <div style="width: 49%;text-align: right;padding-right: 1%;">

                                        <strong style="cursor: pointer;">&nbsp;<span>12</span>&nbsp;bình luận</strong>
                                    </div>
                                </div>
                                <ul>
                                    <li><i class="fas fa-heart"></i> &nbsp; Tym</li>
                                    <li><i class="far fa-comment-alt"></i> &nbsp; Bình Luận</li>
                                    <li><i class="fas fa-share"></i> &nbsp; Chia Sẽ</li>
                                </ul>
                            </div>
                            <div class="friends-post-coment">
                                <p><a href=""><b>Xem Bình Luận</b></a></p>
                            </div>
                        </div>
                        <div class="friends-post">
                            <div class="friends-post-top">
                                <div class="top-left">
                                    <a href=""><img src="\img\avatarImage\10000000021000000057.jpg" alt=""></a>
                                </div>
                                <div class="top-center">
                                    <p style="margin-bottom: 8px;"><a href=""><b>Trà Hưởng</b></a></p>
                                    <p style="font-size: 13px;"><a href=""><b>22 tháng 8</b></a>
                                        <span id="mode" style="padding-left: 1em;">
                                            <i class="fas fa-globe-europe"></i>
                                        </span>
                                    </p>
                                </div>
                                <div class="top-right">
                                    <i class="fas fa-ellipsis-h"></i>
                                </div>
                            </div>
                            <div class="friends-post-text">
                                <p>Phê 😂😂</p>
                            </div>                           
                            <div class="friends-post-images">
                                <div class="clone-bia-main">
                                    <img class="clone-bia" src="\img\imageBia\10000000021000000058.jpg" alt="">
                                    <img class="clone-avatar" src="\img\avatarImage\10000000021000000057.jpg" alt="">
                                </div>

                            </div>
                            <div class="friends-post-feel">
                                <div style="width: 100%;padding: 0px 0px 10px 0px;display: flex;">
                                    <div style="width: 49%;display: flex;padding-left: 1%;">
                                        <i style="font-size: 20px;color: red;cursor: pointer;" class="fas fa-heart"></i>
                                        <strong>&nbsp;<span style="cursor: pointer;">123</span></strong>
                                    </div>
                                    <div style="width: 49%;text-align: right;padding-right: 1%;">

                                        <strong style="cursor: pointer;">&nbsp;<span>12</span>&nbsp;bình luận</strong>
                                    </div>
                                </div>
                                <ul>
                                    <li><i class="fas fa-heart"></i> &nbsp; Tym</li>
                                    <li><i class="far fa-comment-alt"></i> &nbsp; Bình Luận</li>
                                    <li><i class="fas fa-share"></i> &nbsp; Chia Sẽ</li>
                                </ul>
                            </div>
                            <div class="friends-post-coment">
                                <p><a href=""><b>Xem Bình Luận</b></a></p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>

</html>