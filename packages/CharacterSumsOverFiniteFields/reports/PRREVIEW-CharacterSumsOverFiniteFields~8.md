# Review of CharacterSumsOverFiniteFields (pull request #1712 at 52b794d)

**Verdict:** accepted

Incremental re-review of the 33 changed lines of `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` since `3b6487f` (the previous review's head); `Suggested.lean` and `metadata.toml` are unchanged since that head. Results of the mechanical checks at `52b794de9ffc61787be41e52ce900c0319c6ad49`:

- Gate: run by me from the worktree with `--base origin/main`; every scanner 0, `OK`.
- Dependency check: `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`; no UPWARD or CYCLE line, no `moved:` line.
- Build: `lake env lean` on `Suggested.lean` exits 0 with exactly 35 `declaration uses sorry` warnings and nothing else.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.
- Signatures: the Lean file is byte-identical to the one the previous review elaborated with `#check @name` for all 54 declarations; the worker's two "dropped binder" leads (`crtFactorLeft`, `crtFactorRight`) remain false positives, the coprimality hypothesis `h : c₁.Coprime c₂` and `[NeZero c₁] [NeZero c₂]` being explicit in both signatures (`Suggested.lean:463, 468`).

No finding. The sole finding of the previous review is repaired, and the repair introduced no new problem.

## Previous findings

- R01 — repaired: `README.md:738–744` now reads the conductor of `χ` "from the libraries, not reproved": `χ = changeLevel χ₁ · changeLevel χ₂` at level `c₁ c₂`, conductors of the factors by Mathlib's `conductor_changeLevel` and `conductor_dvd_level`, product by Tau Ceti's `conductor_mul_of_coprime`, primitivity as the case `conductor χ = c₁ c₂`; the API bullet at `:751` is a consequence; the declaration is listed with its file under *From Tau Ceti* (`:185–189`, `:393–397`) and the two Mathlib lemmas under *From Mathlib* (`:354–355`); the 0.7 *Needs:* line (`:744–745`) and the Layer 0 Dependencies (`:777–779`) name it.

## Verified sound

**The changed passages, against the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):

| README claim | Declaration at the pin | Agreement |
|---|---|---|
| `:393–395`: `conductor_mul_of_coprime`, "for `χ, ψ` modulo the same `N` with coprime conductors, `conductor (χ ψ) = conductor χ · conductor ψ`, any coefficient monoid with zero" | `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean:62–64`: `{R} [CommMonoidWithZero R] {N : ℕ} {χ ψ : DirichletCharacter R N} (hcop : χ.conductor.Coprime ψ.conductor) : (χ * ψ).conductor = χ.conductor * ψ.conductor` | exact: same level, no `NeZero N`, no ring structure beyond `CommMonoidWithZero` |
| `:395–396`: `conductor_prod_of_pairwise_coprime`, "its finite-product form, for a nonempty index set or nonzero level" | `Conductor.lean:76–80`: pairwise coprime conductors on `s : Finset ι`, `hlevel : s.Nonempty ∨ N ≠ 0`, `(∏ i ∈ s, χ i).conductor = ∏ i ∈ s, (χ i).conductor` | exact |
| `:354–355`: `conductor_dvd_level`, `conductor_changeLevel` ("`changeLevel` to a nonzero multiple of the level preserves the conductor") | Mathlib `NumberTheory/DirichletCharacter/Basic.lean:250`: `conductor χ ∣ n` (no hypothesis); `:363–364`: `{m : ℕ} [NeZero m] (hm : n ∣ m) : (changeLevel hm χ).conductor = χ.conductor` | exact; the `[NeZero m]` is what "nonzero multiple" records |
| `:185–189`: the *From Tau Ceti* entry names the module `TauCeti.NumberTheory.DirichletCharacter.Conductor` | the file exists at the pin, `public section`, `namespace DirichletCharacter` | the fully qualified names are `DirichletCharacter.conductor_mul_of_coprime`, `DirichletCharacter.conductor_prod_of_pairwise_coprime`, as the README writes them |

**The 0.7 argument** (`:738–744`), step by step: (i) the pointwise identity `χ(x) = χ₁(x) χ₂(x)` with `χ_i(x)` read modulo `c_i` is `χ = changeLevel χ₁ · changeLevel χ₂` in `DirichletCharacter ℂ (c₁ c₂)` (products of `MulChar`s are pointwise, and `changeLevel` evaluates through `ZMod.castHom`); (ii) `conductor (changeLevel χ_i) = conductor χ_i` by `conductor_changeLevel`, which needs `c₁ c₂ ≠ 0`: the Lean carries `[NeZero c₁] [NeZero c₂]` (`Suggested.lean:460–468`), and the *From Mathlib* entry states the nonzero-level hypothesis; (iii) `conductor χ_i ∣ c_i` by `conductor_dvd_level`, so the two conductors divide coprime numbers and are coprime; (iv) `conductor_mul_of_coprime` gives the product; (v) for `0 < d₁ ∣ c₁`, `0 < d₂ ∣ c₂`, `d₁ d₂ = c₁ c₂` forces `d₁ = c₁`, `d₂ = c₂`, so primitivity of `χ` is primitivity of both factors. Each input is a pinned declaration or 0.7's own kept target; nothing is derived from the target itself. Remark (no change asked): at a zero level (`c₁ c₂ = 0`, which the Lean excludes) the product formula still holds, both sides being `0 = 0 · 1` by `conductor_eq_zero_iff_level_eq_zero`, so the statement needs no hypothesis the prose lacks.

**The adversarial table.** Rows for the changed statement were recomputed in this review (script `py/cond.py` in the job's scratch directory; characters enumerated as homomorphisms on `(ℤ/n)^×`, conductors as the least divisor `d` of `n` with `χ = 1` on units `≡ 1 (mod d)`). Rows for untouched statements carry forward from the previous review at `3b6487f`, which computed them.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.7 conductor product and primitivity (changed) | all 100 characters modulo `15, 20, 21, 24, 35, 36, 7, 7, 40` (coprime pairs `(3,5), (4,5), (3,7), (3,8), (5,7), (4,9), (1,7), (7,1), (5,8)`) | `χ(x) = χ₁(x) χ₂(x)` at every `x`, and `conductor χ = conductor χ₁ · conductor χ₂`: 0 failures in 100 characters | sound |
| 0.7 Check "(conductor)" (`:761–763`) | Legendre symbol modulo `3` times the quartic `χ` modulo `5` (`χ(2) = i`), at level `15`; `changeLevel` of the quartic to `15` | conductor `15` (primitive); conductor `5`, left factor `1₃` (values `1, 1` on the units `≡ 1 (mod 5)` read modulo `3`) | sound |
| 0.7 Check "(degenerate)" `c₁ = 1` | pair `(1, 7)`, all 6 characters | left factor constant `1`, `χ = 1 · χ₂`; conductors `{1, 7}` with `1 · conductor χ₂` | sound |
| hypothesis of `conductor_mul_of_coprime` (negative controls) | `χ₄ · χ₄` at level `4`; quartic `· quartic³` at level `5`; quartic `· quartic²` at level `5` | conductors `4, 4`, product `1 ≠ 16`; `5, 5`, product `1 ≠ 25`; `5, 5`, product `5 ≠ 25` | the coprimality hypothesis is necessary, as stated |
| 0.1–0.6, 1.1–1.5, 2.3–2.5, 3.1–3.5, 4.2–4.9, 5.1–5.6, 6.1–6.3, 7.1–7.7 (untouched) | as in the previous review at `3b6487f` | its table (`g(η_p) = ε_p √p` at `p = 3, 5, 7, 11, 13`; two-squares identity on 140 non-squares over 11 fields; Hasse–Davenport on 237 lifts; Weil and Salié bounds on 10⁶-scale exhaustive ranges; Stickelberger valuations at `q = 5, 7`; 7.1 on 490 characters, 7.2 on 2821 pairs, 7.4 on 41628 cases) | carried forward, unchanged text |

**Sources.** The changed lines cite no external source: they cite two Mathlib lemmas and two Tau Ceti theorems, all opened above. The seeded sample (0.4, 0.6, 1.1, 1.3, 2.3, 3.3, 3.4, 4.5, 4.9, 5.3, 5.5, 6.2, 6.3, 7.2, 7.4) falls entirely in untouched text that the previous review verified at its locators (`jacobsthal1907` lines 104–146, `schmidt1973` lines 47–53, Knightly–Li lines 6786–7063, ClassicalArithmeticCompletion 4.19 on main, the two LMFDB knowls) or listed as not verifiable; the README flags no locator as unverified. The diff changes none of their statements.

**Supplier order and ownership.** Position 156 of the merge order; open suppliers DirichletPadicLFunctions (93), AutomorphicSpectralTheory (94), EllipticLegendreCharacterInterfaces (99), CongruenceSpectralGap (155) earlier; ClassicalArithmeticCompletion on main. The repair adds a Tau Ceti dependency only, no roadmap. `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id; the closest roadmaps (QuadraticCharactersAndReduction, HypergeometricMotives, MaassForms, ExplicitCharacterSumsAndSieves) were compared by the previous review and the change touches no object they own. No declared gaps and none needed.

**Principles, form, padding.** No shortcut, re-planning, copied passage, algorithm, sorry'd data, `set_option`, `lemma`, pull-request number or process word in the changed lines ("read off from the libraries, not reproved" is a mathematical statement of what 0.7 cites). The Lean file is unchanged, so the previous review's padding probe (one tactic closes none of the 35 admitted theorems) and headline inventory stand: 0.7's targets are the two definitions `crtFactorLeft`, `crtFactorRight`, consumed by the headlines `gaussSum_mul_of_coprime` (7.1) and `kloostermanSum_zmod_mul_of_coprime` (7.4), and the conductor consequence is rightly a README statement, not a Lean declaration.

## Not verifiable

- Nothing in the changed lines depends on a text that cannot be read. The untouched text's items (Ireland–Rosen, Lidl–Niederreiter, Iwaniec–Kowalski, Gross–Koblitz, Weil 1948, `schmidt1976` uncertified) are as in the previous review.

## Source issues

- none
