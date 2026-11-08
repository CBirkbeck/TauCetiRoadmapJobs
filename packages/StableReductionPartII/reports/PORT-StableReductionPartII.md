# PORT-StableReductionPartII

- **Branch:** `roadmap/stable-reduction-part-ii` (from `3b51055`).
- **Head commit:** `ef1de0594ff68bb41ab892a16d2c2d209b6c03ac` — "StableReductionPartII: roadmap (README, Suggested.lean, metadata)". Files: `TauCetiRoadmap/StableReductionPartII/README.md` (7502 lines), `TauCetiRoadmap/StableReductionPartII/Suggested.lean` (204 lines), `TauCetiRoadmap/StableReductionPartII/metadata.toml` (`topic = "math.AG"`). Nothing outside the folder is touched.
- **Build** (`lake build TauCetiRoadmap.StableReductionPartII.Suggested`, pins Mathlib `f6090c70`, Tau Ceti `358314d4`): `Build completed successfully (8954 jobs).` — exit 0, **5 warnings, all `declaration uses 'sorry'`** (the five theorems). No other warning.
- **Gate:** `gate StableReductionPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Depcheck** (`gate --depcheck … --movable`): `depcheck: 236 roadmaps, 2246 edges, 0 problem(s)` — no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** on the ported README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none. The worker's lead (`polarizedDescentComparison`, package README line 182) is AlgebraicModuliForArithmeticGeometry §3.5 `ModuliDescent.polarizedDescentComparison`, found at that roadmap's open head (its README line 1842, heading "3.5 Geometric comparisons and polarized descent"): not a defect.

## Draft pull request body

This roadmap continues StableReduction where it stops — stable reduction over traits and the single-marking contraction — into the explicit geometry of the moduli of stable curves over arbitrary bases. It builds the tricanonical Hilbert presentation with its projective-frame torsor; Knudsen's local algebra of a pointed node (the quadratic section ideal, its two-periodic matrix factorization, stable reflexivity relative to the coefficient ring with Ile's universal-coefficient criterion and Knudsen's completion theorem); expansion and contraction, proving the identification of `M̄_{g,n+1}` with the universal curve that SchemeAndStackFoundations §4.15 states; algebraic clutching, boundary normalization, marking cotangent lines and the node-smoothing conormal; coarse projectivity and fine full symplectic level over ℤ[1/N, ζ_N]; the integral Noether isomorphism `λ^{⊗12} ≅ ⟨ω,ω⟩ ⊗ O(Δ)` on `M̄_g` over ℤ with its universal sign ambiguity; stable compactification after a finite base change; full-level and compactified Torelli in every characteristic with nefness and bigness of the Hodge line under maximal variation; and degree-d Picard parameters that separate relative classes from actual line-bundle lifts. These are the curve-moduli inputs consumed by uniformity results (Dimitrov–Gao–Habegger, Yuan), tautological operations (Canning–Larson–Payne), canonical representations (Landesman–Litt) and Arakelov positivity. `Suggested.lean` states the local headline theorems that are statable at the pins — universal exactness of the node-section complex after any coefficient tensor, reflexivity and universal coefficients of the pointed section ideal over every commutative ring, Ile's universal-coefficient criterion, and Knudsen's completion theorem — and its docstring names each geometric headline that lacks a carrier at the pins.

## Roadmaps this one depends on that are still pull requests

AlgebraicModuliForArithmeticGeometry, JacobianChallengePartII, NeronModelsAndSemistableAbelianVarieties, AbelianSchemesAndArithmeticModuli, AbelianSchemesAndArithmeticModuliPartII, K3SurfacesAndSymplecticBoundedness, MordellLawrenceVenkatesh, PELModuli, ShimuraCompactifications, ComplexComparisonPartII, ModularCurvesPartII, DeformationAndDerivedPatchingAlgebra. (InverseGaloisAndArithmeticFundamentalGroups and MappingClassGroupsAndCanonicalRepresentations, also pull requests, are named only as scope boundaries in Layer 7, not as suppliers.) On main: StableReduction, SchemeAndStackFoundations, EnhancedDerivedSheaves, JacobianChallenge, AlgebraicVectorBundles, PadicMeasuresIwasawaAlgebras, StablePeriodicCurved, ModularCurves, AlgebraicCurves, ComplexCurveModuli (scope note only). All suppliers are in the allowed list for this roadmap.

## What moved from the Lean to the README

- `pointedSection_reflexive` lost its second conjunct (reflexivity of `Module.Dual R J`). It follows in one step from the first conjunct by Mathlib's `Module.instIsReflexiveDual` (`Mathlib/LinearAlgebra/Dual/Defs.lean:263`), as the package's own §2.154 Check already said, so it was padding. The README §2.154 headline sentence now says that reflexivity of D follows from that instance. The docstring gained the locator (Knudsen, §3 and Proposition 3.1).
- Nothing else moved. The other 12 declarations are the headlines and the simple definitions they need (the node equation, ring, section ideal, the two node matrices, and the three predicates `IsStablyReflexive`, `IsRelativelyStablyReflexive`, `HasUniversalCoefficients` with real bodies on native carriers). No sorry'd data, no `set_option`, no `example`, no `lemma`.
- Header: the package's `module` / `public import Mathlib` / `@[expose] public section` header is kept. I first tried plain `import Mathlib` (as in StableReduction on main); at this pin the build then emits a non-`sorry` warning ("imports `Mathlib` … designed for use with the module system; consider adding `module`"), so the module form is required for a sorry-only build. The gate's import check accepts it (`imports=0`).
- **Mechanical binder check:** all 13 declarations plus `Module.instIsReflexiveDual` were `#check @`-elaborated in one scratch build (appended to the module and removed afterwards). Every elaborated type matches its README statement. `nodeSection_universallyExact` keeps `N : Type u_2` with `[AddCommGroup N] [Module A N]`. The two predicates keep `[Algebra A R] [Module A M] [IsScalarTower A R M]`. `relativelyStablyReflexive_iff_universalCoefficients` keeps `[IsNoetherianRing A] [IsNoetherianRing R] [Module.Flat A R] [Module.Finite R M]`, and `relativelyStablyReflexive_iff_completion` keeps all its locality, flatness and completion-structure hypotheses. No section binder is lost. The only change is the intended one in `pointedSection_reflexive`.

## Supplier replacements and duplication removals

- **Pinned declarations.** I checked every backticked Mathlib and Tau Ceti name in the README at the pins of this worktree (243 Mathlib names by one scratch `#check` build; 13 Tau Ceti names by grep in the pinned Tau Ceti sources, all present, e.g. `TauCeti.AlgebraicGeometry.LineBundleClass.inv_mk` at `Class.lean:104`, the `CommGroup` instance at line 142, `CochainComplex.IsTotallyAcyclic` and `TauCeti.IsGorensteinProjective` in `TotallyAcyclic.lean`). Line locators were rechecked: `TensorProduct.piScalarRightHom_tmul` moved 139→140 and `TensorProduct.piScalarRight_symm_single` moved 175→176 in `Mathlib/LinearAlgebra/TensorProduct/Pi.lean` (fixed in all four places); the others (`Map.lean` 59/104, `ToLin.lean` 291, `LinearMap/Defs.lean` 495, `IsLimit.lean` 232/95, `ModuleCat/Basic.lean` 407, `HomologicalComplex.lean` 498/890, `Projective/Ext.lean` 211/196, `ShortComplex/HomologicalComplex.lean` 696, `Abelian/Ext.lean` 68, `ModuleCat/Limits.lean` 45, `AdicCompletion/Basic.lean` 414, `Dual/Defs.lean` 263) are correct at the pin.
- **Supplier declarations.** These were verified at the suppliers' current main or open head: `perfect_proper_pushforward` (EnhancedDerivedSheaves §E1.9), `single_degree_free_locus` and `universal_functions` (AlgebraicModuliForArithmeticGeometry §7.2), `ModuliDescent.polarizedDescentComparison` (same, §3.5), `polarizedAutomorphisms` and `eq_one_of_finiteOrder_congruence` (AbelianSchemesAndArithmeticModuli §A6.18), `polygonCountStack` (ModularCurvesPartII §2.11), `NormalizationExactSequence` and `StableFamilyPicard` (NeronModelsAndSemistableAbelianVarieties §§4.1, 4.13), `Mbar.forget`, `stableCurveDirectImage_nef`, `determinantQuotient_ample`, `level_structure_cover_ample` (SchemeAndStackFoundations §4.15). In §7.12, `isGroupHom_of_mapsZero`, `CoarseModuliData`, `coarseJLine_int` and `coarseJLine` are ModularCurves declarations (its Suggested.lean on main, lines 385, 1202, 1254, 1275). They are now attributed to ModularCurves in backticks instead of appearing as bare, unattributed identifiers.
- **Citation repairs.**
  - Leftover "C5" labels for ShimuraCompactifications in §§6.12, 6.16–6.18 are replaced by gap:minimal-siegel-all-characteristics or ShimuraCompactifications §§7.16–7.17. They clashed with the coefficient convention C5 of §2.0.
  - "M5/M6" and "PEL M6/C5" → PELModuli §§M5.1–M5.3.
  - "AbelianSchemes duality" → abelian-scheme duality.
  - "JC5/JC7" → JacobianChallengePartII Layers 5 and 7 (where the Faltings–Zhang morphism lives, its §5.3).
  - "ModularCurves1C,1D,…,9E" → ModularCurves §§1C, 1D, 2D, 4A, 4B, 9D, 9E.
  - "InverseGaloisAndArithmeticFundamentalGroups:IG.5" → Layer IG.5 of that roadmap.
  - Two non-existent roadmap names used as owners in Layer 7 (`SymplecticLFunctionsModSquares`, `MotivicStructuresInModuliOfCurves`) → the consumer papers (Abdurrahman–Venkatesh, Canning–Larson–Payne). MappingClassGroupsAndCanonicalRepresentations is kept as the owner in §7.14 (it exists as an open roadmap and is in the allowed list).
  - "BLR9.3/1", "FC IV5.1" etc. → Bosch–Lütkebohmert–Raynaud and Faltings–Chai with the theorem numbers.
- **Duplication sweep** (by object, against main with the `roadmaps grep` index of all 452 open roadmap PRs, and directly in the local heads this brief lists). Objects searched: stable reflexivity / Gorenstein dimension zero / totally reflexive, matrix factorization, Mumford/Noether isomorphism, Deligne pairing, Torelli, maximal variation, cotangent lines/ψ-classes, clutching.
  - Stable reflexivity has no other owner. Matrix-factorization hits elsewhere are generic (no pointed-node section ideal).
  - SchemeAndStackFoundations §4.15 on main has no clutching, cotangent lines or Hodge-bundle/Noether statements.
  - The Deligne pairing in ArakelovGeometryAndAbelianHeightsPartII (§§0.2, 3.2–3.4, 4.4) is the metrized/adelic pairing on projective flat morphisms of integral schemes. It is a consumer of this roadmap's Layer 5 (its "What StableReductionPartII must provide" contract), not an owner of the integral Noether isomorphism. The integral algebraic pairing here is gap:integral-deligne-pairing on SchemeAndStackFoundations.
  - HeightsRationalPointsAndObstructionsPartII consumes §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13, 7.15.
  - Clutching in GromovWittenTheory goes through ComplexCurveModuli D7 (on main), which constructs analytic clutching over ℂ. This is a different carrier. A Scope bullet now says so in one clause.
  - Other clutching hits are topological (sphere clutching).
  - **No target was removed for duplication**, so Scope records no removal. The two consuming roadmaps are now named in "Downstream consumers".
- **Ownership against open work:** checked against the open roadmap PRs whose files the brief provides (local heads) and the index of all open roadmap PRs. This roadmap owns the pointed-node algebra and relative stable reflexivity (no other owner), and it adds no declaration whose fully qualified name collides with one in a readable roadmap.

## Fixes made as an upstream reviewer (each a defect a mathematician would flag)

1. **§6.4 and §6.9 overstated their characteristic.** §6.4 asserted compactified Torelli over every algebraically closed field. Its source is the characteristic-zero Satake map (Knudsen III §6), and its own proof sentence admitted that positive characteristic needs a supplier it never listed. §6.9 (nef and big over any field) was proved through §6.4. Both are now stated in characteristic zero. §6.4 adds ShimuraCompactifications §2.8 to its Needs and points positive characteristic to §6.17; §6.9 points arbitrary fields to §6.22. §6.20 (algebraically closed field of any characteristic) no longer lists §6.9 as a prerequisite: that entry made the general statement a prerequisite of its special case.
2. **Layer 6 redundancy (left in place, now explicit).** The package's Layer 6 states several objects twice: §6.3/§6.12 (the Torelli morphism), §6.6/§6.14 (its fibres), §6.7/§6.13 (its Hodge comparison), §§6.5, 6.8 inside §6.11 (compactification after a finite cover), and §6.4 as the characteristic-zero case of §§6.17–6.18. I first consolidated Layer 6 to 14 targets. I reverted that on finding that HeightsRationalPointsAndObstructionsPartII and ArakelovGeometryAndAbelianHeightsPartII cite these sections by number and title (§§6.1–6.3, 6.6–6.10, 6.21–6.22), so renumbering would silently mis-cite them. Instead §§6.11–6.14 now say which earlier target they refine (stable input families, the integral Cartesian construction over B_N, the componentwise argument, every residue characteristic prime to N).
3. **§5.21** had a garbled API bullet ("Its underlying line equality `isλ_S¹²≅…`"), two API bullets saying the same thing, and seven Checks of which four repeated others. The API now has four distinct bullets and the Checks three distinct ones (smooth family; ratio 2 is not ±1; ±φ coincide in characteristic 2 and differ where 2 is invertible).
4. **Undefined "the parent"** (≈90 occurrences, a plan term). Each occurrence is replaced by its actual referent:
   - StableReduction Layers 1, 2, 3 or 8 for dual graphs, dualizing sheaf, clutching pushouts, the single-marking contraction and pluricanonical vanishing;
   - SchemeAndStackFoundations §4.15 for the moduli pseudofunctor, stack, tricanonical presentation and boundary;
   - specific Layer 2 targets (§§2.1–2.224, 2.186, 2.188–2.189, 2.193, 2.222, 2.239, 2.240) for the polynomial model, its resolutions and the expansion charts;
   - §4.8, §7.1, §7.2, §7.8 and §6.10 in Layer 7.
5. **Process residue** replaced by the item it names: "requested …", "recorded as a gap", "open contract", "proof leaf", "the … owner", "this node", "construction nodes", "the integral Noether node", "re-planned", "smuggled". Where this exposed a missing dependency, I added it to the Needs:
   - §0.2: AlgebraicModuliForArithmeticGeometry §7.2;
   - §3.7: gap:relative-node-branch-data, SchemeAndStackFoundations §§1.18–1.23;
   - §6.4: ShimuraCompactifications §2.8;
   - §§6.6, 6.14: gap:strong-torelli-faithfulness;
   - §6.16: gap:minimal-siegel-all-characteristics.
6. **Knudsen II Corollary 3.9(b)** was cited four times as "corrected by the recorded counterexample". It now states the failure (a genus 2 curve with two elliptic components has two separating preimages) and links §3.7, where that example is a Check.
7. **§7.12** was rewritten in prose with the ModularCurves sections and declarations attributed (see above).
8. **Typography:** 862 spacing repairs outside code spans and link targets ("Proposition3.1" → "Proposition 3.1", "pp.11–12", "genus2", "characteristic2", "is12", "by±1", "tag087Q", "PDF31" → "PDF p. 31", "For(g,n)"). URLs were verified unchanged. Two `M_{1,1}` subscripts that I introduced in prose were put in code spans (gate `tex`).

All 1642 internal anchor links resolve (script check after every structural edit).

## Adversarial mathematics pass (computed)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| `pointedNodeEquation`, det `nodePhi` = F | symbolic | a·d=(δv+δt+γu)(v−t)=δv²−δt²+γuv−γut; b·c=(u+s+γt)(u−s)=u²−s²+γtu−γts; sum = q(u,v)−q(s,t)=F | correct |
| `nodePhi`·`nodePsi` = F·I | A=𝔽₂, γ=δ=s=t=0 | Φ=((0,X),(−X,Y)), Ψ=((Y,−X),(X,0)); ΦΨ=((X²,0),(0,X²)), zero in R=𝔽₂[X,Y]/(X²) | correct; matches Worked examples |
| `nodeSection_universallyExact` | arbitrary A,N; zero ring; A=ℤ, N=ℤ/2; fixture A=𝔽₂ | R⊗_A N=N[X,Y]/F·N[X,Y]; F monic of degree 2 in X ⇒ F·m=0 ⇒ m=0; Ψx=0 ⇒ lift x̃, Ψx̃=Fy ⇒ F x̃=ΦΨx̃=FΦy ⇒ x̃=Φy. Fixture: ker Ψ={(Xα, Yα+Xβ)} = im Φ={(Xy₁, −Xy₀+Yy₁)} with y₁=α, y₀=−β. Transposes by (ΨΦ)ᵀ=F·I | true for every A, N |
| Augmentation P_J(z)=cz₀−dz₁ kills Ψ, not Φ | fixture | P_J on Ψ-columns: cd−dc=0, −cb−da=−F=0; on Φ-column (a,−c): ca+dc = XY ≠ 0 at the fixture | J=coker Ψ, as README §2.21 states |
| `pointedSection_reflexive` | arbitrary A; zero ring; negative control ℤ/2 over ℤ | J≅coker Ψ, J*≅ker Ψᵀ=im Φᵀ≅coker Ψᵀ, J**≅ker Ψ=im Φ≅J; zero ring: all modules 0; ℤ/2 over ℤ has dual 0, evaluation not injective | true; second conjunct dropped (one step by `Module.instIsReflexiveDual`) |
| `IsStablyReflexive` vs Ile Def. 3.1 | ile lines 268–270 | Ile: reflexive and Ext^i(M,A)=0=Ext^i(M*,A), 0<i<n, all n; Lean: reflexive ∧ ∀n, Ext^{n+1}(M,R)=0 ∧ Ext^{n+1}(M*,R)=0 | agrees; finiteness deliberately dropped and added by each theorem |
| `IsRelativelyStablyReflexive` vs Ile Def. 3.4 | ile lines 286–291; A=k[t]_(t)→R=k(t) | Ile: S-flat and M_s stably reflexive for s∈im(m-Spec R→Spec S); Lean: same with s = comap of a maximal q. Instance: the only maximal ideal (0) of k(t) contracts to (0), so the generic fibre is tested | agrees |
| `HasUniversalCoefficients` vs Knudsen's definition | ile lines 344–355 | (a) M*⊗I→Hom(M,R⊗I) iso, (b) M⊗I→Hom(M*,R⊗I) iso via evaluation, (c) Ext^{i>0} of M and M* into R⊗I vanish; Lean: the same three, with the canonical formulas on pure tensors | agrees |
| `relativelyStablyReflexive_iff_universalCoefficients` | hypotheses vs Ile Prop. 3.5 + Rem. 3.6; R=0 | Ile needs S Noetherian, R coherent, h flat, M coherent (S-flatness is in Def. 3.4 and is forced by (a),(b)). Lean: Noetherian A,R, flat, finite M. R=0: no maximal ideals and all modules 0, both sides true | correct |
| `relativelyStablyReflexive_iff_completion` | A=R=ℤ_(2), M=R; M=R/(2); A=ℤ_(2), R=ℤ_(2)[x]_(2,x), M=R/(x) | M=R: all three true. M=R/(2): M̂=𝔽₂ flat over neither ℤ_(2) nor ℤ₂, all three false. M=R/(x): fibre 𝔽₂ over the DVR 𝔽₂[x]_(x) has Ext¹=𝔽₂≠0, completed fibre over 𝔽₂[[x]] the same, all three false. Â-structure on R̂ pinned by `IsScalarTower A Â R̂` + `IsLocalHom` (local ⇒ adic-continuous, A dense in Â) | correct |
| Tricanonical numerics (Conventions) | g=2, 3 | h⁰(ω³)=6g−6+1−g=5g−5: 5, 10; deg 6g−6: 6, 12; P(T)=χ(ω^{3T})=(6g−6)T+1−g=(g−1)(6T−1): 6T−1 (P(1)=5), 12T−2 (P(1)=10) | correct |
| §4.14 kernel rank | g=2, d=2 | Sym² of rank 5 → 15; h⁰(ω⁶)=(2·6−1)(g−1)=11; kernel 4 | correct |
| Stability and dimension | (0,2), (0,3), (1,1), (0,4) | 2g−2+n: 0, 1, 1, 2; 3g−3+n: −, 0, 1, 1 | correct |
| §1.12 dim Ext¹(Ω_C,O_C)=3g−3 | irreducible rational curve with g nodes | ν=ℙ¹ with 2g branch points: h¹(T_{ℙ¹}(−2g))=h¹(O(2−2g))=2g−3, plus g nodes ⇒ 3g−3 | correct |
| §3.11 ψ-correction L_i=π*L_i⊗O(D_{i,n+1}) | π:M̄_{0,4}→M̄_{0,3}=pt | deg ψ₁ on M̄_{0,4}≅ℙ¹ is 1; π*ψ₁=0; D_{1,4} is one point of degree 1: 1=0+1 (the opposite sign would give 1=0−1) | correct |
| Hodge exchange sign (−1)^{g₁g₂} | (1,1), (1,2) | −1, +1; smoothing-conormal exchange +1 in both | correct |
| Deligne symmetry = Koszul × (−1)^{χ(O)} | ℙ¹/O(1); genus g/ω; g=1/O(p) | ℙ¹: (−1)^{deg}=−1 vs Koszul (−1)^{χ=2}=+1 times (−1)^{1}=−1; ω: +1 vs (−1)^{g−1}(−1)^{1−g}=+1; O(p): −1 vs (−1)^1·(−1)^0=−1 | correct |
| Similitude multiplier | N=3, c=2 | diag(2I_g,I_g) multiplies pairing by 2: 2·2=4≡1 mod 3 | correct |
| Noether 12λ=κ+δ (§§5.16–5.19, Worked example) | Lefschetz pencil of (2,3) curves on ℙ¹×ℙ¹ | g=(2−1)(3−1)=2; base points 2·3+3·2=12; K²=8−12=−4; κ=K²+4K·F=−4+8=4; deg λ=χ(O)−(g−1)(g(B)−1)=1+1=2; e=4+12=16, δ=16−(−2)(2)=20; 12·2=24=4+20; reversed boundary sign gives 40 | correct |
| §5.17 orders at xy=π^m | m=2,3 | O(−Δ) section order −m, O(Δ) order +m; two nodes of thickness 2 and 3 give length 5 | correct |
| §5.21 universal sign | over 𝔽₂, over ℂ | −φ=φ in characteristic 2; distinct where 2 is invertible; ratio 2 is not in {±1} | correct after the duplicate Checks were removed |
| §§6.3/6.12 Checks | genus 2; nonhyperelliptic genus 3 | dim M_2=3g−3=3=g(g+1)/2=dim A_2; (C,±α) distinct for nonhyperelliptic C, identified by the hyperelliptic involution otherwise | correct |
| §6.14 sign in characteristic 2 | p=2, N=3 | −1≠1 on étale (ℤ/3)^{2g}, so ±α are distinct level structures | correct |
| §§6.15–6.16 boundary Jacobians | irreducible one-node genus 2; E₁∪E₂; rational with two self-nodes | torus/abelian/Hodge ranks (1,1,2); (0,2,2); b₁=2, abelian part 0, genus 0+2=2, stable (4 special points on ℙ¹) | correct |
| §6.4 / §6.9 characteristic | source scope | Knudsen III §6 is the characteristic-zero Satake map; the p>0 route needs gap:minimal-siegel-all-characteristics (§6.17) | **fixed**: both stated in characteristic 0, cross-referenced to §§6.17, 6.22 |
| §6.20 top degree | generically finite h of degree e; constant family | deg_X c₁(λ^m)^d = e·deg_Z c₁(A|Z)^d > 0; constant family: λ trivial, top degree 0 | correct |
| §6.21 Frobenius cover | relative Frobenius of a k-curve, char p | degree p ⇒ deg λ_Y = p·deg λ_X | correct |
| §§7.1, 7.9 Picard parameters | constant genus 2 curve over T=ℙ¹_ℂ; A=ℂ[ε]/(ε²) | pr*L and pr*L⊗pr_T*O(1) are distinct lines with one relative class; first-order fibre H¹(C,O_C) of dimension 2; framed automorphisms 1+εℂ | correct |
| Surface positive-twist Check | S=C₂×ℙ¹, D=C₂×pt, m=2 | ω_S²(D)=ω_C²⊠O(−3); h¹=h⁰(ω_C²)h¹(O(−3))+h¹(ω_C²)h⁰(O(−3))=3·2+0=6 | correct; excluded by the general-type hypothesis |
| §4.2 N=2 Check | hyperelliptic curve | [−1] acts trivially on J[2] | correct |

The Lean statements' `variable` context is empty (every binder is in the declaration's own signature), so no standing hypothesis can be silently missing.

## Unresolved

- **Layer 2 was not reread line by line.** It is ≈566 KB (§§2.0–2.257, the pointed-node algebra). I swept it mechanically: "parent", process words, glued labels and spacing, all Mathlib locators and declaration names, anchors. I read §§2.154, 2.170, 2.225–2.231 and spot-checked the statements behind the Lean headlines. The red-team rounds had already read it in full.
- **Layer 6 redundancy** (fix 2) remains by design, to keep the section numbers that two open roadmap PRs cite. A later revision coordinated with HeightsRationalPointsAndObstructionsPartII and ArakelovGeometryAndAbelianHeightsPartII could merge the pairs.
- **Consumer-side notes:**
  - ArakelovGeometryAndAbelianHeightsPartII's contract describes §6.9 as nef-and-big "over a field". §6.9 is now characteristic zero, and its arbitrary-field statement is §6.22, which that contract also cites.
  - SheafConvolutionOnAbelianVarieties cites this roadmap as "StableReductionPartII §MC…", plan labels that do not exist here. That needs a fix on its side.
- **No suspicious instructions** were found in the reviews, reports, other roadmaps or sources read; all were treated as data.


Pull request: #1841 (roadmap/stable-reduction-part-ii at ef1de05)
