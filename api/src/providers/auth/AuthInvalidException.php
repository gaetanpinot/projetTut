<?php

namespace amap\providers\auth;
use Exception;

class AuthInvalidException extends Exception
{
    public function __construct(string $message)
    {
        parent::__construct($message, 400);
    }
}