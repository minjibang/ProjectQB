<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<!DOCTYPE>
<html>
<head>
<meta content="text/html; charset=UTF-8">

<style>
#noticeViewBox{
margin-top:50px;
margin-left:200px;
margin-right:200px;
margin-bottom:50px;
}

div.noticeContent{
padding-top:20px;
padding-left:40px;
padding-right:40px;
padding-bottom:20px;
}

#commentSubmit{
margin-top:10px;
margin-left:10px;
margin-right:10px;
margin-bottom:10px;
}

#commentWriter{
margin-top:10px;
margin-left:10px;
margin-right:10px;
margin-bottom:10px;
}

div.noticeView_Comments_1{
height:50px;
margin-top:10px;
margin-bottom:10px;
}

div.noticeView_Comments_2{
height:50px;
margin-top:5px;
margin-left:15px;
margin-bottom:10px;
}

div.noticeView_CommentsWrite{
margin-top:50px;
margin-bottom:20px;
height:100px;
border:gray 1px solid;
}

textarea {
    resize: none;
}

</style>

</head>
<body>
 <section id="main-content">
 <section class="wrapper site-min-height">
      <section id="noticeViewBox" class="panel">
             
              <div class="panel-body ">
                <div class="mail-header row">
                  <div class="col-md-8 noticeContent">
                    <h4 class="pull-left"> 공지사항 글 제목 자리입니다. </h4>
                  </div>
                  <div class="col-md-4">
                    <div class="compose-btn pull-right">
                        
                    </div>
                  </div>
                </div>
                <div class="mail-sender">
                  <div class="row">
                    <div class="col-md-8">
                      
                    </div>
                    <div class="col-md-4 pull-right">
                      <p class="date"><strong>강사 홍길동</strong>&nbsp; &nbsp; 2018.10.08 &nbsp; &nbsp; 10:48:52 am</p>
                    </div>
                  </div>
                </div>
                  
                <div class="view-mail noticeContent">
                  <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다. 내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이 늘이기3 
                    	내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6 내용테스트를 위한 글 길이 늘이기7
                    	내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9 내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11 
                    	내용테스트를 위한 글 길이 늘이기12 내용테스트를 위한 글 길이 늘이기13 내용테스트를 위한 글 길이 늘이기14 내용테스트를 위한 글 길이 늘이기15 
                    	내용테스트를 위한 글 길이 늘이기16 내용테스트를 위한 글 길이 늘이기17 내용테스트를 위한 글 길이 늘이기18 내용테스트를 위한 글 길이 늘이기19 </p>
                    <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다.</p>
                    <p>공지사항 글 내용 자리입니다.</p>
                </div>
                <div class="attachment-mail noticeContent">
                  <p>
                    <span><i class="fa fa-paperclip"></i> 첨부된 파일 - 2 </span>
                    <a href="#">모두 다운로드</a> 
                  </p>
                  <ul>
                    <li>
                      <a class="atch-thumb" href="#">
                        <img src="img/instagram.jpg">
                        </a>
                      <a class="name" href="#">
                        IMG_001.jpg
                        <span>20KB</span>
                        </a>
                      <div class="links">
                        <a href="#">미리보기</a> -
                        <a href="#">다운로드</a>
                      </div>
                    </li>
                    <li>
                      <a class="atch-thumb" href="#">
                        <img src="img/weather.jpg">
                        </a>
                      <a class="name" href="#">
                        IMG_002.jpg
                        <span>20KB</span>
                        </a>
                      <div class="links">
                        <a href="#">미리보기</a> -
                        <a href="#">다운로드</a>
                      </div>
                    </li>
                  </ul>
                </div>
                <hr>
                
                <div class="noticeView_Comments_1 noticeContent">
                	<div class="col-sm-2"> <strong>양회준</strong> <br> 2018.10.08 &nbsp;&nbsp; 12:02:33 pm </div>
                	<div class="col-sm-8">댓글번호 1번 댓글내용이 들어가는 자리입니다. 이자리는 댓글내용자리!
                	내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이 늘이기3 
                                        내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6 내용테스트를 위한 글 길이 늘이기7
                                        내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9 내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11 </div>
                	<div class="col-sm-2">
					<a href=""><i class="fa fa-reply"></i>답글달기</a>
					</div>
                	
                </div>
                <br>
                <div class="noticeView_Comments_2 noticeContent">
                	<div class="col-sm-2"><strong>우한결</strong> <br> 2018.10.08 &nbsp;&nbsp; 12:12:11 pm </div>
                	<div class="col-sm-8"> ㄴ 대댓글번호 1번 내용이 들어가는 자리입니다. 이자리는 대댓글내용자리!  </div>
                	<div class="col-sm-2">
				    <a href=""><i class="fa fa-reply"></i>답글달기</a>
					</div>
                </div>
                <br>
                <div class="noticeView_Comments_1 noticeContent">
                	<div class="col-sm-2"><strong>조재훈 </strong><br> 2018.10.08 &nbsp;&nbsp; 12:35:09 pm </div>
                	<div class="col-sm-8">댓글번호 2번 댓글내용이 들어가는 자리입니다. 이자리는 댓글내용자리!
                	내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이 늘이기3 
                                        내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6 내용테스트를 위한 글 길이 늘이기7
                                        내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9 내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11
                    </div>
                	<div class="col-sm-2">
				    <a href=""><i class="fa fa-reply"></i>답글달기</a>
				    &nbsp;&nbsp;
				    <a href=""><i class="fa fa-trash-o"></i>삭제</a>
					</div>
                </div>
                <br>
                <div class="noticeView_Comments_1 noticeContent">
                	<div class="col-sm-2"><strong>강사 홍길동</strong> <br> 2018.10.08 &nbsp;&nbsp; 12:35:09 pm </div>
                	<div class="col-sm-8">댓글번호 3번 댓글내용이 들어가는 자리입니다. 이자리는 댓글내용자리!
                	내용테스트를 위한 글 길이 늘이기1 내용테스트를 위한 글 길이 늘이기2 내용테스트를 위한 글 길이 늘이기3 
                                        내용테스트를 위한 글 길이 늘이기4 내용테스트를 위한 글 길이 늘이기5 내용테스트를 위한 글 길이 늘이기6 내용테스트를 위한 글 길이 늘이기7
                                        내용테스트를 위한 글 길이 늘이기8 내용테스트를 위한 글 길이 늘이기9 내용테스트를 위한 글 길이 늘이기10 내용테스트를 위한 글 길이 늘이기11
                    </div>
                	<div class="col-sm-2">
				    <a href=""><i class="fa fa-reply"></i>답글달기</a>
					</div>
                </div>
                <br>
                
                <div class="noticeView_CommentsWrite noticeContent">
                
                <div class="form-group" >
                  <label id="commentWriter" class="col-sm-2 control-label"><strong>조재훈</strong></label>
                  <div class="col-sm-8">
                    <textarea class="wysihtml5 form-control" rows="2"></textarea>
                  </div>
                  <div class="col-sm-1">
                    <button type="button" id="commentSubmit" class="btn btn-info"> 댓글 등록 </button>
                  </div>
                
                </div>
                
                </div>
                
                  <button type="button" class="btn btn-info"> 글 목록 </button>
                  <button type="button" class="btn btn-info"> 글 수정 </button>
                  <button type="button" class="btn btn-danger"> 글 삭제 </button>
                 
                </div>
              
              </section>
            </section>
        </section>
</body>
</html>