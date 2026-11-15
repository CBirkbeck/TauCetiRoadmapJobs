# Review of QuaternionicModularForms (pull request #934 at bed3af7)

**Verdict:** accepted

Incremental re-review of 130 changed lines since 252a01b (`README.md` only: Summary, Scope, `### From Tau Ceti`, `### From TauCetiRoadmap.CompactOperators`, §§1.2, 2.3, 3.3, 4.1 and the Dependencies of Layers 1–4), with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: "Define `f|γ=j_κ(γ)·f(w_γ)` … as Tau Ceti's weighted substitution `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM` … The right-action law then follows from `…restrictedWeightedSubstCLM_comp`"; the contract names all six declarations.
- R02 — repaired: "define `H_κ(T)=det(1−TU_π)` as Tau Ceti's `ContinuousLinearMap.charPowerSeries` of `U_π` on the (Pr) module of §2.3 (CompactOperators §1.5)"; the contract states `‖1‖=1` and `TauCeti.NormedRing.IsTate`.
- R03 — repaired: "AdelicAlgebraicGroups, the quaternionic class sets and definite stabiliser theorem; PadicFunctionalAnalysis and CompactOperators, the Banach-module and compact-operator theory; Tau Ceti, the restricted-series weighted substitution … and the Fredholm series".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.2: `σ(c)z_σ+σ(d)` is a unit at `s` with `‖σ(c)‖s_σ<1`, by `isNormMulUnit_of_norm_sub_C_lt` | `γ=((1,0),(p,1))`, `s=1`; endpoint `s=p` | `‖pz‖_1=p⁻¹<1=‖1‖`, lemma applies; at `s=p`, `‖pz‖_s=1`, excluded, and `pz+1` vanishes at `z=−1/p` | Pass |
| §1.2: `‖w_{γ,σ}‖_s≤s_σ` needs `1≤s_σ` | `γ=((1,1),(0,1))` at `s=1` and `s=p⁻¹`; `γ=((1,0),(p,1))` at `s=p^{1/2}` | `‖z+1‖_1=1≤1`; `‖z+1‖_{1/p}=1>p⁻¹`, excluded; `‖z‖_s·‖(pz+1)⁻¹‖=p^{1/2}·1≤s` | Pass |
| §1.2: right action from the cocycle and `restrictedWeightedSubstCLM_comp` | pin: `(g,h)∘(g′,h′)=(g·g′(h), h′(h))`; `γ=diag(p,1)`, `δ=((1,0),(p,1))`, `n(u)=uᵏ` | `(f|γ)|δ`: weight `j(δ)·j(γ)(w_δ)=(pz+1)ᵏ=j(γδ)`; substitution `w_γ(w_δ)=pz/(pz+1)=w_{γδ}` | Pass |
| Contract: "following it by `(g′,h′)` gives weight `g′·g(h′)`, substitution `h(h′)`" | `f↦g·f(h)↦g′·g(h′)·f(h(h′))`; `g=1`, `h=pz`, `g′=1`, `h′=z/(pz+1)` | `f(pz/(pz+1))`; the pin's `_comp` with the roles exchanged gives the same | Pass |
| §1.2 and contract: identity law "when `‖1‖=1`" | zero ring; `R=K` | `‖1‖=0`, `NormOneClass` fails, law not claimed; over `K`, weight `1`, `h=X`, `‖X_i‖=r_i≤r_i`, identity | Pass |
| §1.2 third bullet: weight-`1` substitution row compact when `‖w_γ‖_c≤1`, `c>1` | `γ=diag(p,1)`, `c=p^{1/2}`; `γ=((1,0),(p,1))`, `c=p^{1/2}` | `‖pz‖_c=p^{−1/2}≤1`, rows `≤c^{−e}→0`; `‖z/(pz+1)‖_c=p^{1/2}>1`, hypothesis fails, as the Check with `det γ=1` requires | Pass |
| §1.2 first bullet vs `matrixCoeff_weightedSubstCLM` | `γ=((1,0),(p,1))`, column `t=1`, row `m` | `coeff_m(1·w)=(−p)^{m−1}`, the README Check's value | Pass |
| §2.3: (Pr) for `M(U,A)` by `TauCeti.HasPr.of_retract` | `i` the inclusion, `r=E`; zero module | `r∘i=id` since `E` fixes its image; for `M=0`, `0=id` holds, (Pr) | Pass |
| §4.1: `H_κ` as `charPowerSeries`; choices by `_eq`, `_conj`; radius by `_comp_comm` | `f(z)↦f(πz)` on `C₀(ℕ,K)`; stages `r′<r`, `U_r=β∘ρ`, `U_{r′}=ρ∘β` | `∏_{j≥0}(1−π^jT)`, unchanged under conjugation; `H_{β∘ρ}=H_{ρ∘β}` with `ρ` compact; junk value `1` needs no (Pr), excluded by §2.3 | Pass |
| Contract: `charPowerSeries` facts need `‖1‖=1` and `IsTate` | pin, `PrModule/Basic.lean:122–123` | `[NormedCommRing R] [NormOneClass R] [IsUltrametricDist R] [CompleteSpace R] [TauCeti.NormedRing.IsTate R]`; the README states all five | Pass |
| Description, summary block: who supplies what | README:6–10 and `### From Tau Ceti` | class sets from AdelicAlgebraicGroups §5.3; weighted substitution and Fredholm series from Tau Ceti; same at the head | Pass |
| Description: "§1.2 … leaving as targets … that `cz+d` is a unit, the radius bounds, the cocycle and independence of the expansion data" | README §1.2 | the four items "Prove that …" are these four; action, identity and bound laws are cited from the pin | Pass |
| Description: three open suppliers, seven on main; this roadmap earliest of four | main e6f6358, `ORDER.txt`, open heads | seven folders on main; #871, #1037, #432 open; lines 61 < 102, 164, 169; neighbour heads 52b00d9, 3cac94e, 480c64f as read before | Pass |

The rows for all other statements stand as in the previous review, of 252a01b.

- Gate rerun on bed3af7 (`--base origin/main`): every check 0, `OK`; the worker's gate records `build=0`. `lake env lean TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`: exit 0, no output. The file declares nothing: nothing to `#check`, nothing to probe for padding.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Library declarations opened at Tau Ceti `2fd255d9` (15): `RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean:90,105,115,128,182`; `Analysis/Normed/Operator/RowCompact/WeightedSubst.lean:87`; `RingTheory/MvPowerSeries/TateAlgebra/Units.lean:96` (namespace `MvPowerSeries`, as cited); `Analysis/Normed/Monoid/MulUnit.lean:66`; `Analysis/Normed/Module/Bases/PotentiallyONable.lean:89,125`; `Analysis/Normed/Operator/RowCompact.lean:115`; `RowCompact/PrModule.lean:105`; `Nonarchimedean/PrModule/Basic.lean:91,148,179,196`.
- Source locators read (3): buzzard-eigen Lemma 8.1 (line 2105), Lemma 12.2 (line 2880, pp. 78–79), Lemma 13.1 (line 2920, pp. 79–80), for the changed §§1.2 and 3.3. Of the seeded sample, §§1.2 and 4.1 fall in the change; neither changed passage carries a source locator.
- Cross-roadmap citations in the changed passages resolved on main e6f6358 (4): CompactOperators §§0.1–0.3 (`README.md:151`, `221`, `250`), §1.4 (`:400`), §1.5 (`:418`); PadicFunctionalAnalysis §2.2. The resolver's one lead, `LocallySymmetric.AutomorphicForm`, is ArithmeticLocallySymmetricSpaces' name, as before.
- Description checked sentence by sentence against the head: pins `2fd255d9` and `1b1ccf4b` match `lake-manifest.json`; `metadata.toml` has `topic = "math.NT"`; the docstring names the three missing groups and the two Tau Ceti ingredients; commit 76032ac is in the branch.
- Remark on untouched text: the pin also has `TauCeti.MvPowerSeries.isCompletelyContinuous_restrictedRadiusCLM` and `TauCeti.AnalyticStage.isRowCompact_transition` (improvement of radius, disc refinement), which §§1.4 and 3.3 reach through CompactOperators §0.3.
- Overlap check: read AutomorphicGaloisRepresentations (480c64f), GL2AutomorphicRepresentationsAndTransfer (52b00d9), HilbertModularVarietiesAndShimuraCurves (3cac94e), CompactOperators, PadicFunctionalAnalysis, RestrictedPowerSeries. Shared with the first three: forms, coefficient modules, refinement fibres, (Pr), compactness, Fredholm series, classicality; owner QuaternionicModularForms (earlier in the merge order). The three on main are suppliers; nothing they plan is restated.
- Source independence: changed passages only; 3 passages (§§1.2, 3.3, 4.1) compared with 1 source (buzzard-eigen Lemmas 8.1, 12.2, 13.1), none shared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "Lake's only warning is its suggestion to adopt the module system" (description, Checks): this review ran `lake env lean` and the gate, and did not read Lake's own warnings.
- Gross (1999) and Harder (1987), §3: paywalled, cited by locator only, unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md`, "Existing Lean work", links WilliamCoram/PhD at commit `eefb3d9` as a secondary implementation reference; its licence was not read. `Suggested.lean` declares nothing, so no Lean is adapted from it.
