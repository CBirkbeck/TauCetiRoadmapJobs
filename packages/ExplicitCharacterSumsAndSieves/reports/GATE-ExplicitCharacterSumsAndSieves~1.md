# GATE-ExplicitCharacterSumsAndSieves~1: answers to human review

## H01 (mycaule) — applied differently

`TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md` gains a section, "Provenance: existing formalizations outside Tau Ceti" (between Worked examples and References), and a References entry for LeanPool at commit f8b9b721. The section says what `LeanPool/SelbergSieve4` and `LeanPool/IwaniecLinearSieve` prove and which targets each one touches. Most of the overlap is with the supplier SieveMethodsAndPrimePatterns: Selberg's sieve is its §1.3 and the Rosser–Iwaniec linear sieve its §5.2, and this roadmap's Scope already leaves both there. Only SelbergSieve4's explicit interval bounds touch targets owned here (§§5.4 and 5.6, which are stronger), so no ownership moves.

Evidence (read at the commit the comment links; both projects are Apache-2.0 on Lean v4.35.0, and the pin here is v4.36.0-rc2):

- `LeanPool/SelbergSieve4` (A. Mellendijk) uses its own structure `Sieve`, whose fields are the same as Mathlib's `BoundingSieve` (`Mathlib/NumberTheory/SelbergSieve.lean` line 54).
  - `fundamental_theorem_simple` is Selberg's bound `siftedSum ≤ X/S + Σ_{d | P, d ≤ level} 3^ω(d)|r_d|`, with weights supported on `d² ≤ level`. This is SieveMethodsAndPrimePatterns §1.3 `SieveSelberg.selberg_upper_bound`. That roadmap, on main, already cites the PrimeNumberTheoremAnd predecessor `selberg_bound_simple` (its line 1291).
  - `Applications/BrunTitchmarsh.lean` sets `prodPrimes = primorial ⌊z⌋`, `ν = 1/n` and `level = z`. There `selbergTerms(l) = ν(l)∏_{p|l}(1 − ν(p))⁻¹ = 1/φ(l)`, so the bounding sum is `S(√z)` in §5.1's notation.
  - It proves `S(√z) ≥ (log z)/2` (`BrunTitchmarsh.boudingSum_ge`, the non-strict form of ExplicitPrimeCounting §0.1's `S(u) > log u`).
  - It proves sifted count `≤ 2y/log z + 5z(1 + log z)³` (`BrunTitchmarsh.siftedSum_le`).
  - It proves `#{p : x ≤ p ≤ x + y} ≤ 2y/log z + 6z(1 + log z)³` (`BrunTitchmarsh.primesBetween_le`), for `x, y > 0`, `z > 1`.
  - Nothing there has a weight, a modulus `k > 1`, `H₁`, Greaves's sum or the weighted arithmetic large sieve.
- `LeanPool/IwaniecLinearSieve` (J. Davies) covers Rosser's linear sieve for the density `1/p`.
  - `rosserSieve_le_siftIndicator_le` is the sieve inequality.
  - `theorem4` and `linearSieveEstimate` bound the main-term deficits and the size of the lower support.
  - `iwaniecBound` is Jacobsthal's problem.
  - Every constant is existential (`∃ c₇`, `∃ C₀ c K z₀`, `∃ C`). This is SieveMethodsAndPrimePatterns §5.2 material. No layer here treats the linear sieve, and the explicit linear sieve is Part II.

The new section follows the provenance-section pattern of the roadmaps that already cite LeanPool (QuadraticFormsOverABase, StableMatching, RationalHomotopyModels, and on main Isoperimetry), as the top-level README's "Porting existing work" asks.

## Build

`lake build TauCetiRoadmap.ExplicitCharacterSumsAndSieves.Suggested`: `Build completed successfully (18239 jobs).` The only warnings are `declaration uses 'sorry'`. `Suggested.lean` is unchanged by this job, so no `#check @name` re-elaboration was needed. The 42 elaborated signatures in the worker's `signatures.md` still describe the file.

## Gate

After the commit `ebf1dc85`:

`gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`gate --depcheck … --movable --pr 1948`): `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines. The repair adds no supplier, `*Needs:*` line or citation of a roadmap later in the order. LeanPool is stated to be no supplier.

`roadmaps resolve` on the README: no cross-roadmap citation or Lean name found nowhere.

## Adversarial pass on the added statements

| Statement (new README text) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `fundamental_theorem_simple`: Selberg bound, weights on `d² ≤ D`, remainder over `d ≤ D` | `P = 1`, `D ≥ 1` | `S = g(1) = 1`; bound `X + abs(r₁) = X + abs(#A − X) ≥ #A` | consistent with its signature and with `selbergWeights_eq_zero (¬ d² ≤ y)` | none |
| Identification of the bounding sum with `S(√z)` | `l = 6`; `z = 4`; `z = 1.5` | `g(6) = (1/6)(2)(3/2) = 1/2 = 1/φ(6)`; `S(2) = 2 ≥ log 4/2 = 0.693`; `S(1.22) = 1 ≥ 0.203` | holds; every squarefree `l ≤ √z` divides `primorial ⌊z⌋` | none |
| "non-strict form at `u = √z` of `S(u) > log u`" | `z > 1` ⇒ `√z ≥ 1`, the range of ExplicitPrimeCounting §0.1 (`u ≥ 1`, its line 645) | `log √z = (log z)/2` | holds | none |
| `siftedSum_le` | `x = 1`, `y = 9`, `z = 3` | sifted integers of `[1, 10]`: `1, 5, 7` = 3 ≤ `18/1.0986 + 15·2.0986³ = 155.0` | holds | none |
| `primesBetween_le` on the closed interval | `x = 1`, `y = 9`, `z = 3` | primes `2, 3, 5, 7` = 4 ≤ `16.38 + 18·9.243 = 182.8`; `primesBetween_eq_ncard` uses `a ≤ p ≤ b` | holds; closed interval as written | none |
| Leading terms `2y/log z` against `2y/log y` (§5.4 corollary) and `x/log z` (§5.6) | §5.4 corollary: primes in `[x, x+y]` `< 2y/log y` for `x ≥ 0`, `y > 1`; §5.6: `Φ(x, z) < x/log z` for `1 < z ≤ x` | for `z ≤ y`, `2y/log z ≥ 2y/log y` | comparison is of leading terms only; no implication is claimed | none |
| IwaniecLinearSieve "the size of their supports" | `linearSieveEstimate` bounds only `#(rosserSet true (C₀z²) z)` | lower support only | first wording over-claimed | reworded to "the size of the lower support" |
| "every error constant there is shown only to exist" | `theorem4` (`∃ c₇`), `linearSieveEstimate` (`∃ C₀ c K z₀`), `cor1`/`cor3` (`∃ C`), `iwaniecBound` (`∃ C`) | all existential | holds | none |
| `Sieve` fields equal `BoundingSieve` fields | LeanPool `SieveLemmas.lean` against the pin's `Mathlib/NumberTheory/SelbergSieve.lean` lines 54–73 | same ten fields, same names and types | holds | none |

## Ownership and sources

- **Ownership.** No construction moves. Selberg's sieve stays with SieveMethodsAndPrimePatterns §1.3 and the linear sieve with its §5.2, as Scope already says, and the explicit interval bounds stay in §§5.4–5.6 here. The repair names LeanPool declarations only as prior work, and no `Suggested.lean` declaration takes one of their names.
- **sources.toml.** LeanPool is a code repository read on GitHub, not a source text, and it is cited only in the secondary provenance section. `sources.toml` is outside this job's edit scope and has no entry for it. The worker may record it if the manifest is to list code repositories.
- **Untrusted text.** The review comment contains no instruction, only the overlap claim and two links.
