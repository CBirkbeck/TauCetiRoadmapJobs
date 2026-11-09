# Review of TotallyDistributiveTopoi (pull request #1927 at 3bfb8db)

**Verdict:** needs changes

This is an incremental re-review of the 51 lines changed in the folder since edfc4c3. The changes are in README 4.2 (lines 593–628) and the Mathlib contract (lines 108–112). `Suggested.lean` is unchanged. R01 of the previous review is repaired. The repair leaves two P3 defects in the new text.

## R01 (P3) — one *Needs:* line covers two targets with different needs

**Location.** `TauCetiRoadmap/TotallyDistributiveTopoi/README.md`, lines 605–606: "*Needs:* 3.6; Mathlib `EnoughProjectives`, `TopologicalSpace.IsTopologicalBasis`, `Set.PairwiseDisjoint`."

**Claim.** Section 4.2 now holds two targets:
- the general statement, at lines 594–600;
- `enoughProjectives_sh_cantor`, its clopen instance, at lines 600–603.

The single *Needs:* line covers both, and it is wrong for the general statement in three ways:
- **It names a prerequisite the general statement does not use.** The route of the general statement (lines 597–600) uses only the basis, gluing over a disjoint cover, and coproducts. It never uses 3.6. The line still places it behind 3.6, and through 3.6 behind 2.1 and 3.2.
- **It omits that open sets are sheaves.** The route says "the open set `U` is projective", so it treats `U` as an object of `Sh X`. That requires `Opens.grothendieckTopology X` to be subcanonical. Targets 3.3 (line 478) and 3.5 (line 522) cite "GrothendieckTopoi 7.1 (open sets are sheaves)" for exactly this fact. Neither 4.2 nor the Layer 4 Dependencies (line 639) cite it.
- **It omits the lifting step.** The step "lift `t` on an open cover of `U`" is the fact that an epimorphism of sheaves of types is locally surjective. That is a Mathlib lemma, and neither this line nor the contract names it.

**Witness.** At the pin, `(Opens.grothendieckTopology X).Subcanonical` fails to synthesize (`infer_instance`). The only topological instance is `TopCat.subcanonical_grothendieckTopology` (`Mathlib/Topology/Category/TopCat/GrothendieckTopology.lean:89`), on the big site. The lifting lemma is `Sheaf.isLocallySurjective_iff_epi` (`Mathlib/CategoryTheory/Sites/LocallySurjective.lean:377`).

**Repair.**
1. Split the line in two:
   - after the general statement and its route: "*Needs:* GrothendieckTopoi 7.1 (open sets are sheaves); Mathlib `TopologicalSpace.IsTopologicalBasis`, `Set.PairwiseDisjoint`, `Sheaf.isLocallySurjective_iff_epi`, `Projective`, `EnoughProjectives`."
   - after the Cantor instance: "*Needs:* the general statement of 4.2, 3.6."
2. Add `Sheaf.isLocallySurjective_iff_epi` (`Sites/LocallySurjective`) to the Sites line of the Mathlib contract.
3. Add GrothendieckTopoi 7.1 to the Layer 4 Dependencies (line 639).

**Test of the repair.** After the split, every step of the route at lines 597–600 has a named input:
- `U` is projective: by 7.1 and `Sheaf.isLocallySurjective_iff_epi`.
- A coproduct of projective objects is projective: by Mathlib's instance `Projective (∐ g)` (`Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean:127`).
- The coproduct covers the sheaf: by `IsTopologicalBasis.open_eq_sUnion` (`Mathlib/Topology/Bases.lean:196`).
- Only the Cantor instance uses 3.6.

## R02 (P3) — the ℝ non-example covers an interval, not a member of the basis

**Location.** `TauCetiRoadmap/TotallyDistributiveTopoi/README.md`, lines 624–626: "In `ℝ`, a basic set containing `x` contains an interval `(a, b)`, covered by `(a, (a + 2b)/3)` and `((2a + b)/3, b)`; a disjoint open refinement partitions the connected `(a, b)`".

**Claim.** The hypothesis of 4.2 is about covers of a member `U ∈ 𝔅`. The two intervals cover `(a, b)`, which is a member of `𝔅` only when `U = (a, b)`. So, as written, the Check does not produce a cover of a basic set that lacks a disjoint refinement. The wording follows the suggestion of the previous review, which had the same gap.

**Witness.** Take `𝔅` = all open sets, `U = ℝ` and `(a, b) = (−1, 2)`. The Check's cover is `(−1, 1)`, `(0, 2)`, whose union is `(−1, 2) ≠ ℝ`. It does not cover `U`, so the hypothesis says nothing about it.

**Repair.** Replace the sentence with: "In `ℝ`, a basic set `U` contains an interval `(a, b)`; `U` is covered by `(a, (a + 2b)/3)`, `((2a + b)/3, b)` and `U ∖ {(a + b)/2}`, and a disjoint open refinement with union `U` partitions the connected `(a, b)`, so one member contains `(a, b)` and lies in none of the three."

**Test of the repair.**
- On the witness: the cover `(−1, 1)`, `(0, 2)`, `ℝ ∖ {1/2}` has union `ℝ`. A disjoint open refinement with union `ℝ` has a single nonempty member, `ℝ` itself, because `ℝ` is connected. That member lies in none of the three sets: it is not inside `(−1, 1)` or `(0, 2)`, and it contains `1/2`.
- For a general `U`, the member that contains `(a, b)` lies in none of the three either:
  - not in the first interval, since it contains points near `b`;
  - not in the second, since it contains points near `a`;
  - not in the third, since it contains `(a + b)/2`.

## Previous findings

- R01 — repaired: lines 594–603, "Prove that `Sh X` has enough projectives when `X : Type u` has a basis `𝔅` … Then prove `enoughProjectives_sh_cantor` … as the instance where `𝔅` is the set of clopen sets". The instances are now Checks (615–628), and the contract gained its entries (108–112). The repair introduced R01 and R02 above.

## Verified sound

**What changed.**
- `git diff edfc4c3 3bfb8db` touches only `README.md`: 31 insertions and 20 deletions.
- `Suggested.lean` and `metadata.toml` are byte-identical to edfc4c3.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TotallyDistributiveTopoi'` is empty.
- For the previous R01, each part of the repair checks out:
  - the coined term is gone (0 hits for "disjointly");
  - the "Not a target" paragraph is gone;
  - the hypothesis is stated inline (lines 594–596);
  - the general target has no backticked name, so `Suggested.lean` stays consistent with the README (`readme-ids-missing=0`).
- The deleted paragraph also listed second-countable and compact zero-dimensional spaces. Both are Lindelöf, so the Lindelöf Check (615–620) covers them and nothing was lost.

**Gate.** I ran it on this head with `--base origin/main`. Every check reports 0, the result is OK and the exit code is 0. The checks are set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material. The worker's gate at this head also reports `build=0`.

**Dependency check.**
- Output: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- This roadmap is at line 401 of the merge order.
- Its only supplier is GrothendieckTopoi, an open new-roadmap pull request named in the description's depends-on list.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/TotallyDistributiveTopoi/Suggested.lean` exits 0 with exactly 20 `sorry` warnings and nothing else. The warnings are at lines 52, 71, 86, 93, 132, 140, 147, 155, 164, 183, 189, 195, 206, 211, 215, 220, 224, 229, 240 and 249.
- In a scratch copy I added `#check @name` for all 30 declarations, plus the general 4.2 signature proposed by the previous review. All 31 elaborate, with 21 `sorry` warnings and no error, and the types are unchanged from the previous review.
- The four dropped-binder leads of `signatures.md` remain false: each of `ProductsPreserveEpis`, `ProductsDistribOverCoproducts`, `IsTotallyDistributive` and `IsPresheafTopos` carries `[Category E]`.
- **Padding probe.** It is carried over, since the file is unchanged: none of the 20 theorems closes with one tactic.

**Headline theorems.**
- Every end theorem in the Summary is declared in `Suggested.lean`: 1.2, 1.3, 1.4 (×2), 2.2, 2.3, 2.4 (×2), 2.5, 3.1, 3.2, 3.3, 3.5 (×3), 3.6 (×3), 4.1 and 4.2. Target 3.4 is named in the module docstring as not statable, because it lacks `Frame.grothendieckTopology`.
- The new general 4.2 target is not in the Summary's list of end theorems. The previous review allowed it to have no Lean name, and the Cantor clause of the Summary is still what `enoughProjectives_sh_cantor` states.

**Library declarations opened at the pin.**
- `TopologicalSpace.IsTopologicalBasis` (`Mathlib/Topology/Bases.lean:73`, namespace `TopologicalSpace` from line 64) and `IsTopologicalBasis.open_eq_sUnion` (:196).
- `Set.PairwiseDisjoint` (`Mathlib/Data/Set/Pairwise/Basic.lean:259`).
- `ZeroDimensionalSpace` (`Mathlib/Topology/InductiveDimension/Classes.lean:105`). It is small inductive dimension below 1, and its docstring says it admits the empty space. Its equivalence with a clopen basis is `zeroDimensionalSpace_iff_isTopologicalBasis_isClopen` (:114) and `isTopologicalBasis_isClopen` (:130). This is the clopen basis the Lindelöf Check uses.
- `LindelofSpace` (`Mathlib/Topology/Compactness/Lindelof.lean:485`) and `IsClosed.isLindelof` (:514).
- `IsClopen.diff` (`Mathlib/Topology/Clopen.lean:60`).
- `AlexandrovDiscrete` (`Mathlib/Topology/AlexandrovDiscrete.lean:36`).
- `Sheaf.isLocallySurjective_iff_epi` (`Mathlib/CategoryTheory/Sites/LocallySurjective.lean:377`, with `[HasSheafify J (Type w)]`, which holds for `Opens X` with `X : Type u`).
- `Projective (∐ g)` (`Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean:127`) and `Type.enoughProjectives` (:120).
- I found no subcanonical instance for `Opens.grothendieckTopology` (see R01).

**Supplier citations.**
- GrothendieckTopoi is still at 59848bc. I resolved its Lean names again in its `Suggested.lean`: `IsGrothendieckTopos` (103), `isGrothendieckTopos_iff_giraudAxioms` (165), `GeometricMorphism.IsEssential` (429), `GeometricMorphism.isEssential_iff_preservesProducts` (435), `exists_equiv_presheaf_iff_essential_points` (467), `epi_piMap_presheaf` (479), `isIso_sigma_pi_presheaf` (485) and `Frame.grothendieckTopology` (497).
- I also resolved its sections in its README: 1.1 (263), 1.2 (285), 1.4 (333), 2.3 (435), 5.2 (782), 5.6 (866), 6.5 (1014) and 7.1 (1063). Section 7.1 states that `Frame.grothendieckTopology` is subcanonical and equal to `Opens.grothendieckTopology X` (1065–1069). That is the citation R01 asks 4.2 to add.
- Both leads in `citations.md` resolve. README 55 is GrothendieckTopoi Lean 435. `Sheaf.instHasColimitsOfShape` is the anonymous instance at `Mathlib/CategoryTheory/Sites/Limits.lean:214`, which `Suggested.lean` uses at line 34.

**Ownership.**
- `roadmaps grep` for disjoint refinements finds only this README (596, 628) and GrothendieckTopoi 1459–1465. The latter is the abelian analogue with `j_!ℤ`, which that roadmap keeps as a non-target, with different coefficients.
- "enough projectives" for sheaves on spaces finds only this roadmap.
- `overlaps.md` reports that no open pull request changes this roadmap, that no id cited here is dropped, and that no id dropped here is cited elsewhere.

**Seeded sample.**
- Of the sampled targets, only 4.2 contains the change. Its general statement has no literature locator ("own argument"), so it is checked by the route and the instances in the table below.
- The References are unchanged, so the source checks of earlier rounds stand: Raney 1952 (Theorem 1, Definition 5, Theorem 2, §4, §5) and Lucyshyn-Wright arXiv:1108.4032v3 (§1.1, §1.5, Theorems 1.5.3 and 1.5.5, Remark 1.5.6, Propositions 2.2, 5.1 and 5.3).
- The README flags no locator as unverified.

**Adversarial table.** New rows carry values computed in this review. Carried rows cover statements the diff leaves untouched; they cite the review of edfc4c3 (r5), which carried them from 164f2f4.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| **4.2 general target (594–600)**, degenerate spaces | `X = PEmpty`; `X = PUnit`; `U = ∅ ∈ 𝔅` | `PEmpty`: `⋃₀ ∅ = ∅ = univ`, so `𝔅 = ∅` is a basis and the hypothesis is vacuous. `Sh PEmpty` has one object, which is projective. `PUnit`: `𝔅 = {univ}`, every open cover of `univ` contains `univ`, `Sh PUnit ≌ Type u`, and `Type.enoughProjectives` holds. `U = ∅`: `𝒲 = ∅` with `⋃₀ 𝒲 = ∅ = U`, and `y∅` is the initial sheaf (`pt` on `∅`, empty elsewhere), so `Hom(y∅, G) = pt` | true | none |
| 4.2 general target, the step "`U ∈ 𝔅` is projective" | Cantor `U = ℕ → Bool`, cover `{[0], [1] ∪ [00]}` | The refinement is `{[0], [1]}`: disjoint, with union `X`, and `[1] ⊆ [1] ∪ [00]`. Lifts on `[0]` and `[1]` are compatible, since `F(∅) = pt`. They glue to `s ∈ F(X)`, whose image equals `t` on both pieces, so it equals `t` by separatedness | true | none |
| 4.2 general target, the step "the coproduct covers" | `V` open, `t ∈ F(V)` | `V = ⋃₀ {U ∈ 𝔅 \| U ⊆ V}` (`open_eq_sUnion`). `t\|U` is the image of `𝟙_U` in the summand `(U, t\|U)`, so the map is locally surjective, hence an epimorphism. The index type `Σ U : 𝔅, F(U)` lies in `Type u` | true | none |
| 4.2 general target, its *Needs:* line | the route's inputs | `y U` is a sheaf only by subcanonicity: `infer_instance` fails at the pin, and 3.3 and 3.5 cite GrothendieckTopoi 7.1. The lift uses `Sheaf.isLocallySurjective_iff_epi`. 3.6 is used by no step of the general route | line incomplete | R01 |
| 4.2 Cantor instance (600–603) | `𝔅` = clopen sets of `ℕ → Bool` | Cylinders are clopen, so this is a basis. A clopen `B` is compact, so an open cover has a Lebesgue level `n`, and the length-`n` cylinders inside `B` are a finite disjoint clopen refinement with union `B`. This agrees with the Lindelöf Check, since compact implies Lindelöf | true | none |
| Check: Lindelöf zero-dimensional (615–620) | Sorgenfrey `[0, 2)`; `ℚ`; empty space | Sorgenfrey: `B₁ = [0, 1)`, `B₂ = [1/2, 2)`, `B₂ ∖ B₁ = [1, 2)`, all clopen, with union `[0, 2)`. `ℚ`: the cover `ℚ∩(−2, 1)`, `ℚ∩(0, 2)` of `B = ℚ∩(−√2, √2)` is refined by `C₁ = ℚ∩(−√2, 1/√2)` and `C₂ = ℚ∩(1/√3, √2)`, and `C₂ ∖ C₁ = ℚ∩(1/√2, √2)` is clopen because its endpoints are irrational. Empty space: zero-dimensional at the pin (docstring), and `Sh PEmpty` has enough projectives | true | none |
| Check: the three examples are not presheaf topoi | `ℚ`, Baire, Sorgenfrey | Each has singleton components and no isolated point, so none is locally connected. By 3.2, (B) fails, and by 4.1 none is a presheaf topos, while each has enough projectives | true | none |
| Check: Alexandrov (621–623) | Sierpiński; `ℕ` with upper sets; a discrete space | Sierpiński: `U_o = {o}`, `U_c = X`, and the only open set containing `c` is `X`. Upper sets on `ℕ`: `U_n = [n, ∞)`, and a cover member containing `n` contains `U_n`. Discrete: `U_x = {x}` | true | none |
| Check: `ℝ` has no such basis (624–626) | `𝔅` = opens, `U = ℝ`, `(a, b) = (−1, 2)` | The stated cover `(−1, 1)`, `(0, 2)` has union `(−1, 2) ≠ ℝ`, so it is not a cover of `U`. With `ℝ ∖ {1/2}` added, the union is `ℝ`, the only disjoint open refinement has the single member `ℝ`, and `ℝ` lies in none of the three | claim true, argument gap | R02 |
| Check: `LowerIco` has no such basis (626–628) | `a = 1/2`; `a = 1` | The `[0, b)` with `b < a` have union `[0, a)`. Nonempty open sets pairwise meet, so a disjoint refinement has one nonempty member, `[0, a)`, which lies in no `[0, b)` with `b < a`. Every basis has a nonempty member, since the space is nonempty. This agrees with 3.5 (only `0` is projective) | true | none |
| Mathlib contract additions (108–112) | each name at the pin | All 7 names resolve (see the library list above). `TopologicalSpace.IsTopologicalBasis` is in namespace `TopologicalSpace` | true | none |
| 4.1 `isPresheafTopos_sheaf_iff` (carried, r5) | `Type u`; `Sh LowerIco`; Cantor; `Sh ℝ` | `Type u` satisfies both conditions. In `Sh LowerIco` only `0` is projective. Cantor has enough projectives and not (B). `Sh ℝ` has (B) and not enough projectives | true | none |
| 4.2 Cantor Checks, unchanged (608–613) (carried, r5) | Terminal sheaf; complement of a point | A finite disjoint clopen partition glues. The complement of a point is a countable disjoint union of cylinders, hence projective | true | none |
| 2.2 decomposition route (carried, r5) | Two-point discrete; `Sh ℝ`, `Δ Bool`; initial `F` | The transpose of `η_F` is `𝟙` on `F_a ⊔ F_b`. `π₀ Δ Bool = Bool`. For initial `F`, `π₀ F = ∅` | true | none |
| GrothendieckTopoi 1.2 contract (carried, r5) | Uses in 2.2 | Balanced: mono and epi give iso. `A ⟶ Δ ∅` is an isomorphism (strict initial object) | true | none |
| 1.1 `IsCompletelyDistributive` (carried, r5) | `ι = PEmpty`; `κ i₀ = ∅`; `Opens ℝ`; `unitInterval` | `⊤ = ⊤`; `⊥ = ⊥`; for `Opens ℝ` the left side is `ℝ` and the right side `∅`; in the chain, `d < LHS` gives `RHS ≥ d` | true | none |
| 1.2 `isCompletelyDistributive_iff_le_sSup_iInter` (carried, r5) | `ι = ∅`; a non-lower pair in `unitInterval` | `⋂ = univ` and `sSup = ⊤`. The pair has sups `1` and `1` with `⋂ = ∅`, so the lower-set hypothesis is needed | true | none |
| 1.3 `isLocallyConnected_iff` (carried, r5) | Two-point discrete; Cantor; `Opens ℝ` | `{a}` and `{b}` are connected, `⊤` is not. In Cantor, the join of connected elements is `⊥ ≠ ⊤`. `ℝ` is locally connected and not completely distributive | true | none |
| 1.4 Raney and `not_isCompletelySupPrime` (carried, r5) | Trivial `L`; `Bool × Bool`; `unitInterval` | Trivial `L ≅ LowerSet PEmpty`. `Bool × Bool` has two atoms and is isomorphic to `LowerSet` of a 2-antichain. In `unitInterval`, `sSup (Iio a) = a`, so there is no prime element | true | none |
| 2.1 (A), (B) and the predicates (carried, r5) | `Type u`; `AddCommGrpCat`; `ι = ∅`; `K i₀ = ∅` | `9·\|A\|²` on both sides; rank 18 vs 6; `1 ≅ 1`; `∅ = ∅` | true | none |
| 2.2 `productsDistribOverCoproducts_sheaf_iff` (carried, r5) | `Sh ℝ`; Cantor | `Δ Bool = ⊤ ⨿ ⊤`. In Cantor, `id ∈ Γ(∏ₙ Δ Bool)` is not locally constant | true | none |
| 2.3 `isRightAdjoint_presheafToSheaf_iff` (carried, r5) | `J = ⊥`, `⊤`; `Opens ℝ`; `SingleObj (Multiplicative ℕ)` | `a = 𝟭`; `≌ PUnit`; `⋂ Sₙ` is the sieve of `∅`; `⋂ {m ≥ n} = ∅` | true | none |
| 2.4, both statements (carried, r5) | `SingleObj (Multiplicative ℕ)`; `Opens ℝ`; `LowerIco` | Sheaves `≌ PSh(Bℤ)` while the cover intersection is empty. In `Opens ℝ` both intersections and (A) fail. In `LowerIco` the covers of `[0, a)` contain every `[0, b)` | true | none |
| 2.5 `isTotallyDistributive_sheaf_iff` (carried, r5) | `Type u`; `Sh ℝ`; `Sh LowerIco` | `c = ev_PUnit`. `Sh ℝ` is total but fails (A). `Sh LowerIco` satisfies both | true | none |
| 3.1–3.3 spatial forms (carried, r5) | `PEmpty`; `ℝ`; discrete; Sierpiński; `ℚ`; Cantor | `PEmpty` gives one object. `ℝ` fails both sides. A discrete space gives `Set X`. In Sierpiński the primes are `{o}` and `X`. `ℚ` and Cantor are not locally connected | true | none |
| 3.5 `LowerIco`, three theorems (carried, r5) | Open sets; terminal sheaf; projective `P` | `⋃ Iio aₙ = Iio (sup aₙ)`. `∐_{c<1} [0, c) ⟶ ⊤` has no section. For the projective `P`, the summand `(c, z, c′)` gives `c ≤ c′ < c` | true | none |
| 3.6 Cantor and `ℝ` (carried, r5) | Clopen `V`; connected `W ⊆ ℝ` | A finite disjoint refinement glues. `W` lies in intervals of length `1/(n+1)` for every `n`, so `W = ∅` | true | none |
| Summary end theorems vs `Suggested.lean` (carried, r5; recounted) | Each clause | All 20 theorems are declared; 3.4 is named as not statable | true | none |

## Not verifiable

- **Published Lucyshyn-Wright.** JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018, resolves only to a paywalled page. Earlier rounds checked its locators against arXiv:1108.4032v3, and this diff does not touch them.
- **SGA 4 IV, Exercice 7.6.** It is reached only through GrothendieckTopoi's citations and was not opened.
- **The Buffalo 1973 recording** is a video, not a text. No target depends on it.
- **Statements without a literature locator.** These are the general 4.2 target (own argument) and 2.3, 2.4 (first statement) and 3.4. They were checked only through their routes and the instances in the table.

## Source issues

- none
