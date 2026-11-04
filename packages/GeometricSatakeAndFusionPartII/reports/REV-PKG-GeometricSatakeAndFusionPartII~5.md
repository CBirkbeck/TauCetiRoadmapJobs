<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6404751642 -->
Review (claude) of 54b204b

Verdict: needs changes

1. **F01** (P2) `gap:algebraic-coherence` names two theorems by a colloquial name and states neither

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:113 (“Give the equal-characteristic coherence and deformation theorem used for polynomial special fibres and the S₂ argument.”), the same sentence in design/plan.json `gaps`; consumed at lines 377 (§1.3), 829 (§4.11) and 1044 (§7.3).

   **Claim:** A declared gap is precise when its `needs` sentence says exactly what is missing, with hypotheses. This one gives no group, no level, no bound, no hypothesis and no conclusion, and it conflates two different theorems: the coherence theorem (equality of section dimensions, which identifies the polynomial special fibre with the reduced admissible union) and a Cohen–Macaulay deformation statement (which gives S₂ of the split admissible locus). A supplier reading the intake announcement cannot tell which statement to prove, nor that the two consumers need different ones.

   **Witness:** §1.3's route (line 373) needs the coherence equality: LEV line 1389–1392 (h⁰ of the admissible union equals h⁰ of the generic Schubert bound for n≫0, citing PZ) feeding LEV Theorem 4.3.2 (LEV line 1243, p. 29: the reduced admissible union equals the special fibre when p∤|π₁(G^der)|); PZ states the equality at PZ line 2659 ((8.19) in the cached version). §7.3's route (line 1040) needs instead GL Corollary 3.5's input: for a split G′ over k((t)) realizing Adm(μ), after a z-extension making G′^der simply connected, the equal-characteristic local model is normal with Frobenius-split reduced special fibre (GL Theorem 2.1, GL line 149, p. 4) and that special fibre is Cohen–Macaulay (GL line 296–297 and footnote 3, GL line 320: Haines–Richarz for p>2, the deformation argument otherwise). Neither statement, nor the z-extension or the prime-to-p hypothesis, appears in the gap. Every other GeometricSatakeAndFusion gap names its object or its hypotheses (compare lines 107, 109, 111).

   **Exact repair:** Replace the `needs` sentence, in both README line 113 and plan.json, by two statements with hypotheses, keeping the slug: “In GS0’s algebraic Schubert prefix, (i) for the tame Weil-restricted companion group over k((t)), any parahoric level and any dominant μ with p∤|π₁(G^der)|, prove the coherence equality: for n≫0 the dimension of global sections of the n-th power of the ample determinant line bundle on the reduced μ-admissible Schubert union equals that on the generic Schubert bound, so the special fibre of the polynomial closure of §1.2 is that reduced union (PZ (8.19), PZ line 2659; LEV Theorem 4.3.2, p. 29, LEV line 1243 and LEV line 1389); (ii) for a split group over k((t)) with simply connected derived group, Iwahori level and any dominant μ, prove that the equal-characteristic local model is normal with Frobenius-split reduced special fibre and that this μ-admissible union is Cohen–Macaulay, hence S₂ (GL Theorem 2.1, p. 4, GL line 149; GL Corollary 3.5, p. 7, GL line 288–297).” In §7.3 (line 1040) say that the S₂ input is used on the split group G′ with the same admissible set, as GL Corollary 3.5 does, so that (ii) is applied at prime-to-p level only. Nothing else changes; §4.11 consumes (i).

   **Test of repair:** For the GL₂ Iwahori line model, (i) gives h⁰ of O on two P¹ meeting in one point: 1+1−1=1, equal to h⁰(P¹,O)=1, so the special fibre is the reduced two-component union; for PGL₂ at p=2 the roadmap applies (ii) to SL₂ (simply connected, same Adm(μ) in the affine Weyl group of type Ã₁), where the admissible union is Frobenius split and Cohen–Macaulay, avoiding the non-S₂ Schubert varieties of HLR line 72. Without the hypotheses the gap could be read as asking for Cohen–Macaulayness of PGL₂'s admissible locus at p=2, which is false (HLR Theorem 1.1, HLR line 69–74).

2. **F02** (P3) §1.3 is stated for minuscule μ although its source proves every dominant μ

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:371 (“If G is quasi-tame, μ is minuscule and p∤|π₁(G^der)|, M^pol_(𝒢,μ) is normal and its geometric special fibre is reduced”).

   **Claim:** LEV Definition 4.2.1 (LEV line 960) defines M_G(μ) for any geometric conjugacy class and LEV Theorem 4.2.7 (LEV line 1024, p. 25) proves normality, reduced special fibre and normal Cohen–Macaulay Frobenius-split components under p∤|π₁(G^der)| alone; §1.2 (line 347) already defines M^pol for any dominant ν. Narrowing to minuscule μ states less than the source supports; special cases are Checks.

   **Witness:** LEV line 1024–1026 has no minuscule hypothesis; LEV line 85 says explicitly that μ is not assumed minuscule; the README's own §0.1 (line 187) now defines the general-bound datum used by §1.2.

   **Exact repair:** State §1.3 for the datum with general bound of §0.1: “If G is quasi-tame, μ is dominant and p∤|π₁(G^der)|, M^pol_(𝒢,μ) is normal …”, cite LEV Theorem 4.2.7 for the general case and KPZ Theorem 3.2.9 for the minuscule specialization, and add the Check: for GL₂ hyperspecial and μ=(2,0) the special fibre is the two-dimensional Schubert variety of t^(2,0), normal, with the minuscule (1,0) case as before. The Needs line is unchanged (§1.2 already supplies the general closure).

   **Test of repair:** GL₂, μ=(2,0): dim Gr_≤(2,0)=⟨(1,−1),(2,0)⟩=2; the admissible set at hyperspecial level is {t^(2,0),t^(1,1)}, the union of the two-dimensional Schubert variety and the point, equal to the closure, reduced; for μ=(1,0) the statement is the old one.

3. **F03** (P3) the new §7.4 Check names the Grassmannian Schubert variety but the Iwahori costandard

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:1054 (“the quasi-minuscule Schubert variety is not normal … so H^(−2)(∇)=F_ℓ at its singular point and the bound 1 holds there”).

   **Claim:** The theorem of §7.4 (GL Lemma 5.4, GL line 451–459) concerns the Iwahori costandard ∇_ν on the Schubert variety of the extremal translation t^ν in Fl_I. HLR Example 9.4 (HLR line 1860–1868) is the two-dimensional Schubert variety at the absolutely special vertex. The Check writes ∇ without saying at which level, so it reads as if the Iwahori statement were being tested on the Grassmannian object.

   **Witness:** HLR line 1863 (“pointwise fixer of the standard lattice … absolutely special vertex”); GL line 445 (j_ν is the orbit inclusion in Fl_I).

   **Exact repair:** Add one clause: “here ∇ is the costandard sheaf of the quasi-minuscule orbit at that absolutely special level, of dimension ⟨2ρ,μ⟩=2; the Check tests the step ‘unibranch suffices for the lowest costandard stalk’, which Lemma 5.4 applies at Iwahori level to the Schubert variety of t^ν, of the same dimension ℓ(t^ν)=2.”

   **Test of repair:** 2ρ for PU₃ is (2,0,−2), so ⟨2ρ,(1,0,0)⟩=2; the Iwahori Schubert variety of a maximal element of Adm(μ) has dimension ⟨2ρ,μ⟩=2 and maps onto the quasi-minuscule variety; the stalk computation is unchanged.

Round 5 reviewed at head 54b204b (the checkout was already at the pull request's head; nothing was fetched). Both round-4 findings are repaired and the repairs are sound; the one blocking finding below is in a declared gap that the round-5 repair newly routed §7.3 through, and whose `needs` sentence does not say what the supplier is to prove. Two non-blocking notes follow.

## Verified sound

### Round-4 findings, checked one by one at head 54b204b

| Round-4 finding | Repaired passage | Status and check |
| --- | --- | --- |
| F01 (P1) Schubert unibranchness at every prime unowned | Line 107: new contract `gap:schubert-geometric-unibranchness`, supplier GeometricSatakeAndFusion, section “GS0, Witt affine flags and components”, needs: every Schubert perfect variety normal with perfectly smooth dense orbit, every finite-type deperfection and every Bruhat-union component geometrically unibranch, and H^(−⟨2ρ,μ⟩)(IC_μ)=F_ℓ on Gr_≤μ over C. Same slug, supplier, section and sentence in design/plan.json. Cited at lines 1018 (§7.1 prose), 1024, 1044, 1056 (Needs of §§7.1, 7.3, 7.4) and 1104 (Layer 7 Dependencies); §7.5 reaches it through §§7.1, 7.3, 7.4. | Repaired. AGLR Proposition 3.7 at AGLR line 1222, printed p. 21 (page marker at line 1176 is extraction page 27, six front pages): for every w, Fℓ_(𝒢,w) is normal and the orbit is perfectly smooth, with no tameness or residue-characteristic hypothesis, for a reductive G over a p-adic field and any parahoric. Perfection is a universal homeomorphism and the strict henselization of a normal local ring is a domain, so the strict local ring of any deperfection has one minimal prime: geometrically unibranch. GL line 420 (unibranch ⇒ H^(−⟨2ρ,μ⟩)(IC)=H⁰(Rj_*F_ℓ)=F_ℓ, reduced to the Witt Grassmannian of the split form at GL line 423) and GL line 459 (constant lowest costandard stalk from normality of the perfect Schubert variety) are the two uses. HLR Theorem 1.1 (HLR line 69, p. 2) and Proposition 3.4 (HLR line 526, p. 11) are correctly kept as the tame witness only: HLR line 63–65 restricts to tamely ramified groups over k((t)). The supplier section exists at GeometricSatakeAndFusion's head (#1235, its line 825, “Witt affine flags and components”: Bruhat unions and Demazure spaces, no normality or unibranchness), so the gap asks for what is not yet provided. The fix worker's deviation from the round-4 repair text (supplier section and AGLR instead of HLR as the general source) is correct. |
| F02 (P3) general datum undefined | Line 187: “A local model datum with general bound is the same quadruple … with {μ} any geometric dominant conjugacy class of cocharacters, E its reflex field; the minuscule datum is the special case …”; line 202 Check; line 367 Needs “§0.1 (general bound)”; Suggested.lean line 22 “Mirković”. | Repaired. Computed: GL₂, α=e₁−e₂, ⟨(2,0),α⟩=2−0=2>1, so (2,0) is not minuscule; its reflex field is F (split torus, Galois-stable class) and dim Gr_≤(2,0)=⟨2ρ,(2,0)⟩=⟨(1,−1),(2,0)⟩=2, as the Check says. §0.4 (line 257, “arbitrary dominant μ”), §3.5, §7.5 and Layer 8 now refer to a defined object. |

Round-2 and round-3 findings marked not actionable were not re-raised; their reasons stand.

### Sources: the fifteen seeded targets, read at their locators

All 21 manifest records are certified; the manifest has no author-flagged unverified locator; no fetch was needed and no needs-references file was written. Line numbers are those of the cached extractions; printed pages are checked against the page markers (AGLR: extraction page minus six; SW: minus ten; KPZ, GL, HLR, LEV, KZ: as printed).

| Target | Read | Outcome |
| --- | --- | --- |
| 0.5 Scheme representative | SW Conjecture 21.4.1 and Remark 21.4.2, SW line 7488–7495, p. 195; KPZ §3.1.7, KPZ line 739–743, p. 16; AGLR Theorem 7.22, AGLR line 2776, p. 49; Lemma 7.27, AGLR line 2863, p. 51 | Matches: flat projective, closed immersion of the diamond, generic flag; reduced special fibre as the final condition; weakly normal intermediate (7.22) distinct from the final normal one; Lemma 7.27 passes from connected tubes to the special fibre. |
| 1.3 Normality and admissible fibre | KPZ Theorem 3.2.9, KPZ line 859–861, p. 19, footnote 5 at line 878; LEV Theorem 4.2.7, LEV line 1024–1026, p. 25; KP Theorem 2.1.2 and Corollary 2.1.3, KP line 1279–1286 | Hypotheses match (quasi-tame, p∤|π₁(G^der)|); normal CM components and base-change normality as stated; LEV's statement is for every dominant μ (R02). |
| 1.5 Prime-to-p Hodge cover | KPZ Proposition 3.2.11, KPZ line 864–872, p. 19; PRLSV Proposition 7.2.1, PRLSV line 2194–2204, p. 53 | Matches: p>2 (in the README's “standard” range, line 234), μ^ad nontrivial on each F-simple factor, p∤|π₁(G′^der)|, G′=∏Res H′_i tamely split, E′=E^ad, faithful minuscule ρ_i. The README separates the generic cover from PRLSV's very-good embedding as it says. |
| 2.3 Restriction of structure | KPZ §3.3.18 and Proposition 3.3.20, KPZ line 1036 and 1078; LEV Definition 4.2.1, LEV line 960 | Matches (as in round 4, re-read): closed immersion into the Schubert-bound closure, general ν; the three Checks recomputed below. |
| 2.6 Chain incidence models | GORGL Corollary 3.4.4, Theorem 4.5.1, 4.5.3, Corollary 4.5.4, GORGL line 643, 1325, 1406, 1414; GORSP Theorem 2.1, GORSP line 95, 149; KP line 1523; SW line 7622 | Matches (as in round 4): flatness via reducedness of the special fibre and lifting of component generic points; GSp via annihilators. |
| 3.2 Normalization of images | KPZ §3.1.9 and (3.1.10), KPZ line 761–778, p. 17 | Matches: M^can is the normalization of the schematic image; goodness is the closed-immersion strengthening. |
| 3.4 Algebraic and Witt interfaces | KZ §5.2.1, KZ line 2120–2144, p. 48; AGLR Theorem 6.16, AGLR line 2214, p. 39 | Matches: special fibre a union of Schubert varieties indexed by Adm(μ)_J in the companion flag; A^♦_(𝒢,μ)=M_(𝒢,k_E,μ) as sub-v-sheaves; the README rightly refuses to equate the unperfected companion scheme with the perfect Witt scheme. |
| 4.4 Mod-p abelian cocharacters | KPZ Definition 4.1.2, KPZ line 1338–1342, p. 31; §4.2.15, KPZ line 1612–1689, pp. 37–39 | Matches: A sums of minuscule coweights, B and C multiples of the unique minuscule coweight, D^R rϖ₁∨, D^H sϖ_(n−1)∨+tϖ_n∨; test sets S_A=Ω (all fundamental weights), S_B={ϖ_n} (line 1627), S_C={ϖ₁} (line 1653), S_(D^R)={ϖ_(n−1),ϖ_n} (line 1669), S_(D^H)={ϖ₁,ϖ_(n−1),ϖ_n} (line 1687). |
| 5.1 Frobenius orbit steps | KZ §5.2.1 and proof of Proposition 5.2.3, KZ line 2120–2199, pp. 48–50 | Matches: Stembridge step λ+α∨≤μ then the Frobenius-orbit sum (the recorded gap E5 is exactly why RS2.4 is imported); rank-one cases SL₂ and the two SU₃. |
| 5.4 Rational lifts | KZ Lemma 5.2.5, KZ line 2317–2329, p. 52 | The README states the corrected form (k-rational Laurent translation, positive-loop conjugator); the proof of Proposition 5.2.3 at KZ line 2192 chooses the lift in G(F_q((t))) and the proof of the lemma uses only σ_q(y)=y and Lang on K_λ. Source issue E4 below. |
| 6.2 Chains and torsors | SW Theorem 21.6.4, Remarks 21.6.3, 21.6.5, 21.6.7, Corollary 21.6.6, SW line 7641–7672, pp. 199–200 | Matches: smooth automorphism group scheme, étale-local standardness, torsor equivalence with the similitude line L retained, 𝒢° parahoric and 𝒢 possibly disconnected; p≠2 for PEL is carried by §6.1 (line 916). |
| 6.6 Unitary Drinfeld comparison | SW Theorem 21.8.1, SW line 7910–7918, p. 206; SW line 7847 (p=2 only unramified); KRZ line 525 | Matches: G-equivariant isomorphism with the n=2 EL Drinfeld model after base change to O_E; the ramified p=2 exclusion is the source's. |
| 7.1 Tube components | GL Lemma 5.1 and its proof, GL line 418–427, p. 10 | Formula matches; the unibranch input is now the declared gap (F01). |
| 7.3 Admissible locus S₂ | GL Lemma 3.3, Proposition 3.4, Corollary 3.5, GL line 255–297, pp. 6–7 | Matches: perfectly S₂ ⇔ codimension-one Bruhat graph connected; the proof of 3.4 uses unibranch components (now the gap); Corollary 3.5 transfers to a split G′ with the same Adm(μ) and uses Cohen–Macaulayness there (R01). |
| 7.4 Wakimoto stalk bounds | GL Theorem 5.3, Lemma 5.4, Proposition 5.5, GL line 440–469, pp. 10–11; ALWY Theorem 4.17, ALWY line 1470, p. 33; HLR Example 9.4, HLR line 1860–1868, p. 38 | Matches: perverse t-exactness and Wakimoto filtration at Iwahori level; bound 1 from the costandard; |π₁(PU₃)|=3 and the two-dimensional non-normal Schubert variety as in the new Check (R03 is wording only). |

Further locators opened this round at their claimed content: GL line 61–83, 136–158, 160–215, 225–243, 471–483; AGLR line 1195–1240, 2742–2863; HLR line 60–100, 520–535; KPZ line 686–711, 739–748, 855–878; KZ line 2130–2150, 2179–2200, 2312–2340; LEV line 945–968, 1216–1248, 1385–1395; PZ line 2655–2660; SW line 7486–7500, 7640–7672, 7845–7849, 7906–7918; PRLSV line 2190–2204; ALWY line 1466–1476; KP line 1275–1292.

### Adversarial pass

Rows cover the repaired passages, the sampled targets, the headline families and the findings; “no change” means the computed instance agrees with the statement as written.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| New gap: perfect normality ⇒ unibranch deperfection | PGL₂, p=2, quasi-minuscule | HLR line 79–82: complete local ring k[[x,y,v,w]]/(vw+x²y², v²+x³y, w²+xy³, xw+yv), normalization k[[x,y,z]]/(z²+xy), a domain; one branch; perfection equals that of the normalization | Unibranch though not normal, not S₂ (HLR line 72) | No change |
| New gap: supplier scope | PU₃(F′/F), p=3, μ=(1,0,0); wild unitary at p=2 | |π₁(PU₃)|=3 (kernel μ₃ of SU₃→PU₃); HLR is tame-only (HLR line 65); AGLR 3.7 has no tameness hypothesis (AGLR line 1222) | AGLR, not HLR, carries the wild case | No change |
| New gap: lowest IC sheaf | GL₂, μ=(1,0); μ=(2,0) | (1,0): Gr_≤μ=P¹ smooth, IC=F_ℓ[1], H^(−1)=F_ℓ; (2,0): dimension 2, open orbit dense, j_*F_ℓ=F_ℓ by unibranchness, H^(−2)(IC)=F_ℓ | Formula consistent at both bounds | No change |
| §0.1 general-bound datum | μ=0; (1,0); (2,0); central (1,1) for GL₂ | Pairings with α: 0, 1, 2, 0; Gr_≤μ: point, P¹, dimension 2, point; (1,1) is minuscule (pairing 0) with reflex F | Minuscule datum is the special case as stated | No change |
| §0.5 specification | P¹_(O_F); its blow-up at a special point; Spec O_E | Special components 1 vs 2, both reduced; the exceptional P¹ collapses so the diamond map is not a monomorphism; μ=0 gives a point | Monomorphism clause excludes the blow-up | No change |
| §1.3 hypotheses | PGL₂ at p=2; GL₂ at p=2; GL₂, μ=(2,0) | |π₁(PGL₂)|=2 excluded; |π₁(SL₂)|=1 allowed; for (2,0) LEV Theorem 4.2.7 applies but §1.3 does not state it | Narrowed below the source | R02 |
| §1.5 derived kernel | Spin→SO (D), SL_n→GL_n (A), Sp (C) | Kernels μ₂, 1, 1; orders ≤2, prime to p>2 | p>2 is in the standard range (line 234) | No change |
| §2.3 restriction target | K/F unramified quadratic, V=K, μ=(2,0); (1,0); constant weights d in rank n | ν=(2,0): dim 2 vs dim GL₂/P_ν=1; (1,0): P¹, rank 1; ranks ed and e(n−d), at d=0 points with quotient rank en | Target must be the Schubert bound | No change |
| §2.6 incidence equation | x₁y₀=π_Fx₀y₁; forget F₁ | Special fibre components x₁=0, y₀=0; chart x₀=y₁=1 gives xy=π_F, flat, special fibre xy=0 reduced; forgetful fibres P¹ over [1:0], a point over [0:1] | Flat without a smooth forgetful map | No change |
| §2.6 GSp rank 4 | Single lattice, e₁,f₁ plane | Lagrangian Grassmannian dimension 3 vs Gr(2,4) dimension 4; ⟨e₁,f₁⟩=1≠0 in every characteristic | Annihilator condition essential | No change |
| §3.2 normalization vs image | Cusp Spec k[t²,t³] | Normalization k[t] finite, birational, bijective; t∉k[t²,t³] | Not a closed immersion | No change |
| §3.4 perfection vs scheme | Spec k[ε]/ε² vs its perfection | Perfection is Spec k: nilpotents die | Equality of perfections is weaker than equality of schemes | No change |
| §4.4 tests | B₃, μ=(2,0,0), ν=(1,1,0); μ=(1,0,0), ν=0; C_n | μ−ν=(1,−1,0): ⟨·,ϖ₃⟩=0, ⟨·,ϖ₁⟩=1, ⟨·,ϖ₂⟩=0, and (1,−1,0) is the coroot of e₁−e₂; (1,0,0) has odd coordinate sum, outside the B₃ coroot lattice {Σx_i even}; C_n: μ=(r/2,…,r/2)=rϖ_n∨, test ϖ₁ | Coroot-coset hypothesis substantive | No change |
| §5.1 orbit sum | A₂ with reversal | Orbit of α₁∨ is {α₁∨,α₂∨}, sum α₁∨+α₂∨ counted once; period 4 would double it | Distinct members only | No change |
| §5.4 stabilizer | GL₂ hyperspecial, λ=(1,−1) | Ad(t^λ) scales entry (2,1) by t⁻²; 𝒢∩Ad(t^λ)𝒢={h: h₂₁∈t²O}, smooth connected jets; t^λ has a pole | Translation Laurent, conjugator positive | No change |
| §6.2 torsors | One-lattice chain; polarized chain without L | 𝒢=GL(Λ), torsors = locally free rank-h modules; dropping L changes the group from GSp-type to Sp-type stabilizer | Line L is part of the data | No change |
| §6.6 base change | xy=ϖ_E² | Dimension 2, embedding dimension 3, normal (A₁), special fibre xy=0 reduced; Drinfeld chart xy=ϖ regular | Normal, not regular | No change |
| §6.6 p=2 | F/F₀ unramified vs ramified at p=2 | Unramified allowed (SW line 7847); ramified excluded | Hypothesis matches the source | No change |
| §7.1 formula | μ=0; smooth point; node xy=π | Components 1,1,1; H⁰ of the tube of dimension 1 (point, disc, annulus) | Formula correct | No change |
| §7.3 S₂ | k[x,y]/(xy); two planes meeting at a point | (dim,depth)=(1,1) S₂ with one codimension-one edge; (2,1) not S₂, graph has two vertices and no edge | Codimension-one graph is the criterion | No change |
| §7.3 input on a split model | PGL₂ at p=2 vs SL₂ | PGL₂ admissible locus contains a non-S₂ Schubert variety (HLR line 72); SL₂ (same Ã₁ Adm) is Frobenius split and CM | The gap must say “simply connected derived group” | R01 |
| §7.4 Check | PU₃, p=3, μ=(1,0,0) | 2ρ=(2,0,−2), ⟨2ρ,μ⟩=2; |π₁|=3; costandard lowest stalk F_ℓ at the singular point by unibranchness | Mathematics holds; level unnamed | R03 |
| §7.5/§7.6 all-prime claims | PU₃ at p=3; GL₂ at p=2 | Both now reach unibranchness through the gap (lines 1024, 1044, 1056) | Owned | No change |
| Conventions: translation sign, Tate normalization | diag(t,t⁻¹); q=9, d=0,1 | Cocharacter (1,−1), displacement (−1,1) (GL line 225–227); (φ,τ)=(1,1),(1,−1/3) | Retained in every layer that uses them | No change |

Context and degenerate cases: the trivial group and μ=0 give Spd O_E, Spec O_E and a point throughout; p=2 enters only where stated (§6.1 PEL p≠2, §6.6 ramified exclusion, Dᴴ Cartan p≠2); the all-prime theorems (§§3.6, 7.5–7.6, 8.3–8.4) carry no tameness hypothesis and their unibranch input is now owned. Locally noetherian is supplied by finite type (Conventions, line 21) wherever a Serre criterion is invoked.

### Pinned declarations and object greps

Pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (lake-manifest.json of the content checkout), equal to README lines 39 and 43. The eight declarations cited there were opened in round 4 at the same pin and are unchanged. Object greps at the pins this round: “Schubert”, “unibranch”, “affine Grassmannian”, “parahoric”, “kimberlite”, “Wakimoto”, “nearby cycle”: no hit in Mathlib or Tau Ceti; “Grassmannian”: only Mathlib/RingTheory/Grassmannian.lean and two TauCeti/LinearAlgebra/TotallyReal files (Lagrangian loops, unrelated). Nothing this roadmap defines exists at the pins.

### Cross-roadmap citations and ownership

| Supplier (where read) | Resolved |
| --- | --- |
| GeometricSatakeAndFusion (#1235) | “Witt affine flags and components” (its line 825, Layer GS0), “Generic Schubert bounds”, “Integral parahoric ind-properness”, “Bounded admissible affine flag loci”, “Equal-characteristic Schubert models and coefficient comparison”, “Relative-position flag correspondences”; GS2 and GS4 layers present. No normality or unibranchness of Schubert perfect varieties. |
| RootSystemsPartII (packages/RootSystemsPartII/design/README.md) | RS2.4 at its line 410; “Existential dominant orbit-sum step” 472; “Coroot step with central directions retained” 501; “Independent continuation briefs” 590 with MB.1–MB.3 at 600. The resolver's lead “no roadmap RootSystemsPartII” is a false lead: it is a design-stage package in the merge order (line 26). |
| DiamondsAndVStacksPartII (packages/DiamondsAndVStacksPartII/design/README.md) | D10.8 (line 1150), D10.9, D10.12–D10.15 (1243–1297), D11.5 (1425), D11.11–D11.14 (1567–1649), D11.16–D11.20 (1685–1790). Same false lead, merge order line 152. |
| LefschetzPencilsAndVanishingCycles (#873) | `VanishingCycles.semisimpleTrace`, `_refinement`, `_additive` at its README lines 1411–1413: the three names are the supplier's targets, not pinned declarations (the resolver's lead is expected). |
| SchemeAndStackFoundations, ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups, PELModuli, EtaleDualityAndPerverseSheaves, ClassicalAdicEtaleCohomology, ModularCurves | Unchanged since round 4; all above this roadmap in the merge order (lines 2, 25, 27, 132, 122, 64; ModularCurves on main). |

Ownership: `roadmaps grep -i unibranch` over all open heads and main finds the word only in InverseGaloisAndArithmeticFundamentalGroups and AnabelianGeometryAndNonabelianChabauty, in π₁ contexts; no second owner of Schubert unibranchness or normality exists. The board index lists 17 packages under review; none of them (PELModuliPartII, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII among them) builds the objects of this roadmap, as round 4 found.

### Declared gaps and dependency order

plan.json `gaps` and the README contracts agree on all 42 slugs and suppliers; the `needs` sentences agree on 41 and differ on `gap:algebraic-compatible-schubert-splitting` only by a README-side locator sentence (plan.json has the statement without it), which is not a finding. Every slug is cited by a Needs line; none has supplier `none`; the new gap is precise and minimal (above). R01 concerns the precision of one older gap.

    depcheck: 56 roadmaps, 645 edges, 0 problem(s)

No UPWARD, CYCLE or moved line; the merge order file was not edited. The edge count rose by one from round 4 with the new gap.

### Shape, headlines and Lean

README shape and style: unchanged from round 4 (title, Summary, Scope, Conventions, per-supplier contracts, How to read, Layers 0–8 each with Examples and Dependencies, Downstream consumers, Worked examples, References); greps for LaTeX delimiters, process words, pull-request numbers, machine paths, `set_option`, `#eval`: none (the only “Lemma”/“lemma” hits are theorem names in citations); 27 Checks blocks; every definition section has an API list and at least three Checks.

Headlines: the module docstring of Suggested.lean names each headline family of Layers 1–8 with the carrier it lacks; no headline is statable at the pins (object greps above; `Module.Grassmannian` is a module-valued functor, not a represented scheme). The §2.8 trace-form statement is statable but is a supporting lemma. Zero declarations: nothing to probe with one tactic, no sorry'd data, no lost binders, and the `#check` audit has no names to compare.

Elaboration: `lake env lean` on packages/GeometricSatakeAndFusionPartII/Suggested.lean from the content checkout: exit 0, no output, 3 s. The file imports `Mathlib` only; no TauCeti module build was needed.

## Not verifiable

- HMS14 Theorem A.3 (the Cohen–Macaulay deformation step GL cites at GL line 296) is not in the manifest and was not fetched; R01 cites GL's own statements, which suffice for the repair.
- The published Annals text of KZ was not collated; KZ locators refer to the manifest's author version.
- Ownership against the board packages not read this round (the same six as round 4: ArithmeticLocallySymmetricSpacesPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PadicLocalLanglandsForGL2QpPartII, VStackSheavesAndLisseCategoriesPartII) is not certified; their subjects do not touch local models.

## Source issues

- **Misprint** in KZ at Lemma 5.2.5, p. 52 (KZ line 2317): the source says the translation representative lies in the positive-loop points; it should be the rational Laurent points, with only the conjugator positive, as the proof of Proposition 5.2.3 (KZ line 2192) uses; affects nothing (already recorded as this roadmap's E4).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "54b204b", "job": "REV-PKG-GeometricSatakeAndFusionPartII~5", "model": "fable", "worker": "fable-rev159"} -->
