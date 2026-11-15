# Review of ArithmeticStatisticsPartVIII (pull request #1179 at e4005e8)

**Verdict:** needs changes

Incremental re-review of the 12 lines changed since `a91c9b8` (6 insertions, 6 deletions, all in `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md`, lines 27, 108, 891, 903, 912, 924), and of the pull request's title and description against this head.

## R01 (P3) — Item (i) still restates the double-complex spectral sequence that DerivedModuleAlgebra §S.1 owns on main

**Location:** `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:893`, “The filtrations of `T` by `C`-degree and by `F`-degree are exhaustive and bounded below, and their spectral sequences are first-quadrant and converge to `H_•(T)`”; the proof at line 901; the `*Needs:*` line at 903; the scope bullet at line 27, “owns … the two spectral sequences of a double complex”.

**Claim:** This is R03 of the previous review, and the head does not change it: `DerivedModuleAlgebra` occurs nowhere in the README. The existence and convergence of the two spectral sequences of a first-quadrant double complex in an abelian category is a statement of a roadmap on main, so it is cited, not proved again as a target; line 27, rewritten at this head, still lists it as owned here. What this part owns is the identification of the `E¹` and `E²` terms of `C_• ⊗_R F_•` with `Tor`, and items (ii)–(v).

**Witness:** `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`–999 on main (§S.1, “a first-quadrant double complex in an abelian category”; homological form at 991: `E²_(p,q) = H_p(H_q(C))`, abutment `H_(p+q)(Tot C)`, stabilization for `r > max(p, q+1)`). SpectralSequencesAndConvergencePartII at its open head, README line 91–93, says the same of §5.16.

**Repair:** In (i) write: “The two spectral sequences of the first-quadrant double complex `C_• ⊗_R F_•` (DerivedModuleAlgebra §S.1, homological form, applied in the abelian category of graded modules to the double complex and to its transpose) have `E¹_{i,j} = Tor^R_i(C_j, M) ⇒ H_{i+j}(T)`, with `d¹` induced by the differential of `C`, and `E²_{i,j} = Tor^R_i(H_j(C), M) ⇒ H_{i+j}(T)`, …”; begin the proof with “The sequences and their convergence are DerivedModuleAlgebra §S.1”; add “DerivedModuleAlgebra §S.1 (the spectral sequence of a first-quadrant double complex)” to the `*Needs:*` line at 903 and to the supplier contract at line 108 (DGFloer Layer 1 item 3 stays for the arc spectral sequence); at line 27 replace “the two spectral sequences of a double complex” by “the `Tor` forms of the two spectral sequences of the double complex `C_• ⊗_R F_•`, whose existence and convergence are DerivedModuleAlgebra §S.1”. Tested on `R = k[x]`, `C = F = (R[1] → R)`: §S.1's stabilization gives `E² = E^∞` at `(0,0)` and `(1,0)`, the values `k`, `k[1]` of the table below.

## Previous findings

- R01 — repaired: line 108, “Layer 5: the derived tensor product, consumed only as the single-graded total of `P_• ⊗_R M` for a graded free resolution `P_• → N`; the bigraded `Tor^R_i(N, M)` … is defined and proved in *Tor spectral sequences over graded algebras*”; line 903 cites Layer 5 for “the derived tensor product” only.
- R02 — repaired: line 912, “`deg Tor^S_a(k, M̄) ≤ deg(k ⊗_S M̄) + a·deg S` for a graded `S`-module `M̄`”.
- R03 — not repaired: line 893 still reads “The filtrations of `T` by `C`-degree and by `F`-degree are exhaustive and bounded below, and their spectral sequences are first-quadrant and converge to `H_•(T)`”, with no citation of DerivedModuleAlgebra §S.1 (R01 above).

## Verified sound

| Statement (README line) | Instances | Values computed on each side | Result |
|---|---|---|---|
| Definition of bigraded `Tor` and the Layer 5 contract (891, 108, 27) | `R = k[x]`, `deg x = 1`, `N = M = k` | `P = (R[1] → R)`; `P ⊗_R k = (k[1] → k)`, zero map; `Tor_0 = k` (internal degree 0), `Tor_1 = k[1]` (internal degree 1), `Tor_{≥2} = 0`; single-graded total: two classes, no record of `i` | The contract as rewritten is exact: Layer 5 returns the total, the section the bigrading. |
| Balance, resolving the other side (891, 894) | the same, `F = (R[1] → R) → M = k` | `k ⊗_R F = (k[1] → k)`, zero map: `k`, `k[1]` | Equal to the row above. |
| Item (i) on a double complex (893; R01) | `C = F = (R[1] → R)` | `T = (R[2] → R[1]² → R)`, `H_0 = k`, `H_1 = k[1]`, `H_2 = 0`; first sequence `E¹_{0,0} = k`, `E¹_{0,1} = k[1]`, `d¹ = x = 0`; second `E²_{0,0} = k`, `E²_{1,0} = k[1]` | Both agree with `H_•(T)`; §S.1's bound `r > max(p, q+1)` gives `E² = E^∞` there. |
| Degree-bound Check (912) | `S = k[x]/(x²)`, `M̄ = k`, `k[2]`, `S` | `deg Tor^S_a(k, k) = a ≤ 0 + a`; `deg Tor^S_a(k, k[2]) = a + 2 ≤ 2 + a`; `Tor^S_{≥1}(k, S) = 0`, `deg Tor_0 = 0 ≤ 0` | Holds, attained for `k` and `k[2]`. |
| `*Needs:*` of the K-complex (924) | `R = k[x]`, `R̄ = k[x]/(x²)` | modules and derived tensor from DGAInfinity Layers 1, 5; `Tor^R_1(R̄, k) = k[2]`, `Tor^{R̄}_a(k, k) = k[a]` from the section's own definition | The line names every input the route uses. |

The rows of the previous review for the untouched statements stand as in the previous review, of `a91c9b8`.

- Gate, rerun on this head: every check zero, `OK`; the worker's run adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticStatisticsPartVIII/Suggested.lean`: five `declaration uses 'sorry'` warnings (lines 65, 75, 86, 97, 125), no error; the file is byte-identical to `a91c9b8`, single `import Mathlib`, so the signature comparison and padding probe of the previous review stand.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Cross-roadmap citations resolved for the changed passages: DGAInfinity on main, `TauCetiRoadmap/DGAInfinity/README.md:305` (Layer 1, “tensor product and derived tensor target”) and 435 (Layer 5, “derived extension, derived tensor, and derived Hom”); DGFloer on main, `TauCetiRoadmap/DGFloer/README.md:621` (Layer 1 item 3); DerivedModuleAlgebra §S.1 on main, lines 955–999. Anchors `#tor-spectral-sequences-over-graded-algebras` and `#weibel` resolve.
- Pull request text: the title equals the README title; each sentence of the summary block and of the prose was read against the head (five scope groups of lines 9–17, conditional hypotheses of §§5.13–5.14, stability “proved here” as line 29, `TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long` at the pin in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean`, explicit constants uniform in `r` at lines 313 and 347, the two consumers of line 1988, the three files, no Lean import of a roadmap, a new roadmap of 133 headings and 9 declarations with none removed): no sentence is contradicted and no change is left unstated.
- Source locators: the diff changes none; ref-37 (4.3.1) at `ref-37 line 824`–830 was reread for the change-of-rings statement the changed sentences cite.
- Remark on untouched text: the pinned Tau Ceti has the abelian category of graded modules over a graded, possibly noncommutative algebra (`TauCeti.GradedModuleCat`, `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean:60`, with shifts and resolutions); lines 108 and 903 cite DGAInfinity Layer 1 for graded modules.
- Overlap check: read InverseGaloisAndArithmeticFundamentalGroupsPartII (the only roadmap of the three lists that shares an object with the changed passages; the scopes of ArithmeticStatisticsPartI, ArithmeticStatisticsPartVII, InverseGaloisAndArithmeticFundamentalGroups and InductionRestrictionPartII were not read again, the diff touching nothing of theirs) and, found by object, SpectralSequencesAndConvergencePartII; bigraded `Tor` and its sequences: owner this roadmap (their README lines 111 and 88 say so); the double-complex spectral sequence: owner DerivedModuleAlgebra §S.1 (R01).

Source independence: 5 changed passages compared with 1 source (ref-37, changed passages only), none shared; arrangement not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- Weibel's numbering (§5.6, Theorem 5.6.6, §5.7), cited beside the changed passages, is from an uncertified, paywalled text and was not read.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- none

## For the human reviewers

- none
