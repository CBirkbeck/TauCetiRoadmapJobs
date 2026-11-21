# Review of ProjectionsSlicesAndKakeya (pull request #2943 at d4f5286)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on degenerate and boundary instances (empty set, a point, a segment, the disk, `α ≤ 0`, `α ≥ 1`, `C = 0`, unbounded sets), every locator of the sample was read in Bishop–Peres and in Hochman, and nothing false, vacuous or unowned was found; the explicit constants (`C_α`, the disk energy `π/2`, `13 · 2^(−n)`, `1/(8 log(1/ε))`) all check. There is one small correction (the Sierpiński-triangle example of Layer 4 does not say which triangle) and one format note, neither blocking. One point is left for the human reviewers: the numbering cited is that of a 2015 draft and of lecture notes, both on their authors' pages.

## C01 — The example of Layer 4 holds for the gasket with a vertical edge, not for "the Sierpiński triangle of FractalGeometry 5.2" in general

In the Examples of Layer 4 (README line 445) the sentence "For the Sierpiński triangle `G` of FractalGeometry 5.2, almost every vertical slice has dimension `1/2`" names a set that FractalGeometry 5.2 does not fix: its statement is for any three affinely independent points, and the dimension of a typical vertical slice depends on how the triangle sits. The source's gasket (Bishop and Peres, Example 1.3.4, used in Example 1.6.4) is the set of `(x, y)` whose binary digits satisfy `xₙ yₙ = 0`, the triangle with vertices `(0,0)`, `(1,0)`, `(0,1)`; there the slice over `x` has free digits exactly where `xₙ = 0`, which gives `1/2`. For the triangle with a horizontal base and the apex above its midpoint (the usual picture), a vertical line is parallel to a median, not an edge: in the coordinates above it is a line `y − x = c`, the points of the slice correspond to the expansions of `c` in base 2 with digits `−1, 0, 1`, and the number of level-`n` pieces met is a product of the matrices `[[1,1],[0,1]]` and `[[1,0],[1,1]]` along the binary digits of `c`. Its growth exponent for almost every `c` is `≈ 0.3961/log 2 ≈ 0.5715` (2·10⁶ random factors), not `1/2`.

The smallest change: "For the Sierpiński triangle with vertices `(0,0)`, `(1,0)`, `(0,1)` (FractalGeometry 5.2 with these points), …".

## N01 — Two Checks report a machine run rather than a fact a reader can recompute

The second Check of 5.1 ("for a grid of `54 × 98` values … truncated at `m = 40`") and the first Check of 5.2 ("for every `n` from `2` to `3000`") describe computations that were run. The exact areas `6.1875`, `3.0146…`, `1.5002…` and the values at `n = 2` and `n = 10` already do the work; the grid and the range could be dropped, or replaced by one explicit point.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 `capacity` | `∅`; a point, `s > 0`, `s = 0`, `s < 0`; `[0,1]`, `s = 1/2` | `∅`: empty sup `0`. Point: energy `∞ → 0`; `1 → 1`; `0 → ∞`. `[0,1]`: `2/((1−s)(2−s)) = 8/3`, capacity `≥ 3/8` | agrees with Checks |
| 1.1 reduction to compact sets | normalised restriction to `K'` | energy `≤ E_s(μ)/μ(K')²`, kernel `≥ 0` for every real `s` | holds for all `s` |
| 1.2 `dimH_eq_iSup_capacity` | `∅`; point; `[0,1]`; `s ≤ 0` terms; shell sum | `0 = 0`; `0`; sup `1` not attained (`μH[1] = 1`); `ofReal s = 0`; `Σ 2^((k+1)t−ks) = 2^t/(1−2^(t−s))`, normalised energy `≤ 1 + 2^t/(m(1−2^(t−s)))` | true; route sound |
| 2.1 `proj` | `θ = 0, π/2`; `θ + π` | `x 0`, `x 1`; `−proj θ`; `|proj θ x| ≤ ‖x‖` | 1-Lipschitz |
| 2.2 averaging identity | `α = 0`; `α < 0`; `α ≥ 1`, `μ ≠ 0`; `μ = 0`; unit mass, `0 < α < 1`; infinite `μ` | `π μ(univ)²` both sides; diagonal `0` both; `∞ = ∞·(>0)`; `0 = ∞·0`; `∞ = C_α·∞`; `∞ = ∞` | true in all cases |
| `C_α` | `α = 0, −1, 1/2, 1/4`; `α → 1` | `π`; `2`; `1.7725·3.6256/1.2254 = 5.2441`; `1.7725·2.3704/1.0896 = 3.856`; `(1−α)C_α → 2` | Checks correct |
| 2.3 `ae_capacity_proj_ne_zero` | `α ≤ 0`; `α = 1` on the disk; segment, `θ = π/2` | nonempty image: capacity `1` or `∞`; disk capacity `≥ 2/π`, image `[−1,1]` capacity `0`; point capacity `0` | true; `α < 1` needed |
| 2.4 `ae_dimH_proj_eq` | `∅`; `dimH K = 0`; `C × C`; segment | `0 = 0`; `0 = 0`; `min(1.2619, 1) = 1`; length `|cos θ|`, dim `1` off `π/2` | true |
| 3.1 Mattila's inequality | point; segment; disk with density `1/(2π√(1−r²))`; area measure; whole plane | `∞ ≤ ∞`; `∫1/|cos| = ∞ ≤ ∞`; `π/2 = π/2` (potential at centre `∫₀¹ dr/√(1−r²) = π/2`); `π/2 < 16/(3π) = 1.698`; `0 ≤ E` | true, sharp |
| 3.1 direction count | `δ ≤ r` | `2 arcsin(δ/r) ≤ πδ/r`, quotient by `2δ` tends to `1/r`, dominated by `π/(2r)` | route sound |
| 3.2, 3.3 | segment; four-corner set; kernel comparison | capacity `0`, lengths `|cos θ|`; dim `log 4/log 4 = 1`; `|x−y|⁻¹ ≤ D^(s−1)|x−y|^(−s)`, `D ≥ 1` | true; `> 1` needed |
| 3.4 Favard bound | disk; segment; unbounded `A` with capacity `∞` | `π²·(2/π) = 2π = ∫₀^π 2`; `0 ≤ 2`; right side `≥ π²/E → ∞` | true, sharp |
| 4.1 slicing | `C = 0`; `α = 0`; `r ≤ 0` in Lean; `[0,1] × C`; `C × [0,1]` with Cantor measure; `{0} × [0,1]`; `dimH F < α` | `μ = 0`; monotonicity; bound `C·0^α`; `0.6309 = 1.6309 − 1`; ball bound `2^(1+s) r^s ≈ 3.10 r^s ≤ 4 r^s`, `1 = 1`; fails only at `x = 0`; projection `μ`-null | true |
| 4 Examples (gasket) | vertices `(0,0),(1,0),(0,1)`; base horizontal, apex above midpoint | `1/2`; count exponent `≈ 0.5715` | C01 |
| 5.1 Besicovitch set | `a_k`, `k ≤ 16`; steps; cover areas `n = 1,2,3` | `0,0,1,1/2,0,1/4,1/2,3/4,1,7/8,…,1/8,0`; `|a₃−a₄| = 1/2`, `|a₇−a₈| = 1/4`, `|a₁₅−a₁₆| = 1/8`; `6.1875`, `3.01465`, `1.50024` `≤ 13·2^(−n)` | true |
| 5.2 Minkowski bound | `n = 2`; `n = 10`; constant | `T₂ = 1`, `1 + 4·1/2 = 3 ≤ 5.545`; `T₁₀ = 15.450 ≤ 22.83`, bound `0.0543`; `5 − 4 log 2 = 2.227 ≤ 2.773 = 4 log 2`; even `n`: `n H_(n/2−1) + 1 ≤ n H_(n/2)` | true |
| 5.3 `one_add_dimH_le_dimH` | `E` one vector; `E = ∅`, `K = ∅`; `e = 0` (excluded by the sphere); sharpness set | `1 ≤ 1`; `1 ≤ 0` false, hence nonempty; point `K` would give `1 ≤ 0`; `dimH D + 1` both sides | true; hypotheses needed |
| 5.4 `dimH_eq_two` | closed disk; circle as `E` | `2 = 2`; `dimH E ≥ 1`, `1 + 1 ≤ dimH K ≤ 2` | true |

- Source locators checked against the text: 16 in Bishop–Peres (Theorem 1.6.1, Example 1.6.4, Theorem 3.3.1, Definition 3.4.1, Theorem 3.4.2, Theorem 3.5.1, Corollary 3.5.2, Theorems 3.5.3–3.5.4, Lemmas 3.5.5–3.5.6, Theorem 9.1.1, Lemma 9.1.2, Theorems 9.1.3–9.1.4, Theorem 9.5.3, with their printed pages) and 8 in Hochman (Theorems 7.2, 7.6, 7.7, 8.1, Corollary 8.2, Definition 8.7, Theorems 8.8, 8.9); all agree with the README, including each place where it says its statement is wider than the source's.
- Library declarations opened at the pins: 31 Mathlib names of the supplier contracts elaborated with `#check` (no error); `LipschitzOnWith.lintegral_hausdorffMeasure_inter_preimage_le` and `LipschitzOnWith.ae_hausdorffMeasure_inter_preimage_eq_zero` read in `TauCeti/MeasureTheory/Function/Coarea/Eilenberg.lean` lines 195 and 203 (Haar measure only, so 4.1 is not there). No capacity of sets, projection theorem, Besicovitch or Kakeya set in either library.
- Cross-roadmap citations resolved: FractalGeometry §3.2 `exists_frostman_measure`, §3.3 `hausdorffMeasure_eq_top_of_energy_ne_top` (same integral `∫⁻ x, ∫⁻ y, edist x y ^ (-s) ∂μ ∂μ`), §5.1–§5.5, at the head of its open pull request; that roadmap lists projection and slicing theorems as outside its scope.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one supplier roadmap, FractalGeometry, is an open pull request adding a new roadmap.
- Elaboration of `Suggested.lean`: 13 `sorry` warnings, nothing else. Signatures compared with the README statements one by one: same generality, no lost binder. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`): none of the 13 theorems closes.
- Headline theorems of the summary (Kaufman and Marstrand below and above dimension one, Mattila's bound, slicing, Besicovitch's set, the Minkowski bound, Davies): all stated in `Suggested.lean`; no padding.
- Pull request text read against the head: no sentence contradicted.

Overlap check: read FractalGeometry, DimensionOfMeasuresAndDigitSets, GeometricMeasureTheory, Isoperimetry, Varifolds; nothing shared (Frostman's lemma and the energy criterion are FractalGeometry's and are cited; the slicing theorem of Isoperimetry is for sets of finite perimeter, a different statement).

Source independence: 15 passages compared with 2 sources, none shared; largest share BishopPeres, 16 of 22 locators in the layers; contents compared with BishopPeres: independent (Layer 1 ↔ §3.4, Layers 2 and 3 split §3.5, Layer 4 ↔ §3.3 with §1.6, Layer 5 ↔ §9.1: not one to one and not in the source's order; Layer 5 after Layers 2 and 4 is forced by the *Needs* line of 5.3).

Research link: The targets are the theorems of Marstrand (1954), Kaufman (1968), Mattila (1990), Besicovitch (1919, 1928), Davies (1971) and Córdoba (1993), as BishopPeres §3.5 and §9.1 attribute them; they are the planar case of the Kakeya problem, whose higher-dimensional bounds (Wolff 1994, Katz–Tao 1999) Hochman §8.2 cites. Rests on the two sources read.

## Not verifiable

- The claim of the second Check of 5.1 about a `54 × 98` grid, and of the first Check of 5.2 for all `n ≤ 3000`: not rerun in full; the inequalities they illustrate were proved by hand above.
- That the Hausdorff dimension of the slice in C01 equals the count exponent `0.5715`: only the growth of the number of pieces was computed.

## Source issues

- **Misprint** in Hochman at Theorem 8.9, p. 77: the source says a Kakeya set in the plane has Hausdorff dimension 1; it should be 2, as its own proof on p. 79 concludes; affects a stated result.
- **Misprint** in Hochman at Lemma 7.1, p. 60: the source says the image has dimension at most "dim" of the two dimensions; it should be their minimum; affects nothing.
- **Gap** in BishopPeres at Theorem 9.1.3, last display of the proof, p. 267: the source says the area is at least 4 over 4 log n; it should be the square of the integral of Ψ over that integral plus the pairwise sum, a smaller quantity; affects the proof.

## For the human reviewers

- **Scope / licence.** Both sources are read on their authors' pages: a draft of 1 December 2015 of Bishop and Peres' book and Hochman's lecture notes of 27 June 2012 (README lines 713–724). The README cites the draft's numbering; the published book's numbering was not compared.
