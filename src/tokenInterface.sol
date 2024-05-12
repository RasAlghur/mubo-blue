// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

interface ITOKEN {
    function openTrade() external;
    function enableTrading() external;
    function mubo() external;
    function renounceOwnership() external;
    function takeoutStuckETH() external;
    function ClearLimits() external;
    // function RemoveLimits() external;
    function clearClog() external;
    function withdrawStuckETH() external;
    function DeptPeng() external;
    // function updateFees(
    //     uint256 s_buyMarketingFee,
    //     uint256 s_sellMarketingFee,
    //     uint256 s_buyAutoLP,
    //     uint256 s_sellAutoLP
    // ) external;
    function updateFees(uint256 s_buyFee, uint256 s_sellFee) external;
    function removeLimits() external;
    function updateBuyFees(uint256 _marketingFee, uint256 _liquidityFee) external;
    function updateSellFees(uint256 _marketingFee, uint256 _liquidityFee) external;

    function burn(uint256 value) external;
}
