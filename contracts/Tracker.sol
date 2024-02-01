//SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract Tracker {
    uint counter = 0;

    struct RouteInfo {
        uint routeId;
        string goods;
        string from;
        string to;
        string route;
        address routeowner;
    }

    mapping ( uint=> RouteInfo ) private routes;

    event routeCreatedEvent(address indexed accountAddress, Tracker.RouteInfo route);

    function addRoute(string calldata _route, string calldata _from, string calldata _to, string calldata _goods) public view returns(Tracker.RouteInfo memory) {

        require(msg.sender != address(0x0), "The sender address must exist");
        uint routeId = counter+1;

        address routeOwner = address(msg.sender);
        RouteInfo memory newRoute = RouteInfo(routeId, _goods, _from, _to, _route, routeOwner);

        return newRoute;
    }
}
