# AutomorphicCongruences repair report

## F01 (P1) — applied

Unreduced ℒ(ρ) identified with torsion → separate ℒ and ℒ̄ = ℒ/Iℒ, reduced block maps, reduced extension kernels, N/N′ and the finite descent module 𝒩. Updated §0.7's statement, route, API and Checks. Evidence: SU line 2012, line 2029, lines 2120–2132 and lines 2210–2219. Generic ranks are 2 before reduction and 0 afterwards.

## F02 (P1) — applied

Minus cubic coefficient → minus linear coefficient of det(1−MX). Updated §1.8 and Mathlib contract; added witnesses in Conventions and §§0.5, 1.3, 1.8, 2.6, 3.7, 4.6 and 5.6. Evidence: Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:334. The polynomial coefficients are (1,−10,35,−50,24), so trace = 10, not 50; SU line 3954's source slip is not adopted.

## F03 (P1) — applied

Torus torsor → integral Levi automorphism-group torsor; functions with boundary ideals then unipotent invariants, with a separate torus weight action. Synchronized gap:unitary-ordinary-igusa and §1.1. Evidence: SU lines 3200–3205; IgusaVarietiesAndTorsionConcentration §IG.1.1. Level-three fibres have 2304 elements, compared with 16 for the diagonal torus; the displayed unipotents do not commute.

## F04 (P2) — applied

“All forms” at q = 1 → boundary corank at most one, defined using I¹. Updated Conventions, §§1.1, 1.2 and 1.6, including the Hecke eigencharacter's carrier. Evidence: SU lines 2775–2782 and 3237–3239. Genus-zero constant terms are 0 in M¹; a full form with term 1 is excluded. No independent unrestricted-space construction was promised.

## F05 (P2) — applied

Unrestricted p in the SU construction → odd p throughout §§1.1–1.11 and the ordinary-Igusa contract. Evidence: SU line 469. At p = 2 the two nonzero completed-group-ring factors [−1]−1 and [−1]+1 multiply to 0; at p = 3 the element −1 is outside 1+3ℤ₃. This retains the source's scope.

## F06 (P1) — applied

A2.1/A3.5 treated as sufficient for envelope removal → N3 retained on that route, with gap:fw-zeta-local-descent supplying construction and classical comparison for the remaining FW cases. Updated §§3.1, 3.7–3.9, 4.1–4.6 and dependencies. Evidence: FW lines 923–929; supplier §§4.7 and 5.8–5.9. Split unramified eigenvalues 1,2 give End = 𝔽₅×𝔽₅, not 𝔽₅.

## F07 (P1) — applied

Imaginary-quadratic-only input in §5.5 → gap:hilbert-cm-unit-congruence on PadicFamilies, with Wan's infinity type, conductor, unit value, local-character and CM-family congruence requirements. Retained the F = ℚ branch separately. Evidence: Wan-2015 lines 4038–4069. For M = ℚ(√29,√−7), p = 23 splits and the CM type has two embeddings; the imaginary-quadratic interface has one.

## F08 (P2) — applied

Unconditional cofinite nonvanishing → distinct Hsieh Theorems A/B branches, with local μ, root number, residual-self-duality, conductor, ramification and auxiliary-prime conditions. Clarified Finis's valuation formula and synchronized gap:katz-cm-padic-l. Updated auxiliary choices and negative Checks in §§1.7 and 5.5. Evidence: Hsieh2012 lines 25–39, 82–108; Finis2006 lines 101–113. Sign −1 gives value 0.

## F09 (P2) — applied

BCS integral endpoint with four extra unit conditions → full (im) endpoint in §7.10 and §8.1. Kept §7.7's unsaturated bound; registered gap:kato-neron-saturated-comparison for an integral coefficient-lattice, regulator and primitive local-cone comparison. Evidence: BCS (published) lines 63–73 and 584–590. The curve y²=x³−4x+7 at p=5 is included despite its Euler valuation 1 at 11.

## F10 (P3) — applied

Rank-positive example advertised as separating directions → A/(p,T) with specialized characteristic ideals A/(T) and (p), strictly unequal. Retained A/(T)⊕A/(T−p) only for the zero convention: both ideals are 0. Updated §0.3. Evidence: SU Corollary 3.2.9(ii) and Proposition 3.2.11, SU lines 900–924; the pseudo-null and DVR length computations are given below.

## F11 (P3) — applied

Missing interfaces and two/two/one Checks → construction APIs and at least three discriminating Checks in §§1.5, 1.6 and 2.10. Tests cover period rescaling, coefficient primitivity, singularity, eigencharacters, weights, denominator supports and character translation. Evidence: SU Theorems 12.3.1, 12.4.2; FW lines 5197–5292. No API lemma or Check was added to Suggested.lean.

## F12 (P3) — applied

Obsolete headline section references → §§2.14, 2.20–2.22; §§4.3, 4.5; §5.10; §§6.6, 7.9, 7.10. Each resolves to its named README headline. Suggested.lean still has no declarations or stand-ins: the required automorphic, Selmer-tower and Iwasawa-function carriers are absent at the pins.

## F13 (P3) — applied

Nonexistent Hsieh2012 Theorem C → Theorems A–B, pp. 2–3, and Corollary 6.5, p. 22. Preserved the manifest key, arXiv version and retrieval record. Evidence: Hsieh2012 lines 82, 104 and 1339. The review's page-free correction is sharpened to the actual Corollary page; Hsieh2014's Theorem C is unchanged.

## F14 (P2) — applied

Unrestricted normalized quotient → identity with global/local pairings cleared, and quotient only for nonzero global and local denominators, including translated pairings. Updated §§2.4 and 2.12. Evidence: Wan-2020 lines 4072–4085; Ichino2008 Theorem 1.1 remains waived. The pairing model gives ⟨e₁,e₂⟩=0 and ⟨e₁,e₁⟩=1, admitting normalization only after the latter choice.

## Verification outcomes

- Acceptance elaboration, run from the pinned content checkout as required: `lake env lean packages/AutomorphicCongruences/Suggested.lean` (the tool invocation used its absolute location). Exit 0, no diagnostics. No Tau Ceti module is imported, so no targeted prerequisite build was necessary. Nothing remains running.
- Elaborated-signature audit: Suggested.lean declares zero definitions, instances, theorems and examples. Consequently its list of `#check @name` obligations is empty; no implicit hypothesis can disappear. One scratch elaboration additionally checked the imported reciprocal-polynomial and quotient declarations. Exit 0. The matrix theorem requires only a commutative coefficient ring and a finite decidable matrix index; the quotient equivalence explicitly requires surjectivity. No change of a Lean binder was needed.
- Final dependency check, with the supplied order and `--movable`, exit 0:

```text
depcheck: 51 roadmaps, 611 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The exact command was the prescribed `tauceti-roadmap gate --depcheck` invocation; no tooling or order file changed.

- All 15 gap needs agree verbatim between README and the plan's top-level gaps list. Comparison with the original plan confirms no other top-level data changed. All 92 numbered target sections remain in order. The report records 92 target rows and all 143 API-law rows. Sections 1.5, 1.6 and 2.10 have 5, 5 and 4 Checks respectively, with an API in each.
- Citation resolution still flags KatoEulerSystems as absent from the general roadmap index. This is an index limitation: the supplied board index identifies its head a3ba9c5; that exact object was read from a read-only board checkout and contains the cited §§0.1, 2.1–2.3, 4.1–4.4, 5.1, 5.3–5.4, 6.6, 7.2 and 7.4. No absent-supplier verdict is inferred from the index message. The resolver's claim that no pinned packages are available was checked against the supplied content checkout; its manifest and package files are present.
- The other 34 supplier READMEs were fetched through `roadmaps show` at the indexed heads/main. All 177 supplier-section candidates in the prior audit were re-resolved in those texts, including SR.5.2 (a dotted-prefix parsing miss was checked directly). The new gap sections resolve in those same copies. Main's AdicSpaces and AdicSpacesPartII were read for shape. Cross-roadmap section citations and the new Mathlib name resolve; no own backticked Lean name was introduced.
- Source audit: 39 manifest works, comprising 33 certified, 5 waived and 1 uncertified entries. Every certified extraction is locally available. No missing reference request is needed; the settled statuses remain settled. Published BCS locators above refer to the legal author-hosted published extraction, not the shorter arXiv extraction; the manifest records both versions under BCS. No new source key was created.
- `git diff --check`: exit 0. The additional arithmetic calculations below were recomputed independently, including point counts; they are boundary probes, not substitutes for proofs of the headline theorems.
- No gate failure was separately listed in the brief. No commit, push, pull-request edit or other external write was made.

## Pins, ownership and consequences

The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The reciprocal theorem is Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:334; the quotient constructor and evaluation rule are Mathlib/RingTheory/Ideal/Quotient/Operations.lean:89 and :93. TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712 defines H1 as cocycles modulo coboundaries, not a Selmer condition or Iwasawa tower. TauCeti/RingTheory/FittingIdeal/Basic.lean:343 constructs fittingIdeal on finite native modules, not a divisorial characteristic ideal. Searches by Selmer, Greenberg, Hida, Klingen, characteristic divisor/ideal and universal-zeta objects find no carriers making any listed headline statable; Mathlib's Dedekind-domain multiplicative Selmer group is a different object. No native declaration was duplicated.

Ownership was searched by object through `roadmaps grep`, the board package index and the supplier texts. The full Igusa carrier stays with IgusaVarietiesAndTorsionConcentration; this package only specializes its contract. The full FW transport belongs with CompletedCohomologyAndLocalGlobalCompatibility §4.7, whose scalar-End hypothesis the contract extends. The general-CM unit/congruence input belongs with PadicFamilies Layer 4 and its Hilbert-family §§5.6–5.9; no second imaginary-quadratic theory is planned here. The saturated Kato comparison belongs with KatoEulerSystems §§6.6, 7.4; this package owns its application to four-factor separation.

ModularIwasawaMainConjectures §3.2 also states an elliptic Kato good-pair/Néron comparison. It is a later consumer and cannot supply this proof. The prerequisite portion is assigned to the earlier KatoEulerSystems gap; downstream ownership must reconcile that overlap, and no file of the consumer was edited. The new gap requires the integral local-cone and saturation comparison, not just the period equality or the final divisibility as an assumption. Saturation concerns the Tate, Betti and de Rham coefficient lattices, not saturation of the arithmetic zeta image inside H¹. That distinction is tested in §7.7: A·(ϖe) has index 1 whereas its saturation has index 0. The comparison must preserve that index. Its eventual supplier proof is substantive work.

The same is true of gap:fw-zeta-local-descent and gap:hilbert-cm-unit-congruence: registering a precise requirement is not a claim that the suppliers already prove it. The FW and BCS endpoints retain the full cited hypotheses conditional on completion of those supplier interfaces. All three new suppliers are earlier in the merge order. No later roadmap is consumed and no declaration name changed in Suggested.lean. The local prose symbols h_D^full and λ_D^full become h_D^1 and λ_D^1 to identify their actual carrier; these were never Lean declarations.

No extra open pull-request files beyond the indexed new-roadmap heads and read-only board head were sought independently. Object ownership was checked against the heads available through the supplied roadmap service; no independent claim is made about unavailable, unlisted heads.

## Adversarial mathematics: target statements

Each row records a computed probe of the numbered statement and its hypotheses. Here A is the specified ring, ϖ a uniformizer and v its normalized valuation. A model of a linear map or divisor tests the interface and direction, not the deep arithmetic existence theorem. Domains exclude the zero ring; arithmetic coefficient rings are mixed characteristic. Degenerate algebraic models do not enlarge their arithmetic scope. The following values were recomputed for this repair.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| 0.1 Selmer kernel and tower | T=0; trivial unramified p-local class | H¹=Sel=X=0, Ch=A; inertia restriction of Frob↦1/p is 0, D restriction is 1/p | Unramified differs from strict | None |
| 0.2 Euler comparison | q=11, p=5, inverse-Frobenius eigenvalue 1 | 1−1/11=10/11; v₅=1 | Cannot discard factor | None |
| 0.3 characteristic specialization | A=ℤ_p⟦T⟧, X=A/(p,T); X=A/(T)⊕A/(T−p) | First: A specializes to ℤ_p versus (p); second: 0 versus 0 | Strict direction and zero convention separate | F10 |
| 0.4 congruence ideal | ℤ→𝔽₇; constants ℤ→ℤ[X] | ker=(7), quotient has 7 elements; X has no constant preimage | Surjectivity necessary | None |
| 0.5 polarized datum | n=1,2; ν(c)=1,−1 | Total ranks 3,4; transpose sign −1,+1 | Polarization and ranks retained | F02 witness |
| 0.6 local extension | Trivial minus line; Frob↦1/p | Inertia value 0, decomposition value 1/p≠0 | Stronger D-kernel implies required kernel | None |
| 0.7 reduced lattice and lengths | R², I=(ϖ); N=R/ϖ², N′=ϖN | Generic ranks 2 versus 0; reduced tensors (R/ϖ)² on both sides; quotient length 1 versus N length 2 | Reduction and quotient essential | F01 |
| 0.8 periods | Ω↦2Ω at p=5; Ω↦5Ω | η↦η/2 gives valuation shift 0; η/5 gives shift −1 | Only unit rescaling preserves ideal | None |
| 0.9 CM congruence | h_(−23)=3, p=3; conductor factors 6 and 4 | v₃(h)=1, v₃(6)=1, v₃(4)=0 | Class number and Euler factors retained | None |
| 1.1 Igusa/forms | Level 3; genus-zero boundary; p=2 | 48²=2304 versus 16; restricted term 0 versus full term 1; ([−1]−1)([−1]+1)=0 | Correct group, module, prime | F03–F05 |
| 1.2 boundary/control | Split projection A²→A; constant term 1 | Kernel rank 1, quotient rank 1; genus-zero value 1 excluded | Sequence uses M¹ | F04 |
| 1.3 datum and polynomials | Eigenvalues 1,2,3,4; first-order weight map | Coefficients 1,−10,35,−50,24; (1+W)⁻¹(1+T)²=1−W+2T modulo degree 2 | Reciprocal convention fixed | F02 |
| 1.4 pullback normalization | Raw coefficient 2, multiplier 3; β=diag(1,0), I₂ | Coefficient 6, not 18; determinants 0,1 | One normalization; singular restriction | None |
| 1.5 SU function | κ=2,4; series Y,pY; periods ×2,×p | Factorials 1,4; coefficient ideals contain 1,p; valuation shifts 0,−1 | Integral primitivity and factors separate | F11 |
| 1.6 family/congruence | Singular/non-singular β; coefficients 1,ϖ; boundary order 2 | det=0/1; reductions 1/0; primitivity gives required lower length 2 | Zero family cannot give bound | F04, F11 |
| 1.7 coprimality | Self-dual signs −1,+1; local μ sum 1,0 | Sign −1 gives L=0; valuations 1 versus 0 under nonvanishing theorem | Reject wrong auxiliary character | F08 |
| 1.8 trace | diag(1,2,3,4); identity | Trace 10=−coeff₁, not −coeff₃=50; T(1)=4 | Linear coefficient | F02 |
| 1.9 Selmer length | v(J)=2; scalar Selmer length 0 | Required middle length ≥2; dropping scalar hypothesis permits positive scalar contribution | No unconditional cancellation | None |
| 1.10 SU two variables | Ch=(ϖ⁴), L=ϖ² | 4≥2 and (ϖ⁴)⊆(ϖ²); reverse false | Correct direction | F05 standing p |
| 1.11 SU cyclotomic | 11a1 at p=7; p=5 | a₇=−2 unit; residual 5-torsion gives reducibility at 5 | Hypotheses discriminate | F05 standing p |
| 2.1 semi-ordinary projector | diag(1,5) over ℤ₅ | Limit diag(1,0), square unchanged | Distinct from GL₂ ordinary input | None |
| 2.2 control cone | t⁺=0,t⁻=4, then 3 | Last inequality is 0≥0, then 0≥1 | Outside-cone point excluded | None |
| 2.3 two families | κ=6,4; coefficient pair X,Y | 6≥6 true,4≥6 false; both coefficients nonunits but no common height-one prime | Keep pair and range | None |
| 2.4 triple products | Pairings (1,0,1),(1,2,1); ideal (X,Y) | Global denominator products 0,2; ht(X,Y)=2 although ideal proper | Clear zero pairings; no global unit inferred | F14 |
| 2.5 Eisenstein bound | v(E)=3, boundary order 2 | 3≥2; (ϖ³)⊆(ϖ²) | Correct inequality | None |
| 2.6 CAP/pseudocharacter | Constituent dimensions 1,1,2; diag(1,2,3,4) | 1+1+2=4; trace 10, cubic extraction 50 | Rank alone does not exclude CAP | F02 witness |
| 2.7 cyclotomic localization | R=O⟦S,T⟧, invert nonzero O⟦S⟧ | S unit, T nonunit; (S) disappears, (T) survives | Different from p-inversion | None |
| 2.8 CLW integral/rational | p=3, conductor factor 6 | v₃(6)=1 before localization, 6 unit after 3-inversion | Extra integral hypotheses matter | None |
| 2.9 vector Hida control | b=A+1 and b=A | b−A=1 and 0 | Strict classical range retained | None |
| 2.10 vector family | (k,m)=(2,0),(4,1),(4,0); (κ,k,m)=(6,2,0) | Weights (0,0,0;κ),(1,−1,−1;κ+1); third excluded; Γ product 2880, i-factor −i | Reparametrization and factors correct | F11 |
| 2.11 Hida–Katz | Remaining product 2, h=3 at p=3 | Full value 6, valuation 1; omitted h gives 2, valuation 0 | Class number cannot disappear | None |
| 2.12 weight extension | k=2,4; pair X,Y versus X,X² | Constants 1,1/3; joint ideal heights 2,1 | Same pairing restrictions in all weights | F14 |
| 2.13 excluded primes | T+5 versus 5(1+T) | μ=0 versus 1 from minimum coefficient valuations | Nonzero is weaker than μ=0 | None |
| 2.14 FW reverse bound | k=2,4 at ℓ=11 | Steinberg a_ℓ=−1,−11 | Sign not replaced by positive root | None |
| 2.15 BF object | Rank 2 tensor induced rank 2; critical character 2 on eigenvalue 6 | Rank 4; twisted eigenvalue 3 rather than 12; empty Euler product 1 | Correct carrier, twist and norm branch | None |
| 2.16 reciprocity | Regulator ×T versus ×2 at p=5 | Cokernels A/(T) and 0, height-one lengths 1 and 0 | Nonzero map does not imply pseudo-null cokernel | None |
| 2.17 equivalence | Common factor ϖ³; factor 0 | Valuations shift equally by 3; 0a=0b even for a≠b | Nonzero cancellation required | None |
| 2.18 auxiliary field | D=−7,−4 at 2 | −7≡1 mod8 splits; −4 ramifies | Odd-prime criterion not used at 2 | None |
| 2.19 Yager/exponential | Unramified degree 3; normal basis | Tr(1)=3; trace of basis generator can be 1; inverse shift sends coefficient at 0 to coefficient at τ | Normal basis/inverse action retained | None |
| 2.20 finite slope | [A→ˣA] specialized at X=0; α=β | H⁰=H¹=E after specialization; α−β=0 | Derived comparison, no root-difference division | None |
| 2.21 ordinary bound | Local scalar −1,1 at p=5 | Invariant dimensions 0,1 | Decomposition-invariant condition retained | None |
| 2.22 Wan ordinary | c=2,j=0,trivial smoothing character | c²−c²=4−4=0 | Correction need not be a unit | None |
| 3.1 residual predicates | Split eigenvalues 1,2 over 𝔽₅; irreducible X²+2; nonsplit distinct extension | End dimensions 2,2,1; algebras 𝔽₅²,𝔽₂₅,𝔽₅ | N3 separate | F06 |
| 3.2 universal ring | Λ=O⟦X₁,X₂,X₃⟧, rank_Λ T=2 | dimΛ=4; rank_Λ T²=4, rank_T T²=2 | Ring levels distinct | None |
| 3.3 classical points | Fibre E×E versus E[u]/u² | Nilradical dimensions 0,1 | Étale reduced fibre required | None |
| 3.4 determinant | [A→ϖ²A], shift, zero differential | Lattice exponents 2,−2; zero differential gives no acyclic trivialization | Sign and nonvanishing retained | None |
| 3.5 factorization | Split local residual; essential-vector level 0,1 | End dimension 2 not 1; unramified principal-series invariant dimensions 1,2 | N3 and minimal conductor needed | F06 route restriction |
| 3.6 homological zeta | k=2; smoothing c=2,j=0 | W=1, tensor gives coinvariants; smoothing 4−4=0 | Construction, not division by unit | None |
| 3.7 universal zeta | Split local example; Σ₀ empty; reciprocal rank four | End dimension 2 uses new gap; Euler product 1; trace 10 | Envelope branch cannot cover split example | F06, F02 |
| 3.8 classical comparison | One Steinberg prime, then empty set | Euler degree 1, then product 1 | Correct invariant space and new FW branch | F06 |
| 3.9 trivialization | t(e)=ϖ⁻¹; rank-two norm | Dual t∨(e∨)=ϖ; norm(ϖ)=ϖ² | Primal/dual and norm distinct | F06 route |
| 3.10 conjectures | Images A,ϖA,TA | Only A integral unit image; after p-inversion ϖA=A but TA≠A | Data and coefficient rings retained | None |
| 4.1 integrality | 1/T, T/p | v_(T)(1/T)=−1, v_(p)(T/p)=−1 | Both forbidden by dual integrality | F06 route |
| 4.2 unit test | α=1+T,p+T at T=0 | Values 1,p; only first a unit | Local specialization detects unit | F06 route |
| 4.3 family theorem | Finite-free coefficient rank 2; scalar ϖ | Norm=ϖ², not ϖ | Statement stays over Λ; full FW class retained | F06 |
| 4.4 specialization | t=u², t=0 | Fibre E[u]/u², u≠0 and u²=0 | Limit argument handles nonétale point | F06 route |
| 4.5 every point | k=2,p=5; scalar determinant | 2a≡1 mod4 has 0 solutions | Parity excludes scalar but not split-distinct End | F06 |
| 4.6 local/Tor/norm | N=[[0,X],[0,0]], X=0; reciprocal polynomials | Generic invariant rank 1, specialized rank 2, Tor₁=E; traces 10 and 3 in ranks 4,2 | Suitable/derived comparison retained | F06, F02 |
| 4.7 congruences | ϖ modulo ϖ², then ϖ | Nonzero versus zero | Same exponent m required | None |
| 4.8 residual map | 1−γ at γ=1+T; odd sign idempotents | −T nonzero nonunit; e₊+e₋=1,e₊e₋=0 | Reduction not a unit claim | None |
| 4.9 μ | Λ/(p), Λ/(T³) | μ=1,0; residual dimensions infinite,3 | Finite residual length discriminates | None |
| 4.10 λ defect | Λ/(T), Λ/(T−p); length differences | Both λ=1 but different ideals; 4−1=6−3=3 | Numerical defect not ideal equality | None |
| 5.1 minimal R=T | p=5, complex conjugation | det(c)=−1=4, square of character value at c is 1 | Exceptional condition substantive | None |
| 5.2 integral projector/period | Basis rescaling 2,5 at p=5 | Valuation shifts 0,1 | Only unit change harmless | None |
| 5.3 Hilbert toric input | Degrees 1,2; empty nonsplit level | Parities odd,even; prime count 0 even | Field/level parity retained | None |
| 5.4 Hilbert family | β=diag(1,0),I₂; scalar 3 | Determinants 0,1; coefficient 2 scales to 6 not 18 | Degenerate-boundary statement only | F03 upstream |
| 5.5 CM coprimality | F=ℚ(√29),M=F(√−7),p=23; sign −1 | 11²≡29≡6,4²≡−7≡16 mod23; CM type size 2; sign −1 value 0 | New general-CM gap; no automatic unit from splitting | F07–F08 |
| 5.6 coefficient ideal | ℤ→𝔽₅, operators 8,3; rank-four polynomial | Difference 5, contraction (5), not (25); constant coefficient 1 and trace 10 | Kernel and reciprocal convention correct | F02 |
| 5.7 cuspidal length | v(L)=2,0 | Bound v(E)≥2,≥0 | Do not force strict positivity for unit L | None |
| 5.8 local polarized extension | Blocks 1,2,1; v(J)=2, scalar length 0 | Rank 4; middle length ≥2 | General F local places retained | F01 upstream |
| 5.9 pulled-back primes | (p),(T_anti) | Contractions to cyclotomic subring (p),0 | Distinct exceptional routes | None |
| 5.10 parallel family | p=5,κ=2; nontorsion convention | 5>3,2≥2; nontorsion Ch=0 makes 0⊆(L) vacuous | Torsion must be proved separately | None |
| 5.11 weight specialization | T² evaluated at T=p,0 | p²≠0 versus 0 | Nonzero-specialization hypothesis needed | None |
| 5.12 quartic input | Real quadratic F, M=FK; p=5,3 | Degrees 2,4; CM tower rank 3; 5>3 true,3>3 false | Source range retained | None |
| 5.13 local auxiliary tests | p=5, inert ℓ=19; split ℓ=11 | Residue cardinalities 361≡1,11≡1 mod5; 19 itself≡−1 | Use q_v rather than rational ℓ | None |
| 6.1 two-variable equivalence | Lengths H/z=2, strict=1, ordinary=2, PR=3, Gr=1, L_Gr=2 | 2+2=3+1=4 and 2+1=2+1=3 | Ratios and directions agree | None |
| 6.2 quartic restriction | A/(p,T) specialization; quadratic idempotents | Ch specializes to ℤ_p but specialized module has (p); e₊e₋=0 | Control orientation and splitting | None |
| 6.3 analytic restriction | Scalar discrepancy p | Valuation discrepancy 1 integrally, none after p-inversion | Rational identity not integral comparison | None |
| 6.4 auxiliary fields | K=ℚ(√−7),F=ℚ(√29) | −7≡14² mod29,−7≡1 mod8,7∤29 | Local field conditions compute; not all E-dependent conditions asserted | None |
| 6.5 μ | T and 1+S+T at T=0 | Both μ=0 initially; values 0 and 1+S with μ=0 | Arbitrary specialization can lose nonvanishing | None |
| 6.6 integral product | Analytic μ=0 or1, algebraic μ=0 | Desired inequalities 0≤0 true,1≤0 false | μ=0 input fills p-prime bound | None |
| 7.1 integral twists | Radicands −7,29; signs ±1 | Product character radicand −203; χ²=1 | Twists not base change | None |
| 7.2 Selmer decomposition | C₂ at p=5,2 | 1/2≡3 mod5, unavailable integrally at 2 | Integral splitting only odd p | None |
| 7.3 cyclotomic projection | T−p,T at T=0 | Values −p≠0,0 | Only first supports nonzero-majorant torsion conclusion | None |
| 7.4 analytic factorization | Period ×p; prime-to-p square root | First changes valuation by −1; second by 0 | Unit factors only | None |
| 7.5 product bound | Characteristic exponents (2,1,1,0), analytic (1,1,1,0) | Sums 4≥3, hence (ϖ⁴)⊆(ϖ³) | Correct orientation | None |
| 7.6 (im) twist stability | σ=1+N,N₁₂=1 or p | σ²−1=2N; quotients ℤ_p or ℤ_p⊕𝔽_p | Integral unit needed, p=2 fails squaring | None |
| 7.7 upper bounds | q=11,p=5; r=p; z=ϖe in H=Ae | Euler augmentation 10/11 valuation 1; multiplying by r adds another 1; length(H/Az)=1 versus saturated-image index 0 | Cannot cancel defects or erase zeta index | F09 |
| 7.8 factor separation | Nonnegative d_i, sum≤0; missing individual bounds | All d_i=0; J₁=J₂=(ϖ),L₁=ϖ²,L₂=1 gives equal products but unequal factors | All inequalities needed | F09 upstream |
| 7.9 rational BCS | E:y²=x³−4x+7,p=5 | #E(𝔽₅)=4,a₅=2; (5) becomes (1) after inversion | Rational scope includes E | None |
| 7.10 integral BCS | Same E; tame inertia at 11 | Δ=−17072,c₄=192,−c₆≡9 mod11; free quotient ℤ₅; v₅(10/11)=1 | Full endpoint includes E through new comparison | F09 |
| 8.1 aggregate | Ideals (ϖ),A before/after p-inversion | Distinct before, equal after | Integral conclusion now uses full (im) endpoint | F09 |

## Adversarial mathematics: individual API laws

The identifiers below mean section followed by the API bullet's position in that section. Each law has its own row. “Retain” means its stated hypotheses survived the probe; it does not certify an arithmetic theorem from a linear model.

| Statement | Instance and computed values | Result/change |
|---|---|---|
| 0.1.1 submodule | Zero coefficients: global H¹=0, local target=0, kernel=0 | Retain |
| 0.1.2 finite dual | T=0 requires 0 generators; the square-zero character at infinitely many tame places has infinitely many ramified places | Finite ramification retained |
| 0.1.3 relaxation | Kernel inclusion 0⊂𝔽₇ dualizes to 𝔽₇→0 | Direction retained |
| 0.1.4 Shapiro | Index-two coinduction of one line has rank 2; tautological eigenvalue γ becomes γ⁻¹ | Retain inverse action |
| 0.1.5 divisorial hull | k⟦x,y⟧/(x,y): Fitt=(x,y), each height-one length=0, Ch=A | Distinguishes invariants |
| 0.1.6 quotient map | A/(T−p) specialized at T=0 is 𝔽_p on both controlled sides | Retain conditional isomorphism |
| 0.1.7 local kernel dictionary | Frob↦1/p has inertia value 0 and D-value 1/p | Retain ordinary convention |
| 0.1.8 equality/membership | Identity on 𝔽₇ has kernel 0; zero map has kernel 𝔽₇ | Both membership directions discriminate |
| 0.4.1 generators | t=10,λ=3 over ℤ gives generator 7 | Retain |
| 0.4.2 contraction | ℤ→𝔽₇ has zero-ideal preimage (7) | Retain |
| 0.4.3 flat transport | ℤ→ℚ sends (7) to ℚ and 𝔽₇ to 0; new coefficient kernel ℚ | Retain flatness |
| 0.4.4 properness iff | ℤ→𝔽₇: I=0,E=(7), both proper; zero target gives both unit ideals | Both directions discriminate |
| 0.4.5 monotonicity | (14)⊂(14,21)=(7); projection ℤ×𝔽₇→𝔽₇ changes contracted 0 to (7) | Retain directions |
| 0.4.6 equality/membership | Ideals generated by 7 and −7 agree; 7 maps to 0 and 1 to 1 mod7 | Retain |
| 0.5.1 companion | Character values χ=2,χᶜ=3,ν=6 give χ′=2 and χᶜχ′=6 | Inverse convention retained |
| 0.5.2 trace | Blocks with eigenvalues 1,(2,3),4 give 1+5+4=10 | F02 consistency |
| 0.5.3 projectors | diag(1,0),diag(0,1) act by (1,0),(0,1); equal characters would require 1=0 | Residual disjointness needed |
| 0.5.4 descent | X²+2 is irreducible over 𝔽₅, splits over 𝔽₂₅: constituent count 1→2 | Absolute conditions retained |
| 0.5.5 minus polynomial | (1−X)(1−2X)=1−3X+2X²; division by specified plus factor gives 1−2X | Retain |
| 0.5.6 block type | n=1,2 gives totals 1+1+1=3,1+2+1=4 | Retain |
| 0.5.7 datum restrictions | Equal residual characters have identical values, hence no separating element giving values 1,0 | Retain all fields |
| 0.5.8 transport | Swapping diagonal entries 2,3 preserves trace 5 and determinant 6; keeping an untransported chosen line changes the line | Retain marked local data |
| 0.7.1 reduced maps | Multiplication by ϖ is nonzero on R and zero on R/ϖ | F01 |
| 0.7.2 reduced extensions | Underlying reduced block ranks 1,n,1 over R/I give Sub rank n+1 and quotient rank 1 | F01 |
| 0.7.3 middle kernel | N=R/ϖ²,N′=ϖN gives quotient R/ϖ, tensor kernel (R/ϖ)ⁿ; lengths n versus 2n | F01 |
| 0.7.4 cocycle/descent | With χ=1 and trivial action, a cocycle obeys c(gh)=c(g)+c(h); on a cyclic p-group values 1/p and 1/p give 2/p | Correct reduced target; F01 |
| 1.1.1 dual forms | Free rank-two M gives dual rank 2; q=1 genus-zero coefficient 0 versus unrestricted coefficient 1 | F04 |
| 1.1.2 expansion | Coefficients differing by 1 at q have difference series q≠0 | Correct map on M |
| 1.1.3 operators | diag(1,5) commutes with diag(2,3); ordinary limit diag(1,0) | Retain |
| 1.1.4 specialization | 1+X at X=0 gives 1; outside regular cone no classical equality asserted | Retain range |
| 1.1.5 boundary | A²→A via second projection has kernel A×0 and surjective image A | F04 carrier |
| 1.1.6 Hecke image | A×A has nilradical 0, A[ε]/ε² has nonzero nilpotent ε | Reducedness not finiteness alone |
| 1.1.7 expansion equality | Difference expansion 0 gives zero form; coefficient difference 1 rejects equality | Both directions retained |
| 1.3.1 coefficient algebra | Γ_K rank 2 plus Γ_K⁻ rank 1 gives 3 variables over a Hida branch | Retain |
| 1.3.2 reciprocal polynomial | Eigenvalues 1,2,3,4 give degree 4, constant 1, trace 10 | F02 |
| 1.3.3 ideals | ℤ→𝔽₇ gives I=0,E=(7) | Retain distinct rings |
| 1.3.4 quotient | ℤ/(7)→𝔽₇ is bijective; both have 7 elements | Surjectivity retained |
| 1.3.5 analytic product | ϖ²·ϖ³=ϖ⁵ | Scalar factor not omitted |
| 1.3.6 arithmetic evaluation | Coefficients (1,−10,35,−50,24) reduce mod5 to (1,0,0,0,4) on both routes | Retain |
| 1.3.7 transport | Difference generators 7,−7 both yield (7) and the same contraction | Retain |
| 1.4.1 section dependence | Scaling section by 3 scales linear Eisenstein sum coefficient 2 to 6 | Wrong invariance excluded |
| 1.4.2 pullback | Scalar 3 times Klingen coefficient 2 gives pairing coefficient 6 | Retain scalar |
| 1.4.3 normalized series | One multiplication gives 6; two give 18 | Retain one normalization |
| 1.4.4 period coefficient | C=6,u=2,period=3 gives uC/period=4 | Retain full factors |
| 1.4.5 singular coefficients | diag(1,0),I₂ have determinant 0,1 | Only first in singular assertion |
| 1.4.6 U eigenvalue | Values 2,3 with exponents 1,2 give 18, not 6 | Retain powers |
| 1.4.7 raw boundary | Raw boundary 2 becomes 6 under normalization by 3 | Raw/family distinction retained |
| 1.4.8 extension/equality | ℤ→ℚ preserves coefficient difference 2−3=−1≠0 | Retain |
| 1.5.1 Petersson function | Nonzero denominator 2, numerator 6 gives 3; zero denominator excluded | F11/F14-compatible |
| 1.5.2 integral function | Integral numerator normalized by a unit 2 at p=3 stays integral; division by 3 changes valuation by −1 | F11 |
| 1.5.3 density/period | Period ×2 sends value 6 to 3; zero difference on a dense set has zero generic value | F11 |
| 1.5.4 pulled-back primes | Y has coefficient 1 and no pulled-back divisor; pY lies in (p) | F11 |
| 1.6.1 family carrier | Genus-zero restriction 0; an unrestricted coefficient 1 fails I¹ | F04/F11 |
| 1.6.2 boundary ideal | β determinants 0,1; (ϖ²)(ϖ)=(ϖ³) for singular product | F11 |
| 1.6.3 eigencharacter | Λ/(ϖ)→Λ as Λ-algebra would require 0=ϖ≠0 | F11 |
| 1.6.4 primitivity | Coefficient 1 reduces to 1, coefficient ϖ to 0; boundary order 2 only yields the bound from the first | F11 |
| 1.8.1 dimension | Identity has trace 4, versus 2 for GL₂ | Retain |
| 1.8.2 classical trace | diag(1,2,3,4) gives 10 on specialization and trace | F02 |
| 1.8.3 Frobenius | −coeff₁=10, −coeff₃=50 | F02 |
| 1.8.4 polarization | Eigenvalues 2,3, similitude 6: 6(1/2+1/3)=5=2+3 | Retain multiplier |
| 1.8.5 constituents | 2+2=4 while 1+1+2=4 also; rank alone excludes neither | Keep source/CAP input |
| 1.8.6 residual trace | 10 mod5=0 from both expressions | Retain |
| 1.8.7 density/quotients | Trace 4 versus 2 differs by 2 at identity; a continuous zero difference on a dense subset has closed zero set equal to the group | Retain density hypothesis |
| 2.1.1 weight ring | ℤ₅⟦X,Y⟧ dimension 3; four variables give dimension 5 | Two-variable torus retained |
| 2.1.2 U product | Three scalar U values 2,3,4 multiply to 24 | All factors needed |
| 2.1.3 idempotent | e=diag(1,0) gives e²=diag(1,0) | Retain |
| 2.1.4 ordinary inclusion | e_so=diag(1,1,0),e_ord=diag(1,0,0), product=e_ord | Reverse equality fails |
| 2.1.5 weights | Character a·b² at (2,3) gives 18; a²·b gives 12 | Coordinates distinguished |
| 2.1.6 membership | e(x,y)=(x,0) fixes iff y=0 | Both directions discriminate |
| 2.3.1 rational pair | X/p,Y/p are in R[1/p]; coefficients of X/p have valuation −1 at (p) | No integral family inferred |
| 2.3.2 arithmetic values | κ=6 meets lower bound,κ=4 does not; e(1,p)=(1,0) | Retain range/projector |
| 2.3.3 boundary | L₁=ϖ,L₂=ϖ² give product ϖ³ | Retain both factors |
| 2.3.4 eigencharacter | Operator values 10 and 3 agree mod7 | Retain quotient character |
| 2.3.5 coefficient bundle | Transition function 2 changes coordinate c to 2c | Not a fixed scalar coordinate |
| 2.3.6 two choices | X and Y both nonunits, ideal height 2; identifying both as X gives height 1 | Keep index |
| 2.3.7 extraction/evaluation | Coefficient 1+T evaluated at T=3 gives 4 in either order | Retain |
| 2.10.1 interpolation | κ=6,k=2,m=0 gives gamma product 2880 and archimedean factor −2880i·2⁻¹⁷π⁻¹¹ | F11 |
| 2.10.2 coefficient family | Boundary products ϖ·ϖ²=ϖ³; rational coefficient 1/p is not integral | F11, no integral-family inference |
| 2.10.3 automorphism/weight | At p=3, a=4,b=7 gives 7/4 rather than 28; (4,1) gives (1,−1,−1;κ+1) | F11 |
| 2.10.4 factorization/denominators | 2·3=6 retains class number 3; v_(p)(1/p)=−1, v_(Y)(1/Y)=−1 | Disjoint supports needed; F11 |
| 2.12.1 dual bases/archimedean | Basis ×2 and dual ×1/2 contract to 1; k=2,4 constants 1,1/3 | Retain factors and F14 denominators |
| 2.12.2 indexed identities | Nonconstant values X,Y share a boundary factor ϖ but are different | Keep auxiliary data |
| 2.12.3 height-one iff | (X,Y) height 2 avoids height-one primes; (X,X²)⊂(X) | Both directions discriminate |
| 2.15.1 tensor rank | 2·2=4 | Correct carrier |
| 2.15.2 Shapiro rank | Index 2 times rank 2=4 | Correct field change |
| 2.15.3 critical twist | Eigenvalue 6 and twist character 2 give 6/2=3, not 12 | Retain inverse |
| 2.15.4 Greenberg | Minus projection of (1,0) is 0, of (0,1) is 1 | Distinct relaxed/Greenberg conditions |
| 2.15.5 norm | Empty Euler product 1; factor 1−γ becomes −T | Retain branches |
| 2.15.6 specialization | θ=1+T at T=p gives 1+p, inverse gives (1+p)⁻¹ | Commutes with twist |
| 2.15.7 local nontorsion | ann_A(1)=0, ann_A(0)=A in a domain | Zero BF class excluded |
| 2.15.8 construction/equality | Isomorphism sends x−y=0 iff x=y; zero local image alone admits the zero class | Retain distinguished construction |
| 3.1.1 residual assumptions | Unipotent inertia [[1,1],[0,1]] has invariant dimension 1; identity has dimension 2 | Witness needed |
| 3.1.2 T1.7 | μ(Frob)=−1 gives invariant dimension 0; μ=1 gives dimension 1 | Keep nontrivial μ |
| 3.1.3 Nakamura predicates | p=3 fails N1; split distinct characters give End dimension 2 and fail N3 | Separate predicates |
| 3.1.4 End computation | Nonsplit distinct extension has scalar commutant dimension 1; split diagonal has dimension 2 | F06 |
| 3.1.5 twists | Unramified twist acts by 1 on inertia and preserves invariant dimension 1; ramified scalar twist can give dimension 0 | Keep witness restrictions |
| 3.1.6 T5.1 | μ(Frob)=1 permitted on reducible branch, rejected on irreducible branch | Keep branch |
| 3.1.7 transport | Conjugating a nonzero rank-one nilpotent preserves kernel dimension 1 | Retain local data |
| 3.4.1 partial line | Two-term complex [A→ϖA] gives determinant exponent 1, inverse exponent −1 | Retain sign |
| 3.4.2 full correction | Local Euler ϖ changes lattice A to ϖA | Full/partial distinct |
| 3.4.3 rank-one Euler | α=1−ϖ gives 1−α=ϖ; α=1 gives 0 | No acyclic map at zero |
| 3.4.4 base change | [A→ˣA] at X=0 gives [E→⁰E], H⁰=H¹=E | Derived change retained |
| 3.4.5 suitability | Inertia N(X) kernel rank 1 generically, rank 2 at X=0 | Arbitrary specialization insufficient |
| 3.4.6 p-only comparison | Matching local correction exponents 2−2=0 | Retain matching cones |
| 3.4.7 characteristic iff | Lengths 2,2 give exponent 0; lengths 2,3 give nonzero exponent | Both directions discriminate |
| 3.4.8 generic equality | Multipliers 2,3 differ by 1; equal generic scalars have difference 0 in a domain | Retain injectivity |
| 3.6.1 equivariance | z(v)=3,a=2 gives z(av)=6=az(v) | Retain actual codomain |
| 3.6.2 integral localization | Smoothing c=2,j=0 at augmentation gives 0 | Integrality not unit division |
| 3.6.3 continuous limits | Constant residues 2 mod pⁿ compatible; residues 0 mod p and 1 mod p² incompatible | Retain compatibility |
| 3.6.4 τ law | Minus component gives z(−v)=−z(v)=σ₋₁z(v) | Retain |
| 3.6.5 norm branches | l|n multiplier 1; new l multiplier 1−γ=−T | Retain |
| 3.6.6 tensor over group ring | C₂ sign module at odd p has coinvariants A/2A=0, ordinary scalar tensor A | Reject wrong tensor |
| 3.6.7 determination | Element with v≥n for every n has value 0 in a separated DVR | Retain separated limit |
| 3.7.1 linearity | z(v)=3 gives z(2v)=6 | F06 existence branch |
| 3.7.2 sign tensor | On minus summand, v⊗σ₋₁a=−v⊗a=τv⊗a | Retain balanced tensor |
| 3.7.3 norms | Empty correction 1, single factor −T | Retain |
| 3.7.4 coefficient change | Identity specialization leaves z fixed; X=0 retains both terms of [A→ˣA] | Derived comparison |
| 3.7.5 Σ change | Steinberg correction evaluated at 1/11 is 10/11 | No unit assumption |
| 3.7.6 classical comparison | Σ₀ empty gives z; one Steinberg factor gives (10/11)z | Retain factors |
| 3.7.7 transported map | Coordinates ×2 then ×1/2 give identity; ×2 alone gives a different map | F06, N3 only for envelope |
| 3.9.1 injection | ×ϖ⁻¹ has kernel 0,image ϖ⁻¹A; zero map has kernel A | Componentwise nonzero required |
| 3.9.2 norm | Scalar ϖ on a rank-two algebra has determinant ϖ² | Retain norm |
| 3.9.3 specialization | 1+X at X=p gives 1+p by both paths | Retain compatibility |
| 3.9.4 full lines | Euler X specialized at 0 becomes 0; Euler ϖ stays ϖ | Suitability needed |
| 3.9.5 dual iff | α=ϖ gives images ϖ⁻¹A,ϖA; α=2 at p=5 gives A,A | Both unit iff α unit |
| 3.9.6 Kato point | Equal lengths 2,2 give determinant exponent 0 | Retain specified zeta map |
| 3.9.7 generic agreement | Equal multiplier 2 gives equal integral maps; rank-two norm of 2 is 4 | Retain fraction-algebra distinction |
| 3.10.1 partial/full predicates | Empty local correction 1 leaves line fixed; correction ϖ changes lattice | Retain |
| 3.10.2 coefficient levels | Rank-two split algebra has generic K×K, not K | Retain separate conjectures |
| 3.10.3 T⇒Λ | Norm(u)Norm(u⁻¹)=Norm(1)=1 | Forward implication retained |
| 3.10.4 point iff | Equal length 2=2 iff difference exponent 0 | Both directions discriminate |
| 3.10.5 data dependence | Replacing z by ϖz adds 1 to quotient length at (ϖ) | Preserve zeta data |
| 4.8.1 residual source | Odd sign idempotents sum to 1, product 0 | Retain balanced source |
| 4.8.2 residual Σ | 1−γ reduces to −T≠0, not a unit | Retain |
| 4.8.3 points | A unital ring point sends 1 to 1; zero function sends 1 to 0 | Correct point carrier |
| 4.8.4 η-component | e₊=(1+c)/2,e₋=(1−c)/2 give complementary projections | Retain character component |
| 4.8.5 residual equality | 1 and 1+p both reduce to 1 | Retain |
| 4.8.6 reduction paths | p maps to 0 mod p along either coefficient path | Retain commuting diagram |
| 5.6.1 membership | ℤ→𝔽₅ sends 5 to 0,1 to 1 | Correct kernel |
| 5.6.2 composite | Composite quotient kernel is (5), not the quotient ring 𝔽₅ | Retain carrier |
| 5.6.3 differences | 8−3=5=0 in 𝔽₅ | Retain |
| 5.6.4 equivalence | ℤ/(5),𝔽₅ have 5 elements; constants ℤ→ℤ[X] miss X | Surjectivity necessary |
| 5.6.5 base change | ℤ→ℤ[1/2] has kernel 0; mod2 target becomes zero ring and new kernel is all 𝔽₂ | General containment, no arbitrary equality |

## Adversarial mathematics: conventions and supplier interfaces

| Statement | Instances tried and computed values | Result | Change |
|---|---|---|---|
| Field/twist convention | Radicands −7 and 29 give −203; quadratic signs multiply to ±1 and square to 1 | Twist dictionary consistent | None |
| Σ and p-local convention | T_p=0, unramified class Frob↦1/p: inertia value 0 but class value nonzero | Does not become a strict condition | None |
| Finiteness/continuity | In characteristic p, (1+εXⁿ)^p=1 for ε²=0, with ramification at infinitely many primes | Continuity alone insufficient; finite S retained | None |
| Divisorial versus Fitting | A=k⟦x,y⟧,A/(x,y): height-one lengths 0,Fitt=(x,y),Ch=A | Divisorial hull needed | None |
| Containment direction | (ϖ⁴)⊆(ϖ²) gives 4≥2; ϖ²∉(ϖ⁴) | Both directions tested | F10 witness |
| Frobenius/dual/reciprocal | Eigenvalue 2 gives 1−2X, dual gives 1−X/2; four eigenvalues give trace 10 rather than 50 | Conversion explicit | F02 |
| Period scaling | Ω→2Ω at p=5 changes v by 0; Ω→5Ω changes v by −1 | Unit comparison only | F11 witnesses |
| Rational/localized coefficients | S becomes invertible in Frac(O⟦S⟧), T remains nonunit; p-inversion alone leaves S nonunit | Two localizations distinct | None |
| Splitting at 2 | −7≡1 mod8 split,5≡5 mod8 inert,−4 even ramified | All three cases separated | None |
| Determinant dual and norm | Differential ϖ² gives primal ϖ²,inverse ϖ⁻²; norm of ϖ in coefficient rank 2 is ϖ² | Signs and degree retained | None |
| Ramified coefficients | p=uϖ² gives v_ϖ(p)=2,v_ϖ(ϖ)=1 | No replacement of uniformizer by p | None |
| Nonabelian versus cyclic | Standard S₃ representation over ℚ has scalar commutant ℚ; its C₃ restriction has commutant ℚ(ζ₃), of dimension 2 | Global irreducibility does not imply local absolute irreducibility | F06 branch |
| Degenerate ranks and products | Empty determinant/product=1; zero trace in rank 0; n=1,2 middle blocks give total ranks 3,4 | Rank 0 excluded by n≥1; trace formula itself handles it | F01/F02 |
| Zero/identity maps | Zero A→A has kernel A,determinant 0; identity has kernel 0,determinant 1 | Generic nonzero hypotheses needed | None |
| Nonreduced specialization | E[u]/u² has u≠0,u²=0, dimension 2; E×E has nilradical 0 | Derived/suitable comparisons retained | None |
| gap:divisorial-char-ideal | Normal A=ℚ⟦x,y,z⟧/(xy−z²),P=(x,z): height-one length of A/P is 1 at P and 0 elsewhere,Ch=P nonprincipal | Genuine extension of UFD-only ideal API | None |
| gap:unitary-ordinary-igusa | |GL₂(𝔽₃)|=(9−1)(9−3)=48; square 2304,torus 16; UV≠VU | Correct Levi carrier and distinct torus weights | F03/F05 |
| gap:unitary-galois-imaginary-quadratic | Imaginary quadratic base has totally real degree 1 versus supplier range ≥2; required representation dimension 4 | Gap still necessary | None |
| gap:katz-cm-padic-l | Sign −1 forces 2L=0 and L=0; local μ sum 1 gives valuation 1,not 0; degree-one auxiliary place gives cofinite set | Full hypotheses separate zero from units | F08 |
| gap:anticyclotomic-rankin-selberg | Local μ=1 contributes valuation 1; level with 1 versus 2 inert factors has odd versus even parity | Nonsplit factors and sign conditions retained | None |
| gap:hilbert-hida-odd-degree | Degree 1 odd,degree 2 even | Supplier's even-degree theory does not supply odd degree | None |
| gap:msd-neron-periods | Ω→pΩ sends L to L/p,v changes by −1; Ω→unit·Ω changes v by 0 | Integral comparison substantive | None |
| gap:rubin-imaginary-quadratic | K=ℚ(√−23),h=3,p=3 split since −23≡1 mod3; class factor has valuation 1 | Normalization retained | None |
| gap:fujiwara-minimal | At p=5,det(c)=4 whereas square of an order-two character value is 1 | Exceptional/minimal hypotheses not automatic | None |
| gap:minimal-lift-base-change | Unramified quadratic restriction replaces Frob by Frob²; eigenvalue −1 becomes 1 | Local type can change | None |
| gap:paskunas-p3-freeness | 3≥3 true,3≥5 false; split End dimension 2 still fails scalar hypothesis | Prime extension does not remove N3 | F06 clarification |
| gap:gl2-essential-vectors | Unramified principal series has dimension 1 at conductor 0,dimension 2 at next K₁-level | Common minimal conductor needed | None |
| gap:fw-zeta-local-descent | Split Frobenius 1,2 over 𝔽₅ has 2-dimensional commutant; nonsplit extension has dimension 1; empty comparison Euler product 1 | New route covers first without invalid envelope use | F06 |
| gap:hilbert-cm-unit-congruence | 29,−7 have square residues 6,16 at 23; CM type size 2 rather than 1; sign −1 value 0 | General CM carrier and exact unit hypotheses needed | F07/F08 |
| gap:kato-neron-saturated-comparison | E witness has a₅=2,irreducible mod5 polynomial discriminant 2,unit tame transvection, Euler valuation 1 | Need local cones and saturated coefficient lattices retaining zeta index 1; period identity alone cannot cancel factor | F09 |

## Recomputed worked examples and boundary values

The lattice's reduced middle block with I=(ϖ) is (R/ϖ)², and both its tensor description and itself have generic rank zero; the unreduced free block has generic rank two. N=R/ϖ²,N′=ϖN gives length(N/N′)=1. The reduced scalar ϖ-map is zero. These computations propagate through the reduced cocycle source, kernel and Selmer length statements; no bound now attaches the torsion module to the unreduced block.

For the BCS witness y²=x³−4x+7, direct counts including the point at infinity give 7 points over 𝔽₃ and 4 over 𝔽₅. Hence a₃=−3 and a₅=2. The discriminant is −16(4·(−4)³+27·7²)=−17072=−16·11·97. Modulo 5 the Frobenius polynomial at 3 is X²+3X+3, of discriminant 2, whereas squares mod5 are 0,1,4. It therefore excludes any global invariant 𝔽₅-line. At 11, v₁₁(Δ)=1,c₄=192 and −c₆=6048≡9. The minimal reduction is split multiplicative; the Tate parameter has valuation 1. Tame inertia can consequently act by [[1,u],[0,1]] with u a 5-adic unit. That inertia fixes the 5-power roots of unity, and the quotient of the Tate lattice by this matrix minus 1 is ℤ₅. This proves the required (im) witness, without assuming its conclusion. Its primitive Euler augmentation is 10/11 of valuation 1, so the old unit restriction really excluded an admissible curve.

For the character reparametrization, the second map is a coefficient-linear group inversion/conjugation, so it leaves the scalar ξ′_0(γ)⁻¹ fixed. At p=3, the permitted generator values 4 and 7 are both congruent to 1; the correct evaluation is 7/4. Inverting the coefficient as well would give 28. Using 2 as a pro-3 character value would violate this congruence, so the witness deliberately uses 4. The weight tests and gamma factors in §2.10 are independent checks of the same normalization.

For the triple-product formula let D_g=∏d_i and D_l=∏d_(i,v). The normalized formula, when denominators are nonzero, is I/D_g=C_L∏J_v/D_l. Multiplication gives I·D_l=C_L·D_g·∏J_v, exactly the identity now stated. If a denominator vanishes, only this identity is asserted. On a nondegenerate two-dimensional pairing, ⟨e₁,e₂⟩=0 but ⟨e₁,e₁⟩=1. Rescaling a dual vector by 2 doubles its period factor,global pairing and raw local integral; the cleared formula scales equally on both sides. Its weight-k archimedean factor is 1/(k−1), with values 1 and 1/3 at k=2,4 and no allowed division at k=1.

For the four-factor cancellation, if all d_i≥0 and ∑d_i≤0, then ∑d_i=0 and each d_i=0. Dropping an individual inequality permits J₁=J₂=(ϖ),L₁=ϖ²,L₂=1: both products are (ϖ²), but J₁≠(L₁) and J₂≠(L₂). An empty family has product 1 and no factor conclusions. A zero L would defeat cancellation and is excluded. The full integral endpoint requires primitive upper inequalities at (p); rational equality,or the weakened upper bound with r_E times the imprimitive function,does not supply them.
