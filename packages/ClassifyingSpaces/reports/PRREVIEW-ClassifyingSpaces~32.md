# Review of ClassifyingSpaces (pull request #1808 at 6931121)

**Verdict:** needs changes

This is a full review. Since a3b1e14, the head the previous review read, the README has changed by 430 lines (commit d1a45bff). `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` have not changed.

- Seven of the previous nine findings are repaired.
- The previous R07 and R08 stand. Here they are R04 and R05.
- The new text is mostly sound. One error is new: the degree-one clause of 2.1, and two Checks built on it, have the sign of the pinned comparison reversed (R01).
- The gate still fails on `outside-folder=2`.

## R01 (P1) — The degree-one clause of 2.1 and the circle Checks of 2.1 and 2.2 have the pinned comparison's sign reversed

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md`:
- Lines 796–798: "In degree one, the composite with the Hurewicz isomorphism is the abelianization of `Ψ`, followed by Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ`; for `X = BG` this is the pinned `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`."
- Lines 811–813: the circle Check of 2.1, "goes to … `1` under `H₁(ℤ, ℤ) ≅ ℤ`; a comparison built through `Ψ⁻¹` sends it to `−1`".
- Lines 846–847: the circle Check of 2.2, "the generator going to the homomorphism `1 ↦ 1`".

**Claim.** For `X = BG`, the comparison of 2.1 is the pinned `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` (README line 785). In degree one, that isomorphism sends the Hurewicz class of a loop `γ` to the class of the `1`-chain `Φ(γ)⁻¹`, where `Φ := TauCeti.classifyingSpaceFundamentalGroupMulEquiv G`. The class of `Φ(γ)` would be the opposite sign. So the pinned isomorphism is the *negative* of `classifyingSpaceFirstHomologyAddEquivGroupHomology` on `H₁`. Here is the computation, at the pin:

1. **Where the lift ends.** `Φ(γ) = g` exactly when the lift of `γ` from the vertex `(0, 1)` ends at `(0, g⁻¹)`, that is, at `g⁻¹ • e₀` (`ClassifyingSpace/EilenbergMacLane.lean` 77–87). So the lift `σ̃` of the loop's path chain has boundary `m • e₀ − e₀` with `m = Φ(γ)⁻¹` (`pathChain` boundary, `Singular/ModuleChains/Basic.lean` 223).
2. **How the comparison is built.** It is `IsQuotientCoveringMap.singularHomologyIsoGroupHomology` (`ClassifyingSpace/Homology.lean` 69–74). That sends `[σ]` to `[1 ⊗ σ̃]` and then applies Mathlib's `groupHomologyIso` to the resolution by the chains of `EG`, on which `g` acts by pushforward along `g • ·` (`Singular/ModuleChains/GroupHomology.lean` 242–255, `Singular/ModuleChains/Resolution.lean` 73–76).
3. **The image in the bar resolution.** Any equivariant augmented comparison to Mathlib's bar resolution sends `e₀` to some `x` with `ε(x) = 1`. It sends `σ̃` to a chain with boundary `m·x − x`. Since `d(1 ⊗ [g]) = g − 1` (`Rep.barComplex.d_single`, `Mathlib/RepresentationTheory/Homological/Resolution.lean` 348), that chain is `Σ aₕ h ⊗ [h⁻¹mh]` plus a boundary. Its coinvariant class is the `1`-chain `m`.
4. **The other pinned isomorphism.** `classifyingSpaceFirstHomologyAddEquivGroupHomology_loopClass` (`ClassifyingSpace/FirstHomology.lean` 204) gives the `1`-chain `Φ(γ)`.

No pinned theorem relates the two isomorphisms: `FirstHomology.lean` never mentions `classifyingSpaceSingularHomologyIsoGroupHomology`. The cochain comparison (`Cohomology/GroupCohomology.lean` 248–255) uses the same resolution, so the sign carries over to 2.2.

**Witness.** `G = ℤ`, `X = S¹`, `Ψ` the degree: `Φ(c_X ∘ ℓ) = 1`, so the lift ends at `(0, −1)` and 2.1 sends `ℓ` to `−1 ∈ H₁(ℤ, ℤ)`. The README says `1`, the value of `classifyingSpaceFirstHomologyAddEquivGroupHomology`.

**Repair.**
- **Lines 796–798.** Replace with: "In degree one, the composite with the Hurewicz isomorphism sends a loop `γ` at `x` to the class of the `1`-chain `Ψ(γ)⁻¹`; followed by Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ` it is `γ ↦ −[Ψ(γ)]`. For `X = BG` it is the negative of `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`."
  - Route: the lifted-path computation above.
  - Add to *Needs:* `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology_loopClass`, `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff`, and Mathlib `Rep.barComplex.d_single`.
- **Lines 811–813.** The counterclockwise loop goes to `−1`, and a comparison built through `Ψ⁻¹` sends it to `1`. The two pinned isomorphisms differ by `−1` on this class.
- **Lines 846–847.** Name the class: "the class taking the value `1` on the counterclockwise loop goes to the homomorphism `1 ↦ −1`; through `Ψ⁻¹`, to `1 ↦ 1`".
- Keep these Checks on `ℤ`: in `ℤ/2` the two signs coincide.
- **Tested** on the refuting instance (`G = ℤ`, `X = S¹`, `Ψ` the degree): the corrected bullet and both corrected Checks all give `−1`, as steps 1–3 compute.

## R02 (P3) — The Layer 2 headlines require a vertex base point, which neither the sources nor the statement need

**Location.**
- `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 121 and 137: `(_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)`.
- README line 769: "`(X, x)` is a Hausdorff CW `K(G, 1)` with base point a vertex".

**Claim.**
- The two `Nonempty` statements of 2.3 hold at every base point. The vertex is used only by the route, through `c_X` of 1.3.
- Hatcher §3.H (`hatcher-at` lines 14326–14328) defines local coefficients for any path-connected space with a universal cover, and Brown Ch. III §1 places no condition on the base point.
- So the headline is narrower than its sources, and a consumer holding a non-vertex base point must transport the statement itself.

**Witness.** Take `X = S¹` with its single vertex at `1`, `x = i`, `Ψ` the degree and any `A`. Both sides are `Hₙ(ℤ, A)`, yet `_hx` fails at `i`.

**Repair.**
- Delete `_hx` from both headlines, and "with base point a vertex" from the README's statement of them. Keep the vertex for `c_X`.
- Open the route of 2.3 with a reduction to a vertex:
  1. Choose a vertex `v` and a path `p` from `v` to `x`, and set `Ψ' := Ψ ∘ fundamentalGroupMulEquivOfPath p`.
  2. `TauCeti.IsAspherical.of_basepoint` gives asphericity at `v`.
  3. `TauCeti.LocalCoefficientSystem.basepointChangeEquiv` (`LocalCoefficient.lean` 448), with `ofRepresentationMonodromyIso` and the functoriality bullet of 2.3, gives `ofRepresentation v (A ∘ Ψ') ≅ ofRepresentation x (A ∘ Ψ)`.
- **Tested** on `x = i`: the reduction lands at the vertex `1` with `Ψ'` the degree, and both sides are `Hₙ(ℤ, A)`.

## R03 (P3) — The connecting maps of 2.3, and the naturality that transports them, are not named

**Location.** README lines 910–917 ("the isomorphisms carry its connecting map to `groupHomology.δ` … with the naturality of connecting maps of short exact sequences of chain complexes"), lines 931–933, and the *Needs:* line, lines 939–960.

**Claim.** Line 454 says every pinned declaration a route uses is named at its target. Three inputs of 2.3 are not:
- the topological connecting map of `0 → L_{A₁} → L_{A₂} → L_{A₃} → 0`, which is pinned;
- the transport of that connecting map along `L_{Aᵢ} ≅ c_X^* L`;
- its transport along the map induced by `c_X`.

**Witness.** Each of the following resolves at the pin, and none appears in the README:
- `CategoryTheory.ShortComplex.ShortExact.twistedHomologyδ` (`Singular/Twisted/Coefficients.lean` 151) and `…twistedHomologyδ_naturality` (line 191);
- `TauCeti.LocalCoefficientSystem.twistedCohomologyBockstein_eq_δ` (`Cohomology/Twisted/Bockstein.lean` 92);
- Mathlib `HomologicalComplex.HomologySequence.δ_naturality` (`HomologySequenceLemmas.lean` 56).

**Repair.**
- Call the connecting map `ShortExact.twistedHomologyδ` in the statement.
- In the route, use `twistedHomologyδ_naturality` for `L_{Aᵢ} ≅ c_X^* L`. Use Mathlib `δ_naturality` for `c_X`, in homology and, through `twistedCohomologyBockstein_eq_δ`, for the Bockstein.
- Add all four names to the *Needs:* line.
- **Tested** on `G = ℤ/2`, `k = ℤ`, `0 → ℤ → ℤ → ℤ/2 → 0` (multiplication by `2`, then reduction) with trivial action: both connecting maps `H₁ → H₀` are `0`, since they go from `ℤ/2` to `ℤ`.

## R04 (P3) — #1854 and #1187 change this folder with conflicting heads, and the description orders neither

Carried from the previous report (its R07); not repaired, and not marked as settled by any repair report.

**Location.** The merge-order paragraph of the pull-request description: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** `scratch/overlaps.md` lists #1187 and #1854 as changing `TauCetiRoadmap/ClassifyingSpaces/README.md` and `Suggested.lean`, with heads that conflict with this one.

**Witness.** `roadmaps show ClassifyingSpaces --pr 1854` prints a 539-line Stage-form README. `--pr 1187` prints main's 304-line README with a pin bump.

**Repair.** State the order in the description. For example: #1854 drops its ClassifyingSpaces changes and rebases on this pull request; #1187 rebases on this one, or this folder's `Suggested.lean` is re-elaborated on #1187's pin.

## R05 (P3) — Two files outside the pull request's folders are edited, and the gate fails

Carried from the previous report (its R08); not repaired.

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** Neither folder is one of this pull request's own.

**Witness.** The worker's gate at 6931121 reports `outside-folder=2 … FAIL` for exactly these two files. `git diff origin/main...HEAD` shows a one-line change in each.

**Repair.** Move both one-line edits to a pull request of their own, or name the two folders as this pull request's own. The SymplecticGeometry line should read "consumed by HeegaardFloer and DGFloer".

## Previous findings (review of a3b1e14)

- **R01 (free classes, disconnected sources): repaired.**
  - Lines 645–674 add the corollary paragraph. It reads "induces a bijection from the set of such homomorphisms modulo post-composition with inner automorphisms of `π₁(Y, y)` onto the set `[X, Y]`". The componentwise reduction follows it, with its route (`IsClopen.pathComponent`, `CWComplex.Subcomplex.mk'`, `TauCeti.cwComplexUniv`).
  - Checks are at lines 687–702. Scope item 1 (lines 40–46) and *Downstream consumers* (lines 1017–1021) name the free classes.
  - AlgebraicTopology lines 2129–2134 now cite a statement that exists here.
- **R02 (cohomology connecting maps): repaired.** Lines 918–927: "the connecting maps on this side come from a short exact sequence of values … for `A` projective over `k`". This matches the pinned `[Module.Projective k A]` and `[∀ x, Projective (L.obj x)]`.
- **R03 (route of 2.3, transport, Scope): repaired.**
  - Lines 891–893 name `pullback_monodromyRepresentation` and `associatedLocalSystemFiberIso`.
  - Lines 874–881 own the functoriality of `ofRepresentation`.
  - Scope item 3 (lines 57–61) now reads "natural in `(X, Ψ)` along pointed maps for trivial coefficients … natural in the coefficients throughout".
- **R04 (route of 1.2): repaired.**
  - Line 632 names `Path.Homotopic.map_trans_evalAt`, whose pinned type (Mathlib `InducedMaps.lean` 39) is exactly the path square the route uses.
  - The `exists_path_fundamentalGroupMulEquivOfPath_map_comp` entry is gone.
- **R05 (locators of Layer 2, page of the maximal tree): repaired.** Lines 778–781, 829–832 and 867–871 cite Hatcher §2.2 p. 148, §3.H p. 328, Example 3H.1 p. 329, and Brown II §4 and III §1. Line 179 reads "pp. 90–91; on p. 91".
- **R06 (old → new numbering): repaired.** Lines 113–166 map Stages 1–4 and items 1–19 to pinned names or layers. Each of its 42 pinned names resolves (see below). The mapping matches main's item headings (main README lines 110–255).
- **R07 (merge order of #1854 and #1187): not repaired.** The description still reads "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**". This is R04 above.
- **R08 (outside-folder edits): not repaired.** The gate still reads `outside-folder=2 … FAIL`. This is R05 above.
- **R09 (unfinished sentence, `n` used twice, process wording): repaired.**
  - Lines 225–228: "so `TauCeti.circleToClassifyingSpace` wraps the circle around a loop `γ` with `m(γ) = −1`".
  - Line 814: "`G = ℤ/m`, `m ≥ 2`".
  - Lines 10–16 now read "The roadmap is built on … Tau Ceti provides". `grep` finds none of "already builds", "planned again" or "What remains".

## Verified sound

**Gate.**
- The worker's gate at 6931121 has every counter at 0 except `outside-folder=2` (R05).
- My own run of `gate … --base origin/main` also has every content counter at 0. It reports `outside-folder=26` because it also counts this pull request's 14 declared folders. Its only non-declared entries are the same two files.

**Dependency check**, verbatim: `depcheck: 238 roadmaps, 2345 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ClassifyingSpaces is on main and is not listed in `ORDER.txt`.

**Elaboration.**
- `lake env lean …/ClassifyingSpaces/Suggested.lean` exits 0 in 3.6 s. The only warnings are four `declaration uses sorry`, at lines 81, 98, 118 and 134.
- A scratch file importing the module and running `#check @` on the four declarations prints types identical to `scratch/signatures.md`. Each keeps `T2Space`, `Topology.CWComplex Set.univ`, the vertex hypothesis, `IsAspherical` and, where it is used, `PathConnectedSpace`. No binder is lost.
- Imports: `import Mathlib` plus four `TauCeti.*` modules, each with an object file at the pin.

**Padding probe.** I replaced each `sorry` with `first | simp | rfl | infer_instance | aesop | exact ⟨_, rfl, fun _ => rfl⟩` in a scratch copy. All four fail: unsolved goals at lines 89, 127 and 142, and a type mismatch at line 105. None is padding.

**Headlines.** The Summary (lines 25–28) names four headlines, and `Suggested.lean` states all four.
- The trivial-coefficient existence statements are named in the module docstring as theorems of the pin by transport.
- The free-class description of 1.2 is a deduction from the 1.1–1.2 headline and Hatcher 4A.2. I did not count it as a separate headline.

**Library names.**
- I extracted every backticked Lean name of the README and `#check`ed them in one scratch file: 194 names, 0 errors. A second file covered the 7 names with `δ`: 0 errors.
- Opened at the pin for the new text:
  - Mathlib:
    - `Path.Homotopic.map_trans_evalAt` (`AlgebraicTopology/FundamentalGroupoid/InducedMaps.lean` 39);
    - `IsClopen.pathComponent` (`Topology/Connected/LocallyPathConnected.lean` 108). It needs `LocallyPathConnectedSpace`, supplied through `DeltaGeneratedSpace` (`Topology/Compactness/DeltaGeneratedSpace.lean` 52) from `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`;
    - `CWComplex.Subcomplex.mk'` (`Topology/CWComplex/Classical/Basic.lean` 779): closed cells inside `E`, and open cells covering `E`;
    - `CWComplex.Subcomplex.instCWComplex` (`Classical/Subcomplex.lean` 123).
  - Tau Ceti:
    - `TauCeti.cwComplexUniv` (`Topology/CWComplex/Comparison.lean` 196);
    - `TauCeti.LocalCoefficientSystem.monodromyFunctor` (`LocalCoefficient.lean` 419) and `pullback_monodromyRepresentation` (395);
    - `ofRepresentation_map_apply`, whose action is `ρ` of `pathFromBase y ≫ p ≫ (pathFromBase z)⁻¹`, so an intertwiner commutes with transport;
    - `IsQuotientCoveringMap.associatedLocalSystem`, whose fibre is `(A ⊗ k[p⁻¹ x])_G` (`QuotientCovering/Basic.lean` 171), with `associatedLocalSystemFiberIso` (`QuotientCovering/Exact.lean` 52) and `monodromy_smul` (`QuotientCovering/Basic.lean` 61);
    - `twistedCohomologyBockstein`, which needs projective fibres (`Cohomology/Twisted/Bockstein.lean` 86);
    - `killHomotopyGroupsIncl` (`KillHomotopyGroups.lean` 174) and `killHomotopyGroupsFundamentalGroupMulEquiv` (301);
    - `cellularClassifyingSpaceBasepoint` (`Cellular.lean` 117);
    - `torusSingularHomologyIsoGroupHomology` (`Torus.lean` 172) and `wedgeCirclesSingularHomologyIsoGroupHomology` (`WedgeCircles.lean` 227).
  - For R01: `EilenbergMacLane.lean` 64–87, `Homology.lean` 69–74, `Singular/ModuleChains/GroupHomology.lean` 242–255, `Resolution.lean` 73–76, `Singular/ModuleChains/Basic.lean` 223, `FirstHomology.lean` 9–30 and 97–212, Mathlib `Homological/Resolution.lean` 343–351 and `GroupHomology/Basic.lean` 181 and 254.

**Seeded sample** (`hatcher-at`). Each locator was checked for its theorem number, printed page, hypotheses and support.
- **1.1 and 1.2.** Proposition 1B.9, p. 90 (lines 3905–3907; the page header at line 3884 reads "90"), with its proof on pp. 90–91. The maximal-tree step is on p. 91 (lines 3938–3942). The aspherical target is supported, because the proof uses `Y` only through `π_{n−1}(Y) = 0` (lines 3928–3931).
- **Free classes in 1.2.** Proposition 4A.2, p. 422 (lines 18238–18240; page header line 18226). §1.1 Exercise 6, p. 38 (lines 1745–1751; page header line 1721).
- **1.3.** Theorem 1B.8, p. 90 (line 3897), deduced at lines 3908–3911.
- **2.1.** §2.2 "Homology of Groups", p. 148 (lines 6471–6479).
- **2.2 and 2.3.** §3.H "Local Coefficients via Modules", p. 328 (lines 14326–14328), and Example 3H.1, p. 329 (lines 14373–14383).
- **References.** Proposition 0.16, p. 15 (line 818; header line 798) and Proposition 4.22, p. 357 (line 15549; header line 15524).
- Brown is uncertified, so cited by locator only (see *Not verifiable*).

**Cross-roadmap citations, resolved at this head.**
- AlgebraicTopology lines 101–110, 2110–2134 and 2504 cite items 1.1–1.3 and, at lines 2129–2134, the free classes and the componentwise case. All exist here.
- CharacteristicClasses line 155 refers to ClassifyingSpaces' discrete-group countable-join model. AlgebraicTopology line 155 consumes 8.8b's normalised `ℤ/2` model, as README lines 1022–1023 say.
- FreeGroupsAndLimitGroups on main cites "Stage 2 item 7" and "Stage 2.7" at lines 40, 2413, 2554 and 2771. These resolve through README line 134.

**Overlap facts** (`scratch/overlaps.md`, each item checked).
1. Pull requests changing this folder: #1187, #1807 and #1854. #1807 is in the stated order; the other two are R04.
2. Ids this README cites that an open pull request drops: none.
3. Ids defined only by an open revision: none.
4. `#stage-2-the-cellular-model`, which this pull request drops and FreeGroupsAndLimitGroups cites, now has its old → new line.
5. Closest roadmaps in vocabulary: AlgebraicTopology at #1652, #1663, #1797, #1807 and #1854.
   - `roadmaps grep` shows that the AlgebraicTopology heads at #1652, #1663, #1797 and #1807 still plan `[X,Bπ]_*` and the conjugation orbits themselves (#1652 lines 3008–3009, #1663 lines 2292–2293, #1797 lines 2459–2460, #1807 lines 2078–2079), as AlgebraicTopology on main does (carried in #1187, line 1850).
   - This pull request's own AlgebraicTopology folder hands both to item 1.2 here. The remaining conflict is between those revisions and this pull request's AlgebraicTopology folder, and belongs to that folder's review.
   - StableHomotopyKTheory #1227 line 483 consumes the conjugation-orbit description, which is now owned at item 1.2.

**Adversarial table.** Every row is computed for this head.

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Headline 1.1, existence | `X = S¹` with one vertex, `Y = S¹`, `φ = ·2` | `z ↦ z²`: `f(1) = 1`, `f_* = 2` / `φ = 2` | holds | none |
| 2 | 1.1, target not CW | `X = S¹`, `Y = ℝP^∞`, `φ : ℤ ↠ ℤ/2` | `ℝP¹ ⊂ ℝP^∞` induces `1 ↦ 1 mod 2` / `φ(1) = 1` | holds | none |
| 3 | 1.2, negative control | `X = Y = S²`, the identity and a constant map | both trivial on `π₁`; degrees `1 ≠ 0` | asphericity needed, and assumed | none |
| 4 | 1.1–1.2, degenerate | `X` a point | one homomorphism `1 → π₁Y` / one pointed map, `const_y` | holds | none |
| 5 | 1.2 free classes, non-abelian target | `X = S¹`, `Y = B(S₃)` | 6 pointed classes, 3 conjugation orbits / 3 conjugacy classes (Hatcher §1.1 Exercise 6) | holds | none |
| 6 | 1.2 free classes, rank two | `X = S¹ ∨ S¹`, `Y = B(S₃)` | `|Hom(F₂, S₃)| = 36`; Burnside `(36 + 3·2² + 2·3²)/6 = 11` / 11 orbits of simultaneous conjugation | holds | none |
| 7 | 1.2 free classes, abelian target | `X = Y = S¹` | `Hom(ℤ, ℤ)` mod conjugation is `ℤ` / `[S¹, S¹] = ℤ` by degree | holds; cannot detect the quotient, as the Check says | none |
| 8 | 1.2, disconnected source | `S¹ ⊔ S¹`; `ℕ` discrete; `∅`, all into `B(S₃)` | `3·3 = 9`, `1`, `1` / 4A.2: `6·3 = 18` pointed, 9 orbits; `1`; `1` | holds | none |
| 9 | 1.2, path-square step | `K` from `g` to `g'`, trace `(g∘σ_v)⁻¹·(f∘σ_v)` at `v`, constant at `x` | `(g∘σ_v)·K(v) ≃ f∘σ_v` / `K(x)·(g'∘σ_v) = g'∘σ_v` | equal; matches the type of `map_trans_evalAt` | none |
| 10 | Headline 1.3 | `X = Y = S¹`, `e = −1` | `F = z ↦ z̄`: `F(1) = 1`, `F_* = −1` / `e = −1` | holds | none |
| 11 | 1.3, negative control | a point and the Warsaw circle | all `πₙ` trivial on both; the Warsaw circle is not contractible | CW on `Y` needed, and assumed | none |
| 12 | 1.3 Check, `X = BG` | `b₀` the orbit of the vertex `(0, 1)` | a `0`-cell by `classifyingSpaceCellEquiv` in dimension 0; `c_X ≃ id` relative to `b₀` | holds | none |
| 13 | Direction of `Φ` | `G = S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_s ℓ_t) = ts`; `γ ↦ m⁻¹` gives `st` = product / `γ ↦ m` gives `ts ≠ st` | forced; matches `EilenbergMacLane.lean` 77 | none |
| 14 | Circle sentence (repaired R09) | `G = ℤ` | circle loop ↦ `1`, so its lift ends at `(0, −1)` and `m = −1` | complete and true | none |
| 15 | 2.1 in degree one | `G = ℤ`, `X = S¹`, `Ψ` the degree, `k = ℤ` | 2.1 via the pin: the lift ends at `(0, −1)`, giving the `1`-chain `−1`, so `−1` / README: `+1`; `FirstHomology…loopClass`: `+1` | sign false | R01 |
| 16 | 2.1 in degree one, `ℤ/2` | `G = ℤ/2` | `[g⁻¹] = [g]`, both `1` | cannot detect the sign | R01 (the Check stays on `ℤ`) |
| 17 | 2.2 circle Check | `u` with `⟨u, ℓ⟩ = 1`, `M = k` | `φ(m(ℓ)) = φ(−1) = 1`, so `φ = (1 ↦ −1)` / README: `1 ↦ 1` | sign false; generator unnamed | R01 |
| 18 | 2.1 Check, `ℤ/m` | `m = 3`, `k = ℤ` | `H₁`: `ℤ/3` on both sides; `H₂`: 0 (pinned even-degree vanishing) / 0 (`ker N / im(1−t) = 0`) | holds | none |
| 19 | 2.2 Bockstein Check | `G = ℤ/2`, `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | `Hom(ℤ/2, ℤ/2) → Hom(ℤ/2, ℤ/4)` injective between groups of order 2; next map 0; `δ` injective, order 2 | Check true | none |
| 20 | Headline 2.3, homology | `X = S¹`, `A = k`, generator acting by `u` | `H₀ = k/(u−1)k`, `H₁ = ker(u−1)` / the same from `k[ℤ] →(t−1) k[ℤ]` | holds | none |
| 21 | Headline 2.3, homology | `X = ℝP^∞`, `A = ℤ` with the sign action | differentials `·2, 0, ·2`: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2` / trivial action: `ℤ`, `ℤ/2`, `0` | holds; the Check is right | none |
| 22 | 2.3, negative control | `X = S² ∨ S¹`, `G = ℤ`, `A = ℤ` | `H₂(X) = ℤ` / `H₂(ℤ, ℤ) = 0` | asphericity needed, and assumed | none |
| 23 | Headline 2.3, cohomology | `X = S¹`, `k` a field, `u ≠ 1`, `N = k` | `Homₖ(A, k)` has action `u⁻¹`; `H⁰ = ker(u⁻¹−1) = 0`, `H¹ = coker = 0` / 0, 0 | holds | none |
| 24 | 2.3, cohomology Bockstein (repaired R02) | `k = ℤ`, `G = 1`, `0 → ℤ → ℤ → ℤ/2 → 0` in `N` | `A = ℤ`: `Hom(ℤ, Nᵢ) = Nᵢ`, exact / `A = ℤ/2`: `0 → 0 → ℤ/2`, not exact | projectivity needed and stated; matches the pin | none |
| 25 | 2.3, functoriality of `ofRepresentation` | `X = S¹`, `A = A' = k` with `u`, `f = ·c`; `f = id` with `u' ≠ u` | `H₀`: `·c` on `k/(u−1)` on both sides / `u'·1 ≠ 1·u` | holds; the negative control is right | none |
| 26 | 2.3 route, monodromy of `L` at `b₀` | the associated system, fibre `(A ⊗ k[p⁻¹ b₀])_G` | `[a ⊗ m e₀] = [m⁻¹a ⊗ e₀]`, so transport is `A(Φ(γ))`; on `S₃`, `A ∘ m` would be an anti-homomorphism | the route's "`A` composed with `Φ`" is right | none |
| 27 | Layer 2 base point | `X = S¹` with vertex `1`, `x = i` | both sides are `Hₙ(ℤ, A)`; `_hx` false at `i` | true without the hypothesis | R02 |
| 28 | 2.3 connecting maps | `G = ℤ/2`, `k = ℤ`, `0 → ℤ →(·2) ℤ → ℤ/2 → 0`, trivial action | `δ : H₁(G, ℤ/2) = ℤ/2 → H₀(G, ℤ) = ℤ` is 0 on both sides | holds; inputs unnamed | R03 |
| 29 | 2.3, degenerate | `k = 0`; `G = 1` with `X` contractible | `0 = 0`; `H₀ = A` and higher groups 0 on both sides | holds | none |

## Not verifiable

- **Brown, *Cohomology of Groups*, Ch. II §4 and Ch. III §1** (items 2.1–2.3). Settled as uncertified, so cited by locator only. In their place I read Hatcher §2.2 and §3.H, which support the topological side.
- **Schwamberger–Vogt 2009, §2** (the Warsaw circle). Settled as uncertified. The fact itself is standard, but the locator is unconfirmed.
- **Milnor 1956.** Settled as uncertified; the README cites it only for the pinned model.
- **Segal 1968, §3.** Readable (`segal-1968`), but outside the seeded sample, and the passage is unchanged since earlier rounds checked it.

## Source issues

- none
