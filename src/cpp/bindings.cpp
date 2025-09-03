#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include "arbitrage.h"

namespace py = pybind11;

PYBIND11_MODULE(arbitrage_module, m) {
    m.doc() = "Arbitrage module for crypto trading";
    m.def("analyze_arbitrage", &analyze_arbitrage, py::arg("prices"), py::arg("fees"), py::arg("threshold"),
          "Find arbitrage opportunities");
    m.def("execute_trade", &execute_trade, py::arg("opportunity"), py::arg("api_keys"),
          "Execute buy -> withdraw -> sell");
}
