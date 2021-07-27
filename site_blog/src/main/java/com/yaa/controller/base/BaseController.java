package com.yaa.controller.base;

import com.yaa.constant.WebConst;
import com.yaa.dto.Types;
import com.yaa.model.Users;
import com.yaa.util.BlogUtils;
import com.yaa.util.IPUtils;
import com.yaa.util.MapCache;

import javax.servlet.http.HttpServletRequest;

public class BaseController {

    protected MapCache cache = MapCache.single();

    public static String THEME = "themes/default";

    public String render(String viewName) {
        return THEME + "/" + viewName;
    }

    public String render404() {
        return "comm/error_404";
    }

    public BaseController title(HttpServletRequest request, String title) {
        request.setAttribute("title", title);
        return this;
    }

    public BaseController keywords(HttpServletRequest request, String keywords) {
        request.setAttribute("keywords", keywords);
        return this;
    }


    /**
     * 检查同一个ip地址是否在2小时内访问同一文章
     *
     * @param request
     * @param cid
     * @return
     */
    public boolean checkHitsFrequency(HttpServletRequest request, Integer cid) {
        String val = IPUtils.getIpAddrByRequest(request) + ":" + cid;
        Integer count = cache.hget(Types.HITS_FREQUENCY.getType(), val);
        if (null != count && count > 0) {
            return true;
        }
        cache.hset(Types.HITS_FREQUENCY.getType(), val, 1, WebConst.HITS_LIMIT_TIME);
        return false;
    }

    /**
     * 获取请求绑定的登录对象
     * @param request
     * @return
     */
    public Users user(HttpServletRequest request) {
        return BlogUtils.getLoginUser(request);
    }


}
