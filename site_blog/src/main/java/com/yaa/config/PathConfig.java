package com.yaa.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="blog")
public class PathConfig {

    private String filePath;

    private String database;

    private String mysqlExec;

    private String backupPath;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getMysqlExec() {
        return mysqlExec;
    }

    public void setMysqlExec(String mysqlExec) {
        this.mysqlExec = mysqlExec;
    }

    public String getBackupPath() {
        return backupPath;
    }

    public void setBackupPath(String backupPath) {
        this.backupPath = backupPath;
    }
}
