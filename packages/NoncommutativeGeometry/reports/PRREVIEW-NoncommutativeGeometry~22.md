# Review of NoncommutativeGeometry (pull request #1143 at 2e5c831)

**Verdict:** needs changes

Incremental re-review of the 27 lines changed since 4f1e952, the head r21 read. The change is the repair of r21's R02 and nothing else: the Tau Ceti contract, the BanachAlgebras supplier row, N1.Cyclic's prose, its *Needs:* line and the N1 Dependencies paragraph now credit the dual actions on the Banach dual to the pinned `ContinuousLinearMap.dualAction`, and BanachAlgebras A4 is no longer a supplier. `Suggested.lean` is unchanged.

- The repair is verified at the pin (below) and introduces no new problem.
- r21's R01 and R03 are unchanged at this head and are carried as R01 and R03 below. No new finding.

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r21 R01 (r20 R01); not repaired.

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The same file, 1722–1725: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ, and OperatorKTheory consumes them.

**Witness.** OperatorKTheory #866 is still at 1377338a. In `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1783–1784 define `A_θ=C(𝕋)⋊_αℤ` and the trace `τ=HaarIntegral∘E`;
- 1796–1797 state the universal presentation and coordinate injectivity;
- 2324–2326 say this roadmap consumes "K7's rotation algebras with their K-groups".

**Repair.** Unchanged from r21. NoncommutativeGeometry is on main, so it is earlier than #866 and may not name it in a *Needs:* line; the README already takes the only admissible direction. So:
- no README edit;
- the pull-request description states that this pull request merges before #866;
- #866 replaces its 1783–1784 and the bullet at 1796–1797 by a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as a consumption of N6.
- Test: afterwards `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P3) — The description describes an earlier head and states no merge order

Carried from r21 R03 (r20 R03); the description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "which merge first: #864"; and a build report for head 84190a1e.

**Witness.**
- `git diff --stat origin/main...HEAD -- TauCetiRoadmap/NoncommutativeGeometry`: `Suggested.lean | 147 +-`.
- README 1555–1569: the product classes are written `x⊠_u y`, `x⊠_s y`.
- No *Needs:* line names AlgebraicKTheory.
- #864 is not open.
- #1187 conflicts in this folder's `Suggested.lean` (overlaps data); its Tau Ceti ab00ba392 lacks `cyclicCohomology.matrixExtension`.

**Repair.** Unchanged from r21. Rewrite the description for this head: N1.Tensor consumes Tau Ceti's Banach and locally convex projective tensors and BanachSpaceTheory B4's norm comparison; N1.Cyclic consumes the pinned bounded coboundary, currying and dual actions; N3–N4 consume NoncommutativeIntegration and VonNeumannAlgebras V4.Core; N6 builds `A_θ` on Tau Ceti's full crossed product; N7 consumes HilbertModules H1–H3; `Suggested.lean` states only `bijective_matrixExtension`. State the order: #866 merges after this pull request (R01); SmoothBanachRepresentations #1145 and LocallyConvexDuality #1782 merge after it; #1187 rebases onto main's pin after it. Drop the #864 line and the build report for 84190a1e.

## Previous findings

- r21 R01 — not repaired: README 50–56 "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ" and 1722 "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ"; #866 still at 1377338a with 1783–1784 and 2324–2326 as quoted. Carried as R01.
- r21 R02 — repaired: README 305–316 "for a bounded bimodule E with left action L and right action R, the dual actions `ContinuousLinearMap.dualAction` on `StrongDual 𝕜 E` … (`Analysis/Normed/Module/Dual/Bimodule`)"; row 429 "BanachAlgebras A2, A6 … The bounded coboundary and the dual actions `ContinuousLinearMap.dualAction` … are Tau Ceti's"; 629–630 "under the pinned dual actions"; 762 and 780 end "BanachAlgebras A6". `grep A4` finds nothing. All six names exist at the pin with the stated hypotheses (below).
- r21 R03 — not repaired: the description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged" and "which merge first: #864". Carried as R02.

No repair report marked any finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**The changed passages at the pin** (Tau Ceti 2fd255d, the same pin as main; Mathlib 1b1ccf4). `TauCeti/Analysis/Normed/Module/Dual/Bimodule.lean`, elaborated by `#check` in a scratch file importing that module:
- `ContinuousLinearMap.dualAction` (82): `(A →L[𝕜] E →L[𝕜] E) → A →L[𝕜] StrongDual 𝕜 E →L[𝕜] StrongDual 𝕜 E`, for `𝕜` nontrivially normed and `A`, `E` seminormed spaces; `dualAction_apply_apply` (88): `dualAction M a φ x = φ (M a x)`. So `dualAction R a φ x = φ(x·a)` and `dualAction L a φ x = φ(a·x)`: the README's left and right actions at 307–309.
- `dualAction_mul_apply_of_right` (103): under `R (a*b) x = R b (R a x)`, `dualAction R (a*b) φ = dualAction R a (dualAction R b φ)`; `dualAction_mul_apply_of_left` (111): under `L (a*b) x = L a (L b x)`, `dualAction L (a*b) φ = dualAction L b (dualAction L a φ)`; both need `[Mul A]` only. `dualAction_apply_dualAction_apply_comm` (121): under `L a (R b x) = R b (L a x)`, the two dual actions commute. These are the README's "bimodule laws for associative commuting L and R" (309–313).
- `continuous_toWeakDual_dualAction` (128): `Continuous fun φ : WeakDual 𝕜 E ↦ toWeakDual (dualAction M a (toStrongDual φ))`: the README's "weak-star continuity in the dual variable" (314–315).
- The module path the README gives, `Analysis/Normed/Module/Dual/Bimodule`, is the file's path.
- Consistency with the untouched Check at 736–745: `(a·φ)·b = dualAction L b (dualAction R a φ)` evaluates at x to `φ(b x a)`, the README's `(aφb)(x)=φ(bxa)`; and with the pinned `TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary` docstring `(xφx′)y=φ(x′yx)` (r21).

**Gate, dependency check, elaboration, signatures.**
- `gate … --base origin/main` at 2e5c831, run here: every scanner 0, `OK`; the worker's run agrees.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. No gaps are declared.
- `lake env lean TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0 with the single warning `declaration uses sorry` at 64:8. The file is byte-identical to the one r21 read, so r21's `#check` of `bijective_matrixExtension` (no `variable` block, no lost binder, README 682–687 generality) and its one-tactic probe (not padding) stand.

**Headlines.** Unchanged since r21: matrix Morita invariance is stated; the N3 index theorem, N5 Hochschild class, N6 HP and N7 index are named in the docstring as not statable, each with the carrier it lacks.

**Sources.** The diff touches no locator; the seeded sample is the same 15 targets r21 verified (`grothendieck52` 153–172, 183, 210, 164–170; `connes85` 2592–2594; `connes94` 7258–7278, 11282–11284, 11082–11100, 17381–17403, 11754–11760, 11789–11793, 7978–7983, 13549–13555, 13560; `fack-kosaki` 863–871, 935–937, 605–606), none of them in or dependent on a changed passage; no locator is flagged unverified.

**Adversarial pass.** The rows for untouched statements are r21's (its values recomputed there); the dual-action row is recomputed for this review in a pure-Python scratch script on M₂(ℂ) with random complex a, b, x and a random functional φ.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Dual actions and their laws (305–316, 429, 629–630; changed) | M₂(ℂ), E=A, L a x=ax, R a x=xa; random a, b, x, φ | `(dualAction R a φ)(x)` −0.73969+0.89245i = `φ(xa)`; `(dualAction L a φ)(x)` 1.21032−0.97888i = `φ(ax)`. Residuals of `(ab)·φ=a·(b·φ)`, `φ·(ab)=(φ·a)·b`, `(a·φ)·b=a·(φ·b)`: 6.3·10⁻¹⁶, 1.4·10⁻¹⁶, 2.5·10⁻¹⁶. Wrong model (left action = `dualAction L`): `|(ab)·φ−a·(b·φ)|(x)`=4.7638, so `dualAction L` is not a left action and the README's assignment is forced | true | none |
| `bijective_matrixExtension` (Lean 64; 682–710) | r21: n=0, A=R=M=ℚ, ι=Fin 2; ι=∅; A=0 | r21: traces on M₂(ℚ) restrict to E₁₁ and invert φ↦φ#Tr; ι=∅ gives `HC⁰(0)=0≠ℚ`, so `[Nonempty ι]` needed and present; A=0: 0=0 | true | none |
| Currying Check (736–745) | r21: random M₂(ℂ), bilinear φ, n=1; degree 0 | r21: pinned actions `|δ(curry φ)(a₁,a₂)(a₀)−bφ(a₀,a₁,a₂)|=0.0`; opposite actions 29.17; degree 0, e₁₂, e₂₁: 1 against −1 | true | none |
| Banach comparison Check (536–545) | r21: u on ℓ¹₂⊗ℓ¹₂ | r21: projective 4; injective 2 over ℝ, 2.828427 against 2√2 over ℂ | true | none |
| Cross property (488–498) | r21: e₀⊗e₀ in ℓ¹ | r21: one-term cost 1; two-term 3; pinned `projectiveSeminorm_tmul` gives = | true | none |
| S normalization (723, Lemma 14) | r21: m=1…5 | r21: `S^mτ(1,…)` 1, 2, 6, 24, 120 = m! | true | none |
| IV.1 Prop 2 and λ_n (1050, 1059) | r21: m=0, 2, 4 | r21: `λ_(m+2)/λ_m=−1, −2, −3` = `−(m+2)/2` | true | none |
| FK 4.9(iii) (962; Check 993–996) | r21: p=1/2, diag(1,0), diag(0,4) | r21: ‖S+T‖ 9 > 1+4; p-th powers 3 ≤ 1+2 | true | none |
| FK 4.2(i) Hölder (966; Check 1003) | r21: I₂, p=q=2; diag(2,1)·diag(1,2) | r21: 2=√2·√2; 4≤5 | true | none |
| Point cycle, Prop 2/0.2 (1081, 1089–1094) | r21: e=[[1,a],[0,0]], a=1 | r21: `ez=ze=ee*e=[[2,2],[0,0]]`; `e−eFeFe=−e[F,e]²e`; index 1=Tr e | true | none |
| App C partial-sum norm (1131–1134) | r21: p=2, μ_j=(j+1)^(−1/2), N≤2·10⁵ | r21: sup `N^(−1/2)σ_N`=1.99674 against 2; `Nμ_(N−1)≤σ_N` | true | none |
| Dixmier Def 2 (1146) | r21: diag(1/(j+1)) | r21: `H_N/log(1+N)` 1.08348, 1.05014, 1.04178 at N=10³, 10⁵, 10⁶ → 1 | true | none |
| Tauberian Prop 4 (1201–1204) | r21: μ_j=1/(j+1) | r21: `(s−1)ζ(s)` 1.05844, 1.00578 → 1 | true | none |
| Torus Hochschild, Prop 5 (1501–1507) | r21: golden θ, n<2·10⁴; θ∈ℚ | r21: `max |1−λⁿ|⁻¹/n`=0.5365, Diophantine k=1; rational θ excluded | true | none |
| Heisenberg module (1588–1609) | r21: θ=0.37, s=0.61 | r21: `ξ(U₂U₁)/ξ(U₁U₂)=e(θ)`; curvature 16.98158i = 2πi/θ; chiral residual ≤1.6·10⁻⁹ | true | none |
| `A_θ` direction (1336–1349; R01) | r21: θ=1/4 | r21: `rotation t f z=f(exp(it)⁻¹z)` at t=−2πθ gives `f(exp(2πiθ)z)`, so uvu*=iv | true | R01 (owner) |
| Odd sign, Hardy (1047–1057, 1572–1578) | r21: circle, u=z | r21: τ₁=2; `2λ₁/((1+i)√π)=−1.0000`; `ind(PzP)=−1`; `((1+i)√π)²/(2πi)=1.0000` | true | none (Source issues) |

**Cross-roadmap citations in the changed passages.** BanachAlgebras A2 and A6 on main (3090489): §6.1 (1381) at 1393–1395 plans the cohomology groups `Hⁿ=Zⁿ/Bⁿ` and the bounded currying compatibility, neither at the pin, so A6 stays a supplier; A2's holomorphic calculus is unchanged. The dropped A4 (§4.1 at 1123, dual actions at 1128) planned only the dual actions, which the pin has. The *Needs:* line at 762 names only Tau Ceti declarations, Mathlib and A6; the dependency check accepts it. `roadmaps resolve` reports nothing missing.

**Ownership and overlaps.** `overlaps.md`: no id cited here is dropped by an open pull request, none is defined only by a revision, none dropped here is cited elsewhere. #1187 is the one conflicting head (R02). Of the roadmaps closest by vocabulary, #866 is a second owner of `A_θ` (R01); #1145 and #1158 consume N1 only; #1137 and #1077 do not own the changed objects. The dual actions are Tau Ceti's and no open roadmap claims them: `roadmaps grep --fixed 'ContinuousLinearMap.dualAction'` over the 457 open heads and main hits only this README (307–313, 429, 630, 762).

Remarks on untouched text: none beyond r21's.

## Not verifiable

- Connes IV.6, pp. 358–361 (elliptic index formula, cited for comparison only) was not read, as in r21; no changed passage depends on it.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 with Proposition 4, pp. 302–303: the source says the odd constant `√(2i)(−1)^(n(n−1)/2)Γ(n/2+1)` makes the K₁ pairing equal `Index(EuE)`, E=(1+F)/2; it should be minus that index: the circle Hardy module pairs [z] to +1 while `Index(PzP)=−1`; affects a stated result.
