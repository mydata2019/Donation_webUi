<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0">
  <meta name="format-detection" content="telephone=no">
  <title>SK C&C MVNO</title>
  <link rel="stylesheet" href="../css/common.css">
  <!-- model에서 받아온 INPUT values -->
  <input type="hidden" id="SV_ACNT_NUM" name="SV_ACNT_NUM" value=${param.SV_ACNT_NUM} />
  <input type="hidden" id="MVNO_CO_CD" name="MVNO_CO_CD" value=${param.MVNO_CO_CD} />

  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/charging_request.js"></script>
  <script type="text/javascript" src="../js/ui.js"></script>
</head>
<body>
  <div id="wrap" class="brand1">
      <header>
          <h1>충전하기</h1>
      </header>
      <div id="container">
          <p class="brandLogo"></p>
          <!--서비스 기본정보 조회-->
          <div class="contBox userInfo">
              <span id="custNm">${param.CUST_NM}</span>
              <span id="svcNum">${param.SVC_NUM}</span>
          </div>
          <!--권종정보 조회-->
          <div class="contBox">
              <div class="chargeArea">
                  <div class="selBill">
                      <p class="tit">충전 권종 선택 </p>
                      <button type="button" class="btnLayer" id="billName" onclick="layerOpne('billSel')">충전할 권종을 선택하세요.</button>
                      <div class="total">
                          총 결제금액
                          <span id="billPrice"><em>0</em>원</span>
                      </div>
                  </div>
                  <div class="selPay">
                      <p class="tit">결제정보</p>
                      <ul class="selMethod">
                          <li class="on"><span id="payReal">BAND카드</span></li>
                          <li><span id="payCard">신용카드</span></li>
                          <li><span id="payVrBank">입금전용계좌</span></li>
                      </ul>
                      <div class="methodDetail">
                          <!-- 실물BAND카드-->
                          <ul class="detailInput">
                              <li>
                                  <span>카드번호</span>
                                  <span><input type="number" placeholder="카드번호를 입력하세요." min="11" max="11" id="realCardNum" onclick="getBandCardNum()"></span>
                              </li>
                          </ul>
                      </div>

                      <div class="methodDetail" style="display:none">
                          <!-- 신용카드-->
                          <ul class="detailInput credit">
                              <li><button type="button" class="btnLayer" id="cardName" onclick="layerOpne('cardSel')">카드사를 선택하세요.</button></li>
                              <li>
                                  <span>카드번호</span>
                                  <span><input type="number" placeholder="카드번호를 입력하세요." min="16" max="16" id="creditCardNum"></span>
                              </li>
                              <li>
                                  <span>유효기간</span>
                                  <span>
                                      <span class="uiSelect">
                                          <select name="" id="">
                                              <option value="" selected>월</option>
                                              <option value="">01</option>
                                              <option value="">02</option>
                                              <option value="">03</option>
                                              <option value="">04</option>
                                              <option value="">05</option>
                                              <option value="">06</option>
                                              <option value="">07</option>
                                              <option value="">08</option>
                                              <option value="">09</option>
                                              <option value="">10</option>
                                              <option value="">11</option>
                                              <option value="">12</option>
                                          </select>
                                      </span>
                                      <span class="uiSelect">
                                          <select name="" id="">
                                              <option value="" selected>년</option>
                                              <option value="">2019</option>
                                              <option value="">2020</option>
                                              <option value="">2021</option>
                                          </select>
                                      </span>
                                  </span>
                              </li>
                              <li>
                                  <span>생년월일</span>
                                  <span><input type="number" placeholder="6자리 입력" min="6" max="6"></span>
                              </li>
                              <li>
                                  <span>카드 비밀번호</span>
                                  <span><input type="number" placeholder="앞 2자리 입력" min="2" max="2" id="passWord"></span>
                              </li>
                          </ul>

                          <div class="agreeArea">
                              <div class="agreeAll">
                                  <span class="uiChk">
                                      <input type="checkbox" id="agreeAll" name="agreeAll"><label for="agreeAll">전체 동의하기</label>
                                  </span>
                              </div>
                              <ul class="agreeList">
                                  <li class="uiChk"><input type="checkbox" id="agree01" name="agree"><label for="agree01">결제정보 및 개인정보 취급방침 동의 (필수)</label> <a href="javascript:;" class="btnTermsView" onclick="layerOpne('term1')">[보기]</a></li>
                              </ul>
                          </div>
                      </div>

                      <div class="methodDetail" style="display:none">
                        <!-- 입금전용계좌-->
                          <button type="button" class="btnLayer" id="bankName" onclick="layerOpne('bankSel')">은행을 선택하세요.</button>

                          <ul class="dataList mgt25" style="display:none;">
                              <li><span>입금계좌</span>
                                  <span><input type="number" min="16" max="16" id="vrBankNum"></span></li>
                              <li><span>예금주</span><span>㈜SK 7mobile</span></li>
                          </ul>
                      </div>
                  </div>
              </div>
          </div>
          <!-- 충전하기-->
          <div class="btnArea">
            <form id="chrg">
              <input type="hidden" id="svAcntNum" name="svAcntNum" value="" />
              <input type="hidden" id="opDt" name="opDt" value="" />
              <input type="hidden" id="userId" name="userId" value=""   />
              <input type="hidden" id="orgId" name="orgId" value=""   />
              <input type="hidden" id="payAmt" name="payAmt" value=""   />
              <input type="hidden" id="cardNum" name="cardNum" value=""   />
              <input type="hidden" id="payMthd" name="payMthd" value=""   />
              <input type="hidden" id="crdCardNum" name="crdCardNum" value=""   />
              <input type="hidden" id="bankCardCoCd" name="bankCardCoCd" value=""   />
              <input type="hidden" id="pwd" name="pwd" value=""   />
              <input type="hidden" id="mvnoCoCd" name="mvnoCoCd" value=""   />
              <input class="btnL" type="submit" value="충전하기" onclick="go_to_chrg()"/>
            </form>
          </div>
      </div>
  </div>

  <!-- 사업자별 권종정보 조회 -->
  <div class="layerPopfull" id="billSel" style="display:none;">
      <p class="popHead">권종 선택</p>
      <div class="popCont">
          <ul class="billList">
<!--                      <li><a href="javascript:;">
                            <span>
                                <i class="name">BAND 데이터 세이브 테스트</i>
                                음성/MMS 무제한 테스트<br>
                                부가음성/영상 50분 테스트<br>
                                데이터 300MB 테스트
                            </span>
                            <span>월 <i class="price">33,000</i>원</span>
                        </a></li>-->
          </ul>
      </div>
      <button type="button" class="popClose" onclick="layerClose();"></button>
  </div>

  <!-- 카드선택 -->
  <div class="layerPop" id="cardSel" style="display:none;">
      <div class="inner">
          <div class="layerCont">
              <p class="popHead">카드선택</p>
              <ul class="selectList">
                  <li><button type="button">국민</button></li>
                  <li><button type="button">비씨</button></li>
                  <li><button type="button">신한</button></li>
                  <li><button type="button">현대</button></li>
                  <li><button type="button">삼성</button></li>
                  <li><button type="button">롯데</button></li>
                  <li><button type="button">외환</button></li>
                  <li><button type="button">NH</button></li>
                  <li><button type="button">하나</button></li>
                  <li><button type="button">우리</button></li>
                  <li><button type="button">씨티</button></li>
                  <li><button type="button">전북</button></li>
                  <li><button type="button">카카오뱅크</button></li>
                  <li><button type="button">케이뱅크</button></li>
              </ul>
              <button type="button" class="popClose" onclick="layerClose();"></button>
          </div>
      </div>
  </div>

  <!-- 은행선택 -->
  <div class="layerPop" id="bankSel" style="display:none;">
      <div class="inner">
          <div class="layerCont">
              <p class="popHead">은행선택</p>
              <ul class="selectList">
                  <li><button type="button">농협</button></li>
                  <li><button type="button">국민은행</button></li>
                  <li><button type="button">신한은행</button></li>
                  <li><button type="button">우리은행</button></li>
                  <li><button type="button">기업은행</button></li>
                  <li><button type="button">KEB하나은행</button></li>
                  <li><button type="button">대구은행</button></li>
                  <li><button type="button">부산은행</button></li>
                  <li><button type="button">하나우체국</button></li>
                  <li><button type="button">SC제일은행</button></li>
                  <li><button type="button">광주은행</button></li>
                  <li><button type="button">경남은행</button></li>
              </ul>
              <button type="button" class="popClose" onclick="layerClose();"></button>
          </div>
      </div>
  </div>

  <!-- 약관 보기 -->
  <div class="layerPopfull terms" id="term1" style="display:none;">
      <p class="popHead">결제정보 및 개인정보 취급방침 동의</p>
      <div class="popCont">
          <div class="termsCont">
              <strong class="titDep3">제 1장 총칙</strong>
              <p>
                  제 1조 목적<br>
                  이 약관은 회사가 운영하는 웹사이트 및 모바일APP(이하 "사이트"이라 한다)에서 제공하는 인터넷관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 회사와 이용자간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
              </p>
              <p>
                  제 2조 정의<br>
                  이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                  1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                      "사이트"란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장 또는 회사가 운영하는 웹사이트, 모바일APP을 말합니다.<br>
                  2. "이용자"라 함은 사이트에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
                  3. "회원"이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서, 사이트의 정보를 지속적으로 제공받으며, 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
                  4. "비회원"이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.
              </p>
              <p>
                  제 3조 약관의 효력과 변경<br>
                  1. 이 약관은 이용자에게 공시함으로써 효력이 발생합니다.<br>
                  2. 이 약관의 내용은 회사 사이트 및 모바일APP에 게시합니다.<br>
                  3. 회사는 합리적 이유가 있을 때에는 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 지체없이 이를 사이트에 공시합니다.
              </p>
              <p>
                  제4조 약관 외 준칙<br>
                  이 약관에 명시되지 않은 사항에 대하여는 관계 법령 및 상관례에 따릅니다.
              &nbsp;</p>

              <strong class="titDep3">제2장 이용계약 체결</strong>
              <p>
                  제5조 (이용신청 및 이용계약의 성립)<br>
                  1. 이용자가 이용약관에 대한 동의를 누르면 본 약관에 동의하는 것으로 간주하며, 서비스를 사용하면서 회사가 요청하는 양식으로 이용자 계정을 입력할 수 있습니다.<br>
                  2. 이용계약은 이용자가 동의함과 동시에 회사가 승낙함으로써 성립합니다.<br>
                  3. 회사는 이용자 본인 등을 위해 관련 서류의 제출을 요청할 수 있습니다.<br>
                  4. 이용자가 이용약관에 동의하지 않을 경우 서비스의 이용이 제한될 수 있습니다.<br>
                  5. 회사는 만 14세 미만 아동의 이용가입은 받고 있지 않습니다.
              </p>
              <p>
                  제6조 (이용자의 계정)<br>
                  1. 이용자 계정는 이용자별 1인 1계정을 원칙으로 합니다.<br>
                  2. 이용자 계정는 다음 각호 중 하나에 해당하는 경우에는 이용자의 요청에 의하여 변경할 수 있습니다.<br>
                      가. 이용자 계정이 타인에게 유출된 경우<br>
                      나. 기타 합리적인 사유가 있는 경우<br>
                  3. 이용자 계정에 대한 관리책임은 이용자에게 있으며, 회사의 고의로 인하여 유출된 경우를 제외한 사고에 대한 책임은 이용자에게 있습니다.<br>
                  4. 이용자는 이용자 계정이 유출되어 피해를 입을 우려가 있는 경우 회사에 신고하고 이용자 계정을 변경하여야 하며, 회사는 즉시 종전의 이용자 계정에 의한 서비스 이용을 중단합니다.<br>
              </p>
              <p>
                  제7조 (서비스의 이용)<br>
                  1. 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상이나 기술상의 이유로 서비스가 일지 중지될 수 있고, 또한 운영상의 목적으로 회사가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.<br>
                  2. 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다.<br>
              &nbsp;</p>
              <p>
                  제8조 (서비스의 제한 및 정지)<br>
                  1. 회사는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신사업자가 전기통신서비스를 중지하는 등 기타 부득이한 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.<br>
                  2. 회사는 제1.항의 규정에 의하여 서비스의 이용을 제한하거나 정지한 때에는 그 사유 및 제한기간 등을 지체 없이 이용자에게 알리도록 노력하겠습니다.<br>
                  3. 제1항에 의한 장애로 인하여 서비스가 제한 또는 정지된 경우 회사는 일체의 책임을 지지 않습니다.
              </p>
              <p>
                  제9조 (이용자의 이용제한 등)<br>
                  회사는 이용자가 다음 각호에 해당하는 경우에는 이용자의 동의 없이 서비스의 전부 또는 일부의 이용을 제한할 수 있습니다.<br>
                  1. 이용자가 법률, 공공질서나 도덕 및 미풍양속에 위반하는 목적으로 서비스 이용을 계획하거나 실행하는 경우<br>
                  2. 관계법령 및 이 약관의 규정을 위반하는 경우<br>
                  3. 이용자가 회사의 업무수행 또는 전산설비에 현저한 지장을 초래하거나, 초래할 위험성이 있는 경우
              </p>
              <p>
                  제10조 (이용제한 및 해제 절차)<br>
                  1. 회사는 제9조의 규정에 의하여 이용제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 이용정지 7일전까지 전자우편 또는 전화 등의 방법에 의하여 해당 이용자 또는 대리인에게 통지합니다. 다만, 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니합니다.<br>
                  2. 제1항의 규정에 의하여 이용정지의 통지를 받은 이용자 또는 그 대리인은 그 이용정지의 통지에 대하여 이의가 있을 때에는 이의신청을 할 수 있습니다.<br>
                  3. 회사는 제2항의 규정에 의한 이의신청에 대하여 그 확인을 위한 기간까지 이용정지를 일시 연기할 수 있으며, 그 결과를 이용자 또는 그 대리인에게 통지합니다.<br>
                  4. 회사는 이용정지 기간 중에 이용정지 사유가 해소된 것이 확인된 경우에는 이용정지 조치를 즉시 해제합니다.
              &nbsp;</p>

              <strong class="titDep3">제3장 이용요금</strong>
              <p>
                  제11조 (서비스 이용요금)<br>
                  서비스의 이용요금은 이용자가 회사의 서비스를 이용하기 위한 통신비용이며, 이용자가 통신사업자에 지불하는 통신요금 외에 이용요금은 청구하지 않습니다. 단, 통신요금은 이용자 단말기의 쌍방향 통신을 위해 통신망을 이용함으로써 발생하는 요금으로, 통신요금은 고객의 데이터 사용 예상치, 통신사 등에 따라 변동될 수 있으며 기본적으로 통신사가 제공하는 데이터 요금제 및 가입비 기준에 준합니다.
              </p>
              &nbsp;
              <strong class="titDep3">제4장 개인정보보호정책</strong>
              <p>
                  제12조 (개인정보보호 의무)<br>
                  회사는 "정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법" 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다.
              </p>

              <strong class="titDep3">제5장 회사와 회원의 의무</strong>
              <p>
                  제13조 회사의 의무<br>
                  1. 회사는 이 약관에서 정한 바에 따라 계속적, 안정적으로 사이트의 서비스를 제공할 의무가 있습니다.<br>
                  2. 회사는 회원의 정보를 철저히 보안 유지하며, 양질의 서비스를 홍보하거나 운영 또는 개선하기 위한 목적으로 이용하고, 이외의 다른 목적으로 제3자에게 제공하지 않습니다. 제3자에게 제공하는 경우에는 이용 및 제공 단계에서 당해 회원에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
              </p>
              <p>
                  제14조 회원의 의무<br>
                  1. 회원의 ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있습니다.<br>
                  2. 회원은 ID와 비밀번호를 제3자에게 이용하게 해서는 안됩니다. 회원은 ID와 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지하는 경우에는 회원은 반드시 회사에 그 사실을 통보해야 합니다.<br>
                  3. 회원은 이 약관 및 관계 법령에서 규정한 사항을 준수하여야 합니다.
              </p>

              <strong class="titDep3">제6장 회원등록 해지 및 서비스 이용 중지</strong>
              <p>
                  제15조 회원등록 해지 및 서비스 이용 중지<br>
                  1. 회원이 회원등록을 해지하고자 하는 때에는 회원 본인이 직접 사이트에서 회원등록 해지를 신청해야 합니다.<br>
                  2. 홈페이지 회원은 비밀번호를 입력하여 본인임을 확인한 후 , 해지 확인을 선택하면 자동으로 회원 등록이 해지되며, 3개월간 해지된 계정은 사용을 못합니다. 모바일APP 회원은 서비스탈퇴 여부를 확인 후 자동으로 회원 등록이 해지됩니다.<br>
                  3. 회원등록 및 서비스 이용 중지 여부는 기존의 ID, 비밀번호로 사이트에 로그인이 되지 않으면 해지된 것입니다.<br>
                  4. 회사는 회원이 다음 사항에 해당하는 행위를 하였을 경우, 사전 통지 없이 서비스 이용 계약을 해지하거나 또는 상당한 기간을 정하여 서비스 이용을 중지할 수 있습니다. <br>
                  가. 공공 질서 및 미풍양속에 반하는 경우<br>
                  나. 범죄적 행위에 관련되는 경우<br>
                  다. 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우<br>
                  라. 타인의 ID 및 비밀번호를 도용한 경우<br>
                  마. 타인의 명예를 손상시키거나 불이익을 주는 경우<br>
                  바. 같은 사용자가 다른 ID로 이중 등록을 한 경우<br>
                  사. 서비스에 위해를 가하는 등 건전한 이용을 저해하는 경우<br>
                  아. 기타 관련 법령이나 사이트가 정한 이용조건에 위배되는 경우
              </p>

              <strong class="titDep3">제7장 기타</strong>
              <p>
                  제16조 게시물 관리<br>
                  회사는 이용자가 게시하거나 등록한 내용물이 다음 사항에 해당된다고 판단되는 경우에 사전 통지 없이 삭제할 수 있습니다.<br>
                  가. 타인을 비방하거나 중상모략으로 개인 및 단체의 명예를 손상시키는 내용인 경우<br>
                  나. 공공질서 및 미풍양속에 위반되는 내용인 경우<br>
                  다. 범죄적 행위에 부합된다고 인정되는 내용인 경우<br>
                  라. 타인의 저작권 등 기타의 권리를 침해하는 내용인 경우<br>
                  마. 기타 관계 법령이나 사이트에서 정한 규정에 위배되는 내용인 경우
              </p>
              <p>
                  제17조 면책조항<br>
                  1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br>
                  2. 회사는 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.<br>
                  3. 회사는 이용자가 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br>
                  4. 회사는 이용자가 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br>
                  5. 회사는 서비스 이용과 관련하여 이용자에게 발생한 손해 가운데 이용자의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.<br>
              </p>
              <p>
                  제18조 회원에 대한 통지<br>
                  1. 회사가 회원에 대한 통지를 하는 경우에는 회원이 회원가입시 사이트에 등록한 전자우편 주소, 휴대폰번호 SMS로 통지할 수 있습니다.<br>
                  2. 회사는 불특정 다수 회원에 대한 통지의 경우 1주일 이상 사이트 게시판에 게시함으로써 개별통지에 갈음할 수 있다.
              </p>
              <p>
                  제19조 (준거법 및 재판관할)<br>
                  1. 회사와 회원간 제기된 소송은 대한민국법을 준거법으로 합니다. <br>
                  2. 회사와 회원간 발생한 분쟁에 관한 소송은 서울중앙지방법원에 제기하여야 합니다.<br>
                  3. 해외에 주소나 거소가 있는 회원의 경우 회사와 회원간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할법원으로 합니다.
              </p>
              <p>(부칙) 이 약관은 2019년 03월 01일부터 적용됩니다.</p>
          </div>
      </div>
      <button type="button" class="popClose" onclick="layerClose();"></button>
  </div>
</body>
<!--<script type="text/javascript">
    var test =  document.getElementById("t").value;
    console.log("test >> "+test);
</script>-->
</html>
