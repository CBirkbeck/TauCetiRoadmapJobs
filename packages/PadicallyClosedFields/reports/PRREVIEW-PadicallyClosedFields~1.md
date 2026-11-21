# Review of PadicallyClosedFields (pull request #2905 at c07ebef)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings, all P2. The two Kochen-operator statements of `Suggested.lean` are false at `f = 0` (the operator is then identically `0`), the middle step of Lem. 3.5 in 1.3 is false without the hypothesis that `K` is algebraically closed in `L`, and the uniqueness half of the p-adic closure theorem, a headline of the summary that is statable with the file's own definitions, is absent from `Suggested.lean`. There are six small corrections and two format notes, none blocking. No cited source could be read legally, so every locator is unverified and the comparison of wording and arrangement with Prestel–Roquette is left to the human reviewers.

## R01 (P2) — `isPValuationOfType_iff` and `range_kochen_eq` are false for `f = 0`

Both statements quantify over every `f : ℕ`, and an implementer cannot prove them as written. For `f = 0`, `x ^ p ^ 0 - x = 0`, so `kochen p e 0 x = 0` for every `x` when `e > 0`, and the field `residue_pow` of `IsPValuationOfType` reads `x ^ 1 = x`, which holds in every residue field.

For `isPValuationOfType_iff` (`Suggested.lean` line 253) take `K = ℚ_p(√p)` with its valuation ring, `e = 1`, `f = 0`. The right side holds: `|p| < 1`, `(x¹ − x)² = 0 ≠ 1`, and `kochen p 1 0 x = 0 ∈ V`. The left side fails: `[|p|, 1)` contains the two values `|p|` and `|√p|`, more than `e = 1`. For `range_kochen_eq` (line 261) take `K = ℚ_p`, `V = ℤ_p`, `f = 0`: `V` is henselian and `IsPValuationOfType p 1 0 V` holds, while `Set.range (kochen p 1 0) = {0} ≠ ℤ_p`. I proved the three facts used (`kochen p e 0 x = 0`, the right side of the equivalence for any `V` with `|p| < 1`, and `Set.range (kochen p 1 0) = {0}`) on a copy of the file, each by `simp`.

The smallest change: add `(hf : 0 < f)` to both theorems, and say in 0.1 (line 82) and in the Kochen convention (line 70) that a type `(e, f)` has `e, f ≥ 1`. With `f ≥ 1` and `e ≥ 1` both statements survive the checks I made: integrality on `𝔪` forces `|π|^e ≤ |p|` for every `π ∈ 𝔪`, hence at most `e` values in `[|p|, 1)`, and for `e = 1` Hensel's lemma solves `p·a·y² − y − p·a = 0` and then `x^q − x = y` for each `a ∈ V`.

## R02 (P2) — The second step of Lem. 3.5 in 1.3 is false as stated

The three steps are declared targets, and the second reads "if `k_K = k_L`, `K` contains a prime element of `L` that is a root of an Eisenstein polynomial over `K`" (line 184), under the only standing hypothesis "`L` henselian p-valued with residue field of order `q`". Take `K = ℚ_p ⊆ L = ℚ_p(√p)`: both residue fields are `𝔽_p`, and `K` contains no prime element of `L`, since every element of `ℚ_p` has value in `|p|^ℤ` and a prime element of `L` has value `|p|^(1/2)`.

The statement is true when `K` is algebraically closed in `L` (the hypothesis of Thm. 3.4, whose proof these steps are): then a prime element of `L` that is algebraic over `K` lies in `K`. The smallest change is to put that hypothesis in the sentence, or to state the step as "`L` has a prime element that is a root of an Eisenstein polynomial over `K`", whichever the source proves; I could not read the source to say which.

## R03 (P2) — The uniqueness of the p-adic closure is a headline of the summary, is statable, and is not in `Suggested.lean`

The summary gives as a headline that a p-valued field "has a p-adic closure, unique up to isomorphism exactly when its value group is elementarily equivalent to `ℤ`" (line 10; Thm. 3.2 in 1.2). `Suggested.lean` states only the existence (`exists_padicClosure`, line 120), so the acceptance test does not test the half that carries the content. It is statable with what the file already declares: under `IsPValuation p d V`, `IsPresburgerGroup (valueGroup V)` holds if and only if any two algebraic extensions `(L, W)`, `(L', W')` of `(K, V)` with `IsPadicallyClosed p d W` and `IsPadicallyClosed p d W'` admit `σ : L ≃ₐ[K] L'` with `W'.comap σ = W`, in the form `nonempty_algEquiv_iff` already uses. The change is to add that statement.

## C01 — The first Check of 1.5 applies Cor. 3.11 outside its hypotheses

Cor. 3.11 is stated for extensions "of the p-rank of `K`"; the Check (line 216) takes `K = ℚ_p`, of p-rank `1`, and the extensions `ℚ_p(√p)`, `ℚ_p(√(up))` of p-rank `2`. Its conclusion is true, but only by the trivial direction, so the Check does not exercise the theorem. An instance inside the hypotheses: `K = ℚ_p((t))` with the composed valuation, `L = K(√t)`, `L' = K(√(ut))`, both henselian of p-rank `1`; `t` is a square in `L` only, because `√t, √(ut) ∈ L'` would give `√u ∈ L'` and residue degree `2`.

## C02 — The first Check of Layer 4 gives a reason that does not separate squares from discs

"the nonzero squares are infinite and coinfinite, while a quantifier-free `valLang` formula … defines a finite Boolean combination of zero sets and discs" (line 348): the disc `ℤ_p` is also infinite and coinfinite. What separates them is the behaviour at `0`: `p^(2k)` are squares and `p^(2k+1)` are not, so both the set and its complement accumulate at `0`, whereas a finite Boolean combination of points and discs contains or misses a punctured neighbourhood of `0`.

## C03 — A `pcLang d`-substructure is a subring, not a field

"every substructure of a p-valued field of p-rank `d` is again p-valued of p-rank `d`" (line 331): the languages have no inverse, and the README's own Check (line 354) computes the substructure generated by `∅` as `ℤ`. The true statement is about the fraction field of the substructure with the induced valuation: it contains the `u_i`, which stay `𝔽_p`-independent modulo `p`, and `O_A/p → O/p` is injective, so its p-rank is `d`. Say "the fraction field of every substructure".

## C04 — The module docstring of `Suggested.lean` lists two copies the file does not contain

Lines 17–18 say that `orderedGroup` and `orderedGroupStructure` are copied from SaturationAndQuantifierElimination; the file declares neither (only `IsPresburgerGroup`). The import of `TauCeti.ModelTheory.Algebra.Group.Basic` served those copies and is now unused: a copy of the file without that line elaborates with the same twelve `sorry` warnings. Drop the two names from the docstring and the import, or restore the copies if a statement is meant to use them.

## C05 — "Macintyre's theorem for `ℚ_p`" is claimed in the scope paragraph and also owned by LogicAndDefinabilityInNumberTheory §2.2

The scope paragraph says this roadmap owns "its quantifier elimination in `pcLang d` and Macintyre's theorem for `ℚ_p`" (line 505), and four lines below that LogicAndDefinabilityInNumberTheory owns Macintyre's elimination over a fixed finite extension `F` of `ℚ_p`, which at `F = ℚ_p` is Macintyre's theorem for `ℚ_p` (its README, §2.2, line 272; its scope, line 1835). The two statements do differ: there, formulas with coefficients from `F` in the one structure `F`; here, parameter-free and uniform over all p-adically closed fields of p-rank `d`. The scope sentence should say so, for example "the parameter-free elimination for the theory of p-adically closed fields of p-rank `d`, of which Macintyre's theorem is the case `d = 1`; the elimination with coefficients over a fixed `F` is LogicAndDefinabilityInNumberTheory §2.2". The same applies to the bullet on infinite definable sets having interior, which §2.2 there states over `F` through its dimension theory.

## C06 — The description says "Each text names the other"; the other text does not name this roadmap

LogicAndDefinabilityInNumberTheory at its open head nowhere contains the name PadicallyClosedFields; its scope sentence says only that its elimination is "not over arbitrary p-adically closed fields". The sentence that would be right: "Its scope paragraph excludes arbitrary p-adically closed fields; this README names it in Scope and ownership."

## N01 — The module docstring does not say why the unstated headlines are unstated

"Layers 0.2–0.3, 2, 3.4 and 6 are stated in `README.md` only" names layers, not the carrier each headline lacks. One clause each would do: the embedding theorem needs saturation, which is SaturationAndQuantifierElimination's and not at the pins; decidability needs a coding of theories; the Nullstellensatz and Hilbert's seventeenth problem need the `π`-adic operator over a base and the Kochen ring.

## N02 — `IsFormallyPadic` is declared and used by no statement

Either state with it the absolute case of Thm. 6.4 (formally p-adic of type `(e, f)` if and only if `p` is not a unit of the ring generated by the values of `γ`), or leave the definition to the README.

## Questions for the author

- Rem. 4.12 (line 245): for a p-valued `L'`, `ℚ ⊗ Γ = ℚ + Γ` says that `Γ/Δ` is divisible, which is the `ℤ`-group condition of 1.1, so a henselian such `L'` is p-adically closed. What does the remark add to Thm. 4.1: a different p-rank for `L'`? I could not read p.82.
- Thm. 6.15 (line 387): is the uniqueness "the only p-valuation of `K`" of any type and p-rank, or the only one of relative type `(e, f)`? I could not read p.115.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 p-rank as `Nat.card (V/p) = p^d`, `d ≥ 1` | `p` a unit; `ℤ_p`; `ℤ_p[√p]`; Gauss extension | card `1 ≠ p^d`; `p`; `p²` (basis `1, √p`); infinite, `Nat.card = 0` | determines the object | none |
| 0.1 type `(e, f)`, Lean structure | `e = 0`; `f = 0`; `ℚ_p(√p)` | `e = 0` empty with `|p| < 1`; `f = 0` makes `residue_pow` trivial; two values in `[|p|, 1)` | degenerate at `f = 0` | R01 |
| 0.2 coarse valuation, core field | `ℚ_p`; `ℚ_p((t))`; place into `F` | `Δ = Γ`, `V̇` trivial; core `ℚ_p`, `Δ ≅ ℤ`; sub-value-group `mℤ`, `e·f` divides `d` | true | none |
| 0.3 Cor. 2.10 | `ℚ_p(√p)/ℚ_p`; `ℚ_p((t))(√t)` | `[L:K] = 2`, `[Γ̇_L:Γ̇_K] = 1`, rank `1 → 2`; `[Γ̇_L:Γ̇_K] = 2 = [L:K]`, rank `1` | both directions agree | none |
| 1.1 characterization and Lean `isPadicallyClosed_iff` | `Γ = ℤ`; `Γ = ℤ ×ₗ ℤ`; `Multiplicative ℤ` in `IsPresburgerGroup` | `Γ/Δ = 0` divisible; `Γ/Δ = ℤ` not; `ϖ = 1`, `γ = k + nδ` | consistent; copy equals supplier's definition | none |
| 1.2 Thm. 3.2 | `ℚ`; `ℚ_p((t))` with `√t`, `√(ut)`; a prime `ℓ ∤ p(p−1)` | unique, `Γ = ℤ`; both roots give `√u`, residue degree `2`; use `√[ℓ]{t}`, `√[ℓ]{pt}`, ramification rises | true; Lean has existence only | R03 |
| 1.3 Thm. 3.4, Lem. 3.5–3.7 | `S = L`; `ℚ_p ⊆ ℚ_p(√p)`; `ℚ ⊆ ℚ_p` | trivial; `k_K = k_L = 𝔽_p`, no prime element of `L` in `K`; `b = c·uⁿ` by density | step two false as written | R02 |
| 1.4 Thm. 3.8 | `K = ℚ_p`; `ℚ_p((t))(√t)` | `L = K`, `T = Kˣ`; `T/Kˣ ≅ ℤ/2 ≅ Γ_L/Γ_K`, `[L:K] = 2` | consistent | none |
| 1.5 Cor. 3.11, Thm. 3.12, Lean `nonempty_algEquiv_iff` | `n = 0`; `L = L' = K`; `K = ℚ_p`; Check line 216 | both sides `a = 1`; trivial; `(ℚ/ℤ) ⊗ 0 = 0`; p-ranks `2 ≠ 1` | theorem fine; Check outside hypotheses | C01 |
| 3.1 axiomatization | `ℤ`-group axiom on `ℤ`, `ℤ ×ₗ ℤ` | `a = i + nx`, `0 ≤ i < n` holds; `(0,1)` not `≡ i·(1,0)` mod `2` | true | none |
| 3.2 model completeness, Lean form | identity embedding; `ℚʰ → ℚ_p` | iff trivial; elementary, as AxKochenErshov 6.1 also states | consistent | none |
| 3.3 completions | `d = 1`; `ℚ_p(√p)` against `ℚ_p(√(up))`; `g` by Krasner | one class; `∃x, x² = p` separates; `g` irreducible over `ℚ_p`, every root generates `F` | true; derivation sound | none |
| 3.4 decidability, Cor. 5.4 | `d = 1`; unramified of degree `d` | `Th(ℚ_p)`; one extension, theory complete | consistent with AxKochenErshov 6.1 | none |
| Layer 4 `exists_isQF_iff` | `d = 1`; `ℚ_p(√p)`, `u = (1, √p)`; `P₀` | `u₁` a unit mod `p`; `1, √p` basis of `𝔽_p[√p]/(√p)²`; `P₀(x) ↔ x = 1` | statement well-formed; prose slip on substructures | C03 |
| Layer 5 `kochen`, junk values | `℘ = 0`; `℘² = 1`; `e = 0`; `f = 0` | `0` (true value); `0` at pole; constant `p⁻¹`; identically `0` | false at `f = 0` | R01 |
| Layer 5 Lem. 6.1, Thm. 6.15 for `e, f ≥ 1` | `√p` in `ℚ_p(√p)`; `ℤ_p` | `|γ₁,₁(√p)| = |p|^(−1/2) > 1`, `γ₂,₁(√p)` a unit; `γ` onto `ℤ_p` by Hensel twice | true with `0 < f` | R01 |
| Layer 6 Check | `X² + Y² + 1` over `ℚ_p`, `p` odd; `p = 2` | point mod `p` lifts; `(−1, −1)₂ = −1`, no point | "p odd" needed and present | none |
| Layer 7 `exists_absoluteGaloisGroup_equiv` | `ℚʰ`; `ℚ_p` | `G ≅ G_{ℚ_p}`; `F = ℚ_p`, `d = 1` | consistent | none |

- Source locators checked against the text: 0 of about 72 (no source readable legally).
- Library declarations opened at the pin: `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` line 42), `Language.group` and `structureOfGroup` (`TauCeti/ModelTheory/Algebra/Group/Basic.lean` lines 55, 103); no Kochen operator, p-valuation or p-adically closed field in either library.
- Cross-roadmap citations resolved: AxKochenErshov 0.1, 0.2, 5.6, 5.8, 6.1 and SaturationAndQuantifierElimination 0.1, 0.3, 2.2, 2.5, 3.1, 3.3, 4.3 at their open heads; LocalFieldsRamificationPartII §§1.3, 4.1, 5.1, MassFormula Layer 4, Completed/LocalFieldsRamification Layer 2 on main; LogicAndDefinabilityInNumberTheory §2.2 at its open head. The five copied declarations agree with their owners' text.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: exit 0, twelve `sorry` warnings, nothing else.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on the twelve theorems: none closes. Elaborated types compared with the README statements: no binder lost.

Overlap check: read AxKochenErshov, SaturationAndQuantifierElimination, LogicAndDefinabilityInNumberTheory, LogicAndDefinabilityInNumberTheoryPartII, LocalFieldsRamificationPartII; shared: Macintyre's elimination at `ℚ_p` (with coefficients over a fixed `F`: LogicAndDefinabilityInNumberTheory §2.2; parameter-free over all models: this roadmap, C05); `valLang`, `valueGroup`, coarsening: AxKochenErshov; `IsPresburgerGroup`: SaturationAndQuantifierElimination.

Source independence: 0 passages compared with 0 sources (none readable); largest share Prestel–Roquette, about 66 of about 72 locators; contents not compared: the text and its table of contents could not be read.

Research link: Layers 1–5 are Prestel–Roquette 1984 and Macintyre 1976; Layer 7 is the direction that Efrat 1995 and the Galois characterization of p-adically closed fields reverse; Layer 6 is Jarden–Roquette 1980 and Kochen 1969. Rests on the README's references, not on a text read.

## Not verifiable

- Prestel–Roquette, *Formally p-adic fields* (LNM 1050): every locator of Layers 0–6; the publisher's page is paywalled and no legal copy was found.
- Macintyre 1976: Thms. 1–4, §§2.1, 2.4 and the appendix; the journal page is on a host in no licence class.
- Efrat 1995, Rem. 4.4, and Jarden–Ritter 1979 (the Check of Layer 7): paywalled.
- The restored readings of Thm. 3.10, Cor. 3.11 and Thm. 5.5 that the description mentions could not be compared with the print.

## Source issues

- none

## For the human reviewers

- Not tested: Prestel–Roquette carries about 66 of about 72 locators and could not be read; wording and arrangement were not compared with it.
- Arrangement: by the README's own theorem numbers, Layers 0, 1, 2 cite only results 2.x, 3.x, 4.x, Layers 3–4 only 5.x, Layer 5 only 6.x, Layer 6 only 7.x, in the book's order; the layer scopes were not compared with its contents page.
- Licence: the description says statements were extracted from the texts of Prestel–Roquette and Macintyre, and Thm. 6.15 read from a scan; where those copies came from is not stated.
