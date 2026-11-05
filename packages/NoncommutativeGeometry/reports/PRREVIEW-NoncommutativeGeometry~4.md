# Review of NoncommutativeGeometry (pull request #1143 at d438539)

**Verdict:** needs changes

Incremental re-review of the 58 lines changed since 497d5ef. The change is the merge of main into the branch: inside `TauCetiRoadmap/NoncommutativeGeometry/` it touches only the generated `PROGRESS.md` (+9) and `STATUS.md` (+41/−17), both byte-identical to their copies on main at a0ad405; `README.md` (957 lines) and `Suggested.lean` (80 lines) are unchanged since 497d5ef (`git diff --stat 497d5ef HEAD -- TauCetiRoadmap/NoncommutativeGeometry` lists the two generated files only). Nothing differs from main outside the folder (`git diff --stat origin/main HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty; the long list under "Files changed outside the folder" in the change summary is main's own history seen from the pre-merge base). The pins moved with the merge, to Mathlib f6090c70 and Tau Ceti 358314d4 (main's), so every library name and the Lean file were re-elaborated at the new pins. The worker's gate at this head fails on `build=1` (R01); the dependency check passes.

## R01 (P1) — The gate's build check fails on lake's `module` advisory

Location: `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` line 5, `import Mathlib`.

Claim: the push gate on this head reports `build=1 FAIL`; its only build line is lake's "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file".

Witness: the worker's gate at d438539 (`… outside-folder=0 source-material=0 build=1 FAIL`, one build line, the advisory). Elaboration itself is clean: `lake env lean` on the file's module gives only the `sorry` warning at line 69, and my rerun of the gate on the already-built head prints `OK` because the advisory appears only on a fresh compile. The brief counts a failing build as a finding whatever its cause, and an acceptance needs the worker's gate to pass at the head.

Repair, tested: prepend the single line `module` before `import Mathlib` (line 5), leaving the imports as they are. A scratch copy with that one line prepended elaborates under `lake env lean` with the `sorry` warning only; the same form passed the gate on another roadmap after the same advisory.

## R02 (P3) — Adjoint invariance of singular values is cited to OI-A20, which is the ideal inequality

Not repaired since the previous review (its R01). Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 418–419, "the ideal bounds `‖ATB‖_p≤‖A‖‖T‖_p‖B‖` and adjoint invariance from OI-A20"; line 574, "adjoint … bounds (OI-A20)".

Witness: on main (a0ad405), `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md` line 156: OI-A20 is the two-sided ideal inequality only; line 196: OI-A30 is adjoint invariance `aₙ(T†)=aₙ(T)` over `RCLike`; line 399: OI-B50 is Schatten adjoint invariance.

Repair: "the ideal bounds … from OI-A20 and adjoint invariance from OI-A30", and add OI-A30 to the N3 and N4 `*Needs:*` lines (556 and 644).

## R03 (P3) — House shape absent; N1.Cyclic, N5 and N7 below three Checks

Not repaired since the previous review (its R02). Location: whole README; `## N1`–`## N7` at lines 102, 277, 383, 558, 646, 728, 822.

Witness: no `# Roadmap:` title, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` or `### Examples`/`### Dependencies` headings; N1.Cyclic (169–276) has no `**Checks.**` list; N5 (683–687) and N7 (891–898) have one Check bullet each.

Repair: Checks for N1.Cyclic (the scalar witness `S^mτ(1,…,1)=m!=σ_m(1,…,1)`; the nonunital `φ(a,b,c)=abc` on ℂ, nonzero on (1,1,1); the sign `(−1)^(n+1)` of the last coboundary term on a two-term example), for N5 (the eigenvalue count of `D=diag(j)` in a bounded interval; `(D−i)⁻¹` compact iff the eigenvalues leave every bounded set) and for N7 (orthonormality of the Fourier basis at line 827; the kernel dimension 2 of the Fourier Dirac operator). The heading reshaping is secondary.

## R04 (P3) — SmoothBanachRepresentations still states N6's two-way seminorm comparison with the same witness

Partly repaired since the previous review (its R03): the direction is fixed, the duplication is not. Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 744–752 (`Q_k≤C_k P_k`, `P_m≤D_m Q_(m+3)`, "at θ=0, a=1+U₁ gives Q_0=1 and P_0=2") against the SmoothBanachRepresentations head b04eb8f, `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md`.

Witness: that head no longer says N6 consumes SB8 (its lines 484, 492 and 494 now read "NoncommutativeGeometry N6 supplies the torus Fourier conventions" and "N6 only for the torus Fourier comparison"), but line 492 still says "Prove that its rapid-decay and derivative seminorm families define the same Fréchet topology by explicit finite-order estimates in both directions … use `Q_k(a)=sup_(r,s)(1+|r|+|s|)^k|a_(r,s)|` and the Layer 2 coordinate-word sums P_m", and its Check at line 504 is "For 1+U₁ at θ=0, Q₀=1 while P₀=2": the same comparison, with the same witness, as N6 lines 744–752.

Repair: not in this folder. SmoothBanachRepresentations cites N6 for the comparison instead of proving it (its line 492 and the Check at 504), or N6 drops lines 744–752 and cites SmoothBanachRepresentations §8 — the first is the direction both READMEs now declare. Recorded again so the author, who owns both pull requests, can make that edit.

## R05 (P3) — The moved B(H) instance has a second owner at the supplier's head, and an on-main trace functional is not distinguished

Not repaired since the previous review (its R04). Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 69–75 and 412–437.

Witness: NoncommutativeIntegration at its open head, `TauCetiRoadmap/NoncommutativeIntegration/README.md` lines 351–354 ("For 0<p<1 define S_p by summability of the p-th powers of the singular values …, prove the p-triangle inequality, the ideal estimates …, completeness of the p-metric") and its line 1414 ("NoncommutativeGeometry consumes Layer 1 (I1): tracial Lp including 0<p<1, Hölder, … specialized to B(H)"), the reverse of what lines 69–75 here say; on main, `TauCetiRoadmap/RandomMatrices/README.md` lines 989–991 build "on the operator-ideal carriers the trace-class integral-operator and Fredholm-determinant theory: summability, the trace functional, exterior powers".

Repair: in this folder, one clause in the scope paragraph (lines 69–75): "RandomMatrices §8.3 builds the trace functional for trace-class integral operators on `L²(μ)` inside its determinantal constructor; N3's trace is on an arbitrary separable H with its cyclicity on dual Schatten classes." The supplier-side edits (NoncommutativeIntegration §1.5 identifying its `Lp(B(H),Tr)` for 0<p<1 with N3's `S_p`, and reversing its line 1414) are the intake's placement edits; nothing in this folder depends on them.

## R06 (P3) — `FredholmPackage` is written without its namespace

Partly repaired since the previous review (its R05): the complexification half is now correct at the new Tau Ceti pin, without an edit. Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 88, 556 and 955 (`FredholmPackage`).

Witness: at Mathlib f6090c70, `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean` line 178 declares `FredholmPackage` inside `namespace ContinuousLinearMap` (line 99); `#check @FredholmPackage` under `import Mathlib` fails (unknown identifier) while `#check @ContinuousLinearMap.FredholmPackage` elaborates. At Tau Ceti 358314d4, `TauCeti/Analysis/Normed/Module/Complexification.lean` closes `namespace TauCeti` at line 345 before `namespace ContinuousLinearMap` at 347, so `complexify` (line 356) is `ContinuousLinearMap.complexify`, exactly the README's name at lines 136 and 167 (`#check` elaborates; `TauCeti.ContinuousLinearMap.complexify` is now unknown).

Repair: write `ContinuousLinearMap.FredholmPackage` at lines 88, 556 and 955.

## Previous findings

- R01 — not repaired: lines 418–419 still read "the ideal bounds `‖ATB‖_p≤‖A‖‖T‖_p‖B‖` and adjoint invariance from OI-A20"; line 574 "adjoint … bounds (OI-A20)". Written again as R02.
- R02 — not repaired: the headings at 1, 10, 102–822 are unchanged; N1.Cyclic has no Checks, N5 and N7 one bullet each. Written again as R03.
- R03 — partly repaired (at the SmoothBanachRepresentations head b04eb8f, not in this folder): "N6 consumes SB8" is gone, replaced by "NoncommutativeGeometry N6 supplies the torus Fourier conventions"; the two-way seminorm comparison and the θ=0 witness are still stated there (lines 492, 504). Written again as R04.
- R04 — not repaired: lines 69–75 unchanged, no RandomMatrices clause; NoncommutativeIntegration's head still constructs `S_p` for 0<p<1 (351–354) and names this roadmap as consumer of I1 (1414). Written again as R05.
- R05 — partly repaired: `ContinuousLinearMap.complexify` (136, 167) is the correct name at Tau Ceti 358314d4; `FredholmPackage` (88, 556, 955) is still bare. Written again as R06.

## Verified sound

**Gate, diff, dependency check.** The worker's gate at d438539: every scanner 0 (`set_option=0 … depcheck=0 stray-files=0 outside-folder=0`), `build=1` with the `module` advisory as its only line (R01). My rerun on the built head: all scanners 0, `OK`. Dependency check on this head:

```
depcheck: 209 roadmaps, 1732 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line (this roadmap is on main and not in the merge order). `PROGRESS.md` and `STATUS.md` are the project's generated status files, present on main for this folder and identical to main's copies (the gate's `stray-files=0` and `prnum=0` agree); the constants they quote, `(m!)⁻¹(φ#Tr)(e,…,e)` and `(1+i)⁻¹ 2⁻ⁿ Γ(n/2+1)⁻¹`, are the README's at lines 285 and 289. Declared gaps: none (no readable `design/plan.json`), none needed.

**Tau Ceti pin and the docstring.** The pinned Tau Ceti 358314d4 (its last commit dated 2026-10-07) has no `TauCeti/RingTheory/CyclicCohomology`, `HochschildCohomology`, `NoncommutativeGeometry/UniversalDifferential` or `Analysis/Normed/Module/PiTensorProduct` directory, and no declaration matching `cyclicCohomology`, `hochschildCohomology`, `UniversalOneForms`, `ProjectiveTensorProduct` or `cycleCocycle`; the library commit 69cd1ab that `PROGRESS.md` reports on is not an ancestor of the pin. So the docstring's list of headlines not statable at the pins (lines 16–28) is still right: nothing statable is missing, and `CyclicTwoCocycle` duplicates no pinned carrier. `#check @Schatten` and `@ContinuousLinearMap.IsTraceClass` are unknown identifiers at Mathlib f6090c70.

**Lean at the new pins (Mathlib f6090c70, Tau Ceti 358314d4).** A scratch file importing the built module with `#check @` for the three declarations: elaborated types identical to the previous report and to `signatures.md` (`CyclicTwoCocycle : {A : Type u} → [Ring A] → [Algebra ℂ A] → Type u`; `torusTwoCochain : … (A →ₗ[ℂ] ℂ) → derivationLieAlgebra ℂ A → derivationLieAlgebra ℂ A → MultilinearMap ℂ (fun _ => A) ℂ`; the theorem with `htrace`, `h₁`, `h₂`, `hcomm`); no binder lost; generality equals README N6 lines 767–770. One-tactic probe on the headline at the new pin (`refine ⟨⟨torusTwoCochain τ δ₁ δ₂, ?_, ?_⟩, rfl⟩ <;> intros <;> simp [torusTwoCochain, mkPiAlgebraFin_apply, List.ofFn_succ, mul_sub, mul_assoc, htrace]`): both goals stay open, the cyclicity goal `τ(a(δ₂b·δ₁c))−τ(a(δ₁b·δ₂c)) = τ(c(δ₂a·δ₁b))−τ(c(δ₁a·δ₂b))` and the four-term cocycle goal, with `htrace` reported unused by `simp`: not padding. The proved `example` (line 58) still elaborates. Imports `Mathlib` and `TauCeti.Algebra.Lie.Derivation.Basic` (`derivationLieAlgebra` at its line 118); no `set_option`, no sorry'd data, `theorem` only. The `module`-prefixed scratch copy elaborates with the `sorry` warning only (R01's repair).

**Library declarations opened at the new pins (file and line).** `ContinuousLinearMap.FredholmPackage` (Fredholm/Basic.lean 178, namespace at 99), `ContinuousLinearMap.IsFredholm.index_comp` (elaborates), `PositiveLinearMap.GNS` (GelfandNaimarkSegal.lean 147) and `gnsStarAlgHom` (246), `CStarModule.inner_op_smul_right` (`inner A x (a • y) = a * inner A x y`; self-module instance Module/Constructions.lean 83), `Matrix.transvection : n → n → R → Matrix n n R` (Transvection.lean 80; the new `GeneralLinearGroup.transvection` in ElementaryRowOperations.lean 97 is a different declaration), `Matrix.GeneralLinearGroup` (GeneralLinearGroup/Defs.lean 42), `IsCompactOperator` (Compact/Basic.lean 69), `PiTensorProduct.projectiveSeminorm` (ProjectiveSeminorm.lean 122), `LinearPMap` self-adjointness via `isSelfAdjoint_def` (LinearPMap.lean 234), `TauCeti.derivationLieAlgebra` (Derivation/Basic.lean 118), `TauCeti.Complexification`, `.reCLM`, `.ofRealLI`, `.equivProd` (Complexification.lean 274, 288, 303) and `ContinuousLinearMap.complexify` (356; all elaborate with the module imported).

**Cross-roadmap citations resolved this round.** OperatorIdeals on main lines 156, 196, 399 (R02); SmoothBanachRepresentations head b04eb8f lines 60–62 (consumes N1's complex completed locally convex projective tensor), 432, 440, 484, 492, 494, 504, 513 (R04; the README's only mention of it, line 904, is a Downstream line, so no cycle); NoncommutativeIntegration head lines 351–354 and 1414 (R05); RandomMatrices on main lines 989–993 (R05). The worker's citation check found no cross-roadmap citation or Lean name missing anywhere. The remaining 16 citations of the previous report (OperatorIdeals OI-A17/A22/B29–B30, BanachSpaceTheory B4, BanachAlgebras A4/A6, SelfAdjointSpectralTheory Part E, OperatorAlgebraDynamics D1/D2/D4, OperatorKTheory K3–K7, CStarAlgebras C1–C5, AlgebraicKTheory line 19, HilbertModules H6, HeisenbergImprimitivity, the consumers at 904–911) concern passages the diff does not touch and stand as verified there. Ownership against open pull requests whose files the brief does not list was not checked.

**Sources.** The diff adds no locator (the two generated files cite the library, not a text), so the seeded sample of 15 falls in no changed passage. Spot-checked again at the cache: `connes94` line 6933 (III.1 Prop. 4, cycle ⇔ cyclic cocycle, the cyclicity and coboundary signs at 6946–6949 as README 200–205 and `CyclicTwoCocycle` lines 41–44), `fack-kosaki` lines 863–872 (Theorem 4.9, clause (iii) for 0<p<1 at 871, p. 295). The 17 locators of the previous report stand.

**Adversarial pass.** No statement changed; every row is carried from the previous report (497d5ef), which computed the values; the first row was recomputed at the new pins this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_cyclicTwoCocycle_torusTwoCochain` (Lean 68; recomputed at the new pins) | `Ω=A⊗Λ(ℂ²)`, `da=δ₁a e₁+δ₂a e₂`, `∫a e₁e₂=τ(a)`; one-tactic probe | `d²a=(δ₁δ₂a−δ₂δ₁a)e₁e₂=0` by `hcomm`; `∫d(ae₁)=−τ(δ₂a)=0` by `h₂`; `∫(ae₁+be₂)(ce₁+de₂)=τ(ad−bc)`, reversed `−τ(ad−bc)` by `htrace`; probe leaves the cyclicity goal and the four-term cocycle goal open | true with exactly the four hypotheses; not padding | none |
| `CyclicTwoCocycle` conventions (Lean 39–44; r3) | n=2 | last b-sign `(−1)³`, cyclic sign `(−1)²` = Connes 6946–6949 | agree with README 200–205 | none |
| N2.1 elementary-matrix Check (312–315; r3) | `u=1+aE_ij`, i≠j | `u⁻¹=1−aE_ij`; every term of `(φ#Tr)` forces `i₁=j` and `i₁=i` | zero | none |
| N2.2 trace cocycle Check (316–319; r3) | idempotent `e∈M_n(ℂ)` | `(0!)⁻¹Tr(e)=rank e`; `c=½` on [1]: ½ | as stated | none |
| N2.3 circle Check (320–325; r3) | `u=z^k` | `ψ(z^(−k),z^k)=k`; pairing `k/((1+i)√π)`; square `1/(2πi)` | additive in k | none |
| N2 odd constants (289, 346; r3) | n=2k+1, k=0..4 | `2^(−n)/Γ(n/2+1)=k!/((2k+1)!√π)` to 1e−16 | agree | none |
| N3.1 `S_p` Check (440–442; r3) | `diag((j+1)^(−3))` | `3p>1 ⇔ p>1/3` | as stated | none |
| N3.2 p-triangle Check (443–446; r3) | p=½, `diag(1,0)`, `diag(0,4)` | `9>5`; `3=1+2` | FK 4.9(iii) sharp | none |
| N3.3 majorization Check (447–452; r3) | `S=diag(2,1)`, `T=[[1,1],[0,1]]` | `μ(ST)=(2.9208,0.6847)`, `μ(S)μ(T)=(3.2361,0.6180)`; products 2, 2 | as stated | none |
| N3.4 Hölder route (419–426; r3) | `‖Λ^nT‖=∏μ_j(T)` | Horn ⇒ log-majorization ⇒ constant 1; OI-A22 alone `2^(1/r)` | sufficient | none |
| N3.5 Hölder Checks (453–460; r3) | `diag(2,1)·diag(1,2)`; `I₂`; `diag(1/(j+1))²` | `4≤5`; `2=√2·√2`; `2r>1` | sharp | none |
| N3.6 `‖T‖_q≤‖T‖_p` (427; r3) | p≤q | `Σμ^q≤‖T‖_p^(q−p)Σμ^p` | true | none |
| N3.7 trace via Schmidt series (428–433; r3) | ONB, `Tx=Σs_j⟨e_j,x⟩f_j` | double sum `≤‖T‖₁` by Cauchy–Schwarz and Parseval; positive T `Σμ_j` | basis-free | none |
| N3.8 trace Checks (461–470; r3) | `P_(e₀)`; `diag(1/(j+1)²)`; shift | `½+½`; `π²/6`; `S*S−SS*=P_(e₀)`, Tr=1, S not compact | as stated | none |
| N3.9 cyclicity (434–437; r3) | 1<p<∞, finite-rank approximants | `|Tr((S−S_n)T)|≤‖S−S_n‖_p‖T‖_q→0` | sufficient | none |
| N3 Hardy calibration (493–496; r3) | `λ₁=−(1+i)Γ(3/2)`, `τ₁=2` | `−1+0i`; `ind(PuP)=−1` | consistent | none |
| N3 product reductions (522–543; r3) | `D`, `D′`, `U=(σ₁−σ₂)/√2` | `−2i/(4π)=1/(2πi)` ⇒ +1; D′ ⇒ −1; cup `((1+i)√π)²/(2πi)=1` | as stated | none |
| N4.1 quasi-norm constant (572–573; r3) | OI-A17 at 2j, 2j+1 | `(2j+1)/(j+1)≤2` ⇒ `2^(1/p)` | correct | none |
| N4.2 comparison constants (575–577; r3) | p=2 | ratios 1.588, 1.859, 1.985 against 2; converse constant 1 | as stated | none |
| N4.3 `|T|^n` (578–579; r3) | `μ_j(T)≤C(j+1)^(−1/n)` | `σ_N≤Cⁿ(1+log N)` | true | none |
| N4.4 Checks 1, 3 (606–609, 617–618; r3) | `diag(1/(j+1))`; `diag(1/((j+2)log(j+2)))` | `H_N/log(1+N)→1`; `0.248` vs `2.63`, `Σ=∞` | as stated | none |
| N4.5 `L^(1,∞)∖S_(1,∞)` Check (610–616; r3) | `N_k=2^(2^k)` to 65536 | `max(j+1)μ_j=6`; `sup σ_N/log(1+N)=2.485` | separating | none |
| N4.6 ω-dependence Check (619–631; r3) | recurrence 60 iterations | `0.74368=2/3+log2/9`, `0.75632=5/6−log2/9` | not measurable | none |
| N4 Tauberian (636–637; r3) | `diag(1/(j+1))` | `(s−1)ζ(s)→1` | Connes IV.2 Prop. 4 | none |
| N5 bounded transform Check (684–687; r3) | `D=diag(0,1,−1)` | `1−F_D²=(1,½,½)`; `1−(signD)²=(1,0,0)` | as stated | none |
| N6.1 multiplier Check (781–786; r3) | `(0,1),(1,0)` | `U₂U₁=λU₁U₂`; reversed gives 1 | as stated | none |
| N6.2 trace Check (787–791; r3) | θ=½; `a=U₁`, `b=U₂U₁⁻¹` | both −1; `ab=λ⁻¹U₂`, `ba=U₂` | as stated | none |
| N6.3 `τδ_j=0` Check (792–795; r3) | monomials | `(0,0)`-coefficient of `2πin_jU₁^mU₂^n`; `2πi` | as stated | none |
| N6.4 seminorms (746–752, 796–798; r3) | θ=0, `a=1+U₁` | `Q₀=1`, `P₀=2`; `Q_k≤(2π)^(−k)P_k`; `Σ(1+|r|+|s|)^(−3)<∞` | as stated | none |
| N7 lattice residue (838; r3) | `ζ_D(s)=2(2π)^(−2s)·4ζ(s)β(s)` | `0.15915=1/(2π)` | as stated | none |
| N7 Heisenberg index (859–865; r3) | `D⁺=−d/ds−2πs/θ` | kernel `exp(−πs²/θ)`; index +1; `(2πi)⁻¹(2πi/θ)·θ=1` | as stated | none |
| N7 opposite-algebra Check (892–898; r3) | `x=e₁₂, y=e₁₁` | `x*y=e₂₁`; `yx*=0`; `inner_op_smul_right` law | matches the pin | none |
| N1.Tensor Checks (148–165; r3) | three tensors | 3 vs 1; n vs √n; `i·ix=−x` | as stated | none |

**README–Lean agreement.** Backticked own names in the README: `CyclicTwoCocycle` (208), `torusTwoCochain` (767), `exists_cyclicTwoCocycle_torusTwoCochain` (769): all declared (gate `readme-ids-missing=0`).

**Wording.** No process words, pull-request numbers or local paths in `README.md` or `Suggested.lean`; the pull-request numbers in `PROGRESS.md` sit in the generator's metadata comment, as on main for every roadmap.

## Not verifiable

- none of the cited texts: both sources were read at the cache (Connes' book from the author's page, Fack–Kosaki from the publisher's open archive). Ownership against open pull requests whose files the brief does not list was not checked.

## Source issues

- none
