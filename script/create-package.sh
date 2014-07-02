#!/bin/bash

rootdir=$(dirname $0)/..
tmpdir=`mktemp -d -t nupkg`
# echo $tmpdir
packageid="$1"

cp $rootdir/templates/README.txt "$tmpdir"
$rootdir/script/expand-template.rb "$rootdir/templates/package.nuspec.erb" $packageid > "$tmpdir/$packageid.nuspec"

mkdir -p "$tmpdir/build"
$rootdir/script/expand-template.rb "$rootdir/templates/package.props.erb" $packageid > "$tmpdir/build/$packageid.props"

mkdir -p "$rootdir/target"
mono "$rootdir/script/NuGet.exe" pack "$tmpdir/$packageid.nuspec" -BasePath "$tmpdir"
mv *.nupkg "$rootdir/target"

rm -rf $tmpdir
