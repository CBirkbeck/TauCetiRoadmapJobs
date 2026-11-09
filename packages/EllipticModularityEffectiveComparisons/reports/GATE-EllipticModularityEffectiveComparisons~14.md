# GATE-EllipticModularityEffectiveComparisons~14: answers to the human review of `b26ab9f`

This answers one review: CBirkbeck, 2026-11-09T21:05:47Z, the incremental re-review of `b26ab9f`. It makes five points, numbered H01–H05:
- H01 is its one finding, F01. Its "Previous findings" entry R01 restates F01.
- H02–H04 are its three "Remarks, not findings", in order.
- H05 is its "Source issues" entry.

The "Not verifiable" entries ask for nothing. The review was read as data and contains no instruction beyond its findings. Nothing suspicious was found in it or in any other file read.

The repair is one commit on top of `b26ab9f`, not pushed: `c90f56d2` ("EllipticModularityEffectiveComparisons: review repairs (modular-curve, field and root notation in Unicode outside code spans)"). It changes 71 lines of `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md`, all notation. `Suggested.lean` is byte-identical to `b26ab9f`.

## H01 (CBirkbeck) — answered

The finding is not disputed. Every fact in it holds at the sibling's head `504db2f`, which has not moved since GATE~13, and closing #1810 or #1491 is the human decision the review names. Every item on the review's option-2 list is present at that head: §1.8 (README line 286), §6.0e (line 742, consumed here only as the declared gap `gap:modular-rank-zero` at README line 118), the minimal period subvariety in §6.0f, `norm_bound` and `removed_prime_bound` (`Suggested.lean` lines 139 and 162), and `FullRationalTwo` and `RationalTwo` (lines 230 and 234).

**One correction this folder needs under option 2, found while checking that list.** The module docstring of `Suggested.lean` says the removed-prime exponent bound (README §1.6) is not statable because the arithmetic conductor is missing. That is true at this branch's Tau Ceti pin and false at main's:
- This branch's `lake-manifest.json` pins Tau Ceti `358314d`. That revision has `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean` but no conductor.
- Main (`3090489`) and the sibling pin Tau Ceti `2fd255d`. That revision adds `WeierstrassCurve.algorithmicConductor` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm/Reduction/Conductor.lean`, line 103), which is the conductor by Ogg's formula. The sibling states its `removed_prime_bound` on it.

With the new import, the targeted build in this worktree fails with "bad import 'TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor'". The manifest is outside this job, so the repair is not committed. After the branch is rebased onto main, it consists of:
- **README.** Move the geometric-torsion carriers (`GeometricTorsion`, `torsionModule`, `torsionRepresentation`, with their API and Checks) from §4.0 to a new §1.0, so that the Lean file keeps README layer order. §4.0 keeps `CyclicIsogenyDegree`. No roadmap cites §4.0 of this folder (`roadmaps grep`).
- **README §1.6.** Define `deletionLevel` as the statement-level form of SerreWeightAndLevelOptimisation §6.1's M₀, with three Checks (the deletion-level row of the second table below), and prove `removed_prime_exponent_bound`.
- **Lean.** Add the two declarations below, and change the docstring to say Kraus's realization theorems lack the two-dimensional residual Artin conductor and Serre weight (Tau Ceti's `TauCeti.LocalFieldsRamification.artinConductorExponent` is for one-dimensional characters).

```lean
public import TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor

/-! ## Layer 1: removed-prime norm and exponent bounds -/
-- (GeometricTorsion, torsionModule, torsionRepresentation moved here from Layer 4)

def deletionLevel (E : WeierstrassCurve ℚ) [E.IsElliptic] (ell : ℕ) : ℕ :=
  let M := Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ E)
  let D := Ideal.absNorm (WeierstrassCurve.minimalDiscriminantIdeal ℤ E)
  ∏ q ∈ M.primeFactors,
    if M.factorization q = 1 ∧ ell ∣ D.factorization q then 1 else q ^ M.factorization q

theorem removed_prime_exponent_bound (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (ell : ℕ) [Fact ell.Prime] (hell : 3 ≤ ell)
    (hirr : (torsionRepresentation E ell).IsIrreducible)
    (p : ℕ) (hp : p.Prime) (hpell : p ≠ ell)
    (hpM : (Ideal.absNorm (WeierstrassCurve.algorithmicConductor ℤ E)).factorization p = 1)
    (hpΔ : ell ∣
      (Ideal.absNorm (WeierstrassCurve.minimalDiscriminantIdeal ℤ E)).factorization p) :
    (ell : ℝ) ≤ (Real.sqrt p + 1) ^ (((deletionLevel E ell : ℝ) + 1) / 6) := by
  sorry
```

This does not change the H01 picture. Under option 1 the correction is moot. Under option 2 it is the Lean half of the review's `removed_prime_bound` item. `norm_bound` is §§1.2–1.3 here, a step in §1.6's proof rather than a headline.

## H02 (CBirkbeck) — applied

ASCII mathematics outside code spans now uses the Unicode forms the rest of the README already uses. The remark's lines 955–995 were only part of it, so the fix covers the whole pattern, 71 lines:
- X0(d) → X₀(d): §§4.9–4.16 (lines 955–1043), §§5.10–5.11, 5.20, 5.23 and 5.25 (lines 1397–1411, 1557–1559, 1607–1609, 1633).
- X0,ns^+(r,p) → X_(0,ns)⁺(r,p): lines 1397, 1435, 1447, 1471 and 1473, matching X_ns⁺(p) at lines 1493 and 1498.
- Other symbols:
  - Nsp, Nns, B+ and B− → N_sp, N_ns, B⁺ and B⁻;
  - P1_Q → ℙ¹_ℚ, ℚ(ζ_p)^+ → ℚ(ζ_p)⁺, Q_q → ℚ_q;
  - Qbar → ℚ̄, End_Q → End_ℚ, 2Z → 2ℤ, SL2 → SL₂;
  - F_p, F_q, F_(q^n), F₂, F3, F5 → 𝔽_p, 𝔽_q, 𝔽_(q^n), 𝔽₂, 𝔽₃, 𝔽₅;
  - sqrt(x) → √x or √(…);
  - the cusp "infinity" → ∞, and "from 0 to infinity" → "from 0 to i∞" at line 1415, the winding path of the Conventions.

Headings, code spans and link targets are unchanged. The prose uses of "infinity" (lines 657, 675, 1322, the §5.16a heading and its Needs line 1514) and the source's own symbol X_split(p) inside the locator at line 1357 are kept.

## H03 (CBirkbeck) — answered

The pull-request description is outside this job's files. `Suggested.lean` is unchanged, so the description should say 17 theorems (the `sorry` warnings at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286, 298) and 10 definitions (7 `def`, 2 `abbrev`, 1 `instance`), not "fourteen" and "nine".

## H04 (CBirkbeck) — answered

`design/plan.json` is outside this folder. It contains `all-embedding-frobenius` once, while README.md and Suggested.lean contain it 0 times. The README uses exactly seven gap slugs (chen-winding-comparison, mixed-cusp-charts, modular-rank-zero, optimized-elliptic-weight-two, positive-characteristic-support, quantitative-abelian-periods, weight-two-local-reduction), so the intake drops that plan entry.

## H05 (CBirkbeck) — answered

Nothing in the roadmap depends on it. The README writes h(j)=log max(1,|j|) at line 1275 and evaluates j=0 to 0 at line 1268. In the source's own setting (bilu-parent-rebolledo line 686, a point that is neither cuspidal nor CM), j_E is a nonzero integer, because 0 is a CM j-invariant, so |j_E|≥1 and log|j_E| = log max(1,|j_E|) there.

## Build, gate and dependency check

- **Build** at `c90f56d2`: `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` reports "Build completed successfully (9205 jobs)". The only warnings are the 17 "declaration uses `sorry`" warnings at the lines listed under H03. An earlier attempt with the prepared H01 repair failed with the bad-import error quoted there and was reverted before this build.
- **Gate** at `c90f56d2`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout):

      depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

  It prints no UPWARD, CYCLE or `moved:` line.

## Lean signatures

The committed `Suggested.lean` is byte-identical to `b26ab9f`, so the worker's `signatures.md` is current: 27 declarations, none with a dropped section binder, and no `variable`, `include` or `set_option`. A `#check @name` pass over all 29 declarations of the prepared version was appended and built once. It stopped at the bad import before elaborating anything, so no elaborated signature exists for the two prepared declarations. Their binders are all explicit in their own signatures, and that pass should be repeated after the rebase.

## Ownership, citations and sources

- **Ownership.** The commit adds no object and no citation. For the prepared H01 repair, M₀ stays owned by SerreWeightAndLevelOptimisation §6.1 (head `0825d40`, "Reduced elliptic level M₀"), and `deletionLevel` is only its statement-level form. The conductor and minimal discriminant come from Tau Ceti at main's pin.
- **Ownership against the open pull requests** was checked for F01's objects at the sibling's head `504db2f`. `roadmaps grep --fixed 'EllipticModularityEffectiveComparisons'` names this folder only in the three consumer lists:
  - ModularSymbolsPadicLFunctions README line 2695;
  - FaltingsFinitenessAndIsogenyTheorems README line 2928;
  - ImaginaryQuadraticClassNumber README line 205.

  None cites §4.0 or any other section number of this folder. `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no revision-only id.
- **Citations.** No cross-roadmap citation changed. The renamed curve X_(0,ns)⁺(r,p) is lemos-2017's fibre product X₀(r)×_(X(1))X_ns⁺(p) (lemos-2017 lines 126–129).
- **Sources.** No new source, and `needs-references.toml` was not written.

## Adversarial pass

Committed changes (H02, notation only):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 line 389: p+1−2√p=(√p−1)² | p=2; p=1 (forbidden) | 3−2√2=0.171573=(√2−1)²; at p=1 both sides are 0, which is why §1.1 needs p≥2 | identity preserved | sqrt → √ |
| §1.3 line 413: p+1+2√p=(√p+1)² | p=2, 11 | 5.828427=(√2+1)²; 18.633250=(√11+1)² | preserved | sqrt → √ |
| §§2.1–2.2 lines 470, 494, 502: krausF, krausG with √(…) grouping | N=1, 4, 11 | krausG(1)=(√(6/6)+1)²=4; krausG(4)=4; krausG(11)=(√(72/6)+1)²=13+4√3≈19.93, the three §2.2 Checks; krausF(11)=(√(12/6)+1)²=5.8284 with g(11)=1. Reading √(I(N))/6 instead would give 1.98 at N=1 | grouping preserves the Checks | sqrt → √(…), SL2 → SL₂ |
| §3.14 lines 745–747: GL₂(𝔽₂) | order count; 𝔽₂× | (4−1)(4−2)=6, the "six-element group"; #𝔽₂×=1 | preserved | F₂ → 𝔽₂ |
| §§4.9–4.16 lines 955–1043: X₀(d) | the level sets | {14,15,20,21,24,27,32,36,49}, {39,65,91,125,169} and {26,35,50} unchanged; X₀(39) has 4 cusps (Σ_(d∣39) φ(gcd(d,39/d)) = 1+1+1+1), all rational | same curves | X0 → X₀ |
| §5.1 line 1201: End_(ℚ̄)(E)=ℤ versus End_ℚ(E)=ℤ | y²=x³−x | End_ℚ=ℤ but End_(ℚ̄)=ℤ[i], so the sentence still separates the two | preserved | Qbar → ℚ̄ |
| §5.11 line 1415: integral from 0 to i∞ | q+2q² (Normalization check) | ∫_(0 to i∞) 2πi(q+2q²)dz=−2=−L(f,1) with L(f,1)=1+2/2=2; a path 0 to ∞ along the real axis in z would run outside ℍ | i∞ is the Conventions' endpoint | infinity → i∞ |
| §§5.13–5.16 lines 1435–1473: X_(0,ns)⁺(r,p), ℚ(ζ_p)⁺ | p=11, 17 | [ℚ(ζ_p)⁺:ℚ]=(p−1)/2=5, 8; the curve is lemos-2017 line 129's fibre product, as before | same objects | notation |
| §5.20 line 1557: X₀(r)≅ℙ¹_ℚ with cusps at t=0, t=∞ | r=2 | X₀(2) has genus 0 and two rational cusps; j=(t+16)³/t has its poles at t=0 and t=∞ | preserved | P1_Q → ℙ¹_ℚ, infinity → ∞ |

Prepared H01 repair, applied only after the rebase onto main and not committed:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `deletionLevel E ℓ` | y²+y=x³−x²−10x−20 at ℓ=5, 3; y²+xy+y=x³+x+2 at ℓ=3, 2; y²+y=x³ at ℓ=3; junk ℓ=0 | Δ=−161051=−11⁵ and c₄=496, so M=11: the value is 1 at ℓ=5 and 11 at ℓ=3. Δ=−2160=−2⁴·3³·5 and c₄=−71, so M=30: the value is 10 at ℓ=3 (q=ℓ removed; never removing it gives 30) and 15 at ℓ=2. Δ=−27 and c₄=0, so M=27 (v₃(M)=3): the value at ℓ=3 is 27 (removing whenever ℓ∣v_q(Δ) gives 9). At ℓ=0 nothing is removed, since 0∣x only for x=0 and every bad prime has v_q(D)≥1 | agrees with SerreWeightAndLevelOptimisation §6.1's Checks pattern (q=ℓ included, higher exponents kept) | prepared |
| `removed_prime_exponent_bound`: irreducibility needed | y²+xy+y=x³+4x−6 at ℓ=3, p=2; y²+y=x³−x²−10x−20 at ℓ=5, p=11 | first curve: Δ=−21952=−2⁶·7³ and c₄=−215, so M=14 with 3∣6 and 3∣3, M₀=1, and (√2+1)^(1/3)=1.3415<3; (2,2) and (2,−5) are rational points of order 3, so E[3] is reducible. Second curve: M₀=1 and (√11+1)^(1/3)=1.6282<5, with rational 5-torsion | without `hirr` the statement is false; with it both are excluded | prepared |
| `removed_prime_exponent_bound`: other hypotheses | ℓ=2; p=ℓ; real power | ℓ≥3 is bennett-siksek-2020 line 165's range, and the M₀ exponent (M₀+1)/6 is a real exponent, as in line 197; ord_p M=1 already forces p prime, so `hp` is redundant (P3) | matches Lemma 2.2 | prepared |
| Import `TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor` | Tau Ceti `358314d` (branch) and `2fd255d` (main) | absent at `358314d`, so the build fails; present at `2fd255d`, with `algorithmicConductor` at line 103 and `pow_dvd_absNorm_algorithmicConductor_iff` at line 266 | statable only after the rebase | not committed |
| H01 facts at `504db2f` | the declarations and lines F01 names; ORDER.txt; ErdosProgressionPowers | bodies at sibling lines 198, 206, 219 and 257 equal those at 215, 158, 252 and 286 here; 884736, 5280 and 640320 occur 0 times in the sibling; ORDER lines 275 and 285; ErdosProgressionPowers names the sibling on 17 lines and this folder on 0 | duplicate stands | none (decision) |
