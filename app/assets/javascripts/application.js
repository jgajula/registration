// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
  
    $(document).ready(function() { 
        $('.signUpSubmit').click(function() {  
        $(".error").hide();
        var hasError = false;
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var emailaddressVal = $("#signUpEmail").val();
        if(emailaddressVal == '') {
            $(".signUpSubmit").after('<br/><span class="error">Please enter your email address.</span>');
            hasError = true;
        }
        else if(!emailReg.test(emailaddressVal)) {
            $(".signUpSubmit").after('<br/><span class="error">Enter a valid email address.</span>');
            hasError = true;
        }
        if(hasError == true) { return false; }
 
        });
    });