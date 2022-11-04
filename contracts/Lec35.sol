// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

/**
 * ~ 0.6 fallback
 * fallback 함수는 이름 그대로 대비책 함수
 *
 * 특징
 * 1. 먼저 무기명 함수, 이름이 없는 함수
 * 2. external 필수
 * 3. payable
 *
 * 왜 쓰는가
 * 1. 스마트컨트랙트가 이더를 받을 수 있게함
 * 2. 이더 받은 후 어떠한 행동을 취할 수 있다
 * 3. call 함수로 없는 함수가 호출될 때 어떠한 행동을 취하게 할 수 있다
 *
 * function() external payable {}
 *
 * 0.6 ~ fallback
 * fallback은 receive와 fallback 두가지 형태로 나뉘게 됨
 *
 * receive : 순수하게 이더만 받을 때 작동
 * fallback : 함수를 실행하면서 이더를 보낼때 호출된 함수가 없을 때 작동
 *
 * 기본형 : 호출된 함수가 특정 스마트컨트랙트에 없을 때 fallback 함수 작동
 * fallback() external {}
 *
 * payable 적용시 : 이더를 받고 나서 fallback 함수가 작동
 * fallback() external payable {}
 *
 * receive() external payable {}
 */

contract Bank {
    event JustFallbackWithFunds(address _from, uint256 _value, string message);

    // ~ 0.6
    function() external payable {
        emit JustFallbackWithFunds(
            msg.sender,
            msg.value,
            "JustFallbackWithFunds is called"
        );
    }
}

contract You {
    // receive
    function DepositWithSend(address payable _to) public payable {
        bool success = _to.send(msg.value);
        require(success, "Failed");
    }

    function DepositWithTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function DepositWithCall(address payable _to) public payable {
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent, "Failed to send ether");

        // 0.7 ~
        // (bool sent, ) = _to.call{value: msg.value}("");
        // require(sent, "Failled" );
    }

    // To the fallback() with Funds
    function JustGiveMessageWithFunds(address payable _to) public payable {
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("HI");
        require(sent, "Failed to send ether");

        // 0.7 ~
        // (bool success, ) = _to.call{value: msg.value}("HI");
        // require(success, "Failed");
    }
}
