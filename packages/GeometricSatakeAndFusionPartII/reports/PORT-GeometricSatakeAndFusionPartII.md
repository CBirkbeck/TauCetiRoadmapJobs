# PORT-GeometricSatakeAndFusionPartII

- **Branch:** `roadmap/geometric-satake-and-fusion-part-ii`, created from `3b51055` (worktree clean at start).
- **Head commit:** `bb281a287eccab656721c4fa837f94df1089e41d` — "GeometricSatakeAndFusionPartII: roadmap (README, Suggested.lean, metadata)".
- **Files:** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md`, `TauCetiRoadmap/GeometricSatakeAndFusionPartII/Suggested.lean`, `TauCetiRoadmap/GeometricSatakeAndFusionPartII/metadata.toml` (`topic = "math.AG"`, as in the package and as Part II folders on main carry their own `metadata.toml`). Nothing outside the folder was touched.

## Build

`lake build TauCetiRoadmap.GeometricSatakeAndFusionPartII.Suggested`:

    ✔ [8954/8954] Built TauCetiRoadmap.GeometricSatakeAndFusionPartII.Suggested (4.3s)
    Build completed successfully (8954 jobs).

Warning count: **0**. The file declares nothing, so there is no `sorry` warning either. An earlier build with a plain `import Mathlib` header produced one non-`sorry` warning ("imports `Mathlib` … designed for use with the module system"). The file therefore uses `module` / `public import Mathlib`, which the gate's import rule accepts.

## Gate

    gate GeometricSatakeAndFusionPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck … --movable`), run after the edits:

    depcheck: 232 roadmaps, 2198 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is on line 198. Its pull-request suppliers are all earlier: SmoothRepresentationsOfLocalGroups 22, LefschetzPencilsAndVanishingCycles 52, ClassicalAdicEtaleCohomology 53, EtaleDualityAndPerverseSheaves 96, PELModuli 106, GeometricSatakeAndFusion 121, DiamondsAndVStacksPartII 123 and RootSystemsPartII 196. Its main-branch suppliers are ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations and ModularCurves.

Citation resolver (`roadmaps resolve` on the ported README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

## Draft pull request body

This roadmap continues GeometricSatakeAndFusion from where that roadmap stops. GeometricSatakeAndFusion ends at the v-sheaf local model and the identification of its reduced perfected special fibre with the admissible locus. Building on that, this roadmap constructs the scheme geometry of integral local models of Shimura varieties:

- the polynomial (Pappas–Zhu–Levin) Schubert-bound closures and their normality;
- closed integral Hodge, Weyl-lattice, restriction-of-scalars and lattice-chain embeddings, including Görtz's flat GL and GSp chain models;
- the canonical normal model in the classical abelian-type range, and the weakly normal model for every reductive group with its smooth open of maximal orbits;
- the Kisin–Pappas–Zhou tangent-space theorems: root and Cartan directions of affine Schubert varieties spanned by formal curves;
- Kisin–Zhou's same-residue-field Schubert curves;
- the EL/PEL naive and de Rham kernel models, and the Drinfeld and unitary Drinfeld comparisons.

Two results hold with no tameness, minuscule or residue-characteristic restriction: the Gleason–Lourenço theorem that every geometric tube of the local model is connected, for every dominant bound; and its consequence that every minuscule local model is normal with geometrically reduced special fibre. The application to Kisin–Zhou good embeddings for acceptable Hodge data and the admissibility lattice criterion follows. The last layer applies nearby cycles of the intersection complex to obtain the Anschütz–Gleason–Lourenço–Richarz test function: it is central at every parahoric level and is characterized by Satake parameters for every reductive group, dominant bound and prime. The aim is a general library of local models, not a route to one application: the integral Shimura models, Kottwitz–Rapoport strata and local trace computations downstream consume these results unchanged. No headline is statable at the pins (Mathlib and Tau Ceti have no affine Grassmannian, parahoric group scheme, represented Grassmannian scheme, v-sheaf or nearby-cycle functor). `Suggested.lean` therefore declares nothing; its docstring names each headline and the carrier it lacks.

## Dependencies that are still pull requests

GeometricSatakeAndFusion; DiamondsAndVStacksPartII; RootSystemsPartII; PELModuli; LefschetzPencilsAndVanishingCycles; ClassicalAdicEtaleCohomology; EtaleDualityAndPerverseSheaves; SmoothRepresentationsOfLocalGroups. (ReductiveGroups, ReductiveGroupsPartII, SchemeAndStackFoundations and ModularCurves are on main.)

## What moved from the Lean to the README

Nothing. The package `Suggested.lean` declared nothing (a docstring and an empty namespace). The docstring was rewritten in the house form:

- the note that the README is the roadmap;
- the list of missing carriers at the pins;
- one bullet per headline family, by section, with the carrier each lacks;
- the remark that §2.8 (nondegeneracy of the trace symplectic form) is statable but is a supporting lemma, not a headline.

The `@[expose] public section` wrapper was dropped because there are no declarations.

I checked again whether any headline is statable, especially Görtz flatness (§2.5) and the flat Eisenstein/Drinfeld model M_r (§6.5). Both need a represented Grassmannian scheme. Mathlib's `Module.Grassmannian` (Mathlib/RingTheory/Grassmannian.lean:66) is a functor of points whose module docstring lists representability as TODO. Stating either theorem would need a long ad hoc representability encoding, so they stay unstated.

**`#check` audit.** There are no declarations, so there is nothing to compare against README statements. Instead, I temporarily added `#check @…` lines to the module for the eight library declarations the README cites, built once with the allowed command, and then removed them. The elaborated types match the contracts:

- `Submodule.span`
- `Algebra.trace`
- `Module.Grassmannian` (the quotient-rank `ℕ` argument)
- `traceForm_nondegenerate` (with `[FiniteDimensional K L] [Algebra.IsSeparable K L]`)
- `AlgebraicGeometry.Scheme`
- `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono` (`IsClosedImmersion f ↔ IsProper f ∧ Mono f`)
- `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` (`(X : Scheme) → X → Type`)
- `Derivation.adjointWeightSpace` (with `[Module.Finite R (CotangentSpace R H)] [Module.Projective R (CotangentSpace R H)]`)

All eight are at the file:line the README states, at Mathlib f6090c7 and Tau Ceti 358314d, which match this worktree's `lake-manifest.json`.

## Supplier replacements and duplication removals

The duplication sweep searched by object, using `roadmaps grep` over main and every open roadmap pull request:

- local models, Görtz, Pappas–Zhu, Drinfeld model;
- test function, Kottwitz–Rapoport, geometric tube and tubular neighbourhood;
- curve span and formal curve, Finkelberg, Wakimoto, Kisin–Pappas/KPZ;
- Scharlau transfer and trace forms, Lagrangian Grassmannian;
- naive local models and lattice-chain moduli.

Most hits were other objects that share a name:

- Hilbert self-orthogonal local model: HilbertModularVarietiesAndShimuraCurves H2.1.
- Γ₀ prime-power local models: ModularCurvesPartII §11.2.
- Smooth shtuka local models: GlobalShtukasAndFunctionFieldLanglands §2.3.
- Tubular neighbourhoods in differential topology, and EtaleDualityAndPerverseSheaves Layer 7.
- Görtz's lecture notes on Grassmannians: AlgebraicModuliForArithmeticGeometry §1.3.
- Lagrangian Grassmannians as compact duals: ShimuraData, MordellLawrenceVenkatesh.

Two hits are roadmaps this one already consumes: DiamondsAndVStacksPartII (it names KPZ only as an application of D10–D11, which is how this roadmap uses it) and GeometricSatakeAndFusion §§4.17–4.18 (already imported). No other roadmap builds the objects this one owns. One genuine overlap was found, and one contract was reconciled:

- **PELModuli M0.18, “The Kottwitz determinant condition”.** It owns the determinant Det_(O|M) of the generic element and the determinant condition as an equality of polynomials over arbitrary, including nonreduced, bases. §6.3 restated this as "polynomial-law equations". §6.3 now imposes Det_(O_B|t_Λ)=Det_(O_B|V_1) as M0.18's condition for the local order. The citation was added to:
  - the PELModuli supplier contract;
  - the §6.3 *Needs:* line and the Layer 6 Dependencies;
  - "Scope and ownership".

  No target was deleted.
- **gap:finite-weak-normalization.** The request is the same as the "absolute weak-normalization contract" that DiamondsAndVStacksPartII already states for SchemeAndStackFoundations §0.26. The gap paragraph now says so and locates it in §0.26.

No restatement of a pinned Mathlib or Tau Ceti declaration was found: the eight library declarations are cited, not restated.

## Fixes made reading as an upstream reviewer

1. **Review F01 (non-blocking, applied).** The §0.4 property "a central surjection carrying a minuscule lift μ̃ to μ identifies closures after O_E→O_Ẽ" now carries "(SW, Proposition 21.5.1, pp. 196–197; SW line 7543)". I read the cached SW text: the proposition starts at SW line 7543, before the printed-p. 197 page marker, so the page range is pp. 196–197 rather than the review's p. 197. Its setting at SW line 7538 is a map of quasiparahoric models whose generic fibre has central kernel.
2. **ClassicalAdicEtaleCohomology §4.5a citation.** The section's title is “Nearby-cycle and perverse coefficient comparisons”; "Comparison with nearby cycles of the adic generic fibre" is a paragraph inside it. The contract now names the section by its title and the paragraph by its content.
3. **GeometricSatakeAndFusion citations pinned to section numbers.** Every quoted GS title now carries its number (§0.6, §0.29, §0.32, §0.37, §0.38, §4.17, §4.18; "GS0’s Witt affine flags" became §0.31 “Witt affine flags and components”). The unsourced "GS4, normalized Satake equivalence and pinned Weil action" (§8.4 *Needs:* and Layer 8 Dependencies) became §4.14 “Canonical pinned dual identification” and §4.16 “Normalized integral Satake equivalence”, which supply them. All numbers and titles were read at the GeometricSatakeAndFusion pull-request head.
4. **Supplier contracts completed.** Every section cited in a *Needs:* line now appears in its supplier's contract:
   - SchemeAndStackFoundations §0.26 (weakly normal schemes, §3.6) and §0.28 (ideal-sheaf quotient comparison, §2.3), also added to the Scope list;
   - ReductiveGroupsPartII RG2.3.1 “Big-cell criteria” and “Quotients of group schemes over a DVR”, read on main as the quotient of an lft group by a closed flat subgroup, smooth when the group is (used in §3.7);
   - RG2.5.1–RG2.5.2, the dual group and L-group (§8.4);
   - DiamondsAndVStacksPartII D11.4, formal schemes give kimberlites (§7.8);
   - GS §§4.14, 4.16.
5. **The `gap:name` label is now defined.** It was used from the first paragraph but never defined. One sentence in Conventions now says that it cites the "What X must provide (gap:name)" paragraph of Exact supplier contracts.
6. **Machine-artefact wording removed.** Fifteen reference entries said "the line locators recorded in sources.toml"; that file is not in the roadmap folder. They now read "The section citations and line locators refer to this version."
7. **Scope wording made definite.**
   - "is the requested owner" became "owns, in the polynomial Beilinson–Drinfeld extension of GS0 specified in the supplier contracts".
   - "are supplier gaps" became "are the supplier contracts stated below".
   - "…are outside these layers" became "This roadmap does not construct Zhu's independent rational Gelfand commutativity constraint, metaplectic Satake, or the rational Witt Satake equivalence over algebraically closed residue fields larger than an algebraic closure of a finite field" (see Unresolved 1).
8. **Grammar.** Eleven section ranges took a singular verb ("Sections D10.8–D10.9 supplies", "RG2.1.2–RG2.1.5 supplies", …); they now take "supply".

No mathematical error was found. All Checks and worked examples I recomputed agree with their theorems (table below).

## Adversarial mathematics pass

Values were computed by hand. "Holds" means the computed instance agrees with the statement as written.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: PGL₂ coroot order | X_*(T)=ℤ²/ℤ(1,1) | (1,−1)≡(2,0)=2·(1,0), so the coroot is 2; 2−0=1·α∨, so 0≤2; 1−0=½α∨∉ℕα∨, so incomparable | Holds | None |
| Conventions: apartment sign | GL₂, diag(t,t⁻¹) | cocharacter (1,−1); translation by −(1,−1)=(−1,1); det valuation 1−1=0 | Holds | None |
| Conventions: Cartan sign witness | g=((1,0),(1,1)) | gEg⁻¹=((−1,1),(−1,1)); E−H−F=((0,1),(0,0))−((1,0),(0,−1))−((0,0),(1,0))=((−1,1),(−1,1)) | Holds | None |
| Conventions: IC/constant trace | smooth, d=0,1; q=9 | IC=Q_ℓ[d](d/2): trace (−1)^d·q^(−d/2); d=0 gives (φ,τ)=(1,1); d=1 gives (1,−1/3) | Holds | None |
| Conventions: KZ inverse convention | h=3, g=diag(π⁻¹,1,1) | πgΛ=Oe₁⊕πOe₂⊕πOe₃, mod πΛ gives k·e₁ (rank 1); SW kernel rank 3−1=2 | Holds | None |
| §0.1 datum, reflex field | GL₂ (1,0); μ=0; PGL₁(D); GL₂ (2,0) | E=F, flag P¹ (dim ⟨2ρ,μ⟩=1); μ=0 gives Spec F; Severi–Brauer conic, no F-point since D is nonsplit; ⟨(2,0),α⟩=2, not minuscule, Schubert dim 2 | Holds | None |
| §0.2 Hodge representation | m=0; (2,0); h=3,d=1 | the empty sum has kernel G, so it is not faithful; GL₂ standard with (2,0) has weights {2,0}∉{0,1}; quotient kernel rank 2 | Holds | None |
| §0.3 quasi-tame/(NE) | Res_{K/F}GL_n wild K; PGL_m(D), index p | H=GL_n is split, so Res is quasi-tame for any K/F; index p fails (NE) for odd p | Holds | None |
| §0.4 imported v-model | SL₂→PGL₂; GL₁→1, μ=0 | diag(z,z⁻¹)↦2; 2n=1 has no integer solution, so class 1 has no lift; both closures are Spd O_F; SW 21.5.1 states the O_Ẽ comparison | Holds | Locator added (F01) |
| §0.5 scheme representative | blow-up of P¹_{O_F} at a special point; x²=πyz | ord_E(π)=1, so both components are reduced; the exceptional P¹ collapses to a point, so the map is not a monomorphism. Conic: on z=1, x²−πy has rank-3 quadratic part in (x,π,y), Krull dim 2, embedding dim 3, singular locus one point (codim 2), hypersurface ⇒ S₂ ⇒ normal; special fibre x²=0 nonreduced | Holds | None |
| §0.6 goodness | cusp k[t²,t³]⊂k[t] | finite, birational, bijective; t∉image, so not a closed immersion | Holds | None |
| §1.1 modification | GL₁ degree m; P=1; G_a | (u−π)^m↦t^m, m=0 neutral; R[u][1/1]=R[u], β global; k((t))/k[[t]]=t⁻¹k[t⁻¹] is ind-affine, not ind-projective | Holds | None |
| §1.2 closure | GL₂ ν=(2,0); Res_{K/F}GL₂ central ((1,1),(0,0)) | Schubert dim 2 vs GL₂/P_ν=P¹ (dim 1); the stabilizer of the embedding labelling is Gal(·/K), so E=K; one generic point, closure Spec O_K | Holds | None |
| §1.3 normality | GL₂ hyperspecial (2,0) | Adm={t^(2,0),t^(1,1)}; Gr_≤(2,0) is the quadric cone, dim ⟨(1,−1),(2,0)⟩=2, normal, singular only at t^(1,1) | Holds | None |
| §1.4 adjoint comparison | GL₂→PGL₂, (1,0); G=PGL₂, p=2 | π₁(SL₂)=1, M=P¹=M^ad, ad_* is the identity and its normalization is P¹; for G=PGL₂, \|π₁\|=2 so p=2 is excluded (PGL₂ Schubert varieties at p=2 are non-normal, HLR) | Holds | None |
| §1.5 Hodge cover | GL₂, μ=(1,0) | G′=GL₂, π₁(SL₂)=1, E′=E^ad=F; derived kernel order ≤2 in type D is prime to p>2 | Holds | None |
| §1.6 one-lattice GL | GL₃, d=1 | P² of lines, dim d(h−d)=2; SW rank-1 quotients form the dual P² (kernels of rank 2) | Holds | None |
| §2.1 split-form embedding | GL₂/Q₃ alcove, s=√2−1, x′=1/4 | e·s∉ℤ for every e, so s is never a vertex; Q₃(i,3^{1/4}) is tame (4∤3) and Galois, with e=4, f=2; 4·¼=1 is a vertex, hyperspecial for split GL₂; both fixers are the Iwahori | Holds | None |
| §2.2 Weyl-lattice uniqueness | G_m weights (0,2,1), Λ∋(e₁+e₂)/3 | u·(e₁+e₂)/3=u²(e₁+e₂)/3+((1−u²)/3)e₁ with u²≡1 (3), so Λ is stable; the coaction coefficient (1−T²)/3∉Z₃[T,T⁻¹] | Holds | None |
| §2.3 restriction of structure | unramified quadratic K, V=K, μ=(2,0),(1,0); [K:F]=e | a torus μ is minuscule; ν=(2,0) has ⟨ν,α⟩=2, dim 2; ν=(1,0) gives target P¹; ranks ed and e(n−d), d=0 gives quotient rank en | Holds | None |
| §2.4 power embedding | m=1, one-lattice GL_h | 𝒢′=𝒢=GL(Λ), M=Gr(d,Λ), ranks (mh,md)=(h,d); m=0 is not faithful | Holds | None |
| §2.5 GL chain incidence | two-lattice GL₂, d=1 | Λ₁→Λ₀ is diag(1,π), giving F₁=(x₁,πy₁)⊂(x₀,y₀) ⇔ x₁y₀=πx₀y₁; πΛ₀→Λ₁ is diag(π,1) and gives the same equation; special fibre x₁y₀=0, two P¹ meeting at ([1:0],[0:1]); at x₀=y₁=1, x₁y₀−π with π∉m², so regular. The forgetful map has fibre P¹ over [1:0] and a point over [0:1] | Holds | None |
| §2.5 GSp incidence | rank 4, single lattice; span(e₁,f₁) | LG(2,4) has dim 3 vs Gr(2,4) dim 4; ⟨e₁,f₁⟩=1≠0 in every characteristic | Holds | None |
| §2.6 tame symplectic | GSp₂=GL₂ | every line is Lagrangian in rank 2; the three models coincide with P¹ | Holds | None |
| §2.7 period-total | r=2, h=2, d=1 | P¹×P¹→Gr(2,4); the plane Λ₀⊕0 has ranks (2,0), outside the image | Holds | None |
| §2.8 trace form | K=F, r=1; r=0; F_p(t^{1/p})/F_p(t); multipliers 1,2 | Ψ=ψ, Ψ(e₁,e₂)=1; the zero space is nondegenerate; the inseparable trace is 0, so Ψ=0; independent multipliers do not preserve one F-similitude | Holds | None |
| §3.1 canonical model | GL₂×(μ=0 factor); PU₃, p=3 | dim 1+0=1; \|π₁(PU₃)\|=3=p, so the raw model is non-normal (HLR Ex. 9.4) | Holds | None |
| §3.2 normalization of image | GL₂ identity; trialitarian D₄×G_m, p=5 | P¹→P¹ is the identity; h=d=3·8=24; the centre of Spin₈ acts by −1 on exactly two of the three 8-dim reps, so (λ,z) is trivial only if λ=1, z=1 (faithful); Gr(24,Λ) is a point | Holds | None |
| §3.3 descent cutout | K̃=K, Γ=1 | the cutout is H₀; with Γ≠1 the O_K̃-linearity equations are needed (KPZ lists both families) | Holds | None |
| §3.4 depth zero | GL₂ (1,0) hyperspecial; (2,0); Iwahori | 1+pM₂ acts trivially on lines of k²; (1+pE₁₂)e₂=e₂+pe₁∉p²We₁⊕We₂; Iwahori kernel ⊂1+π[[O,O],[πO,O]], trivial on Λ₀/π and Λ₁/π; 1+aE₁₂ moves F₀=[0:1] to [a:1] with F₁=[0:1] fixed | Holds | None |
| §3.5 kimberlite | μ=0; GL₂ Iwahori | the reduction is a point, sp surjective; reduction is two P¹, the image is closed and contains the dense generic image | Holds | None |
| §3.6 weakly normal model | GL₂ (1,0) | M^wn=P¹_{O_E}, which is normal, hence weakly normal | Holds | None |
| §3.7 smooth open | GL₂ hyperspecial/Iwahori; O_E[t]/(t²−π) | all of P¹; model minus the node (xy=π is smooth off (0,0)); the DVR O_{E(√π)} has perfected special fibre a point but k[t]/t² is not smooth | Holds | None |
| §4.1–4.2 curve span | A¹; k[ε]/ε²; xy=0; x²+xyz=0 | span k; ε must map to a nilpotent of the domain k[[a]], so 0, while T has dim 1; f·g=0 in a domain gives f=0 or g=0, so no (1,1); f(f+gh)=0 gives f∈(a²) or f=0, so span {x=0} (dim 2) ⊂ T=k³ | Holds | None |
| §4.3 big-cell weights | SL₂, λ=α∨ | t^λ x_α(t^{−j}a)t^{−λ}=x_α(t^{2−j}a); tangent t¹k[t⁻¹]X_α ⊕ t⁻³k[t⁻¹]X_{−α} ⊕ t⁻¹k[t⁻¹]H | Holds | None |
| §4.4 minuscule tests | C₂ μ=(1,1), ν=0,(2,0); D₄; B₃ | (1,1)=α₁∨+2α₂∨, ω₁-test 1; (−1,1)=−α₁∨, ω₁-test −1, ω₂-test 0; D₄: 2e₄=α₄∨−α₃∨, tests (0,−1,1); B₃: spin test (2−1−1)/2=0, ω₁ 1, ω₂ 0; (1,0,0) has odd sum, not a coroot | Holds | None |
| §4.5 k_α | SL₂ λ=μ=α∨; λ=0, μ=α∨ | j=0..2 give α∨,0,α∨≤α∨, j=3 gives 2α∨, so k_α=2 and k_{−α}=0, derivatives t¹X_α, t⁰X_α; k_α=1 gives t⁻¹X_α | Holds | None |
| §4.6 FM bounds | point t^μ; μ=0 | weights ω′ with ⟨μ,w₀ν⟩≤⟨μ,ω′⟩≤⟨μ,ν⟩: left exponents ⟨μ,ω′⟩−⟨μ,w₀ν⟩≥0, right ⟨μ,ω′⟩−⟨μ,ν⟩≤0; μ=0 forces equality of lattices | Holds | None |
| §4.7 j_α=k_α | SL₂, S={ω}, λ=μ=α∨; λ=0 | ω′=−ω: 1−(−1)=2=k_α; for −α, ω′=ω: 1−1=0=k_{−α}; λ=0: 1−0=1 | Holds | None |
| §4.8 Cartan span | SL₂, λ=α∨, μ=2α∨ | k_α=3, k_{−α}=1, so C^cur=k·t⁻¹H_α; k_α=⟨λ,α⟩+k_{−α}: 3=2+1, 2=2+0, 1=0+1 | Holds | None |
| §4.9 detecting minimum | SL₂ (λ,μ)=(0,α∨),(α∨,α∨),(α∨,2α∨); char 3 scaling | candidates {1,1}, so l=1=k_{−α}; {0,2}, so l=0; {2−1,2+1}={1,3}, so l=1; 2·(−1)=−2≡1 (3); −2≡1 (3), 0 (2) | Holds | None |
| §4.10–4.11 spanning | SL₂ at t⁰ in S_{α∨}; two ramified embeddings | spans t⁻¹X_{±α}, t⁻¹H (3=dim T); (1,0)+(1,0)=(2,0) is not minuscule | Holds | None |
| §5.1 orbit step | A₂ reversal; D₄ triality | the orbit {α₁∨,α₂∨} counted once; (α₁+α₂)+(α₃+α₂)+(α₄+α₂) has α₂-coefficient 3>2, while θ=(1,2,1,1) fits | Holds | None |
| §5.2 rank-one curves | standard SU₃ (0,u′⁻¹a); nonstandard (a,−a²/2), a=1 in F₃ | d+τ(d)=u′⁻¹a−u′⁻¹a=0; a²−a²/2−a²/2=0; in F₃, −1/2=1 and 1+1+1=0; 2 is not invertible in F₂ | Holds | None |
| §5.3 rank-one flag | SU₃ at p=3; PGL₂ at p=2 | π₁(SU₃)=1, so allowed; \|π₁(PGL₂)\|=2=p, so excluded | Holds | None |
| §5.4 positive-loop lift | λ=0; GL₁, λ=1 | y=g directly; t has valuation 1, so t∉𝒢(k[[t]]) | Holds | None |
| §5.5 curves | SL₂/F₃, λ=0, μ=α∨ | f(a)=x_−(t⁻¹a), f(0)=1, f(G_m)⊂S_{α∨}, C=A¹ over F₃ | Holds | None |
| §6.1 chains | b=π; quaternion D, R over F_{p²} | θ_π composed with the transition is multiplication by π, zero mod π; F_{p²}⊗R=R×R, ranks (1,1) vs (2,0) | Holds | None |
| §6.2 torsors | one-lattice B=Q_p | 𝒢=GL(Λ); torsors are rank-h vector bundles | Holds | None |
| §6.3 naive model | K/F ramified quadratic, ranks (2,0) | A=k[ε]/ε², quotient (u,v)↦u+cv; multiplication by a₀+a₁ε on A has char. poly (T−a₀)²=reduction of det(T−a\|V_1); an A¹-family over a one-point generic fibre | Holds | Now cites PELModuli M0.18 |
| §6.4 kernel | h=3, d=1 | M=ξe₁⊕e₂⊕e₃, det modification ξ (index 1) | Holds | None |
| §6.5 Drinfeld/Eisenstein | n=2 Drinfeld; F=Q₃(∛3), r=(1,2,0) | special fibre is two P¹ with node k̄[X₁,X₂]/(X₁X₂); r has distinct values, so trivial stabilizer and E=Q₃(∛3,ζ₃) with e=6, π_F=ϖ_E²·unit; xy−ϖ_E²u∈m², dim 2, embedding dim 3, not regular but normal | Holds | None |
| §6.6 unitary Drinfeld | signature (1,1) vs central (1,1) | GL₂ cocharacter (1,0) gives P¹; (1,1) gives a point | Holds | None |
| §7.1 tube count | μ=0; Iwahori node xy=π | #π₀=1 and dim H⁰=1; the annulus is connected and R⁰ΨF_ℓ=F_ℓ (dim 1) | Holds | None |
| §7.2 two maximal translations | GL₂ Iwahori (1,0), stratum τ | t^(1,0), t^(0,1) above τ: count 2≤2 | Holds | None |
| §7.3 Iwahori S₂ | GL₂ Iwahori; μ=0 | two P¹ at a node: dim 1, depth 1, so S₂; a point | Holds | None |
| §7.4 Wakimoto stalk | GL₂ Iwahori node; PU₃ p=3 | H^{−1}(Z_μ)_x=F_ℓ, dim 1; ⟨(2,0,−2),(1,0,0)⟩=2=ℓ(t^ν), unibranch so H^{−2}(∇)=F_ℓ | Holds | None |
| §7.5–7.6 connected tubes, normality | GL₂ Iwahori; conic x²=πyz | xy=π is normal with reduced special fibre; the conic is normal but has nowhere-reduced special fibre and no O_E-smooth open meeting it, consistent with R₀ coming from §3.7 | Holds | None |
| §7.7 good embeddings | one-lattice GL_h | the identity is a good embedding | Holds | None |
| §7.8 lattice test | diag(π⁻¹,1); diag(π⁻²,1); μ=0 | πgΛ=Oe₁⊕πOe₂, line k·e₁; π⁻¹Oe₁⊄Λ (bound (2,0)), both false; πgΛ=πΛ | Holds | None |
| §8.1 nearby cycles | μ=0; GL₂ q=9; unipotent block | rank 1; −1/3; N≠0, N²=0 | Holds | None |
| §8.2 semisimple trace | Φe₁=q⁻¹e₁, Φe₂=e₂, Ne₂=e₁ | ΦN=q⁻¹NΦ (Weil–Deligne); ker N=⟨e₁⟩, trace q⁻¹; graded trace 1+q⁻¹=10/9 at q=9 | Holds | None |
| §8.3 centrality | d=1, q=9 | τ=−1/3, κ^ss=(−1)¹τ=1/3, φ=1 | Holds | None |
| §8.4 Satake characterization | GL₂ hyperspecial (1,0) | S(1_{Kt^μK})=q^{1/2}(z₁+z₂), so z^ss=q^{−1/2}1_{Kt^μK}=1/3; φ=q^{1/2}z^ss=1; τ=−z^ss=−1/3; μ=0 gives 1_{P_r} | Holds | None |
| Worked example: two-lattice line | [a:b],[c:d] | a·πd−b·c=0; special fibre bc=0; chart a=d=1 gives bc=π, regular | Holds | None |
| Worked example: trace | q=9, exponent sign | (−1)·9^{−1/2}=−1/3; +1/2 would give −3 | Holds | None |

Context (Lean `variable` blocks), generality between README and Lean, and vacuity of Lean statements: not applicable, since `Suggested.lean` declares nothing.

## Ownership against open work

This roadmap owns the polynomial local-model closures, Hodge-embedding geometry, curve-spanning, same-residue curves, EL/PEL and Drinfeld models, tube connectedness and the local-model test function. The `roadmaps grep` sweep above found no other roadmap, on main or in any of the 446 open roadmap pull requests at their heads, that plans these objects. No declaration name of another roadmap is reused: `Suggested.lean` declares nothing.

## Unresolved

1. **GeometricSatakeAndFusion assigns three items to this roadmap that it does not plan.** The GS Scope and ownership section, read at its pull-request head, says: "Metaplectic Satake, Zhu's own Gelfand commutativity constraint and the rational equivalence over arbitrary larger algebraically closed residue fields belong to `GeometricSatakeAndFusionPartII`". GS §4.15 also says "For larger algebraically closed `k`, use GeometricSatakeAndFusionPartII, rational Witt comparison". The accepted package states that this roadmap does not construct them, and I kept that decision. Either GeometricSatakeAndFusion's pointer must name another owner (for example a Part III), or these items must be added here as a new layer with sources and Checks. Until then the boundary between the two roadmaps contradicts itself.
2. **RootSystemsPartII excludes what three gaps ask of it.** RootSystemsPartII's Scope says that "integral representation bounds and minuscule detection, are not part of this roadmap", yet gap:minuscule-dominance-tests, gap:minuscule-root-coefficients and gap:minuscule-cartan-coefficients request them from RootSystemsPartII. The README phrases them as requests for the "minuscule-bounds continuation" that RootSystemsPartII's Downstream consumers name. The statements themselves are already stated here: the dominance criterion in §4.4, j_α=k_α in §4.7 and l_H^S=min k_(−α) in §4.9. If RootSystemsPartII declines, the natural fix is to make them targets of this roadmap's Layer 4 (KPZ §4.2.15 and §§4.3.3–4.3.10) and drop the three gaps. I kept the accepted design.
3. **The 42 conditional gaps of the accepted review remain conditions on suppliers.** They are recorded as "What X must provide (gap:…)" paragraphs, unchanged apart from the two edits above (the §0.31 location and the weak-normalization cross-reference).
4. **`metadata.toml` rule.** The repository README says a sub-roadmap has no `metadata.toml` of its own, but the Part II folders on main (for example ReductiveGroupsPartII) carry one and the gate's `metadata` check passes. I followed main.

No suspicious instructions were found in any text read. The review reports carry an HTML provenance comment with job metadata; I treated it as data.


Pull request: #1836 (roadmap/geometric-satake-and-fusion-part-ii at bb281a2)
