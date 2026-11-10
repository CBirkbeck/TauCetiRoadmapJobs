# Review of GlobalQuadraticForms (pull request #1200 at bf7aba3)

**Verdict:** needs changes

An incremental re-review of the 21 lines changed since `8fe49f4`. One finding remains, P3, and it is in the pull-request description only: two sentences about the pins describe the head before main was merged. The folder itself has no finding: the section-map repair is correct, the branch now builds at main's pins, and the gate passes.

## R01 (P3) — The description's *Pins* and *Relation with #1215* sections still describe the pins of the head before main was merged

**Location.** The pull-request description, prose part, *Pins*: "This branch's merge base is older: its manifest pins Tau Ceti `358314d` and Mathlib `f6090c7`. The pull request does not change the manifest, so it merges at main's pins." And *Relation with #1215*: "This head instead writes that map's components out, because `globalToLocal` is absent at the branch's Tau Ceti pin."

**Claim.** The branch builds against Tau Ceti `358314d`, where `TauCeti.WittRing.globalToLocal` does not exist.

**Witness.** The head is a merge of main (`bf7aba3`, merge base `4452ffa3`). `lake-manifest.json` at the head is main's: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`. `TauCeti.WittRing.globalToLocal` is at `NumberTheory/QuadraticForm/Global/WittLocalization.lean:167` there, and `#check` elaborates it.

**Repair.**
- In *Pins*, replace the second and third bullets by: "This branch contains main; its manifest is main's (Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`), and `Suggested.lean` builds at those pins."
- In *Relation with #1215*, replace the last sentence by: "This head writes that map's components out; both forms elaborate at the pins."

Tested: `lake env lean` on `Suggested.lean` at the head exits 0 at `2fd255d9`/`1b1ccf4b` with the 8 `sorry` warnings and nothing else; `git diff origin/main HEAD -- lake-manifest.json lean-toolchain` is empty.

Everything else in the description now matches the head. I checked each of its claims about #1215 against #1215's head (`6aa9b5bf`, this folder last changed at `c1d130b8`):
- its `Suggested.lean` has no `equivalent_of_locallyEquivalent` and its README names it in prose only (`README.md:1176`, `:1222`);
- its section map has no finite-support line (the name occurs only in its contract, `README.md:285`);
- its consumer sentence says "real symbol" (`README.md:1224`);
- it states 8.3 as `Function.Injective (TauCeti.WittRing.globalToLocal K)`.

The two heads still conflict in both files (`git merge-tree --write-tree`), and the description states the order (#1215 first, this branch rebased onto it) and what is re-applied. That is a stated order, so the conflict is not a finding.

## Previous findings

- R01 — partly repaired: the description is rewritten and matches the head (nine declarations, five Tau Ceti imports, the dropped ids, the order with #1215 and what is re-applied), except the two sentences on the pins. Written again as R01 above.
- R02 — repaired: the head merges main; `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the revisions `README.md:157–161` names. The merge changed nothing in the folder.
- R03 — repaired: "4.4, the archimedean symbol, resolves to `TauCeti.hilbertSymbol_real` and `TauCeti.hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` at a real place, and, at a complex place, to `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex`" (`README.md:80–83`); the contract and the consumer sentence follow.

## Verified sound

**The changed passages (all in `README.md`).**
- **Scope paragraph, `:44–46`.** It now lists the symbol's value at a complex place and its finite support among what Tau Ceti has. Both exist at the pin (below).
- **Section map, `:77–79`, finite support.** `TauCeti.hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` (`NumberTheory/QuadraticForm/Global/HilbertSymbol.lean:124`) states, for `a b : Kˣ`, `Function.HasFiniteMulSupport fun v ↦ hilbertSymbol (v.unitAtFinitePlace a) (v.unitAtFinitePlace b)`. Its file declares `{K : Type*} [Field K] [NumberField K]` (`:61`), so the line rightly carries no "in `Type`" mark, and the count of eight `Type`-only inputs at `:160–168` is unchanged.
- **Section map, `:80–83`, archimedean symbol.** `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex` (`ArchimedeanSymbol.lean:167`): for `w.IsComplex` and `a c : w.Completionˣ`, `hilbertSymbol a c = 1`, with `{K : Type*} [Field K]` (`:95`). `hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` is at `:102`, and `hilbertSymbol_real` at `NumberTheory/HilbertSymbol/Archimedean.lean:59`.
- **Contract, `:286–287`.** The new name is in the Symbols bullet, whose file list already has `ArchimedeanSymbol.lean`.
- **Consumers, `:1170–1172`.** Classical Arithmetic Completion on main imports this Layer 4 (`README.md:189`, `:2607`) and reads 4.4's real symbol (`:783`, `:793`) and product formula (`:165`). The anchor `#layer-4-global-square-norm-and-approximation-lemmas` still resolves.
- **`#check` of the four cited symbol lemmas** at the pin elaborates with the types quoted above.

**Gate, dependency check, scope of the change.**
- **Gate.** My rerun printed every check at 0 and `OK`, exit 0; the worker's line adds `build=0`.
- **Dependency check.** Output: `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The README names no roadmap supplier and declares no `gap:` contract.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty. The files listed as changed outside the folder since `8fe49f4` are main's own, brought in by the merge.
- **Files changed inside the folder against main.** Only `README.md` and `Suggested.lean`.

**Lean, rerun because the pins changed under an unchanged file.**
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 at Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 147.
- **Signatures.** A scratch file of `#check @…` for all 9 declarations elaborated. Each type matches its README statement and the previous report's reading: `[FiniteDimensional K V]`, `[FiniteDimensional K W]` and both `Nondegenerate` hypotheses on 5.5, 6.1, 6.2, 6.3, 8.1, 8.4; `a ≠ 0` on 6.1; `[Invertible 2]` on 8.3; `V`, `W` in independent universes. I changed nothing.
- **One-tactic probe at the new pins.** On a scratch copy each `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | exact?`. All 8 fail, so the newer Tau Ceti proves none of them.
- **8.3 at the new pin.** `TauCeti.WittRing.globalToLocal` now exists at the pin; `README.md:1092–1093` says the map is that homomorphism and that the Lean statement writes its components out, which is true of the file.

**Overlaps.** `overlaps.md` lists one item, #1215, treated under R01. No id this README cites is dropped by an open pull request, none is defined only by an open revision, and no id this pull request drops is cited elsewhere. `citations.md` lists no unresolved citation or Lean name.

**Remark on untouched text (no change requested).** The module docstring and 8.3 state injectivity through the components of the map rather than through `TauCeti.WittRing.globalToLocal`; the description says the rebase onto #1215 takes #1215's statement.

**Adversarial table.** The first three rows are the changed statements, computed in this review. The remaining rows are carried from the previous report (review of `8fe49f4`), whose statements the diff leaves untouched; "H/C" means hypothesis/conclusion, "G/L" global side/local side.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.4 finite support (map, `:77–79`) | ℚ, `(−1, 3)`; ℚ, `(1, 1)`; ℚ, `(2, 5)` | `−1` at 3 and 2, `1` at every other `p` (both units, `p` odd): support `{2, 3}`; support `∅`; `(2,5)_5 = (2/5) = −1`, `(2,5)_2 = (−1)^((25−1)/8) = −1`, else `1`: support `{2, 5}` | finite in each case, as the lemma states | none |
| 4.4 complex place (map, `:80–83`) | ℚ(i), `(−1, −1)` at its complex place; any `a, c` | `−1 = x² + y²` with `x = i`, `y = 0`: symbol `1`; `c = x² − a·0²` with `x = √c`: `1` | `1`, as the lemma states; the real value of the same pair is `−1` | none |
| 4.4 real place (map, `:80–82`) | ℚ, `(−1, −1)`; `(−1, 3)`; ℚ(√5), `(√5, √5)` | `−1` (both negative); `1`; `−1` at the real place where `√5 ↦ −√5`, `1` at the other | matches `a < 0 ∧ b < 0` | none |
| Conventions: discriminants | `H = ⟨1,−1⟩`; `⟨1,1⟩` | plain `[−1]`, signed `(−1)^1·[−1] = [1]`; plain `[1]`, signed `[−1]` | as stated | carried |
| Conventions: Hasse sign | `H` over ℝ | `i<j`: `(1,−1) = 1`; `i≤j`: `(1,1)(1,−1)(−1,−1) = −1` | conventions differ, as stated | carried |
| Conventions: real sign | `⟨−1,−1⟩`; `p⟨1⟩⊥q⟨−1⟩` | `(−1,−1)_ℝ = −1 = (−1)^(2·1/2)`; `realHasse = (−1)^(q choose 2)` (`Invariants.lean:142`) | agree | carried |
| Conventions: product formula | `(−1,3)` over ℚ | `−1` at 3 (`(−1/3)`), `−1` at 2 (`ε(−1)ε(3) = 1`), `+1` at ℝ | two places, product 1 | carried |
| 4.1 places | ℚ(i), `σ` conjugation, `𝔭 = (2+i)` | `2+i ≡ 4` mod `𝔭̄` (square), `v_𝔭(2+i) = 1`; `σ(2+i) = 2−i ≡ 4` mod `𝔭` | square moves to `σ𝔭̄ = 𝔭` | carried |
| 4.1 real places | ℚ(√5), `σθ = 1−θ`, `w': θ ↦ (1+√5)/2` | `w'.comap σ: θ ↦ (1−√5)/2 ≈ −0.618`; `p(σQ, w') = 1 = p(Q, w'.comap σ)`; fixed-place model gives `3` | correspondence needed | carried |
| 4.1 identity / zero form | `σ = id`; zero form | `σQ = Q`; record rank 0, not admissible on both sides | holds | carried |
| 4.2 [headline] | ℚ, `a = 4`, `S = ∅` | H: square everywhere; C: `2² = 4` | T/T | carried |
| 4.2 | ℚ, `a = −1`; `a = 2`; any finite `S` | H fails at every `p ≡ 3 (4)`, resp. `p ≡ ±3 (8)`, outside `S`; C false | F/F | carried |
| 4.2 | ℚ(i), `a = −1` | H: square everywhere; C: `i² = −1` | T/T | carried |
| 4.2, exponent 8 (control) | ℚ, 16, `S = {2}` | H holds (one of `−1, 2, −2` is a square mod odd `p`); `16^(1/8) = √2 ∉ ℚ` | analogue false, so `n = 2` is needed | carried |
| 4.3 | ℚ, `d = −1`, `a = 5`; `a = 3` | `5 = 1+4` T/T; `3`: G false, L false at 3 (`(−1,3)_3 = −1`) | T/T; F/F | carried |
| 4.3 | ℚ, `d = 2`, `a = −1`; `d = −1`, `a = −1` | `1 − 2 = −1`, T/T; `x²+y² = −1` fails at ℝ, F/F | holds | carried |
| 4.3 junk | `d = 0`, `d = 1` | both squares (`0 = 0²`), excluded by `¬IsSquare d` | excluded | carried |
| 5.1 binary | ℚ: `⟨1,1⟩`, `⟨1,−2⟩`; ℚ(i): `⟨1,1⟩` | F/F (at 3); F/F (2 is a nonresidue mod 3); `d = [1] = [−1]`, T/T | holds | carried |
| 5.1 ternary | `⟨1,1,−2⟩`; `⟨1,1,−3⟩`; `⟨1,1,1⟩` | `(1,1,1)` zero, `d = −1`, `a = 2 = 1²+1²`; F/F (fails at 2, 3); F/F (fails at 2, ℝ) | holds | carried |
| 5.5 [headline] | rank 0; `⟨a⟩`; `H` | F/F; F/F; T/T | holds | carried |
| 5.5 [headline] | ℚ, `⟨1,1,1,−7⟩` | G: F (7 is not a sum of 3 rational squares); L: isotropic at ℝ and odd `p`, anisotropic at 2 (`7 ≡ −1` mod squares, `(−1,−1)_2 = −1`) | F/F | carried |
| 5.5 [headline] | `⟨1,1,1,1,−1⟩`; `⟨1,1,1,1,1⟩` | `(1,0,0,0,1)` T/T; F/F (at ℝ) | holds | carried |
| 5.5 without regularity | `⟨1,0⟩` | radical vector `e₂` isotropic globally and after base change | T/T; `hQ` used only by the route | carried |
| 6.1 [headline] | `⟨1,1,1⟩`, `a = 7` | G: F; L: F at 2 (Milne 6.9(c): `a = −d`, `(−1,−1)_2 ≠ S`) | F/F | carried |
| 6.1 [headline] | `⟨1,1⟩`, `a = 2`; `a = −1`; zero form, `a = 1` | T/T; F/F (ℝ, 2); F/F | holds | carried |
| 6.2 [headline] | `⟨7⟩ → ⟨1,1,1⟩`; `⟨1,1⟩ → ⟨1,1,1,1⟩`; `⟨c⟩ → H` | F/F (at 2); T/T; `((1+c)/2, (1−c)/2) ↦ c`, T/T | holds | carried |
| 6.2 [headline] | zero `Q` into any `R`; rank `Q` > rank `R` | zero map injective, T/T; F/F | holds | carried |
| 6.3 [headline] | `⟨1,1⟩` vs `⟨2,2⟩`; vs `⟨21,21⟩` | `(x+y, x−y)` T/T; `s_3`: `(21,−1)_3 = −1` vs `1`, F/F | holds | carried |
| 6.3 [headline] | `⟨1,1,1,1⟩` vs `⟨1,1,7,7⟩`; `⟨1⟩` vs `⟨−1⟩` | `d = [1]` both; `s = (7,−1)_v = −1` at 7 and 2, F/F; F/F (at ℝ) | holds | carried |
| 7.2 | ℚ, `n = 3`, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = −1` | product `(−1)·1 = −1` | H fails; no form, consistent | carried |
| 7.2 | local data of `⟨−1,−1,−1⟩` | `s_2 = (−1,−1)_2³ = −1`, real `(−1)^3 = −1`, product `1` | realized by the form itself | carried |
| 7.3 [headline] | ℚ, rank 2, `d = [1]`, `p = 2`, `s_3 = s_7 = −1` | admissible (`−1` is a nonsquare in `ℚ_3`, `ℚ_7`); `⟨21,21⟩`: `s_3 = s_7 = −1`, `s_2 = (−1)^(10·1) = 1` | T, realized | carried |
| 7.3 (control) | same with `s_3 = s_5 = −1` | `−1` is a square in `ℚ_5` gives `s_5 = 1`: not admissible; every `⟨a,a⟩` has `s_5 = (a,−1)_5 = 1` | F, and no form | carried |
| 7.3 junk | rank 1, `d = [1]`, `p = 0`; rank 0 | real `[1] ≠ 1•[−1]`; `1 ≤ n` fails | not admissible; no form needed | carried |
| 7.4 / 8.1 [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩` | both `(3, [−1], s ≡ 1, p = 2)`: `(1,1)(1,−1)(1,−1) = 1`, `(1,2)(1,−2)(2,−2) = 1` | equal / isometric | carried |
| 8.1 [headline] | `⟨1,1⟩` vs `⟨21,21⟩`; rank 0 vs rank 0 | `s_3` differs, F/F; `(0,[1],1,0)` both, T/T | holds | carried |
| 8.2 | `⟨1,−1,2,−2⟩` | `m = 2`, `d = [4] = 2•[−1]`, `s = (−1,−4) = (−1,−1)^(2 choose 2)`, `p = 2` | locally `2H`, globally `2H` | carried |
| 8.2 | `⟨1,1⟩` | `m = 1` needs `d = [−1]`, `p = 1`; has `[1]`, `2` | F/F | carried |
| 8.3 [headline] | `[⟨1,1,−3⟩] − [⟨1,1,−1⟩]`; `[H]`; `[⟨1,1⟩]` | at `ℚ_3` nonzero (else `⟨1,1,−3⟩ ≅ ⟨1⟩⊥H` isotropic); `0` everywhere; real signature `2` | injectivity consistent | carried |
| 8.3 complex places | class zero at one finite `v` | dimension even, so `0` in `W(ℂ) = ℤ/2` | omission justified | carried |
| 8.4 [headline] | `⟨1,1⟩`, `⟨2,2⟩` | locally isometric, hence isometric by 6.3 | holds | carried |

In the carried rows, "carried" means the row is the previous report's, with no change asked.

## Not verifiable

- **O'Meara** (`omeara`) and **Serre** (`serre`) are settled as uncertified and cited by locator only. No changed passage cites either.
- **The sampled source locators** (4.2, 4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4 against milne-cft) lie in text the diff does not touch; they were verified in the previous report and not reread. 4.1 has no literature locator.
- **#1215's description** is not readable with this job's tools; the order is taken from this pull request's description and its generated `merge-order` block, and #1215's folder was read at its head.

## Source issues

- none
