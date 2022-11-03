// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec17 {
    mapping(string => uint256) private priceList;
    mapping(uint256 => string) private nameList;
    mapping(uint256 => uint256) private ageList;
    // mapping에는 length 내장함수가 없기에 length를 구할 수 가 없다

    function setAgeList(uint256 _key, uint256 _age) public {
        ageList[_key] = _age;
    }

    function getAge(uint256 _key) public view returns (uint256) {
        return ageList[_key];
    }

    function setNameList(uint256 _key, string memory _name) public {
        nameList[_key] = _name;
    }

    function getName(uint256 _key) public view returns (string memory) {
        return nameList[_key];
    }

    function setPriceList(string memory _itemName, uint256 _price) public {
        priceList[_itemName] = _price;
    }

    function getPriceList(string memory _key) public view returns (uint256) {
        return priceList[_key];
    }
}
