# GATE-NoncommutativeGeometry~2: answers to the review of baec219

The review covers head `baec219`; the branch was at `dc9db8d` when this job started, and is now at `cf94efe9`. The review makes two findings (F01, F02), numbered H01 and H02 below. Its "Previous findings" and "Verified sound" sections, and its remark on `module` visibility (which it says is not a finding), ask for no change.

## H01 (CBirkbeck) — applied

This is the review's second repair ("this folder yields"). Commit `dc9db8d` restricted N1.Tensor to complex scalars and deleted the real/complex scalar dictionary and its kernel Check. `TauCetiRoadmap/NoncommutativeGeometry/README.md` Scope (lines 15–21) now says that the real construction, the complexification isomorphism and the balancing quotient are SmoothBanachRepresentations §7.2a's. The `TauCeti.Complexification` supplier sentence and *Needs* item are gone, and Downstream (lines 1098–1100) reads "SmoothBanachRepresentations §7.3 consumes N1.Tensor's complex completed locally convex projective tensor …, and its §7.2a owns the real construction and the scalar-comparison maps". The SmoothBanachRepresentations head `b04eb8f` agrees at its lines 62, 432, 440, 455 and 478 ("NoncommutativeGeometry N1 for complex factors; §7.2a for real factors and the scalar comparisons"). `grep` finds no remaining `𝕜`, `Complexification` or real-tensor statement in the README.

`dc9db8d` added two Checks in place of the deleted one. Re-checking them found a non sequitur in the second (README lines 199–205). It went from "with p=0, `π_(|·|,0)` vanishes identically" to "so the separated quotient precedes the completion", but one degenerate seminorm says nothing about whether the whole family separates points. Old: "…vanishes identically, so the separated quotient precedes the completion". New: "…vanishes identically, so no single seminorm of the family separates points; the family separates the points of ℂ⊗E exactly because the continuous seminorms of the Hausdorff space E separate its points" (commit `cf94efe9`).

## H02 (CBirkbeck) — answered

No change in this folder; the review itself puts the repair outside it. N6 keeps the two-way comparison: README lines 886–895 (`P_m`, `Q_k≤C_k P_k`, `P_m≤D_m Q_(m+3)`, constants independent of a and θ) and the Check at line 939 (θ=0, `a=1+U₁`: `Q_0=1`, `P_0=‖1‖+‖U₁‖=2`). The SmoothBanachRepresentations head `b04eb8f` still proves the same comparison at its line 492, so the duplication stays open until §8.1 there cites N6 instead.

## Adversarial pass on the statements this round touches

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| N1.Tensor Check, ℂ-bilinearity (README 194–198) | ℂ⊗_ℂℂ vs ℂ⊗_ℝℂ; `β(x,y)=xȳ` | `1⊗i=i(1⊗1)=i⊗1` in ℂ⊗_ℂℂ; `β(1,i)=−i`, `β(i,1)=i`; ℂ⊗_ℝℂ has basis 1⊗1, 1⊗i, i⊗1, i⊗i, so 1⊗i≠i⊗1; `β(x,y)=xy` gives the multiplication isomorphism | true | none |
| N1.Tensor Check, scalar unit (199–205) | `t=Σλ_i⊗x_i`; `p=0`; E={0}; E=ℂ, p=\|·\| | ≥: any representation `Σμ_j⊗y_j` of t has `Σ\|μ_j\|p(y_j)≥p(Σμ_jy_j)=p(Σλ_ix_i)`; ≤: `t=1⊗Σλ_ix_i` gives `p(Σλ_ix_i)`; p=0 gives 0 on all t, yet E Hausdorff means some p has p(x)≠0 for each x≠0, so `π_(\|·\|,p)(1⊗x)=p(x)>0`; E={0} gives ℂ⊗{0}={0}; E=ℂ: `π(1⊗1)=1` | the old wording "so the separated quotient precedes the completion" did not follow from these values | wording repaired |
| N1.Tensor Scope, complex only (15–21) | the uses in N1.Cyclic–N7 and the downstream consumers on GL_k(ℝ/ℂ) | every algebra, cochain and spectral triple in N1.Cyclic–N7 is over ℂ; GanGrossPrasadUnitaryGroups (rev 1404, lines 107, 360) and AutomorphicSpectralTheoryPartII (rev 1761, line 13) take N1's tensor of complex representation spaces; RefinedTraceMethods (rev 1493, line 59) takes "complex algebras" | no consumer needs real scalars from N1 | none |
| N6 seminorm Check (939) | θ=0, `a=1+U₁` | `Q_0=sup\|a_(r,s)\|=1`; `P_0=‖a‖_(C(𝕋²))=sup\|1+z\|=2` | as stated | none |

## Suggested.lean

Unchanged this round. The three declarations (`CyclicTwoCocycle`, `torusTwoCochain`, `exists_cyclicTwoCocycle_torusTwoCochain`) have the elaborated types in the signature file. No section binder is dropped: the structure and the def mention only `A`, `[Ring A]` and `[Algebra ℂ A]`, and the theorem carries `htrace`, `h₁`, `h₂` and `hcomm` explicitly. These types match README N6, and since the Lean file did not change, `#check` was not re-run.

## Ownership

The real locally convex projective tensor and the scalar-comparison maps now have one owner, SmoothBanachRepresentations §7.2a at its head `b04eb8f`. The complex construction stays with this roadmap's N1.Tensor, which that head consumes (line 62).

## Build and gate

- `lake build TauCetiRoadmap.NoncommutativeGeometry.Suggested`: `Build completed successfully (8956 jobs)`; only warning `Suggested.lean:69:8: declaration uses 'sorry'`.
- Gate at `cf94efe9`: `gate NoncommutativeGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 231 roadmaps, 2107 edges, 0 problem(s)`. It shows no UPWARD, CYCLE or moved: line.
