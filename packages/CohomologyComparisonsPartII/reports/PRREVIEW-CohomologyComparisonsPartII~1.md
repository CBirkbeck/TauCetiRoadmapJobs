# Review of CohomologyComparisonsPartII (pull request #1364 at 8858e49)

**Verdict:** accepted

No roadmap finding established: 0 P1, 0 P2, 0 P3. This verdict is conditional on the 34 declared supplier contracts, as permitted by the review brief. It is readiness for human review, not approval or a claim that the proposed mathematics has been formalized. The unavailable supplier heads listed under **Not verifiable** are not certified by this review.

## Verified sound

Reviewed all 33 numbered subsections of `TauCetiRoadmap/CohomologyComparisonsPartII/README.md`, the complete `Suggested.lean`, all 15 seeded source targets, the supplier contracts and every Needs line. Read the repository README and CONTRIBUTING checklist and compared the presentation with AdicSpacesPartIV, RigidAnalyticGeometry and GrothendieckEulerForms on main. There are seven layers, each with Examples and Dependencies; the definitions retain their APIs and at least three discriminating Checks. The roadmap distinguishes its classical producers from the base comparison theory, exact-category infrastructure, rigid realizations, and downstream regulator/integration constructions. No route-specific prime restriction, computational algorithm, copied source passage, sorry-defined data, or option override was found.

The head is `8858e492d439509780d3d9ca4e2a79c0b992854d`. The worktree was clean; the diff outside the reviewed folder was empty. No pull-request file was changed. The worker's gate at this head reports:

```text
gate CohomologyComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Independently ran the prescribed dependency check, with `--movable` and the supplied main-content tree and merge order. Its complete substantive output was:

```text
depcheck: 210 roadmaps, 1445 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Independently elaborated `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` with `lake env lean` from the pinned worktree: exit 0, no errors or warnings. The worker's targeted module build also passed. No whole-project build or dependency update was run.

### Headline and Lean audit

The README and module docstring agree on these 11 groups of headline results:

| Headline | README | Carrier missing at the pins |
|---|---|---|
| Injectivity of extension evaluation | §1.6 | FilFMIC, its exact Yoneda groups and coefficient complex |
| Unramified rigid syntomic fibre | §2.3 | Rigid and filtered algebraic de Rham realizations and specialization |
| Local log-PD realization, gluing, rational fibre | §3.4 | Log schemes, log-crystalline coefficients and log-syntomic sites |
| Exact small-weight, bounded all-weight periods and étale gluing | §§4.3–4.5 | Those syntomic complexes and the geometric nearby-cycle/Tate realizations |
| Classical semistable and h-realization adapters | §§5.2–5.3 | Actual HK and syntomic realizations of arithmetic pairs |
| Geometric filtered Frobenius realization | §6.4 | Relative rigid/de Rham realizations and FilFMIC |
| Relative continuous-form comparison | §6.5 | Weak-completion differential and relative rigid realizations |
| Strict relative residue sequence | §6.6 | The geometric coefficient objects, including nonsplit finite étale boundary |
| Frobenius-point specialization | §7.3 | Coefficient extensions and their geometric pullback |
| Horizontal-log/rigid comparison | §7.4 | Filtered log de Rham, log-crystalline and rigid realizations of pairs |
| Absolute extension evaluation | §7.5 | Those geometric objects and their extension/cohomology targets |

The file has one `import Mathlib`, the required module docstring and namespace, and **zero declarations**. Consequently there are zero elaborated own-declaration signatures to inspect and zero sorried statements on which to run a one-tactic padding probe. No signature was silently weakened and no padding was substituted for a missing headline. Scalar cone formulas, lattice coordinates and a matrix satisfying Nφ=pφN can be stated at the pins; they do not state these geometric headlines. Native isocrystals and cones alone do not supply the missing realizations.

### Seeded source sample

Read the legal cached texts at their actual locators, including surrounding assumptions and proof steps where the roadmap uses them. The table distinguishes source support from the roadmap's additional assembly obligations. Page numbers below refer to the versions identified in References; BesserI uses manuscript pages. The README contains no remaining locator marked unverified. KLZ was fetched through the prescribed sources service as arXiv:1501.03289v2; no manifest was edited.

| Sampled target | Text and locator read | Hypotheses/conclusion verified |
|---|---|---|
| 1.1 Coefficient objects and morphisms | AM Definition 2.1, pp. 3–4; AM line 117, AM line 131–154 | Smooth affine AM base, Frobenius modulo p, coherent realizations, locally free filtration grades, horizontal module isomorphism. The roadmap corrects “algebra” in the source. |
| 1.2 Tensor operations, Tate twists and transport | AM Remark 2.2, Definition 2.3, (2.1), pp. 4–5; AM line 155–217 | Isocrystal change of lift, pullback and twist p⁻ᵐ with filtration jump −m; no false commutation requirement on a base map. |
| 1.5 Evaluation of extensions | AM (2.3)–(2.7), pp. 6–7; AM line 224–268 | Evaluation is the iterated connecting image of the distinguished unit. The roadmap avoids the source's extension-index and disconnected-base slips. Cup compatibility is an explicit tensor/connecting-map proof obligation. |
| 3.1 Divisibility before reduction | EN §2.1–§2.1.1, pp. 4–5; EN line 158–198 | Higher-level divisibility, reduction of that module by its own pⁿ multiple, and the r≤p−1 coefficient identification; no division inside Z/pⁿ. |
| 3.3 Error maps and products | EN §2.1–§2.1.2, pp. 5–6; EN line 193–243 | Directed ω and τ, composites pʳ, corresponding kernel/cokernel annihilators, multiplicativity of ω without a general multiplicativity assertion for τ. |
| 3.4 PD presentation, gluing and rational fibre | EN §2.1.1, p. 5, EN line 198–218; NN §3.2 (32), pp. 25–26, NN line 1299–1323 | Filtered local PD models and total Frobenius; rational quotient is de Rham/Fʳ. Arithmetic-pair reduction/quotient hypotheses are not extended to every log-syntomic scheme. |
| 4.2 Period morphisms | EN §2.2–§2.2.1, pp. 7–8; EN line 278–329 | Maps go to nearby cycles of U=X_tr∩X[1/p]; the modified divided map precedes composition with ω. Coefficients are the factorial kernel lattice. |
| 4.3 Exact divided comparison | EN Proposition 2.1 and Theorem 2.2, pp. 5,7; EN line 186, EN line 318; TsujiNearby §4–§5, pp. 554–561, TsujiNearby line 892–940, TsujiNearby line 1074–1140 | fs log-smooth canonical-log trait, n≥1, 0≤r≤p−2; divided source and truncation. General log-smooth reductions remain targets here, rather than assuming the desired comparison as a supplier. |
| 4.4 All weights and bounded error | CN Theorem 1.1, §2.2.1, §5.1.2, pp. 2,10,54; CN line 70–84, CN line 413–422, CN line 2587–2606; EN Theorem 2.3, EN line 330–335 | Semistable/base-change charts, q≤r, n≥1, general A(e,p,r) versus the enough-roots linear bound. Dimension dependence at p=2 is retained. EN gives the factorial-lattice target. |
| 4.5 Syntomic-étale objects | EN (2.6)–(2.7), Theorem 2.5, pp. 8–9; EN line 336–386 | Recollement has open Rj′_* and closed S or S′; exact and bounded conclusions retain their separate hypotheses. Exact restrictions preserve the same annihilator. |
| 6.1 Relative datum | AM Definition 2.12 and Remark 2.13, pp. 11–12; AM line 451–496 | Construction of c before proving it invertible; smooth quasi-projective family does not itself imply the finiteness needed for a coefficient object. |
| 6.5 Continuous differentials | AM Lemma 2.19, Remark 2.21(3), pp. 14–15; AM line 609–645 | The lemma's proof uses an affine embedding. The roadmap retains affine U and S and all-degree acyclicity, with a separate coherent corollary. General realization does not require an AM Frobenius lift. |
| 6.6 Nonsplit residues | AM Proposition 2.18, Lemma 4.2, pp. 14,33; AM line 587–607, AM line 1483; explicit rigid-Gysin and relative-Hodge contracts | The source supplies the residue route; the roadmap explicitly requests the stronger nonsplit finite étale coefficient and strict filtered interfaces. It retains the independent admissibility conditions. |
| 7.2 Detection by lifts | AM Lemma 3.9, p. 29; AM line 1289–1301 | Algebraically closed residue field, smooth reduced special fibre and finite locally free module. The reduction argument works for any system of lifts, without Frobenius compatibility. |
| 7.4 Horizontal log/rigid comparison | AM Lemma 3.10, (3.10)–(3.12), pp. 29–30; AM line 1302–1351; BesserI Remark 8.7(3), manuscript p. 28, BesserI line 1073; KLZ Theorem 2.4.2(1), Remark 2.4.3, pp. 6–7, KLZ line 291–315 | Projective smooth W(k)-compactification, relative NC boundary, horizontal log alone. The period contract is restricted to these pairs; the source's unrestricted quasi-projective period assertion is not imported. |

Also read the remaining relevant AM definitions and propositions; BesserI Definitions 5.1,6.1 and Proposition 6.3; HK §§3.2–3.6 and Theorem 5.1; NN Proposition 3.8, Proposition 3.18, Theorem A, Proposition 4.6 and Corollary 4.11; the Tsuji Cartier and symbol inputs; the CN intermediate local comparisons; and the inverse-limit calculation in StacksRlim line 10638–10675. In particular, NN line 1688–1691 retains fine log-smooth Cartier-type arithmetic pairs, while NN line 2400–2404 and NN line 2778–2784 concern the rational truncated h-period maps. Those are imported, not reconstructed here.

### Computed adversarial pass

The rows below are mathematical computations and negative controls, not claims that a few examples prove a general theorem. They cover all 33 target subsections, all headline groups, the sampled targets, the standing conventions, and their defining/API distinctions. “Retain” means the present statement already handles the instance; no repair is requested. Maps are evaluated in the fibre coordinates fixed in the README. Zero rings appear only where a permitted empty chart/completion produces them; the coefficient fields and DVR are nonzero.

| ID / statement | Instance tried | Values on the two sides, or valid versus wrong model | Result / change |
|---|---|---|---|
| A01 Conventions: reduction | V=Z_p[π], π²=p | V/p has π≠0, π²=0; V/π has π=0 | Distinct fibres retained. |
| A02 Conventions: AM Frobenius | Same V, p=2 and 3 | v(F_Vπ)=1; v(πᵖ)=p; difference has valuation 1<2 | Ramified AM input excluded; classical input retained. |
| A03 Conventions: cochain fibre | f=2 on Q | d(a,0)=(0,2a); negative-f convention gives (0,−2a) | Retain positive connecting sign. |
| A04 Conventions: Tate direction | O(1), O(−1) | Frobenius p⁻¹,p; product 1; filtration jumps −1,+1 sum to 0 | Retain. |
| A05 Conventions: semilinearity | k=F_(p²), a with σa≠a | (1−σ)(a)=a−σa≠0; a(1−σ)(1)=0 | Q_p-linearity, not K0-linearity, retained. |
| A06 Conventions: monodromy | φ=diag(1,p), Ne1=e0 | Nφe1=p e0=pφNe1 | Retain. |
| A07 Conventions: residue orientation | G_m in P¹ | Res₀(dlog t)=1; Res∞(dlog t)=−1; sum 0 | Retain. |
| A08 1.1 coefficient datum | Zero and rank-one unit | Φ on 0 is the unique isomorphism; Φ(1)=1 on unit | Both admitted. |
| A09 1.1 horizontality | ∇e=0, Φe=t e on G_m | ∇Φe=dt⊗e≠0; Φ∇e=0 | Wrong invertible datum excluded. |
| A10 1.1 morphism equality | Maps with same two components | Difference has dR component 0 and rigid component 0 | Equality criterion retains actual components. |
| A11 1.1 faithful realization | S=Spec K over V, B†=0, H=(K,0) | id_dR=1≠0; id_rig=0 | Only dR faithfulness asserted. |
| A12 1.1 finite projectivity | Two-step filtration with grades K,K | Underlying rank 2=1+1; zero filtration grades give rank 0 | Finite locally free grades give the intended object. |
| A13 1.2 tensor/twist law | a=1,b=−1 and zero factor | p⁻¹p=1; jumps sum to 0; 0⊗H=0 | Retain. |
| A14 1.2 duality triangles | Rank-one e,e* | ev(e*⊗e)=1; triangle sends e to e, not c e | Unit rescaling excluded. |
| A15 1.2 identity/cocycle transport | Unchanged lift, identity base map | Transport on dR and rigid components is id; id∘id=id | Retain marked identity law. |
| A16 1.3 strictness versus underlying maps | B:F⁰=0 → A:F⁰=K, underlying id | Underlying cokernel 0; F⁰ map 0→K not onto | Non-strict identity excluded as an admissible isomorphism. |
| A17 1.3 conflations | H→H⊕O→O | At every j, kernel of projection is FʲH; quotient FʲO | Retain filtered exactness. |
| A18 1.3 tensor and dual exactness | Split sequence K→K²→K, tensor K² | Ranks 2→4→2; kernel rank 2; dual ranks 1→2→1 | Biexact/contravariant directions agree. |
| A19 1.3 Yoneda boundary cases | Split extension; zero target; point unit | Ext class 0; Ext¹(O,0)=0; Ext⁰(O,O)=Q_p | No abelian-category substitution needed. |
| A20 1.3 product grading | Degrees 1 and 1, and degree 0 unit | Swap sign (−1)¹=−1; unit sign (−1)⁰=1 | Retain graded symmetry, also at p=2. |
| A21 1.4 coefficient complex | Point F_p, O(0) | A⁰=B⁰=Q_p, 1−Φ=0; H⁰=H¹=Q_p | Retain both cohomology groups. |
| A22 1.4 filtration in fibre | Point, O(1) | A⁰=0, B⁰=Q_p; H¹=Q_p; unrestricted 1−p⁻¹ fibre is acyclic | Wrong unfiltered fibre excluded. |
| A23 1.4 shifted differential | d_A=0,d_B=id,f=2 | (1,0)↦(0,2); (0,1)↦(0,−1) | Both signs discriminated. |
| A24 1.4 nonzero first differential | d_A=id,d_B=2,f=3 | (2,5)↦(2,6−10)=(2,−4) | First component cannot be discarded. |
| A25 1.4 d² | Chain map f and d_A²=d_B²=0 | Second component f d_A a−d_B f a=0; first 0 | Horizontality/chain-map premise used. |
| A26 1.4 coordinate linearity | Maps of A24; x=(2,5), y=(1,0) | d(x+y)=(3,−1)=d(x)+d(y); d(2x)=(4,−8)=2d(x) | Additive and Q-linear laws hold. |
| A27 1.4 zero and cone contractibility | Zero object; f=2 over Q | Fib(0→0)=0; ker2=coker2=0 | Retain. |
| A28 1.4 cup unit/sign | Point unit 1 and class b in H¹ | 1∪b=b; degree-one interchange has sign −1 | No strictly commutative integral model asserted. |
| A29 1.5 degree-zero evaluation | Point O and T with Φ=1,F⁰T=0 | Hom(O,O)=Q_p maps a↦a; Hom_filtered(O,T)=0 versus unfiltered Q_p | Filtration independently tested. |
| A30 1.5 extension evaluation | Φh=h, Φe=e−h, F⁰M=M | (1−Φ)e=h; u₁=(0,h)≠0 in coker(0)=Q_p | Positive fibre sign retained. |
| A31 1.5 representative/additive naturality | Point extensions with off-diagonal parameters a,b | Baer sum parameter a+b; u(E_a+E_b)=a+b=u(E_a)+u(E_b) | Retain. |
| A32 1.5 coefficient pushout/cup | Multiply target by c; cup with unit | Image ca=c·a; u(E∪1)=u(E) | Naturality and unit product agree. |
| A33 1.5 disconnected base | Two copies of Spec Z_p | H⁰(S(O))=Q_p²; distinguished unit (1,1), not an identification with Q_p | Source slip avoided. |
| A34 1.6 uniqueness | F⁰H=0 in a strict extension | F⁰M→F⁰O is iso; exactly one preimage of 1 | Retain hypothesis. |
| A35 1.6 sign of remainder | H=O(1), Φe=e+a h | δ=0; R=−a h; split case a=0 gives (0,0) | Retain. |
| A36 1.6 injectivity | S(H)⁰=0 and u₁(E)=0 | Degree-one boundaries are im(0)=0; representative (δ,R)=(0,0) gives a splitting | Conclusion not assumed in premise. |
| A37 1.6 omitted-hypothesis control | Split extension of O by O | e and e+c h both lift 1 for every c | Unique-lift assertion not exported here. |
| A38 1.6 change of lift | Same filtered e, two transported Φ | R′−R=(e−Φ′e)−(e−Φe)=(Φ−Φ′)e; δ′−δ=0 | No false independence of R. |
| A39 2.1 specialization and scalar change | Point over V; empty scheme | sp:K→K is id; bc:K⊗K0 K0→K sends a⊗b↦ab; empty gives 0→0 | Correct domains. |
| A40 2.1 failure of general comparison | Generic-only Spec K over V | H⁰_dR=K, H⁰_rig=0; sp=0 | No general equivalence asserted. |
| A41 2.1 products/pullback | Point scalars a,b; identity map | sp(ab)=ab=sp(a)sp(b); id* a=a | Retain multiplicative natural map. |
| A42 2.2 arithmetic rigid fibre | Z_p point, r=0 | f(a,b)=(0,a−b); kernel diagonal Q_p, cokernel first Q_p | H⁰=H¹=Q_p. |
| A43 2.2 positive-weight point | Z_p point, r=1 | f(a)=((1−p⁻¹)a,a); kernel 0, cokernel Q_p | F¹ term correctly absent. |
| A44 2.2 generic-only fibre | Spec K over V, r=0 and r=1 | R_rig=0; fibre FʳDR equals K for r=0 and 0 for r=1 | Empty special fibre does not force all weights zero. |
| A45 2.3 unramified elimination | K=K0, arbitrary specialization s | Kernel of second coordinate a−s(b) imposes a=s(b); first becomes (1−p⁻ʳφ)s(b) | Uses no inverse to s. |
| A46 2.3 zero-specialization control | s=0, filtered A and rigid B | Single fibre is A⊕B[−1]; not A alone | Retain full fibre. |
| A47 2.3 Frobenius normalization | G_m, r=1 | (1−φ/p)dlog t=(1−p/p)dlog t=0 | Opposite Tate convention rejected. |
| A48 2.3 LES/descent/products | Point; duplicate cover {X,X}; unit | Kernel/cokernel as A42; Čech difference (a,b)↦b−a has kernel diagonal; 1∪x=x | Assembly and signs agree. |
| A49 3.1 weight-zero coefficients | r=0, any n≥1 | M=O_cr; J⟨0⟩=O_cr,n; φ₀=φ | Retain. |
| A50 3.1 small-weight endpoint | p=2,r=1 | r≤p−1 is true; r≤p−2 is false | Coefficient equality does not extend exact-period range. |
| A51 3.1 division control | Z/p, equation p y=0 | Every y solves it; y=0 and y=1 distinct | Higher-level construction necessary. |
| A52 3.1 reductions/auxiliary levels | r=0, n=1,2 | (Z/p²)⊗Z/p=Z/p; reduction of φ(1)=1 at either level | Correct zero-weight control for level independence. |
| A53 3.2 divided/undivided fibres | r=0 | Both arrows are 1−φ; both fibres coincide | Retain. |
| A54 3.2 derived versus ordinary kernel | f=0:A[0]→B[0] | H⁰Fib=A,H¹Fib=B; ordinary kernel only A | Étale derived pushforward retained. |
| A55 3.2 syntomic surjectivity | Surjection A⊕B→B | Kernel A, fibre H⁰=A,H¹=0 | Kernel replacement valid only with surjectivity. |
| A56 3.2 transitions/empty input | Empty X; reduction Z/p²→Z/p | RΓ(empty)=0 in every degree; 1 mod p² maps to 1 mod p | Retain. |
| A57 3.3 comparison composites | ω=(pʳ,id), τ=(c,pʳ) | Both composites pʳ on each leg; r=0 gives id | Correct directions. |
| A58 3.3 bounded error is not inverse | ×p:Z/p²→Z/p² | Kernel pZ/p²≅Z/p, cokernel Z/p; p kills both, neither is zero | No integral equivalence. |
| A59 3.3 coefficient inclusion reduction | J=Z/8,M=2J; J=Z/27,M=3J | [2]≠0 in M/2M maps to 0; [3]≠0 in M/3M maps to 0 | c need not be monic. |
| A60 3.3 products | Weights r,s on coefficient source | pʳpˢ=p^(r+s); weight-zero unit acts by 1 | ω multiplicativity consistent; no τ algebra assertion. |
| A61 3.4 filtered PD degree | r=1,j=2 | r−j=−1; J^[−1]=O_cr, not zero | Integer degree convention retained. |
| A62 3.4 rational quotient | r=0 | DR/F⁰=DR/DR=0 | Correct second target. |
| A63 3.4 inverse rescaling | r=1,p=2 after rationalization | (2⁻¹τ)ω=1=ω(2⁻¹τ); τω=2 | Inverse includes the scalar. |
| A64 3.4 derived limit | Tail sums A_n=⊕_(j≥n)F_p | lim A_n=0; lim¹=∏F_p/⊕F_p; [(1,1,…) ]≠0 | Ordinary limit substitution rejected. |
| A65 3.4 completion/reduction | Trivial-log Z_p point, r=0 | Rlim[Z/pⁿ→⁰Z/pⁿ]=[Z_p→⁰Z_p]; mod pⁿ recovers both terms | H⁰=H¹=Q_p after rationalization. |
| A66 3.4 refinement coherence | Identity PD refinement twice | Comparison id∘id=id; no change to φ or J^[r−j] | Retain marked refinement maps. |
| A67 4.1 lattice definitions | p=2,r=0,1,2,4 | EN generators 1,1/2,1/8,1/384; CN 1,1/2,1/4,1/16 | Factorial matters at 2 and 4. |
| A68 4.1 odd-prime control | p=3,r=1,2,4 | EN 1,1/3,1/18; CN 1,1/3,1/9; ratios 1,1,2 | Last ratio is a 3-adic unit; lattices then equal. |
| A69 4.1 quotient and endpoint | r=p−1 | a=floor(r/(p−1))=1,b=0; generator 1/p | Alternative a=0,b=p−1 gives wrong lattice. |
| A70 4.1 finite-level inclusion | p=2,r=2,n=1 | Inclusion sends CN generator 1/4 to 2·(1/8); mod2 map F₂→F₂ is zero | Both quotients nonzero; no inverse inclusion. |
| A71 4.1 lattice products | p=2,r=s=1 | EN (1/2)²=1/4=2·(1/8); CN product 1/4 equals its weight-two generator | Correct integral product constants. |
| A72 4.1 denominator boundary | p=2,3; r=0 | p−1=1,2≠0; 0!=1; p⁰0!=1 | Prime hypothesis removes division by zero. |
| A73 4.2 generic locus | Trivial-log Spec Z_p | X_tr=Spec Z_p; U=Spec Q_p; p nonunit on X, unit on U | j starts at U. |
| A74 4.2 canonical-log locus | Closed-point log on Spec Z_p | X_tr=U=Spec Q_p | Specialization of general construction correct. |
| A75 4.2 maps/unit/reduction | r=0, n=1,2 | ω=id, EN=ordinary lattice, α(1)=1; reduction 1↦1 | Two period constructions coincide. |
| A76 4.2 nearby versus constant | Trait, r=0 | Cyclotomic ramified character gives nonzero H¹(I,Q_p/Z_p)[pⁿ]; constant stalk has H¹=0 | Nearby cycles retained. |
| A77 4.3 exact-range quantifiers | p=2 and p=3 | Allowed r={0} and {0,1}; excluded r=1 and r=2 respectively | No missing small-prime case. |
| A78 4.3 inverse Cartier | t dlog t on G_m/F_p | C⁻¹ gives [tᵖdlog t]≠0; ordinary class [dt]=0 | Semilinearity essential. |
| A79 4.3 closed Cartier target | A¹/F_p,q=0 | Z⁰=F_p[tᵖ], dt≠0; t is outside target, tᵖ inside | Correct target is closed forms modulo boundaries. |
| A80 4.3 étale surjectivity | u−uᵖ=t, z=uᵖ | dz=0; z−zᵖ=tᵖ; derivative of u−uᵖ−t is 1 | Includes p=2; not global-section surjectivity. |
| A81 4.3 tame and coefficient reductions | μ_p descent; n=1→2 | Descent degree p−1 is a unit modulo p; at p=2 degree 1 | Reduction route does not invert p. |
| A82 4.4 ramified chart | xy=π², e≥2 | h=2 lies in [1,e]; h=1-only model omits it | General chart retained. |
| A83 4.4 degree/range bound | p=2,r=1 | q=0,1 in scope; q=2 outside; refined exponents N+c₂(d) | Dimension and truncation retained. |
| A84 4.4 commuting Koszul | g₁=2,g₂=3 on Z | d⁰1=(2,3); d¹(1,0)=−3,d¹(0,1)=2; d²1=6−6=0 | Also 0 mod2 and mod3. |
| A85 4.4 zero/one direction | Empty directions; one identity endomorphism | Complex M[0]; for id, kernel=cokernel=0 | Boundary cases of supplied carrier correct. |
| A86 4.4 noncommuting control | γ₁=I+E₁₂,γ₀=diag(c,1), c=5 at p=2 and c=4 at p=3 | Commutator of γ₀−1,γ₁−1 sends e₂ to 4e₁ or 3e₁, not 0 | Twisted arithmetic totalization cannot be replaced by commuting Koszul. |
| A87 4.4 rational versus integral error | Kernel Z/p^A, finite n | p^A acts by 0; tensor Q_p gives 0, integral group remains nonzero | Bounded error not exactness. |
| A88 4.5 attachment/restrictions | General gluing, then no closed part | i*E=S,j*E=Rj′*L; if closed part empty, E=Rj′*L | Correct recollement object. |
| A89 4.5 same error exponent | Open period id, closed kernel/cokernel killed by p^A | Open error 0; closed error p^A·M=0; global error i_*M killed by same p^A | No artificial doubling. |
| A90 4.5 gluing unit | r=0 | Closed unit 1 and open unit 1 have common image 1 | Period sends glued unit to 1. |
| A91 5.1 shared HK carrier | Point; rank-two test | Point N=0,φ=σ; rank-two Nφe₁=p e₀=pφNe₁ | Adapter preserves supplied operators. |
| A92 5.1 Cartier-type control | p=2, k[t]/t³, tame log chart 1↦3 | φ(t²)=t⁴=0 although t²≠0 | No bijective-HK conclusion for this non-Cartier example. |
| A93 5.1 uniformizer sign | N²=0, π→πu | exp(log u N)e₁=e₁+log(u)e₀; negative sign would subtract | Positive Taylor convention retained. |
| A94 5.2 semistable square | Rank-two data, p=2,r=0,1,2 | N(1−φ/pʳ)e₁ and (1−φ/p^(r−1))Ne₁ both equal −e₀,0,e₀/2 | r=0 uses 1−pφ below. |
| A95 5.2 odd-prime square | p=3,r=0,1,2 | Both paths give −2e₀,0,(2/3)e₀ | Same normalization at odd prime. |
| A96 5.2 total differential | p=2,r=0,ι=id,E=D | d⁰e₁=(−e₁,e₁,e₀); d¹d⁰e₁=−e₀+e₀=0 | Differential squares to zero. |
| A97 5.2 independent d¹ control | Same data, inputs (e₁,0,0),(0,0,e₀) | d¹ gives e₀,e₀ respectively; at r=1, (0,0,e₁) gives e₁ | Checks more than the image of d⁰. |
| A98 5.2 normalized adapter | e=2,N_b=−N/2 | Degree-one image of d⁰e₁=(−e₁,e₁,−e₀/2); d¹_b(e₁,0,0)=−e₀/2 | Both chain squares match degree-two scale −1/2. |
| A99 5.2 zero denominator control | Artificial e=0 using total inversion | Scalar −1/e=0 makes chain equations degenerate, but kills nonzero degree-two vector | e>0 and invertibility retained. |
| A100 5.2 zero monodromy | N=0,e=2 | Adapter still scales last degree-one and degree-two terms by −1/2 | Does not become the identity on all terms. |
| A101 5.2 normalized change law | N_b=−N/e | −e log(u)N_b=log(u)N; both exponentials send e₁ to e₁+log(u)e₀ | Supplier normalization explicitly reconciled. |
| A102 5.3 rational h compatibility | Point, r=0 | τ≤0 source and target H⁰=Q_p; H¹ not part of this truncation | No untruncated period equivalence inferred. |
| A103 5.3 pullback/product | Identity arithmetic-pair map and unit | Pullback 1↦1; period(1∪x)=period(x) | Imported natural/product maps retained. |
| A104 6.1 relative construction | u=id_S and empty U | H⁰=(B_K,B†_K), Hⁱ=0 for i>0; empty gives 0 in all degrees | Correct pre-admissibility datum. |
| A105 6.1 geometric Frobenius | P¹_S | H⁰=O,H¹=0,H²=O(−1); φ on H² is pσ, not p⁻¹σ | Retain. |
| A106 6.1 actual comparison | Identity family | c(b⊗a)=ab; zero replacement sends 1 to 0 rather than 1 | Construction specifies the map before invertibility. |
| A107 6.2 independent algebraic finiteness | S=A¹_Zp,U=D(pt−1), open identity | H⁰_dR=Q_p[t,(pt−1)⁻¹] not finite over Q_p[t]; rigid realization=B†_K, since Σpʲtʲ=(1−pt)⁻¹ overconverges | Rigid coherence and c alone insufficient; excluded. |
| A108 6.2 c-isomorphism requirement | Rank-one modules with c=0 | Kernel=K,cokernel=K; genuine c=id has both 0 | Predicate excludes wrong map. |
| A109 6.2 filtration/local freeness | Grade K[t]/(t) over K[t] | Fibre ranks 1 at t=0,0 elsewhere | Excluded; zero datum has rank 0 everywhere and is admitted. |
| A110 6.3 good compactification | S=A¹,U=S×G_m inside P¹×P¹ | Horizontal boundary two disjoint sections; relative NC coordinates 0,∞; vertical boundary from base ∞ | Full setting has a concrete example. |
| A111 6.3 relative-boundary control | Sections x=0,x=t at t=0 | Two generic boundary points coalesce to one support point | Total crossing does not imply relative NC/étale boundary. |
| A112 6.3 proper boundary case | Projective smooth family, empty horizontal boundary | Horizontal divisor 0; relative log data trivial | Proper case retained. |
| A113 6.4 proper finiteness/Hodge | Connected projective curves of genus 0,1 | Cohomology ranks (1,0,1),(1,2,1); Hodge H¹ grades ranks (0,0),(1,1) | All degrees and finite grades retained. |
| A114 6.4 open good family | Constant G_m family | H⁰ rank1, H¹ rank1 with φ=p, higher 0 | Open comparison differs from proper case. |
| A115 6.4 coefficient extension | P¹ over K→L finite | H²_K⊗K L=L(-1)=H²_L; dimension 1 on both sides | Retain natural base change. |
| A116 6.5 affine-line comparison | A=V[t], base V | Dagger de Rham H⁰=K,H¹=0; rigid A¹ has same groups | Overconvergent integration control. |
| A117 6.5 multiplicative-line comparison | A=V[t,t⁻¹] | H¹=K·dt/t; residue of exact derivative 0, residue dt/t=1 | Nonzero class cannot be erased. |
| A118 6.5 ramified no-Frobenius case | V=Z₂[π]/(π²−2), U=S×A¹ | Relative H⁰=B†_K,higher 0; Frobenius modulo p impossible by A02 | General comparison retained without Frobenius claim. |
| A119 6.5 affine hypothesis | Proper elliptic E/V | H¹(E_K^an,O)=K≠0; alleged unrestricted vanishing would give 0 | Source overstatement excluded. |
| A120 6.5 edge-map hypotheses | Coherent direct images over affine dagger S | Higher sheaf-cohomology rows j>0 are 0; surviving row j=0 gives the same Hⁱ | All-degree acyclicity used, not merely source acyclicity. |
| A121 6.6 residue/Gysin | P¹−{0,∞} | H¹ rank1; Res dlog t=(1,−1); Gys=sum gives 0; kernel rank1 | Exactness and sign agree. |
| A122 6.6 nonsplit boundary | Z₂, D:t²+t+1=0 | Discriminant −3 unit; H⁰D rank2, trace-zero rank1; φ on trace-zero twist is 2(−1)=−2 | No split-section indexing. |
| A123 6.6 filtered/Tate shift | dlog t in H¹(U) | Res has coefficient 1 in H⁰D(−1); both Frobenii multiply by p | Strict filtered target has correct twist. |
| A124 6.6 empty boundary | U=X proper connected curve | H²X=K(-1); map H²X→H²U=id, not 0 | Affine short-sequence hypothesis excludes case. |
| A125 6.6 Ext pushout | Split E, then pushout by Res; scalar class a | Split class stays 0; scalar image a·Res(h) equals Res(a h) | Evaluation naturality agrees. |
| A126 6.7 filtration of geometric twist | H=Hⁿ(n+1), n=0,1 | F⁰H=F^(n+1)Hⁿ=0; n=1 G_m gives O(1) | Required F⁰-vanishing and all-prime point case agree. |
| A127 6.7 projection equation | Split geometric extension | δ=0,R=0; (1−Φ)δ=dR=0 | Retain. |
| A128 6.7 residue twist | n=1,r=2 | Res:H¹(U)(2)→H⁰D(1); φ on target p⁻¹σ | Same shift as §6.6 plus twist. |
| A129 7.1 canonical lifts | σt=tᵖ over W(k) | P₀=0,P₁=1,P_a=[a]; F_W[a]=[a]ᵖ | Compatibility equation satisfied. |
| A130 7.1 arbitrary-lift exclusion | t↦p | F_W(p)=p while P(σt)=pᵖ≠p | Not a compatible point. |
| A131 7.1 changed Frobenius lift | σt=tᵖ+p, residue point 0 | Compatible lift x≡p mod p²: x=2 mod4 at p=2, x=3 mod9 at p=3 | Lift depends on σ as asserted. |
| A132 7.2 zero/empty cases | Rank-zero M; empty special fibre | M=0 has only x=0; completion of empty special fibre is 0 | No spurious nonempty/rank hypothesis. |
| A133 7.2 detection/section equality | Rank-one unit on nonempty smooth special fibre | 1 evaluates to 1; equal sections have difference evaluating to 0 | Zero-map test distinguishes wrong evaluation. |
| A134 7.2 finite residue-field control | F_p, f=tᵖ−t | f≠0 as polynomial; f([a])=0 for all a∈F_p | Algebraic closedness retained. |
| A135 7.2 reducedness control | k[ε]/ε² | ε≠0; every k-valued point sends ε to 0 | Smooth/reduced hypothesis excludes this wrong detection model. |
| A136 7.3 specialization of representatives | Compatible point, relative δ and R | Pullback of relative Ω¹ to point is 0; representative becomes (0,P*R) | No confusion with cotangent-fibre evaluation. |
| A137 7.3 naturality/splitting | Identity base map; split E | R pulls back to R; split remainder 0 pulls back to 0 | Retain. |
| A138 7.3 compatibility control | Noncompatible t↦p of A130 | Frobenius square differs by pᵖ−p≠0 | Compatibility premise necessary. |
| A139 7.4 point horizontal comparison | Y=Spec Z_p,D=∅,r=0 | Both fibres [Q_p→⁰Q_p], H⁰=H¹=Q_p | Same producer and sign. |
| A140 7.4 log/rigid differential | P¹ with boundary 0,∞ | Both realize dlog t with φ=p; (1−φ/p)dlog t=0 | Correct unramified single-fibre comparison. |
| A141 7.4 vertical-log control | Point, r=1 | Horizontal H¹ dimension1; vertical C_st dimensions (1,3,1), differential ranks (1,0), H¹ dimension2 | Vertical log cannot be added silently. |
| A142 7.4 period-domain control I | j:Spec Q_p→Spec Z_p, r=1 | H¹_rsyn(source model)=Q_p, generic-only syntomic=0; j_K=id on étale H¹ | Broad natural period would kill nonzero point image; pair restriction retained. |
| A143 7.4 period-domain control II | L=Q₃(√2), generic-only, r=0 | H⁰_rsyn=L; H⁰_et=Q₃; mod3 squares 0,1, never 2 | No normalized unital algebra period on this domain. |
| A144 7.4 products/pullback | Identity pair; weights 0 and r | Identity sends dlog to dlog; 1∪x=x on both realizations | Named comparison maps carry unit and product. |
| A145 7.5 connecting sign | b in rigid degree n, filtered terms vanish in n,n+1 | Connecting image (0,b); inverse returns b, not −b | Positive sign agrees with §1.4. |
| A146 7.5 curve headline | n=1,r=2 on good curve pair | F²Ω•=0; H²_rsyn≅H¹_rig; for G_m both dimension1 | Absolute extension value lands in actual target. |
| A147 7.5 upper-vanishing control | A=K in degree n+1,B=0 | HⁿB=0; H^(n+1)Fib=K | Connecting map not surjective without upper vanishing. |
| A148 7.5 lower-vanishing control | A=B=K in degree n,f=id | HⁿB=K; Fib acyclic, H^(n+1)=0 | Connecting map not injective without lower vanishing. |
| A149 7.5 specialization/period square | Split E and identity compatible point | R=0; connecting class 0; both log and rigid period images 0 | Retain natural maps; no symbol-regulator equality assumed. |

| A150 5.2 total-function corner | Formal coordinate p=0,r=0,e=2, φ=diag(1,2) | 0⁰=1,0¹=0; both adapter squares have coefficient −1/2 on the tested legs; classical d¹d⁰e₁=−2e₀, transported =e₀ | Adapter commutation survives; a geometric differential-square theorem is not asserted at p=0. |

The rational lattice and semistable-square values, the e=1,2 and invalid e=0 adapter controls, and the p=2,3 semidirect commutators were also recomputed in scratch with exact rational arithmetic. The finite-field, residue, filtration and cohomology calculations above were checked directly. In particular, no assertion was inferred merely from a successful `sorry` build.

### Pinned-library duplication audit

Opened the definitions, relevant binders and cited declarations in these **17 pinned files**, rather than relying on declaration-name search alone. Paths in this table are relative to the corresponding library repository. Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and line | Declaration/object checked | Consequence for ownership |
|---|---|---|
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` | `CochainComplex.mappingCone`; inl 72, inr 76, fst 80, snd 88 | Native preadditive cone with relevant biproducts; explicit fibre signs are an adapter, not a new cone construction. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | `WittVector.Isocrystal`, Hom 132, Equiv 138; binders 73 | Perfect characteristic-p domain and prime p; module with invertible semilinear Frobenius. No finite-dimensional HK realization is part of this structure. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55` | `HasExt`, `Abelian.Ext` at 118; abelian binder 49 | Does not supply Yoneda Ext for this merely exact coefficient category. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` | `BDeRhamPlus`, `BDeRham` 88; binders 51–52 | CommRing, prime p, p nonunit, p-adic completeness; completion/localization carriers do not assert the requested period fundamental sequences. |
| `Mathlib/NumberTheory/Padics/PadicIntegers.lean:576` | `PadicInt.algebra`, algebraMap_apply 580, isFractionRing 584 | Actual Z_p scalar action on Q_p, used for lattices. |
| `Mathlib/LinearAlgebra/Span/Basic.lean:237` | span_singleton_eq_span_singleton; toSpanNonzeroSingleton 894 | Domain/torsion-free and nonzero-generator hypotheses support coordinate/unit-invariance tests; not geometric Tate sheaves. |
| `Mathlib/NumberTheory/Padics/RingHoms.lean:447` | toZModPow; ker_toZModPow 459 | Reduction has kernel pⁿ, so the nonzero mod2 lattice models in A70 are legitimate. |
| `Mathlib/Data/ZMod/Basic.lean:1135` | ringHom_surjective | Surjectivity for the indicated coordinate reduction. |
| `Mathlib/LinearAlgebra/Prod.lean:64` | LinearMap.fst, snd 70, prod 95 | Native semiring/module product maps; no need to plan product linear algebra again. |
| `TauCeti/Algebra/Homology/HomotopyCategory/MappingCone.lean:49` | nonempty_homotopy_id_zero_of_homotopyEquiv; binders 36 | Contractibility with preadditivity, zero object and binary biproducts. |
| `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:81` | IsStandardSyntomicOfRelativeDimension | Flat finite-presentation/fibre-dimension algebra predicate, not a cohomology complex. |
| `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` | ExactStructure | Chosen Quillen exact structure with additive-category binders; imported, not reconstructed. |
| `TauCeti/CategoryTheory/Exact/Functor.lean:74` | IsConflationExact; binders 64–67 | Additive functor preserving chosen conflations. |
| `TauCeti/CategoryTheory/Exact/Monoidal.lean:49` | IsMonoidal | Tensor-left and tensor-right exactness; monoidal/preadditive hypotheses retained. |
| `TauCeti/CategoryTheory/Exact/Opposite.lean:150` | op; op_conflation_op_iff 197 | Opposite exact structure supports the duality direction. |
| `TauCeti/Algebra/Homology/Ext/Basic.lean:50` | Abelian and HasExt assumptions | Existing Ext functoriality does not discharge the general exact-Yoneda contract. |
| `TauCeti/Algebra/Homology/LinearYoneda.lean:56` | linearYonedaFunctor; shortExact_map_linearYonedaFunctor 99 | Additive linear Hom complexes; short-exactness theorem requires degreewise splitting in an abelian setting. |

Object searches across both pins found syntomic algebra/morphism predicates but no FilFMIC or the actual log-crystalline, rigid-syntomic and Hyodo–Kato realizations needed by the headline statements. The native source checks above confirm the important near misses. There are no declarations in this Suggested file whose fully qualified names could duplicate a sibling's declarations.

### Cross-roadmap ownership and supply

Used the prescribed `roadmaps grep` service for object searches, including filtered Frobenius connections, rigid syntomic fibres, exact-category Yoneda theory and local comparison constructions; searched the provided content, package and sibling locations as well. Read the cited passages rather than treating the search index as evidence of their hypotheses. The content checkout inspected reports head `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`; the worker's citation index identifies its earlier main snapshot as `d982d9f`. The direct file checks, not that index's “found” status, support the resolutions below.

| Roadmap file / locator actually read | Resolved ownership boundary |
|---|---|
| `TauCetiRoadmap/AdicSpacesPartIV/README.md:3766`, §§F1.5,F1.7–F1.9,F1.12,F1.16 | Weak completions, dagger/rigid comparison, continuous and log forms. In F1.7, affinoid Kiehl is at 4363, theorem B at 4376, strict neighbourhood at 4381 and overconvergent sections at 4457. Tube-model/derived-colimit extensions are separately contracted here; affinoid acyclicity alone is not treated as higher-direct-image acyclicity. |
| `TauCetiRoadmap/RigidAnalyticGeometry/README.md:464`, §§6.1–6.2,7.3–7.4,8.1,8.4 | Sites/common rigid space, coherent and quasi-Stein results, proper maps, analytification and proper GAGA. Read the corresponding starts at 479,617,640,690,762. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, §§0.1–0.4 | Enhanced carriers, replacements, tensor/Hom and derived functors; remaining starts 441,455,492. Rlim is §E2:towers.1 at 1294; monoidal interfaces §E5:abstract at 1436. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:231`, §§F.0.3,F.1,F.3a,F.4.1–F.4.5 | Finite Tate coefficients where the coefficient modulus is invertible, derived and trait realizations, normalized adic towers and rationalization. Starts 457,776,959,979,999,1021,1041 read. Extra closed log/syntomic nearby-cycle machinery is a contract here, not inferred from the prime-to-residue-characteristic theory. |
| `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516`, §0.K.1 | Scalar-sequence Koszul and linear-functional construction. This does not already construct twisted continuous cohomology of the arithmetic semidirect-product group. |
| `TauCetiRoadmap/GrothendieckEulerForms/README.md:178`, Layers 0 and 5 (383; abelian Ext 398–418) | General exact-structure and abelian Ext boundaries. General R-linear exact-category Yoneda groups and products remain the named extension contract. |
| Supplied QWittVectors head, `TauCetiRoadmap/QWittVectors/README.md:11` and 58 | Refers commuting-endomorphism Koszul to AInfCohomology §AI.1.7. Its own §1.7 is not a second owner. Actual AInf section verification remains unavailable below. |
| Supplied PadicHodgeRegulators head, `TauCetiRoadmap/PadicHodgeRegulators/README.md:84` | Explicitly imports this roadmap's §§1–7 on their stated domains. Its additional negative-weight, dagger-filtration and regulator-specific extension contracts are downstream requirements, not prerequisites here. |
| Same consumer, `TauCetiRoadmap/PadicHodgeRegulators/README.md:263` and 307 | Its rigid fibre orders components differently; swapping and negating the comparison component identifies it with this roadmap's convention. Its EN-to-CN factorial rescaling is explicit; it must not be mistaken for the inclusion in A70. Generic producers remain owned here, symbols and regulator equalities there. |
| Supplied ColemanIntegrationPartII head, `TauCetiRoadmap/ColemanIntegrationPartII/README.md:413`, 462, 1085 | Curve graph/node, integration and branch/index constructions are distinct from these geometric coefficient producers. No reverse supplier edge was introduced. |
| Supplied CstConjectureForDaggerVarieties head, `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:7`, 124–134 | Analytic dagger/C-lattice comparison domain differs from the classical W(k), arithmetic-pair and AM relative domains here. |
| Supplied HabiroCohomologyFoundations head, `TauCetiRoadmap/HabiroCohomologyFoundations/README.md` | The searched syntomic/Nygaard material concerns q-prismatic/Habiro constructions, not these classical log-PD producers. No matching owner for this construction was found there. |

The broad search located other occurrences as citations or different realizations; it did not establish another owner for the retained classical producers. Ownership against unprovided open heads was not checked. No assumption about those heads is being smuggled into the resolved rows.

All **34** README contract slugs have a matching entry in `packages/CohomologyComparisonsPartII/design/plan.json`; none has supplier `none`. Their mathematical needs are stated with coefficient/geometric domains and assigned to named owners. Their APIs belong to the stated input objects; no full exact small-weight or bounded all-weight period theorem is a local-period supplier premise. In particular, the CN radius, annulus, Frobenius-change, Lie, Lazard, φ/ψ, disk, Galois, approximation, K(π,1), étale-GAGA, descent and twisted-Koszul inputs are separately identified. Read CN line 1453–1456, CN line 1545–1548, CN line 1569–1588, CN line 1824–1954, CN line 1998–2001, CN line 2055–2057, CN line 2148–2150, CN line 2176–2187, CN line 2249–2255, CN line 2267–2277 and CN line 2659–2762. These are intermediate comparisons, rather than circular requests for the endpoint theorem.

The public README uses the corrected closed-form Cartier target, the projective-horizontal-pair rigid period domain and the AInf commuting-Koszul boundary. Older registry wording/announcement work is not a new defect in the two files under review; the previous repair records explicitly leave external registry actions outside this package. I have not re-raised those settled actions.

The worker's two unresolved-citation leads were examined. `TsujiNearby §4` at README line 536 is a source identifier, not an undeclared roadmap. `Decalage.koszulComplex` at line 86 is a planned AInfCohomology citation, not a claim of a pinned declaration. Its absence from the pins is therefore not itself a missing-library finding; verification against that supplier's own head remains outstanding below.

## Not verifiable

- The supplied main-content and package locations do not contain the cited README sections for **AInfCohomology, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology, ColemanIntegration, or PrismaticCohomologyPartIII**, and the brief supplies no open-head file location for them. I checked those allowed locations and the locator/index leads, but did not inspect additional unprovided open heads. Thus their section existence, exact current formulations and ownership against those open pull requests are **not verified**. This is not evidence that the citations are false. The explicit declared extensions are treated as conditional supply contracts, as instructed.
- **BesserII** remains the settled uncertified citation. It is downstream integration context, not support for one of the sampled producer theorems. I did not request it again or infer its contents.
- Some displayed formulas in the supplied OCR extraction of **BesserI** are incomplete. The surrounding prose and locators were readable; the concrete fibre formulas used in this review were cross-checked against AM and NN and directly calculated above. The unreadable OCR fragments are not certified as exact transcriptions. CN's factorial and remainder issue was additionally checked visually on the cached PDF's page 23, so that issue is not inferred from an OCR omission.

## Source issues

These are source-text issues, not additional roadmap findings: the reviewed roadmap already avoids the relevant false generality or fixes the convention.

- **Misprint** in AM at Definition 2.1, printed p. 4 (AM line 138): the source says Frobenius is an algebra isomorphism on the coherent coefficient module; it should be a module isomorphism; affects a stated result.
- **Misprint** in AM at (2.4) and the extension before (2.7), printed pp. 6–7 (AM line 232, AM line 261): the source says an extension with middle terms M_i through M_0 gives an i-fold connecting map; it should be indexed with i middle terms, or give degree i+1; affects the proof.
- **Error** in AM at the construction preceding (2.7), printed p. 7 (AM line 264): the source says the unit coefficient's degree-zero syntomic cohomology is Q_p for the stated bases; it should be used through its distinguished unit, without that identification on disconnected bases; affects the proof.
- **Error** in AM at Lemma 2.19, printed pp. 14–15 (AM line 609–620): the source says coherent overconvergent coefficients have no positive cohomology on every smooth V-scheme; it should be restricted to the affine setting used by the proof; affects a stated result.
- **Misprint** in AM at the proof of Theorem 3.7, printed p. 31 (AM line 1361): the source says the two specialized values are equal without a sign; it should be equality with the factor (−1)^n retained; affects the proof.
- **Error** in BesserI at Proposition 6.3, manuscript p. 19 (BesserI line 736–737): the source says syntomic cohomology is a finite-dimensional K0-vector space when K/K0 is finite; it should be Q_p-linear, with finite-dimensionality here justified under finite residue-field hypotheses; affects a stated result.
- **Error** in BesserI at Corollary 9.10, manuscript p. 32 (BesserI line 1214–1216): the source says the natural étale period exists on every smooth quasi-projective model; it should be restricted to the smooth-pair domain justified in KLZ Theorem 2.4.2(1) and Remark 2.4.3; affects a stated result.
- **Error** in CN at §2.4.3, printed p. 23 (CN line 968–971): the source says the exact fundamental-sequence kernel generator has denominator p^a; it should be divided additionally by a!, as in EN and NN; affects a stated result.
- **Misprint** in CN at §2.4.3, printed p. 23 (CN line 970): the source says the remainder b may equal p−1 in r=(p−1)a+b; it should be 0≤b<p−1 to specify the intended quotient and lattice; affects a stated result.
- **Misprint** in EN at the proof of Theorem 2.5, printed p. 9 (EN line 385–386): the source says the errors are killed by N and transfers this to the left map; it should be p^N, transferred to the middle period map since the left map is identity; affects the proof.
