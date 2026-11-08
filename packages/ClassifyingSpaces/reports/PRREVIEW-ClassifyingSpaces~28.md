# Review of ClassifyingSpaces (pull request #1808 at a3b1e14)

**Verdict:** needs changes

This is an incremental re-review: the folder changed by 0 lines since 60a92ec. `git diff 60a92ec a3b1e14 -- TauCetiRoadmap/ClassifyingSpaces` is empty, and so is the diff of `lake-manifest.json` and `lean-toolchain`. The two commits since then edit AlgebraicTopology and CharacteristicClasses.

- The AlgebraicTopology commit repairs the previous R01: the pointed classification now has one owner.
- The same commit hands two more statements to this roadmap that it does not make. That is R01 below, new.
- The previous R06 is partly repaired. Every other previous finding stands unchanged, because the text it points at is unchanged.
- The gate still fails on `outside-folder=2`.

## R01 (P2) — Free homotopy classes and disconnected sources are handed to this roadmap, which does not state them

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2129–2134: "and the conjugation-orbit description of the free classes `[X,Bπ]`, are ClassifyingSpaces items 1.1–1.2 with target Bπ, … disconnected X is treated componentwise there". Against this, `TauCetiRoadmap/ClassifyingSpaces/README.md` line 431 ("`X` is a path-connected Hausdorff CW complex") and lines 545–547, which cover pointed classes only.

**Claim.** The repair of the previous R01 gave the pointed classification `[X, Bπ]_* ≃ Hom(π₁X, π)` one owner, here. That part is correct.

The same edit deleted two statements AlgebraicTopology used to prove itself, and now attributes them to items 1.1–1.2:

- forgetting base points gives the description of free classes by conjugation orbits;
- disconnected `X` is handled componentwise.

Neither statement is in this README. Layer 1 assumes `X` path-connected (line 431, and `[PathConnectedSpace X]` in `exists_continuousMap_mapOfEq_eq_of_isAspherical`). It classifies pointed maps only (lines 545–547), and no line mentions free classes. After the repair both statements have no owner. StableHomotopyKTheory §1.31, a Check at its open head, still refers to "the conjugation-orbit description of unbased maps into BG".

**Witness.** Take `X = S¹` and `Y = B(S₃)`. The pointed classes are `Hom(ℤ, S₃)`, six of them. The free classes are the three conjugacy classes of `S₃` (`hatcher-at` lines 1745–1751, §1.1 Exercise 6, p. 38). Items 1.1–1.2 give only the six. `S¹ ⊔ S¹` violates `[PathConnectedSpace X]`.

**Repair.** Give both statements one owner. AlgebraicTopology already points here, and the statement holds for every aspherical target, so the natural owner is item 1.2.

1. **Add a corollary paragraph at the end of item 1.2.**
   - Statement: for `X` and `(Y, y)` as in Layer 1, forgetting base points induces a bijection from `Hom(π₁(X, x), π₁(Y, y))`, modulo post-composition with inner automorphisms of `π₁(Y, y)`, onto the free homotopy classes `[X, Y]`.
   - Disconnected sources: for a Hausdorff CW complex `X` with several path components, each of them a subcomplex, `[X, Y]` is the product of these sets over the components.
   - Locator: Hatcher, Proposition 4A.2, p. 422 (`hatcher-at` lines 18238–18240), with 1.1–1.2. A homotopy whose base-point trace is a loop `γ` changes the induced homomorphism by conjugation with `γ`.
   - *Needs:* (1.1), (1.2), Tau Ceti `TauCeti.hasHomotopyExtensionProperty_skeletonLT`, `ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` and `FundamentalGroup.fundamentalGroupMulEquivOfPath_eq_conj` (`TauCeti/AlgebraicTopology/FundamentalGroup/BasepointChange.lean` 114).
2. **Add a Check.**
   - `X = S¹`, `Y = B(S₃)`: six pointed classes and three free ones.
   - `X = S¹ ⊔ S¹`: nine free classes.
   - `Y = S¹`: free and pointed classes agree, both `ℤ`, so an abelian target cannot detect the quotient.
3. **Name the free classes** in Scope item 1 and in *Downstream consumers* (lines 782–785).

Alternatively, leave this README as it is. In AlgebraicTopology lines 2129–2134, cite ClassifyingSpaces only for the pointed classification, and restore AlgebraicTopology's own statements of the free classes and of the disconnected case, consuming 1.1–1.2.

Tested on the instance: either repair gives three free classes for `S¹ → B(S₃)`, as Hatcher's exercise does. For `S¹ ⊔ S¹` it gives `3 × 3 = 9` free classes, and `6 × 3 = 18` pointed classes when based in the first circle.

## R02 (P2) — Item 2.3 claims connecting maps in cohomology for a short exact sequence of representations, which do not exist without a hypothesis

Carried from the previous report (its R02); the passage is unchanged.

**Location.** README lines 722–725: "The isomorphisms are natural in `A` and carry the connecting maps of a short exact sequence of representations to `groupHomology.δ` and `groupCohomology.δ`".

**Claim.** The cohomological coefficient is `Homₖ(A, N)`, which is contravariant in `A` and not exact. A short exact sequence in `A` therefore gives no short exact sequence of coefficients, and `groupCohomology.δ`, which needs `ShortExact`, has nothing to act on. The pinned cohomological connecting map is the Bockstein of a sequence `0 → N₁ → N₂ → N₃ → 0` in the values. It assumes `[Module.Projective k A]`: `TauCeti.twistedCohomologyBockstein_comp_classifyingSpaceTwistedCohomologyIsoGroupCohomology_hom` (`ClassifyingSpace/LocalCoefficients.lean` 331, hypothesis on line 332).

**Witness.** `k = ℤ`, `G = 1`, `X` a point, `N = ℤ`, `0 → ℤ →(·2) ℤ → ℤ/2 → 0`. Applying `Homℤ(−, ℤ)` gives `0 → 0 → ℤ →(·2) ℤ → 0`, whose cokernel is `ℤ/2`, so it is not exact.

**Repair.** Restate the cohomology half:

- naturality contravariant in `A` (`TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology_hom_naturality_left`, line 281);
- naturality in `N` (`…_hom_naturality_right`, line 301);
- for `A` projective over `k`, the Bockstein of a short exact sequence in `N` goes to `groupCohomology.δ` of `0 → Homₖ(A, N₁) → Homₖ(A, N₂) → Homₖ(A, N₃) → 0` (line 331).

Alternatively, keep a sequence in `A` and add that it splits over `k`. Tested: with `A = ℤ` and the sequence in `N`, `Homℤ(ℤ, Nᵢ) = Nᵢ` is exact.

## R03 (P3) — The route of 2.3 leaves two pinned facts unnamed and needs a transport that the pin lacks; Scope item 3 promises a naturality that 2.3 does not state

Carried from the previous report (its R03); the passages are unchanged.

**Location.** README lines 715–716 ("so the pullback has monodromy `A ∘ Ψ`, and `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` identifies it with `L_A`"), the *Needs:* line 730–739, and Scope item 3, lines 53–57 ("natural in `(X, Ψ)` along pointed maps").

**Claim.** `ofRepresentationMonodromyIso L : ofRepresentation x (L.monodromyRepresentation x) ≅ L` has fibre `(A ⊗ k[p_G⁻¹ b₀])_G`, not `A`. Reaching `L_A` takes three steps:

- (i) `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` (`LocalCoefficient.lean` 395), which is pinned but not named;
- (ii) `IsQuotientCoveringMap.associatedLocalSystemFiberIso` (`LocalCoefficient/QuotientCovering/Exact.lean` 52), which is pinned but not named;
- (iii) an isomorphism `ofRepresentation x ρ ≅ ofRepresentation x ρ'` induced by `ρ ≅ ρ'`, which the pin lacks.

Separately, 2.3 states naturality only in `A`.

**Witness.** `LocalCoefficient/Representation.lean` at the pin declares only `ofRepresentation`, `ofRepresentation_obj` (89), `ofRepresentation_map_apply` (95), `monodromyRepresentation_ofRepresentation` (111), `ofRepresentationMonodromyIso` (122), `ofRepresentationMonodromyIso_app_mk` (135) and `pathFromBase`. None of them transports along an isomorphism of representations.

**Repair.**

- Name (i) and (ii) in the route and on the *Needs:* line.
- Add an API bullet to 2.3, owned here: "an isomorphism of representations `ρ ≅ ρ'` of `π₁(X, x)` induces `ofRepresentation x ρ ≅ ofRepresentation x ρ'`".
- Either state the `(X, Ψ)`-naturality of 2.3 with its route, or narrow Scope item 3 to naturality in `(X, Ψ)` for 2.1–2.2 and in the coefficients for 2.3.

## R04 (P3) — The route of 1.2 uses an unnamed Mathlib lemma, and the supplier list names a declaration that no target uses

Carried from the previous report (its R04); the passages are unchanged.

**Location.** README lines 527–529 ("unwinding the definition of `g'` on `σ_a` and `σ_b` this is the statement that `f ∘ γ` and `g' ∘ γ` are homotopic relative to the end points"), the *Needs:* line 531–535, and line 385.

**Claim.** `σ_a` is a path from `x` to a different vertex `a`. Comparing `g' ∘ σ_a` with `f ∘ σ_a` therefore needs the naturality square of a homotopy on path classes, not the loop lemma that *Needs:* names. Line 365 says each listed declaration is "named at the target that uses it". `ContinuousMap.Homotopy.exists_path_fundamentalGroupMulEquivOfPath_map_comp` (line 385) appears in no route.

**Witness.** Mathlib `ContinuousMap.Homotopy.eq_diag_path`, `Mathlib/AlgebraicTopology/FundamentalGroupoid/InducedMaps.lean` 256, gives `(π f).map p ≫ ⟦H.evalAt x₁⟧ = H.diagonalPath' p` for a path `p` between distinct points. `fundamentalGroupMulEquivOfPath_evalAt_map` (`BasepointChange.lean` 228) concerns loops at one point.

**Repair.** Name `ContinuousMap.Homotopy.eq_diag_path` in the route of 1.2 and on its *Needs:* line. Delete the line-385 entry, or name it at the target that uses it.

## R05 (P3) — The claims of Layer 2 carry no locator, and a Hatcher page is off by one

Carried from the previous report (its R05); the passages are unchanged.

**Location.** Items 2.1–2.3 (lines 618–739) cite no source at any claim. Line 113 reads "Proposition 1B.9 (p. 90, where the base point is a `0`-cell of the maximal tree)".

**Claim.** None of 2.1, 2.2 or 2.3 cites a source, and Brown appears only under References. The maximal-tree step of Hatcher's proof is on p. 91.

**Witness.** `hatcher-at` line 3924 is the p. 91 page header, and lines 3938–3942 choose the maximal tree `T` with `f(T) = y₀`. `hatcher-at` lines 6471–6479 (p. 148) and 14326–14412 (pp. 328–329) are the available Layer 2 support.

**Repair.**

- 2.1 and 2.2: cite Hatcher §2.2, p. 148, and Brown Ch. II §4.
- 2.3: cite Hatcher §3.H, p. 328, with Example 3H.1, p. 329, for the trivial-module bullet, and Brown Ch. III §1.
- Line 113: write "pp. 90–91".

## R06 (P3) — Ids this pull request drops are still cited by other roadmaps, and the README gives no old → new numbering

Partly repaired; carried from the previous report (its R06).

**Location.** The README replaces main's Stage 1–4 / item 1–19 numbering with Layers 1–2 and has no line mapping the old ids. AlgebraicTopology at this head is repointed: its lines 101–110, 2110–2134 and 2504 cite Layer 1 items 1.1–1.3.

**Claim.** The following citations break when this pull request merges:

- FreeGroupsAndLimitGroups on main: lines 29, 40, 2413, 2554 and 2771, "Stage 2 item 7", anchor `#stage-2-the-cellular-model`.
- At open heads:
  - ArithmeticLocallySymmetricSpaces (#871): lines 515, 516, 2011, 2029, 2065, 2073, 2347 and 2371.
  - TangentialBordism (#942): lines 270, 2570 and 2894.
  - StableHomotopyKTheory (#1227): lines 473 and 504.
  - ArithmeticKTheory (#1418): line 1102.

**Witness.** FreeGroupsAndLimitGroups on main, line 2413: "`ClassifyingSpaces` Stage 2 item 7 for presentation complexes". TangentialBordism at its head, line 2570: "ClassifyingSpaces Stage 4". No Stage heading exists at this head.

**Repair.** Add one line per moved id under *Scope and ownership*:

- Stage 1 items 1–6 → *From Tau Ceti*, "Milnor's model", "Its fundamental group" and "Functoriality".
- Stage 2 item 7 → `TauCeti.PresentationComplex` with `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`.
- Items 8–10 → `TauCeti.killHomotopyGroups`, `TauCeti.cellularClassifyingSpace` and `TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`.
- Item 11 → Layer 1 items 1.1–1.2.
- Item 12 → `TauCeti.IsAspherical.exists_homotopyEquiv` and item 1.3.
- Item 13 → `TauCeti.cwComplexPreimage` and `IsQuotientCoveringMap.cwComplexQuotient`.
- Item 14 → `TauCeti.cellularHomotopyEquivClassifyingSpace`.
- Item 15 → `TauCeti.classifyingSpaceHomotopyFunctor`.
- Items 16 and 18 → `TauCeti.universalGSpaceResolution`, `TauCeti.cellularResolutionOfIsAspherical` and `TauCeti.universalGSpaceStandardHomotopyEquiv`.
- Item 17 → the pinned (co)homology comparisons and Layer 2.
- Item 19 → the pinned examples.

## R07 (P3) — Two open pull requests change this folder with conflicting heads, and no order is stated

Carried from the previous report (its R07); the description is unchanged.

**Location.** The merge-order paragraph of the description: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** #1854 and #1187 also change this folder, their heads conflict with this one (`scratch/overlaps.md`), and neither is ordered against this pull request.

- #1854 rewrites the README into the Stage form: 538 lines, `## Inventory: what Mathlib and Tau Ceti already give` at line 112. It also rewrites `Suggested.lean`, which declares `exists_continuousMap_mapOfEq_eq_of_isAspherical` at line 76.
- #1187 carries main's 303-line Stage README, identical to main, with a pin bump.

**Witness.** `roadmaps show ClassifyingSpaces --pr 1854` and `--pr 1187`. The head of #1807 differs from this one only in the circle Check at lines 177–187.

**Repair.** State the order in the description. For example: #1854 drops its ClassifyingSpaces changes and rebases on this pull request; this folder's `Suggested.lean` is re-elaborated on #1187's pin, or #1187 rebases on this one.

## R08 (P3) — Two files outside the pull request's folders are edited

Carried from the previous report (its R08); unchanged.

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 ("`LFunctions` consumes this package and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 ("boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer").

**Claim.** Neither folder is named as this pull request's own, and the gate fails on them.

**Witness.** The worker's gate at a3b1e14: `outside-folder=2 … FAIL`, listing exactly these two files. `git diff origin/main...HEAD` shows a one-line change in each.

**Repair.** Move the two one-line edits to a pull request of their own, or name the two folders as this pull request's own. The SymplecticGeometry line should read "consumed by HeegaardFloer and DGFloer".

## R09 (P3) — An unfinished sentence, one symbol used for two things in a Check, and process wording in the Summary

Carried from the previous report (its R09); the passages are unchanged.

**Location.**

- Lines 159–162: "sends the counterclockwise loop to `1`, so the map wrapping the circle around a loop `γ` with `m(γ) = −1`." The sentence has no main verb.
- Lines 656–658: "`G = ℤ/n`, `k = ℤ`, `n = 2`: … in degree one both sides are `ℤ/n`". Here `n` is both the order and the degree.
- Lines 10, 20 and 22: "already builds", "none of it is planned again", "What remains".

**Claim.** The first two impair Checks. The third is process narrative, and library status belongs in *Scope and ownership*.

**Witness.** The pin sends `γ` to `m(γ)⁻¹` (`ClassifyingSpace/EilenbergMacLane.lean` 77) and the circle loop to `1` (`ClassifyingSpace/Circle.lean` 79). So the intended clause is "`TauCeti.circleToClassifyingSpace` wraps the circle around a loop `γ` with `m(γ) = −1`".

**Repair.**

- Complete the sentence as above.
- Write the Check as "`G = ℤ/m`, `m ≥ 2`, `k = ℤ`: in degree two both sides are zero …, in degree one both are `ℤ/m`".
- Restate lines 10–22 timelessly ("Tau Ceti provides …") inside *Scope and ownership*.

## Previous findings

- R01 — repaired: AlgebraicTopology line 2132 now reads "ClassifyingSpaces items 1.1–1.2 with target Bπ, consumed here", and its lines 101–107 say "which this roadmap consumes and does not prove". The free-class hand-over this introduced is R01 above.
- R02 — not repaired: line 722, "carry the connecting maps of a short exact sequence of representations to `groupHomology.δ` and `groupCohomology.δ`" (R02 above).
- R03 — not repaired: line 716, "`TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` identifies it with `L_A`"; the *Needs:* line still omits `pullback_monodromyRepresentation` and `associatedLocalSystemFiberIso` (R03 above).
- R04 — not repaired: the *Needs:* line 531–535 still names `fundamentalGroupMulEquivOfPath_evalAt_map` and not `eq_diag_path`, and line 385 still lists `exists_path_fundamentalGroupMulEquivOfPath_map_comp` (R04 above).
- R05 — not repaired: line 113, "Proposition 1B.9 (p. 90, where the base point is a `0`-cell of the maximal tree)"; items 2.1–2.3 still have no locator (R05 above).
- R06 — partly repaired: AlgebraicTopology now cites "ClassifyingSpaces Layer 1 items 1.1–1.3" at lines 2110 and 2504. The README still has no old → new lines, and FreeGroupsAndLimitGroups on main still cites "Stage 2 item 7" (R06 above).
- R07 — not repaired: the description still reads "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**", with #1854 and #1187 unordered (R07 above).
- R08 — not repaired: the gate at a3b1e14 reads `outside-folder=2 … FAIL`, listing `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` (R08 above).
- R09 — not repaired: lines 161–162, "so the map wrapping the circle around a loop `γ` with `m(γ) = −1`.", which still has no main verb (R09 above).

## Verified sound

**What changed.**
- The folder diff 60a92ec..a3b1e14 is empty. The pin is unchanged (no diff in `lake-manifest.json` or `lean-toolchain`).
- The commits since then are d487de89 (CharacteristicClasses) and a3b1e146 (AlgebraicTopology).

**Gate.**
- The worker's gate at a3b1e14 has every counter at 0 except `outside-folder=2` (R08).
- My own run on the worktree has every content counter at 0, including `sorry-data`, `set_option`, `imports`, `statement-hygiene`, `readme-ids-missing`, `stray-files` and `depcheck`. It reports `outside-folder=25` because it also counts this pull request's own 14 other folders.

**Dependency check**, verbatim: `depcheck: 245 roadmaps, 2469 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ClassifyingSpaces is on main and not in `ORDER.txt`.

**Elaboration.**
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 5.3 s, with four `declaration uses sorry` warnings (lines 81, 98, 118 and 134) and nothing else.
- A scratch file importing the module and running `#check @` on all four declarations prints types identical to `scratch/signatures.md`. Each keeps `T2Space`, `Topology.CWComplex Set.univ`, the vertex hypothesis `x ∈ skeletonLT Set.univ 1`, the asphericity it needs and `[PathConnectedSpace X]`. No binder is lost.
- Imports: `import Mathlib` plus four `TauCeti.*` modules, all present at the pin.

**Padding probe.** I replaced each `sorry` with `first | simp | rfl | infer_instance | exact ⟨_, rfl, fun _ => rfl⟩ | aesop` in a scratch copy. All four fail: unsolved goals at lines 89, 127 and 142, and "`aesop` made no progress" at line 105.

**Pinned declarations re-opened.** The previous report checked 184 cited names; the pin is unchanged, so I re-opened only the ones behind the findings:
- `LocalCoefficients.lean` 281 and 301 (naturality left and right) and 331 (the Bockstein, with `[Module.Projective k A]` on line 332);
- `LocalCoefficient.lean` 395 (`pullback_monodromyRepresentation`);
- `LocalCoefficient/QuotientCovering/Exact.lean` 52 (`associatedLocalSystemFiberIso`);
- `LocalCoefficient/Representation.lean` 89, 95, 111, 122 and 135 (no transport along an isomorphism of representations);
- `FundamentalGroup/BasepointChange.lean` 114 (`fundamentalGroupMulEquivOfPath_eq_conj`), 228 and 248;
- Mathlib `FundamentalGroupoid/InducedMaps.lean` 256 (`eq_diag_path`).

`grep -i conjugat` over the pinned `EilenbergMacLane/` and `ClassifyingSpace/` directories finds no free-class classification. The pin does not already provide what R01 asks for.

**Seeded sample.**
- Items 1.1 and 1.2: Hatcher, Proposition 1B.9, p. 90 (`hatcher-at` lines 3905–3907). The README's aspherical target is supported, because the proof uses the target only through `π_{n−1}(Y) = 0` (lines 3928–3931). The maximal-tree step is on p. 91 (R05).
- Item 1.3: Theorem 1B.8, p. 90 (line 3897), and the deduction at lines 3908–3911.
- Items 2.1–2.3 have no locator (R05). None of the sampled passages changed since the previous report, whose locator checks stand.
- For R01's repair I also read Proposition 4A.2, p. 422 (lines 18238–18247, page header line 18226) and §1.1 Exercise 6, p. 38 (lines 1745–1751).

**Cross-roadmap citations resolved at this head.**
- AlgebraicTopology lines 101–110, 2110–2115, 2127–2134 and 2504 cite Layer 1 items 1.1–1.3. All three exist (README lines 437, 510 and 549), and items 1.1–1.3 do state the pointed statements cited. The free classes are R01.
- The nerve model consumed at 8.8b meets item 1.1's binders, as the previous report checked: Hausdorff CW through AlgebraicTopology Stage 4.7, universe of `π`, vertex base point.
- CharacteristicClasses lines 64 and 781 consume AlgebraicTopology 8.8b's normalised `ℤ/2` model, as README lines 784–785 say.
- README line 73 ("Stage 8 items 8a and 8b") resolves to AlgebraicTopology's Stage 8 (heading at line 1848), item 8, parts 8.8a and 8.8b.

**Overlap facts** (`scratch/overlaps.md`, five items, each checked):
1. Other pull requests changing this folder: #1187, #1807 and #1854. Their ClassifyingSpaces READMEs are 303, 803 and 538 lines; R07.
2. Ids this README cites that an open pull request drops: none.
3. Ids that only an open revision defines: none.
4. Ids this pull request drops: `#stage-2-the-cellular-model` (FreeGroupsAndLimitGroups) and `§Stage` (ArithmeticLocallySymmetricSpaces), plus the further old-id citations found by `roadmaps grep`; R06.
5. Closest roadmaps in vocabulary: AlgebraicTopology at #1854, #1652, #1663, #1187 and #1797. Those heads still plan `[X,Bπ]_*` themselves (#1652 line 2956, #1663 line 2138, #1797 line 1850). They revise AlgebraicTopology, which this pull request's AlgebraicTopology folder supersedes. That conflict belongs to that folder's review.

**Ownership.** `roadmaps grep` for the four headline names finds only copies of this folder (main, #1187, #1807, #1854). `roadmaps grep` for `[X,Bπ]` and "conjugation-orbit description" finds only AlgebraicTopology heads and StableHomotopyKTheory §1.31, a construction on the bar model that does not own the general statement (R01).

**Adversarial table.** Rows marked "r23" are carried from the previous report, for statements this diff leaves untouched. Rows marked "new" are computed for the citation the AlgebraicTopology change introduced.

| Statement | From | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Headline 1.1 existence | r23 | `X = S¹` with one vertex, `Y = S¹`, `φ = ·2` | `z ↦ z²` is pointed and sends `1 ↦ 2` | holds | none |
| Headline 1.1, non-CW target | r23 | `X = S¹`, `Y = ℝP^∞`, `φ : ℤ ↠ ℤ/2` | `ℝP¹ ⊂ ℝP^∞` induces the surjection | holds | none |
| Headline 1.2, negative control | r23 | `X = Y = S²`, identity versus constant | both trivial on `π₁ = 1`; degrees 1 and 0; not homotopic | asphericity needed, and assumed | none |
| Headline 1.2 | r23 | `X = S²`, `Y = S¹` | every pointed map lifts to `ℝ`, so it is null rel `x`; `φ` trivial | holds | none |
| Headline 1.1–1.2, degenerate | r23 | `X` a point | `f = const y`; exactly one pointed map | holds | none |
| 1.1 route, correction of `δ` | r23 | `X = S¹ ∨ S¹`, `Y = B(F₂)`, `φ = id` | conjugation by `w ≠ 1` is not the identity, since `Z(F₂) = 1` | Check true | none |
| Headline 1.3 | r23 | `X = Y = S¹`, `e = −1` | `F = z ↦ z̄`, `F(1) = 1`, `F_* = −1` | holds | none |
| Headline 1.3, base point not a vertex | r23 | `Y = S¹` with vertex `1`, `y = i` | the pointed `F` exists by 1.1, whose target base point is arbitrary | holds | none |
| Headline 1.3, negative control | r23 | a point and the Warsaw circle | all `πₙ` trivial on both; Warsaw circle not contractible | CW on `Y` needed, and assumed | none |
| Direction of `π₁(BG) ≃* G` | r23 | `G = S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_s ℓ_t) = t s`; `γ ↦ m(γ)⁻¹` gives `s t`; `γ ↦ m(γ)` gives `t s ≠ s t` | forced, matches pin line 77 | none |
| Direction, sign | r23 | `G = ℤ`, lift ends at `(0, 1)` | goes to `−1`; the circle loop goes to `1`, so `m = −1` | consistent; sentence unfinished | R09 |
| Deck action Check | r23 | circle, `g • mk x q = mk x (g⁻¹·q)` | lifted edge from `ṽ` to `t⁻¹ • ṽ`; boundary `(t⁻¹ − 1) ṽ` | Check true | none |
| Headline 2.3, homology | r23 | `X = S¹`, `A = k`, generator acting by a unit `u` | `H₀ = k/(u−1)k`, `H₁ = ker(u−1)` on both sides | holds | none |
| Headline 2.3, homology | r23 | `X = ℝP^∞`, `A = ℤ` with sign action | twisted: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2`; trivial: `H₁ = ℤ/2`, `H₂ = 0` | holds | none |
| Headline 2.3, negative control | r23 | `X = S² ∨ S¹`, `G = ℤ`, `A = ℤ` | `H₂(X) = ℤ`, `H₂(ℤ; ℤ) = 0` | asphericity needed, and assumed | none |
| Headline 2.3, degenerate | r23 | `k = 0`; `G = 1`, `X` contractible | both sides 0; `H₀ = A`, higher groups 0 on both sides | holds | none |
| Headline 2.3, cohomology | r23 | `X = S¹`, `A = k` with `u ≠ 1`, `N = k`, `k` a field | `H⁰ = H¹ = 0` on both sides | holds | none |
| 2.3 cohomology connecting maps | r23 | `k = ℤ`, `G = 1`, a point, `N = ℤ`, `0→ℤ→ℤ→ℤ/2→0` | `Hom(−, ℤ)`: `0 → ℤ →(·2) ℤ`, cokernel `ℤ/2`, not exact | missing hypothesis | R02 |
| 2.1 Check | r23 | `G = ℤ/2`, degrees 1 and 2 | `H₁ = ℤ/2` and `H₂ = 0` on both sides | true; `n` used twice | R09 |
| 2.2 Bockstein Check | r23 | `G = ℤ/2`, `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | `H¹(ℤ/2) → H¹(ℤ/4)` injective of order 2; next map 0; `δ` an isomorphism | Check true | none |
| 2.1 Examples, "on the nose" | r23 | torus and wedge | pinned definitions = `singularHomologyIso(h) ≫` Milnor isomorphism | holds | none |
| Free classes as items 1.1–1.2 (AlgebraicTopology 2129–2132) | new | `X = S¹`, `Y = B(S₃)` | pointed: `|Hom(ℤ, S₃)| = 6`; free: 3 classes `{e}`, `{(12),(13),(23)}`, `{(123),(132)}` | not stated here | R01 |
| Disconnected `X` "treated there" | new | `X = S¹ ⊔ S¹`, `Y = B(S₃)` | free `3 × 3 = 9`; pointed, based in the first circle, `6 × 3 = 18`; 1.1–1.2 assume `PathConnectedSpace X` | outside the hypotheses | R01 |
| Free classification, abelian control | new | `X = S¹`, `Y = S¹` | `Hom(ℤ, ℤ) = ℤ`; conjugation trivial; free = pointed = `ℤ` | cannot detect the gap; the Check must use `S₃` | R01 Check |

**Remark on untouched text** (not a finding). Scope item 1 (lines 40–45) and *Downstream consumers* (lines 782–785) describe the pointed classification only. They are consistent with Layer 1 as written; R01 asks for a change there only if the free classes are added here.

## Not verifiable

- Brown, *Cohomology of Groups*, Ch. II §4 and Ch. III §1: settled as uncertified, so cited by locator only. I read Hatcher §2.2 and §3.H instead (R05).
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified. That the Warsaw circle has trivial homotopy groups and is not contractible is standard, but the locator into the paper is not confirmed.
- Milnor, "Construction of universal bundles, II": settled as uncertified. I read `segal-1968` lines 115–127 instead, in the previous round.

## Source issues

- none
