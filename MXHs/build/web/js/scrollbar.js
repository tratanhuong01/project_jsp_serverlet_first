
//load
document.addEventListener("DOMContentLoaded", () => {
  const coDinh = document.getElementById("header");
  const main_full = document.getElementById("content");
  const main_left_allinfo1 = document.getElementById("wrapper-scrollbar")
  function style_load1() {
    var padding_codinh = getComputedStyle(coDinh).height;
    var st = padding_codinh.replace("px", "");
    var height_ = window.innerHeight - parseInt(st);
    main_full.style.paddingTop = padding_codinh;
    main_left_allinfo1.style.maxHeight = height_.toString() + "px";
    console.log();
  }
  style_load1();
  window.onresize = () => {
    style_load1();
  };
});

document.addEventListener("DOMContentLoaded", () => {
  const coDinh = document.getElementById("header");
  const main_full = document.getElementById("content");
  const main_left_allinfo1 = document.getElementsByClassName("wrapper-content-right")[0];
  function style_load2() {
    var padding_codinh = getComputedStyle(coDinh).height;
    var st = padding_codinh.replace("px", "");
    var height_ = window.innerHeight - parseInt(st);
    main_full.style.paddingTop = padding_codinh;
    main_left_allinfo1.style.maxHeight = height_.toString() + "px";
    console.log();
  }
  style_load2();
  window.onresize = () => {
    style_load2();
  };
});

document.addEventListener("DOMContentLoaded", () => {
  const coDinh = document.getElementById("header");
  const main_full = document.getElementById("connectfriend");
  const main_left_allinfo1 = document.getElementById("friend-request-1");
  function style_load3() {
    var height_ = window.innerHeight - parseInt(st);
    main_full.style.paddingTop = padding_codinh;
    main_left_allinfo1.style.maxHeight = height_.toString() + "px";
    console.log();
  }
  style_load3();
  window.onresize = () => {
    style_load3();
  };
});
document.addEventListener("DOMContentLoaded", () => {
  const coDinh = document.getElementById("header");
  const main_full = document.getElementById("messenger-facebook");
  const main_left_allinfo1 = document.getElementById("messenger-gui");
  function style_load4() {
    var height_ = window.innerHeight - parseInt(st);
    main_full.style.paddingTop = padding_codinh;
    main_left_allinfo1.style.maxHeight = height_.toString() + "px";
    console.log();
  }
  style_load4();
  window.onresize = () => {
    style_load4();
  };
});
function openPost() {
  var register = document.getElementById("modal-post");
  register.style.display = "block";
  var web = document.getElementById("main");
  web.style.opacity = "0.2";
}
function closePost() {
  var register = document.getElementById("modal-post");
  register.style.display = "none";
  var web = document.getElementById("main");
  web.style.opacity = "1";
}
function openRequestFriend() {
  var register = document.getElementById("friend-request-1");
  register.style.display = "block";
}
function closeRequestFriend() {
  var register = document.getElementById("friend-request-1");
  register.style.display = "none";
}
function openMessenger() {
  var register = document.getElementById("messenger-gui");
  register.style.display = "block";
}
function closeMessenger() {
  var register = document.getElementById("messenger-gui");
  register.style.display = "none";
}