// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Gacha {
    event pickResult(
        address indexed _pickAddr,
        uint256 indexed _pickCount,
        uint256 _pickItem
    );
    event bonusPickResult(address indexed _pickAddr, uint256 _pickItem);

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {} //이더 수신

    // 아이템 리스트(string으로 하면 가스 소모 심한가?)
    uint256[10] public itemList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    uint256 private pickCount; // 뽑기 횟수
    mapping(address => uint256[]) public itemsPerAddress; //계정당 아이템
    mapping(address => uint256) private pickCountPerAddress; //계정당 뽑기 횟수
    mapping(address => bool) private bonusTurn; // 보너스 뽑기

    function randomPick() public payable {
        require(msg.value == 2 * 10**16);
        uint256 random = itemList[randomItem()];
        itemsPerAddress[msg.sender].push(random);

        pickCountPerAddress[msg.sender]++;

        emit pickResult(msg.sender, pickCountPerAddress[msg.sender], random);

        if (pickCountPerAddress[msg.sender] % 5 == 0) {
            bonusTurn[msg.sender] = true;
        }
    }

    function bonusPick() public {
        require(bonusTurn[msg.sender] == true, "you are not bonus turn");
        pickCount++;
        uint256 bonus = itemList[randomItem()];
        itemsPerAddress[msg.sender].push(bonus);
        emit bonusPickResult(msg.sender, bonus);
        bonusTurn[msg.sender] = false;
    }

    //난수 생성
    function randomItem() public view returns (uint256) {
        return
            (uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        pickCount,
                        pickCountPerAddress[msg.sender]
                    )
                )
            ) % 10) + 1;
    }

    function getItemsPerAddress() public view returns (uint256[] memory) {
        return itemsPerAddress[msg.sender];
    }
}
