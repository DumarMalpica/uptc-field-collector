import 'package:isar/isar.dart';
import '../../domain/entities/plot.dart';

part 'plot_model.g.dart';

@embedded
class PlotModel {
  bool hasPlot = false;
  double? height;
  double? width;

  Plot toDomain() => Plot(
        hasPlot: hasPlot,
        height: height,
        width: width,
      );

  static PlotModel fromDomain(Plot p) => PlotModel()
    ..hasPlot = p.hasPlot
    ..height = p.height
    ..width = p.width;
}
