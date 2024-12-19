<?php

namespace amap\providers\auth;

use DI\Container;
use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;
use amap\core\service\BadInputException;
use amap\core\service\ServiceAuthInterface;

class JWTAuthnProvider implements AuthnProviderInterface
{
    protected ServiceAuthInterface $serviceAuth;
    protected JWTManager $jwtManager;
    public function __construct(ServiceAuthInterface $serviceAuth, JWTManager $jwtManager)
    {
        $this->serviceAuth = $serviceAuth;
        $this->jwtManager = $jwtManager;
    }

    public function inscription(CredentialsDTO $credentials): AuthDTO
    {
        try {
            $password = $credentials->password;
            $this->serviceAuth->createUtilisateur($credentials);
            $credentials->password = $password;
            return $this->signin($credentials);
        } catch (BadInputException $e) {
            throw new AuthInvalidException($e->getMessage());
        }
    }

    public function signin(CredentialsDTO $credentials): AuthDTO
    {
        try {
            $user = $this->serviceAuth->byCredentials($credentials);
        } catch (BadInputException $e) {
            throw new AuthInvalidException($e->getMessage());
        }
        $token = $this->jwtManager->createAcessToken($user);
        $authdto = new AuthDTO($user->id, $user->role);
        $authdto->setUtilisateur($user->utilisateur);
        $authdto->setAtoken($token);
        return $authdto;

    }

    public function refresh(AuthDTO $credentials): AuthDTO
    {
    }

    public function getSignedInUser(string $atoken): AuthDTO
    {
        try {
            $token = $this->jwtManager->decodeToken($atoken);
            $authDto = new AuthDTO($token['sub'], $token['role']);
            return $authDto;
        } catch (\Exception $e) {
            throw new AuthInvalidException($e->getMessage());
        }

    }

}
