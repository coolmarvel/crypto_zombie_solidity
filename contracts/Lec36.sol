// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

/**
 * call : low level function
 * 1. 송금하기
 * 2. 외부 스마트컨트랙트 함수 호출
 * 3. 가변적인 gas
 * 4. Istanbul 하드포크, 2019년 12월 이후, gas가격 상승에 따른 call 사용 권장 / send transfer = 2300gas
 * 5. re-entrancy(재진입) 공격위험 있기에 Checks_Effects_Interactions_pattern 사용
 */

contract Add {
    event JustFallback(string _str);
    event JsutReceive(string _str);

    function addNumber(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        return _num1 + _num2;
    }

    fallback() external payable {
        emit JustFallback("JustFallback is called");
    }

    receive() external payable {
        emit JsutReceive("JustReceive is called");
    }
}

contract Caller {
    event calledFunction(bool _success, bytes _output);

    // 1. 송금하기
    function transferEther(address payable _to) public payable {
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Failed to transfer ether");
    }

    // 2. 외부 스마트컨트랙트 함수 호출
    function callMethod(
        address _contractAddress,
        uint256 _num1,
        uint256 _num2
    ) public {
        (bool success, bytes memory outputFromCalledFunction) = _contractAddress
            .call(
                abi.encodeWithSignature(
                    "addNumber(uint256, uint256)",
                    _num1,
                    _num2
                )
            );
        require(success, "Failed to transfer ether");
        emit calledFunction(success, outputFromCalledFunction);
    }

    function callMethod2(address _contractAddress) public payable {
        (bool success, bytes memory outputFromCalledFunction) = _contractAddress
            .call{value: msg.value}(abi.encodeWithSignature("Nothing()"));

        require(success, "failed to transfer ether");
        emit calledFunction(success, outputFromCalledFunction);
    }
}
