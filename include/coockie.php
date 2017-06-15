<?php
/**
 *
 * This file is part of the "NF Marsch Webstats" package.
 * Copyright (C) 2017  John Hawk <john.hawk@gmx.net>
 *
 * "NF Marsch Webstats" is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * "NF Marsch Webstats" is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
if (! defined ( 'IN_NFMWS' )) {
	exit ();
}

// Coockie laden, wenn vorhanden
$cookieVersion = 3;
$options = array ();
if (isset ( $_COOKIE ['nfmarsch'] )) {
	$options = json_decode ( $_COOKIE ['nfmarsch'], true );
	if (isset ( $options ['version'] ) && $options ['version'] != $cookieVersion) {
		$options = array ();
	}
}

if (! isset ( $options ['storage'] )) {
	$options ['storage'] ['sortByName'] = true;
	$options ['storage'] ['hideZero'] = true;
	$options ['storage'] ['showVehicles'] = true;
	$options ['storage'] ['onlyPallets'] = false;
}

if (! isset ( $options ['production'] )) {
	$options ['production'] ['sortByName'] = true;
	$options ['production'] ['sortFullProducts'] = true;
	$options ['production'] ['hidePlant'] = array();
}
