# PORT-SpringerResolutionAndCharacteristicCycles

- Branch: `roadmap/springer-resolution-and-characteristic-cycles`, from main `3b51055`.
- Head commit: `ff276287` ("SpringerResolutionAndCharacteristicCycles: roadmap (README, Suggested.lean, metadata)"). It touches only `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/` (README.md, 1587 lines; Suggested.lean, 62 lines; metadata.toml, `topic = "math.RT"`).
- Build: `lake build TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles.Suggested` → `Build completed successfully (8954 jobs).` **0 warnings.** The file declares nothing, so there is no `sorry` warning either. A bare `import Mathlib` triggered the module-system warning, so the file opens with `module` and then `import Mathlib`, as HeegaardFloer on main does.
- Gate: `gate SpringerResolutionAndCharacteristicCycles: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 224 roadmaps, 2110 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the ported README: no cross-roadmap citation found nowhere, and no Lean name found nowhere. The one lead in the worker's citations file, `IsModification.isIso_of_isFinite`, is gone: that name is an API item of SchemeAndStackFoundations §4.11 in italics, not a declaration, so the README now states the theorem in prose. The `#check` audit below covered the remaining Lean names.

## Draft pull request body

This roadmap builds the geometry and the D-module theory behind the local model of the trianguline variety. From split reductive groups over a field, the flag scheme and algebraic vector bundles, it constructs the Grothendieck simultaneous resolution g̃→g and the double incidence scheme X=g̃×_g g̃. It proves that X is a reduced local complete intersection whose components X_w are indexed by the Weyl group. In characteristic zero or characteristic p larger than the Coxeter number, it proves that each X_w is geometrically Cohen–Macaulay (by a Bezrukavnikov–Riche convolution argument in characteristic p and integral spreading) and geometrically normal, and that its Cartan maps to t are flat. It compares the Springer resolution and the Steinberg variety over arbitrary characteristic-zero fields and reductive groups with their conormal descriptions. It develops algebraic D-modules on smooth varieties: good filtrations, characteristic cycles, Kashiwara's equivalence, the Bernstein inequality, holonomic and regular holonomic modules and strong equivariance. It proves Beilinson–Bernstein localisation for the strict principal block, and with it the Kazhdan–Lusztig multiplicity theorem through a de Rham comparison on the flag variety and the Schubert stalk theorem. These identify three integral bases of the top cycles of the Steinberg variety: components, simple characteristic cycles and Verma (Cartan zero-fibre) cycles. The end theorems are the partial-flag saturation of simple cycles, the zero-operator tangent bound with its smoothness criterion, and the completed Kazhdan–Lusztig cycle identity at every closed point. TriangulineVarietyAndItsLocalModel uses these, and the D-module layers are reusable in their own right: MixedHodgeModulesAndIrregularHodgeTheory and SheafConvolutionOnAbelianVarieties consume them. No headline theorem is statable at the pinned Mathlib and Tau Ceti, so `Suggested.lean` declares nothing; its docstring records, headline by headline, which carrier is missing.

## Dependencies that are still pull requests

ShimuraData, ComplexComparisonPartII, FormalConnectionsOpers, DeformationAndDerivedPatchingAlgebra, PadicLocalLanglandsForGL2Qp, EtaleDualityAndPerverseSheaves. GroupSchemesOverABase, another author's open new-roadmap pull request, is named once in Scope only, to separate its multiplicative Grothendieck–Springer space from the additive g̃ owned here. It is not a supplier.

The suppliers on main are ReductiveGroups, RepresentationTheory/LieHighestWeight, SchubertGeometry, AffineMorseLefschetz, TypeAHeckeAlgebras, NilpotentOrbits, AlgebraicVectorBundles, SchemeAndStackFoundations and EnhancedDerivedSheaves.

## What moved from the Lean to the README

Nothing moved: the package's `Suggested.lean` declared nothing, and the port declares nothing.

I listed the headlines and checked each against the pins. The pinned Mathlib (`f6090c7`) and Tau Ceti (`358314d`) have no scheme representing the flag quotient. Tau Ceti has `CommHopfAlgCat.fppfHomogeneousQuotient`, which carries no representability. The pins also lack the Grothendieck or Steinberg incidence schemes, rings or sheaves of differential operators (no Weyl algebra either), and any Hecke algebra of a Coxeter system with a Kazhdan–Lusztig basis. Tau Ceti's Jimbo representation is a braid-group action, not a Hecke algebra of W. Composition multiplicities in category O are also missing: Tau Ceti's `TauCeti.VermaModule` and its irreducible quotient carry no finite-length theory.

The docstring was rewritten in the required form ("target signatures"; README is the roadmap). It now names, headline by headline, the missing carrier. The Kazhdan–Lusztig multiplicity theorem (§11.3) is listed on its own: it lacks the Coxeter Hecke algebra and KL polynomials, and multiplicities in category O. The docstring also names the pinned carriers that do exist.

The §12.1 converse of the integrability criterion would be statable against Tau Ceti's highest-weight API. I left it out: it is an elementary sl₂ computation, not a headline, and stating it would be padding.

**`#check` audit.** There is no declaration, so no elaborated type needed comparing with the README. I verified the library names the README and the docstring cite by building the module once with temporary `#check @…` lines and the needed Tau Ceti imports. All 17 elaborated:
- Mathlib: `CoxeterSystem.length`, `AlgebraicGeometry.AlgebraicCycle`, `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, `Module.length_eq_add_of_exact`, `AdicCompletion`, `SymmetricAlgebra`, `Finsupp.linearCombination`.
- Tau Ceti, Coxeter: `CoxeterSystem.BruhatLE`, `CoxeterSystem.bruhatPartialOrder`, `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`.
- Tau Ceti, algebraic groups and sheaves: `TauCeti.ReductiveCommHopfAlgCat`, `TauCeti.HopfIdeal.IsBorel`, `CommHopfAlgCat.fppfHomogeneousQuotient`, `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`.
- Tau Ceti, highest weights: `TauCeti.VermaModule`, `TauCeti.exists_pow_toEnd_eq_zero_of_mem_rootSpace_neg`, `TauCeti.locallyFiniteSubmodule_eq_top_of_isSl2Triple`.

The two integrability theorems have exactly the hypotheses the README contract states: Killing, characteristic zero, triangularizable Cartan, an irreducible module and λ(α∨)=n∈ℕ. I then removed the checks and the imports.

## Supplier replacements and duplication removals

- **§1.2 / ShimuraData §3.8.** §1.2 restated that the flag scheme is smooth and projective. ShimuraData §3.8 already supplies this: Par_t(G) is smooth and proper, projective over an affine base, with G/P≅Par_t(G). §1.1 now takes F to be the Borel-type Par(G). §1.2 keeps only the dimension and geometric-integrality statement, with the route through the big cell of ShimuraData §3.14. A new "From TauCetiRoadmap.ShimuraData" contract records §§3.8 and 3.14–3.16 and the inversion convention between P\G and G/P. The deferral is recorded in Scope and ownership.
- **Tau Ceti carriers added to the supplier contract.** The Bruhat order (`CoxeterSystem.BruhatLE`, `bruhatPartialOrder`, the subword characterization); `TauCeti.ReductiveCommHopfAlgCat`; `TauCeti.HopfIdeal.IsBorel`; and `CommHopfAlgCat.fppfHomogeneousQuotient`, now the fppf quotient of §1.1, with its lack of representability stated. Mathlib's `CoxeterSystem.length` is named for ℓ.
- **New supplier citations for the §11.3 route.** ComplexComparisonPartII C5.6 (Deligne's Riemann–Hilbert for regular singular connections), and EtaleDualityAndPerverseSheaves §3.5 (étale–analytic comparison) and §5.3 (purity of intermediate extensions). Each was read at its open head and gets a contract paragraph.
- **Citation labels.** `ComplexComparisonPartII §C−1.1` became `§C-1.1`, matching the heading at its head. The SchemeAndStackFoundations §4.11 theorem is now in prose (see above).
- **Sweep by object, with no further removals.** Searched main, the open heads and the board packages for:
  - the additive simultaneous resolution, the Steinberg variety, holonomic D-modules and characteristic cycles;
  - Beilinson–Bernstein localisation, category O and KL polynomials, the Coxeter Hecke algebra;
  - relative-position orbits, module cycles, constant-rank subbundle intersections and Chevalley restriction.

  Findings:
  - GroupSchemesOverABase GS8.5 is the group version G̃⊂G×Bor(G), a different object.
  - FormalConnectionsOpers F6.3 concerns affine flag varieties.
  - SheafConvolutionOnAbelianVarieties (merge order 300) and SmoothRepresentationsOfLocalGroupsPartII (275) are later and consume this roadmap. They are added to Downstream consumers.
  - LieHighestWeightPartII (230) owns nilpotent orbits and weight patterns, not category O.
  - No other roadmap owns g̃, the finite Steinberg variety, algebraic D-modules, BB localisation, the Coxeter Hecke algebra or the KL multiplicity theorem.
- **Ownership against open work.** I checked it with `roadmaps grep` over all 440 open heads. I also read the sibling checkouts for SheafConvolutionOnAbelianVarieties and SmoothRepresentationsOfLocalGroupsPartII, and the heads of ShimuraData, ComplexComparisonPartII, FormalConnectionsOpers, DeformationAndDerivedPatchingAlgebra, PadicLocalLanglandsForGL2Qp and EtaleDualityAndPerverseSheaves with `roadmaps show`. No declaration of `Suggested.lean` reuses another roadmap's fully qualified name; there are no declarations.

## Fixes from the upstream read-through and the accepted review's notes

The accepted review's P3 notes, as they stood in the package:
- **F01** (§8.1 and §8.2 needed each other). Applied. §8.1 now defines coherence as in M23 Definition 3.1 (M23 lines 474–477): quasi-coherent and locally finitely generated over D_Y. Its Needs line no longer cites §8.2. Finite presentation and coherence of kernels moved into §8.2's statement, after Noetherianity.
- **F02** (garbled sentences). The remaining artefacts are fixed. The sentence in §11.1 that cited §§4.2 and 11.1 as their own input is deleted. In §12.1, "included in §§10.4 and 12.1" now reads "proved in this subsection". §10.3 now names the targets of §§9.7 and 9.9. The inline slugs `gap:derived-bimodule-sheaves` in §§9.1–9.2 are now prose.
- **F03** (lowercase Examples fragments). Applied: all 14 layers' Examples are prose worked examples.
- **F04** (M23's field hypothesis). Applied in §8.1 and in the M23 reference: M23 assumes an algebraically closed field (M23 line 466).
- **F05** (wrong locators). Applied, checked against the cached texts:
  - §1.4: BHS19 lines 473–474 and line 574, plus SchubertGeometry S2 item 3.
  - §6.2: BHS19 lines 834–838.
  - §11.1: BR12 lines 191–195 and 1703–1730.
  - The G98 locator was already fixed.

Further fixes:
- **§11.3 had a circular proof route.** Its route began "Use the composition-multiplicity theorem established here". The multiplicity theorem (the Kazhdan–Lusztig conjecture) had neither a route nor a primary locator.
  - The statement now carries a locator: BHS19 lines 881–884, which refer to Humphreys §8.4.
  - The route is now Beilinson–Bernstein's and Brylinski–Kashiwara's. It runs through the §10.4 equivalence, a de Rham comparison for strongly B-equivariant regular holonomic D_F-modules, and the Kazhdan–Lusztig stalk theorem for Schubert varieties. The stalk-matrix inversion is written out. I checked it on SL₂ and against the KL inversion formula: see the table, rows for §11.3.
  - The two comparisons are stated as targets of §11.3, with Needs and two new Checks. One Check is the SL₂ de Rham computation; the other is the A₃ stalk polynomial 1+q.
  - The cycle consequence is a separate paragraph.
  - Humphreys 2008 and KL80 are added to References as uncertified.
- **Mechanical boilerplate removed.** 66 Checks ended with "The computed values fix the normalization and test the asserted hypotheses." after an ungrammatical "For …, compute:" fragment. They now read "Computed values for …: …". Every Examples paragraph also ended with a stock sentence, now removed.
- **Title.** "Springer" is capitalized in the title.
- **Summary.** It no longer calls `Suggested.lean` "the acceptance boundary"; it says that file declares nothing, and why.

## Moves down (a notion needed from a later roadmap, stated here as a target)

- **The de Rham (Riemann–Hilbert) comparison**, restricted to strongly B-equivariant regular holonomic D_F-modules, whose strata are the finitely many Schubert cells. It is now a target of §11.3. The general regular algebraic Riemann–Hilbert comparison is MixedHodgeModulesAndIrregularHodgeTheory:B/regular-riemann-hilbert (board plan, merge order 251, after this roadmap at 248). Only the restricted form moved down; Scope says the general correspondence is not part of this roadmap.
- **The Kazhdan–Lusztig stalk theorem** for Schubert varieties has no owner anywhere I could find. It is a new target of §11.3. Its purity and comparison inputs come from EtaleDualityAndPerverseSheaves §§3.5 and 5.3 (merge order 96).

## Unresolved

1. **Ownership of the Riemann–Hilbert input is contested.** Red team round 1 left a decision to the maintainers: move the Riemann–Hilbert and purity ownership down, or reorder. This port takes the first option, but only for the restricted form, and leaves MixedHodgeModulesAndIrregularHodgeTheory's general comparison in place. SheafConvolutionOnAbelianVarieties instead asks ComplexComparisonPartII for the full de Rham equivalence through a contract (its "holonomic realization contract"). A maintainer should confirm which roadmap owns the general correspondence.
   - If ComplexComparisonPartII takes it, §11.3's restricted comparison should become a citation.
   - §11.3's route also uses the Iwahori–Hecke algebra of a finite group of Lie type over F_q. No owner was found, so it sits inside the §11.3 stalk-theorem target; ReductiveGroups Layer 7a may be the natural owner.
2. **KL80 is cited without a theorem number,** because I could not reach the text. Humphreys §8.4 is cited through BHS19's own reference. Neither is in the package's `sources.toml`, which is outside the target folder and was not edited; the References entries say "uncertified". This port also did not add ShimuraData, EtaleDualityAndPerverseSheaves, Humphreys or KL80 to `sources.toml`.
3. **Downstream consumers cite section labels that do not exist here.**
   - SheafConvolutionOnAbelianVarieties (its contract on this roadmap) cites "§D", "§D/characteristic-cycle" and "§Y". It also asks for a "microdifferential localization contract", which this roadmap does not provide.
   - SmoothRepresentationsOfLocalGroupsPartII cites "Layer S". It asks for a "coherent equivariant K-theory contract" (G^∨×ℂ^×-equivariant K-theory convolution on the Steinberg variety, the affine Hecke algebra), which is not in this roadmap's scope.

   These are those roadmaps' requests. They need re-pointing at Layers 6–9, or a separate owner.
4. **An earlier report recorded a Trianguline citation that I did not re-verify:** TriangulineVarietyAndItsLocalModel cites "parabolic invariance of simple cycles". Only the saturation form of §12.2 is true.
5. **Suspicious text.** None found in the material read.

## Adversarial mathematics pass

I recomputed each row independently. Where a row reuses a README Check, I redid the arithmetic.

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Conv.: L_B(λ), (g,x)∼(gb,λ(b)⁻¹x) | SL₂, λ=ρ; λ=−ρ | [gb,ρ(b)⁻¹x]↦ρ(b)⁻¹x·gbe₁=x·ge₁, so L_B(ρ)=tautological O(−1); L_B(−ρ)=O(1) ample, and −(−ρ)=ρ is regular dominant | holds |
| Conv.: κ₂=w⁻¹κ₁ | GL₃, w: e₁↦e₂↦e₃↦e₁, z=diag(1,2,4) | ŵ⁻¹zŵ sends e₁↦2e₁, e₂↦4e₂, e₃↦e₃: diag(2,4,1); wz=diag(4,1,2) | holds |
| Conv.: D=r+2N | trivial group; SL₂; GL₃ | 0=0+0; 3=1+2; 9=3+6 | holds |
| Conv.: Li*δ[−1] | i:{0}→A¹, δ=D/Dx | x∂ʲδ=−j∂ʲ⁻¹δ, so Tor₀=0 and Tor₁=kδ; degree 0 after [−1] | holds |
| Conv.: generic length | k[ε]/ε²; 0 | 2=1+1; length 0 | holds |
| §1.1 flag scheme | torus; SL₂; GL₃ | point; P¹ with eB=ke₁; full flags (line in plane), dimension 3 | holds; consumes ShimuraData §3.8 |
| §1.2 dimensions | trivial; SL₂; GL₃ | (N,r,D,dim B)=(0,0,0,0); (1,1,3,2); (3,3,9,6); P² has dimension 2≠N for GL₃ | new GL₃ Check |
| §1.3 orbits | SL₂; torus | U_e=diagonal, U_s=distinct pairs, closure P¹×P¹; one orbit=point | holds |
| §1.4 dim U_w=N+ℓ(w) | SL₂ | 1+0=1, 1+1=2; e≤s | holds |
| §1.5 constant-rank intersection | k[ε]/ε², spans of (1,0),(1,ε); ke₁,ke₂; ke₁,ke₁ | a(1,0)=b(1,ε) forces a=b∈(ε): intersection (ε)e₁, killed by ε, not a summand; ranks 0 and 1 over k | reduced hypothesis needed and present |
| §2.1 g̃ | torus; GL₂; ψ=0 | g̃=t; rank 3, total 4; fibre P¹ | holds |
| §2.2 regular loci | SL₂: E₁₂, 0, diag(1,−1) | centralizer dimensions 1, 3, 1 (char ≠2; in char 2 E₁₂ has dimension 2, excluded since p>h=2) | holds |
| §2.3 regular covering | SL₂ | degree 2=|W| over gʳˢ; one ramified flag at E₁₂; proper+quasi-finite⇒finite | holds |
| §3.1 X | torus; ψ=0; GL₂ coordinate lines | X=t; fibre F×F; diag(a,b), dimension 2 | holds |
| §3.2 κ_i | GL₂, flags ke₁,ke₂, ψ=diag(a,b) | κ₁=(a,b), κ₂=(b,a) | holds |
| §3.3 V_w fibres | SL₂ e,s | b (dim 2), t (dim 1) | holds |
| §3.4 V_w rank | SL₂ | 1+2=3, 2+1=3; torus r | holds |
| §3.5–3.6 X_w, support | SL₂ local charts k(1,x), k(1,y), ψ=((a,b),(c,−a)) | incidence c=2ax+bx²=2ay+by²; difference (x−y)(2a+b(x+y)); X_e: x=y; X_s: a=−b(x+y)/2; X_e∩X_s: x=y, a=−bx, c=−bx², det=−b²x²+b²x²=0, so nilpotent, nonzero for b≠0 | holds; Layer 3 example |
| §3.7 lci | SL₂; torus | 5−2=3; r−0=r | holds |
| §3.8 reduced | SL₂; k[t,x]/(x²−t) | both components meet the étale locus; reduced ring with length-2 fibre | holds |
| §3.9 birational | SL₂ | pr_i,w of degree 1 over g̃ʳᵉᵍ, q of degree 2 | holds |
| §4.1 fibre dim | torus; SL₂ | 0; 3−1=2 | holds |
| §4.2 regular ν | A₁, p=3: ν=0, ρ, 2ρ, 4ρ | ⟨ν−ρ,α∨⟩=−1, 0, 1, 3; RΓ(P¹,O(−1))=0 at ν=ρ | holds |
| §4.2 dualizing twist | SL₂: X_s=Tot O(−1,−1) | ω=π*(O(−2,−2)⊗O(1,1))=O(−1,−1)=twist (ρ,ρ) | holds |
| §4.2 composition order | SL₃, w=s₁s₂, z=(1,2,4) | middle (2,1,4), third (2,4,1); BR order gives (4,1,2) | holds |
| §4.3 CM, flatness insufficient | Spec Z_(p) ⊔ Spec Q[x,y]/(x²,xy) | special fibre depth 0=dimension 0; generic component depth 0<1 | holds |
| §4.4 miracle flatness | point⊔A¹→A¹; SL₂ | local 0 vs 1+0, not flat; 3=1+2 | holds |
| §5.1 Weyl relation | GL₃ 3-cycle | (2,4,1)=w⁻¹(1,2,4) | holds |
| §5.2 fibres | SL₂ | N−ℓ: 1, 0 | holds |
| §5.3 root wall | SL₂ z=0+cE₁₂; GL₃ diag(a,a,c)+E₁₂ | centralizer 1=r; gl₃: 2+1=3=r | holds |
| §5.4 normality | SL₂ | X_e, X_s smooth; union not normal along X_e∩X_s | holds |
| §6.1 nilpotent fibre | PGL₂; torus over k[ε]/ε² | C[a,b,c]/(a²+bc), reduced; ε has central coordinate ε≠0 and is excluded | holds |
| §6.2 Springer | SL₂ | Tot O(−2), dimension 2; fibre P¹ at 0, one reduced point at E₁₂ | holds |
| §6.3 signed embedding | A¹ covectors | (−a dx)+(a dx)=0; unsigned gives 2a dx | holds |
| §6.4 Z | SL₂ | Z_e=T*P¹ diagonal, Z_s=P¹×P¹×{0}, meeting in diagonal P¹ | holds |
| §6.5 Q vs Q_red | SL₂ chart; k[ε]/ε² | Q: a=−bx=−by, c=−bx²=−by², ring k[x,y,b]/(b(x−y)), reduced; Spec k[ε]/ε²→ reduction not an isomorphism (lengths 2≠1) | conditional statement, consistent |
| §6.6 components | SL₂ | orbit dimension plus conormal rank: 1+1=2 for Z_e, 2+0=2 for Z_s | holds |
| §7.1 top cycles | V(xy); point; A¹ | Z²; Z; Z with [0] of degree 0 excluded | holds |
| §7.2 glued cycle | k[ε]/ε²; k[x,y]/(xy) | 2[pt]; [V(x)]+[V(y)] | holds |
| §7.3 zero fibres | SL₂ X_s chart | κ₁=a+bx=b(x−y)/2; zero locus b=0 ∪ x=y, multiplicities 1,1; [X̄_s]=(1,1) | holds |
| §7.4 CM fibres | SL₂ | pure dimension 2, CM | holds |
| §8.1 coherence | A¹ | [∂,x]=1; D_A¹ coherent over D, infinite O-rank; zero module coherent | definition changed to M23's (F01) |
| §8.2 PBW | A¹ | F₀,F₁,F₂ ranks 1,2,3; gr=k[x,ξ] | holds |
| §8.3 goodness | constant filtration of M≠0 | gr=0, not bounded below | holds |
| §8.4 comparison | shift of O-filtration by 1 | G_(−1)=O⊄F_(−1)=0, so a≥1; a=1 works both ways | Check rewritten with values |
| §8.4 induced filtrations | 0→D/Dx→D/Dx²→D/Dx→0 | lengths at (x): 1,2,1; 2=1+1 | holds |
| §8.5 Ch | O; δ₀; D; 0 | ξ=0; x=0; A²; ∅ | holds |
| §8.6 CC | D/Dx²; D⊕O | 2[fibre]; [A²], with [ξ=0] not a component | holds |
| §9.1 duality | O_A¹ | 0→D→(·∂)D→O→0, dual coker D/∂D≅ω in degree 1, ⊗ω⁻¹[1] gives O in degree 0 | holds |
| §9.2 Kashiwara | δ=k[∂] | ker x=kδ, coker x=0 | holds |
| §9.3 Bernstein | O, δ₀, D, point | 1≥1, 1≥1, 2≥1, 0≥0 | holds |
| §9.4 holonomic | δ₀⊕δ₀ vs δ₀ | same Ch; coefficient 2 not seen by the definition | holds |
| §9.5 finite length | δ⊕δ | length 2, coefficient 2=1+1 | holds |
| §9.6 j_!* | G_m⊂A¹ | j_!*O=O; O[x⁻¹]/O=δ is the extra quotient of j_+ | holds |
| §9.7 regularity | ∂e=e | at t=1/x: −dt/t², pole order 2 | irregular, holds |
| §9.8 strong equivariance | G_m on a point, weights 0,1 | differentials 0=0, 1≠0 | holds |
| §9.9 classification | Z/2 swapping two points; SL₂ on P¹×P¹ | one simple k⊕k, not D-simple; two orbits, two simples | holds |
| §10.1 D-affinity | torus | U_χ₀=U(t)/(t)=k | holds |
| §10.2 localisation | torus k[z]/z² | z≠0, excluded from strict reduction | holds |
| §10.3 induction | δ at eB | diagonal direct image, CC [Z_e]; O_F↦O_(F×F), CC [Z_(w₀)] | holds |
| §10.4 labels | SL₂ | M(0) has L(0), L(−2); M(−2) simple | holds |
| §11.1 Verma cycles | SL₂ | CC(M_s)=(1,1), CC(L_s)=(0,1); H^BM_4=Q², H₄(T*P¹)=0 | holds |
| §11.2 triangularity | SL₂ | A=identity | holds |
| §11.3 multiplicities | SL₂ | m_(s,e)=P_(w₀s,w₀e)(1)=P_(e,s)(1)=1; m_(e,s)=P_(s,e)(1)=0 | holds |
| §11.3 inversion formula | SL₂, x=e, y=s; x=y=e | z=e: +1·P_(e,e)P_(e,s)=1; z=s: −P_(e,s)P_(e,e)=−1; sum 0. x=y=e: 1 | holds |
| §11.3 de Rham route | SL₂ stalks at the fixed point | χ(IC_e)=1, χ(IC_s)=χ(C[1])=−1, χ(j_!C_(A¹)[1])=0, so m_(s,e)−m_(s,s)=0; at the big cell m_(s,s)=1 | new Check; consistent with (−1)^ℓ(v)P_(u,v)(1) |
| §11.3 stalk theorem | A₃, y=s₂, w=s₂s₁s₃s₂ | P=1+q: two one-dimensional stalks two degrees apart; constant sheaf gives one | new Check |
| §11.4 bases | A₁ | det M=1, M⁻¹=((1,0),(−1,1)) | holds |
| §12.1 parabolic | SL₂ λ=−2ρ, 0; SL₃ λ=−2ρ+α₁ | pairings −2, 0; e f^(k+1)v=(k+1)(−2−k)f^k v≠0; SL₃ pairings 0, −3 | holds |
| §12.2 saturation | SL₂ w=e; SL₃ w=s₁ | (ke₂,ke₂,0)↦(k(e₁+e₂),ke₂,0)∉Z_e; Z_(s₁) dimension 2+2+2=6=2N | holds |
| §13.1–13.2 Cartan fibre product | SL₂; torus | k[x,y]/(x²−y²), graphs y=±x meeting at 0; diagonal only | holds |
| §13.3 formal detection | k[x]_(x)→k[x,y]_(x,y) | closed fibre k[[y]]: 2=1+1 | holds |
| §13.4 tangent bound | SL₂ (e,e), (s,e), (s,s) | 1+1+1, 2+0+1, 2+1+0, all =3; matches BHS19 line 1119 (t^(ww′⁻¹), lg(w′w₀)) | holds |
| §13.5 smoothness | SL₂ (s,e) | codim 1=ℓ(s)−ℓ(e) | holds |
| §14.1 completion | y²=x²(1+x) | two branches y∓x√(1+x), each coefficient 1 | holds |
| §14.2 module completion | point module k² | 2=2·1 | holds |
| §14.3 completed simples | SL₂ at E₁₂ (off Z_s) | ℒ̂_s=0 | holds |
| §14.4 completed identity | SL₂, a point on both components | (1,1)=(1,0)+(0,1); off Z_s: 1=1+0 | holds |


Pull request: #1828 (roadmap/springer-resolution-and-characteristic-cycles at ff27628)
