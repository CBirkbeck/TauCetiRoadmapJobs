# Review of QuasiregularMaps (pull request #3034 at 40bc9b0)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 595 changed lines since `de93025`. I checked every changed passage, the nine new Lean declarations (elaborated, signatures compared with the README, degenerate cases computed), the 26 rewritten locators into Martio–Rickman–Väisälä, Heikkilä–Pankka and Prywes at their pages, the new supplier names, and the README against its version on `main`. One finding: §2.10 and the TeichmullerGeometry contract say the weak Wirtinger derivatives equal Tau Ceti's classical ones at every point where `f` is differentiable, but this holds only almost everywhere. The new definitions and theorems are themselves correct. There are four small corrections and two format notes, none blocking, and the human reviewers have to decide whether a `Suggested.lean` may import another roadmap's.

## R01 (P2) — §2.10 and the TeichmullerGeometry contract say the weak Wirtinger derivatives equal Tau Ceti's classical ones at every point of differentiability, but this holds only almost everywhere

**Why it matters.** A weak derivative `Du` is determined only up to a null set. An implementer who states the identification as written gets a false lemma, and the contract misreports what TeichmullerGeometry §7.4 provides.

**How I know.** Take `f = id` on `ℂ`, with weak derivative `Du(z) = id` for `z ≠ 0` and `Du(0) = 0`. This differs from the derivative only on a null set, so it is a weak derivative. Then `f` is differentiable at `0` and `TauCeti.wirtingerDeriv f 0 1 = 1` (definition at `TauCeti/Analysis/Complex/Wirtinger/Basic.lean` line 66, at the pin). But the formula of §2.10 gives `f_z(0) = (Du(0) 1 − i Du(0) i)/2 = 0`. TeichmullerGeometry §7.4 on `main` (its README line 743) has the weak and classical derivatives agree "almost everywhere" at points of differentiability.

The README has the pointwise form in two places:
- §2.10, lines 642–643: "where `f` is differentiable they are Tau Ceti's `TauCeti.wirtingerDeriv f x 1` and `TauCeti.conjWirtingerDeriv f x 1`";
- the TeichmullerGeometry contract, line 1995: "their agreement with the classical ones at points of differentiability".

**Fix.**
- In §2.10, write "at almost every point where `f` is differentiable they are …".
- In the contract, write "their agreement, almost everywhere, with the classical ones at points of differentiability".

## C01 — Martio–Rickman–Väisälä 2.1 is cited at p. 6, but the formal derivative, the Jacobian and `ℓ(T)` are on p. 7

A reader who opens the journal at p. 6 finds only the set notation of 2.1.

In the journal's open copy, each running head carries the printed page number. That number is one ahead of the scan's page index:
- the page with 2.16 is headed 12;
- the page with 2.20 is headed 14;
- the contents put Section 3 at 15, where the scan begins it.

The formal derivative, `J(x, f)` and `ℓ(T)` (MartioRickmanVaisala1969 lines 118–127) are on the page after the one headed "Ann. Acad. Sci. Fenn.", which is printed p. 7. The README's other pages for this source (12, 14–15, 15) already use the printed numbering.

Change "2.1, p. 6" to "2.1, p. 7" at:
- README lines 179, 961, 1083 and 2009;
- `Suggested.lean` lines 78 and 292.

## C02 — The hypothesis `hf` of `isQuasiregular_iff_outerDistortion_le` is not needed

This is `Suggested.lean` line 191, and "for continuous `f ∈ W^{1,n}_loc(M, N)`" in §2.3 (line 426). Both sides of the equivalence are false outside the class:
- `IsQuasiregular` contains `IsSobolevMap`;
- off the class, `outerDistortion` is an infimum over an empty index, which is `⊤`, and `⊤` is not `≤ ENNReal.ofReal K`.

In a scratch copy I derived `IsSobolevMap E E' n f` from `outerDistortion oM oN f ≤ ENNReal.ofReal K` in three tactics. Without `hf` the theorem would state attainment for every map, which is how the next sentence of §2.3 ("`f` is quasiregular iff `K_O(f) < ∞`") reads. Keeping it is harmless.

## C03 — The two manifold definitions do not carry the Haar measure that the Conventions announce for them

The Conventions bullet "Manifolds in Lean" (lines 122–127) says the manifold definitions are stated with a Haar measure `volume` on the model space. The elaborated `IsQuasiregular` and `outerDistortion` keep `[MeasureSpace E]` but drop `[BorelSpace E]` and `[(volume : Measure E).IsAddHaarMeasure]`, because a definition keeps only the section variables its type mentions. Every theorem in the file does carry both.

With the zero measure as `volume`, `TauCeti.HasWeakFDerivOn` and the local `Lᵖ` conditions hold for every function. Then `Df = 0` witnesses `IsQuasiregular 1` for every continuous map, the fold included. No stated result is affected, and this matches the measure-generic style of `TauCeti.HasWeakFDerivOn`. Either:
- add the two binders to the signatures at lines 136 and 159, or
- say in that bullet that the theorems, not the definitions, carry the Haar hypothesis.

## C04 — The docstring's reason for leaving out §6.4, §7.3, §7.6 and §7.7 names carriers that the pins have

`Suggested.lean` lines 50–52 say these statements need "carriers beyond the three above (a triangulation of a manifold with its simplicial maps, a second metric on one manifold, flatness of a metric)". All three exist at the pins:
- flatness: Mathlib's `CovariantDerivative.leviCivitaConnection` with Tau Ceti's `HasConstantSectionalCurvature` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Sectional.lean` line 220);
- triangulations: `TauCeti.IsSmoothTriangulation` (`TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean` line 191);
- a second smooth metric: `TauCeti.WithMetric`.

I stated §7.6 in a scratch copy of the file, with two Tau Ceti curvature modules added to the imports: a compact, connected, flat `N` modelled on `EuclideanSpace ℝ (Fin n)` is `IsQuasiregularlyEllipticWith 1 oN` for every orientation `oN`. It elaborates with only `sorry` warnings.

Which reason is right depends on N01:
- if the import is kept, §7.6 would be stated, and §6.4, §7.3 and §7.7 checked the same way;
- if the import goes, the reason is again the missing Sobolev class, as the file said before.

## N01 — `Suggested.lean` imports another roadmap's module

Line 5 imports `TauCetiRoadmap.SobolevMapsBetweenManifolds.Suggested`. The rule for these files allows only `import Mathlib` and individual `TauCeti.*` modules. As a result, the declarations built on the supplier's names (lines 85–97, 118–195, 229–288 and 375–427) break if that roadmap renames them. The description already puts the question to the maintainers. If they say no, these declarations move to the docstring's "not stated" list.

## N02 — `IsQuasiregular` is also the name of Mathlib's ring-theoretic predicate

Mathlib has a root-level `IsQuasiregular` in `Mathlib/Algebra/Algebra/Spectrum/Quasispectrum.lean` line 186, and Tau Ceti uses it for the Jacobson radical. A search therefore finds the wrong notion, and an implementation outside a namespace would clash with it. A distinct name, for example `IsQuasiregularMap`, would avoid both.

## Verified sound

Unless a row says otherwise, `n` is the dimension and "std" is the standard orientation.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `outerQuotient` (§1.2) | `diag(2,1)`; `R = diag(−1,1)`; `A = 0`, `n = 2`; `n = 0` | `diag(2,1)`: `4/2 = 2`; `R`: `J = −1`, so `⊤`; `0`: `J = 0`, so `0`; `n = 0`: `0⁰/1 = 1`, excluded | Pass | None |
| `IsQuasiregular` (§2.1) | `id : (M,o) → (M,−o)`, `n = 2`; the fold; `diag(2,1)` | `1 ≤ −K` false; fold fails for every `K` on `x₁ < 0`; `diag(2,1)`: `4 ≤ 2K` iff `K ≥ 2` (Hilbert–Schmidt: `5/4`) | Pass; the `|J|` and Hilbert–Schmidt variants are excluded | None |
| `outerDistortion` (§2.2) | constant; fold; discontinuous `f`; `M = ∅` | constant: `max(1, 0) = 1`; fold: ess sup `⊤`; outside the class: empty infimum `⊤`; `∅`: essSup for `0` is `0`, giving `1` | Pass | None |
| `isQuasiregular_iff_outerDistortion_le` (§2.3) | `diag(2,1)` with `K = 2`, `3/2`; a point, `n = 0`, opposite orientations | `4 ≤ 4`, `2 ≤ 2`; `4 ≤ 3` and `2 ≤ 3/2` both false; point: `K_O = 1 ≤ 1` yet `1 ≤ −1` false | Pass; `hf` redundant | C02 |
| `IsQuasiregular.orientedJacobian_le_pow_mul_minimalStretch_pow` (§3.2) | `diag(s,s,1)`, `n = 3`, `K = s`; `n = 1`; `n = 0` | `s³ ≤ s·s²`; `J = s² ≤ s²`, equality; with `K` for `K²`: `s² ≤ s` false; `n = 1`: `J ≤ ℓ`; `n = 0`: `1 ≤ 1` | Pass, sharp | None |
| `IsQuasiregular.of_orientedJacobian_le_mul_minimalStretch_pow` (§3.2) | `diag(s,1,1)`, `K = s`; projection `(x₁,x₂,0)` | `J = s ≤ s`; conclusion `s³ ≤ s²·s`, equality; projection: `J = 0 = ℓ`, not quasiregular, so `hf` needed | Pass | None |
| `IsQuasiregularlyEllipticWith`, `IsQuasiregularlyElliptic` (§7.1) | `N = ℝⁿ` with `f = id`; `n = 0`; constant maps | `‖id‖ = 1 = J`, so 1-elliptic; `ℝ⁰` is a point, no non-constant map, so false; constants excluded by `¬∃ y` | Pass | None |
| `isQuasiregularlyEllipticWith_neg` (§7.2) | `f ∘ R`, `R` a reflection; `n = 0` | `J_(std,−oN)(Df(Rx)∘R) = J_(std,oN)(Df(Rx))·(−det R) = J_f(Rx)`; `‖Df∘R‖ = ‖Df‖`; `n = 0`: both sides false | Pass | None |
| §1.5 coefficients `a`, `b` | `A z = z + z̄/2` | `A1 = 3/2`, `Ai = i/2`; `(A1 − i·Ai)/2 = 1 = a`; `(A1 + i·Ai)/2 = 1/2 = b` | Pass | None |
| §2.10 identification with `TauCeti.wirtingerDeriv` | `f = id` on `ℂ`; `Du = id` off `0`, `Du(0) = 0` | `wirtingerDeriv id 0 1 = 1`; formula gives `f_z(0) = 0`; equal only off a null set | Fails pointwise | R01 |
| Summary and §7.3: any two continuous metrics on closed `N` | compact `N`; `ℝ²` with `e^{2x}dy²` | compact: `|w|'/|w|` on the unit-sphere bundle has min `α > 0`, max `β`; factor `(β/α)ⁿ`; `ℝ²`: ratio unbounded | Pass | None |
| Conventions: dimension, `n ≠ 0` | a point with opposite orientations | as in the §2.3 row | Pass | None |
| §2.6 Cantor Check and its *Needs:* line | `(c(x₁), 0)` on `[0,1]²` | `W^{1,1}_loc` and §5.2 give ACL, so `c` AC on `[0,1]`, contradicting `CantorFunction.lean:245`; §5.1–§5.2 need no Layer 2 | Pass | None |
| §2.2 bullet on isometries and composition (§4.3–§4.4) | `θ` an orientation-preserving isometry | `K_O(θ) = 1`, so `K_O(f∘θ) ≤ K_O(f)`, and `θ⁻¹` gives the reverse; same for `g ∘ f` | Pass | None |
| Sample §1.2 | MRV (2.21)–(2.22), lines 411 and 415, p. 14 | outer and inner dilatation as stated | Pass | None |
| Sample §1.4 | MRV (2.23), lines 426–430, p. 14; (2.24), line 435, p. 15 | `n^{n/2}` normalisation; `q_S ≤ q_O ≤ n^{n/2} q_S`, best possible | Pass | None |
| Sample §2.5 | Rickman1993 Ch. I | shear: `J = 1`, `‖Df‖ ~ x²` unbounded; source uncertified | Math pass | None |
| Sample §2.7 | Rickman1993 Ch. I | `(x³,y)`: `q_O = max(3x²,1)²/(3x²) → ∞` as `x → 0`; source uncertified | Math pass | None |
| Sample §2.8 | HP Lemma B.2, p. 23, lines 1255–1260 | closed `M`, piecewise smooth `ρ ∈ W^{1,∞}` | Pass | None |
| Sample §2.10 | MRV 2.20, lines 420–422, p. 14 | sense-preserving: `K`-qc iff `K`-qr homeomorphism | Locator pass | R01 |
| Sample §3.1 | MRV 2.20, lines 413–419, p. 14 | `K(f) = max`; `K`-qr iff `K(f) ≤ K`; `∞` off the class | Pass | None |
| Sample §3.2 | MRV (2.25), line 438; "best possible", line 439; p. 15 | `K_O ≤ K_I^{n−1}`, `K_I ≤ K_O^{n−1}` | Pass | None |
| Sample §3.3 | MRV 2.20, lines 423–425, p. 14 | projection satisfies (2.22) with `K = 1`, `J = ℓ = 0`, not qr | Pass | None |
| Sample §3.4 | MRV (2.24), line 435, p. 15 | as stated | Pass | None |
| Sample §4.4 | Rickman1993 Ch. I | radial `a = 2` after `a = 1/2` is `id`, `1 ≤ 4·2`; source uncertified | Math pass | None |
| Sample §6.1 | HP App. B, p. 23, lines 1236–1245 | extension of `κ∘A` to a neighbourhood of the simplex | Pass | None |
| Sample §6.3 | HP Lemma B.2, pp. 23–24, lines 1255–1316 | Stokes proof for closed `M` | Pass | None |
| Sample §7.1 | HP p. 1, lines 20–21; p. 6, lines 271–273; Prywes p. 1, lines 26–27 | definitions as stated | Pass | None |
| Sample §7.4 | HP §1.1, p. 2, lines 85–91 | PL branched cover `T⁴ → N` after `ℝ⁴ → T⁴` | Pass | None |
| MRV 2.1 page | scan page index against running heads | lines 118–127 lie on printed p. 7 | Fail | C01 |
| §7.6 statability | scratch statement | elaborates with Mathlib `leviCivitaConnection` and Tau Ceti `HasConstantSectionalCurvature`; ten `sorry` warnings only | Docstring reason inaccurate | C04 |
| Binders of the two manifold definitions | `volume := 0` on `E` | weak-derivative and `Lᵖ` conditions trivial; `Df = 0` gives `0 ≤ K·0`, so every continuous `f` qualifies | Definitions too general | C03 |

Counts:

- **Source locators checked against the text.** 26 distinct locators that the change rewrites:
  - 10 into MartioRickmanVaisala1969: 2.1, 2.16, 2.20, (2.21)–(2.25), p. 15, Lemma 2.26;
  - 12 into HeikkilaPankka2025: §1 pp. 1–2, (1.1), §1.1, §2 p. 6, Appendix B pp. 23–24, Proposition B.1 and its proof, Lemma B.2, Theorem 1.1, Corollary 1.2;
  - 4 into Prywes2019: §1 pp. 1–2, Theorem 1.1, Corollary 1.2.

  One is off by a page (C01). No "line N" locator is left in the README or the Lean file.
- **Library declarations opened at the pins.**
  - Mathlib: `riemannianMetricVectorSpace` and the flat-metric instance (`Geometry/Manifold/Riemannian/Basic.lean` 102, 126); `ContMDiffRiemannianMetric.toContinuousRiemannianMetric` (`Geometry/Manifold/VectorBundle/Riemannian.lean` 255); the continuity instance (`Topology/VectorBundle/Riemannian.lean` 497); `IsQuasiregular` (`Quasispectrum.lean` 186).
  - Tau Ceti: `wirtingerDeriv` and `conjWirtingerDeriv` (`Wirtinger/Basic.lean` 66, 80); `HasWeakFDerivOn` and `HasWeakLineDerivOn` (`WeakDeriv/Basic.lean`); `not_absolutelyContinuousOnInterval_cantorFunction` (245); `IsSmoothTriangulation` (191); `HasConstantSectionalCurvature` (220); `WithMetric` (68).
  - Tau Ceti `2fd255d` has no `Wirtinger/Weak.lean` and no `Beltrami/`.
- **Cross-roadmap citations resolved on `main` (28e2a1d).**
  - SobolevMapsBetweenManifolds §1.2, §3.1, §3.3, §4.2–§4.6, §5.1–§5.3, §6.1–§6.3 and §7.1, and the 17 Lean names in its contract (its `Suggested.lean`, lines 66–422; the definitions have real bodies, no sorry'd data).
  - Its scope places Sobolev spaces of differential forms outside the roadmap; SobolevDifferentialForms is Euclidean.
  - TeichmullerGeometry §7.4 (README 741–743).
  - RiemannianGeometry R4 item 7 and `killingHopf_euclidean` (`Suggested.lean` 402).
  - No open pull request changes this roadmap or drops a cited id.
- **Automatic checks.**
  - Gate on this head: every count `0` except the import rule (N01).
  - Dependency check: `depcheck: 127 roadmaps, 1405 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. All suppliers are on `main`.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives nine `declaration uses sorry` warnings (lines 181, 204, 220, 243, 267, 335, 352, 366, 419) and nothing else. I compared `#check @` of all 19 declarations with the README: every theorem keeps its binders, and only the two manifold definitions lose the Borel and Haar instances (C03).
- **Scratch probes.**
  - There is no automatic `IsContinuousRiemannianBundle` for flat `ℝ²`, so the description's claim holds.
  - A tangent space has no norm without a Riemannian bundle, so `‖Df x‖` is the metric's operator norm.
  - `hf` is derivable (C02).
  - §7.6 elaborates (C04).
- **Record.** The README at `de93025` and at the head have the same seven layers with the same ids and titles, and no item is removed. `Suggested.lean` adds nine declarations and removes none. The previous AI review, of the original pull request, had no finding to repair.
- **Padding.** No theorem closes by one tactic or restates a definition. Each needs the supplier's uniqueness of weak differentials or the pointwise singular-value argument with essential suprema.

Overlap check: read SobolevMapsBetweenManifolds, TeichmullerGeometry and DifferentialGeometry (main), and DifferentialGeometry (open revision), GeometricMeasureTheory, ComplexManifolds, PlanarTopology and TangentialBordism (open). The owners of the shared objects are:
- the Sobolev class, weak differential and oriented Jacobian belong to SobolevMapsBetweenManifolds; this roadmap imports them and does not declare them again;
- weak Wirtinger derivatives and planar quasiconformal maps belong to TeichmullerGeometry §7.4, which this roadmap cites as owner;
- quasiregular maps and distortion belong to this roadmap, and SobolevMapsBetweenManifolds cedes them.

Nothing else is shared.

Source independence: changed passages only. I compared 12 passages with 3 sources (MartioRickmanVaisala1969, HeikkilaPankka2025, Prywes2019); nothing is shared beyond formulas and standard terms, and the longest shared run is 3 words. The largest share of source mentions is MartioRickmanVaisala1969, with 26 of 86. Contents were not compared, since no layer is added, removed or reordered.

Research link: Layers 2 and 7 formalise the definitions under which Prywes (2019) bounds the de Rham cohomology of closed quasiregularly elliptic manifolds, answering Gromov (1981), and Heikkilä–Pankka (2025) embed their de Rham algebra in `⋀*ℝⁿ`. §7.6–§7.7 are their torus examples. This rests on the README's Summary and Downstream consumers, and on HeikkilaPankka2025 §1 and Prywes2019 §1, which I read.

## Not verifiable

- Rickman1993, Vaisala1971, Ahlfors2006, Lee2012, Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981 and Gromov1999 are settled as uncertified and cited by locator only. This revision changes none of their locators.

## Source issues

- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24: the source composes the Nash embedding with the piecewise linear map in the wrong order; it should be `ι ∘ p : M → ℝᵐ`; affects the proof.
- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24: the minimum of `det Dϕ` in the distortion bound drops the simplex index; it should be the minimum over `κ(σᵢ)` of `det Dϕᵢ`; affects the proof.

## For the human reviewers

- **Policy.** Line 5 of `TauCetiRoadmap/QuasiregularMaps/Suggested.lean` imports another roadmap's `Suggested.lean`, and the description asks the maintainers whether that is allowed. At `main` 28e2a1d, 14 `Suggested.lean` files under `TauCetiRoadmap/` and 7 under `Completed/` import another roadmap's module.
- **Board record.** `packages/QuasiregularMaps/design/plan.json` still lists the gap `orientation-descent` with supplier DifferentialGeometry. README §7.5 owns that object, so the entry is obsolete.
