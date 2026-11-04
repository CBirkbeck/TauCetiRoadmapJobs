<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1087#issuecomment-6398362716 -->
Review (codex) of dc21b28

Verdict: needs_changes

1. **F01** (P1) An arbitrary tame congruence subgroup can have more than p+1 cosets

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:642`, with consequences at lines 646–654, 667, 687, 740, 805–833 and 995: “The left cosets MΓ̄ in Γ̄ diag(p,1) Γ̄ have p+1 integral representatives”.

   **Claim.** Prime-to-p congruence level alone makes this particular rational double coset have p+1 left cosets, bijective with the projective lines over 𝔽_p. Consequently its primitive neighbor count is 1+(Δ/p).

   **Witness.** At p=3, Γ=Γ(7)∩red₅⁻¹Stab⟨(1,1)⟩ has 20 cosets: the mod-3 index is 24/6=4 and mod-5 index 20/4=5. The zero form has 20 neighbors; x² has 5.

   **Exact repair.** Preserve arbitrary tame level. Distinguish the literal rational double coset from the local unramified p-correspondence with identity tame component. For Γ containing Γ(N), p∤N, put H=red_N(Γ), g=diag(p,1) and e=[H:H∩gHg⁻¹]. For the literal ΓgΓ, state the degree e(p+1), the projective integrality map with fibers of size e, and neighbor counts e(1+(Δ/p)) for primitive forms and e(p+1) for zero reduction. Keep the coefficient and tame transports of each occurrence; do not replace these by an unweighted set or divide by e on torsion modules.

   Define the p+1-term operator used in the spherical Hecke formulas through the actual local p-correspondence on the all-component cusp family, retaining its source/target tame markings. Prove that comparison, and identify it with the literal ΓgΓ sum only when the tame compatibility gives e=1. Carry this distinction through §§5.2–5.3, 5.6–5.7, 6.1–6.3, 7.6–7.7 and the formal-sum controls in §9.4. Adding only “level prime to p” or choosing different representatives does not repair the count. Cite the existing full-level and Γ₀/Γ₁ decomposition results listed below rather than rebuilding those cases.

   Tested repair: the displayed level-35 group has e=5, so the corrected literal counts are 20,5,0 for Q=0,x²,x²+y² at p=3. The local unramified correspondence has four p-branches with tame transports, giving 4,1,0. At full level and Γ(5), e=1, so the existing 4,1,0 Checks and the oriented Γ(5) reciprocity example survive. Add the level-35 instance as the negative control. This finding is independent of the repaired marked-Klingen/full-spherical distinction.

## Verified sound

Reviewed on 2026-10-25. One finding, one blocking finding. The package remains a repairable genus-two Part II extension of the genus-one parent. No package input, plan, manifest entry, library, supplier or merge-order file was changed. The outputs are this report and `packages/AlgebraicModularFormsAndSerreWeightsPartII/review.json`.

### Previous findings and changed passages

All four findings in the preceding review were checked individually before the new pass. None was marked not actionable in the repair report, so no settled finding is re-raised.

| Previous finding | Status | Repaired passage and evidence |
|---|---|---|
| F01: marked Klingen action identified with full Z₂ | Repaired | README:1303: “Its indexing retains L∩H_m=0 throughout.” README:1316: “giving U_(p,2)^ord(1)=p⁴/p³=p”. P20 line 2622, 2754–2774 and 2884–2907 support the marked correspondence and normalization. Its constants are 2,3,5 at p=2,3,5; the four/six full spherical sums in the original controls must now be understood with R01's tame distinction. |
| F02: Lang proof input unowned | Repaired | README:111: “§RG2.3.7 supplies the ordinary Frobenius Lang theorem”; README:1150 and 1212 name that supplier in the target and layer dependencies. ReductiveGroupsPartII §RG2.3.7, README:5203–5205, states the ordinary smooth geometrically connected finite-type theorem. The conjugacy calculation below checks both directions. |
| F03: wrong name for identity block | Repaired | README:1133: “Koblitz’s auxiliary bijective p-linear block B:H¹(O)→H⁰(Ω¹) is normalized to I, whereas the Hasse–Witt block A of the universal deformation has A(0)=0”. K75 line 1673–1700 and Y16 line 2061–2069 distinguish exactly these blocks. |
| F04: irreducibility locator off by a page | Repaired | README:1098: “proof of Theorem 8.11, internal p. 62 (862); CG20 line 2458–2460”. Those lines contain the finite-group irreducibility assertion; CG20 line 2469 begins the next page. |

The changed §5.3 bridge, §8.4 construction and Checks, §9.4 definition/API/Checks/Needs, downstream contract, Lean module docstring and P20 manifest locator were reread. Searches across the package for Lang, frame changes, identity/Hasse–Witt blocks, Z₂, Klingen, trace and the old locator found no recurrence of the four original defects. R01 arises from testing the claimed general tame level, beyond the full-level and principal-congruence cases in the previous computed table.

### Principles, shape and coverage

All 48 numbered target subsections, their APIs, Checks, proof routes, 48 Needs lines, nine Examples and nine Dependencies blocks were read. For unchanged material I relied only on the preceding review's rows with computed values, including its coefficient, boundary, root, Hartogs, theta and oriented-reciprocity controls. The new table below recomputes the seeded targets, headline theorems, changed mathematics and every target affected by R01. A finite example tests a convention or exposes a counterexample; it is not offered as a proof of a universal geometric theorem.

The README has the requested summary, ownership, conventions, supplier contracts, build order, nine layers, consumers, worked examples and references. Its definition blocks retain APIs and at least three Checks. The main-branch shapes read were `TauCetiRoadmap/AlgebraicVectorBundles/README.md`, `TauCetiRoadmap/ModularForms/README.md` and `TauCetiRoadmap/SchemeAndStackFoundations/README.md`. The package uses mathematical targets rather than computational algorithms. No copied source passage, route-specific good-prime replacement, replanned parent, sorry'd data, `set_option`, surrogate geometric proposition or upward supplier was found. R01 prevents acceptance of the claimed generality.

The coefficient convention excludes the zero ring and equal-characteristic DVRs by requiring a complete DVR finite over ℤ_p; zero coefficient modules remain included. Negative determinant powers and half-integral Fourier matrices have explicit domains. Characteristic-p theta is kept separate from arbitrary coefficient thickenings. Canonical maps name their spaces and transports. The one Lean theorem is substantive and its simple adapter uses the pinned native representation.

### Seeded source verification

All eight lifetime source keys are certified and readable in the supplied legal cache. No author-flagged unverified locator was found; occurrences of “unverified” concern rejected surrogate lattices, not unread sources. All 15 seeded targets were opened at the stated theorem/section and page. The P20 locators use the recorded 2019 author version; Y16 uses arXiv v5. The source mistakes listed at the end were distinguished from the corrected package statements.

| Seeded target | Source text and locator actually read | Hypotheses/result verified |
|---|---|---|
| 2.2 Dimensions and supersingular geometry | P20 §6.4, pp.35–37, line 1530–1655; CG20 proofs of Theorems 8.10–8.11, internal pp.62–63, line 2443–2482 | Correct dimensions r+1; spherical geometric P¹ components, p²+1 superspecial points and E splitting O(−1)⊕O(p). No paramodular splitting is inferred. P20's dimension/index slip is corrected. |
| 2.3 Simple Hasse zeros at rank one | P20 Lemma 6.4.1, pp.35–36, line 1544–1601 | First-order determinant −Y; principal X=Z and paramodular X=0/Z=0 leave Y free. The package corrects the Frobenius sign for its alternating pairing and retains the normal/CM argument. |
| 2.4 Hasse expansion and multiplication | Y16 Proposition 3.11(2), p.22, line 1192–1217; CG20 Lemma 6.2, internal p.36, line 1442–1455 | Toric expansion 1 and away-from-p equivariance. The package's arbitrary dominant weights follow from its stated locally free/nonzerodivisor proof, without an extra positivity assumption. |
| 3.1 Secondary Hasse invariant on rank one | P20 §6.3.2, pp.30–31, line 1345–1367; boundary application p.36, line 1602–1608 | Reduced base, height four/dimension two, both ranks one; v and LF give weight p²−1 and a unit. Connected height-three boundary recipe preserves the Hodge determinant. |
| 3.5 Local models of the nonordinary surface | P20 proof of Lemma 6.4.2, pp.36–37, line 1615–1649 | Spherical quotient is a plane; the intermediate paramodular quotient is three-space, and the nonordinary union needs ab=0. The geometric chart comparison is a target here, not inferred just from ring substitution. |
| 4.2 Canonical powers modulo pⁿ | P20 proof of Theorem 11.2.1, p.70, line 3265–3269; CG20 Lemma 6.4, internal pp.36–37, line 1467–1479 | P20 uses the p^(n−1) Hasse lift; CG20 gives the exponent divisibility condition. The local binomial proof supplies independence, gluing and the stated ramified extension, for n,m≥1. |
| 4.3 Equivariant torsion weight shifts | CG20 Lemmas 6.2 and 6.4, internal pp.36–37, line 1442–1479 | Injection and away-from-p/tame-U equivariance; s divisible by p^(m−1). The sheaf-filtration argument explains the extension to all j≥k. At-p equivariance is separately bounded. |
| 5.4 Discriminant diagonal operator X₂ | CG20 Lemma 8.4 and Definition 8.5, internal p.59, line 2317–2353 | Primitive multiplier is the discriminant symbol; nonprimitive integral multiplier p. The package corrects the source's determinant/discriminant identification and retains odd p. |
| 5.6 Rational Hecke decomposition and residual V₂ | CG20 Lemmas 8.3–8.4, internal p.58, line 2273–2313; P20 §5.1.3, p.21, line 902–910 | Exponents and rational central normalization agree. CG20 asserts V₂ integrality without printing its residual formula; the package makes the finite integral natural construction its own target. Its arbitrary-level identification still depends on R01. |
| 7.2 Ordinary trace divisibility | P20 §14.9.2, p.104, line 4738–4765 | Differential bounds p^(d+4),p²,1 and trace ideals 1,p,p³ at r=2. The determinant twist gives p^(d+2r),p^r,1 at r≥2. Boundary and integral trace inputs are declared contracts. |
| 7.4 Hartogs across supersingular curves | P20 proof of Proposition 8.2.1, p.53, line 2433–2435; Lemma 14.9.2, p.103, line 4712–4718; CG20 proof of Lemma 8.8, internal p.60 | Codimension two gives H⁰ isomorphism/H¹ injection. The package states the extra Milnor and filtered-colimit routes for formal and K/O coefficients and does not claim H² injection. |
| 8.2 Scalar and vector theta operators | Y16 Propositions 3.9, 3.11–3.12, Remark 3.13 and Fourier calculation, pp.21–24, line 1166–1330; CG20 Proposition 8.9, internal p.61, line 2402–2422 | Characteristic p, scalar determinant coefficient, vector contraction without an extra determinant; endpoint d=p−2 uses Remark 3.13. Package excludes the singular normalization at d=p−1. |
| 8.5 Negative-weight section vanishing | CG20 proofs of Theorems 8.10–8.11, internal pp.62–63, line 2438–2482; P20 Remark 6.4.1, p.37, line 1652–1655 | Hodge splitting gives maximum degree pa−b. The package states its own repeated-Cartier-division/Krull route, using its global root and component propagation contract; the source's H¹/Serre-duality route is not silently imported. |
| 8.6 Scalar theta injectivity in low weight | CG20 Theorem 8.10/proof, internal pp.61–62, line 2425–2446; Y16 Theorem 4.7(2), p.38, line 2055–2088 | Source's missing Hasse-weight exclusion is repaired. The package retains k≥2, k≤p+1, k≠p−1 and p∤k(2k−1), and separately handles k=p+1. |
| 9.4 Klingen ordinary coefficient operator | P20 §§10.1–10.4, pp.57–63, line 2616–2650, 2754–2774, 2800–2907; §13.3.1, p.89, line 4094–4103 | Marked disjointness, degree-p³/degree-p factorization, trace divisions p² and p, coefficient determinant division p^r, and degree-zero integrality agree. Continuous weights use the marked-frame character on units; no unrestricted Z₂ identification remains. |

### Computed adversarial table

For R01 let ℓ=⟨(1,1)⟩⊂𝔽₅², Γ=Γ(7)∩red₅⁻¹Stab(ℓ), and g=diag(3,1). This is a congruence subgroup of level dividing 35, prime to 3, contained in the neat principal subgroup Γ(7). The left-coset count is [Γ:Γ∩gΓg⁻¹]. Reduction modulo 3 gives a triangular subgroup of index 4; reduction modulo 5 intersects the stabilizers of ℓ and gℓ=⟨(3,1)⟩, giving index 5. The mod-7 identity condition adds no index. Surjectivity of reduction and the Chinese remainder theorem multiply the independent indices. Enumeration of the 24 and 120 determinant-one matrices independently reproduced these sizes.

| Statement | Instances tried | Computed values on both sides / negative model | Result | Change |
|---|---|---|---|---|
| Coefficient and weight conventions | ℤ₃; ϖ²=3; k[[t]] in characteristic 3; (j,k)=(1,2) | v_ϖ(3)=1,2; equal-characteristic 3=0 is excluded; j−k=−1 is excluded, not truncated to 0 | Correct domains | None |
| 1.1 Sheaf coefficients and cusp inclusion | M=0; O[t], D=(t), M=O/ϖ² | H⁰(E⊗0)=0; boundary quotient O is flat, so inclusion has kernel 0; constant 1 is outside tM[t] | Correct | None |
| 1.2 Action and discriminant | Q=x²+y²; diag(2,1),diag(1,−1) | Images 2x²+y²/2 and −x²−y²; Δ=−4 in both; only first preserves positive cone | Normalization fixed | None |
| 1.2 Native action dictionary | T=[[1,1],[0,1]], Q=x² | Normalized T·Q=x²; native T•Q=x²−2xy+y²; native (Tᵗ)⁻¹•Q=x² | Transpose-inverse necessary | None |
| 1.3–1.4 Expansions and saturation | Components X₁⊔X₂, section (0,1); constants ϖ and 1/ϖ | Joint expansions (0,1), first alone 0; coefficients ϖ∈ϖO and 1/ϖ∉O | All components and lattice needed | None |
| 2.1 Rank/boundary convention | Ordinary BT₁; rank-one semiabelian fiber; superspecial surface | Ranks 2,1,0; torus rank 1 plus elliptic p-rank 0 gives 1, never 0 | Boundary included correctly | None |
| 2.2 Dimensions and component geometry | r=0,1,2; p=3 | Dimensions 1,2,3; codimension 3−1=2; #P¹(𝔽₉)=10; Hodge degrees −1,3; determinant degree 2 | Matches corrected statement | None |
| 2.2 Restricted weight | Sym^(a−b)(O(−1)⊕O(p))⊗O(b(p−1)) | Maximum p(a−b)+b(p−1)=pa−b; p=5,(a,b)=(−1,−1) gives −4 | Exact maximum | None |
| 2.3 Frobenius pairing | Fe₂=−pe₃, Fe₃=e₂ | ⟨Fe₂,Fe₃⟩=p; unsigned alternative gives −p | Sign fixed | None |
| 2.3 Tangent Hasse divisor | k[ε]/ε², Y=ε or 0; X=Z, X=0, Z=0 | det[[−Y,0],[−Z,1]]=−ε or 0; all three constraints permit ε | Simple zero witnessed | None |
| 2.4 Primary Hasse and multiplication | Split torus; rank-one fiber; p=5 | Hasse determinants 1,0; h·1=h≠0 while Θh=0 at weight 4 | Section injection differs from fiber invertibility | None |
| 3.1 Secondary determinant | p=3; μ_p⊕I_(1,1)⊕ℤ/p and its connected part | Weight (3−1)(3+1)=8; h=0,h′ unit; height 4→3, Hodge rank stays 2 | Boundary recipe typed | None |
| 3.3–3.4 Extension factors | V_H*=W=t,Z=1; only one rank drops | ord A=(p+1)−(p−1)=2; dual orders (2,0) or (0,2); t⁻¹ has nonregular square t⁻² | Product detects both drops | None |
| 3.5 Local models | a=y=0,x=−bc; x=0,y=−ac | Both relations become 0; rings k[b,c] of dimension 2 and k[a,b,c] of dimension 3 | Extra ab=0 required | None |
| 3.5 Paramodular union | (a,b)=(1,0),(0,1),(1,1),(0,0) | Products 0,0,1,0; first two rank one, third excluded, last intersection | Both branches distinguished | None |
| 3.6 Extension/gluing | Branch sections a²,b²; incompatible 1,0 | Restrictions on intersection 0=0 versus 1≠0; glued section a²+b² | Correct | None |
| 3.7 Polarized root | p=3,5,2; local b₀=t; rescale polarization by 2 at p=5 | Root weights 4,12,3/2; last excluded; lengths 1,2 for t,t²; root factor 2²=−1, square factor 2⁴=1 | Polarization fixes sign | None |
| 3.8 Normalized isogeny | [p] on μ_(p∞), μ_(p∞)²; identity | Scalars p⁻¹p=1,p⁻²p²=1,1; raw reduced differentials 0,0,1 | Normalize before reduction | None |
| 4.2 Canonical powers | p=2,n=2; p=3,n=2; n=1 | 3²−1=8≡0 mod4; 4³−1=63≡0 mod9; exponent at n=1 is 1 | Small primes pass | None |
| 4.2 Ramification | ϖ²=3, m=2 | (1+ϖ)³−1=2ϖ³+ϖ⁴ has valuation 3≥2; p and ϖ have different valuations | Ramified claim valid | None |
| 4.3 Torsion shift/equivariance | p=3,m=2,r=1,s=3; lifts 1,4; deck order 3 | t=6, d unchanged; cubes 1,64 coincide mod9; pulled-back A fixed without 1/3 | Correct | None |
| 4.4 Two-open cover/descent | p=3; ordinary/rank-one/rank-zero; k[t²,t³]⊂k[t] | Both weights 8N; pairs (1,*),(0,1),(0,0); t absent downstairs but t^p present | Cover and power descent consistent | None |
| 5.1 Formal coefficient carrier | d=1,diag(3,1); K/O; zero module | x→3x,y→y, not 9x,3y; 3(1/3+O)=0; zero series module 0 | No field/algebra assumption on M | None |
| 5.2 Literal double-coset degree | Γ above, p=3 | #SL₂(𝔽₃)=24, #triangular=6; #Stab(ℓ)=20, #two-line stabilizer=4; degree 4·5=20 versus claimed 4 | False general-level count | R01 |
| 5.2 Integrality fibers | Same Γ; Q=0,x²,x²+y² | Projective roots 4,1,0; admissible cosets 20,5,0 | Map is five-to-one here | R01 |
| 5.2 Repaired distinction | Same Γ versus full level/Γ(5) | Tame multiplicities e=5,1; e(p+1)=20,4; genuinely local p-branches=4 in both | Repair preserves generality | R01 |
| 5.3 U,V | Primitive index coefficient 1 | UV returns 1; VU returns 0; constants U1=V1=1 | Correct independent of R01 | None |
| 5.3 Z and Z₂ constants | Same Γ, scalar constant 1; full-level control | Literal Z1=Z₂1=20 versus p+1=4; full level gives 4 | Formal-sum controls need scope | R01 |
| 5.3 Commutation | Q, a contributing M | UZ₂ and Z₂U both evaluate a(M⁻¹·p²Q) with the same ρ_d(M) | Survives larger coset set | Preserve identity |
| 5.4 X₂ and U₂ | p=3; x²+y²,3(x²+y²),x² | (−1,−4),(3,8),(0,−1); residues (2,2),(0,2),(0,2); determinant symbol at first Q would be +1 | All branches correct | None |
| 5.5 Characteristic-p relations | Multipliers −1,0,1; R=x²+9y² at p=3 | Cubes −1,0,1; X₂(pQ)=3=0 mod3; Δ(R)=−36≡0 while det R=9≠0 over ℚ | UX₂=0, X₂³=X₂, Z₂X₂=0 | None |
| 5.6 Rational coefficient exponents | p=3,(j,k)=(2,2),(3,3) | T coefficients (1,1,3),(1,3,27); at (3,3), T₂ coefficients (−1,3,1,27) for (1,X₂,Z₂,V₂); S at (2,2)=1/9 | Algebra correct; general operator identification inherits R01 | R01 scope |
| 5.6 Natural residual | K/O class 1/3+O; coefficient map ×a | 3 kills the class; division by 27 is undefined; a finite integral sum commutes termwise with ×a | Natural construction must precede tensoring | None beyond R01 |
| 5.7 Corrected Q₂ | p=3,(2,2),(3,3) | Coefficients (X₂,Z₂,V₂,1)=(1,1,3,3),(3,1,27,9); residues (1,1,0,0),(0,1,0,0) | Cancellation correct once operators identified | R01 scope |
| 6.1–6.2 Literal neighbor cardinality | Γ above, p=3, x² and 0 | Multiset cardinalities 5 and 20; asserted values 1+(0/3)=1 and 4 | Multiplicities cannot be dropped | R01 |
| 6.2 Full-level control | p=3, x²+y²,x²,xy,0; p=5,x²+y² | Counts 0,1,2,4 and 2; roots at p=5 are [2:1],[3:1] | Imported projective theorem correct | None |
| 6.3 Oriented reciprocity | Γ(5),p=3,M=[[3,5],[30,51]] | det M=3; M⁻¹·x²=3(17x−10y)²≡2x²; two forward steps ≡4x²; reverse recovers x² | Orientation is a separate issue from R01 | Preserve |
| 7.1 Correspondence finiteness | Ordinary p=3; superspecial fiber | Geometric points 1+4+1=6, generic degree 4·10=40; superspecial α_p² has a P¹-family | Rank-zero exclusion necessary | None |
| 7.2 Trace orders | (d,r)=(0,2),(1,3),(0,1) | Differential+trace orders (4,3,3),(7,4,3),(2,2,3) | r=1 fails mixed p³ bound | None |
| 7.3 Integral T | p=3,d=0,r=2 | Normalized orders yield 81/27=3,9·3/27=1,27/27=1 | Integral before reduction | None |
| 7.4 Finite Hartogs | Punctured plane/line | H⁰=k[x,y] versus k[t,t⁻¹]≠k[t]; class 1/(xy) nonzero in local H² | H⁰/H¹ range correct | None |
| 7.4 Formal/K/O passage | Equal H⁰ inverse systems; zero system; 1/ϖ+O | lim¹ terms equal, both 0 for zero system; torsion class arises from O/ϖ | Uses declared Milnor and colimit inputs | None |
| 7.5 Composite/correction | p=3,(2,2),(3,3) | C−Q₂=10,30; residues 1,0; first raw order 4 and second ≥1 at d=0,r=2 | Central term retained | None |
| 7.6 Expansion comparison | Local p-series versus literal Γ-series in R01 | At Q=0, Z₂ contributes 4 versus 20; at weight (2,2), X₂+Z₂ residues 1 versus 2 mod3 | “Every component transport” alone does not identify the sums | R01 |
| 7.7 Hasse equivariance | p=5, weight (3,3)→(7,7); k=2 | Local formulas give (U,Z₂) on both weights; k=2 has extra Z with constant 6≡1 | Weight bound correct; use repaired p-local operator | R01 scope |
| 8.1 Contraction | d=2; x²⊗y², y²⊗x²; highest-weight tensor | Values 4/12=1/3,1/3; three terms sum 12/12=1; determinant-square scales by 4 under diag(2,1) | Correct normalization | None |
| 8.2 Endpoints and coefficients | (p,d)=(5,3),(5,4); p=7,Q=x² | Denominators 24≡4,40≡0; vector y² coefficient 1/3=5 versus scalar det Q=0 | d=p−2 allowed, d=p−1 excluded | None |
| 8.2 Scalar theta/Hasse | p=7,Q=x²+y²; h expansion 1 | det Q=1 versus Δ=3; Θ(hF) and hΘF both det(Q)a(F,Q); Θh=0 | Correct | None |
| 8.3 Standard representation | p=3 upper U/lower L; p=2 in 𝔽₄ | Ux=x,Uy=x+y; ULx=2x+y,ULy=x+y; image size 6 versus ambient 60 | Nonabelian action and finite subgroup fixed | None |
| 8.3 Irreducibility range | d=0; p=2,d=1; p=3,d=2,3 | Dimensions 1,2,3,4; d=2 binomials 1,2,1 nonzero; cubic span{x³,y³} has dimension 2<4 and is invariant | Endpoint and wrong larger range separated | None |
| 8.3 Coefficient detection | x³y−xy³ at p=3 | Nonzero degree-4 polynomial has value 0 at all 9 𝔽₃-vectors | Degree-p+1 extension false | None |
| 8.4 Superspecial factors | p=7,k=2; p=11,(6,2); k=p | 6/9=3 mod7; j−3k=0 but j−3=3≠0 mod11; k(2k−1)=0 modp at k=p | Exceptional coefficient retained | None |
| 8.4 Auxiliary/Hasse blocks | Superspecial origin; invertible dual frame | B=I, A(0)=0; transformed zero block remains 0 | F03 repaired | None |
| 8.4 Allowed frames | U=[[1,1],[0,1]]; C=[[0,i],[i,0]], i²=−1 at p=3 | UUᵗ=[[2,1],[1,1]]≠I; C^(3)Cᵗ=I, det C=1 | Unitary condition discriminates | None |
| 8.4 Lang direction and converse | p=3, a⁸=−1; B_L=[[a,−a⁵],[a³,a⁷]] | det B_L=2a⁸=1; B_L^(3)=JB_L; J⁻¹(B_L A₀ B_L⁻¹)^(3)J=B_L A₀ B_L⁻¹ iff A₀^(3)=A₀ | Both directions checked | F02 repaired |
| 8.4 Connectedness control | Constant group C₂; trivial group | Lang images have size 1 in both; group sizes 2,1 respectively | Connectedness needed | None |
| 8.5 Negative weights and division | p=5,(−1,−1),(0,0); p=7; unit ideal | Degrees −4,0; H⁰(O(−4))=0, H⁰(O) contains 1; decreases 144 and 36; intersection of unit-ideal powers=R≠0 | Strict negativity and proper divisors needed | None |
| 8.6 Scalar low weights | p=5,k=2,3,4,5,6 | k(2k−1) residues 1,0,3,0,1; allowed {2,6}; k=4 has h≠0 in kernel; k=6 degree 24<26, residual weight 2 | Exact repaired range | None |
| 8.7 Vector injectivity | p=7,j=4,5; p=11,j=6; p=5 | Degrees 26,33<50; post-Hasse weights (−4,−8) give −36; p=5 interval empty | Route agrees with local nonvanishing | None |
| 9.1 Weight/action | d=2,r=1,diag(2,1); p=3 | Character 8, reversed exponents 2; differential factor 1/2; GL₂(𝔽₃) order 48 versus diagonal 4 | Full-frame convention fixed | None |
| 9.2 Saturation | f=1,1/3 at p=3 | Q=0 coefficient functions constantly 1,1/3 on 48 frames; second is nonintegral | Correct all-frame detection | None |
| 9.3 Integral comparison | x³y−xy³ at p=3; d=0 | Values 0 at all residue vectors, −24 at (1,3) over ℤ₃; d=0 character det^r | Finite-level injectivity not inferred | None |
| 9.4 Marked trace | p=2,3,5, weight zero | Allowed lines 2,3,5; branch degrees 8,27,125; totals 16,81,625; normalized traces 2,3,5 | F01 repaired | None |
| 9.4 Coefficient transport | p=3,d=1,r=1; continuous κ | Raw values 9x,3y; normalized 3x,y; κ(1)=1, κ(3) undefined | Determinant factor and unit domain fixed | None |
| 9.4 Torsion reduction | p=3, constant; zero module | Integral 3 reduces to 0; full local spherical sum 4 reduces to 1; zero maps to 0 | Marking distinction survives reduction | None; R01 scopes full sum |

### Pinned libraries and duplication audit

Pins in `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native definitions and relevant theorem hypotheses were opened, not inferred from names.

| Pinned file and line | Declaration read and scope |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63`, `:141` | `Matrix.det`, `Matrix.det_mul`, finite square matrices over a commutative ring. No inverse of 2 is supplied. |
| `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109` | `legendreSym`, integer input and prime parameter; rational discriminants require the denominator convention. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `Representation.IsIrreducible` has body `IsSimpleOrder (Subrepresentation ρ)`. Nonzero carrier is required; nontrivial action is not. The one-dimensional trivial representation is allowed. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225` | Entrywise `Matrix.SpecialLinearGroup.map` along a ring homomorphism, retaining the source group. |
| `Mathlib/Data/ZMod/Basic.lean:331` | `ZMod.castHom` requires the characteristic/divisibility data appearing in the adapter. |
| `Mathlib/RingTheory/Filtration.lean:425` | `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`: Noetherian local ring, finite module, proper ideal. |
| `TauCeti/RepresentationTheory/SymmetricPower.lean:47` | Real-body `Representation.symmetricPower` on native symmetric tensors; coefficient type in `Type`, commutative semiring and monoid. |
| `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:167` | `Module.Basis.symmetricPower`, indexed by unordered tuples; supplies the monomial interpretation. |
| `TauCeti/RepresentationTheory/ClassicalGroups/Restriction.lean:44`, `:49` | `TauCeti.stdSLRep`, with matrix multiplication on columns. |
| `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94`, `:146`, `:188`, `:194`, `:203` | Coefficient triple, discriminant, inverse-substitution action, action laws and discriminant invariance. The body does not restrict to positive forms; positivity is separately defined at line 209. |
| `TauCeti/RepresentationTheory/SU2/Irreducible.lean:164` | `TauCeti.SU2.isIrreducible_symPower` concerns complex SU(2), not finite SL₂ in characteristic p. |
| `TauCeti/NumberTheory/HeckeRing/GL2/Degree.lean:54` | `HeckeRing.GL2.degree_diagCoset_prime_pow`, full-level degree p^(k−1)(p+1) for k>0. |
| `TauCeti/NumberTheory/HeckeRing/GL2/Gamma1/CoprimeCosets.lean:325` | `HeckeRing.GL2.doubleCoset_natDiagGL_eq_iUnion_rightCosets_of_prime`, on Γ₁(N), with the required twist matrix and prime hypothesis. The distinctness statement at line 305 for arbitrary subgroups is not a covering theorem for those subgroups. |
| `TauCeti/NumberTheory/HeckeRing/GL2/Gamma0/Diagonal/PrimeCosets.lean:124` | `HeckeRing.GL2.doubleCoset_natDiagGL_Gamma0_eq_iUnion_rightCosets_of_prime`, Γ₀(N) with its twist. Neither pinned decomposition asserts §5.2's arbitrary-Γ claim. |

Object searches covered binary forms, determinant-normalized actions, Hecke cosets/degrees, symmetric powers/irreducibility, Hasse/BT₁ geometry, full Igusa frames, Klingen correspondences, theta, formal Hartogs and Lang. The same searches used `roadmaps grep` on main and indexed open heads and `rg` on board package/design files. No duplicate fully qualified `standardSL2` or `smallSymmetricPower_irreducible` declaration was found in other readable roadmaps. The generic bundle/expansion, BT₁, compactification and Lang objects have named earlier owners; the package's additions are the stated genus-two specialization and integral coefficient calculations.

The supplied board index was read first. All 19 indexed heads were opened: four package READMEs and fifteen design READMEs. HigherHidaAndColemanTheory's `I3/integral-amplitudes`, `X8` and supplier contract at design README:1814 consume an affine rank-at-least-one cover; they do not construct the secondary invariant/root here. Its Igusa extension request at line 1748 has the same foundational owner. PELModuliPartII, SchemeAndStackFoundationsPartII and ShimuraVarietiesPartII did not supply a second owner for the specialized targets. The available PadicFamiliesPartII and GSp4NonregularModularityLifting designs consume these geometric/coefficient inputs. OverconvergentAutomorphicForms Layers 5–6 concern analytic coefficient sheaves and compact operators; its ordinary comparison is a consumer of the algebraic interface. No later roadmap was added as a supplier. Ownership against open pull requests without supplied/indexed readable files was not checked.

### Resolved suppliers and declared gaps

Main was `e9512ca8`. For roadmaps already on main, the main copy was used; for new roadmaps, the supplied indexed open head was used. Every cross-roadmap citation was resolved afresh. The service resolver returned no unresolved roadmap citations or Lean names; its disclaimer that external libraries were not searched was addressed by the direct pin reads above. The supplied citation lead for `Lang.lang_surjective` is not a missing library claim: README:111 explicitly imports it from ReductiveGroupsPartII.

| Supplier copy | Sections/declarations opened and what they supply |
|---|---|
| AlgebraicModularFormsAndSerreWeights, open head | R15.1–R15.6: genus-one geometric forms, coefficients, elliptic Hasse/theta, Serre weights and residual witnesses. The genus-two direction extends this parent. |
| AlgebraicVectorBundles, main | L0A–L0C, README:216,229,255: sheaf tensor/dual operations, finite locally free interfaces and symmetric/exterior/determinant constructions. |
| ModularForms, main | Layer 2, README:383: generic double-coset ring, elementary divisors and degree, with concrete congruence interfaces for Γ₀ and Γ₁. Its hypotheses do not remove R01. Relevant migrated pin declarations are listed above. |
| ClassicalArithmeticCompletion, main | §1.17, README:857–867: nonzero odd-characteristic binary form count 1+(Δ/p), separately p+1 for zero. The theorem itself is sound; §6.2's claimed bijection is the defect. |
| AutomorphicBundles, open head | B2.1; B3.2–B3.4, B3.10; B4.19–B4.20; B5.10–B5.11, B5.14–B5.15, B5.19. Read the actual coefficient realization, relative boundary sequence, arbitrary coefficients, fibrewise component detection and rational unit-valued Hecke normalization. |
| ShimuraCompactifications, open head | C3.8–C3.9, README:1652,1677; C5.3–C5.4, C5.10, C5.12, C5.16–C5.17, C5.23, README:2291–2784. These supply spherical models, boundary/refinement comparison, Kodaira–Spencer, minimal Stein identity, ampleness and Koecher. C4.16–C4.17, README:2129–2164, give a characteristic-zero level-raising Klingen correspondence, not the missing integral parahoric interfaces. |
| AbelianSchemesAndArithmeticModuli, open head | A4.3, A4.7, A4.9–A4.11, README:1842–2329: abelian de Rham connection on its smooth-base domain, polarized deformation equivalences and ordinary weighted Serre–Tate coordinates. Genus-two logarithmic/trace/rank-one additions remain explicit gaps. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, open head | R07.2.2, README:3029; R07.2.21–R07.2.23, README:3752–3858: constant-rank filtration, Hasse determinant/LF, crystalline complexes, corank equality and odd-prime polarization compatibility. Equal rank is used only with equal dimensions. |
| HodgeTateAndCanonicalSubgroups, open head | §§0.12,0.14–0.16, README:414–505; §§5.1–5.2, README:1537–1570: lattice-first determinant normalization, semiabelian Hasse, minimal descent and Hilbert Igusa tower. The genus-two GL₂ torsor is not already supplied by the Hilbert torsor. |
| SchemeAndStackFoundations, main | §0.6, README:679–718; §§2.5–2.7, README:3389–3494; §§2.19–2.20, README:4095,4276; §4.9, README:5449. Depth-two Hartogs, qcqs colimits, ample vanishing, local cohomology, duality and proper formal functions. Open-formal Milnor, the stated lci fundamental class and reduced component propagation remain extensions. |
| ReductiveGroupsPartII, open head | RG2.3.7, README:5203–5205: ordinary Frobenius Lang surjectivity for smooth geometrically connected finite-type groups. No pro-algebraic extension is needed. |
| OverconvergentAutomorphicForms, open head | Scope and Layers 5–6, README:6–17,843,948: analytic coefficients and normalized analytic Hecke comparison, distinct from the integral genus-two targets. |

All eight plan gaps have exactly matching named-supplier Needs sentences in the README: `siegel-parahoric-models`, `siegel-rank-one-deformations`, `siegel-isogeny-trace-ideals`, `siegel-logarithmic-de-rham`, `open-formal-milnor`, `lci-fundamental-class`, `reduced-section-propagation`, `siegel-igusa-full-frames`. Each describes a coherent additional interface, retains its domain/hypotheses, and excludes the already supplied spherical, ordinary-coordinate, proper-formal or Hilbert-only cases. None has supplier `none`. They are valid conditional contracts, not findings about absent implementations. Because this verdict is needs changes, `conditional_gaps` is not included in review.json.

The required dependency command, with `--movable`, returned exit 0 and exactly:

```text
depcheck: 51 roadmaps, 589 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The order was not changed.

### Headline coverage, Lean elaboration and padding

| README headline | Acceptance-file disposition |
|---|---|
| All-component integral expansion and saturation (§1.4) | Docstring names missing integral Siegel model, coefficient sheaves and cusp charts. |
| Rank geometry and simple primary Hasse zeros (§§2.2–2.3) | Docstring names missing models, strata and deformation maps. |
| Secondary extension and spherical Cartier root (§§3.6–3.7) | Docstring names missing BT₁ crystal, determinant sheaves and nonordinary surfaces. |
| Equivariant torsion shifts and two-affine cover (§§4.3–4.4) | Docstring names missing sections/Hasse/minimal-formal carriers. |
| Integral residual coefficients and corrected Q₂ (§§5.6–5.7) | Docstring names actual covariant all-component series, transports and rational GSp₄ action; no arbitrary-endomorphism substitute. R01 affects the README construction. |
| Oriented neighbor reciprocity (§6.3) | Docstring names the marked orbit/coset correspondence and transports. |
| Integral global T/Q₂, finite/K/O coefficients and formal Hartogs (§§7.3–7.6) | Docstring names coherent isogeny correspondences, bundle cohomology and formal comparison. |
| Scalar/vector theta and superspecial nonvanishing (§§8.2,8.4) | Docstring names logarithmic de Rham/connection/stratum/section carriers. |
| Small symmetric-power irreducibility (§8.3) | Stated as `smallSymmetricPower_irreducible` using the real-body adapter `standardSL2` and native symmetric powers. |
| Negative-weight vanishing and low-weight theta injections (§§8.5–8.7) | Docstring names geometric section modules and theta maps. |
| Ordinary saturation, integral classical comparison and marked Klingen trace (§§9.2–9.4) | Docstring names full Igusa tower/function modules and marked correspondence. |

No additional statable geometric headline was found: encoding the missing moduli/section/correspondence constructions as arbitrary types or predicates would not state these theorems. The contraction's elementary basis formula is an intermediate construction, not a replacement acceptance theorem.

The required `lake env lean` elaboration of the package file was run from the pinned content checkout: exit 0; the sole diagnostic was `Suggested.lean:62:8: warning: declaration uses sorry`. Both imported Tau Ceti object files were available, so no targeted build was necessary. No Lean process remains running.

A scratch copy with `#check @name` for both declarations elaborated successfully. The resulting types are:

```lean
standardSL2 (p : ℕ) (k : Type) [Field k] [CharP k p] :
  Representation k (Matrix.SpecialLinearGroup (Fin 2) (ZMod p)) (Fin 2 → k)
smallSymmetricPower_irreducible (p : ℕ) [Fact p.Prime]
  (k : Type) [Field k] [CharP k p] (d : ℕ) (hd : d ≤ p - 1) :
  Representation.IsIrreducible ((standardSL2 p k).symmetricPower d)
```

These agree with §8.3. No field, characteristic, primality or degree binder was lost. The adapter also makes sense at p=0; the theorem explicitly requires p prime. All characteristic-p coefficient fields are quantified, which gives absolute irreducibility by extension of scalars.

The one sorried theorem was probed on separate scratch copies with `simp`, `rfl` and `infer_instance`, sequentially: all failed. The pinned irreducibility and symmetric-power declarations were read for a one-lemma `exact` proof; the available SU(2) theorem has the wrong group and coefficient field, and no matching finite-SL₂ theorem was found. The statement is neither a definition nor a small-value/Check theorem. There is no padding to delete, and no admitted example. Imports are one `import Mathlib` and the two individually used Tau Ceti modules; metadata parses as topic `math.NT`, and all eight manifest keys are unique.

## Not verifiable

- No seeded source was inaccessible, and no new reference request was needed. K75's extraction omits some displayed formulas; its surviving text explicitly distinguishes the zero Hasse–Witt matrix and the auxiliary identity block. The frame equation was checked independently by the dual-basis transformation and the displayed matrix calculations.
- The eight declared supplier extensions are contracts, not implemented objects verified by the Lean build. Acceptance after R01 is repaired would remain conditional on them.
- P20's published journal revision was not compared with the cached author version; Y16's later published numbering was not substituted for v5. The package records those version choices.
- Ownership against open pull requests without supplied/indexed readable files was not checked. The 19 supplied board heads and relevant indexed roadmap heads were checked as described above.

## Source issues

These are source-text issues encountered in the opened passages, not additional package findings where the package already corrects them. No published correction was established.

- **Gap** in CG20 at the note after Lemma 8.3, internal p.58 (journal 858), CG20 line 2290–2299: the source says prime-to-p congruence cosets have the same decomposition as full-level cosets without specifying tame compatibility; it should be a decomposition retaining the tame intersection index or using the local adelic correspondence; affects the proof.
- **Error** in CG20 at Theorem 8.10, internal p.61 (journal 861), CG20 line 2425–2429: the source says injectivity includes the Hasse weight k=p−1 under its numerical conditions; it should be restricted by k≠p−1 because h is nonzero and Θh=0; affects a stated result.
- **Error** in CG20 at Proposition 8.9(2), internal p.61, CG20 line 2417: the source says the vector contraction coefficient is multiplied by det(Q); it should be the contraction alone, up to its normalization unit; affects a stated result.
- **Gap** in CG20 at Proposition 8.9, internal p.61, CG20 line 2402–2422: the source says theta exists on arbitrary O/ϖ^m using the characteristic-p construction; it should be supported by a thickening construction or restricted to characteristic p; affects a stated result.
- **Misprint** in CG20 at Lemma 8.4 and Definition 8.5, internal p.59, CG20 line 2317–2353: the source says determinant and binary-discriminant Legendre symbols agree; it should be the discriminant symbol, whose value at x²+y²,p=3 is −1 rather than +1; affects a stated result.
- **Misprint** in CG20 at the proof of Lemma 8.6, internal p.59, CG20 line 2354–2358: the source says transformed determinants vanish; it should be det(R)=p²det(Q), zero modulo p but generally nonzero rationally; affects nothing.
- **Gap** in CG20 at the proof of Theorem 8.10, internal p.62, CG20 line 2438–2442: the source says local singularity geometry gives a global root section; it should be justified by the polarization-based global section and extension, or a global reference; affects the proof.
- **Gap** in Y16 at the proof of Theorem 4.9, p.39, Y16 line 2129–2141: the source says an upper-unipotent frame change can precede the normalized superspecial expansion; it should be a change preserving the dual-basis normalization, or the local formula must be recomputed; affects the proof.
- **Misprint** in Y16 at equation (3.32), p.22, Y16 line 1224: the source says the determinant twist belongs on Sym³E and leaves E untwisted; it should be Sym³E⊕(E⊗det E), with both summands of central degree three; affects a stated result.
- **Misprint** in Y16 at the Hasse matrix in the proof of Theorem 4.7, p.38, Y16 line 2063–2068: the source says the lower-right first-order entry is b₂₂; it should be t₂₂, consistently with the next determinant and Koblitz normalization; affects nothing.
- **Misprint** in P20 at §6.4, p.35, P20 line 1532–1536: the source says rank inequalities are strict and stratum dimension is 3−r; it should be inclusive bounds and stratum dimension r+1; affects nothing.
- **Misprint** in P20 at the proof of Lemma 6.4.1, p.35, P20 line 1550–1587: the source says Fe₂=pe₃ with its stated alternating pairing; it should be Fe₂=−pe₃ so the Frobenius pairing has value p; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "dc21b28f7d6573f84955b866307d82f8055147ed", "job": "REV-PKG-AlgebraicModularFormsAndSerreWeightsPartII~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
