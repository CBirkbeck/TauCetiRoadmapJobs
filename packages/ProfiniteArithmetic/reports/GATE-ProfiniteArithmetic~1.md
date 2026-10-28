# GATE-ProfiniteArithmetic~1: answers to the review of `53d0c7b`

Repairs committed as `a0a63ba8` on the pull-request branch (not pushed). Files touched:
`TauCetiRoadmap/ProfiniteArithmetic/README.md`, `TauCetiRoadmap/ProfiniteArithmetic/Suggested.lean`.

## H01 (CBirkbeck) — answered

Correct, and not repairable inside the two editable files: `git ls-tree origin/main TauCetiRoadmap/ProfiniteArithmetic/` is empty, main (`ffcc9d31`) carries `Completed/ProfiniteArithmetic/` (commits `632ef72f`, `b20d16e1`, `7baea00d`), and `632ef72f` is not an ancestor of this head (merge base `0e8b058a`), so merging re-creates the active folder beside the archive with the same `TauCetiRoadmap.ProfiniteArithmetic.*` names. Closing the pull request, or carrying what survives below into `Completed/ProfiniteArithmetic/` or a Part II, is the human decision the review asks for; the repairs H02–H10 were made so that whatever is carried over is correct.

## H02 (CBirkbeck) — applied

`Suggested.lean`: `set_option autoImplicit false` deleted; `set_option quotPrecheck false in` + `Additive TauCeti.zHat.{0}` → `scoped notation "ẑ" => Additive (TauCeti.zHat : Type)`; the three `set_option linter.unusedSectionVars false in` → `omit [IsTopologicalGroup G] in` (`ContinuousAut.mapQuotient_mk`, `ContinuousAut.mapClosedQuotient_mk`, `ContinuousAut.continuous_mapClosedQuotient`). Gate now reports `set_option=0`.

## H03 (CBirkbeck) — applied differently

README 2.4: the "complete compatible-family model" bullet with steps 1–4 is replaced by (a) the pro-`p` theorem cited to the pinned `TauCeti.IsProP.isProP_ker_mapQuotient_proPFrattini` and `TauCeti.ContinuousAut.isOpen_ker_mapQuotient_proPFrattini` (`ContinuousAut/ProP.lean:84,64`), and (b) one comparison statement: the image of `H` under `TauCeti.ContinuousAut.isClosedEmbedding_pi_mapQuotient`, restricted to the characteristic open `N ≤ proPFrattini p G`, is the set of compatible Frattini-trivial families; `Suggested.lean` loses `FrattiniCharacteristicIndex` and the three `sorry`'d theorems. It differs from the suggested repair in one point: (b) carries a proof sketch from pinned inputs (`exists_mapQuotient_eq`, `range_pi_mapQuotient`, `exists_isTopCharacteristic_le`, `isOpen_proPFrattini`, `map_proPFrattini_eq_of_surjective`, `IsPGroup.proPFrattini_eq_frattini`, all opened at Tau Ceti `a91d3aa`) rather than a citation of `range_pi_mapQuotient_ker_proPFrattini`, which is not at the pin and so cannot be a supplier contract.

## H04 (CBirkbeck) — applied

Confirmed at the pin: `continuousMonoidHomEquiv` already takes `P : Type v` (`Profinite/Completion.lean:173–179`), `zHat.lift : zHat.{u} →ₜ* P` for `P : Type v` (`ZHat/Basic.lean:138–142`), and `ZHat/Basic.lean:16–18` points to `ZHat/Ring.lean`. Deleted: the subsection "Changes to existing Tau Ceti declarations", the scope bullet and supplier-table sentence pointing to it, the 1.1 sentence "generalized in place … (`zHat.lift_eq_tauCeti`)" (now "The universal property (Tau Ceti)", stating that Tau Ceti's version already allows any universe), the Conventions bullet on `lift_eq_tauCeti`, and the theorem `zHat.lift_eq_tauCeti`; the 1.1 *Needs:* line drops the inputs of the generalization route.

## H05 (CBirkbeck) — applied differently

The module docstring now says the file is not the roadmap and names its headline theorems (`nonempty_ringEquiv_pi`, `ContinuousAut.compactSpace`, `isPGroup_frattiniKernel`, `isProP_ker_toFrattiniQuotient`, `lcsGradedPiece_eq_sum_bracket`, `lcsGradedPiece_zero_freeProP_bijective`, `lcsGradedPiece_one_freeProP_bijective`), all statable at the pins; the "not exhaustive / `sorry` is allowed" paragraph is gone. The API aliases are kept: the README names them as this roadmap's declarations throughout, and stripping them is only worth doing where the roadmap survives, which by H01 is the archive, whose `Suggested.lean` a consumer (PeripheralActions) imports with this API.

## H06 (CBirkbeck) — applied

`isClosed_isConj_pair` and `ContinuousAut.isClosed_isConj` are now proved by the pinned `TauCeti.isClosed_isConj_pair G` (`Topology/Algebra/Group/Conjugacy.lean:27`) and `TauCeti.ContinuousAut.isClosed_isConj hfg x y` (`ContinuousAut/Congruence.lean:284`) instead of the 15-line and 4-line tactic proofs.

## H07 (CBirkbeck) — applied

README `continuousMonoidHomEquiv_symm_apply_etaFn` (old line 105) went with the subsection deleted under H04; `ContinuousAut.exists_mapQuotient_eq` → `TauCeti.ContinuousAut.exists_mapQuotient_eq` (2.4); `isProP_multiplicative_padicInt` → `TauCeti.isProP_multiplicative_padicInt` (3.3 proof). Gate reports `readme-ids-missing=0`.

## H08 (CBirkbeck) — applied

Every "native" is gone from README and Lean: Conventions supplier paragraph ("these native declarations" → "these Tau Ceti declarations"), 3.2 ("Use the native graded-piece/abelianization comparison" → "the topological inverse is Tau Ceti's `TauCeti.lcsGradedPieceZeroEquiv`"), the Conventions bullet on the Heisenberg group ("native parents" → "those Tau Ceti declarations"), the 2.4 steps (deleted), and the module docstring.

## H09 (CBirkbeck) — applied

"Construct the following model", steps 1–4 and "do not define a second automorphism topology" are deleted; the 2.4 comparison statement is followed by a *Proof sketch* naming its inputs, and the closing Conventions bullet on 2.4 no longer lists mandatory "cofinality, quotient-Frattini, reconstruction, inverse and topology laws".

## H10 (CBirkbeck) — applied

`frattiniCharacteristicIndex_cofinal` (unused `hG`) and `frattiniCharacteristicIndex_map_Frattini` (unused `IsTopCharacteristic` and `≤ Φ` conjuncts) are deleted with the rest of H03; the README states neither, so no statement with those hypotheses remains.

## Build

`lake build TauCetiRoadmap.ProfiniteArithmetic.Suggested`: `Build completed successfully (9101 jobs).` No errors, no warnings; the file has no `sorry` left.

## Gate

`gate ProfiniteArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Direction check (`gate --depcheck … --movable`): `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

The gate passing does not settle H01: the folder still re-creates a roadmap that main has archived.

## Elaborated signatures

I appended `#check @name` for every declaration whose signature changed (`isClosed_isConj_pair`, `ContinuousAut.isClosed_isConj`, `ContinuousAut.mapQuotient_mk`, `ContinuousAut.mapClosedQuotient_mk`, `ContinuousAut.continuous_mapClosedQuotient`, `isProP_ker_toFrattiniQuotient`, `zHat.lift`) to the file, built it once and then removed them. The three `omit` declarations lose only `[IsTopologicalGroup G]`, which their statements and the aliased Tau Ceti lemmas do not use. That widens them and matches the README's statements, which do not assume it. The other types are unchanged from `signatures.md`. Of the nine dropped-binder leads in `signatures.md`, none involves an edited declaration, and the review's check of them (instances the aliased Tau Ceti declaration does not need) holds.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 2.4 comparison: image of `H` = compatible Frattini-trivial families over `I = {N char open normal, N ≤ Φ}` | trivial `G` | `Φ = 1`, `I = {1}`, `MulAut 1 = 1`, `H = 1`: both sides one point | true | added the degenerate case to the text |
| same | `G` a finite `p`-group, discrete | `⊥ ∈ I`, coordinate at `⊥` is `φ` itself; Frattini-trivial at `⊥` ⇔ `φ` trivial on `G/frattini G = G/Φ` (`proPFrattini_eq_frattini`) | true | none |
| same | `G = ℤ_p²`, `N = p²ℤ_p²`, `α_N = [[1,p],[0,1]]` on `(ℤ/p²)²` | `α_N ≡ 1 mod p`, so Frattini-trivial; it is the reduction of `[[1,p],[0,1]] ∈ GL₂(ℤ_p)`, which lies in `H` | true | none |
| same, surjectivity over a cofinal index only | char open `N' ⊄ Φ`, `N ≤ N'`, `N ∈ I` | pinned `exists_mapQuotient_eq` needs a family on *all* char `N'`; over `I` the family defines `φ` on `lim_{I} G/N = G`, and `α_N = φ mod N` preserves `N'/N` | true, but the first sketch cited the pinned lemma as if it were indexed by `I` | sketch rewritten: "the argument of … run over the cofinal index" |
| same, embedding after restriction | char open `N'` | `N' ⊓ Φ` is char, open, normal and `≤ Φ`, so it is in `I`, and `mapQuotient N'` factors through it | restricted map stays a topological embedding | stated in the sketch |
| 1.1 "universal property (Tau Ceti)" in any universe | `P : Type 1`, `G : Type 0` | pinned `continuousMonoidHomEquiv` binder `P : Type v` independent of `G`'s universe | true at the pin | replaces the "generalized in place" claim |
| `isClosed_isConj_pair` via `TauCeti.isClosed_isConj_pair` (`[T2Space G]`) | compact, totally disconnected `G` | `T2Space` inferred (totally disconnected ⇒ `T1`, and a `T1` topological group is `T2`); elaborates | true | none |
| `ẑ` notation with `(TauCeti.zHat : Type)` | universe check | elaborated `zHat.lift` target shows `TauCeti.zHat.toProfinite.toTop` at universe 0, the same as `.{0}` | unchanged meaning | none |

## Ownership and sources

No new construction is added: the 2.4 comparison describes Tau Ceti's kernel inside Tau Ceti's closed embedding, and the archived `Completed/ProfiniteArithmetic/` README 2.4 on main states the same description (the duplication is H01). No cross-roadmap citation was added or changed. No source was fetched or added; the 2.4 locators (Ribes–Zalesskii §4.4–4.5; Dixon–du Sautoy–Mann–Segal Ch. 5) are unchanged, and `needs-references.toml` was not written.

## Untrusted text

The review text contains no instructions beyond mathematical claims and repair suggestions; nothing in it was suspicious.
