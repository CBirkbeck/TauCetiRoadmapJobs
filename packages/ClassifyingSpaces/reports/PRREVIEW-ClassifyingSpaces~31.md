# Review of ClassifyingSpaces (pull request #1807 at ac36c47)

**Verdict:** needs changes

This is an incremental re-review: 0 lines changed since 3e107fa. The three commits since then (`bdcbdaa9` BordismFormalGroups, `70140e69` PadicFunctionalAnalysis, `ac36c477` CharacteristicClasses) touch only those three folders, which the pull request declares as its own. `git diff --stat 3e107fa HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty, and the pins are the same (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). None of the four P3 findings from the previous review has been fixed. Each is restated below: I re-read its passage at this head and re-opened its pinned witness at the pin. The gate, the dependency check and the elaboration were run again and are clean. Of the changed folders, only CharacteristicClasses is mentioned in this README, and the consumer sentence that mentions it is still accurate (see *Verified sound*). There is no new finding.

## R01 (P3) — The PR drops the Stage and item numbering that other roadmaps cite, and the README gives no old → new mapping

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md`. At this head, `grep -n 'Stage\|Former numbering'` finds only lines 73 and 768, which are citations of AlgebraicTopology Stage 8. No line maps the former `Stage 1`–`Stage 4` and items 1–19 to the present sections.

**Claim.** Roadmaps on main and in open pull requests still cite the former ids, and every one of those citations breaks when this PR merges:

- FreeGroupsAndLimitGroups on main: line 29 (`#stage-2-the-cellular-model`, an anchor that no longer exists) and lines 40, 2554 and 2771 (`Stage 2.7`, `Stage 2 item 7`).
- ArithmeticLocallySymmetricSpaces #871: lines 515, 516, 2011, 2029, 2065, 2073, 2347 and 2371 (`§Stage 3, item 13`, `§Stage 4, items 16–18`).
- TangentialBordism #942: lines 316, 2688 and 3012 (`Stage 4`, `Stage4`).
- StableHomotopyKTheory #1227: lines 473 and 504.
- ArithmeticKTheory #1418: line 1102.
- AlgebraicTopology on main (lines 97, 1846), at #1652 (lines 113, 2976, 2991, 3004, 3471, the last citing `Stage 3 items 11–15 and Stage 4 items 16–18`), at #1663 (lines 107, 2288), and in this PR's own folder (lines 97, 2074).

Each of these ids now corresponds to a pinned declaration or to a Layer 1 or Layer 2 item, but a reader of the citing roadmap cannot tell which one.

**Witness.** `roadmaps grep --readme-only 'ClassifyingSpaces.{0,80}Stage|stage-2-the-cellular-model'` run this round returns the lines above. `scratch/overlaps.md` lists `#stage-2-the-cellular-model` and `§Stage` under "Ids of ClassifyingSpaces that this pull request drops and other roadmaps cite".

**Repair.** At the end of `## Scope and ownership`, add one timeless line per moved id ("Former numbering: …"):

- Stage 1 items 1–6 → *From Tau Ceti*, "Milnor's model", "Its fundamental group", "Functoriality" (pinned).
- Stage 2 item 7 → *From Tau Ceti*, "The presentation complex and the cellular model": `TauCeti.PresentationComplex R` with `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`.
- Stage 2 items 8–10 → the same bullet: `TauCeti.killHomotopyGroups` and `TauCeti.cellularClassifyingSpace`.
- Stage 3 item 11 → items 1.1–1.2 (general source) and `TauCeti.exists_mapOfEq_cellularClassifyingSpace` (cellular model).
- Stage 3 item 12 → item 1.3 and `TauCeti.IsAspherical.exists_homotopyEquiv`.
- Stage 3 item 13 → `IsQuotientCoveringMap.cwComplexQuotient` and `TauCeti.cellularResolutionOfIsAspherical`.
- Stage 3 item 14 → `TauCeti.cellularHomotopyEquivClassifyingSpace`.
- Stage 3 item 15 → `TauCeti.classifyingSpaceHomotopyFunctor`.
- Stage 4 item 16 → `TauCeti.cellularClassifyingSpaceResolution` and `TauCeti.universalGSpaceResolution`.
- Stage 4 item 17 → items 2.1–2.2 (trivial coefficients) and 2.3 (local coefficients).
- Stage 4 item 18 → `TauCeti.universalGSpaceStandardHomotopyEquiv`.
- Stage 4 item 19 → Layer 2 *Examples*.

## R02 (P3) — The route of 2.3 identifies the pulled-back system with `L_A` using two pinned facts it does not name and one transport the pin does not have

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 702–710, which say that the pullback "has monodromy at `x` given by the monodromy of the pinned system at `b₀` composed with `π₁(c_X)`; … so the pullback has monodromy `A ∘ Ψ`, and `…ofRepresentationMonodromyIso` identifies it with `L_A`". The `*Needs:*` line is at 723–732. `grep -n 'pullback_monodromyRepresentation\|associatedLocalSystemFiberIso'` finds nothing in the README at this head.

**Claim.** The route uses three steps without naming them:

1. **Monodromy of a pullback.** This is the pinned `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean` line 395). The `*Needs:*` line names only `pullbackHomotopyIso`.
2. **Fibre over `b₀`.** The fibre of the pinned system over `b₀` is `(A ⊗ k[p_G⁻¹ b₀])_G`, not `A`. Its identification with `A` is the pinned `IsQuotientCoveringMap.associatedLocalSystemFiberIso` for the sheet `TauCeti.universalGSpaceBasepoint G` (`…/LocalCoefficient/QuotientCovering/Exact.lean` line 52), which the README also does not name. So "has monodromy `A ∘ Ψ`" holds only up to an isomorphism of representations, not literally.
3. **Transport along that isomorphism.** `ofRepresentationMonodromyIso` gives `ofRepresentation x (monodromy of the pullback) ≅ pullback`. Passing from there to `ofRepresentation x (A.ρ ∘ Ψ)` needs a fact the pin does not have: an isomorphism of representations of `π₁(X, x)` induces an isomorphism of the corresponding `ofRepresentation` systems. The pinned names in the `ofRepresentation` family are `ofRepresentation`, `_obj`, `_map_apply`, `ofRepresentationMonodromyIso` and `_app_mk`, together with `monodromyRepresentation_ofRepresentation` (`…/LocalCoefficient/Representation.lean` lines 80–135). None of them is this transport.

**Witness.** The three file locations above, re-opened at the pin this round. `grep -rho 'ofRepresentation[A-Za-z_]*'` over the pinned Tau Ceti returns only those five names.

**Repair.** In 2.3:

- Name `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` and `IsQuotientCoveringMap.associatedLocalSystemFiberIso` (with the sheet `TauCeti.universalGSpaceBasepoint G`) at the steps that use them, in the `*Needs:*` line and under *From Tau Ceti*.
- Say that the monodromy of the pullback is isomorphic to `A ∘ Ψ` through that fibre isomorphism.
- State as an owned step of 2.3 (an API bullet of `L_A`) that an isomorphism of representations `ρ ≅ ρ'` of `π₁(X, x)` induces an isomorphism `ofRepresentation x ρ ≅ ofRepresentation x ρ'`. Add the Check that for `G = ℤ` and `A = k` with the generator acting by `u`, this isomorphism carries the fibre class of `1 ⊗ (vertex (0, 1))` to `1`.

## R03 (P3) — The unwinding step of 1.2 is the path-square lemma, which Mathlib has at the pin and the README does not name

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 521–522: "unwinding the definition of `g'` on `σ_a` and `σ_b` this is the statement that `f ∘ γ` and `g' ∘ γ` are homotopic relative to the end points". The `*Needs:*` line is at 524–528. `grep -n eq_diag_path` finds nothing in the README at this head.

**Claim.** The unwinding works as follows. Let `K` be the homotopy from `g` to `g'` and `σ` a path from `x` to `v`. Then `(g ∘ σ) · K_v ≃ K_x · (g' ∘ σ)` relative to the end points, with `K_x` constant. With `K_v = (g ∘ σ_v)⁻¹ · (f ∘ σ_v)` this gives `g' ∘ σ_v ≃ f ∘ σ_v`. Cancelling `f ∘ σ_a` and `(f ∘ σ_b)⁻¹` then gives the claim. The square statement used in the first step is not the named `ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map`, which is about loops at one point. It is Mathlib's `ContinuousMap.Homotopy.eq_diag_path` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/InducedMaps.lean` line 256 at the pin), and neither the `*Needs:*` line nor *From Mathlib* names it.

**Witness.** The Mathlib line above, re-opened at the pin this round. The `*Needs:*` line of 1.2 names only `homotopicRel_skeletonLT_one_of_forall_homotopicRel`, `IsAspherical.of_basepoint`, `zeroSkeletonDiscreteTopology`, `hasHomotopyExtensionProperty_skeletonLT`, `fundamentalGroupMulEquivOfPath_evalAt_map`, `HomotopicRel` and `mapOfEq`.

**Repair.** Name `ContinuousMap.Homotopy.eq_diag_path` (Mathlib) at the unwinding step, in the `*Needs:*` line of 1.2 and under *From Mathlib*. Item 1.1 needs no change: its square is at a loop's base point, which `fundamentalGroupMulEquivOfPath_evalAt_map` covers.

## R04 (P3) — A Check of 2.1 uses `n` for both the order of the cyclic group and the degree

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 649–652: "`G = ℤ/n`, `k = ℤ`, `n = 2`: both sides are zero (… `_of_even` on the left, the two-periodic resolution on the right), and in degree one both sides are `ℤ/n`". The text is unchanged at this head.

**Claim.** If `n` is the order, then `n = 2` makes `G = ℤ/2`, and "both sides are zero" refers to no degree. If `n` is the degree, then `G = ℤ/n` has no fixed order. The intended statement is true for every `m ≥ 1`:

- In degree two, `H₂(ℤ/m; ℤ) = 0`, by `TauCeti.subsingleton_classifyingSpace_singularHomology_int_of_even` and by the two-periodic resolution `ℤ --m--> ℤ --0--> ℤ`.
- In degree one, both sides are `ℤ/m`.

The Check as written does not say this.

**Witness.** The lines as quoted. From the two-periodic resolution, `H₂(ℤ/m; ℤ) = ker(0)/im(m) = 0` and `H₁ = ℤ/mℤ`. The pinned lemma's docstring (`TauCeti/AlgebraicTopology/ClassifyingSpace/FiniteCyclic.lean` line 48) says it is about even degree.

**Repair.** Write "`G = ℤ/m`, `k = ℤ`: in degree two both sides are zero (…), and in degree one both sides are `ℤ/m`".

## Previous findings

- R01 — not repaired: `grep -n 'Stage'` finds only lines 73 and 768 (AlgebraicTopology citations). There is still no "Former numbering" line, and FreeGroupsAndLimitGroups, ArithmeticLocallySymmetricSpaces, TangentialBordism, StableHomotopyKTheory, ArithmeticKTheory and AlgebraicTopology still cite `Stage 2 item 7`, `Stage 3 item 13`, `Stage 4` and `Stage3/4`.
- R02 — not repaired: lines 702–710 and the `*Needs:*` line 723–732 are unchanged. `pullback_monodromyRepresentation` and `associatedLocalSystemFiberIso` appear nowhere in the README, and the pin still has no `ofRepresentation` transport along an isomorphism.
- R03 — not repaired: lines 505–528 are unchanged, and `eq_diag_path` appears nowhere in the README.
- R04 — not repaired: lines 649–652 still read "`G = ℤ/n`, `k = ℤ`, `n = 2`: both sides are zero … in degree one both sides are `ℤ/n`".

## Verified sound

**Change set and pins.** `git log 3e107fa..HEAD` shows three commits: `bdcbdaa9` (BordismFormalGroups), `70140e69` (PadicFunctionalAnalysis) and `ac36c477` (CharacteristicClasses). `git diff --stat 3e107fa HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty. `git diff --name-only origin/main...HEAD` lists 22 files: the two files of this folder plus 20 files, all inside the thirteen other folders the brief names as the PR's own. `lake-manifest.json` pins Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, unchanged. The folder holds `README.md` (803 lines), `Suggested.lean` (144 lines), `PROGRESS.md`, `STATUS.md` and `metadata.toml`; there is no stray file.

**Text the change could make wrong.**
- This README mentions none of BordismFormalGroups, PadicFunctionalAnalysis or CharacteristicClasses except at line 777. That line says the characteristic-classes roadmap "consumes the classifying space of `ℤ/2` through that item" (AlgebraicTopology Stage 8 item 8b). At this head, CharacteristicClasses README lines 789–790 still compare its real carrier "with AT8.8's classifying space of ℤ/2 through AT8.8b's normalized model comparison", so the sentence stays true.
- CharacteristicClasses lines 159–161 and 424 describe this roadmap as treating discrete groups with the weak-topology countable join. That is the pinned `TauCeti.classifyingSpace G`, which this README's *From Tau Ceti* consumes and does not own, so the object has a single owner.
- None of the three changed folders cites a ClassifyingSpaces id (`grep ClassifyingSpaces` over their changed hunks returns nothing).
- No `Suggested.lean` in this PR or in any open PR other than its own revisions (#1808, #1854, #1187) declares any of the four headline names. The only other hit is this roadmap's own copy on main.

**Gate.** The worker's gate at ac36c47 passes every check (`OK`). My run with `--base origin/main` passes every check except `outside-folder=20`, which counts the files of the PR's other declared folders listed above. The dependency check output, verbatim: `depcheck: 230 roadmaps, 2318 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line. Neither ClassifyingSpaces nor AlgebraicTopology is in `ORDER.txt`, because both are on main.

**Elaboration.** `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 6 s with four `declaration uses sorry` warnings (lines 81, 98, 118, 134) and nothing else. The imports are `Mathlib` plus four `TauCeti.AlgebraicTopology.*` modules, all present at the pin. I compared the worker's `signatures.md` against 1.1–1.3 and 2.3. Every binder is still present: `[T2Space X] [CWComplex univ] [PathConnectedSpace X]`, `x ∈ skeletonLT univ 1`, `IsAspherical`, `Ψ : π₁(X, x) ≃* G`, `Rep k G`, and a single universe.

**Pinned declarations re-opened this round.** `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` (`LocalCoefficient.lean` 395), `IsQuotientCoveringMap.associatedLocalSystemFiberIso` (`QuotientCovering/Exact.lean` 52; `_hom_coinvariantsTensorMk` at 62), `ContinuousMap.Homotopy.eq_diag_path` (`InducedMaps.lean` 256), `ofRepresentation` (`LocalCoefficient/Representation.lean` 80, defined through `Groupoid.functorOfEndHom`) with its five companions (89–135), and `TauCeti.subsingleton_classifyingSpace_singularHomology_int_of_even` (`ClassifyingSpace/FiniteCyclic.lean` 24, 48). The README cites 184 other pinned names. The previous rounds' probe resolved them, and since the pin is unchanged they still resolve. `citations.md` reports nothing unresolved.

**Sources (seeded sample 1.1–1.3, 2.1–2.3; untouched text, spot-checked).** Theorem 1B.8 and Proposition 1B.9 of `hatcher-at` are at lines 3897 and 3905, on printed page 90 (running head at line 3884), as 1.1–1.3 cite. Proposition 0.16 is at line 818, on printed page 15 (line 798). Proposition 4.22 is at line 15549, on PDF page 366, which is printed page 357. All three match the References. The Brown locators of 2.1–2.3 are settled as uncertified (see *Not verifiable*).

**Overlaps and ownership.**
- `scratch/overlaps.md` was checked item by item. No id this README cites is dropped by an open PR, and none is defined only by an open revision.
- #1808 (same author, stacked after this one) and #1187 (TauCeti bump) both conflict with this folder. The merge-order paragraph says no open PR must merge before this one and puts #1808 after it.
- #1854 conflicts only in `AlgebraicCurves/Suggested.lean` and `CharacteristicClasses/README.md`, not in this folder.
- The dropped ids are R01.
- Ownership is unchanged from the previous reports. No other open roadmap states a pointed map or pointed uniqueness theorem for an arbitrary aspherical CW source.

**Adversarial table.** All rows are carried from the previous report (round 26, which carried them from round 22) because no statement changed. The values are those computed there. One row is added for the consumer sentence the CharacteristicClasses change could affect.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: direction of `π₁(BG) ≃* G` (previous report) | `G = S₃`, `s = (1 2)`, `t = (2 3)`; `G = ℤ`; `G = 1` | lift of `ℓ_s * ℓ_t` ends at `(0, ts)`; `γ ↦ m(γ)⁻¹` gives `st`, a homomorphism; `γ ↦ m(γ)` gives `ts ≠ st`; `ℤ`: end point `(0, 1)` goes to `−1`; `G = 1`: `BG = EG` | agrees with `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` | none |
| Conventions: base points are vertices (previous report) | cellular model; Milnor model; interior point of a `1`-cell | `skeletonLT univ 1 = {c₀}`; `b₀ = proj (vertex (0, 1))`, a `0`-cell by `classifyingSpaceCellEquiv G 0`; interior point: the HEP step of 1.1 fails, so the headlines carry `hx` | hypothesis present and used | none |
| 1.1 existence (previous report) | `X = C`; circle into `B(ℤ)`; `φ = 1`; `X = S³`; universes | `X'` aspherical; `e : C → X'` a weak equivalence; `ℓ` by `exists_comp_homotopic` with `CWType X` only; `δ := δ₀ · λ⁻¹` gives `e ∘ δ ≃ τ`; `ψ ∘ ℓ^δ = id`, `g_* ∘ ℓ^δ = φ`; `K` from the HEP of the discrete `0`-skeleton; everything in `Type u` | route sound | none |
| 1.2 uniqueness (previous report) | single `0`-cell; wedge of two circles; `Y = S²` | square lemma `g' ∘ σ_v ≃ (g∘σ_v)(g∘σ_v)⁻¹(f∘σ_v) = f ∘ σ_v`; cancel `f∘σ_a`, `(f∘σ_b)⁻¹`; `S²`: degrees `1 ≠ 0` | sound; the square lemma is `eq_diag_path` | R03 |
| 1.3 pointed uniqueness (previous report) | `G = 1`; Warsaw circle; circle with `Ψ` the degree; `X = BG` | pointed contraction; Warsaw circle is not CW (negative control); circle: `Ψ⁻¹` would give degree `−1`; `FGME G ∘ π₁(cellularHomotopyEquiv R e ∘ c'_X) = Ψ` | sound | none |
| 2.1 homology (previous report) | circle, `n = 1`; `ℤ/m` in degrees 1 and 2; free group; torus; `X = BG`; `Ψ' = α ∘ Ψ` | loop ↦ `1`; `H₂(ℤ/m) = 0`, `H₁ = ℤ/m`; free group: zero; torus: rank `n choose i`; `BG`: pinned isomorphism; new comparison `= groupHomology.map α ∘ old` | values agree; the `ℤ/m` Check conflates `n` | R04 |
| 2.2 cohomology (previous report) | circle, `M = k`; `G = ℤ/2`, `k = ℤ`, Bockstein of `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; `G = 1` | `H¹(ℤ, k) = k`; `Hⁿ(ℤ/2; ℤ/2) = ℤ/2`; `H¹(ℤ/4) → H¹(ℤ/2)` is zero, so the Bockstein `H¹ → H²` is injective, hence an isomorphism; `G = 1`: `M` in degree 0 | correct | none |
| 2.3 local coefficients (previous report) | `A` trivial; `G = ℤ` acting by `u`; `G = ℤ/2`, `A = ℤ⁻`; `S₃` sign; `S² ∨ S¹`; `n = 0`; the route | `k --(u−1)--> k`: `H₀ = k/(u−1)k`, `H₁ = ker(u−1)`; `ℤ/2` sign: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2`; `S² ∨ S¹`: `H₂(X) = ℤ ≠ 0`; route: pullback monodromy pinned (`rfl`), fibre `≅ A` through sheet `(0, 1)` pinned, transport of `ofRepresentation` not pinned | Checks correct; two inputs unnamed, one step unowned | R02 |
| Lean headlines 1–4 (previous report; signatures re-compared this round) | binders; `Y` arbitrary; `x` not a vertex; `F.toFun x = y`; `X = BG`; `S² ∨ S¹`; `k = ℤ`, `G : Type` | binders as in `signatures.md`; without `hx` the HEP step fails; `IsAspherical.exists_homotopyEquiv` gives only the base-point-changed form; the pinned isomorphisms are for `classifyingSpaceLocalSystem k A`, a different carrier; `S² ∨ S¹` is false without `IsAspherical` | match 1.1–1.3 and 2.3 | none |
| Downstream consumers: CharacteristicClasses consumes `B(ℤ/2)` through AlgebraicTopology 8.8b (this round) | CharacteristicClasses README at ac36c47 vs. at 3e107fa | at ac36c47, lines 789–790 compare the real carrier with AT8.8's `B(ℤ/2)` through AT8.8b; at 3e107fa, line 729 says the same | sentence at line 777 still true | none |

## Not verifiable

- Brown, *Cohomology of Groups*, Chapter III §1 (README References): settled as uncertified; cited by locator only.
- Milnor, "Construction of universal bundles, II": settled as uncertified. Segal §3 (`segal-1968`) was read instead in an earlier round.
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2: settled as uncertified.
- The Conventions Check that `t − 1` is the first map of `cellularClassifyingSpaceResolution` for `G = ℤ`: the pin states no formula for that boundary. Either sign is exact, as the Check says.
- The `ℤ` Checks rely on Mathlib's `Circle.fundamentalGroupMulEquiv` sending the counterclockwise loop to `1`. I did not recompute Mathlib's orientation.
- Ownership against open PRs whose files the brief does not list: checked only through the worker's index (`roadmaps grep`).

## Source issues

- none
