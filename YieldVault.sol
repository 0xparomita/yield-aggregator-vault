// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title YieldVault
 * @dev A professional yield aggregator vault implementing the ERC-4626 standard.
 */
contract YieldVault is ERC4626, Ownable {
    
    event StrategyUpdated(address indexed newStrategy);

    constructor(
        IERC20 _asset,
        string memory _name,
        string memory _symbol
    ) ERC4626(_asset) ERC20(_name, _symbol) Ownable(msg.sender) {}

    /**
     * @dev Hook that is called before any transfer of tokens. 
     * This can be used to harvest rewards or rebalance before minting/burning shares.
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        // Implementation for yield harvesting or strategy rebalancing goes here
    }

    /**
     * @dev Total assets managed by the vault. 
     * In a real-world scenario, this would include balance in the contract + balance in strategies.
     */
    function totalAssets() public view override returns (uint256) {
        return IERC20(asset()).balanceOf(address(this));
    }

    /**
     * @dev Emergency function to rescue tokens stuck in the contract.
     */
    function rescueToken(address _token, uint256 _amount) external onlyOwner {
        require(_token != asset(), "Cannot rescue underlying asset");
        IERC20(_token).transfer(owner(), _amount);
    }
}
