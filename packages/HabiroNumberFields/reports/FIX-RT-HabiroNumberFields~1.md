# HabiroNumberFields repair report

Finding identifiers below are those printed in the two reviews; the paragraph immediately following each heading identifies review a or b. Overlapping supplier, source and acceptance-test repairs are shared, with a separate verdict for every finding.

## F01 (P1) — applied

Review a. Nonlinear membership → the linear full-order equalizer in §§3.7–3.10. Generator-independent extension, its semilinear transitions and coherence precede descent. The nonlinear product is only a consequence. Added the −1-at-order-two family and its failed-addition witness. Updated zero degree, torsor coherence, vanishing and transfer (§§1.15, 3.14, 3.19); removed both directions of the false converse.

## F02 (P1) — not actionable in this package: three earlier owners must supply missing contracts

Review a. Registered gap:bloch-foundations, gap:arithmetic-k-inputs and gap:local-k3-regulator in the README and the plan's top-level gaps. Unavailable contracts are no longer described as supplied. Replaced nonexistent MotivicEtaleKTheory ownership by KTheoryFiniteLocalFields' actual Chern/étale sections and the global arithmetic gap. ColemanIntegration supplies the analytic dilogarithm. Completing the three owners' contracts requires edits outside this package.

## F03 (P1) — applied

Review a. Bidirectional K3BlochGroups citation → foundational supplier only. Scope, exact contracts and downstream prose place the finite-coefficient étale Bloch and regulator comparisons in the existing §§1.6 and 1.13 of this roadmap. No new comparison target or reverse consumer edge remains. The Bloch supplier gap explicitly requires independence from these comparisons.

## F04 (P2) — applied differently

Review a. The finite-endomorphism criterion is true; it remains the fully stated README target in §0.5, including finiteness and n=0. It is an auxiliary theorem on arbitrary finite groups, not a headline naming this roadmap's objects. Adding its signature would violate the acceptance-test rule. Removed the empty Layer 0 header instead. The Fitting argument and computed controls appear below.

## F05 (P3) — applied

Review a. Anonymous formula descriptions → explicit README references to cyclicDilog_quasiPeriodicity and cyclicDilog_one_pow_twentyFour in §1.1, with the same field, positivity, primitivity and invertibility hypotheses as their Lean signatures.

## F06 (P3) — applied

Review a. Deleted the terminal catalogue. Replaced the module introduction with the required target-signature docstring identifying the actual headlines and the unavailable carriers for heavy headlines. Removed empty sections and orphan elementary examples/definitions; kept only two real definitions needed by four headline theorems.

## F07 (P3) — applied differently

Review a. Absent manifest → eight work entries covering nine cited texts. Both CGZ versions were fetched and distinguished under their single lifetime key, rather than assigning two keys to one paper. Entries include bibliography, locators, cited sections and legal provenance. BG was read from the source-service cache after fresh network attempts timed out; its cached PDF hash was verified.

## F08 (P3) — applied differently

Review a. No Lean mirrors were added: elementary boundary evaluations belong in README Checks. Recomputed D at orders zero/one and zero input, hypergeometric orders zero/one and the diagonal, and all four rational first jets. Added the singular diagonal negative control in §1.2. Removed six elementary Lean examples and the unused half-shift definition instead of expanding acceptance padding.

## F09 (P1) — applied

Review a. Residue +pLi₂^(p) → −pLi₂^(p) in §3.3. GSWZ lines 806–814 and the t coefficient −p/x decide against the sign printed at GSWZ line 858. Added the order-three p=5 witness. Section 3.4 now tracks the negative unregularized pole and positive regularizing contribution, including m⁻²; the first-jet sign in §3.5 is unchanged.

## F10 (P3) — applied differently

Review a. Added separate README Checks for restriction at γ=1, γ=2, order-three coordinate conversion and inverse, and weighted bounds N=0,1,2. Retained N=4's strict boundary. These completions/coordinate objects are not definitions in the acceptance test, so no Lean mirrors or new stand-ins were introduced.

## F11 (P3) — applied

Review a. Wrong §1.6 attribution → CGZ v3 Theorem 1.7, Definition 6.1 and (35)–(38), with CGZ lines 218 and 1439–1519. Kept the stronger coprimality required for the cohomological comparison separate from the exact sequence's root-free hypothesis. Theorem 2.11 is identified as regulator factorization instead.

## F12 (P2) — applied

Review a. Unjustified calibration across fields → finiteRegulator_compare_eta in §1.13, constructed through the compatible local scalar, both reduction squares, higher-order comparison and exact-valuation detection. Section 1.14's scalar reading assumes this equality and exact order of [ζ]. Added discriminant-five, vanishing-group and larger-valuation controls. The normalization diagram and numerical Nahm evaluation remain independent premises.

## F01 (P2) — applied differently

Review b. kms_odd → kms at every positive invertible order, in Lean and §§Scope, 1.3. Verified even orders directly and by exhaustive field arithmetic. Added an exact order-two quadratic-number witness. The proposed extra Lean boundary example was kept as a README Check, in accordance with the acceptance-test rule. The separate odd phase formula in §1.1 is unchanged.

## F02 (P2) — applied differently

Review b. Removed root-of-unity asymptotics from the q-series supplier; §1.3 owns the necessary uniform leading term. The proposed positive half power is false for the unshifted product: at n=1,x=−1 its normalized limit is 1/√2. The target therefore uses exponent −n/2, with its branch and Checks. GZ line 868 contains the same misprint; its product expansion decides the sign.

## F03 (P3) — applied differently

Review b. Replaced all obsolete stage labels by verified supplier sections: StableHomotopyKTheory §7, GeneralAlgebraicKTheory §§2–3,7, KTheoryFiniteLocalFields §§1.8,2.1,3.0a,6.5a–6.6,7, HabiroCyclotomicCompletions §§1,3–5, PolylogarithmFunctions §§1,3 and QSeriesPartitionsAndMockModularForms §§1,2,5. Unavailable owners receive descriptive gap contracts, not invented section numbers. Updated Scope, contracts and every affected Needs clause.

## F04 (P3) — applied

Review b. Removed temporal “current”/“pinned” qualifiers from README library claims. Kept the mathematical restrictions and exact module locators, and qualified the inner-conjugation theorem by its full Tau Ceti namespace. The native Kummer and unramified Frobenius declarations were inspected at the actual pins, not inferred from the review.

## F05 (P3) — applied differently

Review b. Confirmed that CharZero was dropped from the original halfShiftLinearCoeff signature. The orphan definition was removed because no kept headline used it. README §3.5 defines H over every field, distinguishes total zero values from asymptotic poles, and requires 24,r,1−z nonzero in applications. Updated the first-jet formula and all evaluations; no deleted Lean name remains in the README.

## Gate failures and required checks

- **Missing sources.toml:** added the complete manifest, with one key per work. The source-service manifest check reports `packages/HabiroNumberFields/sources.toml: 0 problem(s)`; exit 0.
- **Five missing README identifiers:** coefficient-map, summand-period and half-shift scaling/map requirements are mathematical prose rather than claims of Lean exports. Removed the orphan half-shift declaration and terminal catalogue, and changed the remaining own API identifiers to prose notation where needed. Final `readme-ids-missing=0`.
- **Two empty Lean sections:** removed Layers 0 and 2 headers; the file has only the populated Layer 1 section. Final `empty-sections=0`.
- **Elaboration:** `lake env lean` on `packages/HabiroNumberFields/Suggested.lean`, from the supplied content checkout, exits 0. Exactly four expected warnings, at lines 43, 50, 62 and 71: each declaration uses sorry. No other diagnostics. There are no TauCeti imports requiring an object build.
- **Elaborated binders:** a scratch copy of the final module with `#check @name` for all six declarations exits 0, with the same four warnings. The two definitions retain CommRing/Field respectively; all four theorem hypotheses agree with §§1.1–1.3. The only dropped original instance was CharZero on the deleted orphan definition. KMS explicitly retains n>0, nonzero n in the field, primitivity, x,y,z≠0, X,Y≠1, X≠Y and the hypersurface equation.
- **Text/package checks:** ran the worker's unmodified `scan_folder` on the package, the source-manifest check and gap-reference check. Every text count is zero, all four required package files exist, and all three gap references match the plan. The generic worktree gate expects the content repository layout and cannot address a board package directly; its text scanner is the same one used by the package lane.
- **Dependency command:** the prescribed depcheck with the supplied order and `--movable` exits 0. Exact output:

```text
depcheck: 14 roadmaps, 103 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurs. No merge-order, tool, library or sibling file was edited. No commit was made.

## Sources, ownership and pin evidence

Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The native Kummer isomorphism is in `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384`; the inner-conjugation theorem is in `TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297`, with smooth discrete coefficients. The unramified local Frobenius is in `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164`, its order at 178, congruence at 197 and uniqueness at 237; its surrounding context is for finite nonarchimedean local fields. These do not supply the global Habiro construction.

Read the main-branch ClassicalArithmeticCompletion, Chebotarev and completed NumberFieldArithmetic roadmaps for shape and existing ownership. Object searches used the roadmap tool across main and indexed open heads, then the thirteen sibling checkouts supplied in the brief. K3BlochGroups, ArithmeticKTheory and PadicHodgeRegulators are absent from that accessible main/head index; their merge-order entries do exist. The review's alternative board heads are not copies available here. MotivicEtaleKTheory is absent and is not an eligible earlier supplier; no dependency on it remains. QSeriesPartitionsAndMockModularForms exists at its supplied head and does not state the required radial asymptotic. Its bilateral convergence/summation and eta multiplier do exist at §§2.3,2.5,5.2.

The universal finite Chern construction is explicitly owned by KTheoryFiniteLocalFields §1.8 before rigidity. Its prime-power coefficient construction, degree-three additivity, mixed unit–Bott sign and coefficient maps are the inputs to the already existing all-order assembly in §0.3 here. Generic motivic/étale carriers remain in that supplier's §§3.0a,6.5a–6.6. The global integral comparisons are recorded in the arithmetic gap; no local theorem is presented as their proof. Coleman's analytic functions and de Jeu complexes remain ColemanIntegration L2.16–L2.18 and L3.Fa.2–L3.Fa.4. The completed integral presentation and its p²-valued regulator remain a distinct PadicHodgeRegulators gap. This preserves ownership without duplicating a foundation.

All eight works were requested through the source service. The BG URLs timed out; the service's existing legal author-copy extraction was available and was read, and the cached bytes have the manifest's SHA-256. No missing text remains. Both CGZ versions are distinguished within one entry; the other seven entries retain their own work keys. No source text was copied into the package. Principal evidence read:

| Claim or input | Exact source locator |
|---|---|
| Integral Bloch convention comparison | CGZ published Lemma 2.2, CGZ published lines 381–410 |
| Étale Bloch exact sequence and cohomology | CGZ v3 Theorem 1.7, Definition 6.1, (35)–(38), CGZ lines 218–224 and 1439–1519 |
| Reduction/Chern square and eta generator | CGZ v3 Lemmas 4.4,5.1,5.3, CGZ lines 1128–1147,1194–1226,1236–1240 |
| Finite Chern product sign and Bott/eta | H2024 lines 187–195,271–295,353–357 |
| Configuration resolution | H2013 lines 1506–1513, §§6.2–6.4 |
| KMS parity and product asymptotic | GZ lines 852–868; expansion proof GZ lines 331–378 |
| Pochhammer residue | GSWZ lines 806–816; inconsistent printed sign at GSWZ line 858 |
| Arithmetic gluing and local extension | GSWZ Definition 1.1, (13), Corollary 3.7 and (195)–(204) |
| Local root chart | W-thesis Lemma 2.12, pp.31–32; Q Lemma 2.12, p.18 |
| Gaussian-field tame kernel | BG line 1268, §7.1, p.24 |

For the newly required asymptotic, grouping the defining logarithmic product into n residue classes gives
`log(x;q)_∞ = −Li₂(x^n)/(nε) + ½Log(1−x^n) − log D_ζ(x)/n + o(1)`.
Multiplication by −n gives the negative half power in the repaired target. This derivation and the n=1 witness distinguish the correction from simply repeating GZ (57) or the proposed repair.

## Adversarial mathematics record

The following rows record actual values or symbolic component calculations, not proofs of the unfinished library theorems. “Retained” means that these instances do not refute the statement under its written hypotheses. Supplier-dependent global theorems remain mathematical obligations, with the gaps above; local rank calculations do not certify descent.

| Statement | Instances and values on the two sides | Result / change |
|---|---|---|
| Coefficient completion convention | R=ℤ[1/6],p=3: R/3ᵃR=0 for a≥1, hence completion 0; tensor with ℤ₃ is ℚ₃ | Retained distinction |
| Full cyclotomic algebra | K=ℚ(i),m=4: dimension over K is 2; one compositum has dimension 1 | Retained full algebra |
| Kummer sign | σ acts on an n-th root a as ζa: σa/a=ζ; the inverse convention yields ζ⁻¹ | Retained positive convention |
| Tate untwisting | r=1: exponent k⁰=1; r=2,k=−1: exponent −1 | Retained inverse weight |
| §0.1 integral character lifting | n=9: twisted regular augmentation on eigenvectors has image 6ℤ/9={0,3,6}, omitting 1 | Rejects unconditional exactness |
| §0.1 trivial group | G={1}: every equation is u=u; weight locus is the whole quotient | Retained boundary |
| §0.2 excluded integers | ℚ: (M,M′)=(12,4); ℚ(i): (24,8); gcd(1,M)=1, gcd(2M,M)=M | Retained |
| §0.2 reduced cubic variant | gcd(3,4)=gcd(9,4)=1, but 9∤3 and 9 divides 9 | Retained extra condition |
| §0.3 finite Chern order one | K₃/1=0 and units/(units)¹=1 | Retained trivial target |
| §0.3 order changes | ζ₂₅↦ζ₂₅⁵=ζ₅; coefficient quotient is mod25→mod5 | Retained direction |
| §0.4 repeated-prime criterion | n=3: no p² divides n; n=9: 3² divides n and 3 divides w₂(ℚ)=24 | Retained distinct domains |
| §0.4 scalar Sah | Trivial G with scalar a=1 gives annihilator a−1=0, not 1 | Retained no spurious vanishing |
| §0.5 finite endomorphism | Every cyclic order 1–20, every scalar endomorphism and n=0–21: premise implies kernel intersection {0} | Retained, README only |
| §0.5 failed premise | A=ℤ/9,f=0,n=3: fA+nA={0,3,6}, and kernel intersection={0,3,6} | Retained negative control |
| §0.5 n=0 | Finite A: premise fA=A; kernel size 1; A[0]=A | Retained |
| §0.5 infinite countermodel | A=ℚ/ℤ,f=3,n=3: fA=A but 1/3 lies in both kernels | Retained finiteness |
| §0.6 exact eigenlift | Inclusion 3ℤ→ℤ sends the unique lift of 6 to 2 in 3ℤ's chosen basis; zero lifts to zero | Retained injection requirement |
| §0.6 valuation-image tensor | D=3ℤ,n=3: class of 3 nonzero in D/3D, image 0 in ℤ/3 | Retained unsaturated lattice |
| §0.6 ramification | F=ℚ,n=9: degree=e=φ(9)=6, residue degree=1 | Retained |
| §0.7 representatives | n=1 gives quotient 0 and S=∅; unit valuations all 0, a uniformizer valuation 1 | Retained ordinary/S-unit distinction |
| §0.7 field-map kernel | 2 is not a cube in ℚ, but is a cube in ℚ(∛2) | Retained no extension injectivity |
| §0.8 free-unit multiplicity | F=ℚ,p=3: free rank r₂=0; F=ℚ(∛2): odd free multiplicity r₂=1 | Retained |
| §0.8 mod-p torsion correction | F=ℚ: dimensions 1 at p=3, 0 at p=5,7; ζ₃ supplies the extra class | Retained |
| §0.9 unit theorem | ℚ,n=5: source=target=0; n=3 under M′: both cubic torsion groups have order3 | Retained good-order scope |
| §1.1 cyclicDilog definition | n=0,1 gives1; x=0 gives1; n=2,ζ=−1 gives1+x | Retained; Checks in prose |
| §1.1 asymmetric exponents | n=3: D=(1−ζx)(1−ζ²x)²; at x=1, D=6+3ζ, while exchanged exponents give 3−3ζ | Retained orientation |
| §1.1 singular/nonzero locus | n>1,x=ζ⁻¹ gives factor0 and D=0; x=0 gives1 | Retained denominator controls |
| §1.1 quasi-periodicity | n=3 in 𝔽₁₉,ζ=7,x=2,s=1: both sides14; s=0 gives D=D; s=n gives the same product power | Retained; 1,727 finite cases |
| §1.1 phase | n=3: D²=27+27ζ=−27ζ²; phase formula gives −27ζ² | Retained odd phase |
| §1.1 phase-free value | Exact cyclotomic quotients n=1–16: D(1)²⁴−n^(12n)=0; n=2 both16,777,216; n=3 both3³⁶ | Retained named headline |
| §1.2 cyclicHypergeom definition | n=0 gives0; n=1 gives1; n=2 over ℚ at (2,3,5),ζ=−1 gives1+(4/3)5=23/3 | Retained |
| §1.2 nonsingular diagonal | x=y=0,n=3,z=ζ₃: 1+ζ₃+ζ₃²=0 | Retained |
| §1.2 singular diagonal | n=2,ζ=−1,x=y=−1,z=1: total sum1+0/0=1, geometric sum2 | Added explicit failure |
| §1.2 period/difference | (1−Y)Z=1−X makes period multiplier1; 16,824 finite admissible shift equations have difference0 | Retained |
| §1.3 KMS at n=1 | D=f=1; exponent n(n−1)/2=0; both sides1 | Expanded domain |
| §1.3 even KMS | n=2,ℚ(√6),(x,y,z)=(1/2,1/3,3√6/8): both −2/9−4√6/27 | Added exact Check |
| §1.3 denominator exclusion | X=Y implies Z=1, so D(ζ/z)=D(ζ)=0 | Retained divided-domain exclusion |
| §1.3 Gaussian center | (X,Y,Z)=(1/5,2,−4/5): annulus 1/10<4/5<1; S=4/9 | Retained |
| §1.3 dilogarithm phase | At center the five reduced terms sum ½log(8/5)²≈0.1104517, whereas the full eight-term combination is0 | Retained branch corrections |
| §1.3 Abel substitution | Center gives x=4/9,y=1/9, sum of moduli5/9; X−YZ=1−Z=9/5 | Retained proof domain |
| §1.3 radial asymptotic | x=0: both1; n=1,x=−1: normalized values0.704166632,0.705635176,0.706370595 tend to1/√2≈0.707106781 | Corrected proposed positive exponent |
| §1.4 Kummer degenerate values | P(1)=1, P(0)=D(1)⁻¹,P(∞)=D(1), so P(0)P(∞)=1 | Retained |
| §1.4 root lift | x↦ζx changes the ratio by (1−x)ⁿ/(1−X); adjoining (1−X)^(1/n) makes its power class1 | Retained two-root requirement |
| §1.4 universal versus finite witness | Trivial witness has H¹=0; ℚˣ/(ℚˣ)³ still contains the valuation class of2 | Retained restriction of finite comparison |
| §1.5 root law | n=5,k=2: k⁻¹=3; k=−1 gives inverse regulator, not identical value | Retained |
| §1.5 order diagrams | n=15→5 uses ζ₁₅³; n=15→3 uses ζ₁₅⁵; CRT reconstructs residues (mod3,mod5) | Retained coefficient domains |
| §1.5 powered lift ambiguity | F=ℚ(ζ₃),ξ=0: both1 and[2] lift1 in universal H, but v₂(2)=1 is not divisible by3 | Retained lift set, not unique map |
| §1.6 divided boundary | [32]: 32∧(1−32)=5(2∧−31); tame symbol of {2,−31} at31 is2≠1 | Retained exact sequence, corrected locator |
| §1.6 nonunit étale image | Order-five regulator at primes over31 has residues of valuations1,2,3,4, rather than all0 | Retained different domain from ordinary units |
| §1.7 eta | n=3: [∞]+2[0]=[0]; n=5: [∞]+2[0]+2[−φ] | Retained degenerate symbols |
| §1.7 root scaling | k=−1 gives k²=1 on eta; root-based regulator exponent is −1 | Retained independent transformations |
| §1.8 positive bar chains | N=3: ∂([t|t]+[t²|t])=3[t]; ∂α₃=0 | Retained signs |
| §1.8 Bott Bockstein | N=1 gives0; nontrivial ζ gives ∂β=ζ≠1, excluding the image of integral K₂/N | Retained coefficient carrier |
| §1.9 actual SL conjugation | det A=ζ−ζ⁻¹=d; rescaling the first column gives det1 and eigenvalues ζ⁻¹,ζ | Retained |
| §1.9 product scaling | ζ↦ζᵏ multiplies ζ·β(ζ) by k·k=k²; k=−1 gives1 | Retained eta agreement |
| §1.10 Chern sign | In 𝔽₇ˣ/(𝔽₇ˣ)³ cubes={1,6}; [2]≠[4]=[2]⁻¹ | Retained unresolved normalization diagram |
| §1.11 local nth roots | n=3,ℓ=5: gcd(3,4)=1; n=3,ℓ=7: gcd(3,6)=3 and uniqueness fails | Retained ℓ≡−1 domain |
| §1.12 eta detection | n=3: v₃(5+1)=1, v₃(17+1)=2; μ₃ has exponent2 mod3 in C₂₄ at5, exponent0 mod3 in C₂₈₈ at17 | Retained exact valuation |
| §1.13 eta bridge | n=5: discℚ(√5)=5; atℓ=19 [ζ₅] has order5 in power classes, at149 it has order1 | Added equality before calibration |
| §1.13 detection up to scalar | Multiplication by2 mod5 fixes the zero subset{0} but sends1→2 | Retained inability to choose scalar from zeros |
| §1.14 scalar reading | (a,b)=(2,1) mod5 givesγ=2; (2,−1) givesγ=3=−2 | Retained conditional normalization |
| §1.14 vacuous good-field test | K₃(ℚ)/5=0, so exponents1,2,3,4 induce the same map there | Added zero-group control |
| §1.15 ε and torsors | m=1: ε=1; replacing u by uvᵐ sends y to vy and (vy)ᵐ=uvᵐ | Retained all-order Chern construction |
| §1.15 sign after squaring | At order5 exponents1 and−1 square to2 and−2=3, still different | Retained sign dependence |
| §2.1 root convention | ζ₆=ζ₂ζ₃=exp(5πi/3); independent exp(2πi/m) choices give ω₆−ω₃=1 | Retained compatible transitions |
| §2.1 order exponent | p=2,m=5: e=6, ζ₁₀⁶=ζ₅, root difference −2ζ₅ has valuation1 | Retained |
| §2.1 small differences | m=3,p=3: valuation1/6; m=4,p=3: valuation1/2; both positive, neither nilpotent | Retained convergence domain |
| §2.2 Frobenius lift | p=3 on ℤ₃: φ(2)=2, while2³=8 and8−2=6∈3ℤ₃ | Retained lift, not power map |
| §2.2 semilocal factors | K=ℚ(i): p=5 gives degrees1,1; p=3 gives degree2 and i↦−i | Retained every factor |
| §2.2 no global automorphism | x³−2 mod5=(x−3)(x²+3x+4); local degrees1,2 give Frobenius order2, not3 | Retained |
| §2.2 two coefficient actions | K=ℚ,p=2,m=3: coefficient φ fixesζ₃; cyclotomic φ sendsζ₃→ζ₃² | Retained |
| §2.2 internal factors | e=(1−i⊗ζ₄)/2 satisfies e²=e; coefficient Frobenius at3 sends e→1−e | Retained full algebra |
| §2.3 re-expansion | x↦x+c; x²↦x²+2cx+c²; c=p gives constant 1/(1−p) on Σxʲ | Retained; c=1 diverges |
| §2.4 arithmetic gluing | Constant i atp=3 gives sides i and−i; constants0,1 give0=0,1=1 | Retained |
| §2.4 restriction away | γ=1: all orders/edges; γ=2: orders1,3,5 retained,2,4 deleted and no1→2 edge | Added discriminating Checks |
| §2.5 scalar untwisting | At3 forℚ(i): seed i extends as (i,−i,i) on1,3,9; φ^v twists this to(i,i,i) | Retained inverse transition |
| §2.6 local chart | p=2,m=1: (q−1)²=4=0 mod(4,q+1), but q−1=−2≠0 | Retained double-limit argument |
| §2.6 chart failure | p=3,m=3: Φ₃≡(q−1)²; source reduction domain, proposed root coefficient reduction nonreduced | Retained p∤m |
| §2.6–2.7 full Taylor splitting | p=11,m=5: four linear factors; p=2,m=3: one quadratic factor | Retained ranks4 and2 |
| §2.7 independent seeds | Atp=2, order1 seed1 and order3 seed0 extend to values1 on2-powers,0 on3·2-powers | Retained index decomposition |
| §2.8 coordinate conversion | m=1: a↦−a; m=2:a↦a; m=3:a↦−ζ₃a↦a by inverse−ζ₃⁻¹ | Added third-root/inverse Check |
| §2.8 weighted jets | N=0,1:∅; N=2:{(1,0)}; N=4:{(1,0),(1,1),(1,2),(2,0),(3,0)} | Added all small boundaries |
| §2.9 classical image | KZ q=1+x jet:1,−1,2,−5,15,−53,217; q=−1+x jet:3,11,72 | Retained Taylor witnesses |
| §2.9 localization order | Δ=2 odd-order indicator e has e²=e, e₁=1,e₂=0; localization of the integral domain has only idempotents0,1 | Retained distinction |
| §2.10 order components | Δ=6: components of5,35,10,18 are1,1,2,18 | Retained |
| §2.10 internal idempotent | K=ℚ(i),d=4: (1−i⊗ζ₄)/2 has square itself and takes values0,1 on two factors | Retained coefficient-disjointness premise |
| §2.11 abelian scalar | ζ₅ at m=2 maps toζ₅³; φ₂ sendsζ₅³→ζ₅⁶=ζ₅ | Retained inverse Artin direction |
| §2.11 constant criterion | Rational1 glues; nonrational i atp=3 gives mismatch i,−i | Retained |
| §3.1 shape versus defect | ξ=0,f=(1+x)^(1/p): constant1, linear1/p, quotient1; atp=5,f=1+x/5 defect coefficient8/5 atx² | Retained integral first jet |
| §3.1 completion pole | ξ=0 gives polar0; for m=1,D=d, polar=(φd−p²d)/p, not generally0 | Retained allowed simple pole |
| §3.2 Dwork criterion | f=1 quotient1; binomial(1+x)^(1/p) quotient1 but first coefficient1/p∉S | Retained both directions' linear premise |
| §3.2 exponential radius | p=2,x=2: v₂(2ᵏ/k!)=s₂(k), equal1 on k=2ᵃ, hence terms do not tend to0 | Retained p>2 corollary |
| §3.3 depleted series | s=0: t/(1−t)−tᵖ/(1−tᵖ); s=2 coefficients at t,tᵖ are1,0 | Retained |
| §3.3 residue coefficient | Coefficient of t in defect is p/(1−q)=−p/x | Corrected sign |
| §3.3 root residue | p=5,ζ³=1: numerator3ζ, denominator2+ζ; (1+2ζ)(2+ζ)=3ζ≠0 | Corrected specialization; ± residues differ mod25 |
| §3.4 regularization | Polar terms −pLi₂^(p)/(m²h) and +pLi₂^(p)/(m²h) sum0 | Propagated residue sign |
| §3.4 branch/presentation | Empty presentation gives U=1; m=2 ordinary q^(m/2) atζ₂ is−1, formal half branch is1 | Retained normalized branch |
| §3.5 rational H | H(−1,1)=1/48,H(2,1)=1/12,H(−1,2)=1/96,H(−1,−1)=−1/48 | Recomputed all values |
| §3.5 total junk values | r=0 or z=1 gives total0; char2,3 gives24=0 and total0 | Corrected generality/domain wording |
| §3.5 scale/map | H(−1,2)=H(−1,1)/2=1/96; the ℚ→ℝ image is the same rational1/96 | Retained prose API |
| §3.5 first jet | B₁(1/2)=0,B₂(1/2)=−1/12,Li₀(−1)=−1/2: coefficienth=1/48; x coefficient is1/(48ζ_m) | Retained sign and root factor |
| §3.6 local freeness | Degree0 generator1 gives moduleH_p; scalar p gives pH_p with nonunit leading coefficientp | Retained generator distinction |
| §3.7 phase denominator | p=5: 2−2⁻¹=3/2 a unit; mod3 and mod2 every unit has square1 | Retained allowed primes |
| §3.7 linear extension | Atp=5, s′=2s,a′=a/2: E₀(a/2)2ŝ=E₀(a)ŝ; E(0)=0 | Added generator independence |
| §3.7 transition composition | Degree0 scalar i atp=3: i→−i→i, equal φ⁻²(i); scalar example only | Added coherence witness |
| §3.8 nonlinear countermodel | f₂=−1,other f=1: all nonlinear products1, but edge2→10 is−1 versus1 | Replaced definition |
| §3.8 failed addition | f+1 has values0,2; γ=1 product has0,4 at2,10, so edge is0 versus4 | Added negative control |
| §3.8 scalar/product boundary | f=0 gives E(0)=0; f=1−q,γ=2 gives(1−q²)²(1−q⁻¹) | Retained derived product |
| §3.9 ring identification | ξ=0: transition f_pm=φ⁻¹rex f_m rearranges to rex f_m=φ f_pm | Corrected linear proof |
| §3.9 graded multiplication | Degree0: 0·f=0,1·f=f; degreesξ,−ξ sum0 | Retained via tensor-coherent extension |
| §3.10 effective descent | Degree0 chart line H has rank1; eH on complementary component has rank0 | Required full-rank/finiteness theorem retained |
| §3.11 tensor and Picard | M₀⊗Mξ→Mξ sends1⊗f→f; tensor power0 isH; e+(1−e)=1 illustrates finite-sum inverse | Retained no global generator claim |
| §3.12 substitution | q=ζ+x: q⁻¹=ζ⁻¹−ζ⁻²x+O(x²); γ=2,m=2 gives order1 | Retained source/target order change |
| §3.12 zero exponent | γ=0 gives q⁰=1 and nonzero constant shift at other centers | Retained exclusion |
| §3.13 pairing | g=0 gives a=b=0 and af=bg=0; orthogonal idempotents give fτg=0 | Retained no quotient assertion |
| §3.14 vanishing/evaluation | E(0)=0 propagates whole zero series; f=x has constant0 but nonzero series | Updated linear proof |
| §3.15 section versus generator | Multiplication by1−q has evaluation0 atq=1; image cannot contain1, whose evaluation is1 | Retained non-surjectivity |
| §3.16 pullback/base change | Identity field map givesH⊗_H M≃M; ℚ→ℚ(i) at5 sendsa↦(a,a) | Retained both local factors |
| §3.17 coefficient Galois | Conjugation:i↦−i↦i, while abstractζ₄ staysζ₄ | Retained distinct involutions |
| §3.18 determinant norm | Split quadratic:(1+ax)(1+bx)=1+(a+b)x+abx²; first coefficient trace=a+b | Retained whole-series norm |
| §3.18 regulator transfer | ξ=0 gives D(0)=0,Trace0=0 and ε(0)=1,Norm1=1 | Retained torsor/trace contract |
| §3.19 multiplicative norm | Quadratic Norm(2)=4,Norm1+Norm1=2; Norm0=0,Norm1=1; base scalara givesa² | Updated linear membership; no additive claim |

The finite-field pass used the actual displayed finite product and total field quotient, not an assumed KMS equality. It checked every admissible triple at each listed pair:

| n | Field | Primitive root | KMS triples | Shift triples | Quasi-periodicity cases | First KMS tuple (x,y,z); left = right |
|---:|---:|---:|---:|---:|---:|---|
| 1 | 𝔽₇ | 1 | 20 | 36 | 14 | (2,3,4); 1=1 |
| 2 | 𝔽₁₁ | 10 | 32 | 82 | 33 | (2,4,3); 2=2 |
| 3 | 𝔽₁₉ | 7 | 108 | 282 | 76 | (2,10,5); 5=5 |
| 4 | 𝔽₁₇ | 4 | 128 | 324 | 85 | (3,6,6); 6=6 |
| 5 | 𝔽₃₁ | 2 | 500 | 1230 | 186 | (3,11,7); 30=30 |
| 6 | 𝔽₃₇ | 11 | 864 | 2094 | 259 | (2,5,9); 11=11 |
| 7 | 𝔽₄₃ | 4 | 1372 | 3290 | 344 | (3,7,6); 39=39 |
| 9 | 𝔽₇₃ | 2 | 4374 | 9486 | 730 | (3,25,25); 18=18 |

All 7,398 KMS equations, 16,824 shift equations, 1,727 quasi-periodicity equations and sixteen exact cyclotomic phase-free identities passed. These computations check instances; the four universal statements remain honest sorry targets.

The finite-endomorphism criterion also has a short independent proof: split a finite abelian group into the stable image of f and its nilpotent part C. The premise gives C=fC+nC. Iterating nilpotence yields C=nC; finiteness makes n injective there. Since ker f lies in C, its intersection with C[n] is zero. This verifies the review's mathematical claim without making an auxiliary finite-group result an acceptance headline.

## Maintainer consequences

The three supplier gaps require independent owner work or a human ownership decision; this repair does not assert those inputs have appeared. K3BlochGroups must remain earlier and foundational, with no dependency on this roadmap. The final étale Bloch and regulator comparisons are here. No merge-order change is requested by depcheck.

The sole renamed exported theorem is kms_odd → kms, with strictly broader order hypotheses. The unused halfShiftLinearCoeff definition and six anonymous elementary examples are absent from Suggested.lean; H in the README carries the same rational function and its corrected field/domain specification. A roadmap-tool search found no external roadmap references to either former name. Analytic proof-route names are README targets, not Lean declarations.

Fresh independent review is still required. In particular the linear extension's coherence and effective descent, the all-order Chern torsors, the normalization diagram, the three supplier contracts, and the branch-sensitive uniform asymptotic are proof obligations of the library roadmap, not established by elaborating these signatures or by the finite examples above.
