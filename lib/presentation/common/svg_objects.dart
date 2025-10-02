import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmu_malafeev_pi31/data/resources.g.dart';
import 'package:flutter_svg/flutter_svg.dart';


abstract class SvgObjects{
  static void init(){
    final pics = <String>[
      R.ASSETS_SVG_RU_SVG,
      R.ASSETS_SVG_US_SVG,
    ];
    for(final String p in pics){
      final loader = SvgAssetLoader(p);
      svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}

class SvgRu extends StatelessWidget {
  const SvgRu ({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.ASSETS_SVG_RU_SVG);
  }
}
class SvgUs extends StatelessWidget {
  const SvgUs ({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(R.ASSETS_SVG_US_SVG);
  }
}