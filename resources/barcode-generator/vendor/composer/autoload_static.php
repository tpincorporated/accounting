<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInita3c8391e4defaa1e878b990df6223e57
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Picqer\\Barcode\\' => 15,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Picqer\\Barcode\\' => 
        array (
            0 => __DIR__ . '/..' . '/picqer/php-barcode-generator/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInita3c8391e4defaa1e878b990df6223e57::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInita3c8391e4defaa1e878b990df6223e57::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
