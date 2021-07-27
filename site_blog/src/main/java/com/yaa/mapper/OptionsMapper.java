package com.yaa.mapper;

import com.yaa.model.Options;
import com.yaa.model.vo.OptionsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OptionsMapper {
    int countByExample(OptionsExample example);

    int deleteByExample(OptionsExample example);

    int deleteByPrimaryKey(String name);

    int insert(Options record);

    int insertSelective(Options record);

    List<Options> selectByExampleWithBLOBs(OptionsExample example);

    List<Options> selectByExample(OptionsExample example);

    Options selectByPrimaryKey(String name);

    int updateByExampleSelective(@Param("record") Options record, @Param("example") OptionsExample example);

    int updateByExampleWithBLOBs(@Param("record") Options record, @Param("example") OptionsExample example);

    int updateByExample(@Param("record") Options record, @Param("example") OptionsExample example);

    int updateByPrimaryKeySelective(Options record);

    int updateByPrimaryKeyWithBLOBs(Options record);

    int updateByPrimaryKey(Options record);
}