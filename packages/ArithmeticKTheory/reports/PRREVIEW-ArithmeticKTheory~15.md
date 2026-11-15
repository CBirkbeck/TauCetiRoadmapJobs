# Review of ArithmeticKTheory (pull request #1418 at d682d86)

**Verdict:** accepted

## Previous findings

- R01 — repaired: “Direct prerequisites are the supplier stages in the README's Exact supplier contracts. Section 7.5 proves the odd-primary fourth-stem vanishing using BordismFormalGroups F3–F4.” The description no longer mentions HomotopySpheres, and the T1.5–T1.6 tail is gone.
- R02 — repaired: “For finite S, localization and Quillen's rank filtration give finite generation of K_n(O_(F,S)) for every n≥0; Borel's comparison determines the higher ranks. Denominator localization also treats arbitrary S under a torsion class-group hypothesis.”
- R03 — repaired: “Hermitian computations use finite generation of L-groups and Grothendieck–Witt groups.” The prose now reads “The hermitian layer proves integral finite generation for symmetric, quadratic and genuine Grothendieck–Witt and L-theory.”

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: golden field order 4, 4/120=1/30 (§8.9, Downstream consumers) | F=ℚ(√5), ε=(1+√5)/2 | g↦(−1,−1), h↦(1,−1), span 4. w₂=120 (μ₂₄₀ fails: (ℤ/16)^× has an element of order 4). B₂,χ₅=4/5, so L(−1,χ₅)=−2/5 and ζ_F(−1)=(−1/12)(−2/5)=1/30=4/120 | Agrees | None |
| Description: K₃(ℤ[i])≅ℤ⊕ℤ/24, K₃(ℤ)≅ℤ/48 (§8.10) | ℚ(i); ℚ | Rank r₂: 1; 0. w₂(ℚ(i))=24: μ₄₈ fails because 5 has order 4 in the units ≡1 mod 4 of (ℤ/48)^×. Real case: 2·24=48 | Agrees | None |
| Description: arbitrary S under a torsion class group (`integer_isLocalization_of_torsion_classGroup`) | ℤ[√−5], S={(2,1+√−5)}; affine y²=x³+x over ℂ, S={P}, P non-torsion | First: a_p=2, so O_S=R[1/2]. Second: sUnitSubmonoid=ℂ^×, so the localization is R, but Riemann–Roch gives f∈O_S∖R with a simple pole at P | The hypothesis is needed, and the description states it | None |
| Description: finite generation for finite S (§3.3) | F=ℚ: S=∅, {2}, all primes | K₁: ℤ/2; ℤ/2⊕ℤ; ℚ^×≅ℤ/2⊕⊕_pℤ. Finitely generated: yes; yes; no | The finite-S restriction is stated | None |
| Description: criterion for Dedekind domains with finite Picard group (§3.2, README:1229) | ℤ; affine y²=x³+x over ℂ | K₀: ℤ, finitely generated; ℤ⊕E(ℂ), not finitely generated. The finite-Pic hypothesis is necessary | Matches §3.2 | None |
| Description: hermitian finite generation keeps real places and does not invert 2 (§3.5) | R=ℤ, ε=+1, n=0..3 | L^s: ℤ, ℤ/2, 0, 0. L^q: ℤ, 0, ℤ/2, 0. All finitely generated, not all finite. ℤ has r₁=1 and 2∉ℤ^× | Matches README:1574, 1636 | None |
| Description: “two definitions and four headline theorems” | Suggested.lean | Definitions `sUnitSubmonoid` and `titsBuilding`; theorems at lines 67, 73, 98 and 115. Elaboration gives 4 `sorry` warnings | Agrees | None |

The other adversarial rows, for the untouched statements, stand as in the previous review of d682d86.

- Scope: incremental re-review, 0 changed folder lines. The title and all 16 prose sentences plus the `roadmap-summary` block were read against README §§1.1, 3.2, 3.3, 3.5, 8.5, 8.9, 8.10, Scope and Downstream consumers, Suggested.lean and metadata.toml (`topic = "math.NT"`). No sentence is contradicted and no unstated change was found.
- Gate rerun: all 27 text checks zero, `OK`. The worker's gate at this head also records `build=0`. There are no changes outside the folder (`git diff --stat` is empty).
- Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Elaboration: `lake env lean` on Suggested.lean exits 0 with only 4 `sorry` warnings.
- Citations resolved:
  - BordismFormalGroups F3 (README:284) and F4 (README:329) on main.
  - 15 supplier roadmaps on main, plus NumberFieldArithmetic and Chebotarev under `Completed/`.
  - The 13 open suppliers in the README's contracts all appear in the description's dependency list.
  - The resolver lead `VanishingCycles.etaleTateTwists` is named at EtaleCohomologyFoundations README:233 on main.
- Consumers named in the description cite this roadmap: K3BlochGroups (README:119) and EllipticKTheory (README:162), at their open heads.
- Remark, untouched text: README:94–95 says the finiteness criterion “holds for every Dedekind domain”, while §3.2 (README:1229) assumes finite Pic(R). The description follows §3.2.

Overlap check: read KTheoryFiniteLocalFields, CyclotomicClassGroupsAndStickelberger, K2SymbolsBrauerPartII, K3BlochGroups, EllipticKTheory, StableHomotopyKTheory and ClassicalArithmeticCompletion; nothing shared. K3BlochGroups, EllipticKTheory and K2SymbolsBrauerPartII (README:84) consume this roadmap. The other four supply it and do not cite it.

Source independence: changed passages only. No roadmap passage changed. 6 description passages were compared with 3 sources (hermitian, kbook, putman-studenmund), and none share wording. No layer was added, removed or reordered, so the contents comparison was not reopened.

## Not verifiable

- none in this round's passages; the waived and uncertified locators remain settled.

## Source issues

- none

## For the human reviewers

- none
