// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    // uint favoriteNumber = 123; // default visibility: internal（即合约内部和继承合约可以查看） 
    // uint private favoriteNumber = 123; // 仅合约内部可以访问
    // uint external favoriteNumber = 123; // 仅外部可以访问
    uint public favoriteNumber = 123; // 访问合约的任何人都可查看，添加了 getter 函数
    People public person = People({favoriteNumber: 123, name: "John"});

    // 映射
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint favoriteNumber;
        string name;
    }

    // 动态数组
    uint256[] public favoriteNumbersList;
    People[] public people;
    // 如果想限制数组长度，可以声明为固定长度
    // People[3] public people; 

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        // uint scopeNumber = 1; // 局部变量

        // 如果在消耗 gas 的函数中调用了 view 或 pure 函数，则也会消耗 gas，例如:
        // retrieve();
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        favoriteNumbersList.push(_favoriteNumber);
        
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // view 标识符，表示不修改状态变量，也不会产生 gas 费用
    function retrieve() public view returns (uint256) {
        // 可以访问变量
        return favoriteNumber;
    }

    // pure 标识符，表示不访问状态变量，也不会产生 gas 费用
    function add() public pure returns (uint256) {
        // 不能访问变量，只能进行计算
        return 1 + 1;
    }
}
