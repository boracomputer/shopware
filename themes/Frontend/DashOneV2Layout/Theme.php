<?php

namespace Shopware\Themes\DashOneV2Layout;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
D1V2 Layout
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Dashone V2 extention for all shops
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'
MIT
SHOPWARE_EOD;

    protected $javascript = array(
        'src/js/jquery.custom.js'
    );

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
