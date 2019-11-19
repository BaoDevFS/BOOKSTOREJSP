<%@ page import="vn.edu.nlu.control.SearchController" %>
<%@ page import="vn.edu.nlu.fit.model.Products" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Search here</title>
</head>
<body>
<%
    String search = (String) request.getAttribute("search");
    SearchController sControl = new SearchController();
    Products s = new Products();
    sControl.search("search");
    int len = sControl.listProduct.size();

    for (int i = 0; i < len; i++) {
        s = sControl.listProduct.get(i);
        System.out.print(s = sControl.listProduct.get(i));
    }
%>

<%=s.getImage() %>

</body>
</html>
