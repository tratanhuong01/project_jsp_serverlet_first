<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/createStory.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
    <script src="js/scrollbar1.js"></script>
</head>
<body>
    <%@include file="/WEB-INF/modalOfHeader.jspf" %>
    <div id="main">
        <%@include file="/WEB-INF/header.jspf" %>
    </div>
    <div id="story">
        <div class="story-left">
            <div class="story-left-bottom">
                <span style="font-size: 22px;
                font-weight: bold;
                padding-bottom: 15px;">Tin Của Bạn</span>
            </div>
            <div class="story-left-bottom" style="padding-bottom: 10px;">
                <a href=""><img src="avatar.jpg" alt=""></a>
                <a href=""><b>Trà Hưởng</b></a>
            </div>
            <hr>
        </div>
        <div class="story-right">
            <div class="wrapper-story">
                <div class="create-story">
                    <div class="img-bgcolor">
                        <img src="picC.PNG" alt="">
                    </div>
                    <div class="equals-story">
                            <i style="padding: 10px 13px;" class="far fa-file-image"></i><br>
                            <b style="color: white;line-height: 35px;">Tạo tin ảnh</b>
                    </div>
                </div>
                <div class="create-story">
                    <div class="img-bgcolor">
                        <img src="picT.PNG" alt="">
                    </div>
                    <div class="equals-story">
                        <i  style="padding: 12px 13.5px;font-size: 20px;" class="fas fa-font"></i><br>
                        <b style="color: white;line-height: 35px;">Tạo tin dạng văn bản</b>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    function display() {
        var header = document.getElementById("header");
        var heightHeader = header.clientHeight;
        var heightScreen = screen.height;
        var storyLeft = document.getElementsByClassName("story-left")[0];
        storyLeft.style.height = (heightScreen - heightHeader) + "px";
    }
    display();  
</script>
</html>