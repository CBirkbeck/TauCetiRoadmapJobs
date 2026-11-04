# GATE-SporadicOrders~2: answers to the review of `e16fe9d`

All six points come from one comment by CBirkbeck: an AI review that reports findings F01–F06. They are numbered H01–H06 in order. Repairs are in commit `824bdaad` on top of `e16fe9d`.

## H01 (CBirkbeck) — applied

The point is correct. An orbit on 24 points has at most 24 elements, so 48 cannot be a basic-orbit length. Old README Check: "`24 · 23 · 22 · 21 · 20 · 48`, the lengths of the basic orbits". New Check (`TauCetiRoadmap/SporadicOrders/README.md`, Layer 1, Checks, `M24`): with base `0, …, 6` the basic orbits are 24, 23, 22, 21, 20, 16, 3. The pointwise stabilizer of `0, …, 4` has order `244823040 / 5100480 = 48`, and on the other 19 points it has one orbit of length 3 (`{10, 16, 23}`) and one of length 16.

The same defect was looked for everywhere else. Every model now has a basic-orbit column in the Layer 1 table, computed from the ATLAS files for the base `0, 1, 2, …`; no entry is larger than the degree, and each row's product equals the order.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/SporadicOrders/Suggested.lean` now has all ten carriers, `M11 M12 M22 M23 M24 J1 J2 HS McL Co3`. Each is a `Subgroup.closure` of two typed lists of disjoint cycles followed by `.prod`. Each carrier has its own `card_<Name>` and `exists_surjective_<Name>` (20 `sorry` theorems; before: 1 carrier and 3 theorems). The file elaborates in 16 s under the default limits.

Every carrier was checked point by point against the ATLAS `.m1`/`.m2` image lists, with the shift `i ↦ i - 1`: all 20 permutations agree. `nontrivial_M24` is dropped. It follows from `exists_surjective_M24` and `card_M24` in a few lines, so it is a corollary rather than a headline. Layer 2.2 of the README states nontriviality and the conditional lower bound for every name, in prose.

## H03 (CBirkbeck) — applied

O0 is no longer a milestone that adds a package and runs a tactic test. It is now Layer 0 (labelled O0, the label that CFSGBasicProperties on main cites), with two mathematical targets:
- 0.1, the stabilizer-chain order formula `Nat.card G = (∏ ncard (G₍ᵢ₎ · bᵢ)) · Nat.card G₍ₖ₊₁₎`, for an arbitrary type `α` and no finiteness hypothesis, proved from Mathlib `MulAction.index_stabilizer` and `Subgroup.card_mul_index`;
- 0.2, the orbit of a point under a generated subgroup when `α` is finite, used with Schreier's lemma `Subgroup.closure_mul_image_eq`.

Every requirement to use `perm_group`, `decide +kernel` or `permOfImages` is gone. Hex is cited once, as a possible proof route (Layer 1.2 and References), with its soundness hypothesis stated.

## H04 (CBirkbeck) — applied

Layer 1.1 now has an API list for each carrier, inherited from `Subgroup.closure` (`Subgroup.subset_closure`, `Subgroup.closure_le`, `Subgroup.closure_induction`). Each of the ten models has three Checks computed from its own files:
- generator orders and fixed-point counts;
- an image-direction witness `b 0` against `b⁻¹ 0`, and a product-convention witness `(a * b) 0` against `(b * a) 0`;
- the basic orbits, with what each one rules out.

For example, `M11` has `b 0 = 3` and `b⁻¹ 0 = 7`. For `Co3`, `a * b⁻¹` has order 10 where `a * b` has order 14, while `a⁻¹ * b⁻¹` keeps order 14. Layer 2.1 records the review's relator witness, recomputed. On `(a, b)` the sixth relator of `M24G1-P1` sends 0 to 20. On `(a, b⁻¹)` all seven relators hold. The power relators hold for both pairs.

## H05 (CBirkbeck) — applied

The README now has the house shape:
- Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib and Tau Ceti, by declaration and file), How to read the build;
- Layers 0–2, keeping the labels O0–O2 so that CFSGBasicProperties' citations still resolve, with `*Needs:*` on every target and Examples and Dependencies at the end of every layer;
- Downstream consumers and References.

`Suggested.lean` has `/-! ## Layer 1 … -/` and `/-! ## Layer 2 … -/` section comments. CFSGBasicProperties appears only as a consumer.

## H06 (CBirkbeck) — applied differently

The README now ends with References:
- the ATLAS, with the URL pattern of each group page, representation page and image file;
- Hex at commit `e32bc477b43ef24e1937520fa2eb106163c3cd08` of the renamed repository `leanprover/hex-perm-group-theory`, with `HexPermGroupTheory/Kernel.lean` and `Hex.PermGroup.Kernel.card_closure`;
- FiniteSimpleGroups at commit `7f09e33a9ceef6b59ce03e34cd4f0558c763e325`, the commit that pinned Tau Ceti cites;
- Dixon–Mortimer Theorem 1.4A and Seress §4.1 for Layer 0.

`sources.toml` was not created, because this job may edit only the README and `Suggested.lean`. The manifest entries still need to be added by a job that may edit it: `atlas` (institutional, fetched), `hex` and `finite-simple-groups` (author repositories), and `dm` and `seress` (paywalled books, to be recorded as `uncertified`).

## Build and gate

- `lake build TauCetiRoadmap.SporadicOrders.Suggested`: Build completed successfully (8992 jobs), with 20 `declaration uses 'sorry'` warnings and nothing else.
- Gate summary line: `gate SporadicOrders: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1170 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `roadmaps resolve`: no unresolved cross-roadmap citation and no unresolved Lean name. The earlier lead `Hex.PermGroup.Kernel.card_closure` is no longer a backticked supplier name, and it was confirmed in Hex at the commit cited.

## Signatures

The 20 `#check @…` lines were appended to `Suggested.lean`, run through the allowed `lake build` once, and then removed. Each `card_<Name>` elaborated to `Nat.card ↥<Name> = N` with the README's `N`. Each `exists_surjective_<Name>` elaborated with no extra binders. The file has no section `variable`s, so nothing changed.

## Ownership and suppliers

- The stabilizer-chain order formula and the orbit description of Layer 0 are owned here. Searches of main and the open heads found no other owner: `roadmaps grep` for stabilizer chains, Schreier–Sims and base/strong generating set found only citations. CertifiedPermutationComputation, an open PR, owns encodings, orbits/primitivity checking and Jordan recognition, but not the order formula.
- Mathlib has the inputs but not the iterated formula.
- Suppliers are Mathlib, Tau Ceti (CFSGStatement S0–S1, on main) and nothing later in the order. No notion was moved down.

## Adversarial pass (computed)

Orders were computed with two independent exact Schreier–Sims implementations, one with a free base and one with the base `0, 1, 2, …`, on the fetched ATLAS image lists.

| Statement | Instances tried | Computed | Stated | Result / change |
|---|---|---|---|---|
| `card_M11` | base 0..3 | 11·10·9·8 = 7920 | 7920 | holds |
| `card_M12` | base 0..4 | 12·11·10·9·8 = 95040 | 95040 | holds |
| `card_M22` | base 0..4 | 22·21·20·16·3 = 443520 | 443520 | holds |
| `card_M23` | base 0..5 | 23·22·21·20·3·16 = 10200960 | 10200960 | holds |
| `card_M24` | base 0..6 | 24·23·22·21·20·16·3 = 244823040 | 244823040 | holds; old "·48 basic orbit" Check fixed (H01) |
| `card_J1` | base 0..2 | 266·110·6 = 175560 | 175560 | holds |
| `card_J2` | base 0..3 | 100·63·24·4 = 604800 | 604800 | holds |
| `card_HS` | base 0..4 | 100·77·60·32·3 = 44352000 | 44352000 | holds |
| `card_McL` | base 0..5 | 275·112·81·36·5·2 = 898128000 | 898128000 | holds |
| `card_Co3` | base 0..5 | 276·275·162·56·45·16 = 495766656000 | 495766656000 | holds |
| Carrier definitions | Lean cycles against ATLAS images, 20 permutations | 20/20 equal | — | holds |
| Generator parity | all 20 generators | all even | README "in the alternating group" | holds |
| Direction witnesses | `b 0`, `b⁻¹ 0` for all ten | e.g. M24 3 vs 5, Co3 203 vs 81 | README Checks | added |
| Co3 inversion | `ord(a b)`, `ord(a b⁻¹)`, `ord(a⁻¹ b⁻¹)` | 14, 10, 14 | README Check | added |
| `exists_surjective_M24` route | `M24G1-P1` relators on `(a,b)` and `(a,b⁻¹)` | (a,b): relator 6 sends 0↦20, the other six hold; (a,b⁻¹): all 7 hold | Layer 2.1 Check | added |
| Surjection to a lower bound | infinite presented group | `Nat.card = 0`, so `N ≤ 0` is false | bound needs `0 < Nat.card` | hypothesis kept and explained |
| 0.1 order formula | S₃ base 0,1; C₃ base 0 and 0,1; trivial group, empty base; ℤ with shift | 6; 3 and 3·1; 1; 0 = 0 | — | holds with no finiteness; Checks added |
| 0.1 wrong model | multiply the orbits of `G` itself | S₃: 3·3 = 9 ≠ 6 | — | excluded by Check |
| 0.2 orbit as closed set | Fin 4 with S = {c[0,1]}; Fin 3 with S = ∅; ℤ with shift | {0,1}; {b}; ℕ is closed but the orbit is ℤ | needs `Finite α` | hypothesis added |
| M24 stabilizer | pointwise stabilizer of {0..4} | order 48, orbits 16 and 3 = {10,16,23} | README Check | added |
| HS / J2 second factor | point-stabilizer orbits | HS: M22 orbits 1, 22, 77, point 1 in the 77-orbit; J2: 63 | README Checks | added |
| Co3 point stabilizer | 495766656000 / 276 | 1796256000 = 2·\|McL\| | README Check | added |

## Sources

- The ATLAS group pages and all 20 `.m1`/`.m2` image files were fetched through the sources service from the ATLAS host, with licence class `institutional`.
- Hex `Kernel.lean` was read at the cited commit on GitHub.
- Dixon–Mortimer and Seress are paywalled textbooks, cited by locator only (uncertified).
- No source passage was copied, and no text is missing, so no `needs-references.toml` request was filed.
- The review contained no suspicious instructions.
