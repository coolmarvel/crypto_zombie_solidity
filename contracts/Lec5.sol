// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * public : 모든 곳에서 접근 가능
 * external : public 처럼 모든 곳에서 접근 하나, external 이 정의된 자기 자신의 스마트컨트랙트에서 접근 불가
 * private : 오직 private이 정의된 자기 자신의 스마트컨트랙트에서 접근 가능 (private이 정의된 현재 이 컨트랙트를 상속 받은 자식 컨트랙트도 접근 불가)
 * internal : private 처럼 오직 internal 이 정의된 자기 자신의 스마트컨트랙트에서 접근 가능 (inter이 정의된 현재 이 컨트랙트를 상속받은 자식 컨트랙트도 접근 가능)
 */

contract Lec5 {
    // 1. public
    uint256 public a = 3;

    // 2. private
    uint256 private a2 = 5;
}

contract Public_example {
    uint256 public a = 3;

    function changeA(uint256 _value) public {
        a = _value;
    }

    function getA() public view returns (uint256) {
        return a;
    }
}

contract Public_exmaple2 {
    Public_example instance = new Public_example();

    function changeA2(uint256 _value) public {
        instance.changeA(_value);
    }

    function getA2() public view returns (uint256) {
        return instance.getA();
    }
}

contract Private_example {
    uint256 private a = 3;

    function getA() public view returns (uint256) {
        return a;
    }
}

contract External_example {
    uint256 private a = 3;

    function getA() external view returns (uint256) {
        return a;
    }
}

contract External_example2 {
    External_example instance = new External_example();

    function getA2() public view returns (uint256) {
        return instance.getA();
    }
}
