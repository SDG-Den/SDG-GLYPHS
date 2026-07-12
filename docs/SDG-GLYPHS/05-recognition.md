# Recognition Pipeline

```
Ink stroke → RDP simplification → 32-point uniform resample →
scale to unit square → centre at origin → flip Y →
12 rotations × 32 cyclic shifts → DTW-style pointwise distance →
minimum across all templates → threshold check (≤ 0.12) → glyph match or `?`.
```

## Stages

### RDP simplification
Ramer-Douglas-Peucker with `epsilon = 0.8%` of the larger screen dimension.
Reduces input points while preserving stroke shape.

### 32-point resample
Uniform arc-length parameterisation to exactly 32 points, ensuring consistent
comparison regardless of drawing speed.

### Normalisation
Scale so the larger axis fits in [0, 1], then centre the centroid at the
origin.

### Y-flip
Screen coordinates have Y increasing downward; templates are stored with Y
increasing upward (mathematical convention).

### Rotation invariance
12 equispaced rotations at 15° steps (0°, 15°, 30°, ..., 165°).  This ensures
glyphs are recognised regardless of orientation.

### Cyclic shift invariance
For each rotation, the starting point is shifted through all 32 positions,
covering every possible starting point for the stroke.

### DTW matching
Dynamic Time Warping pointwise distance is computed across all template
variants.  The minimum distance across all rotations, shifts, and templates is
used.

### Threshold
Distance ≤ 0.12 is considered a match (lower = better).  Above this, the
stroke is shown as unrecognised (`?`).
