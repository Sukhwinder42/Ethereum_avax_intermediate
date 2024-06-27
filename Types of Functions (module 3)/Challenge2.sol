// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

interface IChallenge {
    function addItem(string calldata item) external;
    function getItem(uint256 index) external view returns (string memory);
}

abstract contract ChallengeBase {
    string[] internal items;

    function getItemCount() public view returns (uint256) {
        return items.length;
    }

    function addItem(string memory item) public virtual;
}

contract Challenge is IChallenge, ChallengeBase {
    function addItem(string memory item) public override(ChallengeBase,IChallenge) {
        items.push(item);
    }

    function getItem(uint256 index) public view override returns (string memory) {
        require(index < items.length, "Index out of bounds");
        return items[index];
    }
}
