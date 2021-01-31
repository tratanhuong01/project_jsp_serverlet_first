<%@page import="model.Ads"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Facebook</title>
        <link rel="stylesheet" type="text/css"  href="css/header.css">
        <link rel="stylesheet" type="text/css" href="css/main_index.css">
        <link rel="stylesheet" type="text/css" href="css/add.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
        <script src="js/scrollbar.js"></script>
        <style>
            * {
                font-family: 'Lato', sans-serif;
            }
        </style>
    </head>

    <body>
        <%@include file="/WEB-INF/modalOfHeader.jspf" %>

        <div id="main">
            <%@include file="/WEB-INF/header.jspf" %>
            <%    ArrayList list = userDao.getUsersRequestById(user.getIdUser());%>
            <div id="content">
                <div class="content-left">
                    <div id="wrapper-scrollbar">
                        <div class="content-left-main">
                            <ul>
                                <li style="display: flex;"><img style="width: 35px;height: 35px;border-radius: 50%;"
                                                                src="<%= user.getLinkImage()%>" alt="">&nbsp;&nbsp;
                                    <span style="padding-left: 10px;padding-top: 10px;"><%= user.getFirstName() + " " + user.getLastName()%></span></li>
                                <li><i style="color: #E5632A;" class="fas fa-hat-wizard"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 10px;">Trang</span></li>
                                <li><i style="color: #41B35D;" class="fas fa-user-friends"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 4px;">Bạn Bè</span></li>
                                <li><i style="color: #21A0EF;" class="fab fa-facebook-messenger"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 14px;">Messenger</span></li>
                                <li><i style="color: #23A5F0;" class="fas fa-layer-group"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 10px;">Nhóm</span></li>
                            </ul>
                        </div>
                        <br>
                        <hr style="width: 70%;">
                        <br>
                        <h4 style="margin-left: 1em;">Lối tắt của bạn</h4>
                        <br>
                        <div class="content-left-main">
                            <ul>
                                <li style="display: flex;"><img style="width: 35px;height: 35px;border-radius: 50%;"
                                                                src="<%= user.getLinkImage()%>" alt="">&nbsp;&nbsp;
                                    <span style="padding-left: 10px;padding-top: 10px;"><%= user.getFirstName() + " " + user.getLastName()%></span></li>
                                <li><i style="color: #E5632A;" class="fas fa-hat-wizard"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 10px;">Trang</span></li>
                                <li><i style="color: #41B35D;" class="fas fa-user-friends"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 4px;">Bạn Bè</span></li>
                                <li><i style="color: #21A0EF;" class="fab fa-facebook-messenger"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 14px;">Messenger</span></li>
                                <li><i style="color: #23A5F0;" class="fas fa-layer-group"></i>&nbsp;&nbsp;
                                    <span style="padding-left: 10px;">Nhóm</span></li>
                            </ul>
                        </div>
                        <br>
                    </div>
                </div>
                <div class="content-center">
                    <div class="story-view">
                        <div class="story-clone">
                            <div style="width: 100%;">
                                <img style="width: 110px;height: 137px;border-radius: 10px;object-fit: cover;"
                                     src="<%= user.getLinkImage()%>" alt="">
                            </div>
                            <div style="width: 100%;background-color: white;height: 42px;">
                                <div style="width: 35px;height: 35px;border-radius: 50%;background-color: #3A80DC;
                                     border: 4px solid white;position: absolute;bottom: 35px;left: 43px;">
                                    <i style="padding-top: 10px;color: white;" class="fas fa-plus"></i>
                                </div>
                                <br> 
                                <p style="text-align: center;">Tạo Tin</p>
                            </div>

                        </div>
                        <div class="story-clone">
                            <div class="clone-first">
                                <img style="width: 100%;height: 182px;object-fit: cover;" src="img/avatar.jpg" alt="">
                            </div>
                            <div class="clone-second">
                                <a href=""><b style="color: white;">Trà Hưởng</b></a>
                            </div>
                            <div class="clone-third">
                                <img src="img/avatar.jpg" alt="">
                            </div>
                        </div>
                        <div class="story-clone">
                            <div class="clone-first">
                                <img style="width: 100%;height: 182px;object-fit: cover;" src="img/avatar.jpg" alt="">
                            </div>
                            <div class="clone-second">
                                <a href=""><b style="color: white;">Trà Hưởng</b></a>
                            </div>
                            <div class="clone-third">
                                <img src="img/avatar.jpg" alt="">
                            </div>
                        </div>
                        <div class="story-clone">
                            <div class="clone-first">
                                <img style="width: 100%;height: 182px;object-fit: cover;" src="img/avatar.jpg" alt="">
                            </div>
                            <div class="clone-second">
                                <a href=""><b style="color: white;">Trà Hưởng</b></a>
                            </div>
                            <div class="clone-third">
                                <img src="img/avatar.jpg" alt="">
                            </div>
                        </div>
                        <div class="story-clone">
                            <div class="clone-first">
                                <img style="width: 100%;height: 182px;object-fit: cover;" src="img/avatar.jpg" alt="">
                            </div>
                            <div class="clone-second">
                                <a href=""><b style="color: white;">Trà Hưởng</b></a>
                            </div>
                            <div class="clone-third">
                                <img src="img/avatar.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div id="update-state">
                        <div class="post-state-top">
                            <div class="state-left">
                                <a href=""><img src="<%= user.getLinkImage()%>"></a>
                            </div>
                            <div class="state-right">
                                <input onclick="openPost()" type="text" placeholder="<%= user.getLastName()%> ơi, Bạn Đang Nghĩ Gì Thế?">
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
                    </div>
                    <div class="friends-post">
                        <div class="friends-post-top">
                            <div class="top-left">
                                <a href=""><img src="<%= user.getLinkImage()%>"></a>

                            </div>
                            <div class="top-center">
                                <p style="margin-bottom: 8px;"><a href=""><b>Trà Hưởng</b></a></p>
                                <p style="font-size: 13px;"><a href=""><b>Vừa Xong</b></a></p>
                                <span id="mode">
                                    <i class="fas fa-globe-europe"></i>
                                </span>
                            </div>
                            <div class="top-right">
                                <i class="fas fa-ellipsis-h"></i>
                            </div>
                        </div>
                        <div class="friends-post-text">
                            <p>Phê 😂😂</p>
                        </div>
                        <div class="friends-post-images">
                            <img src="<%= user.getLinkImage()%>" alt="">
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
                <div class="content-right">
                    <div id="content-right-ok" style="width: 100%;display: flex;">
                        <div id="null-ads">

                        </div>
                        <% List<Ads> listAds = userDao.getAds(); %>
                        <div class="wrapper-content-right">
                            <div id="ads">
                                <br>
                                <h4>Được tài trợ</h4>
                                <% for (int i = 0; i < listAds.size(); i++) {%>
                                <div class="info-ads">
                                    <a href="<%= listAds.get(i).getLinkWebAds()%>"><img src="<%= listAds.get(i).getImgAds()%>" alt=""></a>
                                    <div style="display: block;margin: 3em 10px;">
                                        <span><a href="<%= listAds.get(i).getLinkWebAds()%>"><%= listAds.get(i).getNameAds()%></a></span> <br>
                                        <span><a style="font-size: 12px;" href="<%= listAds.get(i).getLinkWebAds()%>"><%= listAds.get(i).getLinkWebAds()%></a></span>
                                    </div>
                                </div>
                                <% } %>
                                <hr style="margin: 10px auto;width: 90%;">
                            </div>
                            <br>

                            <% if (list.size() != 0 && list != null) {%>
                            <% Users u = userDao.getUserById(list.get(0).toString());%>
                            <div id="friend-request">
                                <div class="friends-request-top">
                                    <span style="float: left;">
                                        <b>Lời mời kết bạn</b>
                                    </span>
                                    <span style="float: right;">
                                        <a href=""><b>Xem tất cả</b></a>
                                    </span>
                                </div>

                                <div class="infor-user-request">
                                    <div class="user-request-left">
                                        <a href=""><img src="<%= u.getLinkImage()%>" alt=""></a>
                                    </div>
                                    <div class="user-request-right">
                                        <div style="width: 100%;">
                                            <span style="float: left;padding-left: 10px;font-weight: bold;">
                                                <a href="acc?ID=<%= u.getIdUser()%>"><%= u.getFirstName() + " " + u.getLastName()%></a></span>
                                            <span style="float: right;">2 ngày</span>
                                        </div>
                                        <div style="width: 100%;display: flex;padding: 10px 0px;font-size: 15px;font-weight: bold;">
                                            <span style="background-color: #1877F2;width: 45%;text-align: center;
                                                  height: 40px;line-height: 40px;border-radius: 10px;margin-right: 2.5%;
                                                  margin-left: 2.5%;cursor: pointer;">
                                                <a style="color: white;" href="">Xác Nhận</a>
                                            </span>
                                            <span style="background-color: #D8DADF;width: 45%;text-align: center;
                                                  height: 40px;line-height: 40px;border-radius: 10px;margin-right: 2.5%;
                                                  margin-left: 2.5%;cursor: pointer;">
                                                <a  style="color: black;" href="">Xóa</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <hr style="margin: 10px auto;width: 90%;">
                                <br>
                            </div>
                            <% } else { %>

                            <% }%>
                            <div id="birthday">
                                <div class="friends-request-top">
                                    <span style="float: left;">
                                        <b>Sinh nhật</b>
                                    </span>
                                </div>
                                <div class="birthday-mess">
                                    <div class="birthday-mess-left">
                                        <i class="fas fa-gift"></i>
                                    </div>
                                    <div class="birthday-mess-right">
                                        <span>Hôm nay là sinh nhật của <b>Nguyễn</b> và <b>6 người bạn khác</b></span>
                                    </div>
                                </div>
                                <br>
                                <hr style="margin: 10px auto;width: 90%;">

                            </div>
                            <div id="list-active-user">
                                <div class="friends-request-top">
                                    <span style="float: left;padding: 10px 0px;">
                                        <b>Bạn Bè</b>
                                    </span>
                                    <span style="float: right;">
                                        <ul class="header-list-active">
                                            <li><i class="fas fa-video"></i></li>
                                            <li><i class="fab fa-searchengin"></i></li>
                                            <li><i class="fas fa-ellipsis-h"></i></li>
                                        </ul>
                                    </span>
                                </div>
                                <% List<Users> listUser = userDao.getUserByIDFriend(user.getIdUser()); %>
                                <%
                                    if (listUser.size() != 0) {
                                        for (int i = 0; i < listUser.size(); i++) {
                                %>
                                <div class="user-active">
                                    <div style="width: 15%;position: relative;">
                                        <a href=""><img style="width: 40px;height: 40px;border-radius: 50%;"
                                                        src="<%= listUser.get(i).getLinkImage()%>" alt=""></a>
                                        <i style="position: absolute;color: #349C4C;font-size: 11px;
                                           bottom: 5px;right: 8px;border: 3px solid white;border-radius: 50%;" 
                                           class="fas fa-circle"></i>
                                    </div>
                                    <div style="width: 85%;padding-top: 10px;">
                                        <b><%= listUser.get(i).getFirstName() + " " + listUser.get(i).getLastName()%></b>
                                    </div>
                                </div>
                                <% }
                                } else {%>
                                <% }%>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                                            src="<%= user.getLinkImage()%>" alt=""></a>
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
                        <ul class="add-postaaa">
                            <li onclick="openModal1()" style="padding-right: 1em;"><h3 style="padding-left: 10px;">Thêm vào bài viết</h3></li>
                            <li><i style="color: #9567EF;" class="fas fa-video"></i> &nbsp;&nbsp;</li>
                            <li><i style="color: #45B560;" class="far fa-image"></i> &nbsp;&nbsp;</li>
                            <li><i style="color: #1771E6;" class="fas fa-user-tag"></i> &nbsp;&nbsp;</li>
                            <li onclick="openModal2()"><i style="color: #EAB026;" class="fas fa-smile"></i> &nbsp;&nbsp;</li>
                            <li><i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i></li>
                            <li><i class="fas fa-ellipsis-h"></i></li>
                        </ul>
                    </div>
                    <div class="button-post">
                        <button type="submit"><b>Đăng</b></button>
                    </div>
                </div>
                <div class="add-post" id="modal-create-post">
                    <h2 style="padding: 10px;display: block;text-align: center;">Thêm vào bài viết</h2>
                    <span onclick="closeModal1()" style="font-size: 35px;font-weight: bold;position: absolute;top: 6px;"><i class="fas fa-arrow-circle-left"></i></span>
                    <div style="width: 100%;display: flex;">
                        <div class="add-post-main" style="margin-right:2%">
                            <ul>
                                <li><i style="color: #9567EF;" class="fas fa-video"></i> &nbsp;&nbsp; <b>Tạo phòng hộp mặt</b></li>
                                <li><i style="color: #1771E6;" class="fas fa-user-tag"></i> &nbsp;&nbsp; <b>Gắn thẻ bạn bè</b></li>
                                <li><i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i> &nbsp;&nbsp; <b>Check in</b></li>
                                <li><i style="color: #28B19E;padding-right: 6px;" class="fas fa-radiation"></i> &nbsp;&nbsp; <b>GIF</b></li>
                            </ul>
                        </div>
                        <div class="add-post-main">
                            <ul>
                                <li><i style="color: #45B560;" class="far fa-image"></i> &nbsp;&nbsp; <b>Ảnh / Video</b></li>
                                <li><i style="color: #EAB026;" class="fas fa-smile"></i> &nbsp;&nbsp; <b>Cảm xúc / Hoạt động</b></li>
                                <li><i style="color: #E42645;" class="fas fa-video"></i> &nbsp;&nbsp; <b>Video trực tiếp</b></li>
                                <li><i style="color: #856CC1;" class="fas fa-eye"></i> &nbsp;&nbsp; <b>Xem chung</b></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="add-post" id="modal-feel">
                    <h2 style="padding: 10px;display: block;text-align: center;">Bạn đang cảm thấy thế nào ?</h2>
                    <span onclick="closeModal2()" style="font-size: 35px;font-weight: bold;position: absolute;top: 6px;"><i class="fas fa-arrow-circle-left"></i></span>
                    <hr>
                    <br>
                    <div id="feel-user">
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1">
                                <img src="https://static.xx.fbcdn.net/rsrc.php/v3/yt/r/FV89MgMcSAE.png" alt="">
                            </div>
                            <div class="feel-user-2">
                                <b>Hạnh Phúc</b>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="add-post" id="modal-local">
                    <h2 style="padding: 10px;display: block;text-align: center;">Tìm kiếm vị trí</h2>
                    <span style="font-size: 35px;font-weight: bold;position: absolute;top: 6px;"><i class="fas fa-arrow-circle-left"></i></span>
                    <hr>
                    <div id="input-search-local">
                        <input type="text" placeholder="Bạn đang ở đâu ?">
                    </div>
                    <div id="local-user">
                        <div class="feel-user-clone">
                            <div class="feel-user-1" style="text-align: center;">
                                <i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feel-user-2" style="padding-top: 1%;padding-left: 0%;">
                                <p>Quang Nam - Da Nang - Viet Nam</p>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1" style="text-align: center;">
                                <i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feel-user-2" style="padding-top: 1%;padding-left: 0%;">
                                <p>Quang Nam - Da Nang - Viet Nam</p>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1" style="text-align: center;">
                                <i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feel-user-2" style="padding-top: 1%;padding-left: 0%;">
                                <p>Quang Nam - Da Nang - Viet Nam</p>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1" style="text-align: center;">
                                <i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feel-user-2" style="padding-top: 1%;padding-left: 0%;">
                                <p>Quang Nam - Da Nang - Viet Nam</p>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1" style="text-align: center;">
                                <i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feel-user-2" style="padding-top: 1%;padding-left: 0%;">
                                <p>Quang Nam - Da Nang - Viet Nam</p>
                            </div>
                        </div>
                        <div class="feel-user-clone">
                            <div class="feel-user-1" style="text-align: center;">
                                <i style="color: #E94F3A;padding-right: 9px;" class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feel-user-2" style="padding-top: 1%;padding-left: 0%;">
                                <p>Quang Nam - Da Nang - Viet Nam</p>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <script>
                var modal1 = document.getElementById("modal-create-post");
                var modal2 = document.getElementById("modal-feel");
                var modal3 = document.getElementById("modal-local");
                var modal_main = document.getElementById("wrapper-post");
                function openModal1() {
                    modal1.style.display = 'block';
                    modal2.style.display = 'none';
                    modal3.style.display = 'none';
                    modal_main.style.display = 'none';
                }
                function closeModal1() {
                    modal1.style.display = 'none';
                    modal2.style.display = 'none';
                    modal3.style.display = 'none';
                    modal_main.style.display = 'block';
                }
                function openModal2() {
                    modal1.style.display = 'none';
                    modal2.style.display = 'block';
                    modal3.style.display = 'none';
                    modal_main.style.display = 'none';
                }
                function closeModal2() {
                    modal1.style.display = 'none';
                    modal2.style.display = 'none';
                    modal3.style.display = 'none';
                    modal_main.style.display = 'block';
                }
            </script>
        </div>
    </body>
</html>