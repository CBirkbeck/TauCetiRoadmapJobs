# Review of K3SurfacesAndSymplecticBoundedness (pull request #1375 at cc2efa8)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines in the folder since `cc2efa8`; this round read the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads “NeronModelsAndSemistableAbelianVarietiesPartII (#870) is a direct supplier of the genus-one fibration theory listed in the README’s supplier contract. PeriodsAndSpecialValues (#1496) is a consumer, not a prerequisite.” Agrees with `README.md:174–176`, `:1404–1409`.
- R02 — repaired: the description now reads “the targeted Lake build succeeds with thirteen `sorry` warnings and a module-system advisory”. Rerun: exit 0, 13 `sorry` warnings, the module-system advisory, nothing else.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Description: “Riemann–Roch reads 2χ(L)=4+L² in ℤ” (README Conventions, §1.6) | Quartic, L=O, O(1), O(t); L=O(C), C²=−2 | O: 2·2=4+0. O(1): 2·4=4+4. O(t): 2(2t²+2)=4+4t². O(C): 2·1=4−2. All integers, no division by 2 | Agrees, characteristic 2 included | None |
| Description: projectivity “from the general theorem for regular proper surfaces” (§1.3, `gap:surface-projectivity`) | Smooth quartic; affine plane; imperfect k | stacks-surface-resolution line 2327 (tag 0C5P): proper, regular, dimension 2 ⇒ projective; smooth of relative dimension 2 ⇒ regular over any k; A² not proper, excluded | Agrees with `README.md:92`, `:313` | None |
| Description: “smooth over ℤ[1/2d]” (§8.4) | d=2 at p=3 and p=2 | 2d=4≡1 mod 3: rizov lines 779–780 apply, dimension 20−1=19; 4≡0 mod 2: prime not in the base | Agrees | None |
| Description: “uniform bound on finite automorphism subgroups” (`IsK3.finiteSubgroup_card_le`, §6.6) | G=1; char 3; max of the two orders | Nat.card 1=1≤bound; ℓ=5 when char=3; ∣GL₂₂(𝔽₃)∣ has 231 digits, ∣GL₂₂(𝔽₅)∣ 339, so max is the second | Statement as described | None |
| Description: “sharper tame symplectic bounds via M₂₃” (§6.11) | Order of M₂₃, of M₂₄ | 2⁷·3²·5·7·11·23=10200960; 2¹⁰·3³·5·7·11·23=244823040; both as in README and `gap:mathieu-permutation-model` | Agrees | None |
| Description: suppliers named (McKaySkewGroup §7.2 in §§6.1–6.1a; K3Surfaces K1 in §§1.3, 3.1, 4.4) | The cited `*Needs:*` lines | `README.md:887` §§7.1–7.3, `:907` §§7.2–7.3; `:321`, `:533`, `:622` each list K1 | Agrees | None |
| Description: “PeriodsAndSpecialValues consumes every layer”; #849, #1335, #1336 “supply no premise” | `README.md:1406`, `:21` | Layers 1–3, 4, 5–6, 7–8 = all 8; README says the same three supply no premise | Agrees | None |

Rows for the folder's statements stand as in the previous review, of `cc2efa8`.

- Title and description: every prose sentence and the summary block read against the head and against the change (roadmap added, 3 files, 1782 insertions, 0 headings or declarations removed); 0 contradicted, 0 unstated changes.
- Sources: 2 locators reopened for the sentences above (stacks-surface-resolution line 2327; rizov lines 779–784), both as cited.
- Suppliers: of the 22 `From TauCetiRoadmap.*` suppliers, 16 are on main; the 6 not on main (K3Surfaces, AlgebraicModuliForArithmeticGeometry, NoncommutativeAndEquivariantIwasawa, NeronModelsAndSemistableAbelianVarietiesPartII, ComplexComparisonPartII, CrystallineCohomology) are all earlier in the merge order and all named in the description.
- Gate: rerun ends `OK`, every counter 0; no file changed outside the folder.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 13 `sorry` warnings and nothing else; no declaration changed, so signatures stand as checked at `cc2efa8`.
- Overlaps and citations: no open pull request changes this roadmap, no cited id dropped or defined only by a revision; the 10 "found nowhere" names are this roadmap's own `IsK3.*` declarations in `Suggested.lean`.

Overlap check: read K3Surfaces, EnriquesSurfacesAndIntegralNonexistence, EnriquesSurfaces, AlgebraicModuliForArithmeticGeometryPartII, StableReductionPartII, SchemeAndStackFoundations and StableReduction as listed; nothing changed in the folder and no new shared object: ownership stands as in the previous review.

Source independence: changed passages only; the folder has 0 changed passages, so 0 passages compared; no layer added, removed or reordered, arrangement not reassessed.

## Not verifiable

- None this round; the settled waived and uncertified sources remain as recorded earlier.

## Source issues

- none

## For the human reviewers

- none
