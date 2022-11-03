// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec18 {
    uint256[] public ageArray;
    uint256[10] public ageFixedSizeArray;
    string[] public nameArray = ["Kal", "Jhon", "Kerri"];

    function ageLength() public view returns (uint256) {
        return ageArray.length;
    }

    function agePush(uint256 _age) public {
        ageArray.push(_age);
    }

    function ageChange(uint256 _index, uint256 _age) public {
        agrArray[_index] = _age;
    }

    function ageGet(uint256 _index) public view returns (uint256) {
        return ageArray[_index];
    }

    function agePop() public {
        ageArray.pop();
    }

    function agePop(uint256 _index) public {
        delete ageArray[_index];
    }
}
