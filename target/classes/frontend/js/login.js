function dangkytaikhoan(){
    var objs = document.querySelectorAll('.sign-form');
    for(var i = 0; i < objs.length; i++){
        var obj = objs[i];
        validateInput(obj);
    }
}

function validateInput(obj){
    var valueObj = obj.value;
    var inputName = obj.getAttribute('name');
    var idError = 'sign_error_' + inputName;
    var field_name = obj.getAttribute('field-name');
    var isError = false;
    if(valueObj == ''){
            
        document.getElementById(idError).innerHTML = 'Vui lòng nhập '+field_name;
        isError = true;
    }
    if(obj.getAttribute('type') == 'email' && valueObj.indexOf('@') < 0){
        document.getElementById(idError).innerHTML = 'Vui lòng nhập định dạng email';
        isError = true;
    }

    if(obj.getAttribute('type') == 'password' && (valueObj.length<8 || valueObj.length > 16)){
        document.getElementById(idError).innerHTML = 'Vui lòng nhập mật khẩu từ 8 đến 16 ký tự';
        isError = true;
    }

    if(!isError){
        document.getElementById(idError).innerHTML = '';
    }
}

function keyupInput(inputName){
    var obj = document.querySelector('input[name="'+inputName+'"]');
    validateInput(obj);
}