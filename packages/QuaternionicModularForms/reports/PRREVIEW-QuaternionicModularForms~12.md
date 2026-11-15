# Review of QuaternionicModularForms (pull request #934 at 252a01b)

**Verdict:** needs changes

Incremental re-review of 34 changed lines since e40ec42 (the `Suggested.lean` docstring), with the pin bump that came in when main was merged (Tau Ceti `a91d3aaf` → `2fd255d9`, Mathlib `6b7abb3c` → `1b1ccf4b`). Every finding is P3.

## R01 (P3) — §1.2 states as targets the weighted substitution that the new Tau Ceti pin proves

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md` §1.2, lines 473–476: "Construct the action by bounded multiplication and analytic substitution … Prove preservation of the restricted algebra, boundedness, the identity and right-action laws"; also its first bullet (the column formula) and third bullet (compactness, "CompactOperators §0.3").

**Claim:** At Tau Ceti `2fd255d9` the operator `f ↦ g·f(h)` is proved for any `g` and any `h` with `‖h_i‖≤r_i`, together with its bound, its identity and composition laws, its columns and its row compactness. The changed docstring says the slash is this operator. §1.2 restates these facts, and `### From Tau Ceti` does not name the operator.

**Witness:** `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean:90` (`restrictedWeightedSubstCLM`), `:105`, `:115` (`_comp`), `:128` (`_one_X`), `:182` (`matrixCoeff_weightedSubstCLM`); `TauCeti/Analysis/Normed/Operator/RowCompact/WeightedSubst.lean:87`. None of these files exists at `a91d3aaf`.

**Repair:** Under `### From Tau Ceti` add: "- `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`, `restrictedWeightedSubstCLM_comp`, `restrictedWeightedSubstCLM_one_X`, `norm_restrictedWeightedSubstCLM_apply_le`, `matrixCoeff_weightedSubstCLM` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean`) and `isRowCompact_weightedSubstCLM` (`TauCeti/Analysis/Normed/Operator/RowCompact/WeightedSubst.lean`). Over a complete ultrametric normed commutative ring, these give the operator `f ↦ g·f(h)` for `‖h_i‖≤r_i`, the bound `‖g·f(h)‖≤‖g‖‖f‖`, its composition and identity laws, its columns `coeff(g·hᵗ)`, and its row compactness when `g` and `h` converge on polyradii `c>1` with `‖h_i‖_c≤1`."

In §1.2 replace the first two sentences with: "Define `f|γ` as `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM` with weight `j_κ(γ)` and substitution `w_{γ,σ}=(σ(a)z_σ+σ(b))/(σ(c)z_σ+σ(d))`. Prove that `σ(c)z_σ+σ(d)` is a unit of the restricted algebra, that `j_κ(γ)` is restricted with `‖w_{γ,σ}‖≤r_σ` at the stage radius, the cocycle `j_κ(γδ)=j_κ(δ)·j_κ(γ)(w_δ)` with `w_{γδ}=w_γ∘w_δ`, and independence of equivalent expansion data. The right-action and identity laws follow by `restrictedWeightedSubstCLM_comp` and `restrictedWeightedSubstCLM_one_X`, and `‖slash γ‖≤‖j_κ(γ)‖` follows by `norm_restrictedWeightedSubstCLM_apply_le`."

In the first bullet cite `matrixCoeff_weightedSubstCLM`. In the third bullet replace "(CompactOperators §0.3)" with "(`TauCeti.MvPowerSeries.isRowCompact_weightedSubstCLM`, when `j_κ(γ)` and `w_γ` converge on radii `c>1` with `‖w_γ‖_c≤1`)". Add Tau Ceti `restrictedWeightedSubstCLM` to *Needs:*.

Tested on γ=diag(p,1), δ=((1,0),(p,1)) with `n(u)=uᵏ`: the composite has weight `(pz+1)ᵏ=j_κ(γδ)` and substitution `pz/(pz+1)=w_{γδ}`.

## R02 (P3) — The Tau Ceti contract omits the Fredholm series and property (Pr) that the changed docstring names

**Location:** `README.md` §4.1, line 1167: "For the compact controlling operator define `H_κ(T)=det(1−TU_π)` by CompactOperators §1.5's determinant on property-(Pr) modules." Also `### From Tau Ceti`, lines 165–186.

**Claim:** The docstring says Tau Ceti has `det(1−Tu)` on (Pr) modules. The README's Tau Ceti contract names neither this series nor `TauCeti.HasPr` nor `ContinuousLinearMap.IsPrCompact`. It also omits the scalar hypotheses under which the series does not depend on the presentation.

**Witness:** `TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean:91` (`charPowerSeries`), `:122–123` (`[NormOneClass R]`, `[TauCeti.NormedRing.IsTate R]`), `:148` (`IsPrCompact.charPowerSeries_eq`); `TauCeti/Analysis/Normed/Module/Bases/PotentiallyONable.lean:89` (`HasPr`). AutomorphicGaloisRepresentations at 480c64f, `README.md:241`–`248`, cites all of them.

**Repair:** Under `### From Tau Ceti` add: "- `TauCeti.HasPr` (`TauCeti/Analysis/Normed/Module/Bases/PotentiallyONable.lean`), `ContinuousLinearMap.IsPrCompact` (`TauCeti/Analysis/Normed/Operator/RowCompact/PrModule.lean`), and `ContinuousLinearMap.charPowerSeries` with `IsPrCompact.charPowerSeries_eq` and `IsPrCompact.charPowerSeries_conj` (`TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean`). These give property (Pr) and the Fredholm series `det(1−Tu)`. For row-compact `u` over complete ultrametric scalars with `‖1‖=1` and `TauCeti.NormedRing.IsTate`, the series does not depend on the presentation and is invariant under conjugation."

In §4.1 replace "by CompactOperators §1.5's determinant on property-(Pr) modules" with "as `ContinuousLinearMap.charPowerSeries` of `U_π` (CompactOperators §1.5)". Add it to *Needs:*.

Tested on §4.1's Check: `f(z)↦f(πz)` on `C₀(ℕ,K)` has matrix `diag(π^j)`, and its series is `∏_{j≥0}(1−π^jT)`.

## R03 (P3) — The summary block credits Tau Ceti with adelic class sets

**Location:** description, `roadmap-summary` block, "Approach and generality": "reusing Mathlib's polynomial modules and averaging alongside Tau Ceti's adelic class sets and functional analysis."

**Claim:** The pinned Tau Ceti has no class sets of quaternion algebras. The README takes them from AdelicAlgebraicGroups §5.3, and its functional analysis from PadicFunctionalAnalysis and CompactOperators.

**Witness:** `README.md:6`–`9`: "the class sets and definite stabiliser theorem of AdelicAlgebraicGroups §5.3, the restricted-series, Banach-module and Fredholm libraries of RestrictedPowerSeries, PadicFunctionalAnalysis, CompactOperators". At Tau Ceti `2fd255d9`, a search for "class set" and for `DoubleCoset` finiteness finds only quadratic-form and permutation-triple files.

**Repair:** "…reusing Mathlib's polynomial modules and averaging, the quaternionic class sets of AdelicAlgebraicGroups §5.3, and the functional analysis of PadicFunctionalAnalysis and CompactOperators, with Tau Ceti's weighted substitution and Fredholm series."

## Previous findings

- R01 — repaired: "The README is definitive. `Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti."
- R02 — repaired: "`lake build …` succeeds against the pinned Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. The file declares nothing, so nothing is admitted". The stabiliser-interface sentence and the claim of Lean-proved exponent inequalities are gone.
- R03 — repaired: "Finiteness of class sets … and finiteness of stabilisers modulo the centre … are consumed from AdelicAlgebraicGroups §5.3"; "This roadmap consumes them and supplies nothing to it."
- R04 — repaired: "RestrictedPowerSeries, … and ReductiveGroups are on main. Three suppliers are open and merge first: ArithmeticLocallySymmetricSpaces …, AutomorphicFormsOnReductiveGroups … and KleinianGroups". ReductiveGroups Layer 6 is named.
- R05 — repaired: "partial theta maps `Θ_τ`, … small-slope classicality for totally definite algebras over totally real fields (cutoff `min_τ r_τ/e_v` …; over `ℚ`, `k+1`)"; the §5.3 paragraph gives `H_V(T)=H_{κ′_τ}(τ(π_v)^{r_τ}T)`.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Docstring: slash of `γ` is `restrictedWeightedSubstCLM`, `g=j_κ(γ)`, `h=w_γ` | trivial weight; `γ=((1,0),(p,1))`, `γ=diag(p,1)`, radius 1 | `w=Σ(−p)^{m−1}zᵐ`, `‖w‖=1≤1`; `w=pz`, `‖w‖=p⁻¹≤1`; hypothesis `hh` holds | Pass |
| Docstring: right-action law is the cocycle (§§1.1–1.2), via `_comp` | `γ=diag(p,1)`, `δ=((1,0),(p,1))`, `n(u)=uᵏ` | weight `j(δ)·j(γ)(w_δ)=(pz+1)ᵏ=j(γδ)`; `w_γ∘w_δ=pz/(pz+1)=w_{γδ}`, value `p/(p+1)` at `z=1` both ways | Pass |
| §1.2 column bullet vs `matrixCoeff_weightedSubstCLM` | `γ=((1,0),(p,1))`, column `t=1` | pin: `coeff_m(1·w)=(−p)^{m−1}`; README Check: `(−p)^{m−1}` | Same fact: R01 |
| §1.2 bound `‖slash γ‖≤1` vs `norm_…_apply_le` | `‖j_κ(γ)‖≤1`, `‖w_γ‖≤1` | pin: `‖g·f(h)‖≤‖g‖‖f‖≤‖f‖`; README: `≤1` | Same fact: R01 |
| §1.2 compactness bullet vs `isRowCompact_weightedSubstCLM` | trivial weight, `γ=diag(p,1)`, `c=p^{1/2}` | `‖pz‖_c=p^{−1/2}≤1`; row `e` bound `c^{−e}=p^{−e/2}→0` | Same fact: R01 |
| Docstring: `charPowerSeries` is `det(1−Tu)` on (Pr) modules | `f(z)↦f(πz)` on `C₀(ℕ,K)`; `M` without (Pr) | `∏_{j≥0}(1−π^jT)`, rows `|π|^j→0`; junk value `1`, never used (§2.3 proves (Pr)) | Pass; contract: R02 |
| Docstring: norm on forms (§2.1), bound on `U_v` (§3.1) | two classes, trivial stabilisers; isometric slash, `q_v` cosets | `‖(a,b)‖=max(‖a‖,‖b‖)`; `‖U_v‖≤max_t‖slash x_t‖=1` | Pass |
| Docstring: weight action not definable without proofs that are §§1.1–1.2 targets | `γ∈Σ₀(t)`, `c∈π^t𝒪`, `d∈𝒪ˣ` | `cz+d` a unit and `‖w_γ‖≤1` must be proved (Buzzard Lemma 8.1(b)); input `hh` needs it | Pass |
| Description summary: "Tau Ceti's adelic class sets" | grep at Tau Ceti `2fd255d9` | no quaternion class sets; README:6 cites AdelicAlgebraicGroups §5.3 | Fail: R03 |
| Description: `w(n)−w(m)+max(m−⌊n/p⌋,0) ≥ ⌈m/2⌉` | `(p,m,n)=(3,5,0),(2,1,3),(3,3,4)` | `3≥3`, `1≥1`, `3≥2` | Pass |
| Description: over `ℚ`, `H_κ=det(1−TU_p|M_cl)·H_κ′(p^rT)` | `k=0`, one class | `U_p|M_cl=p`, `H_κ=(1−pT)·H_κ′(pT)`, `r=1` | Pass |
| Description: cutoff `min_τ r_τ/e_v` | `e_v=2`, `n_τ=0` | `r_τ=1`, cutoff `1/2`; `v_p(μ)=3/4` excluded | Pass |
| Description: definiteness cannot be dropped | `D=M₂(F)`, `F` imaginary quadratic | `((1,n),(0,1))`, `n∈ℤ`, distinct mod scalars, so `Γ_1/(Γ_1∩Fˣ)` is infinite | Pass |
| Description: this roadmap is the earliest of the four | `ORDER.txt` | lines 61, 102, 164, 169; zero citations of this roadmap in each of the three | Pass |

The rows for all other statements stand as in the previous review, of e40ec42.

- Gate rerun on 252a01b (`--base origin/main`): every check 0, `OK`; the worker's gate records `build=0`. `lake env lean TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`: exit 0, no output. The file declares nothing, so there was nothing to `#check` and nothing to probe for padding.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Library declarations opened at Tau Ceti `2fd255d9` (13): `WeightedSubst.lean:90,98,105,115,128,182`; `RowCompact/WeightedSubst.lean:71,87`; `PrModule/Basic.lean:91,148,198`; `RowCompact/PrModule.lean:105`; `PotentiallyONable.lean:89`. Mathlib `1b1ccf4b`: `PowerSeries/Restricted.lean:90`, `MvPowerSeries/Restricted.lean:159`. Absence at `a91d3aaf` was checked by `git cat-file`.
- Source locators read (4): buzzard-eigen §8 (line 1986), Lemma 8.1(b) (line 2108), Lemma 12.2 (line 2880, pp. 78–79) and Lemma 13.1 (line 2920, pp. 79–80), for §§1.1–1.2 and 3.3, which the docstring cites.
- Cross-roadmap citations resolved (13). On main 7c8b292: CompactOperators §§1.4–1.7 (`README.md:400`–`444`, `c0_completedBaseChange` `:461`); PadicFunctionalAnalysis §§2.1, 2.2, 5.6; RestrictedPowerSeries §2.2; AdicSpacesPartII R0.5 (`:386`). At open heads: `LocallySymmetric.AutomorphicForm` (ArithmeticLocallySymmetricSpaces `README.md:997`, the resolver's one lead); GL2AutomorphicRepresentationsAndTransfer R17.3.8a–d; HilbertModularVarietiesAndShimuraCurves R18.5.16b (`:2396`); AutomorphicGaloisRepresentations §§0.2a–0.2f. ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups and KleinianGroups are open (#871, #1037, #432).
- Remark on untouched text: Downstream consumers says GL2AutomorphicRepresentationsAndTransfer R17.3 "use §§0.2–0.4, 1.3, 2.1–2.2 and 3.1". At 52b00d9 that roadmap never cites this one and owns R17.3.8a–d itself.
- Overlap check: read AutomorphicGaloisRepresentations (480c64f), GL2AutomorphicRepresentationsAndTransfer (52b00d9), HilbertModularVarietiesAndShimuraCurves (3cac94e), CompactOperators, PadicFunctionalAnalysis and RestrictedPowerSeries. Shared with the first three: forms, coefficient modules, refinement fibres, (Pr), compactness, Fredholm series and classicality. The owner is QuaternionicModularForms (earlier in the merge order), and the citation is owed by those roadmaps. The three on main are suppliers, and nothing they plan is restated here.
- Source independence: changed passages only; 2 docstring passages compared with 1 source (buzzard-eigen §8, Lemmas 8.1, 12.2), none shared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "Lake's only warning is its suggestion to adopt the module system" (description, Checks): this review ran `lake env lean`, not `lake build`, so it did not read Lake's warnings.
- Gross (1999) and Harder (1987), §3: paywalled, cited by locator only, unchanged.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md`, "Existing Lean work", links WilliamCoram/PhD at commit `eefb3d9` as a secondary implementation reference; its licence was not read. `Suggested.lean` declares nothing, so no Lean is adapted from it.
