// SPDX-License-Identifier: GPL-3.0

// Create task -> work, status
// get task
// togal task
// task complete -> reward
// get reward

pragma solidity >=0.5.0 <0.9.0;

contract Todo {
    struct task {
        string work;
        bool status;
    }

    mapping(address => task[]) taskList;
    mapping(address => uint256) rewardList;

    event taskCreated(uint256 id, string work, bool status);

    function createTask(string calldata _work) external payable {
        require(msg.value == 0.1 ether, "pay 0.1 ether");

        taskList[msg.sender].push(task(_work, false));
        rewardList[msg.sender] += msg.value;

        emit taskCreated(taskList[msg.sender].length - 1, _work, false);
    }

    function getTask() external view returns (task[] memory) {
        return taskList[msg.sender];
    }

    function togalTask(uint256 _id) external {
        taskList[msg.sender][_id].status = !taskList[msg.sender][_id].status;
    }

    function getReward() external view returns (uint256) {
        return rewardList[msg.sender];
    }
}
