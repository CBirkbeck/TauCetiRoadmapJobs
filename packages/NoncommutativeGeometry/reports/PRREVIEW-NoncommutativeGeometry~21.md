# Review of NoncommutativeGeometry (pull request #1143 at 4f1e952)

**Verdict:** needs changes

This is a full review of the folder at 4f1e952; the README changed by 179 lines since a681b6f, the head r20 read.

- The gate passes, `Suggested.lean` elaborates with its single `sorry`, and the dependency check reports 0 problems.
- All 15 sampled locators verify. Fack–Kosaki Thm 4.9(iii), which r20 could not read, is now confirmed through the remark on p. 297.
- Of r20's three findings:
  - R02 is repaired for every declaration it named.
  - R01 and R03 are not repaired; they are carried below as R01 and R03.
- The full pass adds one finding (R02 below): the Banach dual-bimodule convention credited to BanachAlgebras A4 is already pinned Tau Ceti API.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r20 R01; not repaired.

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The same file, 1711–1714: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ, and OperatorKTheory consumes them. This head moves that ownership here: on main, this README's line 57 still gives K7 "all real-parameter rotation C*-presentations".

**Witness.** OperatorKTheory #866 is still at 1377338a. In `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1783–1784 define `A_θ=C(𝕋)⋊_αℤ` and `τ=HaarIntegral∘E`;
- 1796–1797 state the universal presentation and coordinate injectivity;
- 2326 says this roadmap consumes "K7's rotation algebras".

**Repair.** The README already takes the only admissible direction:
- NoncommutativeGeometry is on main, so it is earlier than #866;
- naming OperatorKTheory in N6's *Needs:* would be UPWARD.

So:
- no README edit;
- the description states that this pull request merges before #866;
- #866 replaces 1783–1784 and the bullet at 1796–1797 by a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as a consumption of N6.
- Test: afterwards `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — BanachAlgebras A4's dual-bimodule convention is pinned Tau Ceti API

**Location.**
- README 418 (supplier row "BanachAlgebras A2, A4, A6"): "with A4's dual-bimodule convention `(a·φ)(x)=φ(xa)`, `(φ·a)(x)=φ(ax)`, consumed by N1.Cyclic".
- 618–619: "under A4's dual-bimodule convention".
- N1.Cyclic *Needs:* (751) and Dependencies (769): "BanachAlgebras A4, A6".

**Claim.** BanachAlgebras A4 supplies the dual actions on the Banach dual.

**Witness.** Tau Ceti 2fd255d has `ContinuousLinearMap.dualAction` (`Analysis/Normed/Module/Dual/Bimodule.lean` 82; `#check`ed):
- `dualAction M a φ x = φ (M a x)`;
- left action `dualAction R`, right action `dualAction L`;
- bimodule laws (103, 111, 121) and weak-star continuity (128).

BanachAlgebras 4.1 on main (1128) only plans them.

**Repair.**
- In the Tau Ceti contract's "Hochschild cochains" bullet, add: the dual actions `ContinuousLinearMap.dualAction` on `StrongDual 𝕜 E`, `(a·φ)(x)=φ(x·a)` by `dualAction R` and `(φ·a)(x)=φ(a·x)` by `dualAction L`, with their bimodule laws and weak-star continuity (`Analysis/Normed/Module/Dual/Bimodule`).
- In row 418:
  - rename the supplier to "BanachAlgebras A2, A6";
  - replace "with A4's dual-bimodule convention `(a·φ)(x)=φ(xa)`, `(φ·a)(x)=φ(ax)`, consumed by N1.Cyclic. The bounded coboundary itself is Tau Ceti's." by "consumed by N1.Cyclic. The bounded coboundary and the dual actions `ContinuousLinearMap.dualAction` are Tau Ceti's."
- At 618–619, write "under the pinned dual actions `ContinuousLinearMap.dualAction`".
- At 751, add `ContinuousLinearMap.dualAction` to the Tau Ceti list and end with "BanachAlgebras A6".
- At 769, end with "BanachAlgebras A6".
- Tested on a scratch copy with these five edits:
  - no "A4" remains;
  - the dependency check gives `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`;
  - `dualAction_apply_apply` reproduces the README's formulas: `φ(R a x)=φ(x·a)` for the left action and `φ(L a x)=φ(a·x)` for the right.

## R03 (P3) — The description describes an earlier head and states no merge order

Carried from r20 R03; the description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "which merge first: #864".

**Witness.**
- `git diff --stat`: `Suggested.lean` changes by 147 lines.
- README 1544–1546: `x⊠_u y`, `x⊠_s y`.
- README 104–106: that inverse closure "is not an input here".
- No *Needs:* names AlgebraicKTheory.
- #864 is not open.
- #1187 conflicts in this `Suggested.lean`; its older Tau Ceti ab00ba392 lacks `matrixExtension`.

**Repair.** Rewrite the description for this head. It should say that:
- N1.Tensor consumes Tau Ceti's Banach and locally convex projective tensors and BanachSpaceTheory B4's norm comparison;
- N1.Cyclic consumes the pinned bounded coboundary and currying;
- N3–N4 consume NoncommutativeIntegration and VonNeumannAlgebras V4.Core;
- N6 builds `A_θ` on Tau Ceti's full crossed product;
- N7 consumes HilbertModules H1–H3;
- `Suggested.lean` states only `bijective_matrixExtension`.

State the order:
- #866 merges after this pull request (R01);
- SmoothBanachRepresentations #1145 and LocallyConvexDuality #1782 merge after it;
- #1187 rebases onto main's pin after it: its ab00ba392 is an ancestor of main's 2fd255d.

Drop the #864 line and the build report for 84190a1e.

## Previous findings

- **r20 R01 (two owners of `A_θ`): not repaired.** README 50–56 and 1711–1714 are unchanged, and #866 is still at 1377338a with 1783–1784 and 2324–2326 as quoted. Carried as R01.
- **r20 R02 (pinned tensor and Hochschild APIs credited to B4/A6): repaired.**
  - The Tau Ceti contract now names each declaration with its module:
    - `TensorProduct.projectiveSeminorm`, `TauCeti.ProjectiveTensor`, `TensorProduct.apply_le_mul_projectiveSeminorm` and `TensorProduct.projectiveSeminorm_tmul`;
    - `TauCeti.CompletedProjectiveTensor` with `mapL` and `liftIsometry`;
    - `TauCeti.ProjectiveTensor.comm`, `.lid` and `.assoc`, and `TauCeti.CompletedProjectiveTensor.comm` and `.lid`;
    - `ContinuousLinearMap.hochschildBimoduleCoboundary`, `norm_…_le`, `…_hochschildBimoduleCoboundary`, `…_constOfIsEmpty_eq_zero_iff`, `…_ofSubsingleton_eq_zero_iff` and `…_compContinuousMultilinearMap`;
    - `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`.
  - The text naming them is "Banach projective tensors (N1.Tensor), for seminormed spaces over a normed field: the binary projective seminorm `TensorProduct.projectiveSeminorm` …" (220–243) and "Hochschild cochains (N1.Cyclic): …" (288–314).
  - N1.Tensor (498–513) compares with `TauCeti.CompletedProjectiveTensor` and keeps B4 only for the binary/`PiTensorProduct` norm comparison. The pin lacks that comparison: no file under `Analysis/Normed/Module/TensorProduct/` relates the two. B4 on main plans it at 267.
  - N1.Cyclic (606–620) cites the pinned currying and coboundary, and keeps A6 for `Hⁿ=Zⁿ/Bⁿ` and bounded currying. A6 on main plans both at 1393–1395, and neither is at the pin.
  - All 30 declarations were elaborated by `#check`, and their hypotheses match the prose.
  - The A4 leftover was not among r20's items; it is raised as R02 above.
- **r20 R03 (description): not repaired.** Carried as R03.

No repair report marked any finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Gate, dependency check, elaboration, signatures, padding.**
- `gate … --base origin/main` at 4f1e952: every scanner 0, `OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. No gaps are declared.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0 with the single warning `declaration uses sorry` at 64:8.
- `#check @TauCetiRoadmap.NoncommutativeGeometry.bijective_matrixExtension` gives `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] (ι) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ)`. That is README 671–676's generality. There is no `variable` block, so no binder can be lost, and nothing changed.
- One-tactic probe on a scratch copy:
  - `simp` makes no progress;
  - `infer_instance` does not apply;
  - `aesop` fails;
  - `decide` and `rfl` fail;
  - `exact?` finds only the probe itself.

  It is not padding.
- Pins: Tau Ceti 2fd255d and Mathlib 1b1ccf4, the same as main.

**Headlines.** The Summary (8–12) names five end theorems:
- matrix Morita invariance: stated.
- the N3 index theorem: not statable. The pin has no trace on trace class: `OperatorIdeal/Family/TraceClass.lean` defines only the ideal family.
- the N5 Hochschild class: not statable. `dixmierTrace` is ℝ-valued (`DixmierTrace.lean` 91).
- N6's HP: not statable. `SmoothNoncommutativeTorus` has no topology or derivations.
- N7's index and (θ,1): not statable. Mathlib's `Analysis/CStarAlgebra/Module/` has only `Constructions`, `Defs` and `Synonym`.

The docstring says each of these. It also cites `cycleCocycle_trace` and `traceDerivationPairCocycle`, both present.

**Sources: the seeded sample.** Seed 1143021 drew 15 of the README's 37 locators; none is flagged unverified.

| Locator (README line) | Source text | Result |
|---|---|---|
| Grothendieck Thm 1, p. 76, isometric bilinear correspondence (487) | `grothendieck52` 153–172 | ✓ unique norm making B(E,F;G)≅L(E⊗F;G) isometric; inf Σ‖xᵢ‖‖yᵢ‖ |
| Grothendieck p. 77, Fréchet (495) | `grothendieck52` 183, 210 | ✓ metrizable ⇒ (F) |
| Grothendieck pp. 76–77, normed factors (501) | `grothendieck52` 164–170, 181–183 | ✓ norm, Banach completion |
| Connes 1985 Part II Cor 24, p. 113 (677) | `connes85` 2592–2594 (page headed 113) | ✓ unital 𝒜, ℬ, bimodule finite projective on both sides; A^ι gives the matrix case |
| Connes III.1 Lemma 14, p. 198 (712) | `connes94` 7258, 7274–7278 | ✓ S=σ#φ; the factor (m+m′)!/(m!m′!) is on the same page |
| Fack–Kosaki Thm 4.9(iii), p. 295 (951) | `fack-kosaki` 863–871; content at 935–937 (p. 297) | ✓ 0<p<1; the reversed Lemma 5.1 inequality is 4.9(iii) |
| Fack–Kosaki Thm 4.2(i), p. 286 (955) | `fack-kosaki` 605–606 | ✓ ‖TS‖_r≤‖T‖_p‖S‖_q, p,q,r>0 |
| Connes IV.1 Prop 2, p. 300 (1048) | `connes94` 11282–11284 | ✓ τ_(m+2)=−(2/(m+2))Sτ_m |
| Connes IV intro Prop 2, p. 295 (1070) | `connes94` 11082–11100 | ✓ H⊗ℂ^q, F⊗1, π⊗id; E=(1+F)/2 |
| Connes IV App C, p. 453 (1122) | `connes94` 17381–17403 | ✓ L^(p,q) norms; q=∞ is sup N^(1/p−1)σ_N; L^(1,∞) is σ_N=O(log N) |
| Connes IV.2 Def 2, p. 312 (1135) | `connes94` 11754–11760 | ✓ T≥0 in L^(1,∞); Connes divides by log N, README by log(1+N), with the same generalized limit |
| Connes IV.2 Prop 4, p. 313 (1193) | `connes94` 11789–11793 | ✓ (s−1)ζ(s)→L ⇔ log-means →L |
| Connes III.2 Prop 5(a)–(b), p. 217 (1494) | `connes94` 7978–7983 | ✓ θ∉ℚ: H⁰=ℂ; Diophantine: dim 2, 1 |
| Connes IV.6, pp. 356–357, module (1578) | `connes94` 13549–13555 | ✓ ξU₁=ξ(s+θ), ξU₂=e(s)ξ, θ∈]0,1] |
| Connes IV.6, p. 357, connection (1591) | `connes94` 13560 | ✓ ∇₁=−2πis/θ, ∇₂=d/ds |

**Adversarial pass.** Every value was recomputed for this review, in a pure-Python scratch script.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 64; 671–699) | n=0, A=R=M=ℚ, ι=Fin 2; ι=∅; A=0 | Traces T on M₂(ℚ): `T(E₁₂)=T(E₁₁E₁₂)=T(E₁₂E₁₁)=0` and `T(E₁₁)=T(E₂₂)`, so restriction to E₁₁ inverts φ↦φ#Tr. ι=∅: `HC⁰(0)=0≠ℚ`, so `[Nonempty ι]` is needed and present. A=0: 0=0 | true | none |
| Currying Check (725–734; R02) | random M₂(ℂ), bilinear φ, n=1; degree 0 | Pinned actions: `|δ(curry φ)(a₁,a₂)(a₀)−bφ(a₀,a₁,a₂)|=0.0`. Opposite actions: 29.17. Degree 0, e₁₂, e₂₁: 1 against −1 | true | R02 (supplier) |
| Dual actions (418; R02) | `dualAction_apply_apply` | `(dualAction R a φ)x=φ(x·a)`, `(dualAction L a φ)x=φ(a·x)`: the README's left and right actions | true; pinned | R02 |
| Banach comparison Check (525–534) | u on ℓ¹₂⊗ℓ¹₂ | projective 4; injective: 2 over ℝ (all sign choices), and over ℂ a 3° grid max 2.828427 against 2√2=2.828427 | true | none |
| Cross property (477–487) | e₀⊗e₀ in ℓ¹ | one-term cost 1; `(e₀+e₁)⊗e₀−e₁⊗e₀` costs 3; pinned `projectiveSeminorm_tmul` gives = | true | none |
| S normalization (712, Lemma 14) | m=1…5 | `S^mτ(1,…)` 1, 2, 6, 24, 120 against m! 1, 2, 6, 24, 120 | true | none |
| IV.1 Prop 2 and λ_n (1039, 1048) | m=0, 2, 4 | `λ_(m+2)/λ_m=−1, −2, −3` against `−(m+2)/2=−1, −2, −3` | true | none |
| FK 4.9(iii) (951; Check 982–985) | p=1/2, diag(1,0), diag(0,4) | ‖S+T‖ 9 > 1+4; p-th powers 3 ≤ 1+2 | true | none |
| FK 4.2(i) Hölder (955; Check 992) | I₂ with p=q=2; diag(2,1)·diag(1,2) | ‖I₂‖₁=2=√2·√2; ‖ST‖₁=4≤√5·√5=5 | true | none |
| Point cycle, Prop 2/0.2 (1070, 1078–1083) | e=[[1,a],[0,0]], a=1 | `ez=ze=ee*e=[[2,2],[0,0]]`, z=diag(2,2); `e−eFeFe=−e[F,e]²e` symbolically; index 1=Tr e | true | none |
| App C partial-sum norm (1120–1123) | p=2, μ_j=(j+1)^(−1/2), N≤2·10⁵ | sup `N^(−1/2)σ_N`=1.99674 against p/(p−1)=2; other direction `Nμ_(N−1)≤σ_N`, constant 1 | true | none |
| Dixmier Def 2 (1135) | diag(1/(j+1)) | `H_N/log(1+N)`=1.08348, 1.05014, 1.04178 at N=10³, 10⁵, 10⁶; the γ/log N tail tends to 0, so Tr_ω=1 | true | none |
| Tauberian Prop 4 (1190–1193) | μ_j=1/(j+1) | `(s−1)ζ(s)`=1.05844 (s=1.1), 1.00578 (s=1.01) → L=1 | true | none |
| Torus Hochschild, Prop 5 (1490–1496) | golden θ, n<2·10⁴; θ∈ℚ | `max |1−λⁿ|⁻¹/n`=0.5365, so Diophantine with k=1; for rational θ, λⁿ=1 at n=q, so excluded | true | none |
| Heisenberg module (1577–1598) | θ=0.37, s=0.61 | `ξ(U₂U₁)/ξ(U₁U₂)=−0.684547+0.728969i=e(θ)`; curvature 16.98158i against 2πi/θ=16.98158i; chiral residual ≤1.6·10⁻⁹ on `exp(−πs²/θ)` | true | none |
| `A_θ` direction (1325–1338; R01) | θ=1/4 | `rotation t f z=f(exp(it)⁻¹z)` at t=−2πθ gives `f(exp(2πiθ)z)`, so uvu*=iv | true | R01 (owner) |
| Odd sign, Hardy (1036–1046, 1561–1567) | circle, u=z | τ₁=2; README `2λ₁/((1+i)√π)=−1.0000`; Connes's constant gives +1; `ind(PzP)=−1`; `((1+i)√π)²/(2πi)=1.0000` | true | none (Source issues) |

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib 1b1ccf4). After building the missing modules, 36 declarations were elaborated by `#check`:
- `TensorProduct.projectiveSeminorm` (`TensorProduct/ProjectiveSeminorm.lean` 123) and `apply_le_mul_projectiveSeminorm` (157);
- `TensorProduct.projectiveSeminorm_tmul` (`…/InjectiveSeminorm.lean` 245; `RCLike`, seminormed);
- `TauCeti.CompletedProjectiveTensor` (`…/Completion.lean` 76; nontrivially normed), `liftIsometry` (196; Banach G) and `norm_mapL_le` (264);
- `TauCeti.ProjectiveTensor.comm`/`lid`/`assoc` (`…/Associator.lean` 62, 87, 207) and the completed `comm`/`lid`;
- `PiTensorProduct.projectiveSeminormOf_tprod_le` (`PiTensorProduct/Projective/Seminorm.lean` 57; ≤ only);
- `ContinuousLinearMap.hochschildBimoduleCoboundary` (`Analysis/Normed/Algebra/HochschildCohomology/Coboundary.lean` 284; `NonUnitalNormedRing`), its norm bound (309; ≤‖L‖+n+‖R‖), δ²=0 (328; three action laws), the degree-0 and degree-1 cocycle lemmas (361 ff.) and coefficient naturality (`…/Coefficients.lean` 67);
- `TauCeti.multilinearCurryFirstEquiv` and `…_hochschildCoboundary` (`RingTheory/HochschildCohomology/Dual.lean` 138; the docstring gives `(xφx′)y=φ(x′yx)`);
- `matrixExtension` (`CyclicCohomology/Matrix.lean` 497), `matrixCochainExtension_single` (275) and the four `matrixCochainExtension_*` commutations;
- `quasiIsoAt_cyclicCochainComplexToTotal` (`Bicomplex.lean` 781);
- `ContinuousLinearMap.dualAction` and five lemmas (`Analysis/Normed/Module/Dual/Bimodule.lean` 82–135).

A further 33 contract names were confirmed present by grep, among them `evenPairingK0`, `AlgebraicK1.oddPairing`, the Fredholm perturbation lemmas, `HasCompactResolvent`, `FullCrossedProduct.*`, `continuousCyclicCohomology` (`Continuous/Cohomology.lean` 239) and `IsDilationInvariant`.

**Cross-roadmap citations resolved.** `roadmaps resolve` finds nothing missing.
- On main (1bea8354):
  - BanachAlgebras A4.1 1128, A6.1 1393–1395 and the A1–A8 legend 181;
  - BanachSpaceTheory B4 267;
  - HilbertModules H1 126, H2 179, H3 262;
  - OperatorAlgebraDynamics D1 148, D2 221, D4 333;
  - NoncommutativeIntegration §1.3 286, §1.4 321, §1.5 360, §1.6 406, §2.1 453;
  - VonNeumannAlgebras V4.Core 972.
- At open heads:
  - #1145 (18e94ffe) §7.2a at 466, consuming N1 at 478 and 497, which agrees with README 19–23 and 1693–1700;
  - #925, #1782 and #1158 consume N1 only.

**Ownership and overlaps.** `overlaps.md` reports:
- no id cited here dropped by an open pull request;
- no id defined only by a revision;
- no id dropped here.

#1187 is the one conflicting head (R03). Of the roadmaps closest by vocabulary:
- #866 is a second owner of `A_θ` (R01);
- #1145 and #1158 consume only;
- #1137 and #1077 do not own these objects.

## Not verifiable

- Connes IV.6, pp. 358–361 (elliptic index formula, cited for comparison only) was not read.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 with Proposition 4, pp. 302–303: the source says the odd constant `√(2i)(−1)^(n(n−1)/2)Γ(n/2+1)` makes the K₁ pairing equal `Index(EuE)`, E=(1+F)/2; it should be minus that index: the circle Hardy module pairs [z] to +1 while `Index(PzP)=−1`; affects a stated result.
