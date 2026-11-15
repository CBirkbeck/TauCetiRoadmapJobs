# Review of AdicCoefficientsAndComparisons (pull request #965 at 000e3d5)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 000e3d5; this round reads the pull request's title and description against the head. One finding, in the description; the folder's files need no change.

## R01 (P3) — The description's validation sentence is contradicted by the head

**Location:** pull request description, paragraph "Validation": "README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero".

**Claim:** At this head the README carries labelled Checks and backticked names of its own that `Suggested.lean` does not declare, so two of the four counts are not zero.

**Witness:** `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md` line 526 `AdicEtale.ofComplete` (API) and line 536 `AdicEtale.point` (computation) (Check): neither is in `Suggested.lean`, which declares five names. 49 Checks carry such a label; at least 50 own names are undeclared.

**Repair:** Replace the sentence by: "Validation: the targeted Lake build succeeds with `sorry` as the only warning; the gate passes on this head (no `set_option`, no round label, no empty Lean section, every declaration of `Suggested.lean` named in the README); the dependency check shows no upward edge. `Suggested.lean` declares only the five names of README §8; the API and Check names of the layers (`AdicEtale.…`, `AdicSix.…`, `SchemeSupport.…`) are README targets without a Lean declaration."

## Previous findings

The previous report (of this same head) had no finding of its own; its six bullets on the report before it all read "repaired", and the folder has not changed since.

- none carried

## Verified sound

**Adversarial table: statements the description cites, and the finding (computed at this head).**

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| Description: "Λ complete along a regular-sequence ideal containing an integer prime to p" (README §2.1, lines 149–163) | (ℤ_ℓ,(ℓ)), ℓ ≠ p; (ℤ/ℓ, 0); (ℤ_p,(p)); zero ring | ℓ regular, ℤ_ℓ/ℓ ≠ 0, ℓ ∈ I coprime to p: admitted. Empty sequence, ℓ = 0 ∈ I: admitted. Every n ∈ (p) has p ∣ n: rejected. Zero ring: ⊤ = I•⊤, no regular sequence: rejected | description agrees with §2.1 |
| Description: "avatars over O are v-sheaves, not diamonds, as Spd ℤ_p shows" (README lines 889–893, 923; §3 line 442) | S = Spa(C♭, O_{C♭}) | Untilts of S with p = 0: only S, so the special fibre Spd 𝔽_p is the point `*`, not a diamond; DiamondsAndVStacks, now on main: D6.1 (line 8660), `total_relation` (5836), D4.4 (5988), Check `spd_zp_not_diamond` (8730) | agrees; supplier resolves on main |
| Description: "Compactifications over qcqs bases need not be dense" (README §2.6 lines 219–223; `IsCompactification`) | Y a point, C = Y ⊔ Y, j first inclusion; fold g: Y ⊔ Y → Y | j open immersion, quasi-compact, C → Y proper: admitted, closure of j(Y) is one of two points. g⁻¹(Y) = Y ⊔ Y ≠ j(Y): not strict | agrees with the Lean body (no density clause) |
| Description: "never dividing by the degree" (README lines 1744–1748, 1765, 2011) | degree-ℓ map f: ℙ¹ → ℙ¹, Λ = ℤ/ℓ | trace ∘ unit on Λ is multiplication by deg f = ℓ = 0 in ℤ/ℓ: no splitting; descent along the proper hypercover uses no trace | agrees |
| Description: "ending with constructible full faithfulness over O"; "adic forms of ECD Theorems 1.8–1.10 and 1.13" | README lines 18, 26–28, 85–86, 100–104 | 27.7 is the last target of L6; 1.11–1.12 excluded at line 138–139 (𝔽_ℓ-coefficients) | agrees |
| Description, "Validation" (R01) | names of README lines 526, 536 against `Suggested.lean` | `Suggested.lean` declares 5 names; `AdicEtale.ofComplete`, `AdicEtale.point` absent; 49 labelled Checks; 87 README names resolve nowhere, 50 of them with this roadmap's own prefixes | sentence false: R01 |

The rows of the previous review for the statements of the folder stand as in the previous review, of `000e3d5`.

- Gate, rerun on this head: `gate AdicCoefficientsAndComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate agrees (build=0).
- Dependency check: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge-order lines: this roadmap 108; DiamondsAndVStacks 21, EtaleCohomologyFoundations 44, ClassicalAdicEtaleCohomology 76, DiamondEtaleCohomology 77, DiamondSixOperations 78; EtaleDualityAndPerverseSheaves 109.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AdicCoefficientsAndComparisons/Suggested.lean` exits with three `declaration uses sorry` warnings (lines 50, 75, 86) and nothing else. The five elaborated signatures keep every binder of the README statements (`[CompactSpace X] [QuasiSeparatedSpace X]`, `[IsSeparated f] [QuasiCompact f]`, `[LocallyOfFinitePresentation f]` or `[LocallyOfFiniteType f]`, `[IsAffine S] [IsNoetherian S]`); nothing changed.
- Description against the head, sentences checked: 14. Title, folder contents (`README.md`, `Suggested.lean`, `metadata.toml`), the three open suppliers (ClassicalAdicEtaleCohomology, DiamondEtaleCohomology, DiamondSixOperations) and the consumers of README §9 agree; the pull request adds the roadmap, removes no heading and no declaration, and changes nothing outside the folder (`git diff --stat` outside the folder is empty).
- Suppliers placed: on main SchemeAndStackFoundations, EtaleCohomologyFoundations, EnhancedDerivedSheaves, StableReduction, PerfectoidSpaces, AdicSpacesPartII, AdicSpacesPartIII, DiamondsAndVStacks, and AdicSpaces under `Completed/`; open and earlier in the merge order the three named above. Cross-roadmap citations found nowhere: 0 (worker's `resolve`). Citations reopened this round: 4, all in DiamondsAndVStacks on main.
- Sample of §§2.1–2.9: unchanged since the previous review, which computed each; reread this round, no source locator reopened.
- Overlap check: not redone (no line of the folder changed); the worker's overlap list has no other pull request changing this roadmap, no dropped id, no second copy and no roadmap close in results or headings. The scopes of the closest roadmaps by vocabulary (DiamondSixOperations, VStackSheavesAndLisseCategories, EtaleCohomologyFoundations, ClassicalAdicEtaleCohomology, FarguesFontaineDiamonds, DiamondsAndVStacks, EnhancedDerivedSheaves) were not reread.
- Source independence: changed passages only; 0 passages of the folder changed, so 0 compared; the arrangement and the share of locators by source were not recomputed (no layer added, removed or reordered).
- Remark on untouched text: 49 Checks of the README carry a backticked label (for example line 536); the gate does not count them.

## Not verifiable

- none this round: no source locator was reopened.

## Source issues

- none

## For the human reviewers

- **Licence.** The source cited most, [ECD], is read from an author version dated 14 April 2026 on the author's page and from arXiv:1709.07343v4 (README §10), [BP] from an author version, [Abe] from arXiv only.
- **Not tested.** This round compared no wording and no arrangement with [ECD]: the folder is unchanged since the reviewed head, and the comparison was not repeated.
