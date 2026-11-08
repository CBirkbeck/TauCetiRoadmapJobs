# Review of JacobianChallenge (pull request #1892 at 6bdc968)

**Verdict:** needs changes

Five findings: one P1 (the gate fails on sorry'd data), two P2 (a definition that is not well defined over imperfect fields; a block of targets with two other owners), two P3 (padding; README form). The seeded sample (Jacobian, Pic⁰, Abel–Jacobi) was verified against the cached Stacks, Kleiman and Milne texts; the Tau Ceti and Mathlib names were checked at the pin of `lake-manifest.json` (Tau Ceti 2fd255d9, the same revision the content repository pins); the dependency check reports no UPWARD or CYCLE line; the real-body repair of R01 was elaborated on a copy in the scratch directory.

## R01 (P1) — Four sorry'd data declarations; the push gate fails

**Location.** `TauCetiRoadmap/JacobianChallenge/Suggested.lean` lines 75–79 (`serreDualityTrace`), 141–144 (`JacobianVariety`), 149–154 (`jacobianVarietyRepresentableBy`), 184–187 (`abelJacobi`): each is a `def` whose body is `by sorry`, and `serreDuality_existsUnique` (87–93), `isAlbanese_abelJacobi` (193–197) mention them.

**Claim.** The file states the headlines against the pinned APIs.

**Witness.** The worker's gate at this head: `sorry-data=4 … FAIL`, rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`". The brief's principles make sorry'd data blocking, and no acceptance is possible while the gate fails. Two of the four (`JacobianVariety`, `abelJacobi`) were already sorry'd data on main; this head adds `serreDualityTrace` and `jacobianVarietyRepresentableBy`.

**Repair (tested).** Every one of these objects can be given a real body at the pin, in the shape the README already prescribes for the Picard scheme (`Functor.IsRepresentable` + `Functor.reprX`), so the README's "data with laws instead of existence" design survives:

```lean
noncomputable abbrev picZeroSets (X : Over (Spec (.of k))) [SmoothOfRelativeDimension 1 X.hom]
    [IsProper X.hom] [GeometricallyConnected X.hom] : (Over (Spec (.of k)))ᵒᵖ ⥤ Type (u + 1) :=
  (TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf X.hom).obj ⋙ forget AddCommGrpCat
abbrev HasJacobianScheme (X) … : Prop := (picZeroSets X).IsRepresentable
noncomputable def jacobianScheme (X) … [HasJacobianScheme X] : Over (Spec (.of k)) := (picZeroSets X).reprX
noncomputable def jacobianSchemeRepresentableBy (X) … [HasJacobianScheme X] :
    (picZeroSets X).RepresentableBy (jacobianScheme X) := (picZeroSets X).representableBy
noncomputable instance (X) … [HasJacobianScheme X] : CommGrpObj (jacobianScheme X) :=
  CommGrpObj.ofRepresentableBy (jacobianScheme X)
    ((TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf X.hom).obj ⋙ AddCommGrpCat.toCommGrp)
    (jacobianSchemeRepresentableBy X)
noncomputable def JacobianVariety (X) … [HasJacobianScheme X] [IsProper (jacobianScheme X).hom]
    [GeometricallyIntegral (jacobianScheme X).hom] : TauCeti.AlgebraicGeometry.AbelianVariety k where
  toOver := jacobianScheme X
  grpObj := inferInstance
  isProper := inferInstance
  geometricallyIntegral := inferInstance
noncomputable def abelJacobi (X) … (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) : X ⟶ (JacobianVariety X).toOver :=
  (jacobianSchemeRepresentableBy X).homEquiv.symm
    ((TauCeti.AlgebraicGeometry.abelJacobiMapToPicZeroFppf X.hom (Over.w x₀)).app (op X) (ULift.up (𝟙 X)))
```

with `hasJacobianScheme_of_curve`, `isProper_jacobianScheme`, `geometricallyIntegral_jacobianScheme` and `isAlbanese_abelJacobi` as sorried `theorem`s. This elaborates at the pin with `sorry` the only warnings (`CommGrpObj.ofRepresentableBy` is `Mathlib/CategoryTheory/Monoidal/Cartesian/CommGrp_.lean:37`, `AddCommGrpCat.toCommGrp` is `Mathlib/Algebra/Category/Grp/EquivalenceGroupAddGroup.lean:63`, `abelJacobiMapToPicZeroFppf` is `TauCeti/AlgebraicGeometry/PicardFunctor/Abel/Fppf.lean:91`). The trace `serreDualityTrace` is a heavy definition (it needs the repartition description and local components): make it a README target with its intended signature, and state duality with the trace quantified, which also elaborates:

```lean
theorem serreDuality_exists_trace … :
    ∃ t : TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (X.relativeDifferentials k) 1 →ₗ[k] k,
      ∀ (F : X.Modules) [F.IsQuasicoherent],
        Function.Bijective (fun φ : F ⟶ X.relativeDifferentials k =>
          t ∘ₗ Scheme.Modules.cohomologyMapBaseLinear k X φ 1) := by sorry
```

Rename the README's backticked names accordingly (`jacobianVarietyRepresentableBy` → `jacobianSchemeRepresentableBy`, and the instance hypotheses in the Layer D Galois-descent item and Layer F).

## R02 (P2) — The trace formula `Σ_x Tr_{κ(x)/k} Res_x(η_x)` is not defined at inseparable closed points

**Location.** `README.md` lines 151–156 and the docstring of `serreDualityTrace`, `Suggested.lean` lines 71–74: "a class is represented by a repartition of rational differentials `(η_x)_x` over the closed points, and the trace sends it to `Σ_x Tr_{κ(x)/k} Res_x(η_x)`", with Serre, *Algebraic Groups and Class Fields*, Chapter II as the source.

**Claim.** This defines a `k`-linear form on `H¹(X, Ω_{X/k})` for every proper curve smooth of relative dimension one over every field `k` (the Lean signature has no hypothesis on `k`).

**Witness.** Serre's Chapter II works over an algebraically closed field. Over `k = 𝔽_p(t)` take `X = ℙ¹_k` with coordinate `x`, the closed point `P` given by `x^p − t` (residue field `k(t^{1/p})`, purely inseparable of degree `p`), and `η = x^{p−1} dx/(x^p − t)`. At `∞`, with `u = 1/x`, `η = −du/(u(1 − t u^p))`, so `Res_∞(η) = −1`; `η` is regular away from `P` and `∞`. The repartition `(η at P, 0 elsewhere)` equals `(−η at ∞, 0 elsewhere)` modulo the global differential `η` and regular repartitions, so the two represent the same class of `H¹(X, Ω_{X/k})`, whose trace must be `1` by the second representative; the formula gives `Tr_{κ(P)/k}(…) = 0` on the first, since the trace of a purely inseparable extension vanishes. Also `d(x^p − t) = 0`, so the completed local ring at `P` has no coefficient field over `k` and `Res_P(η) ∈ κ(P)` has no meaning. Tau Ceti itself records the restriction: `TauCeti/FieldTheory/FunctionField/Differential/Comparison.lean` lines 22–24 say the local components of the Weil differential attached to a differential are its residues only "at rational places with a separating prime element".

**Repair.** Define the trace through the Weil-differential local components rather than residues: send the class of `(η_x)_x` to `Σ_x ω(η_x)_x(1)`, where `ω(η)` is the Weil differential attached to `η` by Tau Ceti's `kaehlerDifferentialEquivWeilDifferentialOfSeparating` (independent of the separating element, `Comparison.lean` lines 18–20) and `(·)_x` its local component at `x` (Tate's residue, equal to `Tr ∘ Res` when `κ(x)/k` is separable); cite J. Tate, *Residues of differentials on curves*, Ann. Sci. ENS (4) 1 (1968), §2 Theorem 1 and §3 for the residue theorem over any field, keeping Serre II for the separable case. State the third Check with `ω` the Weil differential of `dt` (`weilDifferentialOfSeparating`), the differential `relativeDifferentialsIsoDivisorSheaf ht` reads coefficients in; and add the example above as a negative-control Check (residue `−1` at `∞`, trace `1`, inseparable `P`).

## R03 (P2) — Degree pieces and torsors over a general base, and over a field, have other owners

**Location.** `README.md` lines 460–470, the new "*Degree pieces*" passage: "Let `f` be proper and smooth of relative dimension one with geometrically connected fibres, with `HasPicardScheme f` … the fibre degree … is a locally constant function on `T` … the Picard sheaf is the coproduct over `d ∈ ℤ` of its degree-`d` subsheaves, each represented by an open and closed subscheme `Pic^d_{X/S}` … each `Pic^d_{X/S}` is a `Pic⁰_{X/S}`-torsor".

**Claim.** This roadmap owns the degree decomposition and the torsor structure over an arbitrary base `S`.

**Witness.** JacobianChallengePartII at the head of pull request #1225 owns exactly this over a noetherian base: `README.md` "Scope and ownership" ("local constancy of the fibre degree on every test scheme and the degree components `Picᵈ_{X/S}`; … the torsor structure of `Picᵈ_{X/S}` under `Pic⁰_{X/S}`"), §0.1 (local constancy, through its §0.0 limit argument for non-noetherian `T`), §0.2 (the subsheaves), §0.3 (`Pic^d` open and closed, `Pic⁰` representing `relativePicardDegreeZeroFppfSheaf π` along `relativePicardDegreeZeroFppfSheafι`), §0.4 (torsors); it lists JacobianChallenge Layers A–D as its supplier and is later in the merge order (line 52 against line 2). Over a field the same objects are SchemeAndStackFoundations §3.6 on main (`picardComponent X d`, `picardComponent_torsor`, `jacobian X := Pic⁰_{X/k}`), which cites "JacobianChallenge Layer D's Picard scheme". The passage also derives local constancy on an arbitrary test scheme `T` from Layer C, whose semicontinuity is stated for locally Noetherian `S` (lines 271–277); the non-Noetherian case needs the finite-presentation limits of SchemeAndStackFoundations §0.9 that line 377 cites for the construction itself.

**Repair.** Keep in this passage only what the Jacobian needs: for the standing curve over `k`, `relativePicardDegreeZeroFppfSheaf` is represented by an open and closed subgroup scheme of `picardScheme` (through `relativePicardDegreeZeroFppfSheafι`), the input of `jacobianSchemeRepresentableBy`. Replace the general-base sentences by one line each: "the degree-`d` pieces and their torsor structure over a field are SchemeAndStackFoundations §3.6 (`picardComponent`, `picardComponent_torsor`); over a general base they are JacobianChallengePartII §§0.1–0.4", and cite SchemeAndStackFoundations §0.9 wherever local constancy on an arbitrary `T` is used.

## R04 (P3) — Three declarations close by one library lemma

**Location.** `Suggested.lean` lines 55–58 (`cartierPicardEquiv := …classGroupAddEquivLineBundleClass X`), 62–67 (`cartier_sheaf_iso_iff_principal … := by exact …nonempty_iso_sheaf_iff`), 159–162 (`properIntegralGroup_commutative … := by exact isCommMonObj_of_isProper_of_geometricallyIntegral G`).

**Claim.** They are headline statements.

**Witness.** Each is the pinned declaration under another name: `TauCeti/AlgebraicGeometry/CartierDivisor/ClassGroup.lean:123` and `:158`, `Mathlib/AlgebraicGeometry/Group/Abelian.lean:131`. The README already cites all three by their library names (lines 70–75, 126–129).

**Repair.** Delete the three from `Suggested.lean`; the README keeps the citations.

## R05 (P3) — README form

**Location.** `README.md` throughout: no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build`; the layers are bullet lists under `### Layer A, …` with no `### k.n` subsections and no `### Examples` / `### Dependencies`; process narrative at lines 113 ("Codex's recommended dependency order, refined"), 115 ("state those milestones in `Suggested.lean`"), 20 and 709–717 ("v1", "v2", "out of scope for v1"); lines 12–14 and the sections "Acceptance criteria" and "Scope and caveats (Kevin Buzzard)" carry what the house shape puts under Scope and Conventions. The module docstring of `Suggested.lean` (lines 17–20) describes the file as suggested forms for milestones rather than the headline theorems.

**Claim.** The README is in TauCetiRoadmap form.

**Witness.** The form is the brief's "The README in TauCetiRoadmap form" list and "Definite about scope: nothing is 'optional', 'deferred' or 'for later'". This predates the pull request, but the pull request rewrites Layers B and D and is the round in which the shape is held against the checklist.

**Repair.** Add the four headings (the supplier contracts are the inventory lists at lines 54–94 plus the `*Needs:*` lines, grouped by supplier; Scope is the "end goal", "standing hypotheses" and "caveats" text, with the v2 items either placed in a layer or named as a Part II deferral); number the items of each layer `### k.n` and close each layer with `### Examples` and `### Dependencies`; cut the process sentences; make the docstring say that the file states the headline theorems and which are not statable.

## Verified sound

**Gate and build.** The worker's gate: every scanner zero except `sorry-data=4` (R01); `depcheck=0`, `build=0`. Dependency check, run by me: `depcheck: 245 roadmaps, 2466 edges, 0 problem(s)` with `--movable`, no UPWARD or CYCLE line. Diff outside the folder: none (`git diff --stat origin/main...HEAD` lists only the two folder files). Dropped ids cited elsewhere: none (`pointedCurvePicard_representable` and the old `JacobianVariety X hdim` signature are cited by no README on main; consumers cite "Layer A–F", which the head keeps).

**Pins.** Both `lake-manifest.json` files resolve Tau Ceti to 2fd255d9; every name below was read there. Pull request #1187 (a Tau Ceti bump) textually conflicts with this file, but its target ab00ba392 (2026-10-19) is an ancestor of the pin, so it is superseded and no order needs stating.

**Signatures.** All 16 elaborated types in the worker's `signatures.md` compared with the README statements; none lost a binder. `hasPicardScheme_of_curve`, `JacobianVariety`, `abelJacobi`, `isAlbanese_abelJacobi` carry `SmoothOfRelativeDimension 1`, `IsProper`, `GeometricallyConnected`, which are the variable hypotheses of `relativePicardDegreeZeroFppfSheaf` (`PicZero/Fppf.lean:57–58`) and `abelJacobiMapToPicZeroFppf` (`Abel/Fppf.lean:53–55`).

**Natives at the pin (file:line).** `relativePicardFppfSheaf` `PicardFunctor/Fppf.lean:104` (AddCommGrpCat.{u+1}-valued, no representability asserted); `relativePicardDegreeZeroFppfSheaf` `PicZero/Fppf.lean:114`, `…ι` `:192`; `relativePicardFiberDegree` `PicZero/Basic.lean:141`; `relativePicardPresheafBaseChangeIso` `PicardFunctor/BaseChange.lean:115`; `relativePicardDegreeZeroFunctorBaseChangeIso` `PicZero/BaseChange.lean:158`; `rigidifiedPicardFunctor` `PicardFunctor/Rigidified.lean:70`; `rigidifiedPicardDegreeZeroFunctorIso` `PicZero/Rigidified.lean:255`; `abelJacobiMapOfDegree` `Abel/Degree.lean:110`; `relativeEffectiveCartierDegreeSubfunctor` `EffectiveCartierDivisor/Degree/Basic.lean:59`, representable instances for `d = 0, 1` only (`Representable.lean:94, 160`), so the general-`d` headline is not padding; `relativeEffectiveCartierDegreeOneSection` `Degree/Basic.lean:85`; `cohomologyMapBaseLinear` `Cohomology/Module/Base.lean:60`; `Scheme.genus` `Cohomology/Genus.lean:64` (guarded by a finite-dimensionality instance, as line 218 says); `genus_eq_genus_functionField` `WeilDivisor/Scheme/SerreDuality.lean:245`; `cohomologyOneDualEquivCohomologyZero` `:122` and its `_symm_apply_repartitionToCohomologyOne` `:137` (pairing `ω(f · a)`, as line 180 says); `repartitionToCohomologyOne` `PrincipalParts/RepartitionCohomology.lean:155`; `relativeDifferentialsIsoDivisorSheaf` `Modules/Differentials/Canonical.lean:170` (depends on a separating `t`); `nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual` `:248`, `finrank_cohomology_zero_relativeDifferentials` `:262`, `finrank_cohomology_zero_sub_…` `:286`, `eulerDegree_relativeDifferentials` `:305` (hypotheses `IsFunctionField`, `IsIntegrallyClosedIn`, DVR stalks, invertible differentials, valuative existence, as lines 226–233 restate); `classGroupAddEquivLineBundleClass` `CartierDivisor/ClassGroup.lean:123`, `principalSubgroup_eq_ker` `:61`, `nonempty_iso_sheaf_iff` `:158`; `IsIwanagaGorenstein` `RingTheory/IwanagaGorenstein.lean:48`; `IsCurveOver` (`Curves/Category.lean:85`); `DescentDatum` `CategoryTheory/Limits/Shapes/Pullback/DescentDatum.lean:86`, `exists_isAffine_baseChange_hom_isIso` `Descent/Affine.lean:532`; `AbelianVariety` `AbelianVariety/Basic.lean:95` (fields `toOver`, `grpObj`, `isProper`, `geometricallyIntegral`); `IsAlbanese` `Albanese.lean:84`, `isAlbanese_of_isIso` `:215`, the trivial abelian variety `:234`; `mulBy` `End/Basic.lean:237`; `IsIsogeny` `Isogeny.lean:61` (finite and surjective); `isIsogeny_mulBy_zero_iff` and `mulBy_eq_id_of_dim_eq_zero` `DimensionZero.lean:113, 120` (the dimension-zero Checks of Layer E agree with them; no `[n] ≠ 0` isogeny theorem exists, so `multiplication_isogeny` and `multiplication_etale_iff` are not padding). Mathlib: `Functor.IsRepresentable` `CategoryTheory/Yoneda.lean:514`, `reprX` `:564`, `representableBy` `:568`, `isoReprX` `:572`, `uliftYonedaReprXIso` `:596`; `GrpObj.ofRepresentableBy` `Monoidal/Cartesian/Grp.lean:34`, `IsCommMonObj.ofRepresentableBy` `CommMon_.lean:29`; `SmoothOfRelativeDimension` `AlgebraicGeometry/Morphisms/Smooth.lean:127`; `isCommMonObj_of_isProper_of_geometricallyIntegral` `Group/Abelian.lean:131`. `Scheme.Modules.Cohomology.formalFunctionsIso` (line 298, the resolver's lead) is not at the pin: it is SchemeAndStackFoundations §4.9's own planned export (its README lines 5457–5467 name it and the file), so the citation resolves to the owner.

**Cross-roadmap citations.** SchemeAndStackFoundations on main: §0.9 (line 848), §0.11 (938), §1.1 (2071), §2.2 (3309), §2.11 (3656), §3.6–3.7 (4905, 4937), §4.9 (5448), §4.12 with `chow_lemma` (5625), §4.14 (5706) all exist as cited. §4.9 and this roadmap's Layer C/D cite each other at the target level (Layer C item 1 → §4.9 → Layer D), and §4.9 lines 5461–5467 document that direction; the dependency check accepts it. StableReduction's contract J-C (its line 307) matches Layer C's hypotheses (proper, locally Noetherian base, coherent flat `F`). AlgebraicModuliForArithmeticGeometry §7.3 and AbelianSchemesAndArithmeticModuli A0.2/A2.2 are named only as deferral or consumer, not as suppliers. Consumers on main citing this roadmap by layer letter (SchemeAndStackFoundations, AlgebraicCurves, EnhancedDerivedSheaves, StableReduction, AdicSpacesPartIII, ModularCurves) still resolve.

**Sources (seeded sample and locators).** Kleiman, *The Picard scheme* (arXiv math/0504020v1, cache `cc14e62f`): Theorem 2.5 line 880 (p. 18), Theorem 4.8 line 1309 (pp. 27–28, projective Zariski-locally, flat, integral geometric fibres, no rational point), Lemma 4.9 line 1440 (p. 30), Theorem 5.11 line 2002 (p. 42, `T₀ Pic = H¹(𝒪)`), Proposition 5.19 line 2219 (p. 47, smooth where `H²(𝒪) = 0`), Exercise 5.23 line 2390, Remark 5.24 line 2394 (pp. 50–51), standing convention lines 755–757 (p. 15). Stacks (book, cache `5b3a46c2`): 0BS2 line 211164 (proper of dimension ≤ 1; (5) `Hom(F, ω) = H¹(F)^∨` for quasi-coherent `F`, (6) `ω ≅ Ω` when smooth of relative dimension 1), 0BS3 line 211194, 0BS6 line 211350 (Gorenstein Riemann–Roch for locally free `E`), 0C19 line 211584, 0C1A line 211589, 0BUG line 134754 ((8) `H⁰ = k` for geometrically integral), 0B9Z line 187152 (separably closed `k`, as the attribute says), 0BA0 line 187165 (separably closed; `Pic⁰` open and closed subgroup, `γ_d` surjective for `d ≥ g`, smooth for `d ≥ 2g − 1`, birational for `d = g`), 0B9A line 186750, 0B9D line 186806, 0B9I line 186913 (geometrically irreducible, as line 492 says), 0B9N line 186997, 056U line 135968 (smooth over `k`: closed points with finite separable residue field are dense), 0CDR line 142258, 0BFG line 170609 (`[d]` finite locally free of degree `d^{2 dim A}`), 0BFH line 170632 (nonzero `A`: `[d]` étale iff `d` invertible in `k`), 0A26 line 138149, 01ZY line 115158, 02O5 line 124999, 02KH line 123108, 0BDN line 149386, 0B91 line 149209. Milne, *Abelian Varieties* v2.0 (jmilne.org course notes, cache `f5ca4e63`, printed page = PDF page − 6): I Theorem 5.1 / Corollary 5.2 / Theorem 5.5 (printed 21–23), Theorem 6.4 (29), Theorem 7.2 (33: `[n]` isogeny of degree `n^{2g}`, étale iff `p ∤ n`), Proposition 8.4 (35), Remark 8.7 and Theorem 8.9 (37), III Proposition 6.1 (104: the Albanese property of `f_P` for a `k`-rational `P`), Theorem 6.6 (105), Lemmas 6.8–6.9 (106), Remark 6.10(c) and Summary 6.11 (107). The seeded targets: "Jacobian" (Galois descent, 056U + 0CDR + Kleiman 4.8), "Pic⁰" (0BA0, Kleiman 5.11/5.19), "Abel–Jacobi" (Milne III 6.1, 6.8–6.10) all support the statements as written, with the separably-closed / rational-point hypotheses of the sources recorded in the README where they are dropped.

**Ownership.** Part II (#1225) consumes Layers A–F and owns the family version (R03). ModularCurves on main consumes natives only. No other open roadmap defines a fully qualified name of this file.

**Adversarial table.**

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| `serreDualityTrace` formula (README 151–156) | `ℙ¹_{𝔽_p(t)}`, `P : x^p = t`, `η = x^{p−1}dx/(x^p−t)` | `Res_∞ η = −1`; class of `(η at P)` = class of `(−η at ∞)`, trace must be `1`; formula gives `Tr_{κ(P)/k} = 0` | not well defined | R02 |
| same, separable case | `ℙ¹_k`, repartition `dt/t` at 0 (Check 1) | `Res_0 = 1`; global `dt/t`: `1 + (−1) = 0` | agrees | none |
| `serreDuality_existsUnique` | `X = ∅` (smooth of every relative dimension) | `H¹(Ω) = 0`, `Hom(F, Ω) = {0}`, `ℓ = 0`: unique `φ = 0` | holds | none |
| same | `X = ℙ¹_L` over `k`, `[L:k] = 2` separable (not geometrically connected) | duality over `L` composed with `Tr_{L/k}`, nondegenerate as `L/k` separable | holds | none |
| same, `F = κ(x)` (Check 2) | skyscraper | `H¹ = 0`, `Hom(κ(x), Ω) = 0` | both sides `0` | none |
| `dim H⁰(Ω) = g` (One genus) | `ℙ¹_L` over `k` | `g = dim_k H¹(𝒪) = 0`, `H⁰(Ω) = 0` | holds | none |
| `deg Ω = 2g − 2` needs `H⁰ = k` (Check 3) | `ℙ¹_L/k` | `χ_k(Ω) = 0 − 2 = −2`, `χ_k(𝒪) = 2`, `deg = −4 ≠ −2` | hypothesis necessary | none |
| Gorenstein Checks | nodal cubic; `k⟦t³,t⁴,t⁵⟧` | `ω = 𝒪`, `deg ω = 0 = 2·1−2`; semigroup `⟨3,4,5⟩`: gaps `{1,2}`, Frobenius `2`, `(F+1)/2 = 3/2 ∉ ℤ` so not symmetric, pseudo-Frobenius `{1,2}`, type 2 | both as stated | none |
| Riemann–Roch for coherent `F` with `deg F := χ(F) − rχ(𝒪)` | `F = κ(x)`, `F = 𝒪` | `e − 0 = e + 0`; `1 − g = 1 − g` | tautological given duality, as the README says | none |
| Layer C Checks | `i : Spec(A/t) → Spec A`; `𝒪(n)` on `ℙ¹_A`; three sections in `ℙ²_{𝔸¹}` | `R^{≥1} i_* = 0`, `H⁰ = k` not flat; ranks `max(n+1,0)`, `max(−n−1,0)`, both `0` at `n = −1`; collinear iff `t = 0`, `h⁰(𝓘_Z(1)) = 1` at `t = 0` else `0`, `χ = 3 − 3 = 0`, `f_*F = 0` (generic rank 0 inside free `A³`) | all hold | none |
| `HasPicardScheme (𝟙 S)` (Check) | `f = 𝟙 S` | `Pic(S_T)/Pic(T) = 0`, representing object the terminal `S` | holds | none |
| `picardScheme (ℙ¹_k)` | | `∐_ℤ Spec k`, not quasi-compact | holds | none |
| pointless real conic | `Pic¹(ℝ)` | `Pic(X_ℂ)^{Gal} = ℤ` so a real point of `Pic¹`; `Br(ℝ) = ℤ/2` obstructs the bundle | holds | none |
| Degree pieces over `S` | `T` non-Noetherian | Layer C semicontinuity stated for locally Noetherian `S` (lines 271–277) | step unowned here; owned by Part II §0.0–0.1 | R03 |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` | `X = ℙ¹_k ⊔ ℙ¹_k` (not geometrically connected), `d = 2` | `Hilb² = Sym²ℙ¹ ⊔ (ℙ¹ × ℙ¹) ⊔ Sym²ℙ¹ = Sym²(X)`; `0B9A` applies (finite sets in affine opens, 01ZY) | holds without connectedness | none |
| `Hilb²(ℙ¹_{𝔽_q})(𝔽_q)` (Check) | | `ℙ²(𝔽_q) = q² + q + 1`; degree-two points `(q² − q)/2` | holds | none |
| `JacobianVariety` genus 0 | `ℙ¹_k`, pointless conic | `Spec k`, the trivial abelian variety (`Albanese.lean:234`) | holds | none |
| Selmer cubic | `3x³+4y³+5z³` | `Jac` an elliptic curve with a point, `X(ℚ) = ∅`, so `X ≇ Jac` over `ℚ` | holds | none |
| `multiplication_isogeny` | `n = 0`, `dim A > 0` | `[0]` not finite; excluded by `n ≠ 0`; `dim A = 0`: `[0] = 𝟙` (`DimensionZero.lean:113`) | consistent | none |
| `multiplication_etale_iff` | `n = 0`, `dim A > 0`; `n = p` in char `p`; `n = 2`, `k = 𝔽_3` | `(0 : k) = 0`, `[0]` not étale; `(p : k) = 0`, `A[p]` non-reduced; `(2 : 𝔽_3) ≠ 0`, étale (0BFH) | iff holds both ways | none |
| `φ_L` for `L = 𝒪([0])` (Check) | elliptic `E`, point `a` | `t_a^*𝒪([0]) = 𝒪([−a])`, `φ_L(a) = 𝒪([−a] − [0])`; Abel map `𝒪([a] − [0])`; differ by `[−1]` | holds; `q ∘ λ_Θ = [−1]` consistent | none |
| `[n]` degree, supersingular `E[p]` (Checks) | | `n²`; length `p²`, one geometric point | hold | none |
| `IsAlbanese` genus 0 | `X = ℙ¹_k`, any `f : (X, x₀) → (A, 0)` | factor through `Spec k`: `φ = 0`, `f = 0` (rational curves map trivially to abelian varieties) | holds | none |

## Not verifiable

- Hartshorne, *Algebraic Geometry* (II.6.13–6.15, III §7, III.5.1, III.12.8–12.11): no legal copy; cited by locator, standard statements cross-checked against Stacks above.
- Mumford, *Abelian Varieties* §5, §13: no legal copy; the §5 cohomology-and-base-change statements are cross-checked against Stacks 0B91/0BDN.
- Serre, *Algebraic Groups and Class Fields*, Chapter II: no legal copy; its algebraically-closed setting is the point of R02.
- Liu, *Algebraic Geometry and Arithmetic Curves*; Bosch–Lütkebohmert–Raynaud, *Néron Models* Ch. 8–9: no legal copy; cited only in the reference list.
- Milne, *Jacobian Varieties* (Cornell–Silverman): the author's version is on jmilne.org, but the README's III-numbering and pages match the *Abelian Varieties* course notes, which were used.

## Source issues

- none
