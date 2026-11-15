# Review of K3SurfacesAndSymplecticBoundedness (pull request #1375 at cc2efa8)

**Verdict:** needs changes

## R01 (P3) — Correct the supplier classification in the description

**Location:** PR description, Dependencies paragraph (`scratch/pull-request.md:26`): “Consumers, not prerequisites: #1496 (PeriodsAndSpecialValues) and #870 (NeronModelsAndSemistableAbelianVarietiesPartII)”.
**Claim:** The description denies a prerequisite that this head explicitly consumes.
**Witness:** `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:176` imports NeronModelsAndSemistableAbelianVarietiesPartII’s genus-one theory; line 854 needs its §§2.1 and 4.16. That supplier’s README, Scope and ownership, assigns it these constructions.
**Repair:** Replace the quoted sentence with: “NeronModelsAndSemistableAbelianVarietiesPartII (#870) is a direct supplier of the genus-one fibration theory listed in the README’s supplier contract. PeriodsAndSpecialValues (#1496) is a consumer, not a prerequisite.” Keep the subsequent statement about #849, #1335 and #1336.

## R02 (P3) — Make the validation sentence match the Lake output

**Location:** PR description, Validation paragraph (`scratch/pull-request.md:28`): “the targeted Lake build succeeds with `sorry` as the only warning”.
**Claim:** The targeted build succeeds but emits another warning.
**Witness:** `lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested` exits 0 and warns that the imported Mathlib package is designed for the module system, in addition to the thirteen `sorry` warnings.
**Repair:** Replace that clause with: “The targeted Lake build succeeds with thirteen `sorry` warnings and a module-system advisory; direct `lake env lean` elaboration emits only the thirteen `sorry` warnings.”

## Previous findings

The preceding report had no open findings. Its carried repair entries remain repaired:

- R01 — repaired: `Suggested.lean:140–159` retains `quarticIdeal` and `isK3_quartic`; the docstring reserves only the intersection identity H²=4 as not statable.
- R02 — repaired: `Suggested.lean:244` and `:296` retain polarized automorphism finiteness and ample higher-cohomology vanishing, including their ample hypotheses.
- R03 — repaired: `Suggested.lean:128` retains the `Over` instance and concludes `X.IsProjectiveOver k`; README §1.3 states that conclusion.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| §2.6 extension uniqueness and one equation | Square-zero extension with kernel k | Extension ambiguity H¹(O)⊗k=0; obstruction H²(O)⊗k=k has dimension 1 | Matches Deligne Proposition 1.5 | None |
| §2.6 nontriviality | L=O | c₁=0; equation 0; pair dimension 20, versus 19 for nontrivial L | Excluded by stated hypothesis | None |
| §2.6 primitive normalization | p=2,3; x=pᵃe with e mod p nonzero, a=1,2 | x mod p=0; p^(−a)x=e; e mod p≠0; ∇e=p^(−a)∇x=0 | Both filtration branches contradict horizontality | None |
| §2.6 smoothness | Quartic hyperplane class, p=3 | L²=4≡1; obstruction rank=1; tangent dimension=20−1=19 | Matches claimed smooth dimension | None |
| §6.7d use of §2.6 (seeded) | Tame involution, p=3 | H² invariant rank=(22+6)/2=14; invariant tangent dimension=14−2=12>0; averaging coefficient 1/2=2 | Normalization preserves invariance | None |
| §8.4 use of §2.6 (seeded) | d=2, p=3 and p=2 | 2d=4≡1 mod 3: dimension 19; 4≡0 mod 2: outside the asserted smooth base | Hypotheses retained | None |
| Description dependency assertion (R01) | Supplier NeronModelsAndSemistableAbelianVarietiesPartII | Claimed prerequisite indicator=0; README supplier contract and Needs lines give 1 | Contradiction | Correct description |
| Description warning assertion (R02) | Targeted Lake build | Claimed non-sorry warnings=0; observed module-system advisories=2; exit status=0 | Contradiction | Correct description |

Rows for untouched statements stand as in the previous review of `cee718f`.

- Sources: 4 locators checked—Deligne Proposition 1.5, Theorem 1.6 and §2.11 (printed pp.60–62, 75; deligne-lift lines 78, 117–137, 510–526), and Rizov Lemma 4.1.3 (p.18; rizov lines 779–784).
- Signatures: all 17 actual declarations checked with `#check @`; 0 lost binders or changed signatures; the scanner’s eighteenth name, `group`, is docstring prose.
- Suppliers: all 8 section locators in §2.6 resolved (6 CrystallineCohomology, 2 SchemeAndStackFoundations); `gap:crystalline-chern-derivative` agrees between README and `design/plan.json`.
- Gate: rerun ends `OK`, every counter 0; worker’s recorded targeted-build counter is also 0.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Elaboration: direct Lean and the signature probe exit 0, each with only 13 `sorry` warnings; targeted Lake build exits 0 with the additional advisory recorded in R02.
- Scope of change: 1 prose paragraph; 0 changed Lean declarations; 0 outside-folder changes; title and description checked against the addition of 3 files and 1782 lines.

Overlap check: read K3Surfaces, EnriquesSurfacesAndIntegralNonexistence, EnriquesSurfaces, AlgebraicModuliForArithmeticGeometryPartII, StableReductionPartII, SchemeAndStackFoundations and StableReduction; for the changed argument, general deformation theory belongs to SchemeAndStackFoundations, crystalline variation to CrystallineCohomology and its declared contract, complex K3 families to K3Surfaces, and the mixed-characteristic K3 line-bundle divisor to this Part II; no new ownership introduced.

Source independence: changed passages only; 1 paragraph compared with 2 sources, no copied expression or reused material found; largest share among the 4 checked locators is deligne-lift, 3/4. No layer was added, removed or reordered, so arrangement was not reassessed.

## Not verifiable

- None in the changed paragraph; settled waived/uncertified sources remain as recorded in the previous review.

## Source issues

- none

## For the human reviewers

- none
