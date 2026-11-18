# Review of OperatorMonotoneFunctionsAndMatrixMeans (pull request #2496 at e82f0cd)

**Verdict:** accepted

**Summary.** Accepted: this roadmap folder is ready for a human's final approval. Both findings of the previous review are repaired (the exponential metric increasing property is now derived from the geodesic after the length statements, and the boundary with ManifoldOptimization is stated), and every statement I could test is true as stated: the file elaborates with `sorry` as its only warning, and all Checks and headline inequalities recompute. There are three small corrections and one format note, none blocking. None of the seven cited books could be read legally, so the locators, the wording and the arrangement against the sources are left to the human reviewers.

## C01 — The symmetry `A # B = B # A` in 6.1 needs both arguments positive definite

The bullet of 6.1 that records the Riccati characterization and the symmetry (lines 855–858) comes right after a statement made "for positive definite `A` and positive semidefinite `B`" and gives no hypotheses of its own, so a reader carries that standing over. With the roadmap's formula for the mean the symmetry fails when `B` is singular: for `A = [[2, 1], [1, 2]]` and `B = diag(1, 0)` I computed `A # B = diag(1.2247, 0)` (that is `√(3/2)`, the solution of `X A⁻¹ X = B`), while the formula with the arguments exchanged gives `diag(1.4142, 0)`. The cited `TauCeti.geometricMean_comm` assumes both arguments strictly positive (`Analysis/SpecialFunctions/ContinuousFunctionalCalculus/GeometricMean.lean`, line 174). Write "and, for positive definite `A` and `B`, `A # B = B # A`".

## C02 — The route of Kittaneh's lemma uses a unitary triangularization that its `*Needs:*` line does not name

The route of 8.1 (line 1074) triangularizes `BA = U T Uᴴ` with `U` unitary, and the `*Needs:*` line lists only Majorization MAJ-A26, MAJ-A28 and MAJ-B21. A search of the pinned Mathlib and Tau Ceti for "Schur" together with "triangular", "decomposition" or "unitary" found no such statement, and neither Majorization nor PolarDecomposition on main states one. An implementer following the route has to supply it. Either add it to 8.1 as a small item of its own (every complex square matrix is unitarily similar to an upper triangular one, with its eigenvalues on the diagonal), or name the library declaration if one exists under another name.

## C03 — "Layer 8 uses Layer 1 and Majorization only" leaves out PolarDecomposition, and two Dependencies lines do the same

"How to read the build" (line 237) says that Layer 8 "uses Layer 1 and Majorization only", but 8.2 needs PolarDecomposition PD-A52 (its own `*Needs:*` line and the Dependencies of Layer 8 say so). In the other direction, the Dependencies of Layer 5 ("Layers 2 and 4") and of Layer 6 ("Layer 5; Tau Ceti's geometric mean") omit PolarDecomposition, which 5.3 and 6.2 need for the polar factor. Someone planning the build from these lines would schedule Layers 5, 6 and 8 before that supplier. Add PolarDecomposition in the three places.

## N01 — Some bold items have no Lean name, so they read as headlines that the Lean file does not state

The infinitesimal bound (7.1), Bhatia–Davis (8.3), the parallel-sum formula (5.1 and 5.3) and the exponential counterexample (1.2) are bold like the named headlines, and all are statable with the definitions the file already has. The module docstring says they are prose targets; either leave them unbolded or state them, as preferred.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 notions (sampled) | `n = 0`; order 1 vs 2 for `t²`; `t = 2` outside `[0,1]` | single matrix; scalar monotone, `det(B² − A²) = −1`; `4 > 2` | definitions separate the wrong variants | none |
| 1.2 inverse, first examples (sampled) | the four `2 × 2` Checks | dets `−1`, `−1`, `−0.6833`, `−1.1895`; exp eigenvalues `−0.1710`, `6.9559` | reproduce | none |
| 2.1 Davis (sampled) | `t²`, 2000 random `4 × 2` isometries; cube, `A = −J`, `V = e₁`; `n = 0` | min eigenvalue `+2.5e-4`; `−1 ≰ −4`; vacuous | iff sound | none |
| 2.2 Jensen, Hansen–Pedersen | `k = 0`; `f = 1`, `K = 0`; padding to `(m+n) × n` | forces `n = 0`; `1 ≰ 0`; `K₁ᴴK₁ + K₂ᴴK₂ = 1` | sound; route now of one block size | none |
| 2.3 Choi–Davis–Jensen (sampled) | `Φ = (Xᵀ + tr(X)/3)/2` (positive, unital, uses transpose), `f = 1/t`; `Φ = 2X` | min eigenvalue `+8.1e-3`; `4a² ≰ 2a²` | sound for positive unital maps | none |
| 2.4 monotone iff concave | `−t²`; support function of `(0, ∞)` | concave, decreasing; monotone, discontinuous at `0` | hypotheses needed | none |
| 2.5 Bendat–Sherman (sampled) | `t log t` on random `3 × 3`; `f = 1`; `g` monotone ⇒ `f(0) ≤ 0` | min eigenvalue `+1.9e-5`; `1/t` antitone; `t g(t) ≤ t g(1) → 0` | both directions consistent | none |
| 2.6 powers, logarithm (sampled) | `r = −1, −0.5, 1.5, 2`; `r = −1.5, −2, 2.5` | convexity gap `≥ 1.3e-9`; relative gaps `−0.031, −0.100, −0.047` | ranges as stated | none |
| 3.1, 3.2 Daleckii–Krein, Loewner criterion | `√t` at `1, 4`; `log` at `1, e`; `t²`; `a ≥ b` | dets `1/72`, `0.02918`, `−(a−b)²`; both sides vacuous | sound; `dslope` gives `deriv` on the diagonal | none |
| 3.3 regularity | order-2 Loewner matrix | `[x,y;f]² ≤ f'(x) f'(y)` | sound | none |
| 4.1 integral form | `x`, `x/(1−x)`, constant, `δ₂` | `δ₀`, `δ₋₁`, `0`; pole at `−1/2` | sound | none |
| 4.2 Pick form | `z²` at `−1 + i`; constant; `F` real on `(a,b)` | `Im = −2`; `Im = 0`; reflection forced by the identity theorem | sound | none |
| 4.3 half-line (sampled) | `t/(1+t)`; `√t`, `log(1+t)` at `t = 2.3` | `δ₁/2`; `1.516575 = √2.3`; `1.193922 = log 3.3`, mass `0.693147 = log 2` | sound; `α + β + ρ = f(1)` holds | none |
| 4.4 C⋆ transfer (sampled) | `𝒜 = ℂ`; `f = log`, `I = (0, ∞)`; shifted square Check; `λ < 0` in the route | scalar; recovers `CFC.log_monotoneOn`; det `−1`; order reverses twice | sound; no sign hypothesis left | none |
| 5.1 formula mean (sampled) | `√t`, `A = diag(1,4)`, `B = [[2,1],[1,2]]`; parallel-sum integral; `A = 0` | `[[1.3932, 0.4861],[0.4861, 2.6561]]` both ways, Riccati error `4e-16`; `√(ε(1+ε)) → 0` | sound; joint monotonicity gap `≥ 0.20` | none |
| 5.2 Kubo–Ando (sampled) | random `3 × 2` `C`; `(A²+B²)/2`; left mean; `fₙ` vs `f₁` | transformer gap `≥ 2.0e-5`; `1/4 ≰ 1/16`; `f = 1`; `fₙ ≤ f₁ ≤ fₙ` | axioms hold and fix one `f` | none |
| 5.3 transposes, bounds (sampled) | `f = sin 3x + x³` (no hypothesis); logarithmic mean; left mean | swap error `4e-12`; gaps `≥ 1.9e-7`, `9.5e-8`; `1 < 1.5` | swap holds for every `f`; bounds need symmetry | none |
| 5.4 Ando, joint concavity | positive non-unital map with a transpose; random `t` | gap `≥ 1.0e-2`; gap `≥ 1.7e-5` | sound | none |
| 6.1 identification | Tau Ceti's definition at the pin; singular `B` exchanged | `√a √(√a⁻¹ b √a⁻¹) √a`; `diag(1.2247, 0)` vs `diag(1.4142, 0)` | weight ½ agrees; symmetry needs both positive definite | C01 |
| 6.2 identities (sampled) | 1500 random triples, `t ∈ [−2, 3]` | exchange `2e-12`, inversion `7e-8`, congruence `6e-10`, determinant `7e-8` (relative) | sound for real `t` | none |
| 6.3 HGA order (sampled) | 1500 random pairs; `t = 0` | gaps `≥ 2.1e-9` both sides; equality for every `B` | sound; equality case needs `0 < t < 1` | none |
| 6.4 block maximality | random `Y` scaled to the boundary of the block cone | `A # B − cY` min eigenvalue `≥ 1.9e-3` | sound | none |
| 7.1 distance (sampled) | `δ(1, diag(1,4))`, `δ(1, 2·1)`; congruence, inversion, swap | `1.386294`, `0.980258`; error `3e-11`; `sinh u/u ≥ 1` | sound | none |
| 7.2 lengths, EMI, metric, geodesic | 1500 random pairs/triples; segment `diag(1,4) → diag(4,1)` | EMI slack `≥ 4.0e-3`; triangle slack `≥ 0.27`; geodesic error `1e-12`; `2.0856 > 1.9605` | sound; route now non-circular | none |
| 7.3 semiparallelogram | 1500 random triples, `t ∈ [0,1]`; `n = 1` | slack `≥ 4.6e-5`; equality | sound | none |
| 7.4 completeness, barycenter | `m = 0`; `n = 0` | weights cannot sum to `1`; one matrix | sound | none |
| 8.1 Kittaneh | `A` PSD, `B = HA`, four norms; non-Hermitian `AB` | slack `≥ 0.061`; `1 ≰ 0` | sound | C02 |
| 8.2 Bhatia–Kittaneh | 1500 random complex pairs; `A = B` | singular-value slack `≥ 0.024`; equality | sound | C03 |
| 8.3 Heinz, Bhatia–Davis | singular PSD `A`, `B` of rank 1–3, four norms; `t = 0` | slack `≥ 0.063`, `≥ 0.70`; equality with `0⁰ = 1` | sound | none |
| 8.4 product inequality (sampled) | `A = diag(1,0)`, `B = J/2`; 1500 random PSD pairs | `2.8284 ≤ 2.9142`, `2.8284 ≤ 3.0000`; slack `≥ 0.56` | sound | none |

Earlier findings at this head:

| Earlier remark | Passage at this head | Status |
|---|---|---|
| R01 route of the exponential metric increasing property; 7.1/7.2 circular | 7.2: "apply the infinitesimal bound to the geodesic `γ(t) = A #ₜ B` itself"; items "proved in the order listed"; 7.2 needs 7.1, 6.1, 6.2 | repaired |
| R02 ownership against ManifoldOptimization | "Not owned here": the manifold structure of the real cone is "the roadmap ManifoldOptimization, catalogue item O0.3"; 7.2 "is the input" | repaired on this side (see the human reviewers) |
| C01 `f ≥ 0` in the C⋆ transfer | 4.4: "if `f` is operator monotone on an open interval `I`"; Lean has `hIo`, `hI`, no sign hypothesis | repaired |
| C02 `divDiff` duplicates `dslope` | `loewnerMatrix` is defined through `dslope`; `dslope` in the Mathlib contracts | repaired |
| C03 two block sizes in Hansen–Pedersen | "pad both to `(m + n) × n`" | repaired |
| C04 build order of 2.6 and 5.1 | "with one exception … 2.6 … waits for Section 3.2"; joint monotonicity stated in 5.1 before the limit | repaired |
| C05 two pointers | Checks of 1.1 cite 1.2; spectrum file is `Analysis/Matrix/Spectrum.lean` | repaired |
| C06 Layer 1 declarations | docstrings say "A sanity check of the definitions" and "A closure lemma of the definition" | repaired |
| N01–N03, the attribution question | no pull-request number, no undefined synopsis; contracts trimmed; 8.4 "attributed there to Bhatia and Kittaneh" | repaired (attribution not verifiable) |

- Source locators checked against the text: 0 of the 15 sampled targets (no cited text could be read legally); their mathematics was recomputed as in the table.
- Library declarations opened at the pins: 43 pinned by `#check` and elaborated; opened by file and line `dslope` (`Analysis/Calculus/DSlope.lean:41`), `Matrix.PosSemidef.hadamard` (`Analysis/Matrix/Order.lean:214`), `CFC.monotone_rpow` (`…/Rpow/Order.lean:132`), `CFC.sqrt_le_sqrt` (`:90`), `CFC.log_monotoneOn` (`…/ExpLog/Order.lean:77`), `cfc_integral` (`…/ContinuousFunctionalCalculus/Integral.lean:170`), `RealRMK.integral_rieszMeasure` (`…/RieszMarkovKakutani/Real.lean:341`), `TauCeti.geometricMean` (`…/GeometricMean.lean:81`), `geometricMean_comm` (`:174`), the Pick theorems (`Pick/Nevanlinna.lean:436`, `Pick/Boundary.lean:201`, `:322`).
- Cross-roadmap citations resolved on main: Majorization MAJ-A26, A28, B01, B19, B21 and its orthogonal block sums (MAJ-B22 onwards) and concrete seminorms; PolarDecomposition PD-A52; CStarAlgebras 1.1; RandomMatrices 2.6; OptimalTransport 5.3. ManifoldOptimization O0.3 resolved at its open head. The local seminorm structure agrees field for field with Majorization's.
- Elaboration: exit 0, 44 `sorry` warnings and no other message. The file has no `variable` line; `#check @name` for every declaration elaborated and the types agree with the README statements, nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: 0 of 44 theorems closed.
- Dependency check: `depcheck: 200 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- No change outside the roadmap folder; the description (44 theorems, suppliers, the layer list, the boundary with ManifoldOptimization) agrees with the head.
- Overlap check: read SpectralSteepestDescent, MeansMajorizationAndDiscreteInequalities, ManifoldOptimization, Majorization, ComplexHessianEquations, NoncommutativeIntegration; unitarily invariant seminorms are owned by Majorization and cited; operator means are handed here by MeansMajorizationAndDiscreteInequalities; the Riemannian manifold of real positive definite matrices is ManifoldOptimization's and the closed-form distance on the complex cone is this roadmap's; nothing else shared.

Source independence: 0 passages compared with 0 sources, because none of the seven cited texts could be read legally; largest share Simon 2019, 46 of about 122 locators (Bhatia 1997 39); contents not compared, since no table of contents was read. By the README's own locators the layers do not run along Simon's chapters (Layer 2 cites Chapters 4 and 9–11, Layer 3 Chapter 5, Layer 4 Chapters 1–3, Layers 5–6 Chapters 36–37).

Research link: Layers 2–5 are Loewner's theorem and the Kubo–Ando theory of operator means (Bhatia 1997; Simon 2019; Hiai 2021), which the README's downstream section ties to Lieb concavity (RandomMatrices 2.6) and the Bures formula (OptimalTransport 5.3); Layer 7 is the nonpositively curved geometry of Jost 1997. Rests on the README.

## Not verifiable

- Bhatia 1997, Simon 2019, Zhan 2002, Terras 2016, Jost 1997: Springer books behind a paywall; the sources service resolves each only to the paywalled page.
- Horn–Johnson 1991 and Hiai 2021: the sources service found no legal copy.
- Consequently every locator of the sampled targets (theorem numbers, pages, hypotheses in the source) is unverified, and so is the attribution of the product inequality in Zhan, p. 78.

Automatic checks set aside as false positives: the process word "catalogue" in the scope section, which is the name ManifoldOptimization gives its own item O0.3 and describes that roadmap, not this one; and the section header in `Suggested.lean` with no declaration under it, which stands above the `#check` lines that pin library names, a use the form rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: no cited text could be read (five paywalled Springer books; no legal copy found for Horn–Johnson and Hiai). Wording, locators and contents were not compared with Simon 2019, the source of the largest share, or with any other.
- Arrangement, from the README's own locators: Layers 1, 2, 3, 4 cite Bhatia Sections V.1, V.2, V.3, V.4 respectively, in that order, and Layer 8 cites IX.1 and IX.4. Bhatia's contents were not read. Layer 3 needs only Layer 1.
- Scope: `README.md` lines 89–96 draw the boundary with ManifoldOptimization (open, item O0.3: real positive definite matrices as a Riemannian manifold, with the same distance formula and midpoint). ManifoldOptimization's text does not yet mention this roadmap.
