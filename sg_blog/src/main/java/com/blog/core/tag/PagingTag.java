package com.blog.core.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {

    private static final long serialVersionUID = 5321159593325238730L;
    /**分页标签*/
    private PagingDto paging;
    /**请求地址*/
    private String url;
    /**表单编号*/
    private String formId;

    public int doStartTag() {
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            if (paging != null) {
                pageContext.getOut().write(show());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return EVAL_PAGE;
    }

    public PagingDto getPaging() {
        return paging;
    }

    public void setPaging(PagingDto paging) {
        this.paging = paging;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }
	
	
    private String show() {
        String requetURI = pageContext.getServletContext().getContextPath() + url;
        StringBuffer buf = new StringBuffer();
        buf.append("<input type=\"hidden\" id=\"curPageNum\" name=\"curPageNum\" value=\"" + paging.getCurPageNum() + "\"/>");
        buf.append("<span>共" + paging.getTotalRows() + "</i>条记录，当前显示第&nbsp;" + paging.getCurPageNum() + "&nbsp;</i>页</span>");
        
        if(!paging.isFirst()) {
            buf.append("<button style=\"margin-left:45%\" onclick=\"javascript:onPaging('" + formId + "','" + requetURI + "','" + (paging.getCurPageNum() - 1) + "');\">上一页</button>");
        }else {
        	buf.append("<a style=\"margin-left:45%\"></a>");
        }
        
        int[] pageNumArray = paging.getPageNumArray();
        for (int i = 0; i < pageNumArray.length; i++) {
            if (pageNumArray[i] == paging.getCurPageNum()) {
                buf.append("<button style=\"margin:0 1px;border:0;\" onclick=\"javascript:void(0);\" >" + pageNumArray[i] + "</button>");
            } else {
                buf.append("<button style=\"margin:0 1px;\" onclick=\"javascript:onPaging('" + formId + "','" + requetURI + "','" + pageNumArray[i] + "');\">" + pageNumArray[i] + "</button>");
            }
        }
        
        if (!paging.isLast()) {
        	 buf.append("<button onclick=\"javascript:onPaging('" + formId + "','" + requetURI + "','" + (paging.getCurPageNum() + 1) + "');\">下一页</button>");
        }

        buf.append("<script type=\"text/javascript\">");
        buf.append("function onPaging(formId,url,cur){");
        buf.append("var form = $(\"#\"+formId);");
        buf.append("form.action = url;");
        buf.append("$(\"#curPageNum\").val(cur);");
        buf.append("form.submit();");
        buf.append("}");
        buf.append("</script>");
        return buf.toString();
    }

}
