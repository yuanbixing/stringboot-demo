package com.yaa.extension;


import com.vdurmont.emoji.EmojiParser;
import com.yaa.constant.WebConst;
import com.yaa.dto.Types;
import com.yaa.model.Comments;
import com.yaa.model.Contents;
import com.yaa.service.CommentService;
import com.yaa.service.ContentService;
import com.yaa.util.BlogUtils;
import com.yaa.util.TimeUtils;
import com.yaa.util.Tools;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;


/**
 * 主题公共函数
 * <p>
 * Created by 13 on 2017/2/21.
 */
@Component
public final class Commons {

    private static CommentService commentService;
    private static ContentService contentService;

    public Commons(CommentService commentService,ContentService contentService){
        this.commentService = commentService;
        this.contentService = contentService;

    }

    private static final String[] ICONS = {"bg-ico-book", "bg-ico-game", "bg-ico-note", "bg-ico-chat", "bg-ico-code", "bg-ico-image", "bg-ico-web", "bg-ico-link", "bg-ico-design", "bg-ico-lock"};

    private static final String[] COLORS = {"default", "primary", "success", "info", "warning", "danger", "inverse", "purple", "pink"};


    /**
     * 网站链接
     *
     * @return
     */
    public static String site_url() {
        return site_url("");
    }

    /**
     * 网站链接
     *
     * @return
     */
    public static String site_title() {
        return site_option("site_title");
    }

    /**
     * 网站关键字
     *
     * @return
     */
    public static String site_keywords() {
        return site_option("site_keywords");
    }

    /**
     * 网站描述
     * @return
     */
    public static String site_description() {
        return site_option("site_description");
    }


    /**
     * 返回网站链接下的全址
     *
     * @param sub 后面追加的地址
     * @return
     */
    public static String site_url(String sub) {
        return site_option("site_url") + sub;
    }

    /**
     * 网站配置项
     *
     * @param key
     * @return
     */
    public static String site_option(String key) {
        return site_option(key, "");
    }

    /**
     * 网站配置项
     *
     * @param key
     * @param defalutValue 默认值
     * @return
     */
    public static String site_option(String key, String defalutValue) {
        if (StringUtils.isBlank(key)) {
            return "";
        }
        String str = WebConst.initConfig.get(key);
        if (StringUtils.isNotBlank(str)) {
            return str;
        } else {
            return defalutValue;
        }
    }


    /**
     * 显示文章缩略图，顺序为：文章第一张图 -> 随机获取
     *
     * @return
     */
    public static String show_thumb(Contents contents) {
        int cid = contents.getCid();
        int size = cid % 20;
        size = size == 0 ? 1 : size;
        return "/themes/img/rand/" + size + ".jpg";
    }

    /**
     * 显示文章图标
     *
     * @param cid
     * @return
     */
    public static String show_icon(int cid) {
        return ICONS[cid % ICONS.length];
    }

    /**
     * 标签颜色
     * @return
     */
    public static String rand_color() {
        int r = Tools.rand(0, COLORS.length - 1);
        return COLORS[r];
    }


    /**
     * 返回文章链接地址
     *
     * @param contents
     * @return
     */
    public static String permalink(Contents contents) {
        return permalink(contents.getCid(), contents.getSlug());
    }

    /**
     * 返回文章链接地址
     *
     * @param cid
     * @param slug
     * @return
     */
    public static String permalink(Integer cid, String slug) {
        return Commons.site_url("/article/" + (StringUtils.isNotBlank(slug) ? slug : cid.toString()));
    }


    /**
     * 截取文章内容
     * @param value
     * @param len
     * @return
     */
    public static String intro(String value, int len) {
        int pos = value.indexOf("<!--more-->");
        if (pos != -1) {
            String html = value.substring(0, pos);
            return BlogUtils.htmlToText(BlogUtils.mdToHtml(html));
        } else {
            String text = BlogUtils.htmlToText(BlogUtils.mdToHtml(value));
            if (text.length() > len) {
                return text.substring(0, len);
            }
            return text;
        }
    }

    /**
     * 显示分类
     *
     * @param categories
     * @return
     */
    public static String show_categories(String categories) throws UnsupportedEncodingException {
        if (StringUtils.isNotBlank(categories)) {
            String[] arr = categories.split(",");
            StringBuffer sbuf = new StringBuffer();
            for (String c : arr) {
                sbuf.append("<a href=\"/category/" + URLEncoder.encode(c, "UTF-8") + "\">" + c + "</a>");
            }
            return sbuf.toString();
        }
        return show_categories("默认分类");
    }

    /**
     * 显示标签
     * @param tags
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String show_tags(String tags) throws UnsupportedEncodingException {
        if (StringUtils.isNotBlank(tags)) {
            String[] arr = tags.split(",");
            StringBuffer sbuf = new StringBuffer();
            for (String c : arr) {
                sbuf.append("<a href=\"/tag/" + URLEncoder.encode(c, "UTF-8") + "\">" + c + "</a>");
            }
            return sbuf.toString();
        }
        return "";
    }

    /**
     * 显示文章内容，转换markdown为html
     *
     * @param value
     * @return
     */
    public static String article(String value) {
        if (StringUtils.isNotBlank(value)) {
            value = value.replace("<!--more-->", "\r\n");
            return BlogUtils.mdToHtml(value);
        }
        return "";
    }

    /**
     * 格式化unix时间戳为日期
     *
     * @param unixTime
     * @return
     */
    public static String fmtdate(Integer unixTime) {
        return TimeUtils.fmtdate(unixTime, "yyyy-MM-dd");
    }

    /**
     * 格式化unix时间戳为日期
     *
     * @param unixTime
     * @return
     */
    public static String fmtdate(Integer unixTime,String patten) {
        return TimeUtils.fmtdate(unixTime, patten);
    }

    /**
     * An :grinning:awesome :smiley:string &#128516;with a few :wink:emojis!
     * <p>
     * 这种格式的字符转换为emoji表情
     *
     * @param value
     * @return
     */
    public static String emoji(String value) {
        return EmojiParser.parseToUnicode(value);
    }


    /**
     * 返回github头像地址
     *  https://avatars0.githubusercontent.com/u/25025324?s=400&u=cf02830d6b8164ce0cd1c57b659cec1ab89cf4d0&v=4
     * @param email
     * @return
     */
    public static String gravatar(String email) {
        String avatarUrl = "https://secure.gravatar.com/avatar/";
//        String avatarUrl = "https://github.com/identicons/";
        if (StringUtils.isBlank(email)) {
            email = "yanghbwork@163.com";
        }
        String hash = BlogUtils.MD5encode(email.trim().toLowerCase());
        return avatarUrl + hash + ".png";
    }

    /**
     * 获取评论at信息
     *
     * @param coid
     * @return
     */
    public static String comment_at(Integer coid) {
        if(commentService == null){
            return "";
        }
        Comments comments = commentService.getComments(coid);
        if (null != comments) {
            return "@" + comments.getAuthor();
        }
        return "";
    }

    /**
     * 当前文章的上一篇文章链接
     *
     * @return
     */
    public static String thePrev(Integer cid) {
        Contents contents = article_prev(cid);
        if (null != contents) {
            return permalink(contents);
        }
        return "";
    }

    /**
     * 当前文章的下一篇文章链接
     *
     * @return
     */
    public static String theNext(Integer cid) {
        Contents contents = article_next(cid);
        if (null != contents) {
            return permalink(contents);
        }
        return "";
    }

    /**
     * 最新文章
     *
     * @param limit
     * @return
     */
    public static List<Contents> recent_articles(Integer limit) {
        List<Contents> contents = contentService.getNewContents(limit);
        return contents;
    }

    /**
     * 最新评论
     *
     * @param limit
     * @return
     */
    public static List<Comments> recent_comments(int limit) {
        List<Comments> comments = commentService.recentComments(limit);
        return comments;
    }

    /**
     * 返回社交账号链接
     *
     * @param type
     * @return
     */
    public static String social_link(String type) {
        String id = Commons.site_option("social_" + type);
        if (id == null || "".equals(id)) {
            return "javascript:void(0);";
        }
        switch (type) {
            case "github":
                return "https://github.com/" + id;
            case "weibo":
                return "http://weibo.com/" + id;
            case "twitter":
                return "https://twitter.com/" + id;
            case "zhihu":
                return "https://www.zhihu.com/people/" + id;
            default:
                return "javascript:void(0);";
        }
    }

    /**
     * 获取当前文章的上一篇
     *
     * @return
     */
    private static Contents article_prev(Integer cid) {
        Contents cur = contentService.getContents(cid);
        return null != cur ? contentService.getNhContent(Types.PREV.getType(), cur.getCreated()) : null;
    }

    /**
     * 获取当前文章的下一篇
     *
     * @return
     */
    private static Contents article_next(Integer cid) {
        Contents cur = contentService.getContents(cid);
        return null != cur ? contentService.getNhContent(Types.NEXT.getType(), cur.getCreated()) : null;
    }

}
