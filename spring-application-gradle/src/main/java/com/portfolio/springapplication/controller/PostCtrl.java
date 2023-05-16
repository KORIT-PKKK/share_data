package com.portfolio.springapplication.controller;

import com.portfolio.springapplication.dto.post.PostAddReqDto;
import com.portfolio.springapplication.repository.PostRepo;
import com.portfolio.springapplication.security.auth.UserPrincipalDetail;
import com.portfolio.springapplication.security.auth.UserPrincipalDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/post")
public class PostCtrl {

    @Autowired
    private PostRepo postRepo;

    @Autowired
    private UserPrincipalDetailService userPrincipalDetailService;

    @GetMapping("/list")
    public ResponseEntity<?> getAllPosts() {
        return ResponseEntity.ok().body(postRepo.getAllPosts());
    }

    @GetMapping("/view")
    public ResponseEntity<?> getPostDtl(@RequestParam("postId") int postId) {
        return ResponseEntity.ok().body(postRepo.getPostDetail(postId));
    }

    @GetMapping("/location")
    public ResponseEntity<?> getLocPost(@RequestParam("locId") int locId){
        return ResponseEntity.ok().body(postRepo.getLocPost(locId));
    }

    @PostMapping("/add")
    public ResponseEntity<?> addPost(@RequestBody PostAddReqDto postAddReqDto) {
        UserPrincipalDetail userPrincipalDetail = (UserPrincipalDetail) userPrincipalDetailService.loadUserByUsername(postAddReqDto.getUsername());
        int postId = postRepo.addPost(
                userPrincipalDetail.user().getId(),
                postAddReqDto.getContent(),
                postAddReqDto.getLocId(),
                postAddReqDto.getEvalScore(),
                postAddReqDto.getPicDatas());
        Map<String, Integer> response = new HashMap<>();
        response.put("postId", postId);

        return ResponseEntity.ok().body(response);
    }
}