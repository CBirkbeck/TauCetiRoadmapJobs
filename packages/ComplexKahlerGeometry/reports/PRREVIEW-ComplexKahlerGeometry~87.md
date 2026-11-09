# Review of ComplexKahlerGeometry (pull request #1234 at 2b571fb)

**Verdict:** needs changes

Five findings, all P3; none is blocking. The gate passes, `Suggested.lean` elaborates with only its 27 `sorry` warnings, and five of the previous review's seven findings are repaired in the folder (R01–R03, R05–R07 of that review; its R04, a description item, is carried as R01 here).

## R01 (P3) — No merge order with #1807, #1808 and #1854, whose heads conflict with this one

**Location.** The pull-request description: its revision-dependency paragraph names only #1186. README `:2743–2745`: "This roadmap is the single owner of that comparison and of the transport of `cwComplex` and its characteristic maps in K7.2".

**Claim.** Three open pull requests change this folder and conflict with this head in `README.md` and `Suggested.lean`; no order is stated. They also move the `Projectivization`/sphere-quotient comparison and the transported cells into AlgebraicTopology, the opposite of the ownership sentence above (which agrees with main).

**Witness.** AlgebraicTopology at #1854, `README.md:1078`: "CW structure and characteristic maps along it. ComplexKahlerGeometry K7 consumes"; on main, `:1594`: "ComplexKahlerGeometry K7.1's projective model and K7.2's finite CW structure".

**Repair (description, not the folder).** Add: "This pull request merges first. #1807, #1808 and #1854 rebase on it, keep their move of the model comparison and the transported cells into AlgebraicTopology Stage 4 item 6, turn K7.1's single-owner sentence into a citation of that item, and carry this pull request's sections into their ComplexKahlerGeometry hunks." Carried from the previous review (its R04).

## R02 (P3) — The new headings drop three anchors that roadmaps on main link to, with no old → new mapping

**Location.** README `:554` "## Layer 2: Dolbeault calculus and the local lemmas (K2)", `:1427` "## Layer 5: …(K5)", `:2688` "## Layer 7: …(K7)". On main the headings are "## K2. Dolbeault calculus and the local lemmas", "## K5. Compact Hermitian elliptic theory and Serre duality", "## K7. Projective, torus, and Hopf examples".

**Claim.** The anchors `#k2-dolbeault-calculus-and-the-local-lemmas`, `#k5-compact-hermitian-elliptic-theory-and-serre-duality` and `#k7-projective-torus-and-hopf-examples` disappear. The sentence at `:363–364` keeps the labels K1–K8 but maps no heading.

**Witness.** Relative links on main: `TauCetiRoadmap/PseudodifferentialOperators/README.md:2105` and `TauCetiRoadmap/SmoothBundlesConnections/README.md:576` (`#k5-…`), `TauCetiRoadmap/MorseTheory/README.md:831` (`#k7-…`). Hyperfunctions `:26`, `:32`, RiemannianGeometry `:300`, SpinGeometry `:75` and GeneralizedCohomology `:2434` cite the same ids through commit permalinks.

**Repair.** Append to `## How to read the build`: "K1 is now Layer 1, K2 is now Layer 2, K3 is now Layer 3, K4 is now Layer 4, K5 is now Layer 5, K6 is now Layer 6, K7 is now Layer 7 and K8 is now Layer 8; 'Conventions and suppliers' is now Conventions and Exact supplier contracts." Tested on the PseudodifferentialOperators link: "K5a" resolves to Layer 5, sections 5.1–5.8.

## R03 (P3) — One wrong page, and five targets (four of them in the seeded sample) without a locator

**Location and repair.** Read at the text of demailly-agbook:

- **Wrong page.** README `:3334` and `:3531`: "Demailly, IV (10.8), p. 225". The display (10.8) is demailly-agbook line 11208, after the page marker and running head of p. 226 (lines 11202–11203). Write p. 226 in both places.
- **2.5 (sampled), `:739–749`.** The Dolbeault theorem, the Čech comparison for acyclic covers and the Čech-colimit comparison carry no locator. Cite Demailly IV (6.13)–(6.15), p. 216 (line 10742); IV (5.17), p. 209 (Leray, line 10439); IV (5.21), p. 211 (paracompact, line 10512). For `:756–758` cite V (11.7), p. 268 (line 13215).
- **4.2 (sampled), `:1128–1130`.** Existence, uniqueness, local formula and `(1,1)` type of the Chern connection: cite Demailly V (12.1)–(12.4), pp. 268–269 (lines 13221, 13249, 13254). Koszul–Malgrange (`:1131–1133`) has no locator and Demailly's text does not state it (`grep -i koszul` finds nothing); cite the primary paper or a textbook statement, or mark the rank-r route as this roadmap's own.
- **4.1 and 4.3 (sampled), `:1104–1112`, `:1149–1157`.** The section/reconstruction equivalence and the holomorphic-connection comparison with `D` have no locator and no "own" mark. Give one or the other; 4.4 already does this for the flat correspondence (`:1209–1212`).
- **2.1, `:566`.** The Dolbeault–Grothendieck lemma has its locator only in the Lean docstring. Add "(Demailly, Chapter I, (3.29), p. 28, for the local lemma)" (line 1288).

## R04 (P3) — The non-Kähler torsion terms quoted from Demailly VII (1.2) have the wrong second operator

**Location.** README `:2381–2382`: "for non-Kähler ω, (1.2) adds the torsion terms `[D'_E,τ*]−[∂̄_E,τ*]`".

**Claim.** The second bracket cannot be `[∂̄_E,τ*]`: it must be `[∂̄_E,bar(τ)*]`.

**Witness.** Bidegrees: `τ=[Λ,∂ω]` has type `(1,0)`, so `τ*` has `(−1,0)` and `[∂̄_E,τ*]` has `(−1,1)`, while `Δ''_E−Δ'_E−[iΘ(E),Λ]` has `(0,0)`. `[D'_E,τ*]` and `[∂̄_E,bar(τ)*]` both have `(0,0)`. The cached extraction (line 16274) loses the overline.

**Repair.** Write `[D'_E,τ*]−[∂̄_E,bar(τ)*]`. Test: on a Kähler manifold `τ=0` and both terms vanish, giving (1.3) as stated at `:2381`.

## R05 (P3) — Roadmaps cited by undefined abbreviations, and two sentences about other projects' needs

**Location.** README `:469` "SBC B2's", `:1436` "PDO P1.0", `:2063` "PDO P1.1, Riem R7.4", `:2559` "AT6.3's", `:2584` "GT Layer11's", `:1595–1596` "supplies both the Hyperfunctions and RQFT source examples", `:928` "It has no QFT prerequisite."

**Claim.** `SBC` (10 uses), `PDO` (5), `AT` (5), `GT` (3), `Riem` (1) and `RQFT` (1) are never expanded; a cross-roadmap citation names the roadmap. The two quoted sentences describe what other work needed, not mathematics.

**Witness.** `grep -n "(SBC)\|(PDO)\|(AT)"` on the README returns nothing; "Riem R7.4" is RiemannianGeometry R7 (`TauCetiRoadmap/RiemannianGeometry/README.md:1333`).

**Repair.** Write the roadmap names in full (SmoothBundlesConnections, PseudodifferentialOperators, AlgebraicTopology, GeometricTopology, RiemannianGeometry R7.4), or define the abbreviations once in `## Conventions`. Delete `:928`'s sentence and replace `:1595–1596` by "This theorem uses no hyperfunction or renormalization theorem."

## Previous findings (review of 28004ec)

- **R01 (relative integration duplicated) — repaired.** `:2644–2652`: "The relative de Rham theory used above is DeRhamCohomologyAndDuality's … No relative complex is constructed here"; contract at `:284–291`, uses at `:2561`, `:2617`, `:2634`. They match DeRhamCohomologyAndDuality on main (`:384`, `:443`, `:465`, `:486`, `:512`, consumer line `:695`) and at its open head (`:698`, `:805`, `:834`, `:881`, `:911`).
- **R02 (Kähler hypothesis) — repaired.** `:2367–2374` "On a Kähler manifold (X,ω), dω=0, prove …", `:2378`, the Hopf negative control at `:2405–2412`, and the scope exclusion at `:127–129`.
- **R03 (torus Hodge numbers) — repaired.** `Suggested.lean:523` `finrank_dolbeaultCohomology_complexTorus`; README `:3071–3083` with four Checks.
- **R04 (merge order) — not repaired.** Carried as R01.
- **R05 (house shape) — repaired.** `# Roadmap:` title, **Summary.**, the five front sections, eight `## Layer k` headings each ending in `### Examples` and `### Dependencies`, 44 `*Needs:*` lines, `## Downstream consumers`, `## References`.
- **R06 (locators) — repaired.** `:601` (Rainer 10.3), `:1922` (Rainer 12.2), `:2092` and `:3080` ("this roadmap's own"), `:303–308` (PDE §1.3 (A3), §2.2 (B9); headings at `TauCetiRoadmap/PDE/README.md:769`, `:1148`).
- **R07 (`ContinuousFiberMetric`) — repaired.** `:1446` "SmoothBundlesConnections B2.2's continuous fibre metric h"; BundleTest, BundleDistribution, BundleSobolev are prose.

## Verified sound

**Gate and dependencies.**
- The worker's gate shows every scanner at 0, `build=0`, `OK`.
- Dependency check output: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- All eleven supplier roadmaps of `## Exact supplier contracts` are on main (3090489), and the four completed ones are under `Completed/`. ComplexComparisonPartII, K3Surfaces, GeometricQuantization, AbelianSchemesAndArithmeticModuli, HamiltonianReduction, IndexTheory and FormalConnectionsOpers, not on main, appear only as consumers or as "owned elsewhere and not consumed".
- The worker's citation scan found no unresolved cross-roadmap citation; its two Lean leads are module paths whose files exist at the pin (`TauCeti/Analysis/Distribution/DeltaSeries.lean`, `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Eigenbundle.lean`).

**Lean.**
- `lake env lean` on `Suggested.lean`: 27 `declaration uses sorry` warnings, nothing else. 27 theorems, 7 definitions with real bodies, no `set_option`, no sorried data.
- Elaborated signatures compared with the README: every theorem keeps its binders (`[T2Space M] [CompactSpace M]` on the K5b, K6.1, K8 statements; `[I.Boundaryless]` on `hodge_theorem_deRham`, `even_finrank_deRhamCohomology_odd`, `hard_lefschetz`, `newlander_nirenberg`). The four flagged leads are the definitions `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` and `lefschetzMap`, whose bodies need no finiteness or compactness.
- One-tactic probe: each `sorry` replaced by `first | (simp; done) | rfl | infer_instance | trivial | (norm_num; done)` in a scratch copy; all 27 fail. No padding.
- Headlines: the 27 names of the Summary (`:17–29`) are exactly the 27 theorems of the file; the docstring names 14 groups of non-statable targets with the missing carrier.

**Library declarations opened at the pins.**
- `SmoothForm.codifferential`, `TauCeti/Geometry/Manifold/Riemannian/Codifferential.lean:88`: `(−1)^(m(k+2)+1) ⋆d⋆` on `(k+1)`-forms, i.e. `(−1)^(m(j+1)+1)` in degree j, as README `:2038`.
- `IsAlt.exists_basis_toMatrix_eq_J`, `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357` (over a field, as `:3143` says).
- `Homeomorph.finiteCWType`, `TauCeti/Topology/CWComplex/Classical/FiniteCWType.lean:98`; `Homeomorph.eulerChar_eq`, `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:163`.
- `integralTopForm`, `TauCeti/Geometry/Manifold/DifferentialForm/Integration/TopForm.lean:518`: real-valued forms only, as the docstring says.
- `integralCup_self_add_self_eq_zero` (`AlgebraicTopology/Cohomology/IntegralCup.lean:54`), `singularUniversalCoefficientEquiv` (`…/UniversalCoefficient.lean:33`), `not_tendsto_sum_normalized_delta_derivative` (`Analysis/Distribution/DeltaSeries.lean:97`), `isSelfAdjoint_of_surjective_addSub` (`…/LinearPMap/SelfAdjoint.lean:393`), `complexHodgeStar_mem_typeSubmodule_iff` (`…/HodgeStar/Complex.lean:219`), `kerDelBarZeroEquiv` (`…/Dolbeault/Holomorphic.lean:31`), `nat_card_cell_cwComplex` (`Topology/CWComplex/Classical/ComplexProjective.lean:47`).
- Mathlib: `Sheaf.H.δ` (`CategoryTheory/Sites/SheafCohomology/ExactSequences.lean:60`), `IsRegularLocalRing`, `ringKrullDim_le_spanFinrank_maximalIdeal`, `Complex.isCoveringMap_exp`, `IsCoveringMap.existsUnique_continuousMap_lifts`, `ContinuousLinearEquiv.toCompactConvergenceCLM`, `curveIntegral_eq_intervalIntegral_deriv`, `SchwartzMap.fourier_convolution`, `coreE₂Cohomological`.
- A scripted pass over the 409 backticked identifiers of the README found each at a pin, in a cited roadmap (`RoughDensity`, `deRhamHom`, `deRhamEquiv`, `homotopyOperator` in DifferentialGeometry; `cwSubcomplexNeighborhoods`, `simplicialRealizationCW` in AlgebraicTopology) or among this file's 34 names.

**Ownership against open pull requests** (checked by object with `roadmaps grep`).
- Finite-rank Runge operator and planar two-form exactness: GlobalHolomorphicFunctions (open, `README.md:1389`, `:2473–2475`) states them and names K2 and K5a as consumers. This roadmap is on main and cannot consume it, so the citation is that roadmap's to make.
- Hard Lefschetz, Weierstrass preparation, Newlander–Nirenberg, Koszul–Malgrange, `Pic_hol`: no second owner. LefschetzStructures treats Hard Lefschetz as data, TeichmullerGeometry and GeometricQuantization consume K1 and K4, SchubertGeometry `:49` defers `Pic_hol` to this roadmap.
- Unimodular alternating forms (7.7): stated here because AbelianSchemesAndArithmeticModuli A5.4 is not on main; `:119–121` records it.

**Sources read at the text.**
- demailly-agbook: I (3.29) line 1288, p. 28; II (2.1), (2.3)–(2.4) lines 3794–3817, p. 80; (2.7) line 3872, p. 81; (2.10) line 3931, p. 82; (3.19) line 4286, p. 89; (4.2) lines 4399–4403, p. 91 (locally bounded extension, M connected); (4.22) line 4742, p. 97; (4.29) line 4842, p. 99; (4.31) line 4929, p. 100; IV (4.11)–(4.12), (4.15) lines 10201–10232, pp. 204–205; (11.3)–(11.6) lines 11260–11287, pp. 227–228; (16.8) line 12242, p. 249; V (6.6)–(6.7) lines 12832, 12846, pp. 260–261; (8.2), (9.2), (9.5) lines 13017–13051, pp. 264–265; (15.10) line 13812, p. 280; VI (4.5) line 14697; (7.2)–(7.3) lines 15385–15390, pp. 309–310; (8.5), (8.6), (8.8), (8.12), (8.17) lines 15442–15557, pp. 311–313; (9.1) line 15569, p. 314 (compact connected Kähler, as `:1294` says); (10.1)–(10.2) lines 15715–15716; (11.1)–(11.3) lines 15946–15961; VII (1.1)–(1.3) lines 16248–16282, pp. 329–330.
- angella-iwasawa: `dφ³=−φ¹∧φ²` line 510; §4.1 line 693 (`b₁=4`, line 701) and §4.2 line 709 (`h^(1,0)=3`, `h^(0,1)=2`, lines 717–724), p. 13.
- sakane-parallelisable: Theorem 1 and the central subgroup step, lines 102–115, printed p. 189, citing Raghunathan p. 31 Corollary 1 and p. 23 Theorem 1.13.
- ballmann-kahler: Theorem 4.17, lines 1990–2004, printed pp. 47–48.
- rainer-advanced-complex-analysis: Theorems 10.3, 11.1, 12.2 at lines 1295, 1338, 1630.
- 1.1, 5.1, 7.1 (sampled) cite pinned declarations only; 5.8 is marked as the roadmap's own; 1.4 cites Webster (uncertified).

**Adversarial pass.** 44 rows, values computed this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 orientation, holomorphy test | `z↦2z`, `z↦z̄`, `|z|²` | real det `4`, `−1`; `φ_z̄=z`, zero only at 0 | Pass |
| 1.3 eigenbundle convention | `u=∂_x` | `(u−iJu)/2=∂_z`, `J∂_z=i∂_z`; `(u+iJu)/2=∂_z̄` | Pass |
| `newlander_nirenberg` (1.4) | `n=0`; standard ℂ | discrete M, constant φ; `φ=id` | Pass |
| 2.2 FiniteRankRunge | annulus in `{|z|<4}`, `f=1/z` | `sup_L|f|=2/3`, `|∮|=2π` over length `4π` gives `≥1/2>2ε/3` for `ε<3/4` | Pass |
| 2.2 pole pushing | `a∉Ω`; `b∈∂V∖Ω` | `(z−a)⁻¹` holomorphic on Ω; `b∉K`, components closed in `ℂ∖K`, so `b∈W` | Pass |
| `exists_mixed_parameter_dbar_solution` | `f=1`, `u=z̄`; `Ω=∅` | `(1+i·(−i))/2=1`; vacuous | Pass |
| `dolbeault_grothendieck_polydisc` | some `r_k≤0`; `n=0` | empty domain; one point, no `(p,q+1)`-form | Pass |
| 2.4 `DolbeaultCohomology` | ℂ×, `dz̄/z̄` | `=∂̄log|z|²`, class 0; `∮dz̄/z̄=−2πi`, nonzero for d | Pass |
| 2.5 Dolbeault theorem | ℂP¹, `p=1,q=0` | no holomorphic 1-form: `h^(1,0)=0` | Pass; locator R03 |
| Weierstrass preparation, division | `w²−z`, `w³` | `d=2`, `u=1`, `a=(−z,0)`; `w³=w(w²−z)+zw` | Pass |
| `weierstrass_preparation_unique` | `d=0` | `f=u=u′` near 0 | Pass |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | stalk ℂ, dim 0; DVR, dim 1 | Pass |
| `ruckert_nullstellensatz`, `cartan_coherence_reducedIdeal` | `f=z²`, `g=z`; `(zw)²` | `m=2`, `h=1`; generator `zw` | Pass |
| `riemann_extension` | `k=0`; `1/z` | zero set U, `hA` forces `U=∅`; excluded by `hbdd` | Pass |
| `hartogs_extension_across_point` | ℂ; ℂ² with doubled origin | `1/z` excluded by `2≤finrank`; `{p}ᶜ` is a chart, `g(p)=f(p′)` | Pass |
| 4.2 Chern connection | `h=e^(−|z|²)` | `A=−z̄dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy` | Pass; locator R03 |
| 4.3 monodromy convention | `d−a dz/z` on ℂ× | parallel `cz^a`, `M(γ)=e^(2πia)` | Pass |
| 4.1/4.4 section equivalence | `ℂ⊔ℂ`, ranks 0, 2 | fibres 0 and ℂ², no single model F | Pass; locator R03 |
| 4.5 exponential sequences | point; `ℝP²` | kernel of `exp(2πi·)` is ℤ; Bockstein injective since `H¹(ℝP²;ℤ)=0` | Pass |
| 5.1 density line | chart `x↦−x`; `y=2x` | `|dx|` fixed, `dx↦−dx`; `∫φdy=2∫φdx` | Pass |
| 5.2 delta series | `φ=1/(1+2x)` near 0 | `(−1)^n φ^(n)(0)/n!=2^n` | Pass |
| 5.4 Bessel symbol | `z=2`, `‖ζ‖=2`; point delta | `1+4=5`; `∫(1+‖ζ‖²)^s<∞` iff `s<−n/2` | Pass |
| 5.5 punctured plane | `dz/z` | `c_U=0`, `c_L=−2πi`, four-arc sum `c_U−c_L=2πi` | Pass |
| 5.6 PlanarTwoForms | `h=1` | `u=z̄/(2i)`, `d(u dz)=(1/2i)·2i dx∧dy` | Pass |
| 5.7 realification | `a_+(u,u)=Q+i‖u‖²` | `Re((1−i)a_+)=Q+‖u‖²≥(Q+λ‖u‖²)/λ≥(c/λ)‖u‖²_(H¹)` | Pass |
| `hodge_theorem_deRham` | S¹; `M=∅` | `d*(f dθ)=(−1)^(1·2+1)⋆d⋆=−f′`, harmonic line; all spaces 0, `∃!` holds | Pass |
| 5.8 ComponentwiseCompact | two components, ranks 0, 2; `M=∅` | finite index 2, `PiLp 2` of two spaces; empty index | Pass |
| 5.9 K5b.0 | `f dz̄` on ℂ | `|dz̄|²=2`, `∂̄*(f dz̄)=−2f_z`, `Δ_∂̄g=−½Δ_flat g` | Pass |
| `finrank_dolbeaultCohomology_serre` (5.10) | Hopf; elliptic `p=2` | `h^(0,1)=1=h^(2,1)`; without `hp`: `0≠1` | Pass |
| 6.1 Kähler identities | `[Λ,d]`, `[L,d*]` | `i(∂̄*−∂*)=−(d^c)*`; `−([Λ,d])*=d^c` | Pass |
| 6.1 Akizuki–Nakano torsion terms | bidegree of `[∂̄_E,τ*]` | `(0,1)+(−1,0)=(−1,1)≠(0,0)` | Fail, R04 |
| 6.1 Nakano bound | `e^(−|z|²)`, `u=dx∧dy` | `iΘ=2ω`, `[iΘ,Λ]u=2u`, `ka=2` | Pass |
| 6.2 planar star | `dz`; `h=x²+y²` | `*dz=−i dz`; `δ(h dx∧dy)=2y dx−2x dy`, `Δ_H h=−4` | Pass |
| `del_delBar_lemma`, Hodge symmetry, parity (6.3) | elliptic Kähler form; Hopf; annulus | `∫ω>0`, not exact; `h^(0,1)=1≠0`; `b₁=1` with boundary | Pass |
| `hard_lefschetz` | `k=n`; `S²×S²` | identity; `(aσ₁+bσ₂)²=2ab≠0`, `σ₁²=0` | Pass |
| Hodge–Riemann sign | `dz`, `dz̄` on a curve | `i·dz∧dz̄=2dx∧dy`; `−i·dz̄∧dz=2dx∧dy` | Pass |
| 7.1 model comparison | `(3,4)`, `2i(3,4)`; `(1,i)` | chart value `4/3` both; i, conjugate map gives `−i` | Pass |
| 7.2 Fubini–Study | `w=(1,i)/√2` | `r=2`, `h(e₁,e₂)=−w₁w̄₂/(4π)=i/(8π)` | Pass |
| projective cohomology (7.3) | `n=0`; `n=2` | `u=0`, `u⁰` generates; Betti `1,0,1,0,1`, `χ=3` | Pass |
| 7.5 rational quartic | `n=2` | pair sums of `{0,1,3,4}` give `0..8`; kernel `x₀x₃−x₁x₂`, `10−9=1` | Pass |
| `finrank_dolbeaultCohomology_complexTorus` | `n=0`; `n=2`; `p>n` | `1`; `h^(1,1)=4`, `1+4+1=6=C(4,2)`; `0=0` | Pass |
| 7.8 FlatDegreeZero | gauge a; curvature | `|σ(1)|=e^(u−u)=1`, `Re(aτ)=v`; `iF′=φω+(Δ_d(−2Gφ))ω/2=0` | Pass |
| Frölicher (8.1), `finrank_deRhamCohomology_le_sum_dolbeault` | `E₁^(1,0)`; Iwasawa; Hopf | native `(3,−2)→(5,−3)=E₁^(2,0)`; `4≤3+2`; `1≤0+1` | Pass; page R03 |
| 8.2–8.3 Iwasawa, Heisenberg | `dφ₃=−φ₁∧φ₂`; `x=y=z=1` | `d₁[φ₃]≠0`; `log=X+Y+½Z` | Pass |

## Not verifiable

- Webster, Hörmander (ALPDO I), Griffiths–Harris, Wells and Raghunathan are recorded as uncertified; their locators were not opened. Raghunathan's two locators agree with Sakane's citation of them (sakane-parallelisable lines 112–113).
- Demailly VII (1.1)–(1.2): the cached extraction drops overlines, so the printed form of the second torsion term could not be read; R04 rests on the bidegree count.
- No statement of Koszul–Malgrange was read; R03 asks for a locator without proposing one.
- #1807 and #1808 were read only through `roadmaps grep`; AlgebraicTopology at #1854 through `roadmaps show`.
- The table rows check instances; they are not proofs.

## Source issues

- **Misprint** in demailly-agbook at Chapter VII, proof of (1.1), p. 329: the source refers to a normal coordinate frame by an unresolved cross-reference "Prop. V-12.??"; it should be Chapter V, (12.10), p. 270; affects nothing.
