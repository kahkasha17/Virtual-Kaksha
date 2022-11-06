<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Css/aboutus.css">
    <title>About Us</title>
</head>
<body>
    <div class="mainbox">
        <div class="box1">
            <div class="mywidth"></div>
            <div class="box1-cont">
                <div class="nav">
                    <img src="images/logo.jpg" alt="Logo" class="imgstyle">
                    <div class="navlink">
                        <ul class="mylis">
                            <li><a href="index.jsp" class="myA">Home</a></li>
                            <li><a href="#about" class="myA">About us</a></li>
                            <li><a href="#mission" class="myA">Mission</a></li>
                            <li><a href="#team" class="myA">Our Team</a></li>
                        </ul>
                    </div>

                </div>
                <div class="pic-cont">
                    <div class="cont1">
                        <h2 class="myh2">"About us"</h2>
                        <p class="myp">Vitual kaksha is Virtual Classroom. Which is an online system that allows students and teachers to communicate and collaborate. </p>
                        <a href="#confirm" class="enrollbtn" onclick="toggleFunction()">Enroll now</a>
                    </div>
                    
                    <div class="pic">
                        <img src="images/abt1.jpg" alt="About us page" class="abtpic">
                    </div>
                </div><div class="wrapper" id="confirm">
                    <input type="radio" name="select" id="option-1" onclick="window.location='std_regis.jsp'">
                    <input type="radio" name="select" id="option-2"onclick="window.location='teach_regis.jsp'">
                    <label for="option-1" class="option option-1">
                    <div class="dot"></div>
                    <span>Student</span>
                    </label>
                        <label for="option-2" class="option option-2">
                          <div class="dot"></div>
                           <span>Teacher</span>
                        </label>
                     </div>
            </div>
            
        </div>
        <!-------------------[ Story & innovation ]------------------->
        <div class="box2">
            <div class="story">
                <div class="storypic">
                    <img src="images/vir.jpg" alt="Classroom story" class="storyimg">
                </div>
                <div class="storycont"id="about">
                    
                        <h1 class="storyh1">An Introduction</h1>
                        <p class="storyp">"Virtual classroom is an online simulated classroom that allows students and instructs located different places to participate in self-paced and real time classes, record and achieve the entire classroom experience for later review."</p>
                    
                </div>
            </div>

            <div class="inno">
                <div class="inno-cont">
                    <h1 class="conth1">Innovation Ideas</h1>
                    <p class="contp">"Start and attend live classes,upload and download books and hand written notes,get your assignments are services provide in single plateform. That can help a teacher and students both to organize there study material at a sinle plateform."</p>
                </div>
                <div class="innopic">
                    <img src="images/inno.jpg" alt="innovation pic" class="innoimg">
                </div>
            </div>
        </div>
        <!-------------------[ mission & goal]------------------->
        <div class="box3">
            <div class="mission" id="mission">
                <div class="misspic">
                    <img src="images/miss-pic.jpg" alt="Classroom story" class="missimg">
                </div>
                <div class="misscont">
                    
                        <h1 class="missh1">Mission of Virtual Kaksha</h1>
                        <p class="missp">"To provide students with flexible and rigorous online learning opportunities that will help them acquire the knowledge, skills and characteristics necessary for college and career readiness."</p>
                </div>
            </div>

            <div class="goal">
                <div class="goal-cont">
                    <h1 class="goalh1">Goals</h1>
                    <p class="goalp">
                        <ul class="goalli">
                        <li class="goalli">Enhance the quality of learning and teaching</li>
                        <li class="goalli">Meet the learning style or needs of students</li>
                        <li class="goalli">Improve user-accessibility and time flexibility to engage learners in the learning process</li>
                        <li class="goalli">Improve the efficiency and effectiveness</li>
                    </ul></p>
                </div>
                <div class="goalpic">
                    <img src="images/goal.jpg" alt="innovation pic" class="goalimg">
                </div>
            </div>
        </div>
       <!----------------------------[ our team ]------------------------>
       <div class="box4" id="team">
            <h1 class="teamh1">Meet our Team</h1>
            <p class="teamp">"These people are not just team,their are family for us and reason for the suceess of this project"</p>
            <div class="team">
                <div class="tl">
                    <img src="images/tl.jpg" alt="Team Leader" class="teamimg">
                    <figcaption class="teamcaption">
                        "Team Leader, front-end developer,back-end developer and all rounder of our team."
                    </figcaption>
                </div>
                <div class="front">
                    <img src="images/front.jpg" alt="front end developer" class="teamimg">
                    <figcaption class="teamcaption">
                        "front-end developer,back-end developer and subordinate of team leader."
                    </figcaption>
                </div>
                <div class="back">
                    <img src="images/back.jpg" alt="front end developer" class="teamimg">
                    <figcaption class="teamcaption">
                        "back-end developer and database Handler and inspection Manager."
                    </figcaption>
                </div>
                <div class="helper">
                    <img src="images/helper.jpg" alt="front end developer" class="teamimg">
                    <figcaption class="teamcaption">
                        "front-end developer,Helper and tester of our team."
                    </figcaption>
                </div>
            </div>
        </div>
        <!-----------------------[ Footer ]------------------->
        <div class="footer">

            <div class="box-container">
    
                <div class="box">
                    <h3>branch locations</h3>
                    <a href="#">Noida</a>
                    <a href="#">Patna</a>
                    <a href="#">Utter Pradesh</a>
                    <a href="#">Makanpur</a>
                </div>
    
                <div class="box">
                    <h3>quick links</h3>
                    <a href="#home">home</a>
                    <a href="#about">about</a>
                    <a href="#faculty">faculty</a>
                    <a href="#contact">contact</a>
                </div>
    
                <div class="box">
                    <h3>contact info</h3>
                    <p> <i class="fas fa-map-marker-alt"></i> noida, india 400104. </p>
                    <p style="text-transform: lowercase"> <i class="fas fa-envelope"></i> kaksha17820virtual@gmail.com </p>
                    <p> <i class="fas fa-phone"></i> +91-7217697611 </p>
                </div>
    
            </div>
    
            <h1 class="credit">created by <a href="#">mr/miss. PDRK designer</a> all rights reserved. </h1>
        </div>
    </div>
    <script>
    function toggleFunction()
    {
    var toggle = document.getElementById("confirm");
    if (toggle.style.display === "block")
     {
      toggle.style.display ="none";
    } else {
      toggle.style.display ="block";
    } 
  }
</script>
</body>
</html>