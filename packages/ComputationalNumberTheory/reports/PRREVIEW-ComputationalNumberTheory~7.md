# Review of ComputationalNumberTheory (pull request #1408 at a901968)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `be60f36`. The folder is byte-identical to the head the previous review accepted; the two findings are in the pull request's description, which no longer describes the head.

## R01 (P3) — The summary block claims Platt's theorems for this roadmap

**Location:** pull request description, block `<!-- roadmap-summary -->`: "the top layers reach complete root isolation, explicit L-value error bounds and Platt's finite-conductor zero-line and central nonvanishing theorems" and "Platt's two theorems combine into the absence of real zeros used by Bennett–Siksek".

**Claim:** The roadmap reaches Platt's two finite-conductor theorems and their real-zero corollary.

**Witness:** `TauCetiRoadmap/ComputationalNumberTheory/README.md:120–123`: ExplicitZetaBounds §§0.3 and 0.4b "own Platt's finite-conductor material … This roadmap states none of them." `Suggested.lean:569–573` cites them in a comment only. "Bennett" occurs nowhere in the folder.

**Repair:** Replace the two clauses by: "the top layers reach complete root isolation, explicit L-value error bounds and the argument-count and Turing comparison that certifies a finite zero count of a Dirichlet L-function (§4.21a)" and "Platt's finite-conductor records and the absence of real zeros are owned by ExplicitZetaBounds §§0.3 and 0.4b and cited here; the Gram-negativity witnesses support the Chenevier–Taïbi applications."

## R02 (P3) — The prose lists Platt's results among the end theorems

**Location:** pull request description, first prose paragraph: "Its end theorems include primality criteria, factorization and integral-basis existence, Ore's residual criterion, finite saturation criteria, explicit Dirichlet and cusp-form enclosures, Platt's finite-conductor results, and sound Gram inequalities".

**Claim:** Platt's finite-conductor results are end theorems of this roadmap.

**Witness:** `README.md:387–397` lists `plattHeight`, `PlattRecord`, `PlattCentralRecord` and `LFunction_ne_zero_of_platt` under "From TauCetiRoadmap.ExplicitZetaBounds"; the Summary's headline list (`README.md:5–15`) ends at §§4.19a, 4.20a and names no Platt theorem.

**Repair:** Write "… explicit Dirichlet and cusp-form enclosures, the Turing zero-count comparison (§4.21a), and sound Gram inequalities for explicit-formula applications. Platt's finite-conductor records are imported from ExplicitZetaBounds §§0.3 and 0.4b."

## Previous findings

- none: the previous report (`PRREVIEW-ComputationalNumberTheory~6`, of `be60f36`) had no finding of its own; its account of R01–R05 of the round before it stands, the folder being unchanged.

## Verified sound

| Statement | Instances and values | Result |
| --- | --- | --- |
| ExplicitZetaBounds contract (`README.md:387–397`), which R01 and R02 touch | Supplier's `plattHeight` at its open head: `q = 1` odd: `max(10⁸, 3.75·10⁷ + 200) = 10⁸ ≤ 545 439 823`; `q = 400 000` even: `max(250, 187.5 + 200) = 387.5`; `PlattRecord` range `2 ≤ q ≤ 400 000`, `PlattCentralRecord` `2 ≤ q ≤ 2·10⁶` | Contract equals supplier's §§0.3, 0.4b and its Lean |
| 0.15 `rabin_iff_irreducible` (description: "finite fields are arbitrary") | `F = 𝔽₂`, `X² + X + 1`: divides `X⁴ − X = X(X+1)(X²+X+1)`, coprime to `X² − X`: passes, irreducible. `X² + 1 = (X+1)²`: `X⁴ − X` squarefree, not divisible: fails, reducible | Both sides agree; signature has `[Field F] [Finite F]` only |
| 1.26a `henselFactor_completeDVR` (description: "every complete DVR") | Signature: `[IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O]`, no characteristic or residue-field hypothesis. `O = ℤ₂`, `f = X² + X + 2`: residue `X(X+1)` coprime; roots `≡ 0, 1 (mod 2)` since disc `−7 ≡ 1 (mod 8)` | Description sentence correct |
| 2.6 `pRadical_multiplier_eq_iff` (description: "every full order at every prime, monogenic or not") | Signature: `R : Subalgebra ℤ K`, `hfg`, `hspan`, `[Fact p.Prime]`; no generator. `R = ℤ[√5]`, `p = 2`: radical `(2, 1+√5)`, multiplier ring contains `(1+√5)/2 ∉ R`: both sides false | Description sentence correct |

Rows for all other statements stand as in the previous review, of `be60f36`.

- Change set: `git diff be60f36 a901968` is empty for the whole tree; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Gate at `a901968` (worker): every scanner 0, `depcheck=0`, `build=0`, OK. Dependency check rerun with the moved order: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as `README.md:179` and `:256` declare): exit 0, 27 `declaration uses sorry` warnings, no other warning or error; `signatures.md` reports 0 of 64 declarations with a lost binder.
- Cross-roadmap citations resolved again: ExplicitZetaBounds §§0.2, 0.3, 0.4, 0.4b with `plattHeight`, `PlattRecord`, `PlattCentralRecord`, `LFunction_ne_zero_of_platt`, `RiemannHypothesisUpTo` (README 471–681, `Suggested.lean` 109–142 at its open head); ExplicitNumberFields 1.1a with both remainder names (README 1315–1328); EffectiveDiophantineMethods §§0.1–0.3, 0.9, 1.7–1.8, 3.1–3.3, 3.17–3.18; EllipticLegendreCharacterInterfaces §§5.1–5.2; HeightsRationalPointsAndObstructions §1.17; ClassicalArithmeticCompletion §§3.3, 3.5, 3.25, 3.27, 3.33, 3.48, 5.1–5.3, 5.10–5.11, 5.16, 5.22 on main.
- `citations.md` leads: AlgebraicModularFormsAndSerreWeights R15.2 and R15.3 are the identifiers that roadmap's README (line 18) assigns to its Layers 2 and 3, so the citations resolve; the three Lean-name leads are two ClassicalArithmeticCompletion names and this file's `PrattTree.validList` (`Suggested.lean:93`).
- Description against the head, other sentences: folder contents, the six open suppliers of the `depends-on` block (equal to the README's contract subsections not on main), "0 problem(s)", "0 path(s)", `sorry` the only warning: all agree with the head. The declared gap `gap:local-two-quotient` is at `README.md:492`, unchanged.
- Duplication by object, searched over open heads and main: Pratt trees, strong liars, AKS, Pocklington, Rabin's criterion, Ore's criterion, Miller bases and the p-radical occur in no other roadmap; "multiplier ring" occurs in EllipticPeriods (lattices in ℂ), ArithmeticStatisticsPartII and ComplexMultiplicationAndExplicitReciprocity (order ideals), which `README.md:56–59` distinguishes.

Overlap check: read EffectiveDiophantineMethods, EffectiveClassNumbers, EllipticLegendreCharacterInterfaces, ClassicalArithmeticCompletion, AnalyticNumberTheoryPartI, ModularForms (third list empty); p-adic records, selected roots, local images, saturation and ellipsoids: owner EffectiveDiophantineMethods, comparisons only here (`README.md:128–136`); character-sum point count: owner EllipticLegendreCharacterInterfaces §5 (its README line 14 agrees); Smith and Hermite forms, relation lattices: owner ClassicalArithmeticCompletion; nothing shared with the other three.

Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); the largest share and the comparison of contents stand as in the earlier full review; no layer added, removed or reordered.

## Not verifiable

- The fifteen seeded targets (0.12, 1.3, 1.10, 1.12, 1.13a, 1.17, 1.21, 1.24, 1.26, 3.2, 3.12, 4.9, 4.17, 4.18, 4.25) lie in unchanged text and were not opened at their locators this round.
- "after 0 independent review rounds and 2 red-team rounds on the job board" in the description: the board's history is not part of the head; not checked.
- Ownership against the open heads of AlgebraicModularFormsAndSerreWeights, EffectiveDiophantineMethods and HeightsRationalPointsAndObstructions was read through the roadmap index, not from sibling checkouts.

## Source issues

- none

## For the human reviewers

- Licence: `PrattNotes` (`README.md:2753`) is a set of undated author lecture notes on a personal page, and `Sutherland` (`README.md:2769`) and `MilneANT` (`README.md:2765`) are course notes; none is a refereed publication.
- Licence: `Platt` is cited as the arXiv preprint 1305.3087 (`README.md:2749`) with line and page locators into that version, not the published article.
