# Review of ModularFormsPartII (package, round 2)

**Verdict:** needs changes

Six findings: one P1, three P2 and two P3; four blocking findings. The previous four repairs are present. The package source files were not edited. The source manifest was not changed.

## Previous findings, checked individually

| Previous finding | Repaired passage in packages/ModularFormsPartII/README.md | Assessment |
|---|---|---|
| F01, Catalan quotient weights | Line 847: “The third term is `−4θ₃⁴/θ₂⁴ = −4/λ` (§2.1), of weight 0 with trivial character.” | Repaired. The three weights are 1, 1, 0. Both series give coefficients 1, 1, −4, 5, 12, −42 through q⁵. The first two are understood as quasimodular terms. |
| F02, arbitrary-subgroup graded ring | Line 809: “Mathlib's graded commutative ring of integral-weight modular forms on the image of Γ in `GL₂(ℝ)`”. | Repaired. `ModularForm.instGCommRing` is at Mathlib/NumberTheory/ModularForms/Basic.lean:561; the image of any SL₂ subgroup has the required determinant instance. Lines 48 and 811 cite it too. |
| F03, bounded-denominator and comparison locators | Line 95: “§2.9 (All-prime bounded denominators, Layer R15.2)” and “§1.5 (All-weight analytic comparison, Layer R15.1)”. | Repaired throughout. At #928, TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:412 and :226 contain precisely these targets. The former includes level primes and Laurent expansions on Y(2N). |
| F04, modular-group presentation | Line 67: “FuchsianOrbifolds Layer 2 item 5 applied to the level-one group of Layer 6 item 1”. | Repaired. On main, TauCetiRoadmap/FuchsianOrbifolds/README.md:526 points from item 5 to the presentation in item 3 (:513); Layer 6 item 1 is :907. For S=[[0,−1],[1,0]], R=S⁻¹T=[[0,1],[−1,−1]], R³=I and SR=T. |

The repaired patterns were searched elsewhere: no remaining claim that all three Catalan terms have weight one; no remaining claim that ModularForms Layer 0 supplies the arbitrary-subgroup graded ring; the R15 citations now name their targets; the presentation citations use the repaired items. None of the findings below re-raises a finding marked not actionable by the repair report.

## R01 (P1) — Odd-weight cusp monodromy need not be unipotent

**Location:** packages/ModularFormsPartII/README.md:785 and :787: “unipotent and nontrivial at every cusp”.

**Claim:** Every nonzero positive integral-weight congruence form in §7.14 has unipotent local monodromy at every cusp of the indicated finite cover.

**Witness:** Take h=θ₃², k=1, Γ′=H′ of §§1.3, 2.6. At cusp 1, P=−gT²g⁻¹=[[1,−2],[2,−3]] belongs to H′. Its eigenvalues are −1,−1, not 1,1.

More explicitly, on the basis (h,τh), continuation has matrix B=[[-3,2],[-2,1]]. Then (B+I)²=0, B+I≠0, det(B−I)=4, and B²=[[5,−4],[4,−3]] is nonidentity unipotent. This is the roadmap's own example at line 793, on its specified cover: H′⊆Γ(2). The fact that its monodromy at x=0 is unipotent does not make the monodromy at every cusp unipotent. CDT25 line 3651 states the finite-cover ODE and commensurability result; it does not supply the stronger assertion.

**Exact repair:** Retain every k≥1 and every congruence subgroup. For a primitive cusp stabilizer conjugate to εTʷ, ε∈{±1}, state that the local operator is conjugate to εᵏ Symᵏ(Tʷ). It has infinite order, is quasi-unipotent, and becomes nonidentity unipotent after squaring. It is already unipotent when εᵏ=1. Correct both the statement and the final proof-sketch sentence, and add the H′ cusp-1 computation as a negative-control Check. Tested: k=1, ε=−1 gives eigenvalue −1; squaring gives B² above. Even k gives eigenvalue +1. No restriction to even weights is needed.

## R02 (P3) — The Wronskian quotient has the wrong monic normalization

**Location:** packages/ModularFormsPartII/README.md:731: `L_j(y) = Wr(y, w₁, …, w_m)/Wr(w₁, …, w_m)`.

**Claim:** This constructs the monic operator of line 729, subsequently used as the uniquely normalized operator in §7.9.

**Witness:** For W=span{1}, m=1, the usual ascending-derivative Wronskian gives Wr(y,1)=−y′ and Wr(1)=1. At y=x the quotient is −1; the monic derivative gives +1.

This also disagrees with the explicit ∂ example at lines 722 and 795. No alternative Wronskian convention is defined in the package.

**Exact repair:** Specify Wr(f₁,…,f_r)=det(f_j^(i−1)) and use Wr(w₁,…,w_m,y)/Wr(w₁,…,w_m), or multiply the displayed quotient by (−1)ᵐ. Set the empty Wronskian to 1 for the zero component. Tested: m=1, w₁=1 gives y′; m=2, (w₁,w₂)=(1,x) gives y″; m=0 gives the identity operator. Keep these checks in the README, not Suggested.lean.

## R03 (P3) — The complex function-field identification loses a factor of two

**Location:** packages/ModularFormsPartII/README.md:487: “identify `ℂM₂m` with the function field of `X(m)`”.

**Claim:** The field defined using Γ(2m) is the function field of the level-m curve, compatibly with the λ maps used in the degree calculation.

**Witness:** At m=2, [ℂM₄:ℂ(λ)]=4 by §5.4, whereas ℂ(X(2))=ℂ(λ) has degree 1. The level-4 curve, not level 2, has the required degree 4.

**Exact repair:** Replace X(m) by X(2m) in this sentence; apply ModularCurvesPartII §§5.14, 6.4 and the rational-cusp contract at full level 2m. For m=1 use §2.2's explicit X(2) comparison, since the twist contract starts at level 3. Tested: m=1 gives degree 1, m=2 gives degree 4, and m=3 gives degree 12, agreeing with §§3.1 and 5.4. The intersection and Galois base-change statements themselves survive this correction.

## R04 (P2) — The arithmetic theorem drops the source's minimal-model hypothesis

**Location:** packages/ModularFormsPartII/README.md:904: “start from a regular proper model”; this model is used in §§9.2–9.3. The contract at :83 has the same generality.

**Claim:** CDT Theorem 7.4.10 and the cited Ihara route establish the finite-cover and fundamental-group assertions for the cuspidal open obtained from any such regular proper model.

**Witness:** CDT25 lines 4118–4121 specify the minimal regular model. Blowing up ℙ¹ over a DVR at the cusp in its special fibre gives another allowed regular proper model; its retained cuspidal fibre is ℙ¹ minus one point, not ℙ¹.

In that example the special fibre before blowup has one smooth component; afterwards it has two components meeting once. The section meets the exceptional component, whose smooth retained part is A¹. Thus the construction really depends on the permitted modification: it is not the source's model under another name. Neither §9.2 nor any supplier contract proves that the finite-étale-cover category is unchanged by these modifications. This is an unsupported extension of a source theorem, not a finding about the declared gap being unavailable today.

**Exact repair:** Use the minimal regular model specified in CDT Theorem 7.4.10, with its cusp section in the smooth locus, in §§9.1–9.3. Strengthen the existing all-prime cuspidal-model contract in the README and the matching top-level gap entry to supply that model, retaining every N and every prime; the small genus-zero cases should use the stated smooth minimal models. If arbitrary regular modifications are intended instead, they require a separate precise comparison theorem and proof before §9.2 can consume them. Tested against the witness: the cusp blowup is nonminimal and is excluded; the N=1 model is ℙ¹ with special fibre ℙ¹, as in line 917. No good-prime restriction repairs this issue.

## R05 (P2) — The holonomy proof uses a cover of Y(2) before imposing level two

**Location:** packages/ModularFormsPartII/README.md:391: “a rational function on the algebraic curve `Y(H)`, finite étale over `Y(2)`”.

**Claim:** The group H in the definition of an R₂N generator already defines the finite cover needed to continue branches over the λ-line.

**Witness:** Take N=1, H=SL₂(ℤ), f=j. It meets the generator hypotheses, with L(H)=1. But λ(i)=1/2 and λ(Ti)=−1, so λ does not descend to Y(H).

The cited §2.2 states its finite-cover assertion for H≤Γ(2), whereas §3.2 does not impose that containment. CDT25 lines 1433–1438 use a curve already equipped with a finite étale map to Y(2).

**Exact repair:** At the start of the sketch replace H by H∩Γ(2). State that f remains invariant, −I remains present, and §1.5 gives L(H∩Γ(2))=lcm(L(H),2), which still divides 2N. Add §1.5 to the Needs line. Then apply §2.2 to this subgroup. Tested: for the witness the replacement is Γ(2), its level is 2, and the covering of Y(2) is the identity; f=j remains a regular function on that open curve. Keep the general definition of R₂N unchanged.

## R06 (P2) — Kummer pullback alone does not remove the singularity at zero

**Location:** packages/ModularFormsPartII/README.md:299: “leaves possible singularities only at `16^(−1/N)μ_N` and `∞`”; the following sketch identifies the hypergeometric equation.

**Claim:** The coordinate substitution alone removes zero from the possible singularities, without naming an equation or a local-monodromy hypothesis.

**Witness:** For N=1, K₀ of §2.6 has a second local solution with log x and nontrivial unipotent monodromy at zero. After x=uᴺ, log x=N log u; the singularity persists for every N≥1.

If U=I+B is its nonidentity unipotent monodromy, B²=0, the pulled-back monodromy is Uᴺ=I+NB≠I in characteristic zero. CDT25 lines 1442–1446 remove zero only after using the modular cusp-width hypothesis; equation (3.0.2), cited for the coordinate itself, does not supply that hypothesis.

**Exact repair:** Keep §2.5's unique normalized root and its ℤ[1/N] coefficient assertion. Replace the singularity sentence by the precise preimage calculation: the inverse image of {0,1/16,∞} is {0}∪16^(−1/N)μ_N∪{∞}. Leave removal of zero to §3.4, where the signed-width divisibility is proved to give a full meromorphic local basis after pullback. Add the logarithmic K₀ negative control. Tested: it retains zero for K₀ at N=1 and N=2, while a local branch x^(1/N) becomes u and has no residual branching.

## Verified sound

### Scope of this round

Read all 64 numbered targets, all 64 Needs lines, the nine layer dependency paragraphs, conventions, API blocks, examples, metadata, manifest and the nine Lean declarations. The 12 definition/API blocks have respectively 5,5,4,4,4,4,5,4,4,4,4,4 Checks; theorem-only API additions do not need artificial definition tests. All nine layers end with Examples and Dependencies.

For untouched material, the computed rows of the preceding report were used as allowed, not its blanket assertion that the remaining mathematics was sound. Targets absent from that table were examined anew. The compact table below covers the 15 seeded targets, all six Lean headlines, the changed mathematical passages, and every finding. A separate scratch work ledger records the remaining target-by-target calculations and the inherited evidence.

No re-planning of ModularForms, route-specific restriction, algorithm, copied source passage, forbidden supplier, sorry'd data, set_option, or process residue was found in the reviewed package. The layer order is explained by the mathematical inputs: rank and group theory feed leveraging; the denominator theorem feeds the applications. It does not follow CDT's chapter order. The base roadmap's new numbering maps its former Layer 0/4 and eta example citations explicitly, at TauCetiRoadmap/ModularForms/README.md:329–349.

### Seeded source sample

All 15 targets were read in the legal cached author's offprint CDT25. Its PDF page n is journal page n+626. The manifest identifies that version and the published DOI; the locators below use printed pages. No additional unverified locator was flagged in the README. Ihara1994 remains settled uncertified.

| Target | Source locator and extraction | Result of comparing hypotheses and conclusion |
|---|---|---|
| 1.5 | Lemma 4.1.3, p.653; CDT25 line 1576 | The source states divisibility; the stronger lcm equality follows from intersection of the translation subgroups with −I in both groups. |
| 2.5 | (3.0.2), p.650; CDT25 line 1425; local-basis argument at line 1442 | Root and ℤ[1/N] coefficients supported. Removal of zero needs the additional hypothesis in R06. |
| 2.6 | (1.1.4)–(1.1.5), p.631, CDT25 line 246; (7.2.4), p.688, line 3636 | Identity and nontrivial unipotent monodromy at zero supported. The README correctly restores the character χ₋₄(d). |
| 2.7 | Example 5.1.22, p.673, CDT25 line 2738; Theorem 5.1.4, p.668, line 2382 | Both exceptional modular uniformizations and the radius values match. The source rotation for F₂ has the same derivative modulus. |
| 3.8 | Proposition 3.0.1, pp.649–651, CDT25 line 1404; Corollary 2.0.5, p.636, line 489 | The two asymptotic hypotheses match. The W interpretation and log(2N) correction are essential and are retained. |
| 5.1 | Theorem 4.3.2 proof, pp.656–657, CDT25 lines 1819–1830 | The intersection and degree identity are the intended inputs; the README supplies Galois linear disjointness. R03 corrects the curve index. |
| 5.2 | Theorem 4.3.1, p.656, CDT25 line 1810; (4.4.9), p.660, line 2024 | Prime p∤2N and old-level noncongruence element match; the unsigned-domain generation argument is consistent. |
| 6.6 | Remarks 6.3.1–6.3.2, pp.685–686, CDT25 lines 3500–3526 | Algebraic-integer extension supported; §6.5 supplies the conjugation justification used by the trace route. |
| 7.3 | Definition 7.3.1, pp.688–689, CDT25 line 3663 | Projective representation, semisimple T, holomorphy and strip growth match. No span hypothesis is silently assumed. |
| 7.5 | Remark 7.3.2, p.689, CDT25 lines 3706–3715 | Scalar-to-permutation induction supported; even weight and −I conditions are retained. |
| 7.9 | Theorem 7.3.3 proof, pp.690–691, CDT25 lines 3798–3819 | G-function/Galochkin/global-nilpotence/quasi-unipotence route matches. The companion vector is (f,f′,…), and its coordinates are independent; they are not separate vector solutions. R02 fixes the normalization used for uniqueness. |
| 7.11 | Theorem 7.3.3, pp.690–691, CDT25 line 3766; scalar extension at line 4013 | Source h=2 is enlarged to all positive integral periods by integral scaling and induction; c≠0 permits division back. |
| 7.14 | Remark 7.2.3, p.688, CDT25 lines 3645–3653 | Order k+1 on the finite cover is supported. “Unipotent at every cusp” overreaches it: R01. |
| 8.5 | §7.4.8, pp.694–695, CDT25 lines 4055–4074 | Definition matches for K=ℚ. Number-field extension uses each place separately; usual complex modulus and rescaling ε/2 to ε preserve the criterion. |
| 9.1 | Theorem 7.4.10, p.696, CDT25 lines 4118–4127 | N≥1, K containing μ_N, section and pointed conclusion match; minimality was dropped: R04. |

Also reopened the changed §8.4 formula at CDT25 lines 3992–4010 and the KSV10 signed Wohlfahrt proof at lines 183–195, 198–261 and 262–281 (arXiv v4, pp.4–6). Every directly cited work is recorded under its existing manifest key; no duplicate key or new request was created.

### Adversarial table

Values labelled inherited below are the prior report's computed values for unchanged targets. All finding witnesses, changed formulas and sampled algebraic tests were independently recomputed in this round. Formal series calculations used exact rational coefficients.

| Statement | Instances tried | Computed values on both sides | Result; change |
|---|---|---|---|
| §1.1 / IsWeakForm | 1, Δ⁻¹, exp(j), −I in odd weight | Growth exponents 0 and 2π suffice for 1 and Δ⁻¹; exp(j) grows as exp(exp(2πy)); slash by −I gives −f rather than f for odd k | Definition distinguishes weak forms from pole-free forms and excessive growth; inherited values reconfirmed against the native predicates. |
| §1.5 intersection | Γ₀(3) and Γ(2), cusps ∞ and 0 | Widths (1,2)→2, (3,2)→6; level lcm(3,2)=6 on both sides | Holds with both signs included. |
| §2.1 modularLambda | q, q², q³; τ=i | x coefficients 1,−8,44; λ coefficients 16,−128,704; λ(i)=1/2; λ(Ti)=−1 | Correct quotient and non-SL₂ invariance. |
| §2.2 λ covering headline | central element −I; λ(i), λ(Ti) | −I fixes i and lies in Γ(2); T does not lie there; images 1/2 and −1 differ | Orbit convention and omitted values consistent; not a one-tactic theorem. |
| §2.4 inverse | degrees 1–6 | q(x)=(1,8,84,992,12514,164688); x(q(x))=(1,0,0,0,0,0) | Exact inverse coefficients agree. |
| §2.5 Kummer coordinate | N=1,3; hypergeometric monodromy at N=2 | x₁=x; x₃=t−(8/3)t⁴+(68/9)t⁷; cube coefficients t³−8t⁶+44t⁹; (I+B)²=I+2B≠I | Root sound; zero cannot generally be removed, R06. |
| §2.6 Jacobi | through q¹⁵; −I | All 16 coefficients of K₀(x(q))−θ₃² are 0; χ₋₄(−1)=−1=(−1)¹ | Identity and character sound. |
| §2.7 uniformizations | N=2,3; Cayley center | C(0)=i, C′(0)=2i; −2(ic)(2i)=4c>0; γ₂≈4.376879>4, γ₃≈2.581057>2.519842 | Correct normalization, matching source values. |
| §3.1–3.3 fields and inclusion | N=1,2; constants | M₂=ℚ(λ); degree M₄/M₂=4; 1/2 admitted, √2 excluded from ℚ((t)); Δ⁻¹ starts q⁻² with integral remaining coefficients | Rational field and all-prime scope preserved. |
| §3.4 holonomy cover | H=SL₂(ℤ), f=j, N=1 | L(H)=1 divides 2, but λ(i)=1/2≠−1=λ(Ti); H∩Γ(2)=Γ(2) has level 2 | Missing containment in proof route, R05. |
| §3.8 rank headline | A=1,N=2 as logarithmic test; N=1 | log((1+1/8)(1−1/16))≈0.0532445≥1/24≈0.0416667; log(2)=0.693147…>log(1)=0 | Correct asymptotic denominator and small-N absorption. |
| §4.1 nonabelian Ihara headline | N=3,p=2; G containing Γ(3) | diag(2,1)[[1,0],[6,1]]diag(1/2,1)=[[1,0],[3,1]], outside Γ₀(2); S=1 gives attainable pair (1,1) | Direction and small-prime case correct; conjugation is not an automorphism of D. |
| §5.1 complex base change | m=2 | [ℂM₄:ℂ(λ)]=4; [ℂ(X(2)):ℂ(λ)]=1; X(4) gives 4 | Index typo R03; intersection plus Galois property is sufficient for the degree identity. |
| §5.2 p-scaling | N=2,p=3 | t₂=q^(1/2)=t₆³; t₂(pτ)=q^(3/2)=t₆⁹; exponent p²=9 | Substitution and conjugation agree. At N=1 raising to level 4 permits §4.3. |
| §§5.3–5.5 degree doubling | degree d=2; N=2,3 | New degree at least 4; M₄/M₂=4>32/π²; M₆/M₂=12>108/π²; at N=1 generic formula would give 1/2 instead of 1 | Correct separate N=1 clause and multiplicative contradiction. |
| §6.1 equality headline | N=1 and prime-step growth | Both fields ultimately ℚ(λ), degree 1; k successive primes give 2ᵏ against O(log N), with log N=O(X), k≫X/log X | Consistent with holonomy bound; prior computed growth argument retained. |
| §6.3 integral UDC headline | f=1, h=1 or 2; f=0 | qExpansion=(1,0,…) for 1, all zero for 0; Γ′=SL₂(ℤ) works; h→2h inserts zero odd coefficients | Nonvacuous; period and boundedness are actual hypotheses. |
| §6.6 algebraic-integer headline | K=ℚ(√2), α=(1,√2), a=m+n√2 | Tr(a)=2m, Tr(√2a)=4n; f=(1/2)Tr(f)+(√2/4)Tr(√2f); determinant of trace pairing=8≠0 | Trace reconstruction works; one field is supplied by §6.5. |
| §7.3 vector-valued definition | n=0; F=1; Jordan T; odd k | Unique empty vector; 1 transforms with ρ=1,k=0; (J−I)²=0 but J−I≠0 excludes semisimplicity; F=−F forces zero | Degenerate and wrong models distinguished. Strip endpoints a=b follow by enclosing in a wider strip. |
| §7.5 scalar induction | trivial group quotient; Γ(2) | Full group has one component f; Γ(2) quotient is S₃ with six cosets; right multiplication by T consists of three 2-cycles, P_T²=I | Identity component and nonabelian right-action convention agree; finite-order matrices are semisimple over ℂ. |
| §§7.8–7.9 minimal operator | f=1, W=span{1}, y=x | Printed quotient gives −1; ∂x=1; corrected quotient gives 1. For f=1, companion matrix 0, divided iterates B₀=1 and B_m=0 for m>0, monodromy 1 | R02 fixes monicity; Galochkin multiplier 1 and nilpotence 0 support §7.9. |
| §7.9 finite local monodromy | diag(1,−1) versus Jordan J | diag(1,−1)²=I; Jᴺ=I+N(J−I)≠I | Quasi-unipotent plus semisimple is sufficient; dropping semisimplicity is not. |
| §7.11 component headline | c=1,F=1,h=1; h=3 scaling | Integral coefficients (1,0,…), Γ(1) suffices; exp(2πi(hτ)/h)=q², so odd h inserts zeros | Period generalization is valid and no claim about unused summands is made. |
| §7.12 effective Mason headline | F=(1,0,0), ρ=1⊕σ | Value span rank 1; ρ(γ)F=F; σ(T) has characteristic polynomial X²−5X−1 and infinite order | Effective conclusion survives where full-kernel conclusion fails. |
| §7.13 repaired presentation | S, R and σ(S),σ(R) | S²=−I, R³=I, SR=T; σ(R)²=[[-3,−1],[7,2]], σ(R)³=I; σ(T)=[[2,1],[7,3]], det=−1, trace=5 | F04 repair does not change the counterexample. |
| §7.14 positive weight | θ₃², k=1, cusp 1; Δ,k=12 | B=[[-3,2],[-2,1]] has eigenvalue −1, det(B−I)=4; B² nonidentity unipotent; Δ equation order 13 | Universal unipotence false, R01; order/Wronskian assertion remains sound on the stated finite cover. |
| §8.1 repaired graded ring | Γ arbitrary finite index; Δ⁻¹,E₂,1 | det(mapGL γ)=1; weights/depths (−12,0),(2,1),(0,0); odd weights vanish when −I is present | F02 repair matches native ring hypotheses. |
| §8.2 derivative normalization | first two nonzero Δ terms | Δ=q²−24q⁴; θ_qΔ=2q²−96q⁴; E₂Δ=q²−48q⁴ | θ_qΔ=2E₂Δ, not E₂Δ. |
| §8.4 repaired quotient | coefficients through q⁵; term weights | Both sides (1,1,−4,5,12,−42); numerator constant 0 cancels q⁻¹ pole; term weights 1,1,0 | F01 repair correct. |
| §8.5 deficient places | a_m=2⁻ᵐ; zero insertion r=2; zero space | ∣a_m∣₂=2ᵐ→∞; normalized archimedean ratio is multiplied by 2^(−((k−1)/2+ε)); zero space has no witness | Definition and extension of coefficient field preserve the test. |
| §§8.6–8.7 no deficient places | 1⊕σ from §7.13 | Eigenvalues (5±√29)/2 have moduli ≠1; σ(T)^(2N)−I invertible, so periodic σ-component=0 | The source's unconditional noncongruence converse is correctly rejected. |
| §9.1 cuspidal model | N=1; cusp blowup over DVR | Minimal smooth fibre ℙ¹; blowup has two components meeting once, retained exceptional component minus node=A¹ | Source's minimality is substantive, R04. Fibrewise selection itself is correct. |
| §§9.2–9.3 headline | N=1, chosen smooth model; section composition | π∘ε=id gives π_*ε_*=id; minimal N=1 fibre has π₁ geometrically trivial; this alone does not prove the general finite-cover criterion | Correct categorical deduction conditional on §9.2; Ihara route not certified. |

### Lean elaboration, signatures and padding

Ran `lake env lean` on the absolute package Suggested.lean from the pinned content checkout. Exit 0, exactly six warnings, each `declaration uses sorry`, at lines 70, 84, 103, 115, 146, 161. There is one `import Mathlib` and no TauCeti import to build. No Lean process was left running.

A scratch copy applied the one-tactic alternatives `rfl`, `simp`, `infer_instance` and `assumption` to every sorried theorem, requiring each attempted tactic to close its goals. All six fell through to sorry; no theorem closed. The scratch file elaborated successfully, with expected probe-only unused-tactic warnings. The original file has no such warnings. The near-match library results were compared with their pinned definitions: slash invariance is weaker than weak-form meromorphy; eta nonvanishing does not prove a λ covering; quotient-cover results require the covering/action hypotheses; Fourier coefficient formulas do not imply congruence. The other near-matches concern unrelated Lie algebras, polynomial denominators or matrices. No single pinned lemma found by those searches proves any of the six headlines. None is a boundary case, computed-value test, or restatement of its definition.

The same scratch copy contained `#check @name` for all nine declarations. All nine elaborated types were compared with their README statements and the supplied signature listing. No binder was lost, and nothing changed: Γ finite index in both scalar UDC statements; N≥3, p prime and p∤N in Ihara; the actual rational conjugation equation for c; c≠0, h>0, periodicity and boundedness for the component theorem; independent scalar and period choices for each component in Mason. The three predicates/definitions have real bodies. The vector growth formulation permits all strip endpoints; this is equivalent to the prose formulation a<b by enlarging a degenerate strip. The representation is explicitly trivial on −I.

| Deep headline | Status in Suggested.lean |
|---|---|
| λ covering, §2.2 | `modularLambda_covering` |
| Nonabelian Ihara, §4.1 | `nonabelian_ihara` |
| Integral UDC, §6.3 | `unbounded_denominators` |
| Algebraic-integer UDC, §6.6 | `algebraicInteger_unbounded_denominators` |
| Integral vector component, §7.11 | `vectorValued_component_congruence` |
| Effective Mason, §7.12 | `vectorValued_effective_mason` |
| Holonomy rank, degree doubling, R₂N=M₂N | Named in module docstring: absent weak Laurent-expansion/holonomic-ring carriers. Native qExpansion is a PowerSeries Taylor expansion, not a Laurent expansion. |
| Three-point algebraicity and congruence | Named in module docstring: absent full linear-ODE local solution/meromorphic-basis and local-monodromy interface. Native analytic continuation alone does not supply it. |
| Arithmetic fundamental group | Named in module docstring: absent modular regular model and cusp section. |

As in round 1, the elementary differential-closure consequence (§8.2) and deficient-place consequences (§§8.6–8.7) are application corollaries, not additional deep acceptance declarations. The source calls the former Lemma 7.4.4; its route is precisely the supplied Serre derivative plus Δ⁻¹. Adding its API calculations as Lean tests would not improve headline coverage. All nine Lean names are present in the README; no extra own declaration name is promised in backticks.

### Pinned library and duplication audit

Pins read from lake-manifest.json: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. These differ from the prior review's pins, so the prior line numbers were not reused.

The following declarations were opened, rather than merely name-matched. Mathlib paths below are relative to Mathlib; Tau Ceti paths are relative to TauCeti.

| File | Declarations and lines inspected |
|---|---|
| NumberTheory/ModularForms/Basic.lean | ModularForm :78, CuspForm :86, ModularForm.instGCommRing :561. Fields require holomorphy and boundedness/vanishing only at group cusps; there is no weak-form finite-principal-part field. |
| NumberTheory/ModularForms/SlashInvariantForms.lean | SlashInvariantForm :36 and its invariance field :42; no holomorphy or growth is part of this carrier. |
| NumberTheory/ModularForms/SlashActions.lean | ModularForm.SL_slash :171, SL_slash_def :174. |
| NumberTheory/ModularForms/BoundedAtCusp.lean | OnePoint.IsBoundedAt :53, quantifying over scaling matrices. |
| Analysis/Complex/UpperHalfPlane/FunctionsBoundedAtInfty.lean | atImInfty :30; IsBoundedAtImInfty :45. |
| NumberTheory/ModularForms/CongruenceSubgroups.lean | Gamma :42, Gamma_normal :55, Gamma0 :80, Gamma1 :132, IsCongruenceSubgroup :164; positive level is required, −I is not. |
| NumberTheory/ModularForms/ArithmeticSubgroups.lean | HasDetOne mapGL image instance :58 and HasDetPlusMinusOne consequence :66; IsArithmetic :126 and isArithmetic_iff_finiteIndex :132. |
| NumberTheory/NumberField/Basic.lean; RingTheory/IntegralClosure/IsIntegral/Defs.lean | NumberField.RingOfIntegers :102 is integralClosure ℤ K; IsIntegral :53 uses a monic polynomial over the base. Neither definition replaces the need to specify a common coefficient field. |
| NumberTheory/ModularForms/QExpansion.lean | cuspFunction :89, differentiableAt_cuspFunction :96, qExpansion :172. Its extension at zero chooses a limit when one exists; the Taylor-series interpretation needs periodicity, holomorphy and boundedness. |
| NumberTheory/ModularForms/DedekindEta.lean | eta :57, eta_ne_zero :114, logDeriv_eta_eq_E2 :166. |
| NumberTheory/ModularForms/Discriminant.lean | ModularForm.discriminant :50, discriminant_ne_zero :123, discriminant_qExpansion_coeff_one :212, CuspForm.discriminant :237. |
| NumberTheory/ModularForms/JacobiTheta/OneVariable.lean | jacobiTheta :29, jacobiTheta_T_sq_smul :37, jacobiTheta_S_smul :43. |
| NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean | jacobiTheta₂ :252, jacobiTheta₂_functional_equation :466. |
| NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean | EisensteinSeries.E2 :61. |
| NumberTheory/ModularForms/Derivative.lean | normalizedDerivOfComplex :39, serreDerivative :127, serreDerivativeMF :304; the last requires Γ contained in the integer modular group, as it is here. |
| NumberTheory/ModularForms/RamanujanFormula.lean | normalizedDerivOfComplex_E₂ :122. |
| Algebra/Group/Subgroup/Basic.lean; GroupTheory/Goursat.lean | normalCore :724; goursat_surjective :107, with its two surjective projections. |
| NumberTheory/Chebyshev.lean | theta_le_log4_mul_x :191, theta_ge :531, pi_ge :842. |
| Topology/Covering/Basic.lean; Analysis/Meromorphic/Basic.lean; LinearAlgebra/Semisimple.lean | IsCoveringMapOn :197, MeromorphicAt :36, Module.End.IsSemisimple :56. |
| Tau Ceti NumberTheory/ModularForms/Cusps/Basic.lean | TauCeti.Subgroup.integerCuspWidth :170 and integerCuspWidth_pos :176; finite relative index is used for positivity, and the width is strict. |
| Tau Ceti NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean; Parity.lean | Gamma_le_Gamma_of_dvd :177; char_neg_one_of_modFormCharSpace_ne_bot :136. |

Object searches also inspected Mathlib/RingTheory/PowerSeries/Substitution.lean:560–612: the generic compositional inverse already exists and supports the λ-specific specialization; the λ product and its analytic comparison do not. Searches for λ, weak forms, bounded denominators, Ihara and vector-valued forms in the pinned modular-form directories found no duplicate of a kept headline. Native theta-series vector inversion concerns lattice theta series, not arbitrary representations and integral components.

### Suppliers and ownership

Ran the required dependency command with --movable against the supplied ORDER.txt and content checkout. Exact output:

```
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citation resolver reports no missing roadmap citation or Lean name, but explicitly does not inspect the worker's pinned libraries; those were checked separately above.

Resolved cross-roadmap contracts anew at main or the supplied open heads. In the following table, file names denote README.md under the displayed roadmap folder. Line numbers are the file's lines, excluding the tool's identifying header.

| Supplier | Resolved sections / evidence |
|---|---|
| TauCetiRoadmap/ModularForms | Former-label map :329–349; parity and character input now routed to Tau Ceti; eta transformation §0.2; Layer 4 primitive associates; Layer 10 analytic curve. No noncongruence UDC target is owned there. |
| TauCetiRoadmap/FuchsianOrbifolds | Layer 2 item 3 :513 and item 5 :526, Layer 3 :563, compactification :604, degree theory :659, level-one quotient :901. The presentation, cusp Laurent criterion and function-field degree inputs are available under these labels. |
| TauCetiRoadmap/BelyiMaps | Layer 6 :2268, classification §6.3 :2473, deck maps :2630; Layer 9 :3294, function field :3495, degree :3581, algebraization :3694. |
| Completed/UniversalCovers | Stage 2 :98, lifting, subgroup correspondence and deck-group conventions. |
| Completed/ConformalMapping | Layer 4 :618; exact continuation/monodromy/reflection contracts :238–258. |
| TauCetiRoadmap/ConformalMappingPartII, now main | §§0.3 :191, 0.5 :203, 1.4 :319, 1.8 :367, 5.1 :698, 5.5 :734, 5.8 :752, 9.19 :1168. N≥2 is retained for the normalized covering; Γ-radius and integrated-growth normalizations agree. |
| TauCetiRoadmap/ModularCurvesPartII, #913 | §§5.13 :1904, 5.14 :1936, 6.3 :2168, 6.4 :2190, 6.5 :2212, 8.1 :2434, 11.4 :3036, 15.2 :3892, 15.3 :3914, 15.5 :3954, 15.6 :3986, 15.9 :4048, 15.10 :4070. Amalgam uses unsigned Γ(N), N≥3,p∤N; the enhanced character bound includes coefficient primes 2 and 3. |
| TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII, #1693 | §§4.1 :641, 4.2 :687, 4.3 :709, 4.4 :745, 4.5 :761, 4.6 :777, 4.7 :793, 4.8 :809. The rank theorem is on W; the nonintegral-coordinate example has extension degree 4 against e log(5/2)/log2<4. |
| TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights, #928 | §1.5 :226 and §2.9 :412; arbitrary positive congruence level and integer weight, including level-prime denominators. |
| TauCetiRoadmap/QSeriesPartitionsAndMockModularForms, #1391 | §8.1 :1170–1172 supplies the general exponential-growth carrier; §5.2 supplies the eta multiplier. The native predicates here specialize it to integral weight, projective representation and semisimple T. |
| TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic, #851 | §4.3; analytic triple-product specialization :1605 and qPochhammer/jacobiProduct :1607. |
| TauCetiRoadmap/AutomorphicGaloisRepresentations, #1007 | §4.2 :2503, temperedness at every finite place and bound at every embedding; classical weight k uses w=k−2. |
| TauCetiRoadmap/DiophantineApproximationAndTranscendence | §5.2 :3012, IsGFunction :3029; §5.3 :3078 and independent G-function solution theorem :3110. The extra global-nilpotence contract remains explicit. |
| TauCetiRoadmap/EtaleCohomologyFoundations | §F.0.2 :200, finite étale Galois categories and pointed fundamental group; its generality includes the schemes used here. |

The board package index was read before searching for owners. Its three listed packages concern analytic number theory, Lawrence–Venkatesh and logic/definability; none defines this package's modular objects. Ran roadmaps grep over main and the open heads for the objects, not just the nine identifiers. The overlap report lists no competing revision, dropped cited id or id available only in an open revision.

Closest-roadmap ownership comparisons: HalfIntegralWeightModularForms #1721, TauCetiRoadmap/HalfIntegralWeightModularForms/README.md:36–65 owns half-integral holomorphic spaces, theta/eta multipliers and Shimura theory; SiegelModularForms #1714, TauCetiRoadmap/SiegelModularForms/README.md:31–62 owns higher-genus holomorphic representations and Siegel Fourier theory; neither owns the λ covering, arithmetic holonomy field or integral-component theorem here. QSeries #1391 supplies the general carrier explicitly imported here. DAT-PartII #1693 owns the general holonomic ring and rank estimate, while this package owns its modular embedding, subject to R05. ModularCurvesPartII #913 owns the cohomological Ihara and integral-model inputs, not this package's nonabelian quotient-surjectivity theorem. NoncongruenceModularForms is now on main: its supplier contract at TauCetiRoadmap/NoncongruenceModularForms/README.md:300–308 imports this roadmap's design targets, and its permutation-level interpretation is distinct; this package does not cite it upward. No duplicate fully qualified declaration was found.

The three gap slugs agree between README lines 81,83,105 and design/plan.json lines 3442,3448,3454. All have named suppliers and concrete hypotheses. The rational twisted cusp is distinct from a fixed-pairing cyclotomic cusp; the full-level all-prime model is not the Γ₀(pⁿM), p>3 model in ModularCurvesPartII §11.4; the Bombieri–André/Katz chain is not supplied by the main Galochkin theorem alone. They are legitimate declared contracts, not unowned prerequisites. R04 concerns the additional model specification needed to apply the particular source theorem.

## Not verifiable

- Ihara1994, Theorem 1, pp.248–249 and §4, p.252: the manifest records it as settled uncertified; the legal text was unavailable. No request was repeated. The exact model hypotheses of its formal-rationality argument were not checked against that text.
- The full proof of §9.2 cannot be certified from CDT's short sketch alone. This is separate from the visible minimal-model mismatch R04, which can be checked directly in CDT25.
- The three declared supplier gaps remain future mathematical contracts. Their declarations, ownership and current supplier boundaries were checked; their eventual proofs were not claimed to exist.

## Source issues

The following were encountered and verified while reopening the relevant passages; these are source errors, not additional package findings. The package already corrects them except where the findings above say otherwise.

- **Misprint** in CDT25 at Proposition 3.0.1, printed page 650: the source says the uniform rank bound is CN³ log N; it should use log(2N) or restrict N≥2, since rank at N=1 is at least one; affects nothing.
- **Misprint** in CDT25 at (1.1.5) and (7.2.4), printed pages 631 and 688: the source describes θ₃² as weight one on Γ(2) without a character; it should include χ₋₄(d); affects nothing.
- **Misprint** in CDT25 at Theorem 4.3.2, proof, printed page 656: the source chooses the noncongruence function at the new level R₂Np; it should choose it in R₂N before applying Theorem 4.3.1; affects nothing.
- **Gap** in CDT25 at Theorem 4.3.2, proof, printed page 657: the source deduces the compositum degree from the intersection alone; it should justify linear disjointness using the Galois extension after complex base change; affects the proof.
- **Error** in CDT25 at §4.4 before Lemma 4.4.1, printed page 658: the source makes A-conjugation an automorphism of the Γ₀(p) intersection; it should map that intersection into the ambient signed principal group, with upper-right rather than lower-left divisibility; affects the proof.
- **Error** in CDT25 at §4.4 before Lemma 4.4.4, printed page 659: the source gives Γ(Np) as the signed-domain reduction kernel; it should use the unsigned domain Γ(N)∩Γ₀(p), or enlarge the kernel; affects the proof.
- **Gap** in CDT25 at Remark 6.3.2, printed page 686: the source applies UDC to coefficient traces without proving modularity of conjugate expansions there; it should first justify that coefficientwise conjugation preserves weak modularity; affects the proof.
- **Gap** in CDT25 at Theorem 7.3.3, proof, printed pages 690–691: the source assigns rank 6n to translates and assumes their continuation system irreducible; it should use the actual component continuation space and justify arithmetic descent without that assumption; affects the proof.
- **Error** in CDT25 at Corollary 7.3.4, printed page 691: the source concludes congruence of the whole representation kernel from integral components; it should assume the values span the representation, or conclude only on their span; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, proof, printed page 692: the source combines θ=(1/πi)d/dτ with θΔ=E₂Δ; it should read θΔ=2E₂Δ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, printed page 693: the source's second-kind integral formula has constant term −1; it should be (1−16x)K₀+8∫₀ˣK₀, with constant term +1; affects nothing.
- **Error** in CDT25 at the theta-monomial paragraph, printed page 693: the source allows Γ(12) for all even-total-degree theta monomials; it should choose a level killing each multiplier, since θ₂θ₃ changes sign under T¹²; affects the proof.
- **Error** in CDT25 at §7.4.8, printed page 695: the source asserts a finite deficient place whenever the representation kernel is noncongruence; it should require a noncongruence arithmetic component, since an invisible infinite-image summand supplies no witness; affects a stated result.
- **Misprint** in KSV10 at §3 after equation (1), arXiv v4 page 6: the source orders the conjugating factors as T′ then T′⁻¹; it should use T′⁻¹ then T′, giving [[2,1],[−1,0]] at a=2; affects nothing.
- **Misprint** in CDT25 at Lemma 4.1.7, printed page 654: the source uses the correcting diagonal diag(p,1/p); it should use diag(1/p,p), yielding the integral matrix with rows (a/p,b) and (c,pd); affects nothing.
- **Gap** in CDT25 at Lemma 4.2.3, proof, printed page 656: the source takes the core of stabilizers of a basis over the lambda field and asserts exact level; it should intersect with the signed principal group to fix lambda and force exact level; affects the proof.
- **Misprint** in CDT25 at (1.0.4), printed page 629: the source assigns lambda times one minus lambda to Gamma-zero of level two; it should use the theta group, since translation changes its leading q coefficient from 1 to minus 1; affects nothing.
