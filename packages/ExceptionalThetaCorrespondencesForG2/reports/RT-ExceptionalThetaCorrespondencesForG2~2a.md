<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1314#issuecomment-6445855604 -->
Red team round 2 pass a (codex) of 80ca364

Verdict: needs_changes

1. **F01** (P1) The new division Jacquet comparison drops the modulus twist

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:823: “the G₂ Jacquet modules ... agree with its Jacquet modules along the radicals of the corresponding maximal parabolics of E₆^D”. Line 27 makes all Jacquet functors normalized, without an exception here.

   **Claim:** The small and ambient Jacquet modules agree as Levi representations with the roadmap's normalized actions.

   **Witness:** Sav lines 157–179: on diag(t,1,t⁻¹), the ambient Heisenberg radical has twenty weight-one dimensions and one weight-two dimension; G₂ has four and one. Thus δambient=|t|²², δG₂=|t|⁶, and their half-modulus ratio is |t|⁸≠1.

   **Exact repair text:** “In §3.12 only, write V_R for unnormalized coinvariants. The natural maps (Π_D)_N→(Π_D)_𝒩 and (Π_D)_U→(Π_D)_𝒰 are isomorphisms with their inherited small-Levi actions. For normalized functors the comparison is r_P(Π_D) ≅ (δ_𝒫 restricted to M / δ_P)^(1/2) · (r_𝒫(Π_D) restricted to M), and likewise for Q. The comparison with r_P(πdeg[1]) and r_Q(πdeg[1]) uses the same small-group normalization on both sides.” Add this exception to Conventions. In §3.1 likewise specify that the untwisted natural projections use unnormalized coinvariants; the normalized top terms already displayed in §§3.4–3.8 retain the small half-modulus correction.

   **Retest:** At t=ϖ and q=2 the normalized ambient action is 2⁸ times the normalized small action on the common nonzero quotient. Multiplying it by |ϖ|⁸=2⁻⁸ restores the small action. Unnormalized actions agree. The decomposition and Ext conclusions still follow; the erroneous comparison is unnecessary for them.


2. **F02** (P1) The repaired P₁₃ route invokes a theorem with incompatible cuspidal support

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:496: “through the GSp₄ Siegel series and the P₁ series of §1.13”.

   **Claim:** §1.13 provides the induction-in-stages step needed to determine the nonmaximal P₁₃ series, including its length-four specialization.

   **Witness:** README:519 requires supercuspidal GSp₄ data. Every constituent of Siegel induction from GL₂ has proper cuspidal support, hence is not supercuspidal. At s=1/2 with det φτ=1, none of those intermediate constituents satisfies §1.13.

   **Exact repair text:** Replace the final sentence of the proof route by: “For I₁₃, factor the normalized standard intertwining operators through the maximal parabolics of M₁ and M₃. Prove here the resulting kernel/image and Jacquet-module calculation: for selfdual supercuspidal τ with ωτ=1, at s=1/2 it gives four constituents and a unique generic square-integrable submodule; the opposite exponent follows by contragredience. Use the commuting-algebra criterion at s=0 for the stated two-summand case. No use of §1.13 is made in this calculation.” Retain this calculation as part of the §1.11 target, with GS Proposition 10.2 as its locator, rather than attributing it to the supercuspidal-only §1.13.

   **Retest:** For the same determinant-one τ at s=1/2, the intermediate Siegel Jacquet module is nonzero, so §1.13 still cannot apply; the replacement explicitly owns the four-constituent calculation. This also removes the unlisted forward edge 1.11→1.13. The broadened rank-one supplier contract remains usable for the rank-one factors.

3. **F03** (P1) The character branch still has an unowned reduced-norm factorization

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:993: “The one-dimensional representations of PD× are χ∘Nrd with χ³=1, since Nrd(a)=a³ on F×”.

   **Claim:** The scalar norm formula classifies all smooth one-dimensional representations of PD×, completing the portion excluded by the new torus-distinction contract.

   **Witness:** LT lines 355–358 uses factorization through reduced norm as a separate fact. Nrd(a)=a³ only tests central triviality of an already factored character. ClassFieldTheory Layers 5 and 8 supply no theorem about characters of D×.

   **Exact repair text:** Add a gap with slug `local-division-characters`, supplier SmoothRepresentationsOfLocalGroupsPartII, section SRU.3, to both the plan's gaps and the README contracts: “For every finite-dimensional central division algebra D over a characteristic-zero nonarchimedean local field F, pullback by the reduced norm gives a bijection from smooth complex characters of F× to smooth complex characters of D×.” Cite this contract in §5.2 and replace the quoted sentence by: “By the local-division-characters contract every one-dimensional smooth representation of D× is uniquely χ∘Nrd. In degree 3 it descends to PD× exactly when χ³=1, since Nrd(a)=a³ on F×.” LT lines 355–358 records the needed character fact; the proof belongs to the supplier. The searched pinned libraries and named suppliers do not supply that bijection. AdelicAlgebraicGroups §4.5, README:4787–4801, concerns the algebraic quotient by the derived group and adelic surjectivity; it does not identify the abstract commutator subgroup of local D×. Its §4.6 norm-image theorem is quaternion-specific. GeneralAlgebraicKTheory §7.6, README:1660–1685, does not supply local division SK₁ vanishing.

   **Retest:** For χ an unramified cubic character, χ(Nrd(a))=χ(a)³=1 on the center; the supplied bijection now also proves that every character has this form. The trivial and ramified cubic characters are covered, including residue characteristic 3. The existing greater-than-one-dimensional gap remains unchanged.

4. **F04** (P3) The temperedness Check only rewrites the theorem

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:819: “An occurring pair has temperedness indicators (1,1) or (0,0)”.

   **Claim:** This is a discriminating Check for the equivalence in §3.11.

   **Witness:** README:811 asserts exactly equality of the two temperedness predicates. Converting their truth values to 0/1 supplies no representation, exponent calculation or independent test; the Check is that same equivalence.

   **Exact repair text:** Replace the Check with: “For π=St_G₂, the explicit table gives θ_H(π)=St_H; both are square-integrable and hence tempered. For a unitary nonselfdual supercuspidal τ of GL₂ and π=J_Q(1,τ), the positive exponents of the corresponding H datum are (1,1), so neither side is tempered. The boundary exponent s=0 is not covered by this positive-exponent argument and is treated by the tempered induction table.”

   **Retest:** The examples give temperedness values (1,1) and (0,0) from concrete classification data; at s=0 the strict inequality is false. The replacement tests both branches and the boundary rather than rephrasing the universal equivalence.

## Earlier findings, checked individually

The earlier passes use F identifiers. “Settled” below is not a new finding. Locations are in packages/ExceptionalThetaCorrespondencesForG2/README.md unless another file is named.

| Earlier finding | Status at this head | Current passage and witness |
|---|---|---|
| a/F01, native null-space theorems absent from acceptance file | Not repaired; settled | Suggested.lean:7 says “No headline theorem is statable at the pins”. README:3 names the end results, while §0.2 is an input. The repair's distinction between a statable input and a headline is consistent with the acceptance-file rule. No re-raise. |
| a/F02, division Ext cycle | Partly repaired | §3.12:823 now says “without Howe duality, finite cubic periods or the triality exact sequences”; §4.3:884 derives “R_D(E)≅πdeg[1]⊕C_E”. The graph cycle is removed: Sav lines 234–270 and 303–318 precede irreducibility. The new normalized comparison is false as stated: S01. |
| a/F03, spin representation wrongly attributed to AL.4 | Repaired | Contract:105 takes “the degree-eight spin representation of Spin₇ constructed by RepresentationTheory/SpinRepresentations Layer 4”. The main supplier at README:665 supplies the exterior model. Its dimensions are 1+3+3+1=8; at identity its Euler polynomial is (1−T)⁸, versus 1−T for the trivial representation. |
| a/F04, torus distinction unowned | Partly repaired | Contract:87 now declares `gap:prime-degree-torus-distinction`, also in plan.json, for “dimension greater than one”. LT lines 309–330 covers this branch, with ℓ=3,q=2,m=1 giving 2. The new one-dimensional completion still needs reduced-norm factorization: S03. |
| a/F05, odd-Weil negative control false | Repaired | §6.1:1122 separates “ω⁻ attached to the trivial character” from ω⁻χ with χ≠1; §8.5:1388 excludes a “quadratic twist of Steinberg”. GG lines 745–799: support F×² contains 1 and gives split St; a nonsquare class omits 1 and gives split lift 0 and anisotropic character χ∘Nrd. |
| a/F06, too few discriminating definition Checks | Repaired | §1.8:462–464 adds “invariants ... are 0” and “no K-fixed vectors”; §10.1:1597–1599 adds the dimension and norm comparisons. Cuspidal/trivial finite types have U-invariant dimensions 0/1; Albert/quaternion counts are 133/66, and N(diag(1,2,3))=6 versus N²=36. |
| b/F01, missing stχ×1 irreducibility and inadequate P₁₃ route | Partly repaired | §1.12:506 now states “I₃(σ×1)=I₁₃(0,σ⊗1) is irreducible” for unitary discrete series of PGL₂, and §8.2 cites it. For stχ, the two reflection scalars vanish and the R-group has order 1. The widened gap covers that argument; the new P₁₃ invocation of §1.13 remains invalid: S02. |
| b/F02, nonexistent MP.3 | Repaired | §6.2:1127 now says “MetaplecticAutomorphicForms §3.39”. Its current README:1093 has “Minimal orthogonal theta lift”, with n=5,6 and tempered input; dimensions of the partner orthogonal spaces are 3 and 5. No MP.3 reference remains. |
| b/F03, ambiguous M₁ similitude coordinate | Repaired | §0.9:316 specifies the action on “⟨x₁₂,x₁₃,x₁₄,x₁₅⟩”. Its multiplier is t²/ν. The radical determinant is t⁶ν⁻³=(t²/ν)³; in the other coordinate it is (ν/t²)⁻³. At multiplier ϖ the two proposed signs give q⁻³ versus q³. |
| b/F04, extra connected component | Repaired | §2.2:585 says “has two components (one added by the involution)”. The component cardinalities are 1 before extension and 2 after; both Lie dimensions are 78. |

## Statement and instance ledger

The README has 97 numbered targets, including their definitions and conventions; all are included below. Its bold labels otherwise mark Checks, source keys or supplier names, not additional theorem statements. “Compatible” means the displayed instances do not refute the target, not a proof of the general theorem. All local representation rows use characteristic-zero nonarchimedean F, complex smooth representations, q≥2 and a fixed nontrivial ψ. Extra restrictions appear in the context column. Thus q=1, positive characteristic, the zero ring, inseparable field extensions and empty irreducible modules are outside those signatures. Residue characteristics 2 and 3 remain inside except for the explicitly bounded examples. Scheme comparisons retain all test algebras, including dual numbers.

| Section / statement | Context and instances | Computed values on the two sides / negative control | Result / change |
|---|---|---|---|
| 0.1 octonion automorphisms | Split O over char-0 field; identity, conjugation, F[ε]/ε² | id(xy)=id(x)id(y); for top u₁,u₂, conjugation gives −v₃ versus (+v₃); id+εD preserves products exactly when D(xy)=D(x)y+xD(y) | Compatible; nonreduced tests require the schematic construction |
| 0.2 null spaces and flags | W=0, Fu₁, Fu₁+Fv₂; Fu₁+Fu₂; idempotent e | Dimensions 0,1,2; all products 0 in the first three; u₁u₂=v₃≠0; e²=e≠0 despite N(e)=0 | Compatible; norm-isotropic is insufficient |
| 0.3 G₂ parabolics | Root lengths fixed; det=ϖ | Radical dimensions 5/5; graded dimensions (4,1)/(2,1,2); δP=q⁻³, δQ=q⁻⁵; half factors q⁻³ᐟ²/q⁻⁵ᐟ² | Compatible |
| 0.4 cubic Fourier data | Binary cubics xy(x−y), x³; trivial π | Discriminants 1/0; split étale algebra F³ versus nonétale F[t]/t³; W_E(1)=0 since (1−ψE(n))v=0 for ψE(n)≠1 | Compatible, including p=2,3 |
| 0.5 SL₃/SU₃ stabilizers | Quadratic split algebra; field extension; scalar octonion | Dimensions 8/8; scalar stabilizer dimension 14; adjoining outer involution gives 2 components, Lie dimension unchanged | Compatible; scalar excluded |
| 0.6 dual embeddings | SL₃ standard V; spin; principal SL₂ | 7=1+3+3, 8=1+7; centralizers μ₃ and S₃ have orders 3/6; diagonal (−1,−1) acts trivially in (SL₂×SL₂)/μ₂ | Compatible |
| 0.7 parameters and WD conversion | q=3, nonzero N; trivial parameter; S₃ image | Arithmetic r scales N by 1/3; r_LP scales by 3; trivial parameter is tempered but not discrete; inversion sends ab to b⁻¹a⁻¹, not a⁻¹b⁻¹ for a=(12),b=(123) | Compatible; conventions distinguish both directions |
| 0.8 component groups | Principal SL₂ in SL₃/Spin₇; subregular G₂ | Raw/fixed-split groups μ₃/1, μ₂/1, S₃/S₃; orders (3,1),(2,1),(6,6) | Compatible; raw group cannot replace quotient |
| 0.9 PGSp₆ Jordan/Levi coordinates | ∧²F⁶⊗ν⁻¹; M₁ diag(t,h,ν/t) | Dimension 15; scalar z acts z²/z²=1; δP₁=|t|⁶|ν|⁻³=|t²/ν|³; inverse coordinate reverses exponent | Prior b/F03 repaired |
| 0.10 Weyl coordinates | s=(1,2,3), reflection; chamber (3,2,−1) | Reflection (6,−3,−2); Q(s)=14+36=50 and Q(ws)=49+1=50; nine wall values 1,2,1;5,4,3;9,8,7; simple-coroot pairings 1,3,1 are positive | Compatible; source negative-quarter form fails |
| 1.1 P supercuspidal series | τ selfdual, ωτ=1 or nontrivial; s=0,±1/2 | det-one: length 1 at 0 and 2 at ±1/2; det-nontrivial: length 2 at 0; nonselfdual: no real reducibility | Compatible |
| 1.2 P Steinberg series | χ=1, quadratic, cubic; positive listed exponents | χ=1: exceptional ±3/2,±1/2; nontrivial orders 2/3: ±1/2; length at +1/2 is 3/2/2 | Compatible |
| 1.3 P character series | χ nontrivial quadratic; χ=1 at 3/2 | Final Q exponent 1, not 1/2; at det=ϖ the two twists are q⁻¹/q⁻¹ᐟ²; trivial input at 3/2 has trivial top | Compatible with corrected source |
| 1.4 Q supercuspidal series | Selfdual det-one; S₃ parameter; other dihedral | Reducibility ±1/2, ±1, 0 respectively; S₃ two-dimensional standard determinant=sign≠1 | Compatible |
| 1.5 Q Steinberg/characters | χ=1, s=1/2; nontrivial quadratic | Untwisted socle has 2 DS constituents and one top, total 3; twisted socle has 1 DS constituent and one top, total 2 | Compatible |
| 1.6 Borel series/opposite embeddings | Three distinct nontrivial quadratics; (s₁,s₂)=(2,1) | Quadratic product=1 and 2 summands; opposite P exponent −2+1/2=−3/2, not +3/2 | Compatible |
| 1.7 nontempered forms | Strict Borel exponents (2,1), boundary (1,0) | 2>1>0 true; 1>0>0 false; boundary belongs to proper-Levi form, not strict Borel form | Compatible |
| 1.8 finite cuspidal types | Cuspidal finite σ versus trivial σ | Proper U-invariants dimensions 0/1; K-supported compact induction contains σ≠0; K-invariants 0 for nontrivial cuspidal σ | Prior a/F06 repaired |
| 1.9 partial parameter labels | Subregular S₃ | Enhancement dimensions 1,1,2; sum of squares 1+1+4=6; principal label has component order 1 | Compatible; no full LLC claimed here |
| 1.10 cubic models | Infinite-dimensional nongeneric π; π=1 excluded | Regular coefficient 0; maximal subregular coefficient c_O=dim W_E≥1; for 1 all generic cubic coefficients 0 | Compatible conditional on wavefront gap |
| 1.11 P₂/P₁₃ reducibility | det-one supercuspidal τ, s=1/2 | Lengths 2/4; intermediate GSp₄ Siegel constituent has nonzero proper Jacquet module, whereas supercuspidal input in 1.13 has zero | S02 |
| 1.12 Siegel series | Nonselfdual/selfdual GL₃ DS; stχ×1, χ²=1 | Lengths 1/2/1; for st×1 the 7-space is 2·Sp₂+3·1 and centralizer Sp₂×SO₃ has component order 1; R-group order 1 | Repaired missing case |
| 1.13 P₁ series | Generic/nongeneric supercuspidal GSp₄, std parameter contains 1 | Genericity indicators 1/0; common Plancherel scalar has the same reducibility set {−1/2,+1/2} | Compatible; not applicable to Siegel-induced data |
| 2.1 Freudenthal–Jordan construction | J=F,F³,M₃,J₁₅; scalar x=2,y=3 | Lie dimensions 8+0+6=14, 8+2+18=28, 8+16+54=78, 8+35+90=133; x#=4, (x#)#=16=N(x)x; T(4,3)=36=dN₂(3) | Compatible; trace normalization 3xy matters |
| 2.2 integrated dual pairs | Split/division E₆ and E₇; outer C₂ | Lie dimensions 78/78/133; outer extension has components 1+1=2 and no additional Lie dimension | Prior b/F04 repaired |
| 2.3 triality see-saw | Split E=F³; F×/F×² nontrivial | Three SL₂ factors have dimension 9; central μ₂ quotient preserves dimension 9; squareclass of ϖ gives a nontrivial rational lifting obstruction | Compatible; point-surjectivity not assumed |
| 2.4 minimal models | Nonzero highest-weight orbit; zero excluded; spherical vector | Evaluation functional has dimension 1 on the orbit, 0 off its nonzero closure; Cc(Ω) kernel survives, zero vector is not an orbit point | Compatible at readable model statements; GS05 waived |
| 2.5 theta definitions | Irreducible π; absent π; regular character quotient | Isotypic multiplicity zero gives Θ=0; χ quotient has left/right scalar χ(a)χ(b)⁻¹; diagonal a=b acts by 1 | Compatible; full dual distinguished from smooth dual |
| 2.6 outer normalization | Spherical vector v; diag(2,3,5) | T(v)=v and T²v=v; outer image diag(1/5,1/3,1/2), applying twice restores original; −T acts by −1 on v | Compatible |
| 3.1 ambient projections | Five fundamental cocharacters | Derived Levi dimensions 66,38,78,66,48; inherited quotient maps before normalization have scalar 1; normalized maps need unequal half-modulus ratios | S01 also clarifies this notation |
| 3.2 orbit kernels | Quadruples (u₁,v₂,0,0), (u₁,0,0,0), 0 in x,y,x′,y′ order | All products 0; wedge sum 0; spans 2/1/0, last excluded. (u₁,0,v₂,0) has wedge u₁∧v₂≠0 despite null span | Compatible; wedge equation is necessary |
| 3.3 E₆ Jacquet/finite length | det=ϖ; split versus division | Boundary factors q⁻³ᐟ² and q⁻¹ᐟ² unequal; split G₂-P has 2 regular GL₂ strata versus no such division strata | Compatible |
| 3.4 E₇ G₂-P filtration | Center zI; q=2 | Top scalar factors |z| and |z|³; at z=ϖ, 1/2 and 1/8; regular quotient χ(a)/χ(b) | Compatible |
| 3.5 E₇ G₂-Q filtration | Borel coordinates (ϖ,1),(1,ϖ) | Middle δ gives q⁻¹ᐟ² and q⁻¹; reversing sign in first coordinate would give q¹ᐟ² | Compatible on explicit characters; A₁ parameter uncertified |
| 3.6 H-P₃ filtration | Q₁ lower-row stabilizer | At (g₁,g₂)=(ϖ,I), δQ₁=q² and middle twist q¹ᐟ²; top factors 1 and q⁻¹ at det=ϖ | Compatible |
| 3.7 H-P₁ filtration | Q₁ (ϖ,I), Q₂ (diag(ϖ,1),1) | Moduli q⁴ and q³; middle first twist q¹ᐟ²; top at ν=ϖ is q⁻¹ᐟ²/q⁻³ᐟ² | Compatible with fixed M₁ coordinate |
| 3.8 H-P₂ filtration | Anti-diagonal center (zI,z⁻¹I) | det product z²z⁻²=1; top twists both 1 there; piece-three Borel is the second GL₂, whose second diagonal coordinate acts trivially | Compatible on explicit characters; A₁ parameter uncertified |
| 3.9 forward positive exponents | Q-family s=1, boundary s=0 | Two H exponents (1,1); positivity 1>0 versus 0>0 false; P-family uses P₁₃ rather than P₂ | Compatible |
| 3.10 reverse chambers | Rank 3 root subsets; P₂ only | Number of proper subsets 2³−1=7; P₂ handles 1, leaves 6; positive second-torus weight differs from zero scalar in piece three | Compatible; source omitted cases are owned here |
| 3.11 temperedness iff | StG₂/StH; strict Q-family at s=1 | Tempered indicators (1,1)/(0,0); source and target positive exponents 1/(1,1); missing occurrence hypothesis would allow mixed pairs | S04: its printed indicator Check alone restates the target |
| 3.12 division decomposition | Heisenberg scalar t=ϖ,q=2 | δambient=2⁻²², δsmall=2⁻⁶; normalized ambient/small action ratio 2⁸=256, not 1; other τ summands have Jacquet module 0 | S01 |
| 4.1 triality degenerate series | J dimensions 9/15; E field/nonfield | s_J=−1/2,+1/2; division model R_D(E)=0 for nonfield E; unnormalized exponent at s=1/2 is 3 | Compatible |
| 4.2 triality sequences | Cubic field versus F³ or F×K | Jordan–Hölder lengths 3/2; division summand present/0; the two E-types cannot share a three-constituent sequence | Compatible |
| 4.3 division Ext | E field/nonfield; tempered π | R_D(E)=πdeg[1]⊕C_E or 0; Ext¹(C_E,π)=0, DS summand Ext¹=0 by Schwartz contract; hence total 0 | Order repaired, conditional on declared Ext supply |
| 4.4 Mackey boundary | E=F³,F×K,cubic field; s=1/2 | Orbit multiplicity m=3,1,0; exponents s/2+1/4=1/2 and s+1=3/2, not equal | Compatible |
| 4.5 open-orbit Hom | Tempered or Q-supercuspidal-support π; s=1/2 | Positive boundary exponents 1/2,3/2 exclude tempered target exponents ≤0 in the dual calculation; boundary Hom=0, open Hom retained | Compatible at stated hypotheses |
| 4.6 cubic coefficients | E field in D; E=F³ in division D | Embedding locus nonempty/empty; compact-function coefficient nonzero/0; torus-fixed dimension of trivial input 1 | Compatible |
| 4.7 finite cubic chain | m=dim W_E(π)>0 finite | Chained bounds m≤d₁≤d₂≤m imply all m; at m=1 all spaces have dimension 1; ∞≤∞ would not imply finite multiplicity | Compatible; finiteness hypothesis used |
| 4.8 preliminary uniqueness | Two quotients, each with nonzero cubic period | Minimum contribution m+m=2m>m for m≥1; a single quotient contributes m | Compatible |
| 4.9 existence | Cubic model of infinite-dimensional nongeneric π; generic π | At least one nonzero W_E has dimension ≥1; generic Whittaker dimension 1; neither is the zero representation | Compatible; trivial input separately covered by positive exponents |
| 5.1 division Howe | τ=1; τ≠1 with nonzero period | Θ_D(1)=πdeg[1], generic dimension 0; other nonzero lifts have both proper Jacquet modules 0 | Compatible after S01 normalization |
| 5.2 universal division nonvanishing | ℓ=3,p=2/3; unramified cubic χ | gcd=1/3; q^m=2 at q=2,m=1; norm valuations of unramified/ramified cubic fields 3ℤ/ℤ, so χ restrictions 1/nontrivial | S03 in character classification; >1 branch declared |
| 5.3 opposite division forms | Noncommuting x,y; inversion; norm character χ | i(xy)=y⁻¹x⁻¹=i(x)·op i(y); χ(Nrd(x⁻¹))=χ(Nrd x)⁻¹; ordinary-order inversion would fail | Compatible |
| 5.4 outer signs | Generic selfdual τ; nonselfdual τ; trivial τ | Signed Whittaker dimensions (1,0) for τ⁺/τ⁻, (1,1) for induced nonselfdual extension; trivial PGL₃ parameter exponents (1,0,−1), not (1/2,0,−1/2) | Compatible |
| 5.5 E₆ fibers | Trivial cubic torus character; regular left/right action | Period dimension 1 for trivial input; quotient character χ(a)/χ(b), diagonal=1; reversing only one factor gives χ(a)χ(b) and diagonal χ(a)² | Compatible |
| 5.6 generic supercuspidal precursor | Residue p=2 and p≠2 | Generic quotient multiplicity 1; at p=2 selfdual GL₃ SC is permitted; old p≠2 exclusion cannot establish that case | Compatible; full Jacquet route retained |
| 5.7 minus lift | Selfdual PGL₃ SC; O₃ central sign | st⁺/st⁻ signs +1/−1; the two GL₂-equivariant quotient possibilities supply one nonzero signed summand; p≠2 has 0 selfdual SC inputs | Compatible |
| 5.8 E₆ table | St⁺/St⁻; tempered parameter containing 1 | Outputs πgen[1]/πsc[1] have generic dimensions 1/0; containing-1 minus output 0 and plus output nonzero | Compatible |
| 5.9 E₆ Howe | Distinct inputs versus same input | Hom bound 0 for distinct irreducibles, 1 for identical; nonzero equal outputs would violate the first bound | Compatible |
| 6.1 restricted oscillator | Odd Weil trivial/nontrivial χ; admitted σ | Split SO₃ output St/0; anisotropic output 0/χ∘Nrd; admitted FJ=σ∨ and double dual σ | Prior false Check repaired |
| 6.2 D₅/D₆ comparison | Tempered G₂ π; n=5,6 | Orthogonal partner dimensions 2n−7=3,5; covered center signs (−1)(−1)=+1 in see-saw | Compatible; supplier 3.39 exists |
| 6.3 A₅ restriction | Line stabilizer in F⁶ | dim P⁵=5 and Sp₆/P_line=5; Sp₆ transitive on nonzero lines, so one Mackey orbit; 0 is not a projective point | Compatible for finite length; exact inducing parameter not certified |
| 6.4 noncuspidal finiteness | Three H maximal parabolics, two G₂ parabolics | Each finite stratum multiplicity gives finite induced length; three/two required Jacquet modules, not an unbounded family | Compatible conditional on preceding model inputs |
| 6.5 nongeneric finite length | Noncuspidal length n=2 | Total length n+ε with ε=0 or 1 gives 2 or 3; an unrestricted cuspidal direct sum would have unbounded length | Compatible |
| 6.6 Whittaker fibers | Trivial G₂ input; ψ nontrivial | (1−ψ(v))·z=0 implies coefficient 0; generic quotient dimension 1; resulting induced group H/G₂ switches with the coefficient taken | Compatible |
| 6.7 dichotomy | πdeg[1]; StG₂ | Nonvanishing indicators (division,H)=(1,0)/(0,1); each sum=1, never 0 or 2 | Compatible, including p=2,3 |
| 7.1 enhanced FJ | Two genuine factors; s=±1/2 | Covered center (−1)²=+1; one factor alone −1; dual parameter and character become (−s,ψ̄), so +1/2 becomes −1/2 | Compatible |
| 7.2 Shalika period | S=PGL₂Δ⋉N₂; trivial H representation | ψS on diagonal=1 and nontrivial on N₂; trivial-representation period=0, while forgetting ψ would give dimension 1 | Compatible |
| 7.3 root exchange | Heisenberg Schrödinger model, lattice K, self-dual measure | Fourier of 1_K is vol(K)1_K⊥; double transform gives f(−x); unweighted integral transforms trivially rather than by ψY | Compatible; source missing weight avoided |
| 7.4 enhanced multiplicity one | s=0 and s=1/2 | 0<1/2 true, boundary 1/2<1/2 false; period dimension 1 only asserted in open range; s=−1/2 used downstream | Compatible |
| 7.5 minimal Shalika fiber | Full Iψ̄(1/2), its Steinberg submodule | Full principal series length 2 with one even-Weil quotient; replacing it by either constituent changes length to 1 | Compatible |
| 7.6 generic period chain | Tempered generic π | End dimensions 1 and 1 force all intermediate dimensions 1; two independent quotient lines would give dimension ≥2 | Compatible |
| 7.7 generic uniqueness | Two generic tempered quotients | Sum of Whittaker dimensions 1+1=2 exceeds available 1 | Compatible |
| 7.8 tempered Howe | Same or inequivalent tempered input | Nonzero output Hom dimensions bounded by 1 or 0 respectively; generic and nongeneric cases accounted for separately | Compatible |
| 8.1 nontempered tables | Q-family positive s=1; unmatched H Langlands support | Output J₂ with exponents (1,1), reverse JQ; unmatched support gives Θ=0 rather than a forced quotient | Compatible |
| 8.2 E₆/E₇ Siegel table | St_GL₃; st_GL₂×1 | First induction has 2 summands with generic dimensions 1/0; second has 1 summand, matching revised 1.12 | Repaired missing input |
| 8.3 three Howe theorems | Division, split E₆, E₇ | Nonzero small lift length 1, zero length 0; big lift finite length but not asserted always irreducible | Compatible; no conflation of big/small |
| 8.4 other tempered lifts | StG₂; τ=st_GL₂ in proposed δ formula | St maps to St; Q(1/2,st) has socle length 2, whereas supercuspidal τ δ formula has socle length 1 | Compatible; supercuspidality retained |
| 8.5 πρ family | Supercuspidal PGL₂ ρ; odd Weil | JL(ρ) has dimension >1; odd-Weil anisotropic lift is 0 or dimension 1, so admitted odd inputs=0 | Prior correction verified |
| 8.6 D₆ πρ lift | σρ from division ternary | Split first occurrence dimensions 3/5 give lifts 0/τρ≠0; full D₆ multiplicity module τρ, not just its length-one cosocle | Compatible with see-saw source |
| 8.7 remaining SC lifts | πρ; SC outside all lower images | θ(πρ)=δ₁(τρ), normalized P₁ exponent +1/2; other outputs have all three proper Jacquet modules 0 | Compatible |
| 8.8 DS trichotomy | πdeg[1], πsc[1], StG₂ | Discrete-series branch indicators (D,PGL₃,H)=(1,0,0),(0,1,0),(0,0,1); each sums to 1 | Compatible; non-DS H Siegel lift does not add a branch |
| 8.9 spin/Shalika criterion | Central coroot t=ϖ; pole order one | sim=t², det₅₆=t⁵⁶; determinant twist q⁻⁶ versus half-modulus q⁻⁸ gives normalized exponent −1; ord₀γ=+1 when ord₀L=−1 and numerator regular | Compatible, conditional on spin gaps |
| 8.10 depth-zero example | q=7, torus element order 43; p=3 excluded | q²−q+1=43; exponents 0,1,42,36,7,6,37 all distinct, sum129≡0 mod43; finite theorem requires p>5 | Compatible; restriction only on this example |
| 9.1 quaternion stabilizers | Split/division D; pointwise/setwise | dim SL₁D=3, setwise stabilizer dimension 6; in compact case SL₁ℍ=SU₂, normalized Haar volume 1 | Compatible |
| 9.2 quaternion Fourier coefficients | Siegel forms ranks 3/0 | Rank3 gives quaternion orbit and stabilizer dim3; rank0 gives trivial character and no open-orbit quaternion label | Compatible |
| 9.3 tempered relative quotient | Pure ranks 0,1,2 versus 3 | Rank0 is one-dimensional and nontempered; odd rank1 has covered-center −1 and cannot descend to Sp₆; rank2 low-rank image nontempered; tempered forces rank3 | Compatible at readable low-rank claims; damaged Li formulas uncertified |
| 9.4 supercuspidal embedding | Nonzero quotient onto projective π | A splitting s has quotient∘s=idπ≠0; zero map composite=0 fails | Compatible |
| 9.5 Steinberg L² summand | Compact GD; left translation on unipotent | ℓ(f)=∫χ(n)f(n)dn gives ℓ(L_nf)=χ(n)ℓ(f); inverse weight gives χ(n)⁻¹; normalized compact averaging of fixed vector returns itself | Compatible |
| 9.6 compact SU₂ periods | SU₃ highest weight (a,b,c); trivial representation | Interlacing (b,b) has SU₂ weight b−b=0; for (0,0,0) invariant dimension1, and for standard 3=2+1 invariant dimension1 | Compatible |
| 10.1 global Albert group | Octonions versus quaternion Jordan algebra | 27+79+27=133 versus 15+36+15=66; branching14+21+7·14=133; N(diag(1,2,3))=6 versus36 for N²; N(2I)=8 versus64 for N² | Prior definition Checks repaired |
| 10.2 minimal residue | r=3,d=8, split/definite number-field forms | Pole list1,1+4,1+8={1,5,9}; desired minimal residue at 5, not trivial residue9 | Compatible; local constituent details partly unreadable |
| 10.3 global kernel | f=0; φ=0; scalar i on φ; local vanishing | Θ(0,φ)=Θ(f,0)=0; conjugate-linear φ convention gives Θ(f,iφ)=−iΘ(f,φ); one zero local quotient forces global image0 | Compatible |
| 10.4 period nonvanishing | Totally definite input with nonzero D-period | A vector with period value1 gives nonzero unfolded coefficient; identically zero period gives coefficient0 and no promised nonvanishing | Compatible |
| 10.5 two cuspidality criteria | Finite Steinberg; compact highest weight on/off wall | Proper constant terms0 for Steinberg case; regular weight has positive simple pairings, wall weight has one pairing0 and does not satisfy second criterion | Compatible |
| 10.6 split global generic lift | Nonzero Whittaker coefficient; one SC local H output | Input coefficient≠0 gives some output coefficient≠0; SC output has every proper Jacquet module0, forcing all global constant terms0 | Compatible |
| 10.7 real infinitesimal characters | Compact highest weight 0; regular weight | Harish–Chandra parameter at0 is ρ, not0; two-term shift λ↦λ+ρ distinguishes highest weight from infinitesimal character | HPS exact map waived; this test cannot certify it |

| Suggested.lean declaration | Section, variables and instances | Typed values / result |
|---|---|---|
| None (39 lines read) | Empty namespace; no section variables, definitions, instances, theorems or examples | Declaration count=0; sorry count=0; import count=1. No binder can disappear. No signature elaboration or Lean build was run. |


## Verified sound

Read all 1737 README lines and all 39 Suggested.lean lines. Counts: **97 targets**, **0 Lean declarations**, **10 earlier findings individually rechecked**, **183 printed Check bullets examined**, and **97 target-level batches of computed tests** recorded above. The tests are necessary-condition and boundary checks, not proofs of the general theorems. S04 identifies one printed Check that supplies no independent test. There are no acceptance-file padding declarations, sorry'd data, dropped instance binders or duplicate fully qualified declaration names.

The headline inventory is: the represented exceptional groups and minimal models; their Jacquet filtrations; the three Howe theorems and finite length; the dichotomy and division nonvanishing; tempered preservation and explicit lift tables; the discrete-series trichotomy; the spin-pole/Shalika/theta criterion; quaternion relative models, Steinberg and compact-real periods; global minimal residues, nonvanishing and cuspidality; and real infinitesimal-character matching. Suggested.lean names each family and its missing carriers. Native Zorn algebra and linear algebra make some preliminary inputs statable, but do not make those representation-theoretic headlines statable. The earlier settled finding about §0.2 is not re-raised.

The library commits agree with lake-manifest.json: Mathlib **6b7abb3c7686292736be2955bd3eb9ebf63b456a** and Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. Object searches and reads verified:

- TauCeti/Algebra/Octonion/Basic.lean:123,263–270,345,375,410,416,589,619: the carrier, ordered Zorn multiplication, trace, norm, quadratic identity, composition and imaginary dimension. The dimension theorem uses CommRing and StrongRankCondition; no field-only hypothesis was silently attributed to it. Derivation.lean:995 and Fundamental.lean:317,360 distinguish the derivation dimension from irreducibility in characteristic two.
- TauCeti/Algebra/AlbertAlgebra/Basic.lean:104,213,229: the 27-dimensional carrier and symmetrized product with 2 invertible. TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean:82, Polarization/CliffordAction.lean:230 and Spin/Representation.lean:56 supply polarized algebraic spin actions, not smooth minimal modules.
- The E7/Minuscule/Carrier.lean:188, E6/Minuscule/GroupScheme.lean:109 and D4/Tripled/GroupScheme.lean:119 carriers, D4/Tripled/Triality.lean:142, E6/DoubledMinuscule/GraphAutomorphism.lean:468, G2/ShortRoot/Basic.lean:173 and Octonion/Serre.lean:267 have the limited contracts described in the README. They do not identify all exceptional rational forms or construct their minimal representations.
- TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272,618 includes a discrete topology and open stabilizers, not admissibility. The trivial action on an infinite direct sum has all stabilizers open and infinite-dimensional fixed spaces. Mathlib/RepresentationTheory/Basic.lean:48 and Coinvariants.lean:53,57 provide algebraic actions and the quotient by the relation span. Inverse twisting gives the stated ψ-coinvariants; it does not produce parabolic Jacquet theory.

**Sibling citations checked: 19 supplier families**, with their consumed sections listed here. Section references were resolved against main or the available current new-roadmap head, not inferred from an earlier report. Existing-roadmap revisions were not used as new suppliers.

| Supplier | Sections and content actually matched |
|---|---|
| ReductiveGroups | Layers 3, 3A.1, 9: closed subgroups, action stabilizers, pinned groups. The stabilizer target does not already supply the centralizer gap. |
| ReductiveGroupsPartII | RG2.5.1–RG2.5.2: dual root data, dual Levi maps and L-groups. |
| RepresentationTheory/LieHighestWeight | Layer 8, README:1197–1431: split exceptional models, positive real octonions, compact Albert algebra and complexification. The target package owns the additional exceptional group identifications and rational descent. |
| RepresentationTheory/SpinRepresentations | Layers 4 and 8: exterior spin construction and complex triality; three triality modules have dimensions 8,8,8, while the full spin module in dimension 8 has dimension 16. |
| RepresentationTheory/ClassicalGroups | Layer 6: interlacing; the pair (b,b) restricts to SU₂ weight 0. |
| RepresentationTheory/LieGroups | Layers 2 and 7: finite-dimensional closed real matrix groups and compact complexification. |
| RepresentationTheory/CompactGroups | Layers 3–5: matrix coefficients, normalized Haar orthogonality and Peter–Weyl. |
| ClassFieldTheory | Layers 5,8,9: local invariant/splitting, local existence, topological Weil group and arithmetic degree. The division-character classification is missing: S03. |
| LanglandsParameterStacks | LP0.4,LP0.5,LP1.11–LP1.12: geometric degree, classical parameter definition and WD comparison. The package explicitly extends the exceptional complex specialization and changes the diagonal twist, not the order of Weil multiplication. |
| SmoothRepresentationsOfLocalGroups | SR.0.2,0.4,2.1–2.3,2a.1,3.1–3.4,5.1,5.2; specifically second-adjointness, cuspidal-splitting, harish-chandra-tempered-support, isotypic-quotient-regular, wd-raw-parameters and classical-llc-normalization. The regular quotient acts by χ(a)/χ(b); arithmetic Frobenius in its WD convention scales N by q. Its stated Whittaker uniqueness is GL₂-specific. |
| SmoothRepresentationsOfLocalGroupsPartII | Design SRU.0,2,3,4. The declared commuting-action, Ext, wavefront, Whittaker, reducibility, Steinberg-restriction and torus-distinction extensions are not already supplied by its unitary and isolation targets. |
| MetaplecticAutomorphicForms | §§0.15–0.17,1.1,2.4a–2.7,3.4–3.8,3.34,3.37–3.40, including 3.38a. Characteristic-zero F allows dyadic residue fields. The orthogonal-minimal comparison in 3.39 retains temperedness; the division ternary theorem in 3.40 retains supercuspidal input. |
| EndoscopicTransferAndUnitaryTraceComparison | §§4.7a,10.30–10.31: JL character normalization, full WD versus Frobenius-semisimple parameters, and classical inner-form transfer. None asserts all characters of a cubic division group factor through reduced norm. |
| ModularityAndLanglandsExtensions | §3.5(vi): the nongeneric GSp₄ supercuspidal Plancherel comparison, needed instead of a generic-only Shahidi invocation. |
| AutomorphicLFunctionsAndLocalFactors | AL.4 l-group-local-factor takes a supplied representation r; normalized-rs-period uses opposite Whittaker characters and is nonzero. Identity spin Euler polynomial is (1−T)⁸. |
| AutomorphicLFunctionsAndLocalFactorsPartII | Design D.6 constructs generalized classical doubling factors. It does not already construct the two exceptional spin integral/factor gaps. |
| AutomorphicFormsOnReductiveGroups | §§2.1–2.7,3.1–3.5,4.1–4.2,5.4 and its ALS.F.6 contract. Discrete-series classification and Vogan–Zuckerman modules do not by themselves assert the requested uniform far-from-walls theorem. |
| AutomorphicSpectralTheory | §§1.1–1.2,2.4–2.6,4.4: normalized induction, convergence, meromorphic continuation, residues and residual spectrum. The exceptional poles remain owned here. |
| ArithmeticLocallySymmetricSpaces | ALS.F.6: cusp-form rapid decay with the specified central character and automorphic finiteness conditions. |

All **12** declared gaps have the same slug, named supplier and needs in the README and design/plan.json. The expanded rank-one contract separates nonzero-exponent supercuspidal reducibility from zero-exponent discrete-series commuting algebras; these are precise related inputs, not an assumption of the exceptional lift tables. Conditional supply is accepted for these contracts. S03 concerns an additional undeclared input, not absence of a declared supplier's implementation.

Ownership searches used the roadmap service over main and indexed open heads, direct searches of board packages and the supplied sibling checkouts, and object searches in both pinned libraries. The searched objects included null octonion subspaces, Albert/Freudenthal models, exceptional minimal representations, theta and Jacquet modules, spin factors, quaternion periods, reduced norm, commutators and SK₁. The existing split/compact Albert, spin, classical theta and generic smooth-category owners are cited; the exceptional comparisons remain this roadmap's responsibility. GeneralAlgebraicKTheory and AdelicAlgebraicGroups were additionally inspected for S03. The later LocalLanglandsCorrespondenceForG2 is mentioned only as a consumer, not used as a supplier. No declaration-name collision is possible in this empty acceptance namespace.

**Locators:** 157 explicit cached-text line-locator occurrences were resolved: GS 90, LL 24, SW 7, Sav 6, GrS 6, HKT 5, GS04 5, GG 4, LT 2, Pra 2, Li 2, HS 2, MS 1, G99 1. The 147 occurrences outside GrS/Li/HS were compared with the readable cited statements or proof passages; the ten GrS/Li/HS occurrences were located, with mathematical-content limitations below. This counts occurrences, not independent theorems. In particular the repaired Sav decomposition, GG odd-Weil cases, GS04 lift tables, MS minimal models and LT fixed-space formula were read directly this round. GS is the cached arXiv v1, and its numbering was used consistently. The 17 manifest works consist of 14 cached works and the three settled waived/uncertified entries.

The read-only dependency gate returned:

```text
depcheck: 149 roadmaps, 1011 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The internal cycle formerly involving division Ext is removed by §3.12; S02 records the remaining incompatible internal proof invocation. The citation resolver found no unresolved roadmap/name citation; its library detection was not used as evidence of a pinned declaration, which was checked directly instead.

The reviewed git diff contains nine files, all inside packages/ExceptionalThetaCorrespondencesForG2. README and docstrings contain no pull-request number or process instructions. Suggested.lean has one import Mathlib, no other imports, no set_option, no lemma, no executable command and no admitted data. The README's coordinate formulas and dimension calculations are mathematical constructions and Checks, not a computational-algorithm project. No source text was copied into the report; source errors are paraphrased below.

## Not verifiable

- GS05 and HPS remain waived; Var remains uncertified. Their precise minimal-model, real infinitesimal-character and residue-two character-expansion content was not certified from text. No renewed source request was made.
- GrS has extensive broken mathematical-font extraction. Chapter 5 §3 Lemma 3.4, §4 Proposition 4.5/Corollary 4.9 and Chapter 6 Lemma 2.9 were located, but all displayed stabilizer, coefficient and orbit formulas could not be reconstructed reliably. LL's later restatements and the readable prose were checked; they do not certify every GrS formula.
- Li Theorem 3.1 is readable; parts of Theorem 4.8's formulas are damaged. The low-rank argument was tested at ranks 0,1,2 and its parity obstruction checked, but the full analytic classification was not certified from that extraction.
- HS §6.2 gives the readable pole list 1,5,9 for r=3,d=8. The precise residue constituent at 5 and parts of Lemma 4.1/Corollary 4.2/Proposition 4.3 have damaged formulas. Only their locations and readable assertions were certified.
- The exact A₁ inducing parameter in GS's E₇ top Jacquet factors and the homogeneous A₅ realization was not independently recovered from the cited shorthand. The finite-length reductions and displayed modulus characters were checked; this does not certify the unspecified model parameter.
- No Lean elaboration or build was run, as required by the read-only brief. There are no named declarations on which to perform the requested #check binder test. Source reading and object searches cannot certify future elaboration of the planned carriers.
- Ownership searches covered the supplied local copies and the service's main/open-head index. Open work without supplied files was not individually audited beyond indexed search hits; no claim is made to have read every unrelated open roadmap.

## Source issues

These describe defects in the cited sources, not additional package findings. Effects refer to the source result or proof; most are already avoided by the roadmap.

- **Error** in GS at §2.1, printed p.6 (GS lines 228–230): the source says nonzero norm guarantees a separable quadratic generated algebra; it should be restricted to nonscalar octonions with nonzero characteristic discriminant; affects a stated result.
- **Misprint** in GS at Proposition 3.1(i), printed p.9 (GS line 303): the source says reducibility occurs only at the positive half exponent; it should be at both half exponents; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), printed p.9, and Proposition 3.2(iii), printed p.11 (GS lines 332,334,376): the source says the character-induced Q quotients have exponent one-half; it should be exponent one; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), printed p.9 (GS line 334): the source says the cubic-character middle module induces twisted Steinberg; it should be induction of the one-dimensional character; affects a stated result.
- **Misprint** in GS at §3.4(4), printed p.14 (GS line 495): the source says the centralizing short-root SL₂ is long-root; it should be short-root; affects nothing.
- **Misprint** in GS at §4.2, printed p.15 (GS line 550): the source says both three-dimensional SL₃ summands are standard; it should be standard plus dual; affects a stated result.
- **Misprint** in GS at diagram (4.1), printed p.16 (GS line 573): the source says the triality factor is Spin₄; it should be Spin₈; affects nothing.
- **Misprint** in GS at Theorem 7.2, printed p.23 (GS line 844): the source says the final clause is numbered ii; it should be iii; affects nothing.
- **Error** in GS at §8.1, printed p.24 (GS lines 888–891): the source says its half-exponent family exhausts nongeneric selfdual PGL₃ modules; it should be supplemented by the trivial module with normalized exponents 1,0,−1; affects a stated result.
- **Error** in GS at Theorem 8.5(iii), printed p.27 (GS line 1023): the source says every generic plus input has generic small lift; it should be restricted to tempered inputs, with nontempered quotients treated separately; affects a stated result.
- **Error** in GS at §9, printed p.30 (GS lines 1127–1128): the source says the displayed six hyperplanes are all root walls; it should be nine, including sᵢ+Σsⱼ=0; affects a stated result.
- **Error** in GS at §9, printed p.30 (GS lines 1129–1132): the source says its negative-quarter quadratic form is invariant and its third simple root is (0,2,2); it should be Σsᵢ²+(Σsᵢ)² and root (−1,1,1); affects a stated result.
- **Misprint** in GS at §§10.1–10.2, printed pp.31–32 (GS lines 1174,1201): the source says the P₂ and P₁₃ inductions land in G₂; it should be PGSp₆; affects a stated result.
- **Misprint** in GS at §11.2, printed p.34 (GS line 1272): the source says the oscillator central character belongs to U/[U,U]; it should be on the Heisenberg quotient U/Z(U); affects a stated result.
- **Misprint** in GS at §11.2, printed p.36 (GS lines 1335–1339): the source says the alternate maximal unipotent uses positive β and later writes V/V′₂; it should be negative β and V′/V′₂; affects the proof.
- **Misprint** in GS at Lemma 11.4, printed p.36 (GS lines 1346–1358): the source says an unweighted root integral supplies the target functional; it should be weighted by the inverse target character; affects a stated result.
- **Misprint** in GS at Proposition 13.3 proof, printed p.41 (GS line 1560): the source says the Q quotient comes from rP₂(Π); it should be rQ(Π); affects the proof.
- **Misprint** in GS at Proposition 13.7, printed p.47 (GS line 1785): the source says the ambient factors lie in M₃; it should be the ambient M₂; affects nothing.
- **Misprint** in GS at Lemma 13.8 proof, printed p.47 (GS lines 1818–1822): the source says the relevant Borel lies in the first GL₂ factor; it should be the second, acting on τ₂; affects the proof.
- **Misprint** in GS at Lemma 13.8 proof, printed p.48 (GS lines 1848–1850): the source says the resulting pair contains JP(τ₁); it should be JP(τ₂); affects the proof.
- **Gap** in GS at Lemma 13.8 proof, printed p.48 (GS lines 1851–1853): the source says the other proper-Levi cases follow without calculation; it should be accompanied by their Jacquet-support and extension-vanishing arguments; affects the proof.
- **Misprint** in GS at §14.2, printed p.50 (GS lines 1916–1918): the source says the multiplicity Hom is taken over L×M₂ into an L-module; it should be over L with the commuting M₂ action retained; affects the proof.
- **Misprint** in GS at §15.1, printed p.52 (GS line 2016): the source says tempered compatibility is Theorem 15.1(v); it should be Theorem 15.1(iv); affects nothing.
- **Gap** in GS at Theorem 15.2(ii), printed pp.52–53: the source says I₃(τ) is the irreducible lift for the stated containing-one parameters; it should be supported by the missing stχ×1 Siegel irreducibility argument; affects the proof.
- **Misprint** in GS at §15.1, printed p.54 (GS line 2071): the source says σρ comes from JL(τ); it should be JL(ρ); affects nothing.
- **Misprint** in Sav at equation (1.5), printed p.395 (Sav line 89): the source says the third trace pairing uses cy; it should be cz, pairing the third coordinates; affects a stated result.
- **Misprint** in Sav at Corollary 5.2 proof, printed p.399 (Sav line 266): the source says both Jacquet descriptions use U₁,L₁; it should be U₂,L₂ for the second description; affects the proof.
- **Gap** in LL at Lemma 10.1 proof, printed p.27 (LL lines 1136–1138): the source says absence of full-rank coefficients leads directly to rank two; it should be preceded by exclusions of rank zero and the odd-rank covered case; affects the proof.
- **Error** in HKT at Lemma 4.6 proof, printed p.21 (HKT lines 905–908): the source says every nonzero spinor has G₂ stabilizer; it should be restricted to nonisotropic spinors, with existence of a fixed one justified; affects the proof.
- **Misprint** in HKT at Theorem A.5, printed p.25 (HKT lines 1063–1067): the source says the spherical geometric sum ends at exponent 3(n−1); it should be through 3n, giving primitive value 1; affects a stated result.
- **Misprint** in GrS at Chapter 5 §4, printed p.202 (GrS line 6861): the source says Q(z) is quaternionic; it should be the quadratic algebra generated by z; affects nothing.
- **Misprint** in SW at Lemma 5.5, Stage 2, printed p.40 (SW line 2122): the source says the chosen character value is nonzero; it should be different from 1; affects the proof.
- **Gap** in SW at Lemma 5.5, Stage 2, printed pp.40–41 (SW lines 2141–2152): the source says isotropic dimension puts αβ in span(α,β,γ); it should be restricted to independent triples, treating (u₁,u₂,0) separately since its product v₃ is outside the span; affects the proof.
- **Misprint** in SW at §5.2, printed p.43 (SW line 2314): the source says the normalized intertwiner's output has parameter s; it should be parameter 1−s; affects a stated result.
- **Misprint** in GS04 at Theorem 21 proof, printed p.806 (GS line 656): the source says the PGL₃-module calculation takes Jacquet coinvariants of θ(π); it should be the indicated successive coinvariants of Π, as the preceding surjection requires; affects the proof.
- **Misprint** in LT at Theorem 1.3.1(1), printed p.5 (LT line 270): the source says the K-basis powers run from 0 through n; it should be 0 through n−1, since ϖⁿ lies in F and repeats the scalar summand; affects a stated result.
- **Misprint** in LT at Theorem 1.3.1(3), printed p.5 (LT line 272): the source says Tr(xϖʲ)=0 also for j=n; it should be restricted to 1≤j<n, since Tr(ϖⁿ)=nϖ_F≠0; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "80ca364d60582ddd87e737b6ed31373d6c4b7c37", "job": "RT-ExceptionalThetaCorrespondencesForG2~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
