//SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";


contract Tracker {

    struct RouteTrackerInfo {
        uint id;
        string goods;
        string routes;
        address accountAddress;
    }

    mapping ( uint=> RouteTrackerInfo ) private routes;

    event routeCreatedEvent(address indexed accountAddress, string route);

    function addRoute(string calldata _route) external {

        require(msg.sender != address(0x0), "The sender address must exist");
        routeId.increment();
        uint routeId = accountId.current();

        address accAddress = address(msg.sender);
        RouteTrackerInfo memory newRoute = RouteTrackerInfo(accountId, _route, accAddress);
        routes[routeId] = newRoute;

        emit routeCreatedEvent(accAddress, _route);
        console.log("NEW ROUTE ADDED", newRoute.route);
    }
}
