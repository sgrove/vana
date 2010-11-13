// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
    $('.comments').hide();
    

    jQuery.each($('span.comments-link'), function(index, item) {
	  //console.log(index.methods);
	//linkText = item.text().replace("comments", "Shippy shape shuup") ;
	//item.text("Super");
      });

    $('span.comments-link').css({"color":"darkBlue", cursor:"pointer", "font-weight":"bold"});


    /*
    item = $('#48_comments');
    linkText = item.text().replace("comment", "hiccups");
    item.text(linkText);
    */

    //$('.row-odd, .row-even').corner();

    $('span.comments-link').each(function (i) {
	//$(this).append(" BAM! " + i);
	//$(this).text("Seriosuly? wtf.");
	$(this).click(function(e) {

	    e.preventDefault();

	    $(this).parents("div.entry-envelope").find("div.comments").slideToggle();
	  });
      });

    $('a.reply-link').each(function (i) {
	$(this).click(function(e) {
	    e.preventDefault();

	    $(this).parents("div.entry-envelope").find("div.reply").slideToggle();
	  });
	});

    $('#question_title').keyup(function(e) {
        var similar_questions = $('#similar_questions');

        var carot_value = $(this).val();
        
        if (carot_value.length < 5) { similar_questions.html(""); return false; }
        
        var updateSimilarQuestions = function(questions) {
            similar_questions.html("");
            
            $.each(questions, function(index, question) {
                similar_questions.append("<div><a href=\"/questions/" + question.slug_path + "\">" + question.title + "</a></div>");
            });
        };
        
        $.ajax({
            url: "/search_questions.json"
            ,data: {carot: carot_value}
            ,success: updateSimilarQuestions
        });
    });
});

