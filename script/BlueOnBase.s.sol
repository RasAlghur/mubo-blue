// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BLUE} from "../src/BlueOnBase.sol";
import {ITOKEN} from "../src/tokenInterface.sol";

// @note forge script script/BlueOnBase.s.sol:BlueScript --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $BASE_API_KEY -vvvv
// @note forge script script/BlueOnBase.s.sol:BlueScript --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract BlueScript is Script {
    BLUE blue;

    function run() external returns (BLUE) {
        address feeWallet = address(0xE0567Ea9514CDe242c93A749b28d8a9156260Dd4);
        uint256 totalSupply = 1_000_000_000;
        uint256 buyFee = 2;
        uint256 sellFee = 2;
        string memory name = "THE BLUE";
        string memory symbol = "BLUE";
        uint8 decimal = 9;

        vm.startBroadcast();
        blue = new BLUE(feeWallet, totalSupply, buyFee, sellFee, name, symbol, decimal);
        vm.stopBroadcast();
        return blue;
    }
}

// @note forge script script/BlueOnBase.s.sol:StartTrade --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract StartTrade is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).enableTrading();
        vm.stopBroadcast();
        return true;
    }
}

// @note forge script script/BlueOnBase.s.sol:LimitsRemove --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract LimitsRemove is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).removeLimits();
        vm.stopBroadcast();
        return true;
    }
}

// @note forge script script/BlueOnBase.s.sol:RenounceNow --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract RenounceNow is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).renounceOwnership();
        vm.stopBroadcast();
        return true;
    }
}

// @note forge script script/BlueOnBase.s.sol:TakeOutETH --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract TakeOutETH is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).withdrawStuckETH();
        vm.stopBroadcast();
        return true;
    }
}
