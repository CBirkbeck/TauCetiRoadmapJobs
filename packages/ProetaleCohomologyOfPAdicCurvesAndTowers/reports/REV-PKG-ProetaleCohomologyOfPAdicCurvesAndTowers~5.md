<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6787719888 -->
Review (codex) of 866fd95

Verdict: needs_changes

1. **F01** (P1) An arbitrary comparison map need not detect the normalization correction

   **Location:** README.md:302: “`ι_HK^{(p)}` differs from `ι_HK^ϖ` unless `log_K(a)N_p = 0`”. The allowed comparison at line 290 is merely a continuous linear map.

   **Claim:** Equality of these maps forces the nilpotent correction to vanish.

   **Witness:** Take K=ℚ₃, ϖ=12, e=1, M=ℚ₃², φ=diag(1,3), Ne₁=e₀, Ne₀=0, and ι=0. Both comparison maps are zero, but log₃(4)Ne₁≠0.

   Here Nφ=3φN, and v₃(log₃4)=1. The zero map is continuous and satisfies even the uniformizer transport law if all the comparison maps are zero. Thus adding only that law would not repair this assertion.

   **Exact repair:** Retain the useful general continuous-map formulation, but state equality exactly when `ι ∘ (exp(−cN_p)−1)=0`, where c=log_K(a). For nilpotent N_p this is equivalent to `ι ∘ cN_p=0`: factor the exponential difference as cN_p times an invertible polynomial in cN_p. Only with injective ι may it be replaced by cN_p=0. Add the zero-map negative control. On the witness both repaired composites are zero; on the faithful two-dimensional example the difference at e₁ is −log₃(4)e₀≠0.

   Also make the last sentence of line 310 precise: when e=1 and ϖ=p, require the same compatible roots to conclude Ψϖ=A₁=id; the exponential correction is identity, and the normalized comparison equals the given comparison, which need not itself be identity. For N=0 and ι=2id it remains 2id. If the roots of ϖ and p differ by ε, then a=1 but ℓ_a=t and Ψϖ(u)=u−t, so equality of uniformizers alone does not make this map identity.

2. **F02** (P1) Infinite component actions contradict the diagonal centre

   **Location:** README.md:857: “`ν_H = det`, `Nrd`, and the reciprocity map … in the action conventions of EndoscopicTransferAndUnitaryTraceComparison §12.2”. Compare the diagonal-triviality convention at line 55 and the inverse norm earlier in line 857.

   **Claim:** With the imported common left-action convention, the two group factors translate the F×-torsor of components by det(g) and Nrd(b).

   **Witness:** For F=ℚ₃ and (g,b)=(3I₂,3), det(g)=9 and Nrd(b)=9. Their product is 81, moving height by 4; diagonal triviality requires multiplier 1 and height change 0.

   This is an internal contradiction independently of reciprocity orientation. The supplier at open pull request #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4706` (§12.7), uses det(g)Nrd(b)⁻¹ and a trivial diagonal centre; its §12.14, lines 4862–4864, also requires inverse central characters. CDN20 lines 101–107 do print the two positive characters, but that wording cannot be combined with the supplier's convention without an action dictionary. The finite-level formula and Check in this package already use the inverse norm (STR08 line 382).

   **Exact repair:** Give the action dictionary from CDN20 to the imported left actions. With det on G and a trivial diagonal centre, use Nrd⁻¹ on D× in the infinite component action, and specify the corresponding reciprocity orientation using the supplier's Weil descent. Distinguish “factors through Nrd” (which remains true) from the actual translation character. Verify the induced cohomology, dual and Hom/tensor-sector conventions in §§7.3–7.5 under that dictionary. Add this central test: 9·9⁻¹=1, height 2−2=0; retain the finite-level scalar action b⁻ⁿ. Do not import the later Scholze-functor roadmap's different right/left convention as an upstream prerequisite.

3. **F03** (P2) The resolved semistable triangulation is not the intrinsic node set

   **Location:** README.md:869: “from which the minimal semistable model is obtained by blowing up” and “the triangulation it defines is the node set”.

   **Claim:** The triangulation of the resolved semistable model used in the proof is exactly the intrinsic node set, so its invariance follows directly from node invariance.

   **Witness:** Resolving a split stable node xy=ϖ² inserts a genus-zero exceptional component of valence two. The length-two edge becomes two length-one edges; its new middle vertex is not an intrinsic analytic node.

   CDN20 Proposition A.1 carefully distinguishes the generalized semistable model marked “+” from its resolved model marked “◦”. Node equality is proved only for “+” (lines 2108–2120, printed p.53); equivariance of “◦” then follows from functorial resolution (lines 2121–2122). CDN23 lines 1204–1210, printed p.31, make the same distinction. At open pull request #1494, `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1318` (§2.16), a split genus-zero valence-two interior point satisfies none of the node alternatives; §2.17, line 1371, requires preserving the actual model's component-point set.

   **Exact repair:** State existence and equivariance of the resolved semistable model with a triangulation refining the intrinsic node set. In the route, prove node equality and automorphism invariance for the “+” model, then extend the action to the “◦” model by the functorial resolution in CDN20 Proposition A.1. Keep finite G-orbits and open stabilizers. Add the thickness-two example: the intrinsic graph has the original endpoints, the resolved vertex set has those endpoints plus one valence-two vertex, and both have total edge length 2. This repairs the cited proof route without weakening the required semistable-model theorem.

4. **F04** (P3) The Jacobian definition points to a different passage

   **Location:** README.md:596: “`Ĵ` … sequences … (CDN-CURVES §7.1.5, line 4044)”.

   **Claim:** Line 4044 locates the sequence-space definition.

   **Witness:** CDN-CURVES lines 4017–4021 define the sequences and Tate-module subspace. Line 4044 ends the introduction to the different dagger-affinoid sequence displayed at line 4045.

   **Exact repair:** Cite CDN-CURVES §7.1.5, lines 4017–4027, printed p.96, for the definition and logarithmic exact sequence. Keep Théorème 7.9, lines 4049–4050, printed p.97, for the period isomorphism. The replacement passage includes both the recurrence x_n=px_{n+1} and convergence as n→−∞, so it supports the actual definition rather than a larger inverse-limit group.

Four findings: two P1, one P2, one P3. The package is repairable. Its authored files were not changed. Below, README.md and Suggested.lean abbreviate `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`; library paths are relative to their pinned repositories.

## Verified sound

### Previous findings, checked first

All four preceding findings were addressed. None was marked “not actionable in this package”. These assessments concern the previous defect, not the new claims introduced by its repair.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, principal-unit denominator | Repaired | README.md:507 now has `ℚ_p ⊗ (O(Y^†)^{**}/(1 + m_C))`. The constant p has abs(p−1)=1 and is excluded; 1+p² belongs to the denominator and has logarithmic class zero modulo C. |
| F02, componentwise constants | Repaired/clarified | README.md:324 explicitly gives `H⁰_dR(Y) = LC(Y, C) = C^m` and the product integral fixed lattice. The earlier standing connectedness was already present, as the repair report observes; the explicit disjoint-union extension now removes the ambiguity. On two discs, (0,1) is nonzero modulo diagonal C and zero modulo C². |
| F03, cone shift | Repaired | README.md:450 states `Syn(Y_S, 1) = Cone(1 − φ/p)[−1]` and `d(x, y) = (dx, −(1 − φ/p)x − dy)`. For odd p the constant summand now has H⁻¹=0, H⁰=ℤ_p t. Its regulator logarithm has the sign making the second differential zero. |
| F04, normalization supplied too late | Repaired | README.md:288 introduces “1.4 Uniformizer normalizations of semistable period data”; line 312 needs §§1.2–1.3 and named earlier suppliers. §§4.3 and 5.2–5.5 use this target. The old forward edge is gone. R01 concerns a new assertion about arbitrary comparison maps, not the relocation. |

I reread the 51 numbered target subsections, their Needs lines, the eight layer dependency summaries, the four package files, the previous review and repair report, and the supplied citation, signature, near-match, overlap and board-package indexes. For untouched material I used the earlier review's computed adversarial rows, not bare summaries. Changed passages, every seeded target, and the headline families were examined anew. The table records computed tests on that required report sample; examples are diagnostics, not proofs of the general theorems.

### Adversarial calculations

| Statement | Instances tried | Computed values on both sides / negative control | Result; change |
| --- | --- | --- | --- |
| §0.1 graphs with legs | One loop; one vertex with one or two legs | Loop boundary=0, H¹=H¹_c=L. One leg gives coker(−1)=0. Two legs give L²/ΔL=L and residues (a,−a). | Compact edges versus legs correctly distinguished. |
| §0.1 duality | L=𝔽₄, two-dimensional L-space | L-linear dual has 4²=16 elements; additive 𝔽₂-valued dual also has 16, but L-valued additive dual has 4⁴=256. The required dual is L-linear. | Scalar-linear dual convention retained. |
| §0.2 metric monodromy | Length-three loop subdivided 1+2; four-leg tree | Pairing 3ab=(1+2)ab. Tree H¹=0, residue rank 3, monodromy image 0. | Subdivision and noncompact radical agree. |
| §§0.3–0.4 flags and quotient | n=0; n=2,m=0,1,2,3; d=0; q=2,d=1 | Flag dimensions 0 and (0,1,2,2). e₀∈F₁, e₁∉F₁. d=0 quotient=A. First finite flag stage has 3 functions modulo 1 constant, dimension 2. | Degenerate/rank-one cases consistent. |
| §0.3 translation | S₃, g=(12),h=(23), f=δ₁,x=gh | Inverse translation composite and product both give 1; direct translation gives 1 versus 0. | Genuine left representation; wrong order excluded. |
| §0.3 quotient dual | Two point masses | δ_x has total mass 1 and fails to annihilate constants; δ_x−δ_y has total mass 0. | Dual is annihilator of relations, not all measures. |
| §0.4 completion and irreducibility | Complete DVR lattice; zero module; coefficient fields of characteristic 0,p | lim Λ/ϖⁿ=Λ; lim 0=0. Full J gives relation space 0 and representation A, irreducible over a field. Zero coefficient ring gives 0 but is excluded by Field. | Source field and characteristic hypotheses match Lean. |
| §1.2 completed tensor | M=0,F²,∏F; dense proper U⊂V | Tensors 0,B²,∏B. V/U≠0 while its Hausdorff quotient=0. | Nonseparated convention cannot be silently replaced. |
| §1.3 period functor | Slopes 0,1,2; slope-1/2 block over two residue fields | X¹ values (B_cris⁺)^(φ=p), ℚ_p, 0. For k=𝔽̄_p or algebraic closure of 𝔽_p(t), φ²=pσ² and the rank-two block has BC Dimension (1,2). | Arbitrary algebraically closed residue field covered by CR.4.7 and declared gap. |
| §1.4 scaling | e=2, N_raw e₁=2e₀ | A₂(e₁+ue₀)=e₁+2ue₀, D_raw=0; wrong direction gives e₁+4ue₀ and D_p=−3e₀. | Scaling identity correct. |
| §1.4 unit/sign correction | p=3,ϖ=12,a=4 | v₃(log₃4)=1; Ψ(u)=u−ℓ₄; θΨ(u)=−log₃4. Correct exponential factors multiply to 1; reversed sign leaves 2log₃4·e₀. | Transport sign correct for a detecting comparison. |
| §1.4 arbitrary comparison | Same module, ι=0; also N=0,ι=2id | Corrected map=uncorrected map=0, but cNe₁=ce₀≠0. In the second case both maps=2id, not id. | R01. |
| §1.4 roots | e=1,ϖ=p, root systems differing by ε | a=1, ℓ_a=t, Ψ(u)=u−t≠u. Equal root systems give ℓ_a=0 and Ψ=id. | R01 clarifies identity Check. |
| §§2.3,3.2 de Rham reconstruction | Closed annulus; ω=ΣpⁿT^(pⁿ−1)dT | Primitive coefficients at T^(pⁿ) are 1, hence no convergent primitive on outer boundary. Ordinary [ω]≠0, separated [ω]=0; residue(dlog T)=1, residue(ω)=0. | Ordinary and separated cohomology correctly distinguished. |
| §2.4 Kummer symbols | Constant,T,T² on annulus; any prime ℓ | Constant class=0; valuation classes 1,2 modulo ℓⁿ and dlog residues 1,2. | Twist and multiplicative-to-additive direction agree, including p=2. |
| §3.3 mapping fibre | Constant disc summand, odd p | Cone has H⁻¹=ℤ_p t; shifted fibre has H⁻¹=0,H⁰=ℤ_p t. | Previous F03 repaired. |
| §3.3 regulator differential | f=1+pT, φ(T)=T^p | x=p dT/(1+pT), y=p⁻¹log((1+pT^p)/(1+pT)^p), dy=(φ/p)x−x. Correct second differential=0; opposite convention has constant coefficient 2p. | New sign Check valid. |
| §3.3 small prime | p=2, μ=[ε]−1 | With x=[ε^(1/2)]−1 and ξ=x+2, μ=xξ≡ξ²=0 mod 2 in A_cris. Thus t/2∈F¹A_cris, φ(t/2)=2(t/2), and t/2∉ℤ₂t. | New qualification of the integral lattice is necessary and correct. |
| §§3.3,4.1 connected constants | Two discs | C²/C has dimension 1 and d(0,1)=0; C²/C²=0. H⁰_syn is two copies of the fixed lattice, not one. | Previous F02 repaired throughout. |
| §§3.4–4.2 diagrams | Dagger/open disc, annulus; p²-torsion error | HK¹ of disc=0, H¹_proét=O/C; annular slope-one residue term=ℚ_p. A p²-killed error tensor ℚ_p=0. | Rational exactness does not assert integral exactness. |
| §4.1 principal units | p and 1+p² | abs(p−1)=1; abs((1+p²)−1)<1. Second constant's logarithm has class 0 modulo C. | Correct subgroup denominator. |
| §4.2 product extension | Two or countably many annuli | Constants C² or ∏C; class of (0,1)=0 modulo H⁰_dR, d=0, exponential class=0. HK¹ is product of slope-one lines. | Product formulation agrees with tower use. |
| §4.3 filtrations | Half-plane; genus-g Mumford curve; Tate q=ϖ²,e=2 | Half-plane graph H¹ and component H¹ both 0. Mumford graded dimensions (g,0,g). Raw monodromy 2, normalized monodromy 2/2=1. | Correct graded terms and normalization. |
| §4.4 special fibre/WD | Φ=diag(1,q), Ne₁=e₀, q=2,3; rational contracted component | NΦe₁=qe₀=qΦNe₁; ΦNΦ⁻¹e₁=q⁻¹e₀, coefficients 1/2 and 1/3. Contracted genus-zero component H¹=0. | Negative-degree semidirect convention agrees across layers. |
| §4.6 ℓ/HK similarity | Elliptic y²+y=x³ over 𝔽₂; graph weight pieces | #E(𝔽₂)=3, trace=0, polynomial X²+2; after twist (1), X²+1/2 on both theories. Graph pieces have common rational matrices. | Equality of characteristic polynomials has the required twist; endomorphism extension remains declared. |
| §§4.7–4.8 proper/Jacobian | Genus 0; ordinary/supersingular elliptic; Tate curve | Genus 0 terms=0. Elliptic slopes (0,1) or (1/2,1/2), both BC Dimension (1,2). Tate abs(j)=abs(q)⁻¹>1. At p=5, good E₀ discriminant=64 is a unit. | Good-reduction hypothesis and generic-group warning sound. |
| §4.8 completion of universal cover | O_C, O_C/p², O_C/p³ | p^m≠0 in O_C; reduction kernels have square/cube zero at finite stages. Constant étale height-two extension has Dimension (0,2), good elliptic extension (1,2). | Correct domain extension by inverse limit; R04 only locator. |
| §4.9 dual Dieudonné/integration | μ_p∞; elliptic period sequence | Covariant module slope 0 becomes −1 after normalization used for the φ=1 expression, giving BC Dimension (1,1). Using the contravariant slope 1 with the F=p condition instead gives ℚ_p, of BC Dimension (0,1). Elliptic kernel dimension 2, quotient dimension 1 over C. | Dual/twist are essential; lifted logarithm pairing is not evaluation on arbitrary branches. |
| §5.1 semistable Stein models | Chain model of A¹; affine special fibre; product of nodes | Proper components H⁰=k, naive affine component H⁰=k[T]. Adjacent chart xy=ϖ; product xy=ϖ=zw has two equations, not the asserted single semistable chart. | Stated properness and chart restrictions retained. |
| §5.2 HK | Chain A¹; N=0; rank-two nilpotent | HK⁰=F, HK¹=0; N=0 gives exponential 1. For Ne₁=e₀, forward transport adds log(w)e₀, inverse evaluation subtracts it. | Normalization specialization agrees with §1.4 apart from R01. |
| §§5.3–5.5 general Stein diagram | r=0 point; p=2,r=2; A¹,r=1 | Point fixed constants ℚ_p. Modified denominator p^a a!=2²·2!=8, not 4. A¹ quotient O/C maps T to dT. | All weights and primes retained; bound over extensions uses Nr+c_p, not unbounded A(e,p,r). |
| §§6.1–6.3 half-space model | d=1,q=2; d=2,q=2 | Tree valence 3; projective plane has 7 rational point centres. dlog((z−a)/(z−b)) has residues +1,−1. | Existing d=1 geometry imported; general d model owned here. |
| §6.4 HK as dual Steinberg | φ^f=q^r, q=2,3; r=0 | Monodromy relation forces q^rN=q^(r+1)N, hence N=0; fixed degree-zero field F^(σ=1)=ℚ_p. | Ordinary tensor over finite-dimensional finite-extension factors is legitimate here. |
| §6.5 p-adic pro-étale | r=0,r=d+1 | Degree zero ℚ_p. Above d, Steinberg term=0 and Ω^d/ker(Ω^d→0)=0. | Out-of-range convention and exact sequence agree. |
| §§6.6–6.9 integral comparisons | Three logarithmic forms; p=2; r=0 and r>d | (1,−1,0)+(0,1,−1)−(1,0,−1)=0, coefficients (1,1,−1) remain nonzero mod 2. Integral étale degree zero ℤ_p, above d zero; twist −1+1=0. | Measure relations preserved; not a free list of forms. |
| §6.10 Dat complex | d=1; d=2,r=1; nilpotence two | H¹_c=St, H²_c=Λ(−1), geometric Frobenius q, shifts [−1],[−2]. H³_c in dimension two=π_{ {1} }(−1). N²=0 gives exp(tN)=1+tN. | Coefficient/factorial and strongly banal splitting hypotheses retained. |
| §7.1 components | Height-zero full level m=1,q=3; diagonal scalar | Geometric components q−1=2. Scalar pair (3I₂,3) gives 81 under printed infinite formula, versus 1 under required action. | R02. |
| Layer 7 level dictionary | q=2, first supplier level | Deck size (q²−1)q²=12; dividing by subgroup of size q²=4 gives 3, the odd level's deck size. | Powers of ϖ_D and ϖ correctly distinguished. |
| §7.2 triangulations/orbits | xy=ϖ²; level zero | Resolution adds one valence-two genus-zero vertex, length 2=1+1. At level zero type(v)+i mod 2 gives two G-orbits; D-uniformizer interchanges them. | R03; finite-orbit Check otherwise correct. |
| §7.3 levelwise diagram | Quotient/full level zero | Constants C² versus C^ℤ. (0,1) has exponential class 0; a nonlocallyconstant function on a component has nonzero derivative. | Locally constant qualification and proper-component boundedness used correctly. |
| §§7.4–7.5 multiplicities | Slope 1/2 block; twist to slope 3/2; nontrivial central quotient character | φ²=pσ² versus p³σ². Rank-two X¹ has Dimension (1,2) in first case and 0 in second. A central character χ(ϖ)≠1 has invariant quotient sector 0. | Slope and specified central quotient essential; action dictionary must satisfy R02. |
| §7.5 absolute irreducibility | φ²=p over ℚ_p | End=ℚ_p(√p), dimension 2, not ℚ_p; over ℚ_p(√p) the WD representation splits into two characters. | Negative control excludes mere coefficient-field irreducibility. |
| §§7.6–7.8 finite copresentation | Level zero arithmetic H⁰; zero sheaf; F≠ℚ_p | Over F, H⁰=𝔽_p; over unramified quadratic F₂, H⁰=𝔽_p². Zero sheaf gives zero presentations and cohomology. The F=ℚ_p exception is outside the nonadmissibility claim. | Arithmetic/geometric components distinguished; no good-field narrowing. |

### Seeded source verification

All 15 seeded targets were checked against the cached texts at the following passages. Page numbers here are those printed in the version extracted by the source service; line numbers identify it unambiguously. The manifest retains the preprint/publication information. Five settled uncertified originals are listed separately below.

| Seeded target | Text opened and result |
| --- | --- |
| 0.1 graphs with legs | CDN-CURVES §1.2.1, lines 715–780, pp.18–19: two cokernels, edge/leg distinction and finite connected components; package correctly avoids the compact-edge typo. |
| 1.4 uniformizer normalization | CDN-STEIN lines 316–335, p.7: complete discretely valued base with perfect residue field and the chosen embedding. CN-I lines 440–455 normalizes at p. CohomologyComparisons §4.5 supplies finite exponential transport; the algebraic extension was recomputed above. None supports detection by a noninjective comparison (R01). |
| 4.3 curve filtrations | CDN-CURVES Théorème 0.15, lines 403–425, pp.10–11; Remarque 8.2, lines 4310–4322, pp.103–104; Proposition 8.9, lines 4477–4481, p.108. Boundaryless and dagger hypotheses, graded graph/component terms and normalized N retained. |
| 4.4 special fibre and WD | CDN-CURVES §§8.2.1–8.2.5, Théorème 8.4 and Proposition 8.7, lines 4350–4468, pp.104–107. Contracted rational components, empty-node exceptional cases and nonconstant-map restriction retained; WD sign is corrected explicitly. |
| 4.6 similarity | CDN-CURVES Théorème 8.12 and proof, lines 4540–4561, pp.109–110. Weight filtration, graph pieces and Jacobian endomorphism comparison checked; the stronger endomorphism input is an explicit gap, not silently attributed to Frobenius alone. |
| 4.8 universal cover | CDN-CURVES §7.1.5, lines 4015–4059, pp.96–97. Definition, logarithmic sequence and Théorème 7.9 support the mathematical target. R04 fixes the line locator. Remarque 7.10 suggests the good-reduction route; it does not itself prove the full extension supplied here. |
| 4.9 integration | CDN-CURVES §7.2.1 and Théorème 7.12, lines 4093–4149, pp.98–100. Finite K/ℚ_p, C=ℂ_p, lifted points, integration pairing and duality restrictions retained. |
| 5.1 Stein semistable weak formal schemes | CDN-STEIN §2, lines 682–695, p.14: semistable monomial charts, proper smooth components and the Stein generic-fibre condition. These are stronger than an arbitrary product of nodes. |
| 6.4 HK/dual Steinberg | CDN-STEIN Lemma 5.11, lines 2104–2155, pp.42–43. Finite-dimensional stages, topology and scalar Frobenius checked; finite F/ℚ_p permits the tensor/product interchange used here. |
| 6.5 pro-étale cohomology | CDN-STEIN Theorem 5.13, lines 2156–2179, p.43: exact sequence, closed immersions and differential quotient, including r=0 and above dimension. |
| 6.10 Dat complex | DAT06 Theorem 3.1.1, lines 1325–1328, p.28; (4.1.4), lines 1954–1969, p.41; Lemma 4.2.1, lines 1997–2008, p.42; splitting at lines 2042–2050, p.43. Source dimension is target d+1; factorial invertibility and strongly banal hypotheses checked. |
| 7.1 components | STR08 Theorems 4.3–4.4, lines 337–390, pp.11–12, including inverse norm and inverse Lubin–Tate character. CDN20 lines 101–107, p.3, require convention transport: R02. |
| 7.2 semistable models | CDN20 Proposition A.1, lines 2095–2122, p.53, and CDN23 Proposition 2.7, lines 1173–1210, pp.31–32. Equivariance and finite-orbit assertions supported; node equality belongs to the stable “+” model: R03. |
| 7.3 fundamental diagram | CDN20 Proposition 2.12(i), lines 914–927, p.23; Remark A.2, lines 2123–2133, pp.53–54. General F and bounded vectors checked. Package correctly supplies proper special-fibre components and locally constant denominators. |
| 7.5 multiplicity diagram | CDN20 Theorem 0.8, lines 246–262, p.7; §2.1, especially lines 644 and 654, p.17. Slope 1/2, general F, period term and multiplicity hypotheses checked; package explicitly retains the slope restriction. |

The sole Lean headline additionally matches CDN-STEIN §5.2.1, lines 1918–1929, p.38, and GK14 Corollary 4.3, lines 1300–1319, pp.28–29: type A has no exceptional factor; the mod-p statement uses a coefficient field of characteristic p. Corollary 4.4 at line 1328 supports the adjacent API. The characteristic-zero theorem is recorded in CDN-STEIN Proposition 5.1 with its Casselman attribution; that nested original reference was not independently read.

The DAT06 continuity error listed below has a direct negative control: a nonprincipal-ultrafilter limit from the profinite product ∏ℕ 𝔽_ℓ to 𝔽_ℓ is an abstract additive homomorphism. Its kernel contains no basic open subgroup, so the homomorphism is not continuous. This refutes the blanket argument, not the stated geometric theorem.

### Lean, headlines and padding

The original Suggested.lean elaborated from the pinned content environment with the prescribed `lake env lean` invocation: exit 0, exactly one warning, “declaration uses 'sorry'”, at line 124. It has one `import Mathlib`, no TauCeti imports needing a build, no `set_option`, no admitted data and no admitted examples. No build or pin was changed.

I elaborated a scratch copy containing `#check @name` for all eight declarations. All types were compared with the README; no binder disappeared and no correction was needed. The declarations are flagSubspace, parabolic, parabolic_mono, translation, steinbergRelations, steinbergRelations_le_comap, generalizedSteinberg, and generalizedSteinberg_isIrreducible, all in this roadmap's namespace. The final theorem retains primality, the normed field and normed ℚ_p-algebra structure on K, finite dimension over ℚ_p, Field A, and the characteristic-0-or-p hypothesis. The relation invariance proofs are actual proofs used to construct the quotient, not admitted API filler.

The one-tactic probe covered every admitted theorem: there is exactly one. Replacing its `sorry` by `first | simp | rfl | infer_instance` failed to prove irreducibility. The pinned irreducibility equivalence only translates to simplicity of the associated module; it does not establish it. The nearby finite-field Tau Ceti theorem has the wrong field/group and cannot close it by one `exact`. Thus no padding finding. The five small definitions and two supporting proofs construct the native quotient representation needed by that theorem; they are not substitutes for missing analytic carriers.

| README headline family | Acceptance-test treatment |
| --- | --- |
| Generalized Steinberg irreducibility, §0.4(a) | Stated natively as generalizedSteinberg_isIrreducible. |
| Kummer symbols and fundamental curve diagrams, §§2.4,3.5,4.1,4.2,4.7 | Named in module docstring; missing rigid analytic curves, their sites/cohomology, HK and crystalline/semistable period rings. |
| Filtrations and WD similarity, §§2.5,3.2,4.3,4.6 | Named; the same analytic/HK carriers are missing. |
| Jacobian period isomorphism and integration, §§4.8–4.9 | Named; missing analytic Jacobian/universal-cover and period carriers. |
| Equivariant Stein weak-formal comparison, §5.5 | Named; missing weak formal schemes, dagger spaces and syntomic cohomology. |
| Half-space cohomology, integral étale theorem and Dat complex, §§6.2,6.4,6.5,6.9–6.10 | Named; Ω^d as a rigid space and its cohomology are missing. |
| Tower components, models, multiplicities, fundamental diagram, finite copresentation and nonadmissibility, §§7.1–7.8 | Named; tower spaces, cohomology and local correspondences are missing. |

All backticked identifiers attributed to this roadmap resolve to the eight declarations, or are mathematical notation rather than claimed Lean declarations. The resolver's `Semistable.aOmega` lead resolves to AInfCohomology §AI.6.2, not a declaration this package claims to define.

### Pinned-library audit by object

I opened the following native definitions and near matches at the pin, rather than relying on name similarity:

| Pinned file and line | Object and scope checked |
| --- | --- |
| `Mathlib/LinearAlgebra/Basis/Flag.lean:40` | Basis.flag is the span of earlier basis vectors, indexed by Fin(n+1). The small nat-indexed saturated coordinate adapter here is used to define parabolics, not a second flag theory. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:121` | Matrix.GeneralLinearGroup.toLin supplies the actual linear action. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:515` | Stabilizer consists of elements fixing the acted-on object; it does not add a topological condition. |
| `Mathlib/Algebra/Module/Submodule/Pointwise.lean:186` | Submodule action is image under the associated linear map. |
| `Mathlib/GroupTheory/Coset/Basic.lean:424` | quotientMapOfLE maps between actual subgroup quotients in the required direction. |
| `Mathlib/Topology/LocallyConstant/Algebra.lean:327` | comapₗ is continuous pullback, linear in the function. |
| `Mathlib/Topology/ContinuousMap/Defs.lean:32` | ContinuousMap bundles a function and continuity; compactness and Hausdorffness are not fields of the carrier. |
| `Mathlib/RepresentationTheory/Basic.lean:329` | Representation.quotient requires invariance of its relation submodule. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | IsIrreducible means a simple order of subrepresentations; no smoothness or admissibility is built in. Line 32 gives an equivalence with module simplicity, not the Steinberg theorem. |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59`; `Mathlib/LinearAlgebra/Quotient/Basic.lean:146` | Native bundled modules and quotient map, including its surjectivity; neither supplies local representation theory. |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`, `:65`; `Mathlib/Algebra/Homology/HomotopyCategory/Shift.lean:44` | Cone is the cofiber with A^(n+1)⊕B^n; shift uses n+m and the sign (−1)^m. These confirm the repaired syntomic degree/sign. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | Module plus semilinear Frobenius equivalence; no N, topology or finite-dimensionality in the class itself. |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` | Adic completion defining BDeRhamPlus, not B_cris or B_st. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76` | Scheme cohomology; not an adic-space carrier. |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean:97`; `TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean:101` | Finite field F, complex finite-dimensional GL₂(F) representation and simple_GL2Steinberg. This is a finite-group near match, not the locally constant representation of GL_{d+1}(K) for K/ℚ_p finite. |
| `TauCeti/Algebra/Quaternion/Steinberg.lean` | Quaternion symbol relation; no local Steinberg representation. |

Object searches across both pins and the supplied near-match results found no analytic/HK/tower carrier that makes an omitted headline statable. In particular, Tau Ceti searches for Hyodo–Kato, pro-étale and crystalline-period objects returned no matching implementation. The README's local-generalized-Steinberg absence claim is understood in its stated p-adic-group scope; there is the finite-field Steinberg near match just documented. No theorem was found duplicating the admitted local irreducibility theorem.

### Ownership, cross-roadmap resolution and supply

I used the roadmap search/show tools at the available heads, the main checkout and the board-package index. The supplied overlap report lists no dropped cited ids, revision-only ids, conflicting changes to this roadmap, or unmapped ids dropped here. The fresh overlap query cannot identify this board-only package as a main/open-head roadmap; that is a limitation of that query, not evidence replacing the supplied report.

The nearest open owners were inspected: CstConjectureForDaggerVarieties (#1759), ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (#1757), PadicHodgeTheory (#1062), CohomologyComparisons (#1064), and CohomologyComparisonsPartII (#1364). The first has the countable-residue-field, model-free dagger result; this package states its broader-C curve theorem and model-equivariant Stein variant and their agreement. The Scholze roadmap consumes the tower components and owns the later functor, not a second component construction. Its right/left action dictionary is downstream and cannot repair R02 by an upward dependency. Proper-period and Fontaine–Messing inputs are explicitly imported. No shared fully qualified Lean declaration was found.

The following is the resolved supplier ledger. Locations are `TauCetiRoadmap/<name>/README.md` unless marked as a board package. The first relevant heading or definition line is given to make resolution reproducible; ranges identify the actual cited targets, not an inference from titles alone.

| Supplier and available copy | Resolved contracts (source-file lines) |
| --- | --- |
| AdicEtaleGeometry, main | A1 analytic sites (1703 and 1758). |
| AdicSpacesPartIII, main | F0; R3.4 quasi-Stein (10053); R3.7 proper GAGA (11218). |
| AdicSpacesPartIV, main | F1.5–F1.9, F1.11 (3766,4090,4238,4515,4662,5594). |
| EnhancedDerivedSheaves, main | E2 derived limits (2031), Milnor sequence within its derived-limit inputs. |
| StableReduction, main | Layers 1,2,7 (372,405,621). |
| JacobianChallenge, main | Layer D (218). |
| ReductiveGroupsPartII, main | RG2.2 (2831). |
| ClassicalAdicEtaleCohomology, #875 | 1.3–1.4 (354,449),4.1 (1917),4.6–4.7 (2528,2617), Layer 8 (3983),9.1 (4557),9.6–9.7 (5117,5213). |
| CrystallineCohomology, #857 | CR.4.7 (6510; arbitrary algebraically closed residue-field classification at 6621),5.1 (8466),6.1 (10029),6.5 (11098). |
| AInfCohomology, #1044 | AI.1.2 (1045),3.1–3.2 (1898,2108),6.1–6.3 (2658,2824,2901); Semistable.aOmega at 2860. |
| PrismaticCohomologyPartIII, #1070 | 6.3 (213),6.25 (536), including integral rather than rational-only comparison. |
| LocallyAnalyticDistributions, #854 | 0.0–0.2 (891–1125),0.CR.6.6 (1139), finite-dimensional inverse-limit pieces at 1147. |
| PadicPeriodRings, #940 | 4.1 (417),4.3 (470); broader-C extension declared separately. |
| VectorBundlesAndIsocrystals, #1205 | Layer 5 Dimension and standard BC spaces (1341,1349), general C (1357), semistable example (1625). |
| PadicDifferentialEquationsAndRigidCohomology, #1002 | RD.4.10–4.11 (7286,7324),4.18 (7507),4.29 (7772),4.34 (7872),4.38 (7978),7.7 (13968). Last target provides Frobenius characteristic polynomials, not the declared all-endomorphism extension. |
| CohomologyComparisons, #1064 | 4.5 (800: finite exponential and normalized N),4.9a (887),4.11–4.12 (915,925). |
| CstConjectureForDaggerVarieties, #1759 | 1.5 (439); scope distinguishes its C and model-free hypotheses. |
| CohomologyComparisonsPartII, #1364 | 4.1–4.5 (500,531,551,570,589); formal/weak-formal transfer remains the explicit gap. |
| EndoscopicTransferAndUnitaryTraceComparison, #999 | 12.2–12.8 (4569–4723),12.11–12.14 (4787–4864),12.19–12.21 (4962,4980,4997). Targets exist; R02 is a convention mismatch, not a missing section. |
| HilbertModularVarietiesAndShimuraCurves, #1005 | R18.5.1–R18.5.3 (1769,1793,1817). |
| TropicalAndBerkovichArithmetic, #1494 | 2.11 (1237),2.13–2.17 (1265,1279,1291,1316,1369). R03 overstates what its node criterion gives. |
| AbelianSchemesAndArithmeticModuli, #849 | A4.2 (1868), A4.CR.7.2 (2143), Grothendieck–Messing input (2241). |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, #879 | R07.2.20 (3698),2.25 (4057),2.26 (4124),2.28 (4325). Nilp-domain restriction explicitly handled by §4.8. |
| SmoothRepresentationsOfLocalGroups, #1688 | SR.0 (581),SR.0d (1667),SR.2 (1908),SR.3 steinberg (3002),SR.5.2 segment-representations (4446). |
| PadicHodgeTheory, #1062 | 5.3–5.4 (1016,1044),8.1 (1378). |
| GL2AutomorphicRepresentationsAndTransfer, #931 | R16.3.1–R16.3.3 (951,961,971). |
| PadicLocalLanglandsForGL2Qp, #1312 | 6.9 (2311), including the general-local-field JL interface consumed here. |
| ModpRepresentationsOfGL2OverLocalFields, board package | `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`:0.3–0.5 (401,438,457),0.7 (510),2.4 (845),2.6 (898). Finite presentation is the smooth-category notion, not finite presentation over the abstract group algebra. |

The cited downstream sections also resolve: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §§0.2,5.4,6.2 (240,754,799 at #1757) and `packages/PadicLocalLanglandsForGL2QpPartII/README.md` §§4.1,4.9 (564,710). They are consumers, not Needs edges. The three supplied resolver leads therefore do not establish supplier drift.

The three gaps occur with matching slugs and owners in `design/plan.json` and README supplier contracts: `formal-syntomic-period-comparison`, `period-rings-general-C`, and `endomorphism-characteristic-polynomials`. They are precise extensions respectively from log schemes to formal/weak-formal semistable bases with uniform bounds, from discretely based period rings to the stated general C, and from Frobenius to every abelian-variety endomorphism. I found no earlier owner already supplying those exact extensions. None is unowned or an excuse to omit a local prerequisite. This verdict is not acceptance, so they are not recorded as conditional acceptance in review.json.

The prescribed dependency command completed successfully:

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No prohibited roadmap is used as a supplier. R01–R03 are assertion/convention defects that a roadmap-level graph check cannot detect.

### Shape and principles

The required summary, ownership, conventions, exact supplier contracts, reading guide, eight layers, examples, dependencies, downstream section and references are present. Definitions retain APIs and at least three Checks; §1.4's new definition has four, two of which need R01's correction. Every numbered target has a Needs line. Source and supplier locators are attached to the claims; R04 is the identified misplaced locator. The organization is mathematical: graph/period inputs feed the curve branch; semistable higher-dimensional comparison feeds half-spaces; both feed tower multiplicities. No source-following program statement or chapter-named layer remains. I compared the shape with main-branch JacobianChallenge and StableReduction.

No re-planning of an existing roadmap, route-specific restriction to good primes, computational algorithm, copied source passage, sorry'd data, set_option, process marker, pull-request number, HTML anchor or machine path was found in the authored roadmap/Lean text. The p=2 integral statements and F≠ℚ_p nonadmissibility theorem keep their genuine hypotheses. All actions taken were read-only on authored files and suppliers; only review artifacts and scratch work were written.

## Not verifiable

- SS91, §§3–4: settled uncertified primary text. CDN-STEIN's formulation was read; that does not certify the original pages.
- IS01, Theorem 4.5: settled uncertified. Its regulator use was checked through the readable CDN-STEIN account.
- DS01, Theorems 5.7 and 7.7: settled uncertified. Related readable Frobenius/cohomology statements do not certify these original proofs.
- NAK84, Theorem 4: settled uncertified. Its use was checked through CDN23.
- KM74, Theorem 2: settled uncertified. The stronger endomorphism result remains a declared supplier contract.

These five texts were not requested again. All other cached texts needed for this pass were readable; no new source fetch or manifest change was required. The source behind CDN-STEIN's nested Tsuji reference was not independently opened: the normalization identity was verified algebraically and against the named supplier, without claiming to certify Tsuji's proof. The extracted duplicated degree in CDN-CURVES Proposition 4.7 was not visually checked against a PDF and is not asserted as an erratum. Open-head ownership was checked through service searches and closest-head inspections; no absence conclusion relied solely on a missing local checkout.

## Source issues

- **Misprint** in CDN-CURVES at §1.2.1, printed p.18, line 725: the source says the compact-support differential targets only compact edges; it should target all edges including legs, as the following cokernel does; affects nothing.
- **Error** in CDN-CURVES at §8.2.5, printed p.107, lines 4432–4437: the source says positive degree scales the additive coordinate while requiring Ng=p^deg gN; it should use negative-degree scaling for the additive action exp(λN); affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, printed p.38, line 1936: the source says the Steinberg dual is the inverse limit of all flag-function duals; it should use the annihilator of relations, equivalently duals of finite-stage quotient images; affects a stated result.
- **Misprint** in CDN-DUKE at proof of Theorem 2.9 and Lemma 2.12, printed pp.9–10, lines 376,415–423: the source says ψ is ξ^iφ⁻¹ but later uses it as 1−ξ^iφ⁻¹; it should distinguish these operators and use the latter in the bijectivity argument; affects the proof.
- **Gap** in CDN20 at Remark A.2, printed pp.53–54, lines 2123–2133: the source says connected semistable Stein curves have only constant bounded functions; it should require the proper special-fibre components used in its proof; affects a stated result.
- **Misprint** in CDN-CURVES at §4.2.1, printed p.51, lines 2093–2109: the source says its positive-log regulator is a cocycle for the displayed differential; it should negate that logarithmic component, or consistently reverse the mapping-fibre sign convention; affects a stated result.
- **Error** in CDN-CURVES at §4.2.1 and proof of Proposition 6.26, printed pp.51,87, lines 2096,3676: the source says the weight-one integral fixed lattice is ℤ_p t for every p; it should qualify this by odd p, since at p=2 the lattice contains t/2; affects a stated result.
- **Misprint** in CDN-CURVES at Remark 7.8, printed p.97, line 4038: the source says principal units are divided by C×; it should divide by their constant subgroup 1+m_C; affects a stated result.
- **Error** in DAT06 at proof of Lemma 4.2.1, printed p.43, line 2033: the source says every abstract homomorphism between profinite groups is continuous; it should justify continuity of the particular inertia action instead; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "866fd9511b0bdace746bc4b9b703b74277d41466", "job": "REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~5", "model": "gpt-6-astra", "worker": "chris-4"} -->
