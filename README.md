# TIGFET Silicon Nano-wire 10nm Standard Cell Library

An open source standard cell library using [TIGFET-10nm-PDK](https://github.com/lnis-uofu/TIGFET-10nm-PDK) silicon nanowire device technology.

This kit consists of a SPICE model based on TCAD and Verilog-AMS models using Cadence Liberate for library generation.

Available cells are listed in [`cell_list.rpt`](docs/cell_list.rpt)

## Directory Structure

- `db/` contains library in a database format, compatible with synthesis EDA tools
- `docs` contains html documentations of logic gates
- `lib` contains library in a Liberty format of logic gates
- `spice` contains SPICE netlist used for the characterization
- `verilog` contains behavioral Verilog fof logic gates

## Citation

If you find this useful for your research, please use the following bibtex to cite us:
```
@inproceedings{gauchi_iscas_2022,
  title={An Open-source Three-Independent-Gate FET Standard Cell Library for Mixed Logic Synthesis},
  author={Gauchi, Roman and Snelgrove, Ashton and Gaillardon, Pierre-Emmanuel},
  booktitle={IEEE International Symposium on Circuits and Systems (ISCAS)},
  year={2022}
}
```
## License

This project is licensed under the MIT License - see the LICENSE file for details.

