<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1361#issuecomment-6416442705 -->
Red team round 1 pass b (claude) of f72311b

Verdict: accepted

1. **F01** (P3) Six "Prove <snake_case>" identifiers are neither Lean declarations nor prose

   **Location.** README.md:554 "Prove newform_integral_of_small_primes."; :653 "Prove integral_ideal_sturm"; :691 "Prove kraus_prime_power_congruence."; :763 "Prove four_divisible_isogeny_realization"; :1338 "Prove proper_image_nonsplit."; :1483 "Prove the source's more general cyclic_isogeny_integral_j".

   **Claim.** The README reads as if these six names were declarations of this roadmap.

   **Witness.** `Suggested.lean` declares exactly 17 names (localTerms … lemos_uniform_surjectivity); none of the six appears there, and the six are not backticked, so the gate's README/Lean agreement check does not see them. `reports/FIX-PKG-EllipticModularityEffectiveComparisons~2.md` line 233 records that they "no longer denote declarations in this package", but the "Prove <identifier>" phrasing survived. An external reviewer searches the Lean file for `proper_image_nonsplit` and finds nothing.

   **Repair.** In each of the six sentences replace the identifier by the prose title of the target, e.g. README.md:554 "Prove the finite-prime recognition theorem:", :653 "Prove the integral ideal Sturm theorem", :691 "Prove Kraus's global prime-power congruence:", :763 "Prove the four-divisible two-isogeny realization", :1338 "Prove the nonsplit-containment theorem.", :1483 "Prove the source's more general integral-j theorem:". (If any is meant as a Lean target, declare it in `Suggested.lean` and backtick it; none is a headline, so deletion of the identifier is the right repair.)

2. **F02** (P3) Théorème 4 of Kraus is printed on p.1144, not pp.1145–1146

   **Location.** README.md:775 "(kraus-1997, Théorème 4 and proof, pp.1145–1146, kraus-1997 line 284.)"

   **Claim.** The statement and proof are on pp.1145–1146.

   **Witness.** kraus-1997 line 284 (the statement) lies between the page-6 marker (line 247, printed page 1144) and the page-7 marker (line 301, printed 1145); the proof (§3.3) is lines 384–441, printed pp.1146. The line locator is right; the page range is not.

   **Repair.** README.md:775: "(kraus-1997, Théorème 4, p.1144, kraus-1997 line 284; its proof §3.3, pp.1145–1146, lines 386–441.)"

3. **F03** (P3) §5.10a does not cite the squarefree Γ₀ special case its supplier already states

   **Location.** README.md:1374–1378 (§5.10a) and the supplier contract README.md:98 "Consume §§2.3, 6.3–6.4 for the actual optimal Eisenstein quotient … and §7.9 for formal immersion at the cusp".

   **Claim.** The geometric cuspidal-divisor torsion theorem is new here for every congruence curve.

   **Witness.** EisensteinIdealAndRationalTorsion §7.9 (open head, lines 981–984) states `squarefree_cusp_difference_torsion`: for squarefree N and geometric cusps c, c′ of X₀(N), [c]−[c′] is torsion in J₀(N)(ℚ̄), from Elkik's theorem specialised to Γ₀(N). The general statement (nonsquarefree levels, Cartan quotients, used in §5.16 on X₀,ns⁺(r,p)) is legitimately owned here, but the squarefree Γ₀ case is already owned and must be cited rather than re-proved.

   **Repair.** Add to README.md:1378, after "The argument retains ramification multiplicities in pullback and norm.": "For squarefree N the Γ₀(N) case is EisensteinIdealAndRationalTorsion §7.9's cusp-difference torsion theorem, consumed rather than re-proved; the general congruence-curve statement is the target here." Add "§7.9's squarefree cusp-difference torsion" to the *Needs:* line at README.md:1387 and to the §7.9 clause of README.md:98.

4. **F04** (P3) A *Needs:* line names §0.10 by a title it does not have

   **Location.** README.md:366 "Layer 0.10 Finite low-level composite check".

   **Claim.** §0.10 is titled "Finite low-level composite check".

   **Witness.** README.md:284 "### 0.10 Small composite levels". Every other entry of that *Needs:* line uses the section's exact title.

   **Repair.** README.md:366: replace "Layer 0.10 Finite low-level composite check" by "Layer 0.10 Small composite levels".

5. **F05** (P3) ClassFieldTheory Layer 13 is cited for a statement it does not make

   **Location.** README.md:102 "ClassFieldTheory Layer 13 supplies the triviality of finite characters of G_ℚ unramified at every finite prime"; README.md:863 (§4.1 *Needs:*) "`TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`".

   **Claim.** Layer 13 states that every finite-order character of G_ℚ unramified at all finite primes is trivial.

   **Witness.** ClassFieldTheory README (main) Layer 13, lines 1799–1872: it defines `rayClassField`, `hilbertClassField` and `narrowHilbertClassField` and proves `gal_rayClassField_equiv_rayClassGroup`; it nowhere states the ℚ-specialisation. The needed fact follows from the narrow ray-class correspondence at the narrow modulus together with the trivial narrow class group of ℚ, which is an extra (easy) step not named in the README.

   **Repair.** README.md:102: "ClassFieldTheory Layer 13's narrow Hilbert class field and `gal_rayClassField_equiv_rayClassGroup`, with the trivial narrow class group of ℚ, give the triviality of finite characters of G_ℚ unramified at every finite prime; thus …". Same wording in the §4.1 proof route at README.md:859 ("the rational class field has no nontrivial everywhere-unramified finite extension" → "the narrow Hilbert class field of ℚ is ℚ").

Reviewed: `packages/EllipticModularityEffectiveComparisons/README.md` (1675 lines, every line) and `packages/EllipticModularityEffectiveComparisons/Suggested.lean` (178 lines, every line) at head f72311b (checkout verified at that commit; `git diff --stat origin/main...HEAD` touches only the package folder: README, Suggested.lean, design/plan.json gaps list, metadata.toml, reports, sources.toml). No pass-a red-team report exists on the pull request or in `reports/` at the time of this pass (the last comment is the round-4 acceptance), so there are no pass-a findings to confirm. The board check run on f72311b is `success`; I ran no Lean.

Five findings, all P3; none blocks. The one P1-class issue I found (a second open roadmap building the same six layers) is the item the round-2 repair marked `not actionable in this package`; I confirm its reason below and do not re-raise it.

## Settled finding, confirmed but not re-raised

`reports/FIX-PKG-EllipticModularityEffectiveComparisons~2.md` F02 (P2, "not actionable in this package: maintainer must resolve duplicate sibling roadmap"). The sibling EllipticCurveModularityPartII (open PR #1491, same author, draft, updated 2026-10-26) plans the same six layers with the same objects and partly the same Lean names (`localTerms`, `martinValue`, `newDimension`, `GeometricTorsion`, `torsionModule`, `torsionRepresentation`, `cyclic_isogeny_degrees`, `lemos_surjectivity`, §6.0c geometric cuspidal torsion, §6.0f split Cartan, §6.0g Serre's exceptional images). This is defect class 6 ("two open pull requests that each build it"). I confirm the recorded reason: `merge-order/ORDER.txt` lists EllipticModularityEffectiveComparisons at line 188 and EllipticCurveModularityPartII at line 189, so this package is the earlier roadmap and hence the owner; the only consumer, ErdosProgressionPowers (rev 1336, lines 73, 530–555), cites `EllipticModularityEffectiveComparisons EC.0–EC.5`; and no `Suggested.lean` declaration here carries a fully qualified name of the sibling (different namespaces). The repair belongs to the sibling (repoint its Layers 1–6 to this roadmap) or to the maintainer; nothing in this package is wrong because of it. I do not re-raise it.

## Depcheck

Run from the board checkout with the brief's command:

```text
depcheck: 56 roadmaps, 654 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.

## Adversarial pass (computed values)

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `localTerms` table (Suggested.lean:42–56) vs Martin Defs 1A–1D (martin-2003 lines 77–88) | (0,0); (2,2); (3,2); (2,3); (4,1); (4,0) | (1,1,1,1,1); (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); zero vector; five ones | all five README Checks reproduce; every table row matches the source |
| `martinValue` = newform dimension | all N ≤ 3000: Σ_{d∣N} τ(N/d)·martinValue(d) vs genus of X₀(N) from the index/elliptic-point/cusp formula | 0 mismatches; martinValue(1,11,30,35,64) = 0,1,1,3,1 | the Lean table recovers the exact Γ₀ newspace dimension; §0.2/§0.5 Checks and the N=64 Example hold |
| `martin_sharp_bound` (Suggested.lean:77–79) | all N ≤ 3000 | violations of 12g ≤ N+1: none; equality set = {35} ∪ {primes ≡ 11 mod 12} exactly | matches Martin Theorem 2 (martin-2003 line 113) |
| §0.8–§0.15 lemma ranges | primes < 3000; composite ω≤2 with N≤1521; p⁶∣N; ω≥3 with two primes >5; gcd(N,6)>1 with a prime >41 (both N<1548 and 1548≤N≤3000); residual family 2^a3^b5^c p^d | no violation; §0.10 equality only at 35; residual family: 11,250 tuples, 10,125 levels, least margin N−12g = 18 (at N=30) | every finite claim verified; cutoffs 1521=39², 1548=12·129 reproduce Martin's proofs |
| §0.9–§0.13 inequalities | symbolic | φ≤N−√N ⇒ 12g ≤ N+40−√N < N+1 iff N>1521; N/2^ω ≥ p^e/2 ≥ 16p; 77p₀/8; 2N/3+14N/43+12 = N−N/129+12 | arithmetic agrees with martin-2003 lines 787, 796, 813, 833 |
| Conventions normalisation Checks (README.md:30–32) | y²+y=x³−x over 𝔽₂; f=q+2q²; width 11 | #E=5, a₂=−2, X²+2X+2, roots −1±i, product 2; L(f,1)=2, ∫2πi f dz = −2, W=i/π, −2πi·W=2; 11dt+22t dt | consistent with L(f,1)=−2πi W(f) and ∫₀^{i∞}2πi f dz = −L(f,1) |
| §1.1 nonvanishing | p=1,c=2,s=1 (forbidden) ; p≥2 | α=0 at p=1; p+1−2√p=(√p−1)²>0 for p≥2 | hypothesis p≥2 necessary and sufficient |
| §1 Examples norms | K=ℚ(√2), c=√2; c=100−70√2 | N(3−√2)=7; embeddings 1.005 and 198.995; N(3−c)=97²−2·70²=391 > (√2+1)⁴≈33.97 | single-embedding hypothesis refuted as the README says |
| §2.1–§2.3 thresholds | N=1,4,11,35,16 | I(4)=6, I(11)=12, I(16)=24, I(35)=48, I(44)=72; F(11)=3+2√2, G(1)=G(4)=4, G(11)=13+4√3, G(16-wrong)=9, F(35)=(1+√8)⁶ | all Checks reproduce Kraus (7)–(9) (kraus-1997 lines 240–283) |
| §3.4 bound | good trace, multiplicative sign | 4√q ≤ (√q+1)² ⟺ 2√q ≤ q+1; q+1+2√q=(√q+1)² | both branches hold |
| §3.7 filters vs Kraus App. II (lines 1149–1154) | the six rows; (2,0,3), (2,2,0), (3,1,−1), (3,2,0) | (1−3X+2X²,1); (1,1); (1,1−5X); (1,1−4X+3X²) | identical to the source's V_l, V′_l |
| §3.8 odd Eisenstein series | n=2m, 4m, 2^a m | 24σ₁(2^a m)−72σ₁(2^{a−1}m)+48σ₁(2^{a−2}m)=0; E₂ anomaly −1+3/2−2/4=0 | g is a holomorphic weight-2 form on Γ₀(4) with the stated Euler factor |
| §3.15–§3.16 two-isogeny repair | (a,b)=(3,1), (0,−1), (0,2) | quotient y²=x(x²−6x+5), disc 16, roots 1,5; a²−4b=4 square; #C(𝔽₅)=2 for y²=x(x²+2) | all three Examples at README.md:799 reproduce |
| §3.18 M₀=N adapter | additive at ℓ (ℓ²∣M) as negative control | M₀ keeps ℓ², N(E[ℓ]) has no ℓ | the good/multiplicative-with-ℓ∣v_ℓ(Δ) hypothesis is exactly what forces equality; Néron §5.3h (open head, lines 3380–3390) gives the away-from-ℓ formula for ℓ≥5 |
| §3.18 weight-two at ℓ=5,7 | e=4 (ℓ=5), e=6 (ℓ=5,7) additive potentially good | tame inertia ω^{(ℓ−1)/e}: e=ℓ−1 gives ω⊕1; e=ℓ+1=6 at ℓ=5 gives ψ₂⊕ψ₂⁵ | Serre weight two with additive reduction exists at 5 and 7, so the ℓ≥11 restriction of gap:weight-two-local-reduction and kraus-1997 lines 210–212 is necessary |
| §4.3–§4.5 trace lists | q=3: a∈{−3,…,3}; q=5: a∈{−4,…,4}; A₀=2, A₁=a, A_{n+1}=aA_n−qA_{n−1} | A₁₂(q=3) ∈ {1458,−1358,658}; 1+3¹² minus each: primes {2,3,19,97},{2,3,5,37},{2,7,13}; q=5 union {2,3,5,7,13,17,31,37,61,157,229}; 3⁴+3⁸: {2,3,5,11,17}; A₁,A₂ at (3,1) = 1,−5 | equals mazur-1978 lines 976, 1012, 1019, 1025 and the README's Examples (base traces 0,1,2,3 ↦ 1458,−1358,658,1458) |
| §4.6 inertness and Minkowski | r=11; r≡7 mod 8 | 2√11/π≈2.11 < 11/4; (1+r)/8 and (9+r)/8 consecutive, one odd, both < r/4 for r≥11; (p/N)=−1 ⟺ (−N/p)=−1 for N≡3 mod 4 | matches mazur-1978 lines 1027–1033 |
| §4.7 list | r prime | {2,3,5,7,13} ∪ {11,17,19,37,43,67,163} | twelve primes, Suggested.lean:120 |
| §4.8 minimal positive-genus levels | Mazur p.131 list | {169,91,65,39,26,49,35,21,14,125,15,20,50,27,36,24,32} | 17 levels, identical to README.md:939 |
| §4.9 Checks | d=20, 14, 27 | cusps 6/4/2 rational; #X₀(20)(ℚ)=6, #X₀(14)(ℚ)=6, #X₀(27)(ℚ)=3 ⇒ 0, 2, 1 | consistent with BNP Table 1.1 (lines 63–70) |
| `rational_cyclic_isogeny_degrees` (Suggested.lean:124–126) | n=0 (zero map), n=1, n=20, 28 | degree is positive (pinned `Isogeny.degree` is a finrank of a finite extension; the zero map is not an `Isogeny`); 1 allowed; 20,28 excluded | matches Mazur–Kenku; the Lean set is {1..19}∪{21,25,27,37,43,67,163} |
| `rational_two_uniform_irreducibility` (Suggested.lean:130–133) | ℓ=7 (14 allowed), ℓ=11 (22 forbidden); CM curve y²=x³−x | 2ℓ∈list ⟺ ℓ≤7 | bound ℓ≥11 is sharp and uniform; BS Lemma 3.5 proof (line 334) uses exactly this |
| `full_two_uniform_irreducibility` (Suggested.lean:137–140) | ℓ=3 (12 allowed; y²=x(x+5)(x+32), P=(4,36)); ℓ=5 (20), ℓ=7 (28) | 4·9·36=36²; slope 7; 2P=(4,−36); 4ℓ∈list ⟺ ℓ≤3 | cutoff ℓ≥5 is sharp; the §4.19 cyclic-4 kernel argument verified (φ̂⁻¹(T′) has an element x with 2x=φ(Q)≠0) |
| `SplitNormalizerImage`, nonsplit predicate orders | p=11, p=2, p=13 on y²=x³−x | #GL₂(𝔽₁₁)=13200; split normaliser 200; nonsplit 240; pair stabiliser at p=2 has order 2 of 6; 13=(3+2i)(3−2i) | all §5.0 Checks reproduce |
| `split_normalizer_exclusion` (Suggested.lean:164–166) vs BPR | p=11, 13, 17 | BPR Theorem 1.1 (line 104): p>11, p≠13 | Lean hypotheses `11 < p`, `p ≠ 13` equal the source; not narrower |
| §5.3a numbers | d=1,2; CM control 10⁷+i on y²=x³−x | 10⁷·985²=9 702 250 000 000; 2√10⁷(985+4log2)≈6 247 222 < 6 895 000; 4·10⁷·989²=39 124 840 000 000 < 10¹⁴+1; ker(a+bi) cyclic iff gcd(a,b)=1 | Checks reproduce; non-CM hypothesis shown necessary |
| §5.3c Runge values | p=5, 17 | 48.033, 83.790 | reproduce |
| §5.6 Check | p=17, D=3, 4 | χ_{−3}(17)=−1 (17≡2 mod 3), χ_{−4}(17)=+1; H_{−3}=X, H_{−12}=X−54000, resultant 1 | reproduces |
| §5.12 orders | (r,p)=(5,11), (2,3) | #PSL₂(𝔽₁₁)=660, no order-11 quotient; PSL₂(𝔽₃)≅A₄ has an order-3 quotient | matches darmon-merel lines 532–550 |
| §5.15, §5.17 prime bound | p≥11, q≡±1 mod p prime | q≥2p−1≥21>13 | q ∤ 6r for every r∈{2,3,5,7,13} |
| §5.19–§5.22 | r=2 divisors of 4096; r=13 | 26 signed divisors, f(8)/8=f(−64)/(−64)=1728 (25 values); lemosIntegralJ(13) = {−2⁶3²4079³, 2⁶3², 2¹²3³19, 2¹²3³19·991³} | cardinalities 25,13,8,6,4 equal lemos-2017 lines 253–260 |
| §5.25 j-values | r=11,17,37 | −11·131³, −2¹⁵, −11²; −17²·101³/2, −17·373³/2¹⁷; −7·137³·2083³, −7·11³ | equal lemos-2017 lines 197–202 |
| §5.1 CM values and Eisenstein orders | r=19,43,67,163 | (−96)³=−884736, (−960)³=−884736000, (−5280)³=−147197952000, (−640320)³=−262537412640768000; numerators of (r−1)/12 = 7, 11, 27; genera 3, 5, 13 | agree with mazur-1978 lines 14–19 and IQCN H3.5 line 138 |
| `GeometricallyNonCM` Checks | j=1728, j=0, 11a1 | (x,y)↦(−x,iy) order 4; cube-root automorphism order 3; Δ=−11⁵, j=−2¹²·31³/11⁵=−122023936/161051 nonintegral | reproduce |
| §4.0 Checks | y²=x³−3x−1; y²=x³−x+1; y²=x³+2; y²=x³+1 over 𝔽₅ | discriminants 81 (square ⇒ C₃), −23 (S₃); (0,±√2) are 3-torsion (ψ₃=3x(x³+8)); j=0 supersingular at 5≡2 mod 3 | reproduce |

## Lean signatures versus README (mechanical comparison)

I did not elaborate the file (the brief forbids Lean here); the board check run on f72311b succeeded and `reports/FIX-PKG-EllipticModularityEffectiveComparisons~4.md` records exit 0 with exactly eight `declaration uses sorry` warnings at lines 72, 77, 118, 124, 130, 137, 164, 172, which are the eight `sorry` theorems. I compared each of the 17 declarations' binders with the README by reading:

- `localTerms`, `martinValue` (Suggested.lean:42, 60): total functions, zero branch at N=0 and nonprime base as README §0.1–§0.2 say; exponent-zero test precedes the primality test.
- `newDimension` (66): `[NeZero N]` carried explicitly; carrier `TauCeti.cuspFormsNew N 2 ⊓ cuspFormCharSpace 2 1`, matching the pinned `cuspFormsNew (N) [NeZero N] (k : ℤ)` (Newforms/Basic.lean:202) and `cuspFormCharSpace (k) (χ)` (DiamondOperators.lean:279).
- `martin_dimension_formula`, `martin_sharp_bound` (72, 77): equality in ℚ via cast; bound and iff in ℕ; README §0.5, §0.16.
- `GeometricTorsion` (85): `AddSubgroup.torsionBy … (n : ℤ)` matches the pinned `torsionBy (A) (n : ℤ)` (Torsion/Basic.lean:986) and `torsionGaloisAction (N : ℤ)` on `(W⁄K).toAffine.Point` (Galois.lean:64–66), with `⁄` the pinned `baseChange` notation.
- `torsionModule` (96): `AddSubgroup.torsionBy.zmodModule : Module (ZMod n) A[n]` at the pin (Torsion/Basic.lean:1010) is a `def`, so declaring it as an instance here is needed.
- `torsionRepresentation` (101): real body; `toZModLinearMap` is `(n) (f : M →+ M₁)` at the pin (ZMod.lean:81); `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (Irreducible.lean:29), as README §4.0 says.
- `CyclicIsogenyDegree` (90): uses pinned `Isogeny.degree : ℕ` (Degree.lean:99), `Isogeny.map` (BaseChange/Basic.lean:212), `Isogeny.ker : AddSubgroup` (Kernel.lean:75); kernel taken after base change to ℚ̄ as README §4.0 states.
- `GeometricallyNonCM` (147): `1` and `n • ·` on `Isogeny.Hom W W` come from `MonoidWithZero (Hom W₁ W₁)` (Hom/Basic.lean:325) and `SMul ℤ` (Hom/Add.lean:172); README line 46 attributes the ring structure to Hom/Add.lean, while `One` lives in Hom/Basic.lean (imported transitively) — not a defect.
- `SplitNormalizerImage` (155), `split_normalizer_exclusion` (164), `lemos_uniform_surjectivity` (172): binders `hp : p.Prime`, `11 < p`, `p ≠ 13`, `GeometricallyNonCM`, `1 < n`, `37 < p` match README §§5.7, 5.28 and the sources.
- No `lemma`, no `set_option`, no `#check`, no `True` placeholder, no sorry'd data, no pull-request numbers or process words in README or docstrings. Every Lean name appears backticked in the README; every backticked name of this roadmap's own in the README is declared.

Headline theorems from the README's Summary: Martin's sharp bound (stated), removed-prime exponent bound (not statable: no elliptic conductor at the pins — Mathlib and TauCeti have no conductor for Weierstrass curves; the module docstring says so), Kraus's rational and full-two-torsion realizations (not statable: residual Artin conductor and Serre weight absent; said so), the two uniform irreducibility bounds (stated), Lemos's surjectivity (stated), with the Mazur and Mazur–Kenku classifications and the Bilu–Parent–Rebolledo exclusion stated as deep intermediate results. No padding: no declaration follows in one tactic, restates a definition, mirrors a Check or computes a value. §5.8's nonsplit-containment theorem (Lemos Theorem 2.3) would be statable with one more simple predicate; it is not a Summary headline, so I record it here rather than as a finding.

## Verified sound

- Declarations read: 17 of 17 (`Suggested.lean`); README targets read: all 100 numbered subsections of Layers 0–5 plus Conventions, supplier contracts, Examples, Dependencies, Downstream consumers, References.
- Locators verified against the cached extractions (41): martin-2003 lines 69–90, 113, 405–455, 747–840 (Theorems 1–2, Defs 1A–1F, §2 (13)–(15), Lemmas 16–22, proof of Theorem 2); kraus-1997 lines 200–212, 239–297, 386–441, 1060–1108, 1113–1154 (conditions (a)–(c) and the p≥11 remark, (7)–(9), Théorèmes 3–4, Lemme 1, App. II Props 1–2, Corollaire, filters); bennett-siksek-2020 lines 164–206, 294–296, 331–335 ((3), Theorem 3 with ℓ≥3, Lemmas 2.1–2.2, Lemma 3.3, Lemma 3.5); mazur-1978 lines 11–41, 81–108, 803–822, 842–849, 940–969, 974–976, 979–1033 (table, Theorem 1, p.131 list, Lemmas 5.2–5.3 with t, Prop 5.1, §6 good-reduction argument, (6.3), Prop 6.3, Cor 6.1, Theorem 7.1, k=0, 1/3, 1/2); banwait-najman-padurariu lines 55–73; lemos-2017 lines 44–46, 100–110, 136–144, 168, 187–264, 325–380; bilu-parent-rebolledo lines 104–105, 328–330, 625–659, 847–852, 971–977; serre-1981 lines 2525–2541; darmon-merel lines 525–550, 602, 670–697, 737–775; gaudron-remond lines 168–180, 1539–1543, 1598, 1720–1722; bilu-parent-split lines 432–444; elkik-1990 lines 29–31, 46–49; mazur-1977 lines 73–92, 300–576. Page numbers were checked against the `=== page N ===` markers; the only discrepancy is R02.
- Checks and Examples tested by computation: 78 (every numerical Check and Example of Layers 0–5, grouped in the table above); none false, vacuous or a restatement. Every definition (Lean: 8; README-only: krausF/G/H, krausLocalFilters, lemosNumerator, lemosIntegralJ, NonsplitNormalizerImage) has at least three discriminating Checks.
- Sibling and supplier citations checked at the open heads (via the roadmap index) or on main: 132 section and layer tokens across 22 roadmaps; every cited section exists with the cited content: SerreWeightAndLevelOptimisation §§2.8, 4.8, 6.1–6.3 (M₀ with q=ℓ included, ℓ≥3 lift, ± (q+1) congruence); NeronModels §§5.2, 5.3h (ℓ≥5, q≠ℓ residual conductor formula), 5.4, 6.4d; ModularCurvesPartII §§3.8, 4.1–4.2, 4.8, 5.2, 5.5, 9.1, 9.5–9.7, 10.1–10.3, 13.1–13.3, 14.11–14.12, 14.15, 16.2–16.6, 17.3; AutomorphicGaloisRepresentations §§6.1, 6.4; DeligneWeightsAndPurity Layer DWP.1 §§1.1–1.4; EisensteinIdealAndRationalTorsion §§2.3, 6.3–6.4 (A_Eis(ℚ)≅ℤ/n, n the numerator of (P−1)/12), 7.9 (formal immersion in every residue characteristic other than 2), 8.9; HeightsRationalPointsAndObstructions §§1.4–1.7, 1.13–1.15, 1.15b–1.19 (torsion injects for e<p−1; Kummer map (0,0)↦d); ImaginaryQuadraticClassNumber H1.1–H1.4, H3.5 (the six γ₂ values), H3.6 (order recovery); ComplexMultiplicationAndExplicitReciprocity §§3.1, 5.1–5.5; ClassFieldTheory Layer 13 (see R05); ModularSymbolsPadicLFunctions §§0.6–0.8 (rational Drinfeld–Manin splitting at Γ(N)), 1.1–1.2; MordellLawrenceVenkatesh §8.11; EulerSystemsAndKolyvaginSystems §§4.7, 5.13; ArakelovGeometryAndAbelianHeights §§1.12, 4.4 (½ log d), 5.9 (h_st ≤ h(j)/12+3); FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.7; AlgebraicModularFormsAndSerreWeights R15.2, R15.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.5; ArithmeticGaloisRepresentations §§2.3–2.4, 3.1–3.6, 4.2–4.5, 5.1, 6.1–6.4; EllipticCurveModularity R29.1, R29.3–R29.6; EllipticCurves Layers 1–7; Chebotarev Layer 10; ModularForms Layers 0–4 (including the "Bad-prime eigenvalues" milestone), 6, 8, 8G, 10, 10C. All are earlier in `ORDER.txt` or on main; no citation of a later roadmap.
- Declared gaps (8): slugs identical in `design/plan.json` and the README's supplier contracts; each names a supplier and section that exists at the supplier's head; each `needs` sentence is single-purpose with explicit hypotheses; none asks for what Mathlib, Tau Ceti or an earlier roadmap already provides (checked: no elliptic conductor, Serre weight, mixed modular Jacobian or quantitative period inequality at the pins or in the cited suppliers).
- Pinned declarations grepped at the pinned Mathlib (6b7abb3) and Tau Ceti (a91d3aa) checkouts: all 29 names cited in the README exist at the cited files (`Nat.prod_factorization_pow_eq_self`, `ArithmeticFunction.moebius_apply_prime_pow`, `moebius_mul_coe_zeta`, `sigma_zero_apply`, `Nat.totient_eq_mul_prod_factors`, `Algebra.norm_eq_prod_embeddings` and `isIntegral_norm` (Transitivity.lean), `Algebra.norm_ne_zero_iff`, `Ideal.absNorm_mem`, `Ideal.absNorm_dvd_norm_of_mem`, `Algebra.coe_norm_int`, `card_algHom_le_finrank`, `Representation.IsIrreducible`, `AddMonoidHom.toZModLinearMap`, `AddSubgroup.torsionBy.zmodModule`, `NumberField.exists_ideal_in_class_of_norm_le`, `CongruenceSubgroup.Gamma0`, `TauCeti.cuspFormsNew`, `cuspFormCharSpace`, `TauCeti.cuspFormsNew_inf_cuspFormCharSpace`, `TauCeti.cuspFormCharSpaceOneEquiv`, `TauCeti.ModularForm.eq_of_sturm_bound` (with its `DiscreteTopology strictPeriods` and strict-width hypotheses), `HeckeRing.GL2.Newform`, `WeierstrassCurve.torsionGaloisAction`, `TauCeti.Isogeny`, `.degree`, `.ker`, `.map`, `.Hom` with its `Add.lean` instances).
- Ownership by object: searched main, the board packages (including the design-stage GeometricFreyMazur, ModularCurvesPartIII, EllipticCurvesPartII) and the open-head index for Martin's newspace formula, Kraus's thresholds and realizations, the Mazur and Mazur–Kenku classifications, Kenku's five levels, Manin–Drinfeld, Darmon–Merel winding quotients, Bilu–Parent–Rebolledo, Serre's Lemme 18′ and Lemos. Apart from the settled sibling above and the special case in R03, no earlier roadmap states these objects; EffectiveDiophantineMethods (ORDER line 202, later) consumes BPR as an input and is not an owner.
- Policy: `theorem` throughout; no `set_option`; no `lemma`; every target has a source locator; no computational algorithm (the finite sieves of §§0.10, 0.14, 0.15, 5.6 are stated as finite universal arithmetic statements, not procedures); the package is only its folder.
- Build order: every *Needs:* entry points to an earlier subsection of this roadmap, a named supplier section, a declared gap, or a pinned declaration; no forward reference inside a layer (the §5.10/§5.10a → §5.12 → §5.13 → §5.15–§5.17 → §5.18 → §5.28 chain is acyclic).

## Not verifiable

- kenku-1979, kenku-1980a, kenku-1980b, kenku-1981, kenku-169-corrigendum, kenku-1982: settled as uncertified; cited by published locator only (§§4.10–4.17). The cusp-only claims at 39, 65, 91, 125, 169 and the composite-extension exclusion are checked only against banwait-najman-padurariu lines 55–73 and mazur-1978 lines 97–108.
- §§5.26–5.27 (surjectivity for every p>37 at the finitely many j-values): Lemos verified these by database; the README makes them exhaustive targets. I checked the j-value lists against the source, not the all-primes bounds themselves.
- The published-version page numbers of lemos-2017 (Trans. AMS) and gaudron-remond (journal) are not claimed by the README; only the arXiv v2/v1 locators were checked.
- Darmon–Merel's author-version pagination: the README's "pp.20–21" for the proof of Proposition 7.1 (README.md:1391) spans the author-version pages 19–21 (statement at line 602, page 19); the line locator 614 is inside the proof, so I do not count this as a defect.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f72311b", "job": "RT-EllipticModularityEffectiveComparisons~1b", "model": "fable", "worker": "fable-rt232"} -->
