<?php

function createRootNode() {
	if (false && ENVIRONMENT != 'development') {
		return new SimpleXMLElement("<?xml version=\"1.0\"?><root></root>");
	} else  {
		$t = new SimpleXMLElement("<?xml version=\"1.0\"?><root></root>");
		$t->addChild("livereloader", file_get_contents("development/livereload.js"));
		return $t;
	}
}

//FULFILL XML OBJECT WITH KEY-VALUE CHILDRENS
function Fulfill($xml, $object) {
	foreach ($object as $key=>$value) {
		$xml->addChild($key, $value);

	}
}


//FULFILL XML OBJECT WITH EACH ARRAY ITEM
function FulfillEach($xml, $iterator) {
	while( $row = $iterator->fetch_assoc()) {
		$i = $xml->addChild('entry');
		Fulfill($i, $row);
	}
}

class MarkDownParser {
	public static $rules = array (
		'/\{([^\[]+)\}\(([^\)]+)\)/' => '<img src=\'\2\' alt=\'\1\' />',
		'/(#+)(.*)/' => 'self::header',                           // headers
		'/\[([^\[]+)\]\(([^\)]+)\)/' => '<a href=\'\2\'>\1</a>',  // links
		'/(\*\*|__)(.*?)\1/' => '<strong>\2</strong>',            // bold
		'/(\*|_)(.*?)\1/' => '<em>\2</em>',                       // emphasis
		'/\~\~(.*?)\~\~/' => '<del>\1</del>',                     // del
		'/\:\"(.*?)\"\:/' => '<q>\1</q>',                         // quote
		'/`(.*?)`/' => '<code>\1</code>',                         // inline code
		'/\n\*(.*)/' => 'self::ul_list',                          // ul lists
		'/\n[0-9]+\.(.*)/' => 'self::ol_list',                    // ol lists
		'/\n(&gt;|\>)(.*)/' => 'self::blockquote ',               // blockquotes
		'/\n-{5,}/' => "\n<hr />",                                // horizontal rule
		'/\n([^\n]+)\n/' => 'self::para',                         // add paragraphs
		'/<\/ul>\s?<ul>/' => '',                                  // fix extra ul
		'/<\/ol>\s?<ol>/' => '',                                  // fix extra ol
		'/<\/blockquote><blockquote>/' => "\n"                    // fix extra blockquote
	);
	private static function para ($regs) {
		$line = $regs[1];
		$trimmed = trim ($line);
		if (preg_match ('/^<\/?(ul|ol|li|h|p|bl)/', $trimmed)) {
			return "\n" . $line . "\n";
		}
		return sprintf ("\n<p>%s</p>\n", $trimmed);
	}
	private static function ul_list ($regs) {
		$item = $regs[1];
		return sprintf ("\n<ul>\n\t<li>%s</li>\n</ul>", trim ($item));
	}
	private static function ol_list ($regs) {
		$item = $regs[1];
		return sprintf ("\n<ol>\n\t<li>%s</li>\n</ol>", trim ($item));
	}
	private static function blockquote ($regs) {
		$item = $regs[2];
		return sprintf ("\n<blockquote>%s</blockquote>", trim ($item));
	}
	private static function header ($regs) {
		list ($tmp, $chars, $header) = $regs;
		$level = strlen ($chars);
		if ($level < 4)
			return sprintf ('<h%d>%s</h%d>', $level+1, trim ($header), $level+1);
		else return "";
	}
	/**
	 * Add a rule.
	 */
	public static function add_rule ($regex, $replacement) {
		self::$rules[$regex] = $replacement;
	}
	/**
	 * Render some Markdown into HTML.
	 */
	public static function render ($text) {
		$text = "\n" . $text . "\n";
		foreach (self::$rules as $regex => $replacement) {
			if (is_callable ( $replacement)) {
				$text = preg_replace_callback ($regex, $replacement, $text);
			} else {
				$text = preg_replace ($regex, $replacement, $text);
			}
		}
		return trim ($text);
	}
}

?>