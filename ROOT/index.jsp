<%@ page import="java.io.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>


<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="css/base.css?after">
  <script src="http://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <title></title>
</head>
<body>
  <div class="site-header">
    <h2> Euidong's Tech Blog</h2>
  <img class="custom-logo-link" src="./img/minion.png">
  </div>
  <div class="row">
    <div class="leftcolumn">
     <div class="card">
      <div id="content">
        <h1> Main Home Here </h1>
        <p> This is Main infomation </p>
        <p> show all content from right side menu </p>

      </div>
     </div>
    </div>
    <div class="rightcolumn">
      <div class="card">
        <h2> Post list </h2>
          <%

            String fileDir[] = {"Machine-Learning-Study/1. 신경망과 딥러닝", "Machine-Learning-Study/모두를 위한 딥러닝" };
            String filePath[] = {request.getRealPath(fileDir[0]) + "/", request.getRealPath(fileDir[1]) + "/" };
            File f1 = new File(filePath[0]);
            File f2 = new File(filePath[1]);
            File [] files = f1.listFiles();
            String [] fileName = new String[files.length];
            Arrays.fill(fileName, "z");
            int fileNum = 0;
            for (int i = 0; i < files.length; i++) {
                if (files[i].isFile()) {
                    fileName[fileNum] = files[i].getName();
                    fileNum++;
                }
            }
            Arrays.sort(fileName);
            out.println("<h3> Andrew Ng's Machine Learning </h3>");
            for (int i = 0; i < fileNum; i++) {
                out.println("<button class=\"asText\""
                        + "onClick=\"loadFile(\'" + fileDir[0] + '/' + fileName[i] +"');\">"
                        + fileName[i] + "</button> <br>");
            }

            files = f2.listFiles();
            fileName = new String[files.length];
            Arrays.fill(fileName, "z");
            fileNum = 0;
            out.println("<h3> 모두를 위한 딥러닝 </h3>");
            for (int i = 0; i < files.length; i++) {
                if (files[i].isFile()) {
                    fileName[fileNum] = files[i].getName();
                    fileNum++;
                }
            }
            Arrays.sort(fileName);
            for (int i = 0; i < fileNum; i++) {
                out.println("<button class=\"asText\""
                        + "onClick=\"loadFile(\'" + fileDir[1] + '/' + fileName[i] +"');\">"
                        + fileName[i] + "</button> <br>");
            }
          %>
      </div>
      <div class="card">
				<div>
					<h2> About Me </h2>
                    <p> Name : 정의동</p>
                    <p> Interests : IoT, Mobile, Web </p>
                    <p> github : <a href="https://github.com/euidong">https://github.com/euidong</a></p>
				</div>
      </div>
    </div>
  </div>
	<div class="footer">
		<p style="font-family: SansSerif"> Copyright 2019. 정의동 All pictures cannot be copied without permission.</p>
	</div>
  <link rel="stylesheet" href="./highlight/styles/atom-one-dark.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.5.0/highlight.min.js"></script>
  <script>
      function loadFile(name) {
        var file;
        var fileName = name;

  			$.get(fileName, function (response) {
           file = response;
           document.getElementById('content').innerHTML = marked(file, {highlight: function(code) {
             return hljs.highlightAuto(code).value;}});
        });
        $(document).ready(function() { $('code.hljs').each(function(i, block) { hljs.lineNumbersBlock(block); }); });
      }
  </script>
</body>
</html>
