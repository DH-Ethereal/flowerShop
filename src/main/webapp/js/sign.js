
function checkUser_id(){
    var user_id = document.getElementById("user_id");
    var img = document.getElementById("imgUser_id");
    var pattern = /^[a-zA-Z0-9_]{6,12}$/;
    if(pattern.test(user_id.value)){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.pn'";
        return false;
    }
}

function checkUser_name(){
    var user_name = document.getElementById("user_name");
    var img = document.getElementById("imgUser_name");
    var pattern = /^[\u4e00-\u9fa5]{2,6}$/;
    if(pattern.test(user_name.value)){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.png";
        return false;
    }
}

function checkPassword(){
    var password = document.getElementById("password1");
    var img = document.getElementById("imgPassword1");
    var pattern = /^(?=.*([a-zA-Z].*))(?=.*[0-9].*)[a-zA-Z0-9-*/+.~!@#$%^&*()]{5,18}$/;
    if(pattern.test(password.value)){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.png";
        return false;
    }
}

function checkPassword1(){
    var password = document.getElementById("password1");
    var password1 = document.getElementById("password2");
    var img = document.getElementById("imgPassword2");
    if(password.value==password1.value){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.png";
        return false;
    }
}

function checkTel(){
    var tel = document.getElementById("tel");
    var img = document.getElementById("imgTel");
    var pattern = /^1[3-9]\d{9}$/;
    if(pattern.test(tel.value)){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.png";
        return false;
    }
}

function checkEmail(){
    var mail = document.getElementById("mail");
    var img = document.getElementById("imgEmail");
    var pattern = /^([0-9a-zA-Z])+\@([a-zA-Z0-9])+\.([a-zA-Z])+$/;
    if(pattern.test(mail.value)){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.png";
        return false;
    }
}

function formSign(){
    if(checkUser_id(true)&&checkUser_name(true)&&checkPassword(true)&&checkPassword1(true)&&checkTel(true)&&checkEmail(true)){
        return true;
    }
    else{
        return false;
    }
}

function checkLogin_name(){
    var login_name = document.getElementById("login_name");
    var img = document.getElementById("imgLogin_name");
    var pattern1 = /^1[3-9]\d{9}$/;
    var pattern2 = /^([0-9a-zA-Z])+\@([a-zA-Z0-9])+\.([a-zA-Z])+$/;
    if ((pattern1.test(login_name.value))||(pattern2.test(login_name.value))){
        img.src = "/flowerShop/img/true.png";
        return true;
    }
    else{
        img.src = "/flowerShop/img/false.png";
        return false;
    }
}

function formLogin(){
    if(checkLogin_name(true)&&checkPassword(true)){
        return true;
    }
    else{
        return false;
    }
}
