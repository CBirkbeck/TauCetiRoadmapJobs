<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6451310909 -->
Red team round 2 pass a (codex) of 43997ea

Verdict: needs_changes

1. **F01** (P2) The standing additive character may be trivial

   **Location:** `packages/TwistedAutomorphicDescents/README.md:23`: “Fix ψ_F on F\A_F, trivial on F and unitary”; see also §§0.3, 2.4.

   **Claim:** The induced split-place character is nontrivial on both factors and the resulting character realizes the specified rational nilpotent orbit.

   **Witness:** Take ψ_F=1, d=3, ℓ=1. Then ψ_ℓ,w(n)=1 for every n, so this is the zero Fourier character, of partition [1,1,1], not [3]. JZ2020 line 799 requires nontrivial ψ_F.

   **Exact repair text:** “Fix a nontrivial continuous unitary additive character ψ_F of F\A_F, and use its local components throughout.” Add the Check: “For d=3, ℓ=1 and ψ_F=1 the character is trivial and does not represent the regular orbit [3]; this datum is excluded.”

   **Retest:** The trivial character fails the added hypothesis. For a nontrivial local component and a nonzero final coordinate, the character is nontrivial; at a split place the two coefficients 1/(2t) and −1/(2t) are nonzero.

2. **F02** (P1) Regularized torus periods can have poles where Eisenstein series are holomorphic

   **Location:** `packages/TwistedAutomorphicDescents/README.md:424`: “it is holomorphic wherever this Eisenstein family is holomorphic”; also the pole-order argument at line 730.

   **Claim:** The added split-SO₂ regularization preserves the original holomorphy and Laurent-order argument.

   **Witness:** On SO₃≅PGL₂, take a=1, W a line, ℓ=0, trivial inducing/test characters. With u=s+1/2, E(z,u) is regular at u=0, but its regularized split-torus integral is Λ(u)²/Λ(2u)∼−2/u.

   **Verification:** Here Λ(u)=π^(−u/2)Γ(u/2)ζ(u), with residue −1 at 0. For Re(u)>1, subtract y^u+y^(−u) from E(iy,u). The remaining coprime positive (c,d) terms integrate to Γ(u/2)²ζ(u)²/(Γ(u)ζ(2u))=Λ(u)²/Λ(2u); the regularized integrals of the two subtracted powers are zero. Meromorphic continuation gives the stated pole. E(z,0)=1. The test character is cuspidal on the split torus because it has no proper parabolics. This is within §2.1, which does not impose a discrete generic parameter on that test character. The family reaches precisely the zero-exponent obstruction already recognized at lines 307 and 314.

   **Exact repair text:** Replace the last API bullet of §2.1 by: “For holomorphic sections Z is meromorphic. If G has trivial F-split centre, it is holomorphic wherever E is holomorphic. For split SO₂ it is holomorphic only where E is holomorphic and every occurring asymptotic exponent stays away from zero; at exponent collisions retain the poles and Laurent coefficients of the exponent corrections.” Add before the §4.5/§4.6 order and residue arguments: “In the split-SO₂ case first compute the exponent-correction Laurent terms and prove the required pole bound and coefficient comparison including them; passage of the leading coefficient through the regularized period is a separate target, not a consequence of Eisenstein holomorphy.”

   **Retest:** At u=0 the zero exponent prevents the repaired holomorphy assertion; the correction contributes a simple pole although E is regular. Thus the repair retains this case rather than silently using the convergent-period proof.

3. **F03** (P2) The new auxiliary-induction contract misidentifies its parabolic

   **Location:** `packages/TwistedAutomorphicDescents/README.md:94`: “from the maximal parabolic of SO(W⊥H^t) with Levi GL_t×SO(W)”; the same wording occurs in the plan's `orthogonal-auxiliary-induction` gap.

   **Claim:** That maximal parabolic exists for every nondegenerate W and every t≥1.

   **Witness:** t=1,W=0 gives SO(H)=G_m, which has no proper parabolic. For W=H,t=1, SO₄'s isotropic-line stabilizer has Levi GL₁² and is a Borel, not a maximal parabolic.

   **Exact repair text:** In both copies replace “from the maximal parabolic of SO(W⊥H^t) with Levi GL_t×SO(W)” by “from the parabolic stabilizing the chosen t-dimensional totally isotropic subspace of H^t, with Levi GL_t×SO(W); allow the whole group when there is no proper parabolic.” Add these two boundary computations to the contract's Checks.

   **Retest:** For W=0,t=1 induction is induction from G_m to itself, hence τ|·|^s. For W=H,t=1 it is induction from the Borel of SO₄. Both have the required Levi without the false maximality assertion.

4. **F04** (P3) Some definition Checks still repeat the specification

   **Location:** `packages/TwistedAutomorphicDescents/README.md:229`: “No hyperbolic vector normal form is asserted for an anisotropic middle space”; :547: “The two cases have different quotient domains”.

   **Claim:** The definition Checks discriminate the intended constructions from plausible wrong ones, with at least three such tests per definition.

   **Witness:** In §0.4, lines 229 and 231 test the same excluded anisotropic boundary, leaving only two distinct instances. In §3.1, lines 547–550 restate the domains, linearity, index rule and continuity requirement without testing quotient-character cancellation.

   **Exact repair text:** Replace the first §0.4 Check by: “Over Q with q(x,y)=2xy, w=(2,3/4) and y₃=(1,3/2) both have value 3. The determinant-one isometry diag(1/2,2) sends w to y₃ without adjoining √3.” Replace the §3.1 Check block by: “In the normalized split-U₂ spherical fixture of §3.4 at s=1/2, q=2 gives Z_v=3 and q=3 gives Z_v=2. Rescaling its inner functional by 2 at q=2 gives 6. If a quotient translation has ψ(n)=i, the two equivariance multipliers are i and −i, with product 1; using ψ on both sides instead gives −1 and fails quotient invariance. For (a,ℓ)=(1,1) the second branch has inner index 0, whereas (a,ℓ)=(2,1) uses the first quotient and inner index 0.” Move any retained specification reminders into the API prose.

   **Retest:** q(w)=3=q(y₃), det(diag(1/2,2))=1. The integral fixtures give 3,2,6; the correct and incorrect character products give 1 and −1. These distinguish proper transport, normalization and the quotient law.

5. **F05** (P3) The anisotropic-SO₂ Check fixes a real signature the datum does not fix

   **Location:** `packages/TwistedAutomorphicDescents/README.md:1013`: “For n=1 and anisotropic smaller SO₂, the ambient signature dimensions are (4,2), total 6”.

   **Claim:** Every allowed anisotropic two-dimensional smaller form gives that ordered real signature.

   **Witness:** Over Q take W with q=−x²−y². It is anisotropic. At the real place H²⊥W has signature (2,4), not (4,2). If W is globally anisotropic but real-split, the signature is (3,3).

   **Exact repair text:** Replace the Check by: “For n=1 the ambient form is H²⊥W, of dimension 6 and global Witt index 2. At a real place its signature is (4,2), (2,4) or (3,3) according as W is positive definite, negative definite or split. In all three cases a=2,k₀=1 and the critical partition is [3,1,1,1].” At line 1004 replace “ambient form SO_(2n+2,2n)” by “ambient form H^(2n)⊥W and its special orthogonal group”.

   **Retest:** W=⟨−1,−1⟩ gives (2,4); W=⟨1,1⟩ gives (4,2); W=⟨1,−2⟩ is Q-anisotropic and gives (3,3) over R. All have total dimension 6 and the same size-6 partition.

6. **F06** (P3) Proposition 4.1 has the wrong printed page range

   **Location:** `packages/TwistedAutomorphicDescents/README.md:455`: “Proposition 4.1 and (4.14)–(4.16), pp.767–768”.

   **Claim:** That range locates the proposition and its displayed representative data.

   **Witness:** JZ2020 line 1235 starts Proposition 4.1 on printed p.768; its conditions continue after the p.769 marker at line 1248. Line 1190 is the preceding subsection introduction, not the proposition.

   **Exact repair text:** Replace that locator by “JZ2020, §§4.2–4.3, pp.767–770, especially Proposition 4.1, pp.768–769, and (4.14)–(4.16); JZ2020 line 1190, line 1235”.

   **Retest:** Both the proposition's opening and its representative conditions lie in the corrected range.

7. **F07** (P3) The split-unitary Check calls its split torus anisotropic

   **Location:** `packages/TwistedAutomorphicDescents/README.md:604`: “Split U(1,1)⊃U₁ … the open orbit of the anisotropic torus”.

   **Claim:** The U₁ stabilizer in the split-unitary local computation is an anisotropic torus.

   **Witness:** For E=k×k, U₁(k)={(x,x⁻¹):x∈k×}. The map x↦(x,x⁻¹) identifies U₁ with G_m over k, so its split rank is 1, whereas an anisotropic torus has split rank 0.

   **Exact repair text:** Replace “the open orbit of the anisotropic torus” by “the open orbit of the embedded split torus U₁(k)≅k× fixing the chosen nonisotropic line”. At line 519 replace “An abstract SO₂ isomorphism matching dimensions” by “An isomorphism after extending scalars to C”; the compact and split real tori are not isomorphic as real algebraic groups.

   **Retest:** At k=Q₃ the cocharacter x↦(x,x⁻¹) exists and the torus is noncompact; the norm of its fixed line remains nonzero. Over R, the two SO₂ forms both become G_m over C but have real split ranks 0 and 1.

Earlier review inputs contain only “no report … on the board yet”; earlier finding verification therefore uses the twelve finding summaries in the supplied repair report. No package file is changed.

## Earlier-finding verification

The supplied r1a and r1b inputs are one-line placeholders, so their complete original wording and witnesses cannot be verified. The following covers every ID in `packages/TwistedAutomorphicDescents/reports/FIX-RT-TwistedAutomorphicDescents~1.md`; its twelve IDs describe eleven distinct issues. None was marked not actionable. “Repaired” below refers to the defect reconstructed from that report, not to an unavailable original report.

| Earlier ID | Status | Repaired passage at this head | Witness and remaining issue |
| --- | --- | --- | --- |
| r1a/F01 | Partly repaired | README:284: “the F-split part of the centre of H is trivial”; README:314: “the regularized period is not defined” | f=g=1 on split SO₂ gives ∫dt/t=∞ and exponent 0. The ordinary convergence assertion is corrected, but the new regularized family does not satisfy README:424; S02. |
| r1a/F02 | Repaired | README:647: “when moreover a equals the standard dimension N” | SO₅ with φ=μ₁⊞μ₂, τ=μ₁: pole order 1=r, degrees 2≠4. With a=N, all distinct dual blocks occur and equal total degrees force equality. README:663 preserves the counterexample. |
| r1a/F03 | Repaired | README:959: “For a=N≥1”; “a=1 occurs only for G=U₁, W=0” | a=1,m=j=k₀=0 gives p=p¹=[1,1], total 2. Restricting ξ∘det to U₁ gives ξ. |
| r1a/F04 | Repaired | README:23: “ordered basis (2.1) and the Gram matrix (2.2)”; README:31 cites “line 2353” | JZ2020 lines 422/434 are basis/matrix on printed p.749; line 2353 starts §6.1 on p.792. |
| r1a/F05 | Repaired | README:150: “the parabolic stabilizing every member of the complete isotropic flag” | SO₇,j=2: flag Levi GL₁²×SO₃ has dimension 5; plane Levi GL₂×SO₃ has dimension 7. Both equal GL₁×SO₅ when j=1. |
| r1a/F06 | Partly repaired | README:362: “this irreducibility is the contract gap:orthogonal-auxiliary-induction” | The contract appears in README:94 and plan gaps. SR.3.1 generic-irreducibility requires cuspidal σ; GGP2012 lines 2480–2483 use arbitrary irreducible σ. The missing input is declared, but its “maximal parabolic” wording fails at its own boundary; see S03. |
| r1a/F07 | Repaired as a declared supplier contract | README:1099: “the fibre is the oriented local fibre”; README:1107: “one of the two orientations” | Two nonfixed places give 4 independent local choices but only 2 coherent orientations. README:140 and plan gaps declare both local orientation and coherent-global comparison; no absent supplier theorem is treated as implemented. The gap is not certified as a theorem here. |
| r1a/F08 | Partly repaired | README:229: “No hyperbolic vector normal form is asserted for an anisotropic middle space” | The reported fifteen removals cannot be compared without the original review/head. The replacement still leaves §0.4 with only two distinct computed examples (one positive, one anisotropic boundary); its first and third Checks repeat the same exclusion. See S04 for remaining definition Checks. |
| r1b/F01 | Repaired | README:11: “§§3.7 and 3.9 supply the nonarchimedean and the real tempered theorems” | GanGrossPrasadUnitaryGroups README:730 names the nonarchimedean theorem; :786 names the real theorem. §3.11 is separately limited to its split ranges. |
| r1b/F02 | Repaired | README:973: “the unitary branch at a=1” | Same boundary as r1a/F03: p=p¹=[1,1], not an empty or invalid partition. |
| r1b/F03 | Repaired | README:360: “Waldspurger2012, Théorème 1”; “SunZhu2012, arXiv v2 Theorem B” | Waldspurger2012 lines 37–45 prove the p-adic SO bound; SunZhu2012 lines 66–68 prove the continuous archimedean bound. Both have single certified manifest entries. |
| r1b/F04 | Repaired | README:937: “§4.1 (output transport)”; :869: “§1.3 (tower calculation)”; :1109 includes §§4.1,1.4,5.6 | All requested edges exist and point earlier. The distinction between the general tower identity and its cuspidal specialization still needs to remain explicit when applying it to residues. |

## Computed adversarial pass

All locations in the next tables are in `packages/TwistedAutomorphicDescents/README.md`. A numerical check of a Laurent expression, support record or packet-label set tests the stated implication, not existence of an automorphic realization with arbitrary prescribed records. Analytic existence and classification assertions are checked against the cited sources and the explicit supplier contracts separately. The table records every numbered target and every additional bold target; inline definitions with different domains get separate rows.

Standing context throughout: number field F, characteristic-zero local fields, complex representations, finite-dimensional nondegenerate forms, and an actual isometric relevant embedding. Thus a zero ring, inseparable quadratic extension, positive-characteristic field, degenerate form, arbitrary topology or infinite-dimensional form is not an input. Residue characteristic 2 is an input: 2 is invertible in Q₂ and in C, even though it is not a unit in Z₂. Finite residue size 1 is excluded by q≥2. Zero smaller spaces are allowed, zero ambient spaces are not. No theorem here is a theorem about arbitrary schemes, ideals or covers.

| Statement / context | Instances tried | Computed values on the two sides / negative control | Result / change |
| --- | --- | --- | --- |
| Conventions: dimensions and residual domain, :21,29,44–45 | SO₁; SO₅; U₅; d=5,m=2,j=1,a=4; invalid a=1,j=2 | N=0,4,5 respectively; k=2 and 2a+m−2k−1=5=d; invalid truncated k=0 gives m+1≠m+5 | Positive-rank/j<a guards work. |
| Conventions: Hermitian slot and quadratic scale, :23,39 | h(z,w)=z·conj(w); hyperbolic e±f | h(i,1)=i; h(1,i)=−i; h(e+f,e+f)=2; h(e−f,e−f)=−2; unswapped supplier gives −i instead of i | Slot transport and factor 2 discriminate. |
| Conventions: additive character, :23 | ψ_F=1; split δ=(t,−t) | Zero Fourier character versus regular [3]; split coefficients ±1/(2t)≠0 do not make a trivial ψ nontrivial | S01. |
| Conventions: P,Q,right action, :25,40,42 | Volume-one U₁ and χ²≠1; replace g by ig; N=1; C₃ phase ζ | (P(χ,χ),Q(χ,χ),P(χ,χ⁻¹))=(0,1,1); multipliers i,−i; Bf=f; conj(1+iζ⁻¹)=1−iζ | Correct ordinary dual/inverse-character laws. |
| Conventions: base change and induction, :27,29,41,43 | β(ϖ)=i; GL₂ diagonal with modulus argument 4 | BC β=(i,−i); BC β∨=(−i,i); half-modulus=2 versus inverse 1/2 | Consistent with the split supplier and real induction. |
| Conventions: Frobenius and factors, :33 | q=2,T=1/2, roots 1,−1; root α=2 | P=1−T²=3/4, L=4/3; arithmetic root 1/2 must be inverted to 2 before use | q=1 excluded; no equality claimed at a pole as a scalar quotient. |
| Conventions: distinct outer classes, :35 | Fixed class; exchanged pair | Orbit sizes 1 and 2; duplicating a fixed class produces multiplicity 2 instead of 1 | Correct. |
| §0.1 coordinate comparison, :150 | SO₄ nonsplit; SO₇,j=2; j=1 | Witt index 1 versus label 2; flag/plane Levi dimensions 1+1+3=5 versus 4+3=7; j=1 both GL₁×SO₅ | Repaired flag distinction holds. |
| §0.1 framed relevant pair, :152 | V a line,W=0,j=0; V=H,W positive/negative line over R | Complement dimensions 1=2·0+1; both SO(W) trivial, but line values +2 and −2 cannot be carried by an isometry | Actual embedding prevents abstract-group substitution. |
| §0.1 orthogonal Bessel datum, :158 | (d,r,ℓ)=(1,0,0),(4,2,2),(4,2,1); V=0 | Validity true,false,true; middle dimensions 1,0,2; q(e₂+e₋₂)=2; zero ambient has no nonzero norm | Both inequalities needed; at Q₂ norm 2 remains nonzero. |
| §0.2 partition, :178 | (d,ℓ)=(5,1),(3,0),(4,2) | [3,1,1]: sum5,length3=5−2; [1,1,1]: sum3; invalid leading5>4 despite natural-subtraction tail0 | Validity guard excludes junk value. |
| §0.3 rational orbit/character, :200 | x=δ,1,tδ; real middle vectors (1,±1/2); ℓ=0 | Trace/2 values 1,0,t; global ψ_F(1)=1; norms ±1 and perpendicular norms ∓1; zero nilpotent has full stabilizer, Bessel subgroup has dimension d−1 defining space | Rational/geometric distinction works subject to S01. Two very-even SO labels remain two, not one. |
| §0.4 normal form, :221 | κ=2; q(x,y)=2xy,w=(2,3/4),κ=3; anisotropic real line | Norms 2,−2; norms3=3 and determinant1 transport diag(1/2,2); real line has no hyperbolic plane | Formula sound; Checks need S04. |
| §0.5 stabilizer/Witt index, :235 | Middle H; V_an=⟨1⟩,κ=±1; unitary scalar −1 | H line-complement index0; ⟨1,−1⟩ index1 versus ⟨1,1⟩ index0; −1 centralizes N but sends e↦−e | Correct sign and exclusion of full central U₁ from pointwise framed stabilizer. |
| §0.6 prescribed ambient pair, :249 | d5,m2,j1,a4; a=j+1; twist exchanging two labels | dimX10,k2,stabilizer5; k0,dimX=d+1; swap²=id | Complement isometry, not dimensions alone, supplies transport. |
| §1.1 actual Fourier image, :280 | ℓ=0; two embeddings into π⊕π; conjugation | Bf=f restricted to H; embedding images occupy first versus second coordinate; conjugated Fourier sum 1−iζ versus original 1+iζ⁻¹ | Dependence on realization and inverse character retained. |
| §1.1 split-centre image/carrier, :282 | Constant on R₊; fixed unitary character on its central quotient | ∫₀∞1·dt/t=∞; quotient point has finite mass1; an arbitrary non-eigenfunction has no descended value | Carrier comparison is a separate obligation. |
| §1.1 ordinary P,Q, :284 | χ²≠1 on compact U₁; split SO₂ constant pair | P=0,Q=1; split ordinary integral ∞ although proper-parabolic set empty | Repaired convergence scope excludes the second case. |
| Bold regularized period, :307 | Φ=min(t,t⁻¹); Φ=t^(1/2); Φ=1; nontrivial fibre character | Corrections1+1=2; 2√T−2√T=0; λ0 gives undefined 1/λ; fibre average of nontrivial character=0 | These Checks are correct. Families need S02 at exponent collisions. |
| §1.2 first occurrence, :321 | Index supports ∅,{0},{0,2}; split d4 | No maximum; maxima0,2; ℓ2 invalid since5>4 | Nonzero hypothesis and valid-index carrier matter. |
| §1.3 first-occurrence cuspidality, :342 | Torus H; zero coefficient; hypothetical next-index support | Proper-parabolic count0; every constant term of0 is0; a nonzero higher coefficient changes max from ℓ to ≥ℓ+1 | Cuspidality is not a finite-norm assertion. General tower comparison is owned here; GRS proof text uncertified. |
| §1.4 multiplicity-free decomposition, :356 | Closed σ⊕σ versus σ⊕ρ, σ≄ρ | dim Hom toσ=2 versus1; local uniqueness bound1 excludes the first | Conditional on verified discrete carrier. |
| Bold orthogonal local uniqueness, :360 | SO₁/SO₀; two copies; j1,real signatures(1,2),(1,1); ψ(n)=−1 | Hom1; two copies Hom2; dimensions3 versus2<3; b=−b implies2b=0 and b0 overC | Correct local scope; new auxiliary contract needs S03. |
| Bold multiplicity-free global image proof, :374 | Fixed vectors at all but one place; repeated constituent | Two independent coordinate maps yield two functionals at some finite tensor stage, against bound1; inequivalent targets each allow1 | No full-spectrum multiplicity-one inference. |
| §1.5 Generic Summand proposition, :386 | Two realizations with witness flags(1,0); supported indices{0,2}; U₁ χ | Existential true, universal false; witness at0 fails index2 requirement; Q=1,P=0 | Status remains a proposition; no conclusion inserted as an axiom. |
| §2.1 Bessel–Eisenstein Z, :418 | v↦iv; ℓ0; split SO₂ fixture of S02 | Z↦iZ; Fourier operation is restriction; E(z,0)=1 regular but period∼−2/u | S02 refutes the holomorphy API. |
| §2.2 functional factorization, :441 | Two local values2,3; global30; zero global map | c=30/(2·3)=5; 0 cannot fix a nonzero normalization | Irreducible-local scope and nonzero scalar retained. |
| §2.3 relative cells, :455 | a1,rW0,ℓ0 or1; type D | Valid pairs {(0,1)} and {(0,0),(1,1)}; βopen1 or0; determinant−1 permutations are outside SO | No uniform indexing inferred from inequalities alone; S06 locator. |
| §2.4 open reduction, :469 | Previous two cases; C₂ phase±1 | αβ=(0,1),(0,0) survive; (1,1) removed; averages(1−1)/2=0 versus(1+1)/2=1 | Requires S01; split-torus corrections retained under S02. |
| §2.5 J_s, :483 | β1; σ two-dimensional; t swaps labels; ψ(n)=i | Inner index0; vector target dimension2≠scalar1; t²σ=σ; i(−i)=1 versus(−i)²=−1 | Correct target, twist and quotient phase. |
| §2.6 inner datum, :506 | (a,ℓ)=(3,2),(2,2); exchanged σ₁,σ₂; compact/split torus | Indices0,0 in opposite regimes; σ₁→σ₂→σ₁; real split ranks0,1 though geometric dimension1=1 | No off-by-one or twist error; clarify real-form Check with S07. |
| §3.1 local integrals, :533 | b↦2b; a=ℓ; ψ(n)=i; zero b | Z↦2Z; second index0; i(−i)=1; b0 gives Z0 | No wrong scalar formula found; discriminating Checks deficient, S04. |
| §3.2 Euler product, :554 | c5,local2,3; inner map0; enlarge exceptional set by normalized place | Z30; Z0; new multiplier1 | Scalar and zero cases separated. Split regularization remains subject to S02. |
| §3.3 L-ratio, :568 | q2,s1/2,split U₂; η(ϖ)=i; U₃ coordinates2,3,5; m1,2 | 4/(4/3)=3 unchanged by twist; wrong numerator dual gives1/3; cross weights2/5,15 versus10,3/5; Asai signs−,+ | Completed factors, actual Levi representation and ordinary dual agree. |
| §3.4 spherical evaluation, :592 | q3,s1/2,X=Y=1/3; roots1,−1,T1/2; no fixed vectors | 1+2Σ_(n≥1)3^(−n)=2=(1−1/9)/(1−1/3)²; P3/4,L4/3; dim fixed0 excludes vector value1 | Numerical ratio correct; split torus label false, S07. q2 remains in the theorem. |
| §3.5 shifted regularity, :608 | α1/3,β1/4,s1/2; endpoints α=β1/2 | Smallest arguments5/12,11/12,4/3>0; endpoint numerator0 | Strict bounds exclude the counterexample to positive-half-plane application. |
| §3.6 local nonvanishing, :622 | b(vπ,vσ)=2; zero b; displayed J,p,u,w | W(1)=1/2 gives product1; zero b cannot; detp=detu=1,pᵀJp=uᵀJu=J,puw=w; corrected block −1/2=1/2−1 | Matrix and normalization witness correct; values at every prescribed s₀, not merely generic s. |
| §4.1 dual/pairing dictionary, :647 | U₁ χ²≠1; SO₅ τ=μ₁ in μ₁⊞μ₂; z=i,T1/2 | P0,Q1,Pdual1; order1=r but degrees2≠4; τ=z⁻¹ gives factor2, τ=z gives2/3 | Added a=N fixes converse; inducing parameter equals output, not test dual. |
| §4.2 leading coefficient, :670 | E=At⁻²+Bt⁻¹+C,r2; E=t⁻¹,r2; kernel section | limt²E=A; limt²t⁻¹=0; kernel maps0 while another section may mapA≠0 | Single-variable coefficient and possible zero section correct. |
| §4.3 maximal pole criterion, :692 | Type t⁻²,cross3 or t; duplicate two inducing blocks | Orders2 versus1; order2 leading3 versus0; two identical required-type blocks give pole order3 instead of2 because the self-cross factor adds1 | Distinctness and signed cross factor indispensable. |
| §4.4 normalized bad-place product, :706 | Z=t⁻¹,ℒ=2t⁻¹; factors t,t⁻¹; empty/all-spherical S | Germ quotient1/2; product1 with pole in one factor; product1 | Finite S required by conventions; no scalar 0/0 evaluation. |
| §4.5 critical holomorphy, :728 | r2,Z=6t⁻²+3t⁻¹,ℒ=2t⁻²; ℒ=t⁻¹ instead | Quotient3+(3/2)t regular; alternative6/t+3 has pole | Algebra correct; analytic pole-bound justification needs S02 for regularized periods. |
| §4.6 reciprocity, :742 | c2,Z*3,leadingℒ5; any factor0; χ²≠1 | Leading period30; zero factor gives0; τχ⁻¹ gives numerator weight1 versusχ² | Ordinary argument and dual transport consistent; regularized residue comparison needs S02. |
| §4.7 period⇒central value, :757 | U₁χ; simultaneous dualsχ⁻¹μ⁻¹ | Hermitian weightχχ⁻¹=1 versus bilinearχ²; χ⁻¹μ⁻¹=c(χμ), not generally χμ⁻¹ | Second dual for Q and simultaneous-dual functional equation agree. |
| §5.1 residual parameter, :782 | a6,m3,SO; ν₂ versus2ν₁; determinant signs | Form15,standard14=12+2; torus diag(2,1/2) has trace5/2 onν₂ versus2 on2ν₁; alternating sign multiplies by−1 | Rank/sign/SL₂-action are separately constrained. |
| §5.2 L²/membership, :804 | Exponents−1/2,0; nonzero formal coefficient | ∫₁∞t⁻¹dt/t=1 versus∞; coefficient value1 alone does not select exponent−1/2 | Negative-exponent and packet identification remain separate owned obligations. |
| §5.2 inner-form classification premise, :806 | One transfer label of multiplicity2; two support records | Spectral summand has2 copies versus1 label; records for Σ₁ and Σ₂ count2, not1 | Independent spectral premise, not the descent conclusion. |
| §5.3 critical index, :829 | (d,m,a,j)=(5,2,4,1),(6,1,6,2); invalida1,j2 | k2,p[5,1⁵],sum10; k3,p[7,1⁶],sum13; invalid truncation gives dimensionm+1 instead ofm+5 | Correct guarded natural subtraction. |
| §5.4 higher-index vanishing, :849 | One local twisted quotient0; trivial action and phase−1 | Global Hom injects into0; relation2v=0 givesv0 overC but not overF₂ | All rational orbits quantified, characteristic-zero coefficients retained. |
| §5.5 critical cuspidality, :863 | Image0; two residual members with separate supports | Every CT(0)=0, although R may≠0; one record accounts for1 of2 members | No nonvanishing inferred; all-member support gap properly separate. |
| §5.6 outer stability, :879 | diag(−1,−1) on hyperbolic plane; orbit1/2; κ0 | w↦−w, notw; two sign changes give phase(+1); orbit counts1,2; central−I extension has square1 | Corrected vector/line distinction and κ0 route. |
| §5.7 unramified output, :894 | a6,m1,rW0; unitary a4,m1; weights2,3; a5,m0 | k3 gives6, k2 gives8; unitary output4 not5; polynomial1−5T+6T² versus degree1; odd listμ₁,μ₂,1,μ₂⁻¹,μ₁⁻¹ has5 weights | Source indexing and omitted-weight errors not copied. |
| §5.8 critical structure, :912 | Image0; fixed or exchanged outer class; reducible R | Constituents0; multiplicities1 or(1,1); summing two residue constituents could repeat a class twice | Irreducibility/cross-constituent comparison is retained, not inferred from nonzero R. |
| §5.9 descent definition, :926 | R0; kernel/nonkernel Fourier map; d5,m2,a4,j1 | D0; a nonzero vector can still have coefficient0; k2,p[5,1⁵],sum10,stabilizer5 | Image definition imposes neither irreducibility nor nonvanishing. |
| §6.1 support partitions, :959 | a4,m2; a6,m1; odd-SO brancha2,m1; Ua1,m0 | [5,5] versus[5,1⁵],sum10; [7,5,1] versus[7,1⁶],sum13; equal[3,1,1]; equal[1,1] | Equality cases repaired, including positive-rank U₁. |
| §6.1 universal upper-support proposition, :965 | Support∅; support{p}; support containing regular abovep | ∀q∈∅,q≤p true but p¹∈∅ false; {p} need not containp¹; regular-abovep violates inequality | Upper bound remains a proposition, not nonvanishing. |
| §6.2 weak-support proposition, :982 | Two members with witness values1,0; no coherent global form; R0 | Existential true versus universalfalse; local-only tuple supplies0 global witnesses; R0 gives no nonzero coefficient | Correct quantifier direction and dual cross hypothesis. |
| §6.3 known cases, :1004 | n1,W=⟨±1,±1⟩ or⟨1,−2⟩; two GL₂ blocks | Signatures(4,2),(2,4),(3,3),same dim6; τ₁⊞τ₂ has2 blocks and is not cuspidalGL₄ | S05; single-block source scope otherwise retained. |
| Bold distinct-isobaric support proposition, :1016 | n1 or2; two positive even block degrees; R0 | 2+2>2 excludesn1; n2 givesa4,k2,p[5,1⁵],sum10; coefficient0 cannot witness nonzero | Properly additional hypothesis, not supplied by the cuspidal theorem. |
| §6.4 central value⇒period, :1034 | φχ,φ′μ; dualized weak-support input; criticalsize10 | χ⁻¹μ⁻¹=c(χμ) gives same completed central value; undualized input insteadχμ⁻¹; stabilizer10−5=5 | Correct dualized input and coherent rational output. |
| §6.5 torus criterion, :1049 | Norm-one C/R; split SO₂; simple versus2-blockτ | Compact norm(z)=1 versus∫₁∞dt/t=∞; block counts1 versus2 | Unconditional support witness only simpleτ; split case outside anisotropic criterion. |
| §7.1 concrete recovery proposition, :1074 | Outer-fixedπ; two-elementorbit; parameterχ | Required multiplicities1 or(1,1), not2 or(1,0); τχ testsπ∨, τχ⁻¹ would outputπ∨ | Actual group/realization retained. |
| §7.2 exact local distinguished-member premise, :1099 | Singletonlocalsets; one doubleton; two nonfixed places | Candidate counts1,2,4; coherent global orientation leaves2 of4 | Declared oriented-packet contract addresses the distinction; no independent local choices substituted. |
| §7.2 recovery theorem, :1097 | Fixed global outer class; exchanged pair | Local uniqueness+global coherence gives orbit size≤2; stability suppliesboth when distinct; multiplicitybound1 excludes repeatedfixedclass | Conditional theorem keeps Generic Summand, exact local assertion and classification premises. |
| §7.3 regular recovery, :1119 | SO₄,SO₅,U₃,U₄,U₂ | Regular partitions[3,1],[5],[3],[4]; U₄ Bessel[3,1] ranks(2,1,0,0) versus(3,2,1,0); U₄ ambient9,smaller1; U₂ index0 restriction | Even-unitary comparison is separately owned, not an identification of partitions. |
| §7.4 subregular generic summand, :1135 | SO₆,U₅,SO₃ | [3,3]→Bessel[3,1³],smaller3; [4,1]→[3,1,1],smaller2; [1³],j0,smaller2 | Dimension tests pass; rational split-SO₃ and unitary comparison are independent proof obligations. |
| §7.5 maximal-subregular recovery, :1151 | SO₈; U₅; support{subregular,regular} | Prefixes(5,8)≥(4,8) for bothvery-evenlabels, but(7,8)>(5,8); U₅(4,5)>(3,5); regular-containing support makes subregular nonmaximal | Correct maximal-support hypothesis, not mere membership. |

The prescribed nonabelian sanity test is on the algebraic Hom operation, not on nonexistent “classical data for S₃”: over C, the standard irreducible S₃ module has End dimension1 and its double has End dimension4; restriction to C₃ has the two distinct characters ζ,ζ² with one-dimensional eigenspaces. Thus commutativity or trivial actions cannot justify the local-uniqueness theorem. The actual trivial-group boundary is SO₁/SO₀ in §1.4. Empty tensor products and empty exceptional-place products are1; zero Fourier images have empty support. No zero representation is treated as irreducible.

## Suggested.lean declaration and headline audit

| File/context | Declarations | Variables and instances | Test/result |
| --- | --- | --- | --- |
| `packages/TwistedAutomorphicDescents/Suggested.lean:1`–72; namespace TauCetiRoadmap.TwistedAutomorphicDescents | 0 | 0 section variables; 0 instances; 0 admitted declarations | One `import Mathlib`; 0 `set_option`, `lemma`, admitted data, examples or free-Prop stand-ins. There are no elaborated signatures to compare and no one-tactic padding to delete. |

All 23 headline entries in the module docstring were compared with the README: §§1.3; 1.4 (two headlines); 3.4–3.6; 4.3,4.5–4.7; 5.2,5.4–5.8; 6.3–6.5; 7.2–7.5. They respectively need actual automorphic/Bessel images, continuous local representation categories, local integrals and factors, Eisenstein Laurent operators, residual packets, Fourier support and coherent enhanced packets. None can be replaced by a theorem on arbitrary functions or scalars. Sections 2.2–2.4 and 3.2 are expressly identified as intermediate targets. Simple native partition arithmetic in §§0.2,5.3,6.1 is not an omitted deep headline. No declaration-name collision exists because the file declares no names.

The native carriers used in the absence audit were read at the pinned versions:

| Native declaration | Pinned file/line and actual retained context | Distinguishing instance |
| --- | --- | --- |
| Nat.Partition | `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52`; positive multiset parts with specified sum | [3,1,1] has sum5; it has no rational-form or orbit field. |
| Representation.IntertwiningMap | `Mathlib/RepresentationTheory/Intertwining.lean:36`; semiring, monoid, module carriers, algebraic linear map and equivariance | Trivial group on C² permits End=M₂(C), dimension4; no smoothness or continuous-Hom restriction is supplied. |
| MeromorphicOn | `Mathlib/Analysis/Meromorphic/Basic.lean:494`; normed-target meromorphy | z↦1/z is meromorphic at0; no continuous Eisenstein-family map is constructed by this predicate. |
| TauCeti.RegularFormClass.wittDecomposition | `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262`; regular finite-dimensional form classes over a field, 2 invertible | H⊥⟨1⟩ has Witt index1 and anisotropic dimension1; this does not choose an embedded complement isometry. |
| TauCeti.QuadraticMap.specialOrthogonalGroup | `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:373` | Reflection determinant−1 is in O but not SO over Q; determinant semantics outside finite free modules are not used. |
| TauCeti.QuadraticMap.det_reflection | `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:887`; finite free module and invertible Q(v) | A nonisotropic line reflection has determinant−1; at Q(v)=0 the constructor hypothesis fails. |
| QuadraticMap.IsometryEquiv.exists_extension | `TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean:50`; finite-dimensional ambient, nondegenerate restricted subspace forms, field, 2 invertible | A line map of norms3→3 extends; norms3→−3 over R do not give the input isometry. Ambient nondegeneracy is not required by this library theorem. |
| TauCeti.equivalent_of_equivalent_prod | `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean:196`; finite-dimensional nondegenerate cancelled summand | Cancelling H from H⊥⟨1⟩≃H⊥⟨1⟩ returns ⟨1⟩≃⟨1⟩; no Hermitian construction is supplied. |

No Lean command was run: the brief forbids builds, and there is no named declaration for a `#check @name` signature audit. This is a zero-declaration audit, not a claimed successful elaboration.

## Supplier, ownership and order audit

Cross-roadmap citations were resolved again against main, supplied open heads and the board's earlier packages/design. The indexed main was 558cb43; the target remained 43997ea. Searches used the roadmap service's object search and local searches across active/completed roadmaps, board packages and supplied sibling checkouts. Relevant searches included Bessel models/periods/data, rational nilpotent orbits, twisted descent, critical Bessel images, Hermitian Witt complements, smooth induction, Arthur packets and meromorphic Eisenstein operators. Existing finite-dimensional branching and GSp character work does not own smooth Bessel uniqueness. The new orthogonal relative datum, its uniqueness reduction and the particular residual comparisons therefore belong here; generic carriers remain with the named suppliers. No target was moved and no new upward dependency is proposed.

| Cited owner / resolved sections | Evidence inspected and scope comparison |
| --- | --- |
| ReductiveGroups, Layers 0,3,7,7b | `TauCetiRoadmap/ReductiveGroups/README.md:627,732`: reductive parabolics/Levis and Bruhat theory; 7b imports the general carriers and adds intersections. The nonsplit relative framed-orbit calculation remains a target here. |
| OrthogonalSpinGroups, Layers 0–2 | `TauCetiRoadmap/OrthogonalSpinGroups/README.md:306,383,585`: orthogonal groups, spinor/reflection and local geometry. These are not Bessel character/model constructions. |
| Completed RestrictedProducts, Layers 0–3 | `Completed/RestrictedProducts/README.md:248,268,305,361`: reference families, functoriality and rational diagonals; no second restricted-product carrier is planned here. |
| RepresentationTheory/ClassicalGroups, Layer 6 | `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:310`: finite-dimensional branching. It does not supply admissible or continuous Bessel Hom multiplicity. |
| ClassicalGroupsPartII, CG.0–CG.3 | Supplied head, `TauCetiRoadmap/ClassicalGroupsPartII/README.md:237,560,970,1211`: algebraic GSp, rational representations, integral characters and tensor constituents. No residual automorphic construction found. |
| ReductiveGroupsPartII, RG2.4 | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:6389`: parabolic adjoint determinant, followed by local modulus. Algebraic determinant and local Haar statements have distinct hypotheses; the Hermitian supplement is declared. |
| GeometryOfNumbersAndQuadraticArithmetic, §2.9 | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:738`: arbitrary involutive-field finite-dimensional carrier and adjoint; odd-residue restriction belongs to classification, which is not imported here. |
| LieHighestWeightPartII, N0 nilpotent-orbit; N2 classical-partitions | `packages/LieHighestWeightPartII/design/plan.json`: named nodes exist, with algebraically closed characteristic-zero geometric scope. Rational localization and the precise dominance continuation are declared gaps, not inferred from geometric admissibility. No packaged README was available. |
| GanGrossPrasadUnitaryGroups, §§1.1–1.3,2.1–2.6,3.7,3.9–3.11,4.1–4.4 | Supplied head, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:209,286,356,438,510,730,786,806,836,868,894,914`: real/nonarchimedean and split ranges agree with this README. The supplier uses actual framed pairs, continuous archimedean Hom and bilinear right-action periods. Its nontrivial character requirement reinforces S01. |
| SmoothRepresentationsOfLocalGroups, SR.0.1–0.4,2.1–2.3,3.1–3.3,4.1–4.4 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1964,2092,2584,3085,3353`: square root of q is a coefficient choice, available in C even at p=2; ordinary Jacquet filtration is not the required twisted calculation. Generic irreducibility is for cuspidal inducing data, so the auxiliary extension remains a gap. |
| AutomorphicFormsOnReductiveGroups, §§2.3,2.6–2.7,3.4–3.5,4.1–4.3 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:364,442,461,465,467,553,570,596,614,634`: normalized real induction; strict GL exponents; continuous globalization/Dixmier–Malliavin; restricted tensors; constant terms and central-character cuspidal carriers. No automatic Hilbert realization of an arbitrary restricted coefficient is supplied. |
| AutomorphicLFunctionsAndLocalFactors, AL.3–AL.4 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1960,2241,2252,2265,2768,2806,2819`: Whittaker realization; poles/functional equation/boundary; unramified determinant factors and conditional ramified comparison. Signed all-place operations and the exact cross representation are explicitly requested, not claimed already present. |
| AutomorphicSpectralTheory, §§0.15,1.1–1.5,2.4–2.14,4.1–4.4 | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:360,891,914,935,946,969,1602,1621,1692,1713,2365`: common-denominator operators, smooth families, normalization and residual criterion exist as targets. §2.13 has the claimed generic-global-parameter/inner-form scope. §2.14 supplies the isobaric adapter, not arbitrary noncuspidal smaller data. Fixed continuous composition in §0.15 does not justify a singular regularized torus functional (S02). |
| EndoscopicTransferAndUnitaryTraceComparison, §§11.2–11.4 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4171`: shared local packets/pairings and generic global interface; positive-exponent induction may be reducible; CM/pure-inner/classification restrictions are retained in the target README. |
| ModularityAndLanglandsExtensions, §§3.3–3.4,3.8,3.12–3.18,3.23–3.25,5.4 | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1885,1915,2119,2138,2247,2376,2414,3453`: actual parameter/classification targets and generic standard modules; outer-orbit even-SO convention; generic inner-form scope; scoped classical descent. It does not supply all nongeneric residual support or oriented global recovery without the declared extensions. |

The 18 top-level plan gaps have the same slugs, suppliers and needs text in the README's “What … must provide” entries. All suppliers are named and earlier; none is `none`. Minimality was checked by object against the suppliers and pins:

| Gap slug | Missing addition, as opposed to existing input | Result |
| --- | --- | --- |
| hermitian-witt-complements | Hermitian prescribed-complement Witt theory; the pins supply quadratic Witt theory and the field-form supplier supplies a carrier/adjoint | Declared, no duplication found. |
| rational-nilpotent-orbits | Rational versus geometric conjugacy and localization with SO labels | Declared geometric-to-rational extension. |
| classical-dominance | Particular regular/subregular dominance and special expansions | Declared supplement to partition classification. |
| rational-fourier-support | Actual generalized Fourier maps, root exchange and rational support on automorphic realizations | Declared analytic/rational continuation. |
| bessel-restriction-growth | Bessel restriction convergence/topology and split-centre exponent regularization | Declared; its existence does not imply the false preservation of poles in S02. |
| twisted-jacquet-filtration | Character quotient comparison for the particular classical groups | Ordinary geometric lemma alone is insufficient; declared. |
| spherical-whittaker-normalization | Specified spherical Whittaker/Cartan formulas, including all residue characteristics and split U | Existing Satake transform does not supply this normalization package; declared. |
| all-place-signed-factors | Signed-Asai/tensor regularity and actual unipotent-radical representation at every place | Existing unramified determinant operations do not supply it; declared. |
| type-poles-and-cross-factor | Signed conjugate-self-dual pole dichotomy and the completed cross-factor comparison | Self-dual orthogonal/symplectic type alone is insufficient; declared. |
| isobaric-eisenstein-continuation | Noncuspidal moderate-growth smaller datum | Existing discrete/isobaric smooth families do not cover this whole input; declared. |
| quasisplit-residual-packets-membership | Identify the constructed residual Langlands quotients in the prescribed packets | Classification carriers alone do not make this identification; declared. |
| residual-irreducibility | Irreducibility of the whole residue | Square integrability and membership do not imply it; declared. |
| all-member-residual-support | Every discrete residual member's full support record | One constructed residue's support gives no second member's record; declared. |
| coherent-packets-comparison | Generic coherent global comparison on actual rational forms | Retains inner-form classification premise; declared. |
| generic-discrete-member-cuspidality | Generic-parameter discrete members are cuspidal in the specified scope | Kept separate from nongeneric residual membership; declared. |
| standard-base-change-uniqueness | Actual isobaric target and uniqueness from almost-everywhere standard parameters | GL strong multiplicity one is not itself an existence theorem for this transfer; declared. |
| orthogonal-auxiliary-induction | Arbitrary irreducible smaller datum and Bernstein avoidance | Needed beyond the cuspidal supplier; wording fails for low-rank parabolics, S03. |
| oriented-even-orthogonal-packets | Oriented local fibres and coherent global orientations, retaining labels | Existing outer-orbit packets give 4 local choices in the two-place test, not the required 2 coherent choices; declared. |

The final mechanical dependency check returned exit status 0 (the earlier check also returned zero problems):

```text
depcheck: 155 roadmaps, 1054 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver returned no unresolved roadmap citations or names. Its external-Lean-name stage reported unavailable Lake packages on its own host; the eight native names above were therefore checked directly in the supplied local pins. No missing supplier is reported merely because a declared contract is not implemented today.

## Source locator audit

The nine certified source texts were read from the supplied legal cache. Each row below records an inspected source anchor supporting the corresponding target family, or the exact limit of that support. All ten cited works, including the settled uncertified book, have one manifest key each.

| Target family | Inspected source locator(s) | Scope / outcome |
| --- | --- | --- |
| Conventions, §§0.1–0.6 | JZ2020 lines 408,422,434,454,490,694,775,799,814,848,856,867 | Basis, Gram matrix, ranks, character, stabilizer and ambient geometry present; source sign/full-stabilizer mistakes are corrected in the package. S01 is a dropped source hypothesis. |
| §§1.1–1.5 | JZ2020 lines 664,715,731,743,1132,1135,1139 | Realization and first-occurrence conventions present; global torus convergence needs the repaired scope. Generic Summand is a conjectural proposition. |
| Orthogonal local uniqueness | AGRS2010 lines 50,59; Waldspurger2012 line 44; SunZhu2012 lines 29,66; JSZ2010 lines 12,24; GGP2012 lines 2287,2351,2476 | O versus SO, adjacent versus higher codimension, nonarchimedean versus continuous archimedean categories distinguished. GGP's auxiliary induction step requires the new contract. |
| §§2.1–2.6 | JZ2020 lines 1092,1135,1165,1190,1235,1256,1520,1532,1566,1610,1627,1769 | Both index regimes and twist present. Proposition 4.1 page range corrected by S06. Split-torus extension requires independent analytic work. |
| §§3.1–3.6 | JZ2020 lines 1650,1670,1815,1826,1869,2223,3292; Zhang2022 lines 87,166 | Local formulas, Euler statement, ratio and local nonvanishing located. Zhang supplies a comparison route; the full uniform split and all-prime calculation remains a target. |
| §§4.1–4.7 | JZ2020 lines 1986,1998,2042,2054,2067,2090,2112,2130,2150,2159,2296 | Pole/period arguments present. Unitary labels are tested using the roadmap's explicit dictionary rather than guessing unmarked duals from OCR. Regularized poles are not covered by the original ordinary-period proof. |
| §§5.1–5.9 | JZ2020 lines 81,87,2353,2366,2386,2426,2503,2563,2702,2833 | Classification scope, residual module, critical indices and output identified. The package separately owns comparisons where the source proof uses scoped classification or GRS. |
| §§6.1–6.5 | JZ2020 lines 2907,2976,2985,2991,3077; JLXXZ2016 lines 189,1025 | Partitions/conjecture/converse located. JLXXZ requires cuspidal GL input, so the distinct-isobaric proposition is additional. |
| §§7.1–7.5 | JZ2020 lines 2865,3118,3190,3217,3246; JLS2016 lines 705,830,855 | Conditional recovery and subregular cases located. JLS covers O/Sp/metaplectic special expansion, not the independent unitary comparison. |
| Classical tower/descent comparisons | GRS2011 Theorems 5.1,5.4,5.6,7.3; secondary anchors JZ2020 lines 713,2399,2439,2560 | Settled uncertified book; no claim to have checked its proof text. |

## Verified sound

Read all 1,186 README lines and all 72 Suggested.lean lines. Counts: **0 Lean declarations**, **49 numbered targets plus 4 additional bold target/proof blocks**, **23 unstatable headline entries**, **229 Check bullets in 53 blocks audited**, **53 target/proof locator assignments checked**, **15 roadmap-owner citation groups checked**, **18 supplier-gap pairs matched**, **8 pinned declaration contracts read**, **9 certified source texts inspected**. The locator table covers all 53 target/proof blocks; repeated references are grouped, and the GRS source-text exception is recorded below. Arithmetic, matrix, character, support and Laurent values appear in the computed table; reminders which do not discriminate a construction are not counted as independent positive evidence (S04).

The pins agree with the manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. No native automorphic/Bessel/Arthur carrier was found that would make one of the 23 headlines statable with only a few simple definitions. No theorem padding, admitted data, section-variable loss, forbidden import, `set_option`, computational algorithm or duplicate Lean name was found in Suggested.lean. The remaining README definitions have stated mathematical carriers rather than arbitrary free predicates.

The pull-request diff against origin/main is confined to nine files under `packages/TwistedAutomorphicDescents/`. No package input was modified during this review. The mathematical computations preserve the actual characteristic-zero and finite-dimensional hypotheses, finite exceptional sets, specified rational embeddings, completed factors, continuous archimedean Hom, ordinary contragredients and distinct even-SO outer classes.

## Not verifiable

- The supplied r1a/r1b files contain only placeholders. The earlier-finding table verifies every ID reconstructible from the repair report; it cannot certify an unavailable original witness or the reported count of deleted Checks.
- GRS2011 remains **uncertified**, as already settled in the manifest. Only the stated theorem locators and their citations in JZ2020 were checked. No new request for that book was made.
- Declared supplier gaps are contracts, not implemented theorems. In particular the rational orbit/analytic carrier, residual support, irreducibility and oriented-packet additions are prerequisites to future proofs. This review neither treats their absence as a defect nor certifies their truth from the current suppliers.
- The full all-place integral calculation and the independent even-unitary regular/subregular comparisons are future proof targets. The cached papers give the routes and limitations recorded above; finite boundary tests do not prove these general theorems.
- No Lean elaboration was performed; the acceptance file contains zero declarations, so the requested elaborated-signature table is empty. The absence of an execution result is not presented as a passing build.
- Ownership against open work not present in the supplied checkouts, board packages or accessible roadmap index was not checked. The supplied sibling corpus and relevant indexed earlier owners were searched; no inference was made from unknown remote revisions.

## Source issues

- **Error** in JZ2020 at Proposition 2.5, printed p.759 (JZ2020 line 859): the source says representation of y₋κ by the anisotropic kernel selects the smaller kernel; it should be representation of yκ, as H⊥⟨1⟩ with norm-one w shows; affects a stated result.
- **Error** in JZ2020 at (2.13), printed p.758 (JZ2020 line 816): the source says the displayed pointwise flag-and-vector subgroup is the full connected Levi character stabilizer; it should be distinguished from that stabilizer, which in the unitary case also contains central U₁; affects a stated result.
- **Error** in JZ2020 at (4.7) and Theorems 4.5,4.7, printed pp.766,777,779 (JZ2020 lines 1135,1670,1797): the source says a cuspidal stabilizer form ensures absolute convergence and preservation of Eisenstein holomorphy; it should be qualified for split SO₂, whose constant character is cuspidal and whose regularization can add poles; affects a stated result.
- **Gap** in JZ2020 at Theorem 4.8, printed p.781 (JZ2020 line 1865): the source says the general unramified calculation will be provided in another work; it should be accompanied by a verified computation in the claimed full scope; affects the proof.
- **Misprint** in JZ2020 at Proposition 6.4 proof, printed p.796 (JZ2020 line 2521): the source says the displayed diagonal ε fixes w₀; it should be that ε sends w₀ to −w₀ and preserves its line, with compensating flag signs preserving the character; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5 proof, printed pp.798–799 (JZ2020 lines 2619,2666): the source says the even-orthogonal output occurs at κ=a/2+r_m−1; it should be κ=a/2+r_m, since the printed index gives output dimension a+2 rather than a; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5 proof, printed p.798 (JZ2020 line 2630): the source says odd-unitary smaller data in this branch give output U_(a+1); it should be U_a, from 2a+(2r_m+1)−2(a/2+r_m)−1=a; affects the proof.
- **Misprint** in JZ2020 at (6.6), printed p.799 (JZ2020 line 2687): the source says the inducing character list stops at μ_(floor(a/2)−1); it should be retained through μ_floor(a/2); at a=5 omission loses two standard weights; affects the proof.
- **Gap** in JZ2020 at Proposition 6.9 and Corollary 6.11, printed pp.805–807 (JZ2020 lines 2982,3073): the source says the cited anisotropic-SO₂ support theorem supplies the general isobaric case; it should be supplied separately for distinct isobaric blocks, since JLXXZ2016 Theorem 1.2 assumes cuspidal τ; affects the proof.
- **Error** in JZ2020 at §7.2, printed p.809 (JZ2020 line 3197): the source says the regular case needs no smaller datum; it should be treated separately for even U, whose Bessel partition is [2n−1,1] and whose smaller group is U₁; affects the proof.
- **Gap** in JZ2020 at §7.3, printed p.810 (JZ2020 line 3239): the source says the odd-unitary Generic Summand case follows from the even-orthogonal argument; it should be justified by a unitary orbit-collapse and generic-summand argument, since JLS2016 Theorem 11.2 treats O, Sp and metaplectic groups; affects the proof.
- **Error** in JZ2020 at (A.14), printed p.814 (JZ2020 line 3421): the source says the first block relation has no quadratic Y contribution; it should be CE₂=(I−g)E₁+YY′E₂, with C=ι(Ẑ), before any justified simplification; affects the proof.
- **Gap** in JZ2020 at Theorem B.2 proof, printed p.820 (JZ2020 line 3728): the source says holomorphic nonzero rank-one factors finish the nonvanishing of their composition; it should be justified that the intervening images avoid the next kernels; nonzero factors alone can compose to zero; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "43997ea5d6eefaaae2d78eec0e126562a889f81d", "job": "RT-TwistedAutomorphicDescents~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
