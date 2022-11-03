// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract A {
    uint256 public a = 5;

    function change(uint256 _value) public {
        a = _value;
    }
}

contract B {
    A instance = new A();

    function getA() public view returns (uint256) {
        return instance.a();
    }

    function changeA(uint256 _value) public {
        instance.change(_value);
    }
}
