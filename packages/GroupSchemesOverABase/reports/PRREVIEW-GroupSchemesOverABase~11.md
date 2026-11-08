# Review of GroupSchemesOverABase (pull request #1522 at eb66b2b)

**Verdict:** needs changes

This is a full review of eb66b2b. It covers the 326 lines changed since c62bf17 and the rest of the folder. All four findings of the previous review are repaired (see "Previous findings" below). Nine new findings follow; one of them, R01, is blocking (P2).

The worker's gate passes when it is given the candidate merge order and run with `--build`. `lake env lean` gives exactly 25 `sorry` warnings and nothing else. The dependency check reports 0 problems.

R01 was missed by the overlaps tool. Three open ReductiveGroups revisions move the Layer 8 bullet that Layers 6–7 are built on, and one of them reuses the name "Layer 8" for different content. I found this by reading those revisions directly.

## R01 (P2) — The ReductiveGroups Layer 8 citations drift under the open ReductiveGroups revisions

**Location.** `TauCetiRoadmap/GroupSchemesOverABase/README.md` line 62: "ReductiveGroups Layer 8, bullet *Relative reductive groups over an affine Noetherian base*, owns the relative reductive theory".

The same citation appears at lines 7, 70, 155–156, 238–240, 278, 1170, 1192, 1223, 1257, 1341, 1392, 1398 and 1410. `Suggested.lean` lines 54–55 cite it too. 9B is cited as the owner of the pinnings at lines 82 and 240.

**Claim.** Layers 6–7 consume `Bor(G)`, central isogenies and the simply connected cover from ReductiveGroups Layer 8. They consume the models `𝒢_R`, the pinnings and the `x_α` from 9B.

**Witness.** ReductiveGroups at #1808: "Layer 8: split groups and pinnings" (line 1969); the bullet is now Layer 9D's (line 2871), "…over an arbitrary affine base". #1676 does the same (line 555); #1332 moves it to "8.2 Relative reductive groups" (line 2388).

**Why it matters.** Once #1808 or #1676 merges, "ReductiveGroups Layer 8 (`Bor(G)`)" points at split groups and pinnings. The citation then drifts silently. In those two revisions the 9B bullets *Split reductive group schemes over a base* and *Pinnings* also move to §§8.1–8.2.

**Repair.**
1. Cite the bullet where its content now is. In the numbering that #1676 and #1808 share, that is "ReductiveGroups Layer 9D, bullet *Relative reductive groups over an arbitrary affine base*". Make the change at every line listed above and in `Suggested.lean` lines 54–55.
2. Cite the pinnings as "ReductiveGroups §8.2". Keep 9B for `𝒢_R`, base change and `x_α`.
3. Drop "affine Noetherian" from the Scope bullet: 9D removes that hypothesis.
4. If the #1332 numbering merges first instead, the ids become "§8.2 *Relative reductive groups*" and "§9B.0" (its README line 425).

Either way, the revision becomes a dependency. List it under "only an open revision defines" and name it in the merge-order paragraph of the description.

**Tested.** At #1808, the bullet that opens Layer 9D still constructs "the smooth projective scheme of Borels" with central isogenies and the simply connected forms. That is what 6.1, 6.2, 7.2 and 7.6 use. Its 9B still has "Base change" and "Root subgroup maps".

## R02 (P3) — 3.1: a Check claims the bijection fails along `Spec k → 𝔸¹_k`, but there it holds

**Location.** README line 603: "The bijection fails for a closed immersion that is not surjective: `Spec k → 𝔸¹_k` at `0`."

**Claim.** Restricting homomorphisms between groups of multiplicative type to the fibre at `0` of `𝔸¹_k` is not bijective.

**Witness.** Take `k = ℂ`. Every group of multiplicative type over the normal `𝔸¹_ℂ` is isotrivial (2.5), hence diagonalizable since `π₁^ét(𝔸¹_ℂ) = 1`. Both Hom sets are `Hom(N, M)` (1.2), so restriction is bijective; for example `End(𝔾_m) = ℤ = ℤ`.

**Repair.** Name the groups and use a base where the restriction does fail. Two options:
- "Over `S = Spec(k × k)`, with `S₀` one of its points, `End(𝔾_m) = ℤ² → ℤ`, `(a, b) ↦ a`, is surjective and not injective."
- If the example should be connected: over `S = Spec k[t, t⁻¹]` with `char k ≠ 2` and `S₀ = {t = 1}`, let `H′` be the norm-one torus of the double cover `u² = t`. Then `Hom(𝔾_m, H′) = 0` over `S`, while over `S₀` the cover splits, `H′₀ ≅ 𝔾_m`, and the Hom is `ℤ`.

Both instances were computed: the first directly, the second from `X*(H′) = ℤ` with the deck involution acting by `−1`.

## R03 (P3) — 4.1: `isClosedImmersion_of_mono` uses 4.5's separatedness, which comes later

**Location.** README lines 734–738: "`u` is proper (SGA 3, Exp. VI_B, 1.4), of finite presentation since `G` is locally noetherian … *Needs:* Mathlib `Mono`, `QuasiCompact`, `IsClosedImmersion`, `LocallyOfFiniteType`."

The Layer 4 Dependencies (lines 1021–1025) also list only ReductiveGroups Layer 3, "for the comparisons of 4.6 and 4.8".

**Claim.** The route needs only the listed Mathlib names.

**Witness.** VI_B 1.4 gets `u` separated from the separatedness of its source, citing VI_A 0.3 (sga3-6b line 200): that is 4.5's `isSeparated_of_field`. Dependencies also omits ReductiveGroups Layers 6–7 (4.4, line 791) and Layer 3 for 4.1.

**Repair.**
- Move the monomorphism paragraph, with its three Checks, to the end of 4.5.
- Make its *Needs:* line "`isSeparated_of_field` (4.5); Mathlib `Mono`, `QuasiCompact`, `IsClosedImmersion`, `LocallyOfFiniteType`". Alternatively, move `isSeparated_of_field` into 4.1 ahead of it.
- In `Suggested.lean`, move `isClosedImmersion_of_mono` after `isSeparated_of_field` and relabel its docstring.
- Add "ReductiveGroups Layers 6 and 7 (4.4)" to Layer 4's Dependencies, and write "Layer 3 for 4.1, 4.6 and 4.8".

**Tested.** After the move, every item on the *Needs:* line is an earlier target or a Mathlib name, and the separatedness input of VI_B 1.4 is covered.

## R04 (P3) — 4.1, Checks: the image of `ℤ_k → 𝔾_a` is not discrete

**Location.** README lines 742–744: "`n ↦ n` from the constant group `ℤ_k` to `𝔾_a` is a monomorphism and not a closed immersion, its image being infinite and discrete (SGA 3, Exp. VI_B, 1.4.3)".

**Claim.** The image is a discrete subset of `𝔾_a`.

**Witness.** Closed subsets of `𝔸¹` meet `{0, 1, 2, …}` in finite sets or the whole image: the cofinite topology, not discrete. The image is dense, hence not closed, which is what VI_B 1.2.2 states (sga3-6b lines 81–83).

**Repair.** Write: "…not a closed immersion: its image, an infinite set of closed points, is dense in `𝔾_a` and not closed (SGA 3, Exp. VI_B, 1.2.2 and 1.4.3)". Add VI_B 1.2.2 to the References list of Exp. VI_B.

## R05 (P3) — 2.1: the three predicates have no API, and a consumer has had to state it

**Location.** README lines 450–461: "Define `IsDiagonalizable G` …, `IsMultiplicativeType G` … and `IsTorus G` …". These are followed directly by *Needs:* and **Checks.**, with no list of facts.

**Claim.** The definitions are complete as targets. The house rule is that every definition lists its API.

**Witness.** PurityForFlatCohomology 7.12c (a)–(b) (head 08c5cf24, README lines 2329–2342) states invariance under isomorphism and base change, fppf-locality, commutativity, the affine, faithfully flat, finitely presented structure morphism and the smoothness criterion. It cites this roadmap only for the definitions.

**Repair.** Add API bullets to 2.1, each in prose with its hypotheses:
1. The three predicates are invariant under isomorphism and stable under base change along every `S′ → S` and under fibre products.
2. `IsMultiplicativeType` and `IsTorus` may be checked on any fppf cover. `IsDiagonalizable` cannot be: over `Spec(k × k)`, the group `𝔾_m` on one point and `μ₂` on the other is a witness.
3. A group of multiplicative type is commutative, and its structure morphism is affine, faithfully flat and of finite presentation (SGA 3, Exp. IX, 2.1).
4. It is smooth iff, on one (equivalently every) splitting fppf cover `G_{S_i} ≅ D_{S_i}(M_i)`, the order of the torsion of `M_i` is invertible on `S_i`. In particular a torus is smooth.

**Tested.** On `μ_p` over `𝔽_p`: torsion order `p = 0` in `𝔽_p`, and the group is not smooth. On `𝔾_m × μ₄` over `ℤ`: smooth exactly over `ℤ[1/2]`. PurityForFlatCohomology 7.12c can then cite these bullets.

## R06 (P3) — Overlap paragraph and Downstream consumers: one consumer is missing and one bullet is false

**Location.**
- README lines 106–109: "PurityForFlatCohomology §§7.12a–7.12e restate diagonalizable groups, groups of multiplicative type, tori, the character sheaf and the largest subtorus over a base".
- Lines 1406–1407: "EquivariantIntersectionTheory names this roadmap's line bundles `𝓛(λ)` on `G/B⁻` (6.1)".

**Claim.** PurityForFlatCohomology restates these objects, and EquivariantIntersectionTheory names 6.1.

**Witness.** PurityForFlatCohomology §7.12a (line 2311): these objects "are GroupSchemesOverABase §§1.1–1.2"; its 7.12c *Needs:* (line 2342) cites §§0.1, 1.1, 1.3, 2.1–2.2, so it is an unlisted consumer. EquivariantIntersectionTheory at #1685: "GroupSchemes" occurs 0 times.

**Repair.**
- Delete the **Overlap.** paragraph.
- Add a Downstream consumers bullet: "PurityForFlatCohomology §§7.12a–7.12e consume 0.1, 1.1–1.4, 2.1–2.3 and 2.7 (`D_S(M)`, groups of multiplicative type and tori, `X*(H)`, `Hᵗᵒʳ`)".
- Delete the EquivariantIntersectionTheory bullet. Its 1.1 and 1.3 stay in the supplier contracts, which is the actual direction of the edge.

## R07 (P3) — 0.2: the identity component of a smooth affine model over a DVR is already on main

**Location.** README lines 302–311: "For `G` smooth over `S`, prove `exists_identityComponent`: there is an open subgroup scheme `G⁰ ⊆ G`, smooth and quasi-compact over `S`, with connected fibres". The Scope section does not mention ReductiveGroupsPartII.

**Claim.** The only other owner of this object is AlgebraicModuliForArithmeticGeometry §7.9.

**Witness.** ReductiveGroupsPartII *smooth-affine-model* (main, lines 3802–3819) defines `SmoothModel.identityComponent`: over a discrete valuation ring, with connected generic fibre, the open subgroup `𝒢°` with special fibre `(𝒢_κ)°`. That is 0.2's `G⁰` for `S = Spec O`.

**Repair.**
- In "Left to other roadmaps", add: "ReductiveGroupsPartII *smooth-affine-model* owns `SmoothModel.identityComponent`, the identity component of a smooth affine model over a discrete valuation ring with connected generic fibre; 0.2 is the general case and agrees with it there."
- In 0.2, add the matching comparison sentence and put ReductiveGroupsPartII *smooth-affine-model* on its *Needs:* line.

**Tested.** For `𝔾_m` over `ℤ_p`, both give `G`. For RGPartII's own example `Spec(O × K)`, 0.2 gives `Spec O`. RGPartII excludes that case through its connectedness hypothesis, which is why the agreement is stated "for connected generic fibre".

## R08 (P3) — 7.2: Steinberg Theorem 6.1 (b) does not state the restriction isomorphism

**Location.** README lines 1246–1247: "Restriction `O(G)^G → O(T)^W` is an isomorphism over `ℤ`. Over an algebraically closed field this is Steinberg 1965, Theorem 6.1 (b), for `G` semisimple simply connected".

**Claim.** Steinberg 6.1 (b) is the isomorphism.

**Witness.** Theorem 6.1 (b) (steinberg1965 lines 594–595, p. 64): the class functions are polynomial in the fundamental characters. The restriction isomorphism is Lemma 6.2 with Corollary 6.4 (lines 599, 623–624, p. 65), for every semisimple `G`.

**Repair.** Write: "…this is Steinberg 1965, Lemma 6.2 and Corollary 6.4, p. 65, for every semisimple `G`; Theorem 6.1 (b), p. 64, adds that for `G` simply connected both sides are polynomial in the fundamental characters."

**Tested.**
- `SL₂`: `χ = tr ↦ t + t⁻¹`, and `ℤ[t^{±1}]^W = ℤ[t + t⁻¹]`, by 6.1 (b) and 6.3 (b).
- `PGL₂`, which is not simply connected: restriction is still an isomorphism onto `C[T/W]` by Corollary 6.4, while 6.1 (b) does not apply.

## R09 (P3) — 6.3, 7.7 and 7.8 are stated without a locator

**Location.**
- README line 1202: "For `S` locally noetherian, normal and connected, `Pic(S) ⊕ ℤ^Δ → Pic(G/B⁻)` … is an isomorphism."
- Line 1353 (7.7): "For `S` regular noetherian and connected: `Pic(G) → Pic(G^reg)` is an isomorphism".
- Line 1369 (7.8): "there is no regular scheme `X̃` with a projective morphism `p : X̃ → G` …".

**Claim.** Each target carries its locator.

**Witness.** None cites a source for its statement, only for inputs inside its route. 5.3 marks its own (line 1075: "The inequality for `d_s` is this roadmap's own statement, with the following route"); 6.3, 7.7 and 7.8 do not.

**Repair.** For each of 6.3, 7.7 and 7.8, either give a source and locator, or open the route with "This is this roadmap's own statement, with the following route." For 6.3, the `S = Spec k` case is Popov 1974, §4 (via 6.2).

**Tested.** I recomputed the three statements (adversarial table, rows 34–36) and found no counterexample. Only the locators are missing.

## Previous findings

- **R01 — repaired.** README lines 1066–1068: "The schematic closure `L̄` of `L ⊆ G_K` in `G` is a closed subgroup scheme, flat over `R` (EGA IV₂, 2.8.5) … hence affine (SGA 3, Exp. VI_B, 12.10.1)". `ρ_r + ρ_ab` is now stated only for affine `G` (5.4, line 1111). The Summary (lines 30–33) now reads "the specialization inequality of the abelian rank (lower), and, for `G` moreover affine, of the reductive rank (lower)…". A4.1 has gone from the README (a grep finds 0 occurrences).
- **R02 — repaired.** 5.3 states only "For `G` affine, moreover `d_s(s) ≤ d_s(s′)`" (line 1062). Its *Needs:* line (1091) is "5.1, 5.2, 3.4, 3.5, 4.2; ReductiveGroups Layer 7; …", with no 5.4.
- **R03 — repaired.** Line 1050: "*Needs:* 5.1, 2.1, 3.5, 3.6". 3.6 now states the transporter (lines 679–682, SGA 3, Exp. XI, 6.2) and adds the Check `Transp_G(u, K)` = antidiagonal matrices.
- **R04 — repaired.** Lines 1456–1457: "The author's 2017 version, https://www.jmilne.org/math/Books/iAG2017.pdf, has this numbering." The new Milne locators (Theorem 3.23, Remark 3.28, Theorem 5.34, Corollary 8.39) are at those numbers in that file: milne-iag2017 lines 3236, 3283, 4643 and 6685.

## Verified sound

### Gate, build, dependency check, signatures

- **Worker's gate** (`scratch/gate.md`): every counter is 0, result `OK`.
- **My rerun of the gate** with the configured order: every counter is 0 except `depcheck: NOT IN ORDER: GroupSchemesOverABase`. That is not a finding before intake.
- **My rerun** with `--order scratch/merge-order-candidate.txt --build`: every counter is 0, including `build=0` and `depcheck=0`; result `OK`.
- **Dependency check** (the brief's command, `--movable`): `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The candidate order places this roadmap at line 65, after NeronModelsAndSemistableAbelianVarieties (64), FiniteFlatGroupsAndIntegralPadicHodgeTheory (63), InverseGaloisAndArithmeticFundamentalGroups (52), AbelianSchemesAndArithmeticModuli (41) and AlgebraicModuliForArithmeticGeometry (34). EquivariantIntersectionTheory (#1685, a new roadmap) is not in the order and does not cite this roadmap, so no cycle arises.
- **Outside the folder.** `git diff --stat origin/main...HEAD` without the folder is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/GroupSchemesOverABase/Suggested.lean`, run from the repository root, exits 0. It gives 25 `declaration uses 'sorry'` warnings, at lines 83, 116, 122, 129, 136, 143, 179, 196, 210, 226, 234, 244, 261, 270, 282, 289, 294, 301, 310, 317, 326, 334, 346, 361 and 377, and no other output.
- **Signature probe.** I appended `#check @…` for all 33 declarations to a scratch copy and elaborated it: 33 types printed, no error. Every hypothesis is in its declaration's own signature. Examples: `[CharZero k] [LocallyOfFiniteType G.X.hom]` in `smooth_of_charZero`; `[QuasiCompact …] [Mono …]` and both `LocallyOfFiniteType` binders in `isClosedImmersion_of_mono`; `[QuasiCompact G.X.hom]` in `exists_isLimit_of_quasiCompact`. Each type matches its README statement at the same generality. Nothing changed.
- **One-tactic probe.** Every `sorry` was replaced by `first | rfl | infer_instance | simp | exact AlgebraicGeometry.smooth_of_grpObj _ | exact ⟨_, 𝟙 _, …⟩` on a scratch copy. All 25 theorems fail; nothing closes, so there is no padding.
- **No duplication at the pins.** The Tau Ceti Cartier theorem `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` (`TauCeti/AlgebraicGeometry/Group/Cartier.lean:32`) needs `[IsAffine G.left]`, so `smooth_of_charZero`, for groups locally of finite type, is not a restatement. Mathlib's `smooth_of_grpObj` (`Mathlib/AlgebraicGeometry/Group/Smooth.lean:62`) needs `GeometricallyReduced`. Neither pin has Perrin's theorem, nor a group-scheme "monomorphism ⇒ closed immersion".

### Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d)

- **All 31 Tau Ceti names in the README resolve.**
  - 24 by `#check` in a scratch file: `groupScheme`, `groupSchemeMap`, `etale_of_isUnit_card`, `smooth_iff_isUnit_card`, `isShortExact_mapDomainBialgHom`, `faithfullyFlat_mapDomainRingHom_of_injective`, `cartierDualIso` (type: `cartierDual R (finiteLocallyFreeGroupScheme R G) ≅ ConstantGroup.finiteLocallyFreeGroupScheme R ↑G`), `BialgHom.centralizerHopfIdeal`, `AbelianVariety`, `multiplicativeTypeCommHopfAlgProperty`, `torusCommHopfAlgProperty`, `HopfIdeal.IsMaximalTorus`, `smoothCommHopfAlgProperty_of_geometricallyReduced`, `geometricallyConnectedCommHopfAlgProperty.irreducibleSpace`, `identityComponentSpec`, `identityComponentSpecι`, `geometricallyConnected_identityComponentSpec`, `galoisFiber`, `isEquivalence_galoisFiber`, `galoisEquivalence`, `galoisEquivalenceGrp`, `stabilizer_eq_closure_wallReflections`, `RootPairing.exists_mem_dominantChamber` and `FGCommGrpCat`.
  - 7 by reading the source, because their object files are not built: `BialgHom.smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal` (`Centralizer/Smooth.lean:290`), `BialgHom.weylGroup` (`Normalizer/WeylGroup.lean:93`), `componentGroupScheme`, `isFinite_componentGroupScheme` and `etale_componentGroupScheme` (`ComponentGroup/FiniteEtale.lean:51, 69, 75`), `componentGroupFppfGroupObjectIso` (`Representable.lean:408`), `componentEtaleHomEquiv` (`UniversalProperty.lean:96`), and `smooth_of_grpObj_of_charZero` (`Group/Cartier.lean:32`). Each is in the namespace the README gives.
- **Mathlib names resolved by `#check`:** `hopfSpec`, `Functor.mapGrp` (needs `F.Monoidal`), `Over.pullback`, `specULiftZIsTerminal`, `Scheme.Hom.fiber`, `fromSpecResidueField`, `toSpecΓ`, `GeometricallyConnected/Irreducible/Reduced`, `IsSeparated`, `IsFinite`, `AlgHom.equalizer`, `AddMonoidHom.toMultiplicative`, `AddCommGroup.torsion`, `Grp.mk`, `Grp.forget`, `KernelFork.ofι`, `Functor.mapCone`, `homOfLE`, `IsAffineHom`, `smooth_of_grpObj`. The instance `IsClosedImmersion η[G].left` is at `Mathlib/AlgebraicGeometry/Group/Abelian.lean:35`.
- The two "Lean names found nowhere" in `scratch/citations.md`, `IsMultiplicativeType.exists_etale_cover` and `.isotrivial`, are this roadmap's own declarations (`Suggested.lean` lines 179 and 196).

### Cross-roadmap citations resolved

- **On main (94294cd).**
  - ReductiveGroups: Layer 2 (line 227), Layer 3 bullets *Normality and quotients* (237) and *Identity component `G°`…* (242), Layer 6 radical (466), Layer 7 conjugacy (627), Layer 8 relative bullet (1028; see R01), 9B (1610).
  - SchemeAndStackFoundations §§0.6 (678), 0.9 (848), 1.17 (2624), 2.3 `NonabelianH1` (3330), 2.9 (3582), 2.11 (3656), 3.4 (4789).
  - ModularCurves 0B (688; constructs `D_S(M)` and `μ_N = D_S(ℤ/Nℤ)` and cites Tau Ceti's `cartierDualIso`), 0C (779), 0E (839).
  - SchubertGeometry Conventions (7), S3 (46), S7 (93; its first item is the extremal-section divisor with coefficient `⟨λ, β∨⟩`).
  - FlagVarieties (line 19, "GroupSchemesOverABase GS7 owns relative `Bor(G)`", matched by line 1410).
- **At open heads (`roadmaps show`).**
  - AlgebraicModuliForArithmeticGeometry §7.9 (#853, line 9792): the fibrewise identity-component subfunctor over a locally Noetherian base.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.4 (#879, line 805).
  - InverseGaloisAndArithmeticFundamentalGroups IG.0.3 (#850, line 696; its Checks glue `ℤ²` on the nodal curve by `[[1, 1], [0, 1]]`) and IG.0.4 (line 880).
  - NeronModelsAndSemistableAbelianVarieties 2.3 (#852, line 1232; line 47 names "GroupSchemesOverABase GS4.2").
  - AbelianSchemesAndArithmeticModuli A0.1 (#849, line 589).
  - EquivariantIntersectionTheory 1.1 (#1685, `Pic^G`) and 1.3 (`0 → X*(G) → Pic^G(X) → Pic(X)` for `G` connected and `X` normal with `k[X]^* = k^*`).
  - PCurvature Layer 0 (#1747, line 145: restricted Lie algebras).
  - SpringerResolutionAndCharacteristicCycles (#1828 head f8ea4db6, line 10: "GroupSchemesOverABase §7.6 constructs the multiplicative Grothendieck–Springer space").
- **Open revisions of main suppliers.**
  - SchemeAndStackFoundations at #1276, #1656 and #1808: all seven cited sections are present under the same numbers.
  - ModularCurves at #1808: 0B, 0C and 0E are present.
  - SchubertGeometry at #1224: S3 and S7 become Layers 3 and 7, with first items S3.1 "Associated lines and their fibres" and S7.1 "Divisor valuations" (the same content).
  - ReductiveGroups at #1332, #1676 and #1808: Layers 2, 3, 6 and 7 are unchanged, and the Layer 8 bullet moves (R01).
- **Ownership by object for the new targets.** `roadmaps grep` over main and the 466 open heads for Perrin's approximation, "monomorphism … closed immersion" and Cartier's theorem finds no other owner of 4.1's monomorphism statement, 4.5's non-affine Cartier, or 4.9. Other hits are Cartier for affine groups through Tau Ceti (ClassicalGroups, FormalConnectionsOpers, AdelicAlgebraicGroups), or monomorphisms of v-stacks (DiamondsAndVStacksPartII).
- EndoscopicTransferAndUnitaryTraceComparison (#999) §§3.4–3.5 owns the additive Kostant section and regular centralizer over `𝔤 → 𝔠`. Those are distinct from 7.4–7.5 on `G → T/W`.

### Sources read (the seeded sample and the changed passages)

- **0.2:** sga3-6b lines 808–810 (VI_B 3.9: `G⁰` open, quasi-compact over `S`) and 821–826 (3.10 (i)–(iv): smoothness along the unit section suffices).
- **1.1, 1.2, 1.3:** sga3-8 lines 137–164 (VIII 1.5, 1.6), 273–282 (2.1 a)–e)), 304–343 (3.1, 3.2).
- **1.5:** ModularCurves 0B and the Tau Ceti type of `cartierDualIso` (above). Cartier duality is involutive, so "`D_S(M)` is the dual of `M_S`" is the same statement.
- **3.1:** sga3-10 lines 132–140 (X 2.1, nil-ideal); sga3-9 lines 304–307 (IX 3.3) and 318–324 (3.6).
- **3.3:** sga3-9 lines 663–665 (IX 4.7) and 686–688 (4.8).
- **3.4:** sga3-11 lines 819–821 (XI 4.2: `G` smooth affine, `H` of multiplicative type of finite type; smooth and separated); sga3-10 lines 903–905 (X 5.8).
- **3.6 transporter:** sga3-11 lines 371–376 (XI 2.5, `K ⊆ G`), 1198–1204 (6.1) and 1235–1255 (6.2 and its proof).
- **4.1 monomorphisms:** sga3-6b lines 193–198 (VI_B 1.4), 262–274 (1.4.2 with its route: EGA IV₁ 1.6.1, EGA IV₃ 8.11.5), 277–279 (1.4.3) and 81–83 (1.2.2); ega4-3 lines 1547–1550 (8.11.5); milne-iag2017 lines 4643–4644 (Theorem 5.34).
- **4.4:** sga3-10 lines 1478–1515 (X 8.7: definitions, with `ρ_u = ρ_n − ρ_r − ρ_ab`, and all five inequalities, `ρ_ab` included); sga3-12 lines 106–112 (XII 1.5).
- **4.5 Cartier:** sga3-6b lines 300–319 (VI_B 1.6 and 1.6.1, route through EGA IV₄ 16.12.2 and 17.12.5); sga3-6a lines 220–229 (VI_A 1.3.1 (ii bis) ⇒ (ii)); ega4-4 line 3365 (17.12.5); milne-iag2017 lines 3236 (3.23, affine), 3283–3286 (Remark 3.28, the monoid `k[T]/(T^n)`) and 6685 (8.39).
- **4.9:** perrin1976 (Numdam BSMF_1976__104__323_0, fetched into a scratch manifest; the board manifest is unchanged).
  - Lines 100–109 (property (L) 1°–3°: filtered, fpqc quotients, affine from some index): these match the conjuncts of `exists_isLimit_of_quasiCompact`.
  - Lines 116–121 (0.0–0.2), 327–353 (3.1.1), 367–384 (3.3.1), 389–421 (4.1.1–4.1.4), 425–431 (4.2.2), 432–440 (4.2.3–4.2.5), 447–448 (4.2.8).
  - Lines 46–50: the introduction cites EGA IV 8.13.6 and DG III 3.7.5.
  - sga3-6a lines 1574–1582 (VI_A 6.5), 1586–1589 (6.6), 1617–1631 (6.7) and 1643–1651 (6.9).
- **5.2–5.4:**
  - 5.3 route: EGA II (Numdam PMIHES_1961__8__5_0) line 5554 (7.1.9); EGA IV₂ (Numdam PMIHES_1965__24__5_0) line 1293 (2.8.5); sga3-6b lines 4521–4523 (VI_B 12.10.1); ega4-3 lines 7756–7758 (13.1.3, Chevalley).
  - 5.2, 5.4: sga3-12 lines 124–141 (XII 1.7 a)–d)) and 213–218 (1.10).
- **6.3:** no source is cited (R09). The statement was checked mathematically (rows 34 and 40).
- **7.2:** steinberg1965 lines 592–625 (6.1–6.4; R08).
- **7.3:** steinberg1965 lines 61–71 (1.3 and the remark extending it to reductive groups).
- **7.4:** steinberg1965 lines 77–82 (1.4), 770–772 (7.1), 842–843 (7.9) and 928–932 (8.1); conrad-rgs line 11841 (Lemma B.3.1); ega4-4 lines 3056–3060 (17.9.5).
- **7.5:** steinberg1965 8.1; ega4-3 lines 5571–5578 (11.3.10).
- **7.6:** steinberg1965 line 42 (1.1).

### Adversarial table

Rows for unchanged statements that I did not recompute carry the previous round's values, marked "(r9)".

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | 0.1 `baseChange` | `f = 𝟙 S`; `D_ℤ(ℤ/2)` to `𝔽₂`; `S′ = ∅` | chosen pullback, iso not equal; `𝔽₂[t]/(t² − 1) = 𝔽₂[t]/(t − 1)²`, non-reduced; `End(𝔾_m)` goes from `ℤ` to a singleton, not faithful | ok |
| 2 | `exists_identityComponent` (0.2) | `𝔾_{m,S}`; `(ℤ/2)_S`; `μ₂/ℤ`; `S = ∅` | `G⁰ = G`; unit component open; excluded (not smooth: one point at `2`, two over `ℚ`); vacuous | ok; RGPartII overlap R07 |
| 3 | 1.1 Checks | `D_S(0)`; `D(ℤ)`; `D_ℤ(ℤ/2)` at `3`, `2` | `S` (VIII 2.1 d)); `O_S[t^{±1}]`; `(t − 1)(t + 1)`, two reduced points; `(t − 1)²` | ok |
| 4 | `bijective_diagonalizableMap` | connected `S`; `Spec(k × k)`; `∅`; `Hom(μ₂, 𝔾_m)` | `ℤ`; `ℤ²` (excluded); excluded; `Hom(ℤ, ℤ/2) = ℤ/2` | ok |
| 5 | `smooth_/etale_diagonalizable_iff` | `ℤ/6` over `ℤ`; `M = ℤ`; `M = 0`; `ℤ/p` over `𝔽_p` | `6 = 0` in `𝔽₂, 𝔽₃`, so smooth exactly over `ℤ[1/6]`; card of the torsion is `1`: smooth, not étale (`ℤ` infinite); étale; `(t − 1)^p` | ok |
| 6 | `isKernel_`, `flat_surjective_diagonalizableMap` | `n·id`; `0 → ℤ`; `ℤ → 0`; `φ = 0` on `ℤ` | `μ_n = D(ℤ/n)`; `𝔾_m → S`, kernel `𝔾_m`; unit section not flat (excluded by `hφ`), kernel `D(0)`; kernel `D(ℤ/0) = 𝔾_m` | ok (r9) |
| 7 | 1.5 Cartier duality | `ℤ/n`; `0`; `(ℤ/2)²` | `Hom((ℤ/n)_S, 𝔾_m) = μ_n`, also over `𝔽_p` with `p ∣ n`; trivial; `μ₂ × μ₂` | ok |
| 8 | 2.1–2.2 predicates | `μ_p`; `𝔾_a`; norm-one torus; `M = 0`; Kummer over `𝔽₂` | multiplicative, not a torus; `X* = 0`; split by `ℂ`, `X*(ℝ) = 0`; rank 0; fppf, not étale | ok (r9); API R05 |
| 9 | `IsMultiplicativeType.isotrivial`, `exists_torus_not_isotrivial` | `Spec(k × k)`; nodal curve; `n`-cycle | not connected; monodromy `[[1, 1], [0, 1]]`, infinite; `[[1, n], [0, 1]] ≠ 1` | ok (r9) |
| 10 | `bijective_baseChange_map_of_thickening` | `k[ε]`; `𝔾_a`; Check: `{0} ⊂ 𝔸¹_ℂ`; `Spec(k × k)` | `ℤ = ℤ`; `(1 + ε)t` (excluded); all groups split, `Hom(N, M)` on both sides: bijective; `ℤ² → ℤ` not injective | statement ok; Check false R02 |
| 11 | `hom_eq_of_eq_fibre`, `eq_of_eq_on_torsion` | `t, t⁻¹`; `Spec(k × k)`; `𝔾_a` char 0; `μ_n` | differ on every fibre; excluded; `𝔾_a[n] = 1` (not multiplicative); `H[n] = H` | ok (r9) |
| 12 | 3.4 Checks | `Hom(𝔾_m, 𝔾_m)`; `Hom(μ_p, 𝔾_m)` over `𝔽_p`; `Hom(𝔾_m, GL₂)` | `ℤ_S`; `ℤ/p` (VIII 1.5); components indexed by `a ≥ b`, infinitely many | ok |
| 13 | 3.6 transporter Check | `u = diag(t, 1)`, `K = diag(1, s)`; `K = u(𝔾_m)` | `g·diag(t, 1) = diag(1, t)·g` gives `a(t − 1) = 0` and `d(1 − t) = 0`, so `g` is antidiagonal and misses `1`; eigenvalues `{t, 1} = {s, 1}` give `s = t`, so `Z_G(u)` is diagonal | ok |
| 14 | `isClosedImmersion_of_mono` | `μ_n ↪ 𝔾_m`; `𝔾_m → 𝔾_m ⋊ ℤ/2`; `ℤ_k → 𝔾_a`; Frobenius of `𝔾_a` | closed; open and closed; not quasi-compact (excluded), image dense; kernel `α_p ≠ 1`, not mono | true; build order R03, Check R04 |
| 15 | `chevalley` | `A × 𝔾_m`; `A[2] × 𝔾_m` | `L = 𝔾_m`; disconnected, `2^{2g}` components | ok (r9) |
| 16 | `affinization` | `(ℤ/2)_k`; non-split `A`-by-`𝔾_a`, char 0 | `k × k`; `G_affq = 1 ≠ L = 𝔾_a` | ok (r9) |
| 17 | 4.4 ranks `(ρ_ab, ρ_r, ρ_n, ρ_u, d_s)` | `E`; `𝔾_m`; `𝔾_a`; `GL_n`; `B ⊂ GL₂`; `A × GL_n` | `(1,0,1,0,0)`; `(0,1,1,0,0)`; `(0,0,1,1,0)`; `(0,n,n,0,n²−1)`; `(0,2,2,0,0)`; `(g,n,g+n,0,n²−1)`, with `ρ_u = (g+n) − n − g = 0` | ok |
| 18 | `isSeparated_of_field`, `smooth_of_isReduced`, `exists_reduced_subgroup` | `S`-group glued along `S − {s}`; `Y^p = tX^p`; `μ₃ ⋊ ℤ/2` over `𝔽₃` | not separated, needs a field; not geometrically reduced; `G_red = ℤ/2`, not normal | ok (r9) |
| 19 | `smooth_of_charZero` | `μ_n/ℚ`; `ℤ_ℚ`; `μ_p/𝔽_p`; `∏_ℕ 𝔾_a`; monoid `k[T]/(T²)` | étale; étale, not quasi-compact; excluded, `(t − 1)^p`; excluded, reduced, not smooth; not a group, non-reduced | ok |
| 20 | `exists_identityComponent_of_field`, `isIrreducible_connectedComponent` | `μ₃/ℚ`; `μ_p`; `ℤ_k`; `xy = 0` | `G⁰ = Spec ℚ`; `G⁰ = μ_p`; `G⁰ = e`; reducible but not a group | ok (r9) |
| 21 | `exists_connectedComponentScheme`, `exists_componentGroup` | `ℚ(i)`; `k[x]/(x²)`; `μ₃/ℚ`; `ℤ_k`; `𝔾_m ⋊ ℤ/2` | `X`; `Spec k`; `μ₃` (3 geometric points, 2 points); `ℤ_k`; `ℤ/2` | ok (r9) |
| 22 | `exists_isLimit_of_quasiCompact` | `G` of finite type; `∏_ℕ 𝔾_m`; `(ℤ_p)_k`; `ℤ_k` | one-point `I`; `G_n = 𝔾_m^n`, kernel `∏_{m>n} 𝔾_m`, affine; `G_n = (ℤ/p^n)_k`; not quasi-compact (excluded), and the limit of `ℤ/n` is `ℤ̂ ≠ ℤ_k` | ok |
| 23 | `exists_flat_closedImmersion_factorization` | `id`; `t ↦ t^p` on `𝔾_m/𝔽_p`; `μ_n ↪ 𝔾_m`; `𝔾_m × ℤ_k → ℤ_k`; `ℤ_k → 𝔾_a` | `Q = G`; flat with kernel `μ_p`, `Q = 𝔾_m`; `Q = μ_n`; `G` not quasi-compact, `u` affine, `Q = ℤ_k`; not quasi-compact (excluded), and a closed point is not flat over `𝔸¹` | ok |
| 24 | 4.9 quotient Check | `∏_ℕ GL₂ ⊇ ∏_ℕ B` over `ℂ` | `G/H = ∏ ℙ¹` not representable (Perrin 4.2.2) | ok |
| 25 | 5.1 rank functions | `𝔾_{m,S}`; `G^(p)`; abelian scheme | constant; `ρ_r` goes `1 → 0`; `ρ_ab = ρ_n = dim`, others `0` | ok |
| 26 | 5.2 (XII 7.1) | `E × 𝔾_m`; X 8.3 group; `GL_n` | `Z_G(1 × 𝔾_m) = G`; no fpqc-local maximal torus; diagonal torus | ok (r9) |
| 27 | 5.3 `ρ_ab` route | Weierstrass split multiplicative; `G^(p)`; abelian scheme | `ρ_ab` goes `1 → 0`, `L̄` the unit section, special fibre dim `0 ≤ 1`; `L̄ = G`, special fibre `𝔾_a ⊆ L(s)`, dim `1 = 1`; `L = 1`, equality | ok |
| 28 | 5.3 `d_s` | Iwahori of `SL₂`; `GL_n` | `0 ≤ 3`; constant `n² − 1` | ok (r9) |
| 29 | 5.4 | `G^(λ)`; `𝔾_m × 𝔾_a` | `ρ_r = 1` on `D(λ)`, `0` on `V(λ)`; constant `(1, 1)` | ok (r9) |
| 30 | 5.5 | supersingular `A_s`; class `0` | `P = x^p`; `G_affq = 𝔾_a` on both fibres | ok (r9) |
| 31 | 6.1–6.2 | `SL₂`; `PGL₂`; `GL_n`; torus | `𝓛(ϖ) = O(1)`, `Pic = 0`; `ℤϖ/2ℤϖ = ℤ/2`; `ℤ^{n−1}`, kernel `ℤ det`; `0` | ok (r9) |
| 32 | 7.1–7.2 | `SL₂`; `PGL₂`; `GL_n` | `tr ↦ t + t⁻¹`, `ℤ[t^{±1}]^W = ℤ[t + t⁻¹]`; isomorphism by Steinberg Cor. 6.4, not 6.1 (b); `T/W = 𝔸^{n−1} × 𝔾_m` | true; locator R08 |
| 33 | 7.3–7.4 | `SL₂`; `SL₂ × 𝔾_m` | `{±1}` of codim `3`; `x_α(1)x_{−α}(−1)x_α(1) = [[0, 1], [−1, 0]]`, `κ(c) = [[−c, 1], [−1, 0]]`, trace `−c`; `C ⊂ SL₂ × {1}`, dim `1 < 2` | ok |
| 34 | 6.3 | `S = Spec k`; `SL₂`; `GL₂` | 6.2; `Pic(ℙ¹_S) = Pic(S) ⊕ ℤ`, `D_α = ∞`; `det ↦ 0`, `D_α ↦ 1` | true; no locator R09 |
| 35 | 7.5 | `u` in char 2; `c = 2` over `ℚ`; `c ≠ ±2` | `k[a, b]/((a − 1)²)`, non-reduced; `σ(2) = [[2, 1], [−1, 0]]`, `N = [[1, 1], [−1, −1]]`, `N² = 0`, centralizer `aI + bN` with `a² = 1`, i.e. `μ₂ × 𝔾_a`; torus split iff `c² − 4` is a square | ok |
| 36 | 7.6–7.8 | `SL₂` regular semisimple, regular unipotent, `±1`; torus | `{t, t⁻¹}`, 2 Borels; `k[t]/(t − 1)²`, 1 Borel; `ℙ¹`; `Pic(G̃) = ℤ`, `Pic(G) = 0`; a torus is its own `X̃` | true; no locator R09 |
| 37 | Summary vs 5.3–5.4 | X 8.7's five inequalities | `ρ_ab` for every `G`; `ρ_r + ρ_ab`, `ρ_n`, `ρ_u`, `d_s` for affine `G` only; non-affine left open (Research context) | ok |
| 38 | Supplier ids | RG at #1332, #1676, #1808 | Layer 8 bullet moves to §8.2 / 9D; "Layer 8" becomes split groups | R01 |
| 39 | Downstream consumers | FlagVarieties; NM; SpringerRes; EIT; PFC | named; named; named; 0 occurrences; 38 occurrences, unlisted | R06 |
| 40 | 6.3 route | `S` normal | `Pic(𝔸^N_S) = Pic(S)`; on a normal integral `X`, a rational section's divisor lies on `⋃ D_α`, and the `D_α` are Cartier | ok |

## Not verifiable

- **Demazure–Gabriel, *Groupes algébriques* I** (II §6 1.1; III §3 5.4, 7.5, 8.2): a book, with no legal online copy. Its III §3 7.5 is confirmed indirectly, because Perrin's introduction cites it for the affine case (perrin1976 line 49).
- **Slodowy LNM 815, ch. 3–4** (7.3, 7.6, seeded): paywalled. 7.6's other locator, Steinberg 1.1, was checked.
- **Also not readable:** Jantzen II.1.8 and II.4.4; Humphreys Theorem 1.12 (supplied by `TauCeti.stabilizer_eq_closure_wallReflections`); Bourbaki Lie VI §3 no. 4; Popov 1974 §4; Milne's CUP print (the author's 2017 PDF has the same numbers).

## Source issues

- **Misprint** in sga3-11 at Exp. XI, 6.2, printed p. 114: the statement takes `K` to be a closed subgroup scheme of `H`; it should be of `G`, as in 2.5 and the proof, which pulls back `K ⊂ G`; affects nothing.
- **Misprint** in perrin1976 at Corollaire 4.2.3, printed p. 334: the homomorphism is named `f`, but its kernel is written `Ker u`; the two letters should agree; affects nothing.
