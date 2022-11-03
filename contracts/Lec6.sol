// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * view : storage state를 읽을 수 있지만, state 값 변경 불가 = function 밖의 변수들을 읽을 수 있으나 변경 불가능
 * pure : storage state 를 읽으면 안되고, state값을 변경 불가 = function 밖의 변수들을 읽지 못하고, 변경도 불가능
 * view 와 pure 둘다 명시 안할 때 : function 밖의 변수들을 읽어서, 변경을 해야함. 정의된 이 컨트랙트를 상속 받은 자식 컨트랙트도 접근 가능
 */

contract Lec6 {
    uint256 public a = 1;

    function viewExample() public view returns (uint256) {
        return a + 2;
    }

    function readAndChangeA() public returns (uint256) {
        a = 3;
        return a + 2;
    }

    function pureExample() public pure returns (uint256) {
        uint256 a2 = 3;
        return a2 + 2;
    }
}
