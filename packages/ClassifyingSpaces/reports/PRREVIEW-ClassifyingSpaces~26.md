# Review of ClassifyingSpaces (pull request #1807 at 3e107fa)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 7e8275c. The two commits since the previous review (`c2fe7d26` RigidAnalyticGeometry, `3e107fa1` TopologicalKTheory) touch only those two folders, which the pull request declares as its own; `git diff --stat 7e8275c HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty, and the diff against `origin/main` outside the fourteen declared folders is empty. The pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). So none of the four P3 findings of the previous review is repaired: each is re-stated below with its passage re-read at this head and its pinned witness re-opened at the pin. The gate, the dependency check and the elaboration were run again and are clean. No new finding.

## R01 (P3) — The Stage and item numbering this pull request drops is cited by six other roadmaps and the README gives no old → new numbering

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md`: `grep -n 'Stage\|Former numbering' README.md` at this head finds only the AlgebraicTopology citations at lines 73 and 768; no line maps the former `Stage 1`–`Stage 4` and items 1–19 (headings on `origin/main` lines 110, 153, 177, 222) to the present sections.

**Claim.** The former ids are still cited from main and from open pull requests, and every such citation breaks at the merge: FreeGroupsAndLimitGroups on main and #1187 line 29 (`#stage-2-the-cellular-model`, anchor gone), lines 40, 2413, 2554, 2771 (`Stage 2 item 7`); ArithmeticLocallySymmetricSpaces #871 lines 515–516, 2011, 2029, 2065, 2073, 2347, 2371 (`§Stage 3, item 13`, `§Stage 4, items 16–18`); TangentialBordism #942 lines 270, 2570, 2894 (`Stage 4`); StableHomotopyKTheory #1227 lines 473, 504 (`Stages 1.5–1.6, 3.11–3.15, 4.16–4.19`, `Stage 4`); ArithmeticKTheory #1418 line 1102 (`Stage 3`); AlgebraicTopology on main lines 97, 1846 and in this pull request's own folder lines 97, 2074 (`Stage3/4`). Every one of these now names a pinned declaration or a Layer 1 or 2 item, but a reader of those roadmaps cannot find which.

**Witness.** `roadmaps grep --readme-only 'ClassifyingSpaces.{0,80}Stage'` this round (the lines above); `scratch/overlaps.md` "Ids of ClassifyingSpaces that this pull request drops and other roadmaps cite" (`#stage-2-the-cellular-model`, `§Stage`).

**Repair.** Add, at the end of `## Scope and ownership`, one line per moved id, timeless ("Former numbering: …"): Stage 1 items 1–6 → *From Tau Ceti*, "Milnor's model", "Its fundamental group", "Functoriality" (pinned); Stage 2 item 7 → *From Tau Ceti*, "The presentation complex and the cellular model": `TauCeti.PresentationComplex R` with `TauCeti.PresentationComplex.fundamentalGroupMulEquiv`; items 8–10 → the same bullet, `TauCeti.killHomotopyGroups` and `TauCeti.cellularClassifyingSpace`; Stage 3 item 11 → items 1.1–1.2 (general source) and `TauCeti.exists_mapOfEq_cellularClassifyingSpace` (cellular model); item 12 → item 1.3 and `TauCeti.IsAspherical.exists_homotopyEquiv`; item 13 → `IsQuotientCoveringMap.cwComplexQuotient` and `TauCeti.cellularResolutionOfIsAspherical`; item 14 → `TauCeti.cellularHomotopyEquivClassifyingSpace`; item 15 → `TauCeti.classifyingSpaceHomotopyFunctor`; Stage 4 item 16 → `TauCeti.cellularClassifyingSpaceResolution` and `TauCeti.universalGSpaceResolution`; item 17 → items 2.1–2.2 (trivial coefficients) and 2.3 (local coefficients); item 18 → `TauCeti.universalGSpaceStandardHomotopyEquiv`; item 19 → Layer 2 *Examples*.

## R02 (P3) — The route of 2.3 identifies the pulled-back system with `L_A` through two pinned facts it does not name and one transport the pin lacks

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 702–710 ("the pullback of the pinned local system … has monodromy at `x` given by the monodromy of the pinned system at `b₀` composed with `π₁(c_X)`; … so the pullback has monodromy `A ∘ Ψ`, and `TauCeti.LocalCoefficientSystem.ofRepresentationMonodromyIso` identifies it with `L_A`") and the `*Needs:*` line 723–732; `grep -n 'pullback_monodromyRepresentation\|associatedLocalSystemFiberIso' README.md` finds nothing at this head.

**Claim.** Three steps are used and not named. (i) The monodromy of a pullback is the pinned `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean` line 395), absent from the `*Needs:*` line, which names only `pullbackHomotopyIso`. (ii) The fibre of the pinned system over `b₀` is `(A ⊗ k[p_G⁻¹ b₀])_G`, not `A`: the identification with `A` is the pinned `IsQuotientCoveringMap.associatedLocalSystemFiberIso` for the sheet `TauCeti.universalGSpaceBasepoint G` (`TauCeti/AlgebraicTopology/LocalCoefficient/QuotientCovering/Exact.lean` line 52), also unnamed; so "has monodromy `A ∘ Ψ`" holds up to an isomorphism of representations, not on the nose. (iii) `ofRepresentationMonodromyIso` gives `ofRepresentation x (monodromy of the pullback) ≅ pullback`; passing to `ofRepresentation x (A.ρ ∘ Ψ)` needs that an isomorphism of representations of `π₁(X, x)` induces an isomorphism of the `ofRepresentation` systems, and `TauCeti/AlgebraicTopology/LocalCoefficient/Representation.lean` (declarations at lines 80, 89, 95, 111, 122, 135: `ofRepresentation`, `_obj`, `_map_apply`, `monodromyRepresentation_ofRepresentation`, `ofRepresentationMonodromyIso`, `_app_mk`) has no such transport; `grep -rho 'ofRepresentation[A-Za-z_]*'` over the pinned Tau Ceti this round finds no other name.

**Witness.** The three file locations above, re-opened at the pin this round; the `*Needs:*` line 723–732 as quoted.

**Repair.** In 2.3 name `TauCeti.LocalCoefficientSystem.pullback_monodromyRepresentation` and `IsQuotientCoveringMap.associatedLocalSystemFiberIso` (with the sheet `TauCeti.universalGSpaceBasepoint G`) at the steps that use them, in the `*Needs:*` line and under *From Tau Ceti*; say that the monodromy of the pullback is isomorphic to `A ∘ Ψ` through that fibre isomorphism; and state as an owned step of 2.3 (an API bullet of `L_A`) that an isomorphism of representations `ρ ≅ ρ'` of `π₁(X, x)` induces an isomorphism `ofRepresentation x ρ ≅ ofRepresentation x ρ'`, with the Check that for `G = ℤ`, `A = k` with the generator acting by `u`, the isomorphism carries the fibre class of `1 ⊗ (vertex (0, 1))` to `1`.

## R03 (P3) — The unwinding step of 1.2 is the path-square lemma, pinned in Mathlib and not named

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 519–522 ("unwinding the definition of `g'` on `σ_a` and `σ_b` this is the statement that `f ∘ γ` and `g' ∘ γ` are homotopic relative to the end points") and the `*Needs:*` line 524–528; `grep -n eq_diag_path README.md` finds nothing at this head.

**Claim.** The unwinding is: for the homotopy `K` from `g` to `g'` and a path `σ` from `x` to `v`, `(g ∘ σ) · K_v ≃ K_x · (g' ∘ σ)` relative to the end points (with `K_x` constant); with `K_v = (g ∘ σ_v)⁻¹ · (f ∘ σ_v)` this gives `g' ∘ σ_v ≃ f ∘ σ_v`, and cancelling `f ∘ σ_a` and `(f ∘ σ_b)⁻¹` gives the claim. The square statement is not the named `ContinuousMap.Homotopy.fundamentalGroupMulEquivOfPath_evalAt_map` (loops at one point); it is Mathlib's `ContinuousMap.Homotopy.eq_diag_path` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/InducedMaps.lean` line 256 at the pin), which neither the `*Needs:*` line nor *From Mathlib* names.

**Witness.** The Mathlib line above, re-opened at the pin this round; `*Needs:*` of 1.2 names `fundamentalGroupMulEquivOfPath_evalAt_map`, `homotopicRel_skeletonLT_one_of_forall_homotopicRel`, `IsAspherical.of_basepoint`, `zeroSkeletonDiscreteTopology`, `hasHomotopyExtensionProperty_skeletonLT`, `HomotopicRel`, `mapOfEq` only.

**Repair.** Name `ContinuousMap.Homotopy.eq_diag_path` (Mathlib) at the unwinding step, in the `*Needs:*` line of 1.2 and under *From Mathlib*; 1.1 needs no change (its square is at a loop's base point, covered by `fundamentalGroupMulEquivOfPath_evalAt_map`).

## R04 (P3) — A Check of 2.1 uses `n` both for the order of the cyclic group and for the degree

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 649–652 ("`G = ℤ/n`, `k = ℤ`, `n = 2`: both sides are zero (… `_of_even` on the left, the two-periodic resolution on the right), and in degree one both sides are `ℤ/n`"), unchanged at this head.

**Claim.** Read with `n` the order, `n = 2` makes `G = ℤ/2` and "both sides are zero" names no degree; read with `n` the degree, `G = ℤ/n` has no fixed order. The intended statement (degree two vanishes, `H₂(ℤ/m; ℤ) = 0` by `TauCeti.subsingleton_classifyingSpace_singularHomology_int_of_even` and the two-periodic resolution `ℤ --m--> ℤ --0--> ℤ`; degree one is `ℤ/m`) is true for every `m ≥ 1`; the Check as written does not say it.

**Witness.** The lines as quoted; the computation `H₂(ℤ/m; ℤ) = ker(0)/im(m) = 0`, `H₁ = ℤ/mℤ` from the two-periodic resolution.

**Repair.** Write "`G = ℤ/m`, `k = ℤ`: in degree two both sides are zero (…), and in degree one both sides are `ℤ/m`".

## Previous findings

- R01 — not repaired: `grep -n 'Stage'` finds only lines 73 and 768 (AlgebraicTopology citations); no "Former numbering" line; the six citing roadmaps still cite `Stage 2 item 7`, `Stage 3 item 13`, `Stage 4`, `Stages 3/4`.
- R02 — not repaired: lines 702–710 and the `*Needs:*` line 723–732 are unchanged; `pullback_monodromyRepresentation` and `associatedLocalSystemFiberIso` appear nowhere in the README; the pin still has no `ofRepresentation` transport along an isomorphism of representations.
- R03 — not repaired: lines 519–528 unchanged; `eq_diag_path` appears nowhere in the README.
- R04 — not repaired: lines 649–652 still read "`G = ℤ/n`, `k = ℤ`, `n = 2`: both sides are zero … in degree one both sides are `ℤ/n`".

## Verified sound

**Change set and pins.** `git log 7e8275c..HEAD`: `c2fe7d26` (RigidAnalyticGeometry), `3e107fa1` (TopologicalKTheory); `git diff --stat 7e8275c HEAD -- TauCetiRoadmap/ClassifyingSpaces`: empty; `git diff --stat origin/main...HEAD` outside the fourteen declared folders: empty. `lake-manifest.json`: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, unchanged. Neither ClassifyingSpaces nor AlgebraicTopology is in `ORDER.txt` (both on main). Folder contents: `README.md` (803 lines), `Suggested.lean` (144 lines), `PROGRESS.md`, `STATUS.md`, `metadata.toml`; no stray file.

**Gate.** Worker's gate at 3e107fa: every check 0, `OK`. My run with `--base origin/main`: every check 0 except `outside-folder=20` (the files of the pull request's other declared folders, which the brief names as its own). Dependency check, verbatim: `depcheck: 245 roadmaps, 2465 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`: exit 0 in 11 s, four `declaration uses sorry` warnings (lines 81, 98, 118, 134), nothing else. The worker's `signatures.md` for the four headlines is identical to the previous round's (same binders: `[T2Space X] [CWComplex univ] [PathConnectedSpace X]`, `x ∈ skeletonLT univ 1`, `IsAspherical`, `Ψ : π₁(X, x) ≃* G`, `Rep k G`, one universe), compared again with 1.1–1.3 and 2.3; no binder lost.

**Pinned declarations re-opened this round.** `pullback_monodromyRepresentation` (`LocalCoefficient.lean` 395), `associatedLocalSystemFiberIso` (`QuotientCovering/Exact.lean` 52, with `_hom_coinvariantsTensorMk` at 62), `eq_diag_path` (`InducedMaps.lean` 256), and the six declarations of `LocalCoefficient/Representation.lean` (80–135). The 184 other pinned names the README cites resolved in the previous round's probe and the pin is unchanged, so they resolve at this head.

**Padding, ownership, overlaps, cross-roadmap citations.** Unchanged from the previous report and still as read then: none of the four headlines is a theorem of the pin; no other open roadmap states a pointed map or pointed uniqueness theorem for an arbitrary aspherical CW source; `roadmaps resolve` found nothing unresolved and `citations.md` lists nothing; #1808 (same author, stacked after this pull request) and #1187 (TauCeti bump) conflict in this folder as before, with the merge-order paragraph placing both after this one; #1854 conflicts only in `AlgebraicCurves/Suggested.lean`. No id this README cites is dropped by an open pull request, none is defined only by an open revision.

**Adversarial table** (rows carried from the previous report, since no statement changed; values as computed there).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: direction of `π₁(BG) ≃* G` (previous report) | `G = S₃`, `s = (1 2)`, `t = (2 3)`; `G = ℤ`; `G = 1` | lift of `ℓ_s * ℓ_t` ends at `(0, ts)`; `γ ↦ m(γ)⁻¹` gives `st`, a homomorphism; `γ ↦ m(γ)` gives `ts ≠ st`; `ℤ`: end point `(0, 1)` goes to `−1`; `G = 1`: `BG = EG` | agrees with `classifyingSpaceFundamentalGroupMulEquiv_apply_eq_iff` | none |
| Conventions: base points are vertices (previous report) | cellular model; Milnor model; interior point of a `1`-cell | `skeletonLT univ 1 = {c₀}`; `b₀ = proj (vertex (0, 1))`, a `0`-cell by `classifyingSpaceCellEquiv G 0`; interior point: the HEP step of 1.1 fails, headlines carry `hx` | hypothesis present and used | none |
| 1.1 existence (previous report) | `X = C`; circle into `B(ℤ)`; `φ = 1`; `X = S³`; universes | `X'` aspherical; `e : C → X'` weak equivalence; `ℓ` by `exists_comp_homotopic` with `CWType X` only; `δ := δ₀ · λ⁻¹` gives `e ∘ δ ≃ τ`; `ψ ∘ ℓ^δ = id`, `g_* ∘ ℓ^δ = φ`; `K` from the HEP of the discrete `0`-skeleton; all in `Type u` | route sound | none |
| 1.2 uniqueness (previous report) | single `0`-cell; wedge of two circles; `Y = S²` | square lemma `g' ∘ σ_v ≃ (g∘σ_v)(g∘σ_v)⁻¹(f∘σ_v) = f ∘ σ_v`; cancel `f∘σ_a`, `(f∘σ_b)⁻¹`; `S²`: degrees `1 ≠ 0` | sound; the square lemma is `eq_diag_path` | R03 |
| 1.3 pointed uniqueness (previous report) | `G = 1`; Warsaw circle; circle with `Ψ` the degree; `X = BG` | pointed contraction; Warsaw circle not CW (negative control); circle: `Ψ⁻¹` would give degree `−1`; `FGME G ∘ π₁(cellularHomotopyEquiv R e ∘ c'_X) = Ψ` | sound | none |
| 2.1 homology (previous report) | circle `n = 1`; `ℤ/m` degrees 1, 2; free group; torus; `X = BG`; `Ψ' = α ∘ Ψ` | loop ↦ `1`; `H₂(ℤ/m) = 0`, `H₁ = ℤ/m`; free: zero; torus: rank `n choose i`; `BG`: pinned iso; new comparison `= groupHomology.map α ∘ old` | values agree; the `ℤ/m` Check conflates `n` | R04 |
| 2.2 cohomology (previous report) | circle `M = k`; `G = ℤ/2`, `k = ℤ`, Bockstein of `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; `G = 1` | `H¹(ℤ, k) = k`; `Hⁿ(ℤ/2; ℤ/2) = ℤ/2`; `H¹(ℤ/4) → H¹(ℤ/2)` zero, Bockstein `H¹ → H²` injective hence iso; `G = 1`: `M` in degree 0 | correct | none |
| 2.3 local coefficients (previous report) | `A` trivial; `G = ℤ` acting by `u`; `G = ℤ/2`, `A = ℤ⁻`; `S₃` sign; `S² ∨ S¹`; `n = 0`; the route | `k --(u−1)--> k`: `H₀ = k/(u−1)k`, `H₁ = ker(u−1)`; `ℤ/2` sign: `H₀ = ℤ/2`, `H₁ = 0`, `H₂ = ℤ/2`; `S² ∨ S¹`: `H₂(X) = ℤ ≠ 0`; route: pullback monodromy pinned (`rfl`), fibre `≅ A` through sheet `(0, 1)` pinned, transport of `ofRepresentation` not pinned | Checks correct; two inputs unnamed, one step unowned | R02 |
| Lean headlines 1–4 (previous report) | binders; `Y` arbitrary; `x` not a vertex; `F.toFun x = y`; `X = BG`; `S² ∨ S¹`; `k = ℤ`, `G : Type` | binders as in `signatures.md`; without `hx` the HEP step fails; `IsAspherical.exists_homotopyEquiv` gives only the base-point-changed form; pinned isomorphisms are for `classifyingSpaceLocalSystem k A`, a different carrier; `S² ∨ S¹` false without `IsAspherical` | match 1.1–1.3 and 2.3 | none |

## Not verifiable

- Brown, *Cohomology of Groups*, Chapter III §1 (lines 795–797): settled as uncertified; cited by locator only.
- Milnor, "Construction of universal bundles, II" (lines 785–787): settled as uncertified; Segal §3 (`segal-1968` 115–127) read in the previous round instead.
- Schwamberger–Vogt, "Dold spaces in homotopy theory", §2 (lines 557, 798–800): settled as uncertified.
- The Conventions Check at lines 177–180 (`t − 1` as the first map of `cellularClassifyingSpaceResolution` for `G = ℤ`): the pin states no formula for that boundary; either sign is exact, as the Check says.
- The `ℤ` Checks (lines 157–162, 646–648) rely on Mathlib's `Circle.fundamentalGroupMulEquiv` sending the counterclockwise loop to `1`; Mathlib's orientation was not recomputed.
- Ownership against open pull requests whose files the brief does not list: checked only through the worker's index (`roadmaps grep`).

## Source issues

- none
