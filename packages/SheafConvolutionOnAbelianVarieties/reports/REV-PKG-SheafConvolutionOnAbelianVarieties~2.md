<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1674#issuecomment-6402242633 -->
Review (claude) of f1720ea

Verdict: accepted
Conditional on the announced gaps: `geometric-character-comparisons`, `closed-extension-constructible-comparison`, `serre-heart-verdier-comparison`, `semisimple-proper-direct-image`, `tannaka-kernel-exactness`, `ample-divisor-albanese`, `rational-map-extension-to-abelian-varieties`, `translation-stabilizer-family-quotient`, `isogeny-character-trace-decomposition`, `conormal-gauss-geometry`, `holonomic-riemann-hilbert-index`, `hodge-tate-image-cocharacter`, `minuscule-weight-table`, `bounded-norm-orbit-hodge-loci`, `polarized-integral-jacobian-comparison`, `relative-pointed-albanese`

1. **F01** (P3) §4.4 cites the wrong LS line for Lemma 3.8

   **Location.** `packages/SheafConvolutionOnAbelianVarieties/README.md` line 648: "(K1, Corollary 1.10 and the table before it, p. 12; K1 line 444; LS, Lemma 3.8 and its proof, p. 21; LS line 993.)"

   **Claim.** LS line 993 is Lemma 3.8.

   **Witness.** LS line 993 is on printed page 22, inside the review of Krämer's notation that precedes the proof of Lemma 3.9. Lemma 3.8 and its proof are LS lines 966–972, printed page 21 (the page-22 marker is at line 975). The page in the locator is right; the line is wrong.

   **Repair.** Replace "LS line 993" by "LS line 966" at line 648. (The K1 part of the locator is correct: K1 line 444, p. 12.)

2. **F02** (P3) §4.5 route misses the degenerate case of a constant support map

   **Location.** README line 670: "Write g₁:A→B₁ for the induced surjective homomorphism, so that Z₁ is a translate of g₁(H). If Z₁ were a translate of B₁ its Gauss degree would be zero, whereas Λ_(Z₁) is clean. Otherwise H is an irreducible component of g₁⁻¹Z₁ by dimension."

   **Claim.** A translate of B₁ has Gauss degree zero, so Z₁ is not a translate of B₁ and H is a component of g₁⁻¹Z₁.

   **Witness.** Instance g₁=0 (the support map H⇢Z₁ constant): B₁=0, Z₁ is a point, and the point conormal has Gauss degree 1, not 0 (§4.1 Check, line 597). The sentence is false on this instance and the next step ("component of g₁⁻¹Z₁ by dimension", with g₁⁻¹Z₁=A) does not apply. The case is excluded, but by a different argument: Λ_(Z₁)=Λ_pt forces Λ_([m]H) to be a component of Λ_pt◦Λ_(Z₂), a translate of Λ_(Z₂), so deg Λ₂ ≥ N and deg Λ₁ ≤ 1 < 2.

   **Repair.** At line 670, before "If Z₁ were a translate of B₁", insert: "If g₁=0 then Z₁ is a point, Λ_(Z₁)=Λ_pt has degree one, and Λ_([m]H) is a component of Λ_pt◦Λ_(Z₂), a translate of Λ_(Z₂); then deg Λ₂≥N and deg Λ₁≤1, a contradiction. So B₁ is positive-dimensional." Tested on the instance: with g₁=0 the inserted sentence closes the case; with B₁≠0 the existing argument is unchanged (a translate of a positive-dimensional B₁ has conormal inside A×(Lie B₁)^⊥, Gauss degree 0, as stated).

3. **F03** (P3) the pinned minuscule definition is not cited

   **Location.** README lines 41–43 (`### From Tau Ceti`) and line 121: "Minuscule keeps its usual meaning (the weights form a single Weyl orbit), so the zero weight, with orbit {0}, is minuscule in every type, E₈ included".

   **Claim.** The minuscule convention and the zero-weight fact are stated in prose with no library citation, although the README's rule is that what exists at the pins is cited by name and file.

   **Witness.** At the Tau Ceti pin, `TauCeti/Algebra/Lie/HighestWeight/Minuscule.lean` line 197 defines `TauCeti.IsMinuscule` (dominant integral, every weight of L(μ) in the Weyl orbit of μ), line 238 gives `IsMinuscule.finrank_irreducibleQuotient_eq_card_orbit` (dim L(μ)=|W·μ|) and line 259 `isMinuscule_zero`. No per-type classification exists at the pin (the only type-specific files are E₆/E₇/B/D carriers), so `gap:minuscule-weight-table` still asks for something not provided.

   **Repair.** Add to `### From Tau Ceti`: "`TauCeti.IsMinuscule` in TauCeti/Algebra/Lie/HighestWeight/Minuscule.lean is the single-Weyl-orbit definition used here, with `TauCeti.isMinuscule_zero` for the zero weight and `TauCeti.IsMinuscule.finrank_irreducibleQuotient_eq_card_orbit` for dim L(μ)=|W·μ|; the per-type table of nonzero minuscule weights is not at the pin." At line 121 replace "Minuscule keeps its usual meaning (the weights form a single Weyl orbit)" by "Minuscule is `TauCeti.IsMinuscule` (the weights form a single Weyl orbit)".

Independent round-2 review of `packages/SheafConvolutionOnAbelianVarieties/` (README.md, Suggested.lean, metadata.toml, sources.toml) at the current board head, against Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All seven round-1 findings are repaired at the head (witnesses below). Three new non-blocking findings (P3): one locator, one degenerate case missing from a proof route, one pinned declaration to cite. No P1 or P2. Acceptance is conditional on the sixteen declared supplier gaps listed in `review.json`.

## Round-1 findings: repair status at the current head

| Id | Status | Witness at the head |
|---|---|---|
| F01 (P1) G1 unowned | **Repaired.** | `design/plan.json` now has 16 `gaps`, none without a supplier and no G1/G3 record. README line 13: "This roadmap owns the bespoke Appendix B comparisons of §6.2, with their unbounded ranges". §6.2 (lines 943–969) states every comparison with its exact range and a route through ClassicalArithmeticCompletion §§2.39(e), 2.57, 2.71 for the unbounded part; "The target includes the unbounded ranges, which a list of verified cases does not prove" (line 958). I recomputed every listed inequality exactly (rational arithmetic, square roots replaced by rational upper bounds at denominator 10³⁰) for 5 ≤ n ≤ 120: no failure; the exponent margins of the unbounded entries are listed in the table below. The constants match their LS usage sites (LS lines 5128–5150, 5169, 5186, 5247, 5532, 5602, 5727, 5740). |
| F02 (P1) G3 unowned | **Repaired.** | New target §9.3 "Transport Hodge relations and period fibres" (lines 1288–1310) with parts (a)–(d), locator (LS lines 1707–1726; CDK lines 54, 59, 121) and four Checks; §9.4 (lines 1312–1325) is the former quasi-finiteness target rewritten through (a)–(d); §9.1 line 1247 pins Γ_m to "the full group of integral isometries" and line 1255 states "t∘u=r·id". Scope line 15 records local ownership with the reason. The mathematics of (a)–(d) is checked row by row below. |
| F03 (P2) support maps need irreducible components | **Repaired.** | §4.3 line 628: "exactly one pair (i,j) has Λ_Y in Λ_(Z₁,i)◦Λ_(Z₂,j); for that pair a_i=b_j=1 … dominant rational maps Y⇢Z₁,i and Y⇢Z₂,j. No map from Y onto the whole support of Λ₁ or of Λ₂ is asserted." Route line 632 gives the multiplicity sum Σa_ib_jc_(ij); Checks lines 641–642 (four distinct sums; x+z=y+t). §4.5 line 670 uses the contributing components and deg Λ₁ ≥ deg Λ_(Z₁)=N; Check line 679. |
| F04 (P2) collision set omitted nonidentity torsion | **Repaired.** | §8.1 line 1192: E_r=ρ_B(T_r) finite torsion; "for every 0≤e<e′≤M and every η∈E_r the prime-to-p torsion characters ψ of B with (σ^e−σ^e′)ψ=η form a finite set"; B made σ-stable; "Equality of σ^eχ and σ^e′χ on B detects only η=0 and does not suffice." Check line 1199 is the E³ order-4 example with η=2. Recomputed: 2+9+5=16, 6+9+5=20, both ≡0 (mod 4); 1−3≡2 (mod 4). |
| F05 (P2) minuscule table needs nonzero weights | **Repaired.** | Line 119 "the nonzero minuscule dominant weights"; line 121 records the zero weight as minuscule in every type; plan `needs` carries the same wording; §4.6 route line 689 and Check line 698. Consistent with the pin: `TauCeti.isMinuscule_zero` (see R03). |
| F06 (P2) compound Albanese gap | **Repaired.** | Lines 77 and 79: `gap:ample-divisor-albanese` (dim A≥3, Alb(H)→A isomorphism) and `gap:rational-map-extension-to-abelian-varieties` (smooth X, field case of §A1.8) are separate; line 81 names the consumers and the nodal-curve non-example. Same pattern applied to `gap:closed-extension-constructible-comparison` (line 51, §2.4). Both new slugs are in `plan.json` `gaps`. AbelianSchemesAndArithmeticModuli §A1.8 at its head indeed states Weil extension over a connected Dedekind base only. |
| F07 (P3) n=2 Check value | **Repaired.** | Line 964: "At n=2, A(2,1)=1, so the inequality (n−1)²/2<A₁−1 becomes 1/2<0 and fails". |

The repaired patterns were looked for elsewhere: no other `gaps` entry lacks a supplier; no other contract bundles two independent statements with different consumers (the two-clause `bounded-norm-orbit-hodge-loci` has one source, CDK Theorem 1.1 and Corollary 1.3, and one consumer, §9.3); no other Check carries a wrong computed value (every numerical Check in §§3.1–3.3, 4.1–4.7, 5.1–5.8, 6.1–6.7, 7.4–7.6, 8.1–8.2, 9.1–9.3 was recomputed, see the table).

## Verified sound

### Principles

No route-specific shortcut (multiplication covers allow every m>0, line 25; Layer 8 restricts to prime-to-p characters where the determinant argument lives and says so, lines 1188–1190); no re-planned roadmap (every imported object is cited by roadmap and section; the scope deferrals at lines 9–15 name the owners); no upward or cyclic supply (depcheck below); no copied passage (all source references are locators); no computational algorithm (§6.2 states inequalities, not the LS verification code, LS line 5749); no sorry'd data, no `set_option`, no `lemma`, no `#eval`/`#print`, a single `import Mathlib` (grep of Suggested.lean); no LaTeX delimiters, no process words, pull-request numbers, "(removed)" stubs or machine paths in README, sources.toml or metadata.toml (grep). `metadata.toml` is `topic = "math.AG"`.

### Sources: seeded sample (all nine manifest texts readable from the cache; nothing flagged unverified, waived or uncertified; no fetch needed; no `needs-references.toml`)

| Target | Locator read (source line, printed page) | Outcome |
|---|---|---|
| 0.1 Geometric character space | LS lines 1388–1397, p. 30 | Π(A)=Hom_cont(π₁ᵉᵗ, Q̄_p^×); "proper subtorus" = characters trivial on π₁ of a nontrivial abelian subvariety. README's T_B, torsion cosets and the warning that this is a set with group structure match; the product and base-extension clauses are correctly a declared gap. |
| 0.2 Origin-normalized character sheaf | LS lines 693–700, p. 15 (Definitions 2.3–2.4) | Rank-one sheaf with monodromy χ; descent for Galois-invariant χ with trivial identity stalk. Matches. |
| 0.3 Derived sheaf convolution | LS lines 648–657, p. 14 (Lemma 2.1); W lines 8–24, p. 1 (Proposition) | K∗L=Ra_*(K⊠L); rigid symmetric monoidal, unit δ₀, dual [−1]^*DK; W's proposition gives rigidity with M^∨=(−id)^*D(M). Matches, including the remark that the sources state it over algebraically closed k. |
| 2.3 Galois normalization | LS lines 842–852, pp. 18–19 (Lemma 2.9 and proof) | Hypotheses: χ Galois-invariant, K geometrically semisimple, H^i(K⊗Lχ)=0 for i≠0; conclusion: Galois normalizes (G°)^der, the proof first normalizing G. README's "K geometrically semisimple and belongs to Pχ" is equivalent (line 470). Matches. |
| 4.3 Microlocal tensor factorization | K2 lines 728–734, p. 15 (Thm 2.3.1); 1200–1226, pp. 25–26 (Lemma 5.2.2 and proof); 1402–1408, pp. 29–30 (Prop 6.1.1) | Lemma 5.2.2 needs irreducible Z₁, Z₂ with finite stabilizer and a multiplicity-one component: the repaired §4.3 reduces to exactly this. Prop 6.1.1: simple holonomic M, Stab(M)=0, Lie(G) not simple modulo centre ⇒ [n]_*cc(M)=Λ₁◦Λ₂ with effective clean factors of degree >1; README's sharper hypothesis (nonzero derived algebra with ≥2 simple factors) is the round-1 source correction. |
| 4.4 Minuscule hypersurface representation | K1 lines 430–450, pp. 11–12 (definition, table, Cor 1.10); LS lines 966–972, p. 21 (Lemma 3.8) | Cor 1.10: irreducible Lagrangian Λ not translation-stable, CC(M)≡Λ mod degenerate ⇒ representation of G_u(M)° minuscule. The LS line in the README is wrong (R01); page right. |
| 4.6 Minuscule representation alternatives | LS lines 1057–1068, p. 23 (Lemma 3.10) | The three cases (standard SL/Sp/SO; spin, E₆, E₇ lowest-dimensional; ∧^k of SL_m, 2≤k≤m/2) match §4.6. |
| 5.1 Exterior-power weight multiplicity | LS lines 1159–1170, p. 25 (Lemma 3.14, eq. (3)); 4343–4356, p. 93 (Prop B.1, eq. (10)) | Sum over 0≤m_S≤m_H with Σm_S=k, Σ i m_S(i)=s+q of Π binom(m_H(i), m_S(i)): the histogram formula of §5.1 and the subset count of `wedgeMultiplicity` agree (computed below). |
| 5.2 Exceptional Pell sequence | LS lines 4641–4654, p. 96 (Lemma B.7 and proof) | Positive solutions with a≤b are (a(i),a(i+1)), i≥1; descent b′=4a+1−b with 0<b′<a for a>1; a=1 forces b=5. README's P_j=(a(j+1),a(j+2)) and route match; brute force below. |
| 5.3 Exceptional threefold degree | LS lines 4636–4640 (B.6 conclusion), 4655–4659, p. 96 (B.8) | (m−k)(m−k−1)+k(k−1)=4k(m−k); m=4,k=2 or m=a(i)+a(i+1), k=a(i), i≥2. README's j≥1 is i≥2. Matches. |
| 5.4 Hodge constraint | LS lines 1159–1170, pp. 25–27 (Lemma 3.14) | Existence of m_H and s with the all-q row equation under the ∧^k hypothesis. Matches; the normalization 2k≤m is derived, not assumed, in the README. |
| 5.7 Threefold classification | LS lines 4503–4512, p. 95 (Lemma B.5); 4655–4659, p. 96 (B.8) | m_H supported on w−1,w,w+1 with endpoint values 1 unless m=4,k=2. Matches §5.7 and the Lean conclusion. |
| 6.4 Large exponents | LS lines 5393–5400, p. 108 (B.19) | k≥n, n≥5 ⇒ one ratio <1, the other >A(n,1)−1, from m_H(w−1)+m_H(w+1)≤n−1 after w=w′. Matches. |
| 8.2 Character generic in every conjugate | LS lines 1628–1649, pp. 35–36 (Lemma 4.9 and proof) | Statement and the ℓ^(2kn) versus ℓ^(2k(n−1)) count match; the README's "no ℓ≠p condition here" is correct, the source imposes none. |
| 9.1 Period maps of isogeny pullbacks | LS lines 1698–1703, p. 37 (Prop 4.11); proof 1704–1750, pp. 37–38 | Moduli of smooth hypersurfaces of a fixed Picard class; period map of H^(n−1)([m]⁻¹H). The README's full-isometry quotient, Picard (not NS) class and trace/pullback maps match the proof's Z_m construction (lines 1707–1715). |

Also opened for the repaired passages: LS lines 1582–1627 (Lemma 4.8 and proof, pp. 34–35) for §8.1; LS lines 5083–5150 (B.11, p. 101) and the constant sites listed under F01 for §6.2; K2 line 1221 (rational maps from smooth varieties extend, p. 25) and JV lines 941–948 (Prop 6.1, p. 19) for the F06 contracts; CDK lines 41–62 (nonsingular base, S(K), Thm 1.1, Cor 1.3, p. 2) and 118–123 (Hodge metric, p. 4) for §9.3; EHS lines 781–792 (Thm A.1, p. 20); BR lines 12–14 (Thm 1.1, p. 1) and 67–70 (arbitrary field, p. 2); JV lines 1713–1718 (Thm 12.1, p. 38); KW lines 41–43 (Thm 1.1, p. 2), 787–794 (Prop 10.1, pp. 21–22), 1084–1096 (Lemma 13.1 and P^χ, pp. 29–30); K2 lines 348–350 (Def 1.2.2, p. 8) and 593–600 (p. 13).

### Adversarial pass (sampled targets, headline theorems, every target a repair or finding touched)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §6.2, n≥5 list (10 entries) | every n in 5..120, exact | n=5: 8<25; 24<25; 1848<1875; 660<676; 58<66; 390<15625; 0<17576; 30<44616; 0<4225; 52+4+1+0+1=58<66. n=11: 78nA₄=8355301812<8427392875 (ratio 0.991). No failure in 5..120. | Hold. Unbounded part: exponent margins 3ⁿ vs 4ⁿ (10A₂<A₁², 28A₂<3(A₁−1)²), 5ⁿ vs 8ⁿ (78nA₄), 6ⁿ vs 8ⁿ (341A₅), 5ⁿ vs 12ⁿ (6nA₄), 7ⁿ vs 9ⁿ (100A₆), 2.45ⁿ vs 3ⁿ (√(2A₅)); route's §2.57/§2.71 bounds suffice. |
| §6.2, n≥6, n≥8 entries | n=5,6,7,8; 8..120 | 9(n−1): 36>26 at n=5 (excluded), 45≤57 at n=6. 247≤A₁: 120 at n=7 fails, 247=247 at n=8 (so ≤, not <). 140A₇<A₁⁴ holds 8..120 (8ⁿ vs 16ⁿ). | Ranges exact; no change. |
| §6.2, n≥11 sum | n=10 (control), 11..120 | n=10: fails; n=11 onward holds (2.83ⁿ vs 3ⁿ). | Threshold exact. |
| §6.2, 6≤n≤19 sum with √(2·n!) | n=5 (control), 6..19 | n=5 fails; 6..19 hold. | Range exact. |
| §6.2, 5≤n≤10 entries | n=5..10; n=11 (control) | √(2A₄)+1≤A₁²/(48(n−1)): n=7 gives 49.806≤50 (constant 49 gives 48.98: fails); n=11 also holds (4414≤8636) but is not claimed. Two sums hold 5..10. | Ranges as stated; Check at line 965 correct. |
| §6.2, 6≤n≤10 and n=5 ratio entries | n=5..10 | 27·46²A₂<4·45²A₁²: n=5 would give 3770712<5475600 (true but not claimed, B.11 treats n=5 separately); n=6..10 hold. n=5: 6·13·46²·66=10893168<11·45²·676=15057900. | Match LS lines 5133–5150. |
| §6.3 constant 45/46 | — | (1+√(11/12))/2≥45/46 ⇔ 11·529=5819≥5808=12·484. | Holds; matches LS line 5132. |
| §6.1 ratios | histogram 1[−1]+23[0]+1[1], k=5 | d=8855, r=4, t=19: R_a=19/5, R_b=1/5, sum 4=A(3,1), product 19/25<1; five q=2 ratios (0,0,1,0,0), sum 1=A(3,2). Surface 5[0]+[1], k=3: R_a=0, R_b=1, product 0=0. | Formulas rederived from binomial quotients; hold. |
| §5.1 `wedgeMultiplicity` | (0,0,1,1),k=2,t=1; (0⁵,1),k=3,t=0..4; m=0,k=0; m=2,k=3; four zeros k=2 | 4; (10,10,0,0,0); 1 at t=0; all 0; 6 at 0 (elaborated `#eval` and independent enumeration). | Subset count, not ordered; junk k>m gives 0. |
| §5.1 descent count in `hasEulerianExteriorWeights` | n=0..4 | rows (1), (1,0), (1,1,0), (1,4,1,0), (1,11,11,1,0) by `#eval`. | Equals the supplier's descent-indexed A(n,q); A(0,0)=1 retained. |
| §5.2 `exceptionalPair` / `exceptionalPair_classification` | j=0..4; all 0<a≤b<3000 | (1,5),(5,20),(20,76),(76,285),(285,1065); solutions of a²−4ab+b²=a+b with a≤b<3000: exactly these five. a=b: −2a²=2a impossible; a=1: b²−5b=0 ⇒ b=5. | Both directions; subtraction 4b+1−a exact on all computed terms. |
| §5.3 `exceptionalDegree` | j=0..4 | C(a+b,a) mod 6 = 0 and C(a+b,a)=6·C(a+b−2,a−1) and (a+b)(a+b−1)=6ab for all five; D₀=1, D₁=8855, D₂=36030431772522503316. | Division exact; j≥1 excluded by k>1 (P₀ has k=1). |
| §5.4 Hodge constraint | (0,0,1,1),k=2 | row 1,4,1 at s=0; total 6=C(4,2)=3!·1; +3 on each weight shifts exterior-square weights by 6. | Row equation and central shift consistent. |
| §5.6 `surface_exterior_classification` | brute force: all weight multisets in {0..4}, 4≤m≤11, all 1<k<m−1, rows n=2..8 | n=2 realizations found: (m,k,d)=(4,2,3),(6,3,10),(8,4,35),(10,5,126), each with one singleton endpoint; every one satisfies the Lean conclusion (m=2k, d=C(2k−1,k), weights in {v,v+1}, a count equal to 1). | Holds on the sweep. Note: the hypothesis 2k≤m is implied for n=2 (complement symmetry sends a solution with k>m/2 to one with m−k<m/2, forcing m=2(m−k)); harmless. |
| §5.7 `threefold_exterior_classification` | same sweep; P₁ histogram 1[−1]+23[0]+1[1], k=5 | sweep: only (4,2,1) with weights (0,0,1,1); P₁: 5-subset counts {−1:8855, 0:35420, 1:8855}=8855·(1,4,1), m=25=5+20, k=5, d=D₁; both endpoint counts 1. | Both branches realized; 2k≤m needed (k=20, m=25 is the complement solution and violates k=P_j.1). |
| §5.8 `fourfold_exterior_impossible` | sweep; (0,0,1,2),k=2; m=4,k=2 | no n=4 row in the sweep; (0,0,1,2): 1,2,2,1 ≠ d(1,11,11,1); m=4: total 6<24d. | Consistent; no hypothesis 2k≤m needed. |
| §6.6 `exterior_eulerian_classification` | the nine sweep realizations | all have n∈{2,3}; (4,2,·) hits the first disjunct, the n=2 ones with k₀>2 hit the second with d=C(2k₀−1,k₀); P₁ hits the third with d=D₁. | Holds; disjunction complete on the sweep. |
| §4.3 component decomposition | Λ₁=Λ_x+Λ_y, Λ₂=Λ_z+Λ_t, four distinct sums; x=0,y=a,z=b,t=b−a | degrees 2·2=4; Λ_(x+z) multiplicity 1 from the single pair (Λ_x,Λ_z); second instance: x+z=y+t=b, multiplicity 2, two contributing pairs. Λ_B for positive-dimensional B lies over (Lie B)^⊥, Gauss degree 0, so clean components have finite stabilizer. | Repaired statement holds; the old whole-support claim fails on the first instance. |
| §4.5 component bound | n=3,d=1 | deg Λ_(Z₁)=6 ⇒ deg Λ₁≥6 ⇒ deg Λ₂=6/deg Λ₁≤1<2. g₁=0 instance: Z₁ a point of degree 1, route sentence false (R02); alternative closes it. | R02. |
| §4.6 divisibility | n=3: N=6d | 27≡3, 56≡2 (mod 6); 2^r≡1,2 (mod 3); zero weight: dimension 1<6. | Exclusions hold; "nonzero" needed and present. |
| §8.1 collision loci | E³ with a↦(2a,3a,5a), σ=3 on Z/4, M=1, (e₂,e₃)=(1,0); E×E with a↦(2a,3a), M=2, c=2 | 16≡20≡0 (mod 4) while χ−σχ ≡ 2 ≠ 0; η=2∈E₁=Π(E)[2]; box 3²=9, bad ≤2·3=6, good ≥3. General count M(M+1)^(c−1)<(M+1)^c. | Repaired loci exclude η≠0; determinant of 1−σ^k is a nonzero integer, so the prime-to-p kernel is finite. |
| §9.1 trace/pullback | n=3, m=1, m′=2 | r=(m′/m)^(2n)=64; t∘u=64; e=u∘t/64, e²=e, image u(V_m)⊗Q. d=2: deg φ_L=4 translates keep L; NS-class only: positive-dimensional orbit. | Conventions pinned. |
| §9.3(a) | constant variation; path reversal/concatenation | R_V=S×S; reflexive, symmetric, transitive. Determinations of the identity's continuation at (s₁,s₂) are T_γ₂∘T_γ₁⁻¹, the transports along γ₁⁻¹γ₂: every path s₁→s₂ occurs. An integral Hodge morphism between fibres of equal Hodge numbers is an isomorphism. | Holds; closedness is CDK Cor 1.3 through the declared gap, on the nonsingular base S×S. |
| §9.3(b) | u=(1,0)ᵀ, t=(64,0), r=64; swap P; r=1 | T=r⁻¹·t∘T′∘u from u,t flat; T′ Hodge ⇒ T rational Hodge and integral ⇒ Hodge. PeP⁻¹=diag(0,1)≠e=diag(1,0): the swap is not a transport, negative control. r=1 with inverse maps: R_V′=R_V. | Inclusion R_V′⊆R_V correct in direction (Z_m′⊆Z_m, LS line 1714). |
| §9.3(c) | universal elliptic curve over Y(3); Γ=Γ(3) | [τ],[τ+1] same image in SL₂(ℤ)\ℍ; δτ=τ+1 forces δ=±T∉±Γ(3); so not in R_V and distinct in Y(3). Full-isometry fibre: integral (0,0) isometries V_x→V_s have one norm, form open-closed components of S(K), image closed. | Converse needs the monodromy image; fibres closed algebraic for the full group. |
| §9.3(d) | ℂ/ℤ[i]; W={[τ],[τ+1]} | integral polarized automorphisms {±1,±i}, order 4; (3+4i)/5 has norm 1, trace 6/5, infinite order: lattice needed. Disconnected W: Φ constant but W×W⊄R_V: connectedness needed. Orbit discreteness: γ_kF₀→F_∞ bounds γ_k⁻¹ in the Hodge metric, finitely many. | Holds. |
| §9.4 route | Noetherian minimum; n=2 | Z_m minimal among all Z_k ⇒ Z_m′=Z_m for m|m′; infinite closed fibre contains positive-dimensional W; X smooth locus connected; {x}×X⊆Z_m′ ⇒ Φ_m′ constant on X ⇒ finite monodromy of every torsion summand; L fixed ⇒ not constant up to translation (ker φ_L finite); n=2 by §9.2. | Consistent with §9.3 and §7.6 hypotheses. |
| §7.4 `jordan_finite_linear_groups` | n=1; Q₈; D_2q; SL₂(F_q) in char p | J(1)=1; C₄ normal of index 2; rotations index 2 for every q; char p family has no bounded-index abelian subgroup. Lean: J before F, Γ; index inside Γ; `[Finite Γ]` excludes the junk index 0. | Matches README; universe-polymorphic F. |
| §3.1 / §3.3 rows | n=2,3,4, d=1 | (−1,1), N=2; (1,−4,1), N=6, native HT weights 0,−1,−2 mult. 1,4,1; (−1,11,−11,1), N=24. | Signs and factorial normalization agree. |
| §0.1–0.5 conventions | dim A=0; B=A; E², diagonal/antidiagonal; δ_x∗δ_y; δ₀⊕δ₀[1] | one character, no proper T_B; T_A={1}; χ₁χ₂ versus χ₁χ₂⁻¹; support x+y, dual −x−y; total χ=0 but perverse cohomologies δ₀, so outside D_N. | Conventions pinned by Checks. |
| §8.2 count | elliptic curve, ℓ=2, r=3 | 2⁶=64 characters; three point cosets cover ≤3. | Holds. |

### Lean

`lake env lean` on `packages/SheafConvolutionOnAbelianVarieties/Suggested.lean` from the content checkout: exit 0 in 8 s, exactly six warnings, all "declaration uses `sorry`" (lines 66, 74, 86, 99, 110, 127); no `TauCeti.*` import, nothing to build. A scratch copy with `#check @name` for all ten declarations elaborated (exit 0); every elaborated type matches its README statement: `wedgeMultiplicity : {m} → (Fin m → ℤ) → ℕ → ℤ → ℕ`, `exceptionalPair : ℕ → ℕ × ℕ`, `exceptionalDegree : ℕ → ℕ`, `hasEulerianExteriorWeights : {m} → (Fin m → ℤ) → ℕ → ℕ → ℕ → ℤ → Prop`, the five classification theorems with hypotheses 1<k, k+1<m, (2k≤m where the README says so), 1≤d, 2≤n, and Jordan with `∀ (F : Type u) [Field F] [CharZero F] (Γ : Subgroup (GL (Fin n) F)) [Finite ↥Γ], ∃ B, B.Normal ∧ (∀ a b : ↥B, a*b=b*a) ∧ B.index ≤ J`. No section binder is lost (no `variable` block exists; every binder is explicit). One-tactic probe (`first | rfl | simp | infer_instance | decide | omega | (intro; simp_all) | sorry` on a scratch copy): none of the six theorems closes (four fall through to `sorry`; `simp` leaves unsolved goals on the other two). No padding: the four definitions are exactly the carriers of the stated headlines; no API lemma, Check mirror or small-value example is declared. The module docstring lists the seven headline groups not statable at the pins with the missing carriers, including the §9.3 transport relations.

### Headline coverage

README headlines: generic vanishing and the rigid quotient with fibre functor (§§0.4–1.2); arithmetic–geometric exactness and normalization (§§2.2–2.3); hypersurface Euler and Hodge–Tate data (§§3.1–3.3); factorization, minuscule simplicity, classical form (§§4.3–4.7); Pell and exterior-row classification (§§5.2–5.8, 6.6); classical convolution monodromy (§6.7); rigidity, finite detection, simultaneous twists (§§7.1–7.6); Jordan (§7.4); Frobenius and orbit-uniform monodromy (§§8.1–8.3); surface and general period finiteness with the transport relation (§§9.2–9.4). Statable at the pins and stated: §§5.2, 5.6, 5.7, 5.8, 6.6, 7.4. Not statable and named in the docstring: the rest (constructible adic perverse categories, character sheaves, conormal cycle ring, sheaf-generated groups, polarized integral variations and their period maps are absent from Mathlib and Tau Ceti at the pins; `TauCeti.AlgebraicGeometry.AbelianVariety` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` bundles only the group object, properness and geometric integrality).

### Pinned declarations opened

`Mathlib/Data/Finset/Powerset.lean:197` `powersetCard`, `:211` `card_powersetCard`; `Mathlib/Data/Nat/Choose/Basic.lean:50` `choose`; `Mathlib/GroupTheory/Index.lean:55` `index` (natural cardinality, 0 for infinite quotient); `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42` `GeneralLinearGroup`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,87`; `Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean:415,427,433` (`abelian`, `preservesFiniteLimits`, `preservesFiniteColimits`); `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean:55`, `…/Reductive/Basic.lean:89`, `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:63`, `…/Tannaka/Equivalence.lean:188`, `TauCeti/Algebra/Lie/HighestWeight/Minuscule.lean:197,238,259`. Mathlib at the pin has no Eulerian numbers or descent count (grep: only Eulerian trails) and no Jordan–Schur theorem (grep "Jordan": Jordan–Chevalley and unrelated files); Tau Ceti has neither (grep "eulerian", "abelian normal subgroup": no hit). Nothing in Suggested.lean duplicates a pinned declaration.

### Suppliers, citations and the merge order

Mechanical check, verbatim:

```text
depcheck: 56 roadmaps, 648 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. SheafConvolutionOnAbelianVarieties is at line 297 of the merge order; every named supplier is earlier: SchemeAndStackFoundations 2, EtaleCohomologyFoundations 18, AlgebraicModuliForArithmeticGeometry 35, ComplexComparisonPartII 42, AbelianSchemesAndArithmeticModuli 46, JacobianChallengePartII 56, SpringerResolutionAndCharacteristicCycles 70, MotivesAndAlgebraicCycles 82, DeligneWeightsAndPurity 91, ClassicalArithmeticCompletion 104, ShimuraVarieties 114, EtaleDualityAndPerverseSheaves 117, ShimuraData 130, PadicHodgeTheory 136, MordellLawrenceVenkatesh 173, StableReductionPartII 176, LieHighestWeightPartII 293; HodgeStructures, ReductiveGroups, LieHighestWeight, SpinRepresentations and JacobianChallenge are on main.

Every cross-roadmap citation was resolved this round on main or at the open head the roadmap service serves (noted per roadmap):

| Supplier (copy) | Sections resolved (heading line in the served README) |
|---|---|
| AbelianSchemesAndArithmeticModuli (open head) | A1.3 (767), A1.8 (926: Weil extension over a connected Dedekind base, as the README says), A2 layer A2.1–A2.8 with A2.4 (1090: χ(L)=c₁(L)^g/g!, deg φ_L=χ(L)²), A3.1–A3.6 (1332–1476), A4.1 (1764), A5.1–A5.4 (2438–2569), A6.1–A6.4 (2743–2800) |
| EtaleCohomologyFoundations (main) | F.0.2 (201), F.0.A2 (369), F.2.1–F.2.7, F.3 (677), F.4.0–F.4.6 (851–1090), F.5 (1180), F.6 (1201) |
| EtaleDualityAndPerverseSheaves (open head) | 0.5 (666), 2.1 (1344), 2.2 (1464), 2.6–2.10 (2112–2540), 3.3–3.5 (3212–3313), 5.10 (6141: geometric origin only, so the semisimple contract is a genuine gap) |
| MotivesAndAlgebraicCycles (open head) | 6.1–6.3 (1101–1134), 6.8 (1214: torsor with pre/postcomposition actions, finite presentation for finite type) |
| SchemeAndStackFoundations (main) | Layer 5 (6536), 5.1–5.5, 5.8 (6568–7108) |
| SpringerResolutionAndCharacteristicCycles (board package design) | Layer Y module-cycle (815), Layer D characteristic-cycle (1028: pure n-dimensional support, generic length), Layer H regular-holonomic (1212) |
| ComplexComparisonPartII (open head) | C5.1–C5.6 (2338–3744; C5.6 is regular singular connections only, so the holonomic Riemann–Hilbert contract is a genuine gap) |
| PadicHodgeTheory (open head) | 3.3 (677), 8.1 (1383), 8.2 (1412); HT(χ_p)=+1 at its line 666 |
| ReductiveGroups / LieHighestWeight / SpinRepresentations (main) | Layers 6–10 (467–1732); Layers 4, 6, 8 (538, 774, 1198) with the minuscule Pieri rule at 859; Layers 4–5 (666, 778) |
| LieHighestWeightPartII (board package design) | N2 (342: classical recognition and half-spin tests; no per-type minuscule table, so the contract is a gap) |
| MordellLawrenceVenkatesh (open head) | 0.22–0.24 (708–731) |
| ClassicalArithmeticCompletion (main) | 2.18 (3209: descent-indexed, A(0,0)=1), 2.39 (3851: (c) recurrence, (e) A(n,1)=2ⁿ−n−1), 2.56 (4351), 2.57 (4378: (q+1)ⁿ−(n+1)qⁿ≤A≤(q+1)ⁿ, A≤n!), 2.71 (4761: (1−1/e)(q+1)ⁿ≤A in its range), 2.77 (4911: A(n,r−1)(A(n,r−1)−1)>2A(n,3r−2), 3≤r≤n−2), 2.78 (4937: 27A(n,2)<A(n,1)² for n≥11, sharp at n=10) |
| DeligneWeightsAndPurity (open head) | 0.1–0.3 (753–807), 0.11 (953), 1.4 (1196) |
| ShimuraData (open head) / HodgeStructures (main) | 3.1–3.4 (376–470; no Hodge-locus or CDK content, so the bounded-norm contract is a gap); L0–L3 (274, 302: positive-definite Hodge metric; 379: period-domain points and `IsLatticeIsometry`) |
| ShimuraVarieties (open head) | 3.5b.1 (819), 3.5c (843: definability of polarized period maps) |
| AlgebraicModuliForArithmeticGeometry (open head) | 1.1 (313), 1.2 (499), 2.1 (994) |
| StableReductionPartII (board package design) | MC.4 (19476) with `fine-level-scheme` (19941), MC.6 (21480) with `torelli-finite-fibres` (21758: fibres of size at most 2, signs identified for hyperelliptic curves, as the README states at line 143) |
| JacobianChallenge (main) / JacobianChallengePartII (open head) | Layer F (449); 2.1–2.4 (295–344; 2.3 is a local pointed factorization identity, so the relative pointed Albanese contract is a gap) |

The three leads of the automatic citation scan (SpringerResolutionAndCharacteristicCycles §D, LieHighestWeightPartII §N2, StableReductionPartII §MC.4) resolve to the board packages above; they are not missing owners.

Declared gaps: the 16 slugs in `design/plan.json` `gaps` and the 16 `must provide (gap:…)` contracts in the README coincide (slug, supplier, `needs`). Every supplier is named (none is `none`); each `needs` is one statement with its hypotheses; none asks for something the pins or an earlier roadmap already provide (checked per gap at the supplier sections listed above and at the pins for `minuscule-weight-table`). The gap suppliers (EtaleCohomologyFoundations, EtaleDualityAndPerverseSheaves, MotivesAndAlgebraicCycles, AbelianSchemesAndArithmeticModuli, SchemeAndStackFoundations, ComplexComparisonPartII, PadicHodgeTheory, LieHighestWeightPartII, ShimuraData, StableReductionPartII, JacobianChallengePartII) are all earlier in the merge order.

### Ownership by object

Searched the roadmap service (main and all open roadmap pull requests) by object: Jordan's theorem on finite linear groups (hits: PolynomialGaloisGroups' Jordan theorem on p-cycles, a different theorem; EllipticCurveModularityImaginaryQuadratic uses the index-two statement; ThousandTheoremsEuclideanGeometry's catalogue row lists the name "Jordan–Schur theorem" without a statement, hypotheses or source, so it is not an owner of §7.4's uniform-bound statement); Eulerian numbers (ClassicalArithmeticCompletion only, imported); the Pell pairs and 8855 (no roadmap); quasi-finite period maps, transport Hodge relations (no roadmap: ArithmeticDynamics and PerfectoidShimuraVarieties hits are unrelated); clean cycles and the Gauss map (ProbabilisticAndMetricNumberTheory and LefschetzPencils hits are other Gauss maps); convolution monodromy groups (AdelicAlgebraicGroups, BunGAndNewtonStrata hits are Hecke convolution); Lawrence–Sawin (ClassicalArithmeticCompletion only). The board package `LawrenceVenkateshMethod` (design at its listed head) names `SheafConvolutionOnAbelianVarieties:SC.6–SC.8` as the owner of classical, generic-big and uniform-orbit monodromy and states that convolution definitions, quotient categories, fibre functors, representation classification and exceptional-degree combinatorics remain here: a consumer, not a competitor. No open roadmap declares a `Suggested.lean` name of this roadmap's namespace.

### Shape and style

Opening summary, Scope and ownership, Conventions, Exact supplier contracts (per supplier), How to read the build, Layers 0–9 in build order with prose targets, `*Needs:*` lines, `### Examples` and `### Dependencies` per layer, Downstream consumers, References. Every definition carries an API list and at least three Checks (counts: 0.1–0.6, 1.1–1.3, 4.1, 4.2, 5.2, 5.3: 5 each; 5.1: 6+3; 7.5: 6; 9.1: 6; 9.3: 4). Every target has a locator with source line. All ten Lean names appear in the README and every backticked name of this roadmap's own is declared in Suggested.lean. The `**Checks.**` bullets name no Lean counterpart.

## Not verifiable

- Ownership against open pull requests other than those the roadmap service indexes was not checked beyond the `LawrenceVenkateshMethod` board head read above; the other 18 board package heads in the index (AnalyticNumberTheory, …, VectorBundlesAndIsocrystalsPartII) were not fetched this round; by title none concerns abelian convolution, Eulerian rows or hypersurface period maps.
- The §6.2 entries are proved here only as exact integer inequalities for 5 ≤ n ≤ 120 plus exponent-margin reasoning; the target's unbounded ranges remain a proof obligation of the roadmap, as its text says.
- LS's published Annals pagination was not collated (manifest `version_note`); all locators use arXiv v5 pages.

## Source issues

- **Misprint** in LS at Lemma 3.8 proof, printed p. 21 (LS line 969): the source says the characteristic cycle of i_*Q[n] is the conormal of H; it should be i_*Q[n−1], the perverse shift of the (n−1)-dimensional H; affects nothing.
- **Misprint** in LS at Lemma 3.8 proof, printed p. 21 (LS line 971): the source says the minuscule input is [42, Corollary 1.0]; it should be Corollary 1.10 of that reference (K1 line 444); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f1720ea", "job": "REV-PKG-SheafConvolutionOnAbelianVarieties~2", "model": "fable", "worker": "fable-rev129"} -->
