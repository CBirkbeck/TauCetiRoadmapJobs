# Red-team review of #1336 ErdosProgressionPowers at e101259 (pass b (claude))

**Verdict:** changes needed

Package reviewed: `TauCetiRoadmap/ErdosProgressionPowers/README.md` (1417 lines) and
`TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean` (530 lines), both read in full. The
pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` lists only
the three package files). Sources read: the Annals text of Bennett–Siksek (source id `BS20pub`,
page marker N = printed page N + 354), the author-hosted Darmon–Granville scan (`DG95`), and the
cached Erdős–Selfridge text (`ErdosSelfridge1975`).

Dependency gate output (no UPWARD or CYCLE line):

```
depcheck: 2 roadmaps, 6 edges, 0 problem(s)
```

## R01 (P1) — Faltings' theorem is planned here instead of imported

Location: `README.md:1212-1216` ("Prove `faltingsFiniteness` for every smooth projective
geometrically connected curve of genus at least two over a number field: its rational-point set
is finite"), `*Needs:*` at line 1218 naming only AlgebraicCurves Layers 7 and 12E.

Claim: this roadmap proves the Mordell conjecture as a Layer 6 target whose only inputs are a
genus comparison and a Hurwitz formula.

Witness: the locator given is DG95 Introduction p. 513, which only *states* Faltings' theorem
(`DG95` line 26); no proof route, no supplier and no gap is declared. The merge order lists
`FaltingsFinitenessAndIsogenyTheorems` and `MordellLawrenceVenkatesh` before this roadmap; a
roadmap named for Faltings' finiteness theorems owns it, and "what another roadmap plans is
imported by name and section, never planned again".

Repair: replace the target by a supplier citation: "Consume Faltings' theorem (finiteness of
rational points on a smooth projective geometrically connected curve of genus ≥ 2 over a number
field) from FaltingsFinitenessAndIsogenyTheorems, §<its finiteness section>" and add the row to
the supplier contracts; keep only the genus comparison (AlgebraicCurves 12E) and the signed
diagonal-curve adapter as targets here. If that roadmap's statement carries different point or
genus carriers, state the comparison as a target of 6.3 and keep the `*Needs:*` on the supplier.

## R02 (P1) — The modularity theorem and Ribet's level lowering are planned here

Location: `README.md:422-424` ("Prove `ellipticCurveModularity` for every elliptic curve E/ℚ: a
normalized weight-two newform of level its arithmetic conductor and trivial nebentypus has c_p
equal to the integer trace"), `README.md:458-466` ("Prove `weightTwoLevelLowering` for every
elliptic curve E/ℚ and odd prime ell with E[ell] irreducible … Produce a normalized weight-two
cuspidal newform f at level M₀"), with `*Needs:*` at line 499 naming only EllipticCurves,
ModularForms and LocalFieldsRamification layers.

Claim: the Wiles–Breuil–Conrad–Diamond–Taylor modularity theorem and Ribet's theorem are targets
of this roadmap, resting on a torsion Galois action, Hecke theory and ramification groups.

Witness: `BS20pub` lines 178-183 (Theorem 3 is "a standard consequence of Ribet's level lowering
theorem … conditional on the modularity of elliptic curves over Q, … proved by Wiles, Breuil,
Conrad, Diamond and Taylor"). The merge order lists `EllipticCurveModularity`,
`ClassicalSerreModularity` and `SerreWeightAndLevelOptimisation` before this roadmap. The README
rule "No gaps" is violated: nothing between ModularForms Layer 8 and a proof of modularity is
owned anywhere the README cites.

Repair: delete the two proof targets and cite the earlier roadmaps by name and section in the
supplier contracts: modularity of every E/ℚ (newform of level the conductor, a_p = c_p at good
primes) from `EllipticCurveModularity`; level lowering for weight-two residual representations
with the deletion level M₀ of equation (3), and the coefficient-prime weight-two bridge, from
`ClassicalSerreModularity` or `SerreWeightAndLevelOptimisation` (whichever states them; the
repair worker must look up the section). Keep as targets here only the progression-specific
consequences (1.7–1.13) and the trace congruences `levelLowering_goodTrace`,
`levelLowering_removedTrace` if the supplier does not state them.

## R03 (P1) — Deep uniformity, Galois-representation and analytic theorems planned without any proof route

Location: `README.md:412-421` (`weightTwoNewformGaloisRepresentation`, `newformGalois_*`,
`weightTwoCoefficientBound`), `README.md:487-489` (`fullTwoTorsion_irreducible`,
`rationalTwoTorsion_irreducible` "as consequences of the rational-isogeny classification"),
`README.md:713-716` ("Prove `rationalIsogeny_surjective`: every non-CM elliptic curve over ℚ
admitting a nontrivial rational cyclic isogeny has surjective mod-ell image for every prime
ell>37"), `README.md:839-846` (`effectiveCharacterPNT`, `exceptionalZeroRepulsion`,
`smallConductorZeroExclusion`), `README.md:1060-1063` (log-free zero-density estimate).

Claim: Eichler–Shimura/Deligne representations, the Ramanujan–Petersson bound, Mazur's isogeny
theorem, Lemos' uniformity theorem (which rests on Bilu–Parent–Rebolledo and Darmon–Merel), the
PNT for Dirichlet characters, Landau's repulsion, Platt's verification below 400000 and
Selberg's log-free density estimate are all targets of this roadmap, each with a locator into
BS20 only.

Witness: BS20 cites them from elsewhere and proves none: `BS20pub` lines 295 and 335 (Mazur
[29]), 774 (Lemos [25]), 797-798 ("here we combine Theorems 5.26 and 5.28 of [19]"), 821
(Theorem 5 "is Theorem 5.27 of [19]"), 914-915 (Platt [30]), 1421-1429 (Selberg via [7]). The
merge order has `AutomorphicGaloisRepresentations`, `EisensteinIdealAndRationalTorsion`,
`DeligneWeightsAndPurity`, `WeilConjectures`, `AnalyticNumberTheoryPartI` and
`AnalyticNumberTheoryPartII` before this roadmap. `smallConductorZeroExclusion` is in addition a
numerical verification (Platt computes zeros of all L-functions of conductor < 4·10⁵), which the
principles exclude ("computational algorithms are not" welcome).

Repair: for each item either (a) cite the earlier merge-order roadmap by name and section and
delete the target, or (b) where no earlier roadmap states it, declare a supplier gap
`gap:<slug>` in `design/plan.json` and under a README "Gaps" list, with a one-sentence `needs`
carrying the exact hypotheses (for example: "PNT for a primitive Dirichlet character of conductor
N with the exceptional-zero term and the effective error X exp(−c log X/(√log X + log N))(log N)⁴").
For Platt's verification, state the needed consequence as a gap or as an explicitly
`uncertified` finite-verification input, never as a target to be proved here.

## R04 (P2) — Landau–Page predicate lacks the reality clause the proof of 5.3 uses

Location: `Suggested.lean:364-373` (`pageException`, `boundedPage`: only "primitive, zero with
|Im ρ| ≤ T and 1 − c/log T ≤ Re ρ, and uniqueness of q ≤ T"); `README.md:1060` ("Prove the real
exceptional-zero upper bound needed to force q ≥ log k"); `README.md:1105-1107` ("For small q
apply bounded-height zero exclusion and the Landau-Page uniqueness strip").

Claim: `exceptional_moduli_bounds` (lines 384-389) concludes "every q ∈ Q(k,c) is ≥ log k" from
`boundedPage c` alone, via a bound on *real* zeros.

Witness: `BS20pub` lines 1434-1438: "If this zero exists, it must be real and, via Proposition
1.11 of [2], is bounded above by 1 − 40/(√q₁ log² q₁)". Reality of the exceptional zero is part
of the Landau–Page theorem (IK 5.28), not a consequence of modulus uniqueness; `boundedPage c`
as typed is satisfied by hypothetical data with a complex zero for a small modulus, for which
the real-zero bound does not apply and the conclusion q₁ ≥ log k is unsupported.

Repair: add to `pageException`/`boundedPage` (or as a second hypothesis of
`exceptional_moduli_bounds` and `exceptional_indices_sparse`) the clause that any zero of a
primitive character of modulus q ≤ T with |Im ρ| ≤ T and Re ρ ≥ 1 − c/log T is real and the
character is real; state the real-zero bound as a named target with its statement, "for a real
primitive character of conductor q and a real zero β, β ≤ 1 − 40/(√q log² q)", with the primary
locator (Bennett, Martin, O'Bryant, Rechnitzer, Illinois J. Math. 62 (2018), Proposition 1.11).

## R05 (P2) — Targets named without a statement

Location: `README.md:376-378` ("Prove `primePowerTail` strong enough to preserve the strict
margin 0.000045875k"; "Prove `explicitTotientRatio` in the range used for the progression Kraus
index bound"), `README.md:379` ("Include an effective π(k)=o(k) cutoff"), `README.md:1060`
("Prove the real exceptional-zero upper bound needed to force q≥log k").

Claim: these are targets.

Witness: none of the four says what is to be proved. The source gives the statements:
`BS20pub` lines 649-653 (the tail is |ψ(k) − θ(k) − ψ(k/2) + θ(k/2)|, bounded by Schoenfeld's
(5.3*)–(5.4*)), lines 428-438 (∏_{q≤k}(1 + 1/q) ≤ 2 log k for k ≥ 10⁸, from Tenenbaum), line
1295 (π(k) < 0.00001k in the certified range, from Rosser–Schoenfeld).

Repair: write each as an explicit inequality with its range: `primePowerTail`: for x ≥ 2·10¹⁰,
0 ≤ ψ(x) − θ(x) < 1.001102√x + 3x^{1/3} (Schoenfeld, Math. Comp. 30 (1976), Theorem 6*),
hence the half-interval tail is < 0.000045875k; `explicitTotientRatio`: ∏_{q≤k, q prime}(1+1/q)
≤ 2 log k for k ≥ 10⁸; the π cutoff: π(x) < 1.1x/log x for x ≥ 10⁸ (consequence of the quoted
Rosser–Schoenfeld bound); and the real-zero bound of R04.

## R06 (P2) — Semistable algorithmic–Artin conductor comparison is re-planned

Location: `README.md:440-443` ("Prove `artinConductor_isomorphic`, `artinConductor_good` and
`artinConductor_multiplicative`. For the rational Tate module, identify the good and
multiplicative exponents, respectively 0 and 1, with the algorithmic exponents from
EllipticCurves Layer 4").

Claim: this roadmap owns the identification of the Ogg exponent with the Artin exponent in the
good and multiplicative cases.

Witness: EllipticCurves on main, `TauCetiRoadmap/EllipticCurves/README.md:1463-1465`: "the Frey
curve is semistable, so only the exponents 0 and 1 occur, and the semistable case of the
algorithmic–Artin comparison is its own milestone here" (Layer 8 Szpiro block). Two owners for
one object.

Repair: delete `artinConductor_good`/`artinConductor_multiplicative` as proofs; cite
"EllipticCurves Layer 8, the semistable case of the algorithmic–Artin comparison" in the supplier
contracts and in 1.1's `*Needs:*`. Keep here only what EllipticCurves does not state: the Swan
construction for E[ℓ] and `residualConductor_multiplicative`.

## R07 (P2) — Primary sources for every imported theorem are missing; manifest records neither cited work

Location: `README.md:1412-1415` (References: only [BS20] and [DG95]);
`packages/ErdosProgressionPowers/sources.toml` (records `Faltings1983` and `ErdosSelfridge1975`
only, neither of which the README cites).

Claim: locators into BS20 suffice for Kraus' Théorème 4, Martin's inequality (4), Mazur, Lemos,
IK Theorems 5.26–5.28 and 12.13, Bombieri's inequality, Rahman's explicit Roth bound (36),
Ramaré–Rumely's θ(x;8,a) bound, Rosser–Schoenfeld, Schoenfeld, Tenenbaum, Robbins' Stirling
bound, Platt, and the zero-density estimate.

Witness: BS20 is a research paper that cites each of these (`BS20pub` lines 1564-1643 list
[19], [23], [25], [28], [29], [30], [31], [32], [34], [35], [43], [44]); a locator "BS20 §7
equations (23)–(26)" (README line 846) points at a quotation, not a proof. Policy: "every cited
work" is recorded in `sources.toml`; BS20 and DG95 are not recorded, and the two recorded works
are never cited.

Repair: add the primary locators beside each BS20 locator (Kraus, Canad. J. Math. 49 (1997),
Théorème 4; Martin, J. Number Theory 112 (2005), Theorem 2; Mazur, Invent. Math. 44 (1978);
Lemos, Trans. AMS 370 (2018), Theorem 1.1; Iwaniec–Kowalski Thm 5.26–5.28, 12.13, Prop. 5.25;
Bombieri, Acta Arith. 18 (1971), Prop. 1; Ramaré–Rumely, Math. Comp. 65 (1996); Rosser–Schoenfeld,
Illinois J. Math. 6 (1962), Thms 1, 5; Schoenfeld, Math. Comp. 30 (1976), Thms 6*, 7; Platt,
Math. Comp. 85 (2016)); record BS20, DG95 and every added work in `sources.toml` with the
service's fields (paywalled ones as `uncertified`); cite `ErdosSelfridge1975` (Theorem 1, line
29-30 of the cached text) at 7.1 instead of "BS20 §1, Theorem 1 citing Erdős–Selfridge", and
either cite `Faltings1983` at 6.1 or drop it from the manifest.

## R08 (P3) — Supplier section mismatch: the descent map is EllipticCurves Layer 6

Location: `README.md:723` ("*Needs:* EllipticCurves Layers 2–5 and its descent map");
`README.md:107-108` ("EllipticCurves Layers 2–4 … own torsion, descent, …").

Claim: the halving/descent criterion in split cubic coordinates is in EllipticCurves Layers 2–5.

Witness: `TauCetiRoadmap/EllipticCurves/README.md:1206-1208`: the `x − θ` map into the étale
algebra and the weak Mordell–Weil Kummer argument are Layer 6 ("Self-contained at this layer").

Repair: change both citations to "EllipticCurves Layer 6, the `x − θ` Kummer map and its kernel
2E(K)" and add that row to the "From TauCetiRoadmap.EllipticCurves" contract.

## R09 (P3) — Mathlib's Chebyshev carriers are not named

Location: `README.md:379-380` ("The definitions of θ and ψ use primes and prime powers
respectively"), `README.md:392` (Check "θ(2)=log 2 whereas ψ(4)=…"), supplier contract lines
147-151 (no Chebyshev entry).

Claim: θ and ψ are this roadmap's definitions.

Witness: pinned Mathlib has `Chebyshev.theta` and `Chebyshev.psi` in
`Mathlib/NumberTheory/Chebyshev.lean` (lines 70 and 77 at the pin, with `theta_le_log4_mul_x`
and `theta_eq_sum_primesLE`). The Check θ(2) = log 2 is statable at the pin and has no `example`.

Repair: add "Use `Chebyshev.theta`, `Chebyshev.psi` from `Mathlib/NumberTheory/Chebyshev.lean`"
to the Mathlib contract, state `explicitPrimeEstimates` and `primePowerTail` on them, and add
`example : Chebyshev.theta 2 = Real.log 2` (and ψ 4) to Layer 0 of `Suggested.lean`.

## R10 (P3) — Definitions with fewer than three Checks

Location: `Suggested.lean:23` (`term`), `31-36` (`H`, `Hplus`), `53` (`kappa`), `261` (`Upr`),
`271` (`removedIndex`, one Check), `283-287` (`certifiedThreshold`, `thinSet`), `346`
(`zeroHeight`), `364-373` (`pageException`, `boundedPage`); `README.md:995-997` and `1058-1066`
list no Checks for these.

Claim: each definition has at least three discriminating Checks.

Witness: `README.md:1009-1013` (4.6 Checks) are about the witness, none about
`certifiedThreshold` or `thinSet`; 0.1's Checks (lines 309-313) test only `primitive_solution`;
5.1 has no Check on `pageException`/`boundedPage`; `zeroHeight` and `Upr` have none.

Repair: add three Checks each, with `example`s where statable: e.g. `¬ certifiedThreshold 0`,
`thinSet 10 {2} = False` (mass 1/2 ≥ 0.17), `thinSet 10 {7, 11} ` fails on 11 > 10;
`Hplus → H`, `H → 10^8 ≤ k`, `¬ H n d 1 y ell`; `zeroHeight k c ≥ 1 ↔ …` at a concrete k;
`Upr 1 = ∅`, `3 ∈ Upr k` for a concrete k; `removedIndex p coeff ∅ = 0`;
`pageException c T 0` is false (no `NeZero 0`), `boundedPage c → boundedPage c'` for `c' ≤ c`.

## R11 (P3) — Statable README Checks with no Lean example; light definitions with Checks but no mirror

Location: `README.md:922` (132 log 2·10⁵ lies strictly between 10⁶ and 10⁷; the README names
`Real.log_two_gt_d9`/`lt_d9` at line 1026), `README.md:709-710` (the point (1+i, −1+i) on
y²=x(x−2)(x−1) with both sides −2i, and its double (1,0)), `README.md:1166` (8·64^{7/2} = 64⁴),
`README.md:478-497` (`gammaZeroIndex` with Checks μ(1)=1, μ(4)=6, μ(11)=12, μ(44)=72).

Claim: every statable Check has its `example`; light definitions with real bodies live in
`Suggested.lean`.

Witness: `Suggested.lean` has no example for any of these; `gammaZeroIndex` (μ(N) = N∏(1+1/q))
is a one-line definition on `Nat.primeFactors` and is absent from the file.

Repair: add `def gammaZeroIndex (N : ℕ) : ℚ := N * ∏ q ∈ N.primeFactors, (1 + 1/(q:ℚ))` with
examples for N = 1, 4, 11, 44; add
`example : (10:ℝ)^6 < 132 * Real.log 2 * 10^5 ∧ 132 * Real.log 2 * 10^5 < 10^7`; add the Case-II
witness as `WeierstrassCurve.Affine.Equation` over ℂ at t = v = 1/2; add the k = 64 identity.

## R12 (P3) — `composite_exponent_reduction` bundles three unrelated statements

Location: `Suggested.lean:467-473`; `README.md:1247-1251`.

Claim: one target.

Witness: the conjuncts are an algebraic identity (needs only p ∣ ell), a lower bound |y| > 1
(needs k ≥ 3, d ≠ 0, nothing about p), and a finiteness statement about an arbitrary Y (needs
neither). One `*Needs:*` line covers three theorems with different needs.

Repair: split into `pow_eq_pow_div_prime`, `primitive_solution_natAbs_y_gt_one` (hypothesis
`3 ≤ k` suffices and should be used) and `finite_root_exponent_pairs`, each with its own locator.

## Verified sound

- Declarations read: all 35 definitions/abbrevs, 22 sorry'd theorems and 26 examples of
  `Suggested.lean`; no `lemma`, `set_option`, `#eval`, `True` placeholder or sorry'd data; single
  `import Mathlib`; every Lean name appears in the README.
- README targets read: all 58 subsections (Layers 0–7), every `*Needs:*` line, both routes.
- Lean versus README generality agrees for every sorry'd theorem; the context of each sorry'd
  statement carries its hypotheses explicitly (no silent `variable`s).
- Invariant identities recomputed from Mathlib's `b₂, b₄, b₆, b₈, c₄, Δ` at the pin: for
  y² = x(x−a)(x+c), Δ = 16(abc)², c₄ = 16(a² − bc) with a+b+c = 0 (the README correctly uses the
  native 16(abc)² where `BS20pub` line 283 prints 64(abc)²); for y² = x(x²+2κdx+κA),
  Δ = −64κ³A²B and c₄ = 16κ(4κd² − 3A), valid for all integers n, d given j₁+j₂ = i₁+i₂.
- Case-II order-four witness: (2λ+4itv, 8itv(t+iv)) lies on y² = x(x−2)(x−2λ) and doubles to
  (2λ, 0) (x-coordinate 2λ ± √((2λ)(2λ−2)) = 2λ ± 4itv); the source's printed y-coordinate
  (`BS20pub` line 718) equals the square of the README's y, so the README's corrected point is
  right; the Check at t = v = 1/2 evaluates to −2i on both sides.
- `legendre_square_twoPrimary` holds over every finite field of odd characteristic (for q ≡ 1
  mod 4 the point (0,0) is 2-divisible since −1 and −λ are squares; for q ≡ 3 mod 4 one of
  (1,0), (λ,0) is), so the README's generalisation of Lemma 6.3 is true; `minusOne_twoPrimary`
  checked at p = 5 and 13 (8 points each).
- Kraus threshold Checks: μ(1)=1, μ(4)=6, krausH(1)=4, μ(11)=12, μ(44)=72, krausH(11)=169.
- Numerical margins: (1−3·0.002811)/8 = 0.123945875, margin 0.000045875k; 1/68 = 0.014706 <
  0.1239² = 0.015351; 132·log 2·10⁵ ≈ 9.15·10⁶ (so the source's "K₀(10⁻⁵) < exp(exp(10⁶))" at
  `BS20pub` lines 1328-1329 is a misprint and the README's exp(exp(10⁷)) threshold is right);
  Markov step 0.00319 − 0.44/139 > 10⁻⁵; c₁ = 1/20000 endpoint correction; 8k^{7/2} ≤ k⁴ iff
  k ≥ 64; genus 5 at (k,ℓ) = (5,2) and 1 at (4,2).
- DG95 Corollary 2.1 (`DG95` lines 325-327, 338-367): hypotheses m+k ≥ 7 ⟺ 2/k + 1/m < 1 for
  k ≥ 3, m ≥ 2, so k ≥ 5 with every ℓ ≥ 2 is covered; the README's correction of (2.2) to
  coefficients j−1, j−2 is right (the printed coefficients give a+(j+1)d); the source's progression
  is a+d, …, a+kd, matching the README's "replace a by n−d".
- Lemma 3.1, 3.2–3.5, 4.1, 5.1, 5.2, 6.1–6.6, 7.1–7.3, 8.1–8.2, 9.1, §10, 12.1–12.3 statements
  and constants checked against `BS20pub` lines 249-257, 281-343, 395-415, 423-465, 499-789,
  799-915, 923-1118, 1162-1334, 1345-1377, 1401-1502; the README's exponent min(c₁, 1/2) in 3.2
  is a correct refinement of the source's (log k)^{c₁}; `half_primes_divide_d` hypotheses
  (k < 2p ≤ 2k) match (k/2, k]; the two-term branch quadruple (i, i+1, i+p−1, i+p) has
  κ = 1 − p, so p ∤ κ.
- Maximal-valuation deletion: v_p(A_i) ≤ v_p(i − i_p) for i ≠ i_p and ∑ v_p(|i − i_p|) =
  v_p(i_p!(k−1−i_p)!) ≤ v_p((k−1)!), for any J ⊆ range(k); Lean Checks {0,1,4} and least tie 1
  recomputed.
- Locators verified: 41 BS20 page/lemma locators and 3 DG95 locators against the texts (all
  printed pages match marker N + 354); Erdős–Selfridge Theorem 1 (cached text lines 29-30) has
  exactly the 7.1 hypotheses.
- Checks tested by hand: 46 README Checks (all true as stated), including every Lean example's
  numerical content.
- Sibling citations checked on main: EllipticCurves Layers 2, 3 (supersingular ⟺ p ∣ a_p only
  for p ≥ 5, matching README 1.13), 4 and the worked `freyCurve A B` (coefficients 0, B−A, 0,
  −AB, 0, Δ = 16A²B²(A+B)², c₄ = 16(A²+AB+B²), agreeing with the README after b = −a−c);
  ModularForms Layers 2–4, 8, 10; LocalFieldsRamification Layers 3–4 (Herbrand, upper numbering,
  wild inertia present); ClassicalArithmeticCompletion §1.51 (all eleven API items the README
  consumes exist, including odd-part-1 ⟺ ω ∈ {±1, ±2}) and §4.41 (T⁴+V⁴ = 2U² with positive,
  coprime hypotheses); ImaginaryQuadraticClassNumber H3.1 (CM integrality of j);
  AlgebraicCurves Layer 7 (Hurwitz with separability, tame, constant-field hypotheses) and 12E.
- Pinned declarations grepped at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`: all 28 Mathlib
  names and 9 Tau Ceti names cited in the README exist with the stated files
  (`Stirling.log_stirlingSeq_sdiff_le` is exactly 1/(12n(n+1)); `roth_3ap_theorem_nat`,
  `Nat.maxPrimeFac`, `padicValInt.mul`, `Nat.prod_factorization_pow_eq_self`,
  `DirichletCharacter.LFunction`, `MulChar.IsQuadratic`, `WeierstrassCurve.frobeniusTrace_eq_card_point`,
  `lowerRamificationGroup_eq_bot_of_largestLowerJump_lt`, `fundamentalDiscriminantChar_*`); the
  lemma names used inside the examples (`Real.rpow_natCast_mul`, `Nat.maxPowDvdDiv.go`,
  `Finset.sum_Ioc_succ_top`, `Nat.primeFactors_pow_succ`, the `IsSquare` norm_num extension)
  exist at the pin.
- No overlap with ArithmeticDynamics (#1335) or with any roadmap on main or under `Completed/`
  for the progression objects; the completed ArithmeticDirichletSeries explicitly excludes
  zero-free regions, explicit formulas and effective estimates.
- Policy: no pull-request numbers or process narrative; `theorem` only; every target has a
  locator; `metadata.toml` topic `math.NT`.

## Not verifiable

- The sections of the merge-order roadmaps named in R01–R03 (`FaltingsFinitenessAndIsogenyTheorems`,
  `EllipticCurveModularity`, `ClassicalSerreModularity`, `SerreWeightAndLevelOptimisation`,
  `AutomorphicGaloisRepresentations`, `EisensteinIdealAndRationalTorsion`,
  `AnalyticNumberTheoryPartI/II`, `DeligneWeightsAndPurity`): none is on main or among the open
  pull-request checkouts provided, so their section numbers and exact statements could not be
  read; the findings rest on their names and on the source's attributions.
- Kraus' Théorème 4 hypotheses (whether the level is Serre's conductor or the deletion level,
  and whether Serre weight 2 is assumed), Martin's Theorem 2, Rahman's bound (36), Ramaré–Rumely's
  constant 0.002811, Platt's range, and Robbins' constant: the primary texts were not fetched
  (paywalled or not in the manifest); checked only against BS20's quotations.
- Elaboration of `Suggested.lean`: no Lean command was permitted, so the 26 example proofs and
  the elaboration of the sorry'd signatures were checked by reading only.
- The arXiv and Annals texts both print the exponent of Theorem 2 as "exp(10k)" (superscript
  lost in extraction); the README's exp(10^k) is the only reading consistent with Lemma 5.1's
  H(M_a) < exp(10^k), so it was accepted.
