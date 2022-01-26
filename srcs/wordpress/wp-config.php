<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
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
define( 'DB_NAME', 'database_blog' );

/** MySQL database username */
define( 'DB_USER', 'database_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'user_password123' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'z1J<vf#~;8q<.rlLT-c/6/<X>j1mq]%$s&_0HJrhs~$HOjBY^,(I4K+x=F1OJON{');
define('SECURE_AUTH_KEY',  'NVK1N&3|?^ ~tfC+Af^[&_T]$3oAc|rq<@^-gTVqL7Uqt%I1Oz>C-=^d.^`:PHBS');
define('LOGGED_IN_KEY',    '+>.6_J%]8WG2bZzWaF}TF7DM UWu7)njkTJQk8*:B/cx8S ,pF @MJm,7H6D|BVB');
define('NONCE_KEY',        'B@|z=&1q5Bw@u+1JnJv`#Akx5+|Mn/P[=i*n^wtNaw6DBpYE-b7 $m t-s#{a_-O');
define('AUTH_SALT',        'sFB|{0#CJdS=lun zr%/_tz43~~%B?WR+k[FblxS-#1>P*|GR(chzp%.$9XqV5={');
define('SECURE_AUTH_SALT', '-+N!g&X7_]2-w1d;#_KW>3Pb0bhN1nJaS/7PgPdg6<EZlnu)BRz&XLua]&=o:YD-');
define('LOGGED_IN_SALT',   'c>Vo@0uC|c=rg-=IF9z-7]`w6ER>XAX}+ L6(~E5:23v{0W]tR<U!/-SlTa]y)(6');
define('NONCE_SALT',       'h=^Qa]Ngk;* T4l`hR}-`x )E3V}=AMYHHe)Mwfxm=YFOqaQ;}A`m|l~Dt-.WKn~');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
