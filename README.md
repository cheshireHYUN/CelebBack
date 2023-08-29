# CelebBack

![](https://velog.velcdn.com/images/cheshirehyun/post/1fbb0a74-9cc4-48b2-a40f-20b411de6ddc/image.png)

[회고록](https://velog.io/@cheshirehyun/%EA%B0%80%EB%A7%B9%EC%A0%90-%EA%B4%80%EB%A6%AC-%EC%8B%9C%EC%8A%A4%ED%85%9C-CelebBack-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8)을 참고하여 작성하였습니다


### 개요
> 프랜차이즈의 **가맹점주**들이 가게를 운영하면서 필요한 기능들을 **하나의 웹페이지에서 처리**할 수 있지 않을까? 하는 고민에서 시작하였습니다. 본사로부터 제품을 구매해 **재고를 관리**하고, **예약을 받아 음식을 판매**하기까지의 모든 과정을 본 웹 안에서 해결할 수 있도록 구현했습니다.

`개발기간` - 2022.07.20 ~ 2022.09.16

`팀 구성` - 풀스택 5인

`담당기능` 
- 가맹/본사의 메뉴 등록, 삭제 구현
- jQuery UI 라이브러리를 사용하여 좌석배치도 설정 구현
- 공과금, 본사청구액을 월별로 계산하여 납부할 수 있도록 구현
- 설정기간동안의 매출을 분석한 차트 구현
- 예약을 위해 모든 가맹점의 정보 조회
- 가맹점을 선택하여 예약(날짜, 시간, 좌석, 메뉴, 쿠폰) 구현
- 아임포트 결제api를 사용하여 결제 구현

`사용기술 & 라이브러리`
- Java
- Spring framework
- JSP, JSTL
- HTML, CSS
- Javascript, jQuery
- jQuery-ui Library
- Chart.js
- BootStrap
- Ajax
- Oracle SQL Developer
- Tomcat 8.5
- Slf4j
- 아임포트 결제api
- SVN

<br>
<br>

---
## # 설계 ERD
![](https://velog.velcdn.com/images/cheshirehyun/post/6482e224-d76f-4874-9fc7-18c1062ac883/image.png)
DB설계가 코드구현에 큰 영향을 미치므로 효율적으로 설계하기위해 노력했습니다.
특히 신경썼던 부분은 다음과 같습니다.


<br>
<br>

### 1. 재고관리
![](https://velog.velcdn.com/images/cheshirehyun/post/12b61851-56e9-436f-8278-32497144d9f7/image.png)
입출고테이블이 있으니 뷰형태로만 존재하게 할지, 테이블을 설계할지 고민이 많았습니다. 결론적으로 본사의 제품명이 변화할 수 있으니 반드시 테이블로서 존재해야하고, 이후 발주시스템에 있어서도 테이블형태가 유리하다고 판단하였습니다.
이렇게 판매상품 데이터의 인서트 순서는 `거래처 -> 거래처제품 -> 본사입고 -> 본사재고 -> 발주 -> 발주상세 ->  본사출고 -> 본사재고 -> 가맹점입고 -> 가맹점 재고 -> (이후 일반회원단 주문에 따라서) 가맹점출고 -> 가맹점재고` 순으로 진행됩니다.

<br>
<br>

### 2. 발주
![](https://velog.velcdn.com/images/cheshirehyun/post/96e18001-213f-4fb3-8c16-28f218623294/image.png)
주문한 모든 제품명이 적힌 발주상세테이블과 모든 발주건을 확인할 수 있는 발주테이블로 이루어져 있습니다. 본사에서 출고될때 이 발주번호를 이용합니다. 제품가격은 변화할 수 있으니 발주테이블에 총발주금액을 기록해주고, 발주상태는 공통코드를 통해 주문완료, 배송중, 주문확정으로 변화합니다. 

<br>
<br>

### 3. 공통코드 
![](https://velog.velcdn.com/images/cheshirehyun/post/949c1f75-9b42-4f8b-a66f-2e8d2590226f/image.png)
공통코드를 사용하여 여러 테이블에서 사용하며, 그 의미를 편하게 알 수 있도록 설계하였습니다. 총 99개의 공통코드가 사용되었으며 회원유형, 메뉴, 지역과 같은 정보도 공통코드화 하였습니다.

<br>
<br>

### 4. 공용첨부파일

![](https://velog.velcdn.com/images/cheshirehyun/post/a4e5db4d-def8-4c71-8409-ffe8c122ea2c/image.png)

본사, 가맹점, 일반회원에게 각각 첨부파일을 사용하는 다양한 게시판(공문, 알림, 쿠폰, 공지사항, 메뉴 등)이 존재합니다. 처음 시도는 각 게시판 테이블마다 부속된 첨부파일 테이블을 만드는것이었으나 그 수가 너무 많고 같은기능의 중복이며, 프로젝트 특성상 대용량 데이터의 집중이 일어나는 일도 없기에 하나로 합치자는 제안을 하였습니다. 첨부파일을 등록한 시점의 테이블명과 해당 테이블의 기본키를 추출해 첨부파일 테이블에 등록합니다. 썸네일 경로도 함께 등록해줍니다.

<br>
<br>

### 5. 주문
![](https://velog.velcdn.com/images/cheshirehyun/post/03c642fe-43e4-4b19-836f-e1aa7bcd5bba/image.png)
시행착오가 많았던 테이블입니다. 가맹점에서 예약을 받고, 선택한 메뉴와 좌석정보를 가져와서 저장해야합니다. 1예약당 여러개의 메뉴가 존재할수있다는점과, 예약을 하지않은 손님의 주문건까지 포함하여 결제가 가능하도록 만들었습니다. 따라서 예약 발생시 예약테이블에 정보가 들어오고 상세한 메뉴정보가 주문 테이블에 들어오게됩니다. 비예약 손님의 경우 예약테이블을 거치지않고 바로 주문테이블로 들어오며 예약번호가 null로 존재하게됩니다. 따라서 결제로 넘어갈때 주문번호가 결제단으로 넘어가 결제정보가 저장됩니다. 이렇게 예약손님과 비예약손님의 주문건을 모두 결제까지 무사히 저장 할 수 있었습니다.
<br>
<br>

---


※ 제가 구현한 기능 위주로 요약한 내용입니다.


## # 시연
※ leftMenu에서 원하는 페이지로 이동할때를 제외하고는 대부분 AJAX 비동기처리를 이용해 데이터를 처리하였습니다.


### 1. 본사로그인
![](https://velog.velcdn.com/images/cheshirehyun/post/8284b00a-40dc-4c8e-8b53-d89edae1fe41/image.gif)
우선 본사로 로그인했을때의 기능입니다. 로그인시 본사 관리페이지로 전환됩니다.

<br>
<br>


### 2. 본사 메뉴 조회
![](https://velog.velcdn.com/images/cheshirehyun/post/7a603112-4224-4f10-b402-4e2b81d7ed8e/image.gif)
본사에서 그동안 등록한 메뉴의 정보들을 볼 수 있습니다. 탭을 이용해서 에피타이저, 메인메뉴, 디저트를 구분해서 보여줍니다. 각 카드의 상단 X버튼을 누르면 해당 메뉴가 삭제됩니다.

<br>
<br>


### 3. 본사 메뉴등록
![](https://velog.velcdn.com/images/cheshirehyun/post/849f8bb0-420a-4fb9-9fa2-4b10bfd2b9a8/image.gif)
위에서 본 메뉴들은 여기서 등록해줍니다! 첨부파일을 통해 메뉴이미지를 등록해주고, 메뉴의 유형을 선택합니다. 그리고 재료를 선택하는데요, 거래처로부터 입고할 수 있는 모든 제품정보들을 SelectBox를 통해 멀티로 선택합니다. 메뉴이름과 설명, 가격, 출시일을 설정하고 저장하면 메뉴가 등록완료 됩니다. 저는 새로운 메뉴인 크림파스타를 등록해보았습니다.

<br>
<br>

---

### 4. 가맹점 로그인
![](https://velog.velcdn.com/images/cheshirehyun/post/234cf56f-8a09-4a28-bc3c-8a528a84900e/image.gif)
다음은 가맹점입니다. 가맹점 아이디로 로그인하면 가맹점관리화면으로 이동합니다.
<br>
<br>


### 5. 가맹점 메뉴관리
![](https://velog.velcdn.com/images/cheshirehyun/post/58e7191e-2705-4128-bf95-40e953efbd07/image.gif)
본사에서 등록해둔 해당 프랜차이즈의 메뉴들을 볼 수 있습니다. 두 영역으로 나뉘어있는 이유는 많은 메뉴중 해당 가맹점에서 서비스할 메뉴들만 선택 할 수 있도록 하기 위해서 입니다. 왼쪽영역이 서비스중이 아닌 메뉴인데, 방금 등록한 크림파스타가 있는것을 볼 수 있습니다. 오른쪽으로 드래그앤 드랍하여 이제부터 판매하도록 하겠습니다.


<br>
<br>


### 6. 가맹점 좌석관리
다음은 좌석관리 기능입니다. 보통 레스토랑을 예약할때 좌석을 선택할 수 없는 경우가 많습니다. 인원수를 말하면 준비된 좌석을 안내해주는 방식이 일반적입니다. 따라서 앉고싶은 좌석을 선택할수도 없고, 예약이 차있으면 물어보고 날짜를 바꿔야합니다. 저희는 이런 문제점을 더욱 편리하게 만들기 위해 좌석관리 시스템을 제작하였습니다.

![](https://velog.velcdn.com/images/cheshirehyun/post/c5eda7da-d167-4ac1-8d9b-719bd2cab9da/image.gif)
이미 전에 좌석이 등록되어있지만, 해당 가맹점이 리모델링되었다고 가정해봅시다. 좌석관리에 들어와서 좌석배치하기 버튼을 클릭 후 열리는 모달창에 각 테이블의 갯수를 입력합니다. 그러면 새 창이 열리며 도움말이 켜집니다.

![](https://velog.velcdn.com/images/cheshirehyun/post/a01fc5fa-101a-41d3-9ef9-1e6197517c6e/image.gif)
문과 각 좌석들을 드래그앤 드랍으로 이동시켜 배치합니다. jQuery-ui 라이브러리를 사용하여 배치할때 정렬이 잘 되도록 만들었습니다. 더블클릭하면 해당 요소의 방향이 바뀌므로 실제 좌석배치도와 유사하게 구성 할 수 있도록 구현했습니다. 배치를 완료한 뒤 저장버튼을 누르고 새로고침 버튼을 누르면 좌석 배치가 정상적으로 저장된것을 확인할 수 있습니다.



<br>
<br>


### 7. 가맹점 관리비 납부
![](https://velog.velcdn.com/images/cheshirehyun/post/2bb4b155-38bb-4fd7-843c-57860f41c275/image.gif)
가맹점을 운영하다보면 매입매출에 대한 분석이 필요할것입니다. 더 상세한 분석을 위해 관리비를 입력해둘 수 있습니다.
![](https://velog.velcdn.com/images/cheshirehyun/post/c6678fea-780d-4585-9178-fa2542064926/image.gif)
수도세, 전기세, 가스비를 입력할때마다 합계가 계산되어 하단에 표시되고, 저장하기를 통해 저장할 수 있습니다. 저장하는 즉시 오른쪽 영역의 차트가 갱신됩니다. 수정했을때도 동일하게 동작합니다.

<br>
<br>


### 8. 가맹점 본사청구액 납부
![](https://velog.velcdn.com/images/cheshirehyun/post/83fb098c-625c-400a-8477-abd3b99dcc73/image.gif)
다음은 본사청구액에 대한 납부화면입니다. 프랜차이즈 이용비, 로열티, 제품구입비, 트레이딩비용 등 저희가 세운 정책에 따라 매달 가맹점이 본사에 납부할돈이 자동으로 계산되어 표시됩니다. 각 금액을 클릭하면 해당 금액에 대한 상세정보도 확인 가능합니다.

![](https://velog.velcdn.com/images/cheshirehyun/post/e0661bad-fffd-4311-a6d0-8e13d1147538/image.gif)
납부하기를 클릭하면 납부날짜가 저장됩니다. 아직 납부일이 되지 않은 날짜로 이동하면 납부기간이 아니라는 글씨와 함께 버튼이 비활성화 됩니다.

<br>
<br>


### 9. 가맹점 영업분석
![](https://velog.velcdn.com/images/cheshirehyun/post/df27cb1f-d298-47ee-aabc-f40e625bd88b/image.gif)
가맹점의 영업내역에 대한 분석을 할 수 있습니다. 상단의 날짜검색버튼을 통해 분석을 원하는 기간을 선택할 수 있습니다. 해당기간동안 늘어난 찜의 갯수, 리뷰의 갯수, 그리고 인기메뉴인 판매순위 Top3를 확인할수있고, 판매메뉴의 비율을 원형차트로 볼 수 있습니다. 또한 일별 총 방문자 대비 예약자수를 꺾은선 그래프로 볼 수 있습니다. 밑의 두 차트는 Chart.js를 활용하였습니다.
<br>
<br>


---

### 10. 일반회원 로그인
![](https://velog.velcdn.com/images/cheshirehyun/post/976f93cb-21ee-469e-91c5-0efe144ebbdf/image.gif)
마지막으로 일반회원으로 로그인했을때입니다. 일반회원 메인페이지로 이동합니다.
<br>
<br>


### 11. 일반회원 매장조회
![](https://velog.velcdn.com/images/cheshirehyun/post/6f60b93f-9ee2-4739-b6a4-fce2a97fc64d/image.gif)
매장조회시 AJAX를 이용하여 페이징처리 하였습니다.
매장상태가 영업중인 매장만 조회할 수 있도록 하였으며, 매장 이름을 클릭하면 해당 매장의 상세정보 페이지로 전환됩니다.

<br>
<br>


### 12. 일반회원 매장상세조회
![](https://velog.velcdn.com/images/cheshirehyun/post/6497788d-382e-4e0c-9585-dab84fbe3e3b/image.gif)
위의 가맹점주 관리창에서 설정했던 서비스중인 메뉴들이 표시됩니다. 본사에서 등록하여 가맹점주가 추가한 크림파스타가 조회되는것을 볼 수 있습니다.

<br>
<br>


### 13. 일반회원 예약
이제 예약을 진행해보겠습니다.
![](https://velog.velcdn.com/images/cheshirehyun/post/bf21b54b-dae7-42cd-a5c3-aecbdbafaa74/image.gif)
우선 날짜와 시간대, 인원수, 좌석을 선택합니다. 선택한 날짜와 시간대에 대해 이미 예약된 좌석이 존재할것입니다. 그러한 좌석들은 선택할 수 없도록 좌석버튼이 비활성화 되어있도록 구현하였습니다.

![](https://velog.velcdn.com/images/cheshirehyun/post/bbe3152f-ffc0-4180-93eb-f5b57d8a101a/image.gif)
메뉴 우측의 +버튼을 통해 주문내역에 추가합니다. 또한 각 회원이 보유한 쿠폰을 사용할 수 있는데, 이때 쿠폰은 사용한적이없고, 사용기한이 지나지 않은 쿠폰들만이 조회됩니다. 다만 쿠폰 사용 조건에따라 사용 불가할 수도 있습니다. 해당 쿠폰은 신메뉴 파스타를 주문했을때만 사용 가능하므로 기브미파이브와 샐러드만 주문내역에 추가한 상태에선 요건을 충족하지 못하여 사용 불가능하다는 alert가 뜹니다.

![](https://velog.velcdn.com/images/cheshirehyun/post/9541a33e-a5da-4c24-abe0-b8457fa366d2/image.gif)
신메뉴 파스타를 포함하여 몇가지 메뉴를 더 추가한뒤, 결제를 합니다. 


![](https://velog.velcdn.com/images/cheshirehyun/post/ee056507-1fa4-471c-abaa-b750e0f9f90d/image.gif)
주의할점은 현장결제를 선택할 경우 결제없이 예약이 가능하지만 쿠폰사용이 불가능해진다는 점입니다.


![](https://velog.velcdn.com/images/cheshirehyun/post/0da21fe7-9df0-4645-84df-ec8826a5148e/image.gif)
미리결제를 선택하고 쿠폰을 적용한 뒤 결제api로 이동합니다. (api특성상 실제로 돈이 빠져나가기 때문에 결제금액은 100원으로 고정해두었습니다..)
결제후 아임포트의 서버와 통신하며 결제요청금액과 실제결제금액이 일치하는지 imp_id를통해 비교하는 검증과정을 거치도록 설계했습니다. 


![](https://velog.velcdn.com/images/cheshirehyun/post/e0fe959b-fd16-46cf-93a2-8a5a351b6fa4/image.gif)
검증에 통과되면 예약완료 화면으로 넘어갑니다.

## # 깨달은점

- [[Spring] @Transactional은 컨트롤러에서 동작하지 않는다.](https://velog.io/@cheshirehyun/Transactional%EC%9D%80-%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC%EC%97%90%EC%84%9C-%EB%8F%99%EC%9E%91%ED%95%98%EC%A7%80-%EC%95%8A%EB%8A%94%EB%8B%A4)
    
- [동적으로 바인딩된 요소에 이벤트 추가하기](https://velog.io/@cheshirehyun/%EB%8F%99%EC%A0%81%EC%9C%BC%EB%A1%9C-%EB%B0%94%EC%9D%B8%EB%94%A9%EB%90%9C-%EC%9A%94%EC%86%8C%EC%97%90-%EC%9D%B4%EB%B2%A4%ED%8A%B8-%EC%B6%94%EA%B0%80%ED%95%98%EA%B8%B0)
    
- [JSON Array를 컨트롤러로 보내기](https://velog.io/@cheshirehyun/JSON-Array%EB%A5%BC-%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC%EB%A1%9C-%EB%B3%B4%EB%82%B4%EA%B8%B0)
    
- [JSONArray에서 Object To Double](https://velog.io/@cheshirehyun/JSONArray%EC%97%90%EC%84%9C-Object-To-Double)
    
- [mapUnderscoreToCamelCase](https://velog.io/@cheshirehyun/mapUnderscoreToCamelCase)
    
- [자바 리플렉션 - 의존성 주입](https://velog.io/@cheshirehyun/%EC%9E%90%EB%B0%94-%EB%A6%AC%ED%94%8C%EB%A0%89%EC%85%98-%EC%9D%98%EC%A1%B4%EC%84%B1-%EC%A3%BC%EC%9E%85)
    
- [나중에 추가 결제검증로직](https://velog.io/@cheshirehyun/%EB%82%98%EC%A4%91%EC%97%90-%EC%B6%94%EA%B0%80-%EA%B2%B0%EC%A0%9C%EA%B2%80%EC%A6%9D%EB%A1%9C%EC%A7%81)
    
- [좌표값 이용시 기준점 설정하기](https://velog.io/@cheshirehyun/%EC%A2%8C%ED%91%9C%EA%B0%92-%EC%9D%B4%EC%9A%A9%EC%8B%9C-%EA%B8%B0%EC%A4%80%EC%A0%90-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0)
    
- [MyBatis 조회된 Row가 없을때 VO에서 받기](https://velog.io/@cheshirehyun/MyBatis-%EC%A1%B0%ED%9A%8C%EB%90%9C-Row%EA%B0%80-%EC%97%86%EC%9D%84%EB%95%8C-VO%EC%97%90%EC%84%9C-%EB%B0%9B%EA%B8%B0)
    
- [태그의 post 전송, 요청데이터가 바인딩되는 기준](https://velog.io/@cheshirehyun/form%ED%83%9C%EA%B7%B8%EC%9D%98-post-%EC%A0%84%EC%86%A1-%EC%9A%94%EC%B2%AD%EB%8D%B0%EC%9D%B4%ED%84%B0%EA%B0%80-%EB%B0%94%EC%9D%B8%EB%94%A9%EB%90%98%EB%8A%94-%EA%B8%B0%EC%A4%80)
    
- [[Mybatis] SelectKey 사용하기](https://velog.io/@cheshirehyun/SelectKey-사용하기)
    
- [[DB] LISTAGG 마스터하기](https://velog.io/@cheshirehyun/LISTAGG)
    
- [MyBatis 조회된 Row가 없을때 VO에서 받기](https://velog.io/@cheshirehyun/MyBatis-%EC%A1%B0%ED%9A%8C%EB%90%9C-Row%EA%B0%80-%EC%97%86%EC%9D%84%EB%95%8C-VO%EC%97%90%EC%84%9C-%EB%B0%9B%EA%B8%B0)


## # 느낀점
프로젝트를 진행하면서, '할수 있을까?' 라는 생각이 '해냈다!'가 되는 과정이 정말 즐거웠습니다.

오류를 해결하려고 며칠씩 붙잡아도 보고, 복잡한 쿼리를 짜기위해 온종일 고민도 해보고, 처음 사용해보는 api와 라이브러리를 사용하기위해 계속해서 문서를 읽고 끝없이 시도해보면서 스스로 성장하고있음을 느꼈습니다. **특히 이전에 게임판매 사이트를 구현할때, 실수했던 점인 `테이블 설계`와 `결제단 api`사용에 대해 이번 프로젝트에선 실수없이 모두 이해하며 업그레이드 시켰다는 점이 굉장히 뿌듯했습니다!**
또한 좌석을 커스텀하여 예약자가 선택할 수 있도록 구현하였는데, 이는 졸업작품으로 영화예매페이지를 만들때 굉장히 애를먹고 어려워했던 부분이었습니다. 결국 팀원의 도움으로 완성했던 파트였는데 이번 프로젝트에서 커스텀기능까지 추가해서 혼자 구현할 수 있게되어 성장했음을 느낄 수 있었습니다.
마지막으로, **팀워크의 중요성**을 절실히 느끼게 된 팀프로젝트였습니다! 명확한 가이드라인과 산출물을 사전에 꼼꼼히 작성하여 진행했습니다. 때문에 기능적으로 엇갈릴일이 없었고, 주제에 대해 모두 명확히 숙지할 수 있었습니다. 또한 프로젝트 기간 내내 누군가 문제가 생기면 함께 고민해주고, 매일 충분한 회의를 통해 진척도를 확인했으며 하고싶은 기능에 대해 어필하고 수용하도록 했습니다. 덕분에 우수상이라는 좋은 결과를 얻게되었습니다!












