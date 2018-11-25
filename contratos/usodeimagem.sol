pragma solidity 0.4.25;

/**
@title TermOfInstructionAndAuthorization
@notice Smart Contract to store the Terms of Instruction and Authorization provided for Tess Law
@author Fabio Baum
*/

contract TIA {
	
    string public nomeEmpresa;
    address representanteEmpresa;
    address procurador;
	
    modifier somenterepresentanteEmpresa() {
        require(msg.sender==representanteEmpresa, "Only the Company`s representatives can perform this operation");
        _;
    }

    constructor() public {
        nomeEmpresa = "Company XYZ Inc";
        companysRepresentative = msg.sender;
    }
	
    function definirNomeDaEmpresa(string qualNomeDaEmpresa) public somenterepresentateEmpresa {
        nomeEmpresa = qualNomeDaEmpresa;
    }

    function definirAgente(address qualAgente) public somenteArtista  {
        require(qualAgente != address(0), "Endereço de agente invalido");
        agente = qualAgente;
    }
	
    function receberPeloUso() public payable {
        require(msg.value >= 100 szabo, "Por favor pague o valor mínimo");
        if (agente != address(0)) {
            agente.transfer((msg.value * 10) / 100);
        }
    }
}
