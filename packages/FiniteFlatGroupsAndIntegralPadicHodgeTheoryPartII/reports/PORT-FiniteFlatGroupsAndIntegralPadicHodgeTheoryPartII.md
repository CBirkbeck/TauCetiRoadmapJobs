# PORT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII

- **Branch:** `roadmap/finite-flat-groups-and-integral-padic-hodge-theory-part-ii`, created from main at `3b51055`.
- **Head commit:** `95bce15f1f8914c0e1bce35837ac586879fd5352`, message "FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII: roadmap (README, Suggested.lean, metadata)". It adds `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/{README.md, Suggested.lean, metadata.toml}` (1671 + 69 + 1 lines). Nothing outside the folder changed.
- **Build** (`lake build TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII.Suggested`): `✔ [8954/8954] Built TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII.Suggested (2.3s)`, then `Build completed successfully (8954 jobs).` **Warnings: 0.** The file has no declarations, so it does not even raise `sorry` warnings.
- **Gate:** `gate FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable`, on the committed README). Complete output:

  ```text
  depcheck: 239 roadmaps, 2289 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** on the committed README: no cross-roadmap citation and no Lean name is found nowhere. The resolver reported that it did not check Lean names outside TauCetiRoadmap, so I checked every Mathlib and Tau Ceti name the README uses at the pins (list below).

## Draft pull request body

This pull request adds **Finite flat group schemes and integral p-adic Hodge theory, part II**. It continues FiniteFlatGroupsAndIntegralPadicHodgeTheory from field Dieudonné theory and height-one Breuil–Kisin classification to the integral tensor deformation theory that Hodge-type integral models rest on. Layer 0 builds Zink's coefficient ring Ŵ(R), p-frames, the invariant tilde functor and Dieudonné displays. It proves the anti-equivalence with p-divisible groups over complete Noetherian local rings with perfect residue field, and Gabber–Lau's classification over arbitrary perfect rings at every prime. Layer 1 constructs the canonical first-order comparison c and the universal display with rigid first order. Layer 2 puts integral tensors on displays and Breuil–Kisin lattices and defines very-good integral Hodge embeddings and adapted p-divisible deformations, independently of the deformation quotient they are meant to cut out. Layer 3 proves the very-good criteria (endomorphisms, curve-spanned tangents, products, summands, isomorphic copies, generic neutral closure) and the existence theorems for nonexceptional, Dᴴ-PEL, wild type-A and central-enlargement lattice chains, following Kisin–Pappas–Zhou. Layer 4 proves the versal adapted deformation theorem, the universal marked parahoric display and recognition from integral étale tensors (Kisin–Pappas, Kisin–Zhou, Hoff). Layer 5 treats hyperspecial level: Breuil–Kisin tensor frames, explicit adapted lifts, the horizontal Fil⁰ locus and Kottwitz-compatible lattice specialization (Kisin). Layer 6 normalizes the μ-ordinary σ-conjugacy class and constructs the adapted ordinary lift through the central Newton–Levi filtration, with the full rational σ-centralizer J_b(ℚ_p) acting by self-quasi-isogenies, without a very-goodness hypothesis. Fourteen supplier extensions that this roadmap needs from earlier roadmaps are stated as exact contracts with locators. `Suggested.lean` states no theorem: none of the 21 headline theorem groups is statable at the pins without a stand-in for a missing carrier (p-divisible groups, displays, parahoric local models, Breuil–Kisin modules, filtered G-isocrystals), and its docstring names the missing carrier for each.

## Dependencies that are still pull requests

Suppliers named in the README's contracts and *Needs* lines that are not on main:
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- AbelianSchemesAndArithmeticModuli
- CrystallineCohomology
- DerivedDeRhamCohomology
- PadicPeriodRings
- PadicHodgeTheory
- VectorBundlesAndIsocrystals
- GeometricSatakeAndFusion
- ShimuraVarieties
- PrismaticCohomologyPartIII (new edge in this port)
- PELModuli (Scope boundary only)

All of these come before this roadmap in the merge order.

On main: SchemeAndStackFoundations, ModularCurves, ReductiveGroupsPartII.

## Moved from the Lean to the README

Nothing. The package's `Suggested.lean` had no declarations, so there was nothing to move. Two edits were made:
- **Header kept in module form.** I kept the module-system header (`module`, `public import Mathlib`, `@[expose] public section`). The plain `import Mathlib` form builds with the non-`sorry` warning "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". The gate accepts the module form (`imports=0`, `no-import-mathlib=0`), and six roadmaps on main use it, for example AffineMorseLefschetz.
- **Docstring brought up to date with the current pins.**
  - The perfect-ring bullet now says that Tau Ceti's `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` supplies the finite levels, but no p-divisible-group category, Witt-vector F/V-module category or Dieudonné functor exists.
  - The closing paragraph names Mathlib's `Module.Grassmannian.functor` (functor of points only, no representing scheme). It says that stating a headline through a stand-in would replace it by a weaker theorem.

**Statability re-checked at this worktree's pins** (Mathlib `f6090c7`, Tau Ceti `358314d`):
- **No carrier for the headline objects.** Neither library has p-divisible or Barsotti–Tate groups, Breuil–Kisin modules, displays, the Zink ring, parahoric group schemes, local models, affine Weyl groups or Iwahori data.
- **Tau Ceti's stabilizers are over a field.** `Submodule.stabilizerHopfIdeal` in `TauCeti/Algebra/AlgebraicGroup/Representation/Stabilizer.lean` is defined over a field, so integral tensor fixers over ℤ_p are absent too.
- **Mathlib's isocrystal has no filtration.** `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`) is a class with a Frobenius-semilinear `frob` and no filtration or lattice.
- **No headline was added.** The package's verdict stands: every headline would need either a definition of p-divisible groups duplicating AbelianSchemesAndArithmeticModuli's `BarsottiTate`, or a sorry'd functor.

**`#check @name` audit:** there are no declarations, so the scratch enumeration is empty and nothing changed. No elaborated signature was compared, because none exists.

## Supplier replacements, citations repaired, and duplication

**Supplier citations checked at the heads given by `roadmaps show`.** Every section the README cites exists:
- FiniteFlatGroupsAndIntegralPadicHodgeTheory: R07.1.1, 1.6, 1.7, 1.8, 1.22, 2.10–2.12, 2.27 (with `deJongBoundedFormalFunctions`), 3.2, 3.3, 4.1, 4.13, 4.16–4.21 and 4.25.
- AbelianSchemesAndArithmeticModuli: A4.CR.7.2, and A4.10 for the new boundary.
- CrystallineCohomology: Layer CR.1 and CR.7.1.
- DerivedDeRhamCohomology: PD.7, with the two planned names `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` (README lines 2884 and 3007 at its head).
- PadicPeriodRings: §§3, 4.1 and 4.3.
- PadicHodgeTheory: §5.5.
- VectorBundlesAndIsocrystals: Layer 1 and Layer 6 with the quoted titles.
- ShimuraVarieties: §7.0i.
- PELModuli: §M2.15.
- SchemeAndStackFoundations: §§0.6, 1.15, 2.3, 4.1–4.4, 4.7–4.8 and 4.12.
- ModularCurves: §0G.
- ReductiveGroupsPartII: RG2.1.5, RG2.2.4 (*division-algebra-building*), RG2.3.3 (*parahoric-kottwitz-characterization*), RG2.3.5, RG2.3.7 and RG2.4.3, including the inverse translation convention at its lines 6000–6004.

**Repairs:**
- **GeometricSatakeAndFusion.** Its two subsections are now numbered §0.31 “Witt affine flags and components” and §0.37 “Bounded admissible affine flag loci”, under Layer GS0. The citations in Scope, the supplier contract, §5.18 *Needs* and the Layer 5 Dependencies now give those numbers.
- **ModularCurves §0G.** The contract now says exactly what that section builds: the relative Grassmannian scheme of locally free quotients of a finite locally free module, with its charts and universal quotient, whose kernel is the universal summand.
- **Mathlib vocabulary added to the Mathlib contract and §1.1 *Needs*.** `Module.Grassmannian` and `Module.Grassmannian.functor` (`Mathlib/RingTheory/Grassmannian.lean:66` and `:185`) are now cited with Mathlib's quotient-rank convention: a rank-d summand of a rank-h module is a point of `functor ℤ_p Λ (h−d)`. Representability is not at the pin and is left to ModularCurves §0G.
- **§5.1 *Needs*.** Added ReductiveGroupsPartII §RG2.3.7 (finite-field Lang vanishing). The proof route uses it, but it was missing from the *Needs* line.

**Library names checked at the pins:**
- `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean:52`)
- `WittVector.frobenius` (`Frobenius.lean:218`)
- `WittVector.frobeniusEquiv` (`Frobenius.lean:283`, needs `[PerfectRing R p]`)
- `WittVector.verschiebung` (`Verschiebung.lean:109`, additive)
- `WittVector.Isocrystal` (`Isocrystal.lean:113`)
- `DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean:77`)
- `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` (`Mathlib/RingTheory/Filtration.lean:415`, hypotheses `[IsNoetherianRing R] [Module.Finite R M] (h : I ≤ Ideal.jacobson ⊥)`)
- `IsLocalization.algebraMap_mem_map_algebraMap_iff` (`Mathlib/RingTheory/Localization/Ideal.lean:76`)
- `Module.Grassmannian` and `Module.Grassmannian.functor`
- `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (`TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean:52`)

**Duplication sweep by object** (roadmaps on main, the open heads through `roadmaps grep`, the sibling checkouts in the brief, and the board packages):
- **Zink ring Ŵ(R) and Dieudonné displays.** Not owned elsewhere. CrystallineCohomology's "Zink" hits are Langer–Zink de Rham–Witt complexes. PELModuli §M2.15 owns Zink's nilpotent W(R)-displays and the BT functor for formal groups, which are different objects; the existing Scope sentence already says so. EndoscopicTransferAndUnitaryTraceComparison is a later consumer.
- **Very-good embeddings.** No other roadmap has them. The "very good" hits elsewhere are the characteristic notion for reductive groups.
- **J_b.** Not owned by any earlier roadmap: PadicHodgeTheory, VectorBundlesAndIsocrystals, GeometricSatakeAndFusion, LanglandsParameterStacks, RelativeFarguesFontaine, DiamondsAndVStacksPartII and main have none. BunGAndNewtonStrata §1.13 and AdmissiblePairsAndPadicHodgeStructures define it, but both come later in the merge order. §2.0 here is therefore the earlier owner, and those roadmaps should cite it.
- **Perfect-ring Dieudonné theory (new boundary).** PrismaticCohomologyPartIII §6.0 comes earlier in the merge order and classifies finite locally free p-power group schemes over perfect bases (covariant). §0.2 here classifies p-divisible groups (contravariant). These are different objects but the same circle of ideas. No removal was made. Instead:
  - a Scope bullet draws the boundary;
  - a supplier section "From TauCetiRoadmap.PrismaticCohomologyPartIII" states the contract;
  - §0.2 gains an API bullet identifying D(H)/pⁿ with that roadmap's covariant module of H*[pⁿ], and a computed Check;
  - §0.2 *Needs* and the Layer 0 Dependencies cite §6.0.
- **Ordinary and canonical lifts (new boundary).** AbelianSchemesAndArithmeticModuli §A4.10 owns Serre–Tate coordinates and the canonical lift (q=1). A Scope bullet now says that Layer 6's tensor-adapted ordinary lift, for empty tensors and ordinary H₀, is the split extension.
- **No removal was needed.** No target restates a supplier declaration.

**Scope edits:**
- **Later design-stage roadmap no longer named.** The sentence naming LubinTateFormalModulesAndQuasiCanonicalLifts and its "LT.0–LT.6 layers" is replaced by "Lubin–Tate formal modules, local reciprocity through them and quasi-canonical lifts are not constructed here." That roadmap is now at merge-order line 327, after this one at 122. It exists only as a board design (not on main, not an open pull request), so the citation could not be resolved.
- **Process sentence dropped.** "This distinction also fixes ownership when a declaration uses a crystalline namespace" was removed from Scope.

## Accepted review: non-blocking notes

- **F01 and F02 (page locators): already applied in the package.** deJong95 Proposition 7.3.6 is at pp.89–90, and KZ25 §3.4.1 is at pp.25–26.
- **F03 applied.** §3.4 is now pointwise and for r factors: the product is good, and very good at (x₁,…,x_r) when each factor is very good at x_i. The route cites KPZ26's proof of Lemma 5.3.9 (KPZ26 lines 2449–2453: c=⊕c_i, projection idempotents horizontal by Lemma 5.3.2). §3.2 is added to *Needs*, and three Checks are added.
- **F04 applied with a verified locator.** The inner-form clause of §2.0 now cites Kisin17, (1.2.12), p.14 (Kisin17 line 648), which says: "the inclusion Jb→G identifies Jb with Mb over L, and Jb is an inner form of Mb". RZ96 was not read, so it is not cited for this. §2.0 now says k=F̄_p (as Conventions fix for Layer 2), because over k=𝔽_p the functor is the ordinary centralizer and the inner-form claim fails. A new Check shows this.

## Other fixes made during the upstream read

Each fix, with the reason a mathematician would flag the old text:

1. **§2.0 API.** The one-sentence API ("identifies identity, multiplication, …") became six bullets, each a stated fact. They cover subgroup, functoriality, σ-conjugacy transport g↦h⁻¹gh : J_b≅J_(h⁻¹bσ(h)), tensor automorphisms, inner form, and J_b(ℚ_p)⊂M(K₀) (KZ25 line 1188). A new Check is b=[[0,1],[p,0]]: J_b(ℚ_p)=D^× (quaternion division algebra), whereas the naive centralizer over ℚ_p is ℚ_p(√p)^×.
2. **§4.2 counterexample was imprecise.** A dilatation of GL₂ is not a closed subgroup of GL₂ over ℤ_p, so it cannot be "cut out by tensors" on L=ℤ_p⊕ℤ_p(1). The text now realizes it as a closed subgroup of GL(Λ′) for a Γ_K-stable lattice in a tensor construction of V. Being flat with reductive generic fibre, it is a tensor fixer there (the fixer lemma invoked in KP18 §4.1.7, p.184, KP18 line 2582; the KP18 reference entry now lists §4.1.7). The text also records κ_G=0 on the image and the reduction diag(1,ζ), ζ≠1, outside the identity component.
3. **§1.1 tangent space was garbled.** "Hom_k(Fil¹,M₀,k/Fil¹)" became "Hom_k(Fil¹,(M₀⊗k)/Fil¹)", with Fil¹ the residual Hodge subspace of dimension d.
4. **Instruction sentences replaced by statements or computed Checks**, in §§0.9, 0.13, 2.5, 3.5, 3.15, 4.4, 4.11 and 6.5:
   - §0.9 ("Verify the comparison for …") became three Checks plus a sentence excluding the nonstrict §2.5 comparison.
   - §0.13 ("Check Q_p/Z_p …") became a statement that the comparison is of functors, plus three Checks: the étale and multiplicative Dieudonné displays with Φ, Φ₁ and M₁, and a projection going to an inclusion.
   - §2.5 ("Check both rank-one filtrations …") became three Checks: the Fil¹=0 and full cases computed, and φ(E([π])) ↦ σ(E(0)) = p·unit under reduction, so it is not a unit.
   - §3.5 now states that E⊂E° and that smoothness of the closure is a hypothesis.
   - §3.15: the redundant "State the inverse indexing …" was removed; its Checks already do this.
   - §4.4 ("Check the Cartier-dual Tate twist …") became two Checks: L(μ_{p∞})=ℤ_p(−1) with Frobenius p, and L(ℚ_p/ℤ_p)=ℤ_p.
   - §4.11 ("List precisely where …") now says where each input is used and names the two Mathlib lemmas.
   - §6.5 ("verify that the lift …") became three Checks: p acts as an isogeny of height 2 with D(q_p)=p; contravariance gives q_(gh)=q_h∘q_g; off-diagonal elements are not in J_b for b=diag(p,1).
5. **§0.2 API.** The instruction "Recover the perfect-field base theorem, permit disconnected …, export β" became four API bullets and three Checks.
6. **Process wording.** "(uncertified locator-only reference)" in §5.3 and the RZ96 reference entry became a plain citation, "as applied in Kisin17, proof of Theorem 2.2.3, p.32 (Kisin17 line 1455)". "line locators refer to the numbered legal-source extractions recorded by sources.toml" became "a locator of the form `<key> line N` refers to the line-numbered text extraction of the edition listed under that key", since sources.toml is not part of the roadmap folder. "with the ramification silently removed" became "with the ramification of E ignored".
7. **Scope pin paragraph.** It now records the Grassmannian functor and Tau Ceti's finite locally free commutative group schemes as present, and p-divisible groups as absent.

## Adversarial mathematics pass

One row per statement, convention or definition. Values are computed. Rows marked "verified at locator" also had the source text read at the cited lines in the cached extractions.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: contravariant normalization | ℚ_p/ℤ_p, μ_{p∞} | F=σ is bijective mod p ⇒ Fil¹=ker F̄=0, dim 0. F=pσ≡0 ⇒ Fil¹=D, dim 1 | consistent with §§0.11, 5.9 | none |
| Conventions: D(H*)=D(H)∨(−1) | H=μ_{p∞} | D∨ has φ=p⁻¹σ; the twist (−1) multiplies by p, giving σ = D(ℚ_p/ℤ_p) | holds | none |
| Conventions: L=Hom(T_pH,ℤ_p)=T_p(H*)(−1) | μ_{p∞} | Hom(ℤ_p(1),ℤ_p)=ℤ_p(−1)=T_p(ℚ_p/ℤ_p)(−1) | holds | none |
| Conventions: μ₀, υ₀ for GL₂ | F=diag(p,1)σ | Fil¹=ke₁; Hodge μ=diag(z,1), μ₀=diag(z⁻¹,1), υ₀=diag(z,1), p^{υ₀}=diag(p,1) | holds | none |
| Conventions: first-order quotients | ramified p=aπ_E² | R=O_E: O_E/(m²+p)=O_E/π_E²; O_E/(m²+π_E)=k | holds | none |
| Conventions: right action order | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | gh=[[2,1],[1,1]]=(gh)ᵗ; hg=[[1,1],[1,2]]; D(q_h∘q_g)=D(q_g)D(q_h)=gh | holds | none |
| Mathlib contract: contraction | I=(p) in ℤ₃[[T]] | B/I=𝔽₃[[T]] is 3-torsion; I·B[1/3]=B[1/3], whose contraction is B≠I | negative control holds | none |
| Mathlib contract: Grassmannian convention | h=2, d=1 | the rank-1 summand Ke₁ has quotient of rank 1 = h−d, a point of `functor … 1` | holds | added |
| 0.1 Zink ring | R=k; R=k[ε]; R=W(k) | Ŵ(k)=W(k), Î=VW=pW. All-ε vector: coordinates not eventually 0 in a discrete topology ⇒ excluded. W(k) admits no char-p section k→R | Checks hold | none |
| 0.2 perfect-ring Dieudonné | μ_{p∞}, ℚ_p/ℤ_p, 𝔽_p×𝔽_p, p=2 | D(μ)=(W,pσ,σ⁻¹), mod pⁿ F=p·Frob = M_cov(ℤ/pⁿ) of PrismaticCohomologyPartIII; D(ℚ_p/ℤ_p)=(W,σ,pσ⁻¹) = M_cov(μ_pⁿ) mod pⁿ; ranks (1,0) on a disconnected R | holds at every p | API + Checks + new compatibility |
| 0.3 p-frame | W(k)[[u]], I=(p) | φ₁(pu)=φ(u)=uᵖ; D_k: φ₁(Vx)=x; a unit multiplier u≠1 on φ₁ is not strict | holds | none |
| 0.4 log coordinates | p=3, B=𝔽₃[x,y]/(x³,y³) | Witt S₁(x,y)=(x³+y³−(x+y)³)/3=−x²y−xy²≠0, while [x+y] has second coordinate 0. A PD structure with γ_{≥3}(x)=γ_{≥3}(y)=0 exists as the tensor product of the PD structures on 𝔽₃[x]/(x³) and 𝔽₃[y]/(y³) (γ₃(x+y)=x²y/2+xy²/2) | Teichmüller is not additive | none |
| 0.5 height-one shtuka | 𝔽_p with F=p and F=1; 𝔽₂ with F=4 | V=1 and V=p; F=4 would need V=1/2∉ℤ₂, and 2M⊄4M. V♯=β⁻¹∘p exists iff pM⊂β(σ*M), with uniqueness by injectivity of β | holds | none |
| 0.6 normal pair | d=0, d=h; M=S², M₁=Se₁⊕Ie₂ | M₁=IM; M₁=M; the map e₁↦e₂ sends e₁∈M₁ outside M₁ when 1∉I | holds | none |
| 0.7 relative frame | 𝔽₃[x]/(x⁴), 𝔽₃[x]/(x³) | x³=6γ₃(x) would have to be 0, but x³≠0, so there is no PD structure; in 𝔽₃[x]/(x³), γ₁γ₂=x³/2=0=3γ₃ and γ₂²=0=6γ₄ | holds | none |
| 0.8 tilde module | composite of block maps | lower-left φ₁(C′A+D′C)=φ₁(C′)φ(A)+φ(D′)φ₁(C); upper-left uses φ(I)=pφ₁(I) | holds (also checked by the review) | none |
| 0.9 strict base change | R→R/m²; R→R/m³→R/m²; identity; §2.5 map | both sides free of rank h; the cocycle composes; the identity gives the identity; §2.5 is not a strict p-frame map | holds | instructions → Checks |
| 0.10 comparison j | d=0, d=h, S=W(k)→k | j=p, j=1; image(j)=φ*L⊕pφ*T=image(φ*M₁) because φ(I)S=pS; j⊗k=0 with source k≠0 | holds | none |
| 0.11 display | ℚ_p/ℤ_p, μ_{p∞}, ordinary of height 2 | Φ=σ with M₁=pM; Φ=pσ with M₁=M; ranks 2 and 1 | holds | none |
| 0.12 base change of displays | identity; R→R/m²; R/m³→R/m² | Ψ is preserved; the tilde module stays free; the cocycle holds | holds | none |
| 0.13 displays ↔ p-divisible groups | ℚ_p/ℤ_p, μ_{p∞}, the projection from μ⊕ℚ_p/ℤ_p | Φ₁(a)=V⁻¹(a) with V⁻¹(Î)=Ŵ generating; Φ=pφ, Φ₁=φ, Φ₁(ax)=φ₁(a)Φ(x); D(proj) = inclusion of the second summand | holds | instruction → Checks |
| 1.1 universal filtration pair | h=1; (h,d)=(2,1) | d(h−d)=0 ⇒ O_F; 1 ⇒ O_F[[t]]; tangent space Hom(Fil¹,(M₀⊗k)/Fil¹) of dimension d(h−d) | holds | formula repaired |
| 1.2 enlarged-ideal factorization | I=I′; three-ideal chain | identity; transitivity | holds | none |
| 1.3 canonical c | Z=Vε; constant pair; p-killed quotient | c=1+εE₂₁; c=1; diag(1,p) kills e₂ mod p | holds (KPZ26 lines 2221–2238 read by the review) | none |
| 1.4 rational Witt section | constant display; A=O_K | constant embedding; the deformation filtration is retained | holds | none |
| 1.5 constancy | c=1+εE₂₁ | Ψ=Ψ₀(1−εE₂₁): Ψc=Ψ₀(1−ε²E₂₁²)=Ψ₀ | holds | none |
| 1.6 lifted tensors preserved | empty tensors | trivially true; uniqueness of the φ-equivariant section | holds | none |
| 1.7 crystalline deformation | k[ε]→k with trivial PD | the Hodge lift is the only datum; GM | holds | none |
| 1.8 universal display | (h,d)=(2,1) | R_GL=O_F[[t]], tangent dimension 1 | holds | none |
| 2.0 J_b | G_m, b=p; diag(p,1); [[0,1],[p,0]]; rank 0; u·T·u⁻¹ | ℚ_p^×⊋ℤ_p^×; (ℚ_p^×)²=M_b; D^× versus the naive ℚ_p(√p)^×; trivial; entrywise σ fails | holds for k=F̄_p, fails over k=𝔽_p | k stated; locator; API; Check |
| 2.1 tensor datum | empty family; E₁₁; Σeᵢ⊗eᵢ*; disconnected fixer | GL(Λ); the diagonal torus; the identity is fixed, while treating Λ∨ covariantly gives g²=4≠1 for g=2 | holds | none |
| 2.2 filtration lattice | Fil¹=0, full, split | F=E𝔖; 𝔖; 𝔖e₁⊕E𝔖e₂ (basis lifts because 𝔖 is local) | holds | none |
| 2.3 completed orbit ring | GL₂ with (2,1); a ramified E | R_G=R_E=O_Ĕ[[t]] with generic line e₁+te₂; base O_Ĕ | holds | none |
| 2.4 integral tensors on F | torus cut by E₁₁ | F splits along e₁,e₂; E₁₁ preserves F; the torsor is trivial | holds | none |
| 2.5 BK–tilde comparison | d=0, d=1 rank one | φ(E([π]))Ŵ=pŴ=image(j=p); 𝔖 ↦ Ŵ with j=1; reduction σ(E(0)) = p·unit | holds | instruction → Checks |
| 2.6 integral tilde tensors | f=p and f=1 in Ŵ(O_K); x/p on ℤ_p[[x]] at x=π, π²=p | p/p=1; 1/p∉O_K; v_K(π/p)=1−2=−1 | holds | none |
| 2.7 horizontality | c=1+εE₂₁, t=E₁₁; torus over F̄₃ | ct₀c⁻¹=E₁₁+εE₂₁; diag(2,1)E₂₁diag(1/2,1)=(1/2)E₂₁ with 1/2≡2 mod 3 | holds | none |
| 2.8 parahoric display | GL₂, R=k[ε] | F kills kε since εᵖ=0, so pŴ(m)=0; Ψ₀ ≠ Ψ₀(1+[ε]E₂₁), with equal rationalizations | holds | none |
| 2.9 adapted deformation | torus E₁₁, line e₁+te₂ | E₁₁(e₁+te₂)=e₁∉K(e₁+te₂) for t≠0; t=0 is adapted | holds | none |
| 2.10 very good | E₁₁, swap w | wE₁₁w⁻¹=E₂₂; the marked transport is preserved; an unmarked swap is rejected | holds | none |
| 2.11 independence | invariant t | KPZ26 Lemma 5.2.3 (read by the review) | holds | none |
| 2.12 unramified detection | O=W(𝔽_{p²}) | faithful flatness of W(𝔽_{p²}) over ℤ_p descends equality | holds | none |
| 2.13 chain embedding | r=0, 1; pΛᵢ | tot=0 is not faithful; a single lattice; h=p is central, an isomorphism | holds | none |
| 3.1 curve lattice | split GL₂ curve | pM⊂M_{S,1}⊂M with M_{S,1}=S e₁⊕pS e₂ | holds | none |
| 3.2 endomorphisms horizontal | E₁₁ for the torus | c=id fixes E₁₁ (§2.7) | holds | none |
| 3.3 curvewise horizontality | (p,ε)-frame | φ(ε)=φ₁(ε)=0; rational ⇒ integral by p-torsion-freeness | holds (review read KPZ26 2461–2501) | none |
| 3.4 products | G_m² on ℤ₃²; r=1 | one-point local model, c=1⊕1; the hypothesis itself | pointwise, as KPZ26's proof gives | review F03 applied, Checks |
| 3.5 neutral closure | E vs E° | G°-classes are finer ⇒ E⊂E° | holds | instruction → statement |
| 3.6 summand descent | Λ=ℤ₃⊕ℤ₃ with G_m weight 1 | the projection idempotent splits c | holds | none |
| 3.7 curve-spanned tangent | node xy=0 | curves have derivatives in ke₁∪ke₂ (k[[u]] is a domain) yet span k² | holds | none |
| 3.8 centralizer criterion | diagonal torus = GL₂∩C(E₁₁) | 1+εE₂₁ fails by εE₂₁ | holds | none |
| 3.9 arithmetic curves | O_K-points of P¹ | Eisenstein scaling φ(E([π]))=p·unit is kept nonstrict | holds | none |
| 3.10 isomorphic copies | n=0,1,2; weights ±1 | GL(0)={1} with kernel G_m; diag(a,a); a≠a⁻¹ at a=2 | holds | none |
| 3.11 wild type A | D=K, m=1 | Res G_m with O_K-chain; endomorphism criterion | holds | none |
| 3.12 segment independence | Λ ↦ pΛ | central intertwiner | holds | none |
| 3.13 nonexceptional | G=G′=GL_n, empty tensors | every good embedding is very good | holds | none |
| 3.14 Dᴴ PEL | quaternion i²=−1, j²=3 over ℚ₃; V₀=K² | (−1,3)₃=−1 ⇒ division; Trd values −2,−2 versus 2,−2; ψ=±1 | holds | none |
| 3.15 type-A enlargement | D=K, m=1; Λᵢ=p⁻ⁱℤ_p e; (1,diag(1,2)) | ψ=fw−vg gives ∓1; p⁻ⁱ(ℤ_pe⊕ℤ_pf) has dual of index −i; multipliers 1,2 | holds | redundant instruction removed |
| 3.16 perfect pairing | L=ℚ_p(π), δ=2π, M=πO_Le⊕O_Lf | (M^Γ)^∨=ℤ_pe⊕p⁻¹ℤ_pf=(δ⁻¹M^♯)^Γ, whereas (M^♯)^Γ=ℤ_pe⊕ℤ_pf | holds | none |
| 3.17 Dᴴ enlargement | (1,g), g noncentral in SO(h); diag(a,b) | h(v,gw) is not a scalar multiple of h(v,w); similitude ab | holds | none |
| 4.1 punctured exactness | rank-one lattices | exact on U; nothing claimed at the closed point | holds | none |
| 4.2 trivial Kottwitz invariant | G_m; the GL₂ dilatation along {a^{p−1}=b^{p−1}} | det χ_cyc∈ℤ_p^× gives κ=0; mod p diag(1,ζ)∈H(𝔽_p)∖H°; the dilatation is not closed in GL₂ | the first claim holds and the counterexample was imprecise | counterexample made precise, locator |
| 4.3 tensor frames | G_m on ℤ_p(1) | a rank-one frame exists | holds | none |
| 4.4 integral comparison | μ_{p∞}, ℚ_p/ℤ_p | D_cris(ℚ_p(−1)) has φ=p = D(μ); ℤ_p has φ=1 | holds | instruction → Checks |
| 4.5 Hodge filtration lift | ordinary GL₂ | μ_y=diag(z,1) defined over K₀ | holds | none |
| 4.6 rigid section | c=1+εE₂₁ | Ψ=Ψ₀(1−εE₂₁) | holds | none |
| 4.7 Hoff compatibility | empty tensors | trivially compatible | holds | none |
| 4.8 tangent lifting | GL₂ with (2,1) | lifts ξ_ε form an O_K-module of rank 1 | holds | none |
| 4.9 interpolation | (0,π_K), (0,1) | f=a+((b−a)/π_K)T realizes (a,b) with a≡b; (0,1) is not in O_K×_kO_K | holds | none |
| 4.10 adaptedness criteria | GL₂ with (2,1); torus | dim G/(G∩P)=1, and 0 for the torus | holds | none |
| 4.11 factorization | ∩ₙ(Tⁿ) in O_K[[T]] | Tᵐ∈(Tⁿ) iff m≥n | holds | instruction → statement |
| 4.12 versal theorem | empty tensors; torus | R_G=R_E; t=0 | holds | none |
| 4.13 parahoric display | GL₂ with (2,1); k[ε] | O_Ĕ[[t]] with t↦0; ε is invisible to O_K-points | holds | none |
| 4.14 étale recognition | empty tensors | reduces to the generic type | holds | none |
| 5.1 hyperspecial frames | k finite, connected G | Lang vanishing (RG2.3.7) | holds | *Needs* repaired |
| 5.2 relative A_cris | x=[p♭]−p; θ(p) | θ(φx)=pᵖ−p≠0; θ(p)=p ⇒ p∉Fil¹ | holds | none |
| 5.3 toral admissibility | G_m, b=p, μ_T=z⁻¹ | the average of μ_T⁻¹ is 1=ν | holds | wording |
| 5.4 hyperspecial adapted lift | μ_{p∞} | T_p(H)∨=ℤ_p(−1) | holds | none |
| 5.5 relative comparison | ℚ_p/ℤ_p, μ_{p∞}, 0, ordinary | 1; t·unit with θ(t)=0; 0≅0; diag(t,1) | holds | none |
| 5.6 double coset | GL₂, F=diag(p,1)σ | b=p^{υ₀} with h=1 | holds | none |
| 5.7 explicit lift | rank one weights 0 and 1; E(0)=ap | c=σ⁻¹(h)μ₀(E(0)/p)∈G(W); at u=0 the matrix is σ⁻¹(b); with μ₀(p) it is off by μ₀(a⁻¹) | holds | none |
| 5.8 connection integrality | rank one | g⁻¹dg has bounded denominators; σⁿ multiplies by pⁿ | holds | none |
| 5.9 framed datum | b=1, b=p | ker F̄=σ⁻¹(b⁻¹)pΛ/p: 0 and full | holds | none |
| 5.10 horizontal locus | R=W[[t]], F=(1+tE₂₁)diag(p,1) | N(0)=−E₂₁; n=−1+t^{p−1}n(tᵖ) ⇒ n=−Σt^{pʳ−1}; σ=E₁₁+hE₂₁, h=Σt^{pʳ}/pʳ, (h)=(t) | holds | none |
| 5.11 locus equality | the same example | t=0 kills dt, connection 0 | holds | none |
| 5.12 smooth adapted space | GL₂; torus | relative dimensions 1, 0 = dim G/P | holds | none |
| 5.13 étale tensors | disconnected base | one point cannot control two components | holds | none |
| 5.14 hyperspecial recognition | μ_{p∞} | dual-lattice tensors | holds | none |
| 5.15 geometric tensors | empty tensors | trivial | holds | none |
| 5.16 lattice specialization | G_m, g=p; gh with h∈ℤ_p^× | pW, valuation 1; coset unchanged | holds | none |
| 5.17 isogenous lift | G_m, b=3, μ=z^{∓1}; k=closure of 𝔽₃(t) | t_H=t_N=1 for μ=z⁻¹; t_H=−1 is excluded; K̆=K is not finite over ℚ̆₃ | holds | none |
| 5.18 Kottwitz equality | G_m, g=p | κ(g₀)=κ(g)=1 | holds | none |
| 5.19 central quotient | det: GL₂→G_m, g=diag(p,1) | valuation 1 on both sides | holds | none |
| 6.0 σ-conjugacy normalization | G_m μ=1; GL₂ (1,0); torus; trivial group | t_here¹=t_RG^{−1} with representative p, κ=1; diag(p,1); ℓ=0; Adm={1} | holds | none |
| 6.1 ordinary datum | b=diag(p,1) | σ⁻¹(b⁻¹)pW²=diag(1,p)W², reducing to ke₁ | holds | none |
| 6.2 central Hodge filtration | GL₂ ordinary | λ̃=(z,1) is central in the torus | holds | none |
| 6.3 central BK lift | E(0)=ap; E(u)=u−p | c_E=E(u)/a with c_E(0)=p; −E(u) at u=0 is p | holds | none |
| 6.4 adapted ordinary lift | empty tensors, ordinary H₀ | the split extension, i.e. the Serre–Tate canonical lift (q=1) | holds | Scope boundary added |
| 6.5 J_b action | p; g,h; diag(p,1) | [p] has height 2 and D(q_p)=p; D(q_h∘q_g)=gh; off-diagonal elements are not in J_b | holds | instruction → Checks |
| 6.6 Levi filtration | M=G | reduces to §4.12 | holds | none |
| Worked examples | Z=Vε; E=u−p; G_m with p; p=aπ_E² | c=1+εE₂₁; multipliers p,1; κ=1; O_E/π_E² versus k | consistent with the Layers | none |

## Ownership against open work

Ownership was checked against main, the open roadmap pull requests through `roadmaps grep`, the sibling checkouts listed in the brief, and the board packages (index read first). Results:
- **No earlier roadmap owns** the Zink ring, Dieudonné displays, very-good embeddings, adapted deformations or J_b.
- **J_b.** BunGAndNewtonStrata §1.13 and AdmissiblePairsAndPadicHodgeStructures define it but come later in the merge order. §2.0 here is the owner, and the maintainer may want those two roadmaps to cite it.
- **PELModuliPartII and ShimuraVarietiesPartII** (board) are consumers of this roadmap.
- **New boundaries**, both earlier owners now cited, not duplicated:
  - PrismaticCohomologyPartIII §6.0 (finite group schemes over perfect bases);
  - AbelianSchemesAndArithmeticModuli §A4.10 (Serre–Tate).
- **No declaration of `Suggested.lean`** carries another roadmap's fully qualified name; there are no declarations.

## Unresolved

- **Fourteen supplier gaps carried over.** The accepted review's fourteen conditional gaps remain as exact "What X must provide" contracts. The package added a fifteenth after the review, `perfect-residue-period-torsor-comparison` on PadicHodgeTheory §5.5. All fifteen need their suppliers to accept them.
- **Two names exist only as plans.** `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope`, cited in §5.2, are planned names in DerivedDeRhamCohomology §PD.7's README, not declarations at the pins.
- **New supply edge.** The PrismaticCohomologyPartIII §6.0 compatibility in §0.2 is new in this port. PrismaticCohomologyPartIII is earlier in the merge order, and the depcheck reports no problem.
- **RZ96 not read.** It is cited only for Proposition 1.21, in the form Kisin17 applies; no page is claimed.
- **No suspicious instructions** were found in any text read.


Pull request: #1843 (roadmap/finite-flat-groups-and-integral-padic-hodge-theory-part-ii at 95bce15)
