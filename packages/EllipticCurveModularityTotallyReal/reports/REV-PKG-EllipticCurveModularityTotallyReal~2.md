<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13499#issuecomment-6790520916 -->
Review (codex) of 1ec0429

Verdict: needs_changes

1. **F01** (P2) The base-change polynomial is outside the raw carrier's domain

   **Location:** `packages/EllipticCurveModularityTotallyReal/README.md:700–703`, particularly “at a place `v′|v` with `v ∉ S` its polynomial is the one whose roots are the `f(v′|v)`-th powers”.

   **Claim:** The raw restriction of `W_θ` has a stored good-place polynomial at every place above the original complement of S, including places ramified in the arbitrary finite extension `L′/L`.

   **Witness:** Supplier pull request #970, `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:1995,2010`: the raw carrier stores good-place polynomials and restriction enlarges S by ramified places. For `L=ℚ`, choose an odd good prime `q∉S`; `L′=ℚ(√q)` has `e=2,f=1` there.

   The place above q belongs to the restricted carrier's bad set even though the original member is unramified there. Consequently the quoted clause refers to a raw polynomial outside its specified domain. Its right side is perfectly meaningful, with roots α and β because f=1. The failure is the missing domain condition on its left side, not a failure of the Frobenius power rule. Such q always exists because S is finite. This checks the new clause on a ramified extension, which the new inert/unramified restriction Check does not test.

   **Exact repair:** In that API bullet name the restricted raw bad set `S_res`, as supplied by §5.0d. Keep the member identification. Replace the polynomial sentence with:

   > For `v′ ∉ S_res` above v, the stored polynomial has roots α raised to `f(v′|v)` and β raised to `f(v′|v)`, where α and β are the roots of `P_{θ,v}`. More generally, for every `v ∉ S` and every `v′|v`, including ramified v′, the restricted members away from the residue characteristic are unramified at v′ and their Frobenius characteristic polynomial has those roots. This latter statement concerns the members even when v′ lies in `S_res`.

   Add a Check distinguishing these two assertions. Tested on the witness: for `ℚ(√q)/ℚ` at q, `e=2`, `f=1`, and `q_{v′}=q`; the member polynomial stays `X²−aX+q`, while no stored good-place polynomial is requested at the excluded place. In the numerical setup already used at README:719–725, replacing the extension by `ℚ(√5)/ℚ` gives the member polynomial `X²−2X+5`, whereas `ℚ(√−3)/ℚ` gives `X²+6X+25` because f=2. Both formulas remain available. Do not change the supplier's restriction operation or narrow the roadmap to unramified extensions.

   The other new restriction clause, README:691–696, does not have this problem: `M/L` is unramified away from primes dividing n, and those primes already belong to S.

One P2 finding, concerning the domain of a polynomial in the newly added base-change API. The member-level Frobenius formula is correct; its identification with stored raw-system data needs a qualification. No change to either Lean headline is requested.

## Previous findings

All four findings of the previous review were checked against the repair report and the resulting text before the new pass.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, missing API for the packaged system | Repaired | README:683 now introduces an API with members, restriction, reflection, base change and duality. README:685 says “the member of `W_θ` at a place λ of `M₀` above ℓ is the θ-eigenspace”. The missing block is present. Its new base-change clause has the separate defect R01 below. |
| F02, wrong explanation of nonvanishing | Repaired | README:1116 says “it vanishes modulo 3 only if the reduction of λ is 1”. The factorization is `c=−(λ−1)²/λ`; order prime to 3 survives reduction. Computed `ord₁₀₁(3)=100` and `ord₇(3)=6`. The regular-word bound is now distinguished from nonvanishing. |
| F03, page of LeHung26 §3.3 | Repaired | README:1105 says “§3.3, p.6”; README:1410 also says “§3.3, p.6”. LeHung26 lines 226 and 262 delimit page 6, and lines 250–260 contain §3.3. No remaining “pp.6–7” citation to this section. |
| F04, reused character symbols | Repaired | README:1275 says “`H¹(E)\|G_{KT} = ξ_ι ⊕ ξ^c_ι` for an algebraic Hecke character ξ”. The CM paragraph and its examples consistently use ξ; the finite determinant character in §2.2 is ν. The new inverse/dual normalization was also checked against the CM supplier. |

Here and below, unqualified README line numbers refer to `packages/EllipticCurveModularityTotallyReal/README.md`. No earlier finding was marked not actionable, and R01 is not a re-raised finding.

## Verified sound

### Scope, principles and shape

Read all 18 numbered sections, all convention witnesses, the five definition/API blocks, all 18 Checks blocks, all four layer Examples and Dependencies sections, and the scope and supplier contracts. For unchanged material, the preceding review's computed rows were used as prior evidence and compared with the text; the fifteen seeded sections, both Lean headlines and every repaired passage were inspected again. Additional calculations below cover the new API and the earlier rows that recorded only dependency conclusions.

The four layers are forced by the mathematics: the twisted representations precede their lifting applications; the seed and irreducibility statements precede the three lifts; descent and comparison follow those lifts. There is no assertion that the roadmap follows a source's organization and no source-chapter layer name. The three main-branch shape comparisons read were `TauCetiRoadmap/ModularCurves/README.md`, `TauCetiRoadmap/EllipticCurves/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md`; the explicit house rules in this brief were applied where older documents differ.

Layer 1 retains arbitrary number fields and odd n, with the separate even-n field headline. The lifting application retains arbitrary abelian varieties and rank-two idempotent summands. The switch retains arbitrary number fields. The endpoint includes CM curves, every degree of totally real base and all finite places, including places dividing the coefficient prime. Rank zero, singular cubic models and characteristic-p bases are excluded by actual hypotheses, not conventions that disappear from Lean. The finite exceptional prime set is a tool for proving the universal endpoint, not a restriction on that endpoint.

No algorithm, copied source passage, sorry'd data, `set_option`, admitted example, extra API theorem or route-specific endpoint was found. The author files contain no job identifiers, pull-request numbers, machine paths or hand-off notes. Reference publication dates and revision identifiers identify the source versions. The five constructed Layer 1 objects each have an API and at least three discriminating Checks. Every numbered theorem has hypotheses, a locator and a Needs line. The only own Lean identifiers promised by the prose are the two declared headlines; mathematical notation such as `W_θ` is not presented as an additional Lean declaration.

### Adversarial calculations

The table records evaluated values, rather than treating successful elaboration as evidence of truth. “Keep” means no repair beyond R01. Field, characteristic, rank and invertibility exclusions were checked at each use. The curve point counts and finite group orders below were independently enumerated in scratch; the formulas and representation computations were checked directly.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Conventions: geometric Frobenius and half-shift | 11a1, q=3 | `α+β=−1`, `αβ=3`; normalized roots have product 1; the shifted denominator is `1+3^(−s)+3^(1−2s)`. Opposite shift gives `1+3^(−s−1)+3^(−2s−1)`. | Keep. |
| Conventions: twist sign | `y²=x³−x+1` over `𝔽₅`, twist by 2 | Original has 8 points, trace −2; `y²=3(x³−x+1)` has 4 points, trace 2; `(2/5)(−2)=2`. | Keep. |
| Conventions: inverse cocycle | Cubic twist, `b³=2`, `g(b)=ζ₃b` | `φ*ω=bω′`; transported scalar is ζ₃. Inverse-cocycle pullback gives ζ₃, uninverted pullback ζ₃⁻¹, unequal. | Keep. |
| §1.1 field headline | k=ℚ, n=3,4,6; k=ℚ(√2), n=8; k=ℚ(√5), n=5 | Real generators are −1,0,1,√2,`(−1+√5)/2`; respectively L=ℚ,ℚ,ℚ,k,k and `[M:L]=2` in each case. | Matches Lean; keep. |
| §1.1 general field data and boundary | n=1,2,9,15; k=ℚ(i), n=3 | n=1,2 gives `[M:L]=1`; n=9 satisfies `x³−3x=−1` and real degree 3; n=15 gives degree 4. For k=ℚ(i), L=k while maximal real subfield of M is ℚ(√3). | The totally real and n>2 hypotheses do real work. |
| §1.1 divisor and cyclotomic adjoining | n=3p, ℓ=3 or p; d=1 negative control | Nonreal `ζ_ℓ` generates the quadratic M/L, hence `L(μ_ℓ)=M`. At c, δ=−1 but the d=1 character is +1. | Divisor API correctly requires d≥3. |
| §1.2 twist and descended maps | `R=(0,−1;1,−1)`, `W=(0,1;1,0)` | `R²=(−1,1;−1,0)`, `R³=I`, `WRW=R²`, `WR⁻¹W=R`; a rotation conjugating R⁻¹ leaves R⁻¹. | Reflection makes rotations rational; a rotation twist does not. |
| §1.2 genus and quotient domain | n=5 with forced cubic; n=15, m=3 | Branch counts 4 versus 2 give `2g−2=8` versus 4, so g=5 versus 3. For legal m dividing odd n, `2g−2=2(m−1)`. | The cubic clause needs 3 dividing n, as stated. |
| §1.3 eigenspace and idempotent | n=3, trivial and order-three θ | `dim H¹=6=2+2+2`; character sum yields projector eigenvalue 1 on θ and 0 on other labels. Induction across quadratic M/L has rank 4, versus descended rank 2. | Excludes induction and a rank-one trivial piece. |
| §1.3 scalar and quotient operations | `d|n`, characteristic-zero coefficients | Pullback followed by norm is multiplication by n/d, nonzero even at ℓ dividing n/d after rationalization. Over M=L, induction has rank 2, not 4. | Keep rational qualification. |
| §1.4 alternating pairing | θ of order 3; x,y in its eigenspace | Ordinary self-pairing is 0; insertion of w yields `[y,x]=−[x,y]`; target is `ℚ̄_ℓ(−1)`, determinant `ε⁻¹`, value −1 at c. | Keep. |
| §1.4 determinant, weights, good polynomials | θ=1, good norm 5 | `det(H¹(B)⊗δ)=ε⁻¹δ²=ε⁻¹`; weights `{0,1}` sum to 1, constant term 5. Candidate `{0,2}` sums to 2 and fails; ε would give geometric determinant 1/5. | Keep; potential semistability follows from abelian H¹. |
| §1.4 new coefficient-member API | `j′=σj`, order-three character | `u*(1⊗σ)x=σ(jθ(u))(1⊗σ)x=j′θ(u)(1⊗σ)x`; the eigenvalue changes from ζ₃ to ζ₃² when σ conjugates them. | Semilinear, not falsely linear over a fixed embedded completion. |
| §1.4 new restriction-to-M API and Check | n=3, inert 5, the stated reduction of B | Original B trace −2; δ=−1 gives W trace 2 and roots `1±2i`. Squaring gives `−3±4i`, trace −6, determinant 25. Direct count over `𝔽₂₅` gives 32 points, `26−32=−6`. | Keep. No equality of raw bad sets is claimed. |
| §1.4 new reflection API | θ of order 3 | `u*w*x=w*u⁻¹*x=θ(u)⁻¹w*x`; rank remains 2, and both members' traces and determinants coincide under this intertwiner. | Keep. |
| §1.4 new arbitrary base-change API | q good, `ℚ(√q)/ℚ` | `e=2`, `f=1`, member roots remain α,β and determinant q; the raw bad-set membership is true and the stored good-place index is absent. | R01: distinguish stored data from member polynomial. |
| §1.4 new duality API | q=5, roots `−1±2i` | `1/(−1+2i)=(−1−2i)/5`; dual roots equal the original root multiset divided by 5. Dual weights `{0,−1}` equal `{0,1}−1`. | Keep. |
| §1.5 lattice, reduction and coefficient ring | n=3p, ℓ=3 or p | Evaluating `O[μ_n]²` gives `O²`, hence rank 2; `v₃(1/3)=−1` whereas character values have valuation 0. At p: ψ̄=1 and χ̄=η̄; at 3: η̄=1 and χ̄=ψ̄. | All four displayed congruences follow; no integral projector used. |
| §1.5 unequal labels and action | `k′=k(μ₁₅,J[3])`; nontrivial δ and θ | Over k′, J[3] and μ₃ are trivial Galois modules, so both evaluated reductions are trivial `κ²` despite unequal labels. Before twisting, δ=−1 sends θ to θ⁻¹, different for nontrivial odd-order θ. | Checks distinguish sufficient congruence from a converse. |
| §1.6 elliptic endpoints | n=3 and n=45,d=3 | Reflection invariants have dimension `0+2=2`; pullback/norm scalar is `45/3=15`; quadratic signs square to 1. | Rational endpoint identification and twist removal correct. |
| §2.1 change of prime | Semisimple sum and nonsplit extension; 11a1 | Both extensions of 1 and ε⁻¹ have polynomial `(X−1)(X−q)`; one splits, one does not. The actual elliptic polynomial at 3 is `X²+X+3` for every ℓ≠3. | Semisimplicity is explicit; recognition applies. |
| §2.2 lifting domain | ℓ=2,3,5; Tate-curve local type | At c, −1 becomes 1 modulo 2 but 2 modulo 3. Tate-curve monodromy has rank 1, unlike potentially Barsotti–Tate N=0. | ℓ=2 excluded; mixed and potentially multiplicative places retained. |
| §2.2 five-adic alternative | `a²=3`, `B=(0,2;1,0)`, C=aB over `𝔽₂₅` | `B²=2I`; `C²=6I=I`; `det C=4` is a square in `𝔽₅`, but `det B=3` is not. Eigenvalues of C are 1,−1. | A genuine `𝔽₅`-model, not just determinant values in `𝔽₅`, is required. |
| §2.2 exceptional projective case | Projective image A₅ and cyclotomic determinant | Its determinant square class is trivial, forcing √5 in F. Then `[F(ζ₅):F]=2`; A₅ of order 60 has no quotient of order 2. | FLHS argument applies also to the inverse cyclotomic determinant. |
| §2.3 switch headline | K containing ζ₃ versus K=ℚ; identity and ×2 on five-torsion | Geometric monodromy has order 24. Frame cover has two geometric components of degree 24; arithmetic image has order 24 or 48. On the Weil pairing, ×2 has exponent 4 versus identity exponent 1. | Lean expresses the full condition, and bases exist. |
| §2.3 infinitude and subgroup test | SL₂ versus Borel/Cartan normalizers | Orders 24 versus 12,8,16; 24 divides none of the latter. Finite j-fibres have bounded finite cardinality, so an infinite Hilbert subset cannot have finite j-image. | Deep theorem, not an identity or Check encoded in Lean. |
| §2.4 mod-three seed | Derived series of GL₂(𝔽₃) | Independently computed group sizes `48→24→8→2→1`; quotient orders `2,3,4,2`. Odd determinant at c is 2, not 1. | Solvability and total oddness feed the declared cohomological-weight contract. |
| §2.5 mod-five seed | E′ with SL₂(𝔽₃); generic five-image; rational five-torsion | Line stabilizers have orders 6 or at most 4, less than 24. `GL₂(𝔽₅)` has order 480, determinant kernel 120, projective kernel image 60. Rational five-torsion gives an invariant line. | Absolute irreducibility checked; second five-adic alternative is necessary. |
| §3.1 simultaneous parameter and repaired Check | Cube roots; p=101,7,13 in characteristic 3 | At order 3, c=3. Orders of 3 modulo 101,7,13 are 100,6,3. Thus c≠0 for all three prime-to-3 orders, while the degree≤4 regular-word exclusion cannot use p=13. | Nonvanishing and regular-word reasoning now correctly separated. |
| §3.1 cyclotomic groups | n=3p over totally real K | `[M:L]=2`, `L(ζ₃)=L(ζ_p)=M`; at 5, `G_{M(ζ₅)}⊆G_{L(ζ₅)}`. An invariant line for the larger group would give the identical line for the smaller. | Imported all-character irreducibility implies each requested condition. |
| §3.2 auxiliary seed | η and η⁻¹ | Both order-three pieces have dimension 2 and identify with the same H¹(A); seed prime 5 differs from 3 and p. | §2.5 applies over L, then §2.1 supplies every coefficient prime. |
| §3.3 three lifts | Rows at p,3,p | Residual labels are respectively η̄=χ̄, χ̄=ψ̄, ψ̄=1; each target has dimension 2, determinant ε⁻¹ and weights `{0,1}`. Irreducibility groups are G_M in all three rows. | Each row supplies precisely the inputs of §2.2; no five-adic exception in the rows. |
| §4.1 descent | Quadratic descent step; induced negative control | Two extensions differ by values ±1 of the quadratic character; selecting the prescribed representation fixes that ambiguity. An induced rank-two representation restricts to `χ⊕χᶜ`, hence is reducible, unlike the actual residual-irreducible restriction. | Soluble descent contract applies. |
| §4.2 all-place comparison | 11a1 at 11; `y²=x³−x+1` at 23; CM curve at 2 | Split multiplicative: conductor exponent 1 and factor `(1−11^(−s))⁻¹`, N rank 1. At 23: Δ=−368, c₄=48; 5 is nonsquare mod 23, norm after base change 529, split reduction. At 2 for `y²=x³−x`: exponent 5, factor 1. | Good-only or semisimple-Weil-only models fail these controls. |
| §4.2 infinity and rationality | Weight two, trivial central character | `Γ_ℂ((s−1/2)+1/2)=Γ_ℂ(s)`; determinant ratio `ε⁻¹/ε⁻¹=1`; integral Hecke polynomial coefficients `t_v=a_v∈ℤ`, `s_v=1`. | Normalizations agree with Hilbert suppliers. |
| §4.3 CM normalization and induction | Gaussian curve at 3,5; Eisenstein curve at 5 | Counts 4,8,6 give traces 0,−2,0. `(-1+2i)+(-1−2i)=−2`, product 5. Tate arithmetic value ξ(v) becomes the same H¹ geometric value after dualization. | New ξ notation and inverse-avatar explanation are consistent. |
| §4.3 endomorphism field | `[i](x,y)=(−x,iy)`; characteristic 2,3 controls | `[i]*ω=iω`; conjugation gives −i. Kernel is `G_{ℚ(i)}`, or `G_{ℚ(ζ₈)}` over ℚ(√2). Frobenius gives `d(x²)=0`, `d(x³)=0` although degree is 2 or 3. | Declared contract correctly requires characteristic zero. |
| §4.4 endpoint and worked examples | Non-CM curve, CM curve, everywhere-good case, p=101 | `j=−6912/23` is nonintegral; Gaussian j=1728 is CM. If every conductor exponent is 0, their product is `(1)`. `φ(303)/2=100`. | Branches exhaust all elliptic curves over totally real fields; no degree or √5 exclusion. |

### Source sample and manifest

All nine works recorded in `sources.toml` were accessible in the supplied legal cache. No author locator was marked unverified, no entry needed adding, and no manifest entry was rewritten. Preprint pagination was checked as preprint pagination; journal equivalence is not claimed. The mathematical extensions beyond a source's stated scope are supplied by the named general roadmap target or proved in the package, rather than silently attributed to the source.

| Sampled target(s) | Source text opened | What was verified |
|---|---|---|
| §1.1 | LeHung26 line 237, §3.2 p.6 | The source's n=3p totally real field statement; the elementary general-n/base argument is explicitly the package's extension. |
| §§1.2–1.3 | LeHung26 lines 237–246, Lemma 3.2 and (9), p.6 | Reflection cocycle, rational rotations and eigenspaces; the general tower is imported. |
| §1.4 | LeHung26 lines 241–248, p.6; OpenAI26 lines 480–514, Proposition 5.1, pp.12–13 | Rank, alternating reflection pairing, determinant, weights, semisimplicity and common polynomials. The added API follows from these constructions; R01 concerns its carrier interface. |
| §1.5 | LeHung26 lines 243–247, (10), p.6; OpenAI26 lines 547–578, Lemma 5.3 and Corollary 5.4, pp.13–14 | Integral regular-module evaluation, reduction at primes dividing n and rational endpoint comparisons after semisimplification. |
| §2.2 | LeHung26 lines 231–235, Proposition 3.1, p.6; FLHS15 lines 116–120 and 221–265, Theorem 2 and §2, pp.3,5–6; BD14 lines 2144–2172, Théorème 3.2.2, pp.36–37 | Le Hung excludes 5; package's five-adic extension is expressly a supplier contract. BD's local prescriptions and universal modularity conclusion, and FLHS's projective-kernel argument, support the contract with the stated determinant and model conditions. |
| §2.3 | FLHS15 lines 421–452, Lemma 6.1 and proof, p.10 | Arbitrary number field, symplectic five-torsion twist, rational point on genus-zero completion, and Hilbert exclusion of smaller three-images. Infinitude is justified by the package's finite-fibre argument. |
| §2.4 | FLHS15 lines 343–357, Proposition 4.1/Lemma 4.2, p.8; lines 404–412, Theorem 6/Corollary 5.1, p.9 | Cyclotomic determinant kernel, solvable mod-three input and the elliptic seed. General cohomological-weight residual modularity is declared separately. |
| §2.5 | FLHS15 lines 127–128, Theorem 3 p.3; lines 426–429, p.10 | Five-seed proof via the switch, three-seed and modularity lifting. |
| §3.1 | LeHung26 lines 250–260, §3.3 p.6; OpenAI26 lines 990–1025, Proposition 8.4 pp.23–24 | Joint finite-quotient specialization and residual conditions. OpenAI's displayed two-factor argument is imaginary quadratic; the arbitrary-number-field extension is explicitly owned by EllipticCurveModularityImaginaryQuadratic §7.4. |
| §§3.2–3.3 | LeHung26 lines 264–271, §3.4 p.7; FLHS15 line 127 | Seed over L and the exact p,3,p table. |
| §4.2 | LeHung26 lines 361–363, §5 p.9; FLHS15 lines 66–77, §1 p.2 | Global comparison and normalization; the detailed coefficient-prime/local/conductor statements use the resolved Hilbert and local suppliers. |
| §4.3 | LeHung26 lines 364–366, §5 p.9; OpenAI26 lines 1200–1225, §9.4 pp.27–28 | Endomorphism field, split characters, induction versus isobaric branch, central character and normalization. |
| §4.4 | LeHung26 lines 86–93, Theorem 1.1 p.2; FLHS15 lines 87–88; BCDT01 line 15 | The endpoint is conditional on geometric inputs in the source; this roadmap imports those as targets. Rational and real-quadratic specializations agree. |

Also opened the auxiliary lifting-source locators: BLGG12 Theorem 6.1.5 at lines 2024–2052, pp.41–42, and Theorem 6.1.8 at lines 2198–2223, p.45; BLGG13II Theorem 2.1.2 at lines 82–116, pp.2–3, Theorem 3.1.1 and its proof at lines 122–145, p.3, and Theorem 3.1.2 at lines 149–159, p.4; Kisin09 Theorem (3.5.5) at lines 3976–4004, printed p.1170; SW99 Theorems A and B at lines 2468–2505, printed pp.74–75. Their hypotheses are not substituted for the stronger declared contract. In particular, the BLGG13II proof is not claimed to establish arbitrary-p cohomological-weight residual modularity over the original field.

### Lean headlines, binders, padding and pins

The README headlines are: the relative totally real cyclotomic field theorem; reflection descent and the descended systems/lattices/endpoints; change of coefficient prime; summand lifting; the 3–5 switch; the two residual seeds; simultaneous specialization and three lifts; non-CM descent; all-place comparison; CM induction; and the final totally real modularity theorem.

`Suggested.lean:58` states the field theorem and `Suggested.lean:80` states the infinite 3–5 switch. The module docstring explicitly identifies every other group above and its missing carriers: higher-genus étale H¹ and the covers, the compatible-system carrier, Hilbert automorphic representations/attachment, local Langlands/Weil–Deligne objects, or automorphic induction. Searches by object in the pinned libraries found no native Hilbert attachment or higher-genus étale H¹ that would make those other headlines statable. Classical modular forms and elliptic torsion alone do not make them statable. No substitute predicate or invented carrier is used.

Ran `lake env lean` on the package file from the pinned content checkout: exit 0, exactly two warnings, both `declaration uses sorry`, at lines 58 and 80. All three imported Tau Ceti objects were already built. Ran a scratch copy with `#check @` for both declarations: exit 0 and the same two warnings. The field signature retains both NumberField instances, total reality of k, the algebra, `2<n`, the cyclotomic-extension instance and primitivity of ζ. The switch retains NumberField K, decidable equality on its algebraic closure, ellipticity of W and existential ellipticity of W′. Its torsion action is the native additive action, its pairing values have the same native roots-of-unity type, and its universal basis quantifier is nonvacuous by the pinned basis-existence theorem. No lost binder or README/Lean generality mismatch.

For each of the two sorry'd theorems, a scratch copy tried `simp`, `rfl`, `infer_instance` and `exact?`, with `solve` requiring each branch to close the entire goal. All eight attempts failed to close a declaration. Read the nearby library results as well: the absolute rational cyclotomic CM theorem does not prove the relative field equality, and none of the torsion/pairing declarations supplies the arithmetic existence and infinitude in the switch. Neither theorem is padding. No edit to `Suggested.lean` is requested.

The pins agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Declarations inspected at those pins include:

| Pinned file | Names and lines; relevant content |
|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | `IsTotallyReal`:48, `maximalRealSubfield`:126, `IsTotallyReal.le_maximalRealSubfield`:140, `isTotallyReal_maximalRealSubfield`:157, `IsTotallyComplex`:210. The real subfield consists of elements real under every complex embedding, not merely one embedding. |
| `Mathlib/NumberTheory/NumberField/CMField.lean` | `IsCMField`:70 contains total complexity and quadraticity over the maximal real subfield; `CMExtension.eq_maximalRealSubfield`:456, `IsCMField.ofCMExtension`:510; `IsCyclotomicExtension.Rat.isCMField`:564 is over ℚ. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean` | `IsCyclotomicExtension`:74 includes existence of primitive roots and generation by the roots; it is not merely containment of roots. |
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | `IsPrimitiveRoot`:63 has `pow_eq_one` and the divisibility converse. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean` | `IntermediateField.adjoin`:34 is the subfield closure of the algebra-map image and the specified set. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | `WeierstrassCurve`:76; `IsElliptic`:366 requires unit discriminant; `j`:388 is the inverse discriminant unit times c₄ cubed. |
| `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean` | `AlgebraicClosure`:127, the actual algebraic closure carrier. |
| `Mathlib/LinearAlgebra/Basis/Defs.lean`; `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | `Module.Basis`:89, `Basis.equivFun`:222; `Matrix.SpecialLinearGroup`:70 is the determinant-one subtype. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` | `WeierstrassCurve.torsionGaloisAction`:77 acts on the actual torsion subgroup by additive automorphisms. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean` | `TauCeti.Isogeny.pointTorsionModule`:51; `WeierstrassCurve.nonempty_basis_torsionBy`:149, with separably closed field and invertible nonzero N. The algebraic closure in characteristic zero meets these hypotheses for 3 and 5. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean`; `WeilPairing/Galois.lean` in the same directory | `TauCeti.Isogeny.weilPairing`:225 takes values in `Additive (rootsOfUnity N F)`; `WeierstrassCurve.weilPairing_torsionGaloisAction`:104 gives its genuine Galois equivariance. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`; `TateModule/Determinant.lean` | `WeierstrassCurve.tateModuleGaloisRepresentation`:80; `TauCeti.det_tateModuleGaloisRepresentation`:52, under prime invertibility in a separably closed extension. This is the covariant determinant ε, dualized in the README. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean` | `quadraticTwistOf`:164, `quadraticTwist`:469, `quadraticTwistPointEquiv`:824, and `quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`:945. The latter really includes the quadratic sign. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean` | `pullbackDifferential`:79, `pullbackDifferential_comp`:102, `pullbackDifferential_add_invariantDifferential`:137. Composition reverses and addition acts additively on invariant differentials; these do not alone state the whole CM field-of-definition contract. |

### Supplier order, drift, gaps and ownership

Dependency-check output:

```text
depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line was read. No forbidden supplier is used. The HilbertModularForms citation in §4.4 is a downstream interface comparison, not an upward input to the theorem.

The current citation resolver reports no unresolved roadmap citation and no unresolved roadmap Lean name. Its run expressly did not check local library pins, so the pin inspection above was performed separately. The original three leads were resolved in `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`: `GaloisRep.IsOdd` at line 3144, `GaloisRep.iso_of_frobenius_charpoly_eq` at line 3528, and `TateModule.residualRep` at line 4065. They are supplier roadmap targets, not claimed pinned declarations.

The following citations were resolved in the supplied main checkout or the indexed current open heads, including the exact content used, rather than just matching roadmap names:

| Supplier | Resolved input |
|---|---|
| EllipticCurveModularityImaginaryQuadratic | §§0.2–0.3 fixed-pairing twists, `SymplecticTorsionEquiv` and comparison; §§1.1–1.3 parameter/covers; §3.1 integral regular module; §§4.1–4.4 character systems, quotient endpoints, lattices and congruences; §5.1 non-CM large primes; §§7.1,7.2,7.4 residual specialization; §§8.1,8.5,8.6 as comparison variants. §4.1 explicitly permits arbitrary number fields; §7.4 explicitly extends the two-factor source proof to d factors and retains the normal-closure prime hypothesis. |
| AutomorphicGaloisRepresentations | §§3.10,3.13,3.14 Hilbert attachment, geometric characters, determinant/oddness/irreducibility; §§4.4,4.7 full local comparison away from and at the coefficient prime. |
| AutomorphicGaloisRepresentationsPartII | AG2.0 attachment, geometric Artin character avatars and twist/dual rules; AG2.P weak predicate and “Independent classical and Hilbert members”. The common polynomial is `X²−t_vX+q_vs_v`. |
| PotentialAutomorphyInfrastructure | §2.3(2), `soluble_base_change_and_descent`: continuous representation with irreducible restriction over a finite soluble Galois extension; arbitrary totally real base and weight-zero specialization. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2.13 archimedean cases, R16.3.2 Steinberg, R16.3.5 conductor, R16.3.6 archimedean factors, R16.4.4 strong multiplicity one, R16.6.3–4 weight conversion, R17.4.16 quadratic induction; R17.5.14 supplies weight one only. |
| ArithmeticGaloisRepresentations | Layers 1–3 representation/lattice/WD/conductor operations; §§4.1,5.3,6.1–6.2 oddness, semisimple recognition and elliptic torsion/determinant. |
| InverseGaloisAndArithmeticFundamentalGroups; ModularCurvesPartII | IG.2.4, IG.2.6, IG.2.7 Hilbert subsets, group specialization and approximation; §4.10 geometric connectedness of fixed-pairing full level. Integrality over K, not geometric integrality of the whole frame torsor, is what the switch uses. |
| ModularCurves; EllipticCurves; JacobianChallenge | §0E effective polarized-curve descent and Layers 3/5B level structure; Layers 0.5/1/4.5a/5 curve morphisms, models and twists; Layers D–F Pic⁰/Jacobian, including unpointed curves. |
| SmallRamificationAndAbelianVarietyBaseCases; PotentialModularityAndCompatibleSystems | §5.0d raw arbitrary-field positive-rank carrier and operations; §§1.1,1.6 weak-family comparison and automorphy predicate. The bad-set operation is the witness for R01. |
| AbelianSchemesAndArithmeticModuli; NeronModelsAndSemistableAbelianVarieties | A4.1 Tate module; A6/A6.11 endomorphism realizations and integer characteristic polynomials; §§3.10,5.1,5.3,5.6,6.10 semistable reduction, good-reduction criterion, p-adic comparison, Euler polynomials and compatible systems. |
| FaltingsFinitenessAndIsogenyTheorems; EtaleCohomologyFoundations | R28.4 semisimplicity; §0.11 curve trace/duality, with the supplier's adic realization, giving the rational curve pairing. |
| ShimuraVarieties; ComplexMultiplicationAndExplicitReciprocity | §5.3 complex CM algebra action; §4.1 the two named Hecke-character/Tate-component paragraphs. The latter uses `r(χ⁻¹)` for covariant Tate components, precisely the inverse corrected in §4.3. §1.1's rational elliptic use does not state the general endomorphism-field theorem. |
| GL2ModularityLifting | §§5.7,5.10 retain the potentially Barsotti–Tate, residual/component and residue-field conditions listed by the package; they do not already supply the declared unrestricted weight-two contract. |
| HilbertModularForms | §11.3 explicitly asks for exact conductor, all local factors and a base-field modularity witness, and names real-quadratic existence. §4.4 supplies the broader existence input without redeclaring its newform interface. |

All three declared gaps have identical slugs in `design/plan.json` and the required supplier subsections, with named owners and precise hypotheses:

- `totally-real-weight-two-lifting`: universal potentially semistable weight-two lifting, including the specified `𝔽₅`-model alternative. Existing potentially Barsotti–Tate or rational-field statements do not supply it.
- `totally-real-solvable-residual-cohomological-weight`: R17.5.14 stops at parallel weight one. The contract asks for a cohomological residual witness and does not disguise the return from an auxiliary extension as an established theorem.
- `cm-elliptic-endomorphism-field`: the characteristic-zero differential embedding and Galois-equivariant field-of-definition criterion. Existing pointwise differential operations and CM characters with base-defined action do not already give this theorem.

These are minimal supplier contracts, not unowned prerequisites and not findings. A future acceptance would remain conditional on them; this needs-changes verdict is due solely to R01.

Read the board-package index before ownership searches. The indexed three other board packages are unrelated to these objects. Object searches with `roadmaps grep` covered reflection, symplectic torsion, cyclotomic subfields, totally real modularity and the shared compatible-system carrier; `roadmaps show` supplied the relevant heads. The overlap report has no competing edit to this roadmap, dropped cited id or revision-only id. Its five nearest roadmaps were compared by scope and ownership: #1048 supplies the arbitrary-field geometry and owns the CM-base branch; #1036 owns GL₂-type varieties over ℚ and ℚ-curves; #1484 owns the wild 3-adic rational-base extension; #1075 owns potential-modularity infrastructure; #1746 owns abelian-surface modularity. None owns the package's descended reflection systems or its universal totally real endpoint. The relative field result extends, rather than repeats, the rational cyclotomic facts. The switch imports the existing fixed-pairing moduli object and proves a new arithmetic infinitude statement on it. No duplicate fully qualified Lean headline was found.

## Not verifiable

- The three supplier gaps are declared contracts, not completed supplier theorems. Their promised delivery cannot be certified from the current heads; this is permitted by the review contract and is not the reason for the verdict.
- The journal pagination of works cited explicitly by preprint version was not independently substituted or certified. The version-specific pagination actually claimed by the package was checked.
- Ownership was checked by object searches across the indexed open heads and by reading relevant scopes and targets, not by auditing every statement of all 439 open pull requests. No additional open head was sought outside the supplied index.

No required source text was inaccessible, and no missing-reference request is pending.

## Source issues

- **Misprint** in LeHung26 at §3.1, introduction to Proposition 3.1, p.6 (LeHung26 line 230): the source says the lifting proposition uses Freitas–Le Hung–Siksek Theorem 3; it should be Theorem 2, the modularity lifting theorem; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1ec0429381d23f171943916a9c2faa0384417e5f", "job": "REV-PKG-EllipticCurveModularityTotallyReal~2", "model": "gpt-6-astra", "worker": "chris-9"} -->
