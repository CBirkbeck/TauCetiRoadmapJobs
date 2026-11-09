# Review of NoncommutativeGeometry (pull request #1143 at a681b6f)

**Verdict:** needs changes

This is a full review of the folder at a681b6f. The folder changed by 189 lines since 3571729, the head r19 read.

- The gate passes, `Suggested.lean` elaborates with its single `sorry`, the dependency check reports 0 problems, and all 15 sampled locators verify.
- Of r19's five findings, R02, R03 and R04 are repaired. R01 and R05 are not; they are carried below as R01 and R03.
- The full pass adds one finding (R02): three pinned Tau Ceti APIs are either planned here as targets or credited to roadmaps (BanachSpaceTheory B4, BanachAlgebras A6) that only plan them.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r19 R01; not repaired.

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The same file, 1606–1608: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 alone owns `A_θ`, its presentation and τ, and OperatorKTheory consumes them.

**Witness.** OperatorKTheory #866 is still at 1377338a (`TauCetiRoadmap/OperatorKTheory/README.md`):
- 1783–1784 define `A_θ=C(𝕋)⋊_αℤ` and "the canonical trace `τ=HaarIntegral∘E`";
- 1796–1797 state the universal presentation and the "injectivity of the coordinate copy";
- 2324–2326 say this roadmap consumes "K7's rotation algebras".

`roadmaps grep --fixed 'C(𝕋)⋊'` finds no other owner. The open revisions #1137 (2846) and #1149 (877) only mention the algebra.

**Repair.** The README's direction is the only one available:
- NoncommutativeGeometry is on main and therefore earlier than #866.
- Naming OperatorKTheory 7.4 in N6's *Needs:* is UPWARD (r19 test).

So:
- no README edit;
- the description states that #1143 merges before #866;
- #866 then replaces 1783–1784 and the bullet at 1796–1797 with a citation of NoncommutativeGeometry N6, and rewrites 2324–2326.
- Test: afterwards, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — Three pinned Tau Ceti APIs are planned here or credited to roadmaps that only plan them

**Location.**
- N1.Tensor 433–439: "For Banach factors compare with BanachSpaceTheory B4's completed Banach projective tensor over the same 𝕜 … This consumes B4's tensor contract". The supplier row (369) gives B4 for "The completed Banach projective tensor over ℝ and ℂ and its universal property". N1.Tensor's *Needs:* (472) and the Dependencies (661) also name B4.
- N1.Cyclic 526–528: "currying the first argument identifies the scalar (n+1)-cochains with n-cochains valued in A*, using `(aφb)(x)=φ(bxa)`; prove the differentials agree under this identification."
- N1.Cyclic 523–525: "consume BanachAlgebras A6's Hochschild differential and cochain API". The supplier row (363) reads "A6's bounded Hochschild cochains".
- The Tau Ceti contract (185–357) names none of the pinned declarations below.

**Claim.** The Banach projective tensor, the bounded Hochschild differential and the currying comparison come from B4, A6 and this roadmap.

**Witness.** At Tau Ceti 2fd255d, each declaration below was elaborated by `#check` (after `lake build` of its module):
- `TauCeti.CompletedProjectiveTensor` (`Analysis/Normed/Module/TensorProduct/Completion.lean` 76) and its isometric universal property `TauCeti.CompletedProjectiveTensor.liftIsometry` (196). The universal property is `(E →L F →L G) ≃ₗᵢ (E⊗̂πF →L G)` into Banach G.
- `TauCeti.ProjectiveTensor.assoc` (`…/TensorProduct/Associator.lean` 207) and `TauCeti.ProjectiveTensor.lid` (87).
- `TensorProduct.projectiveSeminorm_tmul` (`…/TensorProduct/InjectiveSeminorm.lean` 245): equality `π(x⊗y)=‖x‖‖y‖` for seminormed factors over `RCLike`.
- `ContinuousLinearMap.hochschildBimoduleCoboundary` (`Analysis/Normed/Algebra/HochschildCohomology/Coboundary.lean` 284), with δ²=0 (328) and coefficient naturality (`…/Coefficients.lean`).
- `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary` (`RingTheory/HochschildCohomology/Dual.lean` 138). Its dual bimodule `(x φ x′)y=φ(x′yx)` is the README's `(aφb)(x)=φ(bxa)`.

B4 on main (264–279) and A6 on main (1387–1394) plan these constructions and cite no pinned declaration.

**Repair.**
- In the Tau Ceti contract, add these declarations with their files.
- At 433–439, compare with the pinned `TauCeti.CompletedProjectiveTensor` and `liftIsometry`.
- Replace B4 by those names in 472 and 661, and delete row 369. N1 uses nothing B4 adds beyond the pin.
- The cross property route (421–427) may cite `TensorProduct.projectiveSeminorm_tmul`. The README's "the pin giving only ≤" remains true of the family carrier (`projectiveSeminormOf_tprod_le`, `…/PiTensorProduct/Projective/Seminorm.lean` 57).
- Replace the target at 526–528 by a citation of `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`.
- At 523–525, consume `ContinuousLinearMap.hochschildBimoduleCoboundary` and keep A6 only for its cohomology groups.
- Tested: a scratch copy with these names in 472 and 649 and without B4 in 472 gives `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`.

## R03 (P3) — The description describes an earlier head and states no merge order

Carried from r19 R05; the description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "three intended prototype admissions";
- "which merge first: #864".

**Witness.**
- `git diff --stat origin/main...HEAD` changes `Suggested.lean` (147 lines), and that file has one `sorry`.
- README 1439–1441 name the reductions `x⊠_u y` and `x⊠_s y`.
- README 105–106: SmoothBanachRepresentations' "generic inverse closure is not an input here".
- No *Needs:* line names AlgebraicKTheory.
- #864 is not among the 456 open pull requests.
- #1187 conflicts with this folder's `Suggested.lean` (overlaps). Its Tau Ceti pin ab00ba392 has no `matrixExtension` in `RingTheory/CyclicCohomology/Matrix.lean` (`git grep` at that commit).

**Repair.** Rewrite the description for this head:
- N3–N4 consume NoncommutativeIntegration §1.3–§1.6, §2.1 and VonNeumannAlgebras V4.Core;
- N6 builds `A_θ` on Tau Ceti's full crossed product and consumes BanachAlgebras A2;
- N7 consumes HilbertModules H1–H3 and owns the Hardy-class product at θ=0;
- `Suggested.lean` states only `bijective_matrixExtension`.

State the order:
- #866 merges after this pull request (R01);
- SmoothBanachRepresentations #1145 and LocallyConvexDuality #1782 merge after it, since both consume N1.Tensor over ℝ and ℂ;
- #1187 rebases onto the current pin after it.

Drop the #864 line and the build report for 84190a1e.

## Previous findings

- **r19 R01 (two owners of `A_θ`): not repaired.** README 50–56 is unchanged. #866 is still at 1377338a with 1783–1784 and 2324–2326 as quoted. Carried as R01.
- **r19 R02 (HilbertModules): repaired.**
  - 72–74 now reads "N7 consumes HilbertModules H1–H3 for the generic Hilbert-module constructions on its Heisenberg module".
  - Row 368 and N7's *Needs:* (1584) name H1–H3.
  - 81–84 keep only H6 out of scope.
  - N7 1478–1490 uses H1's completion over the dense subalgebra 𝒜_θ, H2's Parseval frames and H3's localization at τ.
  - Each matches HilbertModules on main: H1 138, 141; H2 229, 233; H3 286, 290.
- **r19 R03 (forward dependencies): repaired.**
  - The Hardy-class product now opens N7 (1437–1470) and cites "N3's smooth circle Hardy module", "N5's bounded transform" and N2's q*β, all inside N7's *Needs:* N2–N6.
  - N1.Cyclic 569–575 states `c_n` with no pairing.
  - N2 748–755 cites "N1.Cyclic's column scalars `c_n`".
  - Lines 399–998 name N5 only in the remark at 829, and N1 names no N2.
- **r19 R04 (holomorphic calculus supplier): repaired.**
  - N6 1286–1294 derives holomorphic closure from inverse closure and continuity of inversion.
  - It cites BanachAlgebras A2 and `TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq`, both in N6's *Needs:* (1408).
  - Row 363 drops A1 and A3.
  - A2 on main has the contour system (460) and the calculus (504, 520).
- **r19 R05 (description): not repaired.** Carried as R03.

No repair report marked any finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Gate, dependency check, elaboration, signatures, padding.**
- `gate … --base origin/main` at a681b6f: every scanner 0, `stray-files=0`, `outside-folder=0`, `OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. No gaps are declared.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0 with the single warning `declaration uses sorry` at 64:8.
- `#check @TauCetiRoadmap.NoncommutativeGeometry.bijective_matrixExtension` gives `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] (ι) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ)`. That is README 579–583's generality, so nothing changed.
- The pins are unchanged since 3571729: Tau Ceti 2fd255d and Mathlib 1b1ccf4.
- One-tactic probe on a scratch copy:
  - `simp` makes no progress;
  - `infer_instance` does not apply;
  - `aesop` fails;
  - `exact?` finds only the theorem itself.

  It is not padding.

**Headlines.** The Summary (8–12) names five end theorems:
- matrix Morita invariance: stated.
- the N3 index theorem: not statable. The pins have no trace on trace class, and no S_p for 0<p<1.
- the N5 Hochschild class: not statable. The pins lack Borel calculus and the spectral-triple carrier, and `dixmierTrace` is ℝ-valued (`DixmierTrace.lean` 91).
- N6's calculus and HP: not statable. `SmoothNoncommutativeTorus` has no topology or derivations.
- N7's index and (θ,1): not statable. Mathlib's `Analysis/CStarAlgebra/Module/` has only `Constructions`, `Defs` and `Synonym`, none of which mentions `Completion`, and no Tau Ceti file mentions `CStarModule`.

The docstring says each, as revised in this head, and cites `UniversalForms.cycleCocycle_trace` (`UniversalDifferential/Cycle.lean` 305) and `traceDerivationPairCocycle` (`Derivation.lean` 209), both present.

**Sources: the seeded sample.** Seed 1143020 drew 15 of the README's 37 locators; none is flagged unverified. Each was read at the cached text: number, page, hypotheses and support.

| Locator (README line) | Source text | Result |
|---|---|---|
| Grothendieck p. 77, completed product (414) | `grothendieck52` 180–183 (page headed 77) | ✓ completion; Banach for normed, (F) for metrizable |
| Grothendieck p. 77, products and direct sums (429) | `grothendieck52` 201–209 | ✓ products for any factors; finite sums are products |
| Grothendieck p. 77, Fréchet (431) | `grothendieck52` 183, 210 | ✓ |
| Grothendieck pp. 76–77, normed factors (437) | `grothendieck52` 164–172, 181–183 | ✓ norm `inf Σ‖x_i‖‖y_i‖`, Banach completion |
| Connes III.1 Thm 12, p. 197 (608) | `connes94` 7223–7227 | ✓ cup product on HC; character of a tensor product of cycles |
| Connes III.1 Lemma 14, p. 198 (620) | `connes94` 7259, 7274–7278; factor `(m+m′)!/(m!m′!)` at 7258 | ✓ (the factorial count is in Corollary 13's proof, same page) |
| Connes III.3 Props 2–3, pp. 229–230 (690) | `connes94` 8469–8472, 8493–8497; product law 8515–8532 | ✓ |
| Fack–Kosaki Thm 4.2(ii) (852) | `fack-kosaki` 605–607 (page headed 286) | ✓ `Δ_t(TS)≤Δ_t(T)Δ_t(S)` |
| Connes IV intro Def 3, p. 296 (915) | `connes94` 11135–11138 | ✓ p∈[1,∞[, `[F,a]∈L^p` |
| Connes IV.1 Prop 1, p. 299 (930) | `connes94` 11240–11252 | ✓ Tr′ and the cycle |
| Connes IV.1 Prop 2, p. 300 (943) | `connes94` 11282–11284 | ✓ `τ_(m+2)=−(2/(m+2))Sτ_m` |
| Connes 1985 Part I App. 2 Prop 5, p. 91 (962) | `connes85` 1802–1808 (page headed 91) | ✓ index of the compression on every idempotent |
| Connes IV.1 Prop 4, p. 303 (963) | `connes94` 11376–11398 | ✓ φ(x)=⟨x,Ch⟩; idempotent in `M_q(Ã)` |
| Connes IV.2 Prop 3(b), p. 312 (1039) | `connes94` 11765–11767 | ✓ `Tr_ω(ST)=Tr_ω(TS)` |
| Connes III.2 Thm 7, p. 218 (1378) | `connes94` 7998–8008 | ✓ all θ; bases Sτ, φ and φ₁, φ₂ |

**Adversarial pass.** Every value was recomputed for this review. The numerics were run in a scratch script.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 64; 579–605) | n=0, A=ℚ, ι=Fin 2; ι=∅; A=0; n=1 | Traces T on M₂(ℚ): `T(aE_ij)=δ_ijT(aE₁₁)`, so T↔τ, with Tr↦1. ι=∅: `HC⁰(0)=0≠ℚ=HC⁰(ℚ)`, so `[Nonempty ι]` is needed and present. A=0: 0=0. n=1: `HC¹=0` on both sides | true | none |
| Even index theorem (956–977) | `e=[[1,a],[0,0]]` on ℂ²⊕ℂ² | Index 1 (line to 0); `Tr′(γπ(e))=Tr e=1`. Symbolically `e[F,e]²e=eFeFe−e`, so `e−eFeFe=−e[F,e]²e` | true | none |
| Odd index and λ₁ (934–941) | circle Hardy, u=z | `τ₁(z⁻¹−1,z−1)=2`; README λ₁ pairs to −1.0000; Connes's `+√(2i)Γ(3/2)` gives +1.0000; `ind(PzP)=0−1=−1` | true | none (Source issues) |
| Hochschild class (1188–1192; 1463–1465) | Fourier triple at θ=0 | `Tr₂(σ₃σ₁σ₂)=2i`, `Tr₂(σ₃σ₂σ₁)=−2i`; λ₂=−1; `(−1)(2i)/(4π)=−0.159155i=1/(2πi)` | true | none |
| HP of 𝒜_θ (1374–1378) | θ=0; class φ | Betti numbers 1, 2, 1, so even=2 and odd=2; `φ(U₂⁻¹U₁⁻¹,U₁,U₂)=2πi≠0` | true | none |
| Heisenberg module (1472–1497) | θ=0.37, s=0.61 | curvature 16.98158i against `2πi/θ`=16.98158i; the four Leibniz cases agree to 10⁻⁸; `ξ(U₂U₁)/ξ(U₁U₂)=−0.68455+0.72897i=e(θ)`; the chiral operator on `exp(−πs²/θ)` leaves residual 4·10⁻¹⁰; Chern `(2πi)⁻¹(2πi/θ)θ=1` | true | none |
| Column scalars `c_n` (569–575, 748–755) | k, m = 0…4 | even: 1, 1, 0.5, 0.16667, 0.041667 on both sides; odd: (1−i)×0.282095, 0.0470158, 0.00470158, 3.35827e−4, 1.86571e−5 on both sides | true | none |
| Hardy product (1437–1470) | W=(σ₁−σ₂)/√2; Hardy F | W²=1, W*=W; WσW sends σ₁, σ₂, σ₃ to −σ₂, −σ₁, −σ₃; `((1+i)√π)²/(2πi)=1.0000`; `[F,z]e₋₁=2e₀` and is 0 elsewhere, so rank 1 | true | none |
| Holomorphic closure (1286–1297) | rational functions with poles off 𝕋; f=exp | 1/r has poles at the zeros of r, which lie off 𝕋, so the algebra is inverse-closed. exp equal to r on 𝕋 forces exp=r on ℂ minus the poles (identity theorem): impossible. The pinned hypotheses (`NormedRing`, `CompleteSpace`, null-homologous, equal winding) match 316–321 | true | none |
| Projection replacement (1298–1306) | a=1 | z=diag(2,2), p=diag(1,0); ep=p, pe=e, ez=ze=ee*e exactly; `s·s⁻¹=s⁻¹·s=1`, `ses⁻¹=p` | true | none |
| `A_θ` direction and unit (1220–1242; R01) | θ=1/4; c=2 | `exp(−2πi/4)⁻¹=i`; `δ₀⋆δ₀=2δ₀`; left convolution by `c⁻¹δ_n·a` is `a·α_n(g(s−n))=i_A(a)i_G(n)g` | true | R01 (owner) |
| Gram projection (1479–1485) | ℂ² over ℂ with frame e₁, e₂; general | `G²=(⟨x_i,Σ_kx_k⟨x_k,x_j⟩⟩)=G`; G=I₂, trace 2 = dim | true | none |
| Banach tensor comparison (433–439; R02) | ℓ¹⊗ℓ¹; pinned API | Pure-tensor norm 1, while the representation `(e₀+e₁)⊗e₀−e₁⊗e₀` has sum 3. The pin has `projectiveSeminorm_tmul` (=) on binary factors and only ≤ on the family carrier | true; object pinned | R02 |
| Currying (526–528; R02) | degree 0 | `(bφ)(a₀,a₁)=φ(a₀a₁)−φ(a₁a₀)`; curried `(δφ)(a₁)(a₀)=φ(a₀a₁)−φ(a₁a₀)`; the conventions agree | true; pinned | R02 |
| ℓ²⊗̂ℓ² (451–455) | `Σ_(i<4)e_i⊗e_i` | projective 4 against Hilbert 2 | true | none |
| S normalization (618–627) | m=1…4; m=2 signs | `S^mτ(1,…)=1,2,6,24` from the factors (m+1); m=2 signs + − + + − + sum to 2, unsigned 6 | true | none |
| Circle odd pairing (709–714) | k=1, 2, −1 | `k/((1+i)√π)`: 0.282095(1−i), doubled, negated | true | none |
| Majorization (881–886) | S=diag(2,1), T=[[1,1],[0,1]] | μ(T)=(1.618034, 0.618034), μ(ST)=(2.920810, 0.684742); products 2=2; 0.6847>0.6180 | true | none |
| λ ratio and Prop 2 (934, 943) | m=0, 1, 2 | `λ_(m+2)/λ_m=−1, −3/2, −2`, which is `−(m+2)/2` | true | none |
| `Tr′` (919) | T=e₀e₀* | `½(Tr T+Tr FTF)=½(1+1)=1=Tr T` | true | none |
| `Tr_ω(AT)=Tr_ω(TA)` (1039) | T=diag(1/(j+1)), U swapping e₀, e₁ | UT−TU has rank ≤ 2, so the Dixmier traces agree; `Tr_ω(T)=1` | true | none |
| Non-measurable operator (1070–1082) | recursion | r_k→0.666667 (even k), 0.833333 (odd k); `Tr_ω`=0.743683, 0.756317 | true | none |
| Fourier triple (1547–1555) | r²=0,1,2,5,25; R=300 | counts 1, 4, 4, 8, 12; `σ/log(1+N)=0.14696`, rising slowly to 1/(2π)=0.15915 | true | none |
| Bott class (715–720) | radial integral | `∫₀^4000 r(1+r²)⁻²=0.49999998`, pairing 0.99999996 | true | none |

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib 1b1ccf4).
- Elaborated by `#check`:
  - `TauCeti.cyclicCohomology.matrixExtension`;
  - `TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq` (`HolomorphicFunctionalCalculus/Cycle.lean` 73);
  - `TauCeti.CStarAction.FullCrossedProduct.of_injective` and `…groupMultiplier_mul_coefficientMultiplier`;
  - the seven declarations of R02.
- Read in source:
  - `Analysis/Contour/Cycle/{Basic,Winding,HomologyCauchy}.lean`, `Topology/FilledHull.lean` and `Analysis/Green/Localization.lean`: no theorem producing a cycle around a compact set, confirming 322–324;
  - `Analysis/OperatorIdeal/Nuclear/Basic.lean` and `Analysis/Normed/Operator/Nuclear.lean`: gauges, no trace functional;
  - `RingTheory/CyclicCohomology/{Normalized/Basic,Normalized/Chains,Periodicity,PeriodicCohomology,Matrix,GroundRing}.lean`, whose docstrings agree with the contract (186–259);
  - `TensorProduct/{Completion,Associator,InjectiveSeminorm}.lean`.

**Cross-roadmap citations resolved.** `roadmaps resolve` finds nothing missing.
- On main (1bea8354):
  - HilbertModules: H1 138, 141; H2 229, 233; H3 286, 290; convention 22–23.
  - BanachAlgebras: A2 440, 460, 504, 520; A4 1121; A6 1379.
  - BanachSpaceTheory: B4 239.
  - OperatorAlgebraDynamics: D1 148, D2 221, D4 333.
  - NoncommutativeIntegration: §1.3 286, §1.4 321, §1.5 360, §1.6 406, §2.1 453.
  - VonNeumannAlgebras: V4.Core 972.
  - OperatorIdeals: OI-A17 150, OI-A20 156, OI-A22 159, OI-A30 196, OI-B29–B30 349–350.
  - SelfAdjointSpectralTheory: SA-E 1202.
- At the open heads:
  - #1145 (18e94ff), `RepresentationTheory/SmoothBanachRepresentations/README.md` 9, 13, 82, 468, 478, 497 and 521: agrees with README 16–23, 104–106 and 1588–1593.
  - #1149 HeisenbergImprimitivity (926979bf) 51–52, 221–223 and 841–849: consumes N6–N7. Its 877 gives the twisted-group identification to OperatorKTheory, as README 57–62 does.
  - #1155 80, 288, 1523, 1539, 1578.
  - #925 108, 334, 348, 370.
  - #1782 README 38 and 112: consumes N1.
  - #854 §0.0 (scope 44) and #1312 §0.1 (table 35, 208): own the nonarchimedean tensors, as README 23–26 says.

**Ownership and overlaps.**
- `overlaps.md`: no id cited here is dropped by an open pull request, none is defined only by a revision, and none is dropped here. The one conflicting head is #1187 (R03).
- Closest by vocabulary:
  - #866: second owner of `A_θ` (R01).
  - #1158 and #1155: consume only.
  - #1137: mentions `C(𝕋)⋊ℤ` only as an example of its groupoid simplicity criterion.
  - #1077: does not mention these objects.
- N7's Heisenberg module, frames and Powers–Rieffel projection are consumed, not rebuilt, by #1149 (51–52).

## Not verifiable

- Fack–Kosaki Thm. 4.9(iii), p. 295 (README 845–846): the heading and the hypothesis 0<p<1 are at `fack-kosaki` lines 863–871, but the displayed inequality is lost at the page break in the extraction. NoncommutativeIntegration §1.3 on main derives it from Thm. 4.7(i).
- Connes IV.6, pp. 358–361 (elliptic index formula, cited for comparison only) was not read.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 with Proposition 4, pp. 302–303: the source says the odd character constant `√(2i)(−1)^(n(n−1)/2)Γ(n/2+1)` makes the K₁ pairing equal `Index(EuE)`, E=(1+F)/2; it should be minus that index: the circle Hardy module gives `⟨[z],Ch⟩=+1` while `Index(PzP)=−1`; affects a stated result.
