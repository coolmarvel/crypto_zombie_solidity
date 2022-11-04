// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * 외부 스마트컨트랙트 함수 호출할 때 : 다른 스마트컨트랙트를 인스턴스화 해서 try-catch문이 있는 스마트컨트랙트의 함수 호출하여 사용
 * 내부 스마트컨트랙트를 생성할 때 : 다른 스마트컨트랙트를 인스턴스화 생성할 때 사용
 * 스마트컨트랙트 내에서 함수 호출할 때 : this를 통해 try-catch를 사용
 */

// 외부 스마트컨트랙트
contract Character {
    string private name;
    uint256 private power;

    constructor(string memory _name, uint256 _power) {
        name = _name;
        power = _power;
    }
}

contract Runner {
    event catchOnly(string _name, string _err);

    function playTryCatch(string memory _name, uint256 _power)
        public
        returns (bool)
    {
        try new Character(_name, _power) {
            revert("errors in the try-catch block");
            return (true);
        } catch {
            emit catchOnly("catch", "Erros!");
            return (false);
        }
    }
}

// 내부 스마트컨트랙트
contract Runner2 {
    event catchOnly(string _name, string _err);

    function simple() public returns (uint256) {
        return 4;
    }

    function playTryCatch() public returns (uint256, bool) {
        try this.simple() returns (uint256 _value) {
            return (_value, true);
        } catch {
            emit catchOnly("catch", "Errors!");
            return (0, false);
        }
    }
}
