// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

contract Lec20 {
    struct Character {
        uint256 age;
        string name;
        string job;
    }

    mapping(uint256 => Character) public CharacterMapping;
    Character[] public CharacterArray;

    function setCharacter(
        uint256 _age,
        string memory _name,
        string memory _job
    ) public pure returns (Character memory) {
        return Character(_age, _name, _job);
    }

    function setCharacterMapping(
        uint256 _key,
        uint256 _age,
        string memory _name,
        string memory _job
    ) public {
        CharacterMapping[_key] = Character(_age, _name, _job);
    }

    function getCharacterMapping(uint256 _key)
        public
        view
        returns (Character memory)
    {
        return CharacterMapping[_key];
    }

    function setCharacterArray(
        uint256 _age,
        string memory _name,
        string memory _job
    ) public {
        CharacterArray.push(Character(_age, _name, _job));
    }

    function getCharacterArray(uint256 _index)
        public
        view
        returns (Character memory)
    {
        return CharacterArray[_index];
    }
}
