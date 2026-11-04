<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1087#issuecomment-6394470605 -->
Review (codex) of 0ed3696

Verdict: needs_changes

1. **F01** (P1) The marked Klingen correspondence does not act as the full Z₂ sum

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:1292`: “its formal coefficient action is Z₂=UZ”; the comparison and Check at lines 1294–1300, and downstream contract at line 1318, repeat the identification.

   **Claim.** The full determinant-p coefficient sum equals Pilloni's operator `p^(3−r)U_(Kli(p),1)` on the multiplicative Klingen component, including weight zero.

   **Witness.** At p=3 and weight zero, the marked correspondence sends 1 to 3, whereas Z₂ sends 1 to 4. P20 line 2622 imposes disjointness from the marked multiplicative line; P20 line 2760 divides trace by p³.

   Here is the count independently of coefficient conventions. Over an algebraically closed ordinary point, write G[p²]=μ_(p²)²⊕(ℤ/p²)² and fix H₁⊂μ_p². The subgroup L has order p⁴, L[p] has order p³, and L∩H₁=0. Its multiplicative part is a line in μ_p² different from H₁; its étale part is the annihilator of that line. Thus there are p choices, not all p+1 projective lines. Each corresponding Serre–Tate branch has degree p·p²=p³, from the two monic equations in P20 line 2772 and the branch interpretation at P20 line 2773. Consequently deg(t₁)=p⁴, and the weight-zero differential factor is 1. The normalized trace gives p⁴/p³=p. At p=3 this is 81/27=3; modulo 3 the discrepancy is 0 versus 1. Neither a determinant twist nor a component transport can change the weight-zero constant calculation. P20 line 2616 fixes precisely the normalization claimed in the README.

   **Exact repair.** Keep §5.3's formal Z₂. Replace §9.4's identification by the marked Klingen construction with L∩H_m=0. State its action as the integral normalized trace `(p⁻³ Tr_t₁) ∘ φ_norm ∘ t₂*`, where `φ_norm` is the coefficient pullback normalized as in P20 §10.4 (including p⁻ʳ at algebraic determinant weight r). Define the continuous-weight action on the corresponding transported frames. State its expansion using that marked correspondence and its trace multiplicities; do not replace its indexing set by all determinant-p cosets. Retain integrality using P20 §10.3 and §13.3.1. Remove the unconditional Z₂ intertwining from the classical comparison and downstream contract; any relation after forgetting or summing markings needs a separate statement and proof. Replace the constant Check by `U(1)=p`, with `Z₂(1)=p+1` as a negative control. The repaired trace statement gives 3 at p=3 and 5 at p=5, exactly the branch counts. This is a defect in the newly explicit comparison, not a recurrence of F06's repaired locator error.

2. **F02** (P1) The new Lang-theorem proof input has no supplier edge

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:1131`: “by Lang's theorem U∩SL₂ is conjugate”; neither its Needs line at 1143, Layer 8 dependencies at 1205, nor the supplier contracts names an owner for Lang's theorem.

   **Claim.** The normalized-frame conjugacy used to prove the exceptional theta result is available from the listed prerequisites.

   **Witness.** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5203–5205`, at head 1383569, owns `Lang.lang_surjective` in §RG2.3.7 for smooth geometrically connected finite-type groups over finite fields. It is absent from this package's prerequisites.

   **Exact repair.** Add ReductiveGroupsPartII §RG2.3.7 to the exact supplier contracts, §8.4 Needs and Layer 8 dependencies. Import its ordinary Frobenius Lang theorem and explicitly specialize to SL₂ over 𝔽_p, which satisfies smoothness, geometric connectedness and finite type. Do not build a second Lang theorem here. The supplier is at merge-order line 25, before this roadmap at line 276.

   Test of the proposed route and its direction: with J=[[0,1],[−1,0]], choose g with `g⁻¹g^(p)=J⁻¹` and set B=g⁻¹. Then `B^(p)=JB`. For A∈SL₂(𝔽_p),

       J⁻¹(BAB⁻¹)^(p)J = J⁻¹(JB)A(B⁻¹J⁻¹)J = BAB⁻¹.

   Conversely the same calculation for B⁻¹CB proves that a fixed C gives an 𝔽_p matrix. Thus the repair supplies exactly the conjugacy used in the route. On the disconnected constant group of order two the Lang map instead has image {1}; that negative control explains why the supplier's connectedness hypothesis must be retained.

3. **F03** (P3) Name the auxiliary Frobenius block, not the Hasse–Witt matrix

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:1129`: “keeps the normalized Hasse–Witt matrix equal to the identity”.

   **Claim.** The identity matrix in Koblitz's dual-basis normalization is the superspecial Hasse–Witt matrix.

   **Witness.** K75 line 1673 distinguishes H(A)=0 from the invertible auxiliary block B; K75 line 1690–1700 normalizes B to I. Y16 line 2061–2068 gives A(t)≡(t_ij), hence A(0)=0.

   **Exact repair.** Replace the quoted name with “Koblitz's auxiliary bijective p-linear block B” and explicitly distinguish `B=I` from the Hasse–Witt block `A(0)=0`. Keep the displayed unitary condition `C^(p)Cᵗ=I` and the corresponding frame Checks. Tested at the superspecial origin, the repaired statements give B=I and A=0; every invertible frame change still sends the latter zero block to zero. This is a terminology correction to the intended normalized-frame argument, not a request to change its unitary group.

4. **F04** (P3) The finite-group irreducibility locator points to the next page

   **Location.** `packages/AlgebraicModularFormsAndSerreWeightsPartII/README.md:1094`: “Proof of Theorem 8.11, internal p. 63 (863); CG20 line 2469”.

   **Claim.** That page and line locate CG20's finite SL₂(𝔽_p) irreducibility assertion used in §8.3.

   **Witness.** CG20 line 2458–2460 contains the finite-group irreducibility assertion on internal p.62. CG20 line 2469 is the page-63 marker; the following text concerns coherent cohomology and restricted Hodge-bundle degrees.

   **Exact repair.** Cite “CG20, proof of Theorem 8.11, internal p.62 (journal 862); CG20 line 2458–2460” for this assertion. Keep the roadmap's own unipotent/interpolation proof for its full field and degree generality. Reopening the corrected locator reaches the finite-group assertion directly; no theorem statement or Lean signature changes.

Independent review dated 2026-10-25. Four findings: two blocking (P1), two nonblocking (P3). The package is repairable within its stated Part II scope. Its four input files were not changed. The eight named supplier gaps are valid conditional contracts, not findings.

## Verified sound

The previous review and its repair report were checked before the new pass. No prior finding was marked “not actionable in this package”, so none is being re-raised against a settled disposition. The following quotes are from the repaired package, not from source texts.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, six supplier-less gaps and unstated obligations | Partly repaired | README:452: “No extension of k₀ and no auxiliary level is needed.” README:736: “The rational residual V₂ is the scalar extension of a finite O-linear coefficient operator”. The plan now has eight named gaps and no null supplier. Root, descent and V₂ are statements. The newly explicit §9.4 comparison fails R01. |
| F02, oversized parahoric gap | Repaired | README:79: “Provide the Klingen and paramodular genus-two toroidal models”. Spherical C5.3/C5.16 and C3.8/C3.9 remain direct imports; §1.1, §4.1 and §4.4 no longer require this gap. |
| F03, unrelated and duplicated Needs | Repaired | README:952 names “SchemeAndStackFoundations §2.5”. The Hartogs route no longer asks for the lci fundamental class. Rank-one, trace and logarithmic gaps are separated by target; the repeated supplier entries and dangling dependency punctuation are gone. |
| F04, duplicated standard action | Repaired | Suggested.lean:57 uses “(TauCeti.stdSLRep k 2).comp”. The actual entrywise map is retained, the unused prime binder is removed from the definition, and README:1109–1111 tests column action, multiplication order and the smaller finite image. |
| F05, binary-form carrier and convention | Repaired | README:47: “γ•f=f∘γ⁻¹”; README:165: “T·x²=x²”. The pinned carrier and discriminant theorem are imported; transpose-inverse identification and its counterexample are explicit. |
| F06, Klingen normalization locator | Repaired | README:1292 cites “P20, §10, p. 57; P20 line 2616”. Section 13.3.1 is used only for integrality. The source normalization is correct; R01 concerns the asserted equality with Z₂. |
| F07, unrelated Hilbert-chart claim | Repaired | README:291 states “the imported primary Hasse section has Fourier expansion 1”. The unsupported Hilbert-chart sentence and its supplier entry are absent; the remaining Hilbert tower discussion accurately identifies the gap. |
| F08, four formula/range slips | Repaired | README:164 uses “M=diag(1,−1)”; line 173 retains “Sym^(j−k)(O′²)⊗M”; §§7.6–7.7 say “p odd”; §§8.1–8.2 and §8.4 use “p>d+1”. All four repaired patterns were checked throughout the package. |
| F09, supplier attribution drift | Repaired | README:65 says “This roadmap's §5.2 owns”; line 69 says “This roadmap's §6.2”; line 1238 says “requested by gap:siegel-igusa-full-frames”. The actual supplier sections were reopened. |
| F10, inadmissible frame change | Partly repaired | README:1131 uses “U∩SL₂”; line 1138 computes “C^(3)Cᵗ=I and determinant 1”. These are the correct allowed frames. The added Lang step still needs its supplier (R02), and the identity block needs its correct name (R03). |
| F11, process wording | Repaired | README:1330 says “satisfies p∤k(2k−1) and k≤p+1”. Searches found no remaining “source typo” or “uncorrected” narrative. |

The adversarial evidence below revisits all 48 target subsections, their defining conventions, API claims and Checks. It recomputes the repaired and sampled material. For unchanged material, it also retains the earlier review's explicitly computed identities; its unsupported summary sentences were not treated as evidence. A finite test is a negative-control check, not a proof of a universal geometric theorem: source support and the named proof inputs were checked separately.

### Seeded source sample

All eight manifest entries were readable in the supplied cache. There were no author-flagged unverified locators. All 15 seeded targets were opened at their cited text; fourteen are mathematically supported in the stated setting, with the source corrections below, and §9.4 has R01. The §8.3 page locator needs R04. The manifest's P20 author-version and Y16 v5 numbering are the numbering used here.

| Target | Text opened and locator checked | Hypotheses and result |
|---|---|---|
| 2.2 Dimensions and supersingular geometry | P20 §6.4, pp.35–37, line 1530–1655; CG20 proofs of Theorems 8.10–8.11, internal pp.62–63, line 2443–2477 | Genus two, geometric components, neat tame level; dimensions 1,2,3, P¹ components, p²+1 marked points and Hodge splitting agree. P20's dimension/index slips are not repeated. |
| 3.6 Secondary Hasse on both divisors | P20 Lemma 6.4.2, pp.36–37, line 1609–1649; B15 Theorem 4.5.4(3), pp.122–123, line 3085–3128; Theorem 6.2.2, pp.188–189, line 4715–4795 | Spherical and paramodular branches, vanishing on their intersection and extension across the finite exceptional set are retained; reduced zero support is distinguished from multiplicity. |
| 3.7 Reduced divisor and root | P20 Lemma 6.3.1.1, p.30, line 1338–1344; §6.3.2, pp.31–32, line 1350–1390; Remark 6.4.1, p.37, line 1652–1655; K75 IV §11, p.193, line 1712–1728 | Odd p and polarization are essential. P20 asserts the root without proof; the README supplies its own polarization formula and normal-extension route. K75 supplies local singularities, not global descent. |
| 4.4 Two affine opens | P20 proof of Lemma 14.8.2, p.101, line 4600–4625; B15 Theorem 6.2.3 and Corollary 6.2.4, p.190; Stacks Tag 0CNF, Lemma 47.9, line 5242–5247 | Amplitude is on the minimal model. The finite universal-homeomorphism step descends a p-power, not necessarily h′ itself. Finite-type characteristic-p hypotheses match. |
| 5.3 Formal U, Z and V | CG20 Lemma 8.3, internal p.58, line 2250–2305 | Integral normalized binary indices, coefficient transport and inadmissible-index zero extension retained. UV=1 does not imply VU=1. |
| 5.5 Characteristic-p relations | CG20 Lemma 8.6, internal p.59, line 2354–2358 | Odd p and characteristic-p coefficients retained; zero discriminant modulo p is not rational rank zero. |
| 6.2 Projective-zero count | CG20 Definition 8.19 and Lemmas 8.20–8.21, internal pp.71–72, line 2745–2830; ClassicalArithmeticCompletion §1.17 | Nonzero binary forms and the separate zero form are distinguished. Count is for labelled occurrences; equal resulting classes do not reduce multiplicity. |
| 7.5 Paramodular composite | P20 §7, pp.38–40, line 1665–1790, including Lemmas 7.1.1–7.1.2 | d≥0, r≥2, two different trace factors and the central correction retained. The gap explicitly supplies integral derived reduction and nonflat boundary correspondence data. |
| 8.1 Symmetric-power contraction | Y16 Proposition 3.12, (3.31), Remark 3.13 and Fourier calculation, pp.22–24, line 1219–1330 | d≥2 and 2d(d+1) invertible; the transvectant normalization is checked directly. The r=p−2 endpoint uses Remark 3.13, not the stronger splitting hypothesis preceding (3.31). |
| 8.2 Theta operators | Y16 Propositions 3.9, 3.11–3.12 and Fourier calculation, pp.21–24, line 1140–1330; CG20 Proposition 8.9, internal p.61, line 2400–2424 | Characteristic p, scalar determinant multiplier and vector contraction without an extra determinant. No mod-ϖ^m theta theorem is inferred. |
| 8.3 Small symmetric powers | CG20 proof of Theorem 8.11, internal p.62, line 2458–2460; native representation declarations listed below | Every characteristic-p field, 0≤d≤p−1, including p=2 and d=0. The README supplies the unipotent/binomial proof; the source's geometric application is not used to narrow the field. |
| 8.5 Negative-weight vanishing | CG20 proofs of Theorems 8.10–8.11, internal pp.62–63, line 2438–2482; P20 Remark 6.4.1 | a≥b and pa−b<0, geometric components, root divisor and minimal ampleness retained. Maximal component degree pa−b and both division steps were computed. |
| 8.7 Vector injectivity | CG20 Theorem 8.11 and proof, internal pp.62–63, line 2448–2482; Y16 Theorem 4.9, p.39, line 2129–2141 | 4≤j<p−1, plus the stated exceptional (6,2) argument; local nonvanishing, component degrees and negative weights checked. Its proof input inherits R02/R03. |
| 9.2 p-adic expansion and saturation | T06 Proposition 3.3, pp.809–810, line 1260–1284; P12 Definition 4.3, p.352, line 719–758 | All components and full frames, finite torsion before limits. The full genus-two tower and component detection are accurately requested, not attributed to the Hilbert supplier. |
| 9.4 Klingen coefficient operator | T06 §3.2, p.810, line 1313–1314; P20 §10, pp.57–61, line 2616–2774; §13.3.1, p.89, line 4094–4099; CG20 Lemmas 8.3–8.4 | Normalization and integrality citations are correct. They do not identify the marked correspondence with the unrestricted Z₂ sum: its disjointness condition gives R01. |

### Computed adversarial table

“Retain” means no repair beyond the stated hypotheses; “contract” means the calculation tests the requested interface, whose implementation remains the named supplier's responsibility. The zero ring is excluded by Field/DVR hypotheses; the zero coefficient module is included. Fields of characteristic p, ramified mixed-characteristic coefficients and nonreduced coefficient thickenings are distinguished throughout. No division by p on K/O is used.

| Statement | Instances tried | Values on the two sides, or object and negative control | Result | Change |
|---|---|---|---|---|
| Conventions: coefficient domain | O=ℤ₃; ϖ²=3; k[[t]] in characteristic 3 | v_ϖ(3)=1 or 2 in the admitted mixed-characteristic cases; 3=0 in the excluded equal-characteristic case | Finite-over-ℤ_p assumption matters | Retain |
| Conventions: dominant weight and rank | (j,k)=(0,0),(1,0),(−1,−1),(1,2) | Sym degrees 0,1,0; ranks 1,2,1; last degree −1 is excluded, not truncated to 0 | Correct domain | Retain |
| Conventions: central normalization | p=3, (j,k)=(2,2),(3,3) | S_c scalars 3⁻² and 1; first is not an endomorphism of O/3 | Negative powers restricted to rational coefficients | Retain |
| 1.1 sheaf-first forms | Zero module; weight zero | H⁰(E⊗0)=0; H⁰(O_X) contains 1 with coefficient 1 | Real carriers, not arbitrary scalar data | Retain |
| 1.1 cusp inclusion after arbitrary tensor | O[t], I_D=(t), M=O/ϖ² | Tor₁(O_D,M)=0; (t)⊗M maps to tM[t] with kernel 0; constant 1 is outside it | Relative Cartier flatness is used | Retain |
| 1.1 coefficient functor | Maps M→N→P given by ×a,×b; zero map | Composite gives ×ba on sheaf sections on both sides; zero gives 0 | Identity/composition compatible | Retain |
| 1.1 reduction sequence | Locally free E, ×ϖ^m | Cokernel of H⁰(E)/ϖ^m→H⁰(E/ϖ^m) equals H¹(E)[ϖ^m]; if latter is O/ϖ, discrepancy has length 1 | Tensoring H⁰ first can fail | Retain |
| 1.1 twist and refinement | (j,k)→(j+t,k+t); identity refinement | Degree (j+t)−(k+t)=j−k; identity comparison sends s to s | Imported B3/C3 interface, no second bundle theory | Retain |
| 1.2 discriminant | x²; x²+y² at p=3 | Δ=0 and −4; det=0 and 1; symbols at second form are −1 and +1 | Discriminant, not determinant symbol | Retain |
| 1.2 normalized action law | Arbitrary invertible M,N and Q | M·(N·Q)=(det M det N)⁻¹MNQNᵗMᵗ=(MN)·Q; identity gives Q | Both sides computed | Retain |
| 1.2 determinant sign | diag(2,1), diag(1,−1), Q=x²+y² | Images 2x²+½y² and −x²−y²; Δ stays −4 in both; second cone sign is negative | Negative determinant excluded only from cone preservation | Retain repair |
| 1.2 native action dictionary | T=[[1,1],[0,1]], Q=x² | T·Q=x²=(Tᵗ)⁻¹•Q; native T•Q=x²−2xy+y² | Wrong transpose convention separated | Retain repair |
| 1.2 primitive iff nonzero reduction | x², 3x² at p=3 | Coefficient residues (1,0,0)≠0 and (0,0,0)=0; both discriminants are 0 | Both directions distinguished | Retain |
| 1.2 inadmissible indices | x²/3 at p=3; p=2 mixed coefficient | Coefficient is 0 for forbidden 3-denominator; r/2 has no residue value at p=2 | Polynomial carrier and zero extension used | Retain |
| 1.3 cone series support | m=n=1; m=n=N | r²≤4 gives −2≤r≤2; lower exponent −2N is unbounded as N grows | Laurent polynomial slices, not one bounded Laurent localization | Retain |
| 1.3 coefficients and monomials | (j,k)=(k+1,k); Q=(1,−1,1) | Coefficient rank 2, not 1; Δ=−3 and monomial qζ⁻¹q′ | Repaired ambient module correct | Retain repair |
| 1.3 covariance and frame transport | Upper unipotent on standard basis; identity frame | x↦x, y↦x+y; identity leaves both fixed | Native column convention agrees | Retain |
| 1.4 componentwise injectivity | X=X₁⊔X₂, section (0,1) | Expansions at two chosen cusps are (0,1); first cusp alone returns 0 | Every component required | Retain |
| 1.4 saturation and coefficient recognition | 1/ϖ; submodule ϖO⊂O | First coefficient is outside O; coefficient 1 is outside ϖO, coefficient ϖ inside | Correct lattice recognized | Retain |
| 2.1 rank strata | μ_p²⊕(ℤ/p)²; μ_p⊕I_(1,1)⊕ℤ/p; I_(1,1)² | Multiplicative ranks 2,1,0; belong respectively to ordinary, rank-one, rank-zero strata | Inclusive inequalities correct | Retain |
| 2.1 boundary rank | Torus rank 1, elliptic quotient supersingular or ordinary | Total ranks 1+0=1 and 1+1=2; neither is rank zero | Rank-zero locus misses boundary | Retain |
| 2.2 dimensions and codimension | r=0,1,2 in a threefold | r+1=1,2,3; rank-zero codimension 3−1=2 | Corrects source indexing slip | Retain |
| 2.2 supersingular component | p=3, C=P¹ | #P¹(𝔽₉)=10; E splits with degrees −1,3; det degree 2=p−1 | Numerical geometry agrees | Retain |
| 2.2 restricted weight degree | Sym^(a−b)(O(−1)⊕O(p))⊗O(b(p−1)) | Maximum p(a−b)+b(p−1)=pa−b; for (a,b)=(−1,−1), p=5 gives −4 | Exact maximum, not average degree | Retain |
| 2.3 pairing sign | Fe₂=−pe₃, Fe₃=e₂, ⟨e₂,e₃⟩=1 | ⟨Fe₂,Fe₃⟩=p; opposite sign gives −p | Source sign corrected | Retain |
| 2.3 first-order zero | Y=ε over k[ε]/ε², principal X=Z or paramodular X=0/Z=0 | Quotient matrix [[−ε,0],[−Z,1]] has determinant −ε≠0; Y remains free in all three charts | Simple zero survives tangent constraints | Contract retained |
| 2.3 reduced Cartier divisor | Generic order-one equation t in CM ring | R/(t) has generic length 1; equation t² would give length 2 | CM plus generic reducedness excludes embedded multiplicity | Retain |
| 2.4 primary Hasse | Split torus; mixed rank-one fibre | Hasse matrices I₂ and diag(1,0); determinants 1 and 0 | Expansion 1 is compatible with interior zeros | Retain |
| 2.4 multiplication versus theta | p=5, h weight 4 | h·1=h≠0 but Θh=0 | Multiplication injectivity does not imply theta injectivity | Retain |
| 3.1 secondary definition and weight | p=3; remove an étale height-one factor | (p−1)(p+1)=8; Hodge bundle unchanged when height drops 4→3 | Weight and semiabelian recipe compatible | Retain |
| 3.1 multiplicativity | Trivialized multiplicative and local-local determinant factors | h′=Ha(Gᵐ)^(p+1)t^(p−1); when both factors equal 1, h′=1; a zero factor gives 0 | Zero map/trivial section rejected | Retain |
| 3.2 duality on determinant powers | Polarized height 4, dimension 2; boundary height 3, dimension 2 | Dual dimensions 2 and 1 respectively; equal-corank implies equal-rank only in first case; normalized determinant map sends 1→1→1 | Boundary recipe kept separate; odd-prime polarization input named | Retain |
| 3.3 canonical subgroup and quotient map | V*=[[0,1],[0,t]] over a DVR | ord(V_H*)=1=ord(W), ord(Z)=0; at ordinary rank-one multiplicative subgroup H=μ_p has rank p | Invertible Z distinguished from vanishing V_H* | Retain |
| 3.3 separate multiplicative/étale drops | Multiplicative rank 1, étale rank 0 | V_H* on μ_p is a unit, order 0; only the dual factor degenerates | Avoids source's excessive zero locus | Retain |
| 3.4 normal extension | V_H*=W=t, Z=1 | ord A=(p+1)−(p−1)=2; t⁻¹ has square t⁻², not regular | Rational square regular implies section regular on normal domain | Retain |
| 3.4 product with dual factor | Multiplicative drop alone / étale drop alone | Orders (A,B)=(2,0)/(0,2); product has positive order in either case | A⊗B, not each separate factor, detects union | Retain |
| 3.5 local component rings | R=k[x,y,a,b,c]/(xy,ax+by+abc) | R/(a,y,x+bc)=k[b,c], dimension 2; R/(x,y+ac)=k[a,b,c], dimension 3 | Relations substitute to 0 in both quotients | Retain |
| 3.5 nonordinary union | The two divisors in the three-dimensional chart | Union ring k[a,b,c]/(ab), dimension 2; intersection a=b=0 has dimension 1 | Reduced union, not doubled equation | Retain |
| 3.6 branch gluing | Values a²,b²; competing values 1,0 | a²+b² restricts to the prescribed branch values and to 0 on intersection; 1 and 0 disagree there | Correct gluing criterion | Retain |
| 3.6 extension and zero multiplicity | Finite superspecial complement on CM surface; local h′=t² | Codimension 2 permits H⁰ extension; length R/(t²)=2 versus reduced support length 1 | Zero scheme not identified with reduced divisor | Retain |
| 3.7 root formula | p=3,5 on rank-one open | Exponents ((p+1)/2,(p−1)/2)=(2,1),(3,2); their doubles are (4,2),(6,4) | Polarization formula squares to h′ | Retain repair |
| 3.7 field, level and sign | Fixed polarization; rescale by c=2,4 at p=5 | b₀ factors c²=4,1; h′ factors c⁴=1,1 | Polarization fixes the root, square equation alone leaves ± | Retain repair |
| 3.7 degree and reducedness | p=3; p=2; local b₀=t | Root weight 4, square weight 8; p=2 gives 3/2 and is excluded; zero lengths 1 versus 2 | Odd bound and reduced divisor necessary | Retain |
| 3.8 normalized multiplicative pullback | [p] on μ_(p∞), on its square; identity rank 0 | p⁻¹p=1, p⁻²p²=1, 1⁻¹1=1 | Normalize on character lattice before reduction | Retain |
| 3.8 forbidden reduced differential division | [p] on μ_p in characteristic p | Differential is 0, so no inverse of it exists; normalized integral character map reduces to 1 | Excludes zero-map surrogate | Retain |
| 4.1 lifting primary powers | Expansion 1; two local lifts 1 and 4 at p=3 | Both reduce to 1; their difference 3 is nonzero integrally | Lift exists but is not itself canonical | Retain |
| 4.1 descent under deck transformations | Deck pullback of h^r, including group of order p | Reduction difference 0; averaging would divide by p, which is unavailable | Power construction, not averaging | Retain |
| 4.2 canonical powers | p=3, lifts 1,4 modulo 9; p=2, lifts 1,3 modulo 4 | 4³−1=63≡0 mod9; 3²−1=8≡0 mod4 | Both small primes pass | Retain |
| 4.2 ramified and first-depth cases | ϖ²=3; (1+ϖ)³−1; m=1 | Minimum ϖ-order 3≥2; p^(m−1)=1 at m=1 | Ramification included; m=0 excluded | Retain |
| 4.3 torsion weight shift | p=3,m=2,r=1,s=3 | t=rs(p−1)=6; j−k unchanged; (1+ϖ)(1−ϖ)=1 modϖ² | Shift is invertible on ordinary locus | Retain |
| 4.4 descent through finite universal homeomorphism | k[t²,t³]⊂k[t], p=2 or 3 | t is missing downstairs, but t² or t³ belongs downstairs | A p-power is needed; raw section descent is not assumed | Retain repair |
| 4.4 equal weights of two sections | p=3, power N | (p−1)N(p+1)=8N=N(p²−1) | Same line bundle after lifting | Retain |
| 4.4 two-open cover | Ordinary, rank-one, rank-zero points | Section pairs (1,*),(0,1),(0,0); first two covered, last excluded | Cover exactly rank at least one | Retain |
| 4.4 affineness route | Ample bundle on minimal model; finite cover | Nonvanishing affine open pulls back to affine under finite map; identity map gives the same open | No toroidal ampleness asserted | Retain |
| 5.1 formal coefficients on modules | K/O, class 1/p; zero module | p(1/p+O)=0; all zero-module coefficients are 0 | No multiplication of coefficient classes required | Retain |
| 5.1 matrix action and wrong twist | ρ₁(diag(p,1)) on x,y | Correct values px,y; extra determinant gives p²x,py | Untwisted symmetric action fixed | Retain |
| 5.1 formal versus geometric space | Nonzero orbit indicator with a(0)=0; scalar global constants | Indicator is nonzero while constant term is 0; geometric weight-zero constants with that term are 0 | Formal series not silently geometric forms | Retain |
| 5.2 full cosets and admissibility | p=3, Q=0,x²,x²+y² | Four cosets; admissible counts 4,1,0 | All projective lines counted, unlike R01 | Retain |
| 5.2 image-line convention | M=diag(p,1) | im adj(M)ᵗ mod p=[1:0]; M⁻¹·Q=(m/p,r,pn); integrality iff m≡0 | Kernel of M would give the wrong point | Retain repair |
| 5.2 representative independence | M replaced by Mγ | adj(Mγ)ᵗ=adj(M)ᵗadj(γ)ᵗ, same image; ρ(Mγ)ρ(γ⁻¹)=ρ(M) | Both line and coefficient sum unchanged | Retain |
| 5.3 U,V and nonconverse | Coefficient 1 at primitive Q | UV coefficient 1; VU coefficient 0; on p-divisible Q, VU returns its coefficient | UV=1 and projection distinguished | Retain |
| 5.3 scalar Z formula | M=[[p,a],[0,1]] | Inverse normalized coefficients ((m−ar+a²n)/p,r−2an,pn); replacing a by −a gives source sum | Signs agree after representative reindexing | Retain |
| 5.3 Z₂=UZ and U-commutation | A coefficient at Q | Both Z₂ formulas sum ρ(M)a(M⁻¹·pQ); both UZ₂ and Z₂U sum ρ(M)a(M⁻¹·p²Q) | Intermediate pQ transform integral; no UZ=ZU claim | Retain |
| 5.3 constant series | p=3, d=0 | U1=V1=1; Z1=Z₂1=4 | Formal sums correct | Retain |
| 5.4 diagonal X₂ and U₂ | p=3, anisotropic, nonprimitive, rank-one Q | (X₂,U₂)=(-1,-4),(3,8),(0,-1); reductions (2,2),(0,2),(0,2) | −1+pX₂ formula correct | Retain |
| 5.4 determinant/discriminant distinction | Q=x²+y² at p=3 | Legendre(det)=1, Legendre(Δ)=−1 | Substitution would change U₂ from −4 to 2 | Retain |
| 5.5 UX₂=0 and X₂³=X₂ | Characteristic p coefficients | At pQ multiplier p=0; at primitive Q multipliers 0,±1 have cubes 0,±1 | Relations hold after reduction | Retain |
| 5.5 Z₂X₂=0 | p=3,M=diag(3,1),Q=x²+y² | Transformed index x²+9y² has Δ=−36≡0; det=9, not rational zero | Correct modular vanishing | Retain |
| 5.6 T decomposition | p=3,(j,k)=(2,2),(3,3) | T=U+Z+3V and U+3Z+27V | Exponents match normalization | Retain |
| 5.6 rational T₂ and central term | p=3,(j,k)=(3,3),(2,2) | First T₂=−1+3X₂+Z₂+27V₂; second central S_c=1/9 | Terms may be rational although corrected combination is integral | Retain |
| 5.6 integral residual V₂ and naturality | K/O killed by p; coefficient map M→N | Multiplication by 27 can kill nonzero classes; finite integral coset sum commutes termwise with M→N | V₂ must be constructed before tensoring, not obtained by division | Retain repair |
| 5.7 cancellation defining Q₂ | Substitute U₂=−1+pX₂ | Constant terms −p^(j−3)+(1+p²)p^(j−3)=p^(j−1); remaining coefficients p^(j−2),1,p^(j+k−3) | Exact algebra, no division on torsion | Retain |
| 5.7 low-weight reduction | p=3 at (2,2),(3,3) | Coefficient tuples (1,1,3,3),(3,1,27,9); reductions X₂+Z₂ and Z₂ | Exceptional weight retained | Retain |
| 6.1 multiset of neighbours | p=5,Q=x²+y² | Zeros [2:1],[3:1]; two occurrences can give the same discriminant −4 class | Multiset size 2, not set size 1 | Retain |
| 6.1 coefficient transport on torsion | d=1,p=3,M=diag(3,1) over 𝔽₃ | x↦0,y↦y; map has nonzero kernel | Transport retained without inverses | Retain |
| 6.2 projective-zero formula, both cases | p=3; Q=x²+y²,x²,xy,0 | Counts 0,1,2,4; 1+Legendre(Δ)=0,1,2 for nonzero forms; zero separately p+1=4 | Zero exception essential | Retain |
| 6.2 prime variation | p=5 and p=7, Q=x²+y² | Counts 2 and 0; symbols (−4/p)=1 and −1 | Split/nonsplit forms distinguished | Retain |
| 6.3 oriented reciprocity | Γ(5),p=3,M=[[3,5],[30,51]] | det M=3; M⁻¹·x²=3(17x−10y)²≡2x² mod5; repeated forward step gives 4x²≠x² | Reverse orientation requires actual diamond data | Retain |
| 6.3 inverse transport | Forward/reverse index map; torsion coefficients | Reverse index composition gives Q; coefficient map x↦0 cannot be inverted | Index reciprocity does not assert coefficient isomorphism | Retain |
| 7.1 kernel strata and finiteness | p=3 ordinary; superspecial | Ordinary geometric count 1+4+1=6 versus generic degree 4·10=40; superspecial α_p² has P¹ family | Finiteness only over rank at least one | Retain |
| 7.2 differential/trace orders | (d,r)=(0,2),(1,3),(0,1) | Minimum totals (4,3,3),(7,4,3),(2,2,3); middle total 2 fails at r=1 | r≥2 essential | Contract retained |
| 7.3 normalized T | p=3,d=0,r=2 | Divided terms 3⁴/3³=3,3³/3³=1,3³/3³=1 | Integral before reduction | Retain |
| 7.3 coefficient compatibility and cusps | Integral map ×3 then reduce mod3; boundary ideal (q) | Map becomes 0, still defined; q multiples remain in (q) under supplied boundary transport | No post-reduction division | Contract retained |
| 7.4 finite-level Hartogs | Punctured affine plane versus punctured line | H⁰=k[x,y] versus k[t,t⁻¹]≠k[t]; H²_(x,y) has nonzero 1/(xy) | Codimension/depth 2 gives stated degrees only | Retain |
| 7.4 formal Milnor and K/O | Equal H⁰ restriction systems; zero system; filtered torsion union | lim¹ terms identical; zero system gives 0 on both sides; colim O/ϖ^n=K/O using the specified transitions | H¹ not naively interchanged with inverse limit | Contract retained |
| 7.5 first/second composite normalization | d≥0,r≥2; (d,r)=(0,2) | Orders r+2=4 and d+2r=4; second trace contributes ≥1; general difference d+r−2≥0 | Both stages integral in stated range | Retain |
| 7.5 composite versus corrected Q₂ | General weights; p=3,j=2,3 | C_r−Q₂=(1+p²)p^(j−2); values 10 and 30, reductions 1 and 0 | Central subtraction indispensable | Retain |
| 7.5 derived coefficient reduction | Nonflat correspondence map, O/ϖ² | O/ϖ² has nonzero ϖ-torsion; derived tensor retains possible Tor term which ordinary tensor would discard | Explicit lci fundamental-class contract covers this case | Contract retained |
| 7.6 global finite/K/O actions | p=3,(2,2), Q=0; p=2 geometric construction | X₂(0)=3,Z₂(0)=4 gives Q₂ mod3=1; at p=2 no odd Legendre expansion is invoked | Integral construction broader than expansion formula | Retain repair |
| 7.7 Hasse equivariance at p | p=5,(3,3)→(7,7); k=2 control | For k≥3 reductions T=U,Q₂=Z₂ on both weights; at k=2 T=U+Z with constant Z=6≡1 | Low-weight exception necessary | Retain repair |
| 8.1 contraction normalization | d=2 highest-weight combination | Numerator 4+4+4=12, denominator 12, quotient 1; individual con₂(x²⊗y²)=4/12=1/3 | Zero map and unnormalized transvectant rejected | Retain |
| 8.1 coefficient-ring bound | (p,d)=(5,2),(5,3),(5,4),(7,5),(7,6) | 2d(d+1) residues 2,4,0,4,0 | p>d+1 admits d=p−2, excludes d=p−1 | Retain repair |
| 8.1 determinant covariance | diag(a,b), input x²⊗y² for d=2 | Input factor a²b² equals det² factor on target; inverse determinant gives a⁻²b⁻² instead | Correct determinant direction | Retain |
| 8.2 scalar versus vector Fourier multiplier | p=7,Q=x²,vector coefficient y² | Scalar det Q=0; vector con₂(y²⊗x²)=1/3=5 | Extra determinant would falsely kill vector coefficient | Retain |
| 8.2 theta weights | Input (j,k), d≥2 | Output vector degree (j+p−1)−(k+p+1)=d−2; scalar shift p+1; primary Hasse shift p−1 | Distinct operators/twists retained | Retain |
| 8.2 field versus thickening | Residue field; O/ϖ²; p=7,Q=x²+y² | det Q=1 whereas Δ=−4≡3; Frobenius identities used in characteristic p need not hold in O/ϖ² | No arbitrary-thickening theta claim | Retain |
| 8.3 standard action, order and image | p=3 upper/lower unipotents; p=2→𝔽₄ | Upper fixes x, sends y→x+y; upper·lower=[[2,1],[1,1]]; image order 6 versus SL₂(𝔽₄) order 60 | Nonabelian action and restriction correct | Retain repair |
| 8.3 irreducibility at endpoints | d=0; p=2,d=1; p=3,d=2 | Dimensions 1,2,3; first subspaces only 0,k; no common invariant line in second; binomials 1,2,1 generate all three basis vectors in third | Boundary cases included, not padding targets | Retain |
| 8.3 false wider range | p=3,d=3 | Span{x³,y³} has dimension 2<4 and is invariant; x²y coefficient vanishes on it | Degree bound excludes reducibility | Retain |
| 8.3 orbit coefficient detection | Nonzero v and nonzero functional ℓ in irreducible module | If every ℓ(gv)=0 then orbit span lies in ker ℓ of dimension d<d+1, contradicting full span | Quantifiers tie data to actual representation | Retain |
| 8.4 scalar/exceptional factors | p=7,k=2; p=11,(j,k)=(6,2) | k(2k−1)=6, divided by 9 gives 3 mod7; j−3k=0 but j−3=3 mod11 | Exceptional coefficient separately needed | Retain |
| 8.4 permissible frames | Upper unipotent; p=3,C=[[0,i],[i,0]],i²=−1 | CCᵗ=[[2,1],[1,1]]≠I; second C^(3)Cᵗ=I and det C=1 | Unitary restriction repairs old route | Retain repair |
| 8.4 Lang conjugacy | B^(p)=JB; C=BAB⁻¹ | J⁻¹C^(p)J=C iff A^(p)=A; disconnected order-two Lang map gives only 1 | Correct calculation, missing supplier | R02 |
| 8.4 which block is normalized | Superspecial origin t=0 | Actual Hasse–Witt A(0)=0, auxiliary B=I; 0≠I | Matrix name wrong | R03 |
| 8.5 component vanishing | p=5,(a,b)=(−1,−1),(0,0),(1,2) | pa−b=−4,0,3; first H⁰(O(−4))=0, second has 1; third excluded by a≥b | Dominance and strict inequality both used | Retain |
| 8.5 recursive divisor steps | p=7,m₀=24 | pa−b decreases by 6·24=144 after b₀ and 6²=36 after h | Strict negativity preserved | Retain |
| 8.5 Krull intersection controls | Proper ideal (t) in finite local module; unit ideal | ⋂(t^n)=0 in k[[t]]; ⋂(1)^n=k[[t]]≠0 | Proper ideal and divisor meeting components required | Retain |
| 8.6 exact scalar range | p=5,k=2,3,4,5,6 | Factors k(2k−1) residues 1,0,3,0,1; k=4 separately excluded; allowed {2,6} | Hasse counterexample excluded | Retain |
| 8.6 endpoint induction | p=5,k=6; k=4 | Degree 24<26; dividing h leaves weight 2; at k=4 leaves constant 1 with Θh=0 | Endpoint proof differs from negative-weight case | Retain |
| 8.7 vector degrees | p=7,j=4,5; p=11,j=6 | Maximal degrees 26,33<50; after primary division at p=11 weights (−4,−8), degree −36 | Both geometric vanishing steps apply | Retain |
| 8.7 excluded/empty ranges | p=5; p=7,j=6 | Interval 4≤j<4 empty; 6<6 false | No accidental endpoint theorem | Retain |
| 9.1 tower limit and action | Right frame ψ→ψg; two successive g,h | Left action g·(h·f)(ψ)=f(ψgh)=(gh)·f(ψ); zero finite systems give completed space 0 | Direction and lim_m colim_n retained | Retain |
| 9.1 weight character | d=2,r=1,diag(2,1) | t₁^(d+r)t₂^r=8; swapped character gives 2; differential first vector scales by 1/2 | Inverse transpose and character consistent with P12 | Retain |
| 9.1 full frame group | p=3,n=1 | GL₂(𝔽₃) order (9−1)(9−3)=48; diagonal order 4 | Full frame space not diagonal/Hilbert tower | Contract retained |
| 9.2 saturated expansion | Constant 1 and 1/3 on all frames | Coefficients 1∈O and 1/3∉O at each of 48 frames | All-frame integrality detects lattice | Retain |
| 9.2 supplier distinction | Hilbert F=ℚ,p=3,n=1 versus genus-two frames | Hilbert torsor degree 2; full frame degree 48 | Declared extension necessary | Retain repair |
| 9.3 classical evaluation | d=0; polynomial x³y−xy³ at p=3 | d=0 gives det^r; polynomial zero at all 9 𝔽₃-vectors but value −24 at (1,3) over ℤ₃ | Integral injection does not imply finite-level injection | Retain |
| 9.3 Hecke/frame functoriality | Identity correspondence; differential frame ψg | Identity evaluates same coefficient; frame changes by g⁻ᵗ, exactly P12 line 795–797 | Comparison tied to actual frame | Retain |
| 9.4 geometric versus formal operator | p=3 and 5, weight-zero constant | Marked branches p=3,5, degrees 81,625; normalized traces 3,5; Z₂ sums 4,6 | Equality false even modulo p | R01 |
| 9.4 continuous character domain | κ:ℤ₃ˣ→Oˣ | κ(1)=1; 3∉ℤ₃ˣ, hence κ(3) has no domain value | Geometric correspondence needed, no extension by junk value | Retain |
| Worked examples and cross-layer normalization | p=3,(2,2),(3,3) | Q₂=X₂+Z₂+3V₂+3 and 3X₂+Z₂+27V₂+9; C−Q₂=10,30 | Layers 5 and 7 agree; Layer 9 alone misidentifies marked operator | R01 only |

### Library and ownership audit

The pins read from `lake-manifest.json` were Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches used objects and hypotheses (binary quadratic forms, symmetric powers, irreducibility, Hasse/BT₁ data, Igusa frames, Klingen correspondences, trace and Lang maps), not just the package's chosen names. These native definitions were opened at the pins:

| Pinned file and line | Declaration/interface and scope checked |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63`, `:141` | `Matrix.det`, `Matrix.det_mul`: finite square matrices over a commutative ring; no invertibility of 2 supplied. |
| `Mathlib/NumberTheory/LegendreSymbol/Basic.lean:109` | `legendreSym`: prime parameter and integer input; rational discriminants need the stated prime-to-p denominator reduction. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `Representation.IsIrreducible` is `IsSimpleOrder` on subrepresentations. It requires a nonzero representation space, not a nontrivial action; the one-dimensional trivial action is allowed. |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225` | `Matrix.SpecialLinearGroup.map`, induced by a ring homomorphism; it does not replace the source group by SL₂(k). |
| `Mathlib/Data/ZMod/Basic.lean:331` | `ZMod.castHom` with the characteristic/divisibility hypotheses used in the definition. |
| `Mathlib/RingTheory/Filtration.lean:425` | `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`: Noetherian local ring, finite module, proper ideal. The unit ideal negative control is recorded above. |
| `TauCeti/RepresentationTheory/SymmetricPower.lean:47` | `Representation.symmetricPower`, with a real body on native symmetric tensors, coefficient type in `Type`, commutative semiring and monoid. |
| `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:167` | `Module.Basis.symmetricPower`, with multiset basis indices, providing the monomial interpretation. |
| `TauCeti/RepresentationTheory/ClassicalGroups/Restriction.lean:44` | `TauCeti.stdSLRep`; line 49 identifies its action with matrix multiplication on column vectors. |
| `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean:94`, `:146`, `:194`, `:203`, `:237` | Native coefficient triple, `discrim`, inverse-substitution SL₂ action, `discrim_smul`, and T-action computation. No determinant-normalized rational GL₂ action is imported under the same convention. |
| `TauCeti/RepresentationTheory/SU2/Irreducible.lean:164` | `TauCeti.SU2.isIrreducible_symPower` is the complex SU(2) theorem, not the characteristic-p finite SL₂ theorem. |
| `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59` | `TauCeti.symPowerRep` is the GLₙ symmetric-power carrier; it does not assert the new finite-group irreducibility theorem. |

`roadmaps grep` was used over the service's main/open-head index for the ownership audit, together with the board-package index supplied in the brief. All 20 board heads were inspected by object: five contain package READMEs, and fifteen are design-only trees whose design READMEs were read. A missing root README in those fifteen was not treated as a missing roadmap. The helper located text only; the mathematical comparisons in this report were made by the reviewer from the located passages.

The important ownership boundaries are:

- The parent AlgebraicModularFormsAndSerreWeights R15.1–R15.6 owns the modular-curve/elliptic direction. Its genus-one scope does not supply the genus-two integral correspondences here. This is a genuine Part II extension.
- AlgebraicVectorBundles and AutomorphicBundles own generic coefficient bundles, subcanonical extensions, module coefficients and expansion recognition. This package imports them and adds the genus-two Fourier-index and integral bad-prime calculations. Its integral trace divisions differ from AutomorphicBundles B5.10's unit-valued normalization after inverting p.
- ModularForms Layer 2 owns the double-coset ring and elementary divisors. It does not state this particular normalized-index/P¹ bijection. ClassicalArithmeticCompletion §1.17 does own the projective-zero count; §6.2 imports it rather than claiming a new general counting theorem.
- The base finite-flat-group, HodgeTate and ShimuraCompactifications carriers are imported. The new gaps ask for the specific genus-two/parahoric extensions, not replacement foundations.
- `packages/HigherHidaAndColemanTheory/design/README.md:434` at da88512 concerns integral normalization on chosen degree-stratum lattices; line 618 concerns supported derived ordinary complexes; line 1600 concerns the one-variable Klingen interpolation complex. Those are different from this package's full ordinary GL₂-frame coefficient comparison. Its line 1602 also keeps the marked Klingen correspondence and raw normalization p^(−3−r), consistent with R01's correction. The source-specific coefficient calculation here remains useful to that consumer; no derived Hida complex is replanned here.
- `packages/PELModuliPartII/design/README.md:1876` at d4bb48d is the unitary lattice-multichain local-model diagram, not this genus-two secondary invariant. `packages/ShimuraVarietiesPartII/design/README.md:252` at 57dc0a4 supplies a generic local-model interface; the present gaps ask for the particular rank-one equations and trace ideals beyond it.
- `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md:166` at 84a41ac restricts characteristic-zero symmetric powers to compact congruence groups; its line 1070 imports characteristic-zero highest-weight theory. Neither duplicates §8.3 in characteristic p.
- OverconvergentAutomorphicForms Layers 5–6 own analytic coefficient and Hecke comparisons; the algebraic integral ordinary coefficient interface here is distinct. No analytic-family construction is promised here.
- ReductiveGroupsPartII owns the general Lang theorem. Its missing citation is R02, not a reason to recreate it.

Neither fully qualified Lean declaration of this package was found in another readable roadmap. Searches did not locate a native transvectant, genus-two secondary Hasse carrier or integral Siegel/Igusa coefficient correspondence on which the omitted geometric headlines could be stated using only a few simple definitions. Quadratic-form Hasse invariants found by name search are different objects.

### Resolved supplier citations and order

Every Needs line and supplier paragraph was read. The following table records the present locations, not remembered citations from round 1. “Main” means the content checkout; a hash means the supplied open new-roadmap head.

| Supplier / revision | Sections resolved, with README line starts |
|---|---|
| SchemeAndStackFoundations / main | §0.6:678; §2.5:3388; §2.6:3437; §2.7:3482; §2.19:4094; §2.20:4275; §4.9:5448. These supply depth, colimits, ample vanishing, duality and proper formal functions; the open Milnor and lci fundamental-class additions remain gaps. |
| AlgebraicVectorBundles / main | L0A:215, L0B:228, L0C:254: tensor, dual, symmetric and determinant sheaves. |
| ModularForms / main | Layer 2:383–480: double-coset ring, finite cosets, degree and elementary divisors. |
| ClassicalArithmeticCompletion / main | §1.17:856: projective-zero count, including the zero-form exception. |
| AlgebraicModularFormsAndSerreWeights / 4e550b1 | R15.1:158, R15.2:338, R15.3:697, R15.4:1093, R15.5:1339, R15.6:1689: the parent scope and genus-one boundary. |
| ShimuraCompactifications / 63e3f03 | C3.8:1651, C3.9:1676; C5.3:2290, C5.4:2325, C5.10:2431, C5.12:2479, C5.16:2572, C5.17:2609, C5.23:2770. Spherical models, arbitrary-coefficient refinements, log Kodaira–Spencer, minimal Stein identity, ample powers and Koecher match the contracts. |
| AutomorphicBundles / 055b77e | B2.1:1319; B3.2:1751, B3.3:1798, B3.4:1822, B3.10:2019; B4.19:4384, B4.20:4413; B5.10:4887, B5.11:4940, B5.14:5033, B5.15:5103, B5.19:5255. Actual sheaf tensor, boundary and component hypotheses retained. |
| AbelianSchemesAndArithmeticModuli / 71ecc01 | A4.3:1841, A4.7:2041, A4.9:2269, A4.10:2287, A4.11:2315. Smooth-base de Rham and PD/nilpotent deformation hypotheses do not already supply all three requested genus-two extensions. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory / 34f4657 | R07.2.2:3028; R07.2.21:3751; R07.2.22:3798; R07.2.23:3845. Filtration, determinant LF, dual complexes and odd-prime quasi-polarization compatibility match the contract's restrictions. |
| HodgeTateAndCanonicalSubgroups / ed632e6 | §0.12:413, §0.14:452, §0.15:478, §0.16:493; §5.1:1536, §5.2:1559. Normalized character pullback and primary Hasse interfaces are present; the actual Igusa sections are Hilbert, not full genus-two frames. |
| OverconvergentAutomorphicForms / bc53e3c | Scope:5; Layer 5:842; Layer 6:947. An ownership boundary, not a hidden dependency on an analytic construction. |
| ReductiveGroupsPartII / 1383569 | RG2.3.7:5201, ordinary Lang statement:5203–5205. Required addition under R02. |

No upward dependency or cycle was found. The requested mechanical check was run unchanged and returned:

    depcheck: 49 roadmaps, 560 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The mechanical check cannot detect an omitted supplier edge such as R02; adding that edge still points from merge-order line 25 to line 276. No notion needs to be moved down from a later owner.

All eight plan gap slugs have the same named supplier and needs sentence in the README's exact-contract subsection. Their absence from a supplier today was not treated as a defect:

| Gap slug | Precise additional interface / minimality check |
|---|---|
| siegel-parahoric-models | Klingen/paramodular flat normal lci models, isogeny chain and compactified correspondence; existing spherical C5.3/C5.16 models are no longer requested. |
| siegel-rank-one-deformations | The genus-two Frobenius basis and principal/paramodular tangent equations, beyond the general PD and Serre–Tate equivalences. |
| siegel-isogeny-trace-ideals | Integral trace exponents 1,p,p³ and p²,p, including boundary compatibility; not supplied by a rational Hecke action. |
| siegel-logarithmic-de-rham | Semiabelian logarithmic connection, pairing, unit-root and superspecial first-order comparison, beyond the supplier's abelian smooth-base statement. |
| open-formal-milnor | qcqs open-formal derived inverse limits and their Milnor exact sequence; proper formal functions alone is insufficient. |
| lci-fundamental-class | Fundamental class and coefficient/boundary/reduction compatibilities for the specified proper equal-dimensional lci maps; identifying an invertible dualizing object does not already give this class. |
| reduced-section-propagation | Locally free restriction on reduced schemes dense in each component; distinct from depth-two Hartogs. |
| siegel-igusa-full-frames | Full ordinary GL₂(ℤ/pⁿ) torsors over coefficient thickenings/boundaries, with component detection; Hilbert unit torsors have the wrong group. |

Each is a coherent interface with a named earlier owner. None is an unowned prerequisite or a request for an existing pinned declaration. Since this verdict is needs changes, `conditional_gaps` is not used in review.json; the eight contracts remain valid independently of R01–R04.

### Lean acceptance test, headline coverage and shape

The headline inventory is §1.4 expansion/saturation; §§2.2–2.3 rank geometry/simple zeros; §§3.6–3.7 secondary extension/root; §§4.3–4.4 torsion shifts/two-affine cover; §§5.6–5.7 integral residual and corrected Q₂; §6.3 oriented reciprocity; §§7.4–7.6 Hartogs and integral T/Q₂ with finite and K/O coefficients; §§8.2, 8.4–8.7 theta, superspecial nonvanishing, negative-weight vanishing and low-weight injectivity; §§9.2–9.4 ordinary saturation, classical evaluation and Klingen comparison; and §8.3 small symmetric-power irreducibility.

The geometric headlines are each named in the module docstring with the missing integral model, sheaf, stratum, crystal, marked correspondence or Igusa carrier. No free predicate, arbitrary-endomorphism identity or sorry'd data stands in for them. Elementary formal identities and the imported projective-zero count are not absent deep headlines. The finite SL₂ irreducibility theorem is statable and is present.

The exact requested `lake env lean` invocation on the package's absolute Suggested.lean path was run from the content checkout. Both imported Tau Ceti object files were already available. It succeeded with exactly one warning, at `Suggested.lean:61:8`: declaration uses `sorry`. There were no other warnings or errors, and no Lean process was left running.

A separate copy containing `#check @standardSL2` and `#check @smallSymmetricPower_irreducible` was elaborated once. The resulting types are:

```lean
standardSL2 (p : ℕ) (k : Type) [Field k] [CharP k p] :
  Representation k (Matrix.SpecialLinearGroup (Fin 2) (ZMod p)) (Fin 2 → k)
smallSymmetricPower_irreducible (p : ℕ) [Fact p.Prime]
  (k : Type) [Field k] [CharP k p] (d : ℕ) (hd : d ≤ p - 1) :
  Representation.IsIrreducible ((standardSL2 p k).symmetricPower d)
```

Both agree with README §8.3. No binder was lost; the prime assumption is needed by the theorem, not by the carrier. The theorem's p≥2 makes its natural subtraction harmless. Its quantification over every characteristic-p field includes scalar extensions, so “absolutely irreducible” is not an algebraically closed-field shortcut.

There is one sorried theorem. Replacing its proof by the single tactic `simp` in a copy failed with `simp made no progress`. Reading the pinned irreducibility definitions and the other symmetric-power theorems confirms it is neither a definition unfolding, a boundary computation nor a one-library-lemma restatement. The definition is the one small real-body adapter the headline needs. No padding finding is warranted.

The README was compared with the main-branch SchemeAndStackFoundations, AlgebraicVectorBundles and ModularForms shapes. All nine layers have Examples and Dependencies. The 48 target subsections have prose statements and local dependencies; definitions retain API lists and at least three discriminating Checks. The two package Lean names appear in the README. Imports are one `import Mathlib` plus the two used pinned Tau Ceti modules. There are no `set_option` commands, sorry'd data, admitted examples, `lemma` declarations, source dumps, executable algorithms, route-only good-prime exclusions or new generic foundational carriers. The p=2 restrictions occur where the formulas require them, not as a global simplification. Metadata is the single math.NT topic and the sources manifest has eight distinct lifetime keys. No suspicious instruction in read material was followed.

## Not verifiable

- P20 is the manifest's author version dated 17 June 2019. The journal revision was not compared; this report certifies the author-version locators actually read, not later renumbering.
- Y16 is arXiv v5, as explicitly recorded. A different published numbering was not verified.
- The eight named supplier extensions are contracts, not claims of existing implementations. Their declarations, ownership and precision were checked; their future Lean proofs cannot be verified here.
- No cited text was inaccessible. No new source fetch or missing-reference request was necessary. The source manifest was left unchanged. No claim of truth is inferred merely from successful sorry elaboration.

## Source issues

The following source defects were checked against the cached texts. They are not additional package findings where the README already states the corrected mathematics. No published correction was established.

- **Error** in CG20 at Theorem 8.10, internal p.61 (journal 861), CG20 line 2425: the source allows k=p−1 under its numerical hypotheses; it should exclude that weight, since the nonzero Hasse form has zero theta; affects a stated result.
- **Error** in CG20 at Proposition 8.9(2), internal p.61, CG20 line 2417: the source inserts det(Q) into the vector contraction coefficient; it should use the contraction alone up to a normalization unit; affects a stated result.
- **Gap** in CG20 at Proposition 8.9, internal p.61, CG20 line 2400–2424: the source asserts the theta construction over O/ϖ^m with the same weight shift; it should restrict to characteristic p unless a separate thickening construction is supplied; affects a stated result.
- **Misprint** in CG20 at Lemma 8.4, internal pp.58–59, CG20 line 2306–2350: the source identifies determinant and binary-discriminant Legendre symbols; it should use the discriminant, since at p=3 their values on x²+y² are opposite; affects a stated result.
- **Misprint** in CG20 at Lemma 8.3, internal p.58, CG20 line 2266–2305: the source writes an unnormalized inverse-matrix integrality test; it should use the determinant-normalized inverse action on the binary index; affects nothing.
- **Misprint** in CG20 at the proof of Lemma 8.6, internal p.59, CG20 line 2354–2358: the source makes transformed determinants rationally zero; it should give det(R)=p²det(Q), hence zero only modulo p; affects nothing.
- **Misprint** in CG20 at §5.5, internal p.33, CG20 line 1365: the source uses the exponent k+j−6 for the large-weight second-operator comparison; it should use p^(3−k)T_(p,2) for the Z₂ congruence; affects nothing.
- **Gap** in CG20 at the proof of Lemma 8.20, internal p.72, CG20 line 2745–2830: the source identifies reversed cosets at arbitrary prime-to-p tame level; it should retain the reverse diamond transport, as Γ(5) at p=3 distinguishes the orientations; affects the proof.
- **Gap** in CG20 at the proof of Theorem 8.10, internal p.62, CG20 line 2438–2446: the source attributes a global secondary square root to Koblitz's local singularity discussion; it should supply polarization-based global construction and extension, or cite a global theorem; affects the proof.
- **Gap** in Y16 at the proof of Theorem 4.9, p.39, Y16 line 2129–2141: the source changes frame by an upper unipotent before applying the normalized superspecial expansion; it should preserve the dual-basis normalization or recompute the expansion in the new frame; affects the proof.
- **Misprint** in Y16 at equation (3.32), p.22, Y16 line 1224: the source places the determinant twist on Sym³E and leaves E untwisted; it should read Sym³E⊕(E⊗det E); affects a stated result.
- **Misprint** in P20 at §6.4, p.35, P20 line 1530–1536: the source reverses the stratum dimension and uses strict rank inequalities; it should use dimension r+1 and inclusive bounds for the closed/open rank loci; affects nothing.
- **Error** in P20 at Lemmas 6.3.3.3 and 6.3.3.5, p.33, P20 line 1451–1469: the source makes each multiplicative-side factor vanish on the entire complement; it should restrict that vanishing to multiplicative-rank loss, with the dual product detecting the whole complement; affects nothing.
- **Misprint** in P20 at the proof of Lemma 6.4.1, p.35, P20 line 1537–1565: the source uses Fe₂=pe₃ with its stated alternating pairing; it should use Fe₂=−pe₃ to give Frobenius pairing value p; affects nothing.

For the additional Y16 (3.32) witness, let 2I act over 𝔽₇. It acts on E⊗Sym²E by 2³=1, but on the printed summands by 2⁵=4 and 2. On the corrected summands both values are 1. This d=1 decomposition is not used by the package's d≥2 contraction, so it causes no package finding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0ed3696221cdd5cd04a7087e372714a353c8a9e8", "job": "REV-PKG-AlgebraicModularFormsAndSerreWeightsPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
