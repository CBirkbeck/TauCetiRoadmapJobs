# Review of ArcTopologyAndDescent (pull request #1755 at 678e3cb)

**Verdict:** needs changes

Incremental re-review of the 28 README lines changed since 5570295 (`Suggested.lean` is unchanged). Both previous findings are repaired. The repair of R02 left one P3 gap in the supplier contracts, set out below. :robot: Independent AI review.

## R01 (P3) — The pinned declarations behind FEt, and Mathlib's big étale topology, have no supplier-contract entry

**Location.** `TauCetiRoadmap/ArcTopologyAndDescent/README.md:908`: "Define FEt as the `TauCeti.AlgebraicGeometry.SchPseudofunctor` … identity and composition isomorphisms are `TauCeti.FiniteEtaleScheme.pullbackId` and `TauCeti.FiniteEtaleScheme.pullbackComp` … `CategoryTheory.Pseudofunctor.IsStack` for Mathlib's `AlgebraicGeometry.Scheme.etaleTopology`". The `### From Tau Ceti` contract (line 67) names only `TauCeti.Huber.IsStrictlyTopologicallyFiniteType` and three lemmas about it.

**Claim.** The repair of the previous R02 moved the assembly of FEt into §6.6. It also took `SchPseudofunctor`, `pullbackId` and `pullbackComp` out of the EtaleCohomologyFoundations contract (line 111), but did not add them anywhere in `## Exact supplier contracts`. §6.6 now consumes these pinned declarations directly, and none of them has a contract entry giving its file and what is assumed of it:
- `SchPseudofunctor`;
- `FiniteEtaleScheme.pullbackId` and `FiniteEtaleScheme.pullbackComp`;
- the component lemmas `pullbackId_hom_app_hom` and `pullbackComp_hom_app_hom`, on which the coherence route rests;
- the separably-closed-field comparison that Check 1 relies on;
- Mathlib's big étale topology, which is the topology of the étale stack property.

Line 111 still covers only the carrier and `FiniteEtaleScheme.pullback`.

**Witness.** In the README, `grep -n 'SchPseudofunctor\|pullbackId_hom_app_hom\|Scheme.etaleTopology'` matches only line 908. At the pins they are at `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`, `FiniteEtale/Fiber.lean:78, 84, 96, 103`, `FiniteEtale/Basic.lean:197` and `Mathlib/AlgebraicGeometry/Sites/Etale.lean:40`.

**Repair.** Add to `### From Tau Ceti`:
- In `TauCeti/AlgebraicGeometry/Stack/Basic.lean`, `TauCeti.AlgebraicGeometry.SchPseudofunctor` (line 37) is `Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}`.
- In `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean`:
  - `TauCeti.FiniteEtaleScheme.pullback` (line 51) is Mathlib's `Over.pullback` on underlying objects;
  - `pullbackId` is at line 78;
  - `pullbackComp f g : pullback (f ≫ g) ≅ pullback g ⋙ pullback f` is at line 96;
  - the components of these two isomorphisms are those of Mathlib's `Over.pullbackId` and `Over.pullbackComp`, by `pullbackId_hom_app_hom` (line 84) and `pullbackComp_hom_app_hom` (line 103).
- In `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean`, `TauCeti.FiniteEtaleScheme.equivOfIsSepClosed` (line 197) gives `FiniteEtaleScheme (Spec Ω) ≌ FintypeCat` for separably closed Ω. Check 1 of §6.6 uses it.

Add one bullet to `### From Mathlib`: `AlgebraicGeometry.Scheme.etaleTopology`, in `Mathlib/AlgebraicGeometry/Sites/Etale.lean` (line 40), is the big étale topology `grothendieckTopology @Etale` on `Scheme.{u}`.

No Lean change. After these additions, every pinned name at line 908 and the comparison in Check 1 has a contract entry.

## Previous findings

- R01 — repaired: line 99 now says "the site functor Y.Etale ⥤ X.Etale, V↦V×_Y X, is Mathlib's `CategoryTheory.MorphismProperty.Over.pullback` of f … Section 0.23a is cited only for a universal homeomorphism f". Grep finds none of the six revision-only names (`Scheme.Hom.etaleSite`, `Scheme.etalePullback`, `Scheme.etalePushforward`, `Scheme.etaleAdjunction`, `Scheme.etalePullbackComp`, `Scheme.Etale.overEquiv`) anywhere in the README.
- R02 — repaired: line 908 says "Define FEt as the `TauCeti.AlgebraicGeometry.SchPseudofunctor` … Prove that FEt is a stack for the étale topology … the effective descent … that EtaleCohomologyFoundations §F.0.2 supplies, restated on FEt". Line 111 cites §F.0.2 only for the carrier and that descent. The repair introduced R01 above.

## Verified sound

**Scope and gate.**
- Head `678e3cb83cb42fb0fc09074de4ee95ebbf7d322d` confirmed. The folder diff since 5570295 is 18 insertions and 10 deletions in `README.md` only; `Suggested.lean` has no diff.
- `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.
- Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, matching the worktree's `.lake/packages` checkouts.
- Re-ran the gate on this head: every scanner reports 0, then `OK`. The worker's gate also reports `build=0`.
- Re-ran the standalone dependency check, which returned exactly:

```text
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. ArcTopologyAndDescent is line 100 of the merge order. The new edges (Mathlib `MorphismProperty.Over.*`, Tau Ceti `FiniteEtale.Fiber`, SchemeAndStackFoundations §2.1 in §6.2) point to the pins or to roadmaps on main.

**Lean.**
- `lake env lean` on `TauCetiRoadmap/ArcTopologyAndDescent/Suggested.lean` gives five `declaration uses sorry` warnings (lines 67, 79, 101, 123, 134) and nothing else.
- The file is unchanged, and the worker's elaborated signatures at this head show no lost binder, so the `#check @name` comparison of the earlier rounds still holds. I did not repeat it.
- The module docstring's §6.6 item ("lacks … the pseudofunctor assembled from Tau Ceti's finite etale base change") is still accurate. FEt is a README target here and is not declared at the pins.

**Pinned declarations opened.**

Mathlib:

| Declaration | File:line | What it says |
| --- | --- | --- |
| `MorphismProperty.Over.pullback` | `CategoryTheory/MorphismProperty/OverAdjunction.lean:98` | `P.Over Q Y ⥤ P.Over Q X` for `f : X ⟶ Y`, needing `P.HasPullbacksAlong f`, `P.IsStableUnderBaseChangeAlong f`, `Q.IsStableUnderBaseChange` |
| `Over.pullbackComp` | same file, `:113` | `pullback (f ≫ g) ≅ pullback g ⋙ pullback f` |
| `Over.mapPullbackAdj` | same file, `:192` | `Over.map Q hPf ⊣ Over.pullback P Q f`, given `hPf : P f`, `hQf : Q f` and `P.IsStableUnderComposition` |
| `Functor.sheafPullback` | `Sites/Pullback.lean:56` | `Sheaf J A ⥤ Sheaf K A` for `G : C ⥤ D`, defined as the left adjoint of `sheafPushforwardContinuous`; `sheafAdjunctionContinuous` at `:60` |
| `Functor.sheafPushforwardContinuous` | `Sites/Continuous.lean:358` | `Sheaf K A ⥤ Sheaf J A` |
| `GrothendieckTopology.over` | `Sites/Over.lean:231` | the induced topology on a slice |
| `GrothendieckTopology.overPullback` | `Sites/Over.lean:270` | `Sheaf J A ⥤ Sheaf (J.over X) A`, the pushforward along `Over.forget X`, i.e. restriction to the slice |
| `Scheme.etaleTopology` | `AlgebraicGeometry/Sites/Etale.lean:40` | `grothendieckTopology @Etale` on `Scheme.{u}` |

- With G = `Over.pullback f : Y.Etale ⥤ X.Etale`, J on Y and K on X, these give `f⁻¹ : Sh(Y_ét) → Sh(X_ét)` and `f_* : Sh(X_ét) → Sh(Y_ét)`, as line 99 says.
- Mathlib has no `IsContinuous` instance for base change between small sites. Under `AlgebraicGeometry/Sites/` the only instances are `Proetale.lean:153, 163` and `BigZariski.lean:77`. So SchemeAndStackFoundations §2.1 is the right owner of continuity.
- Mathlib has no pseudofunctor `S ↦ Over S` by pullback. `Sites/PseudofunctorSheafOver.lean:37` is sheaves on slices, so FEt duplicates nothing.

Tau Ceti:

| Declaration | File:line | What it says |
| --- | --- | --- |
| `SchPseudofunctor` | `AlgebraicGeometry/Stack/Basic.lean:37` | `Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}` |
| `FiniteEtaleScheme` | `FiniteEtale/Basic.lean:66` | full subcategory of `Over S`: objects in `Type (u+1)`, morphisms in `Type u`, so it fits `Cat.{u, u+1}` |
| `FiniteEtaleScheme.pullback` | `FiniteEtale/Fiber.lean:51` | base change of finite étale schemes |
| `pullbackId`, `pullbackId_hom_app_hom` | `Fiber.lean:78`, `:84` | the component lemma holds by `rfl` |
| `pullbackComp`, `pullbackComp_hom_app_hom` | `Fiber.lean:96`, `:103` | the component lemma holds by `rfl` |
| `FiniteEtaleScheme.equivOfIsSepClosed` | `Basic.lean:197` | `FiniteEtaleScheme (Spec (.of K)) ≌ FintypeCat.{u}` |

**Supplier sections resolved on main (eaf17b1).**
- SchemeAndStackFoundations §0.23a (line 1508): `smallEtaleBaseChange f` is the scheme pullback functor for a universal homeomorphism `f` and is an equivalence of sites, as line 99 now limits it.
- SchemeAndStackFoundations §2.1 (line 3265): `Sheaf.H.pullback` with `pullback_id` and `pullback_comp` "through `u⁻¹ v⁻¹ ≅ (v u)⁻¹`", over `Functor.sheafPullback` and `sheafPushforwardContinuous`. It owns "the generic site/D⁺ construction, including its small-étale specialization".
- SchemeAndStackFoundations §2.5 (line 3388): `slice_site_cohomology`, `H^n(C/U, F|_U) = H^n(U, F)`.
- EtaleCohomologyFoundations §F.0.2 (lines 200–219): "Supply pullback, finite coproducts, connected components, deck maps, effective descent and finite-group quotients on this carrier". It names no pseudofunctor. The README now attributes to it only the carrier and effective descent. "Along étale covering families" is the minimal standard sense of that unqualified phrase: étale covering families are fpqc coverings, and finite étale schemes descend effectively along them.
- `roadmaps grep` over main and all 466 open heads finds no other owner of a finite étale pseudofunctor on schemes. AdicEtaleGeometry's `Huber.finiteEtalePseudofunctor` (main, line 2680) lives on complete Huber pairs, not schemes. So §6.6 is the owner of FEt.

**Sampled targets.**
- None of the fifteen seeded targets is itself changed.
- §§3.3, 4.6 and 6.1 are cited by changed lines (the §6.2 `*Needs:*` and the §6.6 stack target), so I re-checked them against BM21:
  - Lemma 3.7 is at line 703, p. 17, with Tot ≃ Tot_{n+2} on `S≤n` at line 708. Proposition 3.8 is at line 712 and runs onto p. 18 (marker at line 716).
  - Theorem 4.1 is at line 1009, p. 25, and its three equivalent conditions are those of §4.6. Proposition 4.2 is at line 1030, p. 25; Proposition 4.8 at line 1145, pp. 28–29 (marker at line 1179); Proposition 4.15 at line 1322, p. 32.
  - Lemma 5.3 is at line 1556, p. 38 (marker at line 1551). The FinSet statement is in the proof of Theorem 5.6, line 1662.
- All three locators and hypotheses are as written.
- The other twelve (§§0.1, 1.1, 2.2, 2.4, 2.5, 3.5, 3.7, 3.9, 7.7, 8.1, 9.2, 11.1) are untouched by the diff and are carried from earlier rounds, not re-verified here.
- The four source issues earlier rounds recorded (BM21 Theorem 6.25 remark, Lemma 4.3, Lemma 4.4 proof, Lemma 7.8 proof) are unaffected.

**Adversarial table.** Fresh rows for every changed statement come first, then the inherited rows, each citing the review that computed it.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Line 99, Scope row 27, Conventions 44: directions of the étale functors | `f : X ⟶ Y`; G = `Over.pullback f` | G : Y.Etale ⥤ X.Etale (V ↦ V ×_Y X); `G.sheafPullback : Sh(Y_ét) → Sh(X_ét)` is left adjoint to `G.sheafPushforwardContinuous : Sh(X_ét) → Sh(Y_ét)`; `J.overPullback A U : Sh(X_ét) → Sh(X_ét/U)` | directions match f⁻¹ ⊣ f_* and restriction | none |
| Line 99: §0.23a only for universal homeomorphisms | fold map X ⊔ X → X; thickening Spec k → Spec k[ε]/ε² | the fold map has 2 points over 1, so it is not a universal homeomorphism and needs §2.1; the thickening is a homeomorphism after every base change, so §0.23a applies (used only in line 929) | consistent | none |
| Line 99 and line 1353: `mapPullbackAdj` for étale f | P = `@Etale`, Q = ⊤ | needs `hPf : Etale f` (given), `hQf : ⊤ f` (trivial), Etale stable under composition and base change | adjunction `Over.map ⊣ Over.pullback` available | none |
| §10.0 API bullet (line 1353): étale pullback preserves sectionwise torsion | h : U → X étale; V affine étale over U; L = `Over.map h` ⊣ G = `Over.pullback h` | Lan along Gᵒᵖ is precomposition with Lᵒᵖ, so (h⁻¹F)(V) = F(V → U → X), already a sheaf (L preserves étale covering families); V → X is affine étale, so n_V kills the section | holds | none |
| §6.2 route and `*Needs:*` (lines 890, 894) | Y^n → X arbitrary qcqs; U ↦ U ×_X Y^n | `Over.pullback` along Y^n → X gives X.Etale ⥤ (Y^n).Etale and F is evaluated on the underlying scheme; continuity from SSF §2.1; dropping §0.23a is correct because Y^n → X is not a universal homeomorphism in general (fold map) | matches BM21 Lemma 5.1 (lines 1519–1534) | none |
| §6.6 FEt definition (line 908): types and shape | `SchPseudofunctor`; `pullbackComp f g` | `FiniteEtaleScheme S`: objects in `Type (u+1)`, morphisms in `Type u`, so it fits `Cat.{u,u+1}`; (f ≫ g)ᵒᵖ = gᵒᵖ ≫ fᵒᵖ, so `mapComp gᵒᵖ fᵒᵖ : F(f≫g) ≅ F g ⋙ F f` is exactly `pullbackComp f g`; component lemmas hold by `rfl` (Fiber.lean:84, 103); map₂ is trivial on `LocallyDiscrete` | definable from the pins | R01 (contract) |
| FEt Check 1 | Ω separably closed; k = ℚ, Ω = ℚ̄ | `equivOfIsSepClosed`: ∅ ↦ 0 elements, Spec Ω ⊔ Spec Ω ↦ 2; covariant model: Spec ℚ̄ → Spec ℚ is integral of infinite degree, not finite, so Spec ℚ̄ ∉ FEt(Spec ℚ) | correct, discriminating | none |
| FEt Check 2 | f : Spec ℂ → Spec ℝ; the pair (id_{Spec ℝ}, f) | ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ via a⊗b ↦ (ab, a·b̄): 2 points over 1; natural automorphisms of f* (finite Gal-sets → finite sets) form Gal(ℂ/ℝ) ≅ ℤ/2, the non-trivial one swapping the two points; the left-unitor axiom expresses mapComp(𝟙, f) through mapId, so twisting only mapComp violates it | correct | none |
| FEt Check 3 | Spec ℂ → Spec ℝ; Y = {a,b} × Spec ℂ | descent data on Y are involutions of {a,b}: swap (1 orbit) gives Spec ℂ over ℝ, 1 point; identity (2 orbits) gives Spec ℝ ⊔ Spec ℝ, 2 points; 1 ≠ 2, so they are not isomorphic; FEt(Spec ℝ) ≃ finite ℤ/2-sets | correct | none |
| FEt étale stack property from ECF §F.0.2 | `Scheme.etaleTopology`; the cover Spec ℂ → Spec ℝ | the topology lives on `Scheme.{u}`, the universe of `SchPseudofunctor`; étale jointly surjective families are fpqc coverings; affine morphisms descend and finite étale is fpqc-local, so data are effective; §F.0.2 says "effective descent … on this carrier" | supplied | none |
| §6.6 three-pseudofunctor statement (line 916) | separated qcqs étale; FEt; constructible finite-set sheaves | base change of the third is the SSF §2.1 inverse image along `Over.pullback` with set-valued coefficients; the list is F₀, F₁, F₂ of BM21 Theorem 5.6 (lines 1624–1632) | matches | none |
| §6.6 arc stack target, first and last sentences (line 924) | an étale covering family; Spec ℂ → Spec ℝ | FEt is now the §6.6 definition; étale covering ⇒ fpqc ⇒ v-cover ⇒ arc-cover, so restriction to étale families gives the étale stack property derived above | consistent | none |
| Scope row 28 and contract line 111 | ECF main lines 200–219; README grep | ECF supplies the carrier and descent, §6.6 assembles FEt; no remaining "pseudofunctor of EtaleCohomologyFoundations §F.0.2" | consistent | none |
| `## Exact supplier contracts` (lines 48–67) against line 908 | grep of the names | `SchPseudofunctor`, `pullbackId_hom_app_hom`, `pullbackComp_hom_app_hom`, `Scheme.etaleTopology` occur only at line 908; `### From Tau Ceti` lists 4 Huber declarations | entries missing | R01 |
| §3.3, §4.6, §6.1 locators (sampled) | BM21 lines 703, 712, 1009, 1030, 1145, 1322, 1556 | pages 17, 17–18, 25, 25, 28–29, 32, 38 from the page markers; unbounded D(Λ) is excluded by "compactly generated by cotruncated objects" (line 699) | exact | none |
| §6.6 arc stack target, Checks 1–3; route via `IsStack.of_precoverage` (untouched; carried from the previous review, r4) | rank-two aic V; Spec k → Spec k[ε]/ε²; the empty family; Precoverage.lean 378–379 | V_p ⊗_V V/p = κ(p) and all four categories are FinSet; constant Čech nerve, φ∘φ = φ forces φ = id, representable h_{A¹} fails; FEt(∅) terminal; pullbacks, isomorphisms, base change and composition supplied | correct | none |
| §5.1 remark; §9.7 noetherian Check (carried from r4) | κ < κ′; B = k + t·k[t,x] | RΓ on X's own small étale site; B[x] = k[t,x] and the quotient x·k[x] is infinite-dimensional | correct | none |
| §9.7 comparison and arc_t-equivalence, §9.10, monomial Check, §9.8, §2.2 supplier comparison (carried from r3 and the second review) | A = Z, t = 2; A = k[t,tx,x²]; t = 1; A = B = 0; j = 0..3 over F₂, F₃ | Z^tic = Z; x ∈ A^tic = k[t,x]; B = A; all zero; x ∉ A^tic at n = (c+1)² | correct | none |
| §0.1, §0.5, §0.6, §1.1, §1.6, §1.7, §2.3, §2.5, §2.7, `IsSchemeArcCover`, `arc_spectral_characterization`, `isSchemeArcCover_of_isLimit` (carried from the first review) | k algebraically closed; ℚ; F₂×F₃; zero ring; rank-two V; k[ε]/ε² → k; 8 subsets of {0,p,m}; ∅ → Spec k | T²−2 has no root in ℚ; (V/p)_p = κ(p); V → V_p × V/p is arc but not v; open inverse images exactly for ∅, {0}, {0,p}, all; the limit hypothesis is needed | correct (BM21 Definition 1.2, 2.14, Proposition 2.19, Corollary 2.20) | none |
| §§3.1, 3.6–3.8, 3.10, 4.1, 4.3–4.5, 5.1–5.2; §§7.3, 7.6, 8.1, 8.5, 8.8, 9.2, 9.4, 9.9; `IsPerfectFpScheme`, `QcqsPerfectFp`, `arcCover_iff_universallyEffectiveEpi` (carried from the first review) | D(Λ)^(≥0); lexicographic rank two; Λ = Z/4; F_p[ε]/ε²; p = 1, 0, 4; t = 0, a unit, a field K | Tor_i(Z/2,Z/2) = Z/2; ε^p = 0 kills injectivity; p = 1, 0 force ∅, p = 4 admits Spec F₂; E_t(K) = 0 ≠ RΓ(Spec K) | correct | none |
| §10.0 predicates, §§10.1–10.2, 10.5–10.7, `affinoid_artin_grothendieck`, §§11.1, 11.4–11.5, 12.2, 12.6–12.7 (carried from the first review) | n = 0; K⟨T⟩/(T²); Z/6; ⊕ Z/ℓ^r; ℓ = 1, 0; ‖2‖ = 1/2; I = (2,3) | values K, 0, a nonzero square-zero class; zero sheaf only for ℓ = 1; the residue hypothesis fails for ℓ = 2 over Q₂ | correct (BM21 Theorem 7.3, Proposition 7.6, Lemma 7.8; CS24 Theorem 2.2.5; MAT22 Definition 5.17) | none |

**Citations and overlaps.**
- The worker's three `resolve` leads:
  - PerfectoidSpacesPartII §RA.2 is the board design cited since earlier rounds (unchanged).
  - `Etale.artinSchreier_vanishing` is in SchemeAndStackFoundations on main (line 3692).
  - `Topos.isQuasiseparated_iff_of_cover` is in AdicSpacesPartII on main (line 8039).
- The previous round's revision-only names no longer appear among the leads.
- The overlap scan lists no other open pull request changing this roadmap, no dropped id, and no id that only an open revision defines.
- The four declared gaps are untouched by the diff.

**Shape.**
- The new FEt block has a definition, its two facts with a `*Needs:*` line, and three Checks, each with a computed value and the wrong model it excludes.
- The changed Scope rows, Conventions paragraph, contracts, §6.2 paragraph and §10.0 bullet add no process words, pull-request numbers, paths or LaTeX.
- No backticked name of this roadmap's own was added; FEt is not backticked.

## Not verifiable

- HUB96 remains settled as uncertified; nothing in this change cites it.
- The first review's limitation on the precise definitions of RYD10's E_qc, E_sep,qc and E_fin carries forward; that declared contract is untouched.
- PerfectoidSpacesPartII exists only as a board design; its target was read in an earlier round and is unchanged.

## Source issues

- none
