// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        //add: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //abi

        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
        // 3500 * 10e8
        // 1 eth = 1 * 1e18 = 3500 * 1e8 USD
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}