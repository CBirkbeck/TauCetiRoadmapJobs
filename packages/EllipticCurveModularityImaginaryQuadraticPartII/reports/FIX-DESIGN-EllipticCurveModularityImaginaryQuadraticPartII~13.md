# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~13

This round answers one review, `REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~12`, which raised
one P3 finding. The finding is right. It is applied, with a route that names a supplier instead of the
review's "small enough fraction". The review's "For the human reviewers" section (scope and licences)
lists no finding, and nothing was changed because of it.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~12/F01 (P3) — applied differently

Changed (§6.1 route): "…the three imaginary quadratic composita, the degree inflation at five)…; these
places in the split set of the degree inflation" → the degree condition comes from a composite with a
totally real Galois `E/ℚ` of degree eight, with solvable group, disjoint from the fields already used,
with five and the primes below the test places split completely. This step comes before the composita.
The second addition at `P` becomes "the rational primes below `P` among those split completely in `E`".

Verification. The term occurs nowhere else: not on main, not at any open head, not in any source.
CrystallineLocalGlobalCompatibilityCM §9.11 (at its open head) only lists "the degree condition holds"
among the properties of `F₀`. CN23 lines 4470–4475 and ACC23 lines 7149–7162 also only assume the
condition. The construction is in CaptainSude26 lines 582–588: a totally real multiquadratic field of
degree eight over `ℚ`.

Why "differently":

- **A precise bound and a supplier.** The review wrote "a small enough fraction". The text now says
  "at most one eighth" and gives the reason (see the table below). Existence is supplied by
  PotentialAutomorphyInfrastructure §2.5 (`auxiliary_cm_extension_prescriptions`), applied over `ℚ`
  with the real place among the split places. Its statement covers any number field, any `N ≥ 1`, a
  finite Galois avoidance field and a finite split set. It is already in the §6.1 *Needs* line, and
  its contract bullet now records this use. The multiquadratic field of CaptainSude26 is named as the
  other choice.
- **Order.** The step must come before the imaginary quadratic composita, and the text now says so. A
  prime ramified in `E` must split in some imaginary quadratic subfield (§5.1(i)). Taking `E` inside
  `E₀` puts such primes under ACC23's `E_b` condition (lines 7168–7170). The old list put the degree
  step last.
- **`E` must be Galois over `ℚ`.** Then `F'/F` is still Galois. A cyclic extension of `F⁺` built in
  the middle of the tower need not be Galois over `F`.
- **`plan.json` does use the term.** The review said `plan.json` 6.1 did not, but its statement had
  "P in the split set of the degree inflation". That statement is rewritten the same way.

Other places changed to match:

- README, §6.1 Checks: the `q = 11` Check now also needs `11` split in `E`. A new Check covers the
  degree step:
  - `F = ℚ(ζ₅)` with `E = ℚ(√31, √59, √71)`.
  - A non-example, `ℚ(√5, √2)`.
  - The note that this `E` ramifies two.
- README, "From other roadmaps": the PotentialAutomorphyInfrastructure §2.5 bullet states the cyclic
  degree-`N` split extension over any number field, used over `ℚ` by §6.1.
- `plan.json`: the 6.1 statement, and a new test `prep_degree_step` (97 tests, 28 targets).
- `sources.toml`: the CaptainSude26 locator "Proposition 5.2 p.11" becomes "Proposition 5.2 and its
  proof pp.11-12". The cited lines 582–588 are on printed p. 12 (the page marker is at line 558).

Adversarial pass on the changed text (values computed):

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Five-adic local degrees of `F⁺E` are those of `F⁺`, and `[F⁺E:ℚ] = 8[F⁺:ℚ]` | `F⁺ = ℚ(√5)`, `E = ℚ(√31,√59,√71)` | `(31/5) = (59/5) = (71/5) = 1`, so `E_u = ℚ₅`; no quadratic subfield of `E` is `ℚ(√5)` (squarefree parts `31, 59, 71, 1829, 2201, 4189, 129859`), so `E ∩ F⁺ = ℚ`, degree `16`; `5` in `F⁺E`: `e = 2, f = 1, g = 8` | holds; ratio `2/16 = 1/8` |
| Omitting two five-adic places leaves more than half | same; general ratio `r ≤ 1/8` | `16 − 2·2 = 12 > 8`; in general `1 − 2r ≥ 3/4 > 1/2`; `r ≤ 1/8` forces at least 8 five-adic places, so a `v̄' ≠ v̄` exists | holds; any `[E:ℚ] ≥ 5` would do (`1 − 2/5 > 1/2`); eight is kept |
| No later extension raises the ratio | `L'/L` finite, `w' ∣ w ∣ 5` | `[L'_{w'}:ℚ₅] = [L'_{w'}:L_w][L_w:ℚ₅] ≤ [L':L][L_w:ℚ₅]`; `F'⁺ ⊇ F⁺E` since `F⁺E` is totally real inside CM `F'` | holds |
| Five must split in `E` | `E = ℚ(√2)`, `F⁺ = ℚ(√5)` | `(2/5) = −1`: `ℚ₅(√2)/ℚ₅` unramified of degree 2, `ℚ₅(√5)` ramified, so one place with `e = f = 2`, local degree `4` out of `4` | (ii) fails: non-example Check |
| Residue half of (ii) | same `F⁺E` | the residue field above 5 is `𝔽₅` (`f = 1` in `ℚ(√5)` and in `E`) | not reached by `E`; comes from the prescribed completions, as stated |
| Rational primes below `P` split in `E` (second addition) | `q = 11`; `q = 2` | `31 ≡ 9`, `59 ≡ 4`, `71 ≡ 5 mod 11` are squares mod 11 (`{1,3,4,5,9}`), so 11 splits; `31 ≡ 59 ≡ 71 ≡ 3 mod 4` gives discriminants `4p`, so 2 ramifies; `p ≡ 1 mod 8` splits 2 | this `E` serves only if no place of `P` lies above 2: recorded in the Check |
| `F'/F` Galois and solvable | `E/ℚ` Galois, `F₀/F` Galois solvable | `Gal(F₀E/F) ↪ Gal(F₀/F) × Gal(E/ℚ)`, solvable; `F₀E` is CM (`F₀⁺E` totally real, `F₀E = F₀⁺E(√−δ)`) | holds; a cyclic extension of `F₀⁺` need not be Galois over `F`, hence `E/ℚ` |
| Primes ramified in `E` satisfy §5.1(i) | ACC23 lines 7168–7170 | an odd `l ∉ {2, 5}` ramified in `E₀E_aE_c` splits in `E_b`; `E ⊂ E₀`; `5` is split in `E`, hence unramified | holds when `E` precedes the composita |
| Existence over `ℚ` | PotentialAutomorphyInfrastructure §2.5 with `F = ℚ`, `N = 8`, `S = {∞, 5, primes below test places and below P}` | its statement: "for every `N≥1` there is a cyclic extension `E/F` of degree `N`, disjoint from `A`, with every place of `S` split completely" | supplied; also by hand with `p_i ≡ 1 mod 8m`, `m` the product of 5 and the odd primes to be split (then `(p_i/ℓ) = 1` and 2 splits) |
| §6.1 conclusion above two | `P` with a 2-adic place | `E` split at 2, `E_a` split at 2, so `F'_w = F_v(√−d_b, √−d_c)`, `e ∣ 4` | unchanged; consistent with the second addition |

The existing `q = 11` Check (`p_b = 109`) is not combined with the new `E`. With that `E`, ACC23 would
also need `p_b ≡ −1 mod 31, 59, 71`, and `109 ≡ 16 mod 31` fails this. The new Check therefore only says
that `31, 59, 71` must split in `E_b`, and claims no compatibility with 109.

## Checks run

Dependency check (after every edit):

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD and no CYCLE line.

Other checks:

- `plan.json` parses and keeps its serialisation (indent 1, no final newline): 28 targets, 97 tests.
  The §6.1 README Checks (6) match the 6.1 tests (6).
- The term "degree inflation" no longer occurs in the README or in `plan.json`.
- The README has no LaTeX delimiters.
- This is a design: there is no `Suggested.lean`, so no `#check` comparison was run.

## For the maintainer

- No Lean name and no section id changes. No supplier or consumer is added. PotentialAutomorphyInfrastructure
  §2.5 was already a prerequisite of 6.1.
- Citations were re-resolved this round, at the open heads:
  - CrystallineLocalGlobalCompatibilityCM §9.11, the degree condition among the properties of `F₀`.
  - PotentialAutomorphyInfrastructure §2.5, statement over any number field.
- Ownership: no new object is stated. The degree step is a route detail of target 6.1, whose owner is
  this roadmap. PotentialAutomorphyInfrastructure §2.6 lists the same `E⁺` degree condition inside its
  ACC23 base-change fields, and does not construct it.
- No source was fetched. The eight manifest texts were read from the cache (CaptainSude26 lines
  540–610, CN23 lines 4425–4512, ACC23 lines 7125–7190). Nothing is missing.
