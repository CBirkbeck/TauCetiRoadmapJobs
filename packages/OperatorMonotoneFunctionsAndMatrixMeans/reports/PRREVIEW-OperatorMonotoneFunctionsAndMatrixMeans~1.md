# Review of OperatorMonotoneFunctionsAndMatrixMeans (pull request #2496 at 0cd92f4)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. The proof route of the exponential metric increasing property in 7.1 bounds the length of the wrong curve, so it does not give the inequality, and 7.1 and 7.2 each use the other. And Layer 7 states the distance formula, completeness and the geodesic midpoint on the positive definite cone, which the open roadmap ManifoldOptimization also states, with no line dividing ownership. Every stated theorem I could test is true as stated: the file elaborates, all README Checks recompute, and no counterexample was found. There are six small corrections and three format notes, none blocking. None of the seven cited books could be read legally, so the locators and the wording are left to the human reviewers.

## R01 (P2) — The route for the exponential metric increasing property in 7.1 does not prove it, and 7.1 and 7.2 need each other

The property `‖log A − log B‖_F ≤ δ(A, B)` carries no source locator ("an adaptation"), so the proof route is its only support, and 7.3 and 7.4 rest on it. The route (7.1, lines 905–910) proves the pointwise bound, that the invariant speed of `exp(η)` dominates `‖η'‖_F`, and then applies it to the curve `s ↦ exp(log A + s(log B − log A))`, concluding that "7.2 bounds it by `δ`". The pointwise bound gives `length ≥ ‖log B − log A‖_F` for that curve, and 7.2 gives `length ≥ δ(A, B)` for every curve. Two lower bounds on the same length compare nothing. The opening step "congruence-reduce to `A = 1`" is also unavailable for the global inequality, whose left side is not congruence invariant (at `A = 1` it is an equality).

The statement itself is true: on 4000 random pairs of `2 × 2` positive definite matrices the smallest value of `δ(A, B) − ‖log A − log B‖_F` was `2.7e-8`. The repair is to apply the pointwise bound to the geodesic `γ(t) = A #ₜ B`: by 7.2 its length is `δ(A, B)`, and with `η = log γ` the bound gives `δ(A, B) ≥ ∫ ‖η'‖_F ≥ ‖log B − log A‖_F`.

That repair makes the order explicit. The property and the triangle inequality of 7.1 both use the length statements of 7.2 (the route of 7.1 says so twice), while 7.1 lists `*Needs:* 3.1, 6.2` and 7.2 lists `*Needs:* 7.1`. Split it so that nothing is circular: invariance and the pointwise bound first (needing 3.1 and 6.2), then the length statements of 7.2, then the property, the triangle inequality and definiteness, with `*Needs:*` lines that say so.

## R02 (P2) — The distance formula, completeness and the geodesic midpoint on the positive definite cone are also planned by the open roadmap ManifoldOptimization

Two roadmaps would each prove the same three theorems, and an implementer of either cannot tell which one to build on. ManifoldOptimization (pull request #1506, `TauCetiRoadmap/ManifoldOptimization/README.md`, lines 363–373, in its catalogue O0.3) defines the positive definite matrices with the affine-invariant metric as a Riemannian manifold and proves completeness, `d(X, Y) = ‖logm(X^(−1/2) Y X^(−1/2))‖_F`, and that the geodesic midpoint is `X # Y`. Here 7.2 proves that `δ`, defined by the same formula, is the least length of a `C¹` path and that `A #ₜ B` is the geodesic, and 7.4 proves completeness. This roadmap's scope section sends "the Riemannian-manifold structure of the cone" to Beyond and names no owner; ManifoldOptimization does not mention this roadmap.

The smallest change is a line under "Not owned here" that names ManifoldOptimization O0.3 as the owner of the manifold structure on real positive definite matrices and says where the boundary is. One natural boundary: this roadmap owns the closed-form distance on complex Hermitian matrices and its matrix-analytic theory (7.1–7.4), and the identification of the Riemannian distance with `δ` is the path-length statement of 7.2, which the other roadmap can cite. Neither roadmap is in the merge order yet, so which of the two cites the other is the authors' choice; it must be one of them.

## C01 — The C⋆ transfer 4.4 assumes `f ≥ 0`, which the statement does not need and which excludes the logarithm

As stated, `cfc_le_cfc_of_isOperatorMonotoneOn` does not recover Mathlib's `CFC.log_monotoneOn`: `log` is operator monotone on `(0, ∞)` (2.6) and monotone on strictly positive elements of every unital C⋆-algebra, but fails `hpos`. The hypothesis is only a convenience of the route through 4.3. A strictly positive `a` satisfies `a ≥ ε` for some `ε > 0`, and `t ↦ f(t + ε/2) − f(ε/2)` is nonnegative and operator monotone on `(0, ∞)`, so the nonnegative case applied to `a − ε/2 ≤ b − ε/2` gives the general one. Dropping `hpos` (in 4.4 and in the Lean signature) states the result at its natural generality; the form for an operator monotone function on an open interval and elements with spectrum in it follows from 4.1 by the same integral argument and would be the general library statement.

## C02 — `divDiff` is Mathlib's `dslope`

`divDiff f x y` (3.1, and `Suggested.lean` line 153) equals `dslope f x y` (`Mathlib/Analysis/Calculus/DSlope.lean`, line 41: the slope off the diagonal and `deriv f a` on it). I checked the equality in Lean at the pin, by cases on `x = y`. A second definition would need the continuity and differentiability API of `dslope` again. Define `loewnerMatrix` through `dslope`, and list it under the Mathlib contracts.

## C03 — The route of the Hansen–Pedersen inequality applies the Jensen inequality to blocks of two sizes, which its statement does not allow

In 2.2 the family `K₁ = K` (`m × n`, with `A₁ ∈ Mat m`) is completed by `K₂ = (1 − Kᴴ K)^(1/2)` (`n × n`, with `A₂ = 0 ∈ Mat n`). The Jensen inequality as stated, in the README and in `cfc_sum_conjTranspose_mul_le`, takes all `Kⱼ` of one shape `m × n` and all `Aⱼ` in `Mat m`, so it applies only when `m = n`. Either state the Jensen inequality for blocks of sizes `mⱼ × n`, or say in the route that the smaller block is padded with zero rows and a zero block of spectrum `{0} ⊆ I`.

## C04 — "The layers are in build order" is not true of 2.6 and of 5.1

Line 224 says the layers are in build order, but 2.6 needs 3.2 for the range `r < −1` (its own `*Needs:*` line says so), and Layer 3 needs only Layer 1. In Layer 5, the route of 5.1 takes the monotonicity in `ε` from "5.2 applied to the formula mean", while 5.1 lists `*Needs:* Layer 4` and 5.2 lists `*Needs:* 4.3, 5.1`. For 2.6, say in "How to read the build" that the convex range for `r < −1` waits for 3.2. For 5.1, state the joint monotonicity of the formula mean on positive definite arguments as its own item (it follows from 4.3 and the parallel sums), before the limit.

## C05 — Two pointers lead nowhere

The Checks of 1.1 cite "(1.3)" three times (lines 259–264); Layer 1 has no Section 1.3, and the examples are in 1.2. The Mathlib contracts place `Matrix.IsHermitian.eigenvectorUnitary` and `Matrix.IsHermitian.eigenvalues` in `LinearAlgebra/Matrix/Spectrum.lean` (line 147); at the pin they are in `Analysis/Matrix/Spectrum.lean` (lines 67 and 89), and the cited file does not exist.

## C06 — Four Layer 1 declarations of `Suggested.lean` ask an implementer for little

`isOperatorConvexOn_sq_and_not_isMatrixMonotoneOn` and `not_isMatrixConvexOn_cube_abs` are witnessed by the explicit `2 × 2` matrices of the Checks of 1.2, so they mirror those Checks. `IsOperatorMonotoneOn.comp` and `isOperatorMonotoneOn_of_tendsto` are closure lemmas of the definition, not results the roadmap is built to reach. None closes in one tactic. If they are kept as sanity checks of the definitions, say so in their docstrings; otherwise the README already carries them as targets and Checks.

## N01 — A Mathlib pull-request number appears twice in the README

Lines 167 and 1129 cite "the open Mathlib pull request #39734". A reader a year from now cannot tell what state it describes; say what Mathlib has at the pin and leave the number to the pull request's description.

## N02 — "lean-CKMA", "CKMA entry" and "the matrix-analysis synopsis" are not defined or listed

The section "Prior formalization" and the list under "Beyond" (lines 1107, 1123–1151) refer to these, and to a "structure report" and "allocated entries", but no reference or link says what they are. Add the reference, or drop the table.

## N03 — The supplier contracts and the `*Needs:*` lines do not match item by item

No layer uses MAJ-B46, `Matrix.PosSemidef.kronecker`, `CFC.rpow_le_rpow`, `Real.exists_measure_rpow_eq_integral_rpowIntegrand₀₁`, `Matrix.PosDef.existsUnique_posSemidef_mul_mul` or `Matrix.isHermitian_geometricMean`. In the other direction, several `*Needs:*` lines name Mathlib material by description only ("eigenvalue perturbation", "Schur complement lemmas", "Riesz–Markov", "mollifiers and Arzelà–Ascoli"), with no entry in the contracts.

## Questions for the author

- Is the inequality `4‖AB‖ ≤ ‖(A + B)²‖` of 8.4 Zhan's own? My recollection is that it is due to Bhatia and Kittaneh (2000) and that Zhan's book presents it; I could not read Zhan, Thm 4.25, to check how the book attributes it. If so, the heading and the summary should carry their names.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 inverse and first examples (sampled) | square, cube, abs, exp matrices of the Checks | dets `−1`, `−1`, `−0.6833`, `−1.1895`; exp eigenvalues `−0.1710`, `6.9559` | all Checks reproduce | C06 |
| 2.1 Davis (sampled) | `I = ∅`, `I = {c}`, `n = 0`, `m × 0` isometry; cube, `A = −J`, `V = e₁` | vacuous; `f(c) ≤ f(c)`; cube gives `−1 ≰ −4` | iff sound both ways | none |
| 2.2 Jensen, Hansen–Pedersen | `k = 0` forces `n = 0`; `f = 1`, `K = 0` | left `1`, right `0` without `∑ = 1` or `f(0) ≤ 0` | hypotheses needed; route needs two block sizes | C03 |
| 2.3 Choi–Davis–Jensen (sampled) | `Φ = 2X`, `f = t²`; `n = 0 < m`; trace state | `4a² ≰ 2a²`; `Φ 1 = 1` impossible; scalar Jensen | true for positive unital maps | none |
| 2.4 monotone iff concave | `f = −t²`; support function | concave but decreasing; monotone and concave | `f ≥ 0` needed | none |
| 2.5 Bendat–Sherman (sampled) | `f = 1`, `−1`, `t²`, `t log t` | `1/t` antitone; `−1/t`, `t`, `log t` monotone; `f(0) = lim t g(t) ≤ 0` | both directions consistent | none |
| 2.6 powers and logarithms (sampled) | random `2 × 2`, `r ∈ [−1,0] ∪ [1,2]`; `r = −1.5, −2, −3, 2.5, 0.5` | min eigenvalue `+1.1e-8`; `−0.010, −0.016, −0.019, −0.002, −0.19` (relative) | ranges as stated | C04 |
| 3.1 divided differences, Daleckii–Krein (sampled) | `t²`, `exp` at `0`; `divDiff` against `dslope` | `AH + HA`; `H`; equal in Lean by cases | formula right; definition duplicates Mathlib | C02 |
| 3.2 Loewner's criterion (sampled) | `√t` at `1, 4`; `log` at `1, e`; `t²`; `n = 1`; `a ≥ b` | dets `1/72`, `0.02918`, `−(a−b)²`; `f' ≥ 0`; both sides vacuous | sound | none |
| 3.3 regularity (sampled) | order 2 Loewner matrix | `f'(x) f'(y) ≥ [x, y; f]²`, so `f'(x) = 0` forces constant | sound | none |
| 4.1 integral form | `x`, `x/(1−x)`, constant, `δ₂` | `δ₀`, `δ₋₁`, `0`; pole at `−1/2`; moments fix `ν` | unique measure sound | none |
| 4.2 Pick form | constant `F`; `z²` at `−1 + i`; `a ≥ b` | `Im = 0`; `Im = −2`; both sides true | reflection automatic on the connected domain | none |
| 4.3 half-line | `t/(1+t)`, `√t`, `log(1+t)`, `−1/t` | `δ₁/2`; mass `1`; `∫₁^∞ t/(s(t+s)) ds = log(1+t)`; `f(0+) = −∞` | sound | none |
| 4.4 C⋆ transfer (sampled) | `𝒜 = ℂ`; `f = log` | scalar monotone; conclusion holds, `hpos` fails | true; hypothesis superfluous | C01 |
| 5.1 formula mean (sampled) | `f = 1`, `id`, `√t`; `A = diag(1,4)`, `B = [[2,1],[1,2]]`; `A = 0` | `A`, `B`; `[[1.3932, 0.4861],[0.4861, 2.6561]]`, `X A⁻¹ X − B ≈ 1e-15`; limit `B` | sound; route cites 5.2 | C04 |
| 5.2 Kubo–Ando | rectangular `C` (`2 × k`, random); `(A²+B²)/2`; `n = 1` uniqueness | min eigenvalue `+1e-9`; `1/4 ≰ 1/16`; `1 σ t = g(t)` | axioms hold for the formula mean and fix `f` | none |
| 5.3 transpose, bounds | random pairs, `f = log(1+t)/log 2`; left mean | swap error `1e-12`; `1 < 1.5` without symmetry | sound | none |
| 5.4 Ando, joint concavity (sampled) | `Φ = 0`; `n = 0`; block map `(1−t)X + tW` | `0 ≤ 0`; reduces to 2.3 for the unital `Ψ` | sound for positive maps | none |
| 6.1 identification | Tau Ceti definition at the pin | `√a √(√a⁻¹ b √a⁻¹) √a`, the same convention as `wgm (1/2)` | sound | none |
| 6.3 HGA order (sampled) | random pairs, `t ∈ [0,1]`; `t = 0`; `n = 0` | both gaps `≥ 7.8e-10`; equality for every `B` at `t = 0` | sound; equality case needs `0 < t < 1` | none |
| 6.4 block maximality (sampled) | `X = A # B`; Schur complement | `X A⁻¹ X = B`; `(A^(−1/2) X A^(−1/2))² ≤ A^(−1/2) B A^(−1/2)` | sound | none |
| 7.1 distance, EMI (sampled) | `δ(1, diag(1,4))`, `δ(1, 2·1)`; 4000 random pairs | `1.386`, `0.980`; EMI slack `≥ 2.7e-8` | statement true; route wrong | R01 |
| 7.2 geodesics and lengths | segment `diag(1,4) → diag(4,1)` | length `2.0856` against `δ = 1.9605` | sound; shared with ManifoldOptimization | R01, R02 |
| 7.3 semiparallelogram (sampled) | 4000 random triples, `t ∈ [0,1]`; `n = 1` | slack `≥ 2.5e-8`; equality | sound | none |
| 7.4 completeness, barycenter | `m = 0`; `n = 0` | weights cannot sum to `1`; one matrix | sound | R02 |
| 8.1 Kittaneh | `A` positive, `B = HA`, three norms; non-Hermitian `AB` | slack `≥ −1.5e-10` (rounding); `1 ≰ 0` | sound | none |
| 8.2 Bhatia–Kittaneh | random pairs; `A = B`; `A = diag(1,0)`, `B = E₂₁` | slack `≥ 1.7e-5`; equality; `0 ≤ 1/2` | sound | none |
| 8.3 Heinz | random, three norms; `t = 0` | slack `≥ 6.3e-6`; equality with `0⁰ = 1` | sound | none |
| 8.4 Zhan | `A = diag(1,0)`, `B = J/2`; random pairs | `2.828 ≤ 2.914`, `2.828 ≤ 3.000`; slack `≥ 7.1e-4` | sound | question |

- Source locators checked against the text: 0 of the 15 sampled targets (no cited text could be read legally); their mathematics was recomputed as in the table.
- Library declarations opened at the pins: `dslope` (`Mathlib/Analysis/Calculus/DSlope.lean:41`), `Matrix.le_iff` (`Analysis/Matrix/Order.lean:54`), `Matrix.PosSemidef.hadamard` (`:214`), `Matrix.IsHermitian.eigenvalues` (`Analysis/Matrix/Spectrum.lean:67`), `CFC.log_monotoneOn` (`…/ExpLog/Order.lean:77`), `CFC.monotone_rpow` (`…/Rpow/Order.lean:132`), `TauCeti.geometricMean` (`…/GeometricMean.lean:81`), `TauCeti.nevanlinnaKernel` (`Pick/Nevanlinna.lean:218`), the three Pick theorems (`Nevanlinna.lean:436`, `Boundary.lean:201`, `:322`).
- Cross-roadmap citations resolved on main: Majorization MAJ-A26, A28, B01, B19, B21, B46 and its block sums; PolarDecomposition PD-A52; CStarAlgebras 1.1; RandomMatrices 2.6; OptimalTransport 5.3. The local seminorm structure agrees field for field with Majorization's.
- Elaboration: exit 0, 44 `sorry` warnings and no other message. Signatures of all 64 declarations printed and compared with the README: no binder lost, generality equal.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy of the file: 0 of 44 theorems closed.
- Dependency check: `depcheck: 213 roadmaps, 2282 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- No change outside the roadmap folder; the description's count of 44 theorems and its supplier list agree with the head.
- Overlap check: read ManifoldOptimization, MeansMajorizationAndDiscreteInequalities, SpectralSteepestDescent, ConvexAnalysisAndDuality, Majorization, NoncommutativeIntegration, ComplexHessianEquations; the distance, completeness and geodesic midpoint of the positive definite cone are shared with ManifoldOptimization and have no single owner (R02); unitarily invariant seminorms are owned by Majorization and cited; nothing else shared.

Source independence: 0 passages compared with 0 sources, because none of the seven cited texts could be read legally; largest share Simon 2019, about 45 of about 115 locators (Bhatia 1997 about 40); contents not compared, since no table of contents was read. By the README's own locators the layers do not run along Simon's chapters (Layer 2 cites Chapters 4 and 9–11, Layer 3 Chapter 5, Layer 4 Chapters 1–3).

Research link: Layers 2–5 are Loewner's theorem and the Kubo–Ando theory of operator means (Bhatia 1997; Simon 2019; Hiai 2021), which the README's downstream section ties to Lieb concavity (RandomMatrices 2.6) and the Bures formula (OptimalTransport 5.3); Layer 7 is the nonpositively curved geometry of Jost 1997. Rests on the README.

## Not verifiable

- Bhatia 1997, Simon 2019, Zhan 2002, Terras 2016, Jost 1997: Springer books behind a paywall; the sources service resolves each only to the paywalled page.
- Horn–Johnson 1991 and Hiai 2021: the sources service found no legal copy.
- Consequently every locator of the sampled targets (theorem numbers, pages, hypotheses in the source) is unverified, and so is the attribution asked about under Questions.

Automatic checks set aside as false positives: the report of a section header in `Suggested.lean` with no declaration under it, which is the header above the `#check` lines that pin library names, a use the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: no cited text could be read (five paywalled Springer books; no legal copy found for Horn–Johnson and Hiai). Wording, locators and contents were not compared with Simon 2019, the source of the largest share, or with any other.
- Arrangement, from the README's own locators: Layers 1, 2, 3, 4 cite Bhatia Sections V.1, V.2, V.3, V.4 respectively, in that order, and Layer 8 cites IX.1 and IX.4. Bhatia's contents were not read. The order of Layers 2 and 3 is not forced (Layer 3 needs only Layer 1).
- Licence: `README.md` lines 1123–1151 map sections to "CKMA entries 13.28–13.74" of a "matrix-analysis synopsis" and cite "lean-CKMA"; neither is in References and I could not identify them.
- Scope: two open roadmaps (this one and ManifoldOptimization, pull request #1506) plan the affine-invariant geometry of positive definite matrices; which owns the shared theorems is for the authors and the approvers (R02).
