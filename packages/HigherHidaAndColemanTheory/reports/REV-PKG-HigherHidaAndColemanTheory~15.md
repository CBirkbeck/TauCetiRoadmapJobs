<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6885872700 -->
Review (codex) of 4e7895a

Verdict: needs_changes

1. **F01** (P2) Keep arbitrary determinant twists in the relative BGG sequence

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1609, §9.6(4): “For (k,r)∈ℤ_≥0², the two-term relative BGG sequence”.

   **Claim:** The sheaf exactness theorem is unnecessarily restricted to nonnegative r. The cited source explicitly states this construction for k≥0 and every integer r. Negative powers of the determinant line are legitimate coefficient bundles. Restricting this intermediate theorem to the weights needed for the later slope application loses part of the general library required by the review contract.

   **Witness:** Pilloni-Singular line 4104 and line 4118–4129, §13.3.2, pp.89–90, allow k≥0, r∈ℤ. At (k,r)=(0,−1), the sequence is 0→ω⁻¹→F^(0,w−)⊗ω⁻¹→F^(−2,w−)→0, a case the package excludes.

   **Exact repair:** Separate the sheaf theorem from its slope application. State the relative BGG sequence, its cuspidal version and its cohomological triangle for every k≥0 and r∈ℤ, with the same radius colimit. Explain that tensoring the r=0 sequence by the invertible line ω^r gives this generality. Then state the slope comparison under the hypotheses of the bound used to prove it; the nonnegative-r range in Pilloni-Singular §13.3, line 4035, must not be silently generalized merely by widening the exact-sequence statement. Make the r-domain of §9.6(1) explicit at the same time. No change to the r=2 application in §9.8 is needed.

   **Repair test:** At k=0,r=−1, trivialize ω locally. The map is d/dz: it sends 1 to 0 and z to 1, its kernel is the constant line ω⁻¹, and integration is surjective after shrinking the disc in the radius colimit. At p=3, D(f(3z))=3(Df)(3z), independently of r. Thus the missing case has the same exactness and normalization. This is a scope defect, not a claim that the currently stated nonnegative-r sequence is false.

## Verified sound

### Previous findings and the repair pass

Read the round-14 review and round-15 repair report before reviewing the package. All four preceding findings are repaired. None was marked “not actionable in this package”, and no maintainer notes were supplied.

| Previous finding | Repaired passage in packages/HigherHidaAndColemanTheory/README.md | Recomputed witness | Status |
|---|---|---|---|
| F01: continuous ℂ_p-weight transposed bounds missing | §6.6b:1188, “All three hold for every C, including ℂ_p”; §6.4:1115 states field-valued derived specialization; §6.6b:1186 states transfer of a strict violation. | For ν(4)=a transcendental in 1+9O_ℂ₃, thresholds −1 and 0 exclude −1/2 by the second bound and allow 0. The quantifier now includes this weight. | Repaired |
| F02: finite blocks asserted for a noncompact operator | §6.6a:1161, “For t∈T++ on the + side (t∈T−− on the − side …), acting through the potent compact operator of §6.3”. | U(zⁿ)=pⁿzⁿ has dim U≤2=3; identity has slope-zero polynomial truncations of dimensions 3,6,12 and an infinite-dimensional union. Only U meets the finite-block assertion. | Repaired |
| F03: algebraic transposition input followed its consumer | §5.5:945, “*Needs:* §5.3; §5.4a”; §5.4a precedes §5.5 and contains the finite-slope pairing. | At κ=(5,3;−8), w=1, t₂, the direct threshold is 0 and the transposed threshold is 3. Slope 2 passes the former and fails the latter. | Repaired |
| F04: split-point and connected-curve assumptions omitted | §6.6a:1172, “the spectrum of a finite étale L-algebra B”; :1176, “proper smooth geometrically connected curve X over F with a nonempty reduced effective divisor D”. | B=L×L has trace pairings ⟨e₁,e₂⟩=0 and ⟨e₁,e₁⟩=1. For ℙ¹ and D={∞}, the four dimensions are 1,0,0,2; a quadratic constant extension gives dimension 2 for H¹(ω). | Repaired |

The revised algebraic pairing does not depend on §5.5. The old §5.6(b) identifier is explicitly mapped to §5.4a at line 840. The analytic pairing retains finite-L topological duality; it does not infer unrestricted topological Serre duality over ℂ_p. Its scalar-extension/specialization argument instead uses a perfect slope complex and its total cohomological support.

I checked that specialization argument on its actual inputs. For a bounded perfect B-complex M, the image algebra of the commuting t₀ action on ⊕H^q(M) is finite over B. Equivariant hyper-Tor places every fiber eigenpacket on this spectral support. A strict violation gives a nonempty rational spectral subdomain after choosing a rational intermediate bound c′. A classical point has finite residue field. At that point choose the largest q with H^q(M) nonzero locally: Nakayama makes its Tor₀ term nonzero, higher incoming differentials have zero source, and outgoing differentials leave the spectral-sequence quadrant. An eigenpacket survives, possibly in another degree. This uses neither classicality nor §6.9. The degree-changing and irrational-slope controls are recorded below.

Searched the repaired patterns elsewhere: §§5.4a,5.5,5.6,6.3,6.4,6.6a–6.9,7.6 and 8.5 retain the appropriate compactness, pairing and coefficient hypotheses; §9.6 distinguishes a spectral stalk from a residue fiber. R01 arose while checking the generality of that latter section against its source.

### Coverage, principles and shape

Read all four package inputs, all 69 numbered target subsections and their 69 Needs lines, the ten plan gap records, the board-package index and the overlap data. For unchanged nonsampled targets, retained previous adversarial evidence only where the preceding report records actual values; checked the other passages afresh. The report table below covers all fifteen sampled targets, all ten headlines, changed targets and R01.

There are 24 construction API blocks and 41 Checks blocks. Every construction API block has at least three Checks (range 3–8). All nine layers end with Examples and Dependencies. Main-branch RigidAnalyticGeometry, SmoothRepresentationsOfLocalGroups and LieHighestWeight supplied comparison examples of the repository's shape. The target has mathematical layers, explicit routes and dependencies, and sources at its theorem statements. The compatibility-numbering table preserves old citations rather than cataloguing targets.

The roadmap retains dyadic integral Siegel theory, singular weights, rootless Coleman data, abelian-type data without an ordinary locus and the nonfinite height-one Klingen tower. The integral genus≥3 conjecture is distinguished from proved rational amplitude. No computational algorithm, copied source passage, sorry-valued data, set_option, admitted example, machine path or process narrative was found in the roadmap or Lean file. R01 is the remaining generality defect. The package is not a second copy of a roadmap on main.

### Seeded source verification

All four manifest texts were readable. Checked numbering, printed pages, assumptions and normalizations in the editions actually recorded; no author-flagged unverified locator requires another source. All cited works have manifest entries. The sources service did not need to add anything, and sources.toml was not changed.

| Sample | Text opened at its locator | Result |
|---|---|---|
| §1.1 weight dictionary | BP-Coleman line 90–162, 2379–2447, §§1.1,4.1, pp.2–4,50–51; BP-Hida §3.1, pp.33–34 | Left Weyl action, opposite parabolic, dominant coefficient convention, central parity and dual weight agree. |
| §1.2 relative slopes/classicality | BP-Coleman line 5675–5711, Theorem 5.9.6/§5.9.8, pp.122–123; line 6022–6042, Definition 5.11.2, p.130; line 6210–6229, Definition 5.11.14, p.134 | Relative order keeps its central condition. Geometric exclusion and coefficient BGG exclusion are separated; the flawed printed coefficient formula is not adopted. |
| §2.2 dynamical compactifications | BP-Hida line 374–386, Definition 2.1.15, p.8; line 392–505, Definitions 2.1.19,2.1.24,2.1.26, pp.9–11 | Set-theoretic support direction and ideal-power strictness are distinct. Identity and Frobenius tests have the stated directions. |
| §2.3 supported ordinary localization | BP-Hida line 864–951, Definition 2.4.2 and Lemmas 2.4.3–2.4.4, pp.18–19 | Finite ordinary factors, localization and limit/colimit hypotheses retained; finite slope is not substituted for integral ordinary localization. |
| §2.7 ordinary Serre duality | BP-Hida line 1150–1208, Propositions 2.7.2–2.7.3 and Theorem 2.7.4, pp.23–24 | Smoothness, local freeness, strict dynamics, transpose, boundary swap and degree shift retained. |
| §4.1 finite torus group-ring perfectness | BP-Hida line 2775–2845, Proposition 5.2.3 and level comparisons, pp.53–55 | The actual decomposable tower and cofinal finite quotients are used; no averaging by the group order. |
| §4.4 continuous admissibility | BP-Hida line 2842–2856, Proposition 5.2.7, p.55; line 2915–2956, Lemmas 5.4.1–5.4.2, pp.56–57 | Continuous regular functions, diagonal realization and inverse-action duality agree. Generic category theory is imported. |
| §5.1 finite-level Bruhat geometry | BP-Coleman line 4150–4197, Theorem 4.5.2, pp.88–89; line 4427–4490, Propositions 4.6.12,4.6.14–4.6.15, pp.94–95; line 4559–4575, Proposition 4.6.19, pp.97–98 | Finite-level domains, reductions, cyclotomic restriction and correspondence maps match; the abelian-type affinoid strengthening is a declared gap. |
| §5.7 Bruhat Cousin/interior | BP-Coleman line 5296–5331, Theorem 5.5.1, pp.113–114; line 5550–5617, Theorem 5.7.3, Corollaries 5.7.5,5.7.7,5.8.1, pp.119–121 | Filtration, spectral sequence and interior subquotient are retained; an image is not identified with either full endpoint. |
| §6.1 normalized torus action | BP-Coleman line 7170–7218, Lemmas 6.3.10–6.3.11, pp.155–156 | Uses the element t, including its unit part, with inverse distribution action and trace normalization. |
| §6.2 supported analytic family cohomology | BP-Coleman line 7235–7360, §6.4, Definition 6.4.7 and Theorems 6.4.8,6.4.10, pp.156–159 | Radius and geometric depths are separate; relative support intersection and the corrected negative depth are retained. |
| §8.2 ordinary Hida–Coleman comparison | BP-Hida line 3060–3078, Proposition 6.1.7, p.59; line 3107–3129, Proposition 6.1.11, pp.60–61; line 3177–3205, Theorem 6.2.9, pp.61–62 | Same supported object, integral ordinary factor, rational comparison and bounded-slope lattice are distinguished. |
| §8.3 family comparison | BP-Hida line 3220–3291, Propositions 6.2.12–6.2.14 and Theorem 6.2.15, pp.63–64 | Pole bound independent of coefficient reduction, explicit inverse-character map and derived family specialization agree. |
| §9.2 modular curve | BP-Coleman line 6535–6549, §5.14.2, p.141; BP-GL2 line 57–105 and following Theorem 1.4, Theorems 1.1–1.4, pp.2–3; §2.1, p.4 | Naive/integral/standard normalizations and strict endpoints agree. Degree-one family uses 2−k and k≥3. |
| §9.3 GSp₄ tests | BP-Coleman line 6550–6590, §5.14.3, pp.141–142; BP-Hida Proposition 5.6.3, p.58, Proposition 6.1.11, pp.60–61, Corollary 6.2.10, p.62 | Matrices belong to the specified torus; direct versus sharp bounds differ by the recorded amount. |

Additionally opened the changed pairing inputs: BP-Coleman line 5456–5505, Theorems 5.7.1–5.7.2, pp.117–118; line 7555–7657, Theorems 6.7.1–6.7.2 and their proofs, pp.164–167. The latter proof explicitly selects t∈T++ at line 7648 before forming finite slope blocks at line 7656. Opened Pilloni-Singular line 4035–4141, §§13.3.1–13.3.3, pp.88–90, for R01 and the BGG normalization, and line 4554–4577 and 4680–4693 for the neighboring extension/control statements.

### Computed adversarial table

These are calculations testing the stated laws and separating wrong conventions; they are not claimed proofs of the research theorems. Objects outside the standing hypotheses are negative controls, not purported geometric counterexamples. “Retain” means no repair of that row is needed.

| Statement | Instances tried | Values on the two sides / wrong model | Result and change |
|---|---|---|---|
| §1.1 weight dictionary; §9.1 | C₂, ν=(0,−2), four minimal left representatives | κ=(5,3),(5,1),(2,−2),(0,−2); the matching inverse gives (0,−2) four times. Duals reverse this list. | Retain. Central coordinate and parity still required. |
| §1.2 slope order | Cone ℝ≥0²; difference (−1,10); central difference 1 | First coordinate −1<0 despite second 10>0; central difference 1 prevents comparison. | Retain both the root cone and central condition. |
| §2.2 strict dynamics | I=(t), t↦t^p, p=2,3; identity | Pullback I=(t²),(t³), contracting ratios 1/2,1/3. Identity would require a≥b with a/b<1, impossible. | Retain; set equality alone does not prove strictness. |
| §2.3 ordinary localization | A=ℤ/9, T=3,1; zero module | 3²=0 gives ordinary part 0; T=1 gives A; zero gives 0. On ℚ₃, eigenvalue 3 has finite slope 1. | Retain distinction between ordinary and finite slope. |
| §2.7 transposed duality | X=ℙ¹ over 𝔽₂, no boundary; d=1 | RΓ(O)=𝔽₂[0]; RΓ(Ω¹[1])=𝔽₂[0]; evaluation is multiplication. Omitting [1] moves the dual degree. | Retain smooth/strict hypotheses and top-degree shift. |
| §2.8 compact dynamics | {a,b,c}, f(a)=a,f(b)=a,f(c)=b; remove a | T² has one-dimensional image; full functions have dimension 3; deleting one point leaves dimension 2 and removes the constant-attractor factor. | Retain the corrected cross-containment and compact support. |
| §3.2 normalized action | GL₂ at p=3; t=diag(2,3),diag(2,6) | Character ratios 3/2 and 3; valuation 1 in both. Replacing the first scalar by pure p-power gives 3 rather than 3/2. | Retain the unit character, including when it happens to equal 1. |
| §§3.8,6.10 Hecke action | GL₂, ℓ=2,3; two matrix units | 9=6+3 and 16=12+4 in the rank-two relation. E₁₂E₂₁=diag(1,0), reverse=diag(0,1). | Commutativity comes from the Hecke algebra, not End. |
| §4.1 group-ring perfectness | Γ=C₂, char 2; regular and trivial modules | k[Γ] is free of rank 1. For trivial k, Tor_i^(k[Γ])(k,k)=k for every i≥0. | Retain torsor/projective hypothesis; finite underlying module is insufficient. |
| §4.1 dyadic descent | Γ=C₂ over ℤ₂ and ℚ₂ | Augmentation of invariants sends a(1+g) to 2a: image 2ℤ₂, but image ℚ₂ after inversion. | No division by 2 in integral descent. |
| §4.4 admissibility/duality | C⁰(ℤ_p,ℤ_p); f(x)=x; degree i | f has infinitely many values and is not locally constant; continuous measure dual is ℤ_p[[ℤ_p]]. Dual grading i↦−i↦i. | Retain continuous, not discrete regular functions. |
| §4.6 derived control; §6.4 | B=F⟨s⟩, [B --s→ B] in degrees 0,1 | Family H⁰=0,H¹=B/(s); fiber s=0 has H⁰=H¹=F. Tor₁(B/(s),F)=F. At s=a≠0 both fiber groups and both Tor groups are 0. | Retain derived tensor; excludes underived control. |
| §4.8 Iwasawa duality | g=2,d=3, ℓ=1; g=1 weight k=3 | Complementary degree 2, sum 1+2=3; target shift [−3]. Curve dual weight 2−3=−1. | Retain degree, inversion and boundary twists. |
| §§4.9,8.4 amplitudes | g=1,2,3 | d=1,3,6. At g=2,ℓ=1: cusp [0,1], canonical [1,3], intersection {1}. | Integral assertion only in proved genera; rational assertion covers g=3 as well. |
| §5.1 finite-level geometry | Rootless torus; boundary depth n=m,m′=1 | Flag dimension 0, one cell, identity period target. Depth condition 0≤n−m≤m′−1 becomes 0≤0≤0; m=0,n=1 fails it. | Retain actual finite-level conditions. |
| §5.1 nonsplit reduction | Conjugate factors over an unramified quadratic extension | Rational pairs are (a,a^σ); (1,1) occurs, (1,0) does not. | Retain rational-image condition; independent split coordinates overcount. |
| §5.4a algebraic pairing | κ=(5,3), κ∨=(0,−2); eigenvalue p² | Dual weight −w0Mκ−2ρ_nc=(0,−2). Adjoint t and t⁻¹ both have eigenvalue p², slope 2; character valuations on the same group element are opposite. | Same cutoff pairs the blocks, not opposite cutoffs. |
| §5.5 four bounds | w=1, κ=(5,3;−8), t₂ | Direct threshold 0; transposed threshold 3. Slope 2≥0 but 2<3; slope 3 meets both. | Previous F03 repaired by §5.4a. |
| §5.7 Cousin/interior | d=3,ℓ=1; maps F→F | Source range [0,1], target [1,3], intersection {1}. Identity has image dimension 1; zero map has image dimension 0. | Retain image/subquotient, not whole endpoint or direct sum of columns. |
| §5.8 singular classicality | κ=(2,2) in C₂ | κ+ρ=(1,0) is singular; compatible lengths include 0 and 1, so interval [0,1], not one degree. | Retain singular spectral-sequence statement. |
| §6.1 normalized analytic action | Unit 2; eigenvalue p² with twist p⁻³ | ν(2)=2, inverse action=1/2, product=1. Twisted eigenvalue=p⁻¹, slope −1 instead of 2. | Retain the unit and trace characters. |
| §6.1a projective coefficients | Quotient A²→A²/{±1} in char 0 | Generic fiber length 2; origin fiber has basis 1,x,y, length 3. | Finite quotient alone is not finite flat; retain regular-target/trivializing-cover argument. |
| §6.2 analytic allowed supports | p=3, depth 1, C=2; z=3,9 | v(3)=1, v(9)=2; U with v(z)>1 contains 9 but not 3, while v(z)>2 excludes 9. Intersecting the lower tube with U gives the relative condition. | Retain relative support; absolute inclusion would fail. |
| §§5.2,6.2 rootless case | Torus, empty roots, empty support | min=max=C=1 by convention; all tubes=X, allowed full pair U=Z=X. Empty supported cohomology=0. | No undefined extrema over an empty root set. |
| §6.5 analytic BGG | SL₂, κ=1, p=2,3 | D²(1)=D²(z)=0,D²(z²)=2≠0. Twisted t-eigenvalues at p=3 on 1,z are 1/3,3, slopes −1,1. | Characteristic-zero coefficients and twists retained. |
| §6.6a compact blocks | U(zⁿ)=pⁿzⁿ versus identity | dim U≤2=3; identity slope-zero truncations=3,6,12, unbounded. | Previous F02 repaired. |
| §6.6a torus pairing | B=L×L | Tr(e₁e₂)=0; Tr(e₁²)=1; each space has dimension 2. | Previous F04 repaired; no implicit single-point assumption. |
| §6.6a boundary pairing | ℙ¹_F,D={∞}; ℙ¹_E over F, [E:F]=2 | Dimensions H¹(ω),H¹(ω(D)),H⁰(O(−D)),H¹(ω(−D)) are 1,0,0,2 over F in the first case; H¹(ω) has dimension 2 in the second. | Geometric connectedness excludes the wrong constant field. |
| §6.6b four analytic bounds | C₂,w=1,ρ=(−1,−2) | a_an=(3,3), b_an=0; a_an+2ρ_nc=(0,0)=−b_an. Correct second negative bound (−3,−3), printed one (−2,−1). | Retain corrected +ρ and transpose. |
| §6.6b nonrigid weights | p=3,ν(4)=a transcendental in 1+9O_ℂ₃ | Direct/transposed thresholds −1,0; −1/2 passes only the first, 0 passes both. | Previous F01 repaired; complete-field quantifier matters. |
| §6.6b degree-changing specialization | [B --s→ B], t₀=p⁻¹, fiber s=0 | H⁰=H¹=F, both slope −1; family support N=H¹=B/(s). Largest nonzero local degree q=1 survives; the initial fiber degree can be 0. | Route transfers occurrence, not a chosen cohomological degree. |
| §6.6b strict spectral locus | Gauss point with v(s)=r irrational; t₀=s | Nonrigid slope r; every rigid slope rational. Choose r≤c′<c rational to obtain rigid slope ≤c′<c; no rigid slope equals r. | Retain inequality transfer, not exact-slope transfer. |
| §7.1 eigenvariety | Acyclic [F --1→ F] versus F in degree 1 | Total cohomological support empty versus one point. | Annihilator support excludes acyclic padding. |
| §7.5 equidimension | T=A[ε]/ε² versus A/(s) | First finite algebra free rank 2, dim T=dim A; second has dimension dim A−1. | Faithfulness/torsion-free input prevents lower-dimensional vertical support from being treated as the interior theorem. |
| §7.6 sharp interior slopes | GSp₄ middle chamber, κ=(5,3;−8) | Direct t₂ threshold 3; sharp threshold 4; slope 3 is below 4 but not below 3. | Retain sharp interior argument rather than replacing it by the direct estimate. |
| §8.2 ordinary comparison | Eigenvalues 1,p,0 on a line | Slopes 0,1,∞; integral ordinary ranks 1,0,0; rational finite-slope ranks 1,1,0. | Comparison does not identify all finite slopes with ordinary ones. |
| §8.3 family comparison | u=4,k=1 and k=0 | Inverse-character specialization 1/4 versus 4 at k=1; both 1 at k=0. | Keep explicitly labeled Λ→A map; trivial weight alone would not detect inversion. |
| §8.5 sharp Siegel slopes | κ=(5,3;−8), middle chambers | Naive direct bounds 3,3; sharp bounds 4,4. Slope 3 passes sharp classicality but not direct classicality. | Retain integral comparison producing the improvement. |
| §9.2 curve thresholds | k=2,0,1 | Standard thresholds 1,1,0 respectively in their stated degree conventions; equality slope 1 excluded in the first two. Dual k=3 goes to −1. | Strict inequalities and degree-one duality agree. |
| §9.3 GSp₄ normalization | κ=(5,3;−8), p=3 | A_w=(0,2;−8),(−2,2;−8),(3,−3;−8),(−5,−3;−8). t₁ pairings 6,6,11,11; t₂ pairings 3,4,4,8; standard t₂ values 0,1,1,5. | Retain full coordinates. At k₂=3, <1 admits 0, excludes 1. |
| §9.3 torus membership | Correct and misprinted diagonal | Correct opposite-coordinate products both 1/9; misprinted matrix products 1 and 1/9. | Only the corrected matrix lies in the stated GSp₄ torus. |
| §9.6(4) arbitrary determinant twist | k=0,r=−1; local trivialization | ω⁻¹→F⁰⊗ω⁻¹→F⁻²; D(1)=0,D(z)=1; target determinant exponent k+r+1=0. | R01: valid exact sequence currently excluded. |
| §9.6 radius colimit | p=2, f=Σ2^m z^(2^m−1) | Coefficients 2^m→0; antiderivative coefficients at z^(2^m) equal 1, not tending to 0. On radius ρ<1 their norms ρ^(2^m)→0. | Retain colimit; fixed closed-disc surjectivity is false. |
| §9.6 spectral localization | F[y]/y² | Primary space dimension 2; residue dimension 1; Tor₁ dimension 1. | Retain derived weight fiber followed by spectral localization. |
| §9.7 extension thresholds | k=0,r=2 | Geometric threshold 1; all-degree minimum min(1,−2)=−2; degree-zero minimum min(1,1)=1. | Ordinary slope 0 belongs only to the latter comparison window. |
| §9.8 Klingen control | p=3, parameters (1,1,9,9); p=2 torsion range | Spherical eigenvalue 20 has valuation 0; Klingen values 2,10,10,18 have valuations 0,0,0,2. At p=2, k=4 satisfies k>3, k=3 does not. | Nonnegative valuation and strict torsion range retained; rational k=0 control remains included. |

### Lean, headlines and pinned declarations

The ten headline theorems named at README:304 all occur in the module docstring, with a missing geometric carrier rather than a free-predicate substitute:

| Headline | Docstring coverage and missing carrier |
|---|---|
| §4.6 derived arithmetic Hida control | Lines 10–15: integral Siegel/Igusa geometry and the supported universal complex. |
| §4.8 integral Iwasawa duality | Lines 10–15: same complexes with their geometric coefficient/duality data. |
| §4.9 integral amplitude, genera 1 and 2 | Lines 16–18: actual universal Iwasawa complex. |
| §8.4 all-genus rational amplitude | Lines 16–18: universal complex and analytic comparison. |
| §5.8 regular/singular classicality | Lines 19–21: Shimura varieties, period maps, Bruhat tubes and their Cousin complex. |
| §7.1 cohomological eigenvariety | Lines 22–24: rigid weight space and analytic family cohomology. |
| §7.5 interior equidimension/deformation | Lines 22–24: same actual family and interior support. |
| §7.6 sharp interior slopes | Lines 25–27: finite-slope supported geometric cohomology. |
| §8.5 sharp Siegel slopes | Lines 25–27: also the integral supported analytic model. |
| §9.8 Klingen two-term control | Lines 28–31: Klingen threefold, height-one tower and one-variable partial-ordinary complex. |

Suggested.lean has zero named declarations, zero definitions and zero sorried theorems. The exhaustive one-tactic probe and the mechanical `#check @name` comparison each have zero candidates. No signature or section binder is hidden by a sorry. There is no padding and no statable headline missing: the native generic category/module carriers do not supply these geometric objects. The single import is `import Mathlib`; no Tau Ceti object-file build is needed.

Ran `lake env lean` on packages/HigherHidaAndColemanTheory/Suggested.lean from the pinned content checkout. **Exit 0, empty output, no warnings.** No Lean process remains running.

Opened these declarations at Mathlib pin `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`, rather than trusting the citation resolver:

| Declaration | File and line at the pin | What it does and does not supply |
|---|---|---|
| Module.End | Mathlib/Algebra/Module/LinearMap/End.lean:33 | Linear endomorphisms with Semiring, AddCommMonoid and Module binders; not a commuting Hecke action. |
| zpow_sub₀ | Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402 | Integer-power subtraction requires a≠0. At a=3,m=−1,n=2 gives 1/27 on both sides. |
| HasDerivedCategory; DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74 and :87 | Chosen localization of cochain complexes of an abelian category; not Shimura coherent cohomology. |
| CondensedMod; abelian instance | Mathlib/Condensed/Module.lean:41 and :43 | Module-valued sheaves on CompHaus with coherent topology. |
| CondensedMod.IsSolid | Mathlib/Condensed/Solid.lean:83; documentation :74 | Inverts profinite solidification maps; documentation limits the direct predicate for general coefficients. No relative analytic localization follows. |
| IsHeckeTriple; HeckeCoset; HeckeRing | Mathlib/NumberTheory/HeckeRing/Defs.lean:75, :157, :189 | Commensuration, double cosets and finitely supported coefficients. The module carrier is not itself the missing convolution theorem. |
| HeckeCosetModule.instRingHeckeRing | TauCeti/NumberTheory/HeckeRing/Associativity.lean:484 | Ring structure for a Hecke triple and a coefficient ring; imported rather than restated. |
| HeckeCosetModule.mul_comm_of_antiInvolution | TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459 | Requires an anti-involution fixing every double coset. It does not construct that datum for every reductive group. |

Object searches at both pins covered Igusa towers, Shimura geometry, supported coherent complexes, solid/analytic localization and higher ordinary/finite-slope families. The hits include generic condensed/derived categories, abstract Hecke rings and classical modular-form Hecke computations, not the missing geometric carriers. Every backticked name claimed from the libraries was resolved; the README claims no undeclared local Lean identifier.

### Ownership, supplier order and gaps

Read the board package index before testing absence on main. Used the roadmap service for object searches, citation resolution and reading the named open heads. The resolver reports no citation or local Lean identifier found nowhere; its library limitation was covered by direct pin reads. The 25 supplier groups were resolved again, including the newly consumed RigidAnalyticGeometry and LocallyAnalyticDistributions scalar-extension inputs.

| Supplier | Resolved contract sections / distinction |
|---|---|
| AdicSpacesPartIII, main | R3.1,R3.4,R3.6,R3.8: coherent acyclicity, quasi-Stein comparison, compact restriction and finite locally free trace. Banach strengthening remains declared. |
| AdicSpacesPartIV, main | F1.10: supported coherent dagger duality with its field hypotheses; no unrestricted ℂ_p topological duality imported. |
| AlgebraicModularFormsAndSerreWeightsPartII, #1822 | §§7.1–7.4: hyperspecial spherical integrality and codimension-two restriction; this package adds Klingen counterparts. |
| AutomorphicBundles, #1069 | §§1.4–1.5,1.9,3.3,5.2–5.4,5.10,6.1,9.1,11.10,11.16–11.17,12.1,12.11: coefficient torsors, bundles, BGG and section operators. |
| AutomorphicBundlesPartII, #1823 | §§2.2,2.4–2.5,3.0a–3.0b,3.1–3.3,3.6,3.9–3.13,4.4,5.1–5.2: coherent operations and models; partial-support enhancement is a gap. §5.13 does not own the present supported analytic actions. |
| AutomorphicFormsOnReductiveGroups, #1037 | §6.7: Siegel coherent chambers; the general cohomological dictionary here is a distinct extension. |
| CompletedCohomologyPartII, #1035 | §§3.11–3.12: continuous admissible category and measure/Iwasawa realization; this package proves the geometric tower meets its hypotheses. |
| DeformationAndDerivedPatchingAlgebra, #1034 | §§7.1,7.3,7.5–7.6,7.8,7.10: Tor, finite models, signed duality and coefficient spectral sequence. |
| HodgeTateAndCanonicalSubgroups, #1084 | §5.1 is the named owner of the two explicitly declared tower extensions. |
| IntegralHeckeAndGaloisDeterminants, #1689 | §§2.1,2.3: finite derived action images and Fitting ordinary parts, without a projectivity assumption on cohomology. |
| LocallyAnalyticDistributions, #854 | §§3.3,4.2,4.16–4.17: character spaces, completed Banach scalar extension, finite slope windows and stage comparison. §4.2 accepts the continuous Noetherian Banach map B→C used here. |
| OverconvergentAutomorphicForms, #1422 | §§0.4,8.6–8.7: analytic induction and coefficient sheaves. General abelian-type projectivity is proved in this package's §6.1a, not inferred from the Hodge-type premise. |
| PELModuli, #966 | M2.8–M2.9,M5.1–M5.2,M5.5–M5.6: moduli and datum inputs. |
| PadicFamilies, #1019 | §§0a.24–0a.25,2a.8–2a.17 and Layers 0a,0,2a: ordinary/spectral machinery. Higher supported cohomological applications here are distinct. |
| PadicMeasuresIwasawaAlgebras, main | §§1.1,1.7: finite coordinates and continuous measure algebra. |
| PerfectoidShimuraVarieties, #1085 | §§3.13,4.5,6.3–6.10,6.12–6.15, including 6.13a: towers, period maps, reductions and descent. The nonsplit image input of 6.13b is retained by 6.14. |
| PhiGammaModulesAndIwasawaCohomology, #1310 | §2.7: compact character space, universal character and inversion. |
| ResolutionOfSingularitiesCharacteristicZero, main | §6.3: Cartier separation by ideal-sum blow-up, including its arbitrary-scheme scope. |
| RigidAnalyticGeometry, main | §§1.1,1.2,8.2: finite affinoid extensions, finite residue fields and classical points of nonempty rational subdomains. These provide the specialization step of §6.6b. |
| SchemeAndStackFoundations, main | §2.20: coherent relative dualizing complex and smooth top differential form. |
| ShimuraCompactifications, #1053 | §§0.14,4.10,6.16–6.17,7.19–7.21,7.29: refinements, Klingen span, model/boundary inputs and canonical line; lci moduli strengthening remains a gap. |
| ShimuraData, #1038 | §§3.8,3.10,3.13,5.5–5.6,5.10–5.11: flags, minimal left representatives and explicit C₂ conventions. |
| SolidAnalyticRings, #1458 | §§7.2–7.4: coefficient/scalar-change interfaces; relative localization and discrete-adic comparison are separately declared. |
| LieHighestWeight, main | Layer 3 in TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md: PBW/Verma inputs, not analytic BGG exactness. |
| SmoothRepresentationsOfLocalGroups, main | SR.0.2,SR.1.2,SR.1.4,SR.2.2,SR.3.1,SR.3.4,SR.4.1,SR.4.5: smooth category, Hecke algebra, Iwahori/principal-series theory and Satake. |

Specific ownership witnesses: TauCetiRoadmap/AutomorphicBundlesPartII/README.md:453, :736 and :1104 at #1823 distinguish solid operations, individual Hecke operators and hyperspecial relations; TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1467 and :1499 at #1422 supply analytic coefficients; TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:2269, :2303 and :2323 at #1085 supply truncated period geometry, reductions and their maps. Main TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1220 and :3191 supply the Hecke comparison and Satake. These objects are imported, not re-owned here.

Read the scopes of the closest roadmaps at their actual heads. TauCetiRoadmap/PadicFamiliesPartII/README.md:7 and :11–13 at #2280 explicitly imports this theory and owns its Hilbert/singular extensions. Its sentence about an older negative exponent in this package's §9.6 is stale: current line 1609 has the correct positive factor. That does not require a package edit. TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7–13 at #1817 owns the selected modularity-lifting application, not the supported universal complexes. No conflicting open head, dropped cited identifier, unmapped removed identifier, open-revision-only dependency or second-copy case was found in the supplied overlap data or the files read.

All ten gap slugs agree between the README and packages/HigherHidaAndColemanTheory/design/plan.json: solid-localization-kernel, discrete-adic-solid-comparison, siegel-ordinary-igusa, klingen-height-one-igusa, abelian-affinoid-basis, projective-banach-cohomology, banach-support-duality, coherent-correspondences, abelian-subcanonical-vanishing, klingen-lci-model. They have named earlier suppliers and concrete interfaces. Their requested compatibilities are parts of the same constructions, and the contracts distinguish the missing extensions from the supplied cases. None was counted as unowned merely because unfinished.

The requested mechanical dependency check returned:

```text
depcheck: 244 roadmaps, 2217 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. No forbidden supplier is used. Read every Needs line for statement-level direction as well; in particular the repaired §5.4a→§5.5 and §§6.3–6.4→§6.6b routes are forward and do not depend on the later classicality conclusions.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties and main SmoothRepresentationsOfLocalGroups; Hecke algebra/Satake belongs to SmoothRepresentationsOfLocalGroups, coherent correspondence operations to AutomorphicBundlesPartII, analytic coefficient sheaves to OverconvergentAutomorphicForms, period/Bruhat/torsor geometry to PerfectoidShimuraVarieties, and higher supported family complexes to HigherHidaAndColemanTheory; the other two import or extend these objects in their stated settings.

### Source wording, arrangement and reuse

Compared the fifteen sampled passages and five further passages (§§3.2,5.4a,6.6a,6.6b,9.6) to their source wording. Also inspected the Lean docstring's description of missing carriers. Coinciding formulas, standard names and necessary hypothesis lists do not constitute copied prose. Found no copied sentence, clause-by-clause paraphrase, figure, exercise collection or externally copied Lean declaration.

Counted named source occurrences in the README, including references and source-issue discussion: BP-Coleman 74, BP-Hida 55, Pilloni-Singular 28, BP-GL2 3, total 160. A named citation with several numbered locators counts once. Compared BP-Coleman's contents at line 18–76 against the roadmap. Layer 5 combines source §§4.5–4.6,5.4,5.7,5.9,5.6,5.5/5.8,5.12; Layer 6 combines §§6.3,4.4/6.6,6.4,6.1,6.2,6.5,6.7,6.8,6.6/6.9. This is not a consecutive one-to-one replication of scope and order. The dependencies §6.2←§§5.2–5.3 and §7.1←§§6.3,6.9,6.10 require geometry before families before eigenvarieties. Layers 2–4 and 8 also use BP-Hida, and Layer 9 combines Pilloni-Singular and BP-GL2.

Source independence: 20 passages compared with 4 sources, no copied prose found; largest share BP-Coleman, 74 of 160 named citation occurrences; contents compared with BP-Coleman: independent.

## Not verifiable

- None of the requested source samples was inaccessible. All four legal cached editions and BP-Coleman's contents were readable. No missing-reference request is necessary.

## Source issues

- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, pp.134,168: the source identifies printed coefficient inequalities with BGG exclusion without the needed computation; it should derive exclusion from the shifted BGG terms and corrected analytic bounds; affects the proof.
- **Misprint** in BP-Coleman at Theorem 6.4.3 proof, p.157: the source leaves a compactness lemma citation unresolved; it should identify the geometric contraction and coefficient-action inputs; affects the proof.
- **Misprint** in BP-Coleman at Definition 6.4.7, p.158: the source uses coefficient radius n in one negative geometric support depth; it should use geometric depth l consistently with the other support inequalities; affects a stated result.
- **Error** in BP-Coleman at Definition 5.4.10, Example 5.4.11 and Definition 6.4.7, pp.111–112,158: the source requires an absolute lower tube inclusion incompatible with its advertised standard pairs; it should intersect the lower tube with U; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, p.32: the source shifts an already degree-d supported complex again and later writes Ω¹; it should omit the extra shift and use Ω^d; affects a stated result.
- **Misprint** in BP-Coleman at §5.14.2, p.141: the source puts a minus before the long-cell character pairing while giving value k; it should omit that minus, since the pairing itself equals k; affects a stated result.
- **Misprint** in BP-Coleman at §5.14.3, p.141: the source's t₁ diagonal has unequal symplectic opposite-coordinate products; it should have final entry p⁻¹ in the displayed anti-diagonal convention; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), p.167: the source omits +ρ from the second negative upper bound; it should read −w⁻¹ρ+ρ+w⁻¹2ρ_nc; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, pp.57,64: the source leaves the family base-change character unlabelled despite its inverse-character arithmetic convention; it should specify the Λ→A map including inversion; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, p.90: the source scales the BGG target operator by p^(−k−1); it should scale it by p^(k+1), giving the following corollary's thresholds; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, p.102: the source claims strictly positive valuations; it should claim nonnegative valuations, as its contradiction argument and valuation-zero examples require; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4e7895a6a1064752eef91b75c80b64ab400afe77", "job": "REV-PKG-HigherHidaAndColemanTheory~15", "model": "gpt-6-astra", "worker": "chris-9"} -->
