# GATE-PositiveMass~3: answers to the review of 68063cc

All points come from one comment by CBirkbeck (2026-10-28T16:14:58Z), findings F01–F08, numbered H01–H08 in order. Repairs are in commit `ef9ad8b` on top of `68063cc`: `TauCetiRoadmap/PositiveMass/README.md` rewritten in house shape, `TauCetiRoadmap/PositiveMass/Suggested.lean` replaced.

## H01 (CBirkbeck) — applied

`FiniteEndedAE` now requires a finite **nonempty** family of ends (`numEnds_pos : 0 < numEnds`), following Cecchini–Zeidler Definition 2.3 (`cecchini-zeidler` line 254, p. 6). The requirement is carried into README 1.1 (weighted Poincaré "with nonempty ends"), 1.4 and 6.1. The flat-torus counterexample (empty family, parallel spinor with weighted norm 1 and gradient 0, every constant solving the end-value problem) is now a negative-control Check in 0.1, 1.1, 1.4, 6.1 and 8.4. The ℝ³ constant-section Check (`4π∫₁^∞ 1 dr = ∞`) is in 0.3.

## H02 (CBirkbeck) — applied differently

The cycle is real: `TauCetiRoadmap/Yamabe/README.md` on main (line 48) consumes PositiveMass P0–P8, and the old PositiveMass supplier table consumed Yamabe Y0–Y3.1. The suggested repair, moving the inputs to a new shared supplier, would mean editing other roadmaps, which this change cannot do. Instead the Yamabe row is gone and each input now has an owner earlier in the order:
- conformal scalar law: now target 0.4, derived from RiemannianGeometry R1's `e^(2u)g` law on main (its line 234), with the gradient-term cancellation written out;
- Euclidean critical Sobolev inequality: Mathlib `MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq` and Tau Ceti `TauCeti.W1p0.sobolevEmbeddingL`, both checked at the pins;
- Y1.2's positive first eigenfunction and Y3.1's conformal PSC metric: now target 3.0, built on UO-D06, VM V5.1, CKG K5a and PDE Lane C.

Only the closed-manifold facts PositiveMass itself uses moved down; Y0–Y3's variational theory is not copied. Yamabe now appears only under Downstream consumers. Yamabe on main still plans the same three facts inside Y0–Y3. Pointing it at PositiveMass 0.4 and 3.0 is a revision to Yamabe and is outside this pull request.

## H03 (CBirkbeck) — applied

The source check holds: in `cecchini-zeidler` lines 728–731 (p. 16), f maps into [0,1], f=0 on X₀∖K and f=1 near ∂X₀, and supp ξ₀ ⊆ X₀∖K. Line 764 gives `B_ψλ ξ₀ = 𝓓ξ₀`, and line 768 gives `u_λ = ξ_λ` on `(X_λ∖X₀)∪K`. README 7.1 now states these support and collar conditions before ψ_λ is defined, extends ξ₀ by zero, and requires connected admissible X_λ. README 7.2 derives `B_ψλ ξ₀ = 𝓓ξ₀`, `B_ψλ u_λ = 0` and `u_λ = ξ_λ` on `(X_λ∖X₀)∪K` before the estimate (4.4)–(4.7). The reviewer's residual `(0, iλv)` is now a Check in 7.1, and the "ξ₀ nonzero on K" failure is a Check in 7.2.

## H04 (CBirkbeck) — applied

RiemannianGeometry R4.1 on main (lines 635–639) supplies the small-ball limit, monotonicity and the equality API "also consumed by PositiveMass P2.3". README 2.3 now proves only the AE large-ball bound `liminf ≥ 1` and then applies R4.1 once. Removed from 2.3: constructing the small-ball limit from R1.4/R4.6, the radial-equality, cut-locus and covering steps, and the no-identification step. Checks: ℝⁿ (ratio 1), and the flat cylinder (ratio → 0, so no AE end).

## H05 (CBirkbeck) — applied

Each target now has a theorem or equation locator next to its claim, and the References section gives full bibliographic data. Sources and versions:
- Cecchini–Zeidler, arXiv:2108.11972v2: Definitions 2.1/2.3/2.4, (2.1)–(2.8), Propositions 2.5/2.7/2.8, Theorem 2.12, Lemmas 3.3/3.4, Theorems 3.1/4.1, (4.4)–(4.7), Theorem B.
- Lee–Parker, Bull. AMS 1987, publisher-open: (1.1), Theorems 2.6/4.1, Definition 8.2, (8.11), Lemma 9.1, Theorems 9.2/9.5/9.6, Lemma 9.4, Theorems 10.1/10.3, Lemmas 10.6/10.7.
- Schoen–Yau, arXiv:1704.05490v1: the §1 mass factor on p. 4, Theorems 5.1–5.3, Proposition 5.4.
- Lohkamp, author copy: Proposition 6.1.
- Camporesi–Higuchi, arXiv:gr-qc/9505009v1, eq. (3.44): the parity-dependent multiplicity `2^floor(m/2)·binomial(k+m−1,k)` for P1c (now 1.3).
- do Carmo §4-5: boundary Gauss–Bonnet (now 3.1).

Paywalled works are cited by locator and marked uncertified: Witten 1981, Parker–Taubes 1982, Schoen–Yau 1979 (both papers), and Bartnik 1986. Bartnik is cited only at the locators that readable sources attribute to it: Theorem 1.3 via `cecchini-zeidler` line 463, and Proposition 1.6 via `lee-parker` line 1601. The earlier unverified "Theorem 1.7" was dropped. The mass sign was rechecked against Proposition 2.5 (`cecchini-zeidler` line 419: inward normal, limit `−(n−1)ω m|u|²/2`), and the factor 2 against Schoen–Yau 2017 line 130. `sources.toml` is not among the files this job may edit. The fetches went through the sources service, so the worker can record the manifest entries.

## H06 (CBirkbeck) — applied

The README now has the required headings: Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib / From Tau Ceti / per roadmap), How to read the build, Layers 0–8, Downstream consumers, References. Layer k is cited as Pk and k.n as Pk.n, so citations on main (Yamabe "P0–P8", RiemannianGeometry "P2.3") still resolve. Each definition has an API list and at least three computed Checks, each target has a `*Needs:*` line, and each layer ends with Examples and Dependencies. The values the reviewer asked for are in place:
- weight tails at δ=−1/2, −1, −3/2: 4π, ∞, ∞ (0.3);
- χ²=1, χ*=χ, and the +1 vectors `(e₂,0),(0,e₁)` and −1 vectors `(e₁,0),(0,e₂)` for `c_Σ(ν)=diag(i,−i)` (5.1);
- boundary signs: H=1 on the unit ball, −1 on the exterior of the unit ball, 0 on a half-space (5.1).

## H07 (CBirkbeck) — applied differently

As requested, `euclideanCoordinateFlux_eq_zero`, `conformalFluxNormalization`, `conformalEuclidean_mass`, `Euclidean`, `MetricCoefficients`, `euclideanMetricCoefficients` and `conformalEuclideanCoefficients` are deleted. Their mathematics is kept as Checks in 0.2 and 0.4. The suggestion to leave the file with no theorems is not followed: the nonspin headline P8.1 is statable at the pins, and the acceptance rule counts a statable but absent headline as a defect. The pins have Tau Ceti `CovariantDerivative.scalarCurvature` (`.../Curvature/Scalar.lean:53`), Mathlib `CovariantDerivative.leviCivitaConnection` (`.../LeviCivita.lean:359`) with Tau Ceti's smoothness instance (`.../LeviCivita/Regularity.lean:294`), and `TauCeti.riemannianVolume` (`.../VolumeDensity/Volume.lean:76`). The file now states `exists_tendsto_mass_nonneg` and `nonempty_isometryEquiv_of_mass_eq_zero`. It keeps only the definitions they need: `coordinateFluxIntegrand`, `normalizedCoordinateFlux`, `pullbackMetricCoeff`, `AsymptoticallyEuclideanEnd`, `FiniteEndedAE`.

## H08 (CBirkbeck) — applied

The namespace is now `TauCetiRoadmap.PositiveMass`. The module docstring is "…: target signatures" and says the README is the roadmap. It names the headlines that cannot be stated at the pins and what each lacks:
- P8.2 and P8.3: no spin structure on a Riemannian manifold at the pins, only the algebraic spin group;
- P3a: no degree of a map between closed oriented manifolds;
- P1/P1c/P6: no weighted Sobolev spaces of sections and no spinor bundle or Dirac operator.

The Green blow-up corollary is not stated separately: given `m = 2A` it is 8.1–8.3 plus arithmetic. Every declaration has a docstring and is named in README 0.1, 0.2 and 8.1. The file has Layer 0 and Layer 8 section comments.

## Lean signature check

All seven declarations were elaborated with `#check @name` lines added temporarily to `Suggested.lean` and built with `lake build`; the lines were then removed. Results:
- both theorems carry every binder explicitly, including `3 ≤ n`, `n ≤ 7`, `(n−2)/2 < t`, `ConnectedSpace`, `CompleteSpace`, `SecondCountableTopology` and `IsRiemannianManifold`;
- no section binder was dropped, since the file has no `variable` block;
- the three definitions and two structures elaborate to the types described in the README.

One redundant binder: `[IsContMDiffRiemannianBundle (𝓡 n) 1 …]`. It follows from the `∞` instance, but instance search timed out (20000 heartbeats) deriving it for `leviCivitaConnection`, and `set_option` is not allowed. A redundant Prop-class binder only adds a hypothesis that always holds (P3).

## Moved notions and ownership

Moved down from Yamabe (a consumer) into this roadmap: the pointwise conformal scalar law (0.4), the closed-manifold positive first eigenfunction, and the conformal PSC metric (3.0). Ownership of the new Lean objects was checked by object with `roadmaps grep` over main and the open heads; no roadmap owns AE ends, an ADM flux or a finite-ended AE structure as Lean declarations. No declaration here shares a fully qualified name with one in a readable roadmap. `roadmaps resolve` on the new README: no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `FiniteEndedAE` (0.1) | flat T³, empty family | weighted norm 1, gradient 0 | old definition admitted it | `numEnds_pos`; Check added |
| AE end (0.1) | `x↦2x` on flat ℝⁿ | `g_ij−δ_ij = 3δ_ij`, no decay | correctly excluded | Check |
| AE end radius | R≤0 with `‖x‖^(−t)` at x=0 | `0^(−t)=0` in Mathlib forces g(0)=δ | junk constraint | `radius_pos` field |
| distance comparison (0.1) | t=3/4, n=3 | error `O(|x|^(1/4))`, unbounded | `|x|±C` was false | now `|x|(1+o(1))` |
| mass (0.2) | `(1+c r^(2−n))^(4/(n−2))δ` | flux `4(n−1)c|S|`, mass 2c | holds | Check |
| mass (0.2) | `δ_ij + ε x_i x_j r^(−n)` | `Σ∂_i g_ij = ε x_j r^(−n)`, `Σ∂_j g_ii = ε(2−n)x_j r^(−n)`, mass ε/2 | holds | Check |
| mass existence | quadratic tail `r^(−2t−2)` | integrable iff 2t+2>n iff t>(n−2)/2 | threshold right | — |
| mass under covers | ℝⁿ∖B simply connected, n≥3 | covering of an end by an end has degree 1 | "multiplied by degree" was vacuous | restated as lifts of ends |
| weighted `L²_δ` (0.3) | n=3, `r^(−1)`, δ=−1/2, −1, −3/2 | tails 4π, ∞ (log), ∞ | matches δ>−t | Check |
| duality (1.1) | n=3, p=2, δ=−1/2 | dual weight −5/2; `r^(−3)` norm 4π, pairing 4π; wrong weight 1/2 gives pairing ∞ | holds | Check (my first draft's version was wrong and was rewritten) |
| radius change (1.1) | ρ→2ρ | factor `2^(−δ−n/p)`; weight `ρ^(−δp)` shifts threshold to n/p−t | first draft claimed `L^p_0=L^p`, false | rewritten |
| scalar indicial (1.2) | n=3, j=0,1,2 | roots (0,−1), (1,−2); multiplicities 1, 3, 5 | holds | Checks |
| sphere Dirac spectrum (1.3) | m=2, m=3 | ±(k+1) mult 2(k+1); ±(k+3/2) mult (k+1)(k+2); CH (3.44) N=2,n=0 gives 2 | holds | Checks |
| Fischer identities | v monogenic, degree ℓ | `D(Xv) = −(2ℓ+n)v`, `D(X²v) = −2Xv` | holds | Check |
| zero-mass deformation (2.2) | sign of the variation | LP (8.11): ṁ ∝ ∫⟨h,Ric⟩, either sign of s allowed | old fixed sign `−c_n` was unsupported | restated as nonzero multiple |
| volume rigidity (2.3) | ℝⁿ; S¹×ℝ^(n−1) | ratio 1; ratio→0 | holds | Checks; R4.1 cited |
| conformal law (0.4) | φ=λ; φ=1+c r^(2−n); φ=(2/(1+r²))^((n−2)/2) | `λ^(−4/(n−2))Scal`; 0; n(n−1) | holds; gradient terms cancel: `2(n−1)a = (n−1)(n−2)a² = 4(n−1)/(n−2)`, a=2/(n−2) | target and Checks |
| first eigenfunction (3.0) | V=c; S²; two spheres; S³ | λ₁=c; λ₁=0 simple, λ₂=2 mult 3; λ₁ mult 2; λ₁=6 | connectedness needed | Checks |
| stability (3.1) | equator S^k⊂S^(k+1), φ=1 | k(k−1) vs k(k+1), inequality fails | consistent (unstable) | Check |
| `a_k > 2` | k=3,4,6,7 | 8, 6, 5, 24/5 | holds for k≥3 | Check |
| boundary Gauss–Bonnet | disc; annulus 1<r<2; hemisphere | 2π; 2π−2π=0; 2π | holds | Checks |
| capping sign (3.2) | U≤1, U→1 | b≤0, mass m+2b<m | holds | Check |
| Lohkamp bend (3.2) | F concave, `Δ⁺=−Δ` | `Δ⁺F(h) = −F″|dh|² ≥ 0`, Scal≥0 | holds | Check |
| log cutoff (3.3) | planar `φ_R` on R≤r≤R² | `∫|dφ_R|² = 2π/log R` | holds | Check |
| Schwarzschild plane (3.3) | n=3, `{x₃=0}` and `{x₃=a}` | fixed set of reflection: totally geodesic; a≠0: ∂_ν log φ ≠ 0 | first draft contradicted itself | rewritten |
| boundary mass term (4.2) | flat ℝⁿ, constant u | G_r=0; CZ line 419 sign, inward ν | holds | Checks |
| `B_ψ²` (5.1) | block computation | `c(ξ)σ = diag(ic,−ic) = −σc(ξ)`, `σ²=1` | holds | Check |
| χ (5.1) | `c_Σ(ν)=diag(i,−i)` | `χ = diag(−1,1,1,−1)` | holds | Check |
| H normalization (5.1–5.2) | unit sphere; boundary term `trA/2` | averaged H=1, so η=(n−1)H/2 | first draft's H=n−1 contradicted η | H defined as `trA/(n−1)` |
| twistor split (5.2) | `u = Xv` on ℝⁿ | `|∇u|²=n|v|²`, `|Du|²/n=n|v|²`, Pu=0 | holds | Check |
| Callias on T³ (6.1) | empty family | parallel spinor in kernel | excluded by H01 | Check |
| P7 residual (7.1) | ψ=λ, ξ₀=(v,0) | residual (0,iλv), norm λ; after the support law it is 0 | old text was defective | support law added |
| asymptotic constant (4.1) | ∇ψ₀ = O(r^(−t−1)) in `L²_(−q−1)` | tail `∫r^(2q−2t−1)`, finite iff t>q | holds | Check |
| 8.1 Lean statement | flat ℝⁿ, id end, R=1 | g=δ, Scal=0, flux 0, isometry id | holds | — |
| 8.1 Lean statement | two-ended Schwarzschild m>0 | masses m, m > 0; no zero end | holds | Check |
| 8.1 Lean statement | flat T³ | numEnds>0 needs an end; an end's image has infinite diameter (decay gives `d = |x|(1+o(1))`), impossible in compact T³; an inversion chart into a punctured ball pulls the metric back like `|x|^(−4)δ` and fails the decay | excluded | — |
| 8.1 generality | n=8 | outside 8.1, covered by 8.2 with spin | README and Lean agree on 3≤n≤7 | — |

## Build

`lake build TauCetiRoadmap.PositiveMass.Suggested`: Build completed successfully (9003 jobs). Warnings: two `declaration uses 'sorry'`, at lines 122 and 148, the two theorems.

## Gate

`gate PositiveMass: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Direction check (`gate --depcheck … --movable`):

```text
depcheck: 162 roadmaps, 1163 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The reviewer's point that this tool missed the Yamabe cycle at `68063cc` (H02) was resolved by hand: the README no longer cites Yamabe as a supplier anywhere.
