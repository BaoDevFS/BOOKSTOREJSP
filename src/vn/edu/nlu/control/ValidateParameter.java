package vn.edu.nlu.control;

import javax.servlet.http.HttpServletRequest;

public class ValidateParameter {
    public static String validateParameter(HttpServletRequest request, String type){
        return request.getParameter(type)==null?"":request.getParameter(type);
    }
}
