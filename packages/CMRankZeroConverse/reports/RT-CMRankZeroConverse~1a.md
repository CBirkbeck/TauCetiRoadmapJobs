<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/993#issuecomment-6423005395 -->
Red team round 1 pass a (codex) of 15f8fb2

Verdict: needs_changes

1. **F01** (P1) The weight-two example identifies the wrong Tate module

   **Location:** `packages/CMRankZeroConverse/README.md:280`: “W is the rational Tate module of the modular curve”.

   **Claim:** The central rank-two realization of every weight-two newform is the Tate module of the modular curve itself.

   **Witness:** Kato line 1755 through line 1756 give dimension two for the f-quotient. `TauCetiRoadmap/ModularForms/README.md:1365–1367` gives dim S₂(Γ₀(37))=2: even J₀(37) has Tate dimension four, versus two for a split coefficient component.

   **Exact repair:** Replace that sentence by: “At weight two, W is the Tate-twisted cohomological f-component of the modular abelian variety. The polarization identifies it with a Tate-module component with the conjugate coefficient action. For rational coefficients it is V_p of the associated elliptic curve.” Cite AutomorphicGaloisRepresentations §§1.5 and 6.1. For an abelian quotient of dimension d, the whole Tate module has ℚ_p-dimension 2d, while the specified λ-component has E-dimension two; the replacement preserves both values.

2. **F02** (P2) The finite-condition gap requests already supplied comparisons

   **Location:** `packages/CMRankZeroConverse/README.md:89`; matching `central-finite-conditions-and-descent` entry in `packages/CMRankZeroConverse/design/plan.json`: “central modular finite/unramified comparison at every bad prime away from p, finite-condition Shapiro”.

   **Claim:** These are missing outputs to request from SelmerIwasawaCohomology.

   **Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1714,1909` already identifies lattice j_* H¹ with unramified classes and defines rational H_f away from p as unramified. `TauCetiRoadmap/PadicHodgeRegulators/README.md:577` already supplies finite-condition Shapiro at p.

   **Exact repair:** Remove the away-p finite/unramified comparison from this gap in both locations; replace its use by “SelmerIwasawaCohomology §3.15 etale_jStar_degreeOne and §4.9, after rationalization.” Import finite-condition Shapiro at p from PadicHodgeRegulators §1.7(d). Replace the needs sentence, in both the README and plan, by: “For the central representations used here, export finite-condition Shapiro away from p and faithful finite coefficient extension at all places; for an elliptic A/F and quadratic L/F, export the classical p∞ Kummer Selmer comparisons between A over L and the sum for A and its quadratic twist over F, with combined restriction/corestriction composites multiplication by two, retaining dyadic errors until rationalization.” This changes no conclusion: a class with inertia restriction zero has both unramified and rational finite membership true; a class with nonzero inertia restriction has both false. At p, Shapiro for the identity extension sends the finite subspace identically to itself. Do not announce these already owned outputs as new work.

3. **F03** (P3) The native newform parent is not normalized

   **Location:** `packages/CMRankZeroConverse/README.md:43`: “it extends the normalized good-prime cuspidal eigenform and adds newspace membership”.

   **Claim:** Normalization belongs to the parent of the pinned Newform structure.

   **Witness:** `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104–108`: Newform adds both isNew and isNorm to EigenformAwayFromLevel. The parent allows f and 2f; their first coefficients are 1 and 2.

   **Exact repair:** Replace the clause by “it extends the nonzero good-prime cuspidal eigenform and adds newspace membership and first-Fourier-coefficient normalization.” The parent still permits 2f; isNorm rejects it because 2≠1.

## Verified sound

Read all 653 README lines and all 148 Suggested.lean lines. The inventory contains **9 declarations (4 definitions, 5 theorems), 30 numbered README targets, and 33 Checks blocks**. There are no separately bold mathematical target headings: the numbered sections, their API bullets and their Checks were all audited. The tables below record computed controls, not proofs of the general theorems. Finite counting experiments test the filters, not the analytic nonvanishing numerator.

Checked **29 external locator groups** in the three cached legal sources: 12 BT groups, 12 Kato groups and 5 BKLOS groups, listed below. Inspected the page images for Kato printed pp. 221 and 240–242 to resolve the interpolation, inverse-Frobenius and duality formulas obscured by extraction. Checked **13 readable supplier records**, plus the readable design of ModularIwasawaMainConjecturesPartII; KatoEulerSystems remains the exception recorded under Not verifiable. Searched all **55 supplied sibling folders**, main, Completed and board packages by object, and used the roadmap index's object searches and current supplier views. No duplicate fully qualified name of a retained declaration was found.

The five declared analytic headlines are §§5.2, 5.3, 5.4, 6.1 and 6.6. All five occur on actual native carriers in Suggested.lean. The conditional newform converse (§3.2), unconditional CM newform converse (§3.3), CM-field elliptic converse (§4.2) and rational elliptic converse (§4.5) are individually named in the module docstring with their missing Selmer/realization carriers. The doubling identities, cube-sum verification and descent estimates are inputs to those endpoints; their absence from Suggested.lean is not a finding. The one-tactic probe found no padding among the five retained theorems. In particular, none of their limit or arithmetic numerator conclusions follows from the definitions or a pinned limit lemma alone.

Compared every supplied elaborated `@` signature with the source and README. There are **zero section-variable blocks and zero lost necessary binders**. No Lean command was run in this pass. Each definition has a real body; the only admitted declarations are the five theorems. The one Mathlib import and four individual Tau Ceti imports exist at the pins and are used. There is no option override, admitted data, placeholder condition, hypothesis containing a headline conclusion, algorithm or process narrative in the two deliverable files.

The content checkout matched main at `f6e3d43f299489547d85900f1b18a976f3a32145`; the checked library revisions were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The read-only diff at package head `15f8fb246e794b62f9499ab75cb62584e4c62eaa` was confined to `packages/CMRankZeroConverse/`. No implementation, manifest, merge order or supplier file was edited.

The prescribed dependency check exited 0, with complete output:

```text
depcheck: 56 roadmaps, 652 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Locally, Layer 0 feeds Layers 1–2; §2.1 precedes the basis argument; §3.2 takes its main conjecture as a hypothesis and §3.3 obtains it from its earlier supplier. The two CM elliptic comparisons precede the statistical applications. The height denominator comes from ArithmeticStatisticsPartI, not from the downstream nonvanishing theorem. No ownership move is required by this pass.

### Declaration and instance-context ledger

All names below are in `TauCetiRoadmap.CMRankZeroConverse`. `K : Type u` has arbitrary universe u. “NF” abbreviates the native NumberField instance; “TC” abbreviates IsTotallyComplex. These abbreviations are only for this table.

| Declaration; README section | Actual explicit context | Instances and computed sides | Result / change |
| --- | --- | --- | --- |
| ellipticLNonvanishingAtOne; §0.1 | K, Field K, NF K, W : WeierstrassCurve K; no ellipticity binder in this definition | Entire continuation F has first Dirichlet coefficient 1; 2F has 2, zero has 0, so only F can agree with the actual series. Germ values 1 and 0 give orders 0 and 1 for 1 and s−1. | Agreement fixes the function; all headline uses supply ellipticity. |
| congruentTwist; §5.2 | n : ℤ; target WeierstrassCurve ℚ | n=−1,0,1,2 gives a₄=−1,0,−1,−4 and Δ=64,0,64,4096. | Real body and singular boundary agree. |
| congruentNumber_densityOne; §5.2 | No parameters or standing instances | For X=0,1,2,8,1000 the allowed-residue denominators are 0,1,2,3,300. The empty ratio is 0/0=0 in ℝ. With numerator D−e and e/D→0, quotient is 1−e/D→1. | Correct relative family; finite cutoffs do not assert analytic numerator values. |
| congruentNumber_half_positive; §5.3 | No parameters or standing instances | Positive squarefree denominators at those X are 0,1,2,6,608. At X=1000 residue counts 1,2,3,5,6,7 are 98,101,101,102,103,103; the allowed sum is 300. Leading densities give 3/6=1/2. | Positive family and real division agree. |
| congruentNumber_half_discriminants; §5.4 | No parameters or standing instances; d,m : ℤ inside the filter | Both-sign discriminant counts at X=0,1,2,8,1000 are 0,1,1,7,608; allowed-radicand counts are 0,1,1,5,296. For n=1,2,3 the sign-pair magnitudes are (1,4),(8,8),(12,3). | Trivial d=1 included, d=0 and d=4 excluded; negative remainders work. |
| squareclassHeight; §6.1 | K, Field K, NF K, c : TauCeti.SquareClassGroup K | Over ℚ, H([2])=H([1/2])=H([8])=2; H([±1])=1. Over ℚ(i), H([5])=25, H([3])=9, H([2])=H([i])=1. | Odd integer valuations, finite support, unit representatives; no zero ideal enters. |
| cmTwists_nonvanishing_lowerHalf; §6.1 | K, Field, NF, TC; finrank ℚ K=2; ¬(3).IsPrime; A; A.IsElliptic; ¬Surjective ℤ→End_K(A); ε : ℝ, 0<ε | At three the quotients for ℚ(ζ₃), ℚ(√−2), ℚ(i) are respectively 𝔽₃[e]/(e²), 𝔽₃×𝔽₃, 𝔽₉: the hypothesis is true,true,false. ε=1 gives lower bound −N/2≤0; ε=0 is excluded. | All substantive field/curve hypotheses survive elaboration. |
| descendsToRat; §6.4 | K, Field K, Algebra ℚ K, W; existential elliptic E/ℚ and VariableChange K | Base change with C=1 gives equality of all five coefficients. The curve a₄=1,a₆=1+i over ℚ(i) has Δ=−64−864i≠0 and j=6912/(4+54i) outside ℚ. | The first descends and the second does not; no geometric-CM-action descent is imposed. |
| cmTwists_nondescending_nonvanishing_lowerHalf; §6.6 | Exactly the context of the preceding CM theorem; same ε>0 | Model counts N=X, good=X/2, descending=√X give lower full ratios .4,.49,.499 at X=100,10000,1000000. Restricted ratios are 4/9,49/99,499/999. Both tend to 1/2. | Quantifier order permits a cutoff depending on ε,A,K; no uniformity is falsely claimed. |

### README statement ledger

The rows include the definition APIs and convention identities, rather than treating an API list as one undifferentiated test. Unless a finding is named, the listed computation agrees with the statement under its hypotheses.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| §0.1 rank-r implication | (corank,order)=(0,0),(0,1),(1,0), r=0 | Implication true,false,true; its negation false,true,false | Correct direction; hypothetical rank pair is a truth-table control, not an asserted curve. |
| §0.1 r=0 interpretation | F(s)=1 and F(s)=s−1 locally | Orders 0,1; central values 1,0; both tests give respectively true,false | Finite-order/nonvanishing equivalence. |
| §0.1 transport and failure | Equal coranks 0=0 and orders 1=1 | Both rank-zero implications false; failure is (0=0)∧(1≠0)=true | Transport and negation agree. |
| §0.1 classical versus finite Selmer | Rational two-torsion (ℤ/2)² with p∞ corank zero | Rational corank 0; finite Sel₂ dimension ≥2 | Finite Sel₂ vanishing is correctly not substituted. |
| §0.1 continuation uniqueness | F−G zero on Re(s)>3/2 | Difference 0 on the open half-plane and 0 on connected ℂ; central difference 0 | Pinned analytic identity theorem applies. |
| §0.1 continuation isomorphism transport | Two pointed-isomorphic models | Every Euler coefficient difference 0; whole-series difference 0; continuation difference 0 | Uses actual full local factors. |
| §0.1 nonvanishing definition Checks | n=1; n=5 with root number −1; rescaled F | Source gives nonzero at n=1; at n=5, 2F(1)=0⇒F(1)=0; rescaling changes first coefficient 1→2 | The n=1 special value was source-checked, not numerically evaluated. |
| §0.2 total sign definition and square | k=0,1,2,3,4,6 | ε=1,1,1,1,−1,1 and ε²=1 throughout | Natural division/subtraction boundary retained. |
| §0.2 central sign relation | k=0,2,4,6 | ε(−1)ʰ=1,−1,−1,−1 | Arithmetic identity needs the stated even k≥2 domain. |
| §0.2 four-weight periodicity | k=2,3,4 and k+4 | Sign pairs (1,1),(1,1),(−1,−1) | Periodicity agrees. |
| §0.2 rational projection definition | c=diag(1,−1), v=(2,−3) | P₊v=(2,0), P₋v=(0,−3); their sum=(2,−3) | Correct normalization, not twice the projection. |
| §0.2 eigenvalue, identity and complement laws | Same two coordinate lines | cP₊v=P₊v, cP₋v=−P₋v; P₊²v=P₊v; P₋P₊v=0 | All projection assertions agree. |
| §0.2 dyadic integrality limit | Coordinate swap on ℤ₂², v=(1,0) | P₊v=(1/2,1/2), 2P₊v=(1,1) | Rational projector does not preserve the lattice. |
| §0.3 determinant dictionary | k=2, trivial nebentype, αβ=ℓ | det M_f=χ⁻¹; twisted geometric determinant ℓ/ℓ²=ℓ⁻¹; arithmetic determinant ℓ | Twist and Frobenius directions agree with the page image. |
| §0.3 dual central realization | k=4,h=2 | 1−k+h=−1=1−h; erroneous h−1 gives −2 | Correct dual twist. |
| §0.3 oddness | Rank-two involution diag(1,−1) | Plus and minus dimensions 1,1; determinant −1 | Rank-two hypothesis excludes zero representation. |
| §0.4 character evaluation definition | p=3,h=1,c=4 | ev(σ₄)=1/4; augmentation(Tw₁ σ₄)=1/4, not 4 | Negative Tate exponent matches supplier. |
| §0.4 kernel membership | h=1,2 on σ₋₁±1 | ev(σ₋₁+1)=0,2; ev(σ₋₁−1)=−2,0 | Both directions of membership criterion tested. |
| §0.4 quotient and components | Rational idempotents e±=(1±σ₋₁)/2 | At h=1, ev(e₊)=0 and ev(e₋)=1; at h=2 these are 1,0; ev(a)=a for a∈E | Residue E and selected component agree; p maps to p≠0. |
| §1.1 global invariants | S₃ standard irreducible representation over characteristic zero; 1⊕χ_cyc; trivial group | Invariant dimensions 0,1,2 respectively; only the first meets irreducible rank two | No reducible/trivial-group extension asserted. |
| §1.2 first Poitou–Tate application | h⁰=h²=0, negative dimension 1, local dimensions 2,1 | −h¹=−1⇒h¹=1; quotient 2−1=1; dual Selmer kernel 1−1=0 | Dual Selmer vanishing is proved before use for W. |
| §1.2 necessary quotient dimension | Replace quotient dimension 1 by 0 | Kernel becomes 1−0=1, not 0 | Local dimensions are necessary inputs. |
| §1.2 dyadic corrections | Finite real term ℤ/2 | Cardinality 2 integrally; rational dimension 0 | Correct order of rationalization. |
| §1.3 global line | Negative dimension 1 versus zero representation | h¹=1 versus h¹=0; wrong Euler sign would demand h¹=−1 | Nonzero line uses odd rank-two representation. |
| §1.4 H_g=H_f | Central crystalline moduli at p=2,3 | 2^−1/2<1, 1/2<1, 1/3<1; no eigenvalue 1 | Applies at bad/coefficient primes with supplied purity. |
| §1.4 dual-exponential kernel limit | V=ℚ_p(1), V*(1)=ℚ_p | Fixed crystalline dimension 1; dim H_g=2 versus dim H_f=1 | This excluded de Rham example would refute an unrestricted assertion. |
| Layer 1 weight-two example | Level 37 whole modular Jacobian and f-component | Tate dimensions 4 and 2 | R01. |
| §2.1 control with Tor | DVR complex R→R, differential π, degrees 1,2 | H¹=0,H²=R/π; specialization has H¹ dimension 1 supplied by Tor₁ dimension 1 | Premature removal of Tor gives false dimension 0. |
| §2.1 Nakayama conclusion | Finitely generated M over local DVR, M/πM=0 | M=0 and Tor₁(M,E)=0; for M=R/π the quotient is E≠0 | Finite generation and degree-two control retained. |
| §2.1 H³ correction | Rational amplitude ≤2 | H³=0, hence Tor₁(H³,E)=0 | No integral dyadic amplitude assertion substituted. |
| §2.2 actual central morphism | γ=0 and γ with nonzero z | z(0)=0, z(2γ)=2z(γ), z(γ/2)=z(γ)/2 | Linearity excludes an arbitrarily normalized nonzero class. |
| §2.2 addition | z(γ)=a,z(δ)=b in a chosen target coordinate | z(γ+δ)=a+b | Coordinate computation tests linearity; actual map remains supplied. |
| §2.2 lattice change | T and pT, then invert p | T[1/p]=(pT)[1/p]; γ and its rational image coincide | Rational lattice independence, not integral equality. |
| §2.2 conjugation and projection | h=1,2 | z(cγ)=z(γ),−z(γ); wrong-sign inputs force 2z=0⇒z=0 | Correct sign line survives at p=2 as well. |
| §2.3 characteristic equality and basis | DVR quotients 0 and R/π | Lengths 0,1; ideals R,(π); unit equality permits only length 0 | Equality, not a wrongly oriented divisibility, supplies the basis. |
| §2.3 projection hypothesis | γ on killed line versus nonzero surviving projection | z=0 in first case; surviving generator spans one-dimensional Z modulo 𝔮 | Zero projection cannot be a basis. |
| §2.4 nonfinite localization | Global line E, finite Selmer 0 | A basis vector 1 is not in {0}; zero lies in {0} | Nonzero basis plus all away-p conditions is essential. |
| §2.4 omitted bad-prime control | p-local class finite but inertia restriction elsewhere nonzero | Local p-condition true, other finite condition false, global condition false | Correctly blocks the shortcut; R02 narrows its redundant supplier gap. |
| §3.1 interpolation | k=2,4,6, h=k/2 | Period powers 1,2πi,(2πi)²; ε=+1,−1,+1; k−h=h | Matches Kato 12.5(1), not the missing-factor display in §14.13. |
| §3.1 completed versus rational vectors | E-linear functional on F-basis γ₁,γ₂ | If both images 0 then image of aγ₁+bγ₂ is 0 for all a,b∈E | Nonzero image supplies an F-rational basis vector; no F_λ→ℂ embedding. |
| §3.1 removed Euler factor | P=0,L=3; P=2,L=3 | PL=0 and 6 respectively | Nonzero product implies L≠0 without dividing by P. |
| §3.1 conjugation | L=2+3i | Conjugate 2−3i; squared moduli both 13 | Conjugation preserves nonvanishing. |
| §3.2 conditional converse | Localized quotient length 0 versus 1; z↦2z | Basis route true at length 0, hypothesis fails at 1; period doubles, characteristic ideal unchanged | Conditional theorem keeps actual normalized reciprocity input. |
| §3.3 CM all-prime range | (K,p)=(ℚ(i),2),(ℚ(√−2),2),(ℚ(ζ₃),3),(ℚ(√−7),7) | i²=−1; (ζ₈+ζ₈³)²=−2; all four fields occur in the indicated cyclotomic towers | Contained-field branch uses §15.14; no good-prime exclusion. |
| §4.1 Kummer versus dual | Discrete modules ℚ_p/ℤ_p and ℤ/p | Tate modules after rationalization have dimensions 1,0; rational Pontryagin dual dimensions 1,0 but are not the same typed comparison | Correct carrier retained. |
| §4.1 decomposition and twist | η⊕η̄ with ηη̄=χ_cyc | η̄=η^∨(1); central Ind η̄ is the Tate-module summand; removing twist changes determinant by χ_cyc² | Both coefficient embeddings needed, including ramified p and nonmaximal order. |
| §4.1 Shapiro at identity and split place | Identity extension; two local places | H_f maps identically at degree one; split induced terms are a direct sum with dimensions d₁+d₂ | Shapiro matches local finite conditions; R02. |
| §4.2 K-converse | Both theta factors nonzero, e.g. 2 and 3 | Product 6≠0; both Selmer summands zero have sum zero | Requires full factors and both vanishing summands, not one. |
| §4.3 corank doubling | r=0,1,2 | r+r=0,2,4=2r | All-prime rational statement. |
| §4.3 integral dyadic boundary | Lattices generated by (1,1),(1,−1) | Determinant −2; index 2 in ℤ₂², versus rational index 1 | No integral direct sum asserted. |
| §4.4 analytic doubling | Germ (s−1)^r u(s), u(1)≠0, r=0,1,2 | Squared orders 0,2,4; u(1)²≠0 | No rank≤1 truncation or natural-order infinity issue. |
| §4.5 rational converse | 2r=0 for r∈ℕ; p=2,3 | r=0 gives 0=0; r=1 gives 2≠0 | Integer corank equation never reduced modulo p. |
| §5.1 even Goldfeld definition | All, none, three quarters, half nonvanishing | Ratios 1,0,3/4,1/2; exact proposition false,false,false,true | Exact limit distinguished from liminf. |
| §5.1 finite changes and transport | One altered parameter among D; identical twist L-functions | Ratio difference ≤1/D→0; equal L-values give identical numerator indicator | Uses diverging denominator. |
| §5.2 model coefficients and sign | n=−1,0,1,2 | a₁=a₂=a₃=a₆=0; a₄=−1,0,−1,−4; Δ=64,0,64,4096 | Ellipticity iff n≠0; sign-pair models equal. |
| §5.2 model j and wrong coefficient | n=2 and erroneous a₄=−2 | Correct c₄³/Δ=1728; wrong Δ=512 instead of 4096 | j alone would not detect the wrong twist; discriminant Check does. |
| §5.2 Smith and torsion controls | Roots 0,1,−1 | Obstruction products −1,2,2, none squares in ℚ; four rational two-torsion points | Corank-zero numerator does not require finite Sel₂=0. |
| §5.2 denominator and squeeze | Six squarefree residue classes with leading X/π² each | Allowed leading count 3X/π²; good ratio between 1−o(1) and 1 | Positive denominator and density-one conclusion. |
| §5.3 root-number split | Positive squarefree residues 1,2,3 versus 5,6,7 | Three positive-sign classes, three negative-sign classes; negative sign forces central value 0 | Even-family density one gives total 3/6=1/2. |
| §5.4 discriminant weights | Odd radicands and even radicands | Odd pair weight 1+1/4=5/4; even pair weight 1/4+1/4=1/2; allowed weight 3, total 6 | Correct both-sign ordering; no new counting ownership. |
| §5.4 d=4m model isomorphism | Change (X,Y)↦(4X,8Y) | LHS scales by 64; RHS X³−m²X also scales by 64 after coefficients −16m² | Full L-values agree under pointed scaling. |
| §6.1 height definition | Valuations v(t)=−3,−2,0,1,2,3 | Odd-support indicators 1,0,0,1,0,1; v(tu²) has same parity | Inverses, denominators and square representatives handled. |
| §6.1 strict cutoff | ℚ-squareclasses and X=1,2,3 | Counts 0,2,4, from none; ±1; ±1,±2 | H=1 classes need not form a singleton; positivity is eventual. |
| §6.1 native prime hypothesis | K=ℚ(ζ₃),ℚ(√−2),ℚ(i) | Quotients at (3) are nonreduced, split, field respectively; prime predicate false,false,true | Split and ramified included; inert excluded. |
| §6.1 native CM hypothesis | Gaussian curve over ℚ(i), versus over ℚ(√−2) | Endomorphism ranks 2 and 1; integer-scalar map nonsurjective and surjective | Geometric CM alone does not pass the stated K-CM test. |
| §6.1 half lower bound | Initial proportions 1/2,3/4 | Both ≥1/2; a 3/4 limit is allowed | Statistical gap is used as a contract, not silently proved. |
| §6.2 cube-sum coefficients and discriminant | n=−1,0,1,3 | a₆=−27,0,−27,−243; Δ=−314928,0,−314928,−25509168 | Correct fourth-power discriminant scaling and singular exclusion. |
| §6.2 j and sign | Nonzero n and −n | c₄=0; Δ≠0; j=0; coefficients at ±n equal | No 0/0 used at n=0. |
| §6.2 forward polynomial identity | (x,y,z)=(2,1,1), n=−2,0,1,2 | F=13,9,7,5; G(forward)=5616,0,756,2160; 108n²F has exactly these values | Identity checked off the cubic as well. |
| §6.2 inverse polynomial identity | (X,Y,Z)=(1,2,1), n=−2,0,1,2 | G=111,3,30,111; F(inverse)=−11988,0,1620,11988=54nG | Reverse direction checked. |
| §6.2 inverse linear maps | Same source point, n=−2,0,1,2 | Composite=(-72,−36,−36),(0,0,0),(36,18,18),(72,36,36)=18n(x,y,z) | Invertible precisely when n≠0 in characteristic zero. |
| §6.2 affine points and origins | n=1,(1,1); n=−1,(−1,−1); source origin | Both affine points map to (3,0), giving 0=27−27; origin maps to [0:18n:0] | Affine point is not confused with marked origin. |
| §6.2 place direction and uniformizer | Pull back X/Y at origin | (6nz)/(9n(x−y))=2z/(3(x−y)); order 1 since x−y=2 there | Function-field pullback goes k(W)→k(C). |
| §6.2 base change and conventional scale | (X,Y)↦(4X,8Y) | Constant −27n² becomes −1728n²=64(−27n²); −432n² instead corresponds to source parameter n | Both parameter and coordinate normalizations fixed. |
| §6.3 full CM | α(X,Y)=(ζ₃X,Y) versus identity | α³=1 and 1+α+α²=0; identity gives [3]≠0 | Wrong trivial endomorphism action excluded. |
| §6.3 coefficient field and prime | ℚ versus ℚ(ζ₃), n≠0 | End ranks 1 versus 2; discriminant −3; prime norm 3, square norm 9 | Full ring statement uses declared descent contract. |
| §6.4 descent definition and identity | Rational curve base change; singular n=0 | Identity change gives equality; singular discriminant 0 cannot equal a variable change of nonzero Δ | Definition forces ellipticity even without a W.IsElliptic binder. |
| §6.4 isomorphism transport and squares | C followed by C⁻¹; t↦4t | Composite C⁻¹C=1; coefficients scale by 16,64 and the corresponding u=2 change reverses it | Both directions preserved. |
| §6.4 rational j necessary | a₄=1,a₆=1+i | Δ=−16(4+54i); Im(j)=−373248/2932≠0 | Gives a non-descending example. |
| §6.4 exceptional j=0 | Exponent-two quotient, class x | x³=x; x³=1⇒x=1 | One rational coset suffices. |
| §6.4 exceptional j=1728 | K=ℚ(√−2), t=√−2,t₀=1,A:y²=x³−x | Native twist a₄=−(4t)²=32; u=2 scales to 2. Rational-squareclass membership would require a²=2b² with nonzero rational a,b | First coset fails, second holds with q=u=1. |
| §6.4 identity branch and empty case | t=t₀; no descending twist | First branch q=u=1 gives equality; empty set count 0 | Does not assume A descends. |
| §6.5 rational-image height | Split 5, inert 3, ramified 2 in ℚ(i) | H([5])=25, H([3])=9, H([2])=1; unramified product 15 gives 225 | Ramified/fixed support separated as required. |
| §6.5 growth and union | Two sets each bounded C√X; empty set | Union ≤2C√X; empty bound 0≤√X; √X/X=.01,.001 at X=10⁴,10⁶ | O(√X) and zero density follow without a numerator theorem. |
| §6.6 removal and restricted denominator | N=X, good=X/2, remove√X | Full ratios .4,.49,.499; restricted/full denominators .9,.99,.999 | Both lower limits at least 1/2. |
| §6.6 stronger input and empty descent | Original ratio 3/4; excluded count 0 | Removing o(X) leaves 3/4; empty descent loses exactly 0 numerator and denominator terms | No exact-half overclaim. |

The zero ring, characteristic p, square-zero coefficient rings and inseparable number-field extensions cannot instantiate Field/NumberField or ℚ-algebra hypotheses. The cubic maps would have composite scalar 18n=0 in characteristics two and three, which are excluded. Rank zero, trivial group and reducible rank-two representations were tested as negative controls for the cohomological inputs, not silently treated as newforms. All statistical finite sets have finite-support/Northcott suppliers; the zero value of `Set.ncard` on an infinite set is therefore not used to prove an advertised proportion.

### Supplier, gap and locator ledger

Each supplier name in this table denotes `TauCetiRoadmap/<name>/README.md` on main or the available current new-roadmap head, except the explicitly identified design. Section numbers were resolved against those copies, not inferred from the source paper. The listed tests also compare the conventions used at the interface.

| Supplier record | Resolved contract | Interface computation / outcome |
| --- | --- | --- |
| ModularForms | Main Layer 7, L-series, Euler product, completion and analytic rank | Existing L-function is retained; central conjugation and entire removed-factor identities are requested separately. For L=2+3i, conjugation gives 2−3i; both norms squared are 13. |
| EllipticCurveModularity | R29.6, “Continuation and the functional equation” | Equality holds on Re(s)>3/2 with all bad factors; root sign −1 gives 2Λ(1)=0. Quadratic identities remain explicitly contracted. |
| EllipticCurves | Main Layers 1, 5, 7 | General isogenies, pointed twists and Kummer Selmer structures have this owner. A degree-two isogeny composes with its dual to [2], invertible after rationalizing even at p=2. |
| AlgebraicCurves | Main Layer 10, elliptic function fields and smooth plane curves | Point–place direction k(W)→k(C); origin uniformizer pulls back to 2z/(3(x−y)), order 1. Explicit plane-cubic adapter remains a gap. |
| AutomorphicGaloisRepresentations | §§1.5,3.15,4.4–4.8,6.4,7.2 | All-λ irreducibility and purity are unrestricted classical inputs. Twisting weight k−1 by h gives −1; the monodromy kernel weight k−2 gives −2, hence moduli p^−1/2 and p^−1. R01 concerns the package's example, not these imports. |
| ArithmeticGaloisDuality | R02.4.3–R02.4.4, D7.3,D7.5–D7.7 | Finite/lattice/rational duality and compact Shapiro exist. Euler value −1 gives h¹=1; ℤ/2 correction rationalizes to 0. Actual j_* rational sequence remains an exact gap. |
| SelmerIwasawaCohomology | §§2.4,2.10–2.12a,2.19–2.20,3.0,3.7,3.10,3.13–3.16,4.9,4.26,4.29 | Inverse twist at κ=4,h=1 gives 1/4; degree-one Tor sees H² and degree-two Tor sees H³. The rational unramified condition is already the away-p finite condition: R02. |
| PadicHodgeRegulators | §§0.1,1.1–1.8, especially §1.7(d) | φ on ℚ_p(1) is p⁻¹. The Q_p(1) control gives H_g dimension 2 and H_f dimension 1. Finite-condition Shapiro at p is already supplied: R02. |
| ModularIwasawaMainConjectures | Supplied current head §§0.6–0.7; KMC_rational | Rank-one/torsion structure and the actual zeta quotient are distinct inputs. Over a DVR, characteristic ideals of 0 and R/π are R and (π). Its §5.4 restricted ordinary converse does not duplicate this all-prime CM theorem. |
| ModularIwasawaMainConjecturesPartII | `packages/ModularIwasawaMainConjecturesPartII/design/plan.json`, CZ.4–CZ.6 | rational-equivariant-main-conjecture, cm-contained-descent, cm-h2-torsion, cm-kato-main-conjecture and cm-kato-normalization-dictionary all occur. ℚ(√−2)⊂ℚ(μ₈) supplies a contained-field control. This is a design contract, not an existing implementation. |
| GL2AutomorphicRepresentationsAndTransfer | R17.4.16 and its local, central, base-change, twist and cuspidality outputs | At a split place (1−(1+2i)T)(1−(1−2i)T)=1−2T+5T². A coset matrix with off-diagonal entries 2,3 has determinant −6 and polynomial 1−6T². A norm character induces two characters, not a cuspidal representation. |
| ComplexMultiplicationAndExplicitReciprocity | §§1.1–1.2,4.1–4.2; idealLatticeCurve.endomorphismRing, idealLatticeCurve.automorphism_factors, ellipticCMLFactorization | Complex End/Aut, rational self-twist, rational coefficient decomposition and full factors have this owner. Existing induction comparison is for A/ℚ; arbitrary A/K is separately contracted. The order-three action has α³=1 and 1+α+α²=0. |
| ArithmeticStatisticsPartI | §§0.1–0.2,0.5–0.7,0.15 | Piecewise rescaling already has weights 3 and 6; support height, finite fibres and c_KX+o(X), c_K>0 belong here. No counting reconstruction is needed. |
| ArithmeticStatisticsPartVII | §§5.9–5.11 | Smith endpoint is conditional on its law; CM endpoint retains the windowed count. Existing torsion-exception removal and isogeny reduction are preserved. For the half bound, even nonnegative Selmer ranks with mean ≤1 have mass at zero ≥1/2. |

The native-contract audit covered the curve/variable-change/quadratic-extension carriers, raw elliptic L-series, actual cusp-form L-function and analytic-order lemmas, ideals and support valuations, cyclotomic field/integer ring and ramification declarations, short forms and twists, actual endomorphism ring, squareclass quotient, completed group algebra, native newform and its analytic invariants, Euler product, Fricke equation and coefficient conjugation. Native `VariableChange` has a unit scale and three translation coefficients (`Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:57`); native `Algebra.IsQuadraticExtension` means free rank two (`Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:677`). Neither alone means “imaginary quadratic”; the README separately imposes D<0 and the Lean headlines impose total complexity and dimension two. Native `FractionalIdeal.count` gives 0 on the zero ideal; the field-unit representative prevents that junk case. The parent of Newform is the single inaccurate native description: R03.

All **13 gap slugs** occur both in the plan's top-level gaps list and in the README's supplier subsections, with the same supplier and needs text. No gap has supplier `none`. Contracts group the comparison and compatibility laws of the same object; their grouping is not itself a vague-needs finding. Minimality has one finding, R02. The others are accepted as declared contracts, with these boundaries:

| Gap slug | Computed boundary / what the existing supplier does not replace |
| --- | --- |
| all-coefficient-places-zeta | z and 2z generate the same rational zeta submodule, but their reciprocity values differ by 2. A rational main-conjecture equality therefore does not determine the requested actual normalized morphism. The earlier not-actionable repair disposition is not reopened. |
| newform-central-analytic-interface | For P=0,L=3 the removed-factor product is 0; for P=2,L=3 it is 6. Existing convergence-half-plane Euler products do not themselves state the requested entire identity. |
| elliptic-quadratic-analytic-identities | Isogenous full local factors must agree even at bad primes; root signs on the six positive residue classes are +,+,+,−,−,−. The rational continuation theorem alone does not state this whole interface. |
| isogeny-corank-all-primes | [2] is not an integral dyadic isomorphism but is a rational isomorphism; kernels/cokernels killed by 2 have rational corank 0. General p∞ maps with all Kummer conditions remain requested. |
| pointed-cubic-model-comparison | M⁻¹M=18n·I and pullback of X/Y has order 1. A point-group or affine substitution alone does not supply the field-and-place comparison. |
| kato-rational-duality | Real ℤ/2 term has integral cardinality 2, rational dimension 0. Finite-module Euler characteristics alone do not give the precise j_* rational complex. |
| central-jstar-control | R→R by π gives a nonzero degree-one Tor term; H³ amplitude is separately needed to control degree two. Existing degree-one j_* comparison alone does not identify all degrees. |
| central-finite-conditions-and-descent | Away-p inertia restriction 0 means both finite and unramified; nonzero means neither. Existing p-local finite Shapiro also applies. R02 removes these duplicate requests while retaining missing outputs. |
| central-modular-local-dimensions | Critical h gives H¹ dimensions 2 and 1 for ambient/finite spaces; κ⁻¹ and κ⁻² times a finite character differ on an infinite cyclotomic subgroup. No restriction to p∤N is silently accepted. |
| theta-induction-arbitrary-cm-curve | η̄=η⁻¹χ_cyc, so Ind η̄ and Ind η⁻¹ differ by twist 1. The existing A/ℚ comparison and generic induction L-identity do not state the requested arbitrary A/K realization. |
| cube-sum-full-cm | ζ₃ acts over ℚ(ζ₃), not over ℚ; End ranks are 2 and 1. Complex analytic CM classification alone does not assert all geometric endomorphisms descend to every specified coefficient field. |
| smith-unconditional-positive-corank | The six residue densities give 3/6=1/2, but do not determine a Selmer numerator. The supplier retains the Smith-law hypothesis to be discharged. |
| cm-three-selmer-unconditional | A ≤1 average of even reduced Selmer dimensions gives ≥1/2 zeros; the needed unconditional average is not obtained by declaring the windowed hypothesis true. |

Object searches found the existing owners of height/counting, CM character theory, induction, local p-adic maps and rational Kato equality. The package cites them. Its remaining work is the converse deduction and the arithmetic applications, including explicit cubic substitutions and descending-twist estimate. The local `squareclassHeight` body is permitted because it makes the actual headline statable and explicitly retains ArithmeticStatisticsPartI as owner. Other ownership-only names in the scope, including the rank-one and rank-zero-BSD consumers and the two anticyclotomic suppliers, supply no reverse dependency here.

| External locator group | Text inspected and outcome |
| --- | --- |
| BT (1.1) | BT line 24 through line 34: implication and arbitrary r definition, not an assertion of all ranks. |
| BT Theorem 1.1 | BT line 39 through line 43 and 253–261: all-prime CM elliptic endpoint and rational deduction. Typed correction recorded below. |
| BT §1.0.2 and footnote 1 | BT line 47 through line 52,96: exact even Goldfeld proportion and ordering. |
| BT Theorem 1.2 | BT line 50 through line 52: allowed positive congruent-number family. |
| BT Proposition 1.3 | BT line 58 through line 60: non-inert-three CM twist endpoint. |
| BT Theorem 2.6 | BT line 208 through line 218: rational equality, not an integral characteristic-ideal assertion. Footnote issue below. |
| BT Theorem 3.1 and proof | BT line 224 through line 249: central Selmer implication, sign, specialization and nonfinite localization. The package supplies the missing duality bookkeeping. |
| BT Remark 3.2 | BT line 251 through line 252: conditional route beyond CM. |
| BT Theorem 3.3 | BT line 265 through line 269: Smith corank numerator. |
| BT Theorem 3.5 | BT line 273 through line 276: CM corank numerator. Checked against the Selmer-strength argument in BKLOS, not equated with a bare Mordell–Weil-rank claim. |
| BT Remark 3.6(i) | BT line 277 through line 278: cube-sum application. The README identifies its substitutions as its own calculation. |
| BT Remark 3.6(ii) | BT line 279 through line 282: positive non-descending proportion. The stronger one-half conclusion and O(√X) estimate are explicitly derived in the package. |
| Kato §8.2 | Kato line 2490 through line 2518: j_* convention, lattice cohomology and rationalization. |
| Kato Theorem 12.4 | Kato line 4039 through line 4052, printed p. 221 image: torsion H² and rational free rank-one H¹; integral freeness has additional hypotheses. |
| Kato Theorem 12.5(1) | Kato line 4053 through line 4071, printed p. 221 image: actual linear zeta map, F-rational interpolation, sign and period factor. Kato line 1561 confirms the projection contains 1/2. |
| Kato Conjecture 12.10 | Kato line 4165 through line 4168: characteristic-ideal equality, as used through KMC_rational. |
| Kato §14.8 | Kato line 4721 through line 4731: finite discrepancy between the discrete conventions, not equality at each integral bad-prime level. |
| Kato (14.9.3) | Kato line 4771 through line 4782, printed p. 240 image: dual Selmer term and dyadic errors. |
| Kato (14.9.5) | Kato line 4783 through line 4787, same image: minus the negative eigenspace dimension. |
| Kato (14.10.1)–(14.10.5) | Kato line 4793 through line 4812, printed pp. 240–241 images: conjugate dual, determinant, inverse arithmetic Frobenius and bad-prime weights. |
| Kato Proposition 14.11(1) and proof | Kato line 4814 through line 4819: rational invariant vanishing is used in the proof of torsion-invariant finiteness. |
| Kato Proposition 14.12 | Kato line 4832 through line 4849, printed pp. 241–242 images: full critical range 1≤r≤k−1 and dimensions 2,1. |
| Kato §14.13 | Kato line 4850 through line 4891, printed p. 242 image: central specialization and proof-local arguments; period-display issue below. |
| Kato §§15.13–15.17 | Kato line 5704 through line 5772: field noncontainment in 15.13, replacement in 15.14, both branches in 15.15/15.17; wrong internal lemma reference below. |
| BKLOS §2 height | BKLOS line 80 through line 98: odd valuation support, strict H<X, each squareclass once. |
| BKLOS Theorem 2.5 | BKLOS theorem statement and lines 654–661: zero-rank proportion from even Selmer statistics; torsion exception issue below. |
| BKLOS Theorem 2.7 | BKLOS theorem statement and lines 831–879: arbitrary CM order and non-inert three, using isogeny reduction. |
| BKLOS §9.2 | BKLOS line 642 through line 661: the Selmer-strength deduction used here; rational torsion must be removed when using raw dimensions. |
| BKLOS Theorem 11.2 and proof of 2.7 | BKLOS line 831 through line 879: norm-three isogeny ratio and CM reduction; no p=3 unramified restriction. |


For the source parity issue, retain the torsion term at the left of BKLOS (9.1), rather than dropping it: its dimension is t_dual−t₃+t_φ. Cassels’ ratio gives m=d_φ−d_dual+t_dual−t_φ; the alternating Sha quotient has even dimension. Thus dim Sel₃≡m+t₃ modulo two. For E:y²=x³+1 over ℚ(ζ₃), φ=1−ζ₃ is a self-isogeny with local ratio 3 above three and 1/3 at the complex place, so m=0. The division polynomial 3x(x³+4) gives exactly one rational three-torsion line: t₃=1. Raw Sel₃ dimension is therefore odd, whereas the source's unqualified assertion gives even. Removing the finitely many torsion twists preserves the density argument; the existing statistical supplier already makes that removal.

For the other source-specific controls, ℚ(i) is contained in ℚ(μ₄), so rationalizing cannot make Kato 15.13's field-noncontainment assumption true. In Kato 12.5(1), substituting k−r for the interpolation index changes the period exponent to r−1; r=1 gives factor 1 and r=2 gives 2πi. This detects the missing factor in the printed §14.13 display while leaving its nonvanishing argument intact. The package uses the correctly normalized 12.5(1) formula.

## Not verifiable

- KatoEulerSystems has no readable current README in the supplied main checkout, board package or indexed open-head view. The resolver's lead therefore cannot be resolved into a verified present section/declaration claim. The cited mathematics was checked directly in Kato, and the declared full-range contracts are accepted as contracts. The absence of a readable supplier snapshot is not reported as a newly proved ownership defect. The prior `packages/CMRankZeroConverse/reports/FIX-PKG-CMRankZeroConverse~4.md` F01 disposition concerning the all-coefficient-places gap is not re-raised.
- ModularIwasawaMainConjecturesPartII was checked against its readable accepted design targets, not an unavailable finished package. Fulfilment of its contract and of the 13 declared supplier gaps is not certified by this review.
- No fresh elaboration, proof build or numerical L-value computation was performed. The nine elaborated signatures supplied with the job were compared with their source and README; the reported numerical counts exclude the unknown analytic numerator. No source access request is needed: all three directly cited works were available legally.
- Ownership against open pull requests whose files were neither supplied nor readable through the permitted roadmap index was not checked. No inaccessible head was guessed. This qualification does not include the 55 explicitly supplied sibling folders, all of which were searched.

## Source issues

- **Error** in BT at footnote 4 to Theorem 2.6, printed p. 5 (BT line 228): the source says rationalizing makes every hypothesis of Kato 15.13 hold; it should be use Kato 15.14 when the CM field is contained in the cyclotomic tower, for example ℚ(i) at two; affects the proof.
- **Gap** in BT at proof of Theorem 3.1, equation (3.1), printed p. 6 (BT line 232 through line 234): the source says Selmer vanishing for W directly gives H²(W)=0 from Kato's sequence; it should be first establish dual Selmer vanishing using the Euler identity and local dimensions, then apply duality to W; affects the proof.
- **Error** in BT at proof of Theorem 1.1, printed p. 6 (BT line 256 through line 257): the source says a Pontryagin-dual Selmer group tensored with K identifies with untwisted modular Selmer spaces; it should be compare the rational Selmer Tate module over finite p-adic splitting coefficients with centrally twisted modular Selmer spaces; affects the proof.
- **Misprint** in Kato at §14.13, display following (14.13.1), printed p. 242 (Kato line 4856 through line 4862): the source says the period image is the omitted-factor L-value times the signed vector without a period power; it should be include (2πi)^(r−1), obtained from Theorem 12.5(1) by replacing its r with k−r; affects the proof.
- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265 (Kato line 5769): the source says apply Lemma 14.12 to the localized modules; it should be apply Lemma 14.15, the characteristic-length specialization lemma on printed pp. 243–244; affects the proof.
- **Misprint** in BKLOS at equation (9.2), author-version printed p. 14 (BKLOS line 647): the source says the torsion terms are evaluated over ℚ while the curves and Selmer groups are over F; it should be evaluate both torsion terms over F; affects the proof.
- **Error** in BKLOS at §9.2, author-version printed p. 14 (BKLOS line 657 through line 659): the source says raw 3-Selmer dimension has parity m for every twist in T_m; it should be subtract rational three-torsion dimension, or discard the finitely many twists having rational three-torsion before taking proportions; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "15f8fb246e794b62f9499ab75cb62584e4c62eaa", "job": "RT-CMRankZeroConverse~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
