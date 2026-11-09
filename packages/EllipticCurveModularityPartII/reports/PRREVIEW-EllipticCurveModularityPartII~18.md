# Review of EllipticCurveModularityPartII (pull request #1491 at cd7c37d)

**Verdict:** needs changes

A full review of the folder at `cd7c37d` (184 changed lines since `1604bab`, the head review 17 read). The gate passes at this head, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. The three findings are all P3; none blocks. Review 17's R01–R03 are repaired; its R04 is carried as R03 below.

## Previous findings

- R01 (P1, Cartier's theorem handed to a barred supplier) — repaired. GroupSchemesOverABase no longer occurs in the folder (grep: 0 hits; gate `dropped=0`). §6.0f (README lines 782–784, 794) owns Cartier's theorem for group schemes locally of finite type over a field of characteristic zero, through Stacks Tags 047I and 047N (StacksProject lines 326 and 631–635), and names the affine Tau Ceti case and Mathlib's geometrically-reduced form. Every library name in the restored text exists at the pins (table below), and the pin has no characteristic-zero "free differentials ⇒ smooth" criterion (grep of Mathlib `RingTheory/Smooth`, `RingTheory/Kaehler`, `AlgebraicGeometry/Group` and Tau Ceti for `CharZero`: only the two affine Cartier declarations), so line 35's claim that §6.0f proves it is accurate. The **Stacks** reference entry is restored (line 1139).
- R02 (P3, docstring statability of §2.2) — repaired by the review's option (a). §2.2 now defines `deletionLevel` (Suggested.lean:153) on `WeierstrassCurve.algorithmicConductor` and `WeierstrassCurve.minimalDiscriminantIdeal` and states `removed_prime_bound` (Suggested.lean:162); the docstring (lines 30–34) says so and keeps Kraus realization unstated for want of N(E[ℓ]) and the Serre weight. The torsion carriers moved to a new §2.0 so that §2.2 can use them. Conventions (line 21) and the Tau Ceti contract (line 41) name Ogg's formula, NeronModelsAndSemistableAbelianVarieties §5.3e, for the identification with the arithmetic conductor; §5.3e at the head of #852 proves Ogg's formula in every residue characteristic.
- R03 (P3, E₂ locator) — repaired: line 41 reads "EisensteinSeries/WeightTwo/Basic"; `correctedE2` is at `EisensteinSeries/WeightTwo/Basic.lean:81` at `2fd255d`.
- R04 (P3, description never names EllipticModularityEffectiveComparisons) — not repaired; carried as R03.

## R01 (P3) — Downstream consumers cite §5.1 for carriers this head moved to §2.0

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 1113: "and §5.1's `GeometricTorsion`, `torsionRepresentation` and `FullRationalTwo` (EC.6)".

**Claim.** The roadmap disagrees with itself about where the geometric torsion carriers live.

**Witness.** `GeometricTorsion`, `torsionModule` and `torsionRepresentation` are defined in §2.0 (lines 308–326), and §5.1 (line 613) says "are defined in §2.0; this subsection adds the rational two-torsion predicates". Only `FullRationalTwo` and `RationalTwo` remain in §5.1 (line 615). ErdosProgressionPowers (#1336, head `3e1048c`) cites §5.1 for all three (its README line 662, row EC.6, and line 63); the sentence at line 613 is the old → new mapping that keeps that citation valid, but line 1113 contradicts it.

**Repair.** Line 1113: "§2.0's `GeometricTorsion` and `torsionRepresentation` and §5.1's `FullRationalTwo` (EC.6)". Tested: both names are backticked declarations of `Suggested.lean` (lines 112, 121, 230), so the gate's README-identifier check is unaffected.

## R02 (P3) — `deletionLevel` is also planned and declared by ErdosProgressionPowers, and neither roadmap names the owner of the Lean rendering

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` line 346 ("Define `deletionLevel E ℓ` as its rendering on the pinned carriers") with its four API bullets and four Checks (lines 348–358); `Suggested.lean:153–156`.

**Claim.** Two open pull requests each plan and declare the same object. ErdosProgressionPowers (#1336, head `3e1048c`) declares `deletionLevel` at its `Suggested.lean:79–82` with the same body (`padicValNat q M = 1 ∧ ell ∣ padicValNat q D` in place of `M.factorization q = 1 ∧ ell ∣ D.factorization q`; the two agree for every prime `q` and `M > 0`), and its README §1.7 (line 1124) defines it with its own API bullets (1126–1127) and Checks (1131–1133). Both READMEs give the notion to SerreWeightAndLevelOptimisation §6.1 (here line 346; there lines 46 and 409), which at the head of #1013 defines M₀ arithmetically with `Nat.primeFactors` and `padicValNat` and states no Lean name. So SerreWeightAndLevelOptimisation owns the number M₀, but the Lean rendering on the elliptic carriers has two owners and no citation between them.

**Witness.** ErdosProgressionPowers consumes this roadmap's §2.2 as EC.1 (its README line 657: "ell≤(√p+1)^((M₀+1)/6) … with p∥M and ell dividing the minimal discriminant valuation") and §2.2 is now stated on `deletionLevel`; so the rendering belongs with §2.2 here, and its copy in ErdosProgressionPowers §1.7 is a restatement, exactly as that roadmap already labels `HasFullRationalTwoTorsion` ("restated here only because this file cannot import another roadmap's module", its `Suggested.lean:85–87`) but does not label `deletionLevel`.

**Repair.** In this folder: in §2.2 (line 346) say that `deletionLevel` is this roadmap's rendering of SerreWeightAndLevelOptimisation §6.1's M₀ and is consumed with the removed-prime bound; in Downstream consumers (line 1113) list `deletionLevel` under EC.1 (§2.2) and say that ErdosProgressionPowers §1.7 restates it on the same carriers for its own statements. The change on the ErdosProgressionPowers side (cite §2.2 for `deletionLevel`, drop its API and Checks) belongs to that pull request; the worker should note it there. The merge order lists ErdosProgressionPowers (`ORDER.txt` line 53) before this roadmap (line 275) although its contract EC.0–EC.6 consumes this roadmap; this roadmap cites ErdosProgressionPowers only as a consumer, so its own dependency check is clean, and the placement is for that pull request to settle.

## R03 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

Carried from review 17's R04 (first raised in review 11). The description is unchanged on this point.

**Location.** The pull-request description never names EllipticModularityEffectiveComparisons.

**Witness.** EllipticModularityEffectiveComparisons (#1810) is at head `c001b88`, merge order line 285; this roadmap is at line 275.
- Its README line 1707 still says this roadmap "plans the same results under its own layer numbering".
- Its `Suggested.lean` re-declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153), `torsionModule` (:164) and `torsionRepresentation` (:169), and states the same isogeny-degree, j-table, Cartan and Lemos theorems (:186–298).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed, or cut down to a consumer citing §§1.4, 1.5–1.8, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18, before either pull request merges. Ownership stays here, since this roadmap is earlier in the order. No folder change.

**Settled, not re-raised.** `kato-labelled-pushforward` and `kato-labelled-reciprocity` (lines 67–69, 1109) are not in `design/plan.json`; GATE~11 H01 marked this not actionable in the package and the reason holds.

## Verified sound

### Gate, dependency check and elaboration

**Gate**, rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate additionally reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; inside it there are 3 files (README, `Suggested.lean`, `metadata.toml`).

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2259 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean` on `Suggested.lean` at Tau Ceti `2fd255d` / Mathlib `1b1ccf4` exits 0 in 18 s with exactly 15 `declaration uses sorry` warnings (lines 99, 104, 139, 162, 175, 186, 213, 219, 225, 239, 246, 257, 276, 284, 293) and nothing else.
- A scratch file with `#check @name` for all 27 declarations elaborates; every type agrees with `scratch/signatures.md`. No section binder is lost: `removed_prime_bound` carries `[E.IsElliptic]`, `[Fact ell.Prime]`, `3 ≤ ell`, irreducibility of `torsionRepresentation E ell`, `p ≠ ell`, `factorization p = 1` of the conductor norm and `ell ∣ factorization p` of the discriminant norm, as the README (line 360) states; `deletionLevel` keeps `[E.IsElliptic]`.
- **One-tactic probe** of the only new sorried theorem, `removed_prime_bound`: `simp_all` and `norm_num` leave the goal unsolved, `positivity` reports "not a positivity goal". For `deletionLevel`, `rfl` and `simp [deletionLevel]` do not reduce `deletionLevel E 0` to the conductor norm. No padding. The 14 other sorried theorems are byte-identical to `109d72d`, so review 14's probe stands.
- Imports: `import Mathlib` plus nine `TauCeti.*` modules, all existing at the pin (the new one, `TateAlgorithm/Reduction/Conductor`, defines `algorithmicConductor` at line 103).

### Library declarations opened at the pins

| Name | File and line | What it says |
|---|---|---|
| `WeierstrassCurve.algorithmicConductor` | Tau Ceti `TateAlgorithm/Reduction/Conductor.lean:103` | `∏ᶠ v, v.asIdeal ^ algorithmicOggExponent`, over a Dedekind domain with perfect local residue fields; docstring: Ogg's identification "is not made here" |
| `WeierstrassCurve.pow_dvd_absNorm_algorithmicConductor_iff` | same file `:266` | over ℚ, `p^n ∣ absNorm` iff `n ≤` the Ogg exponent at `(p)`: so `factorization p` of the norm is the Ogg exponent |
| `WeierstrassCurve.algorithmicConductor_smul` | same file `:134` | invariance under change of variables |
| `WeierstrassCurve.minimalDiscriminantIdeal` | Tau Ceti `MinimalModel/DiscriminantIdeal.lean:170` | `∏ᶠ v, v.asIdeal ^ localMinimalDiscriminantValuation` |
| `WeierstrassCurve.minimalDiscriminantIdeal_smul` | same file `:177` | invariance under change of variables (§2.2 Check 4) |
| `TauCeti.AlgebraicGeometry.smooth_of_grpObj_of_charZero` | Tau Ceti `AlgebraicGeometry/Group/Cartier.lean:32` | `[GrpObj G] [IsAffine G.left] [LocallyOfFiniteType G.hom]`, `CharZero k` ⇒ `Smooth G.hom` |
| `TauCeti.smoothCommHopfAlgProperty_of_charZero` | Tau Ceti `Algebra/AlgebraicGroup/Smooth/CharZero.lean:151` | finite-type commutative Hopf algebra over `CharZero k` is smooth |
| `AlgebraicGeometry.smooth_of_grpObj` | Mathlib `AlgebraicGeometry/Group/Smooth.lean:62` | variables `[LocallyOfFiniteType f] [GrpObj (Over.mk f)]` over `Spec (.of K)`, `K` a field; hypothesis `[GeometricallyReduced f]` |
| `CategoryTheory.GrpObj` | Mathlib `CategoryTheory/Monoidal/Grp.lean:43` | class extending `MonObj` |
| `AlgebraicGeometry.LocallyOfFiniteType` | Mathlib `Morphisms/FiniteType.lean:42` | class on a morphism |
| `AlgebraicGeometry.Smooth` | Mathlib `Morphisms/Smooth.lean:59` | class on a morphism |
| `KaehlerDifferential` | Mathlib `RingTheory/Kaehler/Basic.lean:148` | `Ω[S⁄R]` of an algebra |
| `TauCeti.EisensteinSeries.correctedE2` | Tau Ceti `EisensteinSeries/WeightTwo/Basic.lean:81` | R03 of review 17 |

The table of review 17 (the 13 Tau Ceti modular-form names of line 41 and the 8 Mathlib names of line 35) was not re-opened; those lines are unchanged apart from the additions checked here.

### Cross-roadmap citations resolved

| Citation | Where it resolves | Result |
|---|---|---|
| SerreWeightAndLevelOptimisation §6.1 "Reduced elliptic level M₀" | #1013 head, README line 1368: M₀ = M/∏q over `v_q(M)=1`, `ℓ∣v_q(Δ)`, `q=ℓ` included, ℓ ≥ 3 | matches §2.2 and Conventions line 23 |
| SerreWeightAndLevelOptimisation §§6.2–6.3 | lines 1400, 1418: newform at M₀ from a modularity witness; Lemma 2.1(i)–(ii) congruences | matches deletion-level-lowering (line 110) |
| SerreWeightAndLevelOptimisation §6.12 row p ≥ 5 | line 1671 table: §2.13 + §3.7 + §4.1 | matches optimized-weight-two-lift (line 108) |
| NeronModelsAndSemistableAbelianVarieties §5.3a, §5.3e, §5.3h | #852 head, lines 3489, 3628 (Ogg's formula `v(Δ_min) = f(E) + m − 1` in every residue characteristic), 3674 | matches lines 21, 41, 112, 114 |
| ErdosProgressionPowers EC.0–EC.6 | #1336 head `3e1048c`, README lines 651–662 | consumer; R01, R02 |
| EllipticModularityEffectiveComparisons | #1810 head `c001b88` | R03 |

`roadmaps resolve` found no unresolved citation or Lean name; `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id.

### Sources: the seeded sample

| Target | Source and locator | Lines in the cache | Supports the statement as written |
|---|---|---|---|
| 1.3 dimension comparison | Martin Theorem 1 and Definitions 1A–1F, p. 2 | Martin2003 69–90 | yes: k = 2 gives `N s⁺₀/12 − ν∞/2 + c₂(2)ν₂ + c₃(2)ν₃ + µ(N)` with c₂(2) = −1/4, c₃(2) = −1/3; Theorem 2 (p. 3, lines 113–114) is §1.4 |
| 1.7 H♯ | Kraus (9), p. 1144 | Kraus1997 279–283 | yes: H = max(F, G) with (7) and (8) at lines 240–244, 270–278; G uses ppcm(4, n) |
| 2.0 torsion carriers | no source locator; Tau Ceti `torsionGaloisAction` | — | definition; Checks recomputed below |
| 2.1 norm bound | BS proof of Lemma 2.2, p. 359 | BS2020 198–207 | yes: `ℓ ∣ Norm(p+1∓c_p)`, bounded by `(√p+1)^{2[K:ℚ]}` |
| 2.2 removed prime | BS (3) p. 358, Lemma 2.2 p. 359 | BS2020 169–175, 195–197 | yes: `p ≠ ℓ`, `p ∥ M`, `ℓ ∣ ord_p(Δ)` ⇒ `ℓ ≤ (√p+1)^{(M₀+1)/6}`; ℓ ≥ 3 is the standing hypothesis of §2 (line 165); `q = ℓ` not excluded in (3) |
| 4.1 local filters | Kraus Appendix II §8.1, p. 1160 | Kraus1997 1147–1154 | yes: the six rows (i)–(vi) are the README's six branches |
| 4.4 transfer of point counts | Kraus §3.3, (10)–(11), p. 1146 | Kraus1997 393–434 | yes: `l ≤ µ(M(ρ_p))/6`, good reduction at `l`, `a_l(E) = a_l(E′)`, 4 ∣ n_l |
| 4.7 full two-torsion realization | Kraus Theorem 4, p. 1144; §3.3 pp. 1145–1146 | Kraus1997 284–293, 435–441 | yes; the degree ≤ 2 isogeny paragraph is lines 435–441 |
| 5.4 full two-torsion irreducibility | BS Lemma 3.3 proof, p. 362 | BS2020 294–295 | yes: "full 2-torsion and ℓ ≥ 7 … irreducible", attributed to Mazur; ℓ = 5 is the roadmap's §5.2 addition |
| 6.1 nonsplit Cartan | Lemos (2.1), pp. 4–5 | Lemos2017 168–176 | yes: C_ns conjugate to `{diag(a, a^p)}` in GL₂(𝔽_{p²}) |
| 6.3 exact-divisor comparison | Lemos §3, p. 9; DM Prop. 7.1, pp. 18–19 | Lemos2017 329–330; DarmonMerel2001 608–613 | yes: `X⁺_sp(p) ≅ X₀⁺(p²)`; ω_f from `2πi f(τ)dτ` on `X₀(rp²)/w_p` |
| 6.5 winding class | Lemos Theorem 3.4, p. 10; DM Props 7.1–7.2, pp. 18–21 | Lemos2017 355–374; DarmonMerel2001 590–680 | yes: `e`, `I_e = Ann(e_A)`, `A_e = A/I′_e A`, `L(f,1) = 2πi∫₀^{i∞} f = ⟨f, e_A⟩` |
| 6.11 integrality of j | Lemos Prop. 2.1, p. 4; Theorem 2.3, p. 6 | Lemos2017 136–139, 223–226 | yes: Σ = {2,3,5,7,13}, no non-CM hypothesis in Prop. 2.1; Theorem 2.3 needs `End = ℤ` and p > 37 |
| 6.12 numerators | Lemos table, p. 6 | Lemos2017 236–241 | yes, all five polynomials |
| 6.14 finite sets | Lemos p. 7 | Lemos2017 249–250 and following | yes: `b = 1`, `t ∣ f(0)` |
| 6.15 integral values | Lemos pp. 6–7 | Lemos2017 243–250 | yes |
| 6.0f Cartier | Stacks 047I, 047N | StacksProject 326–330, 631–635 | yes: locally algebraic group scheme over char 0 is smooth; proof by Lemma 6.3 and Varieties 25.1 |
| 6.0b j-tables | Lemos p. 5 | Lemos2017 197–202 | yes, the seven values of `rational_isogeny_j_tables` |

### Adversarial table

Values computed by hand or by a short script on the Weierstrass formulas; discriminants are from the standard b₂, b₄, b₆, b₈ expressions.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `deletionLevel` body vs BS (3) | 11a1 `[0,−1,1,−10,−20]` | Δ = −161051 = −11⁵, M = 11; ℓ = 5: 5 ∣ 5 → M₀ = 1; ℓ = 3: 3 ∤ 5 → M₀ = 11 | sound (Check 1) |
| same | 14a1 `[1,0,1,4,−6]` | Δ = −21952 = −2⁶·7³, M = 14; ℓ = 3 → M₀ = 1; ℓ = 2: 2 ∣ 6, 2 ∤ 3 → M₀ = 7 (q = ℓ deleted) | sound (Check 2) |
| same, additive prime | 27a1 `[0,0,1,0,−7]` | Δ = −19683 = −3⁹, M = 27, `factorization 3` of 27 is 3 ≠ 1 → nothing deleted, M₀ = 27 | sound (Check 3) |
| same, junk ℓ | ℓ = 0, 1 | `0 ∣ n` iff `n = 0`, and `ord_q Δ ≥ 1` at bad q → M₀ = M; `1 ∣ n` always → all multiplicative primes deleted | sound (API bullet 4) |
| same, non-minimal model | 14a1 scaled by (7²x, 7³y) | discriminant 7¹²Δ; `minimalDiscriminantIdeal_smul` and `algorithmicConductor_smul` make `deletionLevel` equal on both models, 14 | sound (Check 4) |
| `removed_prime_bound` hypotheses | `factorization p = 1` with p = 4, 1, 0 | `Nat.factorization` of a non-prime index is 0 ≠ 1, so p is prime | sound ("forces p to be prime") |
| `removed_prime_bound` negative controls | 11a1, ℓ = 5, p = 11; 14a1, ℓ = 3, p = 2 or 7; 37b1 `[0,1,1,−23,−50]`, ℓ = 3, p = 37 | M₀ = 1 in all three; bounds (√11+1)^{1/3} = 1.628, (√2+1)^{1/3} = 1.342, (√7+1)^{1/3} = 1.539, (√37+1)^{1/3} = 1.920, all below ℓ; 11a1 has a rational 5-torsion point, 14a1 a rational 3-torsion point, 37b1 (Δ = 50653 = 37³) a rational 3-torsion point, so E[ℓ] is reducible in each case | sound: irreducibility excludes each |
| `removed_prime_bound` with M₀ = 11 | p = 2 | (√2+1)² = 3+2√2 = 5.828; gap 3−2√2 = 0.172 > 0 | sound (Example, Check 1) |
| 2.0 Galois action on `y² = x³ − 2` | σ(α) = ζα, τ(ζ) = ζ² | (στ)(α) = σ(α) = ζα → P₁; (τσ)(α) = τ(ζα) = ζ²α → P₂; distinct | sound (Checks 3–4) |
| 2.0 torsion sizes | n = 1, 2, 0 | E[1] = 0; E[2] has 4 points over ℚ̄ (y² = x³ − x: 3 nonzero plus O); E[0] = all points | sound |
| 2.1 `norm_bound` | K = ℚ(√2), λ = (3+√2), x = 3+√2, ℓ = 7 | embeddings 4.414 and 1.586, norm 9 − 2 = 7; B = 4.414: 7 ≤ 7 ≤ 19.49; B = 1.6: 2.56 < 7 | sound (Check 3) |
| 1.1 `localTerms` | (2,2), (3,2), (2,3) | (1/4, 0, −1, 1, 0); (5/9, 1, 1, −1, 0); (3/8, 0, 1, 0, 0) | sound |
| 1.2–1.3 `martinValue` | N = 1, 11, 13, 30, 35, 121 | 0, 1, 0, 1, 3, 4 | sound |
| 1.4 `martin_bound` | all N ≤ 3000 | 12·martinValue(N) ≤ N+1 with no violation; equality set has 110 members and equals {35} ∪ {primes ≡ 11 mod 12} | sound |
| 1.5–1.7 thresholds | N = 11, 1, 4, 35 | µ(11) = 12, F♯(11) = (√2+1)² = 5.828; µ(44) = 72, G♯(11) = (√12+1)² = 19.928 = 13+4√3; G♯(1) = G♯(4) = 4; F♯(35) = (1+√8)⁶ = 3148.6; F♯(1) = 1 | sound |
| 4.4 Check | N = 11 | µ(44)/6 = 12; eligible primes ∤ 22 up to 12 are 3, 5, 7; 4√7 = 10.58 < 19.93 | sound |
| 4.1 filters | (3,1,−1), (3,2,0) | 1−(3+1+1)X = 1−5X; 1−4X+3X² | sound |
| 5.4–5.5 | 4·5 = 20, 2·11 = 22, 2·7 = 14 | 20 and 22 absent from {1,…,19,21,25,27,37,43,67,163}; 14 present | sound |
| 6.1 orders | p = 11 | |𝔽₁₂₁ˣ| = 120, normalizer 240; |GL₂(𝔽₁₁)| = 120·110 = 13200; split normalizer 2·10² = 200, 200 ∤ 240 | sound |
| 6.5 period normalization | f = e^{2πiz}, e^{2πiz}+2e^{4πiz} | ∫₀^∞ f(it)dt = 1/(2π), W = i/(2π), 2πi·W = −1; second: 1/π, W = i/π, period −2 | sound; agrees with DM `L(f,1) = 2πi∫₀^{i∞}f` |
| 6.10 Check | p = 41 | |GL₂(𝔽₄₁)| = (41²−1)(41²−41) = 2755200 = 41·40²·42 | sound |
| 6.0b, 6.11 | 11a1 | j = −122023936/161051 = −2¹²·31³/11⁵, nonintegral | sound |
| 6.12 numerators | r = 2, 3, 5, 7, 13 | degrees 3, 4, 6, 8, 14 = r+1; constant terms 4096, 729, 125, 49, 13 | sound |
| 6.14 finite sets | signed divisors of f_r(0) | 26, 14, 8, 6, 4 signed divisors give 25, 13, 8, 6, 4 distinct values; t = 8 and t = −64 both give 1728 at r = 2; 64 ∈ set(5); set(13) = {−64·9·4079³, 576, 4096·27·19, 4096·27·19·991³} | sound |
| 6.0f Cartier counterexample | α_p = Spec k[x]/(x^p) | Ω free of rank 1, dimension 0: not smooth; char 0 needed | sound |
| 6.0f A_ω existence | E³, B₁ = E×E×0, B₂ = E×0×E | intersection E×0×0, proper of dimension 1, not affine: the affine Tau Ceti theorem does not apply, 047N does | sound |
| 6.0f B(d,H) | d = 1, H ≤ 985; d = 2 | 10⁷·985² = 9 702 250 000 000; 4·10⁷(985+4 log 2)² = 3.90·10¹³ | sound |
| 6.0b Check | y²+y = x³−x | #E(𝔽₂) = 5, #E(𝔽₃) = 7, gcd 1 | sound |
| Conventions Frobenius | y² = x³−x over 𝔽₅ | 8 points, a₅ = −2, 1+2T+5T² | sound |

Rows for the unchanged §§3.1–3.3, 4.2–4.3, 4.5–4.8, 5.0a–5.0b, 6.0a, 6.0c–6.0e, 6.0g–6.0h, 6.2, 6.4, 6.6–6.9, 6.13, 6.16–6.18 are those of reviews 14–17 (the Lean for them is byte-identical since `109d72d`); none of them is touched by a finding.

### Ownership against open work

- `roadmaps grep` for `deletionLevel`/"deletion level" finds only ErdosProgressionPowers (#1336) and this roadmap (R02).
- Cartier's theorem beyond the affine case: no admissible roadmap owns it (review 17's search, re-confirmed at the pins); §6.0f is the owner.
- EllipticModularityEffectiveComparisons (#1810) still duplicates Layers 1, 2, 5 and 6 (R03).
- Ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2: uncertified (paywalled), cited by its locator. Neither section changed at this head.

## Source issues

- none
