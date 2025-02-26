<?php
namespace amap\infrastructure\repository\doctrine;

use Doctrine\ORM\Query\AST\Functions\FunctionNode;
use Doctrine\ORM\Query\Lexer;
use Doctrine\ORM\Query\TokenType;


/**
 * RandFunction ::= "RAND" "(" ")"
 */
class Rand extends FunctionNode
{

    public function parse(\Doctrine\ORM\Query\Parser $parser):void
    {
        $parser->match(TokenType::T_IDENTIFIER);
        $parser->match(TokenType::T_OPEN_PARENTHESIS);
        $parser->match(TokenType::T_CLOSE_PARENTHESIS);
    }

    public function getSql(\Doctrine\ORM\Query\SqlWalker $sqlWalker):string
    {
        return 'random()';
    }
}
