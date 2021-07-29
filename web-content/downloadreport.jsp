<html>
    <head>
        <title>Lab result</title>
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
    
        <b>View Result<b><br/><br/>
        
<%
String id = request.getParameter("id");
%> 
<div class="down"><a href="downloadres.jsp?id=<%=id%>" >download</a></div><br>
<img src="viewres.jsp?id=<%=id%>" width="500px" height="500px" alt="image" >  
    </body>
</html>