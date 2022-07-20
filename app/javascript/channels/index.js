// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

// const channels = require.context('.', true, /_channel\.js$/)
// channels.keys().forEach(channels)
function check() {
    let pwd = document.getElementById("pwd").value;
    let cpwd = document.getElementById("cpwd").value;
    if (pwd == cpwd) {
        return true;
    } else {
        return false;
    }
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