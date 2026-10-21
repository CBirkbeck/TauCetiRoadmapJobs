# Red-team review of #1336 ErdosProgressionPowers at 42053a5 (pass b (claude))
**Verdict:** changes needed

Package reviewed in full: `TauCetiRoadmap/ErdosProgressionPowers/README.md` (1583 lines) and
`TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean` (849 lines). The pull request changes nothing
outside the folder. Sources: the published Annals text of Bennett–Siksek (source id `BS20pub`, page
marker N = printed page N+354), the author-hosted Darmon–Granville scan (`DG95`), and the cached
`Faltings1983`, `ErdosSelfridge1975`, `Kraus1997`, `Lemos2017v2`, `Martin2003v1`, `BMOR2018v3`,
`Platt2013v1`, `RamareRumely1996`. Pins read at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`.

Dependency gate output at this head (no UPWARD or CYCLE line):

```
depcheck: 2 roadmaps, 14 edges, 0 problem(s)
```

## Round-1 findings at this head

| Id | Status | Witness at 42053a5 |
|---|---|---|
| a-R01 | repaired in package (plan.json registration settled as not actionable) | README:263 `gap:rational-isogenies`, supplier EisensteinIdealAndRationalTorsion; README:554–558 consume it |
| a-R02 / b-R04 | repaired | Suggested.lean:592–610 `pageZero`, `boundedPage` ("real character values, real simple zeros, unique pair"); README:1200; both consumers carry `hp : boundedPage c` (Lean 690, 705) |
| a-R03 | repaired | README:957–964; Lean 350–352 `quadraticConductor_maxPrime_lower`, "0.94 log N<Nat.maxPrimeFac N" for N>1; small-conductor list and P≥23 branch verified below |
| a-R04 | repaired | README:922 "Nⱼ≥N₁^(2^(j−1)) for 1≤j≤s, strictly for 2≤j≤s"; README:984, 1501 agree |
| a-R05 | repaired | Lean 71–80 `SignedFactorization`, `signed_factorization_exists_unique`; examples 118–153; README:341–356 |
| a-R06 | repaired | Lean 774–782 (k≥3, ell≥2, 2ell+k<k·ell; k≥5 specialisation); README:1368, Checks 1414–1416 |
| a-R07 | repaired | Lean 355–364 `smoothModulusCharacterSum` matches BS20pub lines 939–946 (R₀ = max(q₂,…,qᵣ,q^{1/4})q^{5/4}, bound 4R(τ(q)^{r²}/q)^{2^{−r}}) |
| a-R08 | repaired | Lean 367–377 `smoothCharacterCorrelation`, distinctness as inequality of pulled-back functions |
| a-R09 | repaired | README:244–251, 494–498 consume EtaleCohomologyFoundations §F.4.0 (names verified on main, README.md:850–874 there) |
| a-R10 | repaired | README:448–455 `explicitTotientRatio` (x≥10⁸, ∏(1+1/p)≤2 log x) and `factorialLargePrimeContribution` ((9/16)k log k−5k) |
| a-R11 | repaired, but the finding's premise is false: see S03 | README:125–128, 335 now unfold `padicValInt`; the pin has `padicValInt.mul` at `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:722` |
| a-R12 | repaired | README:176–188 (`MulChar.ringHomComp`, `conductor_ringHomComp`, `isPrimitive_ringHomComp_iff`; all exist at the pins) |
| a-R13 | repaired | README:397 unequal-sum quadruple, 812–813 twice-square branch, 1113–1117 thinSet; Lean 166–168, 321–331, 513–515, 645–676 |
| a-R14 | repaired | README:1044–1047; Lean 464–510 (`Tpr 1=∅`, `Tpr 2={2}`, `Tpr 16={5,7,11,13}`, `Upr` Checks) |
| a-R15 | repaired | Lean 393–406 `weightedHalf 4`, 297–313 `twistedLegendre` examples, 411–413 `roth_cutoff_substitution`, 762–763 `granville_scale` |
| a-R16 | repaired | `certifiedThreshold` absent from both files; README:1105 carries k≥exp(exp(10⁷)) directly |
| a-R17 | repaired | README:559, 790, 1350, 1434 and References 1568–1571; primary locators re-verified below |
| a-R18 / b-R07 (manifest) | settled as not actionable (manifest outside the package); not re-raised | board `sources.toml` still records only Faltings1983, ErdosSelfridge1975 and four waived entries |
| b-R01 | repaired in package | README:258 `gap:faltings`; §6.1 consumes it; Faltings1983 line 682 (printed p. 365) verified |
| b-R02 | repaired in package | README:259–260 `gap:elliptic-modularity`, `gap:weight-two-lowering`; §1.1 consumes them |
| b-R03 | repaired in package | README:261–267 gaps for newform representations, coefficient bound, isogenies, uniformity, PNT, zero exclusion, density; Platt consumed as input, no computation target |
| b-R05 | partly repaired: see S06 | tail, prime count, totient and real-zero bounds are now explicit (README:443–452, 1177–1179); "∑(log p)/p bounds with explicit endpoints" (README:442) still names no inequality |
| b-R06 | repaired | README:45–46, 195–196, 512–514 consume EllipticCurves Layer 8 (main README.md:1463–1465) |
| b-R08 | repaired | README:45, 195, 798 "Layer 6's `x − θ` Kummer map and kernel 2E(K)" |
| b-R09 | repaired | README:147–148; Lean 393–396 `Chebyshev.theta 2`, `Chebyshev.psi 4` |
| b-R10 | repaired except `hasZeroWithin`: see S09 | Checks and examples now exist for term/H/Hplus, kappa, Upr, removedIndex, thinSet, zeroHeight, pageException, boundedPage |
| b-R11 | repaired | Lean 183–199 `gammaZeroIndex`; 301–307 Case-II witness; 411–413; 762–763 |
| b-R12 | repaired | Lean 785–795 three separate targets; README:1380–1390 separate locators and Needs |

No repair introduced a false statement: every new Lean signature and every new README inequality was
re-derived (table under "Verified sound").

## S01 (P2) — The simultaneous character family, the roadmap's central milestone, has no Lean statement although it is statable on existing carriers

Location: `README.md:872–876` (`character_family`, `character_family_primitive`, `character_family_mass`, `character_family_support`, `character_family_nonprincipal`); `Suggested.lean:282–341` (Layer 2 states only `case_partition_union`).

Claim: Layer 2's milestone is represented in `Suggested.lean`.

Witness: every carrier of the README statement except the deletion level `M_a` is in the file or at the pin: `Hplus`, `ap_triples`, `SignedFactorization`, `DirichletCharacter ℝ N` with `IsPrimitive`, `IsQuadratic`, `ordCompl[2] N`, `Squarefree`, `weightedHalf`. BS20pub lines 499–507 (Proposition 6.1) is the statement both endgames consume.

Repair: add to Layer 2, and name it in §2.7:

```lean
/-- Proposition 6.1 of Bennett–Siksek, without the deletion-level clause. -/
theorem character_family {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : Hplus n d k y ell)
    (A : Fin k → ℕ) (z : Fin k → ℤ) (hf : SignedFactorization n d k ell A z)
    (a : Triple) (ha : a ∈ ap_triples k) :
    ∃ N : ℕ, ∃ _ : NeZero N, ∃ χ : DirichletCharacter ℝ N, χ.IsPrimitive ∧ χ.IsQuadratic ∧
      1 < N ∧ ordCompl[2] N ≠ 1 ∧ Squarefree (ordCompl[2] N) ∧ N ≤ 8 * ordCompl[2] N ∧
      ordCompl[2] N ∣ ∏ i : Fin k with ((i : ℕ) = a.1 ∨ (i : ℕ) = a.2.1 ∨ (i : ℕ) = a.2.2), A i ∧
      (1239 / 10000 : ℝ) * k < |weightedHalf k (fun m => χ (m : ZMod N))| := by sorry
```

Keep "N_a^odd divides M_a" as the README-only clause of `character_family_support`.

## S02 (P2) — `gap:character-pnt` is a compound gap covering three supplier theorems

Location: `README.md:265` ("the primitive nonprincipal real-character PNT with exceptional term and effective error specified in §3.1, together with pairwise repulsion and the full bounded-height real/simple unique character-and-zero contract of §5.2").

Claim: one `needs` sentence specifies one missing input.

Witness: BS20 cites them as three separate results: Theorem 5 (IK 5.27, BS20pub lines 820–836), Proposition 7.1 (IK 5.26 and 5.28, lines 799–812) and the bounded-height Landau–Page statement of §12 (lines 1401–1406). §3.2 needs only the first two; §5.1 and §5.3 only the third.

Repair: split into three gaps with the same supplier: `gap:character-pnt` — "for a primitive Dirichlet character of conductor N and X≥2, ∑_(m≤X)χ(m)Λ(m)=δ_χX−X^β/β+O(X exp(−c log X/(√log X+log N))(log N)⁴) with effective absolute c and implied constant, the exceptional term present only when the exceptional zero exists"; `gap:exceptional-zero-repulsion` — "an effective c*>0 such that distinct real primitive quadratic χ₁,χ₂ with real zeros β₁,β₂ satisfy min(β₁,β₂)<1−3c*/log(N₁N₂), and each primitive quadratic character has at most one real zero in (1−c*/log N,1), which is simple"; `gap:bounded-height-landau-page` — "some c>0 satisfies the `boundedPage c` contract of §5.2 (IwaniecKowalski2004, Theorem 5.28)". Repoint the Needs of §3.1, §3.2, §5.1, §5.3 and §5.6 to the gap each actually uses.

## S03 (P3) — `padicValInt.mul` exists at the pin; the roundabout citation and the repair-round rejection are wrong

Location: `README.md:125–128` ("unfold `padicValInt p z = padicValNat p z.natAbs` and use `Int.natAbs_mul` with `padicValNat.mul`"), `README.md:335`.

Claim: the integer valuation is multiplicative only through the natural-number lemma.

Witness: Mathlib 6b7abb3c, `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:722`: `theorem padicValInt.mul [hp : Fact p.Prime] {a b : ℤ} (ha : a ≠ 0) (hb : b ≠ 0) : padicValInt p (a * b) = padicValInt p a + padicValInt p b`.

Repair: in both places write "Use `padicValInt.mul` in `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`, with `[Fact p.Prime]` and both factors nonzero"; delete the unfolding sentence. Record round-1 a-R11 as a false finding.

## S04 (P3) — §2.4's two-primary contradiction asserts an "exact 2-part 8" that the twisted comparison count need not have

Location: `README.md:840` ("Its order 16 contradicts the exact 2-part 8 of the comparison point count."); `README.md:763–764` (`minusOne_twoPrimary`).

Claim: the point count compared with the ℤ/2×ℤ/8 subgroup has 2-adic valuation exactly 3.

Witness: the twist by 2 of F_λ has #F'_λ(𝔽_p)=p+1±a_p(F_{−1}). `minusOne_twoPrimary` gives 8∥p+1−a_p(F_{−1}), hence a_p(F_{−1})≡6 (mod 8) and 4∥p+1+a_p(F_{−1}). Over 𝔽₅: y²=x³−x has 8 points, its twist by 2 has 4. BS20pub lines 700–712 fix the sign by a descent step on F_λ that the README omits.

Repair: replace the sentence by "Its order 16 would divide #F'_λ(𝔽_p)=p+1±a_p(F_{−1}); by `minusOne_twoPrimary`, 8 exactly divides p+1−a_p(F_{−1}), so a_p(F_{−1})≡6 (mod 8) and 4 exactly divides p+1+a_p(F_{−1}); 16 divides neither." Add the Check "Over 𝔽₅ the symmetric curve has 8 points and its twist by the nonsquare 2 has 4; neither count is divisible by 16."

## S05 (P3) — The T_pr loss bound of §4.5 uses §1.9, which its Needs line omits

Location: `README.md:1095` ("the losses from T_pr … are at most k*log(16/7)"), Needs at `README.md:1099`.

Claim: the bound follows from the one-residue-class count and the explicit prime estimates alone.

Witness: ∑_(k^{7/16}<p≤k)(k/p+1) exceeds k log(16/7) by about π(k)/2 from the roundings. BS20pub lines 1214–1246 reach ≤k log(16/7) only because δ_p=0 for k/2<p≤k (Lemma 4.1) shortens the sum to p≤k/2, whose saving log(1−log 2/log k) absorbs π(k/2)<0.6k/log k.

Repair: add "Layer 1 — half-interval primes divide the difference" to the Needs of §4.5, and in the proof text: "Under Hplus every prime in (k/2,k] divides d, so I_p=∅ there; sum the residue-class bound over k^{7/16}<p≤k/2 only, where log log(k/2)−log log k^{7/16}=log(16/7)+log(1−log 2/log k) and π(k/2)<0.6k/log k give the displayed bound."

## S06 (P3) — The ∑(log p)/p input of §0.9 still has no statement

Location: `README.md:442` ("reciprocal-prime and ∑(log p)/p bounds with explicit endpoints"), `README.md:453–460` (`factorialLargePrimeContribution` and its Needs).

Claim: the inputs of `factorialLargePrimeContribution` are specified.

Witness: (9/16)k log k−5k requires ∑_(k^{7/16}<p≤k)(log p)/p≥(9/16)log k−O(1/log k) (BS20pub lines 1316–1323 cite Tenenbaum Theorem 5 and Rosser–Schoenfeld Theorem 6); unlike the four neighbouring bounds, no inequality, constant or endpoint is written. Residual of round-1 b-R05.

Repair: display the input with its range, in the form of Rosser–Schoenfeld Theorem 6: "|∑_(p≤x)(log p)/p−log x+E|<1/(2 log x) in that theorem's stated range (the lower bound for every x>1), with E=−1.33258…" (RosserSchoenfeld1962 is waived: check the endpoint and constant against the published statement), then derive the factorial bound: (k−1)[(9/16)log k−1/(2 log k)−8/(7 log k)]−1.000081k≥(9/16)k log k−5k in the certified range.

## S07 (P3) — §6.3 is stated on a narrower range than DG95 Corollary 2.1 without saying why

Location: `README.md:1368–1370`, `README.md:1416` (Check at (4,2)); `Suggested.lean:774–777`.

Claim: `fixed_exponent_finiteness` covers the corollary it cites.

Witness: `DG95` lines 325–327 state the corollary for m≥2, k≥3, m+k≥6; lines 333–337 settle (k,m)=(4,2) and (3,3) by Euler. The README's 2ell+k<k·ell is m+k≥7. For the README's signed statement the exclusion is necessary: (−3,−1,1,3) is a primitive signed four-term progression with square product, so the (4,2) case is genus one and not covered by Faltings.

Repair: add to §6.3 after the hypothesis sentence: "Darmon–Granville's corollary also covers the positive progressions with (k,ell)∈{(4,2),(3,3)} by Euler's theorems; those two cases are outside the signed statement here, whose (4,2) case has the nontrivial signed solution (−3,−1,1,3) and genus one." Reword the (4,2) Check to cite that solution.

## S08 (P3) — The Rahman locator is BS20's display number

Location: `README.md:1020` ("RahmanRoth, bound (36)"), `README.md:1580` (References).

Claim: "bound (36)" locates the quantitative Roth bound in Rahman's note.

Witness: "(36)" is BS20's own equation label (BS20pub line 1140, "we may take (36) K₀(δ)=exp(exp(132 log(2)·δ⁻¹))"); the References entry itself says "as cited in BS20". No locator into Rahman's text is given.

Repair: cite the note by its own locator (its theorem or section and page, as recorded in the manifest's waived entry), or write "RahmanRoth, as quoted in BS20, §9, equation (36), p. 381" and drop "bound (36)" as a Rahman locator.

## S09 (P3) — `hasZeroWithin` has no Checks

Location: `Suggested.lean:582–584`; `README.md:1206–1225` (the §5.2 Checks test `zeroHeight`, `zeroWithin`, `pageZero`, `pageException`, `boundedPage` and `exceptional_moduli`, none `hasZeroWithin`).

Claim: each definition has at least three discriminating Checks.

Witness: no Check mentions `hasZeroWithin`; the `exceptional_moduli_zero` Check tests the `0 < q` guard, not the existential.

Repair: add three Checks with proved examples: `¬ hasZeroWithin k c 0` (no `NeZero 0` instance); `¬ hasZeroWithin 0 c q` for every q (at k=0 the strip is Re ρ>1 and `DirichletCharacter.LFunction_ne_zero_of_one_le_re` applies, the principal pole being excluded by the regularity clause); for k≥3 and c≤c′, `hasZeroWithin k c q → hasZeroWithin k c′ q` (the height is monotone in c once log log k>0).

## Verified sound

Coverage: all 38 definitions and abbreviations, 32 theorems (31 admitted, `roth_cutoff_substitution` proved) and 45 examples of `Suggested.lean` read; all 57 numbered target subsections, every `*Needs:*` line, the supplier contracts and the ten gaps read; 63 locators verified against the texts (50 in BS20pub: Theorem 2, (3), Theorem 3, Lemma 2.1–2.2, (4)–(5), Theorem 4, Lemma 3.1–3.5, (6)–(13), Lemma 4.1, 5.1–5.2, Proposition 6.1, Lemma 6.2–6.6, (19)–(22), Proposition 7.1, (23)–(26), Proposition 7.2, Lemma 7.3, Proposition 8.1–8.2, Theorems 6–8, (32)–(38), Proposition 9.1 and its proof, §10, §11, (40)–(41), Proposition 12.1–12.3, the final paragraph; 5 in DG95; 8 primary: Faltings Satz 7 p. 365, Erdős–Selfridge Theorem 1, Kraus Théorème 4 p. 1144 with its hypotheses, Lemos Theorem 1.1, Martin Theorem 2, BMOR Proposition 1.11, Platt q≤400000, Ramaré–Rumely Theorem 1 with Table 1 entry 0.002811 for k=8, x₀=10¹⁰); 52 README Checks computed by hand, including every example's numerical content; 8 supplier contracts checked on main (EllipticCurves Layers 2–4, 6, 8 and `freyCurve A B` = (0,B−A,0,−AB,0); ModularForms Layers 2–4, 8, 10; LocalFieldsRamification Layers 3–4; ClassicalArithmeticCompletion §1.51 with all eleven consumed items and §4.41; ImaginaryQuadraticClassNumber H3.1; AlgebraicCurves Layer 7 and 12E; EtaleCohomologyFoundations §F.4.0) and the ArithmeticDynamics head (no shared object, no citation in either direction); 50 pinned declaration names grepped at the pins, all present in the stated files (including `Chebyshev.theta`/`psi` definitions, `Nat.maxPrimeFac` values 0 and 1, `DirichletCharacter.LFunction`, `MulChar.IsQuadratic`, `WeierstrassCurve.frobeniusTrace`, `Affine.μ`, `exists_eq_two_smul_iff`, `ker_μ_eq`, `Gamma0_prime_index`, the `fundamentalDiscriminantChar` family, `conductor_ringHomComp`, the lower ramification filtration lemmas, and every lemma name used inside the examples).

Policy: single `import Mathlib`; no `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder or sorry'd data; every Lean name appears in the README; no pull-request numbers or process words; `metadata.toml` topic `math.NT`; all gap suppliers are earlier in the merge order; no gap asks for what a roadmap on main provides (EllipticCurves mentions Faltings only for the height; ModularForms declares Ramanujan–Deligne a non-target).

Adversarial pass (instances tried per statement; "none" means no change requested):

| Statement / section | Instances tried | Result | Change |
|---|---|---|---|
| 0.1 `term`, `primitive_solution`, `H`, `Hplus` | k=0,1,2; (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2); real cast of 10^k | conjunctions exclude zero length and gcd 2; nested bounds retained | none |
| 0.2 `term_gcd` | i=j (divides 0); d=0 with n=±1; negative terms; ℕ subtraction with i<j | common divisor is prime to d, divides (j−i)d | none |
| 0.3 `large_prime_valuations` | k=1; q=k prime; q dividing no term (valuation 0); zero term impossible since y≠0 | one divisible term; valuation additivity on nonzero product | none |
| 0.4 `SignedFactorization`, uniqueness | k=0 (empty families); ell=1; (−8,1,1,3); (8,19,2,3); (64,0,3,3) and the rejected (1,4) | unique for odd ell; even ell excluded by hypothesis | none |
| 0.5–0.6 triples, quadruples, `kappa` | A(0..3), A(5)=4; I(2)=∅, I(3)={(0,1,1,2)}; (0,1,1,3); κ(0,1,2,3)=−2 | κ<0 and |κ|<k² from j₁<i₁≤i₂<j₂ and equal sums | none |
| 0.7–0.8 indices, `residue_class_count` | r=0,1; r>k; p∣d; k=0; (1,2,6,3)={1,4} | one class, +1 retained, prime discrepancy <1; fourth conjunct independent of r | none |
| 0.9 explicit estimates | x=1,2,4; k=2·10¹⁰ tail 1.5·10⁵ vs 9.2·10⁵; π(10⁸)<1.0815·x/log x; P≥23 and the list 2…19 for Lemma 7.3 | all displayed constants consistent with BS20 and Table 1; ∑(log p)/p unspecified | S06 |
| 1.1 representations, conductors, Kraus | c_p=0; p=ell; split/nonsplit; N=1,4,11,44; krausH(1)=4, krausH(11)=169; Kraus's G has a square root so krausH majorises H | Kraus's Théorème 4 hypotheses (p≥5, weight 2, full 2-torsion) match | none |
| 1.2–1.3 `first_curve`, invariants | (1,1),(2,1),(−3,2) at (0,1,2); Δ=16(abc)² and c₄=16(a²−bc) recomputed from b₂,b₄,b₆,b₈; p=2 excluded | source's 64(abc)² is the non-native normalisation, README right | none |
| 1.4–1.6 identities, `second_curve` | consecutive and unequal spacings; (1,1) and (−3,2) at (0,1,1,2); Δ=−64κ³A²B, c₄=16κ(4κd²−3A) recomputed; branch q=(i,i+1,i+p−1,i+p) has κ=1−p | c₄≡64κ²d² or 16κ²d² mod p: multiplicative | none |
| 1.7–1.9 levels, `half_primes_divide_d` | ell=7,11; p=k; log(2⁷e^{1.000081k}·log(√k+1)/6) vs k log 10 at k=10⁸ | contradiction with ell>exp(10^k) holds for both families | none |
| 1.10–1.13 bridge, threshold, F_a, traces | ell dividing a term (finite flat multiplicative); μ(lcm(M,4)) under the same primorial bound; |a_p(E)−a_p(F)|≤4√k<ell; p∣d gives twist of x³−x | all consistent with Lemmas 5.1–5.2 | none |
| 2.1 Legendre interfaces | λ=0,1,1/2,2; (0,0) 2-divisible iff −1 square (q≡1 mod 4); 𝔽₅ (8 points), 𝔽₁₃ (8), 𝔽₃ (4); witness verified on the curve and 2P=(2λ,0) by x(2P)=(x²−4λ)²/(4y²) | all true; witness needs t+iv≠0, which 2t²+2v²=1 gives | none |
| 2.2–2.3 partition, Case I | parameters −1,0,2,3; residues 1,3,5,7 mod 8 give (0,4,0,0); k/2≥10¹⁰ needed for Table 1 | absolute bound (1−3ε)k/8 and margin 0.000045875k correct | none |
| 2.4 Case II square test | twist by 2 at p≡5 mod 8; both signs of a_p(F_{−1}); 𝔽₅ counts 8 and 4 | contradiction valid, stated reason imprecise | S04 |
| 2.5–2.6 non-CM, Case II conductor | a=±b, b=±c, a=±c; T,V odd and U≡2 mod 4; λ=1/2 CM; ell>37 | d=0 or d∣3; parity and quartic descent as in source | none |
| 2.7 `character_family` | modulus 1; χ(0), χ(1); same witness for mass and support | statement sound; no Lean mirror | S01 |
| 3.1 inputs | one character (j=1 equality); N=4,8,24,16,1; r=1 in Theorem 6; equal/orthogonal vectors; N₁=1 in the correlation theorem (product character nonprincipal) | all true as typed; `boundedPage_exists` is IK 5.28 with Q=T | S02 |
| 3.2–3.3 criteria | c₁ below/above 1/2; one exceptional and one nonexceptional member; #B of order k² (the 1/#B normalisation absorbs #B−1 off-diagonal terms) | 2.13/log N₁ and 1/68<0.1239² correct | none |
| 4.1–4.3 Roth, sieves, deletion | δ=10⁻⁵ gives 9.15·10⁶; Tpr 1,2,16; Upr 0,1,2; k=1 survivor {0}; (1,2,3,4,1) and (1,2,1,2) | factorial divisibility via v_p(A_i)≤v_p(|i−j|) | none |
| 4.4–4.5 Stirling, density | m=1; 0.003221−1.2·10⁻⁶>0.0032; 0.00319−0.44/139>10⁻⁵; 5k<0.0025k log k | T_pr bound needs Lemma 4.1 | S05 |
| 4.6–4.8 witness, family, endgame | S=∅; 2∈S; P(N_a)=2 impossible since N^odd≠1; closed endpoint via c₁=1/20000; 0.1683>0.166 | sound | none |
| 5.1–5.2 Page predicates, `zeroHeight` | k=0,1 (height 1); c=0; T=2, c=4 log 2, ρ=−2; q=0; T<0; conjugate zeros at one modulus | `realExceptionalZero_upper` true for imprimitive χ too (Euler factors vanish only on Re s=0; √q log²q increasing) | S09 |
| 5.3–5.4 bounds, nonexceptional sum | σ=1−3 log log k/log k gives (log k)^{60+12ε}e^{(3+ε)c}; q=1,2 excluded; ∑1/|ρ|≪log q log T+log²T gives O(k/log k) | sound | none |
| 5.5–5.9 bad indices, witness, detection | {8} at k=4; {1000} at k=3; q<T versus q≥T; +1 total O(k^{1/3}(log k)^{61}); 2k/7 blocks; 8·64^{7/2}=64⁴; gcd product ≥N/8 | sound | none |
| 6.2–6.5 headlines, reductions | yd=0; ell=2; (3,4),(4,3),(5,2),(4,2) genera 3,10,5,1; p=0 in `pow_eq_pow_div_prime`; |y|=1 with three terms; Y=−8 | all true; source range note missing | S07 |
| 7.1–7.3 | k=1,n=4; k=2; (−3,−1,1,3); thresholds 0,3; b=0,1,2 with τ<1/2 | sound | none |

## Not verifiable

- Lean elaboration was not run (read-only brief); the repair report's successful build is taken as the elaboration witness. Signatures and contexts were checked by reading.
- `Schoenfeld1976` (θ(x)<1.000081x "Note Added in Proof, p. 360"; Theorem 6* (5.3*)–(5.4*)), `RosserSchoenfeld1962`, `Tenenbaum1995`, `IwaniecKowalski2004`, `Bombieri1971`, `Bombieri1987`, `RahmanRoth` and `Mazur1978` are waived or uncertified in the board manifest and not in the cache; their statements were checked only against BS20's quotations. In particular the exact Rosser–Schoenfeld Theorem 6 endpoint requested in S06 must be read off the published text.
- The sections of the seven gap suppliers (`FaltingsFinitenessAndIsogenyTheorems`, `EllipticCurveModularity`, `SerreWeightAndLevelOptimisation`, `AutomorphicGaloisRepresentations`, `DeligneWeightsAndPurity`, `EisensteinIdealAndRationalTorsion`, `AnalyticNumberTheoryPartII`) are not on main and no checkout was supplied; "locator unavailable" could not be resolved. No `design/plan.json` was readable, so the README gaps' registration in the design is unverified (settled as external in the repair report).
- The board's `sources.toml` records six works; the README cites fifteen. Settled as not actionable in this package by the repair report; the manifest still needs BS20, DG95, Kraus1997, Lemos2017v2, Martin2003v1, BMOR2018v3, Platt2013v1, RamareRumely1996 and Schoenfeld1976.
