# Review of CrystallineCohomology (pull request #2532 at 45263ea)

**Verdict:** accepted

**Summary.** Accepted with no findings. All fifteen sampled targets state what their sources state, with the hypotheses of the sources, and the two theorems of `Suggested.lean` are true and are not one-tactic consequences of the library. There are five small corrections and two format notes, none blocking: three corrections and one note stand from the previous review, since the head is unchanged, and two new corrections concern the logarithmic layer (a definition cited to a paper that does not contain it, and a base-change statement that names the wrong fibre product). Nothing is left for a human to decide.

## C01 — The scope sentence says no roadmap plans "convergent coefficient descent", but the phrase names no statement and one reading of it is planned on main

A reader cannot tell which result is meant, so cannot check the claim. In *Scope and ownership*, "Not here" (lines 192–194), the text calls convergent coefficient descent "later work that no roadmap plans". PadicDifferentialEquationsAndRigidCohomology on main plans the Zariski stack property of convergent isocrystals (§RD.3.33, API bullet "`X ↦ Isoc(X/K)` is a Zariski stack", line 6552 of its README), and its §RD.5.110 uses a Frobenius descent for convergent isocrystals as an input. So the claim is false under one reading and true under another. "Later work" and "no roadmap plans" also date the sentence.

The smallest repair names the result and drops the claim about other roadmaps, for example: "…; descent of convergent F-isocrystals along étale and proper surjective maps (Ogus), and Cartier transforms of periodic connections, also build on this roadmap and are outside both Parts."

## C02 — The statement of *Proper smooth crystalline base change* uses I₀, g and (V,T) without defining them

An implementer cannot tell which sub-PD ideal the special case refers to, or where (V,T) lives. In CR.7.3 (lines 11347–11357) the statement says S₀ and S₀′ are "defined by sub-PD ideals of I and I′" without naming them, then writes "For I₀=I this is the ordinary crystalline base change", uses `g_crys*` with no g, and says the relative case follows "by applying this statement on (V,T)", an object introduced only in the next target. A fix: "S₀=V(I₀) and S₀′=V(I₀′) for sub-PD ideals I₀⊂I, I₀′⊂I′ with u^*I₀⊂I₀′", "g:X′→X the projection", and "(V,T) an object of the base-compatible site of Y, as in *Relative crystalline direct images* below".

## C03 — The Hypotheses of *Crystalline cup products* point to CR.3.4 for a comparison that is this target's own API bullet

A reader who follows the pointer lands in the Frobenius section. Line 3016 reads "The coefficient de Rham comparison the multiplicative de Rham comparison of CR.3.4 additionally requires…": the phrase is doubled, CR.3.4 is *Frobenius*, and the comparison of cup and wedge products is an API bullet of this same target. In the same sentence Y is the smooth lift, while in (4) Y is a second scheme. One repair: "The coefficient de Rham comparison in the API below additionally requires E and F to be quasi-coherent crystals, p nilpotent in A and a smooth lift X̃ of X over A."

## C04 — *Kummer morphisms* cites Temkin §1.2.7 and "Step 10" for a definition that paper does not contain

A reader who opens the locator finds no definition of a Kummer homomorphism. In CR.5:log-algebra.2 (line 7920) the definition (injective, every element of the target has a positive multiple in the image) is cited to Temkin, *Tame distillation*, "§1.2.7 and proof, Step 10, pp.100,123–124". Temkin's §1.2.7 (pp.99–100) is about log smoothness of maps between snc pairs and never mentions Kummer maps; the word occurs once in the paper, on p.123, where the proof of Theorem 1.2.9 says a map is Kummer étale "as in Step 10" of Illusie–Temkin's proof, a step of another paper. The same §1.2.7 is cited as "Kummer étale maps, pp.99–100" in *Base change of logarithmic morphisms* (line 8048) and for *Kummer étale morphisms* (line 8028).

The definition itself is the standard one, so only the locator needs changing: Illusie, *An overview of the work of K. Fujiwara, K. Kato, and C. Nakayama on logarithmic étale cohomology*, Astérisque 279 (2002), §1.6, p.274 (open on Numdam) defines Kummer maps of fs monoids, Kummer morphisms of fs log schemes by the characteristic stalks at geometric points, and Kummer étale morphisms, in exactly the form used here.

## C05 — *Base change of logarithmic morphisms* puts log smooth and log étale maps under "log base change", where the fibre product can leave fine log schemes

An implementer who takes the ordinary log fibre product, as the sentence says, gets an object on which the roadmap's log smoothness is not defined. Line 8038 reads "Strict, log smooth and log étale morphisms are stable under log base change", and *Log smooth morphisms* (line 7962) defines log smoothness for "a morphism of fine log schemes". Take the blow-up chart `ℕ²→ℕ²`, `(a,b)↦(a+b,b)`, which is log étale by the chart criterion (the map on groups is an isomorphism), and base-change it along itself. In the ordinary pushout `ℕ²⊕_{ℕ²}ℕ²` the elements `(f₂,0)` and `(0,f₂)` are distinct, since no nonzero element of the image lies below `f₂`, yet both map to `f₂` in the group `ℤ²`; so the pushout is not integral. Kato's statement at the locator the target cites, (2.8) on p.199, is for fibre products in the category of fine log schemes, as is his (4.6) for exact maps.

The smallest repair: "Strict morphisms are stable under log base change; log smooth and log étale morphisms of fine log schemes under fine log base change (Kato (2.8))".

## N01 — In the citation of *Crystalline cup products* (line 3058) the chapter name "Cohomology on Sites" is written twice.

## N02 — *Crystalline Leray spectral sequence* (line 3346) gives "pp.17–19" for the proof of Bhatt–Morrow–Scholze Theorem 2.10; in the linked copy the theorem is on p.16, its proof on pp.16–17 (the Leray sequence on p.17), and p.19 begins §3.

## Previous findings

The previous review, of this same head, had no findings. Its three small corrections and its format note are unrepaired because nothing changed; each was checked again against the text and is restated above as C01–C03 and N01 (line 194 "as later work that no roadmap plans"; line 11353 "For I₀=I this is the ordinary crystalline"; line 3016 "the multiplicative de Rham comparison of CR.3.4"; line 3058 "Cohomology on Sites, Cohomology on Sites"). Its question on the absolute comparison in *Log de Rham–Witt model* (CR.6.1) was not re-examined this round.

## Verified sound

| Statement | Instances tried | Left-side value | Right-side value | Result; change |
| --- | --- | --- | --- | --- |
| *Quasi-coherent and finite locally free crystals* | X=Spec k over W₂(k), coker of p; 𝔸¹ over 𝔽_p, U↦O_U on first-order thickening | (O_crys/p)(W₂)=k, a crystal, not free; `c_{p₀}`: O_X⊕Ω→O_X | not injective, so not a crystal; restrictions quasi-coherent | Checks true; Stacks Def 60.11.1, Lemma 60.11.2 (tag 07IT) match |
| *Formal comparison with trace-free endomorphism coefficients* | rank 1; r=2, p=2; ℙ¹ over W(k); I=(p²)⊂ℤ_p | tr(a·id+φ)=ra; cokernel O/rO; v_p(p^{2n}/n!)≥2 | r=1: End⁰=0; p∣r: O_T/r≠0 as p nilpotent; H^*=W,0,W | Holds; hypotheses equal Stacks Remark 60.24.14 (tag 07MZ) |
| *Semilinear crystalline Frobenius and linearization* | Spec k; ℙ¹; lift φ̃ with φ̃^*y=y^p+pz | F=σ on W(k); φ̃^*(dy)=p(y^{p−1}dy+dz) | F(h)=p·h from F_X^*L≅L^p; φ̃^*Ω^q⊂p^qΩ^q | Holds; Situation 60.26.1, Def 60.26.2, proof of Thm 60.26.4 (three maps) |
| *Crystalline Leray spectral sequence* | f=id; ℙ¹→Spec k over W_n; translation by a section a of E₀ | E₂ only b=0; W_n at (0,0),(0,2) | τ_a^*c=c+a^*c, and a^*c dies in R¹ of the base | Holds; BMS proof of Thm 2.10 uses exactly this sequence; N02 |
| *Iterated Frobenius divisibility* | T=[ℤ→ℤ], F₀=p, F₁=id; r=0,1 | F₀^r(ℤ)=p^rℤ | {x: dx=x∈p^rℤ}=p^rℤ; degree 1 all cocycles, F₁^r=id | Holds; BLM Prop 2.2.5, Remark 2.2.6, p.15 |
| *Morphisms of Dieudonné complexes* | ℤ(F=id)→ℤ(F=p); ℤ(F=id)→ℤ(F=2) | f(1)=f(F1)=F f(1)=p·f(1) | f(1)=0; cochain maps alone allow every integer | Checks true; BLM Def 2.1.1, p.13 |
| *Morphisms commute with Verschiebung* | T; general | F_N f(Vx)=f(FVx)=p f(x) | F_N V f(x)=p f(x); F_N injective | Holds; BLM Remark 2.2.3 p.14, Remark 2.5.3 pp.19–20 |
| *Decreasing Verschiebung filtration* | T; ℤ with F=id | V^{r+1}a=V^r(Va); dV^{r+1}b=dV^r(Vb) | T: N_r^1=ℤ all r; F=id: p^{r+1}ℤ⊂p^rℤ | Holds; BLM Construction 2.5.1, p.19 |
| *Logarithmic Hodge–Witt sheaves* | q=0; 𝔾_m; dt on 𝔸¹ at r=1 | image of ℤ→W_r(O_X) is ℤ/p^r; F(dlog[u])=[u]^{−p}[u]^{p−1}d[u] | =dlog[u]; C(dt)=0≠dt so dt not logarithmic | Holds; Shiho Def 2.6 p.575, CMM Defs 5.25–5.26 p.43, BMS2 p.267, Illusie (5.7.1) pp.596–597 |
| *Kummer morphisms* | 1↦n on ℕ; 1↦0; p-power in char p | n·1 in image, injective: Kummer | 1↦0 not injective: not Kummer | Definition standard (Illusie §1.6); Temkin lacks it; C04 |
| *Base change of logarithmic morphisms* | blow-up chart (a,b)↦(a+b,b) against itself | (f₂,0)≠(0,f₂) in ordinary pushout | both ↦f₂ in ℤ²: not integral | Kato (2.8) p.199, (4.6) p.209 are fine base change; C05 |
| *Log smoothness by fine models* | S fine; ℕ→ℕ, 1↦m base-changed to ℚ≥0 | M₀=M_S recovers fine log smoothness | integral pushout {0}∪(ℚ_{>0}×ℤ/m), fibre Spec k | Holds; BKV Def 2.1, p.6 (arXiv v2) |
| *Log rigid Hyodo–Kato cohomology* | xy=0; two ℙ¹ at two nodes; 𝔽₃ example; Σp^{⌊√n⌋}tⁿ | H⁰=H¹=K₀, φ=q, N=0; Nφe₁=qe₀=qφNe₁ | φNe₁=e₀≠q²e₀=qNφe₁; b₁=3, χ(O)=2−4, dim H¹=6 | Checks true; GK §§5.1–5.5 pp.26–29, Thm 5.3, §3.11 p.18 |
| *Relative Gauss–Manin connections* | constant family; f=id; [ℤ_p --p→ ℤ_p] | ∇=d on O factor; H⁰=O_Y with d | cohomology ℤ_p/p not flat: hypothesis fails | Holds as conditioned; Stacks Prop 60.17.4 (tag 07JH), DMS Thm 10.11 p.43 |
| *Compatibility with divided powers* | A⟨t⟩ over ℤ₂ | dδ₂(t)=δ₁(t)dt=t dt | no division by 2 | Holds; Beilinson §1.7(a) p.10 (the iff criterion), Kato (6.4) p.219 |
| Scope sentence, lines 191–194 | Part II README line 11; RD.3.33; RD.5.110; PCurvature line 53 | Part II excludes both subjects | RD.3.33 plans Zariski descent of Isoc | Two-subject split correct; "no roadmap plans" ambiguous; C01 |
| *Proper smooth crystalline base change* (CR.7.3) | read lines 11347–11357 | I₀, g, (V,T) used | none defined in the statement | C02 |
| *Crystalline cup products* | read lines 3010–3018, 3058 | pointer to CR.3.4 | CR.3.4 is Frobenius | C03, N01 |
| Headline `exists_frobenius_block_basis` | V=0; slope 1/2; slope −1/2 | n=0; F²e₀=Fe₁=p e₀ | Fe₁=p^{−1}e₀ by zpow; den>0 | True (Dieudonné–Manin); simp, rfl, infer_instance, decide all fail |
| Headline `PhiNModule.N_pow_finrank_eq_zero` | V=0; Tate block; char-poly coefficients | σ(c_i)=p^{−i}c_i | v(σc)=v(c) forces c_i=0, i>0 | True; same four tactics fail; binders all present |
| End theorems not stated in Lean | pinned Mathlib and Tau Ceti | no PD envelope, crystalline site, log structure | module docstring names each and its missing carrier | Correctly omitted |

- Source locators checked against the text: 41, in Stacks Crystalline Cohomology (8), Bhatt–Lurie–Mathew arXiv v3 (7), Kato (6), Grosse-Klönne arXiv v1 (7), Illusie 1979 (3), Shiho (1), Clausen–Mathew–Morrow (2), BMS2 (1), BMS1 (1), Temkin (2), Binda–Kato–Vezzani arXiv v2 (3). Also Du–Moon–Shimizu (1), Beilinson v4 (2), Esnault–Groechenig (2), Illusie's Astérisque overview (1).
- Page offsets confirmed: Illusie printed = PDF + 499; Kato printed = PDF + 189.
- Library declarations opened at the pin: `WittVector.isocrystal_classification` (dimension one only), `WittVector.Isocrystal.frobenius`, `Module.End.isNilpotent_iff_of_finite`; neither headline is in the library.
- Cross-roadmap citations resolved: CrystallineCohomologyPartII README line 11; PadicDifferentialEquationsAndRigidCohomology §§RD.3.33, RD.5.110; PCurvature lines 53, 732; consumers' citations in DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons, HodgeTateAndCanonicalSubgroups, HabiroCohomologyFoundations, RefinedTraceMethods, ProetaleCohomologyOfPAdicCurvesAndTowers.
- Automatic checks at 45263ea: all passed. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CrystallineCohomology/Suggested.lean`: two warnings, both `declaration uses sorry` (lines 49 and 82). The three elaborated signatures were compared with README lines 6620–6634 and 10186, 10220–10223: same generality, no binder lost.
- Pull request text: title and description match the head (one sentence of one file, 4 insertions and 3 deletions; no heading, target, supplier or Lean declaration changed); nothing changed outside the folder.
- Overlaps: no other open pull request changes this roadmap; no cited id dropped; no second copy on main.

Overlap check: read DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, CohomologyComparisons, HabiroCohomologyFoundations, HodgeTateAndCanonicalSubgroups, RefinedTraceMethods, ProetaleCohomologyOfPAdicCurvesAndTowers, CrystallineCohomologyPartII; nothing shared. Each cites this roadmap as supplier or parent; DerivedDeRhamCohomology (lines 108–117) lists the CR.DDR sections as owned here.

Source independence: 16 passages compared with 13 sources, none shared beyond forced definitions and hypothesis lists (longest run 8 words, in the statement of the formal comparison against Stacks Remark 60.24.14). Largest share Stacks Project, 191 of about 530 cited passages (Bhatt–Lurie–Mathew next with 77). Contents compared with Stacks Chapter 60: independent. CR.1–CR.3 share its order (sites, crystals, connections, Poincaré lemma, base change, Frobenius), which the *Needs:* lines force, and CR.3 also holds cup products, Künneth, Leray and curves from other sources; the other ten layers have no counterpart there.

Research link: CR.6 is Hyodo–Kato theory (Hyodo–Kato 1994) for semistable reduction; its convergent complexes are those Disegni–Liu use, and CR.6.5 is Grosse-Klönne's log rigid cohomology, which he applies to Drinfeld's symmetric space. CR.7's base change follows Du–Moon–Shimizu (2026). Rests on README lines 83–87 and the sources read.

## Not verifiable

- none: every sampled locator was read in a legal copy (Stacks Project, arXiv, Numdam, journal and author pages, the operator's Kato scan).

## Source issues

- **Misprint** in Binda–Kato–Vezzani (arXiv:2207.00369v2) at Definition 2.7 (3), p.7: the source says the alternative name for the second case is the base log scheme itself; it should be "K-semistable", matching part (2); affects nothing.
- **Misprint** in Binda–Kato–Vezzani (arXiv:2207.00369v2) at the proof of Proposition 2.2, p.6: the source says twice in a row that the chart monoid is a filtered colimit of fine ones; it should say it once; affects nothing.

## For the human reviewers

- none
