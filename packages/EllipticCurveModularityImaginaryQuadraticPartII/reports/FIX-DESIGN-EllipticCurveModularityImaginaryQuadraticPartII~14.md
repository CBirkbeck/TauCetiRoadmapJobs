# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~14

This round answers one review, `REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13`: one P2
and three P3 findings. All four are right and all four are applied. The review's "For the human
reviewers" section (scope, licences) lists no finding, and nothing was changed because of it.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13/F01 (P2) — applied

§6.1, README and `plan.json` 6.1: "five-adic completions … unchanged …, so each … at most one eighth …;
no later extension raises this ratio …; omitting any two … three quarters" → an explicit derivation:
`F₁` the CM field before the step, `[F₁⁺E:ℚ] = 8[F₁⁺:ℚ]`, `(F₁⁺E)_w = (F₁⁺)_u`,
`[F'⁺_{w'}:(F₁⁺E)_w] ≤ [F'⁺:F₁⁺E]`, hence `≤ [F'⁺:ℚ]/8`, at least eight places, and a sum
`≥ (3/4)[F'⁺:ℚ]`.

Verified: CaptainSude26 lines 584–587 are three sentences with the same three clauses in the same
order as the old text. Letters: `F₁` instead of the review's `M₀`, `M`, because `M` already names the
module `ad⁰ρ̄` (Layers 3–4), the CM field of §2.4 and a matrix in a §3.3 Check (the review allowed any
free letter; `F₁` occurs nowhere else). Pattern: the sentence before it also had a source phrase
("disjoint from the fields already used", line 583). It now says "linearly disjoint from a finite
Galois extension of `ℚ` containing `F₁` and the field cut out by `ρ̄`", which is the avoidance field
PotentialAutomorphyInfrastructure §2.5 takes (read at its head: finite Galois `A/F`). The §6.1 degree
Check now says `F₁ = F` and gives `2 = 16/8` and `12 = (3/4)·16`. The longest run of words the new
§6.1 shares with CaptainSude26 lines 541–610 is four words ("finite set of places").

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13/F02 (P3) — applied

`plan.json` target 6.2: `"name": "steinberg_protected_lifting"` → `"protected_lifting_at_five"`. No
other file of the package uses the name. `roadmaps grep --fixed` finds it on main and in no open
roadmap pull request. The intake file of the board's job folder `packages/EllipticCurveModularityCMFields`
still uses the old name; this job may not edit it, and it is intake data, not part of the roadmap.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13/F03 (P3) — applied

§3.1 and `plan.json` 3.1 locator: "(CaptainSude26, Lemma 3.1, line 187.)" → "Lemma 3.1 and its proof,
lines 187–192, for the basis `e, h, f` and the action of `Ad(U)`; proof of Lemma 3.2, line 224, for the
trace form; proof of Lemma 3.3, line 234, for the vanishing of invariants over `𝔽₅`."

Verified at the source: line 187 names `e, f, h`; lines 191–192 give `D(e), D(h), D(f)`; line 224 gives
the trace form; line 234 gives `M^G = 0`. Pattern: the other locator that starts at line 187 (§3.5,
lines 187–226) covers its claims, so it is unchanged.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13/F04 (P3) — applied

Conventions, the `K` bullet: added "In §6.1, which names no elliptic curve, `E` is a totally real Galois
extension of `ℚ` of degree eight, and `E_a`, `E_b`, `E_c` are the imaginary quadratic fields so named
in ACC23 §6.5.12." §6.1 mentions no curve. ACC23 lines 7163–7179 use `E_a, E_b, E_c` this way.

Pattern: the parent's `F = K(μ_n)` is another standing letter that is bound again elsewhere without a
record. §1.2, §4.1, §4.3, §§5.1, 6.1, 6.2 and §7.4 each introduce their own `F`. Added to the
parent-notation bullet: "The field `F = K(μ_n)` is meant in the Summary, Layers 2 and 8, §7.5 and Layer 1
outside §1.2; §1.2, Layers 4–6 and §7.4 each introduce their own number field `F` …, and Layer 3 uses
only local fields `F_v` and their extensions `F'_w`." I re-wrapped that bullet; no other words in it
changed. `M` is not a standing letter (each use is bound where it occurs), so it gets no record.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §6.1: `[F₁⁺E:ℚ] = 8[F₁⁺:ℚ]` | `F₁⁺ = ℚ(√5)`, `E = ℚ(√31,√59,√71)` | quadratic subfields of `E`: `31, 59, 71, 1829, 2201, 4189, 129859`, none is `5`; `E ∩ ℚ(ζ₅) ⊆ ℚ(√5)` is real, so it is `ℚ`; degree `2·8 = 16` | holds | none |
| same, linear disjointness dropped | `F₁⁺` with 5 split, `E ⊇ F₁⁺` | `[F₁⁺E:ℚ] = 8`, not `8[F₁⁺:ℚ]`; the ratio bound becomes `[E∩F₁⁺:ℚ]/8` | disjointness is used | kept as a hypothesis |
| §6.1: `(F₁⁺E)_w = (F₁⁺)_u`, eight `w` over each `u` | same | `E ⊗ ℚ₅ ≅ ℚ₅⁸`; `F₁⁺E ⊗_{F₁⁺} (F₁⁺)_u ≅ E ⊗_ℚ (F₁⁺)_u ≅ (F₁⁺)_u⁸`; `(F₁⁺)_u = ℚ₅(√5)`, degree `2 ≤ 2 = 16/8` | holds | none |
| same, five not split in `E` | `ℚ(√5,√2)` | `2` is not a square mod `5`: one place, `e = 2`, `f = 2`, local degree `4` = whole degree | bound fails, as the Check says | none |
| §6.1: `[F'⁺_{w'}:ℚ₅] ≤ [F'⁺:ℚ]/8` | tower `F₁⁺E ⊆ F'⁺` | `[F'⁺_{w'}:ℚ₅] = [F'⁺_{w'}:(F₁⁺E)_w]·[(F₁⁺E)_w:ℚ₅] ≤ [F'⁺:F₁⁺E]·[F₁⁺E:ℚ]/8 = [F'⁺:ℚ]/8`; trivial extension `F'⁺ = F₁⁺E`: equality `2 = 16/8` | holds | none |
| §6.1: at least eight places; (ii) of §5.1 | `d = [F'⁺:ℚ] = 16` | the local degrees add up to `d`, each `≤ d/8`, so there are `≥ 8` places and a second `v̄'` exists; `16 − 2 − 2 = 12 = (3/4)·16 > 8`; in general `d − 2d/8 = 3d/4 > d/2` for `d > 0` | holds | Check updated |
| §6.1: `F₁⁺E ⊆ F'⁺` | `F'` CM | `F₁⁺E` is totally real and lies in `F'`, so it lies in the largest totally real subfield | holds | none |
| §6.1: avoidance field | PotentialAutomorphyInfrastructure §2.5 at its head | it needs a finite Galois `A/F`; with `F = ℚ`, `A` is the Galois closure of `F₁` together with the field cut out by `ρ̄`, finite over `ℚ`; `S = {5, ∞}` plus the primes under the test places; the result is cyclic of degree `8` and totally real | holds | wording changed |
| §6.1 degree Check, mod-`11` squares | `31, 59, 71 mod 11` | `9, 4, 5`; the squares mod `11` are `{1, 3, 4, 5, 9}` | split | none |
| §6.1 degree Check, mod-`5` squares | `31, 59, 71 mod 5` | `1, 4, 1`; the squares mod `5` are `{1, 4}` | split | none |
| §6.1 degree Check, prime `2` | `31, 59, 71 mod 4` | `3, 3, 3`: two ramifies in `E` | the caveat stands | none |
| §3.1 locator | CaptainSude26 lines 187, 191–192, 224, 234 | basis; `D(h) = h − 2e`, `D(f) = f + h − e`; trace form invariant and nondegenerate; `M^G = 0` | supported | locator changed |
| Conventions, `E` | §6.1 and the Conventions | in §6.1, `E` has degree `8`; `E_a`, `E_b`, `E_c` are quadratic; §6.1 contains no "curve" (grep: 0 matches) | consistent | note added |
| Conventions, `F` | §§1.1, 1.2, 2.1(c), 4.1, 4.3, 5.1, 6.1, 6.2, 7.4, 7.5, 8.1 | `K(μ_n)` in §§1.1, 2.x, 7.5, 8.1 and the Layer 1 Examples; bound again in §1.2 (`K ⊆ F`), §4.1 (`μ₅ ⊂ F`), §4.3, §5.1, §6.1, §6.2, §7.4; Layer 3 has only `F_v` and `F'_w` (grep) | consistent | note added |
| 6.2 name | the README, `plan.json`, every roadmap | 0 uses of the old name in the README; 1 in `plan.json`, renamed | consistent | renamed |

## Checks run

Dependency check (the brief's command), after the edits:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2264 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

- `plan.json` parses after the edits; it still has 28 targets.
- The design has no `Suggested.lean`, so there was no `#check` comparison. No Lean name in the README
  changed.
- Gate failures: none were listed for this round.

## Sources, ownership, notes for the maintainer

- **Sources.** Nothing was fetched and no manifest entry changed. Every locator added or changed
  points into CaptainSude26 or ACC23, which are already in `sources.toml`; the CaptainSude26 `locator`
  field already covers Lemmas 3.1–3.4 (pp. 4–6). No `needs-references.toml` was written.
- **Ownership.** No construction, target or supplier was added, so there was no new ownership
  question. The only new citation is PotentialAutomorphyInfrastructure §2.5, which §6.1 already cited;
  I re-read it at its open head.
- **Renamed name.** The target name of 6.2 is now `protected_lifting_at_five`. No roadmap on main or
  at an open head cites the old name.
- **Board intake file.** `packages/EllipticCurveModularityCMFields/target.md` still uses
  `steinberg_protected_lifting` and "Steinberg-protected". It is outside this job's files.
