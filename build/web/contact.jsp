<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String db = "movie_rs";
//    if (session.getAttribute("user_email") == null) {
//        String err = "Please Login First";
//        response.sendRedirect("login.jsp?err=" + err);
//    }

    String err;
    err = request.getParameter("a");

    if (err == null) {
        err = "";
    }
    if (err.equalsIgnoreCase("done")) {
        err = "Request Successfully Submitted !!!";
    }
    if (err.equalsIgnoreCase("exist")) {
        err = "Request Already Submitted !!!";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Recommendation System</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <style>
            .slideContainer{max-height: 385px;
                            margin: 5px;
                            background: rgba(255,255,255,.5);
                            display: inline-block;
                            padding: 5px;
                            width: calc(100% - 20px);
                            border-radius: 5px;
            }
            .Slides>img {
                max-height: 400px;
                max-width: 100%;
                height: 100%;
            }
        </style>
    </head>
    <body>
        <div id="nav">
            <div> 
                <div id="websitename"><h1><a href="index.jsp">Movie Recommendation System</a></h1></div>

                <div id="navRef">
                    <div class="refbox" >
                        <a href="index.jsp">Home</a>
                        <a href="predict.jsp">Movies For You</a>
                        <a href="contact.jsp">Contact Us</a>
                        <%
                            if (session.getAttribute("user_email") == null) {
                        %>
                        <a href="login.jsp">Login</a>
                        <%
                        } else {
                        %>
                        <span><%=session.getAttribute("user_name")%></span>
                        <a href="logout.jsp">Logout</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <!--            <h1 style="text-align: center;">Welcome -- <b>
            <%
                if (session.getAttribute("user_email") != null) {
                    out.print("" + session.getAttribute("user_name"));
                } else {
                    out.print("Guest");
                }
            %>
        </b></h1>-->
            <h4 style="margin: 0;text-align:center;color: chocolate;"><%=err%></h4>
            <!--        <h2 style="margin: 0;text-align:center;color: #2E3949;">Online Movie Recommendation</h2>
                    <div style="width: fit-content;margin: auto;">
                        <a style="text-align: center;display: block;padding: 10px;" href="view_request.jsp">View Your Application</a>-->
        </div>

        
            <div class="" style="width: 100%" >
            <span><b> About Us</b></span>
            <p>
                Iron Man: Story of a single mom-turned-superhero fighting off soccer moms.
                <br/>
                The Incredible Hulk: A reimagined spinoff of Titanic where the hull of the ship isn’t breached by an iceberg.
                <br/>
                Iron Man 2: The much-anticipated sequel to Iron Ma, where our favorite single-mom superhero battles with tiger moms.
                <br/>
                Thor: A documentary about the dangers of the deep web.
                <br/>
                Captain America: The Fist Avenger: Who needs a weapon when you are the weapon?
                <br/>
                The Avenger: The first superhero movie crossover that never happened.
                <br/>
                Iron Man 3: The Iron Ma trilogy’s finale, where our femme fatale goes head-to-head with the formidable Thiccma.
                <br/>
                Thor: The Dark World: A remake of Tor, but with a bonus feature about the dark web.
                <br/>
                Captain America: The Winter Solder: The Fist Avenger takes up a hobby of fusing metals together. But it’s a little difficult when you’re doing it out in the icy blizzards of a North Carolina winter.
                <br/>
                Guardians of the Galaxy: It’s not easy being a policeman in the city of Galax, Virginia.
                <br/>
                Avengers: GE of Ultron: A genocidal, sentient robot goes through the financial strains, stress, and rigor of college General Education courses.
                <br/>
            </p><br><br>
            <span><b>Contact No : 9599476868</b></span>
            <p>Address :  Beta 1 house no xyz, Greater Noida</p>
        </div>
            
        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("Slides");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                slides[slideIndex - 1].style.display = "block";
                setTimeout(showSlides, 2500); // Change image every 2 seconds
            }
        </script>    
        
    </body>
</html>