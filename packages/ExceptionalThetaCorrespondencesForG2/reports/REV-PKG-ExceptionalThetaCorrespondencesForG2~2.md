<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1314#issuecomment-6396996638 -->
Review (codex) of da74536

Verdict: needs_changes

1. **F01** (P2) The discrete-series lift formulas need supercuspidal inducing data

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:1349, §8.4: “For unitary discrete-series GL₂ τ … θH(δQ(τ))=δ₂(τ) when ωτ=1; θH(δP(τ))=δ₁₃(τ) in the selfdual determinant-trivial case.”

   **Claim:** The initial discrete-series quantifier also governs the two δ formulas. Their actual domain is the selfdual supercuspidal representations with trivial central character.

   **Witness:** GS line 2044 explicitly requires supercuspidality. For τ=St_GL₂, GS line 359 gives socle πgen[1]⊕πdeg[1] in I_Q(1/2,τ), with two constituents, rather than the uniquely named δQ(τ).

   The Steinberg representation is unitary, selfdual and has central character 1, so it satisfies the printed hypotheses. Section 1.4 defines δQ only in the supercuspidal case; §1.5 itself records the two Steinberg socle constituents. They cannot be silently combined into the δ formula: πdeg[1] belongs to the division branch, whereas πgen[1] has its own nonzero H lift.

   **Exact repair:** Keep the unshifted I_Q(τ) statement for every unitary discrete-series τ, with the existing constituentwise interpretation when reducible. Begin a separate sentence requiring τ to be unitary, selfdual and supercuspidal with ωτ=1 for both δQ→δ₂ and δP→δ₁₃. Keep Steinberg and quadratic twists in their separate entries. Add the negative-control Check τ=St_GL₂: the socle at 1/2 has two constituents, so these two δ formulas do not apply. This repair excludes precisely the displayed counterinstance and retains GS Theorem 15.3(ii), p. 53.

2. **F02** (P2) The WD comparison identifies opposite Frobenius normalizations

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:272, §0.7: “a Weil–Deligne parameter in the sense of LanglandsParameterStacks LP1.11–LP1.12 with the same Frobenius normalization”. Also Conventions at line 29 and the contract at line 69.

   **Claim:** A coefficient-field isomorphism turns the displayed complex WD pair into the supplier's WD pair without a normalization adapter.

   **Witness:** TauCetiRoadmap/LanglandsParameterStacks/README.md:367 makes arithmetic Frobenius scale N by q. At q=3 and N=E₁₂, the package's pair gives N/3; the supplier requires 3N. These are unequal.

   Take the parameter with trivial Weil restriction and the identity Deligne SL₂ in GL₂. The package's r(Fr)=diag(1/√3,√3) has Ad(r(Fr))E₁₂=E₁₂/3. A coefficient isomorphism fixes the rational numbers 1/3 and 3, so cannot repair this. The N=0 example conceals the discrepancy. The supplier's geometric-degree convention is explicit, including its inverse-Frobenius Check at line 374; this is a verified interface mismatch, not a missing supplier.

   **Exact repair:** Preserve the package's declared dictionary, but replace the identity claim by a named conversion on W_F×SL₂ parameters. For a parameter φ define the supplier-normalized pair using r_LP(w)=φ(w,diag(|w|⁻¹ᐟ²,|w|¹ᐟ²)) and the same N. State deg_LP=−deg_arithmetic and prove the supplier's scaling equation before applying LP1.12. Record this distinction in the supplier contract and in any parameter comparison using it; do not assert equality with the original r. On the witness this gives Ad(r_LP(Fr))N=3N and Ad(r_LP(Fr⁻¹))N=N/3, exactly the two supplier values. Include both this nonzero-N Check and N=0. Do not attempt to invert arbitrary elements of the nonabelian Weil group as a homomorphism.

3. **F03** (P2) The SO₃ centralizer needs its embedding specified

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:243, §0.6: “Z_G₂(SO₃)=μ₃⋊C₂=S₃”. The API at line 249 refers to “the indicated SO₃”, but no SO₃→G₂ map has been defined.

   **Claim:** The abstract subgroup name SO₃ determines the claimed centralizer.

   **Witness:** GS lines 284–286 use SO₃⊂SL₃⊂G₂. GS lines 452–456 distinguish this subregular subgroup, with centralizer order 6, from the principal SL₂ image, with centralizer order 1.

   Over ℂ the principal SL₂ image also factors through PSL₂≅SO₃: its seven-dimensional module is Sym⁶(ℂ²), on which −1 acts trivially. It is therefore a competing SO₃ subgroup, not a counterexample outside the stated group type. On the intended subgroup the seven-module is 1⊕3⊕3, with a one-dimensional invariant space; on the principal subgroup it is irreducible of dimension seven, with zero invariants. The current dimension Checks for SL₃ and Spin₇ do not select between these embeddings.

   **Exact repair:** Define the SO₃ map as the determinant-one isometry group of a nondegenerate symmetric form on the standard three-module of the fixed long-root SL₃, followed by SL₃→G₂. Use that map in the centralizer assertion, its API and the subregular labels in §1.9. Add a Check distinguishing seven-module invariant dimensions 1 and 0 for the subregular and principal embeddings, and centralizer orders 6 and 1. With this qualification, the asserted S₃ centralizer agrees with GS §2.6, p. 8.

Three P2 findings remain. The eleven findings in the previous review are repaired. The package is repairable within its scope; it does not need a replacement roadmap. I reviewed the mathematics and wrote this verdict without delegating either.

## Verified sound

I read all 96 numbered targets, all 96 Needs lines, all eleven layers' Examples and Dependencies, the conventions, supplier contracts, references, metadata and source manifest. I compared every previous finding with the repaired text before reviewing the additions. Untouched targets were carried forward only where the previous adversarial row contained an actual computed value. Rows that merely cited a theorem or said “true”, including §§4.3, 5.6, 5.9, 6.1–6.2, 7.8, 8.5–8.9 and 10.6, received a fresh statement/source/interface check. The tables below concentrate on the fifteen sampled targets, repaired passages, headline theorems and the three findings; they are not a claim that numerical examples prove the general theorems.

The main checkout was 5f173a7b9ac37eb6b62d01eb3db5047b92d19363. The checked pins were Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Ownership searches used the roadmap service's 2026-10-25 index of 362 open roadmap heads as well as main, the board packages and its supplied package index. The index was read before drawing ownership conclusions. No claim of absence is based solely on this branch's package files.

**Previous findings, one by one.** F01–F11 below are the identifiers in the repair report. Quotations are from the repaired package, not endorsements of the repair report's assertions.

| Previous finding | Repaired passage and location | Independent check | Status |
|---|---|---|---|
| F01: unowned exceptional prerequisites and generic duplication | README:17: “These are the exceptional proof obligations owned here; the generic supplier inputs are exactly the contracts below.” | The former generic checklist is replaced by owned exceptional targets and eleven supplier contracts. Jordan descent, E₈/F₄, local/global minimal comparison and low-rank application are actual targets. All eleven slugs match the plan. | Repaired |
| F02: padded Lean predicates and null-subspace targets | Suggested.lean:7: “No headline theorem is statable at the pins; the missing carriers are:” | There are zero declarations. The removed predicates and boundary statements remain mathematical prose. The null-space zero case in README:173 has dimension 0, rather than an artificial positivity hypothesis. | Repaired |
| F03: inaccurate native-carrier inventory | README:49: “Their contracts do not assert reductivity or identification with the pinned Chevalley groups.” | Opened the native E₇, E₆, D₄ carriers, diagram automorphisms, seven-module and smooth-discrete definitions. Matrix closure, Lie representation, smoothness and admissibility are now distinguished. | Repaired |
| F04: theta/period contragredient | README:634: “Hom(R_J(E),π)”; README:831 uses the dual input in the corresponding dual formula. | For a nonquadratic character of C₃, Hom(χ,χ) has dimension 1 and Hom(χ,χ∨) dimension 0. The repaired periods agree with GS's quotient convention. | Repaired |
| F05: generic restriction ownership | README:1044: “AutomorphicLFunctionsAndLocalFactors, ‘Central periods’, target normalized-rs-period, with m=n−1 and π_m=W∨.” | Opened that exact target and Pra Theorem 3, Pra line 250. Currying the nonzero pairing into the smooth bidual gives the quotient; this is no longer a duplicate generic restriction construction. | Repaired |
| F06: spin criterion's missing direction and normalization | README:1421: “The latter residue argument is proved here, rather than assumed in the spin-factor contract.” | SW lines 1971–1982, 2246–2298 and 2399–2490 separate the F₄ reducibility, E₈ input and BG residue argument. At q=2 the ambient character is 1/64, giving s=−1. | Repaired |
| F07: imprecise wavefront, Steinberg and real-unitary contracts | README:81: “an F-rational nilpotent orbit O maximal among the orbits with nonzero coefficient”; README:83 quantifies closed N; README:113 fixes the two real groups. | Orbit normalization, finite multiplicity, arbitrary smooth χ, and group-dependent uniform C are explicit. The uses retain those hypotheses. | Repaired |
| F08: missing definition APIs and discriminating Checks | README:259: “cζc⁻¹=ζ⁻¹=ζ²≠ζ”; README:600 records the rational-point obstruction. | Each of the eight identified sections (0.3, 0.5, 0.6, 0.9, 0.10, 2.2, 2.3, 2.6) now has its API and at least three Checks. Recomputed their values below. R03 is a separate embedding defect. | Repaired |
| F09: incorrect locators | README:1038 cites Pra Theorem 3; README:1277 cites GS Theorem 12.4; README:1460 cites LL Lemma 10.4. | Opened Pra line 250, GS line 1468, LL line 1162 and LL lines 620–663. Opposite-algebra locators in references and manifest now say pp. 14–15. | Repaired |
| F10: treating P₁₃ as maximal | README:310: “The three maximal parabolics P₃, P₂, P₁ have moduli …” | P₁₃ is separately the flag parabolic. At q=2 the three stated modulus values are 1/4, 1/32, 1/8. | Repaired |
| F11: vacuous opposite-algebra Check and mandatory route | README:475: “One proof route starts”; README:577 distinguishes Jordan equality from the opposite associative algebra. | For invariants 1/3 and 2/3 the associative algebras differ, their Jordan products agree, and inversion reverses the order of multiplication before passing to the opposite group. | Repaired |

None was marked “not actionable in this package”; none of R01–R03 re-raises such a settled finding. The repaired patterns were also checked elsewhere: duals in §§4.7, 6.1–6.2, 7.5–7.6 and 10.3; normalizations throughout the five Jacquet filtrations and spin comparison; inherited hypotheses in the lift tables; and generic ownership in the classical-theta and global analytic inputs.

**Seeded source sample.** No additional locator was flagged unverified by the author. These are checks against the actual cached source versions, including their hypotheses; not just matching titles.

| Target | Locator opened | What the text supports; result |
|---|---|---|
| 0.1 Octonion model | GS §2.1–2.2, p. 6, GS lines 223–235 | Eight-dimensional split composition algebra and Aut(O) of type G₂. The test-algebra group comparison is explicitly this roadmap's target, not a claimed theorem already present in Tau Ceti. The separate rank-two assertion in the source is erroneous; see Source issues. |
| 0.6 Dual inclusions | GS §2.6, p. 8, GS lines 282–288; Theorem 15.1(v), p. 52, GS line 2009; MS Theorem 5.4, p. 15, MS lines 586–590 | SL₃ and its standard SO₃ subgroup, commuting root SL₂ factors, and the spinor-stabilizing G₂ embedding. The package drops the SO₃ embedding: R03. |
| 0.8 Components | GS §3.4, pp. 12–14, GS lines 411, 452–460; LL Main Theorem (vii), p. 4, LL line 160; LL p. 9, LL lines 413–414 | Raw π₀ centralizers and quotient by the dual center are distinct. The fixed split-group quotient uses the appropriate center; G₂ has trivial center. No enhancement bijection is silently imported from the downstream LLC. |
| 1.1 P-series, supercuspidal | GS Proposition 3.1(i), pp. 8–9, GS lines 299–309 | Selfduality, central character and real exponent cases agree. The negative reducibility exponent is restored correctly; the source's one-sided iff is a misprint. |
| 1.5 Q-series, Steinberg/character | GS Proposition 3.2(ii)–(iii), pp. 10–11, GS lines 354–376 | Length-three Steinberg case, two socle constituents, quadratic twists and character cases agree with the roadmap's corrected exponent. That distinction supplies R01's counterinstance. |
| 1.8 Depth-zero labels | GS §3.4, p. 13, GS lines 455–481; Proposition 7.1, p. 23, GS lines 835–837 | Three named representations and the order-three character labeling are supported. The text does not claim these are all unipotent supercuspidals. |
| 2.3 Triality/see-saw | GS §§4.3–4.4, p. 16, GS lines 560–583 | Cubic étale E, norm-one torus, trialitarian group and commuting subgroups agree. The package correctly separates a group-scheme quotient from surjectivity on F-points. |
| 2.5 Big/small theta | GS §5, pp. 16–17, GS lines 587–594, and quotient convention in the introduction | Maximal π-isotypic quotient π⊗Θ(π) and semisimple quotient agree. The corrected period formula uses π, not π∨, for Θ(π). |
| 3.3 Raw E₆ input | GS04 Proposition 4, p. 798, GS04 lines 273–282; Proposition 6, p. 799, GS04 lines 309–320 | The two determinant twists and orbit pieces support the stated raw input and noncuspidal finiteness. Both zero-orbit and nonzero-orbit contributions are retained. |
| 5.1 Division Howe | GS Proposition 7.1/Theorem 7.2, p. 23, GS lines 829–853; Sav §5, pp. 398–399, Sav lines 234–293 | Θ(1)=πdeg[1], nongenericity, supercuspidality for nontrivial input, finite length and unique irreducible quotient agree. The all-input nonvanishing assertion is kept separately with p≠3. |
| 7.4 Enhanced FJ uniqueness | GS Lemma 11.3, p. 34, GS lines 1282–1284; proof pp. 35–36, GS lines 1295–1342 | Generic irreducible π, either tempered or with Q-supercuspidal support, and the strict s<1/2 bound agree. Q-support need not be tempered. The source does not restrict s to positive values. |
| 8.4 Tempered lift table | GS Theorem 15.3, p. 53, GS lines 2036–2060 | Part (i) allows discrete-series τ; part (ii) requires selfdual supercuspidal τ with trivial central character. R01 records the omitted hypothesis. Parts (iii)–(v) match the separate entries. |
| 8.6 D₆ lift | GS Lemmas 15.4–15.5 and proof, p. 54, GS lines 2076–2093 | The split SO₃ first occurrence is zero, SO₅ supplies τρ, and the full big D₆ lift is τρ, not merely its cosocle. |
| 9.6 Compact SU₂ periods | LL Lemma 10.4 and proof, p. 28, LL lines 1162–1166 | Every irreducible finite-dimensional compact-real G₂ representation has invariants under the quaternion pointwise stabilizer. The GL₃→GL₂ interlacing proof applies to SU₃→SU₂ after determinant twists. |
| 10.2 Global residue | HS Theorem 6.4/proof, pp. 198–200, HS lines 655–675; local discussion HS lines 345–355, 438–440; LL §10.2, p. 29, LL lines 1198–1209 | For r=3,d=8 the Eisenstein family has simple poles 1,5,9; LL uses the minimal residual realization. Local identification and nonspherical comparisons are retained as obligations. “Family has poles” does not mean every section has a nonzero residue. |

Additional texts omitted or insufficiently checked in the earlier round were opened: MS Theorem 1.1 (including its residue-characteristic-two discussion), Theorems 4.3 and 5.3; GG Theorem 9.1(d), Propositions 8.1/8.3/8.4 and §9.5, plus Lemma 9.4; SW Theorems 3.9, 4.7, 5.3 and the two directions of §5; G99 Theorem 11.3 with p>5; Li Theorems 3.1 and 4.8; HKT A.8–A.10. Li's displayed formula lost in the extraction was checked on printed p. 45 of the cached PDF: the theorem requires rank β=l<r_G and gives a character twist of a theta lift. Thus it does not authorize discarding the pure-rank and metaplectic distinctions in §9.3; the package now explicitly retains them.

**Computed adversarial witnesses.** “Pass” means the displayed instance agrees with the stated law and the checked source/interface. “Conditional” identifies a declared supplier contract. Values are shown on both sides, or for the intended and competing models. No new theorem is inferred merely from a finite sample.

| Statement | Instances tried | Computed values on the two sides / competing models | Result | Change |
|---|---|---|---|---|
| 0.1 automorphism law | Identity; octonion conjugation; scalar multiplication by 2 | Identity sends 1 to 1; conjugation gives conjugate(u₁u₂)=−v₃ versus conjugate(u₁)conjugate(u₂)=+v₃; scalar map sends 1 to 2≠1 | Pass; wrong models excluded | None |
| 0.1 test-algebra comparison | A=F[ε]/(ε²), diagonal SL₃ infinitesimal action D(u₁)=u₁, D(u₂)=−u₂ | D(u₁)u₂+u₁D(u₂)=v₃−v₃=0=D(v₃); (1+εD)(1−εD)=1 | Pass; reduced points alone would miss this datum | None |
| 0.2 null object and orbit bounds | Zero subspace; span(u₁,v₂); span(u₁,v₁) | Dimensions 0,2,2; products in the second span are 0, while u₁v₁ is a nonzero diagonal idempotent. Thus the latter span fails the law | Pass | None |
| 0.3 P/Q normalization | Sum the five positive radical roots | 2ρ_P=(9,6)=3(3,2), 2ρ_Q=(10,5)=5(2,1); at det=ϖ,q=2, moduli 1/8 and 1/32 | Pass | None |
| 0.4 cubic Fourier orbit | f=xy(x−y); f=x³ | Binary-cubic discriminants 1 and 0; the second is excluded from the étale locus | Pass | None |
| 0.5 stabilizers | F×F and a quadratic field; diag(2,1/2,1) | Connected dimensions both 8; setwise/pointwise quotient order 2; top/bottom scaling product 2·1/2=1 | Pass | None |
| 0.6 dual inclusions | Standard restrictions, central kernel | 7=1+3+3; 8=1+7; diagonal (−1,−1) has image 1, each individual central sign does not | Pass | None |
| 0.6 SO₃ centralizer | Standard SO₃ in SL₃ versus principal SO₃ in G₂ | Fixed dimensions in 7 are 1 versus 0; centralizer orders 6 versus 1. In the intended S₃, cζc⁻¹=ζ²≠ζ; in C₆ it equals ζ | Fails to specify which subgroup | R03 |
| 0.7 WD dictionary and supplier | q=3, N=E₁₂; N=0 control | Arithmetic Fr: original 1/3·N versus supplier 3·N; proposed adapter 3·N versus 3·N. At N=0 both give 0 | Mismatch exposed only by nonzero N | R02 |
| 0.7 parameter domain | Trivial Weil and SL₂ parts; principal SL₂; GL₁ norm character | Trivial image has size 1 and is bounded; norm values at Frⁿ are 3⁻ⁿ, unbounded in both integer directions. Principal G₂ SL₂ has centralizer order 1; trivial parameter has centralizer dimension 14 | Pass | None |
| 0.8 raw/fixed-split components | Principal SL₂ in SL₃ and Spin₇; subregular G₂ | Raw center orders 3 and 2 become 1 after quotient; G₂ subregular has 1²+2²+1²=6, unchanged by its trivial center | Pass; both quotient directions checked | None |
| 0.9 Jordan model and parabolics | Scalar z, three maximal parabolics | Scalar action z²z⁻²=1; dim ∧²F⁶=15 versus Albert dimension 27; at q=2 the three stated modulus values are 1/4,1/32,1/8 | Pass | None |
| 0.10 Weyl convention | s=(1,2,3), r(s)=(6,−3,−2) | Correct invariant 14+36=50=49+1; the source's printed quadratic expression gives 5 versus 195/4. Reflection squared returns (1,2,3) | Pass for roadmap, source error | None |
| 1.1 supercuspidal P-series | Selfdual central character 1; selfdual nontrivial center; nonselfdual | Reducibility sets {−1/2,1/2}, {0}, ∅ respectively; −1/2 is the dual of +1/2 | Pass | None |
| 1.5 Steinberg/character Q-series | τ=St_GL₂ at s=1/2; quadratic character case | Socle length 2 and total length 3; the character quotient's short-root exponent has squared norm 2, versus 1/2 at the source's erroneous exponent 1/2 | Pass; supplies R01 witness | None here |
| 1.8 depth-zero labels | Three cube-root labels; inverse character | Labels {1,ω,ω²}; inversion fixes 1 and exchanges the two nontrivial labels, with ω·ω²=1 | Pass | None |
| 1.9 parameter labels | Principal and specified subregular image | Principal component order 1; subregular component order 6, with irreducible dimensions 1,2,1 | Pass once embedding is named | R03 cross-reference |
| 1.10 nongeneric cubic finiteness | Trivial G₂ representation and nontrivial ψ_E | Twisted relation is (1−ψ_E(n))v=0 with a nonzero scalar, so coefficient dimension 0; no nonzero generic coefficient is created | Pass; general finiteness conditional on wavefront contract | None |
| 2.1 Jordan identities | Scalar x=2, direction y=3; four split Jordan sizes | x#=4, (x#)#=16=N(x)x=8·2; T(4,3)=36=dN₂(3). Lie dimensions 14,28,78,133 from 8+dim Der(J)+6 dim J | Pass | None |
| 2.2 opposite cubic algebras | Brauer invariants 1/3 and 2/3 | Invariants unequal, but x∘y=(xy+yx)/2 is identical after reversing multiplication; inverse in the opposite group gives (xy)⁻¹=y⁻¹x⁻¹ | Pass; distinguishes associative and Jordan claims | None |
| 2.3 triality rational points | E=F³; scalar determinant square class of ϖ | dim Res_E/F SL₂=9, dim PE×=2, central kernel order 2; v(ϖ)=1 is odd versus even valuation for a square, so rational surjectivity cannot be inferred from the isogeny | Pass | None |
| 2.4 minimal models | Split E₆/E₇ spherical realization | Spherical fixed-space dimension 1 versus 0 in a nonspherical model; the package does not force nonsplit forms to have this spherical vector | Pass at readable secondary characterization | None; GS05 waived |
| 2.5 theta/period dual | C₃ with χ(g)=ζ, ζ³=1≠ζ | Hom(χ,χ) dimension 1; Hom(χ,χ∨) dimension 0 because ζ≠ζ² | Pass after previous repair | None |
| 2.6 involution normalization | T, −T and 2T on a spherical vector | Eigenvalues +1,−1,2; squares 1,1,4. Square-one alone fails to distinguish T from −T; the fixed spherical vector does | Pass | None |
| 3.3 E₆ raw Jacquet twists | det=ϖ,q=2 | Twists 2⁻³ᐟ² and 2⁻¹ᐟ² have ratio 1/2, not 1; the two nonzero orbit ranks plus zero orbit give three pieces | Pass | None |
| 3.11 tempered preservation | Steinberg branch and positive standard quotient | Tempered indicators (1,1) for St_G→St_H; (0,0) for positive-exponent Langlands quotients; 0 is not a positive exponent | Pass | None |
| 4.1 triality dual periods | The same C₃ character test, with dual input | Hom(χ∨,χ∨) dimension 1 versus Hom(χ∨,χ) dimension 0 | Pass; agrees with 2.5 rather than reversing only one side | None |
| 4.3 Ext obstruction | Discrete series δ and tempered π, compact center | Projectivity in the supplied Schwartz category gives Ext¹=0; the comparison gives smooth Ext¹=0. No equality with projectivity in the whole smooth category is claimed | Conditional on schwartz-ext | None |
| 4.5 open-orbit restriction | s=1/2 and a tempered nongeneric input | s/2+1/4=1/2, s+1=3/2; forbidden positive-exponent Hom contributions are 0, leaving exactly the open-orbit Hom contribution | Pass under stated vanishing route | None |
| 4.7 finite period chain | Finite nonzero cubic multiplicity d=1 | Endpoint dimensions 1 and 1 force intermediate dimension 1; two independent quotients give 2>1 | Pass; finiteness is used, not assumed from infinite-cardinal arithmetic | None |
| 5.1 division Howe | τ=1; nontrivial τ and its proper Jacquet modules | Θ(1)=πdeg[1] has small-lift length 1 and generic dimension 0; for τ≠1 both maximal proper G₂ Jacquet modules are 0 | Pass | None |
| 5.2 universal division nonvanishing | Residue characteristics 2 and 3; q=2,m=1 | gcd(3,2)=1 versus gcd(3,3)=3; torus multiplicity bound q^m gives 2. The separate p≠3 assertion admits 2 and excludes 3 | Pass; the other local theorems retain p=3 | None |
| 5.3 opposite-algebra transport | Degree-three division algebras, noncommuting x,y | Brauer invariant 1/3↦2/3; i(xy)=y⁻¹x⁻¹=i(x)·op i(y). For a character, dual twice returns χ and χχ∨=1 | Pass | None |
| 5.6 generic precursor | A putative p=2 double occurrence | Within-partner Hom bound is 1 on each side; (1,1) is not excluded by that bound alone, whereas the later dichotomy requires the exclusive indicator sum 1 | Pass; precursor does not claim exclusivity | None |
| 5.7 generic restriction quotient | Nonzero adjacent-rank functional B on W∨⊗V | Curried map V→(W∨)* has image in the smooth bidual W; a nonzero image in irreducible W has quotient multiplicity at least 1, whereas B=0 yields the zero map | Pass; dual and supplier resolved | None |
| 5.9 split-E₆ Howe | Steinberg extensions and the nonselfdual orbit | St⁺ and St⁻ have distinct length-one lifts πgen[1] and πsc[1]; a two-element orbit {τ,τ∨} gives one irreducible induced extension, not two | Pass; zero lifts allowed where specified | None |
| 6.1 restricted oscillator FJ | Split ternary first occurrence zero versus nonzero | In the admitted case FJ=σ∨ has length 1; the nonzero-first-occurrence sequence includes the extra rank-one Weil constituent, giving length 2 rather than 1 | Pass; omitted hypothesis would fail | None |
| 6.2 orthogonal comparison | n=5 and n=6; genuine central action | 2n−7=3 and 5; the two genuine factors multiply central signs (−1)(−1)=+1. One genuine factor alone remains −1 and cannot be an ordinary group action | Pass; tempered hypothesis retained | None |
| 6.7 dichotomy | Nonzero finite cubic coefficient d=1; simultaneous division and H lifts | Simultaneous contributions would force d=2d, i.e. 1=2; permitted domain indicators sum to 1 | Pass | None |
| 7.1 enhanced FJ definition | Genuine oscillator and genuine Mp₂ module | Covered central signs multiply to +1; U/[U,U] has dimension 2 and is abelian, whereas U/Z(U) has dimension 3 with one-dimensional center | Pass; rules out the source's quotient misprint | None |
| 7.4 multiplicity one | s=−1/2 and endpoint s=1/2 | −1/2<1/2 is true and the Hom dimension is 1; 1/2<1/2 is false, so the endpoint is not claimed | Pass | None |
| 7.6 generic period chain | Nonzero generic endpoints; hypothetical two quotients | Both endpoint dimensions 1 force all intervening dimensions 1; two generic quotients require at least 2 | Pass, conditional on generic Whittaker contract | None |
| 7.8 tempered Howe | Nonzero tempered lift; zero lift | Small-lift lengths 1 and 0 respectively, with generic functional dimension at most 1; two distinct generic quotients would give dimension at least 2 | Pass; source Theorem 12.4 read | None |
| 8.3 all three correspondences | Division/H partition; split-E₆ overlap with H | Division/H indicators sum 1; all three nonzero-lift indicators can sum 2. This is consistent with three separate injective correspondences | Pass | None |
| 8.4 δ formulas | τ=St_GL₂ versus selfdual supercuspidal τ, both central character 1 | Steinberg socle length 2 versus the supercuspidal δ socle length 1; δQ(St) is outside the definition's domain | Missing hypothesis | R01 |
| 8.5 πρ family | Anisotropic ternary construction and split first occurrence | Split SO₃ occurrence 0; split SO₅ occurrence nonzero. Recovering σρ and then ρ yields one input, whereas admitting two inequivalent ρ would contradict injectivity | Pass | None |
| 8.6 D₆ identification | The same πρ and τρ | τρ has length 1, generic dimension 0, and all proper Jacquet modules 0; the full big D₆ lift has length 1, not a length-two extension with this cosocle | Pass; full algebraic-dual comparison read | None |
| 8.7 supercuspidal table | πρ; a supercuspidal outside the named families | πρ has one surviving D₆ top contribution and θH=δ₁(τρ); outside the family the three maximal H Jacquet outputs are (0,0,0) | Pass | None |
| 8.8 discrete-series trichotomy | A discrete-series input in the H₃ branch | Nonzero-lift indicators for H₃,H are (1,1); discrete-series-output indicators are (1,0), giving exactly one DS branch | Pass; distinctions retained | None |
| 8.9 E₈/F₄ spin normalization | q=2, sim=ϖ², det₅₆=ϖ⁵⁶ | Ambient character 2⁻⁶=1/64=|sim|³; δ_P₄¹ᐟ²=2⁻⁸=1/256; normalized exponent 3−4=−1. I(σ,−1) has generic dimension 1, Π₈ has 0 | Pass; tests the repaired proof direction | None |
| 8.9 pole-to-period direction | Simple spin pole at 0 and local orders positive for zeros | ord L=−1, ord γ_BG=+1; a regular nonzero constant-section integral has order 0 and cannot supply the transformed-section pole of order −1 | Pass, conditional on two precise spin inputs | None |
| 8.10 depth-zero example | q=7, a of order 43 | q²−q+1=43; q³+1=344=8·43; eigenvalue exponents {0,1,6,7,36,37,42} are seven distinct residues | Pass with p>5 retained | None |
| 9.1 quaternion stabilizer | Split M₂, division quaternion, real ℍ | Stabilizers are SL₂(F), SL₁(D), SU₂; parameter −1 acts as +1 on D and −1 on D⊥, excluding the setwise stabilizer in place of the pointwise one | Pass | None |
| 9.3 low-rank exclusion | Siegel ranks 0,1,2 versus 3 | Each of 0,1,2 is <3; O(1) oscillator central sign is −1, not the +1 required for ordinary Sp₆. Rank-zero representation has matrix coefficient 1, not decay on noncompact Sp₆ | Pass; low-rank application is explicitly owned | None |
| 9.4 relative embedding | Supercuspidal quotient of compact induction | Splitting gives a section i with p∘i=id_π, not 0; if p were zero no nonzero section could satisfy this | Pass under imported cuspidal projectivity | None |
| 9.5 Steinberg relative summand | Division versus split quaternion stabilizer | For compact GD normalized volume is 1 and averaging a fixed vector returns v; the noncompact split stabilizer has no such finite total Haar volume. St_G→St_H has DS indicator 1 | Pass, conditional on Steinberg restriction | None |
| 9.6 compact SU₂ period | SU₃ weight (3,2,0); compact G₂ seven-module and trivial module | Interlacing (2,2) satisfies 3≥2≥2≥2≥0 and gives SU₂ highest weight 2−2=0. In 7=1+3+3∨ the SU₂ invariant dimension is 3; for the trivial module it is 1 | Pass | None |
| 10.1 global group forms | Totally definite versus split O | k-ranks 3 and 7, difference 4; each Albert carrier has dimension 27, so dimension alone cannot identify the form | Pass | None |
| 10.2 minimal residue | r=3,d=8 and zero section | 1+j·d/2 gives 1,5,9; minimal residue at 5, trivial constituent at 9; the zero section has residue 0 at every parameter | Pass with family-level pole interpretation | None |
| 10.3 kernel convention | Multiply each argument by i; zero input | Θ(if,φ)=iΘ; Θ(f,iφ)=−iΘ; Θ(0,φ)=Θ(f,0)=0 | Pass; linearity belongs to the contragredient input | None |
| 10.4 nonvanishing from period | Period scaled to 1; zero period | Nonzero local test factors can be scaled to 1, so unfolded coefficient is 1·1=1; zero period gives 0·1=0 | Pass; existence of test data, not every vector | None |
| 10.5 two cuspidality criteria | Steinberg place; regular compact weight; singular zero weight control | Under either hypothesis maximal constant terms are (0,0,0); zero highest weight has simple-coroot pairings (0,0), so does not meet regularity | Pass against LL/GrS hypotheses | None |
| 10.6 generic global lift | Unramified HKT factors and one supercuspidal place | Support conditions v(λ₂),v(λ₃)≥0 and ≤0 force both 0; normalized spherical factor is 1. A supercuspidal H local output gives three Jacquet values (0,0,0) | Pass; actual nonvanishing argument opened | None |
| 10.7 real matching | λ=0 and uniform wall bound C | Harish–Chandra parameter is ρ≠0, not λ=0; C+1>C whereas C>C is false | Pass on normalization and quantifier order; full HPS comparison waived | None |
| Native smoothness versus admissibility | Trivial action on ⊕ℕℂ and on ℂ | Every stabilizer is the whole open group in both; compact-open fixed dimensions are infinite and 1 respectively | Pass; no stand-in admissible carrier | None |

Excluded degenerate inputs were checked against the actual scope: a characteristic-zero local field has q≥2, so q=1, a zero coefficient ring and equal-characteristic local fields are not silently admitted. Residue characteristics 2 and 3 are admitted. Algebraic definitions using test algebras admit square-zero thickenings, as tested above. Characteristic 2 in the native imaginary Lie module has trace(1)=0 and an invariant scalar line of dimension 1; the imported irreducibility theorem explicitly requires 2≠0. This is distinct from a characteristic-zero local field with residue characteristic 2.

**Pinned-library duplication audit.** Searches were by object as well as by declaration name: octonion multiplication, derivations, imaginary modules, exceptional matrix groups, diagram automorphisms, spin and Albert carriers, smooth/discrete actions, coinvariants, minimal representations and theta modules. The following native definitions were opened, including their hypotheses. Paths in this table are within the respective pinned source tree.

| Pinned declarations and locator | Actual contract and consequence |
|---|---|
| Mathlib LinearEquiv, Mathlib/Algebra/Module/Equiv/Defs.lean:49; Submodule, Mathlib/Algebra/Module/Submodule/Defs.lean:39 | Invertible semilinear maps and additive/scalar-closed subobjects. Neither contains octonion multiplication preservation or a null-space law. The roadmap adds those laws in prose. |
| Submodule.map, Mathlib/Algebra/Module/Submodule/Map.lean:52; LinearMap.ker, Mathlib/Algebra/Module/Submodule/Ker.lean:59; Module.finrank, Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 | Native image, kernel and natural-valued finite rank. The dimension theorems are used with the stated finite-dimensional/strong-rank hypotheses, rather than treating finrank as proof of finiteness. |
| Representation, Mathlib/RepresentationTheory/Basic.lean:48 | Its body is G →* Module.End k V. There is no topology, smoothness, admissibility or unitary structure. |
| Representation.Coinvariants, Mathlib/RepresentationTheory/Coinvariants.lean:53,57 | Quotient by the submodule generated by action differences. The generic algebraic quotient is imported; no private duplicate is present. |
| TauCeti.Octonion, TauCeti/Algebra/Octonion/Basic.lean:123; mul_a/mul_b/mul_v/mul_w at :259–270 | Native split Zorn carrier and explicit product. The cross-product sign gives u₁u₂=v₃, as the README says. |
| TauCeti.Octonion.conj_mul, :334; trace, :345; norm, :375; mul_self, :410; norm_mul, :416 | trace is a+b, norm is ab−v·w, and conjugation reverses products. These laws are consumed, not re-planned as a new octonion implementation. |
| TauCeti.Octonion.imaginary, :589; finrank_imaginary, :619 | Imaginary is the trace kernel; the dimension statement uses the strong rank condition. It is not a represented automorphism group. |
| TauCeti.Octonion.finrank_derivationLieAlgebra, TauCeti/Algebra/Octonion/Derivation.lean:995 | Dimension 14 over a commutative ring with strong rank condition. This does not supply a group comparison. |
| TauCeti.Octonion.isIrreducible_imaginaryLieSubmodule, TauCeti/Algebra/Octonion/Fundamental.lean:317 | Field coefficients and 2≠0; characteristic-two scalar-line counterexample at :313–315. The package retains the hypothesis. |
| TauCeti.Octonion.g₂ToDerivationLieAlgebra, TauCeti/Algebra/Octonion/Serre.lean:267 | A Lie homomorphism obtained from the Serre presentation. No identification of group schemes follows merely from its existence. |
| TauCeti.SpinPolarizationData, TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean:82; spinAction, CliffordAction.lean:230; spinRep, TauCeti/RepresentationTheory/Spin/Representation.lean:56 | The specified isotropic splitting supplies the exterior-algebra action. It is usable over the local coefficient field with that data; it does not require algebraic closure. |
| TauCeti.AlbertAlgebra, TauCeti/Algebra/AlbertAlgebra/Basic.lean:104; finrank_eq_twentySeven, :213; product, :229 | Carrier dimension 27; the symmetrized product needs 2 invertible. A native carrier is not a proof of every Jordan/group-form comparison used later. |
| TauCeti.E7Minuscule.groupScheme, TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:188; TauCeti.E6Minuscule.groupScheme, TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.lean:109; TauCeti.D4Tripled.groupScheme, TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean:119 | Integral matrix closure carriers in dimensions 56,27,24. Their explicit contract limitations exclude an automatic identification with the required adjoint, disconnected or nonsplit groups. |
| TauCeti.D4Tripled.trialityAutomorphism, TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142; TauCeti.E6DoubledMinuscule.graphAutomorphism, TauCeti/Algebra/Lie/E6/DoubledMinuscule/GraphAutomorphism.lean:468 | Automorphisms of the stated tripled/doubled carriers. Neither is the normalized involution on an exceptional minimal representation. |
| TauCeti.G2ShortRoot.serreRepresentation, TauCeti/Algebra/Lie/G2/ShortRoot/Basic.lean:173 | Integral Lie representation on seven weights, not the compact real automorphism group. |
| TauCeti.IsSmoothDiscrete, TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272; SmoothDiscreteTopRep, :618 | The fields require discrete topology and open point stabilizers. The full subcategory imposes no finite-dimensional compact-open invariants. The README's infinite direct-sum counterexample is valid. |

The searches did not reveal native exceptional minimal modules, identified compact-real octonion group actions, their quaternion periods, or the required exceptional adelic theta kernels. This is a statement about these pins, not newer libraries. A bare algebraic representation or a matrix group carrier cannot stand in for these missing objects.

**Cross-roadmap resolution and ownership.** I used the supplied roadmap list/grep/show tools, read the returned current sources, and searched the board designs where the supplier exists there rather than in main. The two earlier unitary/local-factor designs are legitimate supplier contracts, not alleged missing dependencies. I also read the shapes of main-branch ComplexTori and RestrictedPowerSeries roadmaps before assessing house style.

| Consumed owner | Resolved section or target and object |
|---|---|
| ReductiveGroups | TauCetiRoadmap/ReductiveGroups/README.md:234, Layer 3 closed subgroups, quotients and components; Layer 3A.1 action stabilizers; :1092, Layer 9 integral pinned groups. The centralizer representability extension is separately declared. |
| ReductiveGroupsPartII | RG2.5.1–RG2.5.2, dual root data, dual groups/Levis and centers. The particular SL₃→G₂→Spin₇ comparison remains the exceptional target. |
| RepresentationTheory/LieHighestWeight | Layer 8, including the positive division-octonion and compact Albert sublanes. The split Lie models/Jordan identity and positive-real constructions are imported. Rational-form descent and group-level comparisons remain here. |
| RepresentationTheory/SpinRepresentations | Layers 4 and 8, polarized spin and integrated triality. The package's local algebraic action uses the native polarization above; exceptional centralizer/rational-form identifications are its additional content. |
| RepresentationTheory/ClassicalGroups | Layer 6, GLₙ↓GLₙ₋₁ interlacing. The SU₃/SU₂ specialization and quaternion-period application are correctly distinguished from p-adic generic restriction. |
| RepresentationTheory/LieGroups | Layers 2 and 7, closed finite-dimensional real matrix subgroups and complexification/real-form representation comparisons. |
| RepresentationTheory/CompactGroups | README:271,295,318, Layers 3–5, matrix coefficients, Schur orthogonality and Peter–Weyl with normalized Haar measure. |
| ClassFieldTheory | Layer 9, especially README:1534 for arithmetic degree. The actual Weil carrier is used. |
| LanglandsParameterStacks | LP0.5, LP1.11 and LP1.12. LP1.11 at README:367 imposes the geometric-degree scaling convention. Resolution succeeds, but compatibility fails as R02 explains. |
| SmoothRepresentationsOfLocalGroups | SR.0.2/SR.0.4; SR.2.1–SR.2.3; SR.2a.1; SR.3.1–SR.3.4; SR.5.1. Read admissibility, normalized induction/Jacquet, second adjointness, tempered-support conditions, regular-isotypic quotient, and inverse-twist coinvariants. Its existing Whittaker uniqueness is for GL₂, not every quasi-split group. |
| SmoothRepresentationsOfLocalGroups | SR.5.2, classical-llc-normalization, README:4550. Classical GLₙ WD/LLC and its coefficient/duality comparisons are imports, not an additional exceptional LLC construction. |
| SmoothRepresentationsOfLocalGroupsPartII | Board design SRU.0–SRU.4, including SRU.3 at design/README.md:852 and SRU.4 at :1085. Seven requested extensions are explicitly declared, not misrepresented as already delivered. |
| MetaplecticAutomorphicForms | §§0.15–0.17, 1.1, 2.4a–2.7; 3.4–3.8; 3.34; 3.37–3.40, including 3.38a. Opened the restricted oscillator, GL₂–GSO₄, orthogonal-minimal and division-ternary targets. Their generic construction/Howe assertions are imported. The retained FJ identification, exceptional comparison and πρ exhaustion are additional content. |
| EndoscopicTransferAndUnitaryTraceComparison | §4.7a, README:1772; §10.30, :4068; §10.31, :4084. Classical comparison and essentially square-integrable Jacquet–Langlands, including dual/reciprocity normalization, are present. |
| ModularityAndLanglandsExtensions | §3.5, especially part (vi), parameter/Plancherel agreement for the nongeneric GSp₄ input. Genericity is not improperly assigned to τρ. |
| AutomorphicLFunctionsAndLocalFactors | AL.4 for unramified L-group factors, and Central periods, normalized-rs-period, README:2300–2303. The latter explicitly supplies the adjacent-rank nonzero functional with opposite Whittaker characters. |
| AutomorphicLFunctionsAndLocalFactorsPartII | Board design D.6, design/README.md:1157. Existing classical local-factor/doubling work is not re-planned; F₄ spin and BG spin-integral extensions are named gaps. |
| AutomorphicFormsOnReductiveGroups | §§2.1–2.7, 3.1–3.5, 4.1–4.2 and 5.4; also its ArithmeticLocallySymmetricSpaces ALS.F.6 rapid-decay contract. Real characters, automorphic carriers, restricted tensors, constant terms and cusp estimates resolve. |
| AutomorphicSpectralTheory | §§1.1–1.2, 2.4–2.6 and 4.4, convergence, continuation, residues and the square-integrable residual criterion. Exceptional residues and constituent comparisons remain Layer 10 targets. |

The object searches found no second owner of this package's three exceptional correspondences or group-model comparisons. General classical theta, generic restriction, Lie/Jordan foundations and Eisenstein continuation do have the owners listed above and are imported. The package is not a re-plan of the downstream LocalLanglandsCorrespondenceForG2 design: full G₂ LLC and enhancement/character identities remain there. The empty Suggested.lean cannot collide with another roadmap's fully qualified declaration names.

The roadmap resolver returned no unresolved cross-roadmap citation or name. Its note that pinned package discovery was unavailable was not used as evidence of absence: the pinned declarations were inspected directly as recorded above.

**Supplier gaps.** All eleven plan slugs occur exactly once, have a named supplier/section, and have matching needs sentences under the appropriate README supplier. None names supplier “none”. Object searches found no existing delivery of the requested extension at the pins or in the cited supplier targets. Their absence is not a finding. The relevant scope/minimality checks were:

| Slug | Scope retained and why the request is an extension |
|---|---|
| quasisplit-whittaker | Characteristic-zero nonarchimedean F, any residue characteristic, irreducible smooth complex representation and specified Whittaker datum. Base SR.2.3 only supplies the GL₂ statement. |
| wavefront-all-residue | F-rational maximal orbit, fixed ψ/pairing/measures and equality with the character coefficient, including finiteness. A good-residue or geometric-orbit version would not meet the request. |
| steinberg-unipotent | Split connected reductive H; entire maximal U restriction and every closed N with smooth χ. It is not just the one character needed by the quaternion application. |
| rank-one-plancherel | Maximal parabolic, unitary supercuspidal data and nonzero real exponents. Existing parameter/Plancherel comparisons do not themselves supply the reducibility criterion used by Layer 1. |
| isotypic-parabolic | Actual maximal irreducible admissible τ-isotypic quotient and normalized induction. GG Lemma 9.4, GG lines 1133–1157, supports the requested commuting-action theorem; an arbitrary quotient would not suffice. |
| isotypic-compact | Closed H, irreducible admissible τ and Ext¹_L(τ,τ)=0, with the needed PGL₂ specialization. Ordinary induction functoriality does not assert commutation with maximal isotypic quotients. |
| schwartz-ext | Compact center, discrete series δ and tempered π; smooth/Schwartz Ext¹ comparison and Schwartz projectivity. No false smooth-category projectivity is requested. |
| ramified-spin-factor | Generic PGSp₆ input, F₄ Heisenberg normalization, and supercuspidal pole/reducibility equivalence. It stops before the exceptional E₈ proof or the Shalika equivalence owned here. |
| bg-spin-integral | Trivial central character, actual GL₂ sections/intertwiner, normalized spherical vector and exact zero/pole divisors with multiplicity. The assertions form the one local-integral interface; the exceptional residue-to-Shalika proof remains §8.9. |
| regular-real-unitarity | The two stated split real groups; C depends on the group/positive roots, before quantifying the irreducible unitary module. Regularity without the uniform bound is not substituted. |
| schematic-centralizers | Affine finite type, characteristic zero, closed subgroup, test-algebra and base-change characterizations. Existing action-stabilizer language does not provide this exact represented centralizer interface. |

There are no new gap requests or source-manifest changes in this review. If the three findings are fixed, the remaining supplier dependencies are these eleven declared contracts; this review does not assert that their future proofs have been delivered.

**Dependency direction.** The prescribed check, with this README, roadmap name, ORDER.txt and the movable flag, exited 0 and printed:

    depcheck: 51 roadmaps, 592 edges, 0 problem(s)

There was no UPWARD or CYCLE line. I separately read every Needs line and resolved its supplier target, because a successful graph check does not detect R02's normalization mismatch. Local theta finiteness precedes dichotomy, tempered Howe precedes completion of the lift tables, and no proof of the local theorem imports the downstream G₂ LLC/globalization construction. No ownership move or merge-order edit is proposed.

**Headline acceptance test and shape.** The README's headline groups and their treatment in Suggested.lean are:

| README headlines | Lean docstring coverage and missing carrier |
|---|---|
| Represented octonion automorphism group/pinned comparison (§0.1); exceptional minimal models and five Jacquet filtrations (§§2.4, 3.4–3.8) | Lines 9–19 identify the represented group comparison, identified exceptional forms, admissibility and normalized induction/Jacquet/minimal modules. |
| Tempered preservation (§3.11); division Howe/nonvanishing (§§5.1–5.2); split-E₆ Howe (§5.9); dichotomy (§6.7); E₇ Howe (§7.8); all three Howe theorems, complete tables and DS trichotomy (§§8.1–8.8) | Lines 20–23 name all of these and their missing exceptional smooth representation/theta carriers. |
| Supercuspidal spin-pole/Shalika/theta equivalence (§8.9) | Lines 18–19 and 24–25 name the E₈/F₄ module and ramified Shahidi spin-factor gaps. |
| Quaternion relative quotient/embedding, Steinberg summand and compact-real SU₂ periods (§§9.3–9.6) | Lines 26–28 identify the actual octonion group actions and relative smooth/unitary carriers. |
| Global minimal residue/local identification, period nonvanishing, two definite cuspidality alternatives, generic global nonvanishing and supercuspidal cuspidality (§§10.2–10.6) | Lines 29–32 name each and the missing adelic Eisenstein/residual/kernel carriers. |
| Real infinitesimal-character matching (§10.7) | Lines 33–34 name exceptional real Harish–Chandra modules and their central-character comparison. |

No omitted headline was found statable at these pins using only a few elementary definitions on the actual required carriers. Encoding these missing theories as free predicates, arbitrary representations or scalar identities would be a stand-in. Conversely the native octonion API is substantial, but its elementary automorphism/null-space consequences are not headline substitutes.

Suggested.lean has one import Mathlib, one module docstring, the required namespace, and no declarations. The prescribed lake env lean command, run from the content checkout on the absolute package file, exited 0 with no output and no warnings, including no sorry warnings. There were no TauCeti imports requiring a targeted build. Declaration enumeration found zero definitions, instances or sorried theorems: therefore the per-declaration elaborated-binder comparison and one-tactic padding probe have empty target sets. No signature changed, and there is no padding left to delete. No bare build, update or cache command was run.

The README has the required opening summary, scope, conventions, exact contracts, build explanation, eleven ordered layers ending in Examples/Dependencies, consumers and references. It uses mathematical prose and Unicode, with APIs/Checks retained in the README. I found no copied source passage, computational algorithm, sorry'd data, set_option, upward supplier, policy-only carrier or re-planned generic library in the reviewed files. The small calculations are mathematical Checks. The all-residue local theory is retained; the separate p≠3 nonvanishing theorem and p>5 example do not replace it.

## Not verifiable

- GS05 and HPS remain explicitly waived. Their full texts were not certified. Readable secondary characterizations in GS04, HS and LL were checked where available; this does not certify the entire waived statements. No new request was made.
- Var remains uncertified/paywalled and is cited by its settled locator. The source itself was not read. The all-residue wavefront theorem is a declared supplier contract, not a claim that this review verified Var's proof.
- HS has damaged font encoding. The pole list, hypotheses, normalizations and relevant local/global discussion were readable at the cited lines. I do not certify illegible unrelated formulas.
- No other source needed for the sampled or newly reviewed passages was inaccessible. Li Theorem 4.8's missing extracted display was recovered by viewing the cached PDF; it is not an outstanding source request.
- The missing Lean headline carriers prevent an elaboration test of those future theorems. The successful empty acceptance-file build establishes syntax/import validity, not mathematical truth or completion of the supplier contracts.

## Source issues

- **Error** in GS at §2.1, p. 6: the source says every norm-nonzero octonion generates the separable quadratic algebra of its characteristic polynomial; it should require nonscalarity and nonzero discriminant for that conclusion; affects a stated result.
- **Misprint** in GS at Proposition 3.1(i), p. 9: the source lists only positive one-half in a reducibility equivalence for trivial central character; it should include both signs, related by contragredience; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), p. 9: the source uses Q-exponent one-half in two character quotients and inserts Steinberg data into the cubic character case; it should use Q-exponent one and character inducing data; affects a stated result.
- **Misprint** in GS at Proposition 3.2(iii), p. 11: the source uses Q-exponent one-half for the quadratic-character quotient; it should use exponent one, as the short-root Weyl calculation shows; affects a stated result.
- **Error** in GS at §9, p. 30: the source gives a noninvariant quadratic expression and an incomplete list of reflection hyperplanes; it should use Σsᵢ²+(Σsᵢ)² and include the three hyperplanes sᵢ+Σsⱼ=0; affects nothing.
- **Error** in GS at §8.1, p. 24: the source's exhaustive nongeneric selfdual PGL₃ list omits the trivial representation; it should include that representation, also treated in Theorem 8.2(ii); affects nothing.
- **Misprint** in GS at §2.6, p. 8: the source labels the second commuting SL₂ factor by r; it should label the short-root factor by s; affects nothing.
- **Misprint** in GS at §3.4(4), p. 14: the source calls the centralizer of a long-root SL₂ another long-root SL₂; it should call it the short-root SL₂; affects nothing.
- **Misprint** in GS at §11.2, p. 34: the source assigns the oscillator center to U/[U,U]; it should use the one-dimensional center of U/Z(U); affects nothing.
- **Misprint** in GS at the proof of Lemma 11.3, p. 36: the source writes V′ using Uβ and then writes the Heisenberg quotient with numerator V; it should use U−β in V′ and numerator V′, consistent with the stated root exchange; affects the proof.
- **Misprint** in GS at §15.1, p. 52: the source cites Theorem 15.1(v) for irreducibility and temperedness; it should cite parts (ii) and (iv); affects nothing.
- **Misprint** in GS at Proposition 13.7, explanatory note, p. 47: the source names M₃ as the Levi with the two displayed factors; it should name M₂; affects nothing.
- **Misprint** in GS at §15.1, p. 54: the source uses JL(τ) when defining the lift indexed by ρ; it should use JL(ρ); affects nothing.
- **Gap** in GS at the proof of Proposition 8.4, p. 27: the source invokes generic GL₂ quotients of a GL₃ restriction without giving the restriction theorem; it should supply the adjacent-rank generic restriction argument, available in Pra Theorem 3; affects the proof.
- **Gap** in LL at the proof of Lemma 10.1, p. 27: the source infers rank exactly two from absence of full-rank Siegel coefficients; it should handle all ranks below three, including zero and the metaplectic parity restriction; affects the proof.
- **Misprint** in Sav at the proof of Corollary 5.2, p. 399: the source repeats the U₁ Jacquet module for both the Steinberg and trivial Levi-module descriptions; it should use U₂ and its Levi in the second description; affects the proof.

For the first source error, the explicit witness is x=1+u₁ in the split Zorn algebra: N(x)=1, trace(x)=2 and (x−1)²=0 with x−1≠0. Thus F[x] is the nonreduced dual-number algebra, not a separable quadratic algebra. For the quadratic-expression error, the computed values are 5 and 195/4 as recorded above. These source issues are not additional package findings: the package does not copy those erroneous assertions.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "da745368dd6877611fdc2da6364596197c6cf865", "job": "REV-PKG-ExceptionalThetaCorrespondencesForG2~2", "model": "gpt-6-astra", "worker": "chris-13"} -->
