# Review of SchemeAndStackFoundationsPartII (pull request #2272 at f517dd7)

**Verdict:** needs changes

## R01 (P3) — The description's summary attributes derived completion to Tau Ceti

**Location:** pull request description, `roadmap-summary` block, last sentence: “The construction reuses Mathlib's sheaf cohomology and Tau Ceti's affine fppf sites, Cartier duality and derived completion.”
**Claim:** The head contradicts it. Derived completion is not a pinned Tau Ceti input of this roadmap: it is imported from the roadmap DerivedModuleAlgebra, and `Suggested.lean` records it as absent at the pins.
**Witness:** `TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md:19`: “DerivedModuleAlgebra owns Koszul complexes (§0.K.1) and module completion (§§1.1–1.9)”; the `From Tau Ceti` table (lines 68–90) has no completion row; a case-insensitive search of the pinned Tau Ceti for “derived … complet” returns 0 lines.
**Repair:** Replace the sentence with: “The construction reuses Mathlib's sheaf cohomology and Tau Ceti's affine fppf sites, Cartier duality, henselization and Weil restriction; derived completion is imported from DerivedModuleAlgebra §§1.1–1.9.”

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)

## Verified sound

| Statement | Instances tried | Left / input value | Right / output value | Result | Change |
|---|---|---|---|---|---|
| `flatCohomology_henselian_invariance` (README §2.2; description: “surjective from degree one, bijective from degree two”) | R=ℤ_p, I=(p), G=μ_p, p odd | H¹=ℤ_p^×/p=ℤ/p; H²=Br(ℤ_p)[p]=0 | H¹(𝔽_p,μ_p)=𝔽_p^×/p=0; H²=0 | n=1 onto with kernel ℤ/p, not bijective; n=2 bijective | — |
| Same, boundary instances | I=0; I=R; n=0 | I=0: map is the identity; I=R forces R=0 since I⊂Jac(R) | Identity bijective; all groups 0; n=0 both implications vacuous | No false instance | — |
| `flatCohomology_algebraization` (README §2.3; description: “Hⁱ, i≥2”) | B=𝔽_p{t}[1/t], B′=t𝔽_p{t}, G=μ_p; discrete B with B′=0 | H²=Br[p]=ℤ/p; H¹ unit classes countable; discrete: B̂=B | H²(𝔽_p((t)),μ_p)=ℤ/p; H¹ uncountable; identity | Bijective at n=2, fails at n=1, as bounded | — |

Rows for untouched statements stand as in the previous review, of `f517dd7`.

- The folder is unchanged since `f517dd7` (0 lines); this round read the title and description against the head: every sentence of the summary block and of the prose compared with the README and `Suggested.lean`; 1 contradicted (R01).
- Description claims confirmed at the head: the four end theorems (§§1.5, 2.2, 2.3, 3.2) with two stated in Lean and two named in the docstring; 6 declarations added; the imports from PrismaticCohomologyPartIII §6.0 and PurityForFlatCohomology Layer 3 (README lines 3, 11, 13); 7 open suppliers and 3 on main (DerivedModuleAlgebra, EnhancedDerivedSheaves, SchemeAndStackFoundations).
- Pinned library opened: 0 hits for derived completion in the pinned Tau Ceti; the 6 elaborated signatures match README §§2.0, 2.2, 2.3 with no lost binder.
- Gate at this head: every check passed (all counters 0, `OK`). Direct elaboration of `Suggested.lean`: exit 0, the 2 `sorry` warnings (lines 102, 130) the only output.
- Dependency-check output: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`.
- Outside-folder diff against the base: 0 paths; worktree clean.
- Source locators: none rechecked (no passage changed; the seeded sample falls in no changed passage).

Overlap check: no passage changed; the overlap list at this head shows no other pull request changing this roadmap, no dropped id and no second copy. The scopes of PurityForFlatCohomology, ArcTopologyAndDescent and PrismaticCohomologyPartIII were not reread this round; ownership stands as in the review of `f517dd7`.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share CS24 as in the review of `f517dd7`; no layer added, removed or reordered, so the contents comparison stands.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
