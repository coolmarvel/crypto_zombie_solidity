// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

/**
 * enum : 사람이 읽을 수 있게 사용자/개발자에 의해 정의된 상수 세트 타입 (uint8 = 0 ~ 255 (2^8 - 1))
 * enum 이름 {}
 */

contract Lec38 {
    enum CarStatus {
        TurnOff,
        TurnOn,
        Driving,
        Stop
    }

    CarStatus public carStatus;

    constructor() {
        carStatus = CarStatus.TurnOff;
    }

    event carCurrentStatus(CarStatus _carStatus, uint256 _carStatusInInt);

    function turnOnCar() public {
        require(
            carStatus == CarStatus(0),
            "To turn on, your car must be turned off"
        );
        carStatus = CarStatus(1);

        emit carCurrentStatus(carStatus, uint256(carStatus));
    }

    function drivingCar() public {
        require(
            carStatus == CarStatus.TurnOn,
            "To drive a car, your car must be turned on"
        );
        carStatus = CarStatus.Driving;

        emit carCurrentStatus(carStatus, uint256(carStatus));
    }

    function stopCar() public {
        require(
            carStatus == CarStatus.Driving,
            "To Stop a car, your car must be driving"
        );
        carStatus = CarStatus.Stop;

        emit carCurrentStatus(carStatus, uint256(carStatus));
    }

    function turnOffCar() public {
        require(
            carStatus == CarStatus.TurnOn || carStatus == CarStatus.Stop,
            "To turn off, your car must be turned on or driving"
        );
        carStatus = CarStatus.TurnOff;

        emit carCurrentStatus(carStatus, uint256(carStatus));
    }

    function checkStatus() public view returns (CarStatus) {
        return carStatus;
    }
}
