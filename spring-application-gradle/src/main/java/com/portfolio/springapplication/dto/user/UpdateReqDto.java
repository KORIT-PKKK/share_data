package com.portfolio.springapplication.dto.user;

import lombok.Data;

@Data
public class UpdateReqDto {
    private String username;
    private String name;
    private String introduce;
    private String imageUrl;
}
