<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12848#issuecomment-6788847546 -->
Review (codex) of bffb5cf

Verdict: accepted
Conditional on the announced gaps: `totally-real-weight-two-lifting`, `totally-real-solvable-residual-cohomological-weight`, `cm-elliptic-endomorphism-field`

No findings. Acceptance is conditional on the three declared supplier contracts:
`totally-real-weight-two-lifting`, `totally-real-solvable-residual-cohomological-weight`, and
`cm-elliptic-endomorphism-field`. This is design acceptance, not certification of a Lean package.
The design, plan and sources manifest were not changed.

## Previous findings, checked first

Locations below are in `packages/EllipticCurveModularityTotallyReal/design/README.md` unless otherwise stated.
All three findings in the round-three review were actionable; none was marked not actionable by the repair report.

| Previous finding | Repaired passage | Status and independently verified witness |
|---|---|---|
| F01 (P1), inverse cocycle on cohomology | Lines 151–153: “on `H¹(X)` by `(a_g⁻¹)^* ∘ ρ(g)`”; lines 518–519: “`a_g = w^{e(g)}` is its own inverse.” | **Repaired.** From `ᵍφ=a_g⁻¹φ`, pullback reverses composition and gives `ρ_X′(g)φ*=φ*(a_g⁻¹)*ρ_X(g)`. In the added cubic example, `φ*ω=bω′`, `g(b)/b=ζ₃`: transport and the corrected rule both give ζ₃, whereas the old rule gives ζ₃⁻¹. The reflection formula is unchanged because w²=1. Plan §1.2 includes the same test. |
| F02 (P3), induction across the trivial extension | Lines 587–592: “of rank `2[M:L]`”; “When δ is nontrivial”; “`M = L` … the induction is `V_θ = W_θ` itself”. | **Repaired.** At k=ℚ,n=3 the rank is 2·2=4 and `Ind 1=1⊕δ`. At k=ℚ(√−3),n=3 it is 2·1=2 and `Ind 1=1`; the rejected double copy has rank 4. Plan §1.3 makes the identical distinction. |
| F03 (P2), different labels versus nonisomorphic residual representations | Lines 705–711: “unequal residual labels do not exclude one”; “every reduction … is `κ²` with trivial action”. | **Repaired.** For n=15 and k′=k(μ₁₅,J[3]), δ=1 and `H¹(C,𝔽₃)=J[3]⊗μ₃⁻¹` is trivial. Every evaluation quotient is rank two with matrix I₂, trace 2, determinant 1 and polynomial `(X−1)²`; χ̄ still has order 5 and η̄ order 1. Plan §1.5 records both the label distinction and the accidental congruence. |

The added convention derivation, the entire new cubic witness, §1.2(5), the complete induction Check and both revised §1.5 Checks were reviewed anew, rather than inherited from the repair report. The inverse also passes the noncommutative cocycle test:
`T(g)T(h)=((a_g·ᵍa_h)⁻¹)*ρ(gh)=T(gh)`.
Without inversion, contravariance reverses the two cocycle factors. For example, transpositions (12),(23) in S₃ have products (123) and (132), which send 1 to 2 and 3 respectively. The identity cocycle gives ρ on both sides. Quadratic cocycles give the same formula before and after inversion.

Searched the rest of the README and plan for cocycle formulas, induction decompositions, noncongruence claims and reversed-prime language. No remaining occurrence repeats one of these defects. The label Check in §2.1 concerns loss of a comparison argument, not an assertion that two conjugate systems can never be isomorphic. The untwisted integral evaluation kernels in §1.5 really are distinct when θ≠θ⁻¹: after rationalization they kill different direct summands of the free regular module. This is different from asserting nonisomorphism of the resulting abstract Galois representations.

## Verified sound

Read the four layers, all 18 plan target statements, their APIs and 70 Checks, the conventions, three gaps, every Needs line and supplier contract. Reopened all 15 seeded source targets. For unchanged mathematics the preceding review's computed rows were admissible evidence; their numerical values are retained below where indicated by the calculations, and the repaired passages and source sample were independently checked. No section is accepted merely on the preceding report's uncomputed assertion that it was sound.

### Principles and scope

The endpoint retains every totally real number field, CM and non-CM curves, every coefficient prime (including 2), every finite place, monodromy, conductor and archimedean factors. The odd-prime restriction is on a lifting theorem, not on the endpoint. The construction imports the arbitrary-number-field geometry from EllipticCurveModularityImaginaryQuadratic rather than recreating that roadmap. The new objects are its reflection descent and the totally real application. General modularity lifting, residual solvable modularity, compatible-system data and CM endomorphism descent retain named upstream owners.

The order is mathematical: eigenspaces precede compatible-system assembly; lattice congruences and lifting/seeds precede the simultaneous parameter and three lifts; these precede descent. LeHung26 presents lifting before reflection descent, so this is not its exposition copied into layers. The four mathematical layer titles, their Dependencies and the individual Needs lines express the required direction. No computational algorithm, forbidden supplier, copied source passage, good-primes-only substitute or re-planning of an existing roadmap was found. Dates in References identify versions of sources; there are no job identifiers, machine paths, review narrative, pull-request numbers or explicit HTML anchors in the design.

### Adversarial calculations

These rows test the statements and their conventions, not a numerical proof of modularity. Small matrix and point-count computations were independently reproduced. The unchanged ramification, coefficient and local-factor controls were also compared with the preceding review's computed rows and the reopened contracts. Fields of characteristic zero exclude zero rings, nonreduced bases and inseparable number-field extensions. Smooth elliptic curves exclude singular models and rank-zero H¹. Rank zero, characteristic two and trivial-extension controls below test the boundaries of the relevant hypotheses.

| Statement | Instances tried and values on each side | Result / change |
|---|---|---|
| Conventions: cohomology and Frobenius | 11a1 at 3 has 5 points, so a₃=4−5=−1 and cohomological polynomial `X²+X+3`. Its dual has trace −1/3, determinant 1/3 and polynomial `X²+X/3+1/3`. | Matches the pinned covariant Tate action after duality and AG §3.10. No change. |
| Conventions: unitary half-shift | Roots α,β with α+β=−1, αβ=3 become α/√3,β/√3 of product 1. Substitution s−1/2 gives `1+3^(−s)+3^(1−2s)`; s+1/2 instead gives `1+3^(−s−1)+3^(−2s−1)`. | The sign in §§4.2–4.4 and the supplier normalization agree. |
| Conventions: general twist | Cubic twist over ℚ(ζ₃), b³=2: `a_g*ω=ζ₃⁻¹ω`, `(a_g⁻¹)*ω=ζ₃ω`, and transport of `bω′` gives ζ₃ω. Trivial cocycle gives ρ; w=w⁻¹ gives w*ρ. | F01 repaired, including its non-involutive negative control. |
| 1.1, relative cyclotomic data | ℚ,n=3: ζ+ζ⁻¹=−1, [L:ℚ]=1, [M:L]=2, δ(Frob₂)=−1 and δ(Frob₇)=1. n=9 gives `x³−3x+1` and degree 3; n=15 gives degree 4. | The quadratic polynomial for ζ and integer polynomials for ζᵃ+ζ⁻ᵃ establish the claimed relative construction. |
| 1.1, boundary/base change/divisor API | k=ℚ(ζ₃),n=3 gives M=L=k and δ=1. k=ℚ(i),n=3 gives L=ℚ(i), whereas M's maximal real subfield is ℚ(√3). d=1 gives δ_d(c)=1 versus δ₃(c)=−1. n=1,2 give ζ+ζ⁻¹=±2 and degree 1. | The total-reality and d≥3 guards are necessary and present; no false maximal-real identification outside that domain. |
| 1.2, reflection action and maps | `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]`: R³=I, WRW=R²=`[[-1,1],[-1,0]]`, WR²W=R. Untwisted inversion gives R²≠R. | Descended rotations are rational. With δ=1 the construction is the identity; marked φ fixes uniqueness. |
| 1.2, cubic tower guard | For n=5 a forced cubic cover has valuations 1,−1,−5,5, four ramified points, 2g−2=8 and g=5. For n=15 the last valuations are divisible by 3: two ramified points, 2g−2=4, g=3. | The cubic clause explicitly needs 3 dividing n. Odd m>1 implies m≥3, so the canonical bundle used for descent is ample. |
| 1.3, eigenspaces and induction | n=3: dim H¹=6=2+2+2. A θ projector has rank 2, the zero projector rank 0. Induction rank is 4 over ℚ and 2 over ℚ(ζ₃); the latter is Vθ itself. | Eigenspaces, their actual Galois action and the idempotent determine the object. F02 repaired. |
| 1.4, pairing, determinant and weights | Reflection-paired basis gives `[e₁,e₂]=1`, `[e₂,e₁]=−1`, diagonal 0. On W₁, determinant is ε⁻¹δ²=ε⁻¹; at real conjugation it is −1. Hodge sum 0+1=1 agrees with ℚ̄ℓ(−1). | Perfect alternating pairing excludes determinant ε and weights {0,2}. Over a nonreal base there are no real-place oddness assertions. |
| 1.4, coefficient realization and assembly | Projector coefficients lie in M₀, so on H¹⊗M₀,λ its image has dimension 2 over M₀,λ; scalar extension has dimension 2 over ℚ̄ℓ. Good polynomial has degree 2 and nonzero constant q. | Actual eigenspaces supply the local model; it is not inferred merely from rational traces. Assembly follows the proved properties. |
| 1.5, integral evaluation and scalar extension | `O[μ_n]²⊗_θ O=O²`; reducing gives κ². At ℓ=3, v₃(1/3)=−1 while every character value has valuation 0. The rational projector has coefficient 1/n of negative valuation when 3 divides n. | Free rank 2 without an integral projector; the coefficient field and its integers are distinguished. |
| 1.5, chain and accidental congruence | At p the label pairs (η,χ),(ψ,1) reduce to (η,η),(1,1); at 3, (χ,ψ),(η,1) reduce to (ψ,ψ),(1,1). Over k′=k(μ₁₅,J[3]), every mod-3 quotient has matrix I₂, trace 2 and determinant 1, despite label orders 5 and 1. | All four positive congruences hold. Unequal evaluations need not give nonisomorphic Galois modules: F03 repaired. |
| 1.6, endpoints and rational norm comparison | n=3: w-invariants have dimension 0+2=2; projection of x+wx is x. Norm after pullback is n/d: 45/3=15, 303/3=101 and 303/101=3. | Rational comparisons hold at all ℓ; the degrees need not be integral units. No integral comparison is substituted for semisimplified reduction. |
| 1.6 and 4.1, quadratic signs | `y²=x³−x+1` over 𝔽₅ has 8 points, trace −2; its twist `y²=3(x³−x+1)` has 4, trace 2. Multiplication by δ=−1 changes −2 to 2; two twists give δ²χ_h²=1. | The same sign is used in descent and in the endpoint. Square h gives χ_h=1. |
| 2.1, semisimple recognition | A nonsplit triangular extension and `1⊕ε⁻¹` have `(X−1)(X−q)` but extension classes nonzero and zero. For the elliptic member every ℓ≠3 gives `X²+X+3` at 3. | Semisimplicity and fixed label/embedding are retained. |
| 2.2, summand lifting | e=0 gives dimension 0, excluded; e=1 on elliptic H¹ gives dimension 2 and weights 0,1. At c, −1 is 2 in 𝔽₃ but 1 in 𝔽₂. | The rank, weight and odd-prime conditions are in scope. Potentially multiplicative local types are covered by the declared universal contract. |
| 2.2, five-adic exception | In 𝔽₂₅, a²=3, B=[[0,2],[1,0]], C=aB: B²=2I, C²=I, det B=3 nonsquare, det C=4 square. A₅ has order 60 and no quotient of order 2. | A genuine 𝔽₅-model is necessary for the determinant square-class argument and is explicitly required. |
| 2.3, switch curve | GL₂(𝔽₃) has 48 elements; SL₂ has 24; an SL₂ rational-line stabilizer has 6. Geometrically the frame cover has two degree-24 components. Over ℚ arithmetic monodromy has order 48 and one orbit; over ℚ(ζ₃) it has order 24 and two components. | The proof uses an integral component, not geometric integrality of all frames. The rational point (E,id) distinguishes ℙ¹ from an anisotropic conic. Finite j fibres turn infinitely many parameters into infinitely many j-values. |
| 2.4, solvable residual seed | Normal-series orders 48,24,8,2,1 have abelian quotient orders 2,3,4,2. The dual determinant at c is 2≠1 mod 3. An unramified extension leaves inertia diag(−1,1) unchanged; restriction to its quadratic kernel gives I₂. | The cohomological-weight gap is distinct from the supplied weight-one result. The extension that kills inertia need not be unramified. |
| 2.5, five-adic seed | Cyclotomic kernel of full GL₂(𝔽₃) has order 24. Rational-line stabilizers have order 6; nonrational ones divide 4. Dualizing a five-torsion isomorphism preserves equality of residual H¹. Generic cyclotomic projective image at 5 has order 60. | Absolute irreducibility and the 𝔽₅ alternative give the seed without any original E[3] premise. A rational five-torsion line, as on 11a1, fails the premise. |
| 3.1, one parameter | Cubic λ has λ+λ⁻¹=−1, so c(λ)=3≠0 mod5. Unit-group orders for 𝔽_(3^a), a=1,2,3,4, are 2,8,26,80. For p=101, φ(303)/2=100 and L(ζ₃)=L(ζ₁₀₁)=M. | The parameter supplier retains the normal-closure prime choice and all conjugate factors. Larger-group invariant lines form a subset of smaller-group invariant lines, so the irreducibility direction is correct. |
| 3.2, auxiliary seed | Wη and Wη⁻¹ each have dimension 2 and identify with the same H¹(A_t). An invariant line for G_(L(ζ₅)) would also be invariant for G_(M(ζ₅)); the latter set is empty. | Apply the seed directly over totally real L. {5}∩{3,p}=∅. |
| 3.3, three lifts | Prime sequence p,3,p has matching residual pairs (η,η),(ψ,ψ),(1,1); each target has rank 2, determinant ε⁻¹ and weights 0,1. Five occurs zero times in the sequence. | The rows have the required residual witnesses and individual irreducibility inputs. Change of coefficient prime supplies the next source member. |
| 4.1, descent | Twisting W₁ by δ gives H¹(B_t)|G_L since δ²=1; twisting H¹(B_t) by χ_h gives H¹(E). A characteristic-zero invariant line yields a rank-one saturated lattice and hence a mod-p invariant line, contradicting the empty residual-line set. | The supplied soluble descent is for the specified representation, not an arbitrary representation with the same restriction. |
| 4.2, bad places and monodromy | Split multiplicative 11a1 at 11 has rank N=1, conductor exponent 1 and polynomial 1−T. `x³−x+1` has Δ=−368 and c₄=48; 5 is nonsquare mod23, residue degree 2, and multiplicative sign squares to 1. Gaussian CM at 2 has exponent 5 and factor 1. | Degree 2/1/0 Euler factors, wild conductor and N are retained. Γℂ(s+1/2) shifted by −1/2 is Γℂ(s). |
| 4.3, CM branch and its field contract | On `y²=x³−x`, [i]*ω=iω and conjugation sends i to −i. Fields over ℚ, ℚ(√2), ℚ(i) are ℚ(i), ℚ(ζ₈), ℚ(i). At 3 and 5 point counts 4 and 8 give traces 0 and −2; roots −1±2i have product 5. `y²=x³+1` has 6 points at 5, trace 0. | Over a totally real base [KT:K]=2; the two characters have weights 0 and 1, so they differ and induction is cuspidal. Over ℚ(i) the sum branch lies outside the endpoint's base domain. |
| 4.3, characteristic boundary | Over 𝔽₂, `y²+y=x³` has Δ=−27=1 and denominator 1, hence ω=dx and Frobenius pullback d(x²)=0. Over 𝔽₃, `y²=x³−x` has Δ=64=1 and d(x³)/(2y³)=0. | Nonzero Frobenius has zero differential; the CM field contract correctly keeps characteristic zero. |
| 4.4, general endpoint | Non-CM example has j=48³/(−368)=−6912/23; CM example has j=1728. Each branch concludes rank 2 and determinant ε⁻¹. Everywhere good reduction gives every exponent 0, product ideal (1), and level 1. | No degree-two, √5 or good-place restriction enters the endpoint. Both branches and the unit ideal are covered. |

### Source sample and manifest

All nine recorded texts were readable from the legal cache. All referenced works have unique manifest keys; the recorded versions distinguish preprint from published pagination. No author-flagged unverified locator was present. No new source was needed or fetched, and no manifest entry was rewritten. The following table covers exactly the 15 seeded targets.

| Target | Locator opened | Support and scope |
|---|---|---|
| 1.1 | LeHung26 line 237, §3.2, p.6 | Source treats totally real K and n=3p. The design's general relative field statement is its explicit elementary extension: ζ satisfies X²−(ζ+ζ⁻¹)X+1, cyclotomic restriction is abelian, and nonreal ζ excludes degree 1 over a totally real L. It is not claimed to be a verbatim general theorem of the source. |
| 1.2 | LeHung26 lines 237–245, equation (9), Lemma 3.2, p.6 | Involutive reflection descent, rational rotations and cohomology action match. General-cocycle inversion is independently derived in the design; (9) alone would not test it. |
| 1.3 | LeHung26 lines 241–249, Lemma 3.2, p.6 | The rotation eigenspaces are the descended representations. Projectors and restriction are constructed explicitly; induction is a Check, not their definition. |
| 1.4 | LeHung26 lines 241–248; OpenAI26 lines 480–514, Proposition 5.1, pp.12–13 | Rank, alternating pairing, determinant, Hodge labels and semisimplicity agree. The argument on good reductions gives common polynomials; the finite coefficient model comes from actual eigenspaces. |
| 1.5 | LeHung26 lines 243–247, (10), p.6; OpenAI26 lines 547–578, Lemma 5.3 p.13 and Corollary 5.4 p.14 | Equal reduced evaluations imply isomorphic residual modules; no converse is asserted by either source. Lattice independence is after semisimplification. |
| 1.6 | LeHung26 lines 244–249, (11), p.6; OpenAI26 lines 521–541, Proposition 5.2, p.13 | Quotient pullback/projection, genus-one Jacobian and quadratic endpoint match. The design supplies the necessary cubic tower guard. |
| 2.3 | FLHS15 lines 421–452, Lemma 6.1 and proof, p.10 | Arbitrary number field, symplectic five-torsion and mod-three image containing SL₂. Infinitely many j-values follow from the named Hilbert supplier and finite j fibres; the source's stated lemma only asks for existence. |
| 2.5 | FLHS15 lines 127–128, Theorem 3, p.3; lines 426–429, proof, p.10 | Totally real base and absolute irreducibility on the cyclotomic restriction suffice at 5; the switch does not assume E[3] irreducible. |
| 3.1 | LeHung26 lines 250–260, §3.3, pp.6–7; OpenAI26 lines 990–1037, Proposition 8.4, pp.23–24 | One simultaneous parameter and all three residual pairs. OpenAI's proof uses two conjugate factors; the arbitrary-base extension and stronger normal-closure prime choice are explicitly imported from the current §7.4 owner. |
| 3.2 | LeHung26 line 264, §3.4, p.7; FLHS15 lines 127–128, Theorem 3, p.3 | Seed over L and cubic realization agree. |
| 3.3 | LeHung26 lines 264–269, §3.4 and table, p.7 | Exact sequence p,3,p and change of prime agree. |
| 4.1 | LeHung26 lines 270–271, §3.4, p.7; lines 357–360, Lemma 5.1, p.9 | Abelian descent with irreducible restriction and twisting back. The general soluble descent theorem is imported by name. |
| 4.2 | LeHung26 lines 361–363, §5, p.9; FLHS15 lines 66–77, §1, p.2 | Modular compatible system and shifted L-function. Full all-place WD, conductor and archimedean conclusions have their precise roadmap suppliers; these paragraphs alone are not treated as full proofs of those refinements. |
| 4.3 | LeHung26 lines 364–366, §5, p.9; OpenAI26 lines 1200–1215, §9.4, pp.27–28 | CM characters, induced/sum alternatives and unitary normalization agree. The general characteristic-zero differential descent theorem is a declared supplier obligation. |
| 4.4 | LeHung26 lines 86–93, Theorem 1.1, p.2 | The source is conditional on geometric Inputs 2.1–2.2. The design names their owning targets; it does not erase those inputs. |

Also reopened LeHung26 lines 221–235 for §§2.1–2.2; FLHS15 lines 116–120, 221–265 and 404–412 for lifting and the mod-three seed; BD14 lines 2144–2176, Théorème 3.2.2, pp.36–37, including the universal modularity conclusion; BLGG12 lines 2024–2052 and 2198–2223, Theorems 6.1.5 and 6.1.8, pp.41–42 and 45; BLGG13II lines 82–159, Theorems 2.1.2 and 3.1.1–3.1.2, pp.2–4; Kisin09 lines 3976–4009 and 4068–4078, (3.5.5) p.1170 and (3.5.7) p.1172; SW99 lines 2468–2505, Theorems A–B, pp.74–75; BCDT01 line 15, Theorem A, p.1. The residual-image, local-type and Hypothesis H restrictions are not discarded. Kisin's extraction has damaged mathematical glyphs, but the relevant numbered hypotheses are legible in context; no missing-text request is needed.

### Supplier resolution, duplication and merge order

Used `roadmaps show` to reopen the supplier texts and `roadmaps grep` to search objects across main and the supplied open heads. The current citation resolver reports no unresolved cross-roadmap citations or names. Its disclaimer that external Lake packages were not checked is addressed by the local pinned-file inspections below. The earlier three resolver leads are planned names in ArithmeticGaloisRepresentations, not alleged pinned declarations.

Each path in the following table is `TauCetiRoadmap/<roadmap>/README.md`; line numbers exclude the tool's provenance header. The table gives the consumed objects and actual locators, not just a list of roadmap names.

| Roadmap | Current resolved contract |
|---|---|
| EllipticCurveModularityImaginaryQuadratic (#1048) | §0.2: fixed-pairing twists at 559–601; §1.1: arbitrary-base parameter open at 860–883; §1.3: covers, reflection and tower at 957–981; §3.1: integral regular marking at 1150–1156; §§4.1–4.4: systems, quotient endpoints, lattices and positive congruences at 1258–1412; §5.1: non-CM large image at 1435–1456; §7.1: geometric residual irreducibility at 1854–1875; §7.4: arbitrary-base simultaneous parameter at 1980–2060. Its §8.6 at 2284–2300 is the CM-base application, not this totally real endpoint. |
| AutomorphicGaloisRepresentations (#1007) | §3.10 at 2218 and 2264–2274: Hilbert attachment, cohomological polynomial, dual and twist; §3.13 at 2340–2349: geometric rank-one characters; §3.14 at 2398–2402: determinant, oddness and irreducibility; §4.4 at 2519–2525: full away-coefficient WD; §4.7 at 2543–2545: full coefficient-prime comparison without residual restrictions. |
| AutomorphicGaloisRepresentationsPartII (#1006) | AG2.0 attachment and algebraic-character interfaces; AG2.P, independent Hilbert members at 488–535, explicitly identifies the cohomological member and its arithmetic dual with the required weights and twist convention. |
| PotentialAutomorphyInfrastructure (#1081) | §2.3 at 819–830: soluble descent of the specified continuous representation with irreducible restriction, including all finite local parameters. |
| GL2AutomorphicRepresentationsAndTransfer (#931) | R16.2.13 at 929–939: infinity parameters; R16.3.2 at 961–965: Steinberg with N; R16.3.5 at 995–1007: conductor; R16.3.6 at 1036–1045: gamma factors; R16.4.4 at 1136 onward: Hecke-data comparison; R16.6.3–4 at 1349–1381: weight and normalization adapters; R17.4.16 at 2692–2711: quadratic induction; R17.5.14 at 2977–2983: weight-one residual witness only. |
| GL2ModularityLifting (#1071) | §§5.7 and 5.10 at 1334–1350 and 1394–1412 retain the stronger Barsotti–Tate/local conditions described by this design. The missing BD generality is correctly declared as a gap. |
| ArithmeticGaloisRepresentations (#856) | Layers 1–3 supply representation/lattice/WD/conductor infrastructure. §4.1 at 3143–3149 contains GaloisRep.IsOdd; §5.3 at 3519–3529 contains GaloisRep.iso_of_frobenius_charpoly_eq; §6.1 at 4064–4081 contains TateModule.residualRep on native torsion, with §6.2 pairing/determinant. |
| InverseGaloisAndArithmeticFundamentalGroups (#850) | IG.2.4 at 1965–1983 uses integral finite étale covers; IG.2.6 at 2165–2178 separates the connected-torsor conversion from regular-cover existence; IG.2.7 at 2304–2323 gives finite avoidance and Hilbert weak approximation. This supports the non-geometrically-integral frame cover. |
| ModularCurvesPartII (#913) | §4.10 at 1560–1582 supplies fixed-pairing geometric connectedness and irreducibility for N≥3, hence N=15. |
| ModularCurves (main) | §0E at 839–875 supplies polarized projective-curve descent and finite actions; Layers 3 and 5B supply level structures and fixed-pairing full-level curves. Genus m≥3 gives the polarization used here. |
| EllipticCurves (main) | Layer 0.5 at 398–420: Galois action and morphism descent; Layer 1 at 593–619: invariant differential, separability and additivity; Layer 4.5a and Layer 5: model comparisons and quadratic twists. |
| JacobianChallenge (main) | Layers D–F, with the explicit clarification at 42–46: Pic⁰ exists without a rational point; a point is needed for a normalized Abel–Jacobi map. |
| SmallRamificationAndAbelianVarietyBaseCases (#970) | §5.0d at 1993–2024: arbitrary number field/rank raw system, finite local realization fields and geometric Frobenius. Rational polynomials alone do not imply descent to the coefficient completion; this design actually constructs that model. |
| PotentialModularityAndCompatibleSystems (#1075) | §1.1 at 95–110: weak-family comparison; §1.6 at 210–240: automorphy from good polynomials, with away-coefficient strictness distinct from all-place compatibility. |
| AbelianSchemesAndArithmeticModuli (#849) | A4.1 at 1838–1853: integral Tate module; A6 and A6.11 at 3042–3057: endomorphism realization and integral ℓ-independent characteristic polynomial. |
| NeronModelsAndSemistableAbelianVarieties (#852) | §3.10 at 1895: semistable reduction; §5.1 at 3109: NOS; §5.3 at 3200: residue-prime comparison; §5.6 at 3755–3777: bad Euler polynomial; §6.10 at 4296–4311: compatible cohomology, with dual/geometric convention explicit. |
| FaltingsFinitenessAndIsogenyTheorems (#1004) | R28.4.5 at 1858–1862: semisimplicity at every prime for abelian varieties over a number field. |
| ShimuraVarieties (#933) | §5.3 at 1525 onward: full CM algebra action and eigenspaces over ℂ. The design does not misattribute the general endomorphism field to it. |
| ComplexMultiplicationAndExplicitReciprocity (#1254) | Layer 1, §1.1 at 340–350: rational CM self-twist and Galois-equivariant Lie scalar. The general field statement is requested as a gap before §1.1, not represented as already supplied. |
| EtaleCohomologyFoundations (main) | §0.11 at 1157–1175: trace and curve duality, including independence of a point, giving H²=ℚ̄ℓ(−1) after the adic realization. |

The three contracts have identical slugs in the plan and README, named earlier suppliers, explicit hypotheses and one missing mathematical conclusion each. They ask for no construction owned here: the weight-two gap removes the actual extra restrictions in §§5.7/5.10; the residual gap asks for cohomological weight rather than the existing weight-one witness; the CM gap gives the Galois-equivariant differential field criterion rather than merely a CM algebra action over ℂ. Their absence upstream is not supplier drift.

Read the supplied overlap facts: no conflicting head, dropped cited id, or id defined only by an open revision is listed. The five closest heads have distinct ownership: #1048 the imported geometry and imaginary-quadratic endpoint; #1036, `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md:3`, GL₂-type varieties over ℚ and ℚ-curves; #1484, `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:3`, the rational wild-three method; #1075 the general compatible-family predicates; #1746, `TauCetiRoadmap/AbelianSurfacesModularity/README.md:3`, the rank-four surface switch. Also checked #2137, `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md:3`: defect-one weight-one/Bianchi lifting, not the missing general BD theorem. No object in these scopes duplicates the reflection descent or general totally real endpoint here.

The CM field-of-definition overlap is still an import here, not a second owned construction. The object search locates the number-field criterion in #1727, `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1631`, and its application in #1048 at 2287. The design consumes the earlier CM supplier gap rather than introducing an upward edge to #1727. Generic fields, elliptic torsion, pairings, twists and differential pullback remain imported. No fully qualified Lean declaration can collide in this design because it declares none.

The board package index was read before the ownership audit. At their indexed heads, `packages/AnalyticNumberTheory/README.md:3` is an index of two analysis roadmaps; `packages/LogicAndDefinabilityInNumberTheory/README.md:3` owns logical, valued-field and counting interfaces. Neither owns these objects. The third indexed head was inaccessible, as recorded below. The downstream HilbertModularForms contract was reopened at `TauCetiRoadmap/HilbertModularForms/README.md:2401`: §11.3 asks for precisely the full curve-side modularity/conductor/local-factor input supplied here; it is a consumer, not an upward prerequisite.

The exact dependency command from the brief returned:

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Parsing the plan gave 18 distinct targets and 37 internal prerequisite edges, all pointing to preceding targets, with zero forward edges or cycles. The merge-order file was not edited.

### Pinned library evidence

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the definitions and signatures below locally at those pins, including the surrounding hypotheses. Object searches found no Hilbert cuspidal attachment, geometric-prime-switch cover/cohomology construction or raw automorphic-system carrier in those trees.

| Pinned file | Opened declaration and scope |
|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48` | NumberField.IsTotallyReal: every infinite place is real. maximalRealSubfield at 126 requires `∀ φ : K →+* ℂ, star (φ x) = φ x`; maximality at 140, total-reality instance at 157, IsTotallyComplex at 210. A single real embedding is insufficient. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:70` | NumberField.IsCMField: totally complex and quadratic over maximalRealSubfield. CMExtension.eq_maximalRealSubfield at 456; IsCMField.ofCMExtension at 510; IsCyclotomicExtension.Rat.isCMField at 564 requires some index >2. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | IsCyclotomicExtension specifies primitive roots and algebra generation over commutative rings. It does not itself imply a number field or total reality. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366` | WeierstrassCurve.IsElliptic is invertible discriminant. j at 388 is Δ′⁻¹c₄³ with this instance, not division on arbitrary singular cubics. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:80` | WeierstrassCurve.tateModuleGaloisRepresentation acts covariantly on torsion coordinates; prime binder at 75. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | TauCeti.det_tateModuleGaloisRepresentation: determinant ε with ellipticity, separably closed coefficient extension and ℓ nonzero in it. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:164` | quadraticTwistOf; quadraticTwist at 469 requires separable quadratic extension; quadraticTwistPointEquiv at 824 and quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map at 945 give the chosen comparison and sign. Trivial extension uses the design's untwisted branch. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` | WeierstrassCurve.torsionGaloisAction on actual N-torsion, not an arbitrary two-dimensional representation. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:225` | TauCeti.Isogeny.weilPairing on torsion with values in roots of unity, over a separably closed field with N invertible. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Galois.lean:104` | WeierstrassCurve.weilPairing_torsionGaloisAction includes Galois action on the roots of unity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean:149` | WeierstrassCurve.nonempty_basis_torsionBy: Fin 2 basis over ZMod N, with ellipticity, separable closure, N≠0 and N invertible. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean:79` | TauCeti.Isogeny.Hom.pullbackDifferential; pullbackDifferential_comp at 102 reverses composition; pullbackDifferential_add_invariantDifferential at 137 is additive on ω. These do not by themselves supply the CM fixed-field theorem. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:77` | invariantDifferentialDenom is 2y+a₁x+a₃; no invalid division by 2y in characteristic 2. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean:94` | GeometricEnd uses SeparableClosure; HasGeometricCM at 100 means an endomorphism outside the integer range. This distinguishes geometric CM from base-rational CM. |

### Shape, headline inventory and padding

The README has the required Summary, Scope and ownership, Conventions, Exact supplier contracts, build explanation, four mathematical layers, Examples and Dependencies for each layer, Downstream consumers, Worked examples and References. The four substantive definitions in §§1.1, 1.2, 1.3 and 1.5 have respectively 5, 5, 5 and 7 API items and at least three discriminating Checks. Section 1.4 assembles the existing raw carrier after proving its properties. Every theorem has hypotheses, a locator and a Needs line. Symbols in code spans are mathematical notation; the design does not present its prospective plan names as already declared Lean identifiers. Backticked imported names resolve to the suppliers or pinned declarations above.

Headline inventory, with README locations:

- §1.1: relative cyclotomic fields and quadratic character.
- §§1.2–1.6: reflection descent, rank-two systems, determinant/weights/compatibility/oddness, integral congruences and elliptic endpoints.
- §2.1: change of coefficient prime; §2.2: summand lifting.
- §2.3: number-field 3–5 switch with infinitely many j-values; §§2.4–2.5: elliptic seeds.
- §§3.1–3.3: simultaneous parameter, auxiliary modular seed and three lifts.
- §4.1: non-CM modularity; §4.2: every prime and every place; §4.3: CM induction; §4.4: the full totally real endpoint.

The design's statability assessment at lines 95–109 is correct: §1.1 can be stated with native fields, primitive roots and intermediate fields; §2.3 with native elliptic Weierstrass curves, torsion, Galois action, pairing and bases, and an infinite set of j-invariants. The complete statements are not one-tactic consequences of the opened declarations. The reflection/cohomology headlines need the imported geometric carriers, and the automorphic headlines need the Hilbert automorphic and attachment carriers. A package must state the two statable headlines and name the others individually with their missing carriers in its module docstring; no artificial Prop-valued stand-in is warranted.

There is no `Suggested.lean` in this design. Thus there are zero sorried declarations to probe, zero own Lean declarations to compare, and no import header, variable block, sorry'd data or `set_option` to test. No Lean command was run and no passing build is claimed. **Elaboration: not available (this lane does not elaborate; say so in the report).** The executable one-tactic probe and `#check @name` signature comparison are package-stage checks here; the reading-based statability and padding assessment above does not certify elaboration or a “sorry only” warning result.

## Not verifiable

- Lean elaboration, expanded signatures and executable one-tactic probes are unavailable in this lane; the design has no Suggested.lean.
- `packages/LawrenceVenkateshMethod/README.md` at board #345's indexed head `9ee7ac3` returned HTTP 404 again. Ownership against that inaccessible file is not certified. The two other indexed board packages and the named relevant roadmap heads were readable.
- The supplied design-specific overlap facts were used; this unported design has no roadmap pull-request head to merge or independently compare for conflicts. No missing public head is silently treated as checked.
- All nine cited mathematical texts were readable. There is no missing-reference request and no unchecked seeded locator.

## Source issues

- **Misprint** in LeHung26 at §2.1, equation (5), printed p.5: the source introduces the cubic quotient in a tower with arbitrary odd n; it should require 3 dividing n for that tower member; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bffb5cf89fcd2abe2f3bfbc18be7bd2f741ccd89", "job": "REV-DESIGN-EllipticCurveModularityTotallyReal~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
