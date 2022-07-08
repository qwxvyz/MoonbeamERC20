// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.7.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.7.0/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts@4.7.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.7.0/security/Pausable.sol";

contract MoonStar is ERC20, ERC20Burnable, ERC20Snapshot, Ownable, Pausable {
    constructor() ERC20("MoonStar", "MSX") {}

    function snapshot() public onlyOwner {
        _snapshot();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
