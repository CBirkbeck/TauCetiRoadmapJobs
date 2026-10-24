## H01 (CBirkbeck) — applied

Unrestricted chartwise algebraic-weight accumulation in §0.7 is replaced by an application of PadicFamilies §2a.14 to every global component, verification of its relatively factorial compact-weight cover, and local accumulation near algebraic weights using the source's explicit dominance cone (TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:423); reducedness still follows only after classical semisimplicity and absence of embedded components. The cached manuscript gives the component-image step as Corollary 3.13 (bhs-modulaire line 1139) and explicitly uses it at the end of Theorem 3.19 (bhs-modulaire line 1417), while TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:431 records the residue-disc counterexample with |k−α|=1>|p|.

## H02 (CBirkbeck) — applied

The fixed tame Igusa codomain is replaced by ordinary Igusa torsors pulled back to each actual wild-level base, level-indexed weighted targets, and completion in both the wild and Igusa indices at infinity, with integral/analytic comparisons and restriction/Hecke diagrams on those same bases (TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1156, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1210, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1237, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1259). The AL_n/Frobenius transition is retained, level zero uses AL₁ with its transported coefficient torsor, and the q-root and genuinely infinite-level series Checks detect the former obstruction (bhw line 717; bhw line 1542); TauCetiRoadmap/OverconvergentAutomorphicForms/Suggested.lean:23 now identifies these missing headline carriers.

## H03 (CBirkbeck) — applied

The ownership paragraph and supplier contract now retain PhiGammaModulesAndIwasawaCohomology §4.0's localMultiplicativeCharacterSpace K; the general abelian-group extension has a canonical universal-character-preserving equivalence to that carrier after coefficient extension (TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:16, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:353). Its product adapter is used by the unitary Jacquet sheaf, with explicit evaluation, uniformizer-change, coefficient-change and inversion compatibility, tested by δ(5)=3, δ(2)=2, δ(10)=6 and δ⁻¹(10)=1/6 (TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:360, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:417).

## Verification

**Sources, ownership and signatures.**

The source passages used for the repairs were read in the supplied legal cached texts: bhs-modulaire line 1091 (finite projective charts), line 1139 (global images), line 1321 ((3.10)–(3.11) and accumulation), and line 1417 (global density and reducedness); bhw line 717 (root cusp charts), line 1494 (canonical Frobenius lift), line 1530 (completed limit and AL transitions), and line 1913 (ordinary Igusa proof); heuer line 651 (formal torsor and formal-unit descent); aip-adic line 1533 (ordinary Katz–Hida interpretation); emerton-analytic line 6313 (general character representability) and line 6336 (Mellin comparison). Existing source identifiers are reused; no additional work or inaccessible text is needed.

Cross-roadmap citations were resolved against main 1c3cc07 and the indexed new-roadmap heads, with the cited supplier sections inspected, including PhiGammaModulesAndIwasawaCohomology §4.0, PadicFamilies §2a.14, HodgeTateAndCanonicalSubgroups §§4.6 and 5.1, and PerfectoidShimuraVarieties §§1.13–1.14 and 5.4–5.10. Object searches covered the main roadmaps, the board package material, the open-roadmap index, and README.md and Suggested.lean in all 27 supplied sibling folders; the generic component theorem, local multiplicative carrier, canonical subgroups, Igusa torsors and anticanonical limit keep their existing owners, while this roadmap owns their automorphic coefficient/completion applications and comparison adapters.

The library copies were confirmed at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches there found no native rigid character space, locally analytic Jacquet module, ordinary Igusa tower or automorphic eigenvariety carrier for the changed headlines; SheafOfModules (Mathlib/Algebra/Category/ModuleCat/Sheaf.lean:31) is a general module sheaf and supplies none of those geometric objects, and the existing finite-free norm inputs were confirmed in TauCeti/Topology/Algebra/Algebra/Norm.lean:29 and TauCeti/RingTheory/Norm/Units.lean:39.

The mechanical declaration/signature audit found zero declarations in Suggested.lean, hence zero names requiring #check @name and no section hypotheses that could disappear; the required module build elaborated the entire declaration inventory, and no signature or binder changed. Its only change is the Layer 7 missing-carrier description, consistent with the repaired README; no substitute headline, definition, import or axiom was introduced.

**Adversarial mathematics pass: added or changed statements and their immediate interfaces.**

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| General full character representative and compact/discrete product, §0.6 | Z={1}; Z=ℤ | Hom({1},Eˣ)={1}, representative a point; Hom(ℤ,Eˣ)=Eˣ, representative G_m with coordinate a≠0 | Agrees; unit-only a would omit p | Retain general extension with supplied specializations |
| Local multiplicative adapter, §0.6 | K=ℚ₅, unit character u↦u, δ(5)=3 | Evaluation at 2, 5, 10 is (2,3,6) on both representatives | Identity of representing functors selects the equivalence | Add comparison with existing carrier |
| Universal-character preservation determines the adapter | Same character; wrong image with a=4 | Actual evaluation at 5 is 3; wrong image gives 4 | Wrong adapter fails the universal-character law | Require preservation at every x∈Kˣ |
| Uniformizer-change compatibility | ϖ=5, ϖ′=2ϖ | δ(ϖ′)=6=δ(2)δ(ϖ)=2·3; unchanged coordinate would give 3 | Correct direction and factor | Add explicit coordinate law and Check |
| Inversion compatibility | Same character and uniformizers | δ⁻¹(10)=1/6=(1/2)(1/3); double inversion returns 6 | Commutes with uniformizer change | Add inverse coordinate law |
| Finite coefficient-extension compatibility | ℚ₅→E′, δ as above | Images of δ(5),δ(10) are 3,6 before and after extension | No change of character labels | Require naturality |
| Split-torus product adapter | (Kˣ)², a=(3,4); empty product | Inversion gives (1/3,1/4); value at (5,1) is 3 versus 4 after a wrong swap; empty product value is 1 | Detects factor order and rank-zero convention | Add product comparison and Checks |
| Jacquet coherent-dual labeling on the supplied product carrier | A character with δ(5)=3 | Primal label 3 transports to contragredient label 1/3 on either carrier | Inversion convention agrees | Use product adapter in §0.7 |
| Compact weight-cover dimension in global component application | n=2, [K:ℚₚ]=1,2 | n[K:ℚₚ]=2,4; full torus character dimensions would be 4,6 | Compact-weight dimension retained | Verify the relatively factorial compact cover |
| Glued Jacquet Fredholm data and index rescaling | GL₂(ℚ₂), c_z=2, normalized eigenvalue a=1 | Unnormalized eigenvalue is 2; det(1−TU)=1−T changes to 1−2T | Same spectral zero after λ↦2λ, with inverse spectral coordinate changing accordingly | Retain normalization when applying the global theorem |
| Finite projective chart input to global application | A a domain, M=A; M=0; M=A/(f) | Support dimensions dim A, empty, dim A−1 for nonzero nonunit f | Coherence alone cannot replace projectivity | Keep actual faithful finite-projective input |
| Global component-image application | Constant rank-one Fredholm family F(T)=1−2T over W | Spectral root T=1/2 over every w∈W, image=W; zero module has empty spectral locus | Nonempty global components have global images; no assertion for empty support | Apply PadicFamilies §2a.14 before choosing an algebraic-weight point |
| Rejection of arbitrary chart accumulation | p=3, E unramified quadratic, residue α=a with a²=−1 | k−α has residues (0,2),(1,2),(2,2) for k=0,1,2 in basis (1,a); all nonzero, so norm 1>1/3 | Identity is finite-surjective but algebraic-weight preimage is empty | Add counterexample Check |
| Algebraic weights on a fixed torsion component | p=5, trivial torsion, k=20,100,500 | k≡0 modulo 4; distances from 0 are 1/5,1/25,1/125 | Algebraic points accumulate at the algebraic point 0 | Limit local accumulation to neighbourhoods of algebraic weights |
| Exact sufficient dominance cone | n=3,C=2; gaps (8,12),(8,9) | 8>6 and 12>11 hold; 8>6 but 9>11 fails | Increasing-gap condition is discriminating | Replace unspecified gap condition by source (3.11) |
| Dominance and prescribed p-adic congruences simultaneously | k=(60,40,0),(300,200,0) at p=5 | Gaps (20,40),(100,200); 20>6,40>23 and 100>6,200>103; coordinates tend to 0 p-adically | Sufficient cone still accumulates at algebraic weights | Record local route to density |
| Local density transfer on a finite-surjective component chart | Identity chart near algebraic weight 0; residue chart above | Preimage of k=20,100,500 is the same sequence; preimage of algebraic weights in the residue chart is ∅ | Algebraic-weight point is needed first | Separate global intersection from local density |
| Reducedness after density and semisimplicity | ε acting on A[ε]/(ε²) | Matrix [[0,1],[0,0]] has square 0 and is nonzero; diagonal semisimple nilpotent has every eigenvalue 0 and is 0 | Nilpotents are excluded by semisimplicity, not point sets | Retain final reducedness inputs after the new density step |
| Tame torsion-level completion, §7.1 | Constant R=ℤ₅; R=0 | lim_m R/5^m=ℤ₅ and 0 respectively; rationalizations ℚ₅ and 0 | Same ordered completion | Name tame object separately |
| Structural ordinary bases and forgetful maps | Modular root cusp at n=1,2 | s_1^*q=q_1^p=q; g_1^*s_1^*q=(q_2^p)^p=q_2^(p²)=s_2^*q | Structural square commutes | Define B_n,s_n,g_n and their domains |
| Cartesian pullback Igusa torsors | Split torsor with group ℤ/2 on the root cusp | Pullback gives pairs (q_n,0),(q_n,1); both routes pull q_n to q_(n+1)^p and leave the two group labels unchanged | Same torsor and action on both routes | Define IG_(n,i) over B_n |
| Igusa torsor at B_∞ | Same split torsor after adjoining q_1,q_2,… | Fibre labels remain 0,1 while base contains orders 1/p,1/p²,… | Pullback changes the base without inserting an extra weight condition | Define IG_(∞,i) by actual base change |
| Finite wild-level integral completion | Constant Igusa chart at n=1; split cusp | Constants complete to O_L; q_1 has order 1/p and q_1^p has order 1 | Wild index remains visible | Define V_n⁺ before localization |
| Infinite double-index completion | p=2,3 | Orders q_1=1/2,1/3 and q_2=1/4,1/9; orders of q_2^p=1/2,1/3 | All wild roots retained | Define V_∞⁺ using colim_(n,i) before lim_m and inversion |
| Fixed tame target cannot receive the geometric root | f^p=q in a tame integral-exponent series ring | p·ord_q(f)=1 would give ord_q(f)=1/p∉ℤ; at infinity ord_q(q_1^p)=p/p=1 | Tame geometric map impossible | Codomain is over B_∞ |
| Identity wild tower | R_(n,i)=R_i with identity transitions | colim_n R_(n,i)/p^m=R_i/p^m for every m; completed answer is the original Igusa completion | Degenerate case agrees | Include identity-tower Check |
| Completion order and genuinely infinite-level functions | p=2, f=Σ_(j≥0)2^j q_j | Mod 2: q; mod 4: q+2q_1; mod 8: q+2q_1+4q_2; omitted tail lies in 2^mV⁺ | Each torsion reduction descends; full series needs unbounded wild levels | Add infinite-series Check, with no finite-level descent assumption |
| Level zero via AL₁ | κ=1, ordinary modular cusp; ε=0 | AL₁ sends r to r_1; constant 1 maps to 1; p·0=0 | Matches existing level-zero convention | Transport torsor and coefficient frames as well as base |
| Supplied AL_n/Frobenius transition | p=2 and p=3, consecutive root coordinates r_n | Both composites pull r back to r_(n+1)² or r_(n+1)³; a wrong identity transition gives r_(n+1) | Source and target directions fixed | Apply supplied diagram to completions |
| Integral versus rational ordinary sheaves | Constant O_L, nonzero patch | p has norm 1/p, p⁻¹ has norm p; 1 maps to 1 and 0 to 0 | p⁻¹ excluded from integral lattice | Rationalize only after completion |
| Weighted ordinary equalizer at each n | Split torsor; κ=1 and κ(u)=u at u=2,p=5 | Trivial weight invariant pairs are (f,f); nontrivial coordinate multiplier is 1/2 | Same inverse convention as positive-radius coefficients | Define V_(n,κ), including ∞ |
| Weighted level maps | Same weight, pull q_n along g_n | Both equalizer routes give (1/2)q_(n+1)^p when κ(2)=2 | Level pullback commutes with character action | Specify maps through Cartesian torsor diagrams |
| Finite-character precision and integral equalizer | Sign character at p=2 | (1,−1)=(1,1) mod 2 but (1,3) mod 4; swapping gives (3,1)=−(1,3) | Completion retains information lost at one torsion precision | Keep finite-character descent through every p^m |
| Arithmetic ordinary relation and pairing twist | F=ℚ,p=5,w=t=x,d=2 | Geometric multiplier 1/2; arithmetic multiplier (1/2)·2=1 | Twist must survive at each wild level | Preserve independent arithmetic presentations |
| Power-bounded comparison after nondiscrete base change | v_p(x)=1/2 in O_(C_p) | x mod p≠0, x² mod p=0 | Reduced-special-fibre shortcut fails | Make actual integral model comparison a target in both indices |
| Analytic completion comparison at finite n | Constant chart O_L and its fraction field L | V_n⁺=O_L=A_(n,Ig∞)°; V_n=L=A_(n,Ig∞); norm(p⁻¹)=p | Integral/rational comparison agrees | State level-indexed comparison |
| Analytic completion comparison at ∞ | Root cusp, q_1 and f above | q_1^p=q on both sides; mod 8 at p=2 both give q+2q_1+4q_2 | Completion matches arbitrary bounded functions, not just finite stages | State double-index comparison and torsion descent target |
| Weighted lattice comparison | κ(2)=2 at p=5; integral section e | e transforms by 1/2 of norm 1; p⁻¹e has norm p and is rational only | Rational equality cannot identify every lattice | Retain separate lattice comparison at every n |
| Ordinary restriction source and target | κ=1 on infinite root cusp | res(q_1)=q_1, res(q_1)^p=res(q)=q, res(1)=1 | Actual restriction is multiplicative on trivial-weight functions | Define res_(n,ε) to same-level ordinary functions |
| Infinite restriction without finite descent | f=Σp^j q_j | res(f) mod p^m=Σ_(j<m)p^j q_j on both routes | Arbitrary infinite-level sections retained | Use double-index completion at ∞ |
| Radius-colimit independence | A representative q_n at two positive radii | Both restrictions give q_n; zero representative gives 0 at every radius | Same ordinary image after common restriction | Keep colimit factorization with explicit level codomain |
| Integral and cuspidal restriction | Integral q_1 on a cusp; constant 1 | Norm(q_1)≤1, boundary value q_1(0)=0; constant boundary value 1 | Bounds and boundary kernel preserved; constant is not cuspidal | Keep integral and cuspidal interfaces |
| Wild-level naturality of ordinary restriction | q_n at consecutive levels | res(g_n^*q_n)=q_(n+1)^p=g_n^*res(q_n) | Commutative diagram | State diagram explicitly |
| Pullback/trace compatibility before normalization | Split two-sheet correspondence, section (1,1) | Restrict then trace gives 1+1=2; trace then restrict gives 2; trace(0,0)=0 | Integral diagram commutes | Require torsion diagrams on actual correspondences |
| Rational Hecke normalization versus integral trace | Previous correspondence at p=2 | (1/2)·2=1, while norm(1/2)=2>1; unnormalized trace is 0 mod 2 | Integral trace cannot be replaced by a unit-normalized trace | Retain Layer 6 factors only after rationalization or proved integral renormalization |
| Independent ordinary AIP comparison and transported frames | A frame e changed to 2e over ℚ₅; κ=x | Coefficient changes from f to f/2, so (f/2)(2e)=fe; changing frame to pe requires f/p, outside the old unit lattice | Evaluation fixes the comparison; a base isomorphism alone does not fix its lattice | Retain actual torsors, formal-unit hypotheses and AL frame transport |

**Validation.**

Build outcome, exit 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.OverconvergentAutomorphicForms.Suggested (2.1s)
Build completed successfully (8976 jobs).
```

Dependency check output, exit 0:

```text
depcheck: 28 roadmaps, 252 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no supplier ownership moved.

Committed repair: 51a8ad2. The worktree is clean; no push was made.

Gate summary, exit 0:

```text
gate OverconvergentAutomorphicForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
