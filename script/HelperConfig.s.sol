//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMAL = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    struct NetworkConfig {
        address priceFeed;
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaConfig();
        } else if (block.chainid == 80001) {
            activeNetworkConfig = getPolygonConfig();
        } else {
            activeNetworkConfig = getMockConfig();
        }
    }

    function getSepoliaConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return sepoliaConfig;
    }

    function getMockConfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig;
        }

        vm.startBroadcast();
        MockV3Aggregator mockpriceFeed = new MockV3Aggregator(DECIMAL,INITIAL_PRICE);
        vm.stopBroadcast();
        NetworkConfig memory anvilConfig = NetworkConfig({priceFeed: address(mockpriceFeed)});

        return anvilConfig;
    }

    function getPolygonConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory polygonConfig = NetworkConfig({priceFeed: 0x0715A7794a1dc8e42615F059dD6e406A6594651A});
        return polygonConfig;
    }
}
