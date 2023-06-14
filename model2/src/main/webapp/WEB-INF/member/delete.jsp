<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "../include/header.jsp" %>
<body>
  <form action="../member/deleteProcess" method="post" class="join">
    <div class="container-sm">
      <div class="row mt-5 justify-content-center">
        <div class="col-6">
          <div>
            <input type="hidden" name="userId" class="form-control" id="floatingInput" placeholder="아이디를 입력해 주세요." value="${loggedMember.id }" readonly/>
          </div>
          <div class="form-floating mb-3">
            <input type="password" name="userPw" class="form-control" id="floatingPassword" placeholder="Password" />
            <label for="floatingPassword">비밀번호 확인</label>
          </div>
          <div class="text-center">
            <button type="submit" class="btn btn-primary btn-lg">회원탈퇴</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</body>
<%@ include file = "../include/footer.jsp" %>
