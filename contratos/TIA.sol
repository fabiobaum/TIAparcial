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
    Instrucao[] instrucoes;
    
    struct Instrucao {
        string texto;
        bool existe; 
    }
    
    modifier somenterepresentanteEmpresa() {
        require(msg.sender==representanteEmpresa, "Only the Company`s representatives can perform this operation");
        _;
    }

    constructor( address idProcurador) public {
        nomeEmpresa = "Company XYZ Inc";
        representanteEmpresa = msg.sender;
        procurador = idProcurador;  
    }
	
    function definirNomeDaEmpresa(string qualNomeDaEmpresa) public somenterepresentanteEmpresa {
        nomeEmpresa = qualNomeDaEmpresa;
    }
    
    function incluiInstrucao(string TextoDaInstrucao) public somenterepresentanteEmpresa {
        Instrucao memory novaInstrucao = Instrucao(TextoDaInstrucao, true);
        instrucoes.push(novaInstrucao);
    }

    function totalDeInstrucoes() public view returns (uint) {
        return instrucoes.length;
    }
        
    function detalhesInstrucao(uint idInstrucao) public view returns(string, address, address, uint, string) {
        uint tInstrucoes = totalDeInstrucoes();
        Instrucao memory detalhesInstrucao = instrucoes [idInstrucao];
        return (nomeEmpresa, representanteEmpresa, procurador, tInstrucoes, detalhesInstrucao.texto);
    }
}
