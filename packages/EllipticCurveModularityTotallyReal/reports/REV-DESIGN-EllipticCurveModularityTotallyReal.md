<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12848#issuecomment-6779365366 -->
Review (codex) of b4038a9

Verdict: needs_changes

1. **F01** (P1) The coefficient-ring hypothesis has no instances

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:527`: “whose integers O contain `j_ℓ(M₀)`”; also `packages/EllipticCurveModularityTotallyReal/design/plan.json:284`.

   **Claim:** The lattice and congruence theorem starts with a finite extension whose ring of integers contains the coefficient number field.

   **Witness:** For every ℓ, `1/ℓ ∈ j_ℓ(M₀)` but `v(1/ℓ) = −v(ℓ) < 0`; hence `1/ℓ ∉ O`. OpenAI26 line 547 instead puts the number field inside the finite extension itself.

   **Exact repair:** Choose a finite extension `E_ℓ/ℚ_ℓ` containing `j_ℓ(M₀)`, and put `O = O_{E_ℓ}`. State that the character values lie in `Oˣ`, not that the field lies in O. Make the identical correction in the plan. Specify rationalization followed by extension to `ℚ̄_ℓ`. For ℓ = 3, `E_ℓ = ℚ₃(μ_n)` works: every root of unity has valuation zero, whereas `1/3` still has negative valuation. The tensor product, its rank two, and its mod-three evaluation now have actual instances.

2. **F02** (P2) The five-adic exception is removed beyond the cited argument's coefficient domain

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:309`, “or that `det r̄ = ε̄₅⁻¹`”; §2.2 at lines 647–652, and the first gap's detail in `packages/EllipticCurveModularityTotallyReal/design/plan.json`.

   **Claim:** Cyclotomic determinant alone permits the five-adic clause for arbitrary `ℚ̄₅` summands and arbitrary residual coefficient fields.

   **Witness:** FLHS15 lines 263–265 use `PGL₂(𝔽₅) → 𝔽₅ˣ/(𝔽₅ˣ)²`. In `𝔽₂₅`, let `a²=3`, `B=[[0,2],[1,0]]`, `C=aB`. Then `C²=I`, `det C=4`, but `[C]=[B]` has nonsquare determinant class 3.

   The witness has the required odd involution eigenvalues `1,−1`, yet its actual determinant is square in `𝔽₅` while its projective class is outside `PSL₂(𝔽₅)`. Thus the determinant-square-class inference used for an `𝔽₅`-valued elliptic representation is unavailable over arbitrary residue fields. This is a source overclaim, not a claimed counterexample to all modern modularity lifting theorems. BD14 lines 2144–2146 retain the projective-image exclusion. LeHung26 lines 231–233 exclude ℓ = 5 altogether.

   **Exact repair:** State the general BD14 lifting contract with its five-adic projective-image hypothesis, and give the FLHS improvement as a separate clause when the residual representation has an `𝔽₅`-model with cyclotomic determinant. Apply that clause to elliptic curves in §§2.4–2.5. Retain all arbitrary-coefficient, potentially semistable cases actually covered by BD14; the three lifts at p,3,p remain unchanged. Update §2.2, the gap detail/needs, and the five-adic Checks consistently. If unrestricted exceptional arbitrary-coefficient lifts are to remain a target, they require their own exact theorem and supplier contract, not attribution to FLHS's argument. The repaired FLHS clause excludes C's incompatible projective/determinant square classes while retaining every elliptic `E[5]` used by this design.

3. **F03** (P2) The cubic quotient needs `3 ∣ n`

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:416`: “`C^δ_3/⟨w′⟩ ≅ D_t ⊗_k L`”; target 1.2 in `packages/EllipticCurveModularityTotallyReal/design/plan.json`.

   **Claim:** Section 1.2, under arbitrary odd `n ≥ 3`, uses the imported cubic member of the divisor-indexed cover tower.

   **Witness:** Set `n=5`, `m=5`. All stated hypotheses hold, but `3∤5`; the imported tower has indices 1 and 5, not 3. LeHung26 line 159 defines its members only for `m∣n`.

   Extending `Y³=f_t` by fiat does not fix the assertion: for n=5 its valuations at `S,−S,R,−R` are `1,−1,−5,5`, all nonzero modulo 3. Riemann–Hurwitz gives `2g−2=4(3−1)=8`, hence genus 5, rather than the genus-three cover used in the endpoint argument.

   **Exact repair:** Keep the general reflection construction for every odd n, but prefix the cubic quotient clause with `3∣n`. Carry that condition explicitly into the cubic endpoint interface and the plan. Add n=5 as a negative-control Check. For n=15 the valuations at R and −R are divisible by 3, so the cubic cover has two branch points, `2g−2=4`, and genus 3 as required. Do not narrow the entire layer to n=3p.

4. **F04** (P2) Raw-system assembly creates an internal dependency cycle

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:455–457`: “Populate the shared raw carrier … the good polynomials of §1.4”; §1.4's `Needs` at line 509.

   **Claim:** Section 1.3 constructs the raw compatible-system object, before §1.4 proves its polynomial and semisimplicity inputs, while §1.4 depends on §1.3.

   **Witness:** `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:1993–2001` (#970) requires good-place polynomials, semisimple members, Hodge multisets and finite local realization fields in the raw carrier. The design gives edges `1.3→1.4→1.3`.

   **Exact repair:** In §1.3 construct only the eigenspaces, their Galois actions and the idempotent/quotient interfaces. At the end of §1.4 assemble the raw carrier and prove its weak compatibility, after supplying the polynomials, semisimplicity, Hodge labels and finite realization fields. Update the plan statements and dependencies. For n=3 this preserves the three eigenspaces of dimensions 2,2,2; the raw object is created only after their three degree-two polynomials and weights `{0,1}` exist. The resulting direction is `eigenspaces → properties → packaged system`.

5. **F05** (P1) The CM endomorphism-field contract is not supplied at its citation

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:290–291`: “and the field of definition of CM endomorphisms”; consumed in §4.3, lines 967–975.

   **Claim:** ShimuraVarieties §5.3 supplies that geometric elliptic CM endomorphisms are defined over KT.

   **Witness:** `TauCetiRoadmap/ShimuraVarieties/README.md:1525–1553` (#933) defines a CM action on an abelian variety over ℂ and its eigenspaces; it gives no KT descent theorem. Its §5.6, line 1596, first passes to a field where endomorphisms are defined.

   The mathematical statement is correct, but the specific supplied prerequisite is absent. The ownership search found the actual invariant-differential argument in the later #1727, `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1628–1633` (§3.4). It also found the CM application in #1048, `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadratic/README.md:2286–2300` (§8.6). Neither makes the cited ShimuraVarieties contract true.

   **Exact repair:** Replace the claimed supplied assertion by a declared gap at the earlier ShimuraVarieties §5.3: for every number field K and geometrically CM elliptic E/K with embedded CM field T, the kernel of the Galois action on geometric endomorphisms is `G_{KT}`. Record one identical slug in plan and README and use it in §4.3. Record the ownership relocation from the later adelic-image application; do not introduce an upward citation as a prerequisite. The invariant-differential proof identifies the scalar of `gαg⁻¹` with g applied to the scalar of α. On `y²=x³−x`, `[i](x,y)=(-x,iy)` sends `dx/(2y)` to `i·dx/(2y)`; it is defined over ℚ(i), not ℚ. This both proves the required field test and distinguishes the false model with all CM endomorphisms already K-rational.

6. **F06** (P2) The 3–5 switch is statable at the pins

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:93`: “The field statement of §1.1 is the one result here that the pins already express.”

   **Claim:** Every other headline must wait for missing supplier carriers.

   **Witness:** At the pin, `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` defines `WeierstrassCurve.torsionGaloisAction`; `Isogeny/MulByInt/WeilPairing/Basic.lean:225` defines the Weil pairing; `Isogeny/MulByInt/Torsion/Structure.lean:149` gives rank-two torsion bases.

   **Exact repair:** Correct the statability paragraph to include §2.3 as a package acceptance theorem. It can quantify over native `WeierstrassCurve K` with `IsElliptic`, an additive isomorphism of geometric five-torsion commuting with the native Galois actions and preserving the native pairing, and a basis of three-torsion in which the image contains every determinant-one matrix. Its infinite-j conclusion is a native `Set.Infinite` statement using `WeierstrassCurve.j`. These are short predicates on existing objects, not an artificial automorphy encoding. Preserve the arbitrary-number-field and infinite-j conclusions. For `K=ℚ(√−3)` the determinant is 1 and the requested image is `SL₂(𝔽₃)` of order 24, not `GL₂(𝔽₃)` of order 48. No missing automorphic carrier occurs in this statement. This finding concerns the design's false statability assertion; absence of a Lean file at the design stage is not itself a finding.

7. **F07** (P2) Unramified base change does not remove residual inertia

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:330`: “base change unramified above p”; the second gap detail at `packages/EllipticCurveModularityTotallyReal/design/plan.json:1104`.

   **Claim:** The cited ordinary-lift route uses an auxiliary extension unramified at p to reach the unramified residual situation needed there.

   **Witness:** BLGG13II lines 129–145 require the restricted representation to be unramified. For a local residual inertia matrix `diag(−1,1)` at odd p, any finite unramified extension leaves the inertia group unchanged, so the matrix remains `diag(−1,1)≠I`.

   **Exact repair:** Replace the extension restriction by “a finite soluble totally real extension, linearly disjoint from the residual-kernel field, over which the restricted residual representation is unramified above p,” allowing ramification in the extension. Distinguish the residual representation being unramified from the extension being unramified. Explain that the cited proof treats p=3 and its stated projective-image/local hypotheses; the universal cohomological-weight result remains the precise declared supplier obligation, including return to the original field. On the quadratic tame-inertia example a ramified quadratic local extension kills the matrix, whereas an unramified extension does not. Do not claim that the cited proof already establishes the entire arbitrary-p supplier contract.

8. **F08** (P3) The README does not carry the two gap identifiers

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:298–332`; compare the `gaps` list and `gap:` prerequisites in `packages/EllipticCurveModularityTotallyReal/design/plan.json`.

   **Claim:** The two prose “Required of” contracts are the declared supplier gaps consumed by the plan.

   **Witness:** The plan has two slugs and two `gap:` prerequisite references; the README has zero occurrences of either slug or of `gap:`.

   **Exact repair:** Label each README contract with its identical plan slug, and identify that slug in the corresponding `Needs` line. Retain the named suppliers and full hypotheses, with R02/R07's corrections. The declaration check should then count one matching contract for each slug in both files. The suppliers' not having implemented these contracts today is not a finding.

9. **F09** (P3) BLGG12 Theorem 6.1.8 is on page 45

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:1084` and `packages/EllipticCurveModularityTotallyReal/sources.toml`, BLGG12 locator: “Theorem 6.1.8, p.44”.

   **Witness:** BLGG12 line 2192 starts printed page 45; line 2198 begins Theorem 6.1.8. The preceding page contains Theorem 6.1.7.

   **Exact repair:** Change the locator to p.45 of arXiv v1 in the README and, by the authorized fix worker, the existing BLGG12 manifest entry. Do not create a second source key. The theorem number and extraction line 2198 are correct. This review leaves the author-recorded manifest unchanged.

10. **F10** (P3) Negative Checks omit cases where their assertions reverse

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:559–560`, “the group `G_L` does not act”; lines 841–842, “only known on `G_{L(ζ₅)}`”; and the unqualified divisor API at lines 377–378.

   **Witness:** For θ=1 the untwisted evaluation is G_L-stable because `1⁻¹=1`; for trivial δ every character evaluation is stable. Also `G_{L(ζ₅)}⊆G_{K(ζ₅)}`, so irreducibility on the former implies irreducibility on the latter.

   **Exact repair:** Restrict the first negative Check to nontrivial δ and `θ≠θ⁻¹`, and add θ=1 as its positive control. Rewrite the seed Check to say that the seed is applied directly over L, avoiding a separate automorphic base-change step, although the residual condition is also known over K. Apply the same correction to the corresponding plan tests. For θ=1 the two character labels compute to 1; for order-three θ they are distinct in characteristic zero. In the second Check a group-invariant line would also be subgroup-invariant, so both invariant-line sets are empty under the stated hypothesis. In §1.1 restrict the divisor API to d≥3, the defining domain of the data: if one extends it to d=1 or 2 by the trivial character, that character does not equal δ_n when δ_n is nontrivial. For k=Q,n=3,d=1, their values at complex conjugation are respectively 1 and −1.

11. **F11** (P3) The new lattice definition needs its explicit API

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:525–560`; target 1.5 has `api: []` in `packages/EllipticCurveModularityTotallyReal/design/plan.json`.

   **Claim:** Section 1.5 introduces `T^δ_θ` as a new construction but records only theorem prose and Checks, unlike the other definitions.

   **Witness:** Sections 1.1–1.3 each have five API bullets. Section 1.5 defines a tensor-product lattice, has four Checks, and has no API list in either representation of the design.

   **Exact repair:** After R01, list the lattice's actual universal evaluation map, O-rank two, Galois-linearity, identification after extension to `ℚ̄_ℓ`, coefficient-extension compatibility, and reduction by the residual character, with their hypotheses. Keep these as prose API facts, not padded Lean theorems. The test `ℓ=3∣n` must still give rank two and residual evaluation at η=1 without using `1/3` in O.

Reviewed the 18 targets in `packages/EllipticCurveModularityTotallyReal/design/README.md` and `packages/EllipticCurveModularityTotallyReal/design/plan.json`, all nine recorded sources, the supplied overlap/citation leads, the pinned declarations below, and the named supplier interfaces. There is no previous review. This is a repairable design: its totally real endpoint and ownership boundary are appropriate. There are 11 findings, seven blocking (two P1 and five P2). No author-written design or source-manifest entry was edited.

## Verified sound

The following are positive checks, not repairs or a claim that the whole design passes.

- All 18 targets and their plan counterparts were read. Four layers have their own mathematical titles, individual `Needs` lines, Examples and Dependencies. The source order is not copied: reflection descent precedes lifting here, while LeHung26 §3.1 precedes §3.2. The resulting mathematical dependence, apart from R04, explains the order.
- The design imports the cyclic covers, their integral marking, untwisted systems and simultaneous specialization. It does not reconstruct their supplier roadmap. Rational elliptic modularity and the imaginary-quadratic endpoint are comparisons, not owned new endpoints. There are no computational algorithms, copied source passages, sorry'd data, `set_option`, or instructions from untrusted material adopted into this review.
- The arbitrary-base reflection construction retains the trivial-character and trivial-extension cases; the target remains all totally real fields, all elliptic curves and all finite places. The general lifting theorem remains upstream. Both existing supplier gaps have named owners and substantive, single-result statements. Their absence from today's suppliers was not counted as an unowned prerequisite.
- All nine cited works are present under unique manifest keys. Their recorded versions distinguish arXiv and publication pagination. No extra source fetch or missing-source request was necessary. No locator is marked unverified in the design. The bibliography dates identify source versions, not review history.

### Adversarial calculations

Each row records actual values, dimensions, images or domain membership, rather than a bare assertion of correctness. All 18 targets are represented; the seeded sample is therefore covered in full. The values test the statements and conventions, not proofs of the global modularity theorems. Zero rings, inseparable extensions and equal-characteristic base fields are excluded by the explicit number-field/characteristic-zero hypotheses; rank-zero summands are excluded by dimension two. Reduction at 2 is retained in the endpoint but excluded in the odd-prime lifting input.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions, geometric Frobenius and half-shift | 11a1 has 5 points over F₃, hence `a₃=3+1−5=−1`; cohomological polynomial `X²+X+3`, determinant 3. Dual has trace `−1/3`, determinant `1/3`. Unitary roots have product 1; shift `s−1/2` restores `1+3^(−s)+3^(1−2s)`. | Normalization agrees with the Hilbert supplier; the opposite shift gives exponents `−s−1,−2s−1`. |
| 1.1 real cyclotomic data | Q,n=3: ζ+ζ⁻¹=−1, degrees `[L:Q]=1,[M:L]=2`, δ(Frob₂)=−1, δ(Frob₇)=1. Q,n=9: `x³−3x+1=0`, degree 3; n=15 degree 4. Q(i),n=3: L=Q(i), maximal real subfield of M is Q(√3), unequal. | Field construction and the total-reality restriction survive these tests. For divisor API retain the defining domain d≥3; d=1,2 have trivial character and are boundary cases, not an unrestricted equality with δ_n. |
| 1.2 reflection descent | `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]`: `WRW=R²=[[-1,1],[-1,0]]`, `WR²W=R`, `W²=I`. For n=5, m=3 is not an index; extending its equation gives genus 5 rather than 3. For n=15 it gives genus 3. | Descent matrix and inverse convention pass; R03 fixes the cubic clause. |
| 1.3 character eigenspaces and raw carrier | n=3: `dim H¹=6=2+2+2`. Each projector has rank 2; `e_θ²=e_θ`, and the zero projector has rank 0. Induction across index two has dimension 4, not 2. Raw-carrier prerequisites in 1.3 include values/proofs first produced in 1.4. | Eigenspace definition excludes the wrong induction; R04 separates assembly from construction. |
| 1.4 pairing, weights, oddness | On paired bases `e₁,e₂` and `f₁,f₂` with w exchanging e and f, `[e₁,e₂]=1`, `[e₂,e₁]=−1`, diagonals 0. Direct cup product on a nonself-inverse θ-space is 0. At c, eigenvalues 1,−1 give determinant −1 and trace 0; at good q determinant q. Hodge multiplicities solve `a_θ=a_(θ⁻¹)`, `a_θ+a_(θ⁻¹)=2`, giving 1,1. | Reflection pairing, duality and weights are consistent. |
| 1.5 lattices and three congruences | `v(1/ℓ)<0` refutes O containing M₀. After R01, `O[C_n]²⊗_θ O=O²`. Mod p: `(η,χ,ψ,1)=(η,η,1,1)`; mod 3: `(1,ψ,ψ,1)`. At ℓ=3 the projector coefficient 1/3 is nonintegral. At θ=1, θ⁻¹=1. | R01, R10, R11; the forward congruence chain and direct cubic-to-trivial congruence are correct. |
| 1.6 elliptic endpoints | w=−1 on rank-two W₁ has invariant rank 0; swapping two rank-two cubic pieces gives invariant rank 2. For `x³−x+1` over F₅: 8 points, trace −2; nonsquare twist `3(x³−x+1)`: 4 points, trace +2. δ²=χ²=1. | Both endpoint dimensions and the two twist signs agree. Rational pullback/norm composites are degree times identity; their degrees need not be units integrally. |
| 2.1 coefficient prime | At good 3 of 11a1, every ℓ≠3 has polynomial `X²+X+3`. A nonzero unipotent extension and its split semisimplification both have polynomial `(X−1)²`, but fixed-space dimensions 1 and 2. | Semisimplicity and fixed coefficient labels are essential; no new local comparison follows from good polynomials alone. |
| 2.2 weight-two summands | e=0 has dimension 0 and fails; e=1 on an elliptic H¹ has dimension 2 and weights 0,1. Odd determinant reduces to −1 at 3, but to 1 at 2. In F₂₅, C from R02 has C²=I, det C=4, projective determinant class 3. | Odd-prime and dimension guards pass; R02 repairs the unsupported arbitrary-coefficient five-adic clause. |
| 2.3 switch curve | `#SL₂(F₃)=24`, Borel order 12, Cartan normalizers 8 and 16; rational-line stabilizer in SL₂ has order 6. Over Q(ζ₃), determinant image has order 1, so GL₂ image of order 48 is impossible but SL₂ is allowed. Full frames have 2 geometric components; a fixed pairing has 1. | The component argument and SL₂ formulation pass. Native torsion/pairing carriers make this statable (R06). |
| 2.4 mod-three seed and supplier route | Derived-series orders `48,24,8,2,1` give quotient orders 2,3,4,2. At real c, dual determinant is −1=2 in F₃. A ramified inertia matrix diag(−1,1) stays unchanged after unramified extension. | Solvable/odd seed calculation passes; R07 repairs the proposed weight-change route. |
| 2.5 mod-five seed | If image contains SL₂(F₃), intersection with SL₂ is SL₂ of order 24, not a line stabilizer of order at most 6. Five-torsion isomorphism preserves its dual residual representation. 11a1 has a rational 5-torsion line, hence invariant dimension at least 1 and fails absolute irreducibility. | Source's elliptic five-adic theorem applies with its F₅-model; no hypothesis at 3 on the original curve is needed. |
| 3.1 simultaneous parameter | At cubic λ, `2−λ−λ⁻¹=3`, nonzero mod 5. Unit orders in F_(3^a), a=1,2,3,4, are 2,8,26,80; none contains order p>100. At p=101, n=303, `[L:Q]=100,[M:L]=2`; `L(ζ₃)=L(ζ₁₀₁)=M`. | The imported arbitrary-number-field specialization and subgroup irreducibility implication give all five conditions for the same t. |
| 3.2 seed over L | Both cubic characters have rank 2 and equal H¹(A_t). `G_(Lζ₅)⊆G_(Kζ₅)`; no invariant line for the former implies no invariant line for the latter. Seed prime 5 differs from both 3 and p>100. | The direct application over L works; R10 corrects the “only known” Check. |
| 3.3 lifts | At p source/target labels reduce η=χ; at 3 they reduce χ=ψ; at p they reduce ψ=1. Each target rank is 2, determinant ε⁻¹, weights 0,1; prime sequence p,3,p contains zero occurrences of 5. | All three lifting applications match the irreducibility rows; the five-adic overclaim is unnecessary here. |
| 4.1 descent | Over L, `W₁⊗δ=H¹(B_t)` since δ²=1; over K, `H¹(B_t)⊗χ=H¹(E)` since χ²=1. For h(t) square, χ=1. A rank-two representation with absolutely irreducible residual restriction cannot have a rank-one characteristic-zero invariant subspace. | Soluble descent applies to the same irreducible representation; quadratic descent choices are resolved by the original G_K-action. |
| 4.2 all places | 11a1 at 11: split multiplicative, factor `(1−11^(−s))⁻¹`, conductor exponent 1, rank N=1. `x³−x+1`: Δ=−368, c₄=48, v₂₃(Δ)=1; 5 is nonsquare mod 23, residue degree over Q(√5) is 2, so the split sign becomes (+1). `x³−x` at 2: factor 1, conductor exponent 5. | Good/multiplicative/additive degrees 2/1/0 retained; coefficient-prime comparison is separately supplied, not inferred from Chebotarev. |
| 4.3 CM branch | `x³−x`: counts 4 over F₃, 8 over F₅; traces 0,−2. At 5, `(-1+2i)+(-1−2i)=−2`, product 5. `[i]^*ω=iω` requires Q(i). `x³+1` has 6 points over F₅ and trace 0. | Induction and local normalization pass; R05 repairs the unsupported endomorphism-field contract. |
| 4.4 endpoint | Q is totally real of degree 1; Q(ζ₁₅)⁺ has degree 4 and contains √5. For everywhere-good E, all finite conductor exponents are 0, so their product is the unit ideal. The two CM/non-CM branches are exhaustive. | No degree, √5, reduction-type or good-primes-only restriction appears in the endpoint. |

### Source sample and locator audit

The version/page checks below use the cached line-numbered source text, not recollected theorem numbers. All 15 seeded targets were inspected. The other three targets and every source-bearing supplier contract were also read.

| Target(s) | Source and inspected locator | Hypothesis/support result |
|---|---|---|
| 1.1 | LeHung26 line 237, §3.2 p.6 | Source fixes totally real K and n=3p. The design's elementary arbitrary-base extension is supplied with its own field argument; n=1,2 are only boundary checks. |
| 1.2 | LeHung26 lines 237–240, 245–249, §3.2 (9), Lemma 3.2 p.6 | Reflection cocycle and rational rotations verified. The source's n=3p does not justify the unguarded cubic clause for arbitrary n: R03. |
| 1.3 | LeHung26 lines 241–242, Lemma 3.2 p.6 | Descended eigenspaces verified; packaging order is a design issue, R04. |
| 1.4 | LeHung26 lines 247–248 p.6; OpenAI26 lines 480–514, Proposition 5.1 pp.12–13 | Rank, reflection pairing, weights, semisimplicity and Frobenius trace argument read. Restriction to M handles Hodge properties; descent's L-rational actions handle compatibility over L. |
| 1.5 | LeHung26 lines 243, 246–247 p.6; OpenAI26 lines 547–578, Lemma 5.3 p.13 and Corollary 5.4 p.14 | All three residual primes and integral evaluation verified; source places M₀ in the coefficient field, not its integers: R01. |
| 1.6 | LeHung26 lines 244, 248–249 p.6; OpenAI26 lines 521–541, Proposition 5.2 p.13 | Cubic quotient's rank two and both endpoint signs verified, with 3∣n. |
| 2.1 | LeHung26 lines 221–224, §2.4 p.5 | Same automorphic representation recovered from fixed good polynomials and semisimplicity. |
| 2.2 | LeHung26 lines 231–235, Proposition 3.1 p.6; BD14 lines 2144–2176, Théorème 3.2.2 pp.36–37; FLHS15 lines 116–120 p.3 and 221–265 pp.5–6 | BD14's universal modularity conclusion, including nonzero monodromy, is present. The source's five-adic exclusion and FLHS's F₅-valued determinant argument must not be conflated: R02. |
| 2.3 | FLHS15 lines 421–452, Lemma 6.1 and proof p.10 | Arbitrary number field, symplectic five-torsion isomorphism, SL₂ mod-three image. Infinite j follows from Hilbert finite avoidance and the nonconstant modular j-map; no total-reality hypothesis needed. |
| 2.4 | FLHS15 lines 404–412, Theorem 6 and Corollary 5.1 p.9 | Elliptic mod-three residual modularity and cyclotomic irreducibility criterion verified. |
| 2.5 | FLHS15 lines 127–128 p.3 and 426–429 p.10 | Theorem 3 and its p=5 proof support exactly the elliptic seed. |
| 3.1 | LeHung26 lines 250–260, §3.3 p.6; OpenAI26 lines 990–1030, Proposition 8.4 p.23 onward | OpenAI's proof has two conjugate factors; the general d-factor extension is explicitly owned by the imported roadmap §7.4, not silently attributed to the source. |
| 3.2–3.3 | LeHung26 lines 264–269, §3.4 p.7 | Seed over L and the p,3,p table agree. |
| 4.1 | LeHung26 lines 270–271 p.7 and 357–360, Lemma 5.1 p.9 | Abelian descent with irreducible restriction and character correction verified. |
| 4.2 | LeHung26 lines 361–363 p.9; FLHS15 lines 66–77 p.2 | The source gives modularity/local compatibility; the detailed conductor, monodromy and coefficient-prime clauses use the explicit suppliers resolved below. |
| 4.3 | LeHung26 lines 364–366 p.9 | Character splitting and induced versus sum branches read; the KT field-definition supplier needs R05. |
| 4.4 | LeHung26 lines 86–93, Theorem 1.1 p.2; BCDT01 line 15 p.1; FLHS15 lines 87–88 p.2 | LeHung's theorem is conditional on geometric Inputs 2.1–2.2. The design explicitly imports their proofs, so it does not erase that premise. Rational and real-quadratic statements are comparisons. |
| Lifting contracts | BLGG12 lines 2024–2052, Theorem 6.1.5 pp.41–42; lines 2192–2223, Theorem 6.1.8 p.45 | Prescribed ordinary lifts and potentially Barsotti–Tate theorem retain their stated image/local hypotheses. Page correction R09. |
| Lifting contracts | BLGG13II lines 82–116, Theorem 2.1.2 pp.2–3; lines 122–159, Theorems 3.1.1–3.1.2 pp.3–4 | Adequate and special p=3 branches inspected, including original modularity and local reducibility hypotheses; R07 concerns the misuse of unramified base change. |
| Lifting contracts | Kisin09 lines 3976–4009, (3.5.5), printed p.1170 | Strong residual modularity, residue-field restriction, projective-kernel condition and Gee footnote read. It is not an unrestricted substitute. |
| Excluded supplier | SW99 lines 2468–2505, Theorems A–B printed pp.74–75 | Residually reducible ordinary hypotheses and Hypothesis H verified; correctly excluded as a substitute for this irreducible lifting input. |

### Pinned-library audit and headline signatures

Pins agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Opened the following native declarations and their surrounding binders:

| Pinned file and line | Declaration / inspected content |
|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48` | `NumberField.IsTotallyReal`: every infinite place is real. |
| Same file, lines 126, 140, 157 | `maximalRealSubfield`, `IsTotallyReal.le_maximalRealSubfield`, `isTotallyReal_maximalRealSubfield`; membership requires conjugation fixedness under every complex embedding, not just one. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:70` | `NumberField.IsCMField`: totally complex and quadratic over its maximal real subfield. |
| Same file, lines 456, 510, 564 | `CMExtension.eq_maximalRealSubfield`, `IsCMField.ofCMExtension`, `IsCyclotomicExtension.Rat.isCMField`; total complexity, total reality, quadraticity and algebraicity retained. Cyclotomic result requires some n>2. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | `IsCyclotomicExtension`; the relative cyclotomic/real-subfield adapter is not the same as the supplied rational-base CM theorem. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:80` | `WeierstrassCurve.tateModuleGaloisRepresentation`: actual action on the homological Tate module; prime binder present. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | `TauCeti.det_tateModuleGaloisRepresentation`; ellipticity, separable closure and `(ℓ:K)≠0` are in scope. Duality reverses its cyclotomic determinant for H¹. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:164` | `quadraticTwistOf`: coefficient formula; its singular inputs do not by themselves assert ellipticity. |
| Same file, lines 469, 824, 945 | `quadraticTwist`, `quadraticTwistPointEquiv`, `quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`; separable quadratic extension and the ±1-equivariance rule are real inputs. A trivial δ uses the separate untwisted branch. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` | `torsionGaloisAction` on native geometric N-torsion. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:225` | `TauCeti.Isogeny.weilPairing`, on actual torsion, valued in roots of unity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean:149` | `nonempty_basis_torsionBy`, a `Fin 2` basis over `ZMod N`. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:388` | `WeierstrassCurve.j`, available for the infinite-j switch conclusion. |

Object searches found torsion, twists, CM predicates, finite-group representations and rational/classical modular-form infrastructure; these are not Hilbert cuspidal automorphic representations or a Hilbert attachment. The roadmap correctly imports those missing automorphic carriers, but its blanket statability exclusion misses §2.3 (R06).

The headline inventory is: reflection-descended rank-two systems with determinant/weights/lattices/endpoints (§§1.2–1.6); compatible change of prime (§2.1); weight-two summand lifting (§2.2); the number-field 3–5 switch (§2.3); the two totally real elliptic seeds (§§2.4–2.5); simultaneous specialization and three lifts (§§3.1–3.3); non-CM descent (§4.1); all-coefficient/all-place compatibility (§4.2); CM induction (§4.3); and full totally real modularity (§4.4). The relative field theorem §1.1 is also a nontrivial statable target. The automorphic statements lack Hilbert automorphic/attachment carriers; the geometric cover statements additionally lack the imported cover/cohomological-family constructions. At package stage each nonstatable headline must be named individually in the module docstring; §§1.1 and 2.3 must not be replaced by Checks or one-tactic consequences of the existing field/torsion definitions.

There is no `Suggested.lean` in this design. Thus there are zero sorried theorem declarations to probe, zero own Lean identifiers to match, and no import header, declaration docstrings, or section-variable signatures to elaborate. **Elaboration: not available (this lane does not elaborate; say so in the report).** No Lean command was run; no passing build or “sorry only” warning result is claimed. The one-tactic/padding test is not applicable to an absent design-stage file, not recorded as a successful package test.

### Supplier and ownership resolution

Read the main roadmaps `TauCetiRoadmap/EllipticCurves/README.md`, `TauCetiRoadmap/ModularCurves/README.md`, and `TauCetiRoadmap/JacobianChallenge/README.md` for the inherited shapes and base scope. Existing-main interfaces were checked there; new-roadmap interfaces were inspected with `roadmaps show` at their supplied open heads. Line numbers below refer to the README itself, excluding the tool's one-line provenance wrapper.

| Supplier | Resolved interface and witness |
|---|---|
| EllipticCurveModularityImaginaryQuadratic (#1048) | §0.2 fixed-pairing twists; §§1.1–1.3 covers; §3.1 integral marking; §§4.1–4.4 systems/endpoints/evaluation/congruences (README lines 1258–1412); §5.1 large residual primes; §7.1 monodromy; §7.4 lines 1981–2060 explicitly extends specialization to arbitrary number fields with the normal-closure prime choice. |
| AutomorphicGaloisRepresentations (#1007) | §3.10 lines 2219–2277, Hilbert constructor and geometric `X²−tX+qs`; §3.13 geometric characters; §3.14 irreducibility/determinant; §§4.4 and 4.7 lines 2520–2580, full away/coefficient-prime compatibility without the residual restriction of §4.6. |
| AutomorphicGaloisRepresentationsPartII (#1006) | AG2.0 attachment/characters; AG2.P independent Hilbert members, lines 488–531, explicitly identifies the cohomological member and separates its arithmetic dual. |
| PotentialAutomorphyInfrastructure (#1081) | §2.3 lines 819–825, soluble base change/descent for the same continuous representation, irreducible restriction, and all finite local parameters. |
| GL2AutomorphicRepresentationsAndTransfer (#931) | R16.2.13 archimedean cases; R16.3.2 monodromy, R16.3.5 conductors, R16.3.6 infinity factors; R16.4.4 strong multiplicity one; R16.6.3–4 weight/parameter conversion; R17.4.16 lines 2692–2718 quadratic induction; R17.5.14 lines 2977–2985 only a weight-one residual witness. |
| GL2ModularityLifting (#1071) | §§5.7 and 5.10 lines 1334–1340 and 1394–1400 retain strong/local restrictions and do not supply the declared BD gap. |
| ArithmeticGaloisRepresentations (#856) | §4.1 lines 3143–3150 plans `GaloisRep.IsOdd`; §5.3 lines 3514–3530 plans `GaloisRep.iso_of_frobenius_charpoly_eq`; §6.1 around line 4065 plans `TateModule.residualRep`. These resolve all three automated missing-name leads: they are supplier targets, not claims of pinned declarations. Layers 1–3 carry the lattice, WD and conductor inputs. |
| InverseGaloisAndArithmeticFundamentalGroups (#850) | IG.2.4 at line 1965, IG.2.6 at 2165, IG.2.7 at 2304; integral finite étale Hilbert data, connected fibres and number-field approximation. The design uses a connected component, not the geometrically disconnected full frame space as integral data. |
| ModularCurves (main) | §0E around line 839 effective descent with a descended ample line bundle; Layers 3/5B level and fixed-pairing structures. Genus m≥3 supplies the ample canonical bundle for §1.2. |
| ModularCurvesPartII (#913) | §4.10 lines 1560–1582: fixed-pairing geometric connectedness for every N≥3; N=15 is in its domain. |
| EllipticCurves (main) | Layer 4.5a model comparisons; Layer 5 twists. No global minimal model is presumed. |
| JacobianChallenge (main) | Layers D–F, including the explicit unpointed Pic⁰ representability at README lines 44–46. The point is needed for a normalized Abel–Jacobi map, not for existence of Pic⁰. |
| SmallRamificationAndAbelianVarietyBaseCases (#970) | §5.0d lines 1993–2025 gives the shared raw system and its semisimple/finite-model data; R04 repairs premature population. |
| PotentialModularityAndCompatibleSystems (#1075) | §1.1 comparison of raw weak families; §1.6 lines 210–240 separates automorphy and away-coefficient strictness. No generic carrier is re-owned here. |
| AbelianSchemesAndArithmeticModuli (#849) | A4.1 lines 1838–1846 Tate modules; A6 endomorphism realizations; A6.11 lines 3042–3049 integral, ℓ-independent endomorphism characteristic polynomials. |
| NeronModelsAndSemistableAbelianVarieties (#852) | §3.10 semistable reduction; §5.1 NOS; §5.3 finite-p-adic-field comparison; §5.6 lines 3755–3762 local Euler polynomials; §6.10 lines 4296–4303 strict abelian H¹ systems. Its §5.3i also explicitly compares the native elliptic local polynomial. |
| FaltingsFinitenessAndIsogenyTheorems (#1004) | R28.4.5 lines 1858–1862 supplies semisimplicity over number fields at every coefficient prime. |
| ShimuraVarieties (#933) | §5.3 supplies CM actions/eigenspaces; the additionally claimed KT endomorphism-field result is R05. |
| EtaleCohomologyFoundations (main) | §0.11 trace and curve duality at torsion coefficients, with its F.4/F.5 adic realization; the proper smooth curve pairing has H² target Q̄ℓ(−1). |

The dependency check was run exactly on the candidate and the supplied merge order. Its output was:

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2149 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This checks inter-roadmap edges, not the implicit internal cycle in R04. No forbidden supplier is named. No modification to ORDER.txt is requested.

The overlap report has no conflicting head, dropped cited identifier, identifier available only in an open revision, or dropped identifier cited by another roadmap. Its five closest roadmaps were compared by scope: #1048's endpoint is imaginary quadratic and its general geometric ingredients are imported; #1036 `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md:3–15` owns GL₂-type varieties over ℚ and ℚ-curves, not arbitrary elliptic curves over totally real fields; #1484 `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:3–17` owns rational-field wild 3-adic lifting and its rational switch; #1075's raw family and potential-modularity infrastructure remains imported; #1746 `TauCetiRoadmap/AbelianSurfacesModularity/README.md:3–15` owns the surface 2–3 switch and rank-four endpoints. #2137 GL2ModularityLiftingPartII's defect-one weight-one/Bianchi theory does not fill either declared gap. The extra CM ownership hit #1727 is recorded in R05 with its exact file/line and supply-direction repair.

Read the board-package index before checking for absent packages. The available heads of `packages/AnalyticNumberTheory/README.md` and `packages/LogicAndDefinabilityInNumberTheory/README.md` were fetched read-only and searched by the relevant objects; their analytic/definability constructions do not own the reflection descent or the totally real elliptic endpoint. The third indexed package was inaccessible as recorded below. Searches against open work used the supplied `roadmaps grep/show` service; no unprovided pull-request head was independently sought.

## Not verifiable

- Lean elaboration, elaborated `#check @name` signatures, and executable one-tactic probes: this lane explicitly does not elaborate, and the reviewed design contains no `Suggested.lean`. Package-stage checks must run on the resulting file.
- `packages/LawrenceVenkateshMethod/README.md` at the board index's supplied head `9ee7ac3` (#345): the read-only contents request returned HTTP 404. Ownership against that package's contents was not certified. The other two indexed package heads were readable.
- No source text in the nine-work manifest was unreadable. No source is placed in a missing-reference request. The unrestricted arbitrary-coefficient five-adic extension is unsupported by the cited proof as explained in R02, rather than falsely reported as an inaccessible text.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b4038a90842b046f1d2ff4b57aface7d5f08b8fa", "job": "REV-DESIGN-EllipticCurveModularityTotallyReal", "model": "gpt-6-astra", "worker": "chris-3"} -->
