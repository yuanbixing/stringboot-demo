package com.yaa.service;


import com.yaa.model.Metas;
import com.yaa.model.bo.ResponseBo;

import javax.servlet.http.HttpServletRequest;

public interface CategoryService {

    void getAllCategory(HttpServletRequest request);

    ResponseBo updateCategory(Metas metas);

    ResponseBo addCategory(Metas metas);

    ResponseBo deleteTag(Integer id);

    ResponseBo deleteCate(Integer id);

}
