<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1119#issuecomment-6485465744 -->
Red team round 2 pass b (claude) of 3cacbea

Verdict: needs_changes

1. **F01** (P2) §1.3's central-character condition is EGS15's formula in the wrong determinant convention

   **Location.** `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:434` ("C_Z′ a Serre subcategory of the category of continuous representations of K on finitely generated O-modules with central character lifting (ε det ρ̄)|_I ∘ Art").

   **Claim.** The objects of the fixed-determinant coefficient category have central character lifting (ε det ρ̄)|_I ∘ Art, and §1.4's functor (domain: central character `ψ^{−1}`|`I_{F_v}`) is a fixed-determinant patching functor in this sense.

   **Witness.** EGS15 line 1588 writes (ε det ρ_i|_I)∘Art because its lifts have determinant ψ_σ ε⁻¹ (EGS15 line 1594). This roadmap's lifts of ρ̄ = r̄_v^∨ have determinant εψ_v⁻¹ (Conventions; §1.2), and BHHMS23 lines 4409–4410 give the weights of W(r̄_v^∨) central character (ω⁻¹ det r̄_v^∨)|_I = ψ⁻¹|_I. At p=29 take g ∈ I with ω(g)=2 and det r̄_v^∨(g)=1: the displayed formula demands 2 (for ρ̄ = r̄_v^∨, and also for ρ̄ = r̄_v, where ε det r̄_v = ψ̄), while every modular weight and §1.4's domain give 2⁻¹ = 15. So, as written, W(r̄_v^∨) lies outside C_Z′ and §1.4's functor is not a §1.3 functor; §1.3 and §§1.2, 1.4 use opposite conventions.

   **Repair.** In §1.3 replace "with central character lifting (ε det ρ̄)|_I ∘ Art" by "with central character lifting `(ε^{−1} det ρ̄)|_I ∘ Art`, the finite-order part of the determinant `εψ^{−1}` of the lifts of ρ̄ in this roadmap's convention (EGS15 Definition 6.1.3 writes (ε det ρ̄)|_I because its lifts have determinant ψ_σ ε⁻¹); for ρ̄ = r̄_v^∨ this is `ψ_v^{−1}`|`I_{F_v}`, the central character of every weight of W(r̄_v^∨) (BHHMS23 lines 4409–4410)". Add the Check: "At p=29 with ω(g)=2 and det r̄_v^∨(g)=1, the required value is 2⁻¹=15; the EGS formula applied to r̄_v^∨ or to r̄_v gives 2, which excludes every modular weight." Tested on that instance: 15 = ψ̄⁻¹(g) matches the socle weights of π (§0.5, central character ψ⁻¹).

2. **F02** (P3) §0.2 uses BDJ's symbol b without defining it, and "its subset J" should read "some J"

   **Location.** `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:178` ("enlarged to all of H¹ when `χ₁χ₂^{−1}` is cyclotomic, b = (p, …, p) and J is everything" and "lies in the subspace L_α … attached by BDJ10 §3.2 to the weight and its subset J").

   **Claim.** The exceptional enlargement is indexed by "b = (p,…,p)"; the extension-class condition is attached to one subset J of the weight.

   **Witness.** BDJ10 lines 1321–1323 index weights by (a⃗, b⃗) with V_{a,b} = ⊗ det^{a} Sym^{b−1}, so b⃗ = (ℓ,…,ℓ) is s_j = p−1 for all j in this roadmap's σ_{t,s} (where 0 ≤ s_j ≤ p−1, so "s = (p,…,p)" is out of range); and BDJ10 line 1263 defines W(ρ) by c_ρ ∈ L_α for some α = (V, J), several J being possible for one weight when χ₁|_I = χ₂|_I.

   **Repair.** Replace "b = (p, …, p)" by "s = (p−1, …, p−1), that is, the weight `Sym^{p−1}` at every embedding (BDJ10's b⃗ = (p,…,p))", and "attached by BDJ10 §3.2 to the weight and its subset J" by "attached by BDJ10 §3.2 to the weight and some subset J realizing it in the semisimple recipe". Tested on the très ramifiée Check: ρ an extension of 1 by ω, weight Sym^{p−1}, s = p−1, J = {0}: L_α = H¹, so Sym^{p−1} ∈ W(ρ) as the Check states.

Head reviewed: 3cacbea, the board checkout of the pull request's branch (nothing fetched). Files read in full: `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md` (1177 lines, every line) and `packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean` (39 lines, no declarations). Also read: the round-1 reports of both passes, the round-1 repair report, `design/plan.json` (the `gaps` list), `sources.toml`, the repository rules, and the supplier roadmaps named below.

## Round-1 findings at this head

Each earlier finding is verified against the repaired text; the quoted witness is the repaired passage.

| Finding | Status | Witness at 3cacbea |
|---|---|---|
| a.F01 (P1) indefinite augmentation loses the rank-two factor | repaired | §1.6 statement: "C ≅ `Hom_{W(𝔽)}(Ĉ(V^v)_{r̄}^{ψ^{−1}}, W(𝔽))`, the W(𝔽)-dual of the completed Galois multiplicity module of §5.6, and after a choice of basis … ≅ `C^{⊕2}`"; §5.6 defines Ĉ and the bullet "Ĥ¹ ≅ Ĉ `⊗_{T̂}` ρ_T̂ … ≅ `Ĉ^{⊕2}`"; §5.7 proof applies faithful flatness to `C^{⊕2}` (indefinite) and C (definite). Recomputed: σ-multiplicity r in Ĉ, 2r in H¹ (2 and 4 at r=2). The new definition of Ĉ through `Hom_{T_n[G]}(ρ_n, H¹(W/pⁿ))` agrees with the patched augmentation: for ρ_n free of rank 2 over the Artinian T_n with residually absolutely irreducible reduction and N of finite length, `Hom_{T_n[G]}(ρ_n, N ⊗ ρ_n) = N` (induction on length, the quotient step `Hom(ρ_n, r̄) = 𝔽`), so `Hom(ρ_n, H¹(O)_𝔪/pⁿ) = M/pⁿ`. No new error. |
| a.F02 (P2) cyclotomic twist must change the residual problem | repaired | §1.2 API: "Write `R∞(r̄_v^∨;εψ_v^{−1})` = R∞ and `R∞(r̄_v^∨(1);ε³ψ_v^{−1})` … Twisting identifies the (λ,τ)-quotient of the first with the (λ+(1,1),τ)-quotient of the second"; same notation in §4.8 ("the patched ring is `R∞(r̄_v^∨(1);ε³ψ_v^{−1})` of §1.2"); Check at p=29, ω(g)=2 recomputed: both residual determinants multiplied by 4. Matches BHHMS23 line 5074. |
| a.F03 (P1) weight theorem lacks prescribed-component lifts | repaired | README "What PotentialAutomorphyInfrastructurePartII must provide (gap:quaternionic-component-realization)" with p>2, modular r̄, the ζ_p and A₅ hypotheses, S, types, components, conclusion (GK14 Lemma 5.2.5, line 1253 verified); plan.json `gaps` carries the same slug and supplier; §0.6 route: gap lift → quaternionic transfer (GK14 Lemma 5.3.6, line 1400 verified) → full component support (Lemma 5.4.3(1)–(2), line 1475 verified) → multiplicity identity. PL.5 at the supplier's design head is the CM/unitary setting (PL.5/ordinary-lifts-prescribed-local assumes "F an imaginary CM field"), so the GL₂ totally real form is genuinely requested: gap minimal. Node Check recomputed: e(A/(x))=1, e(A)=2. |
| a.F04 (P3) dual-differential Check cannot see the sign | repaired | Conventions Check: "C⁻¹=C⁰=O and d⁻¹=p … differential sends the basis vector 1 to −p, which differs from +p … its cokernel is O/p for either sign". Recomputed: for f of degree 0, d(f) = −f∘d_C, d(1) = −p; the dual sits in degrees 0,1. Correct. |
| a.F05 (P2) lower bound acts at a fixed level by a group that need not act | repaired | §5.5 route: "first form the smooth tower representation Π … the original π is `Π^{∏V_w}` … `Π^{∏K₁,w}` ≠ 0 … embeds in `Π^{∏V_w}` = π". Check recomputed: (1+pE₂₁)(1+pE₁₂)(1−pE₂₁) = 1+pE₁₂+p²(E₂₂−E₁₁)−p³E₂₁, not ≡ 1+apE₁₂ mod p³, so V is not normal. Correct. |
| a.F06 (P2) partial glued lattices belong to MP.8 | repaired | Scope bullet imports `L_j`, the recursion and `L_{f−1} = R` from MP.8/projective-lattice; §4.1: "The following lattices are those of ModpRepresentationsOfGL2OverLocalFields MP.8/projective-lattice specialized to σ_v, not constructed again here"; MP.8/projective-lattice at the supplier's design head states `projectiveLattice.partial`: L_j = L_{j−1} ×_{P_σ} R′_{2,j} and L_{f−1} ≅ R (3-deep hypothesis, weaker than the 8-deep use). Ranks d, 4d, 7d recomputed. |
| a.F07 (P3) completed-Hecke locality Check | repaired | §5.6 first Check: "Localizing at 𝔪=0×𝔽 inverts e₁, so e₂=e₂e₁e₁⁻¹=0 and e₁ becomes 1; thus T_𝔪≅𝔽". Recomputed: e₁e₂ = 0 and e₁ a unit force e₂ = 0. Correct. |
| b.F01 (P3) §8.4 should be §§8.3–8.4 | repaired | Supplier contract "§§1.1–1.3 and 8.3–8.4 for fixed-exponent smooth colimits, the quaternionic finite-level coefficient input and the arithmetic tower action"; §0.5 route and Needs, Layer 0 Dependencies all read "CompletedCohomologyPartII §§8.3–8.4"; scope line "8.3–8.15". At the supplier's open head §8.3 is "Hilbert finite-level coefficient input" (the quaternionic specialization) and §8.4 "Arithmetic tower realisation comparisons". |

No repair introduced a new error; the two new objects (Ĉ in §5.6, the tower representation Π in §5.5) are checked in the table below.

## Verified sound

Counts: 0 `Suggested.lean` declarations (the file states no theorem; the `#check @name` audit had nothing to elaborate and no Lean was run, as the brief directs; the single `import Mathlib`, the docstring form, the `namespace`/`end` pair and the absence of `set_option`, `lemma`, `#eval`, `True` placeholders and sorry'd data were checked by reading); 40 README targets read (Conventions block, §§0.1–0.7, 1.1–1.6, 2.1–2.6, 3.1–3.4, 4.1–4.9, 5.1–5.7) and 5 declared gaps; 103 source line regions opened in the cached extractions (BHHMS23 46, EGS15 21, GN22 10, GK14 10, BDJ10 4, DL21 3, CEGGPS16 2, HAM75, STACKS, BRE14, LMS22, LE19 one each), every one found at the cited line with the cited content, including the introduction theorems 1.1, 1.2, 1.3, 1.8, 1.9, 1.10 at the cited printed pages 3, 4, 4, 8, 10, 10; 63 README Checks recomputed (table below); 135 supplier citations resolved at the heads the merge order points to (HilbertModularVarietiesAndShimuraCurves 23 section headers, CompletedCohomologyPartII 17, DeformationAndDerivedPatchingAlgebra 20, NoncommutativeAndEquivariantIwasawa 7, LocalGaloisDeformationRings 8, GlobalGaloisDeformations 8, PotentialAutomorphyInfrastructurePartII 3 node slugs at its board design head, SmoothRepresentationsOfLocalGroups 4, FiniteFlatGroupsAndIntegralPadicHodgeTheory 2, AutomorphicGaloisRepresentations 2, GL2AutomorphicRepresentationsAndTransfer 2, GL2ModularityLifting 1, LocallyAnalyticDistributionsPartII 1 at its board design head, PadicMeasuresIwasawaAlgebras 8 on main, Chebotarev Layer 10 on main, ModpRepresentationsOfGL2OverLocalFields 18 node anchors at its board design head, LocalGaloisDeformationRingsPartII 8 node targets and the two T.0 titles at its board design head), all present with the cited content.

Pins: the manifest now pins Mathlib f6090c7 and Tau Ceti 358314d (the round-1 passes recorded earlier pins). At these pins the cited declarations exist with the cited files: `LinearMap.eqLocus` (EqLocus.lean line 45), `LinearMap.eqLocus_eq_ker_sub` (line 102), `Submodule.spanFinrank` (SpanRank.lean, ℕ-valued, 0 without a finite generating set), `Module.annihilator` (Ideal/Maps.lean line 867), `Module.support` (Support.lean), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean), `IsRegularLocalRing` (RegularLocalRing/Defs.lean line 51), `CategoryTheory.Abelian.Ext` (Ext/Basic.lean line 118), `WittVector`, `Matrix.GeneralLinearGroup` (line 42), `Representation` (line 48); `TauCeti.completedGroupAlgebra` (CompletedGroupAlgebra/Basic.lean line 145) and `TauCeti.IsCompactModule.completedSMul` (Module.lean).

Dependency check (the brief's command, exit 0, complete output):

```text
depcheck: 187 roadmaps, 1226 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every cited supplier is earlier in the merge order (PotentialAutomorphyInfrastructurePartII at position 90, HilbertModularVarietiesAndShimuraCurves 177, CompletedCohomologyPartII 207, ModpRepresentationsOfGL2OverLocalFields 306, LocalGaloisDeformationRingsPartII 307) or on main (PadicMeasuresIwasawaAlgebras, Chebotarev). The citation resolver's scratch output lists no cross-roadmap citation and no Lean name found nowhere. Policy: the package diff touches only its own folder; no pull-request number, no process narrative, no `lemma` of the roadmap's own (the only match is "the snake lemma"), no `set_option`, no machine path.

Declared gaps: the five slugs (`tame-types`, `single-type-rings`, `breuil-mezard-pbt`, `power-series-cancellation`, `quaternionic-component-realization`) carry the same slug, supplier and section in `design/plan.json` and in the README's supplier contracts; each `needs` sentence states its hypotheses; none asks for what a supplier provides (LocalGaloisDeformationRingsPartII T.6/single-presentation at its design head is for semisimple ρ̄ with no fixed determinant; PL.5 at its design head is the CM setting; DeformationAndDerivedPatchingAlgebra §§3.1–3.4 hold depth and regular-sequence results, not Hamann cancellation, whose source HAM75 Theorem 4 (line 101) is for quasi-local rings).

Ownership: the objects of this roadmap (BHHMS global patching functor at a place above p, big patched module with GL₂(F_v)-action, Gee–Newton noncommutative miracle flatness, Lemmas 8.2.1 and 8.3.8, the quaternionic weight theorem adapter) were searched by object in the roadmap service index (main and open heads) and in the board packages; no second owner was found. The brief's named sibling checkouts were not opened individually beyond this index; ownership against them was checked through the index only.

Headline theorems and padding: the headlines are §§5.1–5.5, 5.7 and the structural results §§0.6, 3.2, 3.4, 4.8, 4.9; none is statable at the pins (each needs the quaternionic multiplicity spaces, the patching functor, the big patched module, the Diamond modules or the canonical dimension on the completed group algebra, none of which exists at Mathlib f6090c7 or Tau Ceti 358314d) and the module docstring names each with what it lacks. §§2.2–2.3 are BHHMS23's auxiliary Lemmas 8.2.1 and 8.3.8, not headlines. With no declaration there is no padding.

Adversarial pass, one row per statement:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: Hecke polynomial, Frobenius, twists, duals, opposite algebra | q=5, roots 2,3 in 𝔽₂₉; χ(z)=2; diag(2,1); C⁻¹=C⁰=O; u,v unipotents | S=25, T=9, S⁻¹T=7·9=5, qS⁻¹=6, X²−5X+6; arithmetic roots 15,10; 2⁻²=22, 2²=4; N∘det⁻¹(diag(2,1))=15; d(1)=−p; uv=((2,1),(1,1))≠vu=((1,1),(1,2)) | sound |
| 0.1 generic datum | p=23,29; f=1; r₀=11; p=3; F=ℚ definite D={ℓ,∞} | boxes {12,13,14} and {13,14,15}; 12≤p−15 ⇒ p≥27 ⇒ p≥29; BHHMS23 line 218 "p>23", line 4370 bounds verbatim in content; EGS reducible range at p=3 is {0}, excluded (EGS15 lines 452–453, 469); ψ trivial on U_w∩O_{F_w}^× for w∈S∖S_p follows from (60): the centre acts on H¹(X_V) through ψ̄⁻¹∘Art (Chebotarev on ϖ_w ↦ S_w), trivially on V∩(𝔸^∞)^× | sound |
| 0.2 BDJ weight set | f=1, ω^{s+1}⊕1 with p=5,s=1; s=p−3; ω_2^{s+1}⊕ω_2^{p(s+1)}; très ramifiée; split ω⊕1; f=2 | {Sym¹,det²Sym¹}; {Sym²,det³,det³Sym⁴} (s′=0 and s′=4 both solve t+s′+1≡0 mod 4); J={0}: ω_2^{s+1}⊕ω_2^{p(s+1)} and the second weight via ω_2^{s(p+1)+p−s}=ω_2^{p(s+1)}; crystalline weights {0,p} vs none at {0,1}; {0,1},{0,p},{1,p−1} ⇒ 3 weights; 2²=4 | sound except S02 (notation) |
| 0.2 GK14 duality adapter | ρ=ω⊕1, ω(g)=2 | GK14 line 245 HT(ε)=−1, line 248 type (a₁+1,a₂): trivial type has det ≡ ω⁻¹: 15 ≠ 2; ρ^∨ lifts to ε⁻¹⊕1 | sound |
| 0.2 types | ω¹³⊕1 at p=29 | τ₀ reduction dimension 13+15=28; scalar 1, principal series 30; EGS15 Props 3.5.1, 3.5.2, 10.1.11 at lines 687, 767, 3324 | sound |
| 0.3 forms, 𝔪, θ_w | σ=0; C₂₉-cover; q=5 roots 2,3 | S(0)=M(0)=0; augmentation of the norm vector 29=0; θ_w²=ψ_w⁻¹c_σ⁻¹ is EGS15 line 1710 with ψ replaced by ψ⁻¹ (BHHMS23 line 4445); parent evaluation on r̄⊗ω: 17+21=9, 6·9=25; on r̄^∨⊗ω⁻¹: 12+18=1, 6·(12·18=13)=20 | sound |
| 0.3 geometric realization adapter | eigenvalues α,β=2,3 | r̄^∨⊗ω⁻¹ has q/α=17, q/β=21; parent gives T=T_𝔪, S=S_𝔪; dual ⊗ε⁻¹ returns 5/17=2, 5/21=3, polynomial X²−S⁻¹TX+qS⁻¹ | sound |
| 0.4 projectivity | C₂, S₃, C₂₉ over 𝔽₂₉; W/pⁿ | trivial summand dims 1 vs 2, 6; regular C₂₉ dim 29 with invariants 1; (W/pⁿ)[G] self-injective so finite projective dimension ⇒ projective; BHHMS23 line 5376 | sound |
| 0.5 weighted π | r₀=14 and 13 at p=29; χ(z)=2; f=1 | r̄_v^∨|I=ω¹³⊕1 ⇒ {Sym¹²,det¹³Sym¹⁴}; ω¹⁵⊕1 ⇒ {det¹⁵Sym¹²,Sym¹⁴}; central factors 22 vs 4; dim 1 ≠ 0; BHHMS23 lines 4528–4545 | sound |
| 0.5 dévissage | shrunken levels | Hom(−,H¹_𝔪) exact over U^v/V^v (injective by §0.4), so graded pieces are the full weighted π's; "subrepresentations of" is weaker but true | sound |
| 0.6 weight theorem | multiplicities (1,1),(1,0); p=5; node | products 1, 0; GK14 Theorem B lines 125–130, Cor 5.4.5 line 1573, Cor 5.5.4 line 1605 with "compatible with D"; e(A/(x))=1<e(A)=2 | sound |
| 0.7 doubling | q=2, ratio 3 and 2; cubic F | (2−3)(2−10)=8, ratio 2 gives 0; excluded ratios 2, 15; (q−α/β)(q−β/α)=(q+1)²−(α+β)² with αβ=q; BHHMS23 lines 5389–5398 | sound |
| 1.1 R∞, S∞ | (f,|S|,q)=(1,2,1),(2,1,2) | 3|S∖S_p|+Σ(3+f_w)+3+3f+q−[F:ℚ]+|S|−1 = 4|S|+q−1+2f: 10 and 9; S∞ 8 and 5; differences 2f = 2, 4; BHHMS23 line 4438; two-weight ring special fibre dim 4, cotangent 5 vs 4, 4 | sound |
| 1.2 type quotients | λ=(1,0),(2,0),(2,−1); f=1,|S|=2,q=1; ω(g)=2 | sums 1, 2, 1; 1+(3+f)+4(|S|−1)+q−f=9=dim S∞; det(ρ⊗ε)=ε³ψ⁻¹; residual determinant ×4 on both sides; BHHMS23 line 5074 | sound |
| 1.3 abstract functor | zero functor; A², A⊕A/(t), A/(p)⊕A; p=29, ω(g)=2, det r̄_v^∨(g)=1 | rank 0 allowed; depth 1<2; p·(1,0)≠0; EGS15 lines 1588–1637 verbatim in content; central character required 15, displayed formula gives 2 | S01 |
| 1.4 arithmetic functor | σ=0; 𝔽[ε]/ε²; two surviving away weights | M∞(0)=0; ε·1≠0 on A, 0 on A/(ε); fibre r₁+r₂=2 vs 1; BHHMS23 lines 4406–4411 (one weight, central character ψ⁻¹) | sound |
| 1.5 fibre | r=2 | 𝔽²; M∞(σ)/𝔪∞ = (Hom(ρ,S)[𝔪])^∨ = Hom_G(r̄,S)^∨ since 𝔪-torsion maps from ρ factor through r̄; BHHMS23 lines 4462–4470, 4546–4549 | sound |
| 1.6 big module, C, C^{⊕2} | f=1,2; r=2; indefinite vs definite | dim K₁/Z₁=3f; Hom_O(𝔽,O)=0, Hom_O(𝔽,E/O)=𝔽; multiplicities r, 2r; BHHMS23 lines 5213–5223, 5250–5253, 5436–5444; DL21 lines 3164–3167, 3200–3228 (duals of Galois multiplicity spaces) | sound |
| 2.1 Iwasawa CM | Λ=O⟦T⟧: Λ, Λ/(T), Λ/ϖ, Λ⊕Λ/ϖ, 0 | (j,depth,δ)=(0,2,2),(1,1,1),(1,1,1); Ext in degrees 0,1; grade ∞, δ=−∞; GN22 Prop A.4 lines 1985–1993, Lemma A.8 line 2031 (K torsion-free pro-p) | sound |
| 2.2 extension freeness | 𝔽₂[ε]/ε², N=(ε); ℤ/4; k²; M=0 | Ann(M/N)/Ann(M)=(ε)≅𝔽₂=A/Ann(N), M≅A; split k² needs 2 generators; snake lemma: ker(A^r→M/N)=I^r, I^r↠N, I^r≅N forces bijectivity by Stacks 05G8 (line 1544); BHHMS23 lines 4566–4571 | sound |
| 2.3 fibre-product freeness | k⟦x,y⟧/(xy); k⟦t⟧; identities; zero maps k→k | (x)+(y)=Ann k, (x)∩(y)=0, pullback A; A² rank 2, 0+0≠(t); diagonal; zero maps give k² with 0=0+0, so surjectivity is needed; basis change lifts a unit matrix over local R; BHHMS23 lines 5054–5065 | sound |
| 2.4 grade under variables | A=O⟦T,x⟧: A/(x), A; Ω=k⟦T⟧; O=ℤ₃[π]/(π²−3); ℤ₂ | j 1/0 with δ 2/2; j 0/0 with δ 3→2; log_n n=1; O/(π)=𝔽₃ vs O/(3) nonreduced; grades 1/0 at p=2; GN22 lines 2092–2126 | sound |
| 2.5 CM transfer | K=1: O→O⟦y⟧, M=O; K=ℤ_p: M=B, B/(y) | depths 1=1; 2<3 vs 2=2; GN22 Lemma A.28 "Let M be a B-module" line 2230, Cor A.29 line 2235 | sound |
| 2.6 miracle flatness | A=O⟦T,x⟧: A/(T), A/(ϖ) | grades 1=1, M≅O⟦x⟧ flat; 1≠0, ϖ·1=0; GN22 Prop A.30 lines 2242–2250 (M≠0), purity lines 2266–2272, ideal-separation lines 2285–2289 | sound |
| 3.1 finite-length MCM | k⟦x,y⟧/(x); σ=0 | depth=dim support=1<2; MCM faithful ⇒ Ass(A)⊆Ass(M)⊆minimal primes; BHHMS23 line 4591 | sound |
| 3.2 common rank, I_𝒥 | O⟦x,y⟧/(xy−p) and two copies; singleton/both/none; F(∅,{1}); two-variable node and {{1,2},∅} | ranks (1,1),(2,2); ideals (x), 0, A; (x)/0≅A/(y); (x₁)+(x₂)=(x₁,x₂) vs (x₁,x₂y₁), x₂ survives at x₁=y₁=y₂=0; EGS15 Example 10.1.3(3) line 3236, Lemmas 10.1.6, 10.1.8 lines 3246, 3282; BHHMS23 Prop 8.2.3 lines 4607–4612 verbatim in content | sound |
| 3.3 locally algebraic lattices | multiplicities 1,2 at r=2; det²⁸ at p=29, z=30 | ranks 2, 4; 30⁵⁶≡1+56·29=1625≡784 (mod 841) ≠ 1 = ψ⁻¹(30); BHHMS23 lines 4662–4668, 4706–4712 | sound |
| 3.4 projective lift | r=2 | Hom(P_σ,D₀²)=2, Hom(P_σ,D₀²/soc)=0; P̃[1/p]=⊕_τ σ(τ) by Brauer reciprocity (generic σ has multiplicity 1 in each σ̄(τ), 0 in Steinberg twists and characters); BHHMS23 line 4716; LMS22 Lemma 4.5 line 631; BRE14 Lemme 9.2 line 2754 (hypothesis ψ|_{U∩(𝔸^f)^×}=1, met by (60)) | sound |
| 4.1 glued lattices | f=1,2; j=−1,0,1; raw pullback | ranks d, 4d, 7d; (1+3(j+1))d at j=f−1 equals (3f+1)d; raw cosocle keeps three simple quotients; R′/pR dim d vs R′/pR′ dim 3d; BHHMS23 lines 4797–4800, 4953–4960; MP.8 statement at its design head | sound |
| 4.2 Loewy length | Q=σ | [Q/soc Q:σ]=0 fails (b); BHHMS23 Lemma 8.3.1 lines 4753–4761 (a)–(d) verbatim in content | sound |
| 4.3 minimal generators | r=2 | residual dimension 2 forces ≥2, induction gives ≤2; BHHMS23 line 4814; LE19 Lemma 4.5 line 779 | sound |
| 4.4 adjoint-type lattices | A=O³, L=Oe₁⊕pOe₂⊕pOe₃; labels −2..3 | dims 2, 3, 1 with 2+1=3; Hom_O(O/p,O)=0 vs identity O/p→O/p; V(α_j)=(Sym²⊗det⁻¹)^{(j)} has highest weight (1,−1), scalar 1; BHHMS23 Prop 8.3.3 lines 4843–4852 (τ°[1/p] irreducible, cosocle σ_v, uniqueness up to homothety), Lemma 8.3.5 | sound |
| 4.5 freeness of M∞(R′_{2,j}) | r=2 | S²→M iso after inverting p; p-torsion-free S² ⇒ kernel 0; BHHMS23 Thm 8.3.4 lines 4921–4925 | sound |
| 4.6 third-radical comparison | k[t]/t⁴→k[t]/t³ | rad³ quotients both dim 3; BHHMS23 lines 4983–4990 | sound |
| 4.7 generation equivalence | f=1, r=2 | baseline 2, not f=1; BHHMS23 line 5037 reads f (source issue below) | sound |
| 4.8 glued-lattice freeness | f=2, j=1; diag(2,1); p=29, N=12, a₂=2 | three profiles; rank 7d vs 16d with the double-adjoint profile; negative twist 15 vs 2; 2/a₂=1, element 29·(1+O(29³)) (BHHMS23 lines 1916–1922); support: L_j[1/p]=P̃[1/p]⊕⊕_{i≤j}V(α_i)⊗P̃[1/p] with M∞(V(α_i)⊗σ(τ)°) supported on (2,−1)_i, so Ann = ∩ over parallel and single-raised profiles only (BHHMS23 lines 5121–5125 compute exactly this), refuting the rectangular set at lines 5072–5073 | sound; see Source issues |
| 4.9 first-order multiplicity | r=2; k⟦t⟧→k | fibre map k²→k² has kernel 0; kernel (t)≠0 before the fibre; BHHMS23 lines 5145–5159 | sound; see Source issues |
| 5.1 weighted GK dimension | f=1,2 | 2≥3−δ, δ≤1 ⇒ 1; 4≥6−δ, δ≤2 ⇒ 2; j_B(M∞)=(dim R∞+3f)−(dim S∞+3f)=2f (BHHMS23 lines 5226–5238); MP.7/local-gk-bound hypotheses (i)–(iii) as cited at its design head; MP.4 defines dim over an open uniform H ⊆ GL₂(F) as dim H − j_H; with Z₁ pro-p acting trivially on π, j_{K₁}(π^∨)=f+j_{K₁/Z₁}(π^∨) by §2.4(1), so 4f−j_{K₁} = 3f−j_{K₁/Z₁}, agreeing with BHHMS23 lines 2366–2371 | sound |
| 5.2 π[𝔪²_{K₁}] | r=2 | each constituent twice; m_σ = dim M∞(σ)/(p,x) ≥ dim M∞(σ)/𝔪∞ = r; K₁-invariants D₀²; BHHMS23 Thm 8.4.2 lines 5246–5249 verbatim in content | sound |
| 5.3 faithful flatness | f=1,2; Frac(O) | grades 2=2, 4=4; Frac(O)/p=0; §2.5 hypotheses met (finite over A and B); BHHMS23 line 5283 | sound |
| 5.4 Banach lifts | compact 𝔽 and O; ∏_I O′ | Hom_O(𝔽,E)=0; Hom_O(O,E)=E with unit ball O; continuous dual of ∏_I O′ is c₀(I,O′), reduction ⊕_I 𝔽′ = Hom^{cont}(∏O′,𝔽′); BHHMS23 lines 5292–5299; CEGGPS16 lines 1369–1379 (ker ȳ open) | sound |
| 5.5 unweighted GK dimension | regular C₂₉-module; non-normal V | invariants 1 in 29; conjugate ≡1+pE₁₂+p²(E₂₂−E₁₁) mod p³ ∉ V; pullback H¹_V→H¹_{V′} injective through the normal core; BHHMS23 lines 5311–5320, 5398–5408 (Remark 8.4.7 with R_{r̄_w} formally smooth) | sound |
| 5.6 completed cohomology, big Hecke algebra | 𝔽×𝔽; q=5; O→O; one vs two places above p | e₂=0, T_𝔪≅𝔽; 7·9=5, 5·7=6, 5/17=2, 5/21=3; reduced two-term complex has Tor 𝔽; empty away tensor O; Ĉ via Hom_{T_n[G]}(ρ_n,H¹(O/pⁿ)) equals M/pⁿ (finite-length induction, Carayol evaluation at level V_v); BHHMS23 lines 5409–5444 | sound |
| 5.7 big R = big T | R=O⟦x,t⟧, (x); C vs C² | quotient O⟦t⟧ codimension 1; faithful free module detects every kernel; N⊗C²=(N⊗C)²; M∞ faithfully flat over R∞ and flat over S∞ ⇒ R∞ flat over S∞ (injectivity of N⊗R∞→N′⊗R∞ is detected after ⊗_{R∞}M∞); dim T̂ = 2f+1 = 1+h¹−h² for the fixed-determinant unrestricted global problem; BHHMS23 lines 5447–5459 | sound |
| gap:tame-types | GL₂(𝔽₂₉) types | dims 1, 30, 28; Steinberg 29 excluded (BHHMS23 lines 4706–4712) | declared, precise |
| gap:single-type-rings | f=1,2 one weight; f=1 two weights | relative dims 4, 5 vs residual cotangent 5; T.6/single-presentation at the supplier's design head is semisimple, unfixed determinant | declared, precise |
| gap:breuil-mezard-pbt | GK14 Thm A, §2.2 | unique μ_σ, support = predicted weights (lines 105–115), HT(ε)=−1 (line 245) | declared, precise |
| gap:power-series-cancellation | ℤ_p⟦t⟧⟦x⟧ vs ℤ_p⟦x⟧; 𝔽₉ | dims 3 vs 2; a³=−a, Witt lift returns [a]; HAM75 Theorem 4 line 101 ("quasi-local"), BHHMS23 Lemma 8.1.2 line 4405 | declared, precise |
| gap:quaternionic-component-realization | GK14 Lemma 5.2.5 | det ψε⁻¹, unramified outside S, points of chosen components, modular (lines 1253–1258); PL.5 at its design head is CM | declared, precise, minimal |

## Not verifiable

- DL21 §6.2 and CEGGPS16 §2 behind §1.6 (freeness over S∞⟦K₁/Z₁⟧, projectivity over S∞⟦K⟧_Z): DL21 was opened at Theorem 6.2 and lines 3160–3228, CEGGPS16 at Proposition 2.13 and Lemma 4.17; BHHMS23's own statement (lines 5213–5223, 5250–5253) is the locator taken.
- The integral evaluation isomorphism of §0.3 (Carayol, Théorème 4, cited through EGS15 §6.2) was not opened; the consequence used in §5.6's Ĉ (Hom(ρ_n, H¹(O/pⁿ)_𝔪) = M/pⁿ) was derived from it.
- BHHMS23 Proposition 4.3.3's table rows behind the §4.8 p-membership Check: the unit-factor conclusion (lines 1919–1923) was read; the table was not recomputed.
- LMS22 Proposition 4.6 and EGS15 Theorem 7.2.1(2),(4),(5): statement openings only (lines 631–659, 2197–2200).
- BDJ10 Lemmas 4.6(a), 4.10, 4.11 (cited through BHHMS23): not opened.
- Ownership against the brief's named sibling pull requests beyond the roadmap service index.
- No Lean was run (read-only pass); the file has no declaration to elaborate.

## Source issues

- **Error** in BHHMS23 at Theorem 8.3.9 and Corollary 8.3.10, printed pp. 101 and 103 (lines 5070–5073, 5145–5148): the statements let every embedding up to j carry (2,−1) independently; the lattice L_j[1/p] is P̃[1/p] plus one adjoint tensor per embedding, and the proof's own annihilator formula (lines 5121–5125) intersects only the parallel profile and the profiles raised at one embedding; the support should be that intersection; affects a stated result.
- **Misprint** in BHHMS23 at the proof of Proposition 8.3.7, printed p. 100 (line 5037): the Hom dimension from Proposition 8.2.3 is written as f; it should be r, the common rank; affects the proof.
- **Misprint** in BHHMS23 at the proof of Theorem 8.3.9, printed p. 102 (line 5107): the bijection ι is indexed by the positive norm-determinant twist; it should carry the inverse twist of line 5075; affects nothing.
- **Error** in EGS15 at §6.2, printed p. 35 (lines 1712–1713): the adelic centre is made to act through ψ; it should be ψ⁻¹; affects a stated result; corrected in print at BHHMS23 Remark 8.1.3(i), p. 89 (lines 4442–4448).
- **Gap** in EGS15 at §6.2, printed p. 35 (lines 1717–1720): the indefinite S(σ) is defined on the curve itself while the extended central action is imposed; it should be defined on the quotient by the finite central group, with the r̄-part comparison; affects the proof; corrected in print at BHHMS23 Remark 8.1.3(iii), p. 89 (lines 4452–4461).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3cacbeab75e1b15fb260c19251786a6f6897e66f", "job": "RT-HilbertModularVarietiesAndShimuraCurvesPartII~2b", "model": "fable", "worker": "chris-x8"} -->
