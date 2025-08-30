#ifndef ARBITRAGE_H
#define ARBITRAGE_H

#include <map>
#include <string>
#include <utility>

std::map<std::string, double> analyze_arbitrage(
    const std::map<std::string, std::pair<double, double>>& prices,
    const std::map<std::string, double>& fees,
    double threshold
);

bool execute_trade(
    const std::map<std::string, double>& opportunity,
    const std::map<std::string, std::string>& api_keys
);

#endif
