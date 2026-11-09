# Review of TotallyDistributiveTopoi (pull request #1927 at edfc4c3)

**Verdict:** needs changes

This is an incremental re-review of the 13 lines changed in the folder since 164f2f4. The only change is one paragraph appended to 4.2 (`README.md` lines 608–619). `Suggested.lean` is unchanged. The paragraph's mathematics is correct (see the table below). It has one policy defect.

## R01 (P3) — a theorem stated, proved and then declared "Not a target"

**Location.** `TauCetiRoadmap/TotallyDistributiveTopoi/README.md`, lines 608–610: "Not a target: other spaces. Call a basis `𝔅` of open sets of `X` disjointly refinable when every open cover of a member of `𝔅` has a refinement by pairwise disjoint open sets. Then `Sh(X)` has enough projectives (own argument)."

**Claim.** The paragraph does four things:
- it asserts a general theorem: a disjointly refinable basis gives enough projectives in `Sh X`;
- it coins a term for the hypothesis;
- it proves the theorem and lists its instances;
- it then places the theorem outside the plan.

Meanwhile the target of 4.2, `enoughProjectives_sh_cantor`, is a special case of that theorem. Its route (lines 592–595) is the same argument with `𝔅` the clopen sets. So the README now plans the special case and leaves the general statement it has just proved without a milestone. That is the indefinite scope the repository README forbids.

**Witness.** The repository `README.md`:
- lines 226–229: "Everything on a roadmap is work we want … every item lives in *some* milestone";
- line 215 lists "an object named but never made a target" as a leap.

This roadmap's 4.2 route (lines 592–595) is the paragraph's argument for `𝔅` = clopen sets.

**Repair.** Make the general statement the target of 4.2 and derive the Cantor space from it.

1. Replace the paragraph by a target placed first in 4.2. Suggested wording: "Prove that `Sh X` has enough projectives when `X : Type u` has a basis `𝔅` (`TopologicalSpace.IsTopologicalBasis`) such that every cover of a member `U ∈ 𝔅` by open sets has a refinement by pairwise disjoint open sets with union `U` (own argument)."
2. Keep the paragraph's proof as the route.
3. Then "Prove `enoughProjectives_sh_cantor` as the instance where `𝔅` is the set of clopen sets."
4. Turn the instances into **Checks**:
   - a Lindelöf `ZeroDimensionalSpace` qualifies, with `𝔅` the clopen sets, by `IsClosed.isLindelof` and `IsClopen.diff`; examples are `ℚ`, `ℕ → ℕ` and the Sorgenfrey line;
   - an `AlexandrovDiscrete` space qualifies with the smallest open neighbourhoods. On the Sierpiński space, every open cover of `X = U_c` contains `X`;
   - `ℝ` and `LowerIco` admit no such basis. In `ℝ`, a basic set contains a connected interval that two overlapping subintervals cover, and no disjoint refinement exists. In `LowerIco`, nonempty open sets pairwise meet. This matches the 4.2 Check on `Sh ℝ` and target 3.5.
5. Add `TopologicalSpace.IsTopologicalBasis` and `Set.PairwiseDisjoint` to the Mathlib contract and to 4.2's *Needs:*. Add `ZeroDimensionalSpace`, `LindelofSpace`, `IsClosed.isLindelof`, `IsClopen.diff` and `AlexandrovDiscrete` to the contract for the Checks.

State the hypothesis inline rather than as a new predicate. Then the coined term goes away, and `Suggested.lean` can stay unchanged as long as the README gives the general target no backticked name.

If it is named, this signature elaborates at the pins with only the `sorry` warning. It was tested in a scratch copy of `Suggested.lean` placed after `enoughProjectives_sh_cantor`:

```lean
theorem enoughProjectives_sh_of_isTopologicalBasis (X : Type u) [TopologicalSpace X]
    (𝔅 : Set (Set X)) (h𝔅 : IsTopologicalBasis 𝔅)
    (hdisj : ∀ U ∈ 𝔅, ∀ 𝒱 : Set (Set X), (∀ V ∈ 𝒱, IsOpen V) → U ⊆ ⋃₀ 𝒱 →
      ∃ 𝒲 : Set (Set X), (∀ W ∈ 𝒲, IsOpen W) ∧ 𝒲.PairwiseDisjoint id ∧ ⋃₀ 𝒲 = U ∧
        ∀ W ∈ 𝒲, ∃ V ∈ 𝒱, W ⊆ V) :
    EnoughProjectives (Sh X) :=
  sorry
```

Ownership check: GrothendieckTopoi at 59848bc (README lines 1455–1466) keeps the abelian analogue (`j_!ℤ` projective) as its own non-target. Promoting this statement creates no second owner, because the coefficients differ: `Type u` here, `AddCommGrpCat` there.

## Previous findings

- None to account for. The review of 164f2f4 raised no finding; it had recorded R01 and R02 of the review of ebcea05 as repaired. This head leaves the passages of those repairs untouched: the 2.2 route at lines 300–302, and the absence of 2.6 (grep for `Heyting`, `himp`, `2.6`: 0 hits).

## Verified sound

**What changed.**
- `git diff 164f2f4 HEAD -- TauCetiRoadmap/TotallyDistributiveTopoi` contains only README lines 608–620 (13 insertions). These come from commit b79f860.
- `Suggested.lean` and `metadata.toml` are unchanged.
- Nothing in the folder cites the new paragraph. The Summary, the Scope, How to read the build, the 4.2 *Needs:* line and the Layer 4 Dependencies do not mention it. So the only text that depends on it is 4.1 (checked for consistency in the table) and the 4.2 route it generalizes.

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TotallyDistributiveTopoi'` is empty. The files outside the folder listed in `changes.md` come from edfc4c3, a merge of main into the branch.

**Gate.**
- I ran the gate on this head with `--base origin/main`. Every check reports 0 and the result is OK. The checks are set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material.
- The worker's gate at the same head also reports `build=0`.

**Dependency check.**
- Output: `depcheck: 236 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- This roadmap is at line 401 of the merge order.
- Its only supplier, GrothendieckTopoi, is an open new-roadmap pull request named in the description's depends-on list.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/TotallyDistributiveTopoi/Suggested.lean` exits 0 with exactly 20 `sorry` warnings and no other message. The warnings are at lines 52, 71, 86, 93, 132, 140, 147, 155, 164, 183, 189, 195, 206, 211, 215, 220, 224, 229, 240 and 249.
- **Signatures.** In a scratch copy I added `#check @name` for all 30 declarations plus the candidate of R01. Every elaborated type is unchanged from the review of 164f2f4 and agrees with the README:
  - `[J.Subcanonical]` appears only on `productsPreserveEpis_and_distrib_iff`;
  - `[CompleteLinearOrder L] [DenselyOrdered L]` on `not_isCompletelySupPrime`;
  - `[Projective P]` on `nonempty_isInitial_of_projective_sh_lowerIco`.
- The four "dropped `[Category.{u} E]`" leads of `signatures.md` are false: `ProductsPreserveEpis`, `ProductsDistribOverCoproducts`, `IsTotallyDistributive` and `IsPresheafTopos` all elaborate with `[Category.{u_2, u_1} E]`.
- **Padding probe.** In the same copy, every theorem body was replaced by `by first | rfl | infer_instance | simp | decide`. All 20 fail (errors at copy lines 56–250), so none is padding.

**Supplier citations, re-resolved.** GrothendieckTopoi moved from 7d5de30 to 59848bc, so I re-resolved every citation at the new head:
- §1.1 `IsGrothendieckTopos` (Lean 103);
- §1.2 `Balanced E` and "every morphism into an initial object is an isomorphism" (README 285–297);
- §1.4 `isGrothendieckTopos_iff_giraudAxioms` (Lean 165);
- §2.3 `constantSheaf` as inverse image (README 437–440);
- §5.2 `Sh(X)` locally connected iff `LocallyConnectedSpace X` (README 792–793);
- §5.6 `GeometricMorphism.IsEssential` (429) and `GeometricMorphism.isEssential_iff_preservesProducts` (435). The latter is the `citations.md` lead for README 55, and it is real;
- §6.5 `exists_equiv_presheaf_iff_essential_points` (467), `epi_piMap_presheaf` (479) and `isIso_sigma_pi_presheaf` (485);
- §7.1 `Frame.grothendieckTopology` (497), subcanonical and equal to `Opens.grothendieckTopology` (README 1065–1069).

Its Scope (line 70) still cites this roadmap's §§2.4–2.5 and 3.5. The `citations.md` lead for README 113, `Sheaf.instHasColimitsOfShape`, is an anonymous instance name and resolves: the Lean file uses it at line 34 and elaborates.

**Library declarations opened at the pin** (for the new paragraph):
- `ZeroDimensionalSpace` (Topology/InductiveDimension/Classes.lean:105) is small inductive dimension 0. It is equivalent to a basis of clopen sets by `zeroDimensionalSpace_iff_isTopologicalBasis_isClopen` (:114) and admits the empty space (:100). The README's "zero-dimensional" means exactly this.
- `LindelofSpace` (Topology/Compactness/Lindelof.lean:485).
- `IsClosed.isLindelof` (:514).
- `IsClopen.diff` (Topology/Clopen.lean:60).
- `AlexandrovDiscrete` (Topology/AlexandrovDiscrete.lean:36).
- `IsTopologicalBasis` (Topology/Bases.lean:73).
- For the Sorgenfrey line, `isClopen_Ico` (Counterexamples/SorgenfreyLine.lean:153, in the pinned Mathlib package, outside `Mathlib/`).

The pinned Mathlib and Tau Ceti have no notion of an open cover with a disjoint refinement and no `EnoughProjectives` instance for sheaves of sets.

**Ownership.**
- `roadmaps grep` for "disjointly refinable", "ultraparacompact", "disjoint refinement" and "refinement by pairwise disjoint" finds only this README and GrothendieckTopoi 1459–1466 (abelian, a non-target there).
- "enough projectives" with sheaves finds only this roadmap and the unrelated MotivesAndAlgebraicCycles (presheaves with transfers).
- `overlaps.md` reports that no open pull request changes this roadmap, nothing cited here is dropped, and nothing dropped here is cited elsewhere.

**Seeded sample.** Of the sampled targets, only 4.2 contains the change. Neither 4.2 nor the new paragraph has a literature locator: the paragraph says "own argument". So there is no source text to check against, and the paragraph is checked by the computations below. The References are unchanged, so the source checks of the review of ebcea05 still stand: Raney 1952 (Theorem 1, Definition 5, Theorem 2, §4, §5) and Lucyshyn-Wright arXiv:1108.4032v3 (§1.1, §1.5, Theorems 1.5.3 and 1.5.5, Remark 1.5.6, Propositions 2.2, 5.1 and 5.3). The README flags no locator as unverified.

**Adversarial table.** New rows carry values computed in this review. Carried rows are for statements the diff leaves untouched; they cite the review of 164f2f4 and repeat its computed values.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| **New: `U ∈ 𝔅` is projective (lines 610–613)** | Cantor cylinder `U = [0]`; Sierpiński `{o, c}`, `U_c = X`; `U = ∅` | `Hom(yU, F) = F(U)`. An epimorphism `F ⟶ G` lifts `t ∈ G([0])` on a cover. The cylinders `[00]`, `[01]` refine it disjointly, and the overlap is `∅` with `F(∅) = pt`, so the lifts glue and the image is `t` by separatedness. Sierpiński: every cover of `X` contains `X`, so the lift is on `X` itself. `U = ∅`: `F(∅) → G(∅)` is `pt → pt` | true | none |
| **New: the coproduct covers** | `X = PEmpty`; size | `𝔅 = ∅` is a basis of the empty space. `Sh PEmpty` has one object, and the empty coproduct (initial = terminal) covers it. The index `Σ U ∈ 𝔅, F(U)` lies in `Type u` | true | none |
| **New: Lindelöf with a clopen basis qualifies** | Sorgenfrey `B = [0, 2)` with the cover `{[0, 1), [1/2, 2)}`; `ℚ`; Baire `ℕ → ℕ` | `B₁ = [0, 1)`, `B₂ = [1/2, 2)`, `B₂ ∖ B₁ = [1, 2)`: clopen (`isClopen_Ico`), disjoint, union `B`. `ℚ`: intervals with irrational endpoints are clopen, and second countability gives Lindelöf. Baire: cylinders are clopen and the space is second countable | true | none |
| **New: Alexandrov qualifies** | Sierpiński; `P = {0 < 1}` with lower sets; a discrete space | `U_o = {o}`, `U_c = X`. A cover of `U_x` has the refinement `{U_x}`. Lower sets: `U_1 = P`, `U_0 = {0}`. Discrete: `U_x = {x}`. All are presheaf topoi (Convention 4) | true | none |
| **New: non-examples agree with 3.5, 3.6 and the 4.2 Check** | `ℝ`; `LowerIco` | `ℝ`: a basic `U ∋ x` contains a component `(a, b)` covered by `(a, (a+2b)/3)` and `((2a+b)/3, b)`. A disjoint open refinement partitions the connected `(a, b)`, so one member contains it, and that member lies in neither cover set: no basis qualifies, consistent with no enough projectives. `LowerIco`: nonempty open sets pairwise meet, so the cover `{[0, b) : b < a}` of `[0, a)` has no disjoint refinement, consistent with 3.5 (only `0` is projective) | true | none |
| **New: consistency with 4.1** | `ℚ`, Sorgenfrey, Baire; Alexandrov | The first three have singleton components, which are not open, so they are not locally connected and (B) fails (3.2). They have enough projectives and are not presheaf topoi, as 4.1 requires. Alexandrov spaces satisfy both (B) and enough projectives, and are presheaf topoi | true | none |
| **R01 candidate signature** | `𝔅 = ∅` on nonempty `X`; `∅ ∈ 𝔅` | `IsTopologicalBasis ∅` needs `⋃₀ ∅ = univ`, which is false, so the theorem is not vacuous. For `U = ∅`, `𝒲 = ∅` has `⋃₀ 𝒲 = ∅ = U`. No hypothesis mentions `EnoughProjectives` | elaborates | proposed |
| 2.2 decomposition route (carried, 164f2f4) | Two-point discrete; `Sh ℝ`, `Δ Bool`; initial `F` | The transpose of `η_F` is `𝟙` on `F_a ⊔ F_b`. `π₀ p_x` hits `x`. `∐ₓ {x} → F_a ⊔ F_b` is a bijection. `Sh ℝ`: `π₀ Δ Bool = Bool`. Initial `F`: `π₀ F = ∅` | true | none |
| GrothendieckTopoi 1.2 contract (carried, re-resolved at 59848bc) | Uses in 2.2 | Balanced: inverted by `Hom(Q, −)` gives mono and epi, hence iso (GrothendieckTopoi README 293–294). `A ⟶ Δ ∅` is iso (strict initial, same passage) | true | none |
| 1.1 `IsCompletelyDistributive` (carried) | `ι = PEmpty`; `κ i₀ = ∅`; `Opens ℝ`; `unitInterval` | `⊤ = ⊤`; `⊥ = ⊥`; LHS `ℝ`, RHS `∅`; chain: `d < LHS` gives `RHS ≥ d` | true | none |
| 1.2 `isCompletelyDistributive_iff_le_sSup_iInter` (carried) | `ι = ∅`; a non-lower pair in `unitInterval` | `⋂ = univ` and `sSup = ⊤`. The sups are `1, 1` with `⋂ = ∅`, so the lower-set hypothesis is needed | true | none |
| 1.3 `isLocallyConnected_iff` (carried) | Two-point discrete; Cantor; `Opens ℝ` | `{a}`, `{b}` are connected and `⊤` is not. Cantor: the join of connected elements is `⊥ ≠ ⊤`. `ℝ` is locally connected and not completely distributive | true | none |
| 1.4 Raney; `not_isCompletelySupPrime` (carried) | Trivial `L`; `Bool × Bool`; `unitInterval` | `≅ LowerSet PEmpty`; two atoms, `≅` a 2-antichain; no prime element, since `sSup (Iio a) = a` | true | none |
| 2.1 (A), (B) and the predicates (carried) | `Type u`; `AddCommGrpCat`; `ι = ∅`; `K i₀ = ∅` | `9·\|A\|²` on both sides; rank 18 vs 6; `1 ≅ 1`; `∅ = ∅`. `Ab`: `0 = 1`, not a presheaf topos | true | none |
| 2.2 `productsDistribOverCoproducts_sheaf_iff` (carried) | `Sh ℝ`; Cantor | `Δ Bool = ⊤ ⨿ ⊤`. On the Cantor space, `id ∈ Γ(∏ₙ Δ Bool)` is not locally constant | true | none |
| 2.3 `isRightAdjoint_presheafToSheaf_iff` (carried) | `J = ⊥`, `⊤`; `Opens ℝ`; `SingleObj (Multiplicative ℕ)` | `a = 𝟭`; `≌ PUnit`; `⋂ Sₙ` is the sieve of `∅`; `⋂ {m ≥ n} = ∅` | true | none |
| 2.4, both statements (carried) | `SingleObj (Multiplicative ℕ)`; `Opens ℝ`; `LowerIco` | Sheaves `≌ PSh(Bℤ)` while the cover intersection is empty, so the subcanonical hypothesis is needed. On `Opens ℝ`, intersections and (A) both fail. On `LowerIco`, the covers of `[0, a)` contain every `[0, b)` | true | none |
| 2.5 `isTotallyDistributive_sheaf_iff` (carried) | `Type u`; `Sh ℝ`; `Sh LowerIco` | `c = ev_PUnit`; `Sh ℝ` is total but fails (A); `Sh LowerIco` satisfies both | true | none |
| 3.1–3.3, spatial forms (carried) | `PEmpty`; `ℝ`; discrete; Sierpiński; `ℚ`; Cantor | One object; both sides fail; `Set X`; the primes are `{o}` and `X`. `ℚ` and Cantor are not locally connected, so (B) fails | true | none |
| 3.5 `LowerIco`, three theorems (carried) | Open sets; terminal sheaf; projective `P` | `⋃ Iio aₙ = Iio (sup aₙ)`. `∐_{c<1} [0, c) ⟶ ⊤` has no section. The summand `(c, z, c′)` gives `c ≤ c′ < c` | true | none |
| 3.6 Cantor and `ℝ` (carried) | Clopen `V`; connected `W ⊆ ℝ` | A finite disjoint refinement glues. `W` lies in intervals of every length `1/(n+1)`, so `W = ∅` | true | none |
| 4.1, 4.2 (carried) | `Type u`; `Sh LowerIco`; Cantor; `Sh ℝ` | `Type u` satisfies both. In `Sh LowerIco` the only projective is `0`. Cantor has enough projectives without (B). `Sh ℝ` has (B) without enough projectives | true | none |
| Summary end theorems vs `Suggested.lean` (carried; the new paragraph adds none) | Each clause | 1.2, 1.3, 1.4 (×2), 2.2, 2.3, 2.4 (×2), 2.5, 3.1, 3.2, 3.3, 3.5 (×3), 3.6 (×3), 4.1 and 4.2 are declared. 3.4 is named as not statable | true | none |

**Remark** (untouched text, no change asked of this folder): the pull request description still lists "continuous `ℤ_p`-sets" as a (B)-without-(A) example. The README no longer contains it.

## Not verifiable

- **Published Lucyshyn-Wright.** JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018, resolves only to a paywalled page. Its locators were checked against arXiv:1108.4032v3, and they are unchanged in this diff.
- **SGA 4 IV, Exercice 7.6.** It is reached only through GrothendieckTopoi's citations and was not opened.
- **The Buffalo 1973 recording** is a video, not a text. No target depends on it.
- **Statements without a literature locator.** The new paragraph (own argument), together with 2.3, 2.4 (first statement), 3.4 and 4.2, has none. These were checked only by the routes and the instances in the table.

## Source issues

- none
