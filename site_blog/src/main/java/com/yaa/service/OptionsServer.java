package com.yaa.service;

import com.yaa.model.bo.InstallBo;

import java.util.Map;

public interface OptionsServer {

    Map<String, String> getOptionsConfig();

    int updateOptions(InstallBo installBo);

}
