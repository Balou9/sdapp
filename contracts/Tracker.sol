//SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract Tracker {
    uint counter = 0;

    struct RouteInfo {
        uint routeId;
        string goods;
        address accountAddress;
    }

    mapping ( uint=> RouteInfo ) private routes;

    event routeCreatedEvent(address indexed accountAddress, Tracker.RouteInfo route);

    function addRoute(string calldata _route) public returns(Tracker.RouteInfo memory) {

        require(msg.sender != address(0x0), "The sender address must exist");
        uint routeId = counter+1;

        address accAddress = address(msg.sender);
        RouteInfo memory newRoute = RouteInfo(routeId, _route, accAddress);

        return newRoute;
    }
}
