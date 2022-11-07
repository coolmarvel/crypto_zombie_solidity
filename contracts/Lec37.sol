// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

/**
 * Call vs Delegate Call
 * > Delegate call
 * 1. msg.sender가 본래 스마트컨트랙틔 호출자를 나타낸다나타낸다.
 * 2. delegate call이 정의된 스마트컨트랙트(즉 caller)가 외부 컨트랙트의 함수들을 마치 자신의 것처럼 사용(실질적인 값도 caller에 저장)
 *
 * 조건
 * 외부 스마트컨트랙트와 caller 스마트컨트랙트는 같은 변수를 갖고 있어야 한다.
 *
 * why?
 * upgradeable smart contract 용도
 */

contract Add {
    uint256 public num = 0;
    event Info(address _addr, uint _num);

    function plusOne() public {
        num = num + 1;
        emit Info(msg.sender, num);
    }
}

contract Caller {
    uint256 public num = 0;

    function callNow(address _contractAddr) public payable {
        (bool success, ) = _contractAddr.call(
            abi.encodeWithSignature("plusOne()")
        );
        require(success, "Failed to transfer ether");
    }

    function delegateCallNow(address _contractAddr) public payable {
        (bool success, ) = _contractAddr.delegatecall(
            abi.encodeWithSignature("plusOne()")
        );
        require(success, "Failed to transfer ether");
    }
}
