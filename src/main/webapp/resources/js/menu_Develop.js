/*
	Programmer: Lukasz Czerwinski
	CodeCanyon: http://codecanyon.net/user/ref=Lukasz_Czerwinski

	Library version: jQuery 1.7+
x	
	If this script you like, please put a comment on codecanyon.
	
*/

(function($){

$.fn.sidebarMenu = function(settings){ 
	//Global variables 
	var el, item, sidebar, buttonSidebar, mainMenu, back, active, submenu, sLeft, currentColor;
	//Default settings
	settings = jQuery.extend({
		Speed			: 250,			//Speed animations  
		navigation		: 1,            //(true) display the arrow for trip of menu  
		effect  		: "slide",		//(string) slide or sidebars
		title			: 1,			//(true) display the title of submenu - only for slide effect
		hoverColor		: "#FF0000"		//Hex color to animate
	}, settings);
	 
	//Define basic elemments 
	el = $(this);
	//Select item
	item = el.children("ul").parent("li");
	//Build the sidebarMenu
	sidebar = $(this).parents("div:first").wrap("<div class='sidebarMenu'>").parent(".sidebarMenu");
	//Main menu
	mainMenu = sidebar.find("ul:first");
	//Create button to show/hide the sidebar
	buttonSidebar = sidebar.prepend("<div class='buttonsidebar'><a href='#'></a></div>").find(".buttonsidebar"); 
	//Get the start position
	sLeft = sidebar.css("left");
	//Add ID to ul tags
	sidebar.find("ul").each(function(id){
		$(this).attr("id", id); 
	});

	//Hide all submenu
	item.find("ul").addClass("submenu").hide();

	//Click an item
	item.find("a:first").click(function(){
		var clicked = $(this),
			sID = $(".sidebarMenu[id='"+clicked.parent().parent("ul").attr("id")+"']");

			//Clear other (sidebar effect only)
			if (settings.effect == "sidebars") { 
				//Check actives
				if (sID.has(".active")) {

					sID.prev().nextAll(".sidebarMenu").fadeOut(settings.Speed, function(){
						//Toggle classes and colors
						clicked.parents("ul").find(".active").not(clicked.parent("li")).toggleClass("active", false).animate({
							backgroundColor: currentColor
						}, 100); 

						//Change classes
						clicked.parents("ul").find("ul.subm").removeClass().addClass("submenu");
						//Remove subbar menu 
						$(this).remove();
					});
				};
			}; 

			if (!clicked.parent("li").is(".active")) {   

				//Change class to active
				active = $(this).parent("li").toggleClass("active", true),
				//Clone the submenu
				submenu = active.find("ul.submenu:first").removeClass().addClass("subm").clone(true);

				//Effects
				switch (settings.effect) {
					//Slide Effect
					case "slide":
						//Build new structure of submenu 
						submenu.appendTo(sidebar);  
						//Wrap it
						sidebar.find(".subm:last").wrap("<div class='submenu'></div>").parent(".submenu").hide();

						//Title of submenu
						if (settings.title) { 
							//Add new 
							sidebar.find("div.submenu:last").prepend("<h3 class='title'>"+active.find("a:first").text()+"</h3>");
						};
						//Hide active menu and show other  
						sidebar.find("ul:visible, div.submenu").fadeOut(settings.Speed, function(){
							sidebar.find("div.submenu:last").stop(true, true).fadeIn(settings.Speed).find("ul:first").fadeIn(settings.Speed);
							//Show the navigation
							if (settings.navigation && !back.parent().is(":visible")) { 
									back.parent().fadeIn(settings.Speed);
							}; 
						});
					//end Slide Effect
					break;

					//Sidebars Effect
					case "sidebars":
							//Get positions
							var pTop = active.offset().top;
								pLeft = active.offset().left+active.width()+1,
								//Create new sidebar
								subbar = el.parents("div:first").append("<div class='sidebarMenu' id='"+active.parent("ul").attr("id")+"'></div>").find(".sidebarMenu:last").hide();
								//Add submenu to new sidebar
								submenu.appendTo(subbar); 
								//Change class of submenu
								subbar.find("ul.subm:first").removeClass().addClass("subbarMenu");
								//Set new position the sidebar and submenu
								subbar.css({
									left: pLeft
								}).find(".subbarMenu").css("top", pTop);
								//Show the subbar
								subbar.fadeIn(settings.Speed).find("ul.subbarMenu").fadeIn(settings.Speed); 

					//end Sidebars Effect
					break;
				}
			} else {
					clicked.parents("ul").find(".active").toggleClass("active", false);	

			}; 

		return false;
	});

	//Build navigation
	if (settings.navigation) {
		back = sidebar.prepend("<div class='back'><a href='#'></a></div>").find(".back").hide().find("a");

		//Click button
		back.click(function(){ 
			//Hide active and show prevous
			if (sidebar.find("div.submenu").length > 1) {
				sidebar.find("div.submenu:last").fadeOut(settings.Speed, function(){
					$(this).prev("div.submenu").stop(true, true).fadeIn(settings.Speed).find("ul:first").fadeIn(settings.Speed);
					$(this).remove();
				});
					//Change classes
					mainMenu.find("ul.subm:last").removeClass().addClass("submenu");
					sidebar.find(".active:last").toggleClass("active", false).css("background-color", currentColor);
			} else {
				sidebar.find("div.submenu").fadeOut(settings.Speed, function(){
					$(this).remove();
					//Show mainMenu
					mainMenu.fadeIn(settings.Speed);
				});
				
				//Hide the back button
				back.parent().fadeOut(settings.Speed);
					//Change classes
					mainMenu.find("ul.subm").removeClass().addClass("submenu");
					mainMenu.find(".active").toggleClass("active", false).css("background-color", currentColor);
			};
			return false;
		}).hover(function(){
			currentColor = $(this).css("background-color");
			$(this).stop(true, false).animate({
				backgroundColor: settings.hoverColor
			}, 100);
		}, function(){
			$(this).animate({
				backgroundColor: currentColor
			}, 100);
		});
	};

	//Item hover
	el.mouseover(function(){
		if (!$(this).is(".active")) {
			currentColor = $(this).css("background-color");
			$(this).stop(true, false).animate({
				backgroundColor: settings.hoverColor
			}, 100);
		};
	});
	el.mouseout(function(){
		if (!$(this).is(".active")) {
			$(this).stop(true, true).animate({
				backgroundColor: currentColor
			}, 100);			
		};
	});
	//Show/hide sidebar
	buttonSidebar.click(function(){
		if(!$(this).is(".opened")) {
			//Open the sidebar
			sidebar.animate({
				left: 0
			}, settings.Speed);
			//Toggle class
			$(this).toggleClass("opened", true);
		} else { 
				//Toggle classes
				$(".sidebarMenu").find(".active").toggleClass("active", false).css("background-color", currentColor);
				//Change classes
				$(".sidebarMenu").find("ul.subm").removeClass().addClass("submenu");
			
			$(".sidebarMenu").not(":first").fadeOut(settings.Speed, function(){
						//Remove subbar menu 
						$(this).remove();
			});	
			//hide the sidebar
			sidebar.animate({
				left: sLeft
			}, settings.Speed);
			//Toggle class
			$(this).toggleClass("opened", false);
		};
	});

	}; 
  

})(jQuery); 