import 'package:nutrinowapp/constants/dimensions.dart';

double goldenRatioSmall(double sum) {
  return sum - goldenRatioLarge(sum);
}

double goldenRatioLarge(double sum) {
  return sum / goldenRatio;
}

double goldenRatioSumFromLarge(double large) {
  return goldenRatio * large;
}

double goldenRatioSumFromSmall(double small) {
  return small + (small * goldenRatio);
}

double idealSize(double current, double min, double max) {
  if (current > max) return max;
  if (current < min) return min;
  return current;
}
