# Review of QuadraticFormInvariants (pull request #1215 at b94cfcc)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of this folder changed since `024927f`. The new commits change only ClassFieldTheory and GlobalQuadraticForms, which are this pull request's own folders. None of the three findings of the review of `024927f` is repaired, so all three are restated below. All are P3. The sibling changes make no passage of this folder false.

## R01 (P3) — An edit outside the folders this pull request owns fails the gate

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions against main. The worker's gate at `b94cfcc` reports `outside-folder=1` on this file. Every other check is 0, and `build=0`.

**Claim.** The pull request owns `ClassFieldTheory`, `GlobalQuadraticForms` and this folder. Its title and description never mention `LocalGaloisGroups`.

**Witness.**
- `git diff --stat 024927f HEAD` touches only the two ClassFieldTheory and GlobalQuadraticForms READMEs and `GlobalQuadraticForms/Suggested.lean`.
- The description is unchanged.
- Reverting the file is not a repair. Main's copy uses `ClassFieldTheory.artinMap`, `ClassFieldTheory.H`, `kummerEquiv_mixed` and `absoluteGaloisGroupExtend`, and this head's 206-line `ClassFieldTheory/Suggested.lean` declares none of them.

**Repair.** Keep the migration and name it in the pull-request description: `Completed/LocalGaloisGroups/Suggested.lean` is repointed to Tau Ceti's class-field names because ClassFieldTheory's `Suggested.lean` no longer declares main's. The gate must then count the file as this pull request's own. Last round's alternative, reverting the file to main, would break its build.

## R02 (P3) — Four open pull requests change this roadmap, and no merge order is stated

**Location.** The pull-request description, which names none of #617, #1187, #1411 or #1797. `overlaps.md` lists each of them as conflicting with this pull request in this folder.

**Claim.** Each of the four carries its own copy of `QuadraticFormInvariants`. Whichever merges second conflicts, or silently undoes the other's changes.

**Witness** (heads from today's index):
- #1797 (`657389a`): its `Suggested.lean` is still byte-identical to `b9e8822`'s. Merged after this head, it restores the old `hilbertSymbol_unramified` and `qfiNativeBrauerCommGroup`.
- #1411 (`cded4a2`):
  - its copy is main's file plus two imports;
  - its `IntegralLattices/Suggested.lean:749–754` uses `QuadraticFormInvariants.hilbertSign` and main's form of `hilbertSymbol_productFormula`;
  - this head declares no `hilbertSign` and restates the product formula.
- #617 (`3442338`): 4 Lean and 5 README lines against main's copy.
- #1187: it bumps Tau Ceti.

**Repair.**
1. State in the description that this pull request merges before #617, #1411 and #1797, and that each of them then drops its `QuadraticFormInvariants` hunks. Or state the reverse order and rebase this one.
2. #1411's IntegralLattices `example` at 749–754 then needs `TauCeti.hilbertSign` and this head's statement. Add `hilbertSign` → `TauCeti.hilbertSign` (`TauCeti/Data/ZMod/IntUnitsPower.lean:62`) to README's old → new list.
3. Say whether #1187 merges first. If it does, this file must re-elaborate at #1187's Tau Ceti pin.

## R03 (P3) — GlobalQuadraticForms no longer imports this namespace, so the attributions are false and nine aliases are padding

**Location.**
- `README.md:26–30`: "`formClass`, `discr`, `wittRing` and `toWittRing` (`GlobalQuadraticForms`); `hilbertSymbol`, … `exists_of_realization` (`GlobalQuadraticForms`)".
- The same attribution appears at:
  - `README.md:36` ("Three names that `GlobalQuadraticForms` cites from this namespace");
  - `README.md:141–143` and `810–812` (`discr` is declared because GlobalQuadraticForms "consumes it under that name");
  - `README.md:1599–1600`;
  - `Suggested.lean:31–39`.
- `README.md:2636–2640`: the GlobalQuadraticForms consumer bullet names "the evaluation against the unramified class of 6B–6C" and "the cohomological comparison" of 6C.

**Claim.** GlobalQuadraticForms imports and cites nothing from `TauCetiRoadmap.QuadraticFormInvariants`. Three things follow:
- the attributions above are false;
- two items of the consumer bullet are inputs GlobalQuadraticForms never uses;
- nine aliases have no importer: `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one` and `exists_of_realization`. Each closes with one Tau Ceti term, so each is padding.

**Witness.**
- `GlobalQuadraticForms/Suggested.lean:3–8` imports only Mathlib and five Tau Ceti modules.
- Its README says "There is no roadmap supplier" (line 141). It cites this roadmap's results as "Tau Ceti declarations" (79–81), and it has no hit for "unramified" or "cohomological comparison".
- `roadmaps grep` finds the nine names only in main's GlobalQuadraticForms, which this pull request replaces.

**Repair.** The repair is unchanged from the last round, and I re-tested it at this head.
1. Delete the nine declarations. Keep the `export`, `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse` (imported by `Completed/OrthogonalSpinGroups/Suggested.lean:84–86`), `hilbertSymbol_productFormula` and `hilbertSymbol_eq_cohomological` (IntegralLattices 3G and 6A; QuaternionArithmetic's 6C paragraph), the private lemma and the five examples. A scratch copy with the nine removed elaborates with exit 0 and no messages.
2. Turn README 36–46 into an old → new list with no roadmap attribution. Add these lines:
   - `discr` → `TauCeti.RegularFormClass.discr` via `TauCeti.multiplicativeSquareClassEquiv`;
   - `wittRing` → `TauCeti.WittRing`;
   - `toWittRing` → `TauCeti.WittRing.mk`;
   - `hilbertSymbol_neg_self`, `hilbertSymbol_comm` and `exists_hilbertSymbol_eq_neg_one` → the `TauCeti.` names of the same form;
   - `hilbertSymbol_mul` → `TauCeti.hilbertSymbol_mul_right`;
   - `hilbertSymbol_unramified` → `TauCeti.exists_unramified_class` with `TauCeti.hilbertSymbol_unramified`;
   - `exists_of_realization` → `TauCeti.RegularFormClass.exists_of_realization`.
3. Rewrite the scope list (26–34), README 1599–1600 and `Suggested.lean:31–39` to name the actual importers: OrthogonalSpinGroups, IntegralLattices and QuaternionArithmetic.
4. Replace this roadmap's names with Tau Ceti's at these lines:
   - 141–143, 809–813 and 900–903 (`discr`);
   - 1383 (`hilbertSymbol_unramified`);
   - 1512, 1519 and 1523.
5. In the GlobalQuadraticForms bullet, drop the unramified-class evaluation and the cohomological comparison. Add a QuaternionArithmetic bullet for 6C.

## Previous findings

- R01 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still 62+/50− against main, the description still omits it, and the worker's gate reports `outside-folder=1`. Restated as R01, with the revert option withdrawn.
- R02 — not repaired: the description is unchanged and names none of #617, #1187, #1411 or #1797. #1797 still carries `b9e8822`'s file, and #1411's IntegralLattices now uses `QuadraticFormInvariants.hilbertSign`. Restated as R02.
- R03 — not repaired: README 26–36 still attributes the names to `GlobalQuadraticForms`, and the nine aliases remain. GlobalQuadraticForms at `b94cfcc` imports only Mathlib and Tau Ceti and says "There is no roadmap supplier". Restated as R03.

## Verified sound

**Gate.**
- The worker's gate at `b94cfcc`: every check is 0 except `outside-folder=1` (R01); `build=0`.
- My run gives `outside-folder=5`. The four extra entries are this pull request's own ClassFieldTheory and GlobalQuadraticForms files.

**Depcheck.** The output is `depcheck: 239 roadmaps, 2333 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 9 s with no messages. Every declaration is proved, with no `sorry`.
- A scratch copy with 36 `#check @` lines elaborates with exit 0:
  - all 15 declarations and the export;
  - the 14 Tau Ceti targets of R03's old → new list;
  - `TauCeti.hilbertSymbol_productFormula` and `TauCeti.hilbertSymbol_eq_cohomological`;
  - four ClassFieldTheory names.
- The three "looks dropped `[Invertible (2 : K)]`" leads in `signatures.md` are false positives. `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry an anonymous `[Invertible 2]`. `TauCeti.hilbertSymbol_mul_right` and `TauCeti.exists_unramified_class` take `2 ≠ 0`, which the aliases supply by `Invertible.ne_zero`.

**One-tactic probe.**
- The nine aliases each close with one Tau Ceti term (R03).
- The five examples close with one Tau Ceti theorem each. They are the roadmap's headlines, so they are not padding.

**Headlines.** The README's headlines (README 10–15) are:
- the four-fold splitting criterion (Layer 2);
- the `(dim, d, s)` classification (6D);
- Kahn's relative formula through the Evens value (Layer 9).

All three are statable and stated, as are the cup-norm theorem (7C) and the Evens value. No statable headline is missing.

**ClassFieldTheory citations re-resolved at this head** (its README changed by 211 lines):
- Layer 5 is "local coefficients, the Brauer group, the local invariant, and duality" (README 992). Its interface is in `ClassFieldTheory/` (`MuNRep`, `Brauer/`, `Local/Symbol`).
- Layer 14 is "Hilbert reciprocity and quadratic reciprocity" (1943). It names `hilbertProductFormula` and says this roadmap's symbols are compared with it (1955–1960).
- Its boundary bullet (202–206) and consumer paragraph (1993) agree with this README's scope (71–78), and the direction is `ClassFieldTheory → QuadraticFormInvariants`.
- This README cites none of the renumbered conventions (§2.x → C.x) or worked examples.
- Ten Tau Ceti names resolve at the pin: `muNRep` (`MuNRep.lean:137`), `kummerClass` (`:283`), `kummerCupPairing` (`Local/Symbol.lean:207`), `localSymbol` (`:320`), `invMap` (`Brauer/Invariant.lean:200`), `h2MuEquivZMod` (`Brauer/RootsOfUnity.lean:89`), `brauerGroupEquivBr` (`Brauer/CentralSimple/Basic.lean:55`), `finiteHilbertInvariantAt` (`Global/Hilbert/Invariant.lean:93`), `hilbertProductFormula` (`Global/Hilbert/Reciprocity.lean:65`) and `TauCeti.hilbertSign` (`Data/ZMod/IntUnitsPower.lean:62`).

**GlobalQuadraticForms change against this README.**
- README 958–962 says `TauCeti.WittRing.baseChange` gives "the localization maps that `GlobalQuadraticForms` composes over the completions". This is still true. GlobalQuadraticForms 8.3 now uses `TauCeti.WittRing.globalToLocal`, which is `(RingHom.pi fun _ => baseChange).prod (RingHom.pi atRealPlace)` with `atRealPlace w = baseChange` (`Global/WittLocalization.lean:97–103, 167–170`).
- The rest of the GlobalQuadraticForms diff touches nothing this README states.

**Seeded sample.** No sampled target is in a changed passage. I spot-checked these:
- "The value of the Evens norm on a Kummer class" against `kahn1984` lines 763–765: Lemme II.2.1, printed p. 241. The value is `(Tr a, −d N a) + (2, d)` when `Tr a ≠ 0`, and `(2, d)` otherwise, matching README 2394–2396. Serre's Théorème 1′ is at `serre1984cmh` line 560.
- "Milestone 2": `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` (`LocalField/Quaternion/Invariant.lean:79`) states exactly the `1/2 ↔ −1` clause.
- "Quaternion algebras are central simple": `instIsCentral` and `instIsSimpleRing` (`Quaternion/CentralSimple.lean:151, 69`), the two general-presentation lemmas (`:81, :198`) and `completeSquareEquiv` (`SymbolEquiv.lean:104`) exist.

**Consumers re-resolved.**
- `Completed/OrthogonalSpinGroups/Suggested.lean:84–86`.
- IntegralLattices on main, 476, 898, 1027 and 2229 (`hilbertSymbol_productFormula`). Its row 453 lists `exists_of_realization` among Tau Ceti files, not this namespace.
- QuaternionArithmetic at #1722, 215–219.

**Overlaps.** No dropped ids, and no ids that only an open revision defines. The four conflicting pull requests are R02. The ownership audit of earlier rounds stands, because no owned object changed.

**Remark (no change asked).** README 66–67 says GlobalQuadraticForms consumes "the local invariants and the product formula named above". It consumes Tau Ceti's (its README 141–146). Step 3 of R03 rewrites the list this phrase points to.

**Adversarial table.** The first block holds this round's recomputations. The second block carries forward the rows of the review of `024927f` (r20) for statements left untouched.

| Statement | Instance | Values on each side | Result | Change |
|---|---|---|---|---|
| R03 repair (nine deleted) | scratch copy, `lake env lean` | exit 0, no messages; `hasseInvariant_eq_localHasse` still elaborates without `discr`/`hilbertSymbol_mul` | holds | R03 |
| Evens value, `Tr a ≠ 0` (`:267`) | `K = ℚ₂`, `L = ℚ₂(i)`, `d = −1`, `a = 1+2i` | `Tr = 2`, `N = 5`; RHS `(2)∪(5) + (2)∪(−1) = (2)∪(5)`, since `−1 = 1² − 2·1²`; `(2,5)₂ = −1`, so `≠ 0` | consistent | none |
| Evens corollary `1 + t√d` (README 2399–2400) | general `d, t` | `(2)∪(−d(1−dt²)) + (2)∪(d) = (2)∪(−1) + 2·(2)∪(d) + (2)∪(1−dt²) = (2)∪(1−dt²)` | matches | none |
| Evens, `Tr a = 0` (README 2396) | `a = √d` | value `(2)∪(d)`; agrees with `galoisEvens2_kummerClass_sqrt` | matches | none |
| Milestone 2 (README 1688) | `ℚ₂, (−1,−1)`; `ℚ₃, (−1,−1)` | `−1`, so `inv = 1/2`; `−1 = 1+1` mod 3 lifts, so `+1` and `inv = 0` | matches | none |
| Central simplicity (README 1085) | `ℍ[K,a,0,b]` | hypothesis `c(b'²+4a)` with `b' = 0`, `c = b` gives `4ab ≠ 0` for units with `2` invertible | holds | none |
| `globalToLocal` sentence (README 962) | pin definition | components `baseChange` at `v` and `atRealPlace w = baseChange` | true | none |
| `hilbertSymbol_unramified` (`:135`), r20 | `ℚ₂, Δ=5`; `ℚ₃, Δ=−1`; control `ℚ₂, Δ=−1` | `(5,2)=−1`, `(5,−1)=+1`; `(−1,3)₃=−1`; `(−1,−1)₂=−1` with `v=0` | true, `∃` needed | R03 (deletion) |
| `discr` docstring (`:65`), r20 | `⟨1,−1⟩`; rank 0 | class of `−1`; empty product `1` | true | R03 (deletion) |
| `localHasse` docstring (`:99`), r20 | `ℚ₃ ⟨1,1⟩≅⟨−1,−1⟩`; `ℚ₂` same pair | `+1=+1`; `+1≠−1`, not isometric | true | none |
| `I²` additivity and failure (README 1182, 1189), r20 | `ℝ`: `⟨1⁴⟩⊥⟨1³⟩`; `⟨1,1⟩⊥⟨1⟩` | `1=[ℍ][ℍ]`; `[ℍ] ≠ 1·1` with `d±=−1` | consistent | none |
| `⟨1ⁿ⟩` list, `⟨−1,−1,−1⟩` (README 1234–1239), r20 | `n=1..8`; `ℝ` | `C(n+1,4)=0,0,1,5,15,35,70,126`; `C₀≅ℍ`, wrong formula gives `1` | match | none |
| Four-fold criterion (`:228`), r20 | `a=1`; `ℝ, a=b=−1`; `ℚ₂, (2,5)` | all hold; all fail; all fail | consistent | none |
| 6D classification (`:241`), r20 | `ℚ₂ ⟨1,1⟩` vs `⟨2,2⟩`, `⟨−1,−1⟩` | same triple, isometric; `s` differs, not | consistent | none |
| Cup-norm (`:256`), r20 | `ℝ, (−1,−1)`; `𝔽_q`; `a=1` | cup `≠0`, no solution; `H²=0`; `(1)=0` | agree | none |
| Relative `w₂` (`:284`), r20 | `ℚ₂(i)`, `a=1+2i` | `(2)∪(5) = 0 + (2)∪(5) + (−1)∪(5)`, `(−1,5)₂=+1` | equal | none |
| `hilbertSymbol_comm`, `_mul`, `exists_…_neg_one`, `exists_of_realization`, r20 | `ℚ (−1,3)`; `ℚ₂ (−1,21)`; `ℚ₂ a=−1`; `(2,[1],−1)` | `−1=−1`; `+1=(−1)(−1)`; `b=3`; `⟨−1,−1⟩` | true | R03 (deletion) |
| `hasseInvariant_eq_localHasse` (`:170`), r20 | `ℚ₂ ![−1,−1]` | `ε[(−1,−1)] = −1 = localHasse` | agree | none |
| `hilbertSymbol_productFormula` (`:197`), r20 | `ℚ`: `(−1,−1)`, `(2,5)` | product `1` both | true | none |
| `hilbertSymbol_eq_cohomological` (`:208`), r20 | `ℚ₂ (−1,−1)`; `𝔽_q` | sign `−1`; vacuous without `tr` | true | none |
| Hasse, Clifford, dim ≤ 3, `I²`, base change, symbol, classical construction, cup compatibility (sample), r18–r20 | `ℝ` ranks 3–4; `ℚ₂`, `ℚ₃` symbols; `ℚ₂(i)` index | `⟨1⁴⟩`,`⟨(−1)⁴⟩` share `([1],1)`; `(3,3)₃=−1`; index `2`; `ℚ₃` symbol `+1`, cup `0` | match | none |

## Not verifiable

- Lam (2005) V.3.20–V.3.21 and the remaining unreadable sources are unchanged from the previous review: Gille–Szamuely, Grove, O'Meara (1955, 1963), Serre's *A Course in Arithmetic* and *Local Fields*, Scharlau and Milnor. The paywalled ones are settled as `uncertified`. I sampled no locator into them in this round.
- Not checked: whether `Completed/LocalGaloisGroups/Suggested.lean` builds at this head. This job may build only this folder's module and Tau Ceti modules.

## Source issues

- none
