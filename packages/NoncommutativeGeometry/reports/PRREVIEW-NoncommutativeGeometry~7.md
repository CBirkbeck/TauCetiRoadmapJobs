# Review of NoncommutativeGeometry (pull request #1143 at a815fd0)

**Verdict:** accepted

Incremental re-review of 1 changed line since cf94efe (the head the previous review read): one blank line inserted in `TauCetiRoadmap/NoncommutativeGeometry/README.md` after line 413, which closes N2's `**Checks.**` list before the K3-transport paragraph. `Suggested.lean` is unchanged (`git diff cf94efe..HEAD --stat -- Suggested.lean` is empty), nothing outside the folder differs from main, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: lines 413–415 now read "…not square to `1/(2πi)` on the Bott class." / blank line / "For inverse-closed dense Fréchet subalgebras transport them through K3 to C*-K₀/K₁ …"; the paragraph at 415–421 is no longer a lazy continuation of the third Check bullet. The repair introduced nothing else: the inserted line is empty, the paragraph still reads as the targets block it was before (its "them" is N2's pairings, defined above the Checks), and every other `**Checks.**` list in the file (N1.Tensor 180, N1.Cyclic 316, N3 537, N4 712, N5 800, N6 926, N7 1046) already ends before a blank line (a script walking each list from its `**Checks.**` line to the first non-bullet, non-indented line found a blank line at 181, 317, 414, 569, 740, 825, 945, 1086).

The findings of the two earlier reports (board review of d438539, R01–R06; review of baec219, F01–F02) were accounted for in the previous report; the settled ones (R04/F02, SmoothBanachRepresentations §8.1's restatement of N6's seminorm comparison, which is that open roadmap's edit) stay settled and are recorded for the human, not raised.

## Verified sound

**Gate and dependency check (run this round at a815fd0).** `tauceti-roadmap gate … --base origin/main`: every scanner 0 (`set_option=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0`), `OK`; the worker's gate at this head additionally records `build=0`. The dependency check:

```
depcheck: 228 roadmaps, 2152 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line (the roadmap is on main and not in the merge order). Declared gaps: none, and none needed. The folder holds only `README.md`, `Suggested.lean` and the project's generated `PROGRESS.md`, `STATUS.md`, `metadata.toml`.

**Lean at the pins (Mathlib f6090c70, Tau Ceti 358314d4; `lake env lean` on a scratch copy with `#check @` of all three declarations, 14 s).** Elaboration gives the single warning "declaration uses `sorry`" at line 69 and the three types: `CyclicTwoCocycle : {A : Type u} → [Ring A] → [Algebra ℂ A] → Type u`; `torusTwoCochain : … (A →ₗ[ℂ] ℂ) → derivationLieAlgebra ℂ A → derivationLieAlgebra ℂ A → MultilinearMap ℂ (fun _ => A) ℂ`; `exists_cyclicTwoCocycle_torusTwoCochain` with `htrace`, `h₁`, `h₂`, `hcomm` explicit, identical to the previous review's elaboration and to `signatures.md`; no binder lost; generality equals README lines 913–916. The file is byte-identical to the one the previous review probed, so its one-tactic result stands: the headline is not padding (both goals remain open under the `refine …; simp […]` probe), the proved `example` at line 59 is the one kept example, imports are `Mathlib` and `TauCeti.Algebra.Lie.Derivation.Basic`, `module` at line 1, no `set_option`, no sorry'd data, `theorem` only, and the docstring's list of unstatable headlines (lines 17–29) is right at the pins (no cyclic cohomology, Schatten ideal, Dixmier trace or smooth rotation algebra in Tau Ceti 358314d4 or Mathlib f6090c70).

**README–Lean agreement.** The change adds no name; the backticked own names `CyclicTwoCocycle` (249), `torusTwoCochain` (913, 971) and `exists_cyclicTwoCocycle_torusTwoCochain` (915) are all declared (gate `readme-ids-missing=0`). The worker's citation check found no cross-roadmap citation or Lean name missing.

**Wording.** The inserted line is blank; grep for process words, pull-request numbers, LaTeX delimiters and local paths over `README.md` and `Suggested.lean` is empty.

**Adversarial pass.** The diff touches no statement, so no new values were needed; the rows of the previous report (review of cf94efe) are carried forward unchanged, each with the values it recorded. The rows for the N2 Checks adjoining the changed line were re-read against the text at this head:

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| N2 elementary-matrix Check (400–403) | `u=1+aE_12` in `M_2`, `φ#Tr` of degree 1 and 3 | `u⁻¹−1=−aE_12`, `u−1=aE_12`; `E_12²=0`, so every monomial in two or more of these factors is 0 and each term of `(φ#Tr)(u⁻¹−1,u−1,…)` vanishes | as stated (previous report) | none |
| N2 degree-zero trace Check (404–408) | `e=diag(1,0)`, `e=diag(1,1,0)`, `c=1/2` | `Tr(e)=1,2=rank e`; `Tr(e⊕e′)=Tr e+Tr e′`; `Tr(geg⁻¹)=Tr e`; `½·Tr(1)=½∉ℤ` | as stated (previous report) | none |
| N2 circle Check (409–413) | `z^k`, k=1,2,−1 | `ψ(z^(−k),z^k)=(2πi)⁻¹∮z^(−k)·kz^(k−1)dz=k`; three constant-argument terms 0; `⟨[z²]⟩=2⟨[z]⟩`, `⟨[z⁻¹]⟩=−⟨[z]⟩`; `((1+i)√π)²/(2πi)=2iπ/(2πi)=1` | as stated (previous report) | none |
| `exists_cyclicTwoCocycle_torusTwoCochain` (Lean 69) | as in the previous report | `d²a=(δ₁δ₂a−δ₂δ₁a)e₁e₂=0` by `hcomm`; `∫d(ae₁)=−τ(δ₂a)=0`; probe leaves both goals open | true with exactly the four hypotheses; not padding (previous report) | none |
| N1.Tensor, N1.Cyclic, N3, N4, N5, N6, N7 rows | as in the previous report | as recorded there (ℂ-bilinearity `1⊗i=i⊗1`; periodicity `m!` for m=1,2,3; `M₂` coboundary 2; `HC^(2k)(ℂ)=ℂ`; `D=diag(0,1,−1)` resolvent values; `H_N` Dixmier examples; `U=(σ₁−σ₂)/√2` reductions; `λ₁=−(1+i)√π/2`; `θ=½` torus values; Fourier-mode counts `1,4,4,8,12`; Heisenberg index ±1) | as stated (previous report) | none |

**Cross-roadmap citations and sources.** The diff adds or changes none; the resolutions of the previous report (OperatorIdeals OI-A17/A20/A22/A30/B29–B30, BanachSpaceTheory B4, OperatorAlgebraDynamics D1/D2/D4, SelfAdjointSpectralTheory Part E, RandomMatrices §8.3 on main; OperatorKTheory K1–K7, CStarAlgebras C1–C5, SmoothBanachRepresentations §7.2a/§7.3/§8.1, NoncommutativeIntegration, SpectralManifolds, CompactQuantumMetricSpaces, HeisenbergImprimitivity at their heads) and its 20 locators read at the cache (`connes94`, `fack-kosaki`) stand; the seeded sample of 15 was covered there.

## Not verifiable

- none: the only change is a blank line. Ownership against open pull requests whose files the brief does not list was not checked beyond the previous report's `roadmaps grep`.

## Source issues

- none
