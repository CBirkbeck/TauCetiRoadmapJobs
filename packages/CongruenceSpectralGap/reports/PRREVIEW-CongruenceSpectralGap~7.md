# Review of CongruenceSpectralGap (pull request #1504 at 1f44022)

**Verdict:** accepted

No finding. The folder is byte-identical to the head of the previous review; the title and description, rewritten since, agree with this head.

## Previous findings

- R01 — repaired: “It imports the curve Euler–Poincaré formula with Swan conductors from EtaleDualityAndPerverseSheaves §5.2, proving only its descent to a perfect base.” Agrees with `TauCetiRoadmap/CongruenceSpectralGap/README.md:19`.
- R02 — repaired: “The gap feeds GeometricFreyMazur, conformal-area arguments and arithmetic applications to congruence covers.” Agrees with the README's Downstream consumers (line 922); AutomorphicSpectralTheoryPartII is no longer named.
- R03 — repaired: “Build the congruence spectral gap as a separate roadmap on top of AutomorphicSpectralTheory”; “specializing AutomorphicSpectralTheory's adelic decomposition to each principal level”. Agrees with README lines 1 and 7.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `hyperKloosterman_bound` (description: “every finite field and positive rank, without parity, prime-field or coprimality conditions”) | 𝔽₂, k=2, r=1 (p divides k); 𝔽₃, k=2, r=1 and r=2; k=0 | 𝔽₂: one tuple, sum ψ(0)=1 ≤ 2√2≈2.83. 𝔽₃, r=1: ψ(2)+ψ(1)=−1, norm 1; r=2: 2ψ(0)=2; both ≤ 2√3≈3.46. k=0, r=1: sum 1 > bound 0, excluded by `1 ≤ k` | holds; Lean, README line 725 and description agree | none |
| `gauss_power_even_average_bound` (description: “a Gauss-power identity”) | q=7, k=2, r=1; q=3 | q=7: the two cubic characters, each ‖τ(χ)²‖=7, sum ≤14 ≤ 6·2·√7+1≈32.7. q=3: no even nonprincipal character, 0 ≤ 3 | holds | none |
| §5.1 parameter bound and §5.3 / `congruence_eigenvalue_bound` (description: “\|Re μⱼ\|≤1/2−1/(m²+1)”, “λ′₁(Γ)≥21/100”) | m=2; m=3 on the adjoint, parameters {2r,0,−2r}; constant u | m=2: 1/2−1/5=3/10. m=3: 2r ≤ 1/2−1/10=2/5, r ≤ 1/5, λ=1/4−1/25=21/100. Constant u: λ=0<21/100, excluded by `hnc` | holds; description, README lines 3, 818, 854 and Lean agree | none |
| §2.2 forced zero (description: “the archimedean trivial zero at β₀ would make every even prime twist vanish there”) | β₀=2 max Re μⱼ at the maximal diagonal pair; β₀=0 | Γℝ(s−2Re μⱼ) at s=β₀ has argument 0, a pole; β₀=0 excluded by the hypothesis β₀>0 (README line 487) | description matches §2.2 and the range 1−2/(m²+1)<Re β<1 of §4.5 | none |

The rows of the previous reviews stand for every other statement, as in the review of `86faacb`: no line of the folder changed.

- Incremental re-review of 0 changed lines since 86faacb (`git diff --stat 86faacb HEAD` on the folder is empty); `git diff --stat origin/main...HEAD` outside the folder is empty.
- Title and description read sentence by sentence against the head: 0 contradicted. Checked: the folder is added (not on main, no second copy), 3 files, 1 definition with a real body and 3 `sorry` theorems, all congruence levels (§§0.2, 0.5c), clipped spectrum (§0.7), ramified coefficients with q∤fπ only (§2.1), exports (§§5.4–5.5).
- Cross-roadmap claims of the description resolved at open heads: EtaleDualityAndPerverseSheaves §5.2 states `curveEulerPoincareSwan` (its README line 4922); GeometricFreyMazur (line 97), KloostermanMomentsAndPotentialAutomorphy (line 67) and PadicDifferentialEquationsAndRigidCohomology (line 126) cite this roadmap as consumers.
- Gate rerun at this head: every counter 0, `OK`; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean` gives only the three `sorry` warnings (lines 52, 63, 79); the 4 elaborated signatures were compared with README lines 725, 754 and 854, no binder lost.
- Seeded sample, declared gaps, headline list and padding probe: no passage changed, so they stand as in the earlier reviews; the overlap facts list no dropped id, no second copy and no conflicting head.
- Remark, no change asked here: KloostermanMomentsAndPotentialAutomorphy line 87, at its open head, still names this roadmap's §4.2b as owner of the curve Euler–Poincaré formula; the owner is EtaleDualityAndPerverseSheaves §5.2 and that citation belongs to that roadmap's review.

Overlap check: read AutomorphicSpectralTheoryPartII, MaassForms, UnboundedOperators; nothing shared (PartII and MaassForms cite this roadmap's Layers 0–5 and §§0.1–0.2, 0.5b as owner; UnboundedOperators UO-D06 owns the Friedrichs extension, cited here).

Source independence: changed passages only, 0 passages compared with 0 sources (no passage of the folder changed); largest share lrs95, 30 of 102 locator mentions; contents not compared again (no layer added, removed or reordered), and lrs95 could not be read.

## Not verifiable

- `lrs95` is settled as uncertified (paywalled): its locators are cited by locator only and were not read.
- The description's “AI assistance” sentence (review and red-team round counts) and Lake's module-system notice describe the job board and the worker's build, not the head, and were not checked.
- The `depends-on` and `merge-order` blocks are generated and outside the check of the text.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lrs95` has the largest share of the README's locators (30 of 102 mentions) and is paywalled, recorded as uncertified: wording and arrangement were not compared with it (`TauCetiRoadmap/CongruenceSpectralGap/README.md`, References).
