# Review of EllipticCurveModularityPartII (pull request #1491 at 504db2f)

**Verdict:** needs changes

This is an incremental re-review of the 2 changed lines since `86f110e`. The change is one README line, the opening paragraph of §2.2 (line 346): "the M₀ of §6.1 there" now reads "the M₀ of SerreWeightAndLevelOptimisation §6.1".
- This resolves the ambiguity the previous review raised as a remark: Bennett–Siksek also has a §6.
- The new sentence is correct, and the change introduced no new defect.
- `Suggested.lean` is byte-identical to `86f110e`.
- The gate passes, the dependency check reports 0 problems, and the file elaborates with `sorry` as its only warning.

The only finding is the carried P3 about the pull-request description, which is non-blocking. No change to the folder is requested.

## R01 (P3) — The description does not say what happens to EllipticModularityEffectiveComparisons

This is carried from review 20's R01, first raised in review 11.
- `grep -c EffectiveComparisons` on the description still returns 0.
- No repair report since review 20 exists. The newest report in the package is still GATE~12, and no report marks the finding as not actionable.

**Location.** The pull-request description, including its merge-order and depends-on blocks, never names EllipticModularityEffectiveComparisons.

**Claim.** Two open roadmaps plan the same results. This roadmap is earlier in the merge order (`ORDER.txt` line 275, against line 285), so ownership stays here. The description should say how the duplicate is resolved.

**Witness.** EllipticModularityEffectiveComparisons moved from `ba802e5` to `b26ab9f`, a 13-line README change about X_s⁺(p), X₀⁺(p²) and Y₀(p). The duplication is untouched:
- its README line 1707 still says this roadmap "plans the same results under its own layer numbering" and maps EC.0–EC.6 to its §§0.16, 1.6, 2.1–2.3, 3.17, 4.21–4.22, 5.28 and 4.0;
- its `Suggested.lean` still declares `localTerms` (:53), `martinValue` (:71), `newDimension` (:77), `GeometricTorsion` (:153) and `torsionRepresentation` (:169);
- the same file restates the isogeny-degree, irreducibility, Cartan, j-table and Lemos theorems (:186–298).

**Repair.** In the description, say that EllipticModularityEffectiveComparisons is to be closed before either pull request merges, or cut down to a consumer of this roadmap. As a consumer it would cite §§1.4, 1.5–1.8, 2.0, 2.2, 4.7, 5.1, 5.4–5.5 and 6.18 here. No change to the folder.

## Previous findings

- R01 — not repaired: the description still never names EllipticModularityEffectiveComparisons. Its head `b26ab9f` keeps the duplication paragraph (README line 1707) and `Suggested.lean` :53–:298. Carried as R01.

## Verified sound

### Gate, dependency check and elaboration

**Gate**, rerun at this head:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- The worker's gate (`scratch/gate.md`) also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff --stat 86f110e..HEAD` shows a single file: the README, with 1 insertion and 1 deletion. The same command restricted to `Suggested.lean` is empty.

**Dependency check** (`--movable`):

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean` exits 0 with exactly 15 messages.
- All 15 are `declaration uses sorry`, at lines 99, 104, 139, 162, 175, 186, 213, 219, 225, 239, 246, 257, 276, 284 and 293.

**Signatures.** A scratch copy with `#check @name` for all 27 declarations elaborates with no error. Each of the 27 elaborated types occurs verbatim, up to whitespace and the namespace prefix, in `scratch/signatures.md`. The two declarations behind the changed line are:
- `deletionLevel : (E : WeierstrassCurve ℚ) → [E.IsElliptic] → ℕ → ℕ`;
- `removed_prime_bound`, which keeps `[Fact (Nat.Prime ell)]`, `3 ≤ ell`, irreducibility of `torsionRepresentation E ell`, `p ≠ ell`, and the two `factorization p` hypotheses.

No binder is lost. Since the Lean is unchanged, review 18's one-tactic probe and import check still hold.

### The changed passage (§2.2, line 346)

- **"For a prime ℓ≥3 it is the M₀ of SerreWeightAndLevelOptimisation §6.1".** SerreWeightAndLevelOptimisation is at head `0825d40`, unchanged since review 20.
  - Its §6.1 heading, "Reduced elliptic level M₀", is README line 1367.
  - Its definition at line 1369 is stated for E/Q with M>0, Δ≠0 and "prime ℓ≥3". It sets M₀ = M/∏q over the primes with v_q(M)=1 and ℓ∣v_q(Δ), and includes q=ℓ.
  - That is the formula of the `deletionLevel` body (`Suggested.lean:153–156`) on the conductor and minimal-discriminant norms.
- **"which defines M₀ only for such ℓ".** True: the definition at line 1369 and its hypothesis line 1371 restrict to a prime ℓ ≥ 3. So does Bennett–Siksek (BS2020 line 165).
- **Disambiguation.** The paragraph now names SerreWeightAndLevelOptimisation §6.1 at both mentions. It can no longer be read as Bennett–Siksek §6, the character-sum section with Proposition 6.1 (BS2020 line 158 refers to it). The previous review's remark on "§6.1 there" is resolved.
- **Consistency with the rest of the README.**
  - The supplier contract (line 110) reads "From SerreWeightAndLevelOptimisation §6.1 … For prime ℓ≥3".
  - The *Needs:* line (362) reads "SerreWeightAndLevelOptimisation §6.1 for M₀".
  - `removed_prime_bound` (line 360, `Suggested.lean:162`) assumes a prime ℓ ≥ 3.
  - All three use the same range as the changed sentence. Line 1113 (EC.1) still cites §2.2 with no claim outside that range.
- **Other citers.** ErdosProgressionPowers (head `3e1048c`, unchanged) restates `deletionLevel` on the same carriers. Its identification with a residual conductor is only for ell ≥ 5 under extra hypotheses, so the change does not contradict it.

### Sources: the seeded sample in the changed passage

Of this round's 15 seeded targets (1.2, 1.6, 1.7, 2.2, 4.1, 4.4, 4.7, 4.7a, 6.0d, 6.0g, 6.6, 6.7, 6.8, 6.11, 6.13), only 2.2 falls in the changed passage. The other 14 are in untouched text, verified in reviews 14–18. The README flags no locator as unverified (grep: 0 hits). The locator in the changed paragraph was re-read:

| Target | Source and locator | Lines in the cache | Supports the statement as written |
|---|---|---|---|
| 2.2 definition of M₀ | BS §2, equation (3), p. 358 | BS2020 163–175. Extraction page 4 begins at line 133, and line 134 carries the printed page number 358. | Yes. The hypotheses are E/ℚ with minimal discriminant Δ and conductor M, and a rational prime ℓ ≥ 3. The product runs over the primes q ∥ M with ℓ ∣ ord_q(Δ), and q = ℓ is not excluded. This matches the README's formula and its restriction of the identification to a prime ℓ ≥ 3. |

### Adversarial table

The rows below were computed at this head by a scratch script. It derives Δ and c₄ from the b-invariants and applies the formula of `Suggested.lean:153–156`, with ℓ = 0 handled as Lean does (`0 ∣ n` iff n = 0). They cover the changed statement and the theorem that consumes it.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| "for a prime ℓ≥3 it is the M₀ of SerreWeightAndLevelOptimisation §6.1" | §6.1's Checks (its lines 1385–1391): M=33 with (v₃,v₁₁)=(6,2) at ℓ=3; M=141 with (v₃,v₄₇)=(7,1) at ℓ=3 and ℓ=7; M=45 with (v₃,v₅)=(7,7) at ℓ=7 | §6.1 gives 11, 141, 47 and 9; the body of `deletionLevel` gives 11, 141, 47 and 9 | agree |
| same, on an actual curve | 141a1 `[0,1,1,−12,2]` | Δ = 102789 = 3⁷·47 and c₄ = 592, with gcd(592,141) = 1, so both primes are multiplicative and M = 141. The body gives 141 at ℓ=3 and 47 at ℓ=7 | agrees with §6.1 line 1393 (M₀ = 141 at ℓ = 3) |
| same, on the README's own Checks | 11a1, 14a1, 27a1 and 37b1 at ℓ = 3 and 5 | Δ = −11⁵, −2⁶·7³, −3⁹ and 37³. At ℓ=3 the values are 11, 1, 27 and 1; at ℓ=5 they are 1, 14, 27 and 37 | agree with §2.2 Checks 1–4 (lines 355–358) |
| "which defines M₀ only for such ℓ" | ℓ = 0, 1, 2, 4, 9 | SerreWeightAndLevelOptimisation line 1369 and BS2020 line 165 both restrict to a prime ℓ ≥ 3, so neither assigns a value at these ℓ | true |
| "at any other ℓ the same formula is the definition and claims nothing beyond the facts below" | ℓ = 0, 1, 2, 4, 9 on 11a1, 14a1, 27a1, 141a1 and 37b1 | ℓ=0: 11, 14, 27, 141, 37. ℓ=1: 1, 1, 27, 1, 1. ℓ=2: 11, 7, 27, 141, 37. ℓ=4: 11, 14, 27, 141, 37. ℓ=9: 11, 14, 27, 141, 37 (on 27a1, 9 ∣ 9 but ord₃(M)=3) | Agree with API bullet 4: ℓ=0 gives M, and ℓ=1 gives the additive part. Agree with bullet 1: each value divides M, and each quotient M/M₀ lies in {1, 2, 3, 11, 14, 37, 141}, all squarefree and multiplicative. |
| minimality negative control (Check 4) | 14a1 at ℓ=5, on the minimal model and on the 7¹²Δ model | minimal (v₂,v₇)=(6,3) gives 14; the non-minimal (6,15) gives 2 | matches line 358 |
| `removed_prime_bound` stays inside the identified range | 141a1 with ℓ=7 and p=3: 3 ∥ 141, 7 ∣ v₃(Δ) = 7, and 3 ≠ 7 | M₀ = 47, and (√3+1)^((47+1)/6) = (√3+1)⁸ ≈ 3103.92 ≥ 7. At ℓ=3 no admissible p exists: p=3 is excluded by p ≠ ℓ, and 3 ∤ v₄₇(Δ) = 1 | consistent with BS Lemma 2.2; the hypotheses `Fact ell.Prime` and `3 ≤ ell` match the changed sentence's range |

The rows for every other statement are carried forward unchanged, because neither their statements nor the Lean changed:
- review 20: the §2.2 rows on the previous wording;
- review 19: the rendering against ErdosProgressionPowers' rendering, junk ℓ on 14a1, and the EC.6 attribution;
- review 18: §§1.1–1.7, 2.0, 2.1, the §2.2 negative controls, 4.1, 4.4, 5.4–5.5, 6.0b, 6.0f, 6.1, 6.5, 6.10–6.14, and the Frobenius convention of the Conventions;
- reviews 14–17 for the rest.

### Library declarations and citations resolved

- The two Tau Ceti declarations named in the changed line, opened at the Tau Ceti pin `2fd255d`:
  - `WeierstrassCurve.algorithmicConductor`, `AlgebraicGeometry/EllipticCurve/TateAlgorithm/Reduction/Conductor.lean:103`;
  - `WeierstrassCurve.minimalDiscriminantIdeal`, `AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:170`.
  - Both are `(W : WeierstrassCurve K) [W.IsElliptic] : Ideal O`, as `deletionLevel` uses them. The `#check` file above resolves them.
- Citations re-resolved at the heads of their pull requests:
  - SerreWeightAndLevelOptimisation §6.1 at `0825d40`, lines 1367–1396;
  - ErdosProgressionPowers at `3e1048c`;
  - EllipticModularityEffectiveComparisons at `b26ab9f`, line 1707.
- `scratch/overlaps.md` lists no pull request that changes this roadmap, and no dropped id or revision-only id.
- The declared gap `mixed-modular-jacobians` (supplier ModularCurvesPartII) is unchanged.

### Ownership against open work

- `deletionLevel` is owned here as the rendering of SerreWeightAndLevelOptimisation §6.1's M₀, consumed with §2.2. ErdosProgressionPowers restates it, and line 1113 records that.
- EllipticModularityEffectiveComparisons duplicates Layers 1, 2, 5 and 6. It is later in the merge order, so ownership is here (R01).
- Ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- **Kenku1982**, pp. 199–201, cited at §§5.0b and 5.2, is uncertified (paywalled) and cited by its locator. Neither section changed at this head.

## Source issues

- **Misprint** in BS2020 at §2, equation (3), p. 358: the source says ord_q(x) is the largest power of q dividing x; it should be the exponent of that largest power, as ℓ ∣ ord_q(Δ) requires; affects nothing.
