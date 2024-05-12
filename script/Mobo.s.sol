// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MUBO} from "../src/Mobo.sol";
import {ITOKEN} from "../src/tokenInterface.sol";

// @note forge script script/Mobo.s.sol:MoboScript --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $BASE_API_KEY -vvvv
// @note forge script script/Mobo.s.sol:MoboScript --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract MoboScript is Script {
    MUBO mubo;
    function run() external returns (MUBO){
        vm.startBroadcast();
        mubo = new MUBO();
        vm.stopBroadcast();
        return mubo;
    }
}

// @note forge script script/Mobo.s.sol:OpenMuboTrade --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract OpenMuboTrade is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;
    function run() external {
    vm.startBroadcast();
    ITOKEN(_token).openTrade();
    vm.stopBroadcast();
    }
}

// @note forge script script/Mobo.s.sol:RenounceNow --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract RenounceNow is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).renounceOwnership();
        vm.stopBroadcast();
        return true;
    }
}

// @note forge script script/Mobo.s.sol:LimitsRemove --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract LimitsRemove is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).removeLimits();
        vm.stopBroadcast();
        return true;
    }
}

// @note forge script script/Mobo.s.sol:UnclogMubo --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract UnclogMubo is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).mubo();
        vm.stopBroadcast();
        return true;
    }
}

// @note forge script script/Mobo.s.sol:TakeOutETH --rpc-url $BASE_MAINNET_RPC --private-key $PRIVATE_KEY --broadcast -vvvv
contract TakeOutETH is Script {
    address _token = 0x587ce837F8225eD4DeB99eaf530cb7Fa32E915b5;

    function run() external returns (bool) {
        vm.startBroadcast();
        ITOKEN(_token).takeoutStuckETH();
        vm.stopBroadcast();
        return true;
    }
}
