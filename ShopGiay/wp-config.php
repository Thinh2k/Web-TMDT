<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'shopgiay' );

/** MySQL database username */
define( 'DB_USER', 'shopgiay' );

/** MySQL database password */
define( 'DB_PASSWORD', '123456' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'jtjq()$!GlO.PTjOmdY3*#0bu?hTwOk[E-4eVNSz;ERvV9tf-:<wp1DhxU2UD6Vg' );
define( 'SECURE_AUTH_KEY',  'pHn3$v0!n`s4t5,A:t.BH64T6Z&$gul:*4Avkm:j?vcW1H;@,JH#l,|}i_iZ%kkr' );
define( 'LOGGED_IN_KEY',    'OI7*mdoM@:d+2C5u,Cwi3e<Ra#8#;)IZA}42CEtooNXicJ~-f./#!<;xKm/y ?U_' );
define( 'NONCE_KEY',        'mvT5Wwr{;KS?u6JfFd<oPiq51dDRKD+tN3Yn^)gorZF7-KG@k*5_44$R8*$t=Tl[' );
define( 'AUTH_SALT',        'mt1]l3(3sV_V;6zwY$|&Mbz$emx&NHXoVeMty.2(aZgw|`%Ocn9x;e<JF_vFj/ZH' );
define( 'SECURE_AUTH_SALT', 'k%R8,zG#B$TtU%{o0W(0~dZ%<Qfk2h3|w.*L:^amg>#EU3U;}2SVmYDu:}V_X><c' );
define( 'LOGGED_IN_SALT',   '3Le@0q~-6Ku*j;)TMD!#[pg)k0m@Hup>SMPDIu^PE~qw._t0rc/kz.2Cbp0~2C I' );
define( 'NONCE_SALT',       '+xd#n@$FzeEjzC9zit|=gvnY&)yRl66fuG]=>wil7d)s2q-+`9|ct.Dohb)l<krq' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'tp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
