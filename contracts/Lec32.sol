// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec32 {
    /**
     * Payable
     * Payable은 이더/토큰과 상호작용시 필요한 키워드라고 생각하면 간단
     * 즉, send, transfer, call을 이용하여, 이더를 보낼 때 Payable이라는 키워드가 필요
     * 주로 함수, 주소, 생성자에 붙여서 사용됨
     *
     * msg.value
     * msg.value는 송금 보낸 코인의 값
     *
     * 이더를 ㅂ내는 3가지 방법
     * 1. send : 2300gas를 소비, 성공여부를 true 또는 false로 리턴
     * 2. transfer : 2300gas를 소비, 실패시 에러를 발생
     * 3. call : 가변적인 gas를 소비 (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
     *           재진입(reEntrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천
     */

    event howMuch(uint256 _value);

    function sendNow(address payable _to) public payable {
        bool sent = _to.send(msg.value); // return true or false
        require(sent, "Failed to send ether");
        emit howMuch(msg.value);
    }

    function transferNow(address payable _to) public payable {
        // ~ 0.7
        (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        require(sent, "Failed to send ether");

        // 0.7 ~
        emit howMuch(msg.value);
    }
}
