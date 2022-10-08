package com.hn.controllers;

import com.hn.pojo.Comment;
import com.hn.service.CoachLineService;
import com.hn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiCommentController {

    @Autowired
    private CoachLineService coachLineService;

    @Autowired
    private CommentService commentService;


//    @GetMapping("/coach-line/{coachlineId}/comments")
//    public ResponseEntity<List<Comment>> getComments(@PathVariable(value = "coachlineId") int id) {
//
//        return new ResponseEntity<>(this.coachLineService.getComments(id), HttpStatus.OK);
//    }
//
////    @PostMapping(path = "/products/{productId}/comments", produces = {
////            MediaType.APPLICATION_JSON_VALUE
////    })
////    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
////        String content = params.get("content");
////        int productId = Integer.parseInt(params.get("productId"));
////
////        Comment c = this.productService.addComment(content, productId);
////
////        return new ResponseEntity<>(c, HttpStatus.CREATED);
////    }

    @PostMapping(value = "api/add-comment",produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment>addComment   (@RequestBody Map<String,String>params){
        try{
            String content=params.get("content");
            int accountId=Integer.parseInt(params.get("accountId"));
            int coachlineId=Integer.parseInt(params.get("coachlineId"));
            Comment comment=this.commentService.addComment(content,accountId,coachlineId);
            return new ResponseEntity<>(comment,HttpStatus.CREATED);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
