
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