# TIGFET Silicon Nano-wire 10nm Standard Cell Library

An open source standard cell library using [TIGFET-10nm-PDK](https://github.com/lnis-uofu/TIGFET-10nm-PDK) silicon nanowire device technology.

This kit consists of a SPICE model based on TCAD and Verilog-AMS models using *Cadence Liberate* for library generation.

Available cells are listed in [`cell_list.rpt`](docs/cell_list.rpt)

## Directory Structure

- **db/** -- contains library in a database format, compatible with synthesis EDA tools
- **docs/** -- contains html documentations of logic gates
- **lib/** -- contains library in a Liberty format of logic gates
- **spice/** -- contains SPICE netlist used for the characterization
- **verilog/** -- contains behavioral Verilog of logic gates

## Citation

If you find this useful for your research, please use the following bibtex to cite us:
```
@inproceedings{keyser_vlsisoc_2022,
  title={An Energy-Efficient Three-Independent-Gate FET Cell Library for Low-Power Edge Computing},
  author={Keyser, Michael and Gauchi, Roman and Gaillardon, Pierre-Emmanuel},
  booktitle={{IFIP}/{IEEE} International Conference on Very Large Scale Integration ({VLSI-SoC})},
  year={2022}
}
```
## License

This project is licensed under the MIT License - see the LICENSE file for details.

