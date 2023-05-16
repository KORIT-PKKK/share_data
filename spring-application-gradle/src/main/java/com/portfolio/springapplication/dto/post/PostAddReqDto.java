package com.portfolio.springapplication.dto.post;

import lombok.Data;

@Data
public class PostAddReqDto {
    private String username;
    private String content;
    private int locId;
    private int evalScore;
    private String picDatas;
}
