<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6783292446 -->
Review (codex) of 1688a41

Verdict: needs_changes

1. **F01** (P1) The elliptic subfield test has coefficients outside its field

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:358`, §0.12(b), and the proof at line 362: “is isotropic over `K` for all `u₁ ∈ U₁`, `u₂ ∈ U₂`”.

   **Claim:** The indicated diagonal form detects membership in L. Its coefficients must belong to K; the proof additionally requires two regular parameters.

   **Witness:** Take L=𝔽₅(u), K=L(s), E:y²=x³+x+1, v²=u³+u+1, Q=(u,v). Then u∈U₁ but z(Q)+z(Q)=2v/u∉K. Also x∘η has pole order two when η is separable and η(P)=O.

   Here E has nine rational points, hence trace −3 and is ordinary. The constant c=2 is a nonsquare. The twist is `(u³+u+1)y²=x³+x+1` and contains (u,1). Its K-points equal its L-points: a map from ℙ¹_L to this elliptic curve is constant. The pole of u at infinity has order one, so this is permitted data for (a). Write L_u=L(v), K_u=K(v); these are fields, since u³+u+1 has odd pole order three. The quadratic involution sends v to −v, so 2v/u is not in K. The README never defines K_u and does not exclude poles of z in this clause.

   This is not fixed by inserting `u₂ ∈ K`, although that is what the cited source says. For this example every allowed Q is anti-invariant, and z=y/x is odd. Every allowed sum is anti-invariant; its intersection with K is therefore {0}, with 0 attained by Q and −Q. For t=s²∉L, the plus-convention factor ⟨1,s²⟩ already has the nonzero zero (2s,1): `(2s)²+s²=5s²=0`. Consequently the source's K-valued version accepts s² for every u₁. Independently, the proof's use of x∘η gives order −2, not −1, so its inverse is not a regular parameter. These defects are visible in poonen_uniform lines 437–441 and 459–469, Lemma 4.8 and proof, pp. 9–10. The original PDF was inspected to exclude an extraction error.

   **Exact repair:** Replace (b) and its proof, retaining the full field generality, with the following extension-valued criterion. Define L_u and K_u explicitly as the quadratic fields of (a), with involution σ. Transport E_u(K) to `G=E(K_u)^{σ=−1}`. Define `U={z(P): P∈G, P outside the poles of z} ∖ {0}`, and `V=U+U`. For t∈K assert t∈L exactly when, for all a∈U and b∈V, the form `⟨⟨t−b,a⁻¹⟩⟩_{n_K} ⊗ ⟨1,−c⟩_{n_K}` is isotropic **over K_u**. State its first-order interpretation over K using §0.4's degree-two coordinates. In the forward direction U⊆L_u and use the global-field isotropy bound over L_u. In the reverse direction use the point from §0.11(e), take `a=z∘(F^ℓ−1)` rather than `x∘(F^ℓ−1)`, and retain `b=z∘ρ₁+z∘ρ₂`. These functions are values on anti-invariant generic points; z has pole order one at O and F^ℓ−1 is separable. Thus a⁻¹ and t−b are regular parameters. Conclude anisotropy over K_u through §0.6; do not descend a form with non-K coefficients to K. Propagate this corrected criterion into (c) and the uniform-family proof of (d), with empty invalid fibres as before.

   **Repair test:** In the example above, use P₀=(2,1)∈E(𝔽₅), η=F−1, a=z∘η and b=2z. At (s,P)=(1,P₀), b=1, `s²−b=0`, its s-derivative is 2, and a⁻¹ has order one. These are regular parameters of the surface. The final binary form ⟨1,−2⟩ has no nonzero zero over 𝔽₅, so the two successive valuation tests make the repaired eight-variable form anisotropic over K_u. It correctly rejects s². For t∈L all coefficients lie in the global field L_u and the same form is isotropic by §0.6(c). Keep these as negative/positive Checks, together with the explicit order computation `ord_O(x)=−2`, `ord_O(z)=−1`. In characteristic two retain n_K=3 and the cube-root-of-unity hypothesis; the repair uses anti-invariant points, not the identity z(−P)=−z(P), which is special to the odd-characteristic model.

2. **F02** (P2) Kerz–Saito's DVR branch omits excellence

   **Location:** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:479`, §1.3: “a henselian discrete valuation ring with finite residue field of characteristic different from two”.

   **Claim:** Kerz–Saito Theorem 8.1 and the listed alteration route supply detection for all such bases.

   **Witness:** kerz_saito line 288 defines C_S over an excellent Dedekind base; lines 1829–1832 and 1852–1862 use C_S. AdicCoefficientsAndComparisonsPartII #1796, `TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:1604`, §PA.6.8, explicitly requires excellence too.

   The source does not discard its standing base hypothesis in §8. Dittmann–Pop's intended application uses henselized global valuation rings and expressly notes excellence (dittmann_pop lines 190–193). The roadmap's own detection construction in §1.1 starts with an excellent scheme. Neither henselianity nor a finite residue field implies excellence; the pinned `HenselianLocalRing` is a root-lifting condition, not an excellence assumption.

   **Exact repair:** Require an **excellent henselian DVR** in the DVR branch of §1.3, and make the corresponding ownership sentence at line 11 equally precise. Retain all proper regular flat integral models over such bases, both characteristics allowed by invertibility, and the finite-field branch. Add the source's standing-hypothesis locator, §1, p. 6, alongside Theorem 8.1, p. 37. No consumer needs a restriction to complete DVRs or to selected global places.

   **Repair test:** R=𝔽₃[[t]] and henselizations of global valuation rings remain admissible. For a negative control choose b∈𝔽₃((t)) transcendental over 𝔽₃(t), let F=𝔽₃(t,b³), and henselize the valuation ring F∩𝔽₃[[t]] inside 𝔽₃((t)). This is a henselian DVR with residue 𝔽₃ and completion 𝔽₃[[t]]. Its fraction field is separable algebraic over F and does not contain b, whereas its completion contains the purely inseparable cubic root b. The generic formal fibre is not geometrically reduced, so the DVR is not excellent. The old hypothesis accepts this base; the corrected one and both cited inputs reject it. This establishes a missing hypothesis in the claimed route, not a claimed counterexample to the detection conclusion itself.

Two findings: one P1 and one P2. All ten previous findings are repaired. The acceptance file passes elaboration, but the elliptic subfield criterion is not a form over its claimed field, and its source's apparent correction is false. The Kerz–Saito target also drops excellence. These are repairable defects, not a reason to reject the scope.

## Verified sound

### Previous findings, checked individually

The repair report marked all ten applied; none was marked not actionable. Each repaired passage was read, its witness recomputed, and the same pattern searched elsewhere. “Repaired” below concerns the previous finding, not a blanket endorsement of every consumer.

| Previous id | Repaired passage in this package's README | Status and independent check |
|---|---|---|
| R01 | Line 575: “This is a quadratic étale algebra in both cases.” | Repaired. For a₀=1 over ℚ, A=ℚ×ℚ, N(u,v)=uv; N⊥−a₁N has dimension four and a nonzero zero. It is no longer replaced by the one-dimensional norm of ℚ/ℚ. The irreducible norm branch is separate. |
| R02 | Line 187: “positive degree `1 ≤ e ≤ N`” | Repaired. g=1 and N=0 give no valid code; X²+1 gives the two-dimensional ℚ(i) algebra. Checked the bounded-root uses in §§3.3, 5.2, 5.5. |
| R03 | Line 395: “the same subset as 0.13” | Repaired. In ℚ(t), 0 gives (dependent,constant)=(true,true), t gives (false,false). The Lean negation of independence agrees. |
| R04 | Line 459: “the invariant at `2` becomes `2 · (1/2) = 0`” | Repaired. X²−X−1 reduces to irreducible X²+X+1 over 𝔽₂; the two real invariants remain (1/2,1/2). ℚ itself is correctly distinguished. |
| R05 | Line 655: “`y² = t₂ − 1`” | Repaired. At (t₂,y)=(1,0), derivative 2y=0; off t₂=1 it is invertible. The former y²=t₂ is étale everywhere on the torus. |
| R06 | Line 78: “§5.1: composed valuations”; “§5.2: coarsenings” | Repaired. All former GF citations were replaced; actual LocalFieldsRamificationPartII §§1.1–1.3, 5.1–5.3 were opened, including the henselization direction and Abhyankar bound. |
| R07 | Line 102: “arbitrary fibres of dimension at most `r`” | Repaired. SieveMethodsAndPrimePatterns §5.4 supplies the affine and fibre estimates. For the ordinary E/𝔽₂, #E=4, #𝔸¹×E=8, whereas #ℙ¹×E=12. |
| R08 | Line 1201: “one formula defines the elements integral over `Subring.closure (Set.range T)`” | Repaired. Suggested.lean:113 now states the normalization headline. Integral closure of 𝔽₂[t²] in 𝔽₂(t) is 𝔽₂[t], and the empty-basis normalization of ℚ is ℤ. |
| R09 | Line 280: “a universal property over `L`”; line 282: “including all nonreduced overlaps” | Repaired. Universality is over the ground field, separable base change gives an isomorphism, and purely inseparable comparison is only an isogeny. Over L′=L(α), α²=s, the two images differ by ε≠0 with ε²=0; full descent detects this. The ample bundle now has a cocycle. |
| R10 | Line 1227: “Bounded finite-algebra interpretations and the dimension-one arithmetic core … produce the definable comparisons” | Repaired. Layer 7 is organized by these dependencies and fraction-field transfer, with no declaration that the source's exposition dictates the order. |

The changed Albanese proof was checked against wittenberg_albanese lines 1030–1073 (Appendix A, pp. 26–27), achter_casalaina_vial lines 46–77 and 166–168, and the actual Serre scan at Théorème 5, p. 10-10 (serre_albanese lines 431–458). Serre's geometric universal target is only used to bound the maximal construction over the separable closure. The new finite separable point input and polarized descent input exist at their cited owners. The new counterexample R01 concerns a distinct downstream use of elliptic coordinates; it does not reinstate the old Albanese descent defect.

### Principles, shape and scope

Read the complete 74 target subsections in nine layers, their APIs, Checks, worked examples, supplier contracts and dependency lists. Read main's AlgebraicCurves, GlobalQuadraticForms and Completed/RealAlgebraicGeometry for shape. The package is a Part II extension of the base logic roadmap's quotient/interpretation interfaces; it does not replace that roadmap. Its mathematics covers all geometric divisors, inseparable finite normalizations, split quadratic étale algebras and the required characteristic-two branches. No chosen-model-only divisor shortcut, algorithmic deliverable, copied source exposition, source-chapter layer name, forbidden supplier, process narrative, HTML anchor, machine path or pull-request number was found in the roadmap text. All nine layers have Examples and Dependencies; the definitions have mathematical operations/properties and discriminating Checks. R01 identifies the deficient coefficient-field convention and its missing definition.

The layers' order is supported by their dependencies: uniform predicates → local–global detection → test forms → compactness/coarsening → stabilizers → divisor formulas → normalizations → bi-interpretation → sentences. The normalization and arbitrary-field Albanese additions remain mathematical extensions of their named suppliers. No additional missing headline or padding was found.

### Seeded source sample

All fifteen requested targets were checked at the supplied versions. No author-flagged unverified locator was found beyond the four settled uncertified works described below. There are eighteen distinct manifest work keys, fourteen certified and four uncertified; every referenced work is represented. The source service reused poonen_uniform when checking the original PDF and the legal author copy; no duplicate work key or new missing-text request was made. Original version numbering and content hashes were retained.

| Sample | Source locator actually read | Result |
|---|---|---|
| 0.12 | poonen_uniform lines 415–480, Lemmas 4.7–4.9, pp. 9–10; lines 482–495, Proposition 4.10, pp. 10–11 | Twist and relatively closed-field construction located. Lemma 4.8 and its use fail R01; matching a printed claim does not certify its truth. |
| 0.13 | poonen_uniform lines 53–58 and 501–504, Theorem 1.3 and proof, pp. 2, 11 | One formula, all finitely generated fields, including the empty-family finite-field case. Its upstream proof needs R01. |
| 0.14 | poonen_uniform lines 511–542, Lemma 5.2 and Theorem 1.4 proof, pp. 11–12 | Relative global field is relatively algebraically closed; both absolute and relative dependence, positive-characteristic reduction and empty tuples checked. |
| 0.16 | dittmann_pop lines 597–610, Notations/Remarks 4.1(1)–(2), pp. 13–14 | k_t=k_u, relative closure, and one-variable residual transcendence degree. |
| 1.1 | dittmann_pop lines 140–171, §2(b) and Kato complex, pp. 4–5; kerz_saito (0.4), p. 2 | Mod-two/logarithmic branches and top degree indexing agree. Kato's original residue construction remains uncertified under its settled key. |
| 1.3 | kerz_saito line 288, §1, p. 6, and lines 1821–1868, Theorem 8.1, pp. 36–37; dittmann_pop lines 190–203, Fact 2.2, p. 5 | Finite coefficients and positive degree agree; missing excellent base is R02. |
| 1.4 | jannsen_hasse lines 180–197, Theorem 0.6, p. 5; lines 1889–1897, Definition 4.18, pp. 39–40; dittmann_pop lines 204–225; cossart_piltant lines 162–167, HAL p. 5 | Positive d, both resolution clauses, projectivity and d≤3 unconditional model existence retained. No confusion between availability of a smooth model and vanishing for a given model. |
| 3.6 | dittmann_pop lines 530–586, Proposition 3.10, pp. 12–13, and Lemma 3.9, p. 11 | Finite intersection property in the full patch space, not its rank-one subspace; all N before taking the limit. |
| 4.4 | dittmann_pop lines 614–618, Notations/Remarks 4.1(5), p. 14 | Strict inequality, integer threshold and explicit zero branch agree. |
| 4.6 | dittmann_pop lines 619–640, Theorem 4.2(1) and both inclusions, p. 14 | Odd outer order converts ≤ to <; both root equations split in the henselization in the reverse inclusion. |
| 6.5 | dittmann_pop lines 715–732, Proposition 5.1, Case 2, p. 16 | Full geometric flags then arithmetic place; the package corrects the source's rank-one index slip. |
| 6.9 | dittmann_pop lines 694–765, Proposition 5.1, Lemma 5.3 and Remark 5.4, pp. 16–17 | Fixed dimension/basis length, arithmetic constants and all prolongations; prime-subring integral closure equals the stated R_T. |
| 7.4 | akns lines 959–981, 1014–1025, 1063–1135, Theorem 3.1 and proof, pp. 21–24 | Infinite finitely generated domain, finite normalization/free module route, conductor localization and definable comparison all retained. |
| 8.3 | dittmann_pop lines 44–46, Theorem 1.1, p. 2; Mathlib finite-field uniqueness at the pin | Finite case follows from exact cardinality plus field axioms. The theorem is on p. 2, as the package says. |
| 8.5 | dittmann_pop lines 44–54 and final paragraph p. 17, Theorems 1.1–1.2 | Resolution condition belongs to K only; the comparison field L is any finitely generated field. |

### Computed adversarial table

The table covers the seeded targets, every headline, the changed mathematical passages and both findings. “Pass” records survival of these tests, not a proof of an admitted theorem. For unchanged material the computed controls in the round-2 independent report were reused only where that report supplied actual values (its adversarial table); its abbreviated elliptic assessment was replaced by the full R01 computation. All newly changed statements and the seeded targets were reconsidered. The remaining unmodified targets were read against those controls, with the finite/global field, zero-denominator, empty-family, inseparable and characteristic-two hypotheses kept explicit.

| Statement | Instances | Values on the two sides / exclusion test | Result / change |
|---|---|---|---|
| 0.1 dimension | 𝔽₉, ℚ, ℚ(s,t), 𝔽₂(s,t,u,v) | δ=0,1,3,4; resolution trigger=false,false,false,true | Pass. |
| 0.2 geometric divisor | t-adic ℚ(s,t), 2-adic ℚ, trivial valuation | Residue δ: 3→2, 1→0, unchanged; characteristic equality: true,false,true; trivial ring is a field | Only first is geometric. |
| 0.3 failed fibres | False parameter guard; empty raw divisor intersection | Guarded fibre=∅; raw intersection=K, properness=false | Pass; no spurious K fibre. |
| 0.4 bounded field codes | g=1; N=0; g=X²+1 over ℚ | Degree=0 violates 1≤e; no e for N=0; quotient dimension=2 and 0≠1 in third case | Previous repair passes. |
| 0.5 smooth coordinates | 𝔽_p(s)[X]/(X^p−s) | Derivative=0; residue inseparable degree=p; separable-coordinate hypothesis=false | Excluded correctly. |
| 0.6 signs | Plus (1,1) and minus (−1,−1) over ℝ | Both are sum of four squares, zero locus={0}; minus slot +1 has zero (1,1) | Convention agreement retained. |
| 0.7 global arithmetic | ℚ, 𝔽₃(t) | Integral rings ℤ and 𝔽₃[t]; v₂(1/2)=−1, v_t(1/t)=−1; constants ℚ and 𝔽₃ | Rings and constant predicates are distinct. |
| 0.8 dimension headline | n=0,1,3 on 𝔽₄, ℚ, ℚ(s,t) | δ=0,1,3; matching n gives true, other two values false | Uniform sentence precedes K. |
| 0.8a Albanese | ℙⁿ; E; L′=L(α), α²=s | Alb=0; Alb(E)=E, identity induces id; α⊗1−1⊗α=ε≠0, ε²=0 | Correct trivial/identity cases and nonreduced descent control. |
| 0.8a ample cocycle | Factors indexed by finite Galois group; g,h | Two reindexings send i to (gh)i, same as product; identity sends i to i | Scheme and line-bundle data both supplied. |
| 0.10 characteristic headline | ℚ; characteristic 2; odd characteristic p | [ℤ:2ℤ]=2; 2=0; in odd p, 2·((p+1)/2)s=s so Z=2Z | Intended characteristic distinction, including non-FG positive-characteristic fields. |
| 0.11 affine count | y²+xy=x³+1 over 𝔽₂ | #E=4, trace=−1 odd; #𝔸¹×E=8; #ℙ¹×E=12 | Repaired affine supplier passes. |
| 0.12 regularity | L=𝔽₂(s²)⊂𝔽₂(s,t) | s is algebraic of degree two outside L; after adjoining √(s²), tensor has nonzero ε with ε²=0 | Relative algebraic closedness is necessary. |
| 0.12(b) coefficient field | E/𝔽₅, u,v,Q as R01 | #E=9, trace=−3; z(Q)+z(Q)=2v/u; σ(2v/u)=−2v/u≠2v/u | Fail: not a K-form. |
| 0.12(b) apparent source repair | Impose U₂⊆K, then t=s² | U₂={0}; t∈L=false; ⟨1,s²⟩(2s,1)=0 for every u₁ | Fail: source version also accepts an outsider. |
| 0.12 proof and replacement | η separable killing P; replacement at (s,P)=(1,(2,1)) | ord_P(xη)=−2, ord_P(zη)=−1; s²−2z=0, ∂/∂s=2; 2∉𝔽₅² | Replace x by z and work over K_u; outsider rejected. |
| 0.13 constants headline | 𝔽₉; 𝔽₉(t); ℚ(t) | Constant sets=𝔽₉,𝔽₉,ℚ; 0 algebraic=true, t algebraic=false; empty intersection in finite case=K | Statement passes; proof requires R01. |
| 0.14 dependence headline | Empty tuple; (0); (t); (s,s²); (s,t) | Dependence=false,true,false,true,false; relation in fourth case X₂−X₁²=0 | Repaired singleton Check and both directions agree. |
| 0.15 maximal global family | 𝔽₉; ℚ(t); 𝔽₂(s,t) | Family empty; singleton ℚ; relative closure of 𝔽₂(s) included but 𝔽₂(s²) excluded | Correct field guards. |
| 0.16 relative constants | K=ℚ(s,t), u₂=s; characteristic two analogue | k_t=k_u=ℚ(s); trdeg(K/k_t)=1; derivatives 2s−1≠0 and −1=1≠0 | Separable quadratic change, not p-th-power change. |
| 1.1 real places | Hamilton class over ℚ(√5) | Finite invariant at 2: 2·1/2=0; real pair=(1/2,1/2); all finite residues=0 while class≠0 | Repaired negative control passes. |
| 1.1 odd degree | Restriction/corestriction degree 3 versus 2 | On ℤ/2 multiplication is 1 versus 0; Hamilton class dies over ℚ(i) | Injectivity needs odd degree. |
| 1.2 local–global degree | K=ℚ and ℚ(t) over ℚ | r+2=2 and 3; δ(K)+1=2 and 3; real triple symbol remains nonzero while finite degree-three groups vanish | Degree and real factors retained. |
| 1.3 finite/DVR base | Smooth proper 𝔽₃-curve; X=Spec 𝔽₃[[t]] | d=1, cohomological degree=2; in DVR case K_w=K and restriction=id | Correct supported cases. |
| 1.3 excellence | R from R02 versus 𝔽₃[[t]] | Henselian=true,true; residue size=3,3; excellent=false,true; current admissibility=true,true, corrected=false,true | Missing source hypothesis R02. |
| 1.4 positive dimension | 𝔽₄; 𝔽₂(t); 𝔽₂(s,t,u) | d=0: H¹=ℤ/2, codimension-one sum=0; d=1: degree2; d=3: smooth ℙ³, degree4 | d=0 excluded; d=3 unconditional. |
| 1.4 dimension four | 𝔽₂(s,t,u,v) and a general d=4 field | ℙ⁴ supplies model in rational case; arbitrary model existence not provided by d≤3 theorem | Conditional RS hypothesis retained. |
| 1.5–1.6 coefficient choice | char 2, n=3; char odd, n=2 | n invertible in both; n=2 in char2 gives 0 | No same-characteristic cyclic Kummer substitution. |
| 2.2 norms | Split ℚ×ℚ; unramified ℚ₃(i) | N(u,v)=uv; N(1+i)=2; norm valuation even, so v₃(3)=1 excludes 3 | Split repair and field-norm converse agree. |
| 2.7 shrinking | y²=t₂−1 versus y²=t₂ on ℚ-torus | At t₂=1, first derivative=0; second y²=1 makes 2y invertible | Previous repair passes. |
| 3.4 divided slot | u=2, ε=1 | a=u²−u−ε=1; a/u²=1/4; 1−1/u−ε/u²=1/4, plus sign gives3/4 | Source sign corrected in roadmap. |
| 3.6 limiting detector | Lexicographic ℤ², a_d=y, lower x | (1,0)>N(0,1) for every N>0; in ℤ with x-value>0 some N defeats the inequality | Full patch space essential. |
| 3.7 coarsening | Same lexicographic example | Prime consists of positive first-coordinate values; y maps to1, x to0 after coarsening | Lower slots become units, top remains positive. |
| 4.1–4.2 stabilizer | ∅, K, t²O | Stab(∅)=Stab(K)=K; v(xt²)≥2 iff v(x)≥0 | Guarded properness and correct DVR stabilizer. |
| 4.3 detecting support | a_d nonzero constant; unique odd-order zero | Positive support empty; singleton {w} with w(a_d)=1 | Finite support excludes poles. |
| 4.4 strict balls | w(a)=1 or3, w(τ)=0,1,2; τ=0 | Membership (false,true,true) or (false,false,true); B=𝔪 or𝔪²; explicit zero branch=true | Correct strict threshold and ord(0) convention. |
| 4.6 union identity | V_a=∅; singleton with w(a)=3 | Both sides ∅; singleton both 𝔪², orders1/2 give false/true; order∞ at0 gives true | Both inclusions match the root-field test. |
| 4.7–4.8 ring intersection | Places t=0,1; x=t/(t−1); singleton | Values (1,−1), inverse (−1,1); neither in intersection. Singleton stabilizer=O | Two-place ring fails valuation alternative; singleton survives. |
| 5.2 guard | Zero slot; empty V; two places; one place | Fibres ∅,∅,∅,O respectively after guard/properness/inverse test | No arbitrary failed fibres. |
| 5.5 characteristic-two threshold | n=3, β=1 | Old 2n=0, value∞ and ∞>∞ false; corrected n=1 in field, value0 and ∞>0 true | Source error not propagated. |
| 5.6 shifted product | R_f=R_g=1+𝔪 at single P | (1+𝔪)²=1+𝔪, subtract1 gives𝔪; pole order divisible by n gives symbol residue0 | Product/stabilizer and coprime pole condition correct. |
| 5.7 divisor headline | Finite field; ℚ; 𝔽₂(t); ℚ(s,t) exceptional divisor | No eligible geometric DVR in first two; δ drops1→0 and3→2 in last two | Empty cases and all divisors covered, including exceptional ones. |
| 6.3 height-one intersection | A=k[t²,t³] versus k[t] | t integral via X²−t² but not in A; normalized ring contains t | Normality essential and retained. |
| 6.5 full flags | ℚ(s,t), s=1 then t=1; empty flag over ℚ | First residue ℚ(t), δ2; full residue ℚ, δ1; empty flag leaves ℚ | Arithmetic terminal place only after full flag. |
| 6.7 coefficient detector | (s+2)/3, s↦−1, prime3; g=s+1 over𝔽₃ | Value −1; g(0)=1 but0 not a root of unity; g(1)=2≠0 and1 is | Arithmetic terminal place and residue torus needed. |
| 6.8 all prolongations | ℚ(i), x=1/(2−i) | Order at2+i=0; at2−i=−1 | Selecting one prolongation would falsely admit x. |
| 6.9 normalization headline | ℚ,T=(); 𝔽₂(t),T=t²; 𝔽₄,T=() | Closures ℤ,𝔽₂[t],𝔽₄; 2 integral,1/2 not; t integral via X²−t²,1/t not | Native predicate includes inseparability and empty basis. |
| 7.2 coding | Binary coefficient codes n=1,2 | All digits0→polynomial0; n₁=1→constant1; sum begins i=1 | Corrected source index. |
| 7.3 arithmetic core | ℤ[√5] | (1+√5)/2 integral but absent; after inverting2 it belongs | No false assertion that every core is already Dedekind. |
| 7.4 bi-interpretation headline | Finite𝔽₄ versus ℤ[t] | Every finite power/quotient of𝔽₄ finite, cannot yield infiniteℤ; ℤ[t] infinite FG domain | Infinite hypothesis discriminates. |
| 7.5–7.6 field transfer | ℤ fractions (1,2),(2,4) | Cross-products both4; both classes map to1/2; denominator0 excluded | Actual definable comparison, not mere mutual interpretations. |
| 8.1–8.2 expanded language | ℚ with total inverse | Empty tuple generates under0,1,+,−,·,inv; finitely many ring generators invert only finitely many primes; inv(0)=0 | Correct finite-generation language. |
| 8.3 finite sentence | θ₄ on𝔽₄,𝔽₂,ℤ/4; one-element ring | Cardinality conjunct true,false,true; field conjunct true,true,false; singleton fails0≠1 | Combined true,false,false; no q=1 field. |
| 8.4 domain sentence headline | B=ℤ, S=ℤ,𝔽₂, zero ring | Ring-equivalence existence true,false,false | Domain only on B; comparison class is FG commutative rings. |
| 8.5 field sentence headline | K=𝔽₄, L=𝔽₄,𝔽₂,𝔽₄(t) | Isomorphism existence true,false,false; cardinalities4,2,infinite | L has no resolution restriction. |

### Acceptance file, signatures and padding

The headline inventory is fixed Kronecker dimension (§0.8), characteristic (§0.10), uniform constants (§0.13), uniform dependence (§0.14), uniform geometric divisors (§5.7), uniform finite arithmetic normalization (§6.9), arithmetic bi-interpretation for infinite domains and fields (§§7.4, 7.6), and single sentences for domains and fields (§§8.4, 8.5). Suggested.lean states all eight statable formula/sentence headlines. The two bi-interpretation results are named in the module docstring with the missing interpretation/homotopy carriers. The conditional high-dimensional characteristic-two extensions are also explicitly named with their missing resolution carrier. There is no substitute theorem in place of either missing carrier. Finite-field sentences are covered by the field headline and need no extra boundary-case theorem.

Ran the prescribed `lake env lean` on `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean` from the pinned content checkout: exit 0, exactly eight `declaration uses sorry` warnings, at lines 54, 62, 73, 81, 93, 113, 128, 139. No other warning. The single import is `Mathlib`; no Tau Ceti module build was needed. There is no sorry'd data, `set_option`, admitted example, free stand-in predicate or hidden section hypothesis.

A scratch copy with `#check @name` for all ten declarations elaborated. Compared every resulting type with the README: two definitions and eight theorems, no lost binders. In particular normalization quantifies over d,e before the formula and over fields/bases afterward; it uses genuine `IsIntegral`, not a free predicate. The last field signature places hK on K only. All ten names appear in the README. Other backticked mathematical symbols are notation, and the apparently missing supplied declaration names resolve to their owners below.

Every one of the eight sorried theorems was tried with `simp`, `rfl`, and `infer_instance` in a scratch copy; all eight reached the fallback marker, none closed. The probe itself elaborated; its deliberate failed-tactic linter messages are not package warnings. Direct-library-lemma candidates were compared at the pins: field Krull dimension zero is not Kronecker dimension, fixed polynomial zero-locus definability is not uniform integral-closure/constant-field definability, and finite-field uniqueness is not characterization of every finitely generated field. The finite-module integrality lemma assumes a finite module and provides no uniform formula. No matching single-lemma proof or padding was found.

### Pinned declarations and duplication by object

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths in this table are repository-relative library paths. The listed definitions were opened, not inferred from their names.

| Pinned file and line | Meaning checked |
|---|---|
| Mathlib/ModelTheory/Algebra/Ring/Basic.lean:59, :156, :223 | Language.ring has +,·,−,0,1 and no inverse; CompatibleRing identifies semantics with operations; compatibleRingOfRing supplies it. |
| Mathlib/ModelTheory/Semantics.lean:526, :627; Mathlib/ModelTheory/Definability.lean:54 | Formula.Realize, Sentence.Realize and Set.Definable; fixed-structure definability does not itself provide uniform arithmetic formulas. |
| Mathlib/Algebra/Field/Subfield/Basic.lean:458 | Field.FG means finite generation by subfield closure, not finite generation as a ring. |
| Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45; Defs.lean:54, :173 | Cardinal-valued trdeg, injectivity of polynomial evaluation and maximal independent transcendence basis. |
| Mathlib/FieldTheory/AlgebraicClosure.lean:39; Mathlib/RingTheory/Algebraic/Defs.lean:45 | Relative algebraic closure as integral closure inside an extension; IsAlgebraic uses a nonzero polynomial. |
| Mathlib/Algebra/CharP/Defs.lean:154; Mathlib/FieldTheory/Finite/GaloisField.lean:260 | ringChar; FiniteField.ringEquivOfCardEq with Fintype data. |
| Mathlib/RingTheory/Valuation/ValuationSubring.lean:37, :298 | ValuationSubring allows the whole field; ofPrime is localization/coarsening. |
| Mathlib/RingTheory/Valuation/LocalSubring.lean:117 | exists_le_valuationSubring, the domination/extension input. |
| Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56; LocalRing/ResidueField/Defs.lean:28 | DVR includes the nonfield condition; residue field is the maximal-ideal quotient. |
| Mathlib/RingTheory/Henselian.lean:95 | HenselianLocalRing has local root-lifting data; it does not assert excellence or completeness. |
| Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054 | QuadraticMap.Anisotropic means the zero fibre has only zero; no Pfister theorem is hidden in the predicate. |
| Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:53; Algebra/Basic.lean:223 | IsIntegral is a monic-polynomial witness; integralClosure has that carrier. |
| Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:74; Localization/FractionRing.lean:52; FiniteType.lean:39 | Normal-domain predicate, fraction localization at non-zero-divisors, finitely generated algebra. |
| Mathlib/RingTheory/KrullDimension/Field.lean:24 | ringKrullDim(field)=0, whereas δ(ℚ)=1; not a duplicate headline. |
| Mathlib/ModelTheory/Algebra/Ring/Definability.lean:29 | mvPolynomial_zeroLocus_definable treats a fixed finite polynomial system, not unbounded integral dependence. |
| Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:561 | HeightOneSpectrum.iInf_localization_eq_bot assumes Dedekind; §6.3's arbitrary-dimensional normal Noetherian theorem is strictly broader. |
| TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96, :196, :209 | Full valuation spectrum patch topology, compactness and clopen basic sets; these are imported, not replanned. |
| TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103, :132, :145, :167 | Place is normalized and trivial on constants; integers and integer ord; ord(0)=0 is the actual junk convention. |
| TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:145 | Nonzero element with prescribed orders at finitely many places. |
| TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean:247; StrongApproximation.lean:88 | Single pole of prescribed sufficiently large order; strong approximation with an omitted place. Constants and function-field hypotheses were retained. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84 | IsAlbanese is a pointed factorization property, not arbitrary-field existence. |
| TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43 | Nonempty smooth scheme over any field has a point over a finite separable extension. |

Object searches covered the pinned libraries, main, board packages and the authorized open-head roadmap service: interpretations/bi-interpretation, Albanese, normalizations and height-one intersections, Kato homology, valuation composition and patch topology, quadratic norms, and arithmetic coefficient descent. No second owner of the uniform arithmetic constructions was found. Kronecker dimension is explicitly imported from QuadraticFormInvariantsPartII; the small native definition is retained solely to state headlines. The new rational Albanese existence is beyond the pointed characteristic-zero result, and the general normal Noetherian intersection is beyond the pinned Dedekind theorem.

### Supplier resolution, overlaps and order

Read the board-package index before resolving apparent absences. The base LogicAndDefinabilityInNumberTheory package exists at board #164, head 8d875d1; its §§0.1–0.4 supply quotients, interpretation semantics, fractions and arithmetic bridges. LocalFieldsRamificationPartII exists in the board checkout. Neither absence from the open-roadmap-only resolver is a missing supplier.

| Supplier file, at main or supplied head | Sections and resolved objects |
|---|---|
| packages/LogicAndDefinabilityInNumberTheory/README.md:160, board #164 | §§0.1–0.4; interpretation quotient/semantics/fraction bridge. Homotopy remains an explicit declared gap. |
| packages/LocalFieldsRamificationPartII/README.md:384, :402, :423, :1086 | §§1.1–1.3, 5.1–5.3; prolongation, henselization, composition, coarsening and Abhyankar. |
| TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:676, #1834 | §§1.1, 1.2, 1.5; §§2.5, 3.1, 3.7–3.9; §§4.1–4.3, 5.6–5.7, 6.3, 6.5, 7.2. Compared norms, coefficient degrees, characteristic-two slot conversion, non-FG dimension theorem and arbitrary-rank isotropy loci. |
| TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:1832, :9281, #853 | §§3.5, 7.5; polarizedDescentComparison includes scheme and ample-bundle cocycles; finite normalization, valuation_prolongation_integrality and root_coefficient_descent cover all prolongations/multiplicities. |
| TauCetiRoadmap/AdicCoefficientsAndComparisonsPartII/README.md:1604, :1632, #1796 | §§PA.6.8, PA.6.10, prime-to-ℓ and odd-degree alterations; excellence mismatch is R02. |
| TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2074, :3505, #858 | §§R02.3.2, R02.4.4; global class formation and restricted-ramification cohomological dimension. Cyclic function-field Hasse norm remains the declared gap. |
| TauCetiRoadmap/FunctionFieldArithmetic/README.md:2406, #1474 | §5.8, constant-field-degree-compatible Chebotarev, including infinitely many split places. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:963, :1400, :2921, #849 | §§A1.8, A3.1, A6.5; Weil extension, isogenies and complete reducibility. |
| TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3109, #852 | §5.1; inertia criterion and isogeny invariance of good reduction. |
| TauCetiRoadmap/ColemanIntegrationPartII/README.md:637, #1360 | §4.0b, NaturalIntegration.properAlbanese_exists, pointed characteristic-zero existence. |
| TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3582, #1495 | §5.4, SieveLangWeil.lang_weil_uniform, affine estimates and arbitrary fibre upper bounds. |
| TauCetiRoadmap/WeilConjectures/README.md:1335, WC.5 §5.29 | Curve RH from the surface bound supplies the projective curve estimate; it is not used for arbitrary affine fibres. |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2410, :2458, #873 | §§3.4–3.5, Veronese pencils and finite-field descent. |
| TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2254, :2308, #929 | §§7.12, 7.15; weights with invertible coefficient prime. |
| TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:160, #1313 | §0.5b, Gersten support input; this is not ownership of the package's arithmetic Kato detection theorem. |
| TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:486, :512, #1281 | §§3.0–3.0a, Milnor/logarithmic symbols, residues and norm-residue comparison. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:5697, #875 | §11.2 includes field cohomological dimension under transcendence degree before its polydisc application; the heading alone would not resolve this citation. |
| TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:616 | §0.21, Mertens's second theorem. |
| TauCetiRoadmap/AlgebraicCurves/README.md:403, :478, :712, :1468 | Layers0,2,6,12; places, Dedekind bridge, extensions, function-field/curve dictionary. |
| Completed/Chebotarev/README.md:410; Completed/GlobalNumberFields/README.md:259, :439 | Chebotarev Layer10; number-field weak and strong approximation Layers1,6. |
| TauCetiRoadmap/GlobalQuadraticForms/README.md:769; Completed/RealAlgebraicGeometry/README.md:130 | §5.5 Hasse–Minkowski including real places; ordered real-closure existence. |
| TauCetiRoadmap/ClassFieldTheory/README.md:1638, :1924 | Layers10,13; Brauer invariant sequence and number-field cyclic norm theorem. |
| TauCetiRoadmap/EllipticCurves/README.md:423, :683, :793, :1154, :1200 | Layers1,3–6; isogenies, finite/local fields, twists, Mordell–Weil. |
| TauCetiRoadmap/JacobianChallenge/README.md:448 | LayerF, pointed curve Albanese universal property. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:1160, :1448, :4001 | §§0.12, 0.20, 2.15; henselizations, Nagata normalization, cohomological inputs. |

The seven supplied resolver leads are thus accounted for: the two board roadmaps and the five supplied names ArithmeticCoefficients.root_coefficient_descent, ArithmeticCoefficients.valuation_prolongation_integrality, ModuliDescent.polarizedDescentComparison, NaturalIntegration.properAlbanese_exists and SieveLangWeil.lang_weil_uniform. No absent name was silently treated as a pinned declaration.

The overlaps report contains no conflicting head, dropped cited id or revision-only id. Its closest heads were read: QuadraticFormInvariantsPartII #1834, AdicCoefficientsAndComparisonsPartII #1796, MotivesAndAlgebraicCycles #1313, HeightsRationalPointsAndObstructions #1017 and EtaleDualityAndPerverseSheavesPartII #1743. Their quadratic/alteration, motives, heights and quasi-excellent duality objects are imported or distinct; none also owns the uniform divisor/normalization/bi-interpretation targets. No movement of ownership or new upward supplier is proposed.

The exact dependency command requested in the brief completed with exit 0 and output:

```text
depcheck: 236 roadmaps, 2154 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Read all individual Needs lines as well as the coarse layer dependencies. The two gaps have matching slugs and named suppliers in design/plan.json and Exact supplier contracts: biinterpretation-homotopy (base logic §0.2) and function-field-cyclic-hasse-norm (ArithmeticGaloisDuality §R02.3.2). They state precise missing interfaces, neither duplicates an identified earlier theorem, and neither is a finding. Their discharge remains required before implementation can consume them.

## Not verifiable

- The primary texts of kato_hasse, merkurjev_suslin, moret_bailly and lenstra_cm remain settled uncertified. Their recorded locators are retained, with no repeated request. Available citing papers corroborate their uses but do not certify the unavailable primary proofs.
- Jannsen's arXiv v2 theorem numbers were read directly. The package discloses the published-numbering crosswalk; that crosswalk was not independently checked against the published typesetting.
- The cached Stacks extraction supplies tag056V. For the unchanged formal-coordinate and height-one arguments, the prior round's computed checks and exact-tag citations were retained; a fresh chapter-wide verification of Resolution of Surfaces was not performed. The dimension-three resolution theorem was read directly in Cossart–Piltant.
- Ownership against unspecified open pull-request files was not independently checked. Main, the supplied board index/packages and the authorized roadmap-service head results were used. No claim of global absence is based only on the board checkout.

The former OCR limitations for serre_albanese Théorème5 and rumely p.211 are resolved: rendered their cached legal PDFs and read the printed pages. Rumely's coefficient map is explicitly stated there, with definability left as an exercise, and agrees with the corrected positive-index coding used here.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9: the source says K-valued sums of the chosen z-coordinates detect L; it should use extension-valued coordinates and test the corrected form over K_u; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says x composed with the separable endomorphism has a simple pole; it should use z=y/x, since x has a double pole; affects the proof.
- **Misprint** in dittmann_pop at Proposition 3.10, Claim 1, p. 12: the source says the divided slot has a positive epsilon term; it should have a negative epsilon term because a=u²−u−ε; affects the proof.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says arithmetic composites are indexed by rank-one W_T; it should use full geometric flags ending in a number field; affects a stated result.
- **Misprint** in dittmann_pop at Lemma 5.3, Claim, p. 17: the source says a tuple avoiding the polynomial zero set has root-of-unity coordinates; it should first choose that tuple in the residue torus; affects the proof.
- **Error** in pop_eei2 at Notation 3.5, p. 2102, and Recipe 5.1, p. 2109: the source says the strict threshold uses v(2n) also in characteristic two; it should use v(n) there because 2n=0; affects the proof.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says its finitely generated arithmetic core is necessarily Dedekind; it should invert a nonzero conductor element before invoking normality; affects the proof.
- **Misprint** in akns at §2.9, p. 19: the source says the characterizing sentence ranges over every structure; it should restrict to finitely generated structures as the surrounding definition requires; affects a stated result.
- **Misprint** in akns at Lemma 3.8, p. 23: the source says the coefficient sum starts at zero although its digits start at one; it should start at one; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1688a415ecce8234f35edbf504fd7c37c9496575", "job": "REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
