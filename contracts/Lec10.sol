// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Father {
    string public familyName = "Lee";
    string public givenName = "MinSang";
    uint256 public money = 100;

    constructor(string memory _givenName) public {
        givenName = _givenName;
    }

    function getFamilyName() public view returns (string memory) {
        return familyName;
    }

    function getGivenName() public view returns (string memory) {
        return givenName;
    }

    function getMoney() public view returns (uint256) {
        return money;
    }
}

contract Son is Father("SeongHyun") {}
