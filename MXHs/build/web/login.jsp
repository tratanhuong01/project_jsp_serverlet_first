<%@page import="StringUtil.StringCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Facebook - Login Or Register</title>
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
        <script src="js/FormValid.js"></script>
    </head>

    <body>
        <div id="register">
            <div id="form-register">
                <div style="width: 100%;">
                    <span onclick="closeRegister()" id="close">&times;</span>
                    <h1 style="padding: 10px 0px;">Đăng Kí</h1>
                </div>
                <p style="padding: 0px 0px 10px 0px;">Nhanh Chóng Dễ Dàng</p>
                <hr>
                <br>
                <form action="dang-nhap" method="POST">
                    <p style="color: red;margin: 10px 0px;">
                        <%= StringCheck.Check((String) request.getAttribute("errorRegister")) %> 
                    </p>
                    <div id="form_1">
                        <input type="text" name="firstName" class="input-forms" placeholder="Họ">
                        <input type="text" name="lastName" class="input-forms" placeholder="Tên">
                    </div>
                    <div class="form_2">
                        <input oninput="checkEmail(event)" type="text" name="emailOrPhone" class="input-forms" id="emailOrPhone" placeholder="Số Di Động Hoặc Email">
                    </div>
                    <div class="form_2" style="display: none;" id="email-again">
                        <input type="text" name="email-again" class="input-forms"  placeholder="Nhập Lại Email">
                    </div>
                    <div id="form_3">
                        <input type="password" name="passWord" class="input-forms" placeholder="Mật Khẩu Mới">
                    </div>
                    <div class="form_4">
                        <p><b style="font-size: 12px;">Ngày Sinh</b></p>
                        <select onchange="checkYear(this)"name="year" id="year-se">
                            <option value=""></option>
                        </select>
                        <select onchange="checkMonth(this)" name="month" id="month-se">
                        </select>
                        <select name="day" id="day-se">
                            <option value="">Ngày</option>
                        </select>
                    </div>
                    <div class="form_4" style="margin-top: 10px;">
                        <p style="display: block;"><b style="font-size: 12px;">Giới Tính</b></p>
                        <div class="form_4_clone">
                            <div class="radio-button-form">
                                <Label style="margin-right:4em"><b>Nam</b></Label><input type="radio" name="GioiTinh" id=""
                                                                                         value="Nam">
                            </div>
                            <div class="radio-button-form">
                                <Label style="margin-right:4em"><b>Nữ</b></Label><input type="radio" name="GioiTinh" id=""
                                                                                        value="Nữ">
                            </div>
                            <div class="radio-button-form">
                                <Label style="margin-right:4em"><b>Khác</b></Label><input type="radio" name="GioiTinh" id=""
                                                                                          value="Khác">
                            </div>
                        </div>
                    </div>
                    <div class="form_5">
                        <p style="font-size: 14px;color: #737373;">Bằng cách nhấp vào Đăng ký, bạn đồng ý với
                            <a style="color: #385989;" href="">Điều khoản, Chính sách dữ liệu</a> và
                            <a style="color: #385989;" href="">Chính sách cookie</a> của chúng tôi.
                            Bạn có thể nhận được thông báo của chúng tôi qua SMS và hủy nhận bất kỳ lúc nào.</p>
                    </div>
                    <div class="form_5" style="text-align: center;">
                        <button type="submit" style="font-size: 18px;width: 50%;background-color: #119F16;padding: 10px;border: none;
                                border-radius: 10px;color: white;cursor: pointer;
                                "><b>Đăng Kí</b></button>
                    </div>
                </form>
            </div>
            <div id="get-account-main">
                <div style="width: 100%;margin: auto;">
                    <span onclick="closeGetAcc()" id="close">&times;</span>
                    <h3 style="padding: 10px 0px;">Tìm kiếm tài khoản của bạn</h3>
                    <hr>
                    <br>
                </div>
                <div id="get-account">
                    <form action="" method="POST"></form>
                    <div id="input-getaccount">
                        <p>Vui lòng nhập số điện thoại hoặc email để lấy mật khẩu</p>

                        <input type="text" name="" id="" placeholder="Email hoặc số điện thoại">

                    </div>
                    <hr>
                    <div class="btn-search-acc">
                        <button style="width: 18%;" type="submit">Tìm kiếm</button>
                        <button style="width: 9%;" type="button">Hủy</button>
                    </div>
                    </form>
                </div>

                <div id="show-gui-getacc">  
                    <form action="" method="post">     
                        <div style="width: 100%;display: flex;">
                            <div class="gui-getacc-left">
                                <p style="margin: 10px;">
                                    <b>Bạn muốn nhận mã để đặt lại tài khoản bằng cách nào ?</b>
                                </p>
                                <div class="input-choose-get">
                                    <input type="radio" name="getacc" id="" style="margin: 10px 10px;">
                                    <div style="padding: 0px 10px;">
                                        <div style="margin: 5px 0px;"><i class="fas fa-envelope-open-text"></i>&nbsp;&nbsp;
                                            <b>Gởi mã qua email </b></div>
                                        <p style="padding: 0px 27px;">+84354114665</p>
                                    </div>
                                </div>
                                <div class="input-choose-get">
                                    <input type="radio" name="getacc" id="" style="margin: 10px 10px;">
                                    <div style="padding: 0px 10px;">
                                        <div style="margin: 5px 0px;"><i class="fas fa-mobile-alt"></i>&nbsp;&nbsp;
                                            <b>Gởi mã qua số điện thoại</b></div> 
                                        <p style="padding: 0px 25px;">tratanhuong01@gmail.com</p>
                                    </div>
                                </div>
                            </div>
                            <div class="gui-getacc-right">
                                <img style="width: 60px;height: 60px;" src="avatar.jpg" alt=""><br>
                                <b>Trà Hưởng</b><br>
                                <span style="font-size: 12px;">Người dùng facebook</span>
                            </div>

                        </div>
                        <hr style="margin-top: 1em;">

                        <div class="btn-search-acc">
                            <button style="width: 25%;float: left;" type="button">Gửi phản hồi</button>
                            <button style="width: 15%;" type="submit">Tiếp tục</button>
                            <button style="width: 25%;" type="button">Không phải bạn ?</button>
                        </div>   
                    </form>
                </div>
            </div>
        </div>
        <div id="web">
            <div class="wrapper">
                <div class="login-left">
                    <span style="font-size: 55px;font-weight: bold;color: #1877F2;">facebook</span>
                    <br>
                    <br>
                    <h2>Facebook giúp bạn kết nối và chia sẻ với mọi người trong cuộc sống của bạn.</h2>
                </div>
                <div class="login-right">
                    <div id="login-right_1">
                        <div style="width: 100%;">
                            <form style="width: 100%;background-color: white;" action="logged" method="post">
                                <input type="text" name="emailOrPhone" class="input-login" id="" placeholder="Email Hoặc Số Điện Thoại">
                                <input type="password" name="passWord" class="input-login" id="" placeholder="Mật Khẩu">
                                <button
                                    style="width: 93%;padding: 15px;margin: 10px;border: none;
                                    border-radius: 10px;background-color: #1877F2;font-size: 15px;color: white;font-weight: bold;"
                                    type="submit">Đăng Nhập</button>
                                <p style="padding: 15px;background-color: white;"><a onclick="openGetAcc()"
                                                                                     style="color: #1877F2;background-color: white;">Quên Tài khoản</a></p>
                            </form>
                        </div>
                        <hr style="width: 90%;margin: auto;">
                        <div style="width: 100%;margin-top:2em;">
                            <div style="background-color: white;margin-bottom: 1em;">
                                <a onclick="openRegister()" style="margin-bottom: 2em;padding: 15px 2em;background-color: #36A420;
                                   font-size: 15px;font-weight: bold;color:white;border-radius: 10px;cursor: pointer;">Tạo Tài
                                    Khoản</a>
                            </div>
                        </div>
                    </div>
                    <div id="create-page">
                        <a style="color: black;" href=""><b>Tạo Trang</b>&nbsp;dành cho người nổi tiếng, nhãn hiệu hoặc
                            doanh nghiệp.</a>
                    </div>
                </div>
            </div>
            <div id="footer">
                <ul class="footer-one">
                    <li><a href="">Tiếng Việt</a></li>
                    <li><a href="">English (UK)</a></li>
                    <li><a href="">中文(台灣)</a></li>
                    <li><a href="">日本語</a></li>
                    <li><a href="">한국어</a></li>
                    <li><a href="">ภาษาไทย</a></li>
                    <li><a href="">Français (France)</a></li>
                    <li><a href="">Español</a></li>
                    <li><a href="">Português (Brasil)</a></li>
                    <li><a href="">Deutsch</a></li>
                    <li><a href="">Italiano</a></li>
                    <li style="padding: 0;"><button style="width: 25px;height: 25px;border: 1px solid #ccc;">+</button></li>
                </ul>
                <br>
                <hr>
                <br>
                <ul class="footer-two">
                    <li><a href="">Đăng Kí</a></li>
                    <li><a href="">Đăng Nhập</a></li>
                    <li><a href="">Messager</a></li>
                    <li><a href="">Facebook Lite</a></li>
                    <li><a href="">Watch</a></li>
                    <li><a href="">Danh Bạ</a></li>
                    <li><a href="">Trang</a></li>
                    <li><a href="">Hạng Mục Trang</a></li>
                    <li><a href="">Địa Điểm</a></li>
                    <li><a href="">Trò Chơi</a></li>
                    <li><a href="">Vị Trí</a></li>
                    <li><a href="">MarketPlace</a></li>
                    <li><a href="">Facebook Pay</a></li>
                    <li><a href="">Nhóm</a></li>
                    <li><a href="">Oculus</a></li>
                    <li><a href="">Instagram</a></li>
                    <li><a href="">Chiến Dịch Gây Quỹ</a></li>
                    <li><a href="">Dịch Vụ</a></li>
                    <li><a href="">Giới Thiệu</a></li>
                    <li><a href="">Tạo Quảng Cáo</a></li>
                    <li><a href="">Nhà Phát Triển</a></li>
                    <li><a href="">Tuyển Dụng</a></li>
                    <li><a href="">Quyền Riêng Tư</a></li>
                    <li><a href="">Cookie</a></li>
                    <li><a href="">Lựa Chọn Quảng Cáo</a></li>
                    <li><a href="">Điều Khoản</a></li>
                    <li><a href="">Trợ Giúp</a></li>
                </ul>
                <br>
                <b>&nbsp;&nbsp;Facebook @2020</b>
                <br>
                <br>
                <br>
                <br>
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
                    option.innerHTML = i;
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
                    option.innerHTML = i;
                    day_se.appendChild(option);
                }
            } else if (y == 4 || y == 6 || y == 9 || y == 11) {
                for (var i = 1; i <= 31; i++) {
                    var option = document.createElement('option');
                    option.innerHTML = i;
                    day_se.appendChild(option);
                }
            } else {
                if (year_se.value % 4 == 0) {
                    for (var i = 1; i <= 29; i++) {
                        var option = document.createElement('option');
                        option.innerHTML = i;
                        day_se.appendChild(option);
                    }
                } else {
                    for (var i = 1; i <= 28; i++) {
                        var option = document.createElement('option');
                        option.innerHTML = i;
                        day_se.appendChild(option);
                    }
                }
            }
            
        }
        function openRegister() {
            var register = document.getElementById("form-register");
            register.style.display = "block";
            var web = document.getElementById("web");
            web.style.opacity = "0.2";
        }
        function closeRegister() {
            var register = document.getElementById("form-register");
            register.style.display = "none";
            var web = document.getElementById("web");
            web.style.opacity = "1";
        }
        function openGetAcc() {
            var register = document.getElementById("get-account-main");
            register.style.display = "block";
            var web = document.getElementById("web");
            web.style.opacity = "0.2";
        }
        function closeGetAcc() {
            var register = document.getElementById("get-account-main");
            register.style.display = "none";
            var web = document.getElementById("web");
            web.style.opacity = "1";
        }
    </script>

</html>