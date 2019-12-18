<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<FORM action="http://server.com/cgi/handle" enctype="multipart/form-data" method="post">

  

</FORM>



<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>

<%@ page import="java.io.*, java.util.*" %>

<%



    // 먼저 파일이 저장될 서버의 실제 폴더 경로를 구합니다.. ServletContext 객체를 이용합니다.

    String realFolder = "";

    // webApps 상의 폴더명입니다.. 이 폴더에 해당하는 실제 경로를 찾아서  realFolder 로 매핑시킵니다.

    String saveFolder = "fileSave";

    String charset = "euc-kr";

    int maxSize = 1024 * 1024 * 1024;

    

    realFolder = this.getServletContext().getRealPath(saveFolder);

    out.println("다음 경로에 파일이 저장됩니다.  : " + realFolder);

    

    try {

        // 이제부터 multipartRequest 객체를 이용해서 파일을 업로드 합니다.

        MultipartRequest multi = null;

        multi = new MultipartRequest(request, realFolder, maxSize, charset, 

                new DefaultFileRenamePolicy());

        // 이상으로 파일 업로드 끝..

        

        // 이제부터 Form에서 전송되는 파라미터 확인 해 봅니다.

        Enumeration<String> params = multi.getParameterNames();

        

        while (params.hasMoreElements()) {

            String name = params.nextElement();

            String value = multi.getParameter(name);

            out.println("<br />" + name + " : " + value + "<br />");

        }

        

        out.println("<hr color='red' />");

        out.println("업로드 된 파일의 정보");

        

        Enumeration files = multi.getFileNames();

        

        while (files.hasMoreElements()) {

            String name = (String)files.nextElement();

            String fileName = multi.getFilesystemName(name);

            String originName = multi.getOriginalFileName(name);

            String type = multi.getContentType(name);

            

            // 전송된 파일의 실제 속성을 열여봅니다..

            File file = multi.getFile(name);

            

            out.println("파라미터의 이름 : " + name + "<br />");

            out.println("실제 파일 이름 : " + originName + "<br />");

            out.println("저장된 파일 이름 : " + fileName + "<br />");

            out.println("파일타입 : " + type + "<br />");

            

            if (file != null) {

                out.println("크기 : " + file.length());

                out.println("<br />");

            }

        }

    } catch (Exception e) {

        e.printStackTrace();

    }

%> 


</body>
</html>

