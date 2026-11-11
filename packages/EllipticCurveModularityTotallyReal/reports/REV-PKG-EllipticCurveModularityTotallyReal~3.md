<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13499#issuecomment-6791175540 -->
Review (codex) of ef42b48

Verdict: accepted
Conditional on the announced gaps: `totally-real-weight-two-lifting`, `totally-real-solvable-residual-cohomological-weight`, `cm-elliptic-endomorphism-field`

No findings. Acceptance is conditional on the three declared supplier contracts listed below. The package's mathematical scope, source attribution, interfaces and acceptance signatures pass this review; this does not certify that the planned library theorems have already been proved.

## Previous finding and repair verification

Unqualified README references below mean `packages/EllipticCurveModularityTotallyReal/README.md`.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| Round 2 F01 (P2), stored base-change polynomial outside its domain | Repaired | README:709 now says “At `v′ ∉ S_res` above v, the stored polynomial has roots `α^f` and `β^f`.” README:714 says “At a ramified v′ this second statement concerns the members only”. This correctly separates the two assertions. |

The earlier review had one finding, and the repair report marked it applied, not un-actionable. There is no settled finding being re-raised. I checked all four affected passages: the supplier contract at README:348–353, restriction to M at 694–701, arbitrary base change at 705–715, and the new ramified Check at 738–746. The supplier, `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:1993–2013` at #970, stores polynomials only outside its bad set and enlarges that set by ramified places. The revised text uses precisely that operation.

The counterexample from round 2 now passes. Over `ℚ(√5)/ℚ` at 5, `(e,f)=(2,1)`: the restricted member polynomial is `X²−2X+5`, whereas the place is in `S_res` and has no stored good-place polynomial. Over `ℚ(√−3)/ℚ` at 5, `(e,f)=(1,2)`: the stored and member polynomials are both `X²+6X+25`. I independently counted 8 points over `𝔽₅` and 32 over `𝔽₂₅` on the stated curve. The distinction also holds for identity, split and wildly ramified base changes, as recorded below.

I searched the rest of the package for the same domain mistake. The other base-field restriction of stored polynomials is the restriction to M: ramification occurs only above n, already in S. The lattice restrictions in §1.5, coefficient comparison in §2.1, and irreducibility restrictions in §§3.1 and 4.1 do not request a stored polynomial at an excluded place. The repairs introduce no narrowing to unramified extensions.

## Verified sound

### Coverage, principles and shape

I read all 18 numbered sections, all 18 Checks blocks, the five definition/API blocks, conventions, supplier contracts, four layer Examples and Dependencies sections, references, both Lean declarations, metadata and all nine manifest entries. All fifteen seeded targets were reviewed again. For the unchanged §§1.5, 1.6 and 3.3, the preceding review's explicit computed rows were compared with the text; additional computations below confirm the relevant ranks, congruences and endpoint identifications. No acceptance rests on an earlier “sound” summary without values.

The scope remains a general library development: arbitrary number fields for the reflection construction and switch, arbitrary abelian varieties with rank-two idempotent summands for lifting, and every totally real number field and every elliptic curve for the endpoint. All finite places and coefficient primes, mixed reduction types, CM curves and fields containing √5 are retained. The finite exceptional auxiliary-prime set is an existence device, not a good-primes restriction on the theorem.

The package does not re-plan a roadmap on main. It imports the arbitrary-field geometry, regular-module calculation and specialization from EllipticCurveModularityImaginaryQuadratic and adds reflection descent and the totally real branch. The base-field and attachment differences of retained comparison variants are explicit at README:61–71. The shared compatible-system carrier, generic lifting theorem, solvable residual modularity and CM endomorphism-field theorem keep their named owners. There is no algorithm, source transcription, upward supply, new circular prerequisite, sorry'd data or `set_option`.

The organisation is mathematical. Layer 1 produces the descended systems; Layer 2 supplies lifting and seeds; Layer 3 applies them; Layer 4 descends and compares. Dependencies force these transitions. No layer is named after a source chapter, and no sentence makes a source's exposition the organising rule. I read the main-branch introductions and relevant layers of `TauCetiRoadmap/ModularCurves/README.md`, `TauCetiRoadmap/EllipticCurves/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md` for shape, applying this review's explicit house rules where those older files differ.

Each definition has its API and at least three Checks: §§1.1, 1.2, 1.3, 1.4 and 1.5 have respectively 7, 5, 4, 6 and 5 Checks. Each of the 18 sections has a locator and its own Needs line. All four layers end with Examples and Dependencies. There are no job identifiers, hand-off notes, pull-request numbers, machine paths, HTML anchors or LaTeX delimiters in the roadmap or Lean text. Publication dates and source revision identifiers identify cited versions. `metadata.toml` records `math.NT`.

### Adversarial calculations

Values in this table are calculations, not conclusions drawn from the `sorry` build. The revised carrier interface was tested both at and outside its domain. Characteristic-zero field, positive-rank, smoothness and invertibility hypotheses exclude the zero ring, singular cubic, inseparable extension and nonexistent torsion-basis cases. Statements restricted to odd lifting primes do not silently include 2. Semisimplification is retained wherever lattice independence or Frobenius recognition needs it.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions: geometric Frobenius, dual and half-shift | 11a1 at 3 | H¹ roots have sum −1 and product 3; normalized roots have product 1. Shifting by −1/2 gives denominator `1+3^(−s)+3^(1−2s)`; the opposite shift gives `1+3^(−s−1)+3^(−2s−1)`. Dual geometric determinant is 1/3. | Agrees; none. |
| Conventions: quadratic twist | `y²=x³−x+1` and its twist by 2 over `𝔽₅` | Counts 8 and 4; traces −2 and 2. Character value −1 gives `(−1)(−2)=2`. | Agrees; none. |
| Conventions: inverse cocycle | Cubic twist with `b³=2`, `g(b)=ζ₃b` | `φ*ω=bω′`; transported scalar is ζ₃. `(a_g⁻¹)*` gives ζ₃, while `a_g*` gives ζ₃⁻¹, unequal. | Correct direction; none. |
| §1.1 definition and field headline | ℚ, n=3,4,6 | Real generators are −1,0,1; L=ℚ and `[M:L]=2` in all three cases. Using `L=k(ζ)` instead gives degree 1. | Matches Lean, including even n; none. |
| §1.1 relative and boundary cases | `k=ℚ(√2), n=8`; `k=ℚ(√5), n=5`; n=1,2 | Real generators √2 and `(−1+√5)/2` lie in k, so L=k and degree 2. At n=1,2 the generators are ±2 and M=L=k, degree 1. | `2<n` excludes the false CM conclusion; none. |
| §1.1 general-base data, independence and divisor API | n=9,15; `k=ℚ(i), n=3`; d=1 | `2cos(2π/9)` satisfies `x³−3x+1=0`; real degrees are 3 and 4. For ℚ(i), L=ℚ(i), whereas the maximal real subfield of M is ℚ(√3). At d=1 the character is +1 at c, versus δ(c)=−1. | General-base assertions and d≥3 guard agree; none. |
| §1.1 cyclotomic adjoining | n=3p, k totally real, ℓ=3 or p | `[M:L]=2`; ζℓ is nonreal, hence `[L(ζℓ):L]=2` and `L(ζℓ)=M`. | Correct irreducibility group in Layer 3; none. |
| §1.2 reflection descent and rotation rationality | `R=(0,−1;1,−1)`, `W=(0,1;1,0)` | `R²=(−1,1;−1,0)`, `R³=I`, `WRW=R²`, `WR⁻¹W=R`. A rotation conjugation leaves R⁻¹ unchanged. | The reflection excludes the wrong twist; none. |
| §1.2 identity, genus and quotient domain | δ=1; forced cubic at n=5; legal cubic at n=15 | δ=1 gives identity descent. Four branch points at n=5 give `2g−2=8`, g=5; two at n=15 give `2g−2=4`, g=3. On the rotation quotient w acts as −1; on the reflection quotient it acts as +1. | Cubic clause correctly requires 3 dividing n; none. |
| §1.3 eigenspaces and idempotent | n=3, trivial and primitive labels | `dim H¹=6=2+2+2`. The projector character sum is 1 on its label and 0 on the other two. Induction over M/L has dimension 4 when `[M:L]=2`, versus descended dimension 2; at M=L both are 2. | Definition determines the intended object; none. |
| §1.3 quotient and coefficient operations | n=45,d=3; conjugate embeddings at order 3 | Pullback/norm is multiplication by 15, nonzero over `ℚ_ℓ`, not a 3-adic unit. Conjugation sends eigenvalue ζ₃ to ζ₃² through a semilinear map. | Rational and semilinear qualifications retained; none. |
| §1.4 pairing and determinant | θ of order 3; θ=1 | Self-cup-product on a nonselfdual label is 0; insertion of w gives `[y,x]=−[x,y]`, a perfect pairing into `ℚ̄_ℓ(−1)`. For θ=1, determinant is `ε⁻¹δ²=ε⁻¹`; at c its value is −1. | Correct sign and target; none. |
| §1.4 weights and weak compatibility | Good norm 5; rank-two summand | Hodge sum `0+1=1`, constant term 5. A `{0,2}` multiset has sum 2; determinant ε would give 1/5 at geometric Frobenius. The actual members and projector traces supply the stored polynomials, rather than arbitrary raw data. | Meets AG2.P Weak; none. |
| §1.4 member and reflection API | j′=σj; order-three label | `u*(1⊗σ)x=σ(jθ(u))(1⊗σ)x`; w changes the label to θ⁻¹, preserves rank 2 and intertwines Galois. Thus corresponding trace and determinant are equal. | Correct coefficient field and maps; none. |
| §1.4 revised restriction to M | n=3, v=5 inert in ℚ(√−3) | Original B has trace −2, twisted W has trace 2 and roots `1±2i`. f=2 gives `−3±4i`, trace −6, determinant 25. Independent count is 32, giving `26−32=−6`. Ramification of M/L is only at 3, already in S. | Stored polynomial is in its domain; none. |
| §1.4 revised finite base change: identity and split | L′=L; ℚ(i)/ℚ at 5 | f=1 gives `X²−2X+5` in both cases. Identity has `S_res=S`; the two split places at 5 are outside `S_res` when 5 is outside S. | Identity and splitting behave correctly; none. |
| §1.4 revised finite base change: ramified | ℚ(√5)/ℚ at 5 | e=2, f=1, norm 5. Member roots remain `1±2i`; polynomial `X²−2X+5`. Raw bad-set membership is true, so stored polynomial is absent. Using e would give `X²+6X+25`, unequal. | Round 2 counterexample repaired; none. |
| §1.4 revised finite base change: wild and coefficient-prime controls | ℚ(i)/ℚ at 2 with 2 outside S, λ not above 2; λ above 5 at v=5 | Wild case has e=2,f=1; inertia inclusion gives the same member polynomial with constant term 2. For λ above 5, determinant `ε₅⁻¹` is ramified at 5, so the unramified-member conclusion would fail. | The explicit residue-characteristic exclusion is necessary and present; none. |
| §1.4 duality API | q=5, roots `1±2i` | `{α⁻¹,β⁻¹}={(1−2i)/5,(1+2i)/5}={α/5,β/5}`. Dual weights `{0,−1}` equal `{0,1}−1`. | Matches supplier dual and Tate twist; none. |
| §1.5 lattice, integral domain and reductions | n=3p, ℓ=3,p | Evaluating `O[μ_n]²` gives `O²`, rank 2; `v₃(1/3)=−1`, whereas character values have valuation 0. At p, ψ̄=1 and χ̄=η̄; at 3, η̄=1 and χ̄=ψ̄. | Congruence chain holds without an integral projector; none. |
| §1.5 accidental congruence and untwisted negative control | `k′=k(μ₁₅,J[3])`; nontrivial δ and θ | Over k′ all residual evaluated modules are trivial `κ²`, despite distinct labels. Before twisting, δ=−1 exchanges θ and θ⁻¹, unequal for a nontrivial odd-order label; θ=1 remains fixed. | No false converse to equal-label congruence; none. |
| §1.6 elliptic endpoints | n=3 and n=45,d=3 | Reflection invariants have dimension `0+2=2`; norm/pullback scalar is 15. Quadratic characters square to 1, so both signs disappear on twisting back. | Rational endpoint identification agrees; none. |
| §2.1 change of prime | Split sum and nonsplit extension; 11a1 at 3 | Split and nonsplit extensions of 1 and ε⁻¹ both give `(X−1)(X−q)` but are not isomorphic. Actual elliptic polynomial is `X²+X+3` for every ℓ≠3. | Semisimplicity and fixed labels are required and present; none. |
| §2.2 lifting domain | ℓ=2,3,5; multiplicative local type | At c, −1 becomes 1 mod 2 and 2 mod 3. Tate-curve N has rank 1, whereas potentially Barsotti–Tate N=0. The general contract permits the former. | Odd-prime guard and broader local domain correct; none. |
| §2.2 five-adic model alternative | `a²=3`, `B=(0,2;1,0)`, C=aB over `𝔽₂₅` | `B²=2I`, `C²=I`, `det C=4` is square in `𝔽₅`, but `det B=3` is nonsquare. For an actual `𝔽₅` model, projective A₅ forces √5 in F and an impossible quotient of A₅ of order 2. | Requires the genuine model, not just determinant values; none. |
| §2.3 switch headline and pairing | K=ℚ and K containing ζ₃; α=id or ×2 | Geometric SL₂ order 24; full frame torsor has 2 components of degree 24. Arithmetic image is 48 or 24 respectively. Pairing exponents under id and ×2 are 1 and 4 mod 5. | Lean's two conditions are substantive; none. |
| §2.3 image and infinitude | Borel/Cartan normalizers; finite j-map | Orders 12,8,16 are not divisible by 24. A finite set of j-values has a finite preimage; the Hilbert set is infinite, so its j-image cannot be finite. | Not a definition or boundary theorem; none. |
| §2.4 mod-three seed | Derived series of GL₂(𝔽₃), complex conjugation | Independently enumerated derived subgroup sizes `48→24→8→2→1`; quotient orders `2,3,4,2`. Odd determinant is 2, not 1. | Solvability and oddness feed the declared cohomological-weight contract; none. |
| §2.5 mod-five seed | Generic image; rational five-torsion; line stabilizers | GL₂(𝔽₅) has order 480, SL₂ order 120, projective kernel image order 60. SL₂(𝔽₃) line stabilizers have orders 6 or at most 4, below 24. Rational five-torsion gives a fixed line. | Second five-adic alternative is needed and covers the elliptic application; none. |
| §3.1 simultaneous parameter | Primitive cubic λ; p=7,13,101 in characteristic 3 | `c=−(λ−1)²/λ`; cubic value is 3. Computed orders of 3 modulo 7,13,101 are 6,3,100. Prime-to-3 roots retain their nontrivial order, so c≠0; the degree≤4 regular-word exclusion cannot use p=13. | Nonvanishing and regular-word bound are distinct, as stated; none. |
| §3.1 all residual conditions | n=3p over totally real K | `L(ζ₃)=L(ζ_p)=M`, degree 2 over L. `G_{M(ζ₅)}⊆G_{L(ζ₅)}`; a line fixed by the latter would be fixed by the former. The imported all-character conclusion therefore gives all four requested irreducibilities. | Group restriction direction correct; none. |
| §3.2 seed over L | η and η⁻¹ | Both have rank 2 and identify with the same `H¹(A_t)`; seed prime is 5, distinct from 3,p. | Seed and coefficient change supply both labels; none. |
| §3.3 three lifts | Prime rows p,3,p | Residual labels are `η̄=χ̄`, `χ̄=ψ̄`, `ψ̄=1`; target ranks are 2, determinants ε⁻¹, weights `{0,1}`. Cyclotomic irreducibility group in all three rows is G_M. | No five-adic alternative or local matching is smuggled into the rows; none. |
| §4.1 descent and twist removal | Quadratic step; induced representation | The two possible character twists have values ±1; the prescribed G_K-representation selects its descent. An induced rank-two representation restricts to two characters, hence is reducible, unlike the actual restriction. `χ_h²=1`. | Supplier irreducibility hypothesis met; none. |
| §4.2 finite bad places | 11a1 at 11; `y²=x³−x+1` at 23 | Split multiplicative N has rank 1, conductor exponent 1, factor `(1−11^(−s))⁻¹`. For the second curve Δ=−368, c₄=48, and 5 is absent from the squares modulo 23; over ℚ(√5), norm is 529 and reduction splits. | Monodromy and residue degree retained; none. |
| §4.2 additive, infinity, central character and rationality | Gaussian curve at 2; weight two | Additive factor 1, conductor exponent 5. `Γ_ℂ((s−1/2)+1/2)=Γ_ℂ(s)`. Determinant ratio is 1, so central character is trivial; good Hecke coordinates are `(a_v,1)` with `a_v∈ℤ`. | All-place statement and normalizations agree; none. |
| §4.3 CM induction | Gaussian curve at 3,5; Eisenstein curve at 5 | Counts 4,8,6 give traces 0,−2,0. Split roots `−1±2i` sum to −2 and multiply to 5. The Tate arithmetic values become H¹ geometric values after dualization. | CM supplier normalization agrees; none. |
| §4.3 endomorphism field and characteristic | `[i](x,y)=(−x,iy)`; Frobenius in characteristics 2,3 | `[i]*ω=iω`, conjugation changes i to −i, kernel is `G_{ℚ(i)}`; over ℚ(√2) it is `G_{ℚ(ζ₈)}`. Smooth test curves have discriminant 1 mod 2 or 3, but Frobenius pullback is `d(x²)=0` or `d(x³)=0`. | Characteristic zero is essential and explicitly in the contract; none. |
| §4.4 endpoint and worked examples | Non-CM/CM branches, everywhere good curve, p=101 | `j=−6912/23` is nonintegral; Gaussian j=1728 is CM. Zero conductor exponents give unit ideal `(1)`. `φ(303)/2=100`. | Branches exhaust elliptic curves; no degree or √5 exclusion; none. |

For the three supplier gaps themselves, the discriminating instances are also present: residual inertia `diag(−1,1)` has image of order 2 and survives unramified extension; a ramified quadratic local extension kills it. Weight-one labels `{0,0}` do not equal `{0,1}`. The five-adic model computation and CM differential computation above test the other two contracts. No hypothesis contains its conclusion, and no unconstrained raw system is asserted to be the geometric one.

### Source sample and manifest

All nine cited works were accessible in the supplied legal source cache. No author locator is marked unverified. Every referenced work has one manifest key, and version notes distinguish preprint numbering from published pagination. No source needed fetching, no manifest entry was changed, and no missing-reference request was created. Source text was read in the cache and was not copied into the repository.

| Seeded target | Text and locator inspected | Result |
|---|---|---|
| §1.1 | LeHung26 line 237, §3.2, p.6 | Supports n=3p over totally real K. The general-n and arbitrary-base extension is explicitly proved here, not falsely attributed to the source. |
| §1.2 | LeHung26 lines 237–240 and 245, (9), Lemma 3.2, p.6 | Reflection cocycle, rational rotations and action agree. General tower and effective descent have named suppliers. |
| §1.3 | LeHung26 lines 241–246, Lemma 3.2, p.6 | Supports the descended eigenspaces; the package states the maps and coefficient actions explicitly. |
| §1.4 | LeHung26 lines 241–248; OpenAI26 lines 480–514, Proposition 5.1, pp.12–13 | Rank, reflection pairing, determinant, Hodge labels, semisimplicity and common polynomials agree. The changed restriction API is verified against the raw-carrier supplier separately. |
| §2.1 | LeHung26 lines 221–224, §2.4, p.5 | Change of prime uses common Frobenius polynomials and semisimple recognition. |
| §2.2 | LeHung26 lines 231–235, Proposition 3.1, p.6; FLHS15 lines 116–120 and 221–265, Theorem 2, p.3 and §2, pp.5–6; BD14 lines 2144–2172, Théorème 3.2.2, pp.36–37 | Le Hung excludes 2,5. The package explicitly gives its five-adic extension through the declared supplier contract. BD gives universal modularity for lifts meeting its local choices; FLHS supplies the determinant/model argument removing the exceptional case for elliptic residual data. Dual conventions are retained. |
| §2.3 | FLHS15 lines 421–452, Lemma 6.1 and proof, p.10 | Arbitrary number field, symplectic five-torsion and SL₂ mod-three image. The source states existence; the roadmap's Hilbert-set plus finite-j-map argument supplies infinitude. |
| §2.4 | FLHS15 lines 404–412, Theorem 6 and Corollary 5.1, p.9 | Totally real elliptic mod-three seed, with absolute irreducibility on the cyclotomic extension. |
| §2.5 | FLHS15 lines 127–128 and 426–429, Theorem 3, pp.3,10 | Totally real mod-five seed and switch/lift route agree. |
| §3.1 | LeHung26 lines 250–260, §3.3, p.6; OpenAI26 lines 990–1028, Proposition 8.4, p.23 and proof | The OpenAI source proof has two conjugate factors for an imaginary quadratic base. ECMIQ §7.4 explicitly owns the extension to d factors with the normal-closure prime hypothesis; the package consumes that extension. |
| §3.2 | LeHung26 line 264, §3.4, p.7; FLHS15 line 127 | Auxiliary elliptic seed over L, then every coefficient prime, agrees. |
| §4.1 | LeHung26 lines 270–271 and 357–360, §3.4, p.7 and Lemma 5.1, p.9 | Abelian descent and twist removal agree; full general descent comes from the named supplier. |
| §4.2 | LeHung26 lines 361–363, §5, p.9; FLHS15 lines 66–77, §1, p.2 | Supports the elliptic modularity and shifted-L-function discussion. Detailed all-place statements use AutomorphicGaloisRepresentations §§4.4,4.7 and the local suppliers, not the introductory paragraph alone. |
| §4.3 | LeHung26 lines 364–366, §5, p.9; OpenAI26 lines 1200–1224, §9.4, pp.27–28 | Endomorphism field, character splitting, quadratic induction and normalization agree. The general field-of-definition result remains an explicit gap. |
| §4.4 | LeHung26 lines 86–93, Theorem 1.1, p.2 | The source assumes its geometric inputs. The package explicitly imports them as planned results rather than suppressing that condition. CM and non-CM branches give the asserted totally real endpoint. |

Additional checks: §§1.5–1.6 use LeHung26 lines 243–249 and OpenAI26 lines 521–578 (Proposition 5.2, Lemma 5.3, Corollary 5.4, pp.13–14); §3.3 uses LeHung26 lines 264–269. FLHS15 lines 343–357 support the determinant-kernel and Cartan-normalizer Checks. BCDT01 line 15 is Theorem A on author-version p.1. BLGG12 lines 2024–2050 and 2198–2222 are Theorems 6.1.5 and 6.1.8 on pp.41–42,45; their extra image/local conditions are not silently claimed to be the general contract. BLGG13II lines 82–91 and 129–159 give the ordinary-lift results and restricted p=3 argument; the README expressly leaves the general cohomological-weight return to the supplier. Kisin09 line 3976 is Theorem (3.5.5), printed p.1170, and line 4068 is (3.5.7), printed p.1172. SW99 Theorems A and B are residually reducible, with Hypothesis H for B (SW99 lines 2491–2505); they are correctly identified as not substitutes.

### Headline coverage, Lean elaboration and padding

The roadmap's headline groups and their acceptance status are:

| Headline | Acceptance file |
|---|---|
| Relative totally real cyclotomic CM field and maximal real subfield (§1.1) | `realCyclotomic_isCMField`, line 58. |
| Reflection descent, character systems, compatibility, lattices and elliptic endpoints (§§1.2–1.6) | Named in module docstring; missing cyclic-cover family, cohomological Galois realizations and rotation-idempotent Jacobian construction. |
| Coefficient-prime change and rank-two summand lifting (§§2.1–2.2) | Named in docstring; missing Hilbert attachment and compatible-system interface. |
| Infinite 3–5 switch (§2.3) | `three_five_switch`, line 80, on native torsion, pairing, bases and Galois automorphisms. |
| Mod-three and mod-five seeds (§§2.4–2.5) | Named in docstring; missing residual Hilbert attachment. |
| Simultaneous specialization, auxiliary seed and three lifts (§§3.1–3.3) | Named in docstring; missing cover family and Hilbert attachment. |
| Non-CM descent, all-prime/all-place comparison, CM induction and universal endpoint (§§4.1–4.4) | Each named in docstring; missing automorphic representations, Hilbert attachment and local Langlands/induction interfaces. |

I ran the required `lake env lean` invocation on the unchanged package file from the content checkout: exit 0, exactly two warnings, both `declaration uses 'sorry'`, at lines 58 and 80. No import needed a targeted build. A separate scratch copy with `#check @` for both declarations also elaborated: the first retains both number-field structures, total reality, the relative algebra, `2<n`, cyclotomic generation and primitive-root condition; the second retains the number-field and ellipticity hypotheses and the actual torsion modules. No section binder was lost, and no signature changed.

A scratch copy tried `simp`, `rfl` and `infer_instance` as individual closing tactics on each of the two admitted declarations, with failed alternatives rolled back. Neither theorem closed. The nearby `exact IsCyclotomicExtension.Rat.isCMField` also fails: it supplies an absolute rational-base CM assertion, not the relative conjunction with equality of subfields. The switch has no nearby existence theorem in the pinned libraries; pairing and torsion structure theorems do not supply infinitely many arithmetic curves. Thus neither declaration is padding, a Check, a boundary case or a disguised definition.

Only the two headline identifiers are attributed to this roadmap as Lean declarations; both are present, and both appear in the README. Other named target identifiers belong to explicitly identified suppliers. There is one `import Mathlib` and exactly the three individual Tau Ceti modules used by the torsion/pairing signature. No local definitions, admitted examples, `lemma`, empty predicates, opaque maps, free conclusion hypotheses or option overrides occur.

### Pinned declarations and native-carrier audit

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, matching the package. The following declarations were opened at those pins, including their surrounding hypotheses:

| Pinned file | Declaration and relevant content |
|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | `IsTotallyReal`:48, `maximalRealSubfield`:126, `IsTotallyReal.le_maximalRealSubfield`:140, `isTotallyReal_maximalRealSubfield`:157, `IsTotallyComplex`:210. The subfield requires reality under every complex embedding, not one chosen embedding. |
| `Mathlib/NumberTheory/NumberField/CMField.lean` | `IsCMField`:70, `CMExtension.eq_maximalRealSubfield`:456, `IsCMField.ofCMExtension`:510, `IsCyclotomicExtension.Rat.isCMField`:564. CM includes total complexity and quadraticity; the last theorem fixes base ℚ. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean`; `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean` | `IsCyclotomicExtension`:74 requires primitive roots and generation; `IsPrimitiveRoot`:63 requires both the power-one law and exact-order divisibility. Merely containing ζ is insufficient for the headline. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean` | `IntermediateField.adjoin`:34 is the subfield closure of the algebra-map image together with the set. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | `WeierstrassCurve`:76, `IsElliptic`:366 requires unit discriminant, `j`:388 uses inverse discriminant times c₄³. Singular cubics are excluded by the signature. |
| `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean` | `AlgebraicClosure`:127 is the actual algebraic closure, not arbitrary field data. |
| `Mathlib/LinearAlgebra/Basis/Defs.lean`; `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | `Module.Basis`:89 and `Basis.equivFun`:222 supply actual coordinate equivalences; `SpecialLinearGroup`:70 is the determinant-one matrix subtype. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` | `WeierstrassCurve.torsionGaloisAction`:77 acts by additive automorphisms on the actual geometric torsion. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean` | `TauCeti.Isogeny.pointTorsionModule`:51; `WeierstrassCurve.nonempty_basis_torsionBy`:149. Separably closed field, nonzero N and invertibility are retained; the characteristic-zero algebraic closure satisfies them for N=3,5. Universal quantification over bases is not vacuous. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean`; sibling `WeilPairing/Galois.lean` | `TauCeti.Isogeny.weilPairing`:225 is valued in `Additive (rootsOfUnity N F)`; `WeierstrassCurve.weilPairing_torsionGaloisAction`:104 gives its Galois equivariance. Pairing equality is meaningful on the native common codomain. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`; sibling `TateModule/Determinant.lean` | `WeierstrassCurve.tateModuleGaloisRepresentation`:80 and `TauCeti.det_tateModuleGaloisRepresentation`:52 give the covariant determinant ε, correctly dualized in this roadmap. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean` | `quadraticTwistOf`:164, `quadraticTwist`:469, `quadraticTwistPointEquiv`:824, `quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`:945. The point equivalence has the quadratic character factor; separability and quadratic-extension hypotheses belong to this API. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean` | `pullbackDifferential`:79, `pullbackDifferential_comp`:102, `pullbackDifferential_add_invariantDifferential`:137. Pullback reverses composition and is additive on the invariant differential; this does not already state the general CM endomorphism-field theorem. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean` | `ellAdicSheaf`:64 and `EllAdicCohomology`:76 provide integral pro-étale cohomology and its additive group. This is not the missing rational, continuous Galois representation of the constructed cover with rotation action and comparison. The docstring's missing full carrier is therefore not contradicted by the existence of this preliminary object. |

Object searches covered CM/cyclotomic fields, torsion actions and symplectic pairing, reflection/cyclic-cover realizations, compatible systems, Hilbert attachments and local Langlands. Native general field and torsion operations are cited rather than redeclared. The preliminary scheme/cohomology and topological cyclic-cover hits do not supply the arithmetic family, actions and automorphic carriers needed by the omitted headlines.

### Supplier order, drift, ownership and gaps

The required dependency check returned:

```text
depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line was read. No prohibited supplier is consumed. HilbertModularForms is a downstream interface, not an upward prerequisite.

I ran the citation resolver again: no unresolved roadmap citation or Lean name. Its output expressly does not inspect local pinned Lake packages, so the pinned audit above was separate. The three initial leads are actual supplier targets in `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`: `GaloisRep.IsOdd` at 3144, `GaloisRep.iso_of_frobenius_charpoly_eq` at 3528 and `TateModule.residualRep` at 4065. They are not advertised as existing Mathlib/Tau Ceti declarations.

The following table records resolved citations against main or the indexed open heads. Paths in this table are `TauCetiRoadmap/<supplier>/README.md`; line numbers refer to that file, excluding the tool's added header.

| Supplier | Resolved sections/declarations and evidence |
|---|---|
| ModularCurves, main | §0E at 839 supplies effective descent of polarized projective curves and finite actions. Layers 3 and 5B, the latter at 2193, supply full-level structures and fixed-pairing curves. Genus m≥3 makes the canonical bundle usable in §1.2. |
| EllipticCurves, main | Layer 0.5 at 398 supplies base change/Galois/descent; Layer 1 at 423 differential/isogeny operations; Layer 4.5a at 905 model comparisons; Layer 5 at 1154 pointed twists. The higher-genus reflection twist uses ModularCurves' descent, not the pointed elliptic classification alone. |
| JacobianChallenge, main | Layers D–F at 218,332,448. The unpointed Pic⁰ assertion is explicit at 45 and the genus-one torsor distinction at 489. No rational point on D_t is presumed. |
| EllipticCurveModularityImaginaryQuadratic, #1048 | §0.2 fixed-pairing twist at 559, rationality at 585, `SymplecticTorsionEquiv` at 645; §§1.1–1.3 parameter at 864 and cover at 959; §3.1 integral marking at 1152; §4.1 rank-two character systems at 1258; §4.2 quotient/endpoints at 1309–1320; §§4.3–4.4 lattices/congruences at 1353,1388; §5.1 large primes at 1446; §§7.1,7.2,7.4 irreducibility and specialization at 1854,1903,1980. Both §4.1 and §7.4 expressly allow arbitrary number fields, and the latter owns the d-factor extension and normal-closure hypothesis. §§0.3,8.1,8.5,8.6 are comparison variants, not duplicated CM lifting. |
| SmallRamificationAndAbelianVarietyBaseCases, #970 | §5.0d at 1980, raw carrier at 1993 and restriction API at 2006–2013. Positive arbitrary rank, finite local realization fields, good-polynomial domain and geometric Frobenius/Tate-twist conventions agree. This is the decisive supplier for the repaired passage. |
| AutomorphicGaloisRepresentationsPartII, #1006 | AG2.P raw-data predicates at 431–478, independent Hilbert members at 488–530; AG2.0 geometric Hecke-character avatar at 743 and attachment at 818–851. Weak includes all-member de Rhamness and good-place crystallinity. Hilbert geometric polynomial is `X²−t_vX+q_vs_v`; `r(‖·‖)=ε`. |
| AutomorphicGaloisRepresentations, #1007 | §§3.10,3.13,3.14 at 2218,2340,2398 supply unrestricted Hilbert attachment, algebraic characters and determinant/oddness/irreducibility. §§4.4,4.7 at 2519,2543 supply full WD comparison away from and at the coefficient prime, with monodromy and without the residual restriction of §4.6. |
| PotentialAutomorphyInfrastructure, #1081 | §2.3 at 819, `soluble_base_change_and_descent` at 821: part (2) is descent of the prescribed continuous representation with irreducible restriction, including totally real bases and finite soluble Galois extensions. Weight zero specializes correctly. |
| GL2AutomorphicRepresentationsAndTransfer, #931 | R16.2.13 at 929; R16.3.2 at 961 (Steinberg N and factor), R16.3.5 at 995 (conductor), R16.3.6 at 1036 (gamma factors), R16.4.4 at 1136 (Hecke/strong multiplicity one), R16.6.3–4 at 1349,1373 (weight/parameter conventions), R17.4.16 at 2692 (quadratic induction), R17.5.14 at 2977 (weight-one residual witness). The last does not claim the cohomological-weight gap. |
| ArithmeticGaloisRepresentations, #856 | Layers 1–3 continuous representations, lattices, WD and conductors; §4.1 oddness at 3142–3149; §5.3 semisimple density recognition at 3515–3529; §§6.1–6.2 actual elliptic torsion/determinant, including residual construction at 4062–4079. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | IG.2.4 at 1965 defines Hilbert subsets using integral finite étale covers; IG.2.6 at 2165 gives full-group specialization and connected-fibre torsor criterion; IG.2.7 at 2304 supplies approximation. The switch uses integrality over K, not a false geometric-integrality assertion about the full frame torsor. |
| ModularCurvesPartII, #913 | §4.10 at 1560, `fixedPairingGeometricConnectedness` at 1572: N≥3, fixed primitive pairing, geometric connectedness and the φ(N) component count. Applied at N=15. |
| PotentialModularityAndCompatibleSystems, #1075 | §§1.1,1.6 at 95,210: comparison of predicates and automorphy through normalized good polynomials. These do not own the new descended geometric systems. |
| AbelianSchemesAndArithmeticModuli, #849 | A4.1 at 1838 integral Tate module and specialization; A6 and A6.11 at 3042 supply endomorphism actions and integral, coefficient-independent characteristic polynomials. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §§3.10,5.1,5.3,5.6,6.10 at 1895,3109,3200,3755,4296: semistable extension, good-reduction criterion, residue-prime comparison, bad-place Euler polynomials and compatible systems. H¹ is explicitly dual to covariant Tate. |
| FaltingsFinitenessAndIsogenyTheorems, #1004 | R28.4, especially R28.4.5 at 1858: rational Tate semisimplicity for abelian varieties over number fields. |
| EtaleCohomologyFoundations, main | §0.11 at 1157 supplies trace/curve duality; its finite/adic realizations, especially F.4, transport this to rational curve cohomology. The intended cup-product target is `ℚ̄_ℓ(−1)`. |
| ShimuraVarieties, #933 | §5.3 at 1525 supplies complex CM algebra action and CM types. It is correctly not cited as the general endomorphism-field theorem over K. |
| ComplexMultiplicationAndExplicitReciprocity, #1254 | §4.1 at 634, Hecke character at 638, Tate components at 642: action is defined over the base, and covariant Tate components use the inverse geometric avatar. §4.2 is the rational CM induction comparison; this package retains the distinct totally real-base variant. The general endomorphism-field statement remains a gap. |
| GL2ModularityLifting, #1071 | §§5.7,5.10 at 1334,1394 retain potentially Barsotti–Tate, component and residue-field restrictions. They do not already provide the wider declared contract. |
| HilbertModularForms, #1724 | §11.3 at 2401 requires a base-field modularity witness, exact conductor and local factors, and names the real-quadratic existence input. This package supplies the all-degree existence theorem to that interface. |

All three gaps have matching slugs in `design/plan.json` and the appropriate README supplier subsection, named owners, explicit hypotheses and a single mathematical obligation:

- `totally-real-weight-two-lifting` — GL2ModularityLifting Layer 5 after §5.10; README:396–403. The unrestricted potentially semistable weight-two lifting theorem and its precise five-adic alternative are absent from the narrower current targets.
- `totally-real-solvable-residual-cohomological-weight` — GL2AutomorphicRepresentationsAndTransfer R17.5 after R17.5.14; README:309–313. The current weight-one result does not supply a cohomological residual witness. The proposed route explicitly identifies what it has not established over F.
- `cm-elliptic-endomorphism-field` — ComplexMultiplicationAndExplicitReciprocity Layer 1 before §1.1; README:435–443. Pointwise differential operations and the base-defined CM character do not already give the general injective, equivariant field-of-definition criterion.

These are precise, minimal declared contracts, not unowned prerequisites. Acceptance is conditional on their delivery; no additional gap is needed by the repair.

I read the board-package index before ownership searches. Its other packages concern analytic number theory, Lawrence–Venkatesh and definability, not these objects. The roadmap service's object searches covered main and the indexed open heads; focused searches found no existing relative-field headline or universal totally real endpoint. The overlap report has no conflicting edit, dropped cited id, revision-only cited id or numbering migration requiring action.

The five nearest open roadmaps were compared by scope and relevant targets: #1048 owns arbitrary-field cover geometry and the imaginary-quadratic endpoint; #1036 (`TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md:3–15`) owns GL₂-type varieties over ℚ and ℚ-curves; #1484 (`TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:3–15`) owns rational-base wild 3-adic lifting and companion curves with extra local conditions; #1075 owns potential-modularity and compatible-family infrastructure; #1746 (`TauCetiRoadmap/AbelianSurfacesModularity/README.md:3–13`) owns the surface 2–3 switch. None owns the package's descended reflection systems or universal totally real endpoint. Fixed-pairing moduli and raw compatible data keep their earlier owners. No duplicate fully qualified Lean declaration was found.

## Not verifiable

- Delivery of the three declared supplier gaps is future work. The review certifies their precise scope, ownership and declaration, not a completed implementation. This is the permitted condition on acceptance.
- Journal pagination was not substituted for the explicitly cited preprint/author-version pagination. The versions and locators actually used were checked.
- Ownership was checked by object searches across the supplied indexed heads and inspection of relevant scopes and targets, not by proving every theorem in every open roadmap. No additional open head outside the supplied index was sought.

No required source was inaccessible. No missing-reference request is pending. All Lean processes used for this review finished.

## Source issues

- **Misprint** in LeHung26 at §3.1, introduction to Proposition 3.1, p.6 (LeHung26 line 230): the source says the lifting proposition uses Freitas–Le Hung–Siksek Theorem 3; it should be Theorem 2, their modularity lifting theorem; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ef42b482db6af03deb3d348a89856200611d89b6", "job": "REV-PKG-EllipticCurveModularityTotallyReal~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
