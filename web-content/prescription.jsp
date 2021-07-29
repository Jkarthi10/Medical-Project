<html>
    <head>
        <title>View Image</title>
        <Style>
        .down{
                background-color: #1414e38c;
                padding: 10px;
               text-align: center;
               width: 10%;
               border-radius: 10px;
        }
        a{
            text-decoration:none;
        }
        img{
            overflow: scroll;
        }
        </style>
    </head>
    
    <body>
    
        <b>View Prescription<b><br/><br/>
        
<%
String id = request.getParameter("id");
String email=request.getParameter("email");
%> 
<div class="down"><a href="downloadpres.jsp?id=<%=id%>&email=<%=email%>" >download</a> </div><br>
<img src="viewPres.jsp?id=<%=id%>&email=<%=email%>" width="500px" height="500px" alt="image" >
    </body>
</html>