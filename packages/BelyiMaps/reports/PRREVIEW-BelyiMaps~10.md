# Review of BelyiMaps (pull request #3170 at 57376f9)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 71 changed lines since `87e7f72`. I checked the new equivalence of ribbon graphs with finite `FreeGroup (Fin 2)`-sets (2.4), the new induction item of 6.2, the new Lean target `isRightAdjoint_res_subtype`, and the earlier findings still open in untouched text. The mathematics of both new items is sound. The one finding is that the Lean target asserts only that restriction has some left adjoint. The pinned Mathlib proves that in nine lines by Kan extension, without the balanced product the README attaches to it (R01). There are seven small corrections, six of them in untouched text, and three format notes, one in untouched text. Nothing new is left for a human to decide.

## R01 (P2) — `isRightAdjoint_res_subtype` says only that restriction has a left adjoint, which Mathlib already gives, not that the balanced product is that adjoint

The README pins the balanced-product adjunction to this declaration ("left adjoint to Mathlib's restriction … (`isRightAdjoint_res_subtype` in `Suggested.lean`)", line 2489; "is stated as `isRightAdjoint_res_subtype`", lines 622–624). The docstring (lines 97–100) also names `G ×_K Z` and the hom-equivalence. The Lean type (lines 103–104) names neither: it is `(Action.res (Type u) K.subtype).IsRightAdjoint`. An implementer can therefore close the acceptance test without constructing `G ×_K Z`, and 6.2's item stays undone. At the pinned Mathlib the statement has a nine-line proof that does not mention `TauCeti.BalancedProduct`:

- take `L := SingleObj.mapHom K G K.subtype`;
- `L.lanAdjunction (Type u)` (`Mathlib/CategoryTheory/Functor/KanExtension/Adjunction.lean:142`) makes precomposition with `L` a right adjoint, because the pointwise Kan extensions into `Type u` exist;
- `Action.res (Type u) K.subtype` is isomorphic to that precomposition conjugated by `Action.functorCategoryEquivalence`, componentwise by `Action.mkIso (Iso.refl _)`;
- `Functor.isRightAdjoint_of_iso` concludes.

This proof elaborates, with axioms `propext`, `Classical.choice` and `Quot.sound` only. `infer_instance`, `simp` and `aesop` each fail on the statement, so it is not padding in the one-tactic sense. It simply is not the item.

The smallest change is to make the three places say what the declaration states. One option: keep it, describe it as the existence of a left adjoint, cite Mathlib's `Functor.lanAdjunction` through `Action.functorCategoryEquivalence` as its route, and name the balanced-product functor with its hom-equivalence in the module docstring as data not statable at the pin, as the file already does for 2.4. The other option: since §The build already calls it "a supplementary target rather than a headline", remove it from `Suggested.lean` and keep the item in the README alone.

## C01 — The README and the Lean docstring disagree on which new statements are headlines

The overview (line 75) counts the adjunction among the remaining headlines that `Suggested.lean` states: "Layer 13.5 and the induction adjunction of 6.2 are the ones that are". §The build (line 623) calls it "a supplementary target rather than a headline", and the module docstring (line 9) keeps "Layer 13.5 is the one that is". The docstring also lists 2.4's equivalence under "Headline theorems not stated here" (line 58), although no headline list of the README includes it. One wording throughout would fix this. For example, in the overview: "Layer 13.5 is the one that is; the file also states the induction adjunction of 6.2, a supplementary target". In the docstring, put 2.4 under a separate bullet for supplementary targets.

## C02 — Untouched text: `Suggested.lean`, `conjugation_transfer` (line 87) restates a pinned Tau Ceti lemma

`conjugation_transfer` is `TauCeti.map_conj_eq_conj_of_map_eq_conj` (`TauCeti/GroupTheory/ConjugationTransfer.lean:39`, stated for any `MonoidHomClass`) specialised to `G ≃* G`. `opposite_third_peripheral` (line 78) closes by `group`. Both are kept as exports that PeripheralActions consumes by name, so that roadmap could cite the Tau Ceti lemma instead.

## C03 — Untouched text: README lines 184 and 570 give a file that does not exist

They place the van Kampen declarations in `TauCeti/AlgebraicTopology/FundamentalGroup/VanKampen.lean`. At the pin `VanKampen` is a directory, and `vanKampenEquiv_toMonoidHom` is at `VanKampen/Basic.lean:558`.

## C04 — Untouched text: in 8.6's genus reconciliation (line 3272) the two sides are not `Σ (e − 1)`

For `torusTriple` (`σ0 = σ1` a 4-cycle, `σinf` two 2-cycles) the sum `Σ (e − 1)` is `3 + 3 + 1 + 1 = 8`, while `2g − 2 = 0`. What the two computations share is the identity `2g − 2 = −2n + Σ (e − 1)`; writing that makes the sentence true.

## C05 — Untouched text: 14.2 (line 5441) puts `trueOrbitSize` on the wrong carrier

The display reads `trueOrbitSize (c : IsoClass n)`. Elsewhere `IsoClass n` is the type of relabeling classes of triples (0.2), which carries no Galois action. The pin's `TauCeti.AlgebraicBelyiPair.IsoClass.trueOrbitSize` is defined on classes of algebraic Belyi pairs.

## C06 — Untouched text: 11.6 (line 4521) applies 11.4 without the continuity that 11.4 requires

11.4 makes local constancy of `f_σ` a separate input, and its `z ↦ z²` example shows that input is not automatic. The missing step is short. Take `σ` fixing a number field over which 10.7 gives a model. The identity of that model is an isomorphism from the conjugate pair, so it is the unique `f_σ`. The family is therefore trivial on an open subgroup.

## C07 — Untouched text: the Source line of 10.7 (lines 4339–4341) quotes Köck

Köck's Theorem (2.2) appears there in quotation marks, and its first clause shares sixteen consecutive words with Köck's statement (arXiv math/0108222v2, Theorem (2.2)). A restatement in the roadmap's own words would fix it, for instance: "the pair has a model over some finite extension of `M(X, t)`, and over `M(X, t)` itself when the covering is Galois".

## N01 — "Tau Ceti main, after the pin" (line 2491) describes an unnamed, moving revision

The README's contract is that Tau Ceti names are those of revision `2fd255d997f4`. The sentence is true today: Tau Ceti's main branch has `Subgroup.RightTranslation` and `TauCeti.BalancedProduct.liftEquivRightTranslation` in `TauCeti/Topology/Covering/BalancedProduct/RightTranslation.lean`, which the pin lacks. But it will go stale when the pin moves. You could drop it and, after the pin moves, name the two declarations on the *Tau Ceti:* line.

## N02 — The two new targets carry no source locator

You could add one each for the monodromy description of bipartite ribbon graphs (2.4) and for induced `G`-sets (6.2).

## N03 — Untouched text: "frozen" records, snapshot and schema (Layers 3.5 and 14, twelve times between lines 1558 and 5616) are never identified

Saying once which state of the database is meant, or dropping the word, would fix this.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.4 edge functor faithful | `Hom.ext` (`RibbonGraph/Basic.lean:312`) | equal edge maps ⇒ equal black/white maps via surjective `blackEnd`, `whiteEnd` | true |
| 2.4 full | `blackEnd_eq_blackEnd_iff` (`Basic.lean:103`) | fibres are `rotB`-cycles; equivariant `f` keeps `SameCycle`, so vertex maps well defined | true |
| 2.4 essentially surjective | `PermutationTriple.ribbonGraph` (`OfPermutationTriple.lean:70`), `n = 0` | defined for all `n`; empty action ↦ `E = B = W = ∅` | true, empty case included |
| 2.4 Check: empty and one-edge graphs | `rotB = rotW = id` on one edge | empty action; one-point action | true |
| 2.4 Check: surjectivity needed | `E = ∅, B = {b}, W = ∅` without surjectivity | `Hom(Γ′, ∅)` empty; `Hom(∅, ∅)` in `Action` is `{id}` | not full, as stated |
| 2.4 `isoClassEquiv` as induced bijection | `Classification.lean:138`; `F₂` on `Fin n` | type `Quotient (isoSetoid n) ≃ IsoClass n`; `(rotB, rotW) ↦ (σ0, σ1)` | consistent |
| 2.4 connected ↔ nonempty transitive | `IsConnected` (`Basic.lean:164`) | `Nonempty E ∧ IsPretransitive (closure {rotB, rotW})`; `FreeGroup.lift` image is that closure | true |
| Docstring: no `Category` at pin | instance search; `Hom.id`, `Hom.comp` | synthesis fails; `id`, `comp`, `comp_assoc` at `Basic.lean:269, 279, 337` | true |
| 6.2 inverse hom-map well defined | `(g h⁻¹, h z)` against `(g, z)` | `g h⁻¹ · ι(h z) = g ι(z)` | true |
| 6.2 forward map `K`-equivariant | `(1, h z) ~ (h, z)` | `f⟦1, hz⟧ = h • f⟦1, z⟧` | true |
| 6.2 Check `Z` a point | `G ×_K pt` | classes `gK`, Mathlib's left cosets `G ⧸ K` | true |
| 6.2 Check `Z = K` | `⟦g, k⟧ ↦ g k` | `g h⁻¹ · h k = g k`; inverse `g ↦ ⟦g, 1⟧` | true |
| 6.2 Check `K = G` | `⟦g, z⟧ = ⟦1, g z⟧` | unit bijective, inverse `⟦g, z⟧ ↦ g z` | true |
| 6.2 convention against pin | `mk_smul_left` (`BalancedProduct/Basic.lean:99`) | `⟦g h, z⟧ = ⟦g, h z⟧` for `h • g = g h⁻¹` | consistent |
| `isRightAdjoint_res_subtype` (R01) | `infer_instance`, `simp`, `aesop`; Kan route | all three fail; nine-line proof via `lanAdjunction` closes, no `sorry` | weaker than README claim |
| `isRightAdjoint_res_subtype` generality | `K = ⊥`, `K = ⊤`, trivial `G` | README "subgroup of a group", universe `u` = Lean binders | equal |
| Overview vs build paragraph (C01) | lines 75, 623; docstring 9, 58 | "headline" vs "supplementary" | inconsistent |
| Post-pin claim (N01) | Tau Ceti main `6b0d2cd`, pin `2fd255d` | `liftEquivRightTranslation` present on main, absent at pin | true, time-relative |
| Headline 13.5 | `infer_instance`, `simp`; `#check` | both fail; `FaithfulSMul Gal(ℚ̄/ℚ) (IsoClass ℚ̄)` | unchanged, not padding |
| Seeded: New object `BipartiteRibbonGraph` | `Hom` fields, `IsConnected` at pin | incidence and rotation laws match 2.1 | true |
| Seeded: The action, pinned | `Action.lean:79, 172`; `ActionCover/Basic.lean:201` | monodromy of `ũ₀` is `g⁻¹ • ũ₀`; fibre map gives `g • a` | true |
| Seeded: Monodromy group and connectedness | `n = 0` | `n ≠ 0` clause matches `Nonempty E` of 2.4 | consistent |
| Seeded: Universal covers | `deckFundamentalGroupEquiv` (`UniversalCover.lean:105`) | target `(π₁)ᵐᵒᵖ` | true |
| C04 torus | `torusTriple` (`Examples.lean:308`) | `Σ(e−1) = 8`, `n = 4`, `2g − 2 = 0` | sentence false |
| C07 quotation | Köck (2.2) | 16 consecutive shared words | copied clause |

- Previous findings (of the review of #1791 at a370b60): R01 (the adapter of 7.7) and R02 (the edit of ConformalMapping) were that pull request's changes and are absent here: no SurfaceTopology or PlanarTopology text, and no file changed outside the named folders. C01 is unchanged at lines 78 and 87, now C02. C02 is unchanged at lines 184 and 570, now C03. C03 is unchanged at line 3272, now C04. C04 is unchanged at line 5441, now C05. C05 is unchanged at line 4521, now C06. C06 is unchanged at lines 4339–4341, now C07. N01 is unchanged, now N03. N02 is not carried: 11.3 is not among the README's headlines.
- Library declarations opened: 24 at the Tau Ceti pin `2fd255d9` and 4 at the Mathlib pin `1b1ccf4b` (`Functor.lanAdjunction`, `Functor.isRightAdjoint_of_iso` at `Adjunction/Basic.lean:755`, `Action.res`, `Action.functorCategoryEquivalence`), files and lines above; one at Tau Ceti main.
- Seeded targets in the changed or affected text: four checked (rows above). The other eleven lie outside the change and were not rechecked.
- Source locators checked: Köck (2.2) against arXiv math/0108222v2. The changed text cites no locator.
- Elaboration: `Suggested.lean` elaborates with two `sorry` warnings (lines 103, 113) and nothing else. `#check` of the four declarations matches the README's generality, and no section binder is lost.
- Dependency check: `depcheck: 122 roadmaps, 1389 edges, 0 problem(s)`.
- Automatic checks: the full gate passes every check except the out-of-folder check (set aside below). No layer, item or id of the README at `87e7f72` is removed or retitled. Overlap data: #1791 also changes this roadmap and merges cleanly with this head, as the description's merge-order block states.
- Duplication: no other roadmap owns a category of ribbon graphs or induction of `G`-sets. InductionRestriction owns linear induction (`Rep.indFunctor`) only. Mathlib has no `IsRightAdjoint` instance for `Action.res` (R01 gives the route).

Overlap check: read SurfaceTopology (open, oriented maps and conversions only), GeometricTopology and AlgebraicTopology §5.8 (this pull request), NonabelianLevelStructures (open, consumes 10.4), GroupActionsOnRiemannSurfaces and NoncongruenceModularForms (main, consume Layers 0–6), ProfiniteArithmetic and InductionRestriction (main). The new objects, the category of ribbon graphs with its equivalence to finite `FreeGroup (Fin 2)`-sets and induction of `G`-sets along a subgroup, are owned here alone.

Source independence: changed passages only. Five passages compared (the 2.4 equivalence paragraph, its Checks, the 6.2 induction item and the two new docstrings of `Suggested.lean`); they cite no source, and their wording is a proof outline in the roadmap's own terms. No layer is added, removed or reordered, so the arrangement was not compared. The largest share of the README's source mentions is Girondo–González-Diez, 20 of 87; its text is not readable. One copied clause is in untouched text (C07).

Research link: the headline targets are Belyi's theorem (Köck 2004, Theorems (2.2), (3.3)), the branch-cycle theorem (Fried 1977; Szamuely 2009, §4.7) and faithfulness of the Galois action on dessins (Lenstra's argument, Girondo–González-Diez 2012, Theorem 4.49). This rests on the README's references and on Köck's text as read.

## Not verifiable

- Girondo–González-Diez 2012 and Lando–Zvonkin 2004: no legal copy; not needed for the changed text, which cites neither.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder, rerun here, lists the 29 files of the fifteen other roadmap folders that this pull request revises and that are its own.

## Source issues

- none

## For the human reviewers

- **Not tested.** Girondo–González-Diez has the largest share of the README's source mentions (20 of 87), and its text and table of contents could not be read; the changed passages cite no source.
- The earlier scope questions (executable procedures in Layer 3.1 and database record structures in Layer 14; PolynomialGaloisGroups as owner of the gap for transitive groups of degree 6 to 11) concern untouched text and are unchanged.
