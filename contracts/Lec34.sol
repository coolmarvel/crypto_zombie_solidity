// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * payable을 생성자에 넣을때
 * 특정 주소에 권한 주기
 */

contract MobileBanking {
    address private owner;

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "this function for only owner");
        _;
    }

    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(
        address _msgSender,
        address _to,
        uint256 _value
    );

    function sendEther(address payable _to) public payable onlyOwner {
        require(msg.sender.balance >= msg.value, "Your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNow() public onlyOwner {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public onlyOwner {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}
