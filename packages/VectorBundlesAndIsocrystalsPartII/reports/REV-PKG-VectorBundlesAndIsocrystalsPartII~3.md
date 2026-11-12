<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13086#issuecomment-6782316388 -->
Review (codex) of d084f7f

Verdict: needs_changes

1. **F01** (P3) Forgetting semilinearity does not identify the Tate twists

   **Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:40`, Conventions, third SemilinearRep Check: “A notion that forgot semilinearity would make them isomorphic.”

   **Claim.** Forgetting semilinearity makes the continuous Galois representations C(1) and C isomorphic.

   **Witness.** For K=ℚ_p, C^{G_K}=ℚ_p≠0 whereas C(1)^{G_K}=0. An equivariant additive isomorphism would identify these invariant subgroups. Dropping semilinearity does not change them (PadicPeriodRings §2; Fontaine03 line 213 also gives full faithfulness).

   The stronger zero-Hom assertion follows directly from this package's §0.2, README:155 and :166: full faithfulness makes a continuous additive equivariant map multiplication by an element of H⁰(G_K,C(−1))=0. Merely omitting the semilinearity law from the object structure does not erase the action, continuity or equivariance of morphisms. The first sentence of the Check is correct; its proposed wrong model is not.

   **Exact repair.** Replace the quoted sentence by: “Forgetting the Galois action gives isomorphic one-dimensional C-vector spaces; forgetting only C-linearity of morphisms retains the zero equivariant Hom group by §0.2.” Alternatively delete that sentence: the other three Checks already test the defining structure.

   **Repair test.** For finite K/ℚ_p, Hom_C(C(1),C)=C after forgetting the action, with the identity of the underlying line invertible. In the continuous additive equivariant category the same Hom is 0. The repaired contrast computes C versus 0, rather than claiming that dropping a redundant morphism condition creates an isomorphism. This is a Check correction, not a defect in Fontaine full faithfulness.

2. **F02** (P3) The coefficient estimate needs a positive index

   **Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md:626`, §3.4: “The coefficients `p^k/k!` of `A` at odd `p` have valuation at least 1”, followed by the assertion `k + s_2(k) ≥ 2` at p=2.

   **Claim.** The coefficients of the exponential unit A all satisfy the displayed positive valuation bounds.

   **Witness.** At k=0, p⁰/0!=4⁰/0!=1, so v_p=0; also 0+s₂(0)=0. Thus neither 0≥1 nor 0≥2 holds. A has constant coefficient 1, as the desired unit congruence requires.

   **Exact repair.** Say “For k≥1, the nonconstant coefficients …” before the estimates. Retain the constant coefficient 1 separately when concluding A∈1+pℤ_p{X}, respectively 1+4ℤ₂{X}. Add k=0 to the coefficient Check, or explicitly record A(0)=1 in that calculation.

   **Repair test.** At p=3 and k=0,1,2,3,6,9 the valuations are 0,1,2,2,4,5. At p=2 and k=0,1,2,3,4 they are 0,2,3,5,5. For k≥1, v_p(pᵏ/k!)=k−v_p(k!)≥1 at odd p and v₂(4ᵏ/k!)=k+s₂(k)≥2; both tend to infinity. The repaired estimates prove exactly the intended unit congruences. The corrected tower and its degrees remain valid.

Two P3 findings; no P1 or P2 findings. The five previous findings are repaired. Both remaining corrections concern explanatory text, not the headline signatures. The authored package files were not changed.

## Verified sound

### Previous findings, checked before the new pass

All five findings in the previous review were marked applied, not “not actionable”; there is no settled finding being re-raised. The following passages were checked against the actual package and sources, not accepted from the repair report alone.

| Previous finding | Repaired passage and location | Status and verification |
| --- | --- | --- |
| R01: wrong base exponential and character normalization | README:624: “Put `A = exp(pX) = E_1^p` for odd `p` and `A = exp(4X) = E_2²` at `p = 2`.” README:630 divides the trace component by ψ₁(γ). | **Repaired.** CN25 lines 1061, 1068 and 1077 fix the roots. First geometric degrees are 3 and 2; κ=pψ₁ or 4ψ₁, and the normalized coefficient of ψ₁ is 1. New R02 concerns only the added coefficient estimate's omitted k≥1. |
| R02: duplicated completion action | README:7: “the action … is PadicPeriodRings §1.1's”; Suggested.lean:52 and :99 use `UniformSpace.Completion.map σ` directly. | **Repaired.** No galoisAct declaration remains. Open #940, `TauCetiRoadmap/PadicPeriodRings/README.md:91`, constructs exactly this action. SemilinearRep and both substantive theorems remain. |
| R03: curvature of C/ℚ_p | README:1012: “`C/ℚ_p = B₁/ℚ_p` has curvature `> 0`”; restriction is “the inclusion of the `t`-torsion”. | **Repaired.** For P=[0→B₂], restriction is tB₂↪B₂, not an identity on all B₂. Its kernel is 0. For P=[0→C] it is id_C. Height remains −1. |
| R04: Fontaine page locator | README:170: “Proposition 4.4, p. 337”; README:311 gives pp.296,306,308; README:404 gives Theorem 4.1, p.329. | **Repaired.** Fontaine03 lines 2134–2142, 475–481, 896–902, 987–990 and 1816–1820 have those printed pages. The manifest now agrees. |
| R05: nonexistent supplier layer labels | README:18: “AlgebraicVectorBundles, Scope and ownership and Layers 1–2”. | **Repaired.** Main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md:388` and :472 are the relevant layers. The related Schneiders99 manifest reference now names LocallyAnalyticDistributions §0.0. |

The repaired patterns were searched throughout the package: no obsolete galoisAct ownership, wrong E₁/E₂ base unit, unnormalized ψ₁ coefficient, negative-curvature claim for C/ℚ_p, p.336 Proposition 4.4 locator, or AlgebraicVectorBundles L0–L2 citation remains. All own Lean names in backticks resolve to the three declarations actually present. The changed Conventions Check yielded R01 above.

### Principles, scope and shape

Read all 62 numbered targets and all 62 Needs lines, the opening conventions and contracts, 7 layer summaries/examples/dependencies, the Lean file, metadata, manifest, and declared gap. For unchanged mathematics I reused the preceding review's computed rows only after comparison with the text. Its table contains numerical or explicit-object computations for every numbered target, sometimes grouping adjacent targets; prose-only assurances were not treated as evidence. Changed passages and all 15 newly sampled targets were rechecked directly below.

This is an extension of the parent's classical BC library, not a replacement roadmap. The arithmetic, TVS and height directions have explicit ownership boundaries. All primes remain admitted; in particular the p=2 exponential tower and sign character are retained. No computational algorithm, copied source passage, sorry'd data, set_option, arbitrary Prop stand-in, forbidden roadmap import, or route-specific narrowing was found. Ramified finite K and general complete discretely valued K are distinguished where the sources require it. The countability conditions for sympathetic algebras do not silently become hypotheses of the arithmetic Lean statements.

The organization is mathematical. Layers 0–1 build arithmetic categories and extension theory; 2–5 build the topological enlargement; 6 supplies its own VS comparison and limits. The source's §3.3 height discussion is moved after the enlargement. Within 2–5, the Needs edges force TVS→disc class→period comparisons→qBC full faithfulness. No source-chapter heading or unsupported source-order dependency was found. The phrase “follow Fontaine03 §5.1” at README:204 identifies a proof route within one theorem; it does not prescribe the organization of the roadmap.

Compared the shape with main's AlgebraicVectorBundles and PerfectoidSpaces READMEs. The named new object constructions carry API lists and at least three Checks; the completion notation in §2.5 specializes the supplied separated completion and records its evaluation and three tests. Each numbered target has a locator and a Needs line, and every layer ends in Examples and Dependencies. The errors in the Checks/supporting calculations are precisely R01–R02. No process residue or machine paths were found in the roadmap or Lean file. Bibliographic version dates and pinned commit hashes identify sources, not workflow history.

### Seeded source verification

All ten cited works have a single manifest entry and a readable cached extraction. There are no author-flagged unverified locators or uncertified/waived entries to reopen. No fetch or manifest mutation was needed. Printed pages were checked against the cached page headings, including the offsets in Fontaine03, FF18, Schneiders99 and the JEMS article. Mathematical descriptions below are paraphrases.

| Sampled target | Text opened at the locator | What the text supports and limits |
| --- | --- | --- |
| 0.5 Abelian category and Dimension | Fontaine03 lines 265–269, p.291; 2317–2333, p.341, with §5.1; CN25 lines 400–414, p.9 | Strict abelian full subcategory, additive dimension and signed height, finite K/ℚ_p. Source's presentation gives dim V₂−dim V₁. |
| 1.8 Fundamental extension theorem | Fontaine03 lines 1816–1820, p.329; 2294–2298, p.340; FF18 lines 948–958, pp.21–22 | Arbitrary one-dimensional C-representation W, finite-dimensional V, continuous equivariant η, image inequality, surjectivity and kernel dimension. FF18 alone states W=C; primary Fontaine03 supports the broader W. |
| 2.1 Presentation-independent boundedness | CN25 lines 960–989, pp.20–21; Schneiders99 lines 852–864, pp.24–25 | Two-term monomorphisms and bicartesian localization. The quotient-topology consequence follows from the strict pushout/pullback presentation, not from Hausdorffization. Corollary 1.2.21 is the correct locator. |
| 2.3 TVS | CN25 lines 960–965 and 971–991, pp.20–21; Schneiders99 lines 852–864 | Uniform boundedness over all algebra maps and pointwise left-heart exactness agree. The roadmap keeps the algebraic, potentially non-Hausdorff quotient. |
| 2.8 Period Pairs | CN25 lines 992–1005 and 1013–1018, p.21 | One bounded torsion exponent, injective model map, completed balanced base change, period-linear maps. Localization comes from Remark 4.3, not arbitrary unlocalized squares. |
| 3.4 Normed descent | CN25 lines 1083–1107, pp.23–24; Colmez02 lines 975–984, p.23; 1262–1299, pp.29–30; 1342–1366, pp.31–32 | Disc cohomology line, bounded correction and normalized B₂ class are supported. Elementary extensions and lifting are supplied by Colmez. CN25 abbreviates almost descent/decompletion; the expanded three-step argument is additional work, not a verbatim theorem from that source. The k=0 omission is R02. |
| 3.5 Analytic additive cocycles | CN25 lines 1155–1168, p.24 | Integral analytic cocycle has a primitive with at most one p denominator. The roadmap corrects both the constant sign and the out-of-range binomial index in the printed proof. |
| 4.3 Reasonable Pairs and same type | CN25 lines 1259–1262, p.26; 1339–1344, p.27; 1449–1453, p.29; 1560–1588, p.31 | Same branch for the models, injective Pair presentations and Hom comparison. Theorem 4.30 is not a blanket all-degree Ext comparison. |
| 4.4 Normalized pushout | CN25 lines 1207–1224, p.25; 1272–1294, pp.26–27 | B_d by a tᵐ-torsion module, parameter W/tᵈW, extension exponent may grow to m+d. Opposite signs are required with the roadmap's fixed endpoint framing. |
| 4.5 Profinite cocycle in one step | CN25 lines 1249–1258, p.26 | Profinite H, compatible continuous isometric actions on compact-type Banach steps, continuous 1-cocycle. Baire and finitely many coset values give a common step. |
| 4.8 All separable Fréchet targets | CN25 lines 1193–1195, p.25; 1227–1248, p.26; Appendix A, Proposition A.3, lines 2896–2921, pp.58–59 | The stated Proposition 4.18 includes this range. Its written inverse-limit argument explicitly treats nuclear Fréchet spaces; the roadmap correctly owns the non-nuclear comparison and lim¹ justification as additional targets. |
| 5.3 Intrinsic filtration | CN25 lines 1432–1445, pp.28–29 | Largest positive BC subobject and largest negative BC quotient, reasonableness, factorization directions and density argument agree. No splitting is asserted. |
| 6.1 Height functor | CN25 lines 912–920, p.19; 837–841, p.18 | Hom into B_dR, contravariant precomposition, localization and the uniform bounded-image input. The required strengthening is explicitly gap:G-HOM. |
| 6.2 Exact comparison | CN25 lines 927–938, p.20; LeBras18 lines 1176–1201, p.26; TVS25 lines 1054–1069, pp.23–24; 1165–1169, p.26; 1288–1306, pp.28–29 | Basic sheaf Ext table and enriched comparison are genuine inputs. TVS25 uses enriched condensed presheaves; it does not identify them with sympathetic left-heart TVS by definition. The intervening period-target comparison is explicitly constructed here. |
| 6.4 Filtered localization of Ext | CN25 lines 918–930, pp.19–20; AnschutzLeBras25 lines 972–988, pp.3675–3676, and 993–1008, p.3676, with the following proof | Colimit statement, Mac Lane resolution and qcqs representable-power argument are correctly located. Corollary 3.8 proves pseudocoherence for its own A_inf sheaf; transport/dévissage to BC sources is an owned target here, not an immediate application to arbitrary functors. |

Also reopened the headline sources: Fontaine03 Theorem A (line 213), CN25 Theorem 2.6 (line 431), Proposition 4.10 (line 1083), Corollary 4.31 (line 1585, p.31), Proposition 3.27 (line 939). The manifest's Fontaine03 and Schneiders99 repairs agree with the actual printed pages and supplier heading. Mathematical proof-certification limits are recorded under Not verifiable.

### Computed adversarial table

This table covers every seeded target, every headline, every finding, and the changed mathematical passages. For unchanged targets not repeated here, the previous review's computed rows were retained after rereading the actual statements. The tests distinguish arithmetic Galois Hom, sympathetic VS Hom and left-heart TVS Hom; their different values are intentional. Mixed characteristic, prime p and the declared size bounds exclude the zero base field, p=1 and arbitrary nonseparable sympathetic algebras; nonseparable period models are explicitly included in §4.9.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| SemilinearRep definition | Identity; zero W; standard C action; trivial action on C at p=3 and p=2 | id(cw)=cw; 0=0; σ̂(cw)=σ̂(c)σ̂(w); trivial action forces ζ₃=ζ₃² or i=−i, both false | Correct defining law; standard and zero objects admitted, wrong trivial action rejected. |
| Conventions third Check | C(1), C over finite K; forget C-linearity versus forget G_K | Fixed subgroups are 0 versus K; continuous additive equivariant Hom=H⁰(C(−1))=0; underlying C-linear Hom=C | R01: only forgetting the action produces the underlying-line isomorphism. |
| 0.2 C full faithfulness, Lean headline | W₁=0; C→C with a∈K; C→C(1) | 0=0; f(cw)=acw=c(aw); both equivariant Hom groups to the twist are 0 | Correct finite-dimensional and topology hypotheses. Not a one-tactic identity on arbitrary f. |
| 0.2 finite-length period full faithfulness | B₁→B₂; B₁→B₁ | Equivariant Hom=0 in both categories; End(B₁)=K in both; forgetting Galois action instead gives Hom_B(B₁,B₂)=tB₂≠0 | Correct category distinction; docstring records missing carrier structures. |
| 0.3 analytic extension, repaired locator | E=V⊕C; η=projection or 0; W=C(1), V=0 | Dimension=(1,h); projection kernel has dimension h; zero map has image 0 and is still analytic; twisted map to C=0 | Analyticity does not assume surjectivity. p.337 confirmed. |
| 0.5 additive Dimension | 0→ℚ_p→C→C/ℚ_p→0; 0→C(1)→B₂→C→0; zero | Dimensions 1=0+1, 2=1+1; heights 0=1−1, 0=0+0; zero=(0,0) | Both signed presentation conventions agree. |
| 1.3 corrected cyclotomic data | W=0,C,B₂; p=3 lifts u,−u; p=2 sign | Generalized pieces (0,0),(K,0),(K,Kt′); exp(log u)=exp(log(−u)); log(−1)=0 and exp(log5)=5 | The finite character is removed; no inverse of nilpotent t on W is taken. |
| 1.4 sign used in duality | B₂,z=1, χ⁽¹⁾(γ)=5 at p=2 | d₁d₀=0; replacing inverse character gives (1−25)t′=−24t′≠0 | Correct inverse-character convention, compatible with supplier periods. |
| 1.5 duality headline | X=Y=ℚ_p; X=C,Y=C(1); zero | Euler 1−([K:ℚ_p]+1)+0=−[K:ℚ_p]; 0−[K:ℚ_p]+[K:ℚ_p]=0; zero=0; H²(ℚ_p(1))=ℚ_p | Degree 2 and twist (1) retained. Unsigned Euler sum would be [K:ℚ_p]+2. |
| 1.8 fundamental theorem, Lean headline | E=V⊕C, η=(g,1); η=(g,0); U₁ with θ | ker(g,1)={(v,−g(v))}, dimension h; image(g,0)=η(V), kernel contains C; ker θ=ℚ_pt, dimension 1 | Image inequality essential; second case correctly excluded; θ gives 1=dim V. |
| 2.1 quotient boundedness | [0→C]; [C→C]; T(x)_n=pⁿx_n on c₀ | Quotients C,0,c₀/T(c₀); [(pⁿ)]≠0 because its preimage would be (1)∉c₀; Hausdorff quotient=0 | Preserves algebraic quotient, including the non-Hausdorff case. |
| 2.3 uniform boundedness | Zero functor; V₁; maps of sympathetic algebras | Images of {0}={0}; union of images of O_Λ lies in O_Λ′, norm≤1 | Uniform quantifier is over all algebra maps for fixed Λ,Λ′ and bounded A. Continuity of each map alone is weaker. |
| 2.8 Pairs | [M→M]; [0→B₂]; dense diagonal T | Quotients 0,B₂,nonzero [(pⁿ)]; separated diagonal quotient=0 | Localized morphisms and non-strict injections retained. |
| 3.1 new ψ normalization | γ acts on A^(1/pⁿ) by ζ_(pⁿ); p=3,2 | Odd: χ₁(γ)^♭=ε^(1/p), hence ψ₁(γ)=1/p; at 2, ψ₁(γ)=1/4 and ψ₂(γ)=1/2 | κ=pψ₁ or 4ψ₁=2ψ₂; fractional lattices are necessary. |
| 3.2 perfectoid initial relation | p=3,n=0; p=2,n=0,1 | Y₀³≡X mod 3^(1/3); Y₀²+Y₀≡X mod2; Y₁²+2^(1/2)Y₁=Y₀ at 2 | Initial Artin–Schreier relation at 2 is retained; no nonexistent Y_(−1). |
| 3.3 convergence and scaling | p=2,n=2ʳ; ψ₁=1 | v₂(2ⁿ/n!)=1, so coefficients do not tend to 0; v₂(4ⁿ/n!)=n+1→∞; ψ₂/2=2/2=1 | E₂ is not a Tate series, A=exp(4X) is; dividing by 2 doubles a norm bound. |
| 3.4 coefficient bound | p=3,k=0,1,2,3,6,9; p=2,k=0,1,2,3,4 | Valuations 0,1,2,2,4,5 versus claimed ≥1; 0,2,3,5,5 versus claimed ≥2 | R02 at k=0 only. For k≥1 all bounds hold and tend to infinity. |
| 3.4 first tower level | p=3 and p=2 | Constant/geometric/total degrees 6/3/18 and 2/2/4; incorrect extra root at p=3 gives 6/9/54 | Previous tower defect repaired; geometric Γ and arithmetic G are distinguished. |
| 3.4 cocycle coefficient and eigenvalues | c=ψ₁ or 0; eigenlines CE₁ at 3, CE₂ at 2 | (1/3)/(1/3)=1, (1/4)/(1/4)=1, 0=0; inverse norms √3≤3 and 2≤2 | Correct normalization. Raw trace value alone would give 1/3 or 1/4. |
| 3.4 binomial boundary | k=pʳ; v_p(c)=p/(p−1) | v_p(binom(1/p,k)cᵏ)=s_p(k)/(p−1)=1/(p−1), constant along these k | Root coefficients fail to tend to 0; the negative-control root is outside C{X}. |
| 3.5 analytic cocycle primitive | f=c; f=YZ at 2; k=pʳm with p∤m | δ(−c)=c; δ(X²/2)=YZ and v₂(1/2)=−1; i=p^(r−1) gives v_p binom(k,i)=1, while i=pʳ=k at m=1 is out of range | Correct sign and denominator bound, including small primes. |
| 3.6–3.7 disc headline | Split; framed B₂; pushout by a; v=0 | λ_E=0,1,a; λ_v=vλ_E; rank 0 for v=0 in every extension | Nonzero v required to detect splitting; framed classes 1 and a are not collapsed. |
| 4.3 same-type Pair | Identity; closed inclusion C→C²; dense diagonal; unmatched branches | Quotients 0,C,c₀/T(c₀)≠0; unmatched Fréchet/compact-type presentations have no common branch | No closed-image or arbitrary mixed-type comparison is inferred. |
| 4.4 pushout sign and parameter | m=d=1,W=C,w=1 or0; W=B₂,w=t,d=1 | Relation (tc,−c) maps to tc−tc=0 under (b,c′)↦b+tc′; classes 1,0, and [t]=0 in B₂/tB₂ | Normalization agrees with B₂ disc class and split criterion. |
| 4.5 one-step cocycle | H=1; finite H with r elements; H=ℤ_p acting trivially on C, c(x)=x | First image={0}; finite image has ≤r vectors, N=max of their step indices; c(ℤ_p)=ℤ_p⊂C=W₀ | Zero, finite and nonzero infinite-profinite examples fit one step; no noncompact H is admitted. |
| 4.8 Fréchet comparison | W=C^ℕ; W=c₀(ℕ,C); zero tower | (1,1,…) belongs to product but not c₀; (pⁿ) belongs to both; Hom and Ext¹ parameters equal the chosen W; zero-tower lim¹=0 | No nuclearity restriction added; source proof's missing general comparison remains an owned target. |
| 4.9–4.10 full model class | W=c₀(I,C), I uncountable; W=B₃,d=2,5 | Countable dense span fails in first example but both parameters=c₀(I,C); torsion and quotient lengths 2/2 and 3/3 | Nonseparable model range retained; it differs from countable sympathetic bases. |
| 5.2 repaired curvature Check | C/ℚ_p; P=[0→C] or [0→B₂]; zero-curvature source C | BC Hom(C/ℚ_p,C)=0 since a·1=0; restriction C→C is id and tB₂→B₂ injects; End(C)=C≠0 | Positive curvature correct; height −1 is consistent; zero-curvature negative control works. |
| 5.3 intrinsic filtration | Pure Pair; ℚ_p⊕B₁⊕U₁/ℚ_pt_x, x≠∞ | Pure Pair positive/negative pieces 0/0; mixed positive/middle/negative pieces U₁/ℚ_pt_x, B₁, ℚ_p | Universal subobject and quotient directions agree with parent's filtration; no splitting theorem used. |
| 5.4 qBC full faithfulness headline | Pure same-type Pairs; multiplication by p on C/ℚ_p | Pure case reduces to period Pair Hom; pℚ_p=ℚ_p, inverse multiplication p⁻¹, height −1=−1 | Same type retained; filtration preservation is not assumed for the input TVS map. |
| 6.1 height functor | 0; ℚ_pʳ; B_m; C/ℚ_p; f=p· on ℚ_p | h=0,B_dRʳ,0,0; h(f)=p· with reversed arrow; h(id)=id | Uniform factorization is gap:G-HOM, not pointwise membership in the union. |
| 6.2 exact comparison | (ℚ_p,V₁); (V₁,V₁); B₂ boundary | Ext¹ 0→0; Hom and Ext¹ C→C; boundary sends 1↦1 | Zero comparison ruled out; category bridge remains explicit work. |
| 6.4 filtered localization | W=ℚ_p,V₁,C/ℚ_p | First colimit 0; second system C→C→… with zero transitions has colimit0; quotient example Ext¹ has B_dR-rank1 | Does not assert arbitrary Ext commutes with filtered colimits. |
| 6.7 height–rank headline | W=ℚ_p,C,C/ℚ_p; split ℚ_p⊕C | (rank h, rank Ext¹)=(1,0),(0,0),(0,1),(1,0); 1=1+0, 0=0+0, 0=−1+1, 1=1+0 | Signed correction and nonpositive-curvature restriction correct. |

The unchanged computed checks additionally cover §0.1's nonsplit logχ conflation and dense non-inflation; §§0.4,0.6–0.9's alternative presentations, nonzero twists, density and strict truncation inequality; §§1.1–1.2,1.6–1.7,1.9's almost splitting, all-degree comparison, endpoint Ext table and non-full forgetful realization; §§2.2,2.4–2.7's exactness, completion c₀₀→c₀, balanced relations and uniform torsion; §3.8's translation-invariant constants; §§4.1–4.2,4.6–4.7,4.11–4.16's type distinctions, completion, constant-source projectivity, U_d boundary, nonunit scalar extension and same-type comparisons; §5.1 and §5.5's signed heights and distributions modulo measures; and §§6.3,6.5–6.6's limits, nonzero normalized boundary and exactness. Their values were not replaced by a generic “sound” label.

### Lean acceptance, signatures and padding

Ran the prescribed `lake env lean` from the content checkout on the package's Suggested.lean. Exit 0. Exactly two warnings, at lines 62 and 85, both “declaration uses sorry”. There is one import, `import Mathlib`, and no TauCeti import requiring a targeted build. The file has one structure with real fields and two sorried theorems, no auxiliary theorem catalogue.

On a scratch copy, tested **both** theorems with `simp`, `rfl`, `infer_instance` and additionally `simp_all`, requiring each branch to close the goal before considering it a success. Both exhausted the probe. Opened the pinned library near-matches listed below; none is a single-lemma proof of either target. Neither theorem is a boundary case, a restated definition, a small computation or a README Check. No padding finding.

Appended `#check @` for all three declarations and elaborated the scratch copy. Compared the expanded types with Conventions, §0.2 and §1.8. Prime p, finite K/ℚ_p, both finite C-dimensions and module topologies, continuity/equivariance, completeness of E, finite dimension of V, finrank_C W=1, all q hypotheses, and η's image inequality are present. No section binder disappears. `finrank=1` excludes infinite dimension, whose finrank would be zero. Continuous additivity implies ℚ_p-linearity by density; it does not silently permit arbitrary discontinuous maps. No signature change is needed.

| Headline from the summary/end targets | Acceptance-file disposition |
| --- | --- |
| C full faithfulness, §0.2 | `semilinearRep_equivariant_map_smul`, Suggested.lean:62 |
| Fundamental extension theorem, §1.8 | `fundamental_extension_surjective`, Suggested.lean:85 |
| Finite-length B_dR⁺ full faithfulness, §0.2 | Docstring: period carrier lacks canonical topology and Galois action |
| Almost-C abelian structure and Euler–Poincaré duality, §§0.5,1.5 | Docstring: Banach Galois/almost-C categories and their Ext absent |
| Disc extension isomorphism, §3.7 | Docstring: sympathetic and nonarchimedean left-heart TVS carriers absent |
| Reasonable qBC full faithfulness, §5.4 | Docstring: period Pair and qBC carriers absent |
| Height–rank formula, §6.7 | Docstring: sympathetic VS and period-valued functor absent |

The missing carriers were searched by object in both pins. The existing algebraic BDeRhamPlus/BDeRham definitions do not supply those missing structures. The two native signatures therefore cover the statable headlines; there is no weakened stand-in.

### Pinned declarations opened and duplication by object

The hashes match lake-manifest.json: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Every library declaration in the package's supplier tables was opened locally. The citation resolver explicitly does not check these pins on its host; it was not used as evidence for library existence.

| Declaration | Pinned file and line; scope verified |
| --- | --- |
| CategoryTheory.Functor | `Mathlib/CategoryTheory/Functor/Basic.lean:40`; object/map/law structure |
| TopModuleCat | `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41`; additive topology and continuous scalars, no separation/completeness/local convexity |
| ContinuousLinearMap.isOpenMap; exists_preimage_norm_le | `Mathlib/Analysis/Normed/Operator/Banach.lean:229`, :162; completeness of both spaces at :81 and :155, surjectivity explicit |
| Submodule.torsionBy | `Mathlib/Algebra/Module/Torsion/Basic.lean:177`; kernel of scalar multiplication |
| LinearMap | `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; native semilinear map structure |
| BDeRhamPlus; BDeRham | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, :88; adic completion/localization, prime/nonunit/adic-complete inputs at :47–48, no canonical period topology or action |
| Abelian.Ext; Ext.mapExactFunctor | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:126`; HasExt universes and additive exact-functor requirements |
| PadicAlgCl; PadicComplex | `Mathlib/NumberTheory/Padics/Complex.lean:54`, :137; algebraic closure and completion |
| krullTopology | `Mathlib/FieldTheory/KrullTopology.lean:134`; automorphism-group topology |
| spectralNorm_eq_of_equiv | `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451`; algebra automorphisms preserve spectral norm |
| UniformSpace.Completion.map; map_coe | `Mathlib/Topology/UniformSpace/Completion.lean:477`, :488; dense-image formula requires uniform continuity |
| IsModuleTopology | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`; equality to module topology |
| AddMonoid.End | `Mathlib/Algebra/Group/Hom/Defs.lean:975`; generated additive version of the endomorphism monoid |
| WittVector.fontaineTheta | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`; adic-completion hypotheses retained |
| TauCeti.ExactStructure | `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241`; genuine pushout/pullback axioms |
| TauCeti.ExactStructure.IsConflationExact | `TauCeti/CategoryTheory/Exact/Functor.lean:74`; preservation of chosen conflations by additive functor |

Near-matches opened: `ContinuousSemilinearMapClass` at `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:79` describes maps, not a jointly continuous Galois action; the old LinearMap.lean named by the search result only reexports it. `IntermediateField.finiteDimensional_left/right` at `Mathlib/FieldTheory/IntermediateField/Algebraic.lean:54` transports dimension and does not prove rigidity. `CondensedMod.LocallyConstant.fullyFaithfulFunctor` at `Mathlib/Condensed/Discrete/Module.lean:145` concerns discrete modules. `TauCeti/FieldTheory/Galois/SemilinearDescent.lean:17` concerns finite-Galois algebraic descent, not Fontaine's continuous infinite-Galois theorem. Object searches in the pinned representation, topology, period and field-theory files found no duplicate of either headline or the sympathetic carriers.

### Supplier-order and open-work audit

Read the board package index before the ownership search. It lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory on separate board heads; their unrelated scopes give no competing owner here. Used `roadmaps grep` by object and `roadmaps show` to inspect main and the indexed open heads. No helper agents or GitHub writes were used.

All 18 imported parent headings resolve at #1205 in `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md`: Sympathetic Vector Spaces :1287; finite presentations :1310; exact Banach realization :1333; Dimension/abelian category :1341; standard Dimensions :1349; curvature orthogonality :1414; tilted heart :1422; Le Bras equivalence :1445; HN decomposition :1477; curvature filtration :1491; Artinian property :1525; morphism calculus :1541; untilt torsion :1553; curvature-zero modules :1561; torsion VS Hom :1569; curvature/HN support :1577; heights of subobjects :1601; nonpositive extension criterion :1617. Their signed height, curvature, period and functor conventions agree with the imports here. They are not redeclared as this package's targets.

Other resolved citations, with files relative to the content repository:

- #940, `TauCetiRoadmap/PadicPeriodRings/README.md:91`, :105, :217, :272, :417, :449, :470: completion action, fixed points, topological periods, general-base twist invariants and structure maps. The repaired completion-action ownership is exact. Its general-base completion specializes to ℂ_p for finite K as assumed.
- #1062, `TauCetiRoadmap/PadicHodgeTheory/README.md:894`, §4.4: general finite-dimensional semilinear C-representations as Sen input. #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1596`, §R07.P7.2: rational labelled operators. Neither constructs a competing SemilinearRep carrier.
- #854, `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:939`, :1097, :1125, :1135: left hearts, countable-type functional extension, strict countable limits and compact-type extensions. Read §§0.0–0.3 and the locally analytic/distribution ownership in Layer 1. The finite-K scope of the last theorem is retained; this package owns the required separable C extension and the non-nuclear limit comparison, rather than applying a finite-dimensional cohomology theorem to infinite period models.
- #856, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779`, §1.1: continuous finite-dimensional representation interface. #858, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700`, :5392: rationalization and derived local Tate duality; :1190, §R02.2.1, is correctly identified as discrete-coefficient Hochschild–Serre, not the continuous period comparison.
- #816, `TauCetiRoadmap/PerfectoidTowers/README.md:2171`, :2459: profinite Galois towers and function/almost-cohomology descent. Read the right action/function action convention, finite G/G_j torsors, perfectoid completed limit, geometric base change and the R¹lim condition. The corrected tower has those geometric degrees, and §3.4 separately owns the normed/decompletion assertions. Main's `TauCetiRoadmap/PerfectoidSpaces/README.md`, Layers P1/P3/P6, supplies the perfectoid criterion, almost purity and pro-étale calculus.
- Main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md:388`, :472: module-sheaf pullback and flat internal-Hom base change, correctly deferred by the repaired Scope.
- #1759, `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:102`–:112, imports this package's TVS, Pairs, qBC and height results and declares additional contracts from it. It is a consumer. #1064, `TauCetiRoadmap/CohomologyComparisons/README.md:863`–:915, §§4.8–4.11, has the stated general-base comparison setting and is also only a downstream citation.

The supplied overlaps.md records no conflicting head, dropped cited id or citation defined only by an unacknowledged open revision. Its closest five roadmaps were read above. A fresh standalone `roadmaps overlaps VectorBundlesAndIsocrystalsPartII` cannot discover this unported board package and reports no roadmap under that name; that command's result is not evidence that the package is missing. The supplied package-aware overlap data and the head reads are the evidence used. `roadmaps resolve` found no unresolved cross-roadmap citation or own Lean name. No duplicate object owner or fully qualified Lean-name collision was found after the completion-action repair.

The prescribed dependency command returned:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every Needs edge names an earlier supplier or a target here. No forbidden supplier is consumed. The Layer 6 references to comparison/limit constructions are owned targets rather than an implicit upward call to a downstream consumer.

**Declared gap.** G-HOM is precise and minimal: one N per VS map from a classical BC, independent of the sympathetic algebra and its elements. The slug, named supplier and sentence agree in `packages/VectorBundlesAndIsocrystalsPartII/design/plan.json:2925`–:2933 and README:100. The parent's :1571 explicitly leaves the bounded-image argument open, so it is not already supplied. CN25 lines 837–841 motivate the bound. This remains a valid supplier contract, not a finding; acceptance after the two text corrections would be conditional on G-HOM. No conditional_gaps field is set on this needs-changes verdict.

## Not verifiable

- No cited text is unreadable or missing. There is no missing-reference request.
- CN25 abbreviates the almost-descent and decompletion in §3.4. The corrected tower, characters, first degrees, coefficient formulas and eigenline norm checks were verified, but neither the cached source nor a sorry build supplies a complete proof of every new normed inflation/derived-limit step or its Banach-valued extension. They remain explicit construction targets.
- CN25's Proposition 4.18 states the full separable Fréchet result but writes the inverse-limit argument for nuclear spaces. Its Proposition 4.22 invokes that result for a period-model class without separability. Sections 4.8–4.9 explicitly own these additional arguments; the computed instances do not constitute a general proof.
- The full sympathetic-VS-to-v-sheaf comparison of §6.2 and its transport of pseudocoherence in §6.4 are additional targets. The cited sheaf and enriched-condensed theorems were checked in their stated categories, not treated as an already-proved identification with this roadmap's category.

## Source issues

- **Misprint** in FF18 at Preface Remark 2.24(i), p.21: the source says cohomology vanishes in degrees at least two; it should be degrees greater than two, since H²(G_K,ℚ_p(1))=ℚ_p; affects a stated result.
- **Misprint** in FF18 at Preface Proposition 2.28(i), p.23: the source says the unsigned Ext dimension sum equals the negative height product; it should be the alternating sum with factors (−1)ⁱ; affects a stated result.
- **Misprint** in CN25 at Remark 4.3, p.21: the source says Schneiders Corollary 1.2.20 gives the localization model; it should be Corollary 1.2.21; affects nothing.
- **Gap** in CN25 at Lemma 4.9 proof, p.23: the source says its first displayed exponential equation applies at every prime; it should use exp(4X) with the quadratic initial relation at p=2; affects the proof.
- **Misprint** in CN25 at Lemma 4.13 proof, p.24: the source says restore the constant cocycle by adding it to the primitive; it should be subtracted, since δ(c)=−c; affects the proof.
- **Error** in CN25 at Lemma 4.13 proof, p.24: the source says choose i=pʳ for r=v_p(k); it should be i=p^(r−1), which is below k and has binomial valuation one; affects the proof.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, pp.25,27: the source says the pushout uses a positive-positive relation with the displayed endpoint maps; it should use opposite signs or negate the kernel framing; affects nothing.
- **Gap** in CN25 at Proposition 4.18 proof, p.26: the source says the reasonable Fréchet case follows from an argument treating nuclear Fréchet spaces; it should include the general inverse-limit comparison; affects the proof.
- **Gap** in CN25 at Proposition 4.22 proof, p.27: the source says reduction to Proposition 4.18 covers reasonable period models without separability; it should include the nonseparable graded-piece argument; affects the proof.
- **Misprint** in CN25 at Lemma 4.24(i), p.28: the source says Ext¹_TVS(U_d,W) is W; it should be zero, as the proof's surjective boundary computation establishes; affects a stated result.
- **Gap** in CN25 at Lemma 4.29 proof, p.30: the source says linearity holds for all integral scalars after treating only units; it should extend to nonunits by c=(1+c)−1 and additivity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d084f7f3f495f97664a78561f6184fdd1fde1a53", "job": "REV-PKG-VectorBundlesAndIsocrystalsPartII~3", "model": "gpt-6-astra", "worker": "chris-30"} -->
