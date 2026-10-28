# Repair report

The finding IDs are local to each review. Each section identifies r1a or r1b explicitly; all twelve findings receive a verdict. The reviews overlap on the spectral normalizations and conductor route, which are audited once in the tables below.

## F01 (P3) — applied

r1a. Layer 2 alone → Layer 2 Gauss–Bonnet plus Layer 6, item 1, modular signature. Updated scope, conventions, supplier contract, §0.1 route/locator/Needs and Layer 0 dependencies. Evidence: main `TauCetiRoadmap/FuchsianOrbifolds/README.md:235` and `:349`. The signature gives 2π(−2+1+1/2+2/3)=π/3; effective index six gives 2π at level two.

## F02 (P3) — applied

r1a. Deleted the nondiscriminating zero Checks in §§0.2, 0.3 and 3.2. Each retains three discriminating Checks; the dual-kernel zero law remains in its API. The surviving tests exclude the zero/negative operators, the real-mean/zero subspaces, the wrong Mellin sign, missing 1/s and unreflected support. No Lean padding was added.

## F03 (P1) — applied

r1a. Unlisted conductor inputs → explicit general rational-adic curve Euler–Poincaré and Swan-constancy targets in §4.2b, with at least three Checks each. Imported the finite-coefficient formula and ArithmeticGaloisRepresentations §§3.1, 3.7; expanded the general convolution route and dependencies. Evidence: katz-gkm line 1352, line 2489 and line 2812; laumon-swan line 413 and line 423. Updated Lean's unavailable-carrier inventory.

## F04 (P3) — applied

r1a. Teschl §4.3 → §4.4 in conventions, §§0.3, 0.4, 0.7, 5.4, 5.5, References and the existing manifest entry. Theorem/page/line numbers stay fixed. Evidence: teschl line 5043 gives the printed section heading, line 5044 the min–max theorem, line 5053 its form-domain extension. The contrary section attribution in r1b's verified-sound narrative is incorrect.

## F01 (P2) — applied

r1b. Removed boundary continuity from gap:all-prime-self-pair-positivity in README and the plan's top-level gaps. Section 2.1 now derives it from AL.3's continuation/boundary targets: gamma arguments have real part ≥1−β₀>0; the only self-pair boundary pole is simple at 1. Added the shifts {2/5,0,0,−2/5} Check. Coefficient/residue positivity remains a supplier gap.

## F02 (P3) — applied

r1b. Deleted the manifest-status sentence from References. The bibliographic locators remain, and `sources.toml` still records lrs95 as uncertified. No request for this settled source was made.

## F03 (P3) — applied

r1b. Claims about unread displays → the roadmap's own multiplicative-mass and full principal-subtraction conventions, with the existing numerical witnesses. Ordinary mass one gives multiplicative mass log 2 for the interval example; q=5,n=1 gives 2−1=1. Published LRS locators remain citations, without an asserted erratum. No other source-content correction is asserted in the editable README or Lean file.

## F04 (P3) — applied

r1b. Deleted proof-of-congruence independence from §0.1's construction sentence and API; fundamental-domain independence remains. At the pin, `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` defines IsCongruenceSubgroup as a Prop. Two proofs are definitionally equal, so the proposed independence statement is reflexivity and supplies no mathematical acceptance test.

## F05 (P3) — applied differently

r1b. Moved the upper bound 1/4 and its spectral route/dependencies from §0.4 to §0.7; updated the Layer 0 introduction. Rather than leave §0.4 with two Checks, replaced its spectral-threshold Check by a computed scaling test for the Rayleigh denominator. Section 0.4 now depends only on earlier constructions and abstract spectral/form-core suppliers.

## F06 (P3) — applied

r1b. Unspecified Γ₀(N) agreement → an explicit §0.2 API target, N≥1, with the measure-preserving quotient identification and equal domains/actions. It cites `modular_laplacian_realization` of AutomorphicSpectralTheory §1.16a, already in Needs. Equality follows by uniqueness for the identified closed energy forms. The central kernel is {±I} at every such level.

## F07 (P3) — applied

r1b. Added LFunctions Layer 0 to scope, exact supplier contracts, the finite-strip gap and Layer 3 dependencies; changed the matching plan gap text. Its data record and four analytic predicates are distinguished from ZerosOfLFunctions' continued function and strip theorem. Evidence: `TauCetiRoadmap/LFunctions/README.md`, Layer 0; `TauCetiRoadmap/ZerosOfLFunctions/README.md`, supplier table, lines 168–173.

## F08 (P3) — not actionable in this package: the base roadmap's proof-route ownership needs coordination

r1b. Scope now names AutomorphicSpectralTheory §7.1a as owner of the finite-place number-field bound and specifies this part's real-place endpoint. Section 7.1a explicitly constructs its bound but exposes no prime-twist moment to import. Aligning that earlier roadmap's route requires editing it or a human ownership decision; neither is authorized here. This is an ownership issue, not a missing supplier prerequisite.

## Checks and signature comparison

- `lake env lean` on `packages/CongruenceSpectralGap/Suggested.lean`, from the pinned content checkout, exited **0**. Exactly three warnings: declaration uses sorry, at lines 46, 57 and 73. No Tau Ceti import occurs, so no object build was necessary.
- A scratch copy of the acceptance file with `#check @` for **all four declarations** was elaborated once, sequentially after that check: exit **0**, the same three warnings. Compared every elaborated type with its README statement. No binder disappeared and no signature changed. The only Lean edit extends the module's unavailable-carrier inventory.
- The required dependency command exited **0**, with this exact output:

```text
depcheck: 48 roadmaps, 545 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Earlier invocations reported 48 roadmaps, 538 edges, 0 problem(s); the output above is the final invocation.

- Citation resolution exited **0**: no cross-roadmap citations found nowhere and no Lean names found nowhere. The resolver reports that its own host did not check library names; the local pinned checks below supply that part. The initial AnalyticLFunctionData lead is resolved to LFunctions Layer 0, not presented as a pinned declaration.
- No separate gate failure was supplied. The missing-owner lead, locator defects and scope/interface defects are addressed in the finding sections above.
- Final structural checks and `git diff --check` exited **0**. Plan comparison: outside its top-level gaps list the JSON is unchanged. The seven slugs and supplier/section assignments remain; the two edited needs strings agree verbatim with the README contracts.
- Only the four permitted roadmap files and this requested report changed. `metadata.toml` is unchanged. No commits or network writes were made.

The four elaborated signatures retain:

| Declaration | Explicit retained context | README agreement |
|---|---|---|
| hyperKloosterman | F : Type u; Field F; Fintype F; k : ℕ; ψ : AddChar F ℂ; r : Fˣ | Total definition at every rank; no nontriviality hypothesis in the definition. |
| hyperKloosterman_bound | Same carriers; 1≤k; ψ≠1; unit r; real exponent (↑k−1)/2 | Every finite field and positive rank; no characteristic restriction. |
| gauss_power_even_average_bound | q : ℕ; Fact q.Prime; NeZero q; 2<q; 1≤k; r : (ZMod q)ˣ | Even nonprincipal characters; conjugated χ(r); raw standard Gauss sum. |
| congruence_eigenvalue_bound | Congruence Γ≤SL₂(ℤ); u : ℂ→ℂ; C² on Im>0; Γ-invariant, bounded, nonconstant on ℍ; λ : ℝ; positive eigen-equation on ℍ | The classical headline, with every analytic/group hypothesis explicit. |

The three admitted theorems remain deep all-input statements, not definition restatements or single-library-lemma consequences. The new curve targets cannot be stated at the pins: the rational-adic lisse/direct-image/conductor carriers are missing. Their absence is stated in the module docstring; no replacement predicates or data were introduced.

## Source, supplier and ownership audit

Read the roadmap in full and used the shapes of main's FuchsianOrbifolds, DifferentialGeometry and PDE roadmaps. Main is b41e47bc; the checked library revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest. The source extracts stayed outside the repository.

| Source | Locators personally inspected | Consequence |
|---|---|---|
| gj78 | line 528, line 538, line 721, line 2151, line 2384 | Adjoint parameter, self-twist induction, cuspidality branch; imported from the existing lift owner. |
| teschl | line 2914, line 2960, line 5043–5053 | Closed forms/Friedrichs and min–max at the corrected §4.4. |
| katz-gkm | line 1352, line 1845, line 1871, line 1892–1912, line 2266, line 2353–2430, line 2460–2508, line 2805–2830 | Product fibres, all-characteristic ranks, geometric trace sign, general convolution; explicitly exposes the two missing conductor inputs. |
| bms02 | line 151–156, line 190–196, line 245–253 | Scalar maximal domain and complete-metric essential self-adjointness; the scalar regularity hypothesis is available. |
| laumon-swan | line 395–437 | Finite-flat boundary conductor criterion, proper direct-image consequence and replacement by Swan sum when the boundary cardinality is locally constant. |
| lrs95 | Published locators only; settled uncertified entry | No claim to have read or certified its displays. Mathematical formulas independently checked below. |

Laumon's work was fetched legally through the source service from Numdam under its single new key laumon-swan. A metadata search initially met a rate limit; the direct Numdam request succeeded. There is no outstanding missing-reference request. Laumon states the torsion criterion; Katz's coefficient reduction at line 2469–2477 supplies the rational-adic passage used in the new target. The general target retains the finite-flat boundary and the full conductor function. A finite étale boundary permits étale-local disjoint sections and fixes its cardinality, giving the requested Swan-sum corollary. Empty boundary is allowed; colliding points test why the full conductor function is necessary.

Resolved the exact named sections in all supplier contracts: FuchsianOrbifolds Layers 0–3 and 6.1; DifferentialGeometry Layer 12; PDE Lane A.1 and Lane E.20; SelfAdjointSpectralTheory SA-C and SA-E01–SA-E13; UnboundedOperators UO-A01–A03 and UO-D06; AutomorphicSpectralTheory §§0.6–0.7, 1.16–1.16a, 4.3–4.4, 4.6, 4.8, 4.14a and the scope boundary §7.1a; AutomorphicFormsOnReductiveGroups §§2.5–2.7, 3.1, 3.4–3.5 and 4.5; ArithmeticLocallySymmetricSpaces ALS.F.6; GlobalNumberFields Layers 6, 9–10; GL2AutomorphicRepresentationsAndTransfer R17.4.13; AutomorphicLFunctionsAndLocalFactors AL.1–AL.3's named targets; LFunctions Layer 0; ZerosOfLFunctions Layers 1 and 3; DeligneWeightsAndPurity §7.12 and DWP.10; EtaleCohomologyFoundations F.0–F.6 and F.10.1–F.10.2b; ArithmeticDirichletSeries Layer 6; AnalyticNumberTheoryPartI §3.26; ArithmeticGaloisRepresentations §§3.1, 3.7; InverseGaloisAndArithmeticFundamentalGroups' Euler-characteristic target. Existing gaps remain gaps, not assertions that their suppliers already deliver the missing contracts.

Object searches used roadmaps grep/show over main and indexed open heads, the board packages, and the 47 supplied sibling checkouts. No supplied sibling owns the prime-twist moment, rational-adic Swan-constancy criterion or raw hyper-Kloosterman construction. The conductor search does locate the rational curve formula at the later EtaleDualityAndPerverseSheaves §5.2. In accordance with supply direction, that necessary prerequisite moves to this package's §4.2b; the finite-coefficient theorem stays with InverseGaloisAndArithmeticFundamentalGroups, and the conductor API stays with ArithmeticGaloisRepresentations. No later roadmap is cited as a supplier. The Swan-constancy criterion has no earlier owner in these searches, so it is a target here. No new Lean declaration or conflicting fully qualified name was added.

Pinned checks included the native congruence Prop and finite-index implication (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163`, `:181`); fundamental-domain pushforward equality (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630`, with countability, measure invariance and measurable constant actions); Mellin inversion (`Mathlib/Analysis/MellinInversion.lean:92`, with completeness, convergence, vertical integrability and continuity); gamma zero/residue conventions (`Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:75`, `:104`); character orthogonality (`Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean:68`); complex partial adjoint pairing (`TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:76`, `:82`); real local energies (`TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean:372`, `:600`); full Wiener–Ikehara (`TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`); prime counting (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:46`). Native Lp/LinearPMap data alone do not choose a quotient measure or assert self-adjointness. The searched Swan group-algebra theorem is not a local ramification conductor. No native curve-sheaf or hyper-Kloosterman bound was found that would make the new targets or retained headlines duplicate library results.

## Adversarial mathematics pass

The following are computations on definitions or test models, not substitutes for proofs of the headline theorems. Write A for positive quotient area. For operator API tests take D=diag(0,21/100,1/4) on ℂ³, constants in the first coordinate, e the unit second coordinate. For kernel tests take a smooth multiplicatively normalized cutoff supported in [3,4]; at an interior point with φ(1/x)=b>0 write T=F₁(φ∘inv,x). Every changed mathematical statement and its consumers are included, together with the retained targets, API facts and conventions.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Effective quotient convention | Γ(1), Γ(2), Γ(3) | Effective indices 1,6,12 give π/3,2π,4π; central doubling gives 2π/3 at level one | Consistent | Corrected supplier locator |
| §0.1 level-one normalization | g=0,c=1, elliptic orders 2,3 | 2π(−2+1+1/2+2/3)=π/3 | Consistent | Added signature computation |
| §0.1 pushforward measure | Effective domain F and translate γF at level one | Both integrals are π/3; two disjoint domain copies have 2π/3 and fail the domain hypothesis | Both domain choices agree | Retain |
| §0.1 positive finite area | Γ(1), Γ(2), zero measure | 0<π/3<∞, 0<2π<∞; zero fails 0<A | Discriminates zero measure | Retain |
| §0.1 proof independence | Two congruence proofs | Both arguments are definitionally equal proofs of one Prop | Reflexivity | Delete API promise |
| Differential sign | 1,y²,yˢ; s=1/2,3/2 | −y²Δ1=0; −y²Δy²=−2y²; s(1−s)=1/4,−3/4 | Sign fixed | Retain |
| Complex energy convention | e,ie,2ie | q[e]=q[ie]=21/100; q[2ie]=84/100=21/25 | Whole complex form | Retain |
| §0.2 closed energy includes constants | Cusp width w, cutoff height R and 2R | Missing squared norm ≤w/R,w/(2R); energies (w/R)I,(w/(2R))I→0, where I=∫₁²|χ′|² | Constants lie in closure | Retain |
| §0.2 self-adjoint partial operator | D and ie | D*=D; ⟨ie,D(ie)⟩=21/100=⟨e,De⟩ | Pairing real | Retain |
| §0.2 domain density | Finite-dimensional model | Dom D=ℂ³; closure Dom D=ℂ³ | Dense | Retain |
| §0.2 nonnegative pairing | e under D and −D | 21/100≥0; −21/100<0 | Excludes negative sign | Retain |
| §0.2 kernel equivalence | Constant coordinate, e, third coordinate | D(1,0,0)=0; De=(21/100)e; D(0,0,1)=(0,0,1/4) | Both directions | Retain |
| §0.2 nonzero operator | Nonconstant compact bump in a free chart | ∫|∇b|²>0 whereas the zero operator gives 0 | Distinguishes zero operator | Retain |
| §0.2 maximal domain | L² constant; continuous eigenfunction λu | Distributional expressions 0 and λu are L²; actions equal 0 and λu | Actual domain identified | Retain |
| §0.2 complete cover | N=1,2,3 | N′=3,6,9; −I not in Γ(N′); deck averaging has P²=P, also with central kernel | Torsion-free complete cover | Retain |
| §0.2 Γ₀(N) agreement | N=1,2; constant and compact bump | Areas π/3,π on both realizations; domains have the same distributional test; Δ1=0 and bump energy ∫|∇b|² on both sides | Same form yields same operator | Explicit API comparison |
| §0.3 complex mean definition | 1,i, mean-subtracted bump b−A⁻¹∫b | Integrals A,iA,0 respectively | Excludes whole space and real-mean kernel | Retain |
| §0.3 integral norm bound | u=1 and u=i | LHS A; RHS √A·√A=A in both cases | Normalization fixed | Retain |
| §0.3 closed kernel/perpendicular equivalence | Constant coordinate and e in model | Mean/⟨1,u⟩ are 1,0; kernel is {(0,z,w)} | Both directions | Retain |
| §0.3 domain and spectral reduction | u=(0,z,w) | Du=(0,.21z,.25w); every diagonal spectral projection has first coordinate 0 | Invariant complement | Retain |
| §0.3 integral of Δu | u=(a,z,w) in model | First coordinate of Du=0, hence mean(Du)=0 | API holds | Retain |
| §0.4 nonempty Rayleigh set | e, third coordinate | Rayleigh values .21,.25; both denominators 1 | Nonempty | Retain |
| §0.4 nonnegative infimum | u=(0,z,w)≠0 | (.21|z|²+.25|w|²)/(|z|²+|w|²)≥.21≥0 | Lower bounded | Retain |
| §0.4 operator/form/spectral infima | D on constants-perpendicular | All three infima .21 | Same infimum | Retain supplier core gap |
| §0.4 member comparison | e, third coordinate | .21≤.21 and .21≤.25 | Quotient upper bound | Retain |
| §0.4 denominator normalization | e,2ie | .21/1=.84/4=.21; wrong first-power denominator .84/2=.42 | Discriminates wrong quotient | Replaces forward Check |
| §0.5 clipped definition | S=∅,{.21},{1/3} | inf({.25}∪S)=.25,.21,.25 | Empty and above-threshold cases | Retain |
| §0.5 upper member comparison | S={1/3}, member 1/3 | .25≤1/3 | Correct direction | Retain lower-boundedness hypothesis |
| §0.5 lower comparison | S={.21},c=.20; S=∅,c=.26 | .20≤min(.25,.21)=.21; .26≤.25 is false | Threshold guard needed | Retain |
| §0.5 conditional infimum guard | S=−ℕ | No finite lower bound: for every c, some −n<c | Comparison hypotheses fail | No junk infimum assertion |
| §0.6 principal-level components | N=1,2,5 | #(ℤ/N)ˣ=1,1,4; principal-level stabilizer is Γ(N), not Γ₀(N) | Contract generality retained | No gap closed by assertion |
| §0.6 constant projection | Γ(1),Γ(2) | (3/π)(π/3)=1; (1/(2π))(2π)=1 | Areas compatible | Retain |
| §0.6 channels and residual exclusion | Γ(1),Γ(2); t=0,1; residual .20 | Cusp counts 1,3; continuous values .25,1.25; .20 is neither 0 nor ≥.25 | Needs constants-only residual contract | Retain gap |
| §0.6 finite nonabelian invariants | S₃ regular representation; order-two subgroup; full group | Dimensions 6→3→1; averaging twice equals averaging once | Intermediate subgroup descent | Retain |
| §0.7 clipping equality | Small spectrum {.21}, empty, {.25} as unrestricted eigenvalue set | Bottom .21,.25,.25; .25 not in the open small set | Empty case covered | Retain |
| §0.7 upper bound | Continuous multiplication model on [.25,∞) | Unit functions supported in [.25,.25+ε] have Rayleigh quotient in [.25,.25+ε]; inf=.25 | Gives ≤1/4 | Moved from §0.4 |
| §1.1 exceptional parameter | r=.20 with common parity 0 or 1 | 1/4−(.20)²=.21 for both; r=0,.50 give .25,0 | Strict endpoints excluded | Retain |
| §1.1 level passage | Γ=Γ(3); invariant eigenspace with λ=.21 | Group stays Γ(3); D(Pu)=P(Du)=.21Pu | Parameter unchanged for Pu≠0 | Retain principal-level gap |
| §1.2 monomial temperance | Real unitary characters with exponents it₁,it₂ | Real exponent pair (0,0), whereas complementary pair (.20,−.20) differs | Excludes exceptional self-twist | Retain |
| §1.2 imaginary quadratic case | Unitary character of Wℂ induced to Wℝ | Both inducing values and the finite-index unitary induction have norm 1 | Tempered even with nonzero gamma shifts | Retain |
| §1.2 central norm shift | σ=0,1 | Absolute central exponents 2σ=0,2 | Unitarity forces zero real shift | Retain |
| §1.3 adjoint parameters | r=.20 and either common sign | Character ratios have exponents .40,0,−.40; sgn/sgn=1 | O(3)-spherical specialization | Retain |
| §1.3 central-character removal | Common twist θ | Sym² multiplier θ² times determinant inverse θ⁻² equals 1 | Twist invariance | Retain |
| §2.1 degree/conductor | m=2,3 | d=4,9; conductor fq⁴,fq⁹; twisted local factor at q=1 | No rank-m exponent error | Retain |
| §2.1 full local coefficients | Ramified rank-one χp paired with χp⁻¹ | Lp=(1−p⁻ˢ)⁻¹, coefficient at p=1; deleting p gives 0 | Ramified primes retained | Retain positivity gap |
| §2.1 unramified-character transport | p≠q, exponent a=1,2 | Local coefficients b(p)χ(p), b(p²)χ(p)² | All-prime transport required | Retain transport gap |
| §2.1 normalized epsilon | f>0, odd prime q, degree d | f^(1/2)q^(d/2)(fq^d)^(−1/2)=1; taking |τπ|=1 gives f^(−1/2) | Unit normalization fixed | Retain |
| §2.1 denominators | f=1,q=3,m=2; f=0 | fq^d=81>0; f=0 is outside positive conductor data | No zero denominator | Retain |
| §2.1 parity hypothesis | Even/odd χ at −1 | Values +1/−1; only +1 leaves real gamma factor unchanged | Odd case excluded | Retain |
| §2.1 norm self-twist exclusion | πq unramified, χq primitive ramified | Original inertia trivial; twisted inertia nontrivial, so local components unequal | Entire twist applies | Retain |
| §2.1 pole-subtracted boundary | μ=±.20; s with Re s≥1 | Shifts .40,0,0,−.40; gamma arguments have real parts ≥.60>0; no gamma boundary pole | Boundary follows from AL.3 | Narrowed gap, added route |
| §2.1 unique boundary pole | Self norm twist t | Central twist exponent imt=0 forces t=0; c/(s−1) subtraction leaves finite analytic value | No extra continuity input | Narrowed gap |
| §2.1 positive partial-sum asymptotic | Rank-one ζ model b(n)=1 | b(1)=1, residue 1; x⁻¹⌊x⌋→1 | Inclusive cutoff agrees | Retain positive-residue gap for general π |
| §2.2 rightmost pole | μ=±1/5 | Pair shifts 2/5,0,0,−2/5; β₀=2/5; completed order ≥0 and gamma order ≤−1 force finite L order ≥1 | Forced zero | Retain |
| §2.2 totalized pole convention | s=0 and punctured s→0 | Γℝ(0)=0 but lim sΓℝ(s)=2 | Point value cannot replace order | Retain |
| §2.2 β₀=0 | Tempered real exponents 0 | β₀=0; hypothesis β₀>0 is false | No contradiction asserted | Retain |
| §3.1 tail definition and support | Normalized support [3,4], x=1/2,5 | Integral tails 1,0 | Nonzero normalization and support | Retain |
| §3.1 Mellin inversion | Re s=2; normalized tail | ∫₀ʸx^(s−1)dx=y^s/s, giving mellin(F₁,s)=mellin(φ,s)/s | Exactly 1/s | Retain |
| §3.1 multiplicative scaling | φc(y)=φ(y/c),c=2 | Substitution dy/y=dt/t; F₁(φc,x)=F₁(φ,x/2); ordinary dy would multiply by 2 | Correct measure | Retain |
| §3.1 normalization counterexample | Indicator of [1,2] | Ordinary integral 1; multiplicative integral log 2≠1 | Discriminates source-independent convention | Remove unread-display attribution |
| §3.2 definition | G=1, reflected support | Support changes [3,4]→[1/4,1/3] | Mellin argument −s | Retain |
| §3.2 zero-ratio API | G=0 | Integrand 0 and inverse transform 0 | True but nondiscriminating | Delete Check only |
| §3.2 β−s orientation | G(w)=w, φ(1/x)=b>0 | F₂=βT−b; wrong β+s gives βT+b; difference 2b≠0 | Sign fixed | Retain |
| §3.2 unit-ratio comparison | x=1/5 and x=2 | F₂=F₁(reflected)=1,0; omission of 1/s gives φ(5)=0 in the first test; unreflected tail at 2 is 1 | Both normalization and reflection | Retain |
| §3.3 large-x estimates | F₁ beyond support; G=1 and reflected F₁ | F₁(5)=0; F₂(2)=0; both ≤C_B x^(−B) | Support models agree | Retain |
| §3.3 near-zero powers | σ=1/2,β₀=2/5,ε′=1/10 | Dual powers x^(−1/2),x^(−1/2), integrals 2,2 | Both locally integrable | Retain |
| §3.3 pole collisions | σ+β₀=1; d=4 | Gamma order ≤4 plus 1/s gives ≤5; logarithm degree ≤4; x^ε|log x|⁴→0 | ε absorbs collision | Retain |
| §3.3 gamma-ratio growth | A and A(1−s), degree d | Exponential magnitudes exp(−πd|t|/4) cancel to ratio 1 | Polynomial strip input required | Retain ZerosOfLFunctions contract |
| §3.4 contour residue | s=0 with k(0)=1 | Residue k(0)Lχ(β)=Lχ(β), not log 2 times it | Normalization propagates | Retain |
| §3.4 dual argument and powers | Substitute s↦−s | Y^(−s)(fq^d)^s n^(−s)=(nY/(fq^d))^(−s); coefficient n^(β−1) | Dual scaling correct | Retain |
| §3.4 strip justification | β in 0<Re β<1, contour Re s=2 to −1 | Re(β+s) ranges in (−1,3); choose δ=2 to cover it with [−δ,1+δ] | Finite-function bound suffices | Retain bridge gap and explicit owner |
| §4.1 finite average definition | Q=0,1,2,3; family L=1,fπ=1 | Counts 0,0,0,1; q=3 has no selected character, q=5 has one | Finite index set fixed | Retain |
| §4.1 conductor and equality APIs | Q=3,fπ=5 or 0; families identical on selected values | Counts 0,0; termwise equal selected values yield same finite sum | Exclusion before summation | Retain |
| §4.2 even orthogonality | q=5,a=0,±1,±2; q=3 | Sums 0,1,−1; q=3 sums 0; branch (q−1)/2−1=1 or 0 | All branches | Retain |
| §4.2 principal subtraction | q=5,n=1 | 2−1=1; omitting subtraction at ±1 gives 2 | Exact coefficient | Keep own convention |
| §4.2a raw definition | k=0,F₃,r=1,2; k=1 | Empty tuple values 1,0; one-tuple sum ψ(r) | Rank-zero totality | Retain |
| §4.2a finite-field transports | F₂ identity; F₃ scaling a=−1,k=1,r=1 | Identity leaves −1; ψ(−1)=ψ(a·r) | Isomorphism/scaling laws | Retain |
| §4.2a coordinate scaling | F₃,a=−1,k=2 | a²r=r; raw values at r=1,2 remain −1,2 | Argument a^k r | Retain |
| §4.2a trivial character | F₅,k=3 | Tuple count 4²=16; nontrivial bound 3·5=15 | Nontriviality necessary | Retain |
| §4.2a small characteristic | F₂,k=1,2,3 | All unit coordinates 1; raw (−1)^k=−1,1,−1 | No prime exclusion | Retain |
| §4.2a raw/sheaf distinction | F₃,k=2,r=1,−1 | Raw −1,2; rank-two traces 1,−2 | Trace sign fixed | Retain |
| §4.2b curve Euler–Poincaré | Constant rank r on Gₘ,P¹; r=0,1,2 | χ_c=0,2r; at r=0 both 0; at r=1,2 proper values 2,4 | Proper/empty-boundary cases | New general target |
| §4.2b Euler characteristic vs concentration | Constant vs nontrivial Kummer on Gₘ | Constant H_c dimensions (0,1,1); Kummer (0,0,0); both alternating sums 0 | χ alone is insufficient | New Check |
| §4.2b wild Euler correction | Lψ(x),Lψ(x²),p odd in second case | Sw∞=1,2; χ_c=1−1=0,1−2=−1 | Tame-only formula fails | New Check |
| §4.2b coefficient extension | Rank-one break a=1,2 over Eλ⊂E′λ | Ranks and Swan integers 1,2 preserved; χ_c stays 0,−1 | Rational extension compatibility | New target clause |
| §4.2b constant-family criterion | P¹×S, one boundary section; also D=∅ | Sw sum 0; conductor function 1,0; affine fibre H_c ranks (0,0,1); proper fibre (1,0,1) | Locally constant direct images | New general target |
| §4.2b failure without Swan constancy | Lψ(tx),t≠0 and t=0 | Sw sums 1,0; conductor functions 2,1; H_c² dimensions 0,1; Euler characteristics 0,1 | Nonlisse jump | New negative control |
| §4.2b multiplication-family criterion | Kl_k(x)⊗Lψ(t/x),k=1,2,t≠0 | Sw0+Sw∞=2,3; rank terms 2,4; full conductor functions 4,7, constant in t | Lissity criterion applies | New route input |
| §4.2b finite-flat boundary guard | D:x²=t in odd characteristic, L constant | Geometric point counts 2,1; Swan sum 0,0; conductor functions 2,1; dim H_c¹=1,0 | Swan constancy alone fails with collisions | New boundary Check |
| §4.2b rank-one Artin–Schreier conductor | p=2,3; nonzero phase a/t; trivial character | Break/Swan 1/1 for nontrivial character; 0/0 for trivial | All characteristics included | Explicit supplier calculation |
| §4.2b general convolution concentration | Tame-at-zero, totally-wild-at-infinity ranks 1,1 and 2,1 | Fibre H_c⁰=H_c²=0; χ_c=−2,−3; dim H_c¹=2,3 | Only degree one remains | Explicit general target |
| §4.2b general convolution rank | Kl₂ and Kl₃ | 2·Sw∞(Kl₃)+3·Sw∞(Kl₂)=2+3=5; rank product 2·3=6 | Rank formula tested beyond rank-one input | New Check |
| §4.2b Swan product | Kl₁*Kl₁; Kl₂*Kl₁; Kl₂*Kl₂ | H_c¹(F),H_c¹(G) each dimension 1, tensor dimension 1; new Swan 1·1=1 in all cases | Curve formula plus Künneth | Explicit route |
| §4.2b convolution comparison and duality | F*G rank 2 | Compact/ordinary comparison has ranks 2=2; perfect dual pairing has dimension 2 against dimension 2, Tate factor Eλ(−1) | Domains/categories fixed by construction | Retain/generalize route |
| §4.2b excluded tame input | Constant rank one on Gₘ | Sw∞=0 and H_c² dimension 1 | Totally-wild hypothesis fails | New negative control |
| §4.2b purity/trace | k=1,2; F₃ | Weights 0,1; absolute eigenvalue sizes 1,√3; trace prefactors +1,−1 | Weight and sign agree | Retain |
| §4.2b base extension | F₂→F₄ trace character, k=1,2 | Raw over F₄: (1,−1,−1),(3,−1,−1); ranks remain 1,2; bounds 1,4 | Extension family fixed | Retain |
| hyperKloosterman_bound | F₄,k=1,2,3 | Norm vectors (1,1,1),(3,1,1),(5,3,3) bounded by 1,4,12 | Includes ranks divisible by p | Retain headline |
| hyperKloosterman_bound guards | F₂,k=0,r=1; trivial ψ over F₅,k=3 | 1>0; 16>15 | Both hypotheses necessary | Retain |
| §4.3 exact Gauss identity | q=3,k=1,2,r=1 | k=1: 0=−1−(−1); k=2: 0=(−1+2)−1 | Principal correction sign | Retain |
| gauss_power_even_average_bound | q=5,k=2,r=1,2 | Average 5,−5; norms 5≤8√5+1 | Conjugation/parity compatible | Retain headline |
| §4.3 excluded rank zero | q=7,k=0,r=1 | Two even nonprincipal characters give 2; identity 3(1+0)−1=2; bound would be 1<2 | Positive rank needed | Retain |
| Fourier convention | q=3 and principal χ at any prime | exp(2πi/3)=−1/2+i√3/2; τ(1)=−1 | Positive exponential fixed independently of parity | Retain |
| §4.4 smoothing exponents | d=4,9 | Y exponents 5/2,5; Y/Q exponents 3/2,4>0; Y/Q^d exponents −3/2,−4<0 | Compatible scales | Retain |
| §4.4 primal/dual errors | Y=Q^((d+1)/2) | Both exponents become 1+(d+1)(1−σ)/2; for d=4,σ=.9: 5/4 | Balanced powers | Retain |
| §4.4 strict boundary | d=9,σ=.8,.9 | Error exponents 2,3/2 | Equality cannot yield nonvanishing | Retain |
| §4.4 prime main coefficient | Weighted dyadic integral | (1/2)·((2Q)²−Q²)/(2 log Q)=(3/4)Q²/log Q | Coefficient 3/4 | Retain |
| §4.4 divisor count and unit arguments | n=1,2; q divides n | n−1=0 at n=1, so separate main term; n=2 gives τ(1)+τ(3)=1+2=3; χ(n)=0 if q divides n | No τ(0) or inverse of nonunit | Retain |
| §4.5 dyadic nonvanishing | m=2,3 | Left boundaries 3/5,4/5; above them exponent <2, at equality exponent 2 | Strict region fixed | Retain |
| §4.5 nonzero finite sum | Values 1+i,−1 | Sum i≠0; at least one nonzero without positivity | Extraction valid | Retain |
| §5.1 parameter inequality | m=2,3 | 1/2−1/5=3/10; 1/2−1/10=2/5 | Weak conclusion, equality allowed | Retain |
| §5.1 contradiction input | β₀=.9,m=3; boundary β₀=.8 | .9>.8 yields both forced value 0 and an extracted nonzero twist; equality .8 is outside region | No circular parameter assumption | Retain |
| §5.2 exceptional arithmetic | r=0,.2,.3,−1 | λ=.25,.21,.16,−.75; .3 violates 2r≤.4; −1 violates r≥0 | Guards necessary | Retain |
| §5.3 adjoint chain | r=.2; direct GL₂ comparison | GL₃ permits 2r=.4→λ=.21; direct GL₂ .3 gives only .16 | Correct rank supplies improvement | Retain |
| §5.3 clipped empty spectrum | SΓ=∅ | λ′₁=.25≥.21 | No nonexistent eigenfunction chosen | Retain |
| congruence_eigenvalue_bound nonconstancy | u=1 | Positive equation λ=0, which is <.21 | Excluded by nonconstancy | Retain headline |
| congruence_eigenvalue_bound boundedness | E(z,3/2) | λ=−3/4 and cusp growth y^(3/2) | Excluded by boundedness | Retain headline |
| congruence_eigenvalue_bound group guard | Γ={1}, u(z)=exp(iz) | Norm e^(−y)≤1, Euclidean Δu=0, λ=0 | Noncongruence group excluded | Retain headline |
| §5.3 eigenfunction-to-L² route | Bounded u and constant projection | ‖u‖²≤C²A<∞; λ∫u=0; for λ≠0, ∫u=0 | Maximal domain and mean zero follow | Retain |
| §5.3 numerical chain | Rational comparison | 3/16=75/400<84/400=21/100<100/400=1/4; difference 9/400 | Exact improvement | Retain |
| §5.4 Rayleigh inequality | u=0,e,2ie,constant 1 | 0=0; .21=.21; .84=.84; constant gives 0<.21A | Mean-zero and zero vector handled | Retain |
| §5.4 form-core passage | Approximate e by (1−1/n)e | Energies .21(1−1/n)²→.21; squared norms (1−1/n)²→1 | Same inequality passes to limit | Retain core supplier gap |
| §5.5 metric scaling | κ=1,4 | Volumes A,A/4; operators D,4D; thresholds 1/4,1; gap values .21,.84 | All factors consistent | Retain |
| §5.5 energy invariance | Same unit-norm e under g,g/4 | Energy .21 both times; norm² 1,1/4; quotient .21,.84 | Distinguishes measure-only scaling | Retain |
| §5.5 excluded scaling | κ=0,−1 | κ⁻¹g is undefined as positive metric at 0, negative at −1 | κ>0 protects denominator/metric | Retain |
| Consumer arithmetic | Level-one area and gap | (21/100)(π/3)/(8π)=7/800 | Numerical export only | Retain |

No row asserts existence of a quotient eigenvalue exactly 21/100. Diagonal operators, pure parameter lists and constant L-families above are tests of formulas and definitions, not invented automorphic objects. Field instances exclude the zero ring; unit arguments exclude zero; positive rank excludes the empty-product bound; the analytic conductor is positive although the finite-average definition also handles its junk value zero. Both directions of the kernel, mean-zero and clipping identifications were tested. The nonabelian deck-group test distinguishes full spaces, subgroup invariants and full invariants.

## Maintainer consequences

The later EtaleDualityAndPerverseSheaves §5.2 should consume the general rational curve Euler–Poincaré target now owned in §4.2b here, preserving its additional tower-conductor estimates as its own work. Its declaration `curveEulerPoincareSwan` was not copied into this acceptance file. That downstream citation update is outside the permitted edits.

AutomorphicSpectralTheory §7.1a's finite-place proof route still needs a human ownership decision if it is to use a shared twist-moment engine; changing this part cannot specify that earlier roadmap's construction. The clarified scope does not settle that external question or create a reverse dependency.

The seven supplier-gap slugs remain unchanged. The all-prime positivity gap is narrower; the finite-strip bridge now names its data-record owner. All four acceptance-test declaration names and types are unchanged, so no downstream Lean rename is needed. The historical design sourceIssues lie outside the allowed top-level gaps edit; they were not changed and should not be treated as newly verified claims about the unread LRS text.
