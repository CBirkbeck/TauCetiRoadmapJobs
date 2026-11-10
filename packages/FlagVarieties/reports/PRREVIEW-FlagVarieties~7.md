# Review of FlagVarieties (pull request #2114 at 8480250)

**Verdict:** needs changes

🤖 Independent AI review. This is a full review of the folder at 8480250. The README has 292 lines and `Suggested.lean` has 88; against main the folder changes by +56/−45.

The gate passes, the dependency check reports no problem, and every finding of the previous review is repaired or moot.

The nine findings below are in passages that earlier rounds did not raise:
- 0.3 claims a conclusion that needs a hypothesis.
- Two declared gaps are not minimal.
- Layer 1.1 plans lemmas the pinned Tau Ceti already proves.
- Five P3 items cover a build-order omission, a generality mismatch, an off-by-one, a vacuous Check and the README's shape.

## Previous findings (PRREVIEW-FlagVarieties~6, head c2f3de4)

- **R01 (seven unpinned §4.0 declarations): repaired.** §4.0 is gone. A grep of the folder for all seven names finds nothing.
- **R02 (second owner of complete `G/B`): repaired.**
  - README:62 restores "What ReductiveGroups must provide (gap:complete-borel-quotient): `G/B` is proper over `k` for a Borel `B` of a smooth connected affine `G`".
  - Row 50 and 4.1's *Needs:* (README:202) consume it.
  - `exists_closed_projectiveOrbit_borel_quotient` is deleted.
- **R03 (complete-flag duplicate and the stated SchubertGeometry consumer): repaired.**
  - The second Scope paragraph is deleted.
  - README:275 reads "There are no downstream roadmap consumers."
  - 6.1 (README:256) no longer mentions §4.0.
- **R04 (upward ShimuraData and GroupSchemesOverABase): repaired.**
  - Neither name occurs in the folder.
  - README:23 realizes `G/H` by the pinned projective orbit.
  - The dependency check reports 0 problems.
- **R05 (five gaps that the pin provides): repaired.**
  - The five gap paragraphs are deleted, and rows 43–47 cite the pinned declarations.
  - 3.1 (README:170) derives `N_G(B)(k)=B(k)` from `gap:tits-system-of-points` and `TitsSystem.normalizer_subgroupB`.
  - Docstring items 1–2 now name only the reductive Tits system and `P_J`.
- **R06 (headline 3 absent): repaired.** `Suggested.lean:73–86` states it exactly as proposed, and README 4.2 (line 208) names it.
- **R07 (pull-request numbers and process words): repaired.** The gate reports `prnum=0`. A grep for "in progress", "merged", "(main)", "today", "PR #" and `#NNN` finds nothing.
- **R08 and R09: moot**, since §4.0 is deleted.

## R01 (P2) — 0.3 claims that every stabilizer of a homogeneous variety is smooth

**Location.** `TauCetiRoadmap/FlagVarieties/README.md:92`: "For an action as above and x∈X(k), use the native scheme-theoretic stabilizer H=Stab_G(x). Establish finite type and smoothness of H, and that the orbit map identifies X with the represented fppf quotient G/H."

**Claim.** "An action as above" is a homogeneous G-variety in the sense of the Conventions (README:36): nonempty, smooth, separated, of finite type, and transitive on geometric points. Such an action can have a nonsmooth scheme-theoretic stabilizer. Smoothness of H is therefore a hypothesis, not something 0.3 can establish.

The section's own Check (README:94) is an instance. The Frobenius-twisted `SL₂`-action on `ℙ¹` satisfies the Conventions definition, and its stabilizer is `F⁻¹(B)`, with ideal `(c^p)`. The Check calls this example "excluded", but nothing in 0.3 excludes it; only headline 4 (README:10) and the gap contract at README:66 carry a smooth-stabilizer hypothesis.

The hypothesis does real work downstream. A G-equivariant isomorphism preserves scheme-theoretic stabilizers, so `ℙ¹` with the twisted action is G-isomorphic to no `G/P_J`.

**Witness.** Milne2017 line 6055–6058 (Remark 7.14, p.142): `SL_p` acting on `PGL_p` by left translation in characteristic `p` has stabilizer `μ_p`, which is not smooth. `PGL_p` is smooth, separated, of finite type and homogeneous.

**Repair.**
- Replace the first two sentences of 0.3 with: "For an action as above, x∈X(k), and the native scheme-theoretic stabilizer H=Stab_G(x), assume H smooth. Establish that H is of finite type and that the orbit map identifies X with the represented fppf quotient G/H."
- Rewrite the last item of the 0.3 Check as: "a Frobenius-twisted `SL₂` action on `ℙ¹` is homogeneous in the sense of the Conventions, but its stabilizer `F⁻¹(B)`, with ideal `(c^p)`, is not smooth. It is excluded by the smooth-stabilizer hypothesis, and it is not G-isomorphic to any `G/P_J`."
- Add the negative control "`SL_p` acting on `PGL_p` in characteristic `p` has stabilizer `μ_p` (Milne Remark 7.14, p.142)."

On both instances the repaired 0.3 makes no claim, and headline 4 already excludes them.

## R02 (P2) — `gap:orbit-map-quotient` asks ReductiveGroups for the isomorphism that 0.3 proves here

**Location.** `README.md:66`: "What ReductiveGroups must provide (gap:orbit-map-quotient): for a transitive action on a smooth separated finite-type `X` with `k`-point `x` and smooth stabilizer `H`, the orbit map induces an isomorphism `G/H ≅ X`". The gap also appears in row 49; 0.3 is at README:92–96.

**Claim.** 0.3 owns the same statement: "Establish … that the orbit map identifies X with the represented fppf quotient G/H". It also gives its own route: a transitivity-to-local-surjectivity adapter, the orbit-map fibre identity, and the quotient universal property.

So the isomorphism has two owners, and the gap asks for something this roadmap plans. 0.3's *Needs:* line (README:96) does not consume the gap either.

**Witness.** ReductiveGroups on main, 3A.1 (line 264), constructs the orbit maps μ_x and "the stabilizer as the scheme fibre over x". Its Layer 3A has no algebraic `G/Stab_G(x) ≅ X`; 3A.5 has only the complex-analytic `G(ℂ)/H(ℂ) ≃ O_x(ℂ)`.

**Repair.**
- Keep 0.3 as the owner, with the smooth-stabilizer hypothesis from R01.
- Delete the paragraph at README:66, and delete `gap:orbit-map-quotient` from row 49.
- Write 0.3's *Needs:* as: "ReductiveGroups 3A.1 orbit maps and scheme stabilizers; `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean`); SchemeAndStackFoundations Layer 1 descent."

## R03 (P2) — `gap:borel-fixed-point-scheme` is not minimal: the pinned projective fixed-point theorem is enough

**Location.**
- `README.md:64`: "a smooth connected solvable group acting on a nonempty proper `k`-scheme over algebraically closed `k` has a `k`-rational fixed point".
- Row 51; 4.2 at lines 206, 208 and 210; Layer 4 Dependencies at line 226.
- `Suggested.lean:24` ("the fixed point for proper schemes") and `:29` ("Its proof needs the Borel fixed-point theorem for general proper schemes.").

**Claim.** The gap is used only in 4.2, and in 4.3 through 4.2, and always for `G/H`. This roadmap realizes `G/H` as the orbit scheme `O` in `P(M)` (README:23, 196). The second paragraph of 4.1 already shows that if `O` is proper, then `Comodule.projectiveOrbitι` is a closed immersion. The rest of 4.2 then follows from pinned results:

1. The image of `O` is a nonempty closed `G(k)`-stable subset of `P(M)`, so it is also `B(k)`-stable.
2. Corestrict `M` along `O(G) → O(B)`. The pinned projective Borel fixed-point theorem applies to `B` acting on `P(M)`.
3. It gives a `B(k)`-fixed closed point `g·[m]` of the orbit. So `g⁻¹B(k)g ⊆ H(k)`, and 0.1 gives `g⁻¹Bg ⊆ H`.

The theorem for general proper schemes is never needed. The docstring also lists this proof input as something headline 4 lacks, but it is not a carrier.

**Witness.**
- `TauCeti.Comodule.exists_fixed_mem_of_isClosed_of_isSolvable` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/FixedPoint/Existence.lean:73`). For a reduced connected solvable group, every nonempty closed translation-invariant subset of the projective space contains a fixed closed point.
- Corestriction is `TauCeti.Comodule.Corestrict` (`Algebra/Coalgebra/Comodule/Corestrict.lean:73`).

**Repair.**
- In 4.2, replace "apply Borel fixed point to the left B-action" with the closed-orbit route above, citing both declarations.
- Replace the second and third sentences of README:208 with: "Properness of the orbit scheme makes its immersion into P(M) closed (4.1), and the pinned projective Borel fixed-point theorem applies to the corestricted B-action."
- In the *Needs:* line (210), replace "complete-scheme Borel fixed point" with the two declarations.
- Delete the gap paragraph (64) and row 51, and delete "ReductiveGroups 3A complete-scheme fixed point" from line 226.
- In `Suggested.lean`, delete "and the fixed point for proper schemes" (line 24) and the second sentence of line 29.

Tested on `SL₂` with `H = B`: the orbit of `[e₁]` in `P(k²)` is `ℙ¹`, which is closed, and `B(k)` fixes `[e₁]`. So `g = 1` and `B ⊆ H`.

## R04 (P2) — Layer 1.1 and §3.1 plan results that the pinned Tau Ceti already proves

**Location.**
- `README.md:112`: "Prove the block-triangular point description of the weight ideal, classify the point subgroup using the abstract `B W_J B` theorem, … Prove that each weight ideal is parabolic and its label unique."
- `:116`: "The weight-ideal comparison and parabolicity are proved in this layer."
- `:168`, the first sentence of 3.1.

**Claim.** The pinned Tau Ceti (2fd255d) already proves the following, and the README cites none of it:
- **Block-triangular points:** `GeneralLinear.mem_weightParabolicPoints_iff` (`Algebra/AlgebraicGroup/GeneralLinear/Weight/Parabolic/Basic.lean:314`) and `mem_weightParabolicDefiningPointsSubgroup_iff_blockTriangular` (`:280`).
- **Comparison with the Tits system:** `GeneralLinear.standardParabolic_weightParabolicSimple` (`Weight/Parabolic/TitsSystem.lean:132`). For antitone `w`, the points of the weight parabolic are the `glTitsSystem` standard parabolic of the adjacent reflections with equal weights.
- **Parabolicity:** `GeneralLinear.isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal` (`Weight/Parabolic/Borel.lean:133`). Containment of the upper-triangular group for antitone `w` is `weightParabolicDefiningHopfIdeal_le_upperTriangular_definingHopfIdeal` (`:113`).
- **The existence step of 3.1** ("move a Borel contained in P to B"): `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean:217`). This is the existence half of headline 2.

**Witness.** Four of these elaborate in a scratch file at the pins; the two Basic/Borel helpers were read at the pin. For example, `isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal : ∀ {N} (k) [Field k] [IsAlgClosed k] (w : Fin N → ℤ), IsParabolicOverAlgClosed k (of k (coordinateHopfAlgebra k N)) (weightParabolicDefiningHopfIdeal k w)`.

**Repair.**
- In 1.1, replace the sentences at lines 112 and 116 with: "The block-triangular points, the comparison with the `glTitsSystem` standard parabolic, and parabolicity are pinned (the names and files above). This layer proves three things:
  - that `standardWeight J` is antitone, with equal adjacent weights exactly at the indices in `J`, so that `weightParabolicSimple` of `standardWeight J` corresponds to `J`;
  - that `Q(k)` is classified by `standardParabolic_eq_of_subgroupB_le`, and the ideal is recovered by `HopfIdeal.eq_of_quotientPointsSubgroup_eq`;
  - that the label is unique."
- Add the four pinned GL names to 1.1's *Needs:*, to its Dependencies and to row 48.
- In 3.1, write the first sentence as "By `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`), P has a conjugate containing B; apply 2.2." Add that name to 3.1's *Needs:* and to row 43.

## R05 (P3) — 4.1 uses a morphism `G/B → G/H` that no earlier layer or listed supplier constructs

**Location.** `README.md:196`: "The complete `G/B` from `gap:complete-borel-quotient` maps surjectively to the separated finite-type `G/H`; properness descends along this map." The *Needs:* line is at `:202`.

**Claim.** The subgroup-induced morphism of representing schemes `G/B → G/H` is constructed only in Layer 5: 5.1 (README:232) says "Establish the equivariant descent construction". The supplier row for the quotient universal property (README:53) is also scoped to "Layer 5". 4.1's *Needs:* lists neither, so Layer 4 silently depends on Layer 5.

**Witness.**
- Milne2017 line 14610–14611 (the proof of Theorem 17.16, p.356) obtains the map `G/B → G/P` from Proposition 5.22. The README places Proposition 5.22 at 5.1 (README:292).
- At the pin there is only the sheaf-level `CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv` (`Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:281`).

**Repair.**
- In 0.2 add: "For closed subgroups `N ⊆ N′`, construct the morphism `G/N → G/N′` of representing schemes from `CommHopfAlgCat.fppfHomogeneousQuotientHomEquiv` and the quotient universal property (Milne Proposition 5.22, p.104)." Put SchemeAndStackFoundations Layer 1 in 0.2's *Needs:*.
- Extend row 53 to "Layers 0, 4 and 5".
- Add "0.2's subgroup-induced morphism" to 4.1's *Needs:*. 5.1 and 5.2 then reuse it.

## R06 (P3) — Headline 3 holds for every smooth connected `G` in Lean, but the README states it only for reductive `G`

**Location.** `README.md:3` ("a smooth connected affine reductive group G") and `:9` (headline 3). `Suggested.lean:75–85` has `hG_smooth` and `hG_connected` and no reductivity hypothesis.

**Claim.** The Lean statement has the right generality. However, the README never says that 4.1–4.2 hold without reductivity, as it does say for the uniqueness half of headline 2 (README:21). So the README and the Lean differ in generality.

**Witness.**
- Take `G = G_a`, which is not reductive; its Borel is `G_a`.
  - `H = 1`: `G/H = 𝔸¹` is not proper, and `1` is not parabolic (false ↔ false).
  - `H = G_a`: `G/H` is a point and `H` is parabolic (true ↔ true).
- Milne2017 lines 14605–14609 (Definition 17.15 and Theorem 17.16) assume only that G is connected.

**Repair.** After README:21 add: "Headline 3 and §§4.1–4.2 hold for every smooth connected affine group over algebraically closed `k` (Milne Theorem 17.16, p.356); `isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed` is stated at that generality." Say the same in 4.2 (README:208).

## R07 (P3) — In 1.1 the retained flag dimensions are off by one for `J ⊆ Fin n`

**Location.** `README.md:110`: "The retained flag dimensions are the complement of `J`."

**Claim.** In 1.1, `J : Finset (Fin n)`, and an index `j` names the adjacent pair `(j, j+1)` of 0-based coordinates. The subspace it controls has dimension `j+1`, not `j`. The sentence is correct only for the 1-based labels of 6.1 (README:260).

**Witness.** Take `n = 2` and `J = {0}`. Then `standardWeight` is `(0,0,−1)`, which forbids the entries `(2,0)` and `(2,1)`. So the group stabilizes `⟨e₀,e₁⟩`, which has dimension 2. The complement of `{0}` in `Fin 2` is `{1}`.

**Repair.** Write: "The retained flag dimensions are `{j+1 : j ∈ Fin n, j ∉ J}`; the index `j` corresponds to the simple reflection `s_{j+1}` of 2.1 and 6.1."

Tested:
- `J = {0}` gives `{2}`, the plane, as "{s₁} retains the plane" at README:142 says.
- `J = {1}` gives `{1}`, the line.

## R08 (P3) — The 0.1 Check over 𝔽₂ does not test point detection

**Location.** `README.md:78`: "Inclusion `B ⊂ P_{s₁}` is reflected by the point-group orders `8 ∣ 24` over `𝔽₂`."

**Claim.** 0.1 detects subgroups by their points over an algebraically closed field: the pinned `HopfIdeal.le_of_quotientPointsSubgroup_le` requires `[IsAlgClosed K]`. Over `𝔽₂`, points and their orders do not reflect inclusion. The Check therefore also passes for the wrong construction, detection by `𝔽₂`-points.

**Witness.** In `GL₃`, `T(𝔽₂) = {1}`, so `B(𝔽₂) = U(𝔽₂)`, both of order 8. Yet `U ⊊ B`: over `𝔽₄`, `diag(a,1,1)` lies in `B` but not in `U` for `a ∉ 𝔽₂`.

**Repair.** Replace the item with: "Over `k = 𝔽̄₂`, `B(k) ⊊ P_{s₁}(k)`, because `1 + E₂₁` lies in `P_{s₁}(k)` and not in `B(k)`. Negative control: `B(𝔽₂) = U(𝔽₂)`, of order 8, although `U ⊊ B`; points over a non-closed field do not detect subgroups."

## R09 (P3) — The supplier contracts and Checks are not in the house shape

**Location.** `README.md:45–49` (the owner column), and the Checks at `:78`, `:94`, `:114`, `:142` and `:174`.

**Claim.**
- Rows 45, 46 and 48 contain only pinned Tau Ceti declarations, yet name "ReductiveGroups 3" or "ReductiveGroups 7C" as owner. An implementer who looks up `HopfIdeal.eq_of_quotientPointsSubgroup_eq` in ReductiveGroups Layer 3 will not find it.
- Rows 47 and 49 mix pinned declarations with ReductiveGroups gaps. Rows 43–44 already say "Tau Ceti".
- Each Check list is a run-on paragraph, not one bullet per test.
- `standardWeight` (1.1) and the type of a parabolic (3.1) have no API bullet list.

**Witness.** `HopfIdeal.eq_of_quotientPointsSubgroup_eq` is at `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Points/Separation.lean:83`. ReductiveGroups Layer 3 on main (line 234) names no declaration.

**Repair.**
- Set the owner of rows 45, 46 and 48 to "Tau Ceti".
- Split rows 47 and 49 into a Tau Ceti row with the pinned names and a ReductiveGroups row with the gaps.
- Write each `**Checks.**` as one bullet per test.
- Give `standardWeight` an API bullet list: it is antitone; adjacent weights are equal exactly at `J`; `standardWeight ∅` is strictly decreasing; `standardWeight univ = 0`.
- Give the parabolic type an API bullet list: it is invariant under conjugation, and equal types imply conjugacy.

## Verified sound

**Gate.** My run of the brief's gate command at 8480250:

```text
gate FlagVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The dependency check, as instructed, prints `depcheck: 234 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty.
- `STATUS.md`, `PROGRESS.md` and `metadata.toml` are on main.

**Elaboration.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` gives three `sorry` warnings (lines 52, 62 and 75) and nothing else.
- I built two pinned modules that had no object files with `lake build <module>`: `GeneralLinear.Weight.Parabolic.Borel` and `GeneralLinear.Weight.Parabolic.TitsSystem`.
- A scratch copy with `#check @name` for the four declarations and 25 cited names elaborates with no error. The four types are identical to the worker's signature file, so no binder is lost and nothing changed:
  - `exists_unique_standardWeight_eq` keeps `[IsAlgClosed k]`, `hIB` and `[IsReduced …]` (README:110).
  - `conjugate_eq_of_borel_le` keeps `hG_connected`, `hB`, `hPB` and `hQB` (README:21).
  - `isProper_…` keeps `hG_smooth`, `hG_connected`, `hH`, `hm` and `e` (README:208).
- One-tactic probe: `simp_all`, `aesop`, `rfl` and `infer_instance` each fail on all three theorems. `standardWeight` is the one definition the GL headline needs, so there is no padding.
- Form:
  - imports: `import Mathlib` and six `TauCeti.*` modules, all present at the pin;
  - no `set_option` and no sorry'd data;
  - `theorem` only, in namespace `TauCetiRoadmap.FlagVarieties`, with Layer comments in README order.
- `roadmaps grep` finds the four names only in this roadmap, so no fully qualified name collides.

**Pinned declarations opened.** Tau Ceti is at 2fd255d and Mathlib at 1b1ccf4b; paths are under `TauCeti/`. That makes 31 in all.
- `HopfIdeal.IsParabolicOverAlgClosed`, `Algebra/AlgebraicGroup/Parabolic/Basic.lean:82`. It means `IsAlgClosed k ∧` smooth quotient `∧ ∃ J, IsBorelOverAlgClosed ∧ I ≤ J`. The same file has `isParabolicOverAlgClosed_bot_iff` (`:165`), `IsParabolicOverAlgClosed.exists_conjugate_le` (`:217`) and `isParabolicOverAlgClosed_iff_exists_conjugate_le` (`:229`).
- `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`, `Borel/Conjugacy/Existence.lean:133`. It needs no smoothness, connectedness or containment hypothesis.
- `isBorelOverAlgClosed_iff_exists_eq_conjugate_of_isClosed_projectiveOrbit`, `Borel/ProjectiveOrbit.lean:90`. It assumes a closed orbit and does not give complete `G/B`.
- `HopfIdeal.eq_of_quotientPointsSubgroup_eq`, `HopfIdeal/Points/Separation.lean:83`; README:112 cites `:84`, which is inside its signature. `le_of_quotientPointsSubgroup_le` is at `:57`.
- `HopfIdeal.conjugate`, `HopfIdeal/Conjugation.lean:75`, with `conjugate_one` at `:101`. `CommHopfAlgCat.pointConjugation_mem_conjugate_iff` (`:360`) fixes the orientation: `g x g⁻¹ ∈ I.conjugate g ↔ x ∈ I`.
- `TitsSystem.standardParabolicOrderIso`, `GroupTheory/TitsSystem/Parabolic/Classification.lean:146`, of type `Set T.simple ≃o Set.Ici T.subgroupB`. In the same file, `standardParabolic_eq_of_subgroupB_le` is at `:114`.
- `TitsSystem.normalizer_subgroupB`, `Parabolic/Normalizer.lean:83`.
- `glTitsSystem`, `LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`. It needs `[Nontrivial kˣ]`, which holds for algebraically closed `k`.
- In `GeneralLinear/Weight/Parabolic/Basic.lean`:
  - `GeneralLinear.weightParabolicDefiningHopfIdeal` (`:144`) forbids `X_ij` when `w i < w j`;
  - `mem_weightParabolicDefiningPointsSubgroup_iff_blockTriangular` is at `:280`, and `mem_weightParabolicPoints_iff` at `:314`.
- In `Weight/Parabolic/Borel.lean`, `weightParabolicDefiningHopfIdeal_le_upperTriangular_definingHopfIdeal` is at `:113` and `isParabolicOverAlgClosed_weightParabolicDefiningHopfIdeal` at `:133`. In `Weight/Parabolic/TitsSystem.lean`, `standardParabolic_weightParabolicSimple` is at `:132`.
- `GeneralLinear.UpperTriangular.weights`, `GeneralLinear/UpperTriangular/Basic.lean:60`. It is `n−1−i`, so `weights 3 = (2,1,0)`, as the 1.1 Check says.
- `CommHopfAlgCat.fppfHomogeneousQuotient` and `fppfHomogeneousQuotientHomEquiv`, `Fppf/Quotient/Homogeneous/Basic.lean:281`.
- `HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`, `Representation/ProjectiveOrbit/Quotient.lean:241`. It covers reduced `G` and every closed `N`, so the hypothesis `e` of headline 3 is always satisfiable. `Comodule.projectiveOrbitPointsSheaf` (`:63`) takes points over `Spec k`.
- In `ProjectiveOrbit/Scheme.lean`, `Comodule.projectiveOrbitι` is at `:54`, with its immersion instance at `:79`. `projectiveOrbitToSpec` is at `:135`; it is separated (`:155`) and locally of finite type (`:162`).
- `Comodule.exists_fixed_mem_of_isClosed_of_isSolvable`, `ProjectiveOrbit/FixedPoint/Existence.lean:73`.
- `Comodule.Corestrict`, `Algebra/Coalgebra/Comodule/Corestrict.lean:73`.
- `smoothCommHopfAlgProperty_of_charZero`, `Smooth/CharZero.lean:151`; README `:148` is its docstring.
- The pin has `glTitsSystem`, `slTitsSystem`, `parabolicTitsSystem` and the Suzuki Tits system, but no Tits system for a general reductive group, no scheme `P_J` and no complete `G/B`. So `gap:tits-system-of-points`, `gap:standard-parabolic-scheme` and `gap:complete-borel-quotient` ask only for what is absent.
- At the pinned commit, `GeneralLinear/Weight/Parabolic/` has no `BlockWeight.lean` or `Classification.lean`. So `standardWeight` and `exists_unique_standardWeight_eq` duplicate nothing at the pin. Later Tau Ceti commits, which `STATUS.md` links, prove them; when the pin moves, both should become citations.

**Cross-roadmap citations resolved** (main at 71c8f21; 12 in all):
- ReductiveGroups: Layer 3 (line 234), 3A (249), 3A.1 (264), Layer 7 (627), 7C (652), 7C.5 (682, the type-A block and Grassmannian maps) and 7b (732, the parabolic intersections).
- SchubertGeometry: Conventions B− (9), S1 (30), S1.1 (32) and S2.3 (42, the subword/Bruhat criterion).
- SchemeAndStackFoundations: Layer 0 (463) and Layer 1 (2044).

Every supplier is on main, and no open revision is cited. The overlap file lists no other pull request changing this roadmap and no dropped id. The worker's `roadmaps resolve` found nothing unresolved.

**Ownership against open pull requests.** I searched the open heads and main by object, for "projective homogeneous", "standard parabolic" and "conjugate to exactly one".
- Two open revisions of ReductiveGroups restate Milne 17.16, which is this roadmap's headline 3:
  - #1676, ReductiveGroups README 2295: "Prove the completeness characterization: a smooth closed subgroup `P` is parabolic exactly when `G/P` is complete";
  - #1332, ReductiveGroups README 1997 (§7.2).

  FlagVarieties owns headline 3 on main, and ReductiveGroups supplies FlagVarieties. So the revisions should drop the statement: citing FlagVarieties from them would make a cycle. No change is asked of this pull request.
- GroupSchemesOverABase (#1522) README 1431 says that FlagVarieties' Scope names GS7. This head no longer does, so that sentence of #1522 goes stale; the repair belongs to #1522.
- SchubertGeometry (#1224) README 2078 lists FlagVarieties §6.1 as the consumer of S1, which agrees with 6.1.

**Seeded sample.** Milne2017 is the author-page PDF (cache 503f1a7d); its printed page is the PDF page minus 12. Conrad–Feng is the version of 5 December 2020 (cache a0caf508). Every locator checked below is correct in number, page and hypotheses.
- **0.1 and 0.2:** adapters over pinned declarations, with no source locator. Checked by values (A01, A02).
- **0.3:** Proposition 7.11, p.141 (line 6036), and Proposition 7.15, p.142 (line 6061). Remark 7.14 (line 6055) feeds R01.
- **1.1:** no locator; checked against the pinned weight-parabolic files (R04, A04, A05).
- **2.1:** the Humphreys locators are not verifiable. The equality `P_J(k) = B(k) W_J B(k)` agrees with Theorem 21.91 (line 18691).
- **2.2:** Theorem 21.91, pp.453–454 (lines 18691–18701), which is for split reductive groups; over algebraically closed `k` every reductive group is split.
- **3.1:**
  - Theorem 17.9(b), p.354 (line 14526);
  - Theorem 21.91, p.453;
  - Conrad–Feng Appendix T.1, p.305 (a0caf508 lines 13450–13457): each conjugacy class has a unique standard member.
- **3.2:** Theorem 17.48 (line 15049) and Corollary 17.49, p.367 (line 15075). The README's route is Milne's proof (lines 15080–15084).
- **4.1:** Theorem 17.16, p.356 (line 14608), and Theorem 17.9(a), p.354 (line 14525).
- **4.2:** Corollary 17.3, p.353 (line 14478), and the converse half of 17.16 (lines 14613–14615).
- **4.3 and 5.2:** composed from the verified 0.3, 3.1, 4.2 and 5.1 and Theorem 17.48; no locator of their own.
- **5.1:** Proposition 5.22, p.104 (line 4545): there is a unique G-equivariant map determined by an H-fixed point.
- **6.1:** model checks, with values in A19.

**Adversarial table.** 24 rows; values were computed by hand unless marked as elaborated.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A01 | 0.1 point detection (README:76–80) | `μ_p` vs `1`, char `p`; `U ⊊ B ⊂ GL₃` over `𝔽₂` and `𝔽̄₂` | `μ_p(k̄)={1}={1}(k̄)`, but the ideals `(x^p−1) ≠ (x−1)`; `#B(𝔽₂)=#U(𝔽₂)=8` with `U≠B`; over `𝔽₄`, `diag(a,1,1)∈B∖U` | reducedness and closed-field points are both needed; the 𝔽₂ Check is vacuous (R08) |
| A02 | 0.2 orientation | pinned `pointConjugation_mem_conjugate_iff`; `g=1` | `g x g⁻¹ ∈ I.conjugate g ↔ x ∈ I`; `I.conjugate 1 = I` | sound |
| A03 | 0.3 stabilizer | `SL_p` on `PGL_p`, char `p`; twisted `SL₂` on `ℙ¹`; `Gₘ` on itself | stabilizers `μ_p` (not smooth), `F⁻¹(B)` with ideal `(c^p)` (not smooth), and `1`; the first two meet the Conventions definition | smoothness cannot be established (R01) |
| A04 | H1 `exists_unique_standardWeight_eq` | `n=0,1,2`; `F⁻¹(B)⊂GL₂` | `n=0`: one `J`, weight `(0)`, ideal `⊥` = the upper-triangular ideal of `GL₁`. `n=1`: `∅↦(0,−1)↦(X₁₀)=B`, `{0}↦(0,0)↦⊥=GL₂`. `F⁻¹(B)`: `(X₁₀^p) ≤ (X₁₀)`, not reduced, excluded | true; the probes fail (elaborated) |
| A05 | `standardWeight`, 1.1 Checks | `n=2`, all `J`; `weights 3` | `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)`, `(0,0,0)`; `(2,1,0)−2=(0,−1,−2)`, with the same forbidden set `{(1,0),(2,0),(2,1)}`; `standardWeight univ = 0` | true; retained dimensions off by one (R07) |
| A06 | 2.1 Check, point orders | `GL₃(𝔽₂)` | `#P_J = 8, 24, 24, 168`; `#P_J/#B = 1, 3, 3, 21 = Σ_{w∈W_J} 2^{ℓ(w)}`; `#W_J = 1, 2, 2, 6` | true (a ℤ-model count) |
| A07 | 2.2 classification | `SL₂`, `GL₃` | `SL₂`: 2 subsets ↔ `{B, SL₂}`; `GL₃`: 4 subsets ↔ `{B, P_{s₁}, P_{s₂}, GL₃}` | true |
| A08 | 3.1 Check, orientation | `g=[[1,0,0],[1,1,0],[0,1,1]]`, char 2 | `g e₁=(1,1,0)`; `g⁻¹=[[1,0,0],[−1,1,0],[1,−1,1]]`, so `g⁻¹e₁=(1,−1,1)=(1,1,1)` | the two directions differ, as stated |
| A09 | 3.1 existence step | pinned `IsParabolicOverAlgClosed.exists_conjugate_le` | `∃ g, I.conjugate g ≤ J` for parabolic `I` and Borel `J` (elaborated) | already pinned (R04) |
| A10 | 3.1/3.2 bridge | `gP_Jg⁻¹=P_K`; `SL₂` | `p g ∈ N(B)=B ⇒ g ∈ P_K`; `w=[[0,1],[−1,0]]` gives `wBw⁻¹ = B⁻ ≠ B`, so `w ∉ N(B)` | sound |
| A11 | H2 `conjugate_eq_of_borel_le` | trivial `G`; constant `S₃`; `SL₂×μ_p` | trivial: only `⊥`. `S₃`: `B=1`, and `⟨(12)⟩`, `⟨(13)⟩` are conjugate and distinct, which connectedness excludes. `SL₂×μ_p`: the argument runs in `G_red`, `g ∈ Q(k)`, so `P=Q` | true |
| A12 | H3 `isProper_…_iff_…` | `SL₂` with `H=B,T,N(T),G,1`; `G_a` with `H=1,G_a`; `Gₘ` with `H=μ_n`, `p∤n` | `B`: `ℙ¹` proper, contains `B` (T↔T). `T`: `SL₂/T` affine of dim 2, `dim T=1<2` (F↔F). `N(T)`: `ℙ²` minus a conic, `N(T)°=T` (F↔F). `G`: point, `isParabolicOverAlgClosed_bot_iff` (T↔T). `1`: affine of dim 3 (F↔F). `G_a`: `𝔸¹` (F↔F), point (T↔T). `Gₘ/μ_n≅Gₘ` (F↔F) | true; reductivity unused (R06) |
| A13 | 4.1 forward direction | `SL₂`, `H=B,G` | `G/B=ℙ¹ → pt` is surjective, and the image is proper | true; the map has no earlier owner (R05) |
| A14 | 4.1 proper ⇒ projective | immersion `O → P(M)` | proper source and separated target make the immersion proper, hence a closed immersion | sound |
| A15 | 4.2 via the pinned fixed point | `SL₂`, `H=B`, `M=k²`, `m=e₁` | the orbit `ℙ¹` is closed and `B(k)` fixes `[e₁]`, so `g=1` and `B ⊆ H` | the general gap is unneeded (R03) |
| A16 | headline 4 hypothesis | twisted `SL₂` on `ℙ¹` | stabilizer `F⁻¹(B)` is not smooth; `P_J` is smooth, so no equivariant `X ≅ G/P_J` | the hypothesis is needed and present in headline 4 |
| A17 | 5.1, Milne 5.22 | `P=B`, `Q=G`; `P=B`, `Q=B` | one map `G/B → pt`; for `Q=B`, the `B`-fixed points of `G/B` are `{eB}` | true |
| A18 | 5.2 | `GL₃`: `∅→{s₁}`, `{s₁}→{s₂}`, `{s₁}→{s₁}` | `∅⊆{s₁}`: one map. `{s₁}⊄{s₂}`: the only `B`-fixed point of `G/P_{s₂}` is not `P_{s₁}`-fixed. The automorphism is the identity | true |
| A19 | 6.1 models | torus; `SL₂`; `GL₃` | torus: `S=∅`, `B=G`, one point. `SL₂`: `ℙ¹` and a point. `GL₃`, `D={1,2}∖J`: `∅→{1,2}`, `{s₁}→{2}` (`Gr₂(k³)`), `{s₂}→{1}` (`ℙ²`) | true; agrees with the 2.1 Check |
| A20 | 0.3 Checks | torus on a point; `Gₘ` on itself; `Spec k[ε]` | `T/T` is a point; `Gₘ/1` is affine, not projective; `k[ε]` is not smooth | sound |
| A21 | `gap:orbit-map-quotient` | text against 0.3 | the gap asks for `G/H≅X`; 0.3 says "Establish … identifies X with G/H" | two owners (R02) |
| A22 | `gap:borel-fixed-point-scheme` | its uses | used only in 4.2/4.3, where `G/H` is realized in `P(M)` | not minimal (R03) |
| A23 | remaining three gaps against the pin | grep for Tits system instances, `P_J`, complete `G/B` | none present | genuine gaps |
| A24 | Layer 4 Examples | `SL₂/B`, `SL₂/T`, `G/G` | projective; affine of dim 2; a point | true |

**Headline inventory.**
- **Headline 1**, in the `GL_{n+1}` form, is stated (`exists_unique_standardWeight_eq`). The general form is not statable: the pin has no Tits system on `G(k)` for a reductive `G` and no scheme `P_J`.
- **Headline 2:** the uniqueness half is stated (`conjugate_eq_of_borel_le`), and the existence half is pinned (`IsParabolicOverAlgClosed.exists_conjugate_le`). The `P_J` form is not statable.
- **Headline 3** is stated (`isProper_projectiveOrbitToSpec_iff_isParabolicOverAlgClosed`).
- **Headlines 4 and 5** are not statable without `P_J`.

The docstring names each missing carrier correctly, apart from the fixed-point item covered by R03.

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*** (GTM 21): §§11–12, 17.6, 19, 21.2–21.3, 23.3, 24–30.1. It is paywalled and not in the sources cache, and the README cites it by locator only (README:279–292). The 2.1 claim was checked against Milne Theorem 21.91 instead.
- **`design/plan.json`:** none is readable. The README's five gap slugs were treated as declared contracts, but they could not be compared with a plan's `gaps` list.
- **Scheme-level Yoneda for orbit schemes.** A sheaf isomorphism `e` determines the orbit scheme up to `k`-isomorphism. This was checked mathematically; I found no pinned full-faithfulness statement for `CommAlgCat.pointsSheaf`.

## Source issues

- **Misprint** in Milne2017 at Proposition 7.15, p.142: the source says the morphism `G/H′ → G/H` is smooth, or finite and flat; it should be the canonical `G/H → G/H′` of the preceding sentence; affects a stated result.
- **Misprint** in Milne2017 at Corollary 17.49, proof, p.367: the source credits conjugacy of two Borel subgroups of `P°` to 17.10, which is about maximal tori; it should be Theorem 17.9(b); affects the proof.
- **Gap** in Milne2017 at Theorem 17.9, proof, p.354: the source says every maximal-flag stabilizer in `G` is solvable, for a possibly non-faithful Chevalley representation; it should note `ker r ⊆ Stab(L) = B`, which makes it solvable; affects the proof.
