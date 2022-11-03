// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract A {
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }

    function change(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }
}

contract B {
    A instance = new A("이성현", 26);

    function change(string memory _name, uint256 _age) public {
        instance.change(_name, _age);
    }

    function get() public view returns (string memory, uint256) {
        return (instance.name(), instance.age());
    }
}
