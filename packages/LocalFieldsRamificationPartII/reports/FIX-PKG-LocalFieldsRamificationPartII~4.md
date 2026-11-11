# FIX-PKG-LocalFieldsRamificationPartII~4

Repair round for `packages/LocalFieldsRamificationPartII`, settling the three findings of
`REV-PKG-LocalFieldsRamificationPartII~3` (F01–F03). Only `packages/LocalFieldsRamificationPartII/README.md`
changed (§1.1, §4.3 Checks, §5.4 Checks, Notes on the sources). `Suggested.lean`, `metadata.toml`,
`sources.toml` and `design/plan.json` are unchanged: no Lean statement is affected, no new source is
cited and no supplier gap is needed.

## REV-PKG-LocalFieldsRamificationPartII~3/F01 (P2) — applied

Verified. `A = ℤ[√2]_(7)` is integrally closed with two maximal ideals `(3 ± √2)` (`7 = (3+√2)(3−√2)`,
the generators sum to the unit `6`). For `x = (3−√2)/(3+√2)` the normalized values are `−1` at
`(3+√2)` and `1` at `(3−√2)`, so `x, x⁻¹ ∉ A = A_{(1)}`. `temkin17` line 333 localizes at a prime `𝔮`;
`aid25` lines 366–371 use maximal ideals.

Old → new: "every localization of an integrally closed `A` is a valuation ring" → "for `A`
integrally closed in `Frac A` and every prime `𝔮`, `A_𝔮` is a valuation ring of `Frac A`, so `A` is
Prüfer; `A` need not be local". The route now runs through `A_𝔮 ⊇ (B_A)_{𝔮∩B_A}`. Added the
semilocal negative-control Check and a Notes-on-the-sources bullet for Lemma 2.3.4.

Pattern search: the only other uses are §1.5's Prüfer definition (localization at every maximal
ideal: correct) and §2.1's route ("`A = A′ ∩ L`, a Prüfer domain by §1.1"; "`W` is a localization of
`A`", at a prime). Both are consistent with the corrected statement and unchanged. `design/plan.json`
and `design/README.md` already write `A_q`.

## REV-PKG-LocalFieldsRamificationPartII~3/F02 (P3) — applied

Verified. Over `ℚ_7ʰ` the Eisenstein `X⁷ − 7` gives a separable extension of prime degree `7 = p`
with `e = 7`, not contained in `(ℚ_7ʰ)ᵗ`. It is therefore purely wild, so the identity of `ℚ_7ʰ` is
not maximal and the old Check falsified both sides.

Old → new: the Check now uses `K = ℚ(t)`, `t`-adic (`p = 1`), `E = Kʰ`: `Eʰ/Kʰ` is the identity,
which is maximal separable purely wild at `p = 1`. Since `√(1+t) ∈ Kʰ ∖ ℚ(t)`, `E/K` is neither
henselian nor purely wild. One sentence records why `ℚ(√2)` at `7` tests nothing. The reflection
Check (lines after it) is kept.

## REV-PKG-LocalFieldsRamificationPartII~3/F03 (P3) — applied

Verified with §2.2/§2.3 of this roadmap. For the trivial valuation `Kᵘ = Kˢ`, so a trivially valued
algebraic extension is unramified exactly when it is separable. At `i = 0` the steps are (`L/K`
trivially valued, `L/K`); at `i = d` they are (`L/K`, `κ_L/κ_K` trivially valued). In the reviewer's
`𝔽₄((t))/𝔽₂((t))` example all four have degree 2.

Old → new: "one step is the identity, tautological" → the actual endpoint steps. The criterion
reduces there to "unramified ⇒ separable with separable residue extension" (§2.3). Kept the
`𝔽₄((t))` computation and added `𝔽_p(u^{1/p})((t))/𝔽_p(u)((t))`: its inseparable trivially valued
residual step is not unramified, and neither is the extension. Pattern: §§5.5, 5.6 and 6.2 make no
endpoint claim.

## Checks

- **Elaboration.** `lake env lean packages/LocalFieldsRamificationPartII/Suggested.lean` from the pinned
  content checkout: exit 0, exactly seven warnings "declaration uses `sorry`" at lines 105, 113, 128,
  145, 160, 171, 181; no error. The two `TauCeti.*` object files were present (no build needed).
  The file is unchanged this round.
- **Signatures.** Elaborated a scratch copy with `#check @name` for all fourteen declarations (exit
  0). Every elaborated type matches its README statement and the supplied `signatures.md`. Examples:
  `[HenselianLocalRing ↥V]` on the KPR theorem; compactness, topological group and total
  disconnectedness on both groups of the section theorem; `[vK.HasExtension vL]` on Abhyankar;
  `Algebra.trdeg K L = ↑n` on the height bound; `[Fact p.Prime] [CharP F p]` on the `cd_p` bound.
  Nothing changed.
- **Dependency gate.** Exact output:

  ```
  depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no roadmap Lean name
  found nowhere. Mathlib `ValuationSubring.ofLE`, newly used in the §1.1 route (already in its
  *Needs:* line), is at the pin (`Mathlib/RingTheory/Valuation/ValuationSubring.lean:232`).
- **Ownership.** No new construction or target was introduced. The three repairs restate an
  existing target and two Checks of this roadmap, so no ownership question arises. The overlap file
  lists no conflicting head and no dropped or revision-only id. No README id was renumbered or
  removed.
- **Sources.** No new work cited. The locators used (`temkin17` line 333, Lemma 2.3.4, p. 105; `aid25`
  Theorem 3.7, lines 366–371) are already in the manifest. `needs-references.toml` was not created.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 `A_𝔮` is a valuation ring for every prime `𝔮` | `V = ℤ_(7)`, `A = ℤ[√2]_(7)`, `𝔮 = (3+√2)` | `x = (3−√2)/(3+√2)`: value at `(3+√2)` is `−1`, so `x ∉ A_𝔮`; `x⁻¹` has value `1` there and `A_𝔮` is the discrete valuation ring of that prime, so `x⁻¹ ∈ A_𝔮` | true | statement restricted to primes |
| same, identity localization | `S = {1}`, same `A` | values of `x` are `(−1, 1)`, of `x⁻¹` `(1, −1)`; neither in `A` | arbitrary localization false | negative-control Check added |
| same, `𝔮 = 0` | any `A` | `A_0 = Frac A`, valuation ring with trivial valuation | true | none |
| same, trivial `V` | `V = K` | `A ⊇ K`, `A` integral over `K` ⇒ field, `A = Frac A`; only prime `0` | true | none |
| same, `A = V` | `L = K` | `A_𝔮 = V_𝔮`, a coarsening of `V` (`ofPrime`) | true | none |
| §1.1 route `A_𝔮 ⊇ (B_A)_{𝔮∩B_A}` | `A = ℤ[√2]_(7)`, `B_A = A` | `𝔮 ∩ B_A = 𝔮`, equality; `B_A` at its maximal ideal `𝔮` is a valuation ring by the first clause | true | route rewritten |
| §1.1 "integrally closed" needed | `V = ℤ_(3)`, `A = ℤ_(3)[3√2]` ⊂ `ℚ(√2)` (`3` inert) | `A` local with `𝔮 = (3, 3√2)`, so `A_𝔮 = A`; `√2 = a + 3b√2` forces `b = 1/3 ∉ ℤ_(3)`, `1/√2 = √2/2` forces `b = 1/6 ∉ ℤ_(3)`; `√2` integral over `A` | not a valuation ring, `A` not integrally closed: hypothesis needed | none (made explicit "in `Frac A`") |
| §4.3 reverse implication needs henselian `E/K` | `K = ℚ(t)`, `t`-adic, `E = Kʰ` | residue char 0 ⇒ `p = 1`, `(Kʰ)ᵗ = Kˢ`; RHS second clause: `Eʰ = Kʰ`, identity maximal = true; first clause: `K(√(1+t)) ⊗ Kʰ ≅ Kʰ × Kʰ` ⇒ ≥ 2 prolongations = false; LHS: `K(√(1+t)) ⊆ E ∩ Kᵗ` ⇒ not purely wild = false | Check discriminates | Check replaced |
| same, old witness | `ℚ(√2)/ℚ` at `7` | RHS maximality: `X⁷ − 7` Eisenstein, `e = 7 = p`, degree 7 not in `Kᵗ` ⇒ identity not maximal = false; LHS false | did not discriminate | recorded in the Check |
| §4.3, `√(1+t)` facts | `ℚ(t)` | residue of `X² − (1+t)` is `X² − 1 = (X−1)(X+1)`, simple roots `±1` (char 0); `1+t` has order 1 at `t = −1`, not a square in `ℚ(t)` | `[K(√(1+t)):K] = 2`, `[Eʰ:Kʰ] = 1` | none |
| §4.3 vs Check "`p = 1` both sides say `E = K`" | `E = Kʰ` above | `E ≠ K`, LHS false, RHS false | consistent | none |
| §5.4 endpoint `i = 0` | `𝔽₄((t))/𝔽₂((t))`, `d = 1` | coarse (trivial valuation) degree 2, separable ⇒ unramified = true; residual = original, `e = 1`, `f = 2` ⇒ unramified = true; LHS true | true ⇔ true ∧ true | Check replaced |
| §5.4 endpoint `i = d = 1` | same | coarse = original (true); residual `𝔽₄/𝔽₂` trivial valuation, degree 2, separable (true) | true ⇔ true ∧ true | Check replaced |
| §5.4 endpoint, inseparable residue | `𝔽_p(u^{1/p})((t))/𝔽_p(u)((t))`, `i = 1` | residual `𝔽_p(u^{1/p})/𝔽_p(u)` trivial valuation, degree `p`, inseparable ⇒ not in `Kˢ` ⇒ false; coarse = original, residue inseparable ⇒ false; LHS false. At `i = 0`: coarse `L/K` trivially valued, inseparable ⇒ false | false ⇔ false ∧ false | new Check clause |
| §5.4 wrong model "trivially valued step is always unramified" | same extension, `i = 1` | wrong model gives residual = true, so RHS = coarse = false; the Check's computed value "not unramified" for the residual step refutes the model | excluded by §2.2 `Kᵘ = Kˢ` | Check states it |
| Notes bullet on Temkin Lemma 2.3.4 | `temkin17` lines 330–336 | statement "all localizations", proof `A_q` (line 333), parenthesis "Prüfer" (line 332) | consistent with §1.1 | bullet added |

## For the maintainer

- No Lean name, section number or target changed; other roadmaps citing this one (AdicCoefficientsAndComparisonsPartII,
  QuadraticFormInvariantsPartII) are unaffected.
- The review's "Source issues" list was read as data. Its Lemma 2.3.4 item is now recorded in the
  README's Notes on the sources. Its other items were already recorded there or affect nothing
  stated here.
- Ownership against open pull requests: the brief gives the open roadmap heads through the
  `roadmaps` tools. No new object was introduced this round, so no new ownership search was needed.
- No suspicious instruction was found in the review text.
