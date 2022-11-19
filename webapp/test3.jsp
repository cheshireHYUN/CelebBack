<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 9. 6.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
html,body {
  font-family: Helvetica, Arial, sans-serif;
  margin: 0;
}
.panel-faq-container {
  margin-bottom: -16px;
}
.panel-faq-title {
  color: #00eaea;
  cursor: pointer;
}
.panel-faq-answer {
  height: 0;
  overflow: hidden;
  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
  왜? 닫기 버튼을 누를 때 변화가 티남 */
  transition: all 1s;
}
.active {
  display: block;
  /* 높이를 정해줘야지만 transition이 적용됨 */
  height: 300px;
}


</style>
















</head>
<body>

<div class="container">
    <h3 style="text-align: center; padding-top: 50px;">
      FAQ
      <small class="text-muted">with faded secondary text</small>
    </h3>
    <button id="btn-all-close">FAQ ALL Close</button>
    <br>
    <table class="table table-bordered table-striped table-dark table-hover">
      <caption>FAQ List of Articles</caption>
      <thead class="thead-light text-center">
        <tr>
          <th>No</th>
          <th>FAQ Title</th>
          <th>Category</th>
          <th>Date</th>
          <th>Hit</th>
        </tr>
      </thead>
      <tbody class="text-center">
        <tr>
          <td>1</td>
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">What is Lorem Ipsum?</p>
              <div class="panel-faq-answer">
                <p>Answer (1) ... ↓</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur.</p>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                  laborum.</p>
              </div>
            </div>
          </td>
          <td>이용안내</td>
          <td>2032.01.01</td>
          <td>84</td>
        </tr>
        <tr>
          <td>2</td>
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">Where does it come from?</p>
              <div class="panel-faq-answer">
                <p>Answer (2) ... ↓</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur.</p>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                  laborum.</p>
              </div>
            </div>
          </td>
          <td>회원가입</td>
          <td>2032.02.02</td>
          <td>114</td>
        </tr>
        <tr>
          <td>3</td>
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">Why do we use it?</p>
              <div class="panel-faq-answer">
                <p>Answer (3) ... ↓</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur.</p>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                  laborum.</p>
              </div>
            </div>
          </td>
          <td>결제관련</td>
          <td>2032.03.03</td>
          <td>98</td>
        </tr>
        <tr>
          <td>4</td>
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">Where can I get some?</p>
              <div class="panel-faq-answer">
                <p>Answer (4) ... ↓</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur.</p>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                  laborum.</p>
              </div>
            </div>
          </td>
          <td>이용안내</td>
          <td>2032.04.04</td>
          <td>43</td>
        </tr>
        <tr>
          <td>5</td>
          <td class="text-left" width="50%">
            <div class="panel-faq-container">
              <p class="panel-faq-title">The standard Lorem Ipsum passage, used since the 1500s</p>
              <div class="panel-faq-answer">
                <p>Answer (5) ... ↓</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                  et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                  dolore eu fugiat nulla pariatur.</p>
                <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
                  laborum.</p>
              </div>
            </div>
          </td>
          <td>배송관련</td>
          <td>2032.05.05</td>
          <td>90</td>
        </tr>
        <tr class="bg-info">
          <td colspan=4 class="text-left">자주 묻는 질문 총 합계</td>
          <td>429</td>
        </tr>
      </tbody>
    </table>
  </div>



<script>
window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // btn-all-close
	  const btnAllClose = document.querySelector("#btn-all-close");
	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}

</script>


</body>
</html>