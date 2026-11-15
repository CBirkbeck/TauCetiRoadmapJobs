# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~12

This round answers one review, `REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~11`, which raised three P3 findings. All three are right.
F01 is applied with a different route, because the route it asked to keep re-derives a criterion that
another roadmap owns. F02 is applied for odd residue characteristic. Its suggested insertion cannot hold
above two, so the conclusion there is weakened to what is true. F03 is applied. The review's "For the
human reviewers" section (scope and licences) lists no finding and changes nothing here.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~11/F01 (P3) — applied differently

Changed (§1.1, retitled "Cyclotomic extensions and intermediate fields of CM fields"): "every
intermediate field of a cyclotomic `L/K` is CM" → "(a) cyclotomic `L/K` over CM `K` is CM; (b) every
field between CM fields `K ⊆ L` is CM". Two Checks are added: the reviewer's
`ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`, and `ℚ(2^(1/3))(ζ₃)`, which shows that (a) needs `K` CM.

Why differently: the review asked to keep the route, but the old route re-derives MordellLawrenceVenkatesh
§1.3, which is earlier in the merge order (line 163). That criterion says a field is totally real or CM
exactly when every product `c₁c₂` of two complex conjugations fixes it. Both (a) and (b) are now routed
through it, and it is added as a supplier.

Evidence: `ℚ(i,√3,√5)` has quadratic subfields `ℚ(√d)`, `d ∈ {−1, ±3, ±5, ±15}`. So it contains no `ζ₈`
and no `ζ₅`, its roots of unity are `μ₁₂`, and `K(μ₁₂) ≠ L`.

Other places changed to match:

- README: Scope (Owned here and Imported), the Mathlib contract (the three `complexConj`/`ofCMExtension`
  names that are no longer consumed are dropped), From other roadmaps, How to read the build, and the
  Layer 1 Dependencies.
- The MilneCM locator gains Remark 1.6, in the README References and in `sources.toml`.
- `plan.json`: target 1.1 and the supplier list.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~11/F02 (P3) — applied differently

Changed (§6.1): "every place of `P ∪ P^c` splits completely" → "every place of `P ∪ P^c` of odd
residue characteristic splits completely, and every place above two has ramification index dividing
four". The route now has the odd primes below `P` split in `E_a`, `E_b` and `E_c`, and puts `P` in
the split set of the degree inflation. Two Checks are added: the 2-adic obstruction, and q = 11 with
`p_b = 109`, `p_c = 2617`.

Why differently: the suggested insertion cannot hold at two. Under ACC23's conditions (lines
7165–7172), suppose `−d_b` were a 2-adic square. Then `(−d_b, −d_c)_l = 1` at every prime and `−1` at
the real place, which contradicts the product formula. So two never splits in `E_b`. An index dividing
four is prime to five, so protection persists (§3.3).

The pattern is also updated in Checks 1–2 of §6.1, the Scope bullet and `plan.json` 6.1.

## REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~11/F03 (P3) — applied

Changed: "the general Steinberg-protected lifting theorem over CM fields at `p = 5`" → "the general
lifting theorem at five with a protected place over CM fields". The Layer 6 heading and the Layer 6
`title` in `plan.json` become "The lifting theorem at five with a protected place". No id changes.

Verified: the compound appears in no source and no roadmap. CaptainSude26 line 264 says "retained
Steinberg place", and the Conventions (README lines 159–160) separate that condition from the Steinberg
lifts of LocalGaloisDeformationRings §2.5. The other "Steinberg" uses (lines 268, 700, 944, 1252, 1268)
are correct.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1(a) | `K = ℚ(i)`, `S = {20}`; `S = {1,2}`; `K = ℚ(√−3)`, `S = {4}`; `K = ℚ(2^(1/3))`, `S = {3}` | `ℚ(ζ₂₀)` is CM, with `Gal(L/K) ≅ (ℤ/5)ˣ` of order 4. `L = K`. `ℚ(ζ₁₂)` is abelian, and `of_isAbelianGalois` agrees. `K(ζ₃)` has group `S₃`: conjugations are transpositions, `(12)(13)` is a 3-cycle sending `2^(1/3) ↦ ζ₃2^(1/3)` | holds for CM `K`; fails for non-CM `K` | stated; negative-control Check added |
| §1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)`; `K' = K`, `K' = L` | 7 quadratic subfields, `d ∈ {−1,±3,±5,±15}`, none `±2`, so no `ζ₈`. `(ℤ/2)³` has no `ℤ/4` quotient, so no `ζ₅`. Roots of unity `μ₁₂`, and `K(μ₁₂)` has degree 4, not 8. `K'⁺ = ℚ(√5)`. `ℚ(√5)` is totally real (does not contain `K`) | holds; needs `K' ⊇ K` | generalized; Checks added |
| MordellLawrenceVenkatesh §1.3 as input | `ℚ(i)`; `ℚ(√2)`; `ℚ(2^(1/3))` | its own Check: CM, totally real, neither. Read at the head of its open pull request; no open pull request changes it (overlaps: none) | applies to subfields of `ℚ̄` after choosing an embedding | cited as supplier |
| §6.1, odd `q` | `q = 11`, `p_b = 109`, `p_c = 2617`; `q = 3` | Both are prime. `109 ≡ 1 (4)`, `≡ 10 (11)`. `2617 ≡ 1 (436)`, `≡ 10 (11)`. `−4·109 ≡ −4·2617 ≡ 4 (11)`. `−2617 ≡ 108 ≡ −1 (109)`, a square (`33² = 1089 ≡ −1`). `−109 mod 2617 = 2508` is a square. For `q = 3`: `p ≡ 2 (3)` gives `−4p ≡ 1` | all three fields split `q`; ACC's own reciprocity step `(p_c/p_b) = 1` is unaffected | insertion applied |
| §6.1, `q = 2` | ACC conditions with `−d_b ≡ 1 (8)`; ACC's choice | Hilbert symbols: `∞` gives `−1`, every finite place gives `1`, product `−1 ≠ 1`, a contradiction. ACC's choice: `ℚ₂(√−p_b)` is ramified (`−p_b ≡ 3 (4)`). `p_b p_c ≡ 5 (8)` for (109, 2617), so `ℚ₂(√(p_b p_c))` is unramified quadratic, giving `e = 2`, `f = 2`. In general `[F_v(√−d_b,√−d_c):F_v] | 4` | splitting impossible; `e | 4`, prime to 5 | conclusion weakened above 2; Check added |
| §6.1, persistence at `P'` | `e = 1, 2, 4` at a protected `v`; `e = 5` | `ρ̄(I_w) = ⟨U^e⟩`: `U, U², U⁴ ≠ 1`, `U⁵ = 1`. The char poly `(X−1)²` restricts to subgroups. The parameter of an Iwahori-spherical `π_v` is trivial on `I_v ⊇ I_w` | protected for `5 ∤ e` (§3.3 third bullet) | text added |
| §6.1 Check 2 | `ρ(I_{v^c})` of order 3 | unchanged; the last sentence now says the preparation adds only 2-adic ramification | consistent | reworded |
| §6.2, §7.5 (consumers of 6.1) | `P` above `q ≥ 7` (§7.2) | §6.2 uses §6.1 only through §5.1 and §5.4, which need protection, `P^c ∩ S = ∅` and condition (i) (2 splits in `E_a`) | unaffected | none |
| §7.4 (same splitting pattern) | `Σ` | `L` comes from the parent's `solvable_preparation` with prescribed completions and no imaginary quadratic composita; `Σ` avoids 2, 3, 5 | complete splitting holds | none |
| F03 rename | all occurrences of "Steinberg" | 3 renamed; 7 legitimate uses remain | — | renamed |

## Checks

Dependency check, full output after the final edits:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2258 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The one new edge is MordellLawrenceVenkatesh (merge order line 163,
before EllipticCurveModularityImaginaryQuadratic at line 197), so the placement does not move.

Other checks:

- **Citation resolver.** It lists only the three source-key leads (`LeHung26, §4.4`, `OpenAI26, §9.4`,
  `CaptainSude26, §4`), which are sources, not roadmaps. It reports no Lean name found nowhere, and
  MordellLawrenceVenkatesh §1.3 resolves.
- **File checks.** `plan.json` parses as JSON and `sources.toml` as TOML. `plan.json` has 28 targets,
  96 tests and 21 suppliers. The README and `plan.json` Check counts agree for 1.1 (6) and 6.1 (5).
- **Lean.** This is a design and has no `Suggested.lean`, so there was no elaboration and no `#check`
  comparison. No gate failures were listed for this round.
- **Sources.** Nothing was fetched and `needs-references.toml` was not written. The texts read were
  MilneCM lines 255–300, ACC23 lines 7150–7195, CaptainSude26 lines 540–606 and CN23 lines 4452–4512.
- **Ownership against open work.** This was checked with `roadmaps grep` by object: "totally real or
  CM", subfields and composita of CM fields. That search found MordellLawrenceVenkatesh §§1.3–1.4,
  which no earlier round had cited.

## For the maintainer

- **New supplier.** MordellLawrenceVenkatesh §1.3 is still an open pull request. Its `README` was read
  at that pull request's head through `roadmaps show`, and no other open pull request changes it. If
  its §1.3 is renumbered, Theorem 1.1's route and *Needs* line must follow.
- **Weaker conclusion above two.** Theorem 6.1's conclusion no longer claims complete splitting at
  places of `P ∪ P^c` above two. No roadmap cites 6.1. The design is not on main.
- **Renamed heading.** The Layer 6 heading anchor changes. No roadmap cites it.
