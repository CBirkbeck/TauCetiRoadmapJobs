# Review of ClassifyingSpaces (pull request #1808 at 88e5eaa)

**Verdict:** needs changes

This is an incremental re-review. The previous review (r37) read dc47c7e. Since then this folder has changed by 0 lines: `git diff --stat dc47c7e HEAD -- TauCetiRoadmap/ClassifyingSpaces lake-manifest.json lean-toolchain` is empty, so the pins are unchanged too. The 21 commits since dc47c7e touch only the sibling folders this pull request declares. The pull-request description is unchanged.

None of r37's five findings is repaired, and no repair report marks any of them as not actionable. Each is written again below under its old number. I re-checked every witness at this head: R01 by re-deriving the sign from the pinned files, R04 against the other open heads as they are today, and R05 against the gate and the outside-folder diff. The changed sibling folders introduce no new finding for this folder. Three remarks on text the previous reviews passed are under *Verified sound*.

## R01 (P1) — The degree-one clause of 2.1 and the circle Checks of 2.1 and 2.2 have the pinned comparison's sign reversed

Carried from r37 (its R01); not repaired.

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md`:
- Lines 796–798: "In degree one, the composite with the Hurewicz isomorphism is the abelianization of `Ψ`, followed by Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ`; for `X = BG` this is the pinned `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`."
- Lines 811–813: the counterclockwise loop goes "to `1` under `H₁(ℤ, ℤ) ≅ ℤ`; a comparison built through `Ψ⁻¹` sends it to `−1`".
- Lines 846–847: "the generator going to the homomorphism `1 ↦ 1`".

**Claim.** For `X = BG`, 2.1 is the pinned `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` (README lines 774–777). Write `Φ := TauCeti.classifyingSpaceFundamentalGroupMulEquiv G`. In degree one, the pinned isomorphism sends the class of a loop `γ` to the class of the `1`-chain `Φ(γ)⁻¹`. That is the negative of `classifyingSpaceFirstHomologyAddEquivGroupHomology`. I re-derived it at the pin:

1. **Where the lift ends.** `Φ(γ) = g` exactly when the lift of `γ` from `e₀ = (0, 1)` ends at `(0, g⁻¹)` (Tau Ceti `ClassifyingSpace/EilenbergMacLane.lean` 77–87). That vertex is `g⁻¹ • e₀` (`Action.lean` 109).
2. **The boundary of the lifted chain.** `∂(pathChain g) = g(1) − g(0)` (`Singular/ModuleChains/Basic.lean` 223–225). So the lifted chain `σ̃` has `∂σ̃ = m·e₀ − e₀`, with `m = Φ(γ)⁻¹`.
3. **How `G` acts.** `g` acts on chains of `EG` by pushing forward along `g • ·` (`Singular/ModuleChains/Resolution.lean` 69–86).
4. **How the comparison is built.** `[σ]` goes to `[1 ⊗ σ̃]`, through `singularChainsRepCoinvariantsTensorIso`. Then `(groupHomologyIso _ n (singularChainsResolution …)).symm` is applied (`Singular/ModuleChains/GroupHomology.lean` 214–251).
5. **The image in the bar resolution.**
   - Mathlib's bar differential is `d(1 ⊗ [g]) = g − 1` (`RepresentationTheory/Homological/Resolution.lean` 348–351).
   - So an augmented comparison sends `σ̃` to `1 ⊗ [m] + (m − 1)z` plus a cycle, and the `(m − 1)z` term dies in coinvariants.
   - `coinvariantsTensorFreeToFinsupp_mk_tmul_single` (`Coinvariants.lean` 469–472) then gives the `1`-chain `single m 1`.
6. **The other pinned isomorphism.** `classifyingSpaceFirstHomologyAddEquivGroupHomology_loopClass` gives `single Φ(γ) 1` (`FirstHomology.lean` 204–210). That is the opposite class in `H₁(G, ℤ)`.

The cochain comparison uses the same resolution (`Cohomology/GroupCohomology.lean` 248–255), so 2.2 has the same sign.

**Witness.** `G = ℤ`, `X = S¹`, `Ψ` the degree, so `Φ(c_X ∘ ℓ) = 1`. The lift ends at `(0, −1)`, and 2.1 sends `ℓ` to `−1 ∈ H₁(ℤ, ℤ)`. The README says `1`.

**Repair.**
- **Lines 796–798.** Replace with: "In degree one, the composite with the Hurewicz isomorphism sends a loop `γ` at `x` to the class of the `1`-chain `Ψ(γ)⁻¹`; followed by Mathlib's `H₁(G, ℤ) ≅ Gᵃᵇ` it is `γ ↦ −[Ψ(γ)]`. For `X = BG` it is the negative of `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`."
- **The *Needs:* line of 2.1.** Add `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology_loopClass`, `TauCeti.classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` and Mathlib `Rep.barComplex.d_single`.
- **Lines 811–813.** The counterclockwise loop goes to `−1`, and through `Ψ⁻¹` it goes to `1`. The two pinned isomorphisms differ by `−1` on this class.
- **Lines 846–847.** "The class taking the value `1` on the counterclockwise loop goes to the homomorphism `1 ↦ −1`; through `Ψ⁻¹`, to `1 ↦ 1`."
- Keep these Checks on `ℤ`: over `ℤ/2` the two signs agree.

Tested on the refuting instance: with these changes, the bullet and both Checks give `−1`, as steps 1–5 compute.

## R02 (P3) — The Layer 2 headlines require a vertex base point, which neither the sources nor the statement need

Carried from r37 (its R02); not repaired.

**Location.**
- `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` lines 121 and 137: `(_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)`.
- README line 769: "`(X, x)` is a Hausdorff CW `K(G, 1)` with base point a vertex".

**Claim.** Both `Nonempty` statements of 2.3 hold at every base point. Only the route uses the vertex, through `c_X`. Hatcher §3.H (`hatcher-at` line 14326) places no condition on the base point, and neither does Brown Ch. III §1.

**Witness.** `X = S¹` with its single vertex at `1`, and `x = i`. Both sides are `Hₙ(ℤ, A)`, but `_hx` is false at `i`.

**Repair.**
- Delete `_hx` from both Layer 2 headlines, and "with base point a vertex" from the README's statement of them. Keep the vertex for `c_X`.
- Open the route of 2.3 with a reduction to a vertex `v`, along a path `p` from `v` to `x`:
  - `Ψ' := Ψ ∘ fundamentalGroupMulEquivOfPath p` (Mathlib `FundamentalGroup.lean` 48);
  - `TauCeti.IsAspherical.of_basepoint` (`EilenbergMacLane/Basic.lean` 90);
  - `TauCeti.LocalCoefficientSystem.basepointChangeEquiv` (`LocalCoefficient.lean` 448), with `ofRepresentationMonodromyIso` (`LocalCoefficient/Representation.lean` 122) and the functoriality bullet of 2.3.

Tested at `x = i`: the reduction gives `v = 1` with `Ψ'` the degree, and both sides are `Hₙ(ℤ, A)`.

## R03 (P3) — The connecting maps of 2.3, and the naturality that transports them, are not named

Carried from r37 (its R03); not repaired.

**Location.** README lines 913–917, "the isomorphisms carry its connecting map to `groupHomology.δ` … with the naturality of connecting maps of short exact sequences of chain complexes". Also lines 931–933, and the *Needs:* line at lines 939–960.

**Claim.** The route uses three inputs that the README does not name:
- the pinned topological connecting map;
- its transport along `L_{Aᵢ} ≅ c_X^* L`;
- its transport along `c_X`.

**Witness.** These names all resolve at the pin, and `grep -c` finds none of them in the README:
- `CategoryTheory.ShortComplex.ShortExact.twistedHomologyδ` (`Singular/Twisted/Coefficients.lean` 151);
- `…twistedHomologyδ_naturality` (line 191);
- `TauCeti.LocalCoefficientSystem.twistedCohomologyBockstein_eq_δ` (`Cohomology/Twisted/Bockstein.lean` 92);
- Mathlib `HomologicalComplex.HomologySequence.δ_naturality` (`HomologySequenceLemmas.lean` 56).

**Repair.**
- Name `ShortExact.twistedHomologyδ` in the statement.
- In the route:
  - use `twistedHomologyδ_naturality` for `L_{Aᵢ} ≅ c_X^* L`;
  - use `δ_naturality` for `c_X`;
  - in cohomology, use `δ_naturality` through `twistedCohomologyBockstein_eq_δ`.
- Add all four names to *Needs:*.

Tested on `G = ℤ/2`, `k = ℤ` and `0 → ℤ →(·2) ℤ → ℤ/2 → 0` with the trivial action: both connecting maps `H₁ → H₀` go from `ℤ/2` to `ℤ`, so both are `0`.

## R04 (P3) — #1854 and #1187 change this folder with conflicting heads, and the description orders neither

Carried from r37 (its R04, originally r29's R07); not repaired.

**Location.** The merge-order paragraph of the pull-request description: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** `scratch/overlaps.md`, computed today from the heads, lists #1187 and #1854 as changing this folder's `README.md` and `Suggested.lean`, each with a head that conflicts with this one. #1807 is ordered; #1187 and #1854 are not.

**Witness.** `roadmaps show ClassifyingSpaces --pr 1854` now prints a different, 604-line README whose Layer 2 is "comparison with the nerve model". With `--pr 1187` it prints main's 303-line Stage-form README, beside a pin bump.

**Repair.** State the order in the description. For example:
- #1854 drops its ClassifyingSpaces changes and rebases on this pull request;
- #1187 rebases on this one, or this folder's `Suggested.lean` is re-elaborated on #1187's pin.

## R05 (P3) — Two files outside the pull request's folders are edited, and the gate fails

Carried from r37 (its R05); not repaired.

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation."
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** Neither folder is one of this pull request's own.

**Witness.**
- The worker's gate at 88e5eaa reports `outside-folder=2 … FAIL`, naming exactly these two files.
- `git diff --stat origin/main...HEAD`, with the 15 declared folders excluded, shows one changed line in each.

**Repair.** Move both one-line edits into a pull request of their own, or name the two folders as this pull request's own. The SymplecticGeometry line should read "consumed by HeegaardFloer and DGFloer".

## Previous findings

- R01 — not repaired: README lines 796–798 still read "the composite with the Hurewicz isomorphism is the abelianization of `Ψ` … for `X = BG` this is the pinned `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`"; the Checks at 811–813 and 846–847 are unchanged. Carried as R01.
- R02 — not repaired: `Suggested.lean` lines 121 and 137 still carry `(_hx : x ∈ Topology.RelCWComplex.skeletonLT (Set.univ : Set X) 1)`; README line 769 still says "with base point a vertex". Carried as R02.
- R03 — not repaired: README lines 916–917 still say "with the naturality of connecting maps of short exact sequences of chain complexes"; `twistedHomologyδ` and `δ_naturality` are still absent from *Needs:* (lines 939–960). Carried as R03.
- R04 — not repaired: the description still reads "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**"; #1187 and #1854 still conflict in this folder. Carried as R04.
- R05 — not repaired: the worker's gate still reads `outside-folder=2 … FAIL` for `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`. Carried as R05.

## Verified sound

**What changed.**
- `git log dc47c7e..HEAD` lists 21 commits. `git diff --stat dc47c7e HEAD` lists 25 files, in AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ComplexKahlerGeometry, LocalPurity, ModularCurves, PadicFunctionalAnalysis, PurityOfBranchLocus, ReductiveGroups, RigidAnalyticGeometry, SchemeAndStackFoundations and TopologicalKTheory. All of them are folders of this pull request.
- The same diff restricted to `TauCetiRoadmap/ClassifyingSpaces`, `lake-manifest.json` and `lean-toolchain` is empty. So every pinned name r37 resolved still resolves at the same pin.

**Citations of this roadmap in the changed folders.** I grepped every folder of the worktree for `ClassifyingSpaces`.
- **AlgebraicTopology.** README lines 100–109 and 2444–2466 consume items 1.1–1.3, the classification `[X, Bπ]_*`, the free classes and the componentwise treatment. That is exactly what README lines 85–93 and 1018–1021 say this roadmap owns. Stage 8.8b exists (line 2440ff.). None of these lines changed since dc47c7e. AlgebraicTopology's `Suggested.lean` does not state 1B.9: no `HomotopicRel`, `mapOfEq` or `IsEilenbergMacLaneSpaceOne` occurs in it.
- **CharacteristicClasses.** Lines 59–61 and 778–779 are as r37 checked them. The new lines 490–494 (a `From TauCetiRoadmap.ClassifyingSpaces` contract), 828–829 and 1369 cite the weak-topology countable join for finite discrete `G`, with no section id, so nothing can break.
- **FreeGroupsAndLimitGroups** cites `#stage-2-the-cellular-model`. The old → new mapping at README lines 133–134 still covers it.
- No other changed folder mentions this roadmap. No `Suggested.lean` in the worktree declares a name in `TauCetiRoadmap.ClassifyingSpaces`, or any of the four headline names.

**Remarks on untouched text, recorded only; none needs a change for this verdict.**
- *CharacteristicClasses contract.* CharacteristicClasses' new contract (its lines 490–494) credits this roadmap with "the weak-topology countable join model". That model is the pinned `TauCeti.classifyingSpace` (Tau Ceti `ClassifyingSpace/Basic.lean` 73; the weak topology is at `CountableJoin.lean` 40). README lines 10–16 consume it. So the attribution is a matter for that folder's review.
- *Downstream line on CharacteristicClasses.* This README's line 1021–1022 says CharacteristicClasses consumes only "the classifying space of `ℤ/2`". At both dc47c7e and this head, it compares the join for every finite discrete `G` (its line 778).
- *Open revision #1652.* The open AlgebraicTopology revision #1652 (another author) still claims the classification `[X, Bπ]_* ≃ Hom(π₁X, π)` for AlgebraicTopology 8.8, at its README line 3686, and says nothing of ClassifyingSpaces is consumed (its line 138). This pull request moves that claim here. The two AlgebraicTopology revisions settle it in that folder's review.

**Gate.**
- The worker's gate at 88e5eaa has every counter at 0, including `build=0`, except `outside-folder=2` (R05).
- My own run of `gate … --base origin/main` exits 1 in 6.3 s. Every content counter is 0. It reports `outside-folder=30` because it also counts the files of the 14 sibling folders this pull request declares. With those excluded, `git diff --stat` leaves only the two files of R05.

**Dependency check**, verbatim: `depcheck: 236 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ClassifyingSpaces is on main and is not listed in `ORDER.txt`.

**Elaboration.**
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 11 s. The only output is four `declaration uses sorry` warnings, at lines 81, 98, 118 and 134.
- I appended `#check @` for the four declarations to a scratch copy and elaborated it. The types printed are identical to `scratch/signatures.md`. Each keeps `T2Space`, `Topology.CWComplex Set.univ`, the vertex hypothesis and `IsAspherical`, and `PathConnectedSpace` where it is used. No binder is lost, and nothing changed.
- Imports: `import Mathlib` plus four `TauCeti.*` modules, unchanged.

**Padding probe.** In a scratch copy I replaced each `sorry` with `first | simp | rfl | infer_instance | aesop | exact ⟨_, rfl, fun _ => rfl⟩`. All four fail:
- unsolved goals at lines 89, 127 and 142;
- a type mismatch at line 105.

None is padding. `scratch/library-matches.md` lists no pinned declaration proving any of the four; its hits are the carriers `groupHomology`, `groupCohomology`, `HomotopicRel` and `HomotopyEquiv`.

**Headlines.** The Summary (lines 25–28) names four headlines, and `Suggested.lean` states all four. The module docstring names the theorems of the pin that are deliberately not restated. Both are unchanged.

**R01 re-derivation: declarations opened at the pin.**
- Tau Ceti:
  - `classifyingSpaceFundamentalGroupMulEquiv` (`EilenbergMacLane.lean` 67) and `…_apply_eq_iff` (77);
  - `smul_universalGSpaceBasepoint` (`Action.lean` 109);
  - `singularChains_d_pathChain` (`Singular/ModuleChains/Basic.lean` 223);
  - `singularChainsRepresentation` (`Resolution.lean` 69);
  - `singularChainsRepCoinvariantsTensorIso` and `singularHomologyIsoGroupHomology` (`GroupHomology.lean` 214–251);
  - `classifyingSpaceSingularHomologyIsoGroupHomology` (`ClassifyingSpace/Homology.lean` 69);
  - `classifyingSpaceFirstHomologyAddEquivGroupHomology` (`FirstHomology.lean` 167) and `…_loopClass` (204);
  - `loopClass` (`Homotopy/Hurewicz/One/Basic.lean` 278).
- Mathlib:
  - `Rep.barComplex.d_single` (`Resolution.lean` 348);
  - `groupHomologyIso` (`GroupHomology/Basic.lean` 254);
  - `coinvariantsTensorFreeToFinsupp_mk_tmul_single` (`Coinvariants.lean` 469);
  - `H1AddEquivOfIsTrivial_single` (`GroupHomology/LowDegree.lean` 1040).

**R02 and R03 witnesses, opened at the pin.**
- Tau Ceti:
  - `twistedHomologyδ` (`Singular/Twisted/Coefficients.lean` 151) and `twistedHomologyδ_naturality` (191);
  - `twistedCohomologyBockstein_eq_δ` (`Cohomology/Twisted/Bockstein.lean` 92);
  - `IsAspherical.of_basepoint` (`EilenbergMacLane/Basic.lean` 90);
  - `basepointChangeEquiv` (`LocalCoefficient.lean` 448);
  - `ofRepresentationMonodromyIso` (`LocalCoefficient/Representation.lean` 122).
- Mathlib:
  - `δ_naturality` (`HomologySequenceLemmas.lean` 56);
  - `fundamentalGroupMulEquivOfPath` (`FundamentalGroup.lean` 48).

**Seeded sample.** All six targets (1.1, 1.2, 1.3, 2.1, 2.2, 2.3) are in unchanged text that r32 and r37 verified. I re-read their locators in `hatcher-at`:
- Theorem 1B.8 is at line 3897 and Proposition 1B.9 at line 3905, under the page header "90" (line 3884). Hypotheses: a connected CW `X` and a `K(G, 1)` target, with uniqueness fixing `x₀`.
- The maximal-tree step on p. 91 (header at line 3924) is at lines 3938–3942.
- "Homology of Groups" is at line 6471, printed p. 148 (line 6441).
- "Local Coefficients via Modules" (§3.H) is at line 14326, printed p. 328 (line 14320).
- Example 3H.1 is at line 14373, printed p. 329 (line 14372).
- Proposition 4A.2 is at line 18238, page header "422" (line 18226).

All agree with the README.

**Overlap facts** (`scratch/overlaps.md`):
- This README cites no id that an open pull request drops.
- It cites no id that only an open revision defines.
- `#stage-2-the-cellular-model`, the one dropped id that another roadmap cites, keeps its old → new mapping.
- #1807 is ordered in the description; #1187 and #1854 are not (R04).
- The closest open roadmaps in vocabulary are the AlgebraicTopology heads #1854, #1807, #1652, #1797 and #1187. The third remark above covers #1652. r32's ownership audit of the others stands, since this folder is unchanged.

**Adversarial table.** No statement changed, so every row is carried from r37's table, which carries r32's. Rows 15 and 17 were recomputed at this head from the pinned files listed above.

| # | Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Headline 1.1, existence (r37 row 1) | `X = S¹` with one vertex, `Y = S¹`, `φ = ·2` | `z ↦ z²`: `f(1) = 1`, `f_* = 2` / `φ = 2` | holds | none |
| 2 | 1.1, target not CW (r37 row 2) | `X = S¹`, `Y = ℝP^∞`, `φ : ℤ ↠ ℤ/2` | `ℝP¹ ⊂ ℝP^∞` induces `1 ↦ 1 mod 2` / `φ(1) = 1` | holds | none |
| 3 | 1.2, negative control (r37 row 3) | `X = Y = S²`, the identity and a constant map | both trivial on `π₁`; degrees `1 ≠ 0` | asphericity needed, and assumed | none |
| 4 | 1.1–1.2, degenerate (r37 row 4) | `X` a point | one homomorphism `1 → π₁Y` / one pointed map | holds | none |
| 5 | 1.2 free classes, non-abelian (r37 row 5) | `X = S¹`, `Y = B(S₃)` | 6 pointed classes, 3 orbits / 3 conjugacy classes | holds | none |
| 6 | 1.2 free classes, rank two (r37 row 6) | `X = S¹ ∨ S¹`, `Y = B(S₃)` | `|Hom(F₂, S₃)| = 36`; Burnside `(36 + 12 + 18)/6 = 11` / 11 | holds | none |
| 7 | 1.2 free classes, abelian (r37 row 7) | `X = Y = S¹` | `Hom(ℤ, ℤ)` mod conjugation `= ℤ` / `[S¹, S¹] = ℤ` | holds | none |
| 8 | 1.2, disconnected source (r37 row 8) | `S¹ ⊔ S¹`; `ℕ` discrete; `∅`, into `B(S₃)` | `9`, `1`, `1` / 4A.2: 18 pointed, 9 orbits; `1`; `1` | holds | none |
| 9 | 1.2, path-square step (r37 row 9) | homotopy `K` from `g` to `g'` | `(g∘σ_v)·K(v) ≃ f∘σ_v` / `K(x)·(g'∘σ_v) = g'∘σ_v` | matches `map_trans_evalAt` | none |
| 10 | Headline 1.3 (r37 row 10) | `X = Y = S¹`, `e = −1` | `F = z ↦ z̄`: `F(1) = 1`, `F_* = −1` / `−1` | holds | none |
| 11 | 1.3, negative control (r37 row 11) | a point and the Warsaw circle | all `πₙ` trivial on both; Warsaw circle not contractible | CW on `Y` needed, assumed | none |
| 12 | 1.3 Check, `X = BG` (r37 row 12) | `b₀` the orbit of vertex `(0, 1)` | a `0`-cell; `c_X ≃ id` rel `b₀` | holds | none |
| 13 | Direction of `Φ` (r37 row 13) | `G = S₃`, `s = (1 2)`, `t = (2 3)` | `γ ↦ m⁻¹` gives `st` / `γ ↦ m` gives `ts ≠ st` | forced; `EilenbergMacLane.lean` 77 | none |
| 14 | Circle sentence (r37 row 14) | `G = ℤ` | circle loop ↦ `1`; lift ends at `(0, −1)`, `m = −1` | true | none |
| 15 | 2.1 in degree one (recomputed) | `G = ℤ`, `X = S¹`, `Ψ` degree, `k = ℤ` | pinned 2.1: `∂σ̃ = (−1)·e₀ − e₀`, so the `1`-chain is `−1`, giving `−1` / README `+1`; `…loopClass` gives `+1` | sign false | R01 |
| 16 | 2.1 degree one over `ℤ/2` (r37 row 16) | `G = ℤ/2` | `[g⁻¹] = [g] = 1` on both | cannot detect sign | R01 (Checks stay on `ℤ`) |
| 17 | 2.2 circle Check (recomputed) | `u` with `⟨u, ℓ⟩ = 1`, `M = k` | `φ(m) = φ(−1) = 1`, so `φ = (1 ↦ −1)` / README `1 ↦ 1` | sign false | R01 |
| 18 | 2.1 Check, `ℤ/m` (r37 row 18) | `m = 3`, `k = ℤ` | `H₁`: `ℤ/3` / `ℤ/3`; `H₂`: `0` / `0` | holds | none |
| 19 | 2.2 Bockstein Check (r37 row 19) | `G = ℤ/2`, `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | first map injective, order 2 both; next map 0; `δ` injective / order 2 | true | none |
| 20 | Headline 2.3, homology (r37 row 20) | `X = S¹`, `A = k`, generator acts by `u` | `H₀ = k/(u−1)k`, `H₁ = ker(u−1)` / same from `k[ℤ] →(t−1) k[ℤ]` | holds | none |
| 21 | Headline 2.3, homology (r37 row 21) | `X = ℝP^∞`, `A = ℤ` sign action | `ℤ/2`, `0`, `ℤ/2` / trivial action `ℤ`, `ℤ/2`, `0` | holds; Check right | none |
| 22 | 2.3, negative control (r37 row 22) | `X = S² ∨ S¹`, `G = ℤ`, `A = ℤ` | `H₂(X) = ℤ` / `H₂(ℤ, ℤ) = 0` | asphericity needed, assumed | none |
| 23 | Headline 2.3, cohomology (r37 row 23) | `X = S¹`, `k` a field, `u ≠ 1`, `N = k` | `H⁰ = 0`, `H¹ = 0` / `0`, `0` | holds | none |
| 24 | 2.3, cohomology Bockstein (r37 row 24) | `k = ℤ`, `G = 1`, `0 → ℤ → ℤ → ℤ/2 → 0` in `N` | `A = ℤ`: exact / `A = ℤ/2`: `0 → 0 → ℤ/2`, not exact | projectivity needed, stated | none |
| 25 | 2.3, functoriality of `ofRepresentation` (r37 row 25) | `X = S¹`, `f = ·c`; `f = id`, `u' ≠ u` | `H₀`: `·c` on both / `u'·1 ≠ 1·u` | holds | none |
| 26 | 2.3 route, monodromy at `b₀` (r37 row 26) | fibre `(A ⊗ k[p⁻¹ b₀])_G` | `[a ⊗ m e₀] = [m⁻¹a ⊗ e₀]`; transport `A(Φ(γ))` | route right | none |
| 27 | Layer 2 base point (r37 row 27) | `X = S¹`, vertex `1`, `x = i` | both sides `Hₙ(ℤ, A)` / `_hx` false at `i` | true without it | R02 |
| 28 | 2.3 connecting maps (r37 row 28) | `G = ℤ/2`, `k = ℤ`, `0 → ℤ →(·2) ℤ → ℤ/2 → 0` | `δ : ℤ/2 → ℤ` is `0` / `0` | holds; inputs unnamed | R03 |
| 29 | 2.3, degenerate (r37 row 29) | `k = 0`; `G = 1`, `X` contractible | `0 = 0`; `H₀ = A`, higher `0` on both | holds | none |

## Not verifiable

These are unchanged from r37:
- **Brown, *Cohomology of Groups*, Ch. II §4 and Ch. III §1** (items 2.1–2.3) is settled as uncertified and cited by locator only. Hatcher §2.2 and §3.H were read in its place.
- **Schwamberger–Vogt 2009, §2** (the Warsaw circle) is settled as uncertified.
- **Milnor 1956** is settled as uncertified, and is cited only for the pinned model.
- **Segal 1968, §3** is outside the seeded sample, and its passage is unchanged.

## Source issues

- none
