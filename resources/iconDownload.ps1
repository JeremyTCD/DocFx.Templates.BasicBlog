# Simple script for downloading material design icons

$materialIcons = @(
	@{name="arrow_upward"; style="baseline"},
	@{name="arrow_drop_down"; style="baseline"},
	@{name="file_copy"; style="baseline"},
	@{name="link"; style="baseline"},
	@{name="info"; style="baseline"},
	@{name="warning"; style="baseline"},
	@{name="navigate_next"; style="baseline"},
	@{name="navigate_before"; style="baseline"},
	@{name="date_range"; style="sharp"},
	@{name="person"; style="baseline"},
	@{name="filter_list"; style="baseline"},
	@{name="clear"; style="baseline"},
	@{name="search"; style="baseline"},
	@{name="share"; style="baseline"},
	@{name="edit"; style="baseline"},
	@{name="chevron_right"; style="baseline"},
	@{name="copyright"; style="baseline"}
)

$materialUrlFormat = "https://material.io/tools/icons/static/icons/{0}-{1}-24px.svg"
$outfileFormat = "material-design-{0}.svg"
$requireFormat = "require('../../resources/{0}')"

$requires = ""

foreach($materialIcon in $materialIcons){
	$normalizedMaterialIconName = $materialIcon.name.replace('_', '-')
	$outfile = $outfileFormat -f $normalizedMaterialIconName
	$url = $materialUrlFormat -f $materialIcon.style, $materialIcon.name

	"Downloading: " + $materialIcon.name + " From: " + $url + " To: " + $outfile

	Invoke-WebRequest $url -outfile $outfile

	$requires = $requires + "`n" + ($requireFormat -f $outfile)
}

$requires