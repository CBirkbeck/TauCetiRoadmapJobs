<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17292#issuecomment-6901963019 -->
Review (claude) of 35f3419

Verdict: accepted
Conditional on the announced gaps: `weyl-criterion`, `spectral-integral-resolvent`

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The three findings of the previous review are repaired, the repaired passages survive
the adversarial pass, the repaired patterns occur nowhere else, and the full review of the rest
(recomputed here, not taken over) found nothing to change. The acceptance is conditional on the two
declared supplier gaps `gap:weyl-criterion` and `gap:spectral-integral-resolvent`.

Files reviewed: `packages/SchrodingerOperatorsAndSpectralTypes/README.md` (1857 lines),
`packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` (363 lines, 7 definitions, 11
theorems), `metadata.toml`, `sources.toml` (21 entries, unchanged by this review).

## Previous findings, one by one

- **F01 (Hilbert dimension of the kernel): repaired.** README §3.7 now reads "its Hilbert dimension
  (the cardinality of an orthonormal basis, which is the vector-space dimension when finite) is the
  number of connected components of finite volume, since the normalised indicators
  `vol_g(X_j)^{−1/2} 1_{X_j}` … form an orthonormal basis", and the fourth Check of 3.7 is the
  witness `⊔_{j∈ℕ} S¹_j`.
- **F02 (module docstring): repaired.** `Suggested.lean` now reads "Every headline theorem of the
  roadmap that is statable at the pins is stated below" and adds "Three clauses of the README
  Summary are not statable at the pins, and nothing is stated in their place", naming the
  form-domain clauses of §3.6 and §4.2 and the identification of §3.8, each with the missing carrier.
- **F03 (attribution in a docstring): repaired.** The docstring of
  `exists_mem_domain_closure_eq_zero_iff` now ends "(Hide–Magee state the finite-area hyperbolic
  case; the general case is the kernel route of README §3.7)". "Yau" occurs nowhere in the package.

Pattern search. A possibly infinite "dimension" occurs elsewhere only in §3.8 (complex dimension of
`ker(A_ℂ − μ)` equals the real dimension of `ker(A − μ)`: true for Hamel and Hilbert dimension
alike) and in §1.6 (`dim ran P_A((−∞, λ))` in `ℕ ∪ {∞}`, where every infinite Hilbert and Hamel
dimension reads `∞`). Summary clauses neither stated nor named: none left (list in §7 below).
Attributions absent from README and manifest: every work named in a docstring (Teschl, Yafaev,
Pearson, Reed–Simon II and III, Kato 1957, Kato's book, Rosenblum, Braverman–Milatovic–Shubin,
Strichartz, Hide–Magee, Lax–Phillips, Iwaniec) is a manifest entry.

## Verified sound

### 1. Principles

No route-specific shortcut: Layer 1 is for every self-adjoint operator and every normalized
projection-valued measure, with no separability; §3.6 for every complete manifold, connected or
not, of every dimension including `0`; §4.4 for every `d ≥ 1`. No re-planned roadmap: the type
subspaces (UO-C03), the essential spectrum (UO-C02), forms and the Friedrichs extension (UO-D06) and
the free Laplacian (QuantumFoundations §8.2) are cited. Supply is one-directional (§5). No copied
passage (§8), no algorithm, no sorry'd data (all 7 definitions have bodies), no `set_option`, no
`lemma`, no `#eval`, `#print` or `#synth`.

### 2. Sources: the seeded sample, read at the locators

The author flagged no locator as unverified. Page markers of the `teschl` text are PDF pages; the
printed page is the marker minus 12 (teschl line 4313–4314: marker 116, running head 104).

| Target | Locator in the README | Read at | Result |
|---|---|---|---|
| 1.1 | Theorem 3.7, p. 96; separability §1.2 | teschl line 3983–3992, 1780 | uniqueness of `P_A` through the resolvent; the standing separability assumption is as the Conventions say |
| 1.1 laws | teschl line 4399–4411 | same | `dμ_{f(A)ψ} = |f|² dμ_ψ` and additivity over orthogonal cyclic subspaces |
| 1.2 | (3.83)–(3.84), Lemma 3.19 | teschl line 4388–4419 | separable case; the Borel-set clause is not restated, correctly |
| 1.4 | (3.79), Lemma 3.15, maximal vector, Lemma 3.16, (3.85) | teschl line 4315–4332, 4350–4366, 4420–4427 | as cited; (1), (2) marked as deduced here, (3) is the source's statement |
| 1.5 | Lemma 3.15, p. 104 | teschl line 4326–4332 | the one-measure fact only, as the README says |
| 1.7 | (12.3) p. 247, Lemma 12.1, (12.6), Theorem 12.2 | teschl line 10585–10620 | as cited (page number printed at line 10588) |
| 1.8 | (2.7), Lemma 2.1 | kato57 line 92–111 | bound `2π m² ‖A‖²` in the Schmidt norm, constant entering as `m²` |
| 1.9 | Theorem 1, (1.1)–(1.3) | kato57 line 21–35 | partial isometries with initial and final sets the two absolutely continuous subspaces; adjoint and conjugacy formulas |
| 1.9 | Def. 1.3, Thm 1.4, Thm 1.8, Lemma 1.9 | yafaev04 line 116–122, 136–140, 191–206 | as cited; the source asserts no isometry for `J ≠ 1`, nor does the README |
| 1.9 | Theorem 1.6; weak-to-strong step | rosenblum57 line 70–72, 80–95 | as cited |
| 2.1 | Theorem 4.10 at `n = 1` | teschl line 5044–5052 | as cited |
| 2.2, 2.3, 3.9 | Lemma 6.3, Theorem 6.4, p. 135; (2.68); relative compactness | teschl line 5683–5720, 3043–3046, 6358–6360 | hypotheses as cited; printed bound misprinted (Source issues), §2.3 states Kato's form and says so |
| 3.7 | Introduction | hm23 line 39–47 | eigenvalue `0`, simple iff connected, finite-area case only, as the README says |
| 4.5 | (1.1)–(1.6), Theorem 1.1 | kps26 line 20–50 | `d ≥ 2`, `l > d`, full-measure frequency set: as Layer 4's Examples say; README does not make it a target |
| 3.1, 3.8 | `grigoryan09` Ch. 3; `chavel84` Ch. I | — | uncertified: see Not verifiable; statements checked by computation (rows 10, 13) and against the pinned Green identities and R5c |
| further | Thm 4.10 remark, Cor. 4.11, Thm 4.12(i); Lemma 6.17 p. 145; Lemma 7.11 p. 170; (7.26); Thm 10.2 p. 222; Thms 2.12–2.13; Lemma 2.24; Cor. 4.6 | teschl line 5053–5069, 6277–6281, 7213–7217 (marker 182), 7137–7143, 9576–9584, 2914–2917, 2960–2961, 3282–3284, 4945–4946 | as cited |
| further | §2.1, min/max operators, Cor. 2.10; (2.8)–(2.10), zero mode; Thm 1.1, Cor. 1.3 | bms02 line 128–129, 151–157, 245–246; lp80 line 251–256, 279–284; hm23 line 60–66, 104–105 | as cited, including `M` connected in bms02, which §3.6 lifts componentwise |

### 3. Adversarial pass (values recomputed in this round)

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `IsSpectralMeasureOf` (1.1) | `A = 2` on `ℂ`, `z = i`, `P = δ₂`, `δ₃` | `(i − 2)⁻¹ = (−2 − i)/5` on both sides for `δ₂`; `δ₃` gives `(−3 − i)/10`; imaginary part `−1/5 < 0` as for `−∫(1 + s²)⁻¹dμ` | determines `P`; kernel sign pinned | none |
| 2 | `diag_spectralType_components` (1.2) | arbitrary `fac, fsc, fpp` with the three hypotheses; `M_x ⊕ ½`, `f = (1, 1)` | cross terms vanish because `|μ_{f,g}(B)|² ≤ μ_f(B)μ_g(B)` and the three measures are pairwise mutually singular (`μ_sc(S) = 0` on the countable carrier `S`); atoms of `μ_f` are those of `μ_pp`, so `μ_f.restrict(atoms) = μ_pp`; example: `Leb|[0,1] + δ_{1/2}`, parts `Leb|[0,1]`, `δ_{1/2}`, `δ_{1/2}` | holds for every such decomposition, without UO-C03 | none |
| 3 | `acSpectrum`, `perfect_acSpectrum_and_mem_iff` (1.4) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ diag(2)` at `t = 2`; isolated point | `[0,1]`; `∅` (Mathlib's `Perfect ∅` holds); `2 ∉ σ_ac`; an isolated `t` forces `μ_f(I ∖ {t}) > 0` for an absolutely continuous `f`, whose support point `s ≠ t` in `I` lies in `σ_ac`; `⇐` of the iff through `g = P(B_f)f` with `μ_g` the absolutely continuous part | holds in both directions | none |
| 4 | `Icc_subset_acSpectrum_iff` (1.5) | `M_x` on `L²([0,1] ∪ [2,3])`, `(a, b) = (0, 1)`, `(1, 2)`; fat Cantor `K` | `f = 1_J` gives `Leb(J) > 0`; `J = (1.2, 1.8)` has mass `0` and `1.5 ∉ σ_ac`; `K^ess ⊆ K` contains no interval | both sides agree; `a = b` excluded by `hab` | none |
| 5 | `essentialSpectrum` | `0` on `ℂ`, on `ℓ²`; `diag(1/n)` | `∅`, `{0}`, `{0}`; body equal to UO-C02's `spectrum ∖ discreteSpectrum` (`TauCetiRoadmap/OperatorTheory/UnboundedOperators/Suggested.lean` line 168–178) | same set, other namespace | none |
| 6 | `minMaxValue`, `minMax_principle` (1.6) | `diag(1,3,5)`; `ℋ = 0`; `0` on `ℓ²`; `−diag(n)`; `N ≤ D` on `(0,1)` | values `1, 3, 5, ⊤`; `c = 4`: `2 = 2`, `c = 3`: `1 = 1`; zero space: all `⊤`, `0 = finrank ⊥`; `0` on `ℓ²`: `Σ = 0`, `c < 0`: `0 = 0`; `−diag(n)`: count `⊤ ≠ 0`, excluded by `hγ`; `(n − 1)²π² ≤ n²π²` | holds; below `Σ` the eigenspace sum is finite-dimensional, so `finrank` is never a junk `0` | none |
| 7 | `pearson_tendsto`, `katoRosenblum` (1.9) | `J = 0`; `H₁ = 0`, `H₂ = 1` on `ℂ`; `diag(1/n²)` with `V = −diag(1/n²)`; `V = 0` | limit `0`; `μ_x = |x|²δ₀ ≪ Leb` forces `x = 0`; no absolutely continuous vectors on either side, `∅ = ∅`; `y = x`; hypothesis `(a)`: `⟪(H₁+V)ψ, φ⟫ − ⟪ψ, H₁φ⟫ = ⟪ψ, Vφ⟫` | holds; sign `U₂ t (U₁ (−t) x) = e^{itH₂}e^{−itH₁}x` with generator `i • A` (Stone at the pin) | none |
| 8 | Rosenblum's lemma (1.8) | `M_λ`, `x = m·1_{[0,1]}`, rank-one `C`; `x = |λ|^{−1/4}1_{[−1,1]}`; `V = diag((−1)^{n+1}/n²)` | `2π m² = 2π m²` (equality); truncation error `2·2·m^{−2} = 4/m²`; energy of `|V|^{1/2}` is `Σ 1/n² = π²/6`, the nuclear gauge (sum of singular values at the pin) | holds, `2π` pinned | none |
| 9 | `katoRellich_lowerBound_hasCore` (2.3) | `sup_{s ≥ γ} |s|/(s − μ)` for `μ < 0` and `μ ≥ 0`; scalar `A = λ ≥ γ`, `V = −(a + b|λ|)` | `max(1, |γ|/d)` in both cases; `a/d + b·max(1, |γ|/d) < 1` iff `d > max(a/(1−b), a + b|γ|)`; scalar minimum `γ − a − b|γ|` at `λ = γ` | route gives the stated bound; second branch attained | none |
| 10 | `complexLaplacian`, Green (3.1) | `yˢ` on `ℍ`; `e^{inθ}`; pairing | `−y²·s(s−1)y^{s−2} = s(1−s)yˢ`; `2πn² = 2πn²`; `(a − ib)(c + id) = ac + bd + i(ad − bc)` matches the stated pairing | sign `−div grad` and conjugate-linearity pinned | none |
| 11 | `gaffney_isSelfAdjoint_closure` (3.5, 3.6) | cutoff estimates; `(0,1)`; dimension `0` | `Re⟪χ²u, Δu⟫ ≥ ½∫χ²|du|² − 2 sup|∇χ|²‖u‖²`, hence both displayed bounds; `|∇χ_k| ≤ 2·(2/k)`; on `(0,1)`: `1 ≤ (4/k)(1/2)` fails for `k > 2`, and `e^{±x} ∈ ker(Δ₀† + 1)`; in dimension `0` the chart volume is `Module.finBasis.addHaar` on a point, mass `1` (counting measure) | holds | none |
| 12 | kernel and vocabulary (3.7), the F01 repair | `ℝ`; `S¹`; point; `ℝ²/ℤ²`; `⊔_ℕ S¹` | `ker = 0`; constants; `λ₁⁺ = λ₁ = +∞`; `λ₁ = ⋯ = λ₄ = 4π²`; `‖Σ c_j 1_j‖² = 2π Σ|c_j|²`, Hilbert dimension `ℵ₀`, Hamel `2^ℵ₀`, every `n²` of infinite multiplicity so `σ_ess = σ`, all `λ_k = 0`, `λ₁⁺ = 1` | repaired text and new Check agree with 1.6, UO-C02 and the last item of 3.7 | none |
| 13 | compact case (3.8, 3.9) | circle; one point; `V = 1_{[0,π)}` | real and complex eigenspaces of `1` both of dimension `2`; `T = i`, `T* = −i`, `T − T* = 2i = 2i·TT*`, in general `(B − is)⁻¹[(B + is) − (B − is)](B + is)⁻¹`; smooth eigenfunction forces `u(0) = 0`, then `(1 − λ)u′(0) = −λu′(0)`, so `u = 0` | holds | none |
| 14 | `IsStandardCuspEnd`, `Ici_quarter_subset_essentialSpectrum` (3.10) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `∂_y²(y^{1/2}f) = y^{−3/2}(f″ − f/4)`, so `Δ = y^{1/2}(1/4 − ∂_r²)f`; `‖u_n‖² = w n‖ψ‖²`; residual `−e^{itr}(2itψ′/n + ψ″/n²)`; supports `(2^{j+1}, 3·2^j)`, `3·2^j < 2^{j+2}`; area `w/a`; restricted metric is the scoped instance `Manifold.instRiemannianBundleOpen` | holds | none |
| 15 | change of resolvent point (4.3) | spectral value `s`; pin identity at `λ = −1`, `μ = i` | `(s+1)⁻¹(1 + (1+i)/(s−i)) = (s−i)⁻¹`; `R(−1) − R(i) = (i+1)R(−1)R(i)` gives the displayed identity; bracket modulus `(s+1)/√(s²+1) ≤ √2`; sign slip gives `2 − i` at `s = 0` | holds | none |
| 16 | `schrodinger_isSelfAdjoint_closure` (4.1–4.4) | `V = c`; `d = 0`; `d = 1`, `V = −1_{[−1,1]}`; Gaussian | `σ = [c, ∞)`, bound tight; `d = 0`: `σ_ess = ∅`, excluded by `hd`; `k = 0.739`: `k tan k = 0.673`, `κ = 0.674`, `E = −0.454`; `‖u″‖² = 3π²/√2 = (4π²)²·3/(16π²√2)`; `N(u) ≤ ‖u‖ + (4π²)⁻¹‖Δu‖`; density `e^{−λ/(2π)}/(2π√λ)` of mass `2^{−1/2}`, equal to QuantumFoundations §8.2's formula at `n = 1` | holds | none |
| 17 | bottom of the spectrum (2.1) | `e^{−πx²/n²}` | `‖u‖² = n/√2`, `‖u′‖² = π/(n√2)`, quotient `π/n² → 0` | holds | none |
| 18 | module docstring, the F02 repair | the three unstatable clauses | no `Friedrichs`, form domain or square-root domain in any Tau Ceti file; `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` has inequalities only; no essential spectrum, wave operator or essential self-adjointness at either pin | the carriers are absent | none |

Context and generality. The file has no `variable` block; every declaration carries its binders. The
18 elaborated types of `signatures.md` agree with the README statements: `[CompleteSpace H]`
wherever a projection-valued measure or self-adjointness occurs; the three manifold theorems carry
`[I.Boundaryless]`, `[CompleteSpace M]`, `[SecondCountableTopology M]`, `[IsRiemannianManifold I M]`;
the smoothness index elaborates as `∞` in `ContMDiff I 𝓘(ℝ, ℂ) ∞` and `IsManifold I ∞ M` (smooth,
not analytic). I changed no file, so no signature changed.

### 4. Duplication audit

At the pins (by object): no essential spectrum, absolutely continuous spectrum, wave operator,
Kato–Rosenblum, Weyl criterion or essential self-adjointness of a Laplacian in Mathlib or Tau Ceti
(grep of both: 0 files). Kato–Rellich at the pin
(`TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean` line 118) gives self-adjointness
only; the min–max at the pin (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` line 251) is
finite-dimensional. The 18 leads of `library-matches.md` have no same-name hit and none proves a
target.

Library names, opened at the pins: `TauCeti.ProjValMeasure` with fields `proj`, `diag`,
`inner_proj`, `proj_univ` (`.../ProjValMeasure/Basic.lean` line 91–106), `diag_univ` (299),
`proj_mul_comm` (200), `norm_sq_proj_apply` (275), `integral` (`.../Integral.lean` line 218);
`LinearPMap.resolventSet`, `spectrum`, `resolvent`, `resolvent_sub_resolvent`
(`.../LinearPMap/Resolvent/Basic.lean` line 129, 140, 169, 280); `LinearPMap.smulSub`
(`TauCeti/LinearAlgebra/LinearPMap/SmulSub.lean` line 39, `x ↦ c • x − A x` on `dom A`);
`LinearPMap.IsRelativelyBounded` (`.../RelativeBound.lean` line 56, with `domain_le`);
`IsReducing.isSelfAdjoint_restrict` (`.../Reducing.lean` line 144); `StronglyContinuousGroup`,
`IsUnitary`, `complexGenerator` (`.../Group/Basic.lean` line 74, `.../Group/Unitary.lean` line 107,
249) and Stone's theorem (`.../Group/Stone/Unbounded.lean` line 106); `nuclearENorm` (sum of
singular values, `.../Nuclear/Basic.lean` line 53) and
`isCompactOperator_of_nuclearENorm_ne_top` (153); `hilbertSchmidtEnergy`, `_indep`
(`.../HilbertSchmidt/Basic.lean` line 89, 150), `isCompactOperator_of_hilbertSchmidtEnergy_ne_top`
(`.../Columns.lean` line 257); `riemannianVolume` (`.../VolumeDensity/Volume.lean` line 82) with
its locally finite (179) and open-positive (`.../Support.lean` line 37) instances;
`laplaceBeltrami`, `divergence` (`.../Riemannian/Laplacian.lean` line 238, 55); the two Green
identities (`.../DivergenceTheorem.lean` line 312, 289); `contMDiff_mgradient`,
`HasCompactSupport.mgradient` (`.../Gradient/Basic.lean` line 254, 116);
`IsLocalRiemannianIsometry` (`.../Isometry/Local.lean` line 70); `UpperHalfSpace`, `contMDiff_coe`
(`.../UpperHalfSpace/Basic.lean` line 91, 183); `Manifold.instRiemannianBundleOpen`
(`.../Restriction.lean` line 209, scoped instance at 215); `HyperbolicMetric`; `Wkp`, `W1p`
(`TauCeti/Analysis/Sobolev/Wkp/Basic.lean` line 145, `W1p/Basic.lean` line 372);
`Complexification` and its Hilbert instances (`.../Complexification.lean` line 82, 136, 159); the
compact-resolvent criterion and eigenbasis (`.../CompactResolvent.lean` line 69,
`.../Eigenbasis.lean` line 113); `IsSelfAdjoint.isFormalAdjoint` (`.../SelfAdjoint.lean` line 105).
Mathlib: `TemperedDistribution.MemSobolev` (`Mathlib/Analysis/Distribution/Sobolev.lean` line 153),
`memSobolev_iff_exists_smulLeftCLM_fourier` (222), `MemSobolev.laplacian` (348);
`laplacian_eq_fourierMultiplierCLM` (`.../FourierMultiplier.lean` line 107, 208);
`Lp.fourierTransformₗᵢ` (`Mathlib/Analysis/Fourier/LpSpace.lean` line 51);
`Lp.toTemperedDistribution`; `LinearPMap.HasCore`, `isClosable_iff_exists_closed_extension`
(`Mathlib/Topology/Algebra/Module/LinearPMap.lean` line 141, 132); `IsFormalAdjoint`,
`le_adjoint`, `adjoint_isClosed`, `mem_adjoint_domain_of_exists`, `adjoint_apply_of_not_dense`
(`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean` line 73, 194, 332, 163, 172); the
Lebesgue-decomposition lemmas (`.../Decomposition/Lebesgue.lean` line 106, 122, 404, 522);
`Perfect`, `Preperfect` (`Mathlib/Topology/Perfect.lean` line 85, 78); `IsRiemannianManifold`
(`Mathlib/Geometry/Manifold/Riemannian/Basic.lean` line 80); `IsCompactOperator.comp_clm`,
`isCompactOperator_of_tendsto` (`.../Compact/Basic.lean` line 271, 459); `LinearMap.toPMap`;
`LinearMap.IsSymmetric.eigenvalues`, decreasing by `eigenvalues_antitone`
(`Mathlib/Analysis/InnerProductSpace/Spectrum.lean` line 277, 309). All exist where the contracts
say. The 18 backticked names the README attributes to this roadmap are exactly the 18 declarations
of `Suggested.lean`.

Overlap facts (`scratch/overlaps.md`, each checked): no other open pull request changes this
roadmap; no cited id is dropped by an open pull request (all 29 cited SA ids are also present at the
head of the open revision of SelfAdjointSpectralTheory); none is defined only by an open revision;
not a second copy (main has no folder of this name; the board index lists no package of this name
elsewhere). `Suggested.lean` shares no fully qualified name with another roadmap
(`essentialSpectrum` lives in this roadmap's namespace, and the README says UO-C02 owns the object).

Maintainer notes, each checked at these heads:

1. Holds of UO-E06 (UnboundedOperators §5.7: `L² + L^∞` on `ℝ³`, no `L^p` or Kato class). The
   README says so in "Unbounded potentials" and "Not in this roadmap": no finding.
2. Holds of UO-C03 (§3.3: restriction self-adjointness listed "in the finite-control-measure
   case"). The README says so and supplies §1.3 (scope, contract and §1.3 route): no finding.
3. Holds of UO-C02 (§3.2 names Lemma 6.17 as an input, with no Weyl criterion among the items to
   prove). Declared as `gap:weyl-criterion`: no finding.
4. Addressed: §4.3 states the passage from `−1` to `i`; recomputed in row 15: no finding.
5. Holds of UO-A02 (§1.2 proves the resolvent formula for the measure of a given `A`). Declared as
   `gap:spectral-integral-resolvent`: no finding.
6. Refuted at this head: the contract lists SA-C86 and SA-E30 ("SA-C86 (compact normal spectral
   decomposition…)", "SA-E30 (spectral projections commute with the generated group, used in 1.7)").

The ownership decisions of the notes are followed, and §4.4 says that in dimension three its
self-adjointness and `C_c^∞`-core clauses are the case `V₂ = 0`, `V_∞ = V` of UO-E06.

Overlap check: read UnboundedOperators (§1.1, §1.2, §2.3, §3.1–3.3, §4.7, §5.4, §5.7 and its Suggested.lean), SelfAdjointSpectralTheory (main and its open revision), VariationalMethods (4.4, 5.1), QuantumFoundations (§8.2, §9.5), CongruenceSpectralGap (§0.2, §0.6), AutomorphicSpectralTheory (§1.16a), RelativisticQuantumFieldTheory (grep); essential spectrum: UnboundedOperators UO-C02; type subspaces: UO-C03; free Laplacian on `H²(ℝⁿ)`: QuantumFoundations §8.2; `−Δ + V` with `V ∈ L² + L^∞` on `ℝ³`: UO-E06, bounded `V` in every dimension: this roadmap; essential self-adjointness on `Γ(N′)\ℍ`: CongruenceSpectralGap §0.2, on every complete manifold: this roadmap; nothing has two owners.

### 5. Supplier-order audit

Dependency check output:

    depcheck: 240 roadmaps, 2260 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The merge order has this roadmap at line 221, directly after
QuantumFoundations (220), its latest supplier. No forbidden supplier is cited.

Citations resolved in this round. On main: SelfAdjointSpectralTheory SA-B44, B45, B85, C12, C14,
C15, C19, C25, C28, C39, C44, C52, C54, C86, D02, D12, D18, D22, E01, E05, E08, E09, E11, E13, E26,
E29, E30, E44, E47 (titles read for C19, E44, E30, C86, E47, E08, E11, E13, D22, E05, C54, C39, D12,
C12); UnboundedOperators UO-A01, A02, A06, A07, B03, C01, C02, C03, D06 (with its "real unbounded
spectral restriction" and the complexification on `WithLp 2 (TauCeti.Complexification H)`), E01,
E04 (`V(A − i)⁻¹` compact with `dom A ⊆ dom V`), E05, E06; VariationalMethods 4.4, 5.1 (indexing
from `0`, junk values); RiemannianGeometry R5c, R7.8 item 8, and its scope sentence that
GeometricTopology §7.1 owns curvature `−1` (the previous round could not locate it; it is at
`TauCetiRoadmap/RiemannianGeometry/README.md` line 55); GeometricTopology §7.1; ComplexKahlerGeometry
K5a and K5a.ComponentwiseCompact; HilbertModules H6; PDE §1.2 (A2), §1.3 (A3), §6.3 (F26);
OperatorIdeals OI-A35–A40, OI-B29–B36, OI-C14; DifferentialGeometry 12.2–12.5;
PseudodifferentialOperators P1.0; SmoothBundlesConnections B2.2; FuchsianOrbifolds Layer 3;
ComplexCurveModuli D6; Completed/HopfRinow Layers 0–4. At open heads: QuantumFoundations §8.2 (every
`n ≥ 1`, both cores, intertwining, `σ = σ_ac = [0, ∞)`, the density formula) and §9.5;
CongruenceSpectralGap §0.2 (`N′ = 3N`, Gaffney's argument, kernel the constants) and §0.6;
MaassForms §0.1; AutomorphicSpectralTheory §1.16a and §§4.1–4.4. All found, with the content the
contracts assume.

Declared gaps. Both have the same slug in `design/plan.json` (`gaps`) and under "Exact supplier
contracts" in the supplier's subsection, a named supplier section (UO-C02 §3.2; UO-A02 §1.2), and a
single `needs` statement with hypotheses; neither asks for what exists. They are contracts, not
findings.

No notion was moved down from a later roadmap.

### 6. Shape and completeness

Title, Summary, Scope and ownership, Conventions (each with a computed witness), Exact supplier
contracts, How to read the build, four layers each ending in Examples and Dependencies, Downstream
consumers, Worked examples, References. Every definition has at least three discriminating Checks
(smallest counts: 3, in §1.3, §1.5, §1.7, §2.2, §3.1–3.4, §4.1, §4.5). Every theorem has its
hypotheses in the sentence and a locator or the words "deduced here" / "proved here". The layer
order is forced: Layers 3 and 4 need 1 and 2, which are independent; no layer is named after a
source. Greps of README and Lean for LaTeX delimiters, process words, pull-request numbers, machine
paths, numbering tables, `lemma`, `set_option`: 0 hits ("lemma" occurs only in "Glazman's lemma" and
"Rosenblum's lemma").

Elaboration: `lake env lean packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` from the
content checkout exits 0 with 11 warnings, all `declaration uses 'sorry'` (lines 86, 112, 122, 153,
171, 190, 214, 244, 271, 315, 341). Imports: `import Mathlib` and 11 `TauCeti.*` modules, each
present at the pin and each used.

### 7. Headline theorems and padding

Headlines of the Summary and where they stand: Lebesgue decomposition of the type components
(`diag_spectralType_components`); structure of `σ_ac` (`perfect_acSpectrum_and_mem_iff`); interval
criterion (`Icc_subset_acSpectrum_iff`); min–max (`minMax_principle`); Pearson (`pearson_tendsto`);
Kato–Rosenblum (`katoRosenblum`); lower bound and cores (`katoRellich_lowerBound_hasCore`, the
bounded case being `b = 0`); Gaffney–Chernoff–Strichartz (`gaffney_isSelfAdjoint_closure`); kernel
(`exists_mem_domain_closure_eq_zero_iff`); cusp threshold (`Ici_quarter_subset_essentialSpectrum`);
`−Δ + V` on `ℝ^d` (`schrodinger_isSelfAdjoint_closure`, whose case `V = 0` contains
`σ_ess(H₀) = [0, ∞)`). Not statable and named in the docstring: the form-domain clauses of §3.6 and
§4.2, the identification of §3.8. The Schwartz core of §4.4 is not a separate declaration and should
not be: `C_c^∞ ⊆ 𝒮 ⊆ H² = dom H_V`, so it follows from the stated theorem in one step.

One-tactic probe on a scratch copy, all 11 sorried theorems, each tried with
`first | rfl | trivial | simp | infer_instance | simp_all | (intros; rfl) | (intros; simp_all)`:
none closes (11 errors, one per site). No declaration restates a definition, mirrors a Check or
computes a value. No padding.

### 8. Copyright, licences and scope

Wording: 24 passages set beside 8 sources (the locators of the table in §2 and, beyond them, the
essential closure and the maximal spectral vector of §1.4, the wave-operator definition of §1.7, the
minimal and maximal operators of §3.2–3.3, the gap statement of Weyl's criterion, the route of §2.3,
the docstring of `pearson_tendsto`). Nothing shared beyond formulas and standard names; the routes
of §2.3 (real shift with explicit constants) and §4.3 (explicit Hilbert–Schmidt energy) are not the
source's.

Arrangement: `teschl` has 40 of 97 source mentions in the README body. Its chapters: 2
self-adjointness, 3 spectral theorem, 4 applications, 5 dynamics, 6 perturbation, 7 free operator,
10 one-particle operators, 12 scattering. Layer 1 draws on §3.1–3.3, §4.3–4.4 and §12.1 together
with Kato, Rosenblum, Pearson and Yafaev; Layer 2 on §6.1 and Theorem 4.10; Layer 3 on none of it;
Layer 4 on §7.2 and §10.1. No layer or run of sections maps one to one onto a run of chapters; the
order inside Layer 1 is forced by its *Needs:* lines (1.2, 1.3 need 1.1; 1.4 needs 1.1–1.3; 1.5
needs 1.2, 1.4; 1.9 needs 1.7, 1.8).

Reuse: no table, figure, exercise list or data taken from a source. I know of no public
formalisation whose names and statements the Lean file follows.

Source independence: 24 passages compared with 8 sources, none shared; largest share teschl, 40 of 97 locators; contents compared with teschl: independent.

## Not verifiable

- `grigoryan09` (3.1, 3.4, 3.5, 3.6), `chavel84` (3.8), `gaffney54` (3.5), `strichartz83`,
  `chernoff73` (3.6), `pearson78`, `rs3` (1.7, 1.9), `rs1` (1.1), `rs2` (2.3, 3.6, 3.9, 4.1, 4.4),
  `kato76` (2.3, 1.9), `cfks87` (4.4), `iwaniec02`, `lp76` (3.10, Downstream consumers): recorded as
  uncertified in the manifest, so their locators were not read. Of the sampled targets, 3.1 and 3.8
  have no read locator; their statements were checked by computation and against the pins and R5c.
  Kato's form of the bound in §2.3 rests on the resolvent computation of row 9, not on a read text.
- The published numbering of the arXiv copies `bms02`, `hm23`, `yafaev04`, `kps26` against the
  journals: not compared.
- `kps26` is an OCR text; formulas (1.3)–(1.6) are legible only in outline (kps26 line 30–38).

## Source issues

- **Misprint** in teschl at Theorem 6.4, (6.3), printed page 135: the source says the lower bound is `γ` minus the maximum of `a|γ| + b` and `b/(a − 1)`, a quotient that is never positive for `a < 1`; it should be the maximum of `a|γ| + b` and `b/(1 − a)`; affects a stated result.

## For the human reviewers

- Licence: `teschl`, the source with the largest share of locators (40 of 97), is read from the author's online edition on a university page (`sources.toml`, `licence_class = "author-page"`); the printed book is an AMS volume.
- Licence: `kato57`, `rosenblum57` and `lp80` are read from publisher-hosted open copies (`sources.toml`, `licence_class = "publisher-open"`); no licence text was read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "35f3419d98b16a0eeba70aa18eb9f01fdec1260a", "job": "REV-PKG-SchrodingerOperatorsAndSpectralTypes~2", "model": "fable", "worker": "chris-x80"} -->
