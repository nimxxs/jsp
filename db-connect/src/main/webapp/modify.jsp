<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file = "include/header.jsp" %>
<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "nimxxs";
	String pw = "1234";
	// 여기까지 고정으로 써야하는 것
	
	Connection conn = null;   //객체 default는 항상 null
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String pLoggedUserId = (String) session.getAttribute("loggedUserId");
	String sql = "select id,name,email,address,lpad(zonecode,5,'0') as changeZonecode," + "detailAddress from member where id = ?";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,pLoggedUserId);
	rs = pstmt.executeQuery();
	String address = null; 
    String detailAddress = null; 
    String zonecode = null; 
    String name = null; 
    String email = null; 
    String extraAddress = null; 
    if(rs.next()){ 
    	address =rs.getString("address"); 
    	detailAddress = rs.getString("detailAddress"); 
    	extraAddress = rs.getString("extraAddress"); 
    	zonecode = rs.getString("changeZonecode"); 
    	name = rs.getString("name");
    	email = rs.getString("email");
    } 

%>

<form action="modfy-process.jsp" method="post" class="join" name="joinForm">
  <div class="container-sm mt-5">
    <div class="row justify-content-center">
      <div class="col-6">
        <div class="input-group mb-3">
          <input type="text" name="userId" class="form-control userId" id="floatingInput" placeholder="아이디를 입력해 주세요." 
          readonly value="<%=pLoggedUserId%>"/>
        </div>
        <div class="mb-3">
          <label for="floatingPassword">Password</label>
          <input type="password" name="userPw" class="form-control" id="floatingPassword" placeholder="Password" />
        </div>
        <div class="mb-3">
          <label for="floatingName">Name</label>
          <input type="text" name="userName" class="form-control" id="floatingName" placeholder="이름을 입력해 주세요." value="<%=name%>"/>
        </div>
        <div class="mb-3">
          <label for="floatingMail">Email</label>
          <input type="email" name="userEmail" class="form-control" id="floatingMail" placeholder="이메일을 입력해 주세요." readonly value="<%=email%>"/>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" id="zonecode" placeholder="우편번호" name="zonecode" readonly value="<%=zonecode%>"/>
          <button class="btn btn-secondary" type="button" id="button-addon2" onclick="searchZonecode()">우편번호</button>
        </div>
        <div class="mb-3">
          <label for="floatingAddress">Address</label>
          <input type="text" name="userAddress" class="form-control address" id="floatingAddress" placeholder="주소를 입력해 주세요." value="<%=address%>"/>
        </div>
        <div class="row mb-3 g-2">
          <div class="col">
            <input type="text" class="form-control detailAddress" placeholder="상세주소" name="detailAddress" value="<%=detailAddress%>"/>
          </div>
          <div class="col">
            <input type="text" class="form-control extraAddress" placeholder="참고사항" name="extraAddress" value="<%=extraAddress%>"/>
          </div>
        </div>
        <div class="text-center">
          <button type="submit" id="btnSubmit" class="btn btn-primary btn-lg">Join</button>
        </div>
      </div>
    </div>
  </div>
</form>
<script>
  const regEmail = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  const userId = document.querySelector(".userId"); //클래스명 .으로 확인
  const btnIdCheck = document.querySelector("#btnIdCheck");
  const btnSubmit = document.querySelector("#btnSubmit");

  const joinForm = document.forms.joinForm;
  console.log(joinForm.elements.userId); // 배열을 return

  let isDoubleCheck = false;

  btnSubmit.addEventListener("click", (e) => {
    //e.preventDefault();
   if (joinForm.elements.userPw.value.trim() === "") {
      e.preventDefault();
      alert("비밀번호를 입력하세요.");
      joinForm.elements.userPw.value = "";
      joinForm.elements.userPw.focus();
    } else if (joinForm.elements.userName.value.trim() === "") {
      e.preventDefault();
      alert("이름을 입력하세요.");
      joinForm.elements.userName.value = "";
      joinForm.elements.userName.focus();
    } else if (joinForm.elements.userEmail.value.trim().match(regEmail) === null) {
      e.preventDefault();
      alert("이메일을 형식에 맞게 입력하세요.");
    } else if (joinForm.elements.zonecode.value.trim() === "") {
      e.preventDefault();
      alert("우편번호를 입력하세요.");
      joinForm.elements.zonecode.focus();
    } else if (joinForm.elements.userAddress.value.trim() === "") {
      e.preventDefault();
      alert("주소를 입력하세요.");
    }
  });
  btnIdCheck.addEventListener("click", () => {
    //console.log(userId.value);
    fetch("idCheck.jsp?userId=" + userId.value)
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        //console.log(data);
        if (data.isOk) {
          //confirm("쓸 수 있는 아이디입니다.");
          //alert("쓸 수 있는 아이디입니다.");
          const result = confirm("쓸 수 있는 아이디입니다. 사용하시겠습니까?");
          if (result) {
            joinForm.elements.userId.setAttribute("readonly", true);
            isDoubleCheck = true;
          } else {
            joinForm.elements.userId.value = "";
            joinForm.elements.userId.focus();
          }
        } else {
          alert("쓸 수 없는 아이디입니다.");
          userId.value = "";
          userId.focus();
        }
      });
  });

  function searchZonecode() {
    new daum.Postcode({
      oncomplete: function (data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        let addr = ""; // 주소 변수
        let extraAddr = ""; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === "R") {
          // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else {
          // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === "R") {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== "" && data.apartment === "Y") {
            extraAddr += extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== "") {
            extraAddr = " (" + extraAddr + ")";
          }
          // 조합된 참고항목을 해당 필드에 넣는다.
          document.querySelector(".extraAddress").value = extraAddr;
        } else {
          document.querySelector(".extraAddress").value = "";
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.querySelector("#zonecode").value = data.zonecode;
        document.querySelector(".address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.querySelector(".detailAddress").focus();
      },
    }).open();
  }

  // const testEmail = "ubub0322@navercom";
  // console.log(testEmail.match(regEmail));
</script>
<%@ include file = "include/footer.jsp" %>