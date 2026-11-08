# Review of CalibratedGeometry (pull request #946 at 103e2a8)
**Verdict:** accepted

:robot: Independent AI review of the repaired head, a full review (183 changed lines since `d570d36`). No finding. The worktree was not changed. The worker's gate passes at this head (every scanner, the dependency check and the targeted build); the five P3 findings of the previous review are all repaired, as the table below shows. The roadmap folder is ready for a human's final approval.

## Repair of the previous review's findings

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 (P3) binomial Check | `README.md:398–401`: the two 1-forms Check now ends "while the binomial bound gives `binomial(2,1) = 2`"; the Kähler Check ends "comass 1 (the frame `(e₁,ie₁,e₂,ie₂)` evaluates to 1), while the binomial bound gives `binomial(4,2) = 6`" | Repaired; `binomial(4,2) = 6` and the frame value 1 recomputed below. |
| R02 (P3) HeegaardFloer F1.4 / F2.6c | `README.md:81–88`: Maslov index of paths and its comparison with `TauCeti.TotallyRealLoop.maslovIndex` cited to HeegaardFloer F1.4; the degree-two compatible-triple inequality assigned to F2.6c; `README.md:160–163` the native loop invariant in the Tau Ceti contract; `README.md:779–784` and the Check `README.md:797–800` compare the phase class with the native `det²` loop degree (unit circle: phase class 1, index 2) | Repaired; HeegaardFloer `README.md:1941` on main is "3.4 Maslov and Conley–Zehnder conventions and determinant lines (F1.4)" and consumes `maslovIndex`; `README.md:2461` ff. (F2.6c) proves `ω(v,w) ≤ |v∧w|_g` with the equality case `w = av + bJv`, `b > 0`. The native invariant's description (`ρ(L₀, A L₀) = det A / conj(det A)`, rotation phase `e^(2inθ)`) matches `TauCeti/LinearAlgebra/TotallyReal/Maslov/Phase.lean:22, 43, 112–115` at the pin. |
| R03 (P3) GeometricCurrents consumer | `README.md:1056–1061`: GeometricCurrents G1–G3 and G6 listed with the contracts 1.2–1.3, 1.4, 2.3, 2.4 and 3.1–3.2 | Repaired; GeometricCurrents `README.md:65, 81, 88, 92, 426–445, 964–975, 991–999` on main read exactly those. |
| R04 (P3) locators and manifest | `README.md:256, 288, 314, 367, 390, 442, 538, 615, 638, 711, 790, 810, 814` carry theorem and printed-page locators into Harvey–Lawson; `Suggested.lean:81, 136, 173` likewise; `packages/CalibratedGeometry/sources.toml` records Munkres1966EDT (waived), McLean1998, Joyce2001SLLectures, Zust2025Products, Campanato1963 (certified) and HarveyLawson1982 (uncertified) | Repaired; every locator verified below against the cached text. |
| R05 (P3) house shape and order | `README.md:623, 666`: "so the comass statement needs `1 ≤ n`" / "`r ≤ n`"; `README.md:31`: "Layers 3, 4, 5 and 6"; `README.md:892` is 6.3 (regularity), `README.md:974` is 6.4 (McLean), with `README.md:849, 1000, 1027, 1030, 1051` updated | Repaired; the Lean docstring (`Suggested.lean:11–27`) names the unstatable headlines of Layers 3, 4, 5 and 6. |

## Verified sound

**Scope, principles and mechanics.** Read all 1085 README lines and all 192 Lean lines at `103e2a8`, the previous review and the change set. The folder is new on main (no CalibratedGeometry roadmap is re-planned); `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CalibratedGeometry'` is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. No route-specific shortcut, copied passage, computational algorithm, `set_option`, sorry'd data, admitted `example`, `lemma`, LaTeX delimiter, process word or pull-request number (grep of both files). The worker's gate reports every check passing. The dependency check, run independently with `--movable` against the merge order:

```text
depcheck: 237 roadmaps, 2107 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every supplier named in a `*Needs:*` line or supplier contract is on main or earlier in the order (SmoothBundlesConnections and PseudodifferentialOperators are on main now; LieGroups is `RepresentationTheory/LieGroups` on main, `README.md:275` "Layer 2: the closed-subgroup (Cartan) theorem"); FukayaTheory (open head) and GeometricCurrents (main) are consumers only. No declared gaps and none needed: every consumed section exists where it is cited.

**Elaboration.** `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean`: exit 0, exactly eight `sorry` warnings (lines 52, 59, 83, 89, 138, 146, 175, 184), no other output. The worker's elaborated signatures (16 declarations) were compared with the README statement of each: `FiniteDimensional ℝ E` on both Layer-1 theorems; `1 ≤ n` on `norm_standardKahlerForm`, `norm_standardSpecialLagrangianForm`, `specialLagrangianFrame_iff`; `r ≤ n` on `norm_kahlerPowerForm`; no section binder lost. The three real-bodied forms (`standardKahlerForm`, `kahlerPowerForm`, `standardComplexVolume`) and the four simple definitions (`frameVolume`, `IsCalibratedFrame`, `kahlerBivector`, `complexRealFrame`) are exactly what the headlines need; imports are the single `import Mathlib`.

**Padding probe.** On a scratch copy every sorried theorem was replaced by `first | (simp; done) | rfl | infer_instance | (aesop; done) | sorry`: all eight fell through to `sorry` (eight `sorry` warnings, the `done` branches reported never executed). None restates a definition, mirrors a Check or computes a value; the degree-two pair is the r = 1 instance of the all-degree pair but carries the sharper equality form `w = i v`, which is a distinct headline. The `hn : 1 ≤ n` of `specialLagrangianFrame_iff` is unused by the statement's truth (n = 0: both sides are `θ ∈ 2πℤ`): a note, not a finding.

**Headline coverage.** README headlines (`README.md:16–28`): comass = native norm and the frame-volume inequality (stated); the fundamental theorem of calibrations (not statable: named in the docstring, no forms on manifolds); the all-degree Wirtinger inequality and its equality classification (stated), the Kähler-submanifold minimization (named); the special Lagrangian comass and equality-plane classification (stated), minimality of special Lagrangians (named); McLean's theorem and the second variation/Jacobi identification (named with their missing carriers). No statable headline is absent and none is forced through a stand-in.

**Sources (seeded sample and every flagged locator).** All five readable works were read in the cache: Harvey–Lawson (institutional archive copy, cited by the roadmap as uncertified; read here for the locator check only), McLean1998 (`56cb6eb6…`), Joyce2001SLLectures v3 (`a35a06d6…`), Zust2025Products v2 (`304c90db…`), Campanato1963 (`ef235123…`). Munkres1966EDT is waived.

| Locator in README / Lean | Where found in the text | Supports the statement as written? |
|---|---|---|
| HL II.(3.1), p. 56 (1.1, 1.3) | line 370, before the p. 57 header at line 372 | yes: comass as the supremum over unit simple p-vectors |
| HL (3.3), p. 57 (1.5) | line 380 | yes: the contact set `{ξ : ⟨φ,ξ⟩ = 1}` |
| HL Lemma II.3.5, p. 57 (1.2, 2.2) | line 393 | yes: `T(φ) ≤ M(T)` with equality iff T is a positive φ-current; the smooth-immersion instance is 2.2 |
| HL Theorem II.4.2, p. 59 (3.1) | line 450, after the p. 59 header at line 438 | yes: homologically mass-minimizing, with the same bounding hypothesis `T − T′ = ∂S` |
| HL Theorem II.6.11 and Lemma II.6.13, p. 70 (4.1, 4.2) | lines 807 and 814, before the p. 71 header at line 827 | yes: the Wirtinger identity and the normal form with angles `θ_j` |
| HL Proposition II.7.10, p. 76 (1.6) | line 1004, after the p. 76 header at line 991 | yes: comass one and `G(φ∧ψ) = {ξ∧η : ξ ∈ G(φ)}` for a unit decomposable factor |
| HL Theorem III.1.10 and Corollary III.1.11, p. 89 (5.1) | lines 1412, 1417, after the p. 89 header at line 1409 | yes: comass one; Lagrangian plus the imaginary equation for ±ξ special Lagrangian |
| HL Theorem III.2.3, p. 91 (5.4) | line 1493, between the p. 91 (1469) and p. 92 (1502) headers | yes: gradient graphs, `Im det(I + i Hess F) = 0` with the correct orientation |
| HL Theorem III.2.13, p. 95 (5.4) | line 1599, after the p. 95 header at line 1598 | yes: the linearization at a solution is elliptic |
| HL Proposition III.2.17, p. 96 (5.3) | line 1647, after the p. 96 header at line 1630 | yes: Lagrangian and stationary iff special Lagrangian for some phase |
| McLean lines 27, 32, 37–48, 43 (1.1, 3.1, 4.2, 4.3) | lines 26–49 | yes |
| McLean Lemma 3.1 line 448; Prop. 3.2 line 483; Cor. 3.3 and Rem. 3.4 lines 486, 493 (5.2, 5.1, 6.1) | as cited | yes |
| McLean lines 450–462 (5.3); 539–550 (6.1); Lemma 3.12 line 580; proof line 572 (6.1); lines 589–595 (6.2) | as cited | yes (the (3.5)–(3.7) degree slip is under Source issues) |
| McLean Thm 3.6 line 510, Cors 3.7–3.10 lines 519, 527, 530, 532 (6.4); Thm 3.13 line 598 (p. 723); Cor. 3.14 line 603 (6.5) | as cited | yes |
| Joyce Def. 2.1 lines 53, 58, 62 (1.5, 2.1, 2.2); line 76 (phase convention); line 90 (Lean docstring); Prop. 2.3 line 96; Prop. 2.4 line 107 (5.1, 5.2); Thm 5.1 line 678 (6.4) | as cited | yes: `SU(m)/SO(m)` of dimension `(m²+m−2)/2`; `ω′|L = 0` and `Im Ω′|L = 0` |
| Züst Thm 1.2 line 59; Cor. 1.4 p. 2 line 74; `294/256` line 76 (1.6) | lines 59–61, 74–76 (page 2 spans lines 47–89) | yes |
| Campanato Teorema I.2, printed p. 183, line 224 (6.3) | line 224, after the p. 183 marker at line 220 (OCR garbled) | yes, as far as the OCR allows (see Not verifiable) |

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; paths relative to the library repositories):

| Declaration | File:line | What it gives / limit |
|---|---|---|
| `ContinuousAlternatingMap.norm_def`, `norm_constOfIsEmpty`, `norm_compContinuousLinearMap_le` | `Mathlib/Analysis/Normed/Module/Alternating/Basic.lean:194, 310, 432` | infimum of product-norm bounds (not a frame supremum: 1.1 is the target); k = 0 value; pullback bound |
| `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` | `Mathlib/Analysis/Normed/Module/Multilinear/Basic.lean:1038` | equality along a surjective isometry |
| `LinearMap.normDet`, `normDet_sq_eq_det_gram`, `normDet_eq_zero_iff_ker_ne_bot` | `Mathlib/Analysis/InnerProductSpace/NormDet.lean:69, 303, 111` | the `if` body gives 1 on a zero-dimensional domain (empty determinant) and 0 on a non-injective map, as 1.2 says |
| `Matrix.gram`, `Matrix.det_gram_ne_zero_iff_linearIndependent` | `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:39, 125` | vanishing exactly on dependent frames |
| `exteriorPower.alternatingMapLinearEquiv`, `inner_ιMulti_ιMulti` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:212`; `Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean:127` | `[FiniteDimensional ℝ E]` required, as the contract says |
| `Submodule.pow_mem_pow`; `LinearMap.continuous_of_finiteDimensional` | `Mathlib/Algebra/Algebra/Operations.lean:358`; `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:282` | used by `kahlerPowerForm` |
| `ImplicitFunctionData.contDiffAt_implicitFunction` | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41` | needs the derivative and complement data supplied (6.4 says so) |
| `Matrix.detRowAlternating`; `ContinuousAlternatingMap.restrictScalars`; `IsCoercive.continuousLinearEquivOfBilin` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:53`; `Mathlib/Topology/Algebra/Module/Alternating/Basic.lean:447`; `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:101` | present |
| `TauCeti.stdSymplecticForm`, `stdSymplecticForm_apply` | `TauCeti/Geometry/Symplectic/StandardCompatible.lean:83, 90` | `⟪u.1,w.2⟫ − ⟪u.2,w.1⟫`; the product J is `(x,y) ↦ (−y,x)` (line 16), matching `R(iv) = (−Im v, Re v)` |
| `SymplecticForm.transport` | `TauCeti/Geometry/Symplectic/SymplecticTransport.lean:63` | `BilinForm.congr e`, i.e. evaluation through `e.symm`, so `transport R.symm` evaluates at `(Rv, Rw)` as 5.2 says |
| `AlmostComplexStructure.transport`, `SymplecticForm.IsLagrangian`, `complexAssociatedForm`, `Compatible.hermitianCore`, `complexModule` | `Transport.lean:59`; `Lagrangian/Basic.lean:99` (`ω.orthogonal L = L`); `Hermitian.lean:78, 260` (`⟨v,w⟩ = ω(v,Jw) + iω(v,w)`, conjugate-first); `Complex/Module/Basic.lean:79` | as the contract says |
| `alternatizeBilinCLM` | `TauCeti/Analysis/Normed/Module/Alternating/Bilinear.lean:43, 55` | `B(v₀,v₁) − B(v₁,v₀)`, hence `2B` on alternating B: 5.2's warning is right |
| `TauCeti.TotallyRealLoop.maslovIndex`, `maslovPhase`, `maslovPhase_map_lsmul`, `maslovIndex_map`, `maslovIndex_prod` | `TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean:103`, `Phase.lean:112, 205`, `Map.lean:61`, `Prod.lean:183` | degree of the `det A / conj(det A)` phase loop; rotation by z has phase `(z / conj z)^n` |

Mathlib and Tau Ceti contain no comass, calibration, Kähler power or special Lagrangian object (grep of both pins).

**Resolved supplier and consumer citations** (opened on main `a0ad405` or at the supplied head):

| Supplier | Resolved at | Result |
|---|---|---|
| SuccessiveMinima 0.1.2 `hermitian_gram_hadamard` | `README.md:188–191` | `0 ≤ Re det Gram(v) ≤ Π‖v_i‖²`, any finite family, infinite-dimensional ambient allowed, n = 0 allowed |
| DifferentialGeometry 0.3, 1.2, 5.1–5.4, Layer 6, 8.3 (`SmoothSimplex`, `exists_smoothSimplex_homotopicRel`, hypotheses `T2Space`, `SigmaCompactSpace`, finite dimension), 8.4, 9.3, 12.1, 12.4, 12.5 | `README.md:284, 320, 507–524, 782, 836–848, 872, 915, 923, 930` | present; 8.3's hypotheses are carried in Conventions |
| AlgebraicTopology Stage 2, Stage 3 item 1, Stage 6.3 | `README.md:326, 471–481, 946, 74–89` | present |
| RiemannianGeometry R1, R5a.1 `volumeVariation_isContDiff`, R5a.2 | `README.md:179, 1067–1069, 1103` | present |
| GeometricTopology Layer 1; smoothing-and-triangulation item 1 | `README.md:177, 930–944` | boundaryless Whitehead triangulation only; the relative ordered version is 2.4 here |
| ComplexKahlerGeometry K1, K2, K4, K5a, K5b.0, K6.1 | `README.md:96, 193, 444, 570, 1169, 1274` | present |
| PseudodifferentialOperators P1.0, P5 (§5.4 full vs little Hölder), P6 | `README.md:164, 927, 1337, 1484` | present |
| PDE A.1, A.2, A.4, A.5, A.7 with its Campanato item, D.16–D.17, E.22 | `README.md:191, 227–259, 308–311, 331` | all scalar, as the contract says |
| SmoothBundlesConnections B1.4, B2, B5; LieGroups Layer 2 | SBC `README.md:421, 559–802, 1072–1209`; `RepresentationTheory/LieGroups/README.md:275` | present |
| CharacteristicClasses C1.1a; TopologicalKTheory T1.5, T1.6a; GeneralizedCohomology G4.0b | CC `README.md:245`; TKT `README.md:299, 328, 432`; GC `README.md:40, 939, 958` | present |
| HeegaardFloer F1.4, F2.6c | `README.md:1941, 2461` | present (R02) |
| FukayaTheory (downstream, open head) | `README.md:87–89` | consumes C2 as stated |
| GeometricCurrents (downstream, main) | `README.md:65, 81, 88, 92, 426–445, 912, 964–975, 991–999` | consumes C1–C3 as listed; G7 also compares with C2–C4 on the same smooth chains (`README.md:912, 975`), a remark only: the list is not claimed to be exhaustive |

**Adversarial computations.** Rows cover the sampled targets, the headline theorems and every Check; the numerical values were computed in a scratch script (pure Python) and by hand. `e_j` are the standard vectors, `i` multiplication by i, conjugate-first Hermitian product, Gram inner product without `1/k!`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Kähler sign convention (`README.md:105–108`) | n = 1, v = 1, w = i; `g(Jv,w)` | `Im(conj(1)·i) = 1`; `Re⟪iv,w⟫ = Im⟪v,w⟫` | pass |
| Ω normalization (`:110–111`) | n = 1; n = 2 | `dz∧dz̄ = −2i dx∧dy`, `(i/2)(−2i) = 1`; `Ω∧Ω̄ = 4 dvol`, `(−1)(i/2)²·4 = 1 = ω²/2!` | pass |
| Joyce phase (`:112–114`) | θ | `Re(e^(−iθ)Ω) = cos θ Re Ω + sin θ Im Ω` | pass |
| `norm_eq_sSup_abs_orthonormal` | k = 1, φ = 3dx; k = 0, constant −3; k = 3 on ℝ² | `3 = sup{3}`; `3 = |−3|`; `sSup ∅ = 0 = ‖0‖` | pass |
| 1.1 Checks | `dx₁∧dx₂ + dx₃∧dx₄`; `dx₁∧dx₂` on `((2,0),(0,3))` | comass 1 at `(e₁,e₂)`, Hilbert `√2`; value 6 > 1 | pass |
| `frameVolume` / 1.2 Checks | `((2,0),(0,3))`; `(v,v)`; empty; `((1,0),(1,1))` | `√36 = 6`; 0; `normDet` of the zero-domain map = 1; Gram `[[1,1],[1,2]]`, det 1, `Π‖v‖ = √2` | pass |
| `abs_eval_le_norm_mul_frameVolume`; 1.2 route | area form on `(2e₁,3e₂)`; `(e₁,e₁)`; k = 0; L = QR | `6 ≤ 6`; `0 ≤ 0`; `|c| ≤ |c|·1`; `φ(Le) = det R·φ(Qe)`, `|det R| = normDet L` | pass |
| 1.3 comparison | ω on ℝ⁴; degree 1; `dx₁∧⋯∧dx_k` | `1 ≤ √2 = 1.414 ≤ √6 = 2.449`; comass = Hilbert; `1 = 1` | pass |
| 1.4 dimensions and small k | k = 2, E = ℝ³; k = 1 in ℝ; k = 0; k = dim E = 2 | `6 − 3 = 3`, `S²`; two points; two rays of `⋀⁰ = ℝ`; two orientations | pass |
| `IsCalibratedFrame` / 1.5 Checks | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `((2,0,0),(0,½,0))`; k = 0, φ = ±1 | 1, −1, 0; value 1, not orthonormal; empty frame calibrated iff φ = 1 | pass |
| 1.6 product bound and Checks | `dx∧dx`; `ω₁∧ω₂` on `(e₁,ie₁,e₂,ie₂)`; Züst | `binomial(2,1) = 2 ≥ 1`; value 1, `binomial(4,2) = 6 ≥ 1`; `294/256 = 1.148 > 1` | pass (R01 repaired) |
| 1.6 decomposable factor | `dx` on ℝ ⊕ unit area on ℝ² | product comass 1; equality planes `ξ∧η` (HL 7.10) | pass |
| 2.1 Checks | `dx₁∧dx₂`; `2 dx₁∧dx₂`; `x₃ dx₁∧dx₂` | closed, comass 1; closed, comass 2; `d = dx₁∧dx₂∧dx₃`, comass `|x₃|` | pass |
| 2.2 Checks | plane `x₃ = 0` both orientations; plane `x₃ = x₁`; line `(1,1)/√2` | `±dvol`; tangents `(1,0,1),(0,1,0)`: `f*φ = 1`, `dvol = √2`; `(dx₁+dx₂)/√2` gives 1, `dx₁` gives `1/√2` | pass |
| 2.3 Checks | 2-simplex `[012]`; `t ↦ 2t`; `t ↦ |2t−1|`; constant | `∂∂ = 0`, unsigned sum `≠ 0`; mass 2; mass 2 vs length 1; 0 | pass |
| 2.4 square and controls | `a<b<c<d`, `[a,b,d]`, `[a,c,d]`; `[a,d]+[d,a]`; `[0,1]` | `det((1,0),(1,1)) = 1`, `det((0,1),(1,1)) = −1`; `∂c = [a,b]+[b,d]−[c,d]−[a,c]`, diagonal coefficients −1, +1; nonzero in the free module; `∂ = [1]−[0]` | pass |
| 3.1 and equality case | disk vs hemisphere; reversed disk; bump graph; defect `dvol − f*φ ≥ 0` | `π ≤ 2π`; no conclusion; area `> π`; integral 0 ⇔ defect 0 | pass |
| 3.2 Checks | flat disk `u e₃`; boundary moved; equator `Sᵐ ⊂ S^(m+1)` | `H = 0`, `∫|∇u|² ≥ 0`; first-order change `≠ 0`; `(cos t)^m`: `Vol″(0) = −m·Vol` (m = 1: −1, m = 2: −2 computed) | pass |
| 3.3 torus circles | `dθ₁`, `dθ₂`, `(dθ₁+dθ₂)/√2` | value 1 on the unit tangents | pass |
| `standardKahlerForm` / 4.1 Checks | n = 1: `(1,i)`, `(i,1)`, `(1,1)`; n = 2: `(e₁,e₂)`, `(e₁,ie₁)`; n = 0 | 1, −1, 0; 0, 1; zero form, comass 0 (`hn` needed) | pass |
| `isCalibratedFrame_standardKahlerForm_iff` | orthonormal `(v,w)` with `Im⟪v,w⟫ = 1`; `w = iv`; n = 0 | `⟪v,w⟫ = i`, Cauchy–Schwarz equality forces `w = iv`; conversely `Re⟪v,iv⟫ = 0`, `ω = 1`; both sides false | pass |
| `kahlerBivector` pairing | random `v, w ∈ ℂ³` | `Σ_j det[[Re v_j, Re w_j],[Im v_j, Im w_j]] = 2.0 = Im⟪v,w⟫ = 2.0` | pass |
| `kahlerPowerForm` / 4.2 Checks | n = r = 2: `(e₁,ie₁,e₂,ie₂)`, `(ie₁,e₁,e₂,ie₂)`, `(e₁,e₂,ie₁,ie₂)`; n = 4 real 4-plane; n = 3 mixed frame; r = 0; r = 3 > n = 2 | 1 (2 without `1/r!`); −1; −1; 0; `cos t` (t = 0.3: 0.9553; t = π: −1); 1 for n = 0 and n = 3; 0 | pass |
| `norm_kahlerPowerForm`, `isCalibratedFrame_kahlerPowerForm_iff` | r = 0; r > n; complex r-plane | comass 1, empty `u`, `ιMulti ![] = 1` both sides; both sides false (no orthonormal 2r-frame); `complexRealFrame u` real-orthonormal with the same unit multivector, `U(r)` connected fixes the orientation | pass |
| 4.3 Checks | `ℂʳ×0`; torus lattice; real torus | `dx₁∧dy₁∧⋯`; `Π a_j b_j`; `ω|_T = 0 ≠ 1` | pass |
| `standardComplexVolume`, `standardSpecialLagrangianForm` / 5.1 Checks | n = 1: `1, −1, i`, θ = 0, π/2; n = 2: `(e₁,e₂)`, `(ie₁,ie₂)`, `(e₁,ie₂)`, `(e₁,ie₁)`; n = 0 | `1, −1, 0`, `Re(e^(−iπ/2)·i) = 1`; `1`, `−1`, `i` (Re 0, calibrated at π/2), det 0 with `Im⟪e₁,ie₁⟫ = 1`; constant `cos θ`, comass `|cos θ|` | pass |
| `specialLagrangianFrame_iff` route | orthonormal v | `|det_ℂ v| ≤ 1` with equality iff rows ℂ-orthogonal iff Lagrangian; then `e^(−iθ)Ω v = 1` iff `Im = 0`, `Re > 0`; control `(−e₁,e₂)`: `Re = −1` | pass |
| 5.2 dimensions, reversal, transport | n = 1, 2, 3; `−e₁`; `(ω₀.transport R.symm) v w` | `U/SO`: 1, 3, 6; `SU/SO`: 0, 2, 5 = `(n²+n−2)/2`; phase + π; `ω₀(Rv,Rw) = ⟪Re v,Im w⟫ − ⟪Im v,Re w⟫ = Im⟪v,w⟫`, n = 1: `ω₀((1,0),(0,1)) = 1` | pass |
| 5.2 adapter vs `alternatizeBilinCLM` | B = area form | intended 1; `B − Bᵀ` gives 2 | pass |
| 5.3 circle and native index | `z = e^(is)`, tangent `ie^(is)` | phase `s + π/2`, phase class 1; tangent-line phase `(e^(is)/e^(−is))^1 = e^(2is)` (s = 0.7: argument 1.4 = 2s), degree 2 | pass |
| 5.3 `H = J∇θ` | circle radius ρ | `∇θ = t/ρ`, `Jt = −e^(is)` inward, `H = (1/ρ)(−e^(is)) = J∇θ`; `ι_Hω(V) = g(JH,V) = −dθ(V)` | pass |
| 5.4 Checks and example | `u = ax²/2` (a = 2); `u = x₁x₂`; `u = (x₁²+x₂²)/2`; graph of `(x₂,x₁)` | phase `1.1071 = arctan 2`; `det[[1,i],[i,1]] = 2`, phase 0; `(1+i)² = 2i`; frame `(1,i),(i,1)`: ℂ-orthogonal, norms² 2, normalized Ω = 1 | pass |
| 5.4 linearization | `H = diag(1,0)`, `K = I` | `tr((I+H²)⁻¹K) = 3/2`; on a solution `d Im = Re(e^(−iθ)det)·tr(…)` | pass |
| 6.1 β and `ι_V Im Ω` | `V = Σ a_j ∂_(y_j)` on ℝⁿ | `ω(∂_(y₁),∂_(x₁)) = −1` computed, `β = −Σ a_j dx_j = (JV)♭` (McLean's v); `ι_V Im Ω = Σ a_j ★dx_j = −★β` | pass |
| 6.1 derivative | Cartan; `δ = −★d★` on 1-forms | `L_V ω = dβ`; `L_V Im Ω = −d★β = ★(δβ) = (δβ) dvol` | pass |
| 6.2 Checks | `f dθ` on S¹; two circles ±1; flat Tⁿ; `η = sin x dx` | `∫f = 0`; per-component condition fails; constant forms, dim n; `δGη = −cos x`, `d(δGη) = η` | pass |
| 6.3 exponents and Checks | n = 1, γ = ¾; n = 2, γ = 0.6; n = 3, γ = 0.51; `sign x`; `|x|^½`; constants; `f = 1 at 0` | `κ₀ = 0.5, 1.2, 2.02 ∈ (0,n)`; `ρ^(−1−2ζ)·2ρ = 2ρ^(−2ζ)` (ζ = ½, ρ = 0.01: 200); seminorm `0.111` at ζ′ = ½ for ρ = 0.1 and 0.01, `0.279 → 0.701` at ζ′ = 0.7; seminorm 0; representative 0 | pass |
| 6.4 moduli Checks | flat Tⁿ; `b₁ = 0`; n = 1 geodesic in T² | n translations = `b₁(Tⁿ)`; rigid; 1-parameter = `b₁(S¹)` | pass |
| 6.5 second-jet identity | A = (0.7); `diag(1,−1)`; `[[0,1],[−1,0]]`; `I₂`; shear `[[0,1],[0,0]]`; random 3×3 | numeric `(vol − Re Ω)″(0)` = 0.49, 0, 4, 4, 1, 6.3509 against `(tr A)² + Σ_(i<j)(A_ij − A_ji)²` = 0.49, 0, 4, 4, 1, 6.3509; closed form `tr(AᵀA) + (tr A)² − tr(A²)` | pass |
| 6.5 frame side | `A = [[0,1],[−1,0]]`, t = 0.5 | `W₁₂(t) = 1.0 = 2t`, `|W′(0)|² = 4`; `Ω(u) = 0.75 = 1 − t²`, `Im Ω = 0`; general: `W′_ij = A_ji − A_ij`, `(Im Ω)′ = tr A` | pass |
| 6.5 `det(S + iW) = |Ω(u)|²`, Jacobi operator | `(e₁,e₂)`; `(e₁,ie₁)`; flat torus | `S + iW = ⟪u_i,u_j⟫_ℂ`, det 1; 0; Hodge Laplacian, kernel n constants | pass |
| Layer 6 example | flat Tⁿ | L² metric = flat × `Vol = 1`; `δ²Vol(Σ a_j ∂_(y_j)) = 0` | pass |
| Docstring/README agreement | `README.md:30–32` vs `Suggested.lean:11–27` | both say Layers 3, 4, 5 and 6 | pass (R05 repaired) |

**Ownership.** Searched main, the board packages index (four packages, none geometric) and the 460 open roadmap pull requests for comass, calibration, special Lagrangian, Wirtinger, Campanato, McLean and `TauCetiRoadmap.CalibratedGeometry` (Lean names). No other roadmap builds comass, calibrated immersions, the integral smooth complex, the Kähler-power or special Lagrangian forms, or McLean's theorem: GeometricTopology's "Wirtinger" and "calibration" hits are knot-group presentations and sign calibrations; GromovWittenTheory and ComplexComparisonPartII use comass bounds; HeegaardFloer `README.md:35–45` on main assigns the general-degree Wirtinger inequality, the integral smooth-simplex complex and calibrated volume minimization to CalibratedGeometry; GeometricCurrents and FukayaTheory consume them. No `Suggested.lean` of another roadmap declares a `TauCetiRoadmap.CalibratedGeometry.*` name.

## Not verifiable

- Harvey–Lawson 1982 is cited by the roadmap as uncertified; the locator check above used the copy the sources service cached from an institutional archive. The roadmap gives no Harvey–Lawson line numbers, which is consistent with its status.
- Munkres1966EDT is waived; Chapter II, §10 is cited by locator and was not read.
- Campanato1963's OCR is garbled at the theorem statement (lines 225–228); the theorem's identity, position (printed p. 183) and hypotheses were read from the surrounding Italian text, as in the previous review.
- The quantitative C¹-to-Hölder, difference-quotient and vector Campanato iteration package of 6.3, the parametric gain of 6.4 and the nonlinear Hölder composition estimates have no primary-source locator beyond Campanato's characterization and the scalar PDE contracts; they are owned here with their routes and were checked on model instances only.

## Source issues

- **Misprint** in HarveyLawson1982 at Proposition III.2.17, equation (2.19), printed p. 96: the source says the derivative of the phase along a tangent vector V is minus the inner product of the mean curvature vector with JV; with J multiplication by i and the inward mean curvature vector of a circle the sign is plus, equivalently the mean curvature is J applied to the phase gradient; affects nothing.
- **Misprint** in McLean1998 at the proof of Theorem 3.6, equations (3.5)–(3.7), printed p. 722: the source writes the n-form component of the linearization as the 0-form star-d-star of the 1-form; it should be the n-form minus d of the star of the 1-form, as the operator named on the following line says; affects nothing.
