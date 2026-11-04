<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1277#issuecomment-6399945194 -->
Red team round 1 pass b (claude) of 3a403ad

Verdict: accepted

1. **F01** (P3) Supplier paragraph attributes this roadmap's §§6.1 and 6.3 to MetaplecticAutomorphicForms

   Location: `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:11`, the sentence "Sections 6.1 and 6.3 own the restricted tensor triality kernel and its rational theta invariance", placed inside the paragraph that begins "MetaplecticAutomorphicForms §§0.15–0.18 … own …".

   Claim: read in context the sentence cites MetaplecticAutomorphicForms §§6.1 and 6.3 as owners of the adelic triality kernel and of rational theta invariance.

   Witness: at the open head of MetaplecticAutomorphicForms (#1063), `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` §6.1 is "Theta measure conventions" and §6.3 is "Ikeda map" (Layer 6, Siegel–Weil, Rallis, see-saw and Jacobi interfaces). The objects named are this roadmap's own §6.1 (Adelic exotic tensor product) and §6.3 (Triality theta functional).

   Repair: replace the sentence by "This roadmap's §§6.1 and 6.3 own the restricted tensor triality kernel and its rational theta invariance." (The Needs lines of §§6.1 and 6.3 already cite MetaplecticAutomorphicForms §§4.1, 4.1a, 4.2–4.4 for the inputs; nothing else changes.)

2. **F02** (P3) §10.4 line locator points at the forward mention, not the statement

   Location: `README.md:1265`, "(Dor21, Proposition B.5.4, pp. 25–29; Theorem B.6.1 and Corollary B.6.2, pp. 30–33 (Dor21 line 1030).)".

   Claim: the locator Dor21 line 1030 is the proposition cited.

   Witness: Dor21 line 1030 is the sentence on p. 24 announcing that the almost-unitality statement is "formalized in Proposition B.5.4"; the proposition itself is stated at Dor21 line 1067 (p. 25), Theorem B.6.1 at line 1368 and Corollary B.6.2 at line 1372 (both p. 30). The page check of every other locator in the README passed (55 of 56 rows; see Verified sound); this is the only row whose line lies outside its cited page range.

   Repair: change "(Dor21 line 1030)" to "(Dor21 line 1067; Dor21 line 1368)".

3. **F03** (P3) §10.1 does not state the torus action on the unit 1_T under which η is equivariant

   Location: `README.md:1199`, "The torus tensor unit is 1T=S(T). There is a canonical injection η:1T→Lnorm defined for λ≠0 by (ηf)(λ,y)=|λ²y|⁻¹ f(λy,λ⁻¹)", and the third Check at `README.md:1216`.

   Claim: η is T-equivariant and injective; the Check computes "q⁻¹·q = 1 on one path and 1 on the other".

   Witness: with the stated Lnorm action, ((a,d)·ηf)(λ,y) = |a/d|·|d⁻²λ²·ady|⁻¹·f(aλy, dλ⁻¹) = |λ²y|⁻¹ f(aλy, dλ⁻¹), while η((a,d)·f)(λ,y) = |λ²y|⁻¹((a,d)·f)(λy,λ⁻¹). The two agree exactly when T acts on S(T) by ((a,d)·f)(x,y) = f(ax,dy). The README fixes no action on S(T). Under the equally natural translation action ((a,d)·f)(x,y) = f(a⁻¹x,d⁻¹y) the Check's second path at (a,d)=(π,1), (λ,y)=(1,1) evaluates ((π,1)·f)(1,1) = f(π⁻¹,1), not f(π,1) = 1, and η is not equivariant. Dor21 line 1065 only calls η "the canonical embedding" without a formula, so the README's formula is the roadmap's own and must carry its convention.

   Repair: after "The torus tensor unit is 1T=S(T)" insert ", with T acting by ((a,d)·f)(x,y) = f(ax,dy); η is T-equivariant for exactly this action". Tested on the instance above: path one gives |π/1|·(ηf)(1,π) = q⁻¹·|π|⁻¹·f(π,1) = q⁻¹·q·1 = 1 and path two gives ((π,1)·f)(1,1) = f(π,1) = 1, as the Check states.

4. **F04** (P3) The one theorem of the roadmap statable at the pins (§5.1) is neither stated in Suggested.lean nor named in its docstring

   Location: `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean:3-36` (module docstring) and `README.md:673-694` (§5.1 Idempotent coherence theorem; `README.md:7` claims ownership of it).

   Claim: the docstring says "None of these headlines is statable at the pins" and lists what each lacks; §5.1 is absent from the list and from the file.

   Witness: §5.1 is GH11 Theorem 3.1.2 (GH11 line 481): a category with a tensor bifunctor and a pentagon associator, an isomorphism θ : P⊗P ≅ P, the defect a defined by a∘θ∘(θ⊗id) = θ∘(id⊗θ)∘α (GH11 line 466–477, diagram (3.1)), and the conclusion a = id when a intertwines θ on both sides. Every carrier exists in Mathlib at the pin: `CategoryTheory.MonoidalCategory` (associator `α_`, whiskerings `◁`, `▷`) supplies the unital special case, and the unit-free datum is a structure bundling `C × C ⥤ C`, an associator and the pentagon. The Scope paragraph (`README.md:7`) says the theorem "is owned here because the categorical and monoidal roadmaps state neither its defect-intertwining hypotheses nor its conclusion", so it is a theorem of this roadmap and not a Check. The pass does not rate it a headline (it is GH11's technical lemma, not an end theorem of the Summary), hence P3 rather than P2.

   Repair (one of the two): (a) add to the docstring list, before `-/`: "* the idempotent coherence theorem of §5.1 is a lemma rather than a headline and is deliberately not stated;" or (b) state it. The unital special case elaborates against the pin as (not built on this worker; no Lake environment):

   ```lean
   /-- GH11, Theorem 3.1.2, in a Mathlib monoidal category (the unit is unused): if the
   associativity defect `a` of an idempotent `θ : P ⊗ P ≅ P` intertwines `θ` on both sides, then
   `a` is the identity, so `θ` is associative. -/
   theorem idempotent_coherence {C : Type*} [CategoryTheory.Category C]
       [CategoryTheory.MonoidalCategory C] (P : C) (θ : P ⊗ P ≅ P) (a : P ≅ P)
       (hdef : (θ.hom ▷ P) ≫ θ.hom ≫ a.hom = (α_ P P P).hom ≫ (P ◁ θ.hom) ≫ θ.hom)
       (hl : (a.hom ▷ P) ≫ θ.hom = θ.hom ≫ a.hom)
       (hr : (P ◁ a.hom) ≫ θ.hom = θ.hom ≫ a.hom) :
       a.hom = 𝟙 P := by
     sorry
   ```

   If (b) is chosen at the README's unit-free generality, bundle `tensor : C × C ⥤ C`, `assoc` and `pentagon` in a structure with a real body and state the theorem over it; a `MonoidalCategory` instance is then a Check, not the statement.

Scope of this pass: the whole of `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md` (1477 lines, 58 targets, 16 declared gaps) and `Suggested.lean` (40 lines, no declarations), read line by line; every cross-roadmap citation resolved against main or the cited open head; every Mathlib citation read at the pinned commit; every `(<source> line N)` locator and every printed page number checked against the line-numbered extractions of Dor23, Dor21, GH11 and Dor20Z; the mathematics of each target instantiated as recorded in the table under "Verified sound". Pass a was not read.

## Verified sound

Counts. Suggested.lean declarations read: 0 (the file states nothing; the `#check @name` binder comparison the brief asks for has no input, and no Lean was run: not built). README targets read: 58 of 58 (Layers 0–11), plus Conventions, Normalisation witnesses, the eight supplier-contract subsections and the 16 gap sentences. Locators verified: all 68 `(<source> line N)` locators resolve to the cited statement or, where the README says "proof", to the proof (Dor23 48, Dor21 14, GH11 2, Dor20Z 2 after the three-source citations at README lines 1056 and 1201 were checked by hand); printed-page check: 56 rows, 55 agree, 1 disagrees (R02). Checks tested with values: 71 (every Check of Layers 0–11 whose content is a computation or a source statement; those that only restate a definition were read and are listed under Not verifiable where they could not be computed). Sibling and library citations resolved: 54 — SmoothRepresentationsOfLocalGroups at the head of #785 (SR.0.1–SR.0.4, SR.0d.1–SR.0d.2, SR.1.1–SR.1.3, SR.2.1–SR.2.3, SR.3.2, SR.3a.1 with targets *jacquet-subrepresentation* and *admissibility-of-irreducibles*, SR.4.1, SR.5.1 with *mirabolic-derivatives* and *derivative-exactness*, SR.5.2 with *segment-representations*; SR.2.1 states compact induction from a closed subgroup, which both E = c-Ind_{SL₂(O)} 1 and Iunit = c-Ind_U θ need; its field scope is any complete discretely valued field with finite residue field, so equal characteristic is covered); AutomorphicLFunctionsAndLocalFactors at the head of #924 (AL.0 "Local Schwartz–Bruhat spaces and finite Fourier levels", AL.1, AL.2 "Godement–Jacquet standard functions" whose matrix zeta integral is stated for any local field, AL.3 "Curve additive analysis" and "Function-field local factors, multiplicity one and converse theorem", "Representation prerequisites, Restricted tensor realizations"; AL.0 works over completions of number fields only, which is exactly what gap:equal-characteristic-fourier supplies); GL2AutomorphicRepresentationsAndTransfer at the head of #931 (R16.2.1 over characteristic-zero local fields with the four-class classification and the I(χν^{1/2},χν^{−1/2}) orientation the README repeats; R16.2.8 supercuspidal Kirillov; both extensions are the two declared gaps); MetaplecticAutomorphicForms at the head of #1063 (§§0.15–0.18, 1.1, 1.3–1.4, 2.4b–2.7 with "local field characteristic different from two", 4.1, 4.1a with char F ≠ 2 function fields, 4.2–4.4); FunctionFieldArithmetic at the head of #1474 (§§0.1–0.3, 2.1–2.3, 4.8–4.10, 5.8 with the geometric-subgroup congruence and the error term in each degree, 6.1–6.4); AlgebraicVectorBundles on main (L0B, L0C); Completed/RestrictedProducts (Scope and ownership, Layer 1, Change of family and double cosets); EnhancedDerivedSheaves on main (E5:presentability.2, target "Tensor products of presentable categories and module base change"); Mathlib at 6b7abb3 (`Matrix.det_fin_two` Determinant/Basic.lean:809, `Matrix.trace` Trace.lean:43, `Matrix.trace_transpose` :71, `Matrix.trace_mul_comm` :156, `Rep.coinvariantsTensor` Coinvariants.lean:410 as a noncomputable abbrev with no smoothness, `CategoryTheory.SymmetricCategory` Braided/Basic.lean:366, `CategoryTheory.CommMon` CommMon_.lean:26, `CategoryTheory.Mod` Mod.lean:227). Ownership: `roadmaps grep` over the 363 open roadmap pull requests and main for triality kernel, exotic monoidal, abstractly automorphic, unramified spin structure, theta characteristic, Whittaker unit and degeneracy-free returns no other owner (the single hit, QSeriesPartitionsAndMockModularForms §6.1 "unary theta characteristics", is a different object). The board's design-stage packages AutomorphicLFunctionsAndLocalFactorsPartII and FunctionFieldArithmeticPartII, which precede this roadmap in the merge order, contain none of the objects the FFA and AL gaps request.

Gaps: the 16 slugs in `design/plan.json` are the 16 contracts under "Exact supplier contracts", each with a named supplier and section that exists at the supplier's head; none asks for what the supplier, Mathlib or Tau Ceti already provides (checked by object: no balanced tensor, smooth Tor, firm enrichment, transpose-invariant central distributions, SL₂(O) compact-projective computation, equal-characteristic Fourier, S(F)-over-S(F×) freeness, compact-data global convergence, odd-characteristic GL₂ classification, all-generic Kirillov, theta characteristic, ordinary linear categorical tensor, determinant pushforward, SL₂(𝔸) generation, Eisenstein-constituent automorphicity or fixed-central-character multiplicity one exists at the cited heads or pins). Each `needs` sentence is a single statement with its hypotheses; gap:sl2-rational-unipotent-generation was checked to be true (SL₂(O_v) is generated by elementary matrices of uniformly bounded length, so SL₂(𝔸) = ⟨U(𝔸), wU(𝔸)w⁻¹⟩ with w ∈ GL₂(F)).

Settled finding: F01 of the round-3 repair report (characteristic-zero classification supplier) is now gap:odd-equal-characteristic-gl2-classification; not re-raised.

Dependency check, run on this head:

```text
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ExoticMonoidalStructuresAndAbstractAutomorphicity is line 288 of `merge-order/ORDER.txt`; its suppliers are at lines 18 (EnhancedDerivedSheaves), 26 (SmoothRepresentationsOfLocalGroups), 94 (AutomorphicLFunctionsAndLocalFactors), 104 (GL2AutomorphicRepresentationsAndTransfer), 165 (MetaplecticAutomorphicForms), 168 (FunctionFieldArithmetic); AlgebraicVectorBundles and Completed/RestrictedProducts are on main. Policy: `git diff --stat origin/main...HEAD` touches only files under `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/`; no `lemma`, no `set_option`, no pull-request number or process narrative in README or Suggested.lean; every target has a locator; no computational algorithm. Suggested.lean has the single `import Mathlib`, one module docstring in the required form, the namespace and no declaration, so no padding and no sorry'd data.

The adversarial pass, one row per statement (values computed on each side; "source" means the statement was compared word for word with the cited passage at the locator):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions L, A, Z, witnesses | B on E₀₀/E₁₁ and E₀₁/E₁₀; w²; ν=1, h=diag(1,−π); norm-twisted Weyl square; 𝔽₃((t)) with the coefficient-of-t⁻¹ character | B=1, −1; w²=−I; h⁻¹u(c)h=u(−π^ν c)∈K iff c∈π⁻¹O so hKh⁻¹∩U=u(π⁻¹O); \|a/d\|·\|d/a\|=1; e(t⁻²)=1 with t⁻²∉O, so ker e ⊋ π^{−ν}O and ν=0 | sound; README's "lattice of triviality, not the whole kernel" is right and the source's Remark 3.47 is not (Source issues) | — |
| Supplier-contract witnesses | SR averaging on C₂; AL transform on ℤ/3; FFA ω of order 2k; AVB on ℙ¹; MA w² | ((x+y)/2,(x+y)/2); δ₁↦3^{−1/2}(1,ζ⁻¹,ζ⁻²), square δ₂; π⁻ᵏO self-dual; O(−1)⊗O(−1)=O(−2)=Ω, O⊗O=O≠Ω; reflection Ψ(−m,y) | sound | — |
| 0.1 Determinant pairing | E₀₀/E₁₁, E₀₁/E₁₀, m=E₀₁, (1,2,3,4)·(5,6,7,8), 𝔽₂, ℤ[ε]/(ε²), zero ring | au+dr−bt−cs=8+20−14−18=−4, positive convention 60; B(m,m)=2 det m, B(E₀₁,E₀₁)=0; Gram antidiagonal (1,−1,−1,1), reversal permutation (14)(23) even, det=+1; over 𝔽₂ B(E₀₀,E₁₁)=1, B(m,m)=0 | sound; source Dor23 line 491 gives the same pairing | — |
| 0.2 Triality symplectic action | scalars aI,bI,cI; (13)²; (π,π⁻¹,1), (π,1,1) | (abc)²=1; E₀₁↦E₁₀↦E₀₁; form multiplier det(g₁g₃)·det g₂ = 1 and π | sound; Constructions 2.7, 2.9 | — |
| 0.3 Rigidified lift | identity triple; (13); σ³ | uniqueness from abelianisation ℤ/2 generated by (13) (Dor23 line 631) | sound; Prop. 2.12 | — |
| 0.4 Triality kernel | g₂=u(b), diag(a,1), [[a,b],[0,1]], w; w²; (g₁,1,g₃) | from (2.4) with (2.6)–(2.8): diag(y,1)u(b)diag(y⁻¹,1)=u(yb) gives e(yb det m); diag(y,1)w·diag(y⁻¹,1)=w·diag(y⁻¹,y) gives \|y\|⁻²·\|y\|⁴=\|y\|² in front of ∫Ψ(n,y)e(−yB(m,n))dn; w² gives \|y\|⁴·\|y\|⁻⁴Ψ(−m,y)=(−I)·Ψ, dropping both factors leaves \|y\|⁻⁴; outer action Ψ(g₁⁻¹mg₃⁻ᵀ, y det(g₁g₃ᵀ)) as Example 2.14 | sound | — |
| 0.5 Open kernel | (I₂,y), (diag(π,1),y) under y↦y det m; Ψ=1_{M₂(O)}1_{O×} over 𝔽₃((t)) at (0,1),(I₂,1),(t⁻¹I₂,1); trivial mirabolic line | (I₂,y), (diag(π,1),πy); values 1,1,0; Φ⁻=0 since 1−θ(u)∈ℂ× | sound; Lemma 2.19 | — |
| 1.1 Threefold balance | z=1, z=0; e_c through two factors | id, 0; e_c²=e_c | sound; Lemma 2.17 | — |
| 1.2 Singular comparison | V=1_G; spectral sequence total degree 1 | 1⊗_G Q⊗_G 1 = S(F×)_{F×}=ℂ≠0 so the hypothesis is needed; E²₁,₀=Tor₁(Ṽ,0)=0; SL₂ acts trivially on Q, hence on Tor₁(V,Q), so E²₀,₁=(Ṽ_{SL₂}⊗Tor₁)_{F×}=0 | sound given gap:smooth-tor-residual-action; Lemma 2.20 | — |
| 1.3 Open integral | Ψ=Φ(g)f(y det g); ℂχ vs ℂχ⊕ℂχ | μ=(∫βΦ d×g)·f(y); End dimensions 1 and 4 | sound; eq. (2.2) | — |
| 1.4 Kirillov extension | 𝔽₃((t)): ν(t), ν⁻¹(t); I(ν^{1/2},ν^{−1/2}); I(1,1) | 1/3 and 3; St sub and χ∘det quotient, the orientation R16.2.1 states; ratio 1∉{ν,ν⁻¹} | sound; Theorem 2.2 | — |
| 1.5 Local zeta comparison | exponents on a uniformiser shell | Prop. 2.5: ZJL \|y\|^{s−1/2}, ZGJ \|det\|^{s+1/2}, f-factor \|y\|^{s+1/2}; the shift is the \|det\| twist of Remark 2.4; shell value \|π\|^{s+1/2} | sound | — |
| 2.1 Transpose right action | diag(π,1); u(b); double transpose | ρ(diag(π,1)) vs ρ(diag(π⁻¹,1)); u(b)ᵀe₁=e₁+be₂; no determinant factor | sound; (3.2) | — |
| 2.2 Exotic product | M=0; swap twice; 1⊛1 | 0; identity on classes; Φ⁻(1⊛1)=1⊗_G 1=ℂ≠0 | sound; Def. 3.2 | — |
| 2.3 Weak data | Vect with unitor cλ, c=2 | flip on ℂ⊗ℂ is the identity so cλ_I∘s=cλ_I; identity functor needs unit comparison 2 (2λ vs λ) | sound; Defs 3.7–3.8 | — |
| 2.4 Whittaker unit | u with θ(u)≠1; relation element; W_f(g)=∫θ(u)⁻¹f(ug)du | W(ug)=θ(u)W(g); θW−θW=0; formula φ(f⊗Ψ)(g)=∫f(h)(wh⁻ᵀ·Ψ)(g⁻¹,−det g)d×h is (3.3) verbatim | sound | — |
| 2.5 Trace and symmetry | M=Iunit | Φ⁻(Iunit⊛N)=IRL(Iunit)⊗_G N=Φ⁻N (Remark 3.17) | sound | — |
| 3.1 Degeneracy-free | 1_G; St; 0→1_G→E→St→0 and its reverse; 1⊛1 | Φ⁻(1_G)=0; Ext¹(St,1)≠0; Hom(E,1)=0 because a nonzero map is iso on the sub and splits E, while the reversed extension has Hom(E′,1)≠0; 1⊛1 is a quotient of E_c⊗_{Z_c}ℂ_x=i(1)′ (St sub, 1 quotient, the one generated by its K-fixed vector) with Φ⁻(1⊛1)=ℂ, so 1⊛1≅i(1)′ ⊇ St | sound; Warning 3.25 with the source's column convention (quotient on top, Dor23 line 1335) | — |
| 3.2 Bernstein modules | two blocks; Z=⊕_ℕℂ with (1,1,…) | e₁+e₂ unit; (1,1,…)∈∏ not ⊕ | sound | — |
| 3.3 Unit and centre | f=id; z=0; ∏ vs ⊕ | Claim 3.32 gives ⊕Z_c ≅ underlined End(Iunit); End(⊕_c Iunit,c)=∏_c End(Iunit,c) | sound | — |
| 3.4 Enhanced adjunction | N=Z; one-block N; ⊕N_n | F(Z)=Iunit; e_dF(N)=0 for d≠c; finite support | sound; Claims 3.30–3.35 | — |
| 3.5 Degeneracy-free equivalence | F(0), F(Z); St | 0, Iunit; Ext¹(St,1)≠0 excludes St | sound; Theorem 3.26 | — |
| 4.1 Spherical generator | ramified χ; Hom(E,V) | χ(det k)=1 on SL₂(O); diag(u,1) with χ(u)≠1 kills K-fixed vectors; Hom_G(E_c,V_c)=Hom_K(χ_c∘det,V_c)=V_c^{SL₂(O)}, so ⊕_c gives V^{SL₂(O)} and ∏_c the rough Hom; 1_{SL₂(O)}∉E since SL₂(O) is not open | sound; Remarks 3.38–3.41 | — |
| 4.2 Counit and comultiplication | ν=0, ν=1; 𝔽₃((t)) | (1,δ₁), (q⁻¹,δ_{π⁻¹}); M₂(O) is self-dual for e(−π^{−ν}B) exactly at y=π^{−ν}, which fixes the mass | sound; Constructions 3.44–3.45 | — |
| 4.3 Centre equivalence | unit Zsph | maps to E, not Iunit (Theorem 3.42) | sound | — |
| 4.4 Joint generation | (Z,0)⊗(0,Zsph); ε | (Z⊗_Z 0, Z⊗_Z Zsph ⊕ 0 ⊕ 0)=(0,Zsph); generation stated at Dor23 line 959 | sound; Corollary 3.51 | — |
| 5.1 Idempotent coherence | line with θ=c·xy; zero object; Cantor pairing | a=1 with a²=a³=1; a=id; θ(θ(0,0),1)=2, θ(0,θ(0,1))=5, a(0)=0, a(2)=5, θ(a(0),1)=2≠a(θ(0,1))=5 | sound; GH11 (3.1)–(3.2) | R04 |
| 5.2 Exotic associator | pentagon on E | a² vs a³ | sound; Theorem 3.52 | — |
| 5.3 Frobenius trace | Vect | Remark 3.54, perfect pairing (line 1740) | sound | — |
| 5.4 Generic idempotent algebras | supercuspidal; St; χ∘det | St≅St⊛St (Dor21 lines 2510–2512); Hom(Iunit,χ∘det)=0 | sound; Example 3.55 | — |
| 5.5 Spherical invariants | A=Iunit; ⊕ℂ all-ones | Remarks 3.56–3.57 | sound | — |
| 6.1 Adelic product | reference vector; extra unramified place | y_v=1_{M₂(O_v)}1_{O_v×} (Dor23 line 1996); Claim 4.3 for almost all v | sound | R01 (ownership sentence only) |
| 6.2 Automorphic functions | scalar i; constant function | bilinear; domain Γ\G (the source's p. 45 display integrates over GL₂(𝔸): Source issues) | sound | — |
| 6.3 Theta functional | (E₀₁,1)↔(E₁₀,1); rational q,b,ξ | a+b; \|q\|=1, e(bq det ξ)=1; Def. 4.5, Prop. 4.9 (its printed integrals over M₂(F): Source issues) | sound | — |
| 6.4 Theta multiplication | — | Construction 4.10 | sound | — |
| 6.5 Global zeta | ±1 patches; rational scalar a | signed 0, absolute 2; \|a\|=1; Remark 4.11 formula verbatim | sound | — |
| 7.1 Poincaré map | u∈U(F); U(F)\Γ | e(b)=1 for rational b; Construction 4.15 sum | sound | — |
| 7.2 Petersson identity | q det ξ=1 | Prop. 4.16, diagram (4.1) | sound | — |
| 7.3 Ideal | nonnegative compact indicator; I_Eis element | fibre integral >0; p=0 with CT≠0 | sound; Prop. 4.19 | — |
| 7.4 Algebra | id_I | Corollaries 4.21–4.22 | sound | — |
| 7.5 Ambient module | — | Corollaries 4.25–4.26 | sound | — |
| 8.1 Module objects | I; S, S̃ | Remark 4.30 criterion | sound | — |
| 8.2 Fully faithful realization | limits; colimits | action on lim V_i from I⊛lim→I⊛V_i→V_i; colimits by cocontinuity; Theorem A.1.1(2), Warning A.1.2 | sound; Prop. 4.32 | — |
| 8.3 Matrix Schwartz | m=0; m=I₂ | Example 4.35: S⊛S(A\G), A={diag(a,1)} | sound | — |
| 9.1 Spin structure | ℙ¹; dt at ∞; s↦as; odd order | dual of π^aO under e_ω with ord ω=n is π^{−a−n}O, self-dual iff a=−n/2; ord_∞(dt)=−2 gives Λ_∞=πO_∞; a²ω gives a⁻¹Λ | sound; Remark A.3 | — |
| 9.2 Global coalgebra | unramified place | 1_{M₂(O_v)}δ₁ (Def. A.4, Construction A.5) | sound | — |
| 9.3 Spin convolution | e(1−e) | 0; ⋃_J I^J over J=SL₂(O_𝔸)·K(N) equals I^{SL₂(O_𝔸)} | sound; Construction A.7 | — |
| 9.4 Section independence | g=diag(π,1) | \|det\|⁻²=q², then q⁻² at g⁻ᵀ, ι²=id | sound; Remark A.8 | — |
| 10.1 Normalization module | (a,d)=(π,1), (λ,y)=(1,1) | path one q⁻¹·q·1=1, path two 1; unweighted q⁻¹ vs 1; general identity ((a,d)·ηf)(λ,y)=\|λ²y\|⁻¹f(aλy,dλ⁻¹) | sound for the action f(ax,dy) only | R03 |
| 10.2 Normalized induction | adjunction direction; q=3 | r̂⊣î; no √3 (Remark B.4.2) | sound | — |
| 10.3 Rank-one multiplication | diag(0,λ); (π,1) | Claim B.3.5 coinvariants Uᵀ×U×Uᵀ with twist ((1,−1),(0,0),(1,−1)) verbatim | sound | — |
| 10.4 Lax induction | i(\|a/d\|) | Example B.5.1 (St kernel, trivial quotient) | sound | R02 (locator) |
| 10.5 Intertwiner | — | Theorem B.7.8 (1)–(4) | sound | — |
| 11.1 Torus category | rational t with ρ(t)≠id | Def. C.3.1 | sound | — |
| 11.2 Automorphic adjunction | — | C.2.1–C.2.4, C.3.3, C.3.7 | sound | — |
| 11.3 Weyl lifting | four-term identity; degrees; conjugation; 𝔽₃ stabiliser | S(uz,v)S(1,z)=D(uz,vz)+D(uz²,v)+D(v,uz²)+D(vz,uz)=D(z,z)S(u,v)+S(uz²,v); degrees N,N,2N and N,N−m,2N−m; h=\|a/d\|^{−1/2}f gives q^{−1/2} at both pairs, +1/2 gives q^{1/2}, q^{−3/2}; {±1}² has 4 elements | sound; repairs the source's Chebotarev step (Source issues) | — |
| 11.4 Components | anomalous quotient of i_aut(1_T) | Warning A.1.19; Prop. C.4.1; C_cusp and C_Eis as in lines 2323–2326, 2365–2367 | sound | — |
| 11.5 Decomposition | e(1−e) | 0; Theorem C.4.12 | sound | — |
| 11.6 Irreducible comparison | St-modules | St⊛(1 over St)=0, St⊛(St over 1)=St (Lemma C.5.2) | sound | — |
| 11.7 Finite length | length n | ≤2n; Theorem C.5.4, Remark C.5.5 | sound | — |

## Not verifiable

- Suggested.lean: nothing to elaborate; no Lake environment on this worker, so no `lake env lean` was run (not built).
- §2.5 "Transpose is the identity on the double θ-coinvariants of Y" (Claim 3.18) and §3.4's roughening comparison (Lemma 3.35): source statements read, the orbit computations not redone.
- §4.3 "Δ is an isomorphism" and the twisted-spherical-centre identification (Claim 3.49): depend on the declared gap; the source proof was read, not recomputed.
- §9.2 lattice transport of ε_v and Δ_v at ramified places: a construction target by the README's own statement; no formula exists in the source to compare.
- Arm67 is uncertified (paywalled) and cited by locator only; the existence of a rational theta characteristic is a declared gap.
- The Codex pass a was not read.

## Source issues

- **Misprint** in Dor23 at Remark 3.47, printed page 33: the source says any h with hKh⁻¹ ∩ U equal to the kernel of θ works; it should be the conductor lattice u(π^{−ν(e)}O), since hKh⁻¹ ∩ U is always u of a fractional ideal while ker θ need not be one (𝔽₃((t)), e(t⁻²)=1); affects nothing.
- **Misprint** in Dor23 at proof of Proposition 4.9, printed page 43: the source says the Poisson integrals run over M₂(F); it should be M₂(𝔸), as the summation over M₂(F)×F× and the self-dual adelic measure require; affects nothing.
- **Misprint** in Dor23 at the Petersson pairing displayed before Proposition 4.16, printed page 45: the source says the pairing integrates over GL₂(𝔸); it should be over GL₂(F)\GL₂(𝔸), as the coinvariant description that follows it states; affects nothing.
- **Misprint** in Dor23 at Warning 3.25, printed page 25: the source says "the trivial representation St"; it should say the Steinberg representation St, the column notation and line 1335 fixing the orientation; affects nothing.
- **Gap** in Dor21 at Remark C.4.5, printed page 49: the source says choose a place of degree one; such a place need not exist on a curve over a finite field; it should use an idele of degree one, which exists; affects the proof (of Proposition C.4.6).
- **Gap** in Dor21 at proof of Lemma C.4.9, printed page 52: the source says Chebotarev gives a uniformiser in the ray class of xy⁻¹; the ray class group is infinite and classes of nonpositive degree contain no place; it should pass through a finite quotient and the large-degree convolution identity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3a403ad", "job": "RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~1b", "model": "fable", "worker": "fable-rt45"} -->
