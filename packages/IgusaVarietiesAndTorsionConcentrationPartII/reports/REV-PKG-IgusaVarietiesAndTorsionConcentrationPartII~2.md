# Review of IgusaVarietiesAndTorsionConcentrationPartII (package, round 2)

**Verdict:** needs changes

Seven findings: three P1 and four P2. All nine findings of the previous review are repaired. The new findings concern mathematical statements and supplier hypotheses, not the execution of those repairs. The package remains a repairable Part II extension. No package statement was edited during this review.

## Previous findings: repair verification

Locations in this table are in `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md`, unless specified otherwise. The identifiers F01–F09 are those in the repair report.

| Previous finding | Status and repaired passage | Independent verification |
|---|---|---|
| F01, irreducible-factor divisibility | **Repaired**, line 443: “every isotypic degree `m_i e_i` is divisible by `d_v`”. | For a central element in a quaternion division algebra, the polynomial is `(X−γ)²`: factor degree 1, isotypic degree 2. For a quadratic splitting field the scalar-extension index is `2/gcd(2,2)=1`. The new whole-isotypic-factor argument gives the required divisibility for relatively prime endoscopic blocks. |
| F02, nonexistent parent prefixes | **Repaired**, line 59: “§0.11: unramified local PEL data”; line 63: “§3.17: the compact fibre theorem”. | Opened the parent at its indexed head, including §§0.4, 0.11, 1.3–1.8, 3.14, 3.17, 4.4–4.5, 5.1–5.5 and 7.6. The `IG.` prefixes are gone from the reviewed README and source-manifest labels. The rank-one reduction was also checked in CS17 lines 3159–3187: the locally constant sheaf is on the fibre. |
| F03, compactification citations | **Repaired**, line 107: “§§7.3 and 7.5: integral toroidal compactifications and their properness”; “§7.18: ... a quasi-projective scheme”. | The current supplier has these headings. §7.5 alone yields a proper algebraic space; §7.18 supplies the scheme assertion. A complete fan and an empty rational boundary give the proper model in §8.2. |
| F04, stale pin hashes | **Repaired**, line 38: “Library declarations are cited at the pinned Mathlib and Tau Ceti.” | The removed hashes do not recur. The declarations were checked at the actual manifest pins listed below. |
| F05, compact-fibre theorem page | **Repaired**, lines 200 and 547: “Theorem 4.4.4, p. 729”. | CS17 line 3217 gives journal page 729; the theorem starts at CS17 line 3236. The manifest agrees. |
| F06, dual-ideal API and Checks | **Repaired**, lines 271–284: “`ι(T_{i,v}) = T_{n,v}⁻¹T_{n−i,v}`” and four Checks. | Recomputed the examples modulo 11: roots `{1,2}` give dual roots `{7,9}`; omitting the central factor gives `{4,10}`; `{3,6}` is self-dual. See the adversarial table. |
| F07, overlap with generic-prime existence | **Repaired**, line 11: “its strong form, which excludes the ratio `1` as well”. | AG2.7 at its head excludes only the ratio `q_v` in its ACC+ predicate. At `q_v=7`, modulo 11, repeated roots `{3,3}` pass that predicate and fail this one. The two infinitude statements are not duplicate signatures. |
| F08, unjustified positive coefficient | **Repaired**, line 512: “a nonzero constant times the summed automorphic multiplicity”. | Algebraically the two signs multiply to 1, leaving `(ε_G d(G_ℝ))⁻¹ Σm`. CS17 line 4077 specifies nonzero constants, not their sign. R01 finds a separate defect in the definition of the Euler characteristic used in that calculation. |
| F09, parent ownership labels | **Repaired**, line 11: “The parent's §§0.4, 5.1, 5.2 and 5.4”. | Those targets exist and concern the parent's rank-`2n` datum; its §7.6 includes the noncompact boundary. The compact arbitrary-rank variants are explicitly distinguished here. |

No finding was marked “not actionable in this package”; none is re-raised. I rechecked the changed passages and searched the remaining package for their patterns. For unchanged text I used the previous review's computed rows only; the additional computations below cover the seeded sample, headlines, newly identified defects and arguments previously summarized without adequate computations.

## R01 (P1) — The unreduced Euler characteristic makes the Case 1 formula vanish

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:460`, “`ep(π_∞) = Σ_i (−1)^i dim H^i(𝔤, K_∞; π_∞)`”; also lines 451, 465 and 512.

**Claim:** This Euler characteristic computes the cohomology of the compact Shimura variety and supplies the coefficients in §10.3.

**Witness:** Case 1, `n=1`, `B=F=ℚ(i)`: `G(ℝ)=ℂ×`, `K∞=U(1)`. For the trivial representation, full relative cohomology has dimensions `(1,1)` in degrees `(0,1)`, so `ep=0`; the Shimura variety is nonempty and zero-dimensional.

The split central direction contributes an exterior algebra with Euler characteristic `1−1=0`. It is absent from the Shimura symmetric space: line 461 correctly divides that space by `A_{G,∞}^0`. Consequently the asserted Matsushima identity already has a spurious degree-one summand in this example. The resulting §10.3 right side vanishes, whereas the torus Igusa class and the degree-zero Shimura cohomology do not.

This also fails the supplier contract. `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3198` (§6.19, indexed PR #925) explicitly uses `𝔪_G=𝔤/𝔞_G` and a balanced central character for split centre; its §6.20 at line 3220 uses the same pair. `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:4395` (ALS.5b.4, PR #871) likewise uses reduced relative cohomology.

**Exact repair:** Define `ep` using `(𝔤/𝔞_G,K∞)` with the compatible fixed central character, or equivalently the relative pair including `A_{G,∞}^0`. Use that pair in Matsushima, every occurrence of cohomological archimedean representations in this comparison, and the test-function comparison in §§10.2–10.3. Specify the same central quotient in the relevant supplier contract. Keep the unfixed nonzero scalar from the F08 repair. Add the torus Check: reduced cohomology is `ℂ` in degree 0 and zero above, so `ep=1`, `q(G)=0`, and the degree-zero class is recovered. This repair also gives the intended discrete-series value `(−1)^{q(G)}`.

## R02 (P1) — The ordinary Newton point requires a Frobenius average

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:28`, “`ν_b` ... is the dominant representative of `μ⁻¹`”.

**Claim:** The ordinary Newton point equals the unaveraged dominant inverse Hodge cocharacter at every allowed auxiliary prime.

**Witness:** For `Res_{E/ℚ_p}GL₂`, `E/ℚ_p` unramified quadratic, use §8.3's signatures `(1,1),(2,0)`. The inverse dominant Hodge vectors are `(0,−1),(−1,−1)`; the ordinary Newton vectors are both `(−1/2,−1)`.

The first tuple is not Frobenius invariant and cannot be a Newton point. This is precisely an allowed nonsplit prime and the local example at line 232, not an excluded prime. The cited supplier makes the distinction explicit: `TauCetiRoadmap/BunGAndNewtonStrata/README.md:747` and line 749 (§1.26, PR #1241) define ordinarity by the Hodge average `μ◇`; §1.30 supplies the norm/sum under unramified restriction of scalars.

**Exact repair:** Replace the equality by `ν_b=(μ⁻¹)^◇`, taking the Frobenius average of the dominant representative in the transferred based root datum. Explain why pairing with the invariant `2ρ` preserves `d_b=d`. Add the above nonsplit Check. Computation: with `2ρ=(1,−1)` in each factor, the Hodge pairing is `1+0=1`; the averaged Newton pairing is `1/2+1/2=1`. Thus the required dimension statement survives without falsely identifying the vectors. At a completely split prime averaging is the identity.

## R03 (P1) — The worked example denies complete splitting where it is forced

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:654`, “In neither case does `p` split completely in `F`”.

**Claim:** Neither of the two preceding real-quadratic examples has complete splitting in `F=F⁺𝒦`.

**Witness:** The first bullet assumes splitting in both quadratic fields. Hence `F⊗ℚ_p=(ℚ_p×ℚ_p)⊗(ℚ_p×ℚ_p)=ℚ_p⁴`: four primes, all of residue degree one.

**Exact repair:** Say that the first case does split completely in `F`, whereas the second has two primes of residue degree two and does not. Distinguish this geometric splitting condition from genericity: the auxiliary-pair criterion in the first bullet needs genericity at the single nondefinite factor, while Theorem 1.1(2) asks for genericity at every prime above `p`. Thus the first example can still illustrate a weaker genericity assumption, but cannot illustrate failure of complete splitting. The corrected computations are `(e,f,g)=(1,1,4)` and `(1,2,2)` respectively.

## R04 (P2) — Complete splitting does not remove the excluded set S

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:312`, “If `p` splits completely in `F` ... then every `𝔭 | p` in `E` gives an auxiliary pair”.

**Claim:** Complete splitting and strong genericity alone imply the auxiliary-pair predicate defined at line 303.

**Witness:** Take Case 1 of rank one over `ℚ(i)`, the trivial residual character in characteristic 3, and enlarge `S` to contain 5. The prime 5 splits and is strongly generic, but `5∈S` forbids an auxiliary pair.

Enlarging the finite bad set by a good prime is allowed by §8.1. All rank-one eigenvalue-ratio conditions are empty. Thus this is not cured by unramifiedness or genericity.

**Exact repair:** Add `p∉S∪{ℓ}` to this API implication. Keep the stronger existence statement of §8.8: infinitely many primes allow avoidance of this finite set. Add the negative-control Check with `5∈S`; after the repair its antecedent is false. A split prime outside `S∪{3}`, with the same trivial representation, satisfies both sides. Do not restrict the roadmap to complete splitting: the more general auxiliary-pair definition stays.

## R05 (P2) — P_v is used outside its defined set of places

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:474`, “including `q` not split in `𝒦` ... the characteristic polynomial ... is the image of `P_v`”.

**Claim:** The polynomial `P_v` from §8.4 describes the Frobenius polynomial at every good place, including nonsplit rational primes.

**Witness:** For rank one over `F=𝒦=ℚ(i)`, take the trivial automorphic character, `ℓ=5`, and the inert prime `q=3`. Its Frobenius polynomial is `X−1`; §8.4 supplies no `q=3` factor or `P_v` in `𝕋^S`.

The Hecke algebra at line 238 deliberately uses only rational primes split in `𝒦`. At this inert prime the residue cardinality is 9, but that does not create the missing factor. The last sentence at line 477 already restricts the explicit Hecke-polynomial comparison to split primes, contradicting the scope of the earlier bullet.

**Exact repair:** Retain unramifiedness at **all** good places. At all such places formulate the characteristic polynomial using the normalized unramified local parameter of the base change `Π⁰_v`, with the normalization of `rec(Π⁰_v|det|^{(1−n)/2})`. State the formula in the specific operators `T_{i,v}` and `P_v` only at the split primes where those operators were defined. Alternatively define and own the additional nonsplit spherical polynomial, with its base-change comparison, before using it. The first repair gives `X−1` at the inert rank-one example and the existing §8.4 polynomial at split primes; it does not discard the all-good-place supplier contract.

## R06 (P2) — The datum extensionality rule omits genuine data

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:186`, “Two data are equal when their underlying rational PEL data, fields `𝒦` and case tags agree”.

**Claim:** All remaining fields of the datum fixed in §8.1 are propositions and can be discarded by proof irrelevance.

**Witness:** Keep a Case 1 rational PEL datum and level fixed. Replace its finite set `S` by `S∪{q}` for a good prime `q∉S`; both choices satisfy §8.1, but their `S` projections are unequal.

Lines 172–174 explicitly make `S` and the level `K` part of what the datum fixes. Neither a finite set nor a compact open subgroup is a proof. The same problem occurs with two distinct neat levels. Derived signatures are a different matter: they can indeed be functions of the rational PEL datum.

**Exact repair:** Choose a consistent interface. Either make `S` and `K` separate parameters, with an explicit statement that the compact rational PEL structure does not store them, or require equality of these fields and every other stored nonpropositional choice in the extensionality rule. State proof irrelevance only for the remaining property fields. Add the `S` versus `S∪{q}` Check. In the stored-data version the new extensionality hypothesis fails on that example; in the parameterized version the rational datum is equal but the two parameterized moduli/Hecke constructions are explicitly distinguished.

## R07 (P2) — The r-part APIs omit the Satake-to-Frobenius scaling

**Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:398`, “the Satake parameters ... are ... the roots”; the same identification occurs at line 490.

**Claim:** The Satake parameters of the unramified `GL_n` component are themselves the eigenvalues of geometric Frobenius, with the conventions established in §8.4.

**Witness:** For `n=2`, `q_v=7`, take Satake variables `(√7,1/√7)`. Line 248 gives roots `(7,1)` and polynomial `(X−7)(X−1)`, not roots `(√7,1/√7)`.

Line 248 explicitly fixes the polynomial as `∏(X−q_v^{(n−1)/2}x_j)`. The cited SR.4.1/SR.4.3 use the corresponding normalized Satake variables. Calling the variables in the later APIs “Satake parameters” without applying this twist reverses that established convention. CS17 line 3907 gives the Hecke polynomial and CS17 lines 3941–3948 specify the local twist; neither justifies dropping it.

**Exact repair:** In both APIs say that the Frobenius eigenvalues are `q_v^{(n−1)/2}x_j` for the §8.4 Satake variables, equivalently the parameters of the explicitly twisted representation `Π⁰_v|det|^{(1−n)/2}` in the chosen reciprocity convention. If “normalized parameters” is to mean these scaled parameters, define that term here and use it consistently in the supplier contracts. Add the two-root computation above. For rank one the scaling is 1; that boundary case alone would not detect the defect.

## Verified sound

### Principles, scope and structure

The package extends the parent rather than replacing it: compact arbitrary-rank data and the compact-paper trace comparison are its distinction from the parent's noncompact rank-`2n` target. The scope clause also distinguishes the ACC+ and strong genericity predicates. I found no copied source passage, algorithmic target, route-specific good-prime shortcut, sorry'd data, `set_option`, forbidden supplier, or duplicated Lean fully qualified name. The two requested general supplier gaps remain explicit rather than being assumed as theorem hypotheses.

The README has the required summary, ownership, conventions, per-supplier contracts, mathematical layers, examples, dependencies, consumers and references. Layers 8–11 each have Examples and Dependencies. All definition blocks have API prose and at least three Checks; the dual-ideal block now has four. The dependencies force the mathematical build: local datum and Hecke actions precede both trace arguments; Layer 10 reuses §§9.2 and 9.5; Layer 11 uses both cases and the parent's geometry. This is not a source-chapter order adopted without dependencies. The source's arrangement is not named as the plan. The corrected local-index argument in §10.1 still needs its algebraic inputs when formalized; no inertness assumption is needed in that argument.

I read main-branch examples `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `TauCetiRoadmap/ProfiniteCohomology/README.md` for shape. I read the package index before ownership/absence conclusions. The indexed package checkout is not the whole roadmap universe; the supplied roadmap tools were also used. `metadata.toml` is consistent with the mathematical topic. The package text and Lean docstring contain no job paths or review-round instructions.

### Seeded source sample and additional locators

All 15 requested targets were checked against legally cached text. There were no author-flagged unverified locators. The source numbering below is the published CS17 numbering and journal pagination, not PDF page numbers. Source lines are locators, not copied passages.

| Target | Text read at locator | What the text supports; result |
|---|---|---|
| 8.1 Cases 1 and 2 | CS17 lines 3258–3292 (§5.1, pp.730–731), 4060–4067 (§5.6, p.749), 4363–4379 (§6.3, pp.756–757) | Division-algebra simple case; quasi-split hermitian case with `F⁺≠ℚ` and rational ramification restriction; compactness hypotheses. The additional extensionality API is R06. |
| 8.3 local datum | CS17 lines 3978–3986 (Theorem 5.5.7, p.747), 4037–4058 (Lemma 5.5.8, p.748), 4102–4111 (Corollary 5.6.3, p.750), 4409–4413 | The sets over one place of `𝒦`, at most one nondefinite embedding, and the local obstruction. The package correctly repairs the direction of `ι_p` and accounts for the Shapiro central shift. R02 concerns the separate standing Newton convention. |
| 8.4 Hecke algebra and polynomial | CS17 lines 4381–4408 (Theorem 6.3.1(1), p.757) | Split rational primes, `T_{i,v}`, exponent `i(i−1)/2`, and Frobenius polynomial. The package correctly repairs the printed `p` in the similitude factor at `q`. R05/R07 concern later uses. |
| 8.5 dual ideal | CS17 lines 4475–4478 (proof, p.759), together with the actual parent §5.1 and AG2.7 dual-twist contract | The source invokes the dual ideal; the explicit arbitrary-rank formula is derived from inverse double cosets. The four new Checks and twist `ε̄^{1−n}` agree with geometric Frobenius. |
| 8.7 strong genericity | CS17 lines 149–153 (Definition 1.9, p.652), 4326–4356 (Definition 6.2.1, Lemma 6.2.2, pp.755–756), 4409–4413 | Ordered ratios exclude both 1 and `q_v`; unramifiedness and the auxiliary-pair conditions are retained in the definitions. R04 is a missing hypothesis in one derived API implication. |
| 9.1 stable Igusa trace | CS17 lines 3551–3569 (Proposition 5.3.1, p.737), 3588–3630 (Theorem 5.3.2, p.738) | Compact quasi-split data, stable/twisted transfer, balanced endoscopic factor `1/2`, other factor 1. Supplier carries proper archimedean coefficients rather than silently using the trivial coefficient on all endoscopy. |
| 9.2 principal-series reduction | CS17 lines 3638–3734 (§5.4, pp.739–741, Lemmas 5.4.2–5.4.3) | Jacquet reduction followed by Langlands–Jacquet; vanishing at a non-quasi-split factor for generic principal series. The modulus twist and product factor are explicit in the supplier. Trivial `GL₂` is not a counterexample because it is nongeneric. |
| 9.4 r-part | CS17 lines 3899–3977 (Corollary 5.5.5, Remark 5.5.6 and following definition, pp.745–746) | Index by the semisimple Galois representation of the normalized GL component; fixed outside-`S′` class, not an ill-defined mixture of base changes. R07 records the later API's missing scaling. |
| 10.1 stable term only | CS17 lines 4060–4072 (Proposition 5.6.1, p.749); Shin12 lines 978–990 and 1083–1111 (§6, author pp.20–23) | The stable identity and the source's inert-prime setting. The package supplies an independent local-index argument; its repaired isotypic divisibility is correct and does not require inertness of the chosen auxiliary prime. |
| 10.2 stable Lefschetz identity | CS17 lines 4073–4078 (p.749); Shin09 lines 879–918 (Lemma 6.4, author p.20) | Nonzero comparison constant and extension from acceptable tests by twisting/separation. The theorem's source locator is correct; the expanded Matsushima route must be repaired as R01. |
| 11.2 Hochschild–Serre | CS17 lines 4436–4455 (proof and footnote 34, p.758) | The spectral-sequence route. The package correctly uses a degree `j≤i`, not the stronger same-degree assertion without positive-group-cohomology vanishing. |
| 11.3 period-map reduction | CS17 lines 3236–3240 (Theorem 4.4.4, p.729), 4244 onward (Corollary 6.1.4/proof, pp.753–755), 4491–4497 (p.760) | Compact-fibre identification, vanishing of higher direct images and Leray. A choice of lift supplies the fibre identification. CS17 lines 3159–3187 justify the rank-one reduction by applying the locally constant-sheaf comparison on fibres; they do not require the pushforward itself to be locally constant. |
| 11.5 torsion eigensystems | CS17 lines 4384–4408 (Theorem 6.3.1(1), p.757), 4436–4474 (proof, pp.758–759); Shin11 lines 3470–3495 (Lemma 7.1, p.1722) | Galois representation, normalized split Hecke polynomials, and construction from a nonzero rational constituent. Finite avoidance and division-algebra base change are honestly declared gaps, not supplied by these citations alone. |
| 11.6 middle-degree concentration | CS17 lines 4409–4416 (Theorem 6.3.1(2), p.757), 4475–4497 (pp.759–760) | The precise auxiliary-pair hypothesis, ordinary minimal stratum, lower bound and dual upper bound. No completely split auxiliary prime is imposed. |
| 11.7 main theorem | CS17 lines 84–115 (Theorem 1.1, p.651), 4422–4455 (Remarks 6.3.2–6.3.3 and footnote 33, p.758) | The stated compact settings, complete-split strong genericity and the single-indefinite-embedding specialization. The worked-example inference is separately R03. |

Additional readings covered §§8.6, 8.8, 9.3, 9.5–9.6, 10.3–10.6 and 11.1, 11.4, 11.8, not merely the sample. In particular: CS17 line 3740 (Lemma 5.5.1, pp.741–743), line 3804 (Corollary 5.5.2), line 3978 (Theorem 5.5.7), line 4037 (Lemma 5.5.8), line 4082 (Corollary 5.6.2), line 4102 (Corollary 5.6.3), lines 124–153 (coefficient remarks); Shin-BCU lines 13–21 and 41–54 establish that its Theorem 1.1 is in the `B=F` setting, not the general division-algebra contract.

The manifest originally had the three principal works. The two additional works explicitly invoked inside the proof routes were fetched through the sources service from Shin's author page and added as `Shin09` and `Shin12`. Their author-copy numbering is recorded. The original three manifest entries were preserved; the review did not correct or rewrite an author's existing entry. No reference remains outstanding in the missing-reference request file.

### Computed adversarial table

The table records values, including negative controls. Rows marked with findings are not counted as sound. A formal test of an identity is not presented as a proof of the trace formula; the corresponding source hypotheses and named inputs were checked separately above. The earlier review's computed rows were used for untouched algebraic subcases, but no earlier “sound” summary replaced this round's checks of the sample or changed text.

| Statement | Instances tried | Computed values on the two sides / negative model | Result | Change |
|---|---|---|---|---|
| 8.1 dimension and conjugate signatures | Rank 1; rank 3 with CM-type signatures `(1,2),(0,3)` | Rank 1: `d=0`. Rank 3: CM-type sum `2+0=2`; all-embedding sum `2+2+0+0=4`; conjugation swaps `(1,2)` with `(2,1)` | Dimension and swap pass | None |
| 8.1 extensionality | Same rational datum, `S` and `S∪{q}`, `q∉S` | Three listed projections agree; finite-set projections differ on membership of `q`: false versus true | Fails | R06 |
| 8.2 proper integral model | Anisotropic datum; isotropic unitary datum | Anisotropic: rational proper-parabolic index set empty, boundary union empty. Isotropic control: nonempty parabolic index set, positive boundary contribution | The properness route requires anisotropy, as stated | None |
| Conventions, 8.3 ordinary Newton vector | Unramified quadratic restriction, signatures `(1,1),(2,0)` | Hodge vectors `(0,−1),(−1,−1)` versus Newton vectors `(−1/2,−1),(−1/2,−1)`; pairings both 1 | Vector equality fails; dimension survives | R02 |
| 8.3 Shapiro correction | Same two embeddings, `n=2,c_i=1` | Inverse norm bound has determinant valuation `−3`; multiplying by `p` adds 2 and gives `−1`, the noncentral inverse bound. Without the shift, `−3≠−1` | Passes | None |
| 8.3 split and inert sets | Real quadratic `F⁺`, `p` split in `𝒦` | Split in `F⁺`: `m=2`, cardinalities `1,1`, total four degree-one primes in `F`. Inert: `m=1`, cardinality 2, total two degree-two primes | Local description passes; closing sentence fails | R03 |
| 8.4 polynomial | `n=1`; `n=2,q_v=7` | `P=X−T₁`; `P=X²−T₁X+7T₂`. Satake roots for rank 2 are `√7 x₁,√7 x₂`, with sum `√7(x₁+x₂)` and product `7x₁x₂` | Passes | None |
| 8.4 units and indexing | Central coset and its inverse; `i=0,n` | `[ϖ][ϖ⁻¹]=1`; `T₀=1`; constant term `(−1)^n q_v^{n(n−1)/2}T_n`. No claim for an out-of-range `i` is made | Passes | None |
| 8.5 inverse-coset API | Rank 1; inverse twice; an inversion-stable subalgebra `A` | `T₁↦T₁⁻¹↦T₁`; `ι(𝔪∩A)=ι(𝔪)∩A`. Omitting the central factor gives `T₁↦1`, so loses involutivity | Passes | None |
| 8.5 new two-root Check | `n=2,q_v=7,ℓ=11`, roots `1,2` | `T₁=3,T₂=5`; dual `T₁=5,T₂=9`; polynomial `X²−5X+8`, roots `7,9`. Wrong central-factor-free formula: `X²−3X+7`, roots `4,10` | Passes, discriminating | None |
| 8.5 self-dual Check | Roots `3,6`, same `q_v,ℓ` | `7/3=6`, `7/6=3`; ratios `2,6`, neither 1 nor 7. Applying the dual operation twice returns each root | Passes | None |
| 8.6 finite-level duality | `d=0` finite set; `d=1`; coefficients `ℤ/4` | Degree pairings `(0,0)` and `(i,2−i)`; a permutation matrix has adjoint its inverse. `Hom_{ℤ/4}(ℤ/2,ℤ/4)=2ℤ/4≅ℤ/2`, so duality alone does not assert freeness | Passes with smooth/proper and coefficient hypotheses | None |
| 8.7 rank and excluded-prime boundaries | `n=0,1`; `p=ℓ`; zero and unit ideals | Empty characteristic product is 1 for rank 0; ratio clauses empty for ranks 0 and 1. The `ℓ∉v` clause still excludes `p=ℓ`. Zero ideal is not maximal in `𝓞 F`; unit ideal fails proper maximality | Native predicate has no vacuity from these cases | None |
| 8.7 small characteristics | `ℓ=2,q_v=3`, roots `1,ω` in `𝔽₄`; `ℓ=3,q_v=2`, roots `1,2` | First: ratios `ω,ω²≠1=q_v`, passes. Second: ratio 2 equals `q_v`, fails. Repeated roots always give ratio 1 and fail strong genericity | Passes without a good-characteristic restriction | None |
| 8.7 ACC+ comparison and duality | Repeated roots `3,3` modulo 11, `q_v=7`; arbitrary common twist `c≠0` | ACC+: `3≠7·3=10`, passes; strong: `3/3=1`, fails. Twisted-dual ratios `(c/α_i)/(c/α_j)=α_j/α_i`, permuting ordered pairs | One-way implication and dual invariance pass | None |
| 8.7 complete split implies auxiliary | Rank 1 over `ℚ(i)`, `ℓ=3`, `p=5∈S` | Two degree-one primes, unramified representation, empty ratio checks: antecedent true. Auxiliary condition `5∉S`: false | Fails | R04 |
| 8.8(a) infinitude headline | Finite Chebotarev quotient, including cyclic and nonabelian controls | Class densities in `S₃`: transpositions `3/6=1/2`, 3-cycles `2/6=1/3`; identity class `1/6>0`. Prescribing the rational splitting action and cyclotomic value gives a nonempty class from the witness, hence positive density; deleting finitely many primes preserves infinitude | Does not reduce to an arbitrary infinite universe | None |
| 8.8(b) degree-one headline | Initial residue degree 2; conjugate Frobenius; finite bad set | Initial cyclotomic value is `p₀² mod ℓ`, not `p₀`. The matching class retains that value. Degree-≥2 primes contribute Dirichlet density 0; a class of density `|C|/|G|>0` still has infinitely many degree-one primes | General residue-degree input retained | None |
| 9.1 endoscopic weight | `n⃗=(1,1)` versus `(1,2)`; zero test function | Outer automorphism orders 2 and 1 give factors `1/2` and 1; zero test gives traces 0 on both sides | Passes | None |
| 9.2 Newton reduction | `GL₂` ordinary and basic slopes; trivial representation control | Ordinary `(0,−1)` has split torus centralizer. Basic `(−1/2,−1/2)` has quaternion centralizer. Generic principal series transfers to 0 there; the nongeneric trivial `GL₂` representation has signed transfer `−[1_D]`, not 0 | Genericity and non-quasi-split hypotheses discriminate | None |
| 9.3 spectral expansion | Two virtual contributions to the same component | Coefficients `1+(−1)=0`; occurrence in one summand alone gives no nonzero total class. The statement uses the total contribution | Passes | None |
| 9.4 r-projection | Distinct irreducible classes `A,B` of same index; a different index `s` | Projection of `2[A]−[B]` to `r` is itself; projection to `s` is 0. The zero class projects to 0. Changing only the similitude character does not change the GL-index polynomial | Projection definition passes | None |
| 9.4 and 10.5 Satake API | `n=2,q_v=7,x=(√7,1/√7)` | Claimed raw roots `√7,1/√7`; §8.4 roots `7,1`, sum 8, product 7. These are unequal | Fails | R07 |
| 9.5, 9.6 generic ordinary obstruction | Basic rank-two class versus ordinary; all signatures central | In basic rank two, a required generic local factor has reduction 0, so each corresponding trace term is 0. Ordinary class has `d_b=1=d`. Central cocharacter gives a singleton acceptable set and `d=0` | Passes, using the corrected averaged convention | R02 for convention only |
| 10.1 repaired isotypic law | Local index 2 with `e=1` or 2; global indices 2 and 3 | Central polynomial `(X−γ)²`: `m e=2`; `e=2`: scalar-extension index 1 and `m e=2m`. Globally `lcm(2,3)=6`; a block of degree 2 cannot transfer at the index-3 place | F01 repair passes | None |
| 10.1 regularity exclusion | Two endoscopic blocks share or do not share a root | Repeated root split between two degree-one blocks would give common root and fail `(G,H)`-regularity; relatively prime blocks are whole isotypic factors and their degrees are multiples of `d_v` | Passes | None |
| 10.2 and 10.3 archimedean comparison | Rank-one compact Shimura torus; reduced versus full Lie algebra | Full `(𝔤,K)` gives `H⁰=ℂ,H¹=ℂ`, EP 0; reduced pair gives only `H⁰=ℂ`, EP 1. The nonempty zero-dimensional Shimura variety has nonzero H⁰ and H¹=0 | Fails with the printed pair | R01 |
| 10.3 repaired coefficient sign | Reduced discrete-series EP; multiplicities 2 and 3 | `(−1)^q(−1)^q=1`, sum multiplicities `2+3=5`, coefficient `5/(ε_G d(G_ℝ))`; it is negative if the comparison constant is negative | F08 repair passes; reduced pair needed | R01 |
| 10.4 nonsplit polynomial | Trivial rank-one representation over `ℚ(i)`, inert 3, `ℓ=5` | Residue cardinality 9; Frobenius polynomial `X−1`; the defined split Hecke algebra has no `T_{1,v}` or `P_v` at 3 | Undefined expression | R05 |
| 10.5 projection and cancellation | Virtual class `A−A`; same index on both terms | Projection is `A−A=0` despite nonzero terms. The stated criterion is that the sum is zero, not that no summand occurs | Passes | None |
| 10.6 generic ordinary obstruction | Case 1, non-quasi-split Newton factor | Each relevant generic `Red` is 0; any coefficient times that class is 0. Ordinary alternative retains `d_b=d` | Passes conditional on the stated base-change gap and R01 correction | R01 |
| 11.1 contraction | `A=𝔽_ℓ` diagonally in `B=𝔽_ℓ×𝔽_ℓ`, `M=B`; unit ideal | A chosen B-maximal localization has dimension 1; its contraction localization over A has dimension 2, so nonvanishing is preserved but equality is false. Localizing at the unit ideal gives zero | The one-way claim is correct | None |
| 11.2 Hochschild–Serre bounds | `K_p=ℤ₇×`, `ℓ=3`, trivial coefficients; first-quadrant terms | `K_p` has quotient `C₆`; `H¹_cts(K_p,𝔽₃)` has dimension 1. Positive `a` is not zero in general. On a diagonal `a+b=i`, `b≤i`; if `b≥d`, then `i≥d` | The package's weaker conclusion is correct | None |
| 11.3 Leray and stalks | All geometric stalks zero; all stalk degrees ≥d; rank-one reduction on fibres | First case every `E₂^{a,b}=0`; second `a+b≥0+d=d`. For the strictly local comparison `Spa(C,C⁺)⊃Spa(C,D⁺)`, constant coefficients have `H⁰=Λ,Hⁱ=0` for `i>0` on both sides | Passes; apply local constancy on fibres, not to the pushforward | None |
| 11.4 minimal-stratum lattice | A free lattice rank r in degree d; torsion negative control | Free lattice reduces to dimension r in degree d. `ℤ_ℓ/ℓ` in degree d gives nonzero reduction in degrees d and d−1 through Tor. Thus concentration of derived reduction excludes that torsion | Freeness argument passes for bounded finite complexes | None |
| 11.5 torsion Galois polynomial | Rank 1; rank 2; finite avoidance | Polynomial values `X−T₁` and `X²−T₁X+q_vT₂`; equality at the degree-one primes (density 1 among primes of F) fixes a semisimple representation. Avoiding one additional good rational prime removes it from `Ram(ϖ)` only with the declared gap | Correct conditional contract | None |
| 11.6 lower and upper degree bounds | `d=2`; dual degree; ordinary minimum | Lower bound kills `i=0,1`; duality sends `i=3,4` to `1,0`, killing them. Surviving degree is 2. For `d=0`, only degree 0 remains | Passes once the ordinary dimension convention is corrected | R02 |
| 11.7 main theorem and special signature | Complete splitting; one nondefinite embedding | Complete splitting gives each `|S_i|=1`. Harris–Taylor signature has exactly one nondefinite index, dimension `n−1`; rank 1 gives dimension 0 and no nondefinite index | Main specialization passes | None |
| 11.8 integral and twisted coefficients | Concentrated free lattice; finite normal trivializing cover with group `C_ℓ` | A lattice rank r has reduction rank r; `H¹(C_ℓ,𝔽_ℓ)=𝔽_ℓ` shows invariants need not be exact. First-quadrant descent still preserves the lower bound; the dual coefficient system gives the upper bound | The stated normal-cover hypothesis and duality are necessary and retained | None |

The impossible inputs in the requested defect checklist are excluded by actual hypotheses: number fields are characteristic zero, coefficient fields are nonzero and finite, `GL_n` eigenvalues are units, local residue fields have cardinality at least 2, and unramified local PEL data are required at `p`. Thus zero rings, inseparable number-field extensions, `q=1`, and arbitrary nonsmooth/nonproper schemes are not silently admitted. Rank zero is admitted by the two arithmetic Lean predicates and was tested above; it is not a new PEL case. The dimension-zero case is admitted geometrically and is the decisive R01 control. No exclusion of `p=2` or `ℓ=2` was introduced.

### Pinned declarations, elaboration and padding

The content manifest pins Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following actual source definitions were opened, rather than relying on resolver or search descriptions:

| Pinned file and line | Declaration / relevant limitation |
|---|---|
| `Mathlib/NumberTheory/NumberField/CMField.lean:70` | `NumberField.IsCMField`: totally complex and quadratic over the maximal real subfield; it does not store an imaginary quadratic subfield. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:126` | `NumberField.maximalRealSubfield`, defined by reality under all embeddings. |
| `Mathlib/NumberTheory/HeckeRing/Defs.lean:183` and line 189 | `HeckeCosetModule`, `HeckeRing`: finitely supported double-coset module; the claimed convolution ring instance is separately in Tau Ceti. |
| `Mathlib/RingTheory/Frobenius.lean:55` and line 184 | Frobenius congruence predicate and `IsArithFrobAt`; it is arithmetic, so the geometric convention uses inverses. |
| `Mathlib/RingTheory/Ideal/Defs.lean:154` | `Ideal.inertia`; actual triviality of the representation on inertia is part of the predicate. |
| `Mathlib/RingTheory/Ideal/Over.lean:128` and line 379 | `Ideal.LiesOver`, `Ideal.primesOver`; primality and lying over are real conditions, not arbitrary labels. |
| `Mathlib/RingTheory/Localization/Defs.lean:98` and line 102; `Mathlib/RingTheory/Localization/AtPrime/Basic.lean:55` | `IsLocalization`, `Localization.AtPrime`; no finiteness or freeness follows merely from having a localization. |
| `Mathlib/LinearAlgebra/FreeModule/Basic.lean:44` | `Module.Free` means existence of a basis; it does not assert finite rank. The geometric finiteness inputs must supply that separately. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43` and line 143 | General linear group as units of the matrix algebra and its invertible-matrix constructor. This excludes zero eigenvalues even in small characteristic. |
| `TauCeti/NumberTheory/HeckeRing/Associativity.lean:484` | `HeckeCosetModule.instRingHeckeRing`. |
| `TauCeti/NumberTheory/HeckeRing/Commutativity.lean:135` and line 165 | `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`; preservation of the Hecke datum is required. |
| `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:67` and line 74 | Completely split density and `infinite_frobeniusPrimeSet`; available arithmetic foundations, but not either package predicate or either headline signature. |

Object searches also checked the library near-matches. For example, `Mathlib/Algebra/Polynomial/Splits.lean:521` concerns splitting of a degree-one polynomial, not infinitude of generic number-field primes; the ramification criterion in `Mathlib/RingTheory/DedekindDomain/Different.lean:916` is likewise not either headline. Searches for the compact PEL moduli space, its Igusa tower, Newton-indexed admissible representation classes and the required Hecke action found no native carriers making the omitted geometric headlines statable by a few simple definitions.

Actual elaboration was run from the pinned content checkout with `lake env lean` on the package's absolute `Suggested.lean` path. **Exit 0; only two `declaration uses sorry` warnings, at lines 79 and 91.** There are no Tau Ceti imports requiring object-file builds: the file has exactly `import Mathlib`.

A scratch copy appended `#check @name` for all four declarations. It elaborated successfully, and each type was compared with §§8.7–8.8. The two field/number-field structures, `Algebra F L`, `IsGalois F L`, finite coefficient field, matrix rank, representation and prime/ideal parameters all survive; no section hypothesis disappeared. No signature or package file was changed.

Every sorried theorem, not a sample, was probed on a scratch copy. The alternatives were `simp`, `rfl`, `infer_instance`, and a single direct infinite-set lemma (`exact Set.infinite_univ`); the native near-matches were also read. Both declarations reached the explicit failed-probe diagnostic, leaving the prime-predicate infinitude goal. There are no additional sorried theorems or examples.

| Declaration in `Suggested.lean` | Role | Probe / comparison result |
|---|---|---|
| `IsStrongGenericAt`, line 46 | Simple predicate needed by headlines | Real body on native ideals, finite Galois groups and matrices. The residue characteristic exclusion and inertia clauses are present. |
| `IsCompletelySplitStrongGenericPrime`, line 65 | Simple predicate needed by headline (a) | Real body; maximal prime ideals over a rational prime, with cardinality `[F:ℚ]`, encode complete splitting. No sorry'd data. |
| `infinite_setOf_isCompletelySplitStrongGenericPrime`, line 79 | §8.8(a) | None of the four one-tactic probes closes it. Strong genericity requires a nonempty Chebotarev class, not merely infinitude of all primes. |
| `infinite_setOf_isStrongGenericAt_degree_one`, line 91 | §8.8(b) | None closes it. Preserving the residue-cardinality congruence and retaining infinitely many degree-one places are substantive. |

There is no padding finding and no absent statable headline found. The README's four backticked identifiers presented as this package's Lean declarations are exactly these four; imported names were resolved separately.

### Headline coverage

| Headline from the README | Acceptance-file treatment |
|---|---|
| §8.8(a), infinitely many completely split strongly generic primes | Stated at line 79 with `sorry`, on native finite Galois realizations. |
| §8.8(b), infinitely many degree-one strongly generic places | Stated at line 91 with `sorry`; the initial place may have any residue degree. |
| §9.1 stable trace, §9.3 spectral expansion, §9.6 generic ordinary obstruction | Named in the module docstring via Theorem 5.3.2, Lemma 5.5.1 and Theorem 5.5.7. Missing carriers: Igusa varieties, admissible representation Grothendieck groups and base change. |
| §§10.1–10.3 stable and Lefschetz comparisons / automorphic formula, §10.6 ordinary obstruction | Named as the Igusa trace identities and spectral expansions, Proposition 5.6.1, Corollaries 5.6.2–5.6.3. The same heavy carriers are absent; no stand-in was substituted. |
| §11.5 torsion Galois representations, §11.6 concentration, §11.7 main theorem | Individually named by Theorems 6.3.1(1), 6.3.1(2), and 1.1; compact PEL cohomology and the Hecke action are missing. |
| §11.8 integral and coefficient forms | Named by Remarks 1.3 and 1.7.1, with the same missing geometric carriers. |

### Supplier resolution, ownership and order

Every `*Needs:*` line, supplier-contract item and cross-roadmap citation was read. The citation resolver reported no unresolved identifier; it was treated as an index, not a mathematical certificate. The main-branch copy was used for SchemeAndStackFoundations; the other named suppliers were new-roadmap heads in the supplied index. The following records the resolved objects and representative file lines; section ranges list the consumed targets, not just a matching word.

| Supplier and resolved targets | File witness and scope check |
|---|---|
| SchemeAndStackFoundations §§2.2, 2.15 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3420`, line 4001: site Leray and covering/group Hochschild–Serre, on main. |
| IgusaVarietiesAndTorsionConcentration §§0.4, 0.11, 1.3–1.8, 3.14, 3.17, 4.4–4.5, 5.1–5.5, 7.6 | `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:1712`, line 1963, line 2082, PR #1090. Compact fibre/minimal-stratum inputs exist; the noncompact trace/end targets are distinguished. The §3.14 application uses constant coefficients on the fibres, as in CS17 lines 3180–3187. |
| EndoscopicTransferAndUnitaryTraceComparison §§1.8, 1.16, 5.1, 6.1, 6.3, 6.6–6.10, 6.15, 6.18, 6.21–6.23, 6.25, 7.5, 7.10, 8.1, 8.11, 8.21, 10.32, 14.2–14.3 | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:411`, line 2606, line 3492, line 4249, line 5267, PR #999. All-rank stable–twisted comparison, acceptable tests, corrected archimedean coefficients, signed LJ and modulus-twisted reduction. §6.23 itself is the narrower prescribed-division Harris–Taylor setting; the package's broader §10.1 argument was therefore checked independently, not inferred from that heading. |
| AutomorphicGaloisRepresentationsPartII AG2.0, AG2.2 discrete normalization, AG2.3 regular existence, AG2.5 away-prime compatibility/temperedness, AG2.7 residual, dual, genericity and unitary export | `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1330`, line 1857, line 3466, line 3544, line 3566, line 3679, PR #1006. Geometric-Frobenius normalization retained; strong local versus ACC+ global predicates distinguished; division-algebra extension is a declared gap. |
| IntegralHeckeAndGaloisDeterminants §§1.2, 3b.1 | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1983`, line 3132: semisimple reconstruction and Galois-type Hecke ideals. |
| BunGAndNewtonStrata §§1.13, 1.23, 1.25, 1.26, 1.30, 1.32 | `TauCetiRoadmap/BunGAndNewtonStrata/README.md:745`, line 826, PR #1241. Ordinary Hodge average, product/norm maps and quasi-split-centralizer obstruction. R02 is a mismatch with this supplied convention. |
| PELModuli M0.2, M0.6–M0.7, M0.9, M0.13, M0.16–M0.17, M0.27, M1.13, M2.8, M2.10–M2.11, M3.1, M3.4, M4.3, M5.5, M6.1 | `TauCetiRoadmap/PELModuli/README.md:682`, line 2069, line 2456, line 2490, line 3247, line 3766. Rational data, dimension, division properness, inner-form decomposition, canonical generic fibre and finite étale Hecke maps. Its p-adic comparison isomorphism is transported to the package's inverse convention. |
| ShimuraCompactifications §§1.4, 7.3, 7.5, 7.18 | `TauCetiRoadmap/ShimuraCompactifications/README.md:1054`, line 2294, line 2344, line 2633, PR #1053. Complete toroidal fan gives proper algebraic space; neat PEL quasi-projectivity gives a scheme. |
| PerfectoidShimuraVarieties §§2.2, 3.5 | `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:1043`, line 1296. Small tame level and Hodge-type period map retained. |
| SmoothRepresentationsOfLocalGroups SR.1.2, SR.2.2, SR.4.1, SR.4.3 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1220`, line 2045, line 3191, line 3355. Jacquet normalization and the `q^{i(n−i)/2}` Satake generator factor are present; R07 is a downstream scaling omission. |
| ArithmeticGaloisRepresentations §§1.8, 5.1, 5.9 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1226`, line 3461, line 3736. Brauer–Nesbitt and Chebotarev for clopen conjugation-invariant sets. |
| AutomorphicSpectralTheory §§4.7, 6.17, 6.19–6.20 | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2352`, line 3159, line 3196, line 3218, PR #925. Compact-mod-centre spectrum and reduced Lie algebra are required; R01 records their omission. |
| AutomorphicLFunctionsAndLocalFactors AL.3 strong multiplicity one | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1782`: isobaric extension in §AL.3.7.2, not only the cuspidal statement. |
| ArithmeticLocallySymmetricSpaces ALS.5a.2, ALS.5a.4, ALS.5b.4 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:4060`, line 4138, line 4383, PR #871. Finite-level duality, inverse-Hecke adjoint and reduced automorphic comparison. |
| EtaleDualityAndPerverseSheaves §0.5 | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:668`: smooth finite-dimensional torsion duality, not an assertion that all cohomology is free. |
| ComplexComparisonPartII C6.3–C6.4 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:4896`, line 5001: ordinary/compact-support comparison and coefficient passages. |
| ClassicalAdicEtaleCohomology §§1.3–1.4, 8.2 | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:354`, line 449, line 4016: continuous Cartan–Leray, constructible/filtered coefficients and proper algebraic–analytic comparison. |
| DiamondEtaleCohomology C0.1, C0.18 | `TauCetiRoadmap/DiamondEtaleCohomology/README.md:314`, line 572: the actual étale site and cofiltered-limit cohomology. |
| ArithmeticGaloisDuality R02.2.1 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1190`: continuous group Hochschild–Serre. |
| AlgebraicModularFormsAndSerreWeights R15.5 | `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:1296`, with identifier correspondence at line 18: Deligne–Serre lifting on a finite free DVR module, as supplied by §11.4's lattice argument. |

The mechanical check was run with the requested `gate --depcheck`, roadmap name, merge order, `--movable`, and pinned content checkout. Its entire result was:

```text
depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No order file or tool was edited.

The overlap data was checked against the indexed heads: no conflicting revision of this roadmap, no cited ID dropped by another head, and no dependency on numbering defined only by an open revision was listed or found. The closest scopes were read: parent PR #1090; AutomorphicGaloisRepresentationsPartII #1006; TorsionCohomologyInfrastructure #1087; EndoscopicTransferAndUnitaryTraceComparison #999; PotentialAutomorphyInfrastructurePartII #2135. The parent's even-rank noncompact comparison and the transfer supplier's §§14.4–14.6 are not a second owner of this compact arbitrary-rank comparison. TorsionCohomologyInfrastructure supplies determinant/cohomological infrastructure; PotentialAutomorphyInfrastructurePartII supplies automorphy/patching interfaces, not the compact Igusa theorem. Object searches covered the indexed main roadmaps, supplied open heads and available board packages. No missing-roadmap conclusion was drawn from absence in the local board checkout. Open heads without supplied readable files/index entries were not independently sought.

### Declared gaps

Both slugs occur in `design/plan.json` and in the exact supplier contracts:

| Gap | Scope and minimality |
|---|---|
| `division-algebra-unitary-base-change` | Owned by AutomorphicGaloisRepresentationsPartII AG2.2. It asks for a single compatible base-change/Galois representation package for every rank and locally isomorphic PEL inner form, with specified cohomological, ramification and compatibility hypotheses. Shin-BCU's hermitian-space theorem and the existing rank-specific assembly do not already give this division-algebra export. |
| `auxiliary-character-finite-avoidance` | Owned by EndoscopicTransferAndUnitaryTraceComparison §6.3. Prescribed finite avoidance, with fixed restriction and archimedean type, is the precise addition to the supplied finite-ramification existence theorem. Shin11 Lemma 7.1 does not state that avoidance. |

These are contracts, not unowned prerequisites and not findings. If the package is later accepted, that acceptance remains conditional on them. The current verdict is needs changes, so the JSON does not use the accepted-only `conditional_gaps` field.

## Not verifiable

- None of the requested source sample was inaccessible. The initially unavailable publisher route for Shin12 was resolved by its legal author copy through the sources service; there is no outstanding missing-source request.
- The two declared supplier gaps are not proved by the available supplier heads. This is an explicit condition of the roadmap, not evidence of failure and not an assertion that those theorems have been verified here.
- This review checked the indexed main/open-head snapshot supplied for the job; it makes no claim about later head changes or unprovided open-head files. A successful `sorry` elaboration checks signatures, not the truth of future proofs.

## Source issues

- **Misprint** in CS17 at Theorem 5.5.7, p.747, and Corollary 5.6.3, p.750: the source says embeddings compose with the p-adic comparison isomorphism in the forward direction; it should be its inverse after the complex embedding; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7, p.747: the source says base change away from p in the displayed conclusion; it should be the same away-from-S base change used in the proof and preceding definition; affects a stated result.
- **Misprint** in CS17 at Lemma 5.4.3, p.741: the source says the Newton reduction is applied to the unlabelled p-component; it should be the p-component of the endoscopic representation under discussion; affects a stated result.
- **Error** in CS17 at Lemma 5.5.1, p.742: the source says the proper endoscopic archimedean contribution uses the trivial coefficient; it should be the coefficient transferred from the ambient infinitesimal character; affects the proof.
- **Misprint** in CS17 at Theorem 6.3.1(1), p.757: the source says the similitude factor at q is the p-adic multiplicative group or its integral units; it should be the corresponding q-adic factor; affects a stated result.
- **Misprint** in CS17 at Remark 5.2.6, p.735: the source says Shin's character existence result is Proposition 7.1; it should be Lemma 7.1 of Shin11, p.1722; affects nothing.
- **Misprint** in CS17 at the comparison after Proposition 5.6.1, p.749: the source says the twisting argument is Lemma 6.4 of Shin11; it should be Lemma 6.4 of Shin09, author p.20; affects nothing.
- **Gap** in CS17 at the base-change assertion following Corollary 5.6.2, p.749: the source says the cited hermitian-space base-change theorem supplies the division-algebra case; it should be supplemented by the division-algebra transfer and compatible Galois assembly; affects the proof.
- **Gap** in CS17 at the restriction-of-scalars step before Lemma 5.5.8, p.748: the source says the norm bound reduces directly to the one noncentral cocharacter; it should be translated by the integral central contribution of the other embeddings; affects the proof.
- **Gap** in CS17 at the Hochschild–Serre step in the proof of Theorem 6.3.1, p.758: the source says least-degree finite-level nonvanishing gives infinite-level nonvanishing in that same degree; it should be a no-greater-degree conclusion unless positive group-cohomology vanishing is justified; affects the proof.
