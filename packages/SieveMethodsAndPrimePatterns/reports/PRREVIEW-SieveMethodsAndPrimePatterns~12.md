# Review of SieveMethodsAndPrimePatterns (pull request #1495 at 66e58fc)

**Verdict:** accepted

This is an incremental re-review of the 10 lines that changed since 593232d. All 10 are in `README.md`; `Suggested.lean` is byte-identical to 593232d. This report has no findings.
- R04, R05 and R06 of the previous report are repaired.
- R01, R02 and R03 are settled, and they do not block. The reply to that review answered each one with a reason, and each reason holds (see below).
- R01 and R02 still need repairs in ArithmeticStatisticsPartVII (#1178) and ArithmeticStatisticsPartIII (#1174). The reviews of those roadmaps should carry them.

## Previous findings

- R01 — partly repaired; settled, not re-raised: `README.md:4128` names ArithmeticStatisticsPartVII as a consumer of §2.9. #1178 is still at 661d52f, and its `README.md:18` still says its target "owns" all three inequalities. Answer H01: no edit belongs here. That is right, because this roadmap is the earlier owner (`ORDER.txt` line 55, against line 142).
- R02 — partly repaired; settled, not re-raised: `README.md:4129` names ArithmeticStatisticsPartIII §2.23 as a consumer of §5.4. #1174 is still at 0a63762: "SieveMethodsAndPrimePatterns" occurs 0 times there, and `:2082` still proves Lang–Weil by induction. Answer H02 is right; the repair belongs to #1174.
- R03 — not repaired; settled, not re-raised: DAVENPORT-51 and LANG-WEIL-54 still have no `sources.toml` entry (39 ids). Answer H03 says neither has a fetchable legal copy and both await a human ruling. My probe of the sources service agrees: both end "no legal source found".
- R04 — repaired: `README.md:4131` now reads "the uniform Gram-row inequality `SieveGram.sum_norm_inner_sq_le_of_row_le` and its two specialisations of §0.4, the maximum-row Gram inequality and the diagonal/off-diagonal Gram inequality, which are README targets with no Lean declaration."
- R05 — repaired: `README.md:4128` now reads "ExplicitZetaBounds takes the same three §2.9 statements and the finite large-sieve duality of §2.6. ExplicitPrimeCounting takes the large sieve for forbidden residues (§2.9), as a comparison … rather than an input, and … `SieveDistribution.primeCountAP` (§3.1)."
- R06 — repaired: `README.md:2429` now ends "Layer 2 §2.2 cardinality above the circle diameter; Mathlib `norm_sum_le`; Mathlib `Circle.norm_coe`; Mathlib `sq_sum_le_card_mul_sum_sq`." The added `Circle.norm_coe` is correct, because the Lean phase is a `Circle` value coerced to ℂ (`Suggested.lean:210`).

## Verified sound

**Gate, dependency check, elaboration.**
- My rerun of the gate on 66e58fc prints every check at 0 and ends `outside-folder=0 source-material=0 OK` (exit 0). The worker's `gate.md` adds `build=0`.
- The dependency check prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean Suggested.lean` exits 0. It prints 43 `declaration uses 'sorry'` warnings and nothing else, the same as at 593232d.
- The diff outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The added lines contain no LaTeX, process words or pull-request numbers.

**Changed *Needs:* lines resolve.**
- Every target name cited in `:2429`, `:2445` and `:2455` exists earlier in Layer 2, so there is no forward edge:
  - §2.2 *Cardinality above the circle diameter* (`:1931`);
  - §2.3 *Circular separation of reduced fractions* (`:1957`);
  - §2.3 *Gauss expansion of a finite character sum* (`:1999`);
  - §2.3 *Squared norm of a primitive Dirichlet Gauss sum* (`:1987`);
  - §2.3 *Parseval identity over Dirichlet characters* (`:2011`);
  - §2.6 *Squared finite large-sieve duality* (`:2240`);
  - §2.9 *Separated Hilbert inequality* (`:2405`).
- Library declarations opened at the Mathlib pin:
  - `Circle.norm_coe`: `Analysis/Complex/Circle.lean:73`, inside `namespace Circle` (`:56`), ‖(z:ℂ)‖=1;
  - `norm_sum_le`: `Analysis/Normed/Group/Basic.lean:799`;
  - `sq_sum_le_card_mul_sum_sq`: `Algebra/Order/Chebyshev.lean:143`;
  - `AddCircle.norm_le_half_period`: `Analysis/Normed/Group/AddCircle.lean:94`, which is behind `:1931`.
- The new Needs items follow the source's route. KED-ANT-16 Theorem 16.2 (line 401) is proved by the Gauss expansion (lines 417–421), |τ|=√q (line 433), orthogonality (line 454), and Theorem 16.1 (line 462). Theorem 16.1 applies Theorem 15.5 with the spacing (16.1.2) (lines 366 and 389).
- Theorem 16.4 is derived from 16.2 and Lemma 16.5 (line 511). The README instead applies the sharp additive sieve at the frequencies a/d, so its route needs the §2.3 separation that `:2455` now lists.

**Cross-roadmap citations in the changed consumer lines, resolved at the open heads.**
- ExplicitZetaBounds (#1954, 4478804):
  - `README.md:134–135` and `:380–384` take the three §2.9 statements; its quoted range 0<δ≤1/2 is implied by 0<δ≤1;
  - `:2593` takes "`SieveMethodsAndPrimePatterns` §2.6 (finite large-sieve duality)".
- ExplicitPrimeCounting (#1945, cac820b; the head moved since the last report):
  - `:469–474` takes the forbidden-residue sieve, which "is not an input of §0.1";
  - §0.1 is "The Brun–Titchmarsh inequality" (`:630`), and `:150–153` uses §2.9 as a comparison;
  - `:475–476` takes §3.1 `SieveDistribution.primeCountAP` (declared at `Suggested.lean:382`).
- ErdosProgressionPowers (#1336, 3e1048c): `:1531–1533` applies "SieveMethodsAndPrimePatterns §0.4's diagonal/off-diagonal Gram inequality", which resolves to the target at `README.md:512`. The supplier list at `:700–701` still names the two deleted declarations. This line gives the replacement, so updating that list is #1336's own repair.
- Merge order: ExplicitZetaBounds is at line 265 and ExplicitPrimeCounting at 267, both after this roadmap (55).

**Seeded sample.**
- Of the 15 sampled targets, only 2.6 is touched by the change: the new consumer line cites it, and `:2429` names it.
- Its locator "KED-chap-largesieve §15.2, Lemma 15.4" is right: Lemma 15.4 "Duality" is at line 476, inside Section 15.2 (lines 383–503).
- The README adds C≥0, which the source's statement needs (see Source issues). It also correctly converts the source's unconjugated adjoint (line 487) by replacing b with its conjugate.
- The other 14 targets lie in untouched text and were not re-read.

**Ownership against open pull requests,** checked for the objects the change touches:
- ExplicitCharacterSumsAndSieves (#1948, b701b75, the closest in vocabulary) consumes §2.9's forbidden-residue sieve (`:72–73`, `:276–280`) without owning it, and it is later in the order (268).
- No other open roadmap owns §2.6 or the §0.4 Gram inequalities.
- Ownership of untouched objects was not re-checked.
- The overlap lead "IntegralLattices Layer 0 only at #1797" is a false positive: on main 94294cd, `TauCetiRoadmap/IntegralLattices/README.md:536` is "Layer 0: the native foundation".

**Adversarial table, changed statements (computed this round).**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.9 sharp additive sieve, single-frequency route of `:2429` (§2.2 cardinality, `norm_sum_le`, `Circle.norm_coe`, `sq_sum_le_card_mul_sum_sq`) | a=(1,i,−1), x=0.3, δ=0.7; a=(2,−1,1+i,1/2), M=5, x=0.123, δ=1; a=(1,1,1), x=0, δ=0.6 | LHS ≤ (Σ\|a\|)² ≤ NΣ\|a\|² ≤ RHS: 0.814≤9≤9≤10.286; 0.482≤24.15≤29≤29; 9≤9≤9≤11 | holds; at δ=1 the bound is exactly Cauchy–Schwarz |
| §2.2 cardinality, as the route uses it | points 0 and 1/2 with δ=0.6 | ‖1/2‖=0.5<0.6 | two labels are excluded for δ>1/2 |
| §2.3 separation, cited at `:2445` and `:2455` | Farey sets with Q=1..8 | Q=1 has a single fraction; for Q=2..8 the least gaps are 1/2, 1/6, 1/12, 1/20, 1/30, 1/42, 1/56, against 1/Q² = 1/4, …, 1/64 | holds, with wraparound |
| §2.3 Gauss expansion and Parseval step, cited at `:2445` | q=5, χ(2)=i, H=7, M=3, random a | \|τ(χ̄)\|²=5.000000; both sides −2.591903−2.262608i; (q/φ(q))Σ_prim = 11.086 ≤ Σ_units\|S(u/5)\|² = 25.922 | holds |
| §2.9 `sharp_primitive_largeSieve`, end to end | (Q,H)=(1,2),(2,3),(3,4),(4,5), random a | 2.203≤2.591; 1.732≤19.569; 6.346≤25.593; 3.700≤76.967; primitive counts per q = [1,0,1,1] | holds; modulus 2 contributes nothing, modulus 1 stays |
| §2.9 forbidden residues, `:2455` | P={2,3}, Ω_p={0}, H=12, a=1 on {1,5,7,11} | Q=1: J=1, 16≤48; Q=2: J=2, 32≤60; Q=3: J=5/2, 40≤80; Q=6: J=3, 48≤188 | holds |
| §2.6 duality, cited by `:4128` | A=(1, i), C=2 and C=1.9; I nonempty, J empty, C=−1 | C=2: 4≤4 and 2≤2; C=1.9: 4>3.8 and 2>1.9, failing together; C=−1: forward 0≤0 but adjoint 0≤−\|b\|² fails | holds with the README's C≥0 |
| §0.4 diagonal/off-diagonal form, cited by `:4131` | x=1, y=(1,2) | D=4, O=2, rows (3,6): 5≤6 | holds; it is the uniform form at C=D+O |

**Adversarial table, carried forward from the previous report (statements the diff leaves untouched).** The rows marked (8111bc5) were computed in the review at 8111bc5 and carried by the previous report.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 uniform lower bound, constant 1 (593232d) | (k,z)=(1,2),(2,3),(6,4),(1,3),(4,4),(2,4),(30,8) | sums 1,1,1,2,3/2,3/2,7/6 against 0.693,0.549,0.462,1.099,0.693,0.693,0.555 | holds |
| §1.1, exhaustive (593232d) | k≤120, z=n+1 with n<400 | least slack 0.307, at (1,2) | holds |
| §0.4 maximum-row form (593232d) | x=1, y=(1,2); two equal unit vectors | 5≤6; 2≤2 | holds |
| §0.4 diagonal/off-diagonal, empty family (593232d) | D=−1, O=0 | 0≤−‖x‖² fails | D+O≥0 is needed and is stated |
| `sharp_additive_largeSieve`, δ≤1 (593232d) | δ=1, one point, a=(1,1); δ=2; points 0 and 1/2, δ=1/2 | 4≤4; 4>3; 2≤2 | holds; δ≤1 is sharp |
| same, random (593232d) | 3000 δ-separated families | least slack 0.00026 | holds |
| §3.4 BDH locator (593232d) | Theorem 17.4 | Q=x(log x)^(−B) | consistent |
| 0.1 Legendre identity (8111bc5) | support 1..10, P=6 | S=3=10−5−3+1 | holds |
| 0.2 finite family (8111bc5) | n(10−n), 2≤n≤8 | 4 labels, multSum(1)=7 | holds |
| 0.3 residue sieve (8111bc5) | Q={2,3}, Ω₂=∅, Ω₃={1} | P=3, S=4 | holds |
| 0.4 `selberg_weighted_inner` (8111bc5) | x=1, y=(1,2) | 1/3+4/6=1 | holds |
| 0.5 `remainderMass` (8111bc5) | P=6, R_d=1, D=1,2,3,6,7 | 0,1,2,3,4 | holds |
| 0.6 `discriminantValue` (8111bc5) | (5,2),(8,2),(8,3),(−3,2),(−7,2) | −1,0,−1,−1,1 | Kronecker values |
| 0.7 ρ, ρ̃, θ_Q (8111bc5) | Q=x₀ at 9; Q=2 at 2,4 | 9/9; ρ̃(2)=4, ρ̃(4)=0; θ=5/3 | holds |
| 0.8 conics (8111bc5) | x²−y² mod 3; B.8 at p=3 | 5; 18 | README corrections right |
| 0.9 ℤ[i] counts (8111bc5) | r(5), r(25), r(3), r(9) | 2, 3, 0, 1 | holds |
| 1.2 `fundamental_estimate` (8111bc5) | κ=1, K=2, u=10, 20 | 1024, 0.04649 | holds |
| 1.3 Selberg weights (8111bc5) | P=6, z=4 | G=5/2, main sum 2/5 | holds |
| 1.4 character Gram (8111bc5) | moduli 1, 2 | total 8, energy 2 | holds |
| 1.5 BSKK v_p (8111bc5) | ℓ=11 | 7 ≤ 7.19 | holds |
| 1.6 `prime_interval_upper` (8111bc5) | y=2 | ≥5.77 against ≤2 | holds |
| 2.2 taper (8111bc5) | δ=1/2, L=2; δ=3/10, L=3 | 3.645≤4; 6.046≤6.667 | holds |
| 2.4 `vaughan_identity` (8111bc5) | n=12, 4, 0 | 0; log 2; 0 | holds |
| 2.7 Jutila (8111bc5) | X=3, 12; K=4, L=9 | 1; 9; 30≤36 | holds |
| 2.8 Farey (8111bc5) | p=2, ℓ=1, m=2 | 2≤4 | holds |
| 2.9 Linnik (8111bc5) | N=16, ε=1/2 | 28, 511 | holds |
| 3.0 `small_conductor_maximal` (8111bc5) | χ mod 3, s=1, 2 | −log 2; 0 | holds |
| 3.1 `PrimesHaveLevel` (8111bc5) | discrepancy(10,3), (5,3) | 1, 3/2 | holds |
| 3.2 convolution (8111bc5) | δ₂*δ₃ at q=5 | 3/4 | holds |
| 3.4 variance (8111bc5) | Q=3; Δ=1/16, x=16 | 1/2; 3 against 6.093 | holds |
| 4.3 M_k (8111bc5) | k=1; triangle | 1; 4/3 | holds |
| 4.6 `maynardM_five_ge` (8111bc5) | k=5 | ≈2.001162 | holds |
| 4.6 `four_lt_maynardM_105` (8111bc5) | 42 monomials | ≈4.0020698 | holds |
| 4.5 `infinite_many_primes_of_level` (8111bc5) | k=0, 1 | M₀=0, M₁=1 | holds |
| 5.2 linear sieve, Rosser (8111bc5) | F(1), f(3); Λ₂, Λ₃ | 2e^γ, 2e^γ·log 2/3; 1.834, 2.772 | holds |
| 5.3 Cₘ (8111bc5) | χ mod 3 on (0,2], (1,3] | 0, −1 | holds |
| 5.6 spins (8111bc5) | 3−t; α=1+8t, β=1+16σ(t) | −1, 1; Φ=1, −1 | holds |
| `joint_spin_sign_equidistribution` (8111bc5) | S=∅ | 1 | holds |
| `lattice_count_lt_successive_minima` (8111bc5) | unit square; d=1 | 9<18; 3=3 | d≥2 is needed and is stated |
| `lang_weil_uniform` (8111bc5) | x²−2y², p≡±3 mod 8 | 1 point against p | holds |

**Remarks on untouched text (no change requested).**
- ExplicitCharacterSumsAndSieves (#1948) consumes §2.9 and §§1.3, 1.6 and 5.2, but is absent from Downstream consumers. That list does not claim to be complete.

## Not verifiable

- DAVENPORT-51 (DOI 10.1112/jlms/s1-26.3.179) and LANG-WEIL-54 (DOI 10.2307/2372655): journal articles that are not in the sources cache.
  - I ran `sources fetch` against a scratch copy of the manifest, so the board manifest is unchanged.
  - The Wiley landing page returned HTTP 403, and the JSTOR landing page is on a host in no licence class. Both ended "no legal source found".
  - They await the human ruling that the reply to the previous review requested.
- Settled and cited by locator, so not re-requested:
  - uncertified: FIMR-ERRATUM-2015, BGS-10, DFI-1997 and SCHNEIDER-11;
  - waived: CHEN-73-CN, HR-SIEVE, HR-1974, RICHERT-1969, KM-16RANK-published and KM-KERNEL-PUBLISHED.

## Source issues

- **Error** in KED-chap-largesieve at Lemma 15.4 (Duality), §15.2 (HTML chapter, line 476): the source allows any real C. With no column indices, at least one row index and C<0, the hypothesis holds vacuously and the conclusion fails. It should assume C≥0. Affects nothing.
- **Misprint** in KED-ANT-16 at the proof of Lemma 16.5, §16.3 (HTML chapter, line 535): the source typesets the CRT frequency as a₁ divided by (q₁ + a₂/q₂). It should be the sum a₁/q₁ + a₂/q₂. Affects nothing.
