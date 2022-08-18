// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

function check() {
    let pwd = document.getElementById("pwd").value;
    let cpwd = document.getElementById("cpwd").value;
    let result
    if (pwd == cpwd) {
        result=  true;
    } else {
        result = false;
    }
    return result;
}

function toggle() {
    let box = document.getElementById("check").value;
    if (box.checked) {
        document.getElementById("pwd").type = "text";
        document.getElementById("cpwd").type = "text"
    } else {
        document.getElementById("pwd").type = "passwrd";
        document.getElementById("cpwd").type = "password"
    }
}
