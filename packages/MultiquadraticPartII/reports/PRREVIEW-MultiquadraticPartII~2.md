# Review of MultiquadraticPartII (pull request #1420 at 0e9bc3b)

**Verdict:** needs changes

Incremental re-review of the 53 lines changed since `0bf098b`. The gate fails at this head (`statement-hygiene=1`, `build=2`).

## R01 (P1) — The text moved to main's library names, the branch did not: the cited pin lacks `isFundamentalDiscr_prod` and the gate build fails

**Location:** `TauCetiRoadmap/MultiquadraticPartII/README.md` lines 198 and 228: "Use Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`" … "`fundamentalDiscriminant`, `isFundamentalDiscr_prod` and `prod_primeDiscriminant_mod_four_eq_one`"; also line 169 and `Suggested.lean` lines 23–24 (the same two hashes).

**Claim:** `TauCeti.Multiquadratic.isFundamentalDiscr_prod` exists at Tau Ceti `a91d3aaf`, and the targeted build succeeds at this head.

**Witness:** At `a91d3aaf`, `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean` has only `isFundamentalDiscriminant_prod` (line 50) and `IsFundamentalDiscriminant` (line 68); no Tau Ceti file there mentions `Int.IsFundamentalDiscr`. The new name is at main's pin `2fd255d9`, same file, line 188. Gate: `build exited 1`.

**Repair:** Merge main into the branch, so that `lake-manifest.json` pins Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, and replace the two hashes at README lines 169 and 198 and `Suggested.lean` lines 23–24. Tested: a copy of `Suggested.lean` elaborates at those pins with `sorry` the only warning (ten, lines 40–184), and all 40 Tau Ceti names and 6 Mathlib names of the supplier contracts resolve there, including `isFundamentalDiscr_fundamentalDiscriminant` (`…/FundamentalDiscriminant/OfSquarefree.lean` line 95), which 2.4 needs to apply 2.3. The description's sentence "the targeted Lake build succeeds with `sorry` as the only warning" is true again once this is done.

## R02 (P3) — AutomorphicSpectralTheory is still named as the supplier of the sign identity in the Lean docstring, and still sits under the supplier contracts

**Location:** `TauCetiRoadmap/MultiquadraticPartII/Suggested.lean` lines 20–21: "The composite sign identity is supplied by AutomorphicSpectralTheory §4.17a."; `README.md` line 285, heading `### From TauCetiRoadmap.AutomorphicSpectralTheory`.

**Claim:** The identity `χ_t(J) = sign δ` is imported from AutomorphicSpectralTheory §4.17a, and that roadmap is a supplier.

**Witness:** README lines 49–51 at this head: "The pinned Tau Ceti … own the real composite identity"; line 288: "nothing here is proved from that section". No `*Needs:*` line names AutomorphicSpectralTheory. The description's `depends-on` block still lists it as a supplier that merges first.

**Repair:** Replace the docstring sentence by "The composite sign identity of 2.1 follows from the pinned `genusCharFunNarrowClassGroupHom_mkPrincipal_gen` and `genusCharFunNarrowClassGroupHom_eq_prod_singleton`." Move the paragraph of README lines 287–293 to `## Conventions` and delete the heading at line 285; the `depends-on` and `merge-order` blocks are then regenerated without that edge.

## R03 (P3) — The proved example mirrors a README Check (previous R03, not repaired)

**Location:** `TauCetiRoadmap/MultiquadraticPartII/Suggested.lean` lines 205–215, `example : binaryFormGenusChar {-4} ⟨2, 0, -6⟩ = 0`; `README.md` line 332 "Its proved example tests the content obstruction." and line 858.

**Claim:** The example tests something nontrivial about the kept definition.

**Witness:** It is `binaryFormGenusChar_eq_zero_iff` at one instance (content 2, `δ = −4`) and restates the 3.1 Check on `[2,0,-6]`; the folder's diff since `0bf098b` does not touch these lines.

**Repair:** Delete it from `Suggested.lean`, and delete the two README sentences at lines 332 and 858; the README keeps the Check.

## R04 (P3) — `binaryFormGenusChar` picks its datum by choice (gate `statement-hygiene`)

**Location:** `TauCetiRoadmap/MultiquadraticPartII/Suggested.lean` line 154, `genusCharFun t h.choose`; `README.md` 3.1, "In Lean the represented integer is picked by choice, so the definition has a real body."

**Claim:** The definition needs a chosen represented integer.

**Witness:** Gate, `statement-hygiene (1)`: "line 154: P3 def `binaryFormGenusChar` chooses its datum (`h.choose`)". For prime discriminants `genusCharFun t` is `±1` on integers coprime to `δ` (`genusCharFun_eq_one_or_eq_neg_one`), so the value is determined by two existence statements.

**Repair:** Replace the body by

```lean
  classical
  exact if ∃ x y : ℤ, IsCoprime (Q.eval x y) (∏ P ∈ t, P) ∧ genusCharFun t (Q.eval x y) = 1 then 1
    else if ∃ x y : ℤ, IsCoprime (Q.eval x y) (∏ P ∈ t, P) then -1 else 0
```

and the README sentence by "Its value is 1 if Q represents an integer m coprime to δ with `genusCharFun t m = 1`, −1 if it represents an integer coprime to δ but none of that kind, and 0 if it represents no integer coprime to δ." Tested at main's pins: it elaborates; `[2,0,-6]`, `t={-4}` gives 0 (proved); `[3,0,-1]`, `t={-4}` represents 3 and −1, both of value −1, so −1; `t=∅` gives 1 on every form, the zero form included. The three stated laws and the substitution law are unchanged, since each quantifies over the same represented set.

## Previous findings

- R01 — repaired: line 40 links `…/blob/main/Completed/GlobalNumberFields/README.md#layer-11-orders-and-picard-groups`; main has that file, heading `### Layer 11: orders and Picard groups` at its line 571.
- R02 — partly repaired: Scope, the supplier paragraph, "How to read the build" and 2.1 (its `*Needs:*` line included) now name the pinned declarations; `Suggested.lean` lines 20–21 still say "supplied by AutomorphicSpectralTheory §4.17a" (R02 above).
- R03 — not repaired: `Suggested.lean` lines 205–215 and README lines 332 and 858 are as at `0bf098b` (R03 above).

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 2.3 `fundamental_sumTwoSquares_iff`, now with `Int.IsFundamentalDiscr D` (`(D%4=0 ∨ D%4=1) ∧ (D=4x → ¬4∣x ∧ x%4≠1) ∧` no odd `p²∣D`) | `D=1`; `8` (`x=2`); `12` (`x=3`); `136` (`x=34`); `9`; `4` (`x=1`); `0`; `−4` | fundamental: 1, 8, 12, 136, −4; not: 9 (`3²∣9`), 4 (`1%4=1`), 0 (`4∣0`). `1=1+0`, `8=4+4`, `136=36+100`; `12−{0,1,4,9}={12,11,8,3}`, no square, and `3∣12` | true; `hfund` needed (`9=0+9`, `3∣9`); `hD` needed (`−4` has no `p≡3` divisor, is no sum) | none; same predicate as before, Mathlib's carrier |
| 2.3 one-tactic probe | `rfl`, `simp`, `omega`, `trivial`, `norm_num`, `simp [Int.isFundamentalDiscr_iff_squarefree]` | all fail; goal left `(∃ x y, D = x²+y²) ↔ ∀ p, …` | not padding | none |
| 2.4 uses 2.3 at `D = fundamentalDiscriminant d` | pin `a91d3aaf`; pin `2fd255d9` | `a91d3aaf`: only `IsFundamentalDiscriminant (fundamentalDiscriminant d)`, no bridge; `2fd255d9`: `isFundamentalDiscr_fundamentalDiscriminant` gives `Int.IsFundamentalDiscr` | route closes at main's pin only | R01 |
| 2.1 `χ_t(J) = sign δ`, derived from the pinned singleton value and product law | `t={−4}`: `genusCharFun {−4} (−1) = −1` (`decide`); `t=∅`: 1; `{−4,−3}`: `(−1)(−1)=1` | product over `t` of `P.sign` equals `sign ∏ t`; both declarations at `…/GenusCharacter/OrdinaryTwoRank.lean` 111 and `…/NarrowClassGroup.lean` 222, at both pins | true; no input from another roadmap | R02 (docstring, heading) |
| 3.1 definition, choice-free body | `[2,0,−6]`, `[3,0,−1]` at `t={−4}`; `t=∅`, `Q=0` | 0; −1 (`genusCharFun {−4} 3 = −1`, `… (−1) = −1`); 1 (`genusCharFun ∅ 0 = 1`) | agrees with the chosen-value body wherever the evaluation law applies | R04 |
| Proved example | `[2,0,−6]`, `t={−4}` | `2 ∣ 2x²−6y²` and `2 ∣ −4`: no coprime value, 0; the zero law gives the same from `gcd(2,0,−6)=2` | an instance of `binaryFormGenusChar_eq_zero_iff` | R03 |

The rows for the untouched statements stand as in the previous review, of `0bf098b`.

- Gate at `0e9bc3b`: FAIL, `statement-hygiene=1` (R04) and `build=2` (R01); every other check 0, `outside-folder=0`.
- Elaboration: `lake env lean` from the worktree stops with "TauCeti: materializing new dependency … already exists" (the packages for the branch's manifest are not on this worker). A copy of the file elaborated at main's pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, toolchain v4.36.0-rc2): ten `declaration uses sorry` warnings, nothing else, the proved example checks.
- `#check @fundamental_sumTwoSquares_iff` at main's pins: `∀ {D : ℤ}, 0 < D → D.IsFundamentalDiscr → ((∃ x y, D = x ^ 2 + y ^ 2) ↔ ∀ (p : ℕ), Nat.Prime p → ↑p ∣ D → p % 4 ≠ 3)`, the README's 2.3 statement.
- Library declarations opened: `Int.IsFundamentalDiscr` (`Mathlib/NumberTheory/FundamentalDiscriminant.lean` line 41, present at both `6b7abb3c` and `1b1ccf4b`), `Int.isFundamentalDiscr_iff_squarefree` (the "squarefree cases" of the 2.3 `*Needs:*` line); 40 Tau Ceti and 6 Mathlib names of the supplier contracts resolved at main's pins. No pinned declaration states a two-square criterion for fundamental discriminants.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Source locators rechecked for the changed passages: 2 (`duke-imamoglu-toth` line 989 for 2.1; lines 444–446 for 2.3–2.4), both support the statements.
- Pull request text: title and prose agree with the head (a new roadmap, 27 headings, 11 declarations, "even the composite sign of J comes from existing results"), apart from the build sentence (R01) and the generated `depends-on` block (R02).
- Overlap check: read EffectiveClassNumbers, FuchsianOrbifoldsPartII, ImaginaryQuadraticClassNumber, ClassicalArithmeticCompletion, QuadraticCharactersAndReduction; nothing shared (FuchsianOrbifoldsPartII cites §§2.3–2.4 of this roadmap as the owner).

Source independence: changed passages only; 4 passages compared with 1 source (`duke-imamoglu-toth` lines 444–446, 989), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Elaboration of `Suggested.lean` at the branch's own pins (Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`): the packages for that manifest are not on this worker; decided by reading (`Int.IsFundamentalDiscr` is in Mathlib at `6b7abb3c`; nothing else in the file changed).

## Source issues

- none

## For the human reviewers

- none
