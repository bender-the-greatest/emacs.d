<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: hexrgb.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=hexrgb.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: hexrgb.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=hexrgb.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for hexrgb.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=hexrgb.el" /><meta content="width=device-width" name="viewport" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('â')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://emacswiki.org/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="default"><div class="header"><div class="menu"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a href="http://www.emacswiki.org/emacs/HowTo" class="local">HowTo</a> <a href="http://www.emacswiki.org/emacs/Glossary" class="local">Glossary</a> <a href="http://www.emacswiki.org/emacs/RecentChanges" class="local">RecentChanges</a> <a href="http://www.emacswiki.org/emacs/News" class="local">News</a> <a href="http://www.emacswiki.org/emacs/Problems" class="local">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><form method="get" action="http://www.emacswiki.org/emacs" enctype="multipart/form-data" class="search" accept-charset="utf-8"><p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form></div><h1><a rel="nofollow" title="Click to search for references to this page" href="http://www.emacswiki.org/emacs?search=%22hexrgb%5c.el%22">hexrgb.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/hexrgb.el">Download</a> <a href="https://github.com/emacsmirror/emacswiki.org/blob/master/hexrgb.el">Git</a></p><pre><span class="comment">;;; hexrgb.el --- Functions to manipulate colors, including RGB hex strings.</span>
<span class="comment">;;</span>
<span class="comment">;; Filename: hexrgb.el</span>
<span class="comment">;; Description: Functions to manipulate colors, including RGB hex strings.</span>
<span class="comment">;; Author: Drew Adams</span>
<span class="comment">;; Maintainer: Drew Adams (concat <span class="string">"drew.adams"</span> <span class="string">"@"</span> <span class="string">"oracle"</span> <span class="string">".com"</span>)</span>
<span class="comment">;; Copyright (C) 2004-2015, Drew Adams, all rights reserved.</span>
<span class="comment">;; Created: Mon Sep 20 22:58:45 2004</span>
<span class="comment">;; Version: 0</span>
<span class="comment">;; Package-Requires: ()</span>
<span class="comment">;; Last-Updated: Wed Jul  8 18:32:29 2015 (-0700)</span>
<span class="comment">;;           By: dradams</span>
<span class="comment">;;     Update #: 985</span>
<span class="comment">;; URL: http://www.emacswiki.org/hexrgb.el</span>
<span class="comment">;; Doc URL: http://www.emacswiki.org/SetColor</span>
<span class="comment">;; Doc URL: http://emacswiki.org/ColorPalette</span>
<span class="comment">;; Keywords: number, hex, rgb, color, background, frames, display</span>
<span class="comment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x, 24.x, 25.x</span>
<span class="comment">;;</span>
<span class="comment">;; Features that might be required by this library:</span>
<span class="comment">;;</span>
<span class="comment">;;   None</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Commentary:</span>
<span class="comment">;;</span>
<span class="comment">;;  Functions to manipulate colors, including RGB hex strings.</span>
<span class="comment">;;</span>
<span class="comment">;;  This library provides functions for converting between RGB (red,</span>
<span class="comment">;;  green, blue) color components and HSV (hue, saturation, value)</span>
<span class="comment">;;  color components.  It helps you convert among Emacs color</span>
<span class="comment">;;  components (whole numbers from 0 through 65535), RGB and HSV</span>
<span class="comment">;;  floating-point components (0.0 through 1.0), Emacs color-name</span>
<span class="comment">;;  strings (such as <span class="string">"blue"</span>), and hex RGB color strings (such as</span>
<span class="comment">;;  <span class="string">"#FC43A7912"</span>).</span>
<span class="comment">;;</span>
<span class="comment">;;  An RGB hex string, such as used as a frame `<span class="constant important">background-color</span>'</span>
<span class="comment">;;  property, is a string of 1 + (3 * n) characters, the first of</span>
<span class="comment">;;  which is <span class="string">"#"</span>.  The other characters are hexadecimal digits, in</span>
<span class="comment">;;  three groups representing (from the left): red, green, and blue</span>
<span class="comment">;;  hex codes.</span>
<span class="comment">;;</span>
<span class="comment">;;  Constants defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hexrgb-defined-colors</span>', `<span class="constant important">hexrgb-defined-colors-alist</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-defined-colors-no-dups</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-defined-colors-no-dups-alist</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Options defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hexrgb-canonicalize-defined-colors-flag</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Commands defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hexrgb-blue</span>', `<span class="constant important">hexrgb-complement</span>', `<span class="constant important">hexrgb-green</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-hue</span>', `<span class="constant important">hexrgb-read-color</span>', `<span class="constant important">hexrgb-red</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-saturation</span>', `<span class="constant important">hexrgb-value</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;  Non-interactive functions defined here:</span>
<span class="comment">;;</span>
<span class="comment">;;    `<span class="constant important">hexrgb-approx-equal</span>', `<span class="constant important">hexrgb-canonicalize-defined-colors</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-color-name-to-hex</span>', `<span class="constant important">hexrgb-color-values-to-hex</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-color-value-to-float</span>', `<span class="constant important">hexrgb-defined-colors</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-defined-colors-alist</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-delete-whitespace-from-string</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-float-to-color-value</span>', `<span class="constant important">hexrgb-hex-char-to-integer</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-hex-to-color-values</span>', `<span class="constant important">hexrgb-hex-to-hex</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-hex-to-hsv</span>', `<span class="constant important">hexrgb-hex-to-rgb</span>', `<span class="constant important">hexrgb-hsv-to-hex</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-hex-to-int</span>', `<span class="constant important">hexrgb-hsv-to-rgb</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-increment-blue</span>', `<span class="constant important">hexrgb-increment-equal-rgb</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-increment-green</span>', `<span class="constant important">hexrgb-increment-hex</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-increment-hue</span>', `<span class="constant important">hexrgb-increment-red</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-increment-saturation</span>', `<span class="constant important">hexrgb-increment-value</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-int-to-hex</span>', `<span class="constant important">hexrgb-blue-hex</span>', `<span class="constant important">hexrgb-green-hex</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-red-hex</span>', `<span class="constant important">hexrgb-rgb-hex-string-p</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-rgb-hex-to-rgb-hex</span>', `<span class="constant important">hexrgb-rgb-to-hex</span>',</span>
<span class="comment">;;    `<span class="constant important">hexrgb-rgb-to-hsv</span>'.</span>
<span class="comment">;;</span>
<span class="comment">;;</span>
<span class="comment">;;  Add this to your initialization file (~/.emacs or ~/_emacs):</span>
<span class="comment">;;</span>
<span class="comment">;;    (<span class="keyword">require</span> '<span class="constant">hexrgb</span>)</span>
<span class="comment">;;</span>
<span class="comment">;;  Do not try to use this library without a window manager.</span>
<span class="comment">;;  That is, do not use this with `emacs -nw'.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Change Log:</span>
<span class="comment">;;</span>
<span class="comment">;; 2015/07/08 dadams</span>
<span class="comment">;;     hexrgb-color-name-to-hex, hexrgb-increment-(hue|saturation|value):</span>
<span class="comment">;;       Raise error if x-color-values returns nil (probably from <span class="string">"unspecified-[bf]g"</span>).</span>
<span class="comment">;;     hexrgb-color-values-to-hex: Raise error if COMPONENTS is nil.</span>
<span class="comment">;; 2015/02/26 dadams</span>
<span class="comment">;;     hexrgb-hex-to-rgb: Do not use 65535.0 - use (16 ** len) -1 instead.</span>
<span class="comment">;; 2014/08/17 dadams</span>
<span class="comment">;;     hexrgb-read-color: Bind icicle-color-completing.</span>
<span class="comment">;; 2013/01/18 dadams</span>
<span class="comment">;;     Added: hexrgb-increment-(hue|saturation|value): Moved them here and renamed from</span>
<span class="comment">;;       icicle-increment-color-*.  Changed range to 0-1 and added optional arg NB-DIGITS.</span>
<span class="comment">;; 2012/12/16 dadams</span>
<span class="comment">;;     hexrgb-(hsv|rgb|color-name|color-values)-to-hex: Added optional arg NB-DIGITS.</span>
<span class="comment">;; 2012/03/17 dadams</span>
<span class="comment">;;     Added: hexrgb-(red|green|blue-hex, hexrgb-rgb-hex-to-rgb-hex, hexrgb-hex-to-hex.</span>
<span class="comment">;; 2012/01/05 dadams</span>
<span class="comment">;;     hexrgb-complement: Added optional arg MSG-P.</span>
<span class="comment">;;     Some doc-string cleanup.</span>
<span class="comment">;; 2011/11/26 dadams</span>
<span class="comment">;;     hexrgb-read-color: Changed arg order to match vanilla Emacs read-color.  Added MSGP.</span>
<span class="comment">;;     *** THIS IS AN INCOMPATIBLE CHANGE.  IF YOU USE THIS FUNCTION THEN UPDATE YOUR CODE. ***</span>
<span class="comment">;; 2011/02/16 dadams</span>
<span class="comment">;;     hexrgb-increment-hex: INCOMPATIBLE CHANGE:</span>
<span class="comment">;;                           Swapped order of args NB-DIGITS, INCREMENT, to fit other functions.</span>
<span class="comment">;;     hexrgb-increment-*: Took the change to hexrgb-increment-hex into account.</span>
<span class="comment">;;     Improved various doc strings.</span>
<span class="comment">;; 2011/01/08 dadams</span>
<span class="comment">;;     Restored autoload cookie for eval-and-compile hexrgb-canonicalize-defined-colors.</span>
<span class="comment">;; 2011/01/03 dadams</span>
<span class="comment">;;     Removed autoload cookies from non-interactive functions.</span>
<span class="comment">;; 2010/12/18 dadams</span>
<span class="comment">;;     hexrgb-canonicalize-defined-colors: Added autoload cookie.  Thx to Richard Kim.</span>
<span class="comment">;; 2010/12/06 dadams</span>
<span class="comment">;;     hexrgb-hex-to-color-values: Correct start offset for blue.  Thx to <span class="string">"Linda"</span> on Emacs Wiki.</span>
<span class="comment">;; 2009/11/14 dadams</span>
<span class="comment">;;    hexrgb-rgb-to-hsv: Corrected hue when &gt; 1.0.  Use strict inequality for hue limit tests.</span>
<span class="comment">;;    hexrgb-approx-equal: Convert RFUZZ and AFUZZ to their absolute values.</span>
<span class="comment">;; 2009/11/03 dadams</span>
<span class="comment">;;    Added: hexrgb-delete-whitespace-from-string, hexrgb-canonicalize-defined-colors,</span>
<span class="comment">;;           hexrgb-defined-colors(-no-dups)(-alist), hexrgb-canonicalize-defined-colors-flag.</span>
<span class="comment">;;    hexrgb-read-color: Use function hexrgb-defined-colors-alist, not the constant.</span>
<span class="comment">;; 2008/12/25 dadams</span>
<span class="comment">;;    hexrgb-rgb-to-hsv:</span>
<span class="comment">;;      Replace (not (equal 0.0e+NaN saturation)) by standard test (= saturation saturation).</span>
<span class="comment">;;      Thx to  Michael Heerdegen for the bug report.</span>
<span class="comment">;; 2008-10-17 dadams</span>
<span class="comment">;;    hexrgb-defined-colors(-alist): Prevent load-time error if user tries to use emacs -nw.</span>
<span class="comment">;; 2007/12/30 dadams</span>
<span class="comment">;;    Added: hexrgb-hex-to-color-values.</span>
<span class="comment">;; 2007/10/20 dadams</span>
<span class="comment">;;    hexrgb-read-color: Treat pseudo colors too (e.g. *point foreground*).</span>
<span class="comment">;; 2007/01/21 dadams</span>
<span class="comment">;;    hexrgb-read-color: Error if empty string (and not allow-empty-name-p).</span>
<span class="comment">;; 2006/06/06 dadams</span>
<span class="comment">;;    Added: hexrgb-defined-colors(-alist).  Use instead of (x-defined-colors).</span>
<span class="comment">;;    hexrgb-(red|green|blue): Added interactive specs.</span>
<span class="comment">;; 2006/06/04 dadams</span>
<span class="comment">;;    hexrgb-read-color: Added optional arg allow-empty-name-p.</span>
<span class="comment">;; 2006/06/02 dadams</span>
<span class="comment">;;    Added: hexrgb-rgb-hex-string-p.  Used it.</span>
<span class="comment">;; 2006/05/30 dadams</span>
<span class="comment">;;    Added: hexrgb-hex-to-(hsv|rgb), hexrgb-hsv-to-hex, hexrgb-color-name-to-hex,</span>
<span class="comment">;;           hexrgb-complement, hexrgb-read-color, hexrgb-hue, hexrgb-saturation,</span>
<span class="comment">;;           hexrgb-value, hexrgb-red, hexrgb-blue, hexrgb-green.</span>
<span class="comment">;;    approx-equal: Add optional fuzz factor arguments.  Changed the algorithm.</span>
<span class="comment">;;    Renamed: approx-equal to hexrgb-approx-equal.</span>
<span class="comment">;;    hexrgb-rgb-to-hsv: Changed test from &lt; to &lt;=: (<span class="keyword cl">when</span> (&lt;= hue 0.0)...).</span>
<span class="comment">;;    hexrgb-hsv-to-rgb: Treat hue = 0.0 (int 0) the same as hue = 1.0 (int 6).</span>
<span class="comment">;;    hexrgb-rgb-to-hex, hexrgb-increment-hex: Corrected doc strings.</span>
<span class="comment">;; 2006/05/22 dadams</span>
<span class="comment">;;    Added: hexrgb-hsv-to-hex, hexrgb-rgb-to-hex.  Require cl.el when byte-compile.</span>
<span class="comment">;; 2005/08/09 dadams</span>
<span class="comment">;;    hexrgb-rgb-to-hsv: Side-stepped Emacs-20 bug in comparing NaN.</span>
<span class="comment">;;    hexrgb-increment-*: Added optional arg wrap-p.</span>
<span class="comment">;;    hexrgb-increment-hex: Prevent wrap if not wrap-p.</span>
<span class="comment">;; 2005/08/02 dadams</span>
<span class="comment">;;    hexrgb-rgb-to-hes: Bug fix: If delta is zero, then so are hue and saturation.</span>
<span class="comment">;; 2005/06/24 dadams</span>
<span class="comment">;;    hexrgb-rgb-to-hsv: Bug fix: test for NaN (e.g. on divide by zero).</span>
<span class="comment">;; 2005/02/08 dadams</span>
<span class="comment">;;    hexrgb-hsv-to-rgb: Bug fix (typo: p, q -&gt; pp, qq; added ww).</span>
<span class="comment">;; 2005/01/09 dadams</span>
<span class="comment">;;    hexrgb-int-to-hex: Fixed bug in hexrgb-int-to-hex: nb-digits not respected.</span>
<span class="comment">;;    Added: hexrgb-hsv-to-rgb, hexrgb-rgb-to-hsv, approx-equal.</span>
<span class="comment">;;    Renamed old hexrgb-increment-value to hexrgb-increment-equal-rgb.</span>
<span class="comment">;; 2005/01/05 dadams</span>
<span class="comment">;;    hexrgb-int-to-hex: Used a suggestion from Juri Linkov.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="comment">;; any later version.</span>

<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="comment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="comment">;;</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;</span>
<span class="comment">;;; Code:</span>

(<span class="keyword elisp">eval-when-compile</span> (<span class="keyword">require</span> '<span class="constant">cl</span>)) <span class="comment">;; case</span>

<span class="comment">;; Unless you first load `hexrgb.el', then either `palette.el' or `eyedropper.el', you will get</span>
<span class="comment">;; warnings about variables and functions with prefix `<span class="constant important">eyedrop-</span>' when you byte-compile</span>
<span class="comment">;; `hexrgb.el'.  You can ignore these warnings.</span>

(<span class="keyword">defvar</span> <span class="variable">eyedrop-picked-foreground</span>)
(<span class="keyword">defvar</span> <span class="variable">eyedrop-picked-background</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword elisp">eval-and-compile</span>
 (<span class="keyword">defun</span> <span class="function">hexrgb-canonicalize-defined-colors</span> (list)
   <span class="string">"Copy of LIST with color names canonicalized.
LIST is a list of color names (strings).
Canonical names are lowercase, with no whitespace.
There are no duplicate names."</span>
   (<span class="keyword elisp">let</span> ((tail  list)
         this new)
     (<span class="keyword elisp">while</span> tail
       (setq this  (car tail)
             this  (hexrgb-delete-whitespace-from-string (downcase this) 0 (length this)))
       (<span class="keyword cl">unless</span> (member this new) (push this new))
       (pop tail))
     (nreverse new)))

 (<span class="keyword">defun</span> <span class="function">hexrgb-delete-whitespace-from-string</span> (string <span class="type">&amp;optional</span> from to)
   <span class="string">"Remove whitespace from substring of STRING from FROM to TO.
If FROM is nil, then start at the beginning of STRING (FROM = 0).
If TO is nil, then end at the end of STRING (TO = length of STRING).
FROM and TO are zero-based indexes into STRING.
Character FROM is affected (possibly deleted).  Character TO is not."</span>
   (setq from  (or from 0)
         to    (or to (length string)))
   (<span class="keyword elisp">with-temp-buffer</span>
     (insert string)
     (goto-char (+ from (point-min)))
     (<span class="keyword elisp">let</span> ((count  from)
           char)
       (<span class="keyword elisp">while</span> (and (not (eobp))  (&lt; count to))
         (setq char  (char-after))
         (<span class="keyword elisp">if</span> (memq char '(?\  ?\t ?\n))  (delete-char 1)  (forward-char 1))
         (setq count  (1+ count)))
       (buffer-string)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defconst</span> <span class="variable">hexrgb-defined-colors</span> (<span class="keyword elisp">eval-when-compile</span> (and window-system (x-defined-colors)))
  <span class="string">"List of all supported colors."</span>)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defconst</span> <span class="variable">hexrgb-defined-colors-no-dups</span>
    (<span class="keyword elisp">eval-when-compile</span>
     (and window-system (hexrgb-canonicalize-defined-colors (x-defined-colors))))
  <span class="string">"List of all supported color names, with no duplicates.
Names are all lowercase, without any spaces."</span>)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defconst</span> <span class="variable">hexrgb-defined-colors-alist</span>
    (<span class="keyword elisp">eval-when-compile</span> (and window-system (mapcar #'list (x-defined-colors))))
  <span class="string">"Alist of all supported color names, for use in completion.
See also `<span class="constant important">hexrgb-defined-colors-no-dups-alist</span>', which is the same
thing, but without any duplicates, such as \"light blue\" and
\"LightBlue\"."</span>)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defconst</span> <span class="variable">hexrgb-defined-colors-no-dups-alist</span>
    (<span class="keyword elisp">eval-when-compile</span>
     (and window-system
          (mapcar #'list (hexrgb-canonicalize-defined-colors (x-defined-colors)))))
  <span class="string">"Alist of all supported color names, with no duplicates, for completion.
Names are all lowercase, without any spaces."</span>)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defcustom</span> <span class="variable">hexrgb-canonicalize-defined-colors-flag</span> t
  <span class="string">"*Non-nil means remove duplicate color names.
Names are considered duplicates if they are the same when abstracting
from whitespace and letter case."</span>
  <span class="builtin">:type</span> 'boolean
  <span class="builtin">:group</span> 'Icicles <span class="builtin">:group</span> 'doremi-frame-commands <span class="builtin">:group</span> 'faces <span class="builtin">:group</span> 'convenience)

<span class="comment">;; You should use these two functions, not the constants, so users can change</span>
<span class="comment">;; the behavior by customizing `<span class="constant important">hexrgb-canonicalize-defined-colors-flag</span>'.</span>

(<span class="keyword">defun</span> <span class="function">hexrgb-defined-colors</span> ()
  <span class="string">"List of supported color names.
If `<span class="constant important">hexrgb-canonicalize-defined-colors-flag</span>' is non-nil, then names
are lowercased, whitespace is removed, and there are no duplicates."</span>
  (<span class="keyword elisp">if</span> hexrgb-canonicalize-defined-colors-flag
      hexrgb-defined-colors-no-dups
    hexrgb-defined-colors))

(<span class="keyword">defun</span> <span class="function">hexrgb-defined-colors-alist</span> ()
  <span class="string">"Alist of supported color names.  Usable for completion.
If `<span class="constant important">hexrgb-canonicalize-defined-colors-flag</span>' is non-nil, then names
are lowercased, whitespace is removed, and there are no duplicates."</span>
  (<span class="keyword elisp">if</span> hexrgb-canonicalize-defined-colors-flag
      hexrgb-defined-colors-no-dups-alist
    hexrgb-defined-colors-alist))

<span class="comment">;; RMS added this function to Emacs (23) as `<span class="constant important">read-color</span>', with some feature loss.</span>
<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-read-color</span> (<span class="type">&amp;optional</span> prompt convert-to-RGB-p allow-empty-name-p msgp)
  <span class="string">"Read a color name or hex RGB hexadecimal color value #RRRRGGGGBBBB.
Completion is available for color names, but not for RGB hex strings.
If you input an RGB hex string, it must have the form #XXXXXXXXXXXX or
XXXXXXXXXXXX, where each X is a hex digit.  The number of Xs must be a
multiple of 3, with the same number of Xs for each of red, green, and
blue.  The order is red, green, blue.

Color names that are normally considered equivalent are canonicalized:
They are lowercased, whitespace is removed, and duplicates are
eliminated.  E.g. \"LightBlue\" and \"light blue\" are both replaced
by \"lightblue\".  If you do not want this behavior, but want to
choose names that might contain whitespace or uppercase letters, then
customize option `<span class="constant important">hexrgb-canonicalize-defined-colors-flag</span>' to nil.

In addition to standard color names and RGB hex values, the following
are available as color candidates.  In each case, the corresponding
color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the cursor
* `*point background*'   - background under the cursor

\(You can copy a color using eyedropper commands such as
`<span class="constant important">eyedrop-pick-foreground-at-mouse</span>'.)

Optional arg PROMPT is the prompt - nil means use a default prompt.

Checks input to be sure it represents a valid color.  If not, raises
an error (but see exception for empty input with non-nil
ALLOW-EMPTY-NAME-P).

Interactively, or with optional arg CONVERT-TO-RGB-P non-nil, converts
an input color name to an RGB hex string.  Returns the RGB hex string.

Optional arg ALLOW-EMPTY-NAME-P controls what happens if you enter an
empty color name (that is, you just hit `<span class="constant important">RET</span>').  If non-nil, then
`<span class="constant important">hexrgb-read-color</span>' returns an empty color name, \"\".  If nil, then
it raises an error.  Calling programs must test for \"\" if
ALLOW-EMPTY-NAME-P is non-nil.  They can then perform an appropriate
action in case of empty input.

Interactively, or with non-nil MSGP, show color name in the echo area."</span>
  (interactive <span class="string">"i\np\ni\np"</span>)            <span class="comment">; Always convert to RGB interactively.</span>
  (<span class="keyword elisp">let</span>* ((completion-ignore-case     t)
         (icicle-color-completing-p  t)
         <span class="comment">;; Free variables here: `<span class="constant important">eyedrop-picked-foreground</span>', `<span class="constant important">eyedrop-picked-background</span>'.</span>
         <span class="comment">;; They are defined in library `palette.el' or library `eyedropper.el'.</span>
         (colors                     (<span class="keyword elisp">if</span> (fboundp 'eyedrop-foreground-at-point)
                                         (append (and eyedrop-picked-foreground
                                                      '((<span class="string">"*copied foreground*"</span>)))
                                                 (and eyedrop-picked-background
                                                      '((<span class="string">"*copied background*"</span>)))
                                                 '((<span class="string">"*mouse-2 foreground*"</span>)
                                                   (<span class="string">"*mouse-2 background*"</span>)
                                                   (<span class="string">"*point foreground*"</span>) (<span class="string">"*point background*"</span>))
                                                 (hexrgb-defined-colors-alist))
                                       (hexrgb-defined-colors-alist)))
         (color                      (completing-read (or prompt <span class="string">"Color (name or #R+G+B+): "</span>)
                                                      colors))
         hex-string)
    (<span class="keyword cl">when</span> (fboundp 'eyedrop-foreground-at-point)
      (<span class="keyword elisp">cond</span> ((string= <span class="string">"*copied foreground*"</span> color) (setq color  eyedrop-picked-foreground))
            ((string= <span class="string">"*copied background*"</span> color) (setq color  eyedrop-picked-background))
            ((string= <span class="string">"*point foreground*"</span> color)  (setq color  (eyedrop-foreground-at-point)))
            ((string= <span class="string">"*point background*"</span> color)  (setq color  (eyedrop-background-at-point)))
            ((string= <span class="string">"*mouse-2 foreground*"</span> color)
             (setq color  (<span class="keyword elisp">prog1</span> (eyedrop-foreground-at-mouse
                                  (read-event <span class="string">"Click `mouse-2' to choose foreground color - "</span>))
                            (read-event)))) <span class="comment">; Discard mouse up event.</span>
            ((string= <span class="string">"*mouse-2 background*"</span> color)
             (setq color  (<span class="keyword elisp">prog1</span> (eyedrop-background-at-mouse
                                  (read-event <span class="string">"Click `mouse-2' to choose background color - "</span>))
                            (read-event)))))) <span class="comment">; Discard mouse up event.</span>
    (setq hex-string  (or (string-match <span class="string">"^#\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$"</span> color)
                          (and (string-match <span class="string">"^\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$"</span> color)
                               t)))
    (<span class="keyword elisp">if</span> (and allow-empty-name-p (string= <span class="string">""</span> color))
        <span class="string">""</span>
      (<span class="keyword cl">when</span> (and hex-string (not (eq 0 hex-string)))
        (setq color  (concat <span class="string">"#"</span> color))) <span class="comment">; No #; add it.</span>
      (<span class="keyword cl">unless</span> hex-string
        (<span class="keyword cl">when</span> (or (string= <span class="string">""</span> color)
                  (not (<span class="keyword elisp">if</span> (fboundp 'test-completion) <span class="comment">; Not defined in Emacs 20.</span>
                           (test-completion color colors)
                         (try-completion color colors))))
          (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color))
        (<span class="keyword cl">when</span> convert-to-RGB-p (setq color  (hexrgb-color-name-to-hex color))))
      (<span class="keyword cl">when</span> msgp (message <span class="string">"Color: `<span class="constant important">%s</span>'"</span> color))
      color)))

(<span class="keyword">defun</span> <span class="function">hexrgb-rgb-hex-string-p</span> (color <span class="type">&amp;optional</span> laxp)
  <span class="string">"Non-nil if COLOR is an RGB string #XXXXXXXXXXXX.
Each X is a hex digit.  The number of Xs must be a multiple of 3, with
the same number of Xs for each of red, green, and blue.

Non-nil optional arg LAXP means that the initial `#' is optional.  In
that case, for a valid string of hex digits: when # is present 0 is
returned<span class="comment">; otherwise, t is returned."</span></span>
  (or (string-match <span class="string">"^#\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$"</span> color)
      (and laxp (string-match <span class="string">"^\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+$"</span> color) t)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-complement</span> (color <span class="type">&amp;optional</span> msg-p)
  <span class="string">"Return the color that is the complement of COLOR.
Non-interactively, non-nil optional arg MSG-P means show a message
with the complement."</span>
  (interactive (list (hexrgb-read-color) t))
  (setq color  (hexrgb-color-name-to-hex color))
  (<span class="keyword elisp">let</span> ((red    (hexrgb-red color))
        (green  (hexrgb-green color))
        (blue   (hexrgb-blue color)))
    (setq color  (hexrgb-rgb-to-hex (- 1.0 red) (- 1.0 green) (- 1.0 blue))))
  (<span class="keyword cl">when</span> msg-p (message <span class="string">"Complement: `<span class="constant important">%s</span>'"</span> color))
  color)

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-hue</span> (color)
  <span class="string">"Return the hue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\"."</span>
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (car (hexrgb-rgb-to-hsv (hexrgb-red color) (hexrgb-green color) (hexrgb-blue color))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-saturation</span> (color)
  <span class="string">"Return the saturation component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\"."</span>
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (cadr (hexrgb-rgb-to-hsv (hexrgb-red color) (hexrgb-green color) (hexrgb-blue color))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-value</span> (color)
  <span class="string">"Return the value component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\"."</span>
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (caddr (hexrgb-rgb-to-hsv (hexrgb-red color) (hexrgb-green color) (hexrgb-blue color))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-red</span> (color)
  <span class="string">"Return the red component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\"."</span>
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (/ (hexrgb-hex-to-int (substring color 1 (1+ (/ (1- (length color)) 3))))
     (expt 16.0 (/ (1- (length color)) 3.0))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-green</span> (color)
  <span class="string">"Return the green component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\"."</span>
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (<span class="keyword elisp">let</span>* ((len    (/ (1- (length color)) 3))
         (start  (1+ len)))
    (/ (hexrgb-hex-to-int (substring color start (+ start len)))
       (expt 16.0 (/ (1- (length color)) 3.0)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">hexrgb-blue</span> (color)
  <span class="string">"Return the blue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\"."</span>
  (interactive (list (hexrgb-read-color)))
  (setq color  (hexrgb-color-name-to-hex color))
  (<span class="keyword elisp">let</span>* ((len    (/ (1- (length color)) 3))
         (start  (+ 1 len len)))
    (/ (hexrgb-hex-to-int (substring color start (+ start len)))
       (expt 16.0 (/ (1- (length color)) 3.0)))))

(<span class="keyword">defun</span> <span class="function">hexrgb-rgb-to-hsv</span> (red green blue)
  <span class="string">"Convert RED, GREEN, BLUE components to HSV (hue, saturation, value).
Each input component is 0.0 to 1.0, inclusive.
Returns a list of HSV components of value 0.0 to 1.0, inclusive."</span>
  (<span class="keyword elisp">let</span>* ((min    (min red green blue))
         (max    (max red green blue))
         (value  max)
         (delta  (- max min))
         hue saturation)
    (<span class="keyword elisp">if</span> (hexrgb-approx-equal 0.0 delta)
        (setq hue         0.0
              saturation  0.0)          <span class="comment">; Gray scale - no color; only value.</span>
      (<span class="keyword elisp">if</span> (and (<span class="keyword elisp">condition-case</span> nil
                   (setq saturation  (/ delta max))
                 (arith-error nil))
               <span class="comment">;; Must be a number, not a NaN.  The standard test for a NaN is (not (= N N)),</span>
               <span class="comment">;; but an Emacs 20 bug makes (= N N) return t for a NaN also.</span>
               (or (&lt; emacs-major-version 21) (= saturation saturation)))
          (<span class="keyword elisp">if</span> (hexrgb-approx-equal 0.0 saturation)
              (setq hue         0.0
                    saturation  0.0)    <span class="comment">; Again, no color; only value.</span>
            <span class="comment">;; Color</span>
            (setq hue  (<span class="keyword elisp">if</span> (hexrgb-approx-equal red max)
                           (/ (- green blue) delta) <span class="comment">; Between yellow &amp; magenta.</span>
                         (<span class="keyword elisp">if</span> (hexrgb-approx-equal green max)
                             (+ 2.0 (/ (- blue red) delta)) <span class="comment">; Between cyan &amp; yellow.</span>
                           (+ 4.0 (/ (- red green) delta)))) <span class="comment">; Between magenta &amp; cyan.</span>
                  hue  (/ hue 6.0))
            <span class="comment">;; (<span class="keyword cl">when</span> (&lt;= hue 0.0) (setq hue  (+ hue 1.0)))  ; $$$$$$</span>
            <span class="comment">;; (<span class="keyword cl">when</span> (&gt;= hue 1.0) (setq hue  (- hue 1.0)))) ; $$$$$$</span>
            (<span class="keyword cl">when</span> (&lt; hue 0.0) (setq hue  (+ hue 1.0)))
            (<span class="keyword cl">when</span> (&gt; hue 1.0) (setq hue  (- hue 1.0))))
        (setq hue         0.0           <span class="comment">; Div by zero (max=0): H:=0, S:=0. (Hue undefined.)</span>
              saturation  0.0)))
    (list hue saturation value)))

(<span class="keyword">defun</span> <span class="function">hexrgb-hsv-to-rgb</span> (hue saturation value)
  <span class="string">"Convert HUE, SATURATION, VALUE components to RGB (red, green, blue).
Each input component is 0.0 to 1.0, inclusive.
Returns a list of RGB components of value 0.0 to 1.0, inclusive."</span>
  (<span class="keyword elisp">let</span> (red green blue int-hue fract pp qq tt ww)
    (<span class="keyword elisp">if</span> (hexrgb-approx-equal 0.0 saturation)
        (setq red    value
              green  value
              blue   value)             <span class="comment">; Gray</span>
      (setq hue      (* hue 6.0)        <span class="comment">; Sectors: 0 to 5</span>
            int-hue  (floor hue)
            fract    (- hue int-hue)
            pp       (* value (- 1 saturation))
            qq       (* value (- 1 (* saturation fract)))
            ww       (* value (- 1 (* saturation (- 1 (- hue int-hue))))))
      (<span class="keyword cl">case</span> int-hue
        ((0 6) (setq red    value
                     green  ww
                     blue   pp))
        (1 (setq red    qq
                 green  value
                 blue   pp))
        (2 (setq red    pp
                 green  value
                 blue   ww))
        (3 (setq red    pp
                 green  qq
                 blue   value))
        (4 (setq red    ww
                 green  pp
                 blue   value))
        (otherwise (setq red    value
                         green  pp
                         blue   qq))))
    (list red green blue)))

(<span class="keyword">defun</span> <span class="function">hexrgb-hsv-to-hex</span> (hue saturation value <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Return the hex RBG color string for inputs HUE, SATURATION, VALUE.
These inputs are each in the range 0 to 1.
Optional arg NB-DIGITS is the number of hex digits per component,
default: 4.
The output string is `#' followed by `<span class="constant important">nb-digits</span>' hex digits for each
color component.  So for the default `<span class="constant important">nb-digits</span>' value of 4, the form
is \"#RRRRGGGGBBBB\"."</span>
  (setq nb-digits  (or nb-digits  4))
  (hexrgb-color-values-to-hex
   (mapcar (<span class="keyword elisp">lambda</span> (x) (floor (* x 65535.0))) (hexrgb-hsv-to-rgb hue saturation value))
   nb-digits))

(<span class="keyword">defun</span> <span class="function">hexrgb-rgb-to-hex</span> (red green blue <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Return the hex RBG color string for inputs RED, GREEN, BLUE.
These inputs are each in the range 0 to 1.
Optional arg NB-DIGITS is the number of hex digits per component,
default: 4.
The output string is `#' followed by `<span class="constant important">nb-digits</span>' hex digits for each
color component.  So for the default `<span class="constant important">nb-digits</span>' value of 4, the form
is \"#RRRRGGGGBBBB\"."</span>
  (setq nb-digits  (or nb-digits  4))
  (hexrgb-color-values-to-hex
   (mapcar (<span class="keyword elisp">lambda</span> (x) (floor (* x 65535.0))) (list red green blue))
   nb-digits))

(<span class="keyword">defun</span> <span class="function">hexrgb-hex-to-hsv</span> (color)
  <span class="string">"Return a list of HSV (hue, saturation, value) color components.
Each component is a value from 0.0 to 1.0, inclusive.
COLOR is a color name or a hex RGB string that starts with \"#\" and
is followed by an equal number of hex digits for red, green, and blue
components."</span>
  (<span class="keyword elisp">let</span> ((rgb-components  (hexrgb-hex-to-rgb color)))
    (apply #'hexrgb-rgb-to-hsv rgb-components)))

(<span class="keyword">defun</span> <span class="function">hexrgb-hex-to-rgb</span> (color)
  <span class="string">"Return a list of RGB (red, green, blue) color components.
Each component is a value from 0.0 to 1.0, inclusive.
COLOR is a color name or a hex RGB string that starts with \"#\" and
is followed by an equal number of hex digits for red, green, and blue
components."</span>
  (<span class="keyword cl">unless</span> (hexrgb-rgb-hex-string-p color) (setq color  (hexrgb-color-name-to-hex color)))
  (<span class="keyword elisp">let</span>* ((len     (/ (1- (length color)) 3))
         (max-nb  (float (1- (expt 16 len)))))
    (list (/ (hexrgb-hex-to-int (substring color 1 (1+ len)))             max-nb)
          (/ (hexrgb-hex-to-int (substring color (1+ len) (+ 1 len len))) max-nb)
          (/ (hexrgb-hex-to-int (substring color (+ 1 len len)))          max-nb))))

(<span class="keyword">defun</span> <span class="function">hexrgb-color-name-to-hex</span> (color <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Return the RGB hex string, starting with \"#\", for the COLOR name.
If COLOR is already a string starting with \"#\", then just return it.
Optional arg NB-DIGITS is the number of hex digits per component,
default: 4.
\(This function relies on `<span class="constant important">x-color-values</span>', which generally returns
integers corresponding to 4 hex digits, so you probably do not want to
pass an NB-DIGITS value greater than 4.)
The output string is `#' followed by `<span class="constant important">nb-digits</span>' hex digits for each
color component.  So for the default `<span class="constant important">nb-digits</span>' value of 4, the form
is \"#RRRRGGGGBBBB\"."</span>
  (setq nb-digits  (or nb-digits  4))
  (<span class="keyword elisp">let</span> ((components  (or (x-color-values color)  (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color))))
    (<span class="keyword cl">unless</span> (hexrgb-rgb-hex-string-p color)
      (setq color  (hexrgb-color-values-to-hex components nb-digits))))
  color)

<span class="comment">;; Color <span class="string">"components"</span> would be better in the name than color <span class="string">"value"</span></span>
<span class="comment">;; but this name follows the Emacs tradition (e.g. `<span class="constant important">x-color-values</span>',</span>
<span class="comment">;; `<span class="constant important">ps-color-values</span>', `<span class="constant important">ps-e-x-color-values</span>').</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-color-values-to-hex</span> (components <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Convert list of rgb color COMPONENTS to a hex RBG color string.
Each X in the string is a hexadecimal digit.
Input COMPONENTS is as for the output of `<span class="constant important">x-color-values</span>'.
Optional arg NB-DIGITS is the number of hex digits per component,
default: 4.
The output string is `#' followed by `<span class="constant important">nb-digits</span>' hex digits for each
color component.  So for the default `<span class="constant important">nb-digits</span>' value of 4, the form
is \"#RRRRGGGGBBBB\"."</span>
  <span class="comment">;; 4 is the default because `<span class="constant important">x-color-values</span>' produces appropriate integer values for 4.</span>
  (<span class="keyword cl">unless</span> components (<span class="warning">error</span> <span class="string">"`<span class="constant important">hexrgb-color-values-to-hex</span>': null COMPONENTS argument"</span>))
  (setq nb-digits  (or nb-digits  4))
  (concat <span class="string">"#"</span>
          (hexrgb-int-to-hex (nth 0 components) nb-digits) <span class="comment">; red</span>
          (hexrgb-int-to-hex (nth 1 components) nb-digits) <span class="comment">; green</span>
          (hexrgb-int-to-hex (nth 2 components) nb-digits))) <span class="comment">; blue</span>

(<span class="keyword">defun</span> <span class="function">hexrgb-hex-to-color-values</span> (color)
  <span class="string">"Convert hex COLOR to a list of RGB color components.
COLOR is a hex rgb color string, #XXXXXXXXXXXX
Each X in the string is a hexadecimal digit.  There are 3N X's, N &gt; 0.
The output list is as for `<span class="constant important">x-color-values</span>'."</span>
  (<span class="keyword elisp">let</span>* ((hex-strgp  (string-match
                      <span class="string">"^\\(#\\)?\\(\\([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\)+\\)$"</span>
                      color))
         (ndigits    (/ (<span class="keyword elisp">if</span> (eq (match-beginning 1) (match-end 1))
                            (length color)
                          (1- (length color)))
                        3))
         red green blue)
    (<span class="keyword cl">unless</span> hex-strgp (<span class="warning">error</span> <span class="string">"Invalid RGB color string: %s"</span> color))
    (setq color  (substring color (match-beginning 2) (match-end 2))
          red    (hexrgb-hex-to-int (substring color 0 ndigits))
          green  (hexrgb-hex-to-int (substring color ndigits (* 2 ndigits)))
          blue   (hexrgb-hex-to-int (substring color (* 2 ndigits) (* 3 ndigits))))
    (list red green blue)))

<span class="comment">;; Like `<span class="constant important">doremi-increment-color-component</span>', but for hue only, and with 0-1 range and NB-DIGITS.</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-increment-hue</span> (color increment <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Increase hue component of COLOR by INCREMENT.
INCREMENT ranges from -100 to 100."</span>
  (<span class="keyword cl">unless</span> (string-match <span class="string">"#"</span> color)      <span class="comment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (or (x-color-values color)
                                                 (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color)))))
  <span class="comment">;; Convert RGB to HSV</span>
  (<span class="keyword elisp">let</span>* ((rgb         (or (x-color-values color)  (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color)))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="comment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq hue  (+ hue increment))
    (<span class="keyword cl">when</span> (&gt; hue 1.0) (setq hue  (1- hue)))
    (hexrgb-color-values-to-hex (mapcar (<span class="keyword elisp">lambda</span> (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value))
                                nb-digits)))

<span class="comment">;; Like `<span class="constant important">doremi-increment-color-component</span>', but for saturation only, 0-1 range, and NB-DIGITS.</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-increment-saturation</span> (color increment <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Increase saturation component of COLOR by INCREMENT."</span>
  (<span class="keyword cl">unless</span> (string-match <span class="string">"#"</span> color)      <span class="comment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (or (x-color-values color)
                                                 (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color)))))
  <span class="comment">;; Convert RGB to HSV</span>
  (<span class="keyword elisp">let</span>* ((rgb         (or (x-color-values color)  (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color)))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="comment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq saturation  (+ saturation increment))
    (<span class="keyword cl">when</span> (&gt; saturation 1.0) (setq saturation  (1- saturation)))
    (hexrgb-color-values-to-hex (mapcar (<span class="keyword elisp">lambda</span> (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value))
                                nb-digits)))

<span class="comment">;; Like `<span class="constant important">doremi-increment-color-component</span>', but for value only, 0-1 range, and NB-DIGITS.</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-increment-value</span> (color increment <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Increase value component (brightness) of COLOR by INCREMENT."</span>
  (<span class="keyword cl">unless</span> (string-match <span class="string">"#"</span> color)      <span class="comment">; Convert color name to #hhh...</span>
    (setq color  (hexrgb-color-values-to-hex (or (x-color-values color)
                                                 (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color)))))
  <span class="comment">;; Convert RGB to HSV</span>
  (<span class="keyword elisp">let</span>* ((rgb         (or (x-color-values color)  (<span class="warning">error</span> <span class="string">"No such color: %S"</span> color)))
         (red         (/ (float (nth 0 rgb)) 65535.0)) <span class="comment">; Convert from 0-65535 to 0.0-1.0</span>
         (green       (/ (float (nth 1 rgb)) 65535.0))
         (blue        (/ (float (nth 2 rgb)) 65535.0))
         (hsv         (hexrgb-rgb-to-hsv red green blue))
         (hue         (nth 0 hsv))
         (saturation  (nth 1 hsv))
         (value       (nth 2 hsv)))
    (setq value  (+ value increment))
    (<span class="keyword cl">when</span> (&gt; value 1.0) (setq value  (1- value)))
    (hexrgb-color-values-to-hex (mapcar (<span class="keyword elisp">lambda</span> (x) (floor (* x 65535.0)))
                                        (hexrgb-hsv-to-rgb hue saturation value))
                                nb-digits)))

(<span class="keyword">defun</span> <span class="function">hexrgb-increment-red</span> (hex nb-digits increment <span class="type">&amp;optional</span> wrap-p)
  <span class="string">"Increment red component of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#000ffffff\"."</span>
  (concat <span class="string">"#"</span>
          (hexrgb-increment-hex (substring hex 1 (1+ nb-digits)) nb-digits increment wrap-p)
          (substring hex (1+ nb-digits) (1+ (* nb-digits 2)))
          (substring hex (1+ (* nb-digits 2)))))

(<span class="keyword">defun</span> <span class="function">hexrgb-increment-green</span> (hex nb-digits increment <span class="type">&amp;optional</span> wrap-p)
  <span class="string">"Increment green component of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#fff000fff\"."</span>
  (concat
   <span class="string">"#"</span> (substring hex 1 (1+ nb-digits))
   (hexrgb-increment-hex (substring hex (1+ nb-digits) (1+ (* nb-digits 2)))
                         nb-digits
                         increment
                         wrap-p)
   (substring hex (1+ (* nb-digits 2)))))

(<span class="keyword">defun</span> <span class="function">hexrgb-increment-blue</span> (hex nb-digits increment <span class="type">&amp;optional</span> wrap-p)
  <span class="string">"Increment blue component of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#ffffff000\"."</span>
  (concat <span class="string">"#"</span> (substring hex 1 (1+ (* nb-digits 2)))
          (hexrgb-increment-hex (substring hex (1+ (* nb-digits 2)))
                                nb-digits
                                increment
                                wrap-p)))

(<span class="keyword">defun</span> <span class="function">hexrgb-increment-equal-rgb</span> (hex nb-digits increment <span class="type">&amp;optional</span> wrap-p)
  <span class="string">"Increment each color component (r,g,b) of rgb string HEX by INCREMENT.
String HEX starts with \"#\".  Each color is NB-DIGITS hex digits long.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"#fffffffff\" by 1
  causes it to wrap around to \"#000000000\"."</span>
  (concat
   <span class="string">"#"</span>
   (hexrgb-increment-hex (substring hex 1 (1+ nb-digits)) nb-digits increment wrap-p)
   (hexrgb-increment-hex (substring hex (1+ nb-digits) (1+ (* nb-digits 2)))
                         nb-digits
                         increment
                         wrap-p)
   (hexrgb-increment-hex (substring hex (1+ (* nb-digits 2))) nb-digits increment wrap-p)))

(<span class="keyword">defun</span> <span class="function">hexrgb-increment-hex</span> (hex nb-digits increment <span class="type">&amp;optional</span> wrap-p)
  <span class="string">"Increment hexadecimal-digits string HEX by INCREMENT.
Only the first NB-DIGITS of HEX are used.
If optional arg WRAP-P is non-nil then the result wraps around zero.
  For example, with NB-DIGITS 3, incrementing \"fff\" by 1 causes it
  to wrap around to \"000\"."</span>
  (<span class="keyword elisp">let</span>* ((int      (hexrgb-hex-to-int hex))
         (new-int  (+ increment int)))
    (<span class="keyword elisp">if</span> (or wrap-p
            (and (&gt;= int 0)             <span class="comment">; Not too large for the machine.</span>
                 (&gt;= new-int 0)         <span class="comment">; For the case where increment &lt; 0.</span>
                 (&lt;= (length (format (concat <span class="string">"%X"</span>) new-int)) nb-digits))) <span class="comment">; Not too long.</span>
        (hexrgb-int-to-hex new-int nb-digits) <span class="comment">; Use incremented number.</span>
      hex)))                            <span class="comment">; Don't increment.</span>

(<span class="keyword">defun</span> <span class="function">hexrgb-hex-to-int</span> (hex)
  <span class="string">"Convert HEX string argument to an integer.
The characters of HEX must be hex characters."</span>
  (<span class="keyword elisp">let</span>* ((factor  1)
         (len     (length hex))
         (indx    (1- len))
         (int     0))
    (<span class="keyword elisp">while</span> (&gt;= indx 0)
      (setq int     (+ int (* factor (hexrgb-hex-char-to-integer (aref hex indx))))
            indx    (1- indx)
            factor  (* 16 factor)))
    int))

<span class="comment">;; From `hexl.el'.  This is the same as `<span class="constant important">hexl-hex-char-to-integer</span>' defined there.</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-hex-char-to-integer</span> (character)
  <span class="string">"Take a CHARACTER and return its value as if it were a hex digit."</span>
  (<span class="keyword elisp">if</span> (and (&gt;= character ?0) (&lt;= character ?9))
      (- character ?0)
    (<span class="keyword elisp">let</span> ((ch  (logior character 32)))
      (<span class="keyword elisp">if</span> (and (&gt;= ch ?a) (&lt;= ch ?f))
          (- ch (- ?a 10))
        (<span class="warning">error</span> <span class="string">"Invalid hex digit `<span class="constant important">%c</span>'"</span> ch)))))

<span class="comment">;; Originally, I used the code from `<span class="constant important">int-to-hex-string</span>' in `float.el'.</span>
<span class="comment">;; This version is thanks to Juri Linkov &lt;juri@jurta.org&gt;.</span>
<span class="comment">;;</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-int-to-hex</span> (int <span class="type">&amp;optional</span> nb-digits)
  <span class="string">"Convert integer arg INT to a string of NB-DIGITS hexadecimal digits.
If INT is too large to be represented with NB-DIGITS, then the result
is truncated from the left.  So, for example, INT=256 and NB-DIGITS=2
returns \"00\", since the hex equivalent of 256 decimal is 100, which
is more than 2 digits."</span>
  (setq nb-digits  (or nb-digits 4))
  (substring (format (concat <span class="string">"%0"</span> (int-to-string nb-digits) <span class="string">"X"</span>) int) (- nb-digits)))

<span class="comment">;; Inspired by Elisp Info manual, node <span class="string">"Comparison of Numbers"</span>.</span>
(<span class="keyword">defun</span> <span class="function">hexrgb-approx-equal</span> (x y <span class="type">&amp;optional</span> rfuzz afuzz)
  <span class="string">"Return non-nil if numbers X and Y are approximately equal.
RFUZZ is a relative fuzz factor.  AFUZZ is an absolute fuzz factor.
RFUZZ defaults to 1.0e-8.  AFUZZ defaults to (/ RFUZZ 10).
RFUZZ and AFUZZ are converted to their absolute values.
The algorithm is:
 (&lt; (abs (- X Y)) (+ AFUZZ (* RFUZZ (+ (abs X) (abs Y)))))."</span>
  (setq rfuzz  (or rfuzz 1.0e-8)
        rfuzz  (abs rfuzz)
        afuzz  (or afuzz (/ rfuzz 10))
        afuzz  (abs afuzz))
  (&lt; (abs (- x y)) (+ afuzz (* rfuzz (+ (abs x) (abs y))))))

(<span class="keyword">defun</span> <span class="function">hexrgb-color-value-to-float</span> (n)
  <span class="string">"Return the floating-point equivalent of color-component value N.
N must be an integer between 0 and 65535, or else an error is raised."</span>
  (<span class="keyword cl">unless</span> (and (wholenump n) (&lt;= n 65535))
    (<span class="warning">error</span> <span class="string">"Not a whole number less than 65536"</span>))
  (/ (float n) 65535.0))

(<span class="keyword">defun</span> <span class="function">hexrgb-hex-to-hex</span> (hex nb-digits)
  <span class="string">"Return a hex string of NB-DIGITS digits, rounded from hex string HEX.
Raise an error if HEX represents a number &gt; `<span class="constant important">most-positive-fixnum</span>'
HEX is a hex string, not an RGB string.  It does not start with `#'."</span>
  (<span class="keyword elisp">let</span>* ((len      (length hex))
         (digdiff  (- nb-digits len)))
    (<span class="keyword elisp">cond</span> ((zerop digdiff)
           hex)
          ((natnump digdiff)
           (<span class="keyword elisp">let</span> ((int  (hexrgb-hex-to-int hex)))
             (<span class="keyword cl">unless</span> (natnump int) (<span class="warning">error</span> <span class="string">"HEX number is too large"</span>))
             (format (concat <span class="string">"%0"</span> (int-to-string len) <span class="string">"X"</span> (make-string digdiff ?0)) int)))
          (t
           (<span class="keyword elisp">let</span> ((over  (substring hex digdiff)))
             (setq hex  (substring hex 0 nb-digits))
             (<span class="keyword elisp">if</span> (&gt; (string-to-number over 16)
                    (string-to-number (make-string (- digdiff) ?7) 16))
                 (hexrgb-increment-hex hex nb-digits 1) <span class="comment">; Round up.</span>
               hex))))))

(<span class="keyword">defun</span> <span class="function">hexrgb-rgb-hex-to-rgb-hex</span> (hex nb-digits)
  <span class="string">"Trim or expand hex RGB string HEX to NB-DIGITS digits.
HEX can optionally start with `#'.
In that case, so does the return value."</span>
  (<span class="keyword elisp">let</span>* ((nb-sign-p  (eq ?# (aref hex 0)))
         (hex+       (or (and nb-sign-p  hex)  (concat <span class="string">"#"</span> hex)))
         (red        (hexrgb-red-hex   hex+))
         (green      (hexrgb-green-hex hex+))
         (blue       (hexrgb-blue-hex  hex+)))
    (format <span class="string">"%s%s%s%s"</span>
            (<span class="keyword elisp">if</span> nb-sign-p <span class="string">"#"</span> <span class="string">""</span>)
            (hexrgb-hex-to-hex red   nb-digits)
            (hexrgb-hex-to-hex green nb-digits)
            (hexrgb-hex-to-hex blue  nb-digits))))

(<span class="keyword">defun</span> <span class="function">hexrgb-red-hex</span> (hex)
  <span class="string">"Return the red hex component for RGB string HEX.
HEX can optionally start with `#'.  The return value does not."</span>
  (<span class="keyword elisp">let</span>* ((nb-sign-p  (eq ?# (aref hex 0)))
         (hex-       (or (and nb-sign-p  (substring hex 1))  hex)))
    (substring hex- 0 (/ (length hex-) 3))))

(<span class="keyword">defun</span> <span class="function">hexrgb-green-hex</span> (hex)
  <span class="string">"Return the green hex component for RGB string HEX.
HEX can optionally start with `#'.  The return value does not."</span>
  (<span class="keyword elisp">let</span>* ((nb-sign-p  (eq ?# (aref hex 0)))
         (hex-       (or (and nb-sign-p  (substring hex 1))  hex))
         (len        (/ (length hex-) 3)))
    (substring hex- len (* 2 len))))

(<span class="keyword">defun</span> <span class="function">hexrgb-blue-hex</span> (hex)
  <span class="string">"Return the blue hex component for RGB string HEX.
HEX can optionally start with `#'.  The return value does not."</span>
  (<span class="keyword elisp">let</span>* ((nb-sign-p  (eq ?# (aref hex 0)))
         (hex-       (or (and nb-sign-p  (substring hex 1))  hex))
         (len        (/ (length hex-) 3)))
    (substring hex- (* 2 len))))

(<span class="keyword">defun</span> <span class="function">hexrgb-float-to-color-value</span> (x)
  <span class="string">"Return the color-component value equivalent of floating-point number X.
X must be between 0.0 and 1.0, or else an error is raised."</span>
  (<span class="keyword cl">unless</span> (and (numberp x) (&lt;= 0.0 x) (&lt;= x 1.0))
    (<span class="warning">error</span> <span class="string">"Not a floating-point number between 0.0 and 1.0"</span>))
  (floor (* x 65535.0)))

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(<span class="keyword">provide</span> '<span class="constant">hexrgb</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;; hexrgb.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br />  <a rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=hexrgb.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh" class="translation new">Add Translation</a></span><div class="edit bar"><a href="http://www.emacswiki.org/emacs/Comments_on_hexrgb.el" accesskey="c" class="comment local edit">Talk</a> <a rel="nofollow" href="http://www.emacswiki.org/emacs?action=password" class="password">This page is read-only</a> <a rel="nofollow" class="history" href="http://www.emacswiki.org/emacs?action=history;id=hexrgb.el">View other revisions</a> <a class="admin" href="http://www.emacswiki.org/emacs?action=admin;id=hexrgb.el" rel="nofollow">Administration</a></div><div class="time">Last edited 2015-07-09 01:36 UTC by <a title="24.5.187.146" href="http://www.emacswiki.org/emacs/DrewAdams" class="author">DrewAdams</a> <a href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=hexrgb.el" class="diff" rel="nofollow">(diff)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
