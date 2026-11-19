# Review of CrystallineCohomology (pull request #2532 at 45263ea)

**Verdict:** accepted

**Summary.** Accepted with no findings. The revised scope sentence is right about CrystallineCohomologyPartII, which plans Witt cohomology under h-covers and rational Witt cohomology of singular schemes and excludes the other two subjects. Its new claim that no roadmap plans "convergent coefficient descent" rests on a phrase that names no statement, and one reading of it is already planned on main. There are three small corrections and one format note, none blocking, and one question about a citation in CR.6.1. Nothing is left for a human to decide.

## C01 — The new scope sentence says no roadmap plans "convergent coefficient descent", but the phrase names no statement and one reading of it is planned on main

A reader cannot tell which result is meant, so cannot check whether the claim holds. In *Scope and ownership*, "Not here", lines 192–194, the text calls convergent coefficient descent "later work that no roadmap plans". PadicDifferentialEquationsAndRigidCohomology on main plans the Zariski stack property of convergent isocrystals (§RD.3.33, API bullet "`X ↦ Isoc(X/K)` is a Zariski stack"). Its §RD.5.8c uses Ogus's étale and proper descent for convergent F-isocrystals (Duke 1984, Theorems 4.5–4.6) as an input in its hypotheses and proof steps 1 and 4, without owning it. So the claim is false under the first reading and true under the second.

The smallest repair is to name the result meant and drop the claim about other roadmaps, which also keeps the sentence timeless. For example: "…; Ogus's descent of convergent F-isocrystals along étale and proper surjective maps, and Cartier transforms of periodic connections, also build on this roadmap and are outside both Parts."

## C02 — The statement of *Proper smooth crystalline base change* uses I₀, g and (V,T) without defining them

An implementer cannot tell which sub-PD ideal the special case refers to, or where (V,T) lives. In CR.7, lines 11347–11357, the statement says "S₀⊂S and S₀′⊂S′ be defined by sub-PD ideals of I and I′" but never names those ideals. It then writes "For I₀=I this is the ordinary crystalline base change", uses g_crys without defining g, and says the relative case follows "by applying this statement on (V,T)". (V,T) is introduced only in the next target, *Relative crystalline direct images*. The mathematics is right: it matches Du–Moon–Shimizu Theorem 8.1 (p.31) with trivial log structures. A fix would be to write "S₀=V(I₀) and S₀′=V(I₀′) for sub-PD ideals I₀⊂I and I₀′⊂I′ with u^*I₀⊂I₀′", "g: X′→X the projection", and "(V,T) an object of the base-compatible site of Y, as in *Relative crystalline direct images* below".

## C03 — The Hypotheses of *Crystalline cup products* point to CR.3.4 for a comparison that is this target's own API bullet

A reader who follows the pointer lands in the Frobenius section. Line 3016 reads "The coefficient de Rham comparison the multiplicative de Rham comparison of CR.3.4 additionally requires…". The phrase is duplicated, and CR.3.4 is *Frobenius*. The comparison of the cup product with the wedge product of the coefficient de Rham complexes is the API bullet of this same target (lines 3036–3039). In the same sentence Y is the smooth lift, while in (4) of the statement Y is a second scheme. One possible repair: "The coefficient de Rham comparison in the API below additionally requires E and F to be quasi-coherent crystals, p nilpotent in A and a smooth lift X̃ of X over A."

## N01 — In the citation of *Crystalline cup products* (line 3058) the chapter name "Cohomology on Sites" is written twice.

## Questions for the author

- In *Log de Rham–Witt model* (CR.6.1, lines 10415–10450), which source states the absolute comparison C̃_n≃W_nω̃^•_Y? Hyodo–Kato §4 assumes (Y,M)→(Spec k,L) is smooth of Cartier type (opening of §4, p.246), and a semistable Y is not smooth over the trivial log point. Their (4.20), pp.261–262, compares the relative complexes of §1 and §4 and proves (1.5) exact. Disegni–Liu (arXiv v3, §B.2, p.82) call C̃≃Wω̃ well known and cite Hyodo's 1991 paper and Hyodo–Kato. I did not read Hyodo 1991, so I cannot say whether it is the right locator.

## Previous findings

The previous review (of the earlier pull request that added this roadmap) had two findings.

- R01 — still repaired. Lines 7294 and 7563 read "the product formula `Tr_{X×Y}=Tr_X⊗Tr_Y`" inside a code span.
- R02 — not applicable here. It concerned the description of that earlier pull request. This pull request's description is read below and matches the head.

## Verified sound

| Statement | Instances tried | Left-side value | Right-side value | Result; change |
| --- | --- | --- | --- | --- |
| Scope sentence, lines 191–194 (the change) | Part II README:9, :11; RD.3.33; RD.5.8c; PCurvature:53, :733 | Part II plans h-descent (Layer 1) and singular Witt cohomology (Layers 0, 2–6) | Part II excludes the other two subjects; RD.3.33 plans Zariski descent; RD.5.8c uses Ogus's descent, unowned | Two subjects correct; "no roadmap plans" ambiguous; C01 |
| *Small and big crystalline sites* (CR.1) | U↦(U,U,0) adjunction; G_crys; canonical PD on pO_X over ℤ_p | Hom((U′,U′,0),(U,T,δ)) = Hom_X(U′,U); G(U) is an fppf sheaf | γ_n(pa)=p·(p^{n−1}/n!)aⁿ, well defined since v_p(n!)≤n−1 | Holds; Stacks 07MF, 07I6, 07I9, 07IA, 07IB, 07IG, 07IJ match |
| *Alternating Čech complex* (CR.3.1) | one-member cover; ℙ¹ over W_n with two charts; two disjoint points | Single column M⊗Ω^•_PD; total complex W_n, 0, W_n, 0 | RΓ_dR(ℙ¹_{W_n}) = W_n, 0, W_n; W_n⊕W_n in degree 0 | Holds; Stacks 07MN uses completed envelopes, narrowed honestly to p nilpotent |
| *Crystalline cup products* (CR.3.3) | x odd, p odd; p=2 | 2·x∪x=0, 2 a unit in ℤ_(p), so x∪x=0 | at p=2 only 2·x∪x=0 is claimed | Holds; tags 0FPJ, 0FPL, 0FPM, 0H9A, 07LM, 07LG read; C03, N01 |
| *Rational crystalline Frobenius isogeny* | ℙ¹/W(k); (O_crys, Φ=0) on Spec k | F=1 on H⁰, p on H²; coker W/p integrally | F_K=0 on W(k): not an isomorphism | Both Checks true; hypotheses equal Stacks Thm 60.26.4; bound p^{d(j+1)} = 07QB |
| *Injectivity of Frobenius on a saturated complex* | T=[ℤ→ℤ], F₀=p, F₁=id; ℤ with F=0 | T saturated: dx∈pℤ gives x=F₀(x/p); F injective | ℤ, F=0: d=0 so (ii) needs x∈im F=0, fails | Both Checks true; BLM Def 2.2.1, Rem 2.2.3, p.14 |
| *The Verschiebung filtration* | T; p=2 two-term complex; ℤ with F=id | T: V₀=id, V₁=p; N_r^1 ⊇ d(T⁰)=ℤ while im V₁^r=p^rℤ | ℤ, F=id: V=p, N_r^0=p^rℤ; p=2: N_1^1=M¹, im V₁=2M¹ | All Checks true; BLM Construction 2.5.1, p.19 |
| *Frobenius lowers the filtration* | general; free strict complex E (BLM Ex. 2.5.7) | F(V^{r+1}a)=pV^r a; F(dV^{r+1}b)=dV^r b | in E, im V+im dV in degree 1 has dx-coefficient in pℤ_p, so dx∉N_1^1 | Holds; Check true; BLM Rem 2.5.2, p.19 |
| *Multiplication by p raises the filtration* | general; ℤ with F=id | pV^r a=V^{r+1}(Fa); p·dV^r b=dV^{r+1}(Fb) | p·p^rℤ=p^{r+1}ℤ=N_{r+1}^0 | Holds; BLM proof of Prop 2.6.2 (7), p.22 |
| *Finite-length Witt operators* | R=ℤ, r=2; R=𝔽_p; r=1 in char p; 𝔽_p[t] | ghost (a,b)↦(a,a^p+pb) injective; ghost(0,1)=(0,p)=0 in 𝔽_p | W_r(𝔽_p)≅ℤ/p^r, V=·p into ℤ/p^{r+1}; V₀F₀=0=p on W₁ | All Checks true; Mathlib `WittVector.eq_zero_of_p_mul_eq_zero` is perfect-ring only, as claimed |
| *Log de Rham–Witt model* (CR.6.1) | relative log point; Y with pulled-back log structure | W_n(k) in degree 0 on both sides | reduces to Illusie's comparison, strict case | Relative part = HK Thm 4.19, p.260; absolute part: question |
| *Tate curve monodromy* (CR.6.2) | v_K(q)=n; n=1 nodal cubic | Nφ(e₁)=N(pe₁)=pn·e₀ | pφN(e₁)=pφ(n e₀)=pn·e₀; N²=0; e₀′=n e₀ gives N(e₁)=e₀′ | Holds; consistent with the Hyodo–Kato monodromy Check |
| *Semistable logarithmic Witt models* (CR.6.4) | admissibility list; triangle arrows | DL §B.1: Z⁰ flat, generically smooth over W[t], smooth over W, N⁰ the divisor log structure | (B.4) ∧dlog t, projection, connecting map; (B.5) equivalences | Matches DL arXiv v3 pp.80–83; κ widened to perfect, as stated |
| *Rigid cohomology of smooth strata* | 𝔾_m; 𝔸¹; Spec k | σ^*(dt/t)=p·dt/t; H¹ one-dimensional | 𝔸¹: overconvergent primitive gives H¹=0; closed disc H¹_dR infinite | Checks true; Kedlaya Thm 1.2.1 allows any k of char p with σ_K |
| *Log rigid Hyodo–Kato cohomology* (CR.6.5) | Nφ relation; finiteness; Frobenius | φ(θ)=qθ, so Nφ=qφN (GK Prop 5.5) | GK Thm 5.3 (i), (iii): (iii) needs k perfect, A₀=W(k), as stated | Matches GK §§5.1–5.5, pp.26–29, §3.11 p.18 |
| *Proper smooth crystalline base change* (CR.7) | ℙ¹ from W₂(k) to k; I₀=0, X=S | (W₂⊕W₂[−2])⊗^L k = k⊕k[−2] | RΓ_dR(ℙ¹_k)=k⊕k[−2]; final object (S,S,0) gives O_S[0] | Checks true; DMS Thm 8.1 p.31, Stacks 07MU; C02 |
| Headline: `exists_frobenius_block_basis` | V=0; dim 1; slope 1/2; slope −1/2 | n=0; F b=p^m b, Mathlib's StandardOneDimIsocrystal | F²e₀=F e₁=p e₀; F e₁=p^{−1}e₀ via zpow | True (Dieudonné–Manin); not one-tactic; binders all present |
| Headline: `PhiNModule.N_pow_finrank_eq_zero` | V=0; dim 1; Tate block | N^0=1=0 on the zero space; c=pσ(c) forces c=0 | Tate block N²=0; char-poly: p^i c_i=σ^{−1}(c_i), so c_i=0 | True; not one-tactic; binders all present |
| End theorems (crystalline–de Rham, dRW comparison, Poincaré duality, HK comparison) | pinned Mathlib and Tau Ceti | no PD envelope, crystalline site or log structure at the pin | module docstring names each and its missing carrier | Correctly omitted from `Suggested.lean` |

- Source locators checked against the text: 52, in Stacks Crystalline Cohomology (17), Stacks Cohomology on Sites (4), Bhatt–Lurie–Mathew arXiv v3 (8), Hyodo–Kato (6), Disegni–Liu arXiv v3 (4), Grosse-Klönne arXiv v1 (7), Kedlaya (1), Du–Moon–Shimizu (1), Beilinson 1111.3316v4 (3), Langer–Zink preprint (1). Hyodo–Kato printed page = PDF page + 219, so all its page locators agree.
- Library declarations opened at the pin: Mathlib `WittVector.eq_zero_of_p_mul_eq_zero` (RingTheory/WittVector/Complete.lean:55, PerfectRing section), `Nat.uniformBell_zero_right` (Combinatorics/Enumerative/Bell.lean:163), `WittVector.isocrystal_classification` and `StandardOneDimIsocrystal` (RingTheory/WittVector/Isocrystal.lean). Mathlib RingTheory/DividedPowers has no envelope. Tau Ceti has no isocrystal or Dieudonné–Manin file.
- Cross-roadmap citations resolved: CrystallineCohomologyPartII README:9, :11; PadicDifferentialEquationsAndRigidCohomology §§RD.3.33, RD.5.8c, RD.5.110; PCurvature :53, :733; CohomologyComparisons §4.9a cites §CR.6.5 as supplier.
- Automatic checks rerun at 45263ea: every one passes (text scanners, imports and form of the Lean file, files outside the folder). Dependency check output: `depcheck: 200 roadmaps, 2194 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`: two warnings, both `declaration uses sorry` (lines 49 and 82). The three elaborated signatures were compared with README:6620–6634 and README:10186, 10220–10223: no binder lost, same generality.
- Pull request text: the title and all five claims of the description match the head (one sentence of one file changed, 4+/3−; no target, heading, section number, supplier contract or Lean declaration changed). `git diff --stat` outside the folder is empty.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped; no second copy on main.

Overlap check: read DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons, HabiroCohomologyFoundations, HodgeTateAndCanonicalSubgroups, ProetaleCohomologyOfPAdicCurvesAndTowers, RefinedTraceMethods, CrystallineCohomologyPartII, PCurvature, PadicDifferentialEquationsAndRigidCohomology. Nothing shared: each cites this roadmap as a supplier or parent. DerivedDeRhamCohomology lists the CR.DDR sections as owned here.

Source independence: 21 passages compared with 9 sources, none shared beyond forced definitions and hypothesis lists (at most 7 consecutive words, in the definition of an admissible weak formal lift against Grosse-Klönne §5.1). Largest share Stacks Project, 255 of about 1,050 source mentions (Bhatt–Lurie–Mathew next with 207). Contents compared with Stacks Ch. 60 and Bhatt–Lurie–Mathew §§2–4: independent. CR.4.1–CR.4.5 share Bhatt–Lurie–Mathew's order, but the *Needs:* lines force it (CR.4.2 needs CR.4.1's Verschiebung, CR.4.3 needs CR.4.2's filtration, CR.4.5 needs CR.4.3–CR.4.4), and the layers also draw on Illusie, Langer–Zink and Ekedahl.

Research link: CR.6 is the Hyodo–Kato theory (Hyodo–Kato 1994) behind the semistable comparison. Its convergent complexes (CR.6.4) are those Disegni–Liu use for their p-adic arithmetic inner product formula. Its log rigid cohomology (CR.6.5) is Grosse-Klönne's, used in de Shalit's monodromy–weight theorem for quotients of Drinfeld's space. Rests on README lines 84–86 and Grosse-Klönne's abstract.

## Not verifiable

- none: every sampled locator was read in a legal copy (Stacks Project, arXiv, Numdam, the authors' pages).

## Source issues

- **Misprint** in Stacks Project at Remark 60.26.3 (tag 07N4), p.59: the source says the adjugate computation multiplies by det(M), a matrix never introduced; it should be det(K), the determinant of the other factor; affects nothing.
- **Misprint** in Stacks Project at Remark 60.24.9 (tag 07MU), p.51: the source says the Koszul-regular sequences in the hint run from ξ₁−f₁ to ξ_n−f_n; it should end at index c, the number of equations; affects nothing.
- **Gap** in Stacks Project at Remark 60.24.4 (tag 07MN), p.49: the source says the alternating Čech complex computes cohomology once it does so on all pieces, and leaves a placeholder where the reference belongs; it should cite or prove that general fact; affects the proof.
- **Gap** in Stacks Project at Lemma 60.8.2 (tag 07I9), p.18: the source omits the proof that CRIS(X/S) has finite nonempty limits and hints only at the affine case; it should glue the affine construction; affects the proof.
- **Gap** in Stacks Project at Lemma 21.33.3 (tag 0FPM), p.79: the source omits the proof that the relative cup product commutes with the commutativity constraint; it should give the adjunction argument used for 0FPL; affects the proof.
- **Gap** in Stacks Project at Lemma 21.33.5 (tag 0H9A), p.79: the source omits the proof that the relative cup product is compatible with a commutative square of ringed topoi; it should supply it; affects the proof.
- **Misprint** in Langer–Zink, *De Rham–Witt cohomology for a proper and smooth morphism* (author's preprint), at Definition 1.4 (i), printed p.18: the source says restriction of scalars along F: W_{n+1}(S) → W(S); it should be F: W_{n+1}(S) → W_n(S); affects nothing.
- **Misprint** in Langer–Zink (author's preprint) at (1.16), printed p.18: the source says the last factor on the right is dVω_n; it should be dVω_r, matching the left side; affects nothing.

## For the human reviewers

- none
