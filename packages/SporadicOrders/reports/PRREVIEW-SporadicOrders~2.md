# Review of SporadicOrders (pull request #599 at 824bdaa)

**Verdict:** needs changes

🤖 Independent AI review of the repaired head. Three findings: one P2 and two P3. The gate passes, the twenty headline theorems elaborate, all twenty generator transcriptions agree with the ATLAS files point by point, every number in the Layer 1 table and its Checks recomputes, and nine of the ten surjections are now positively witnessed by explicit generator images. What blocks acceptance is a supplier-drift defect: the Exact supplier contracts and Layer 2 cite three Tau Ceti declarations that do not exist at the pin. No pull-request file was changed.

## Repair of the previous review's findings

- **R01 (P1, the orbit of length 48).** Repaired. `README.md:288–292` now reads “The basic orbits for the base `0, …, 6` are 24, 23, 22, 21, 20, 16, 3 … The number 48 is the order of a stabilizer, not the length of an orbit”. Recomputed: chain lengths 24, 23, 22, 21, 20, 16, 3; the pointwise stabilizer of `0, …, 4` has order `244823040 / (24·23·22·21·20) = 48` and orbits of lengths 16 and 3 on the other 19 points, the 3-orbit being `{10, 16, 23}`.
- **R02 (P2, nine missing headlines).** Repaired. `Suggested.lean` now declares the ten carriers and twenty theorems; all elaborate under the defaults with exactly twenty `sorry` warnings.
- **R03 (P3, executable milestones).** Repaired. Layer 0 is now the stabilizer-chain order formula and the orbit description; `README.md:247–249` says any route is acceptable and “the statement prescribes no route”. No `lakefile`, tactic name or heartbeat setting remains in the README.
- **R04 (P3, per-carrier Checks).** Repaired. Each of the ten carriers has three Checks at `README.md:254–325`, including a direction Check and a product-convention Check; every value recomputes (tables below).
- **R05 (P3, layer structure).** Repaired. Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, three layers with `*Needs:*` lines, Examples and Dependencies, Downstream consumers and References are present; the Lean file carries the two layer section comments.
- **R06 (P3, source locators).** Repaired as far as the house form asks. References give the ATLAS file stems and URLs, the Hex commit with its file and declaration, and the FiniteSimpleGroups commit. No roadmap on main carries a `sources.toml`, so its absence is not raised.

## R01 (P2) — Three Tau Ceti declarations cited as supplier contracts do not exist at the pin

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:108–115` (“`TauCeti.GroupPresentation.homEquiv` … `TauCeti.Relator.eval` … the commutator constructor used by the presentations is `TauCeti.Relator.commInvInv`, denoting `r⁻¹ s⁻¹ r s`”); also lines 345, 353–354, 376, 378–379 and 407–408, where 2.1, 2.2 and the Layer 2 Dependencies consume the same names.

**Claim:** Tau Ceti at the pin supplies a hom-correspondence `homEquiv`, a relator evaluator `Relator.eval`, and a constructor `commInvInv` with the convention `r⁻¹ s⁻¹ r s`.

**Witness:** At Tau Ceti `a780c7ad`, a search of the whole tree finds no `homEquiv` other than `TauCeti.IsProjectiveCover.homEquivOfIsSimpleModule` (a module-theory declaration), no `Relator.eval`, and no `commInvInv`. `TauCeti/GroupTheory/Presentation/Relator.lean:70–85` defines the constructors `gen`, `inv`, `mul`, `pow`, `comm`, with `comm` documented as Mathlib's `⁅r, s⁆ = r * s * r⁻¹ * s⁻¹`, and says a source using `r⁻¹ s⁻¹ r s` is transcribed as `comm (inv r) (inv s)`; the sporadic modules do exactly that through a private `sourceComm` (for example `Mathieu/TwentyFour.lean`, the abbreviation before `m24Presentation`). The `GroupPresentation.lean` API at the pin is `relators`, `relatorLetters`, `relatorSet`, `mem_relatorSet_iff`, `relatorSet_eq_relatorSet_transcribed`, `Group`, `matchesMetadata`; nothing hom-shaped.

**Repair:** Rewrite the Tau Ceti contract and the three Layer 2 citations with the pinned names. The relator evaluation is `FreeGroup.lift τ (TauCeti.Relator.toFreeGroup r)` (equivalently `FreeGroup.lift τ (FreeGroup.mk r.toWord)`, the two agreeing by `TauCeti.Relator.toWord_toFreeGroup`), ranging over `r ∈ P.transcribed`, which is `P.relatorSet` by `TauCeti.GroupPresentation.mem_relatorSet_iff` and `relatorSet_eq_relatorSet_transcribed`; the hom out of `TauCeti.GroupPresentation.Group` is Mathlib's `PresentedGroup.toGroup` with `toGroup.of` and `toGroup.unique` (`Mathlib/GroupTheory/PresentedGroup.lean:135, 139, 142`), so delete the `homEquiv` sentence or state it as a consequence of those three. Replace the commutator sentence by: the constructor is `TauCeti.Relator.comm`, Mathlib's `r s r⁻¹ s⁻¹`, and every presentation whose source writes `[r, s] = r⁻¹ s⁻¹ r s` transcribes it as `comm (inv r) (inv s)`. I evaluated all seven M24 relators, nine M23, five J1, thirteen HS and fifteen McL relators with exactly this semantics (table D) and they hold on the models, so the repair costs no mathematics.

## R02 (P3) — Downstream consumers promises Layer 0 “membership theorems” that no layer states

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:415–416`: “Its P0 uses the Layer 0 order and membership theorems for finite permutation groups”; `README.md:179–181`: the membership criterion “carries no separate target”.

**Claim:** Layer 0 delivers a membership theorem that CFSGBasicProperties P0 can consume.

**Witness:** Layer 0 has two targets, the order formula (0.1) and the orbit description (0.2); the membership sentence at 0.2 is explicitly not a target. CFSGBasicProperties on main, `README.md:69–73`, expects from this roadmap “order/membership certificates” through a checker, which is also not what the Scope section (lines 45–47) offers.

**Repair:** Either state the membership criterion of 0.2 as a target with its hypotheses (`g ∈ G` iff for the base `b₁, …, bₖ` there are transversal elements `tᵢ ∈ G₍ᵢ₎` with `tᵢ bᵢ = (t₁ ⋯ tᵢ₋₁)⁻¹ g bᵢ` and the residue trivial), with three Checks (`S₃` and a transposition in and out of `⟨c[0, 1, 2]⟩`; the trivial group; an element of `Equiv.Perm (Fin 4)` outside `⟨c[0, 1]⟩`), or drop “membership” from Downstream consumers. In both cases say in Scope what CFSGBasicProperties P0 receives, since its text on main names a checker rather than theorems.

## R03 (P3) — Layer 0.2 and CertifiedPermutationComputation §2.2 state the same orbit lemma

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:170–174`: “the orbit of `b` under `Subgroup.closure S` is the least subset of `α` that contains `b` and is mapped into itself by every `s ∈ S`”.

**Claim:** This roadmap owns the orbit-of-a-generated-group description.

**Witness:** CertifiedPermutationComputation, Layer 2.2 (a roadmap still in a pull request, read through the roadmaps tool), asks to “prove equivalence between reachability and membership in the orbit of the generated group” for the graph whose edges are the generators and their inverses; that is the same lemma with inverses included. Neither roadmap is in the merge order yet. Mathlib at the pin has no such lemma (no `orbit`/`closure` theorem in `Mathlib/GroupTheory/GroupAction/` or `Mathlib/Algebra/Group/Subgroup/`), so one of the two must own it.

**Repair:** Say in Scope and ownership which roadmap owns the abstract lemma. If this one, keep 0.2 as is (its finite-`α` form without inverses is the stronger statement) and note that CertifiedPermutationComputation's reachability equivalence is its executable corollary; if the other, cite CertifiedPermutationComputation §2.2 in 0.2's `*Needs:*` line once it is in the merge order. This is a coordination note, not a mathematical defect.

## Verified sound

The review covered both files at head `824bdaad6bb2683beb037c394f5151960908bb06`, with main at `c9940702`. Pins: Mathlib `5e0c4e5239cb0a2d86d68a884bf52cfd963fce22`, Tau Ceti `a780c7ad6beb23f60a17351a492d177878020ad5`.

**Gate, build and signatures.** The worker's gate reports every check passing (`set_option`, LaTeX, pull-request numbers, sorry'd data, imports, stray files, outside-folder diff, build). The outside-folder diff is empty. I built `TauCeti.GroupTheory.SpecificGroups.CFSG.Sporadic.Presentation` and elaborated `Suggested.lean` with `lake env lean`: exit 0, twenty `sorry` warnings, nothing else, 9.4 s. A scratch copy with `#check @name` for all thirty declarations elaborated and printed `M11 : Subgroup (Equiv.Perm (Fin 11))` … `Co3 : Subgroup (Equiv.Perm (Fin 276))`, `card_<Name> : Nat.card ↥<Name> = N` with the ten values of the README table, and `exists_surjective_<Name> : ∃ f, Function.Surjective ⇑f` whose `f` is declared in the source as `SporadicName.<Name>.Group →* <Name>`. There are no section variables, so nothing can disappear; no signature correction was needed. The README's generality equals the Lean's (closed statements about ten fixed carriers).

**Padding probe.** A scratch copy replacing each `sorry` by `first | rfl | simp | infer_instance` produced twenty errors, one per theorem: nothing closes in one tactic. None of the twenty restates a definition, mirrors a Check or computes a small value. No `example`, `lemma`, `set_option`, `#eval` or `#print` is present.

**Headline inventory.** The README's headlines are the ten orders `card_<Name>` (1.2) and the ten surjections `exists_surjective_<Name>` (2.2); all twenty are stated. Layer 0's two general theorems are not headlines, and the docstring says so. No headline is forced through a stand-in; every carrier is a real `Subgroup.closure` of two explicit permutations.

**Transcription of the twenty ATLAS files.** I fetched the twenty image files through the sources service (institutional class, Queen Mary's ATLAS v3), parsed each as the header `12 1 n 1` followed by `n` images, checked bijectivity, shifted by one, and compared with the permutations obtained from the Lean cycle lists under `List.formPerm_apply_lt_getElem` (`c[x₀, …]` sends `xⱼ` to `xⱼ₊₁`, `Mathlib/GroupTheory/Perm/List.lean:163`). I also checked that the cycles of each generator are pairwise disjoint, so `List.prod` is order-independent.

| Carrier | Degree in both files | Lean `a` equals file `.m1` | Lean `b` equals file `.m2` | `a`: order, fixed points, parity | `b`: order, fixed points, parity |
| --- | ---: | --- | --- | --- | --- |
| M11 | 11 | yes, 11/11 points | yes | 2, 3, even | 4, 3, even |
| M12 | 12 | yes | yes | 2, 4, even | 3, 0, even |
| M22 | 22 | yes | yes | 2, 6, even | 4, 2, even |
| M23 | 23 | yes | yes | 2, 7, even | 4, 3, even |
| M24 | 24 | yes | yes | 2, 0, even (twelve 2-cycles, first `c[0, 3]`, `c[1, 6]`) | 3, 6, even |
| J1 | 266 | yes | yes | 2, 10, even (128 2-cycles) | 3, 5, even |
| J2 | 100 | yes | yes | 2, 0, even (50 2-cycles) | 3, 4, even |
| HS | 100 | yes | yes | 2, 20, even (40 2-cycles) | 5, 0, even |
| McL | 275 | yes | yes | 2, 35, even (120 2-cycles) | 5, 0, even |
| Co3 | 276 | yes | yes | 3, 6, even | 4, 16, even (4-cycles and 2-cycles) |

**Adversarial pass, table A: orders (1.2) and basic orbits.** For each carrier I ran my own deterministic Schreier–Sims with the prescribed base `0, 1, 2, …`, then verified completeness: every Schreier generator at every level sifts to the identity through the levels below (the certificate condition), so the product of the basic-orbit lengths is the exact order, not a lower bound. The ATLAS value is the group page's line 9.

| Statement | Base and basic orbits computed | Product | README `N` | ATLAS page line 9 | Result |
| --- | --- | ---: | ---: | ---: | --- |
| `card_M11` | 0,1,2,3: 11, 10, 9, 8 | 7920 | 7920 | 7920 | equal |
| `card_M12` | 0..4: 12, 11, 10, 9, 8 | 95040 | 95040 | 95040 | equal |
| `card_M22` | 0..4: 22, 21, 20, 16, 3 | 443520 | 443520 | 443520 | equal |
| `card_M23` | 0..5: 23, 22, 21, 20, 3, 16 | 10200960 | 10200960 | 10200960 | equal |
| `card_M24` | 0..6: 24, 23, 22, 21, 20, 16, 3 | 244823040 | 244823040 | 244823040 | equal |
| `card_J1` | 0,1,2: 266, 110, 6 | 175560 | 175560 | 175560 | equal |
| `card_J2` | 0..3: 100, 63, 24, 4 | 604800 | 604800 | 604800 | equal |
| `card_HS` | 0..4: 100, 77, 60, 32, 3 | 44352000 | 44352000 | 44352000 | equal |
| `card_McL` | 0..5: 275, 112, 81, 36, 5, 2 | 898128000 | 898128000 | 898128000 | equal |
| `card_Co3` | 0..5: 276, 275, 162, 56, 45, 16 | 495766656000 | 495766656000 | 495766656000 | equal |

The prime factorizations in the Lean docstrings and the Layer 1 Examples recompute: `2⁴·3²·5·11 = 7920`, `2⁶·3³·5·11 = 95040`, `2⁷·3²·5·7·11 = 443520`, `2⁷·3²·5·7·11·23 = 10200960`, `2¹⁰·3³·5·7·11·23 = 244823040`, `2³·3·5·7·11·19 = 175560`, `2⁷·3³·5²·7 = 604800`, `2⁹·3²·5³·7·11 = 44352000`, `2⁷·3⁶·5³·7·11 = 898128000`, `2¹⁰·3⁷·5³·7·11·23 = 495766656000`.

**Table B: the per-carrier Checks (1.2).** Products use Mathlib's `(σ * τ) x = σ (τ x)`.

| Check | Computed | README | Result |
| --- | --- | --- | --- |
| M11 orders of `a`, `b`, `a*b` | 2, 4, 11 | 2, 4, 11 | equal |
| M11 direction | `b 0 = 3`, `b⁻¹ 0 = 7` | 3, 7 | equal |
| M11 cyclic control | order of `⟨a*b⟩` is 11 ≠ 7920 | 11 | equal |
| M12 orders; `b 0`, `b⁻¹ 0`; `(a*b) 0`, `(b*a) 0` | 2, 3, 11; 7, 8; 7, 1 | same | equal |
| M12 point stabilizer | 95040 / 12 = 7920; stabilizer of 0 has orbits 1, 11 | 7920, 5-transitive | equal |
| M22 orders; direction; products | 2, 4, 11; 21, 20; 5, 1 | same | equal |
| M22 three-point stabilizer | orbits 1, 1, 1, 16, 3 on 22 points | fourth basic orbit 16 not 19 | equal |
| M23 orders; direction; products | 2, 4, 23; 15, 2; 14, 8 | same | equal |
| M23 four-point stabilizer | orbit of 4 is `{4, 10, 16}` (length 3), remaining orbit 16 | fifth orbit 3, then 16 | equal |
| M24 orders; `a*b⁻¹` | 2, 3, 23; `a*b⁻¹` order 23 | same | equal |
| M24 direction; products | `b 0 = 3`, `b⁻¹ 0 = 5`; `(a*b) 0 = 0`, `(b*a) 0 = 5` | same | equal |
| M24 swapped-image control | exchanging the images of 0 and 1 in `b`: odd, order 6 | odd, not of order 3 | equal |
| M24 five-point stabilizer | order 48; orbits 16 and `{10, 16, 23}` | 48; 3 and 16 | equal |
| J1 orders; direction; products | 2, 3, 7; 145, 20; 122, 254 | same | equal |
| J1 transitivity | stabilizer of 0 has orbits 1, 11, 12, 110, 132; 110 < 265 | not 2-transitive | equal |
| J2 orders; direction; products | 2, 3, 7; 79, 21; 78, 83 | same | equal |
| J2 point stabilizer | 604800 / 100 = 6048; orbits of the stabilizer of 0: 1, 36, 63 | 6048; 63 | equal |
| HS orders; direction; products | 2, 5, 11; 85, 46; 48, 73 | same | equal |
| HS point stabilizer | 443520; orbits 1, 22, 77; the point 1 lies in the 77-orbit | same | equal |
| McL orders; direction; products | 2, 5, 11; 23, 154; 81, 24 | same | equal |
| McL point stabilizer | orbits 1, 112, 162 | 112 | equal |
| Co3 orders; `a*b⁻¹`; `a⁻¹*b⁻¹` | 3, 4, 14; 10; 14 | 14; 10; 14 | equal |
| Co3 direction | `b 0 = 203`, `b⁻¹ 0 = 81` | same | equal |
| Co3 point stabilizer | stabilizer of 0 has orbits 1, 275 (2-transitive); 495766656000 / 276 = 1796256000 = 2 · 898128000 | same | equal |
| All ten: parity | both generators even in every model | “both generators of every model are even” | equal |

**Table C: Layer 0, Conventions and degenerate cases.**

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 formula, `k = 0` | any `G` | empty product 1 times `Nat.card G₍₁₎ = Nat.card G` | identity |
| 0.1 formula, `S₃`, base 0, 1 | `Equiv.Perm (Fin 3)` | orbits 3, 2; product 6 = `3!`; wrong formula `3·3 = 9` | Check correct |
| 0.1 formula, cyclic `⟨c[0,1,2]⟩` | base 0; base 0, 1 | orbits 3; 3, 1; both products 3 | Check correct |
| 0.1 formula, trivial group, empty base | `⊥` | `1 = Nat.card ⊥` | Check correct |
| 0.1 formula, infinite case | `α = ℤ`, `G = ⟨x ↦ x+1⟩`, base 0 | orbit `ℤ`, `Set.ncard = 0`; `G₍₂₎ = ⊥`, card 1; product 0 = `Nat.card G = 0` | identity holds with junk values |
| 0.1 inputs at the pin | `MulAction.index_stabilizer` (`Mathlib/GroupTheory/Index.lean:940`): `(stabilizer G x).index = (orbit G x).ncard`, variables `[Group G] [MulAction G X]` only; `Subgroup.card_mul_index` (`Index.lean:296`): `Nat.card H * H.index = Nat.card G`, no finiteness | as the README says | no missing hypothesis |
| 0.1 k-transitive bullet | `IsMultiplyPretransitive` is `IsPretransitive G (Fin n ↪ α)` (`MultipleTransitivity.lean:120`); for `k > n` the embedding type is empty and the bullet is vacuous | lengths `n, …, n−k+1` | correct |
| 0.2 orbit as least closed set | `Fin 4`, `S = {c[0,1]}`: from 0 → `{0,1}`, from 2 → `{2}`; `S = ∅` on `Fin 3`: `{b}` | orbit sizes 2, 1, 1 | Checks correct |
| 0.2 finiteness needed | `α = ℤ`, `S = {x ↦ x+1}` | `ℕ` is `S`-closed and contains 0; orbit of 0 is `ℤ` | negative control correct |
| 0.2 membership criterion | `S₃`: `g = c[0,1,2]`, `t = g`, `t⁻¹ g = 1 ∈ G₍₂₎`; `g = c[0,1]` against `⟨c[0,1,2]⟩`: no `t` with `t 0 = 1` has `t⁻¹ g` fixing 0 | in / out decided | correct, but not a target (R02) |
| Points convention | file image 4 at point 1 of `M24G1-p24B0.m2` gives `b 0 = 3`; preimage reading gives 5 | 3 versus 5 | direction pinned |
| Products convention | `S₃`, `σ = c[0,1]`, `τ = c[1,2]`: `(σ*τ) 0 = 1`, `(τ*σ) 0 = 2`; M24 `(a*b) 0 = a(b 0) = a 3 = 0`, `(b*a) 0 = b 3 = 5` | two-term witnesses | correct |
| Inverse-assignment rule (Conventions) | source word `s₁⋯sₖ` is `sₖ ∘ ⋯ ∘ s₁`; at `xᵢ ↦ gᵢ⁻¹` Mathlib's product is `g₁⁻¹ ⋯ gₖ⁻¹ = (gₖ ⋯ g₁)⁻¹ = 1` | algebra | correct; confirmed by table D |
| Cycle notation | `List.formPerm_apply_lt_getElem`: `formPerm xs xs[n] = xs[n+1]` | matches the README's `xⱼ ↦ xⱼ₊₁` and the file comparison | correct |
| `Nat.card` junk value | infinite presented group gives 0, so `N ≤ Nat.card` needs `0 < Nat.card` | `0 < 0` false, antecedent excludes the junk case | hypothesis necessary |

**Table D: Layer 2, relators and surjections.** I transcribed the ten pinned presentations (`TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/…`) into words with Tau Ceti's own `toWord` semantics (`comm r s = r s r⁻¹ s⁻¹`, inverse by reversal) and evaluated them in Mathlib's product order. My letter counts agree with the modules' published lists (HS `2, 5, 22, 30, 20, 24, 36, 33, 38, 36, 36, 39, 38`; McL `2, 5, 20, 22, 36, 36, 35, 40, 40, 44, 44, 43, 44, 40, 48`; Co3 total 150 over 24 relators; M23 total 238), so the transcription is faithful. “Support” is the number of moved points of the evaluated relator (0 means it holds).

| Headline | Presentation generators | Assignment tested | Relator supports | Generation | Result |
| --- | --- | --- | --- | --- | --- |
| `exists_surjective_M23` | ATLAS standard, 9 relators | `(a, b)`: `0,0,0,0,0,18,20,0,20`; `(a⁻¹, b⁻¹)`: all 0; `(a, b⁻¹)`: all 0 | see left | `{a⁻¹, b⁻¹}` generates `M23` (inverses) | witnessed |
| `exists_surjective_M24` | ATLAS standard, 7 relators | `(a, b)`: `0,0,0,0,0,22,0`, relator 6 sends 0 to 20; `(a⁻¹, b⁻¹)` and `(a, b⁻¹)`: all 0 | see left | `{a, b⁻¹}` generates `M24` | witnessed; README Check 2.1 exact |
| `exists_surjective_J1` | ATLAS standard, 5 relators | all four sign choices: all 0 | 0 | `{a⁻¹, b⁻¹}` generates `J1` | witnessed |
| `exists_surjective_HS` | ATLAS standard, 13 relators | all four sign choices: all 0 | 0 | generates `HS` | witnessed |
| `exists_surjective_McL` | ATLAS standard, 15 relators | `(a, b)`: relators 8–14 fail (supports 270, 268, 261, 261, 273, 240, 261); `(a⁻¹, b⁻¹)` and `(a, b⁻¹)`: all 0 | see left | generates `McL` | witnessed |
| `exists_surjective_M11` | Campbell–Havas–Ramsay–Robertson, 2 relators | exhaustive: 10 class representatives for `x₀` times all 7920 `x₁` | 12 solutions, 1 trivial; e.g. `x₀ = c[0,3,1,4,6,2,7,9,10,8,5]`, `x₁ = c[0,3,10,1,5,9,7,6,8,4,2]` | `⟨x₀, x₁⟩` has order 7920 | witnessed |
| `exists_surjective_M12` | CHRR, 3 relators | exhaustive: 15 class representatives times all 95040 | 21 solutions; e.g. `x₀ = c[2,8,7,4,10] c[3,11,6,5,9]`, `x₁ = c[0,3,2] c[1,5,4,9,8,11] c[7,10]` | order 95040 | witnessed |
| `exists_surjective_M22` | Conder–Havas–Ramsay, 3 relators | `x₁` an element of order 11 and its square (the two classes), `x₀` over all 443520 | 22 solutions; e.g. `x₀ = c[0,12,8,9,18] c[1,2,11,14,10] c[3,6,17,5,13] c[4,7,21,16,15]` | order 443520 | witnessed |
| `exists_surjective_J2` | Stoytchev, 3 relators | `x₀` of order 7, `x₁` over its conjugacy class (86400 elements) | 14 solutions | order 604800 | witnessed |
| `exists_surjective_Co3` | Djoković, 7 involutory generators, 24 relators | trivial assignment: all 24 hold, image trivial | — | generation condition excludes it | not independently witnessed (see below) |
| Trivial assignment, all ten | `τᵢ = 1` | every relator holds in every presentation | image of order 1 | excluded only by generation | Check 2.1 correct |
| M24 power relators only | `a²`, `b³`, `(ab)²³` on `(a, b)` and `(a, b⁻¹)` | supports 0, 0, 0 for both | — | Check 2.1 correct |
| ATLAS presentation page | atlas (`pres/M24G1-P1`) line 18 lists seven relators on standard generators | same seven as `m24Presentation` | — | locator correct |

**Table E: derived statements (2.2).**

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Nontriviality of `SporadicName.<Name>.Group` | trivial source versus a source surjecting onto a group of order `N ≥ 7920` | image size ≤ 1 < N | correct for all ten |
| `0 < Nat.card → N ≤ Nat.card` | identity on the model (`N ≤ N`); projection `ℤ × model → model` (`Nat.card = 0`, antecedent false) | as listed | correct; hypothesis necessary |
| Free group also surjects | `FreeGroup (Fin 2) → M24` sending generators to `a, b⁻¹` | surjective, infinite source | Check 2.2 correct: no finiteness from a surjection |

**Pinned declarations opened.**

| File at the pin | Declaration and what was checked |
| --- | --- |
| `Mathlib/GroupTheory/Index.lean:296`, `:940` | `Subgroup.card_mul_index`; `MulAction.index_stabilizer`; no finiteness hypotheses |
| `Mathlib/GroupTheory/Schreier.lean:97` | `Subgroup.closure_mul_image_eq`: hypotheses `IsComplement H R`, `1 ∈ R`, `closure S = ⊤`, generators `g * (toRightFun g)⁻¹` over `R * S`, as the README states |
| `Mathlib/GroupTheory/GroupAction/FixingSubgroup.lean:113` | `fixingSubgroup` |
| `Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean:120` | `MulAction.IsMultiplyPretransitive` |
| `Mathlib/GroupTheory/PresentedGroup.lean:90, 135, 139, 142` | `closure_range_of`, `toGroup`, `toGroup.of`, `toGroup.unique` |
| `Mathlib/Algebra/Group/Subgroup/Lattice.lean:375` | `Subgroup.closure_induction` |
| `Mathlib/GroupTheory/Perm/Cycle/Concrete.lean:129, 500`; `Perm/List.lean:163` | `Cycle.formPerm`, the `c[…]` notation, the successor convention |
| `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Presentation.lean:66, 131` | `SporadicName.presentation`, `SporadicName.Group` |
| `TauCeti/GroupTheory/Presentation/Relator.lean:75–85, 207–212` | constructors and `toFreeGroup`; no `eval`, no `commInvInv` (R01) |
| `TauCeti/GroupTheory/Presentation/GroupPresentation.lean:89–226` | `relators`, `relatorSet`, `mem_relatorSet_iff`, `Group`; no `homEquiv` (R01) |
| Hex `Kernel.lean` at commit `e32bc477` (hex lines 31–33, 36) | `card_closure` under `check … = true` gives `Nat.card (closure S) = order c`; `permOfImages` exported; the resolver's lead is resolved |
| FiniteSimpleGroups README at commit `7f09e33` (finite-simple-groups lines 27–42, 172) | the fourteen names with the orders of the table; Apache-2.0 |

**Duplication by object.** Mathlib at the pin has no stabilizer-chain order formula and no orbit-of-closure lemma; Tau Ceti's `Algebra/GroupAction/FixingSubgroup.lean` has only `fixingSubgroup_univ`; no Tau Ceti file mentions stabilizer chains or strong generating sets. No roadmap on main or open pull request declares `card_<Name>`, `exists_surjective_<Name>` or the ATLAS file stems (roadmaps grep). The only object overlap found is R03.

**Cross-roadmap citations resolved on main.** CFSGStatement S0 (`README.md:676`) and S1 (`:721`); CFSGBasicProperties *Starting points and ownership* (`:35`, the SporadicOrders bullet at `:69–73`), P0 item 2 finite upper bounds and item 3 recognition to `MulEquiv` (`:273–287`), P1 with the ten names consumed from SporadicOrders O1/O2 and the four models `Co2 Suz Fi22 He` (`:330–346`), P2 with the twelve remaining names (`:349`). The Completed AlgebraicCodingTheory exclusion of the Mathieu identification is unchanged. The dependency check printed exactly

```text
depcheck: 162 roadmaps, 1176 edges, 0 problem(s)
```

with no `UPWARD`, `CYCLE` or `moved:` line; SporadicOrders is at line 398 of the 400-line merge order, after every roadmap it cites. No declared gaps exist and none is needed: every prerequisite is a pinned declaration, a CFSGStatement section on main, or a target here.

**Sources sampled.** The seeded targets: 0.1 (orbit–stabilizer inputs checked at the pin; the textbook locators are paywalled, below); 0.2 (checked by computation); 1.1 (twenty files, every image compared); 1.2 (ten group pages, line 9 of each); 2.1 (the M24 presentation page and the pinned presentations); 2.2 (Mathlib's `PresentedGroup` API). No README locator is flagged as unverified.

## Not verifiable

- **`exists_surjective_Co3`.** Djoković's presentation has seven involutory generators, so the direct evaluation that settles the standard-generator cases does not apply, and a search for seven involutions in a group of order 495766656000 is beyond this review. The statement is true if the pinned transcription defines Co3, as its module's transcription notes report (GAP reproducing the index 170775 and identifying the image with the 276-point AtlasRep group, which uses the same files); that chain was not re-run here.
- **Dixon–Mortimer, Theorem 1.4A, and Seress, §4.1.** Both books are paywalled (Springer and Cambridge); the service records them as citable by locator only. The attributions (orbit–stabilizer; bases and the order formula) are the standard ones.
- **The claim that the ATLAS files ship under these names in GAP's AtlasRep** (`README.md:208–209`) was not checked against an AtlasRep release.
- **The J2.2 remark** (`README.md:303–304`) is arithmetic (`2 · 604800 = 1209600`); that the degree-100 action extends to J₂.2 was not checked here.
- **Ownership against open pull requests.** Checked by the roadmaps tool against the index of 388 open pull requests; CertifiedPermutationComputation (R03) is not among the sibling checkouts this review was given, so only its README text as served by the tool was read.

## Source issues

- none
