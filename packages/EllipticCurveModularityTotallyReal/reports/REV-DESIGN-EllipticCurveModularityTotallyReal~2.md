<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12848#issuecomment-6780727961 -->
Review (codex) of 9009655

Verdict: needs_changes

1. **F01** (P2) The new CM endomorphism-field theorem has two owners

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:1102`, “The field of definition is proved first, for an arbitrary number field K”; also its owned scope at line 44 and plan target 4.3.

   **Claim:** This roadmap owns the general invariant-differential description of the Galois action on geometric CM endomorphisms and their field of definition.

   **Witness:** Open PR #1727, `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1628`, already proves the same differential description and the criterion that all endomorphisms are K-rational exactly when the CM field lies in K (§3.4).

   This is the same object, not just a common application of modularity: apply the other roadmap's criterion after every finite base extension K′/K to recover the field KT. Its next clause identifies the index-two subgroup. The two texts use the identical faithful differential argument. The repair report's suggestion that the other roadmap “could cite” this one has not changed that head's ownership. Moving ownership earlier is permitted, but must settle the existing ownership rather than leave both plans claiming the result. The imaginary-quadratic supplier also consumes the field statement in §8.6, `TauCetiRoadmap/EllipticCurveModularityImaginaryQuadratic/README.md:2286`; it precedes this design and cannot acquire a dependency on it.

   **Exact repair:** Keep the totally real CM automorphic application in §4.3, but remove the general endomorphism-field construction from this roadmap's owned targets. Declare `gap:cm-elliptic-endomorphism-field` at the earlier ShimuraVarieties §5.3 as an additional number-field statement: for every number field K and geometrically CM elliptic E/K, with CM field T embedded through its action on invariant differentials, the kernel of `G_K → Aut(End(E_K̄))` is `G_{KT}`. Put the identical slug, supplier, section and needs in the plan and README and consume it in §4.3. Record the relocation from AdelicImagesAndModularCurves §3.4 so its later application can cite the same upstream owner. Do not add an upward Needs edge to that roadmap or make the earlier imaginary-quadratic roadmap consume this one. This is the original F05 gap repair with an explicit ownership resolution; the mathematical proof can accompany the supplier contract as supporting reasoning, not a second owned construction.

   **Repair test:** For `E:y²=x³−x` over ℚ, `[i]^*ω=iω` and conjugation sends i to −i, so the kernel is `G_{ℚ(i)}`. Over ℚ(√2) it is `G_{ℚ(ζ₈)}`; over ℚ(i) it is all of `G_K`. The proposed single contract supplies all three cases, and the totally real induction branch remains unchanged. The dependency gate places this design after its imaginary-quadratic supplier; ShimuraVarieties is earlier, whereas AdelicImagesAndModularCurves is later.

2. **F02** (P3) Negative Checks still exclude allowed trivial extensions and general towers

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:538`, “inducing `V_θ` from `G_M` to `G_L` gives a rank-four representation”; also lines 498–499, 689–690 and plan tests “induction”, “rotation cocycle fails”, “rational only”.

   **Claim:** These Checks apply throughout the arbitrary-number-field, arbitrary-odd-n layer.

   **Witness:** Take k=ℚ(ζ₃), n=3. Then M=L=k, so induction has dimension `2·[M:L]=2`, not 4; rotations are already L-rational. For n=45, `C_45→C_3` has degree 15, not 3 or a prime p.

   **Exact repair:** State the induction dimension as `2[M:L]`; give rank four only under M≠L and retain M=L as a positive control. Prefix the rotation-cocycle negative Check with δ nontrivial. Replace “the degree, 3 or p” by the general degree n/d for `C_n→C_d`, and identify 3 and p only for the indicated maps in the n=3p application. Make these changes in the plan tests too.

   **Repair test:** The trivial-extension example gives rank 2 and rational rotations. With k=ℚ, n=3, induction has rank 4 and inversion changes a primitive rotation. For n=45,d=3, norm after pullback is `15·id`; for n=303,d=3 and d=101 it is respectively `101·id` and `3·id`. No theorem is narrowed.

3. **F03** (P3) Geometric disconnection does not imply nonintegrality

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:833`, “two geometric components; it is not an integral Hilbert datum”; also plan target 2.3, test “all frames”.

   **Claim:** The two fixed-pairing geometric components make the full three-torsion frame cover nonintegral over every number field K.

   **Witness:** For K=ℚ, geometric monodromy is SL₂(𝔽₃), order 24, and the cyclotomic determinant has image of order 2. Arithmetic monodromy is GL₂(𝔽₃), order 48, transitive on all frames; the smooth connected cover is integral.

   **Exact repair:** Say that P has two geometric components and is not geometrically integral; it need not be disconnected over K. When ζ₃ lies in K it has two K-components, and when ζ₃ does not lie in K its arithmetic monodromy interchanges them. Keep the proof's instruction to use an integral connected K-component P₀; sometimes P₀=P. The supplier IG.2.4 requires integral covers, not geometrically integral covers.

   **Repair test:** Over ℚ there is one arithmetic component and two geometric components, with degrees 48 and 24. Over ℚ(ζ₃) there are two arithmetic components of degree 24. Both are handled by the existing proof after this Check is corrected.

4. **F04** (P3) The new characteristic-p differential Check divides by zero at two

   **Location:** `packages/EllipticCurveModularityTotallyReal/design/README.md:1146`, “over `𝔽_p` … pulls `dx/(2y)` back”; also plan target 4.3, test “characteristic p”.

   **Claim:** The displayed differential is a nonzero invariant differential for the proposed characteristic-p control without a restriction on p.

   **Witness:** At p=2, `2y=0`. On the smooth curve `y²+y=x³` over 𝔽₂, the invariant differential is dx, whereas the displayed `dx/(2y)` is undefined (or zero under totalized inversion).

   **Exact repair:** Use the general Weierstrass differential `dx/(2y+a₁x+a₃)` and give a concrete smooth model. For the dyadic control use `y²+y=x³`, whose denominator is 1, and compute `Frob₂^*dx=d(x²)=0`. Alternatively the displayed short-model computation must explicitly assume p>2, with a smooth example such as `y²=x³−x` over 𝔽₃. Update the plan Check. This remains an illustrative Check of the imported field statement after R01.

   **Repair test:** Over 𝔽₂, Δ=1 and ω=dx≠0, while the nonzero degree-two Frobenius kills ω. Over 𝔽₃, Δ=64≡1, `2y≠0` in the function field and `d(x³)=0`. Both correctly distinguish characteristic zero without using a zero denominator. The general denominator is native at `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:77`.

Four findings: one P2 ownership defect and three P3 Check defects. The mathematical repairs to the lifting and congruence arguments work. The new CM proof is mathematically sound, but its ownership is not reconciled with the other open roadmap. No design or source-manifest entry was changed during this review.

## Previous findings, checked first

Locations in this table are in `packages/EllipticCurveModularityTotallyReal/design/README.md`, unless stated otherwise. The earlier report's computed rows were used only for unchanged claims; changed claims and all fifteen sampled targets were read and checked again. No earlier finding was marked “not actionable in this package.”

| Earlier finding | Repaired passage and verification | Status |
|---|---|---|
| F01, coefficient field inside its integers | Lines 593–596: “a finite extension `E_λ` … containing the field `j_ℓ(M₀)`, with ring of integers O”. At ℓ=3, roots of unity have valuation 0 while `v₃(1/3)=−1`. The plan now makes the same distinction. | Repaired. |
| F02, five-adic coefficient domain | Lines 337–338: “extension of scalars of a representation `r̄₀ : G_F → GL₂(𝔽₅)` with `det r̄₀ = ε̄₅⁻¹`”. The gap, §2.2, elliptic applications and plan agree. In the negative control, `C²=I`, `det C=4`, but the specified projective F₅-model has determinant class 3. | Repaired. |
| F03, cubic divisor | Lines 467–468: “If `3 \| n`, so that `C_3` is a member of the tower”. Section 1.6 and its plan hypotheses carry this guard. Four branch points for n=5 give genus 5; two for n=15 give genus 3. | Repaired. |
| F04, internal assembly cycle | Lines 513–515: “all that this section constructs; the compatible system … is assembled at the end of §1.4”. Lines 553–559 assemble after the polynomial and Hodge assertions. All 18 plan targets have only earlier internal prerequisites. | Repaired. |
| F05, missing CM field supplier | Lines 316–317: “it is proved in §4.3”; lines 1109–1111 identify the kernel as `G_{KT}`. The differential proof works, and the old false attribution to ShimuraVarieties is gone. However the general result is also owned at the open adelic-images head; see R01. | Partly repaired: mathematical prerequisite supplied, ownership unresolved. |
| F06, switch statability | Lines 93–95: “Two results here are statable … the field statement of §1.1, and the 3–5 switch of §2.3”. The native torsion action, pairing, basis and j-invariant were opened at the pins. | Repaired. |
| F07, residual inertia | Lines 371–372: “`r̄\|G_{F′_w}` is unramified … The extension `F′/F` is in general ramified above p”. The cited BLGG argument has this direction. Unramified extension retains inertia `diag(−1,1)`; a tame extension of ramification index 2 kills its order-two image. | Repaired. |
| F08, gap slugs | Lines 332 and 363 explicitly give `gap:totally-real-weight-two-lifting` and `gap:totally-real-solvable-residual-cohomological-weight`. Both match the plan and their consuming Needs lines. | Repaired. |
| F09, BLGG12 page | References and the existing BLGG12 manifest entry now say “Theorem 6.1.8, p.45”. BLGG12 line 2192 begins p.45 and line 2198 begins that theorem. | Repaired. |
| F10, unqualified negative Checks | Lines 653–658 add “δ nontrivial and θ ≠ 1” and the θ=1 positive control. Lines 966–969 correctly infer irreducibility over K from that over L. Lines 426–429 restrict the divisor API to d≥3. The same missing-trivial-extension pattern survives in §§1.2–1.3; see R02. | Partly repaired: all three named passages repaired, pattern persists elsewhere. |
| F11, lattice API | Lines 620–638 now list seven facts, including “Evaluation”, “Rank”, “Galois action”, “Rationalization”, coefficient extension, restriction and reduction. The plan has the same seven API entries. Evaluation of `ℤ₃[μ_n]²` gives `O²`, even at 3 dividing n. | Repaired. |

## Verified sound

Read all 18 targets and their hypotheses, APIs, Checks, routes and Needs lines in both design representations. Rechecked all eleven previous findings, all fifteen seeded source targets, all nine source entries, both declared gaps, the overlap leads and every named supplier interface. The source texts were available locally; no new fetch or manifest change was needed. There are no author-flagged unverified locators.

The four mathematical layers are forced by their inputs: descent and its properties precede lifting, which precedes the simultaneous seed and lifts, which precede descent and the endpoint. They do not follow the source's exposition: LeHung26 introduces lifting before reflection descent. The endpoint retains every totally real degree, geometrically CM curves, every coefficient prime, monodromy and every finite local factor. No algorithm, route-only good-prime substitute, copied source passage, source instruction, sorry'd data or set_option was found. The base imaginary-quadratic geometry is imported, not re-planned. R01 concerns a repairable overlap, not a rejection of the roadmap's scope.

### Adversarial calculations

These are calculations and negative controls, not claims to have proved the modularity theorems. All 18 targets are represented, including all seeded targets and every finding location. Number-field and ellipticity hypotheses exclude zero rings, inseparable number-field extensions, nonreduced curves and rank-zero H¹. The lifting theorem excludes ℓ=2; the endpoint does not. The new characteristic-two control is treated separately in R04.

| Statement | Instances and values computed on the two sides | Result / change |
|---|---|---|
| Conventions: cohomology, Frobenius, half-shift | 11a1 has 5 points over 𝔽₃, hence `a₃=4−5=−1`: H¹ polynomial `X²+X+3`, determinant 3; its dual has trace −1/3 and determinant 1/3. Unitary root product is 1; shifting s by −1/2 gives `1+3^(−s)+3^(1−2s)`. | Matches the opened Hilbert, AG2 and Tate-module conventions. The opposite shift gives exponents −s−1 and −2s−1. |
| Convention: quadratic twist | For `x³−x+1` over 𝔽₅, point counts are 8 and 4 after multiplying by 3; traces are −2 and 2, with character value −1. | Sign agrees in §§1.2, 1.6 and 4.1. |
| 1.1 relative real cyclotomic data | ℚ,n=3: root sum −1, `[L:ℚ]=1`, `[M:L]=2`, δ(Frob₂)=−1 and δ(Frob₇)=1. n=9 gives `x³−3x+1=0` and degree 3; n=15 gives degree 4. k=ℚ(ζ₃),n=3 gives `[M:L]=1`, δ=1. k=ℚ(i),n=3 gives L=ℚ(i), whereas M's maximal real field is ℚ(√3). | General and degenerate branches agree. For d=1, δ_d(c)=1 versus δ_3(c)=−1; the repaired d≥3 guard is necessary. |
| 1.2 reflection twist | `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]`: `WRW=R²=[[-1,1],[-1,0]]`, `WR²W=R`, `W²=I`. For n=5, cubic valuations `(1,−1,−5,5)` give g=5; for n=15 they give g=3. δ=1 makes the descent action unchanged. | Cubic clause repaired. Rotation-cocycle negative Check needs δ≠1 (R02). |
| 1.3 eigenspaces | n=3: `dim H¹=6=2+2+2`; each character projector has rank 2, versus the zero projector's rank 0. `dim Ind=2[M:L]`: 4 for k=ℚ, 2 for k=ℚ(ζ₃). | Construction correct; unconditional rank-four Check is R02. |
| 1.4 pairing and assembly | On paired bases e₁,e₂ and f₁,f₂ with w exchanging e and f: `[e₁,e₂]=1`, `[e₂,e₁]=−1`, diagonals 0. Determinant is ε⁻¹; for W₁ it is `ε⁻¹δ²=ε⁻¹`, value −1 at c. Weights sum to `0+1=1`. Good P has degree 2, constant q≠0; completion model has rank 2. | All ingredients precede raw assembly. No 1.3↔1.4 cycle. The cup product without w is zero on a nontrivial odd-order character space. |
| 1.5 lattice and reductions | `v₃(1/3)=−1`, character values have valuation 0. Evaluating `ℤ₃[μ_n]²` gives `O²`, rank 2. At p, `(η̄,χ̄)=(η̄,η̄)` and `(ψ̄,1̄)=(1,1)`; at 3, `(χ̄,ψ̄)=(ψ̄,ψ̄)` and `(η̄,1̄)=(1,1)`. | Repaired coefficient field and all seven API facts have actual instances; no integral projector required. For θ=1 inversion preserves its evaluation kernel; for an order-three characteristic-zero label ω it changes ω to ω²≠ω. |
| 1.6 endpoints | For n=3, w-invariants have dimension `0+2=2` in dimensions `2+4=6`; projection of `x+wx` to W_η is x. At an inert place, traces multiply by −1. General pullback–norm on `C_45→C_3` is `15·id`; for `C_303→C_3` it is `101·id`. | Both endpoint identifications and the twist sign hold. The general-degree Check needs R02. |
| 2.1 change of prime | At 11a1's place 3, all ℓ≠3 have `X²+X+3`. For a triangular extension of ε⁻¹ by 1, both its characteristic polynomial and the split sum's are `(X−1)(X−q)`, although the extension need not split. | Fixed coefficient embeddings and semisimple recognition give the stated same-π comparison. A polynomial alone does not specify arbitrary extension data. |
| 2.2 weight-two lift | e=0 has rank 0 and is excluded; e=1 on elliptic H¹ has rank 2 and weights 0,1. Odd determinant reduces to 2 in 𝔽₃ and 1 in 𝔽₂. In 𝔽₂₅, `B²=2I`, `C²=I`, `det C=4` versus projective determinant class `det B=3`. | Finite coefficient extension and F₅-model alternative retain the correct domains. Generic elliptic mod-five image yields projective SL₂-image of order 60, so the other alternative really is needed. |
| 2.3 3–5 switch | `card SL₂(𝔽₃)=24`, Borel order 12, Cartan-normalizer orders 8,16. Rational-line stabilizer in SL₂ has order 6. Over ℚ determinant image has size 2 and frame monodromy size 48; over ℚ(ζ₃), sizes 1 and 24. Pairing components: 2 geometrically in either case, but 1 versus 2 arithmetically. | The theorem and component proof work; R03 corrects the nonintegrality Check. Infinite Hilbert parameters give infinite j because the modular j-map has finite fibres. |
| 2.4 mod-three seed and gap route | Solvable series orders `48,24,8,2,1`, quotient orders `2,3,4,2`; dual determinant at c is −1=2 in 𝔽₃. Local unramified extension leaves `diag(−1,1)` unchanged; ramification index 2 kills the tame order-two image. | The repaired route distinguishes residual unramifiedness from unramified base extension and confines the cited BLGG proof to its p=3 hypotheses. |
| 2.5 mod-five seed | SL₂(𝔽₃) of order 24 is larger than every line stabilizer (6 or a divisor of 4). The five-torsion isomorphism also identifies dual reductions. 11a1 has a fixed rational five-torsion line and fails the hypothesis. | FLHS's F₅-valued elliptic clause applies. No assumption on the original curve's mod-three image is inserted. |
| 3.1 one parameter | For cubic λ, `2−λ−λ⁻¹=3≠0 mod5`. For a=1,2,3,4, `card 𝔽_(3^a)×=2,8,26,80`, all less than p>100. At p=101, n=303, `[L:ℚ]=100`, `[M:L]=2`, and `L(ζ₃)=L(ζ₁₀₁)=M`. | Imported arbitrary-base specialization supplies the same t for all five conditions. Irreducibility on a subgroup excludes invariant lines for the larger group as required. |
| 3.2 auxiliary seed | The η and η⁻¹ spaces each have dimension 2 and identify with the same H¹(A_t). If the smaller subgroup's invariant-line set is empty, the larger group's is also empty. Prime set `{5}` is disjoint from `{3,p}`. | Correct direct seed over L, with the repaired observation that the residual condition also holds over K. |
| 3.3 three lifts | Rows at p,3,p have residual label pairs `(η,η)`, `(ψ,ψ)`, `(1,1)`. Each target rank is 2, determinant ε⁻¹, weights 0,1. The prime sequence has zero occurrences of 5. | All three lifting hypotheses and coefficient changes align. |
| 4.1 descent | `W₁⊗δ=H¹(B_t)` because δ²=1; `H¹(B_t)⊗χ=H¹(E)` because χ²=1. If h(t) is square, χ=1. A rank-one invariant subspace would give a residual line, contradicting dimension-two absolute irreducibility. | Irreducible restriction and the same G_K-representation are preserved through soluble descent. |
| 4.2 all places | 11a1 at 11 has rank N=1, conductor exponent 1 and factor `(1−11^(−s))⁻¹`. For `x³−x+1`, Δ=−368, c₄=48 and `v₂₃(Δ)=1`; 5 is nonsquare mod23, so residue degree over ℚ(√5) is 2 and the multiplicative sign squares to 1. For `x³−x` at 2, exponent 5 and factor 1. `Γ_ℂ(s+1/2)` shifted by −1/2 is `Γ_ℂ(s)`. | Good/multiplicative/additive factor degrees 2/1/0 and monodromy retained, including coefficient-prime comparison through the named supplier. |
| 4.3 CM and differential map | `x³−x` has counts 4 over 𝔽₃ and 8 over 𝔽₅, traces 0 and −2. At 5, `(-1+2i)+(-1−2i)=−2`, product 5. `[i]^*ω=iω`, conjugate scalar −i; over ℚ(√2), KT=ℚ(ζ₈). For `x³+1` at 5 the count is 6, trace 0. At p=2, the proposed denominator 2y=0; on `y²+y=x³` the correct denominator is 1 and Frobenius pullback is 0. | CM mathematics passes; ownership R01 and characteristic-two Check R04 remain. Unitary normalization divides the split Frobenius roots by √q, giving product 1 before the Tate half-twist restores q. |
| 4.4 endpoint | ℚ has degree 1; ℚ(ζ₁₅)⁺ has degree 4 and contains √5. Everywhere good reduction gives every finite conductor exponent 0 and product ideal (1). CM/non-CM alternatives are exhaustive. | No degree, √5 or reduction-type exclusion. Conditional geometric inputs are supplied by imported targets, not silently discarded. |

### Source sample and manifest

All source references below are to the cached versions identified in the unchanged manifest. Exact number, printed page and hypotheses were checked at these extraction lines. Extensions beyond a source's immediate setting are distinguished from direct quotations of its theorem.

| Target | Text opened | Result |
|---|---|---|
| 1.1 | LeHung26 line 237, §3.2 p.6 | Source treats totally real K and n=3p. The design's arbitrary-base statement has the elementary quadratic-polynomial argument and the required nonreal-root guard; its generality is justified independently. |
| 1.2 | LeHung26 lines 237–249, §3.2 (9), Lemma 3.2 p.6 | Reflection cocycle, rational rotations, integral transport and both quotients agree. Cubic use is now guarded by 3 dividing n. |
| 1.5 | LeHung26 lines 243–247, (10) p.6; OpenAI26 lines 547–578, Lemma 5.3 p.13, Corollary 5.4 p.14 | Field containment, rank-two evaluation and all three congruences checked. Character values, not the whole number field, lie in O. |
| 1.6 | LeHung26 lines 244–249, (11) p.6; OpenAI26 lines 521–541, Proposition 5.2 p.13 | Order-three and trivial-character endpoints and rational projection agree; 3 dividing n explicit. |
| 2.1 | LeHung26 lines 221–224, §2.4 p.5 | Fixed-polynomial, semisimple change of coefficient prime; formal predicates and recognition supplied by named roadmaps. |
| 2.2 | LeHung26 lines 231–235, Proposition 3.1 p.6; BD14 lines 2144–2176, Théorème 3.2.2 pp.36–37; FLHS15 lines 116–120 and 221–265, Theorem 2 p.3 and §2 pp.5–6 | Le Hung excludes 2,5. BD's universal conclusion includes potentially semistable noncrystalline cases. FLHS's determinant-square-class argument uses an F₅-model; the repaired alternative states it. |
| 2.3 | FLHS15 lines 421–452, Lemma 6.1 and proof p.10 | Arbitrary number field, symplectic five-torsion isomorphism and SL₂ mod-three image verified. Infinite j follows from Hilbert finite avoidance and the finite modular j-map; not asserted as the literal lemma's wording. |
| 2.4 | FLHS15 lines 404–412, Theorem 6 and Corollary 5.1 p.9 | Elliptic residual modularity and cyclotomic irreducibility criterion agree. General solvable cohomological-weight theorem remains a declared gap. |
| 2.5 | FLHS15 lines 127–128, Theorem 3 p.3; lines 426–429, proof p.10 | Exactly the five-adic elliptic seed; the E′ argument has no condition on E[3]. |
| 3.1 | LeHung26 lines 250–260, §3.3 p.6; OpenAI26 lines 990–1030, Proposition 8.4 p.23 onward | Source's two-conjugate argument is not silently treated as arbitrary degree: the d-factor extension is explicitly imported from the imaginary-quadratic roadmap §7.4. |
| 3.2 | LeHung26 line 264, §3.4 p.7; FLHS15 line 127, Theorem 3 p.3 | Seed over L and cubic endpoint agree. |
| 3.3 | LeHung26 lines 264–269, §3.4 p.7 | Three rows and residual inputs match p,3,p. |
| 4.2 | LeHung26 lines 361–363, §5 p.9; FLHS15 lines 66–77, §1 p.2 | Sources give modularity and compatible realization; detailed conductor/monodromy assertions are supported by the resolved supplier interfaces below. |
| 4.3 | LeHung26 lines 364–366, §5 p.9; OpenAI26 lines 1200–1215, §9.4 pp.27–28 | Faithful differential argument and induction versus sum branches read. Number-field extension of the differential argument works; R01 is ownership, not a source overclaim. |
| 4.4 | LeHung26 lines 86–93, Theorem 1.1 p.2 | Conditional on geometric Inputs 2.1–2.2; this design imports their proofs. Those inputs are not assumed without an owner. |

Also opened: OpenAI26 lines 480–514 (Proposition 5.1, pp.12–13) for pairing, Hodge labels, semisimplicity and Frobenius traces; LeHung26 lines 357–360 (Lemma 5.1, p.9) for §4.1; BLGG12 lines 2024–2052 and 2192–2223 (Theorems 6.1.5 and 6.1.8, pp.41–42 and 45); BLGG13II lines 82–159 (Theorems 2.1.2, 3.1.1–3.1.2, pp.2–4); Kisin09 lines 3976–4009 and 4068–4075 ((3.5.5), p.1170 and (3.5.7), p.1172); SW99 lines 2468–2505 (Theorems A–B, pp.74–75); BCDT01 line 15 (Theorem A, p.1). Kisin's local restrictions, BLGG's image and local hypotheses, and SW99's residual reducibility/Hypothesis H are not erased. Nine works have nine unique manifest keys, with version-specific pagination. No missing-reference request is necessary.

### Suppliers, pins and ownership

Read the main versions of `TauCetiRoadmap/EllipticCurves/README.md`, `TauCetiRoadmap/ModularCurves/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md` for shape and foundational scope. New supplier roadmaps were fetched read-only with `roadmaps show` at their supplied open heads. The following locators are README line numbers without the tool's provenance wrapper; each file is `TauCetiRoadmap/<supplier>/README.md` unless identified as a pinned library file.

| Supplier | Resolved interfaces and witness |
|---|---|
| EllipticCurveModularityImaginaryQuadratic, #1048 | §0.2 fixed-pairing twists; §§1.1–1.3 covers; §3.1 regular marking; §§4.1–4.4 systems, endpoints, evaluation and congruences (lines 1258–1412); §§5.1, 7.1; §7.4 lines 1981–2060 explicitly owns arbitrary-number-field simultaneous specialization with the normal-closure prime choice. §8.6 line 2286 has the CM application implicated in R01. |
| AutomorphicGaloisRepresentations, #1007 | §3.10 line 2218: geometric `X²−tX+qs`, twist formula at 2267; §3.13 line 2340: de Rham characters; §3.14 line 2398: determinant/oddness/irreducibility; §4.4 line 2519: full away-prime WD; §4.7 line 2543: coefficient-prime comparison without residual hypotheses. |
| AutomorphicGaloisRepresentationsPartII, #1006 | AG2.0 attachment, algebraic characters and twist/dual rules; AG2.P shared weak predicate and “Independent classical and Hilbert members”, lines 488–531. It uses the same cohomological Hilbert member and separately defines its arithmetic dual. |
| PotentialAutomorphyInfrastructure, #1081 | §2.3 lines 819–825 supplies descent of the same continuous representation with irreducible restriction and all finite local parameters. |
| GL2AutomorphicRepresentationsAndTransfer, #931 | R16.2.13 line 929 archimedean cases; R16.3.2 line 961 Steinberg; R16.3.5 line 995 conductors; R16.3.6 line 1036 gamma factors; R16.4.4 line 1136 uniqueness comparison; R16.6.3–4 lines 1349–1381 algebraic weights and arithmetic parameter conversion; R17.4.16 lines 2692–2711 quadratic induction; R17.5.14 lines 2977–2983 supplies weight one, not the requested cohomological witness. |
| GL2ModularityLifting, #1071 | §5.7 line 1334 and §5.10 line 1394 retain the local/strong residual restrictions described by the design. Their absence of the BD theorem is correctly declared as a gap. |
| ArithmeticGaloisRepresentations, #856 | §4.1 lines 3143–3149 plans `GaloisRep.IsOdd`; §5.3 lines 3514–3529 plans `GaloisRep.iso_of_frobenius_charpoly_eq`; §6.1 lines 4064–4073 plans `TateModule.residualRep`. These resolve the three supplied missing-name leads: they are supplier declarations, not claims about the pins. Layers 1–3 supply continuous representations, stable lattices, WD and conductors. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | IG.2.4 lines 1965–1983 requires integral covers and supplies Hilbert finite avoidance; IG.2.6 line 2165 full-group specialization; IG.2.7 lines 2304–2322 Hilbert approximation. R03 distinguishes integrality from geometric integrality. |
| ModularCurves, main | §0E lines 839–875, polarized projective-curve descent and finite actions; Layers 3 and 5B level structures and fixed-pairing curves. Canonical polarization is ample for m≥3. |
| ModularCurvesPartII, #913 | §4.10 lines 1560–1582: fixed-pairing geometric connectedness for N≥3. N=15 is allowed; its component count does not assert nonintegrality over the ground field. |
| EllipticCurves, main | Layer 0.5 lines 398–420 Galois actions and morphism descent; Layer 1 lines 593–619 invariant differentials, pullback and separability; Layer 4.5a local-model comparison; Layer 5 twists. These suffice for the differential reasoning, not a claim that the KT theorem is already stated there. |
| JacobianChallenge, main | Layers D–F; lines 42–46 explicitly allow representability of Pic⁰ without a rational point. A point normalizes the Abel–Jacobi map, not the existence of Pic⁰. |
| SmallRamificationAndAbelianVarietyBaseCases, #970 | §5.0d lines 1993–2024: raw carrier, semisimple members and finite realization fields. It does not infer a minimal local model from polynomial coefficients. Here an M₀-completion model is obtained from actual rotation eigenspaces. |
| PotentialModularityAndCompatibleSystems, #1075 | §1.1 line 95 compares weak-family predicates; §1.6 lines 210–240 separates automorphy and away-coefficient strictness. No coefficient-prime result is inferred from weak compatibility alone. |
| AbelianSchemesAndArithmeticModuli, #849 | A4.1 lines 1838–1853 integral Tate modules; A6 endomorphism realizations; A6.11 lines 3042–3053 integer, ℓ-independent endomorphism polynomials. |
| NeronModelsAndSemistableAbelianVarieties, #852 | §3.10 line 1895 semistable reduction; §5.1 line 3109 NOS; §5.3 line 3200 finite-local-field comparison; §5.6 line 3755 bad Euler factors and native elliptic comparison; §6.10 line 4296 abelian compatible systems. Its H¹ is the dual Tate module. |
| FaltingsFinitenessAndIsogenyTheorems, #1004 | R28.4.5 lines 1858–1862 semisimplicity for every coefficient prime over a number field. |
| ShimuraVarieties, #933 | §5.3 lines 1525–1553 CM actions/eigenspaces over ℂ. It still has no number-field KT descent assertion, which must be an explicit additional contract if used as R01's owner. |
| EtaleCohomologyFoundations, main | §0.11 lines 1157–1173 trace and curve duality at finite coefficients, with F.4–F.5 for adic realization; supplies the cup product into H²=ℚ̄ℓ(−1). |

The pinned revisions agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the following declarations and their binders rather than relying on name search alone:

| Pinned file | Declarations and inspected content |
|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48` | `NumberField.IsTotallyReal`; `maximalRealSubfield` at 126, its maximality at 140, total-reality instance at 157, `IsTotallyComplex` at 210. Maximal-real membership quantifies over every complex embedding, not one. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:70` | `IsCMField`; `CMExtension.eq_maximalRealSubfield` at 456, `IsCMField.ofCMExtension` at 510, `IsCyclotomicExtension.Rat.isCMField` at 564. The cyclotomic assertion has an n>2 guard. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean:74` | `IsCyclotomicExtension` has primitive roots and generation fields on general commutative rings; the design separately supplies its number-field hypotheses. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366` | `WeierstrassCurve.IsElliptic` is invertible discriminant; j at 388 is `Δ'⁻¹*c₄³`. A bare Weierstrass equation does not carry ellipticity automatically. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:80` | `WeierstrassCurve.tateModuleGaloisRepresentation`, the homological action, with prime binder. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | `TauCeti.det_tateModuleGaloisRepresentation`; ellipticity, separable closure and nonzero ℓ in the field are retained. H¹ uses the inverse determinant. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:164` | `quadraticTwistOf`; `quadraticTwist` at 469 requires a separable quadratic extension; `quadraticTwistPointEquiv` at 824; its character-equivariance theorem at 945. The trivial extension is a separate untwisted branch. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` | `torsionGaloisAction` on native torsion points. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:225` | `TauCeti.Isogeny.weilPairing` on native N-torsion, valued in roots of unity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Galois.lean:104` | `WeierstrassCurve.weilPairing_torsionGaloisAction`, same torsion carrier and coefficient action. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean:149` | `WeierstrassCurve.nonempty_basis_torsionBy` supplies a Fin 2 basis over ZMod N, for elliptic W over a separably closed field and N invertible. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Differential.lean:79` | Native differential pullback; composition and additivity are available. The new Galois-kernel conclusion is not identical to those existing pullback laws. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:77` | Native denominator `2y+a₁x+a₃`, supplying R04's characteristic-two correction. |

Object searches in both pinned libraries and `roadmaps grep` covered rotation/reflection descent, cyclotomic fields, torsion/pairing switches, compatible systems, modularity and CM endomorphism descent. The existing field, torsion, twist, differential and generic system machinery remains imported. The new reflection-descended family and the arbitrary-totally-real elliptic endpoint have the appropriate scope here. The extra general CM ownership collision is R01.

The five closest open roadmaps were inspected: #1048 owns the imaginary-quadratic endpoint and the imported arbitrary-base geometry; #1036 (`TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md:3`) owns GL₂-type varieties over ℚ and ℚ-curves; #1484 (`TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md:3`) owns the rational wild-three argument and its local/global companions; #1075 owns compatible-family/potential-modularity infrastructure; #1746 (`TauCetiRoadmap/AbelianSurfacesModularity/README.md:3`) owns the rank-four surface 2–3 switch. #2137 GL2ModularityLiftingPartII's defect-one weight-one/Bianchi scope does not discharge either gap. Shared rational and real-quadratic cases are comparisons, not separately owned endpoint proofs here.

The overlap leads contain no conflicting head, dropped cited id, id available only in an open revision, or dropped id with a consumer. The additional object collision was found by reading #1727's §3.4, not by treating the empty dropped-id list as a complete ownership audit. The board package index was read before absence claims: the supplied AnalyticNumberTheory and LogicAndDefinabilityInNumberTheory heads were fetched and searched; neither owns these objects. LawrenceVenkateshMethod remained inaccessible as recorded below. No unprovided PR head was independently sought.

Both existing gaps have named earlier owners, identical README/plan slugs, substantive hypotheses and a single missing conclusion. They request neither an already supplied unrestricted lifting theorem nor an already supplied cohomological-weight witness. They are contracts, not unowned prerequisites. Their precise mathematical statements pass after the F02/F07 repairs; no finding is based on their present absence upstream.

The exact dependency command from the brief was run without changing ORDER.txt. Its complete output was:

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

No UPWARD or CYCLE line. A separate traversal of all target prerequisites found zero forward or cyclic internal edges. The citation resolver found no unresolved cross-roadmap citation; its explicit warning that it had not checked pinned library names was addressed by the local inspections above. No forbidden supplier is used. Downstream names are not treated as supplier edges.

### Shape, headline coverage and package-stage checks

The README has Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, four layers with Examples and Dependencies, Downstream consumers, Worked examples and References. All 18 targets have locators, hypotheses and individual Needs lines. The field, twist, eigenspace and lattice definitions have 5, 5, 5 and 7 explicit API facts, respectively, and at least three discriminating Checks. The new differential construction has its facts in prose rather than an API list; R01 removes it as an owned construction, so no separate duplicate repair is charged for that shape consequence. Mathematical typography, source version metadata and imported code names were distinguished from process narrative. No machine path, job reference, PR number or HTML anchor occurs in the design text.

Headline inventory: relative cyclotomic fields (§1.1); reflection descent, rank-two properties, integral congruences and elliptic endpoints (§§1.2–1.6); change of prime (§2.1); summand lifting (§2.2); the arbitrary-number-field 3–5 switch (§2.3); mod-three and mod-five seeds (§§2.4–2.5); simultaneous specialization, auxiliary seed and three lifts (§§3.1–3.3); non-CM descent (§4.1); all-prime/all-place comparison (§4.2); CM induction (§4.3); full totally real elliptic modularity (§4.4).

The corrected design identifies §§1.1 and 2.3 as statable acceptance theorems. Existing native torsion, pairing, matrix and j-invariant carriers suffice for the latter without an artificial automorphy predicate. No one-tactic proof of either general headline follows from the opened declarations. The automorphic headlines lack native Hilbert cuspidal/attachment carriers; the cover headlines lack the imported cover/cohomological-family construction. At package stage the module docstring must identify each nonstatable headline individually, and the Lean file must state the statable headlines without replacing them by boundary cases.

There is no `Suggested.lean` in this design. Consequently there are zero sorried theorem declarations to probe, zero own Lean declarations to match, and no import header or section-variable signature to elaborate. Imported backticked identifiers were resolved to their suppliers; the plan's prospective names are not claimed Lean declarations. No padding, sorry'd data or set_option can be reported in an absent file. **Elaboration: not available (this lane does not elaborate).** No Lean command was run. This is not a passing package build and does not claim that “sorry” was the only warning.

## Not verifiable

- Lean elaboration, expanded `#check @name` signatures and executable one-tactic probes are unavailable in this lane, and no Suggested.lean is present. Their package-stage results are not certified.
- `packages/LawrenceVenkateshMethod/README.md` at the supplied board PR #345 head `9ee7ac3` returned HTTP 404 again. Ownership against that package's contents is not certified. The other two indexed board package heads were readable.
- `ModularityAndLanglandsExtensionsPartII` was not returned by the roadmap service. It is only a named downstream consumer here, not a prerequisite. No supplier gap or upward edge is inferred from that absence.
- All nine cited source texts were readable. There is no unreadable mathematical source and no new missing-reference request.

## Source issues

- **Misprint** in LeHung26 at §2.1, equation (5), printed p.5: the source introduces the cubic quotient while the surrounding cover tower allows arbitrary odd n; it should require 3 dividing n for that quotient; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "900965584580c5a8ffa4cacae8856b5849141092", "job": "REV-DESIGN-EllipticCurveModularityTotallyReal~2", "model": "gpt-6-astra", "worker": "chris-32"} -->
