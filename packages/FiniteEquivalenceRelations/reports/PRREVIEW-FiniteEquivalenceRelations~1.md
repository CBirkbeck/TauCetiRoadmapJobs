# Review of FiniteEquivalenceRelations (pull request #1929 at 2891d49)

**Verdict:** needs changes

Six findings, one blocking (P2). The mathematics of the roadmap is sound: the three headline computations of Layer 3 were recomputed independently and agree with the README except for the dimension values in two Checks (R02). The blocking finding is a supplier contract: the pinned Tau Ceti already proves the theorem that Layer 2 plans to obtain from ModularCurves.

## R01 (P2) — Tau Ceti at the pin already proves the flat case; the supplier contract says nothing is consumed

**Location.** `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` line 101 (“From Tau Ceti. Nothing is consumed from Tau Ceti.”), lines 35–38 (ModularCurves 0C, item 3, “owns the quotient by a finite locally free equivalence relation”), lines 103–104 and 280–289 (target 2.1 routed through ModularCurves 0C).

**Claim.** The quotient by a finite locally free equivalence relation on an affine scheme (SGA 3, Exp. V, Thm 4.1, affine case) is owned by the roadmap ModularCurves, and 2.1 is an adapter to it.

**Witness.** At the pinned Tau Ceti, `TauCeti/AlgebraicGeometry/Quotient/EquivalenceRelation.lean` states and proves that theorem for schemes: under `[IsAffine X] [IsEquivalenceRelation p₁ p₂] [IsFinite p₁] [Flat p₁] [LocallyOfFinitePresentation p₁]` (lines 238–239), `AlgebraicGeometry.Scheme.Hom.isKernelPair_affineCoequalizerπ` (line 279), `flat_affineCoequalizerπ` (289), `isFinite_affineCoequalizerπ` (284), `surjective_affineCoequalizerπ` (294) and `isColimitAffineCoequalizerCofork` (306), where `affineCoequalizer` is `Spec` of the ring `{a ∈ Γ(X, ⊤) : p₁^* a = p₂^* a}` (line 166). The ring form is in `TauCeti/RingTheory/Invariant/EquivalenceRelation/Quotient.lean`: `RingHom.IsSpecEquivRel.isPushout` (190), `.bijective_tensorProductMap` (166), `.flat` (148), `.finite` (201), with the predicate `RingHom.IsSpecEquivRel s t` (T-points form of “`Spec B ⇉ Spec A` is an equivalence relation”, `Basic.lean` line 110) and `RingHom.IsSpecEquivRel.isIntegral` (383). The bridge from Mathlib's `IsEquivalenceRelation` on affine schemes to `IsSpecEquivRel` on global sections is `AlgebraicGeometry.Scheme.Hom.isSpecEquivRel_appTop` (line 220).

A roadmap defers to the library at the pin and never plans again what exists there, and a roadmap is not cited as supplier for a theorem the library has. In 2.1's setting every hypothesis of the Tau Ceti theorem holds: `X = Spec A` is affine; `IsEquivalenceRelation` is 0.3; `specFst` is finite because `(A ⊗[k] A) ⧸ I` is finite over `A` (`A` finite over `k`); flat is the hypothesis; locally of finite presentation because `A` is noetherian. The conclusion gives the kernel pair, the coequalizer (hence, with reflexivity, the pushout) and `A` flat over `A^R` after identifying `affineCoequalizer` with `Spec A^R` (`Γ(Spec A, ⊤) ≅ A` and the equaliser of `relFst`, `relSnd` is `invariants`).

**Repair.** (a) Replace the Tau Ceti line of the supplier contracts by the declarations above, with what is assumed of them (the five hypotheses). (b) In 2.1, make the route: 0.3, finiteness and finite presentation of `specFst`, then `isKernelPair_affineCoequalizerπ`, `isColimitAffineCoequalizerCofork` and `flat_affineCoequalizerπ` transported along `affineCoequalizer ≅ Spec A^R`; the pushout clause from the coequalizer and reflexivity as in 1.3. `*Needs:*` 0.3, 1.1, 1.3 and these Tau Ceti declarations. (c) Delete the ModularCurves bullet of “Owned elsewhere” and the “From ModularCurves” contract: the owner of the theorem is the library; ModularCurves 0C item 3 plans the same theorem for its own use and is not this roadmap's supplier. (d) In “Scope and ownership”, say how `IsEquivIdeal` relates to the library's `RingHom.IsSpecEquivRel`: add to 0.3 the statement `IsEquivIdeal k A I ↔ (relFst k A I).toRingHom.IsSpecEquivRel (relSnd k A I).toRingHom` (the ideal conditions against the T-points conditions on rings), so that 0.3's Spec step cites `isSpecEquivRel_appTop` for one direction instead of redoing it; `RingHom.isSpecEquivRel_tensorProduct` (`Basic.lean` line 180) covers the kernel-pair examples of Layer 0. (e) Change the suggested home to a file beside `TauCeti/AlgebraicGeometry/Quotient/EquivalenceRelation.lean`.

## R02 (P3) — The dimension values in the Checks of 1.1 and 3.1 are wrong

**Location.** README line 218 (“`differenceIdeal` is strictly smaller than `I` in degree `5`, of dimension `124` against `125`”) and lines 331–332 (“in degree `5`, `dim I₅ = 125` and `dim (J(B))₅ = 124` … in degrees `1` to `4` the dimensions agree (`0, 2, 13, 47`)”).

**Claim.** The homogeneous pieces of `I` and `J(B)` in `k[x₁, x₂, y₁, y₂]` have these dimensions.

**Witness.** `k[x₁, x₂, y₁, y₂]₅` has dimension `C(8,3) = 56` and `k[x₁, x₂, y₁, y₂]₄` has dimension `35`, so no subspace has dimension `125` or `47`. Recomputed (row reduction of the generators times monomials, over `ℚ` and over `𝔽_p` for `p = 2, 3, 5, 7, 11, 13, 41, 61, 101`, all agreeing): `dim I_d = 0, 2, 9, 23, 44` and `dim J(B)_d = 0, 2, 9, 23, 43` for `d = 1, …, 5`, with `raicuCocycle ∈ I₅ \ J(B)₅`. The invariant dimensions `0, 2, 1, 3, 2` of line 215 are right (bases `f₁, f₂`; `f₃`; `f₁², f₁f₂, f₂²`; `f₁f₃, f₂f₃`), and so is the conclusion that the gap is one dimension in degree `5` and none below.

**Repair.** Line 218: “of dimension `43` against `44`”. Lines 331–332: “`dim I₅ = 44` and `dim (J(B))₅ = 43` … (`0, 2, 9, 23`)”. If the printed numbers count something else (another grading or a cumulative count), name it; as written they are dimensions of `I₅` and `(J(B))₅`.

## R03 (P3) — FGA III page for the all-schemes colimit remark

**Location.** README lines 226–228 (1.2): “finite colimits computed on algebras are colimits in the category of all schemes (FGA III, §2, p. 212-05)”.

**Witness.** `fga3` lines 150–153 (the remark “on peut montrer … sont en réalité des quotients dans la catégorie de tous les préschémas”) are on PDF page 5; the Numdam PDF's page 1 is a cover sheet, so PDF page `n` is printed page `212-(n−1)`: the remark is on p. 212-04. The question whether non-flat relations on finite schemes are effective (`fga3` lines 156–164) is on PDF page 6 = p. 212-05, so the citations “§2, p. 212-05” for the question (Summary, 3.2, Research context) are right, and Théorème 5.1 at `fga3` line 409 (PDF page 13) is on p. 212-12 as cited.

**Repair.** In 1.2 write “FGA III, §2, p. 212-04”.

## R04 (P3) — Unsourced historical claim

**Location.** README lines 429–430: “He asked it again, as an open problem he expected to have a negative answer, at the end of a lecture of his course at SUNY Buffalo on 11 July 1973.”

**Claim.** A dated statement attributed to Grothendieck with no reference in the README (none of the seven references covers it).

**Repair.** Add the source (the published notes or recording of the Buffalo course, with the lecture and page or time) to References and cite it at the sentence, or delete the sentence. Every claim carries a locator.

## R05 (P3) — Process narrative in 3.2

**Location.** README lines 344–345: “The restriction to `Z` is this roadmap's own; it is not in Raicu's or Kollár's text and has not been checked by a specialist.”

**Claim.** “has not been checked by a specialist” is a status statement about the review process, not mathematics; the README is timeless.

**Repair.** “The restriction to `Z` is this roadmap's own; it is not in Raicu's or Kollár's text.” (The mathematics of the restriction was recomputed in this review and holds; see Verified sound.)

## R06 (P3) — The module docstring lists non-targets as “not stated here”

**Location.** `TauCetiRoadmap/FiniteEquivalenceRelations/Suggested.lean` lines 39–41: “Not stated here: the comparisons of 0.3 and 1.2 with SchemeAndStackFoundations' `IsEquivRel` and `IsCategoricalQuotient` (§1.5, §1.17), whose carriers are not at the pins; the README states them in prose.”

**Claim.** README line 43 says these comparisons are “not a target here”, and no section of the README states them; the docstring's clause is for headline theorems that are not statable at the pins.

**Repair.** Delete the sentence from the docstring; or, if the comparisons are wanted, make them README targets with their `*Needs:*` lines and keep the docstring sentence.

## Verified sound

**Gate and build.** The worker's gate at 2891d49 passed every check (`gate.md`). `lake env lean` on `Suggested.lean` from the worktree: exit 0, exactly 12 warnings, all “declaration uses `sorry`” (one per sorried theorem), no other output. Dependency check re-run with the brief's command: `depcheck: 245 roadmaps, 2466 edges, 0 problem(s)`; FiniteEquivalenceRelations is line 398 of the merge order, after ModularCurves and SchemeAndStackFoundations (both on main). No file outside the roadmap folder is changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteEquivalenceRelations'` is empty). The folder holds README.md, Suggested.lean, metadata.toml only. The 30 elaborated signatures of `signatures.md` were compared with their README statements: each carries the binders its README statement needs (`[Field k] [FiniteDimensional k A]` on 1.2, 1.3, 2.1; `IsEquivIdeal` and `Module.Flat A` on 2.1; `IsAddFG`, `IsCancelAdd`, `IsAddTorsionFree`, `IsEquivIdeal`, `IsToric` on 3.4); none lost a section variable.

**Sources (seeded sample 0.1–3.4, all read at their locators).**
- `kollar2012` (arXiv 0812.3608v2) lines 1108–1117: ¶50, conditions (1)–(4) exactly as 0.1 and 3.1 state them; lines 1118–1122: “`I ⊃ (f_i(x) − f_i(y))` and `R` is effective iff equality holds” (1.3); lines 1136–1137: the cocycle condition (3.1 route); lines 1156–1158: the example with `f₁ = x₁²`, `f₂ = x₁x₂ − x₂²`, `f₃ = x₂³`, `f = (x₁y₂ − x₂y₁)y₂³`, the four generators as in `raicuIdeal`; lines 1159–1172: non-effectivity after every base change by the free `ℤ`-module `W/V` (3.1 route); lines 1176–1183: Theorem 51 (3.4). Lines 134, 146: Theorem 6, Question 8 (Scope, Research context).
- `raicu2010` (arXiv 0905.4805v2) lines 32–34: the Definition of toric (invariance under the diagonal torus action, not necessarily normal); lines 36–37 and 237–238: Theorem 4.1 for `k` a field and `σ` a finitely generated submonoid of `ℤⁿ` (lines 128–129: affine monoid = finitely generated, cancellative, torsion-free), matching the three instance hypotheses of `eq_differenceIdeal_of_isToric`; lines 76–83: §2.1, conditions i)–iv) on `𝔸ⁿ`; lines 91–93: Example 2.1; lines 170–172: Theorem 3.1 (Amitsur complex of monoid algebras over any commutative ring); lines 248–251: toric means `M`-homogeneous, as the Conventions say.
- `stacks-groupoids`: lines 68–78 Definition 39.3.1 (022P); lines 2054–2069 Section 39.23 (03BE), equation 23.0.1 `C = {a : t♯(a) = s♯(a)}` and the coequalizer in affine schemes (1.1, 1.2); lines 2132–2134 Lemma 39.23.4 (03BJ), `A` integral over `C` for `s, t` finite locally free (1.2 route, “in the flat case”); lines 2420–2429 Proposition 39.23.9 (03BM), hypotheses affine, finite locally free, equivalence relation; conclusion `U → M` finite locally free and `R = U ×_M U` (2.1).
- `fga3` (Numdam, PDF page = printed 212-page + 1): lines 133–153 §2; lines 156–164 the question, reduction to a local artinian base with algebraically closed residue field, open even over a field (Summary, 3.2, Research context); lines 409–427 Théorème 5.1 with (iv): `f` finite locally free and `R₁ → X ×_Y X` an isomorphism (2.1). One page slip, R03.
- `sga3-exp5` (Gille–Polo re-edition, Exp. V) lines 509–528: Théorème 4.1, hypotheses a) `d₁` finite locally free, b) orbits in affine opens; (i) coequalizer in `(Sch/S)`, (iv) for an equivalence pair `X₁ → X₀ ×_Y X₀` is an isomorphism and `p` finite locally free (2.1).

**Mathlib at the pin.** `Mathlib/CategoryTheory/EquivalenceRelation.lean` lines 41–99: `JointlyMono₂`, `ReflexiveRelation` (section `r`), `SymmetricRelation` (`s`), `TransitiveRelation` (limiting pullback cone of `p₂, p₁` and `t`), `IsEquivalenceRelation` = `Nonempty (EquivalenceRelation p₁ p₂)`; lines 258–270: `IsEffectiveEquivalenceRelation` = some `π` with `IsKernelPair π p₁ p₂` and `IsPushout p₁ p₂ π π`, as the Conventions say; line 106 `IsKernelPair.equivalenceRelation` (name cited at README line 180, exists). `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean` line 258 `Submodule.eq_of_le_of_finrank_eq` (inside `namespace Submodule`, line 245). `Mathlib/AlgebraicGeometry/Scheme.lean` line 483 `Spec.map_comp`. `Mathlib/GroupTheory/Finiteness.lean` line 60 `IsAddFG`. `Ideal.map_map`, `AlgHom.equalizer`, `Algebra.TensorProduct.leftAlgebra`, `tensorTensorTensorComm`, `CommRingCat.ofHom_comp`, `AddMonoidAlgebra.instBialgebra`, `Bialgebra.comulAlgHom` found in the files the README names. Every library name used in `Suggested.lean` elaborates (build).

**Cross-roadmap citations (resolved on main).** ModularCurves `### 0C` item 3 (README lines 357–363): SGA 3 Exp. V Thm 4.1 in the affine case, as cited (repointed by R01). SchemeAndStackFoundations `### 1.5` (line 2167) defines `IsEquivRel s t` and `### 1.17` (line 2624) `IsCategoricalQuotient`, `IsGeometricQuotient`, as the Scope says. `roadmaps resolve` listed three own Lean names (`IsEquivIdeal.le_ker_mul`, `.map_incl₁₃_le`, `.map_quotient`); all three are declared in `Suggested.lean` (lines 75, 79, 101). Ownership: `roadmaps grep` for Raicu, `IsEffectiveEquivalenceRelation`, `IsEquivalenceRelation`, “finite equivalence relation”, “finite locally free equivalence”, “Amitsur complex” finds no other roadmap on main or in the 478 open pull requests owning these objects (the only hit, HeightsRationalPointsAndObstructions line 1161, is unrelated). `overlaps.md`: no other pull request changes this roadmap, no dropped ids, no close roadmap. The only library owner is Tau Ceti's quotient module (R01).

**Independent recomputation of Layer 3** (row reduction over `ℚ` and over `𝔽_p`, `p ∈ {2, 3, 5, 7, 11, 13, 41, 61, 101}`, in `k[x₁, x₂, y₁, y₂]` by total degree):
- `raicuIdeal` is an equivalence ideal: each generator lies in `ker μ`; the swap maps `I₂, I₃, I₅` into themselves (`map_comm`); in `k[x, y, z]`, every generator of `I(x, z)` (degrees 2, 2, 3, 5) lies in `I(x, y) + I(y, z)`, in every characteristic tried (transitivity, `map_incl₁₃_le`).
- `dim I_d, dim J(B)_d` for `d = 1..6`: `0, 2, 9, 23, 44, 74` and `0, 2, 9, 23, 43, 72`; `dim B_d = 0, 2, 1, 3, 2`; the cocycle is in `I₅` and not in `J(B)₅` (3.1, `differenceIdeal_raicuIdeal_ne` over every prime field, hence every field).
- `O(Z)`, `Z = V(f₁², f₂², f₃²)`: Hilbert function `1, 2, 3, 4, 3, 2` and length 15 for `p ≠ 2`; `1, 2, 3, 4, 3, 2, 1` and length 16 for `p = 2` (3.2 Check 1). `dim K₅ = 16`, so `(O(Z) ⊗ O(Z))₅` has dimension `56 − 16 = 40` (3.3 Check 1).
- `dim (I + K)_d` and `dim (J(B(Z)) + K)_d`, `d = 1..5`: `0, 2, 9, 25, 52` and `0, 2, 9, 25, 51`, in every characteristic tried: `I(Z) = J(B(Z))` in degrees `< 5` and `dim I(Z)₅ = 36 > 35 = dim J(B(Z))₅` (3.2, 3.3 Check 2). The invariants of `O(Z)` of degree `≤ 5` are the images of the plane invariants (degrees 2, 3, 4) and all of `O(Z)₅`.
- The image of the cocycle lies in `(I + K)₅` and not in `(J(B(Z)) + K)₅` over `ℚ`, `𝔽₂`, `𝔽₃` and the other primes (3.3, `raicuCocycle_not_mem_differenceIdeal`).
- Exponent triples over `𝔽₃` (3.2 Check 2): `(1,1,1)` length 4, `(2,1,1)` 6, `(1,2,1)` 6, `(1,1,2)` 4, `(2,2,1)` 10, `(2,1,2)` 8, `(1,2,2)` 8, no gap in any degree where `O(Z) ⊗ O(Z)` is nonzero (all vanish by degree 8); `(2,2,2)` gap `52 > 51` in degree 5 only, through degree 6; `(3,3,2)` length 27, Hilbert function `1, 2, 3, 4, 5, 6, 4, 2`, gaps `44 > 43` in degree 5 and `77 > 75` in degree 6, as the README says.
- Degree-6 determinant of 3.2 Check 1: rows `(−2, 1, 0), (1, −2, 1), (0, 1, −2)` give `−4`, zero exactly in characteristic 2, matching the lengths 15 and 16.

With 1.3 (verified below), these confirm the headline of 3.2: the restriction of Raicu's relation to `Z` is a closed equivalence relation on a finite local `k`-scheme of length 15 (16 in characteristic 2) which is not effective, over every field. The claim was independently checked here and holds.

**Adversarial table.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsEquivIdeal` (0.1) | `I = ker μ`; `I = ⊥`; `I = ⊤`, `A ≠ 0` | `ker μ`: all three fields hold; `⊥`: `map ⊥ = ⊥`, `incl₁₃ ⊥ = ⊥`; `⊤`: `map_comm`, `map_incl₁₃_le` hold, `1 ∉ ker μ` fails `le_ker_mul` | matches Check 1 |
| transitivity field needed (0.1 Check 2) | `A = k[t]/(t²)`, `I = (xy)`, char `≠ 2` | `(x−y) = span{x−y, xy}`, `(x+y) = span{x+y, xy}`, intersection `(xy)`; `μ(xy) = t² = 0`; `incl₁₃(xy) = xz ∉ span{xy, yz}` in degree 2 | Check holds; a reflexive-symmetric definition would accept it |
| symmetry needed (0.1 Check 3) | `A = k × k`, `R = {(p,p),(q,q),(p,q)}` | reflexive, transitive (`(p,q)∘(q,q) = (p,q)`), `(q,p) ∉ R` | holds |
| `map_quotient` (0.2) | arbitrary `𝔞`; `𝔞 = ⊤`; `𝔞 = (t)` on `k[t]`, `I = ⊥`; `I = (x²−y²)`, `𝔞 = (t−1)` | `(π⊗π)(I) ⊆ ker μ'` since `μ'∘(π⊗π) = π∘μ`; swap and `incl` commute with `π⊗π`; `(A/𝔞)⊗(A/𝔞) = (A⊗A)/(𝔞⊗A + A⊗𝔞)` so the image is the ideal of `R ∩ (Z×Z)`; `A/⊤ = 0`; image `⊥` in `k`; image `1−1 = 0` | true in general, Checks hold |
| `isEquivalenceRelation_iff` (0.3) | each Mathlib field against `Spec` fully faithful | `r` ↔ `μ` factors ↔ `I ⊆ ker μ`; `s` ↔ swap descends ↔ `comm I = I`; `c.pt = Spec((A⊗A/I) ⊗_A (A⊗A/I)) = Spec(A⊗A⊗A/(I₁₂+I₂₃))`, `t` ↔ `incl₁₃ I ⊆ I₁₂+I₂₃`; `JointlyMono₂` from closed immersion `R → X×_k X` and mono `X×_k X → X×X` | true for every `k`, `A`, `I` |
| `invariants`, `differenceIdeal` (1.1) | `I = ker μ`; `I = ⊥` over a field, `A ≠ 0`; arbitrary `I` | `A^R = A`, `J = ker μ`; `a⊗1 = 1⊗a ⇔ a ∈ k`, `J = ⊥`; `J(B) ≤ I` since `b ∈ A^R ⇔ b⊗1−1⊗b ∈ I` | Checks hold |
| `isColimit_cofork` (1.2), no `IsEquivIdeal` hypothesis | `I = ⊤`; `A = k×k`, `I = ⊥`; general `I`, `A` artinian | `A^R = A`, coequalizer of the empty pair is `X`; `A^R = k`; for general `I`: `R ⊆ ⊔_C X_C × X_C` over the classes `C` of the relation generated on points, so the idempotents `e_C ∈ A^R`, fibres of `Spec A → Spec A^R` are the classes, an invariant `f` is constant on each, lands in an affine open, affine case applies, glue; uniqueness since `A^R → A` injective and `Spec A^R` discrete | true for every ideal `I` |
| `isEffectiveEquivalenceRelation_iff` (1.3) | `⇐`: `I = J(B)`; `⇒`: `R` kernel pair of some `π : X → Y` | `⇐`: kernel pair of `specQuotientMap` is `Spec(A ⊗_{A^R} A) = Spec((A⊗A)/J(B))`; `inv(J(B)) = A^R`; pushout = coequalizer by reflexivity, from 1.2. `⇒`: `π` factors through the coequalizer `Q = Spec A^R`; `X×_Q X → X×_Y X = R` is a mono with a section `R → X×_Q X`, so `R ≅ X ×_Q X`, `I = J(B)` | true; Check 2 (`k[t]/(t⁴)`, `I = (x²−y²)`): `I = J(k[t²]/(t⁴)) ⊆ J(B) ⊆ I`, `A^R = k[t²]/(t⁴)` since `x−y, x³−y³ ∉ I` |
| `…_iff_finrank` | `J(B) ≤ I` always, `A⊗A` finite-dimensional | `finrank` equal ⇔ equal subspaces (`Submodule.eq_of_le_of_finrank_eq`) | true |
| `isEffectiveEquivalenceRelation_of_flat` (2.1) | `A = k×k`, `I = ⊥`; `I = ker μ`; 3.2's relation | `A⊗A/I = k⁴` free of rank 2 over `A`, `A^R = k`, `A` free of rank 2; `A` free of rank 1, `A^R = A`; non-effective so not flat; flat + finite over the artinian `A` ⇒ finite locally free, Tau Ceti theorem applies (R01) | true; supplier is Tau Ceti |
| `raicuIdeal` symmetry (3.1 Check 2) | swap of the cocycle | `swap(c) = −(x₁y₂−x₂y₁)x₂³ = −c − (x₁y₂−x₂y₁)(x₂³−y₂³)`, in `I` | holds |
| `raicuIdeal_finite` | `y₁², y₂³` modulo `I` | `y₁² ≡ x₁²`, `y₂³ ≡ x₂³`; quotient generated by `y₁^a y₂^b`, `a<2`, `b<3` over `k[x]` | true |
| `differenceIdeal_raicuIdeal_ne` | `d = 5`, ten fields | `44 ≠ 43`, cocycle in `I₅ \ J₅` | true; README values wrong (R02) |
| 3.2 Check 3 | degree 1 and 2 parts of `I(Z)` | `(I+K)₁ = 0` so `x₁ − y₁ ∉ I(Z)`; `x₁² − y₁² ∈ I`, `K` starts in degree 4 so it is nonzero in `O(Z)⊗O(Z)` | holds |
| `IsToric` (3.4) | `I = ⊥`, `⊤`, `ker μ`; `σ = ℕ`, `I = (x²−y²)`; Raicu's `I` for `σ = ℕ²` | coaction `χ^s⊗χ^t ↦ (χ^s⊗χ^t)⊗χ^{s+t}` (checked on `comul`, `tensorTensorTensorComm`, `lmul'`); `I` toric ⇔ every `(s+t)`-homogeneous component of an element of `I` is in `I`; `⊥, ⊤, ker μ, (x²−y²)` homogeneous; `g₂` has components `x₁x₂−y₁y₂` and `−x₂²+y₂²`, neither in `I₂ = span{g₁, g₂}` | Checks hold; Raicu's Definition (lines 32–34, 248–249) is this |
| `eq_differenceIdeal_of_isToric` hypotheses | `σ` f.g., cancellative, torsion-free; `σ = 0` | Raicu's affine monoid (lines 128–129); `σ = 0`: `k⊗k = k`, only `⊥` is an equivalence ideal, `J = ⊥` | hypotheses match the source |
| Conventions witnesses | `A = k[t]`, `t⊗1−1⊗t`; `I = ⊥` with `A ≠ 0` | `incl₁₂ + incl₂₃ = t⊗1⊗1 − 1⊗1⊗t = incl₁₃`; `Y = Spec k` | hold |

**Padding probe.** Each of the 12 sorried theorems was read against the pinned definitions: none restates a definition, mirrors a Check, computes a value or treats a boundary case, and none closes by `simp`, `rfl`, `infer_instance` or a single library lemma (each needs either the affine-scheme dictionary, the computation of Layer 3, or Raicu's theorem). `specFst_comp_specQuotientMap` is proved and is needed to state `isColimit_cofork`. No `set_option`, no sorried data, single `import Mathlib`, no `lemma`.

**Headline theorems.** The README's headlines (0.2, 0.3, 1.2, 1.3 twice, 2.1, 3.1 three statements, 3.2, 3.3, 3.4) are all stated in `Suggested.lean` with the README's generality (field and finite-dimensional where the README says so; any commutative `k` and `A` for Layer 0 and 1.1). Nothing statable is missing; nothing is forced through a stand-in.

## Not verifiable

- none. Every cited text was read legally: Kollár 2012 and Raicu 2010 from arXiv, the Stacks chapter, FGA III from Numdam, SGA 3 Exp. V from the Gille–Polo re-edition on the editor's page. Venken 1971 and Philippe 1973 are cited only as context, for no statement.

## Source issues

- **Misprint** in kollar2012 at Theorem 51 and the line before it, printed p. 21–22: the source cites the toric theorem and the cocycle lemma as Thm 4.2 and Lem 4.3 of the then-unpublished Raicu paper; in Raicu 2010 (arXiv:0905.4805v2) they are Theorem 4.1 and Lemma 4.3; affects nothing.
