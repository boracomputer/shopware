<?php

namespace Shopware\Themes\DashOneV2KM;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'DashOneV2Layout';

    protected $name = <<<'SHOPWARE_EOD'
D1V2 KM
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Dashone V2 extention for KM
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'
MIT
SHOPWARE_EOD;

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
