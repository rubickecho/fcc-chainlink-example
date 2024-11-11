// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract BasicTypesDemo {
    // Basic Types: boolean, uint, int, address, bytes

    // default value
    // bool hasFavoriteNumber; // default value: false
    // uint favoriteNumber; // default value: 0
    // int favoriteNumber02; // default value: 0
    // address myAddress; // default value: 0x0000000000000000000000000000000000000000
    // bytes1 a; // default value: 0x00

    // Value Types
    bool hasFavoriteNumber = true;
    uint favoriteNumber = 123; // uint8 ~ unit256
    int favoriteNumber02 = -123; // int8 ~ int256
    address myAddress = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    bytes1 a = 0xb5; // 固定大小 1 byte, bytes1 ~ bytes32
    enum Action { // 枚举
        ADD, // 0
        REMOVE // 1
    }
    // 枚举底层默认是 uint8
    // contract EnumTest {
    //     enum Status {
    //         PENDING,    // 0
    //         ACTIVE,     // 1
    //         INACTIVE    // 2
    //     }
        
    //     Status public status;  // 底层是 uint8
        
    //     // 可以显式转换为 uint8
    //     function getStatusAsUint() public view returns (uint8) {
    //         return uint8(status);
    //     }
        
    //     // 可以从 uint8 转换为枚举
    //     function setStatusFromUint(uint8 _status) public {
    //         status = Status(_status);
    //     }
    // }

    // Reference Types
    string favoriteNumberInText = "Seven";
    bytes favoriteNumberInBytes = "Seven";
}