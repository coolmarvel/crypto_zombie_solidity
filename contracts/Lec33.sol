// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.0 <=0.9.0;

/**
 * address.balance
 * balance는 해당 특정 주소의 현재 갖고 있는 이더의 잔액을 나타냄 (msg.value는 송금액)
 * address.value와 같은 형태로 사용
 *
 * msg.sender
 * 스마트컨트랙트를 사용하는(호출하는) 주체
 * 앞으로 설명해야할 call vs delegate call에서 주요한 내용
 */

contract Lec33 {
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(
        address _msgSender,
        address _to,
        uint256 _value
    );

    function sendEther(address payable _to) public payable {
        require(msg.sender.balance >= msg.value, "Your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender, msg.sender.balance);
    }

    function checkValueNow() public {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}
