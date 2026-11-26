# Review of BelyiMaps (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 95 changed lines since `87e7f72`. I checked the equivalence of ribbon graphs with finite `FreeGroup (Fin 2)`-sets added to 2.4, the induction item added to 6.2, and the new Lean target `bijOn_balancedProduct_lift`, which replaces the earlier `isRightAdjoint_res_subtype`. The earlier finding is repaired: the new statement names the pinned balanced product, is true (I proved it at the pins, about thirty-five lines) and does not close in one tactic. No finding remains. There are seven small corrections, six of them in untouched text, and two format notes, one in untouched text; none blocks. One source question is left for a human (Lando–Zvonkin could not be read).

## C01 — The pull request's description names a declaration this head no longer has

The BelyiMaps bullet of the description ends "`Suggested.lean`: `isRightAdjoint_res_subtype`" and says "inducing `π₁`-sets is left adjoint to restriction". At this head `TauCetiRoadmap/BelyiMaps/Suggested.lean` declares `bijOn_balancedProduct_lift` (line 113), the universal property of the pinned balanced product, and lists the induction functor and its adjunction as data not stated. Text that would be right: "…and the balanced product `G ×_K Z` is the left adjoint of restriction of `π₁`-sets. `Suggested.lean`: `bijOn_balancedProduct_lift` (the universal property; the functor and adjunction are listed as data)."

## C02 — Untouched text: `Suggested.lean`, `conjugation_transfer` (line 93) restates a pinned Tau Ceti lemma

It is `TauCeti.map_conj_eq_conj_of_map_eq_conj` (`TauCeti/GroupTheory/ConjugationTransfer.lean:39`) specialised to `G ≃* G`, and `opposite_third_peripheral` (line 84) closes by `group`. Both are kept as names PeripheralActions consumes; that roadmap could cite the Tau Ceti lemma instead.

## C03 — Untouched text: README lines 184 and 570 give a file that does not exist

They place the van Kampen declarations in `TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen.lean`. At the pin `VanKampen` is a directory; the declarations are in `VanKampen/Basic.lean`.

## C04 — Untouched text: in 8.6's genus reconciliation (line 3279) the two sides are not `Σ (e − 1)`

For the torus triple (`σ0 = σ1` a 4-cycle, `σinf` two 2-cycles, `n = 4`) the sum `Σ (e − 1)` is `3 + 3 + 1 + 1 = 8` while `2g − 2 = 0`. What the two computations share is `2g − 2 = −2n + Σ (e − 1)`; writing that makes the sentence true.

## C05 — Untouched text: 14.2 (line 5448) puts `trueOrbitSize` on the wrong carrier

The display reads `trueOrbitSize (c : IsoClass n)`. Elsewhere `IsoClass n` is the type of relabeling classes of triples (0.2), which carries no Galois action; 11.7 (line 4550) defines the orbit size on classes of algebraic Belyi pairs.

## C06 — Untouched text: 11.6 (line 4528) applies 11.4 without the continuity 11.4 requires

11.4 makes local constancy of `f_σ` a separate input. The missing step is short: for `σ` fixing a number field over which 10.7 gives a model, the identity of that model is the unique `f_σ`, so the family is trivial on an open subgroup.

## C07 — Untouched text: the Source line of 10.7 (lines 4346–4348) quotes Köck

Köck's Theorem (2.2) appears there in quotation marks. A restatement in the roadmap's own words would do, for instance: "the pair has a model over some finite extension of `M(X, t)`, and over `M(X, t)` itself when the covering is Galois".

## N01 — Three added lines run past the 100-column limit

`Suggested.lean` line 11 (128 characters, in the module docstring) and two added README lines (in the "What remains" list, line 90, and in the induction item of 6.2, line 2499). Rewrapping fixes it.

## N02 — Untouched text: "frozen" records, snapshot and schema (Layers 3.5 and 14, twelve times between lines 1560 and 5623) are never identified

Saying once which state of the database is meant, or dropping the word, would fix this.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `bijOn_balancedProduct_lift`, maps-to | `g = 1`, `a = h ∈ K` | `⟦1, hz⟧ = ⟦h·h⁻¹, hz⟧ = ⟦h⁻¹, z⟧`; `f⟦1·h⁻¹, z⟧ = h • f⟦1, z⟧` | `K`-equivariant, true |
| same, injective | `g := 1`, `a := g⁻¹` | `f⟦g, z⟧ = g⁻¹ • f⟦1, z⟧`, determined by restriction | true |
| same, surjective | `f⟦g, z⟧ := g⁻¹ • ι z` | `(hg)⁻¹ • ι(hz) = g⁻¹h⁻¹h • ι z`; `(g a⁻¹)⁻¹ • ι z = a g⁻¹ • ι z`; `1⁻¹ • ι z = ι z` | well defined, equivariant, restricts to `ι` |
| same, full proof at the pins | proof by `Quotient.lift` on a copy of the file, about 35 lines | elaborates, no error, no `sorry` | statement true |
| same, degenerate | `Z = ∅`; `K = ⊥`; `K = ⊤`; `G` non-abelian | both sets singletons for `Z = ∅`; computation above uses no commutativity | true |
| same, one-tactic probe | `simp`, `aesop` | both leave the goal unsolved | not padding |
| same, generality | `#check` | `{G : Type u} [Group G] (K : Subgroup G) (Z Y : Type u)` with `MulAction K Z`, `MulAction G Y` | equals README "subgroup `K` of a group `G`, `K`-set `Z`" |
| Pinned carrier as the docstring says | `BalancedProduct/Basic.lean:83, 89`; `K` on `G` | orbit quotient of `G × Z` by `h • (g, z) = (hg, h • z)` | as stated |
| 6.2 comparison `⟦g, z⟧ ↦ ⟦g⁻¹, z⟧` | `(gh, h⁻¹z)` | goes to `(h⁻¹g⁻¹, h⁻¹z) = h⁻¹ • (g⁻¹, z)`; `a • ⟦g, z⟧ = ⟦ag, z⟧ ↦ ⟦g⁻¹a⁻¹, z⟧` | bijection, action matches Lean's `g * a⁻¹` |
| 6.2 hom-equivalence inverse | `(gh, h⁻¹z)` against `(g, z)` | `gh • ι(h⁻¹z) = g • ι z`; transported it is Lean's `g⁻¹ • ι z` | README and docstring agree |
| 6.2 Checks | `Z` a point; `Z = K`; `K = G` | classes `gK`; `⟦g, k⟧ ↦ gk` with inverse `g ↦ ⟦g, 1⟧`; `⟦g, z⟧ = ⟦1, gz⟧` | all three true |
| 6.2 Mathlib names | `Adjunction/Basic.lean:598, 613`; `KanExtension/Adjunction.lean:142`; `Action/Basic.lean:339` | `leftAdjointOfEquiv`, `adjunctionOfEquivLeft`, `lanAdjunction`, `Action.res` exist | as cited |
| 2.4 faithful, full, essentially surjective | `Hom.ext` (`RibbonGraph/Basic.lean:313`); `blackEnd_eq_blackEnd_iff` (`:103`), `whiteEnd_eq_whiteEnd_iff` (`:110`); `n = 0` | edge map determines vertex maps (surjective ends); fibres of ends are rotation cycles; empty action ↦ empty graph | true |
| 2.4 Check: surjectivity needed | `E = ∅, B = {b}, W = ∅` | no map `{b} → ∅`, yet `Hom(∅, ∅) = {id}` in `Action` | not full, as stated |
| 2.4 Check: small graphs | empty; one edge | empty action; one-point action (`rotB = rotW = id`) | true |
| 2.4 source line | `RibbonGraph/Classification.lean:40–41` | cites Lando–Zvonkin §1.3 and §1.5 | file citation as stated; book unread |
| Headline 13.5 `faithfulSMul_absoluteGaloisGroup_isoClass` | elaboration | `FaithfulSMul Gal(ℚ̄/ℚ) (IsoClass ℚ̄)`, unchanged by the diff | unchanged |
| Overview, build paragraph, docstring | README lines 76–79, 622–624; docstring lines 10–11, 63–71 | all say 13.5 is the one headline stated and 6.2 is supplementary | consistent |
| C04 torus | `n = 4` | `Σ(e − 1) = 8`, `2g − 2 = 0` | sentence false (untouched) |

- Previous findings (review at 57376f9): R01 repaired ("Restricting to `z ↦ ⟦1, z⟧` is a bijection … onto the `K`-maps", now a statement about `TauCeti.BalancedProduct`); C01 repaired ("The file also states the universal property of induction in 6.2, a supplementary target rather than a headline"; the docstring has "Supplementary targets not stated here"); N01 repaired (no sentence about Tau Ceti after the pin remains); N02 addressed (2.4 cites Lando–Zvonkin §1.3 and §1.5; 6.2 says no locator is cited). C02–C07 and N03 lie in untouched text and are carried as C02–C07 and N02.
- Library declarations opened: 8 at the Tau Ceti pin (`BalancedProduct`, `BalancedProduct.mk`, `mk_smul_left`, `Hom.ext`, the two end lemmas, `map_conj_eq_conj_of_map_eq_conj`, the `Classification.lean` reference) and 4 at the Mathlib pin, files and lines above.
- Seeded sample: none of the fifteen targets lies in a changed or affected passage; "Universal covers" (line 159) was read as context for 6.2 and is consistent with the pinned `BalancedProduct`.
- Source locators: the change adds one (Lando–Zvonkin §1.3, §1.5), not readable; see below.
- Elaboration: `Suggested.lean` elaborates with two `sorry` warnings (lines 113, 128) and nothing else; `#check` of the declarations matches the README and no binder is lost.
- Dependency check: `depcheck: 115 roadmaps, 1312 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. No layer, item or id of the README at `87e7f72` is removed or retitled. The other open pull request that changes this folder (#1791) merges cleanly with this head, as the description's merge-order block records.
- Duplication: no roadmap on main or open owns a category of bipartite ribbon graphs or induction of `G`-sets along a subgroup; the pin has no lift or universal property for `BalancedProduct`.

Overlap check: read ProfiniteArithmetic, NoncongruenceModularForms, GroupActionsOnRiemannSurfaces (main), NonabelianLevelStructures, SurfaceTopology, GeometricTopology, SurfaceGroupCharacterVarieties (open); nothing shared. SurfaceTopology names `BipartiteRibbonGraph` as owned by BelyiMaps; the others consume BelyiMaps layers by number.

Source independence: changed passages only. Five passages compared (the 2.4 equivalence paragraph, its Checks, the 6.2 induction item, the docstring of `bijOn_balancedProduct_lift`, the docstring's supplementary-targets list) with one source cited there, Lando–Zvonkin, whose text could not be read; the passages are proof outlines in terms of pinned declarations. No layer is added, removed or reordered, so the arrangement was not compared. Largest share of the README's source mentions: Girondo–González-Diez, not readable.

Research link: the headline targets are Belyi's theorem (Köck 2004, Theorems (2.2), (3.3)), the branch-cycle theorem (Fried 1977; Szamuely 2009, §4.7) and faithfulness of the Galois action on dessins (Lenstra's argument, Girondo–González-Diez 2012, Theorem 4.49); this rests on the README's references.

## Not verifiable

- Lando–Zvonkin 2004, §1.3 and §1.5 (the new source line of 2.4): no legal copy; I confirmed only that the pinned `TauCeti/Combinatorics/RibbonGraph/Classification.lean` (lines 40–41) cites the same sections.
- Girondo–González-Diez 2012: no legal copy; the changed text does not cite it.

## Source issues

- none

## For the human reviewers

- **Not tested.** The one locator the change adds, Lando–Zvonkin §1.3 and §1.5 (README 2.4, line 1132), could not be read; nor could Girondo–González-Diez, the most cited source of the README.
- The earlier scope questions (executable procedures in Layer 3.1, database record structures in Layer 14, the owner of the gap for transitive groups of degree 6 to 11) concern untouched text and are unchanged.
