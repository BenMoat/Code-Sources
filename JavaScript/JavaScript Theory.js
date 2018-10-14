/*Changing HTML content using JavaScript
	Using getElementById()
	This example uses the method to "find" a HTML element (with id="demo") and changes the element
	content (inner HTML) to "Hello JavaScript"*/
document.getElementById("demo").innerHTML = "Hello JavaScript";

/*Changing HTML styles using JavaScript
	Changing the style of a HTML element is a variant of chaning a HTML attribute*/
document.getElementById("demo").style.fontSize = "35px";

/*Changing HTML elements using JavaScript
	Hiding HTML elements can be done by chaning the display style*/
document.getElementById("demo").style.display = "none";

//Inline JavaScript in HTML
<script>
  document.getElementById("demo").innerHTML = "JavaScript here";
</script>

//External JavaScript
function myFunction() {
	document.getElementById("demo").innerHTML = "Paragraph changed";
}

/*JavaScript Statements
	JavaScript statements are composed of: Values, Operators, Expressions, Keywords*/
document.getElementById("demo").innerHTML = "Hello World";

//testing for mac
