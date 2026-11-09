# Review of QuadraticFormInvariants (pull request #1215 at bac57fe)

**Verdict:** needs changes

This is an incremental re-review. This folder has 0 changed lines since `b94cfcc`. The one new commit, `bac57fe`, changes only `ClassFieldTheory/README.md` and `ClassFieldTheory/Suggested.lean`, which belong to this pull request. None of the three P3 findings of the review of `b94cfcc` is repaired, so all three are restated below with witnesses taken at this head. The ClassFieldTheory change makes no passage of this folder false. Its rewritten boundary now agrees with this README (see Verified sound).

## R01 (P3) — An edit outside the folders this pull request owns fails the gate

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` is still 62 insertions and 50 deletions against main. The worker's gate at `bac57fe` gives `outside-folder=1` on this file. Every other check is 0, and `build=0`.

**Claim.** The pull request owns `ClassFieldTheory`, `GlobalQuadraticForms` and this folder. Its title ("ClassFieldTheory: correct hypotheses, conductors and lifting") and its description never mention `LocalGaloisGroups`.

**Witness.**
- `git diff --stat b94cfcc HEAD` lists only the two ClassFieldTheory files.
- The description is unchanged.
- The file imports `TauCetiRoadmap.ClassFieldTheory.Suggested` (line 12) and uses about twenty `ClassFieldTheory.*` names, among them `artinMap`, `muNRep`, `kummerEquiv_mixed` and `absoluteGaloisGroupExtend`.
- Main's copy targets the old ClassFieldTheory file, so reverting is not a repair.
- This head's ClassFieldTheory change (dropping `galoisCharacterConductorExp`, replacing the `Herbrand.ArtinConductor` import with `Herbrand.Basic`) touches no name the file uses. A grep finds no `artinConductor` or `conductorExp` in it.

**Repair.** Keep the migration and name it in the pull-request description. For example: "`Completed/LocalGaloisGroups/Suggested.lean` is repointed to this head's ClassFieldTheory names, because `ClassFieldTheory/Suggested.lean` no longer declares main's." The gate then counts the file as this pull request's own.

## R02 (P3) — Four open pull requests change this roadmap, and no merge order is stated

**Location.** The pull-request description names none of #617, #1187, #1411 or #1797. `overlaps.md` lists each of them as conflicting with this pull request in `TauCetiRoadmap/QuadraticFormInvariants/`.

**Claim.** Each of the four carries its own copy of `QuadraticFormInvariants`. Whichever merges second conflicts with the first, or silently undoes its changes.

**Witness** (heads from today's index, all new since the last review):
- **#617 at `e2fb851`.** It now carries a second rewrite of this folder. Its 284-line `Suggested.lean` has the same 15 declarations and 5 examples as this head, but a different module docstring and layer layout: 313 differing lines against this head. Its README differs from this head's by 137 lines.
- **#1797 at `872449f`.** Its `Suggested.lean` is still `b9e8822`'s, apart from the index header line. If it merges after this pull request, it restores the old `hilbertSymbol_unramified` and `qfiNativeBrauerCommGroup`.
- **#1411 at `303ce50`.**
  - Its copy of this folder is main's file plus two imports.
  - Its `IntegralLattices/Suggested.lean` imports this module, and lines 749–754 use `QuadraticFormInvariants.hilbertSign`, which this head does not declare.
- **#1187 at `66ed0d4`.** It bumps Tau Ceti and changes main's copy of this file by 42 lines.

**Repair.**
1. State the order in the description. For example: this pull request merges before #617, #1411 and #1797, and each of them then drops its `QuadraticFormInvariants` hunks. #617 keeps none of its parallel rewrite, or this pull request adopts #617's version and drops its own. The opposite order also works if this pull request is rebased.
2. Under that order, #1411's IntegralLattices `example` at 749–754 needs `TauCeti.hilbertSign` (`TauCeti/Data/ZMod/IntUnitsPower.lean:62`) and this head's statement of the product formula. Add `hilbertSign` → `TauCeti.hilbertSign` to the README's old → new list (README 36–46).
3. Say whether #1187 merges first. If it does, this file must re-elaborate at #1187's Tau Ceti pin.

## R03 (P3) — GlobalQuadraticForms no longer imports this namespace: the attributions are false and nine aliases are padding

**Location.**
- `README.md:26–34`: the alias list attributes `formClass`, `discr`, `wittRing`, `toWittRing`, `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one` and `exists_of_realization` to "(`GlobalQuadraticForms`)".
- The same attribution appears at:
  - `README.md:36` ("Three names that `GlobalQuadraticForms` cites from this namespace");
  - `README.md:141–143` and `810–812`;
  - `README.md:1599–1600`;
  - `Suggested.lean:31–39`.
- `README.md:2636–2640`: the GlobalQuadraticForms consumer bullet names "the evaluation against the unramified class of 6B–6C" and "the cohomological comparison" of 6C.

**Claim.** GlobalQuadraticForms at this head imports nothing from `TauCetiRoadmap.QuadraticFormInvariants` and cites none of its names. Three things follow:
- the attributions above are false;
- two items of the consumer bullet are inputs GlobalQuadraticForms never uses;
- nine aliases have no importer: `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one` and `exists_of_realization`. Each closes with one Tau Ceti term, so each is padding.

**Witness.**
- `GlobalQuadraticForms/Suggested.lean:3–8` imports Mathlib and five Tau Ceti modules, and nothing else.
- Its README says "There is no roadmap supplier" (line 141). It cites "Quadratic Form Invariants, whose results used here are Tau Ceti declarations" (79–81), and has no hit for "unramified" or "cohomological comparison".
- GlobalQuadraticForms is unchanged since `b94cfcc`.

**Repair.** The repair is unchanged, and I re-tested it at this head.
1. Delete the nine declarations. Keep:
   - the `export`;
   - `hilbertSymbol`, `localHasse` and `hasseInvariant_eq_localHasse` (main's `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` imports them);
   - `hilbertSymbol_productFormula` and `hilbertSymbol_eq_cohomological`;
   - the private lemma and the five examples.

   I elaborated a scratch copy with exactly these nine removed (lines 61–87, 108–111, 123–128, 131–141 and 144–165 deleted). It exits 0 with no messages.
2. Turn README 36–46 into an old → new list with no roadmap attribution, and add these lines:
   - `discr` → `TauCeti.RegularFormClass.discr` via `TauCeti.multiplicativeSquareClassEquiv`;
   - `wittRing` → `TauCeti.WittRing`;
   - `toWittRing` → `TauCeti.WittRing.mk`;
   - `hilbertSymbol_neg_self`, `hilbertSymbol_comm` and `exists_hilbertSymbol_eq_neg_one` → the `TauCeti.` declarations of the same names;
   - `hilbertSymbol_mul` → `TauCeti.hilbertSymbol_mul_right`;
   - `hilbertSymbol_unramified` → `TauCeti.exists_unramified_class` with `TauCeti.hilbertSymbol_unramified`;
   - `exists_of_realization` → `TauCeti.RegularFormClass.exists_of_realization`.
3. Rewrite the scope list (26–34), README 1599–1600 and `Suggested.lean:31–39` to name the actual importers and citers: OrthogonalSpinGroups, IntegralLattices and QuaternionArithmetic.
4. Replace this roadmap's names with Tau Ceti's:
   - `discr` at 141–143, 809–813 and 900–903;
   - `hilbertSymbol_unramified` at 1383;
   - the names at 1512, 1519 and 1523.
5. In the GlobalQuadraticForms bullet, drop the unramified-class evaluation and the cohomological comparison. Add a QuaternionArithmetic bullet for 6C.

## Previous findings

- R01 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still 62+/50− against main, the description still omits it, and the worker's gate at `bac57fe` reports `outside-folder=1`. Restated as R01.
- R02 — not repaired: the description is unchanged and names none of #617, #1187, #1411 or #1797. #617 now carries a second rewrite of this folder, and #1797 still carries `b9e8822`'s file. Restated as R02.
- R03 — not repaired: README 26–36 still attributes the names to `GlobalQuadraticForms`, and the nine aliases remain. GlobalQuadraticForms is unchanged and imports only Mathlib and Tau Ceti. Restated as R03.

## Verified sound

**Gate.**
- The worker's gate at `bac57fe` reports `outside-folder=1` (R01) and 0 on every other check, including `build=0`.
- My own run gives `outside-folder=5`. The four extra entries are this pull request's own ClassFieldTheory and GlobalQuadraticForms files.

**Depcheck.** The output is `depcheck: 239 roadmaps, 2332 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 11 s with no messages, so nothing in the file is admitted.
- A scratch copy with nine extra Tau Ceti class-field imports and 54 `#check @` lines elaborates with exit 0 and no errors. It covers:
  - all 15 declarations and the two exported names;
  - the 14 Tau Ceti targets of R03's old → new list, and the three of README 36–46;
  - the 11 `TauCeti.ClassFieldTheory.*` names of README 306–317 and Milestone 2;
  - the 8 Tau Ceti theorems of Milestone 2, item 13 and the cup compatibility;
  - the three comparison theorems the new ClassFieldTheory text names;
  - Mathlib's `TopRep`.
- `signatures.md` flags three declarations as having lost `[Invertible (2 : K)]`. All three leads are false: `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry an anonymous `[Invertible 2]` in the elaborated type.

**One-tactic probe.**
- The nine aliases each close with one Tau Ceti term (R03).
- The five examples close with one Tau Ceti theorem each. They are the roadmap's headline theorems, all proved at the pin, so they are not padding.

**Headlines.** README 10–15 and the module docstring list:
- the four-fold splitting criterion (Layer 2);
- the `(dim, d, s)` classification (6D);
- the cup-norm theorem (7C);
- the Evens value on a Kummer class (Layer 9);
- the degree-two relative Stiefel–Whitney formula (Layer 9).

All five are statable and stated, and no statable headline is missing.

**The ClassFieldTheory change against this README.** The commit rewrites three ClassFieldTheory passages that describe this roadmap: the boundary bullet (CFT README 203–211), the Layer 14 paragraph (1983–1988) and the consumer paragraph (2021–2022).
- Before the change, they said this roadmap proves that its symbols agree with the cohomological invariants. They now say that Tau Ceti proves it and that this roadmap consumes it.
- This resolves a disagreement with this README's boundary (71–78), the ClassFieldTheory supplier contract (306–317) and item 14 (1595–1600), all of which already called this roadmap's two theorems aliases of `TauCeti.hilbertSymbol_eq_cohomological` and `TauCeti.hilbertSymbol_productFormula`.
- The three newly named comparisons resolve at the pin:
  - `TauCeti.hilbertSymbol_unitAtFinitePlace_eq_hilbertSign` (`Global/CohomologicalSymbol.lean:72`);
  - `TauCeti.hilbertSymbol_unitAtRealPlace_eq_hilbertSign` (`:90`);
  - `TauCeti.hilbertSymbol_productFormula` (`Global/ProductFormula.lean:67`), which is proved from `finprod_hilbertSymbol_mul_prod_hilbertSymbol_eq_hilbertSign` and `ClassFieldTheory.hilbertProductFormula`. This is the route item 14 describes.
- ClassFieldTheory Layers 5 (README 1004) and 14 (1968) keep their numbers and titles. This README cites none of the renumbered items: the new "Layer 0, item 4" mapping, the dropped `galoisCharacterConductorExp`, or the `TateCohomology.*` rows.
- The `GalRep` sentence now says Mathlib's `TopRep`, and this README cites no `GalRep`.

**Consumers re-resolved.**
- Main's `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` (`hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse`).
- #1411's IntegralLattices 400–402 and 749–754 (R02).

**Overlaps.**
- No ids are dropped, and no ids are defined only by an open revision.
- The four conflicting pull requests are R02.
- No object this roadmap owns has changed, so the ownership audit of earlier rounds stands, including against QuadraticFormInvariantsPartII (#1834).

**Seeded sample.** No sampled target lies in a changed passage. The targets that depend on ClassFieldTheory were re-resolved against its changed text and at the pin:
- "Milestone 2": `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` (`LocalField/Quaternion/Invariant.lean:79`) and `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` (`:92`);
- "The symbol" items 13–14;
- "Compatibility with the cup product": `cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`).

I also recomputed the scaling formula of "The Hasse invariant" and O'Meara's `S = s·(d,−1)` (table).

**Remark (untouched text, no change asked).** README 326 lists ProfiniteCohomology's `TopRep` among "Tau Ceti's declarations". At the pin it is Mathlib's `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`), which is how ClassFieldTheory's new Layer 5 sentence names it.

**Adversarial table.** The first block holds this round's computations. The second block carries forward the rows of the review of `b94cfcc` (r26), and through it r20's, for statements this head leaves untouched.

| Statement | Instance | Values on each side | Result | Change |
|---|---|---|---|---|
| CFT boundary: product formula via placewise comparisons (CFT 203–211; README 1595–1600) | `ℚ`, `(−1,−1)` | `(−1,−1)₂ = −1 = hilbertSign 1`; `(−1,−1)_ℝ = −1 = hilbertSign 1`; odd `p`: `+1`; product `(−1)(−1) = 1` | agree | none |
| `hilbertSign` dictionary (`IntUnitsPower.lean:62`) | `0`, `1` | `hilbertSign 0 = 1` (`hilbertSign_zero`); `1 ↦ −1` | matches README 1588–1589 | none |
| R03 repair (nine deleted), this head | scratch copy, `lake env lean` | exit 0, no messages; `hasseInvariant_eq_localHasse` still elaborates without `discr` or `hilbertSymbol_mul` | holds | R03 |
| Hasse scaling `s(λq)` (README 1133–1134) | `n=1`; `n=2`, `⟨a,b⟩`; `n=3` | `1 = 1`; `(λa,λb) = (λ,−1)(λ,ab)(a,b)`; `(λ,−1)³(λ,abc)²·s(q)` | formula matches | none |
| O'Meara `S = s·(d,−1)` (README 1139–1140) | `⟨a₁,…,aₙ⟩` | `∏_{i≤j} = s·∏ᵢ(aᵢ,aᵢ) = s·∏ᵢ(aᵢ,−1) = s·(d,−1)` | matches | none |
| Dropped-binder leads (`:146`, `:152`, `:170`) | `#check @` | each type has `[Invertible 2]` | false positives | none |
| Evens value, `Tr a ≠ 0` (`:267`), r26 | `ℚ₂(i)`, `d=−1`, `a=1+2i` | `Tr = 2`, `N = 5`; RHS `(2)∪(5)`; `(2,5)₂ = −1` | consistent | none |
| Evens corollary `1 + t√d` (README 2399–2400), r26 | general `d, t` | `(2)∪(−d(1−dt²)) + (2)∪(d) = (2)∪(1−dt²)` | matches | none |
| Evens, `Tr a = 0` (README 2396), r26 | `a = √d` | `(2)∪(d)` | matches | none |
| Milestone 2 (README 1688), r26 | `ℚ₂ (−1,−1)`; `ℚ₃ (−1,−1)` | `−1`, so `inv = 1/2`; `+1`, so `inv = 0` | matches | none |
| Central simplicity (README 1085), r26 | `ℍ[K,a,0,b]` | `4ab ≠ 0` for units with `2` invertible | holds | none |
| `hilbertSymbol_unramified` (`:135`), r20 | `ℚ₂, Δ=5`; `ℚ₃, Δ=−1`; control `ℚ₂, Δ=−1` | `(5,2)=−1`, `(5,−1)=+1`; `(−1,3)₃=−1`; `(−1,−1)₂=−1` with `v=0` | true, `∃` needed | R03 (deletion) |
| `discr` (`:69`), r20 | `⟨1,−1⟩`; rank 0 | class of `−1`; empty product `1` | true | R03 (deletion) |
| `localHasse` (`:104`), r20 | `ℚ₃ ⟨1,1⟩≅⟨−1,−1⟩`; `ℚ₂` same pair | `+1=+1`; `+1≠−1`, not isometric | true | none |
| `I²` additivity (README 1182, 1189), r20 | `ℝ`: `⟨1⁴⟩⊥⟨1³⟩`; `⟨1,1⟩⊥⟨1⟩` | `1=[ℍ][ℍ]`; `[ℍ] ≠ 1·1` with `d±=−1` | consistent | none |
| `⟨1ⁿ⟩` Clifford list (README 1234–1239), r20 | `n=1..8` | `C(n+1,4) = 0,0,1,5,15,35,70,126` mod 2 | match | none |
| Four-fold criterion (`:228`), r20 | `a=1`; `ℝ, a=b=−1`; `ℚ₂, (2,5)` | all hold; all fail; all fail | consistent | none |
| 6D classification (`:241`), r20 | `ℚ₂ ⟨1,1⟩` vs `⟨2,2⟩`, `⟨−1,−1⟩` | same triple, isometric; `s` differs, not | consistent | none |
| Cup-norm (`:256`), r20 | `ℝ (−1,−1)`; `𝔽_q`; `a=1` | cup `≠0`, no solution; `H²=0`; `(1)=0` | agree | none |
| Relative `w₂` (`:284`), r20 | `ℚ₂(i)`, `a=1+2i` | `(2)∪(5) = 0 + (2)∪(5) + (−1)∪(5)` | equal | none |
| `_comm`, `_mul`, `exists_…_neg_one`, `exists_of_realization`, r20 | `ℚ (−1,3)`; `ℚ₂ (−1,21)`; `ℚ₂ a=−1`; `(2,[1],−1)` | `−1=−1`; `+1=(−1)(−1)`; `b=3`; `⟨−1,−1⟩` | true | R03 (deletion) |
| `hasseInvariant_eq_localHasse` (`:170`), r20 | `ℚ₂ ![−1,−1]` | `ε[(−1,−1)] = −1 = localHasse` | agree | none |
| `hilbertSymbol_productFormula` (`:197`), r20 | `ℚ`: `(−1,−1)`, `(2,5)` | product `1` both | true | none |
| `hilbertSymbol_eq_cohomological` (`:208`), r20 | `ℚ₂ (−1,−1)`; `𝔽_q` | sign `−1`; vacuous without `tr` | true | none |
| Remaining sample (Hasse, Clifford, dim ≤ 3, `I²`, base change, symbol, classical construction), r18–r20 | `ℝ` ranks 3–4; `ℚ₂`, `ℚ₃`; `ℚ₂(i)` | `⟨1⁴⟩`, `⟨(−1)⁴⟩` share `([1],1)`; `(3,3)₃=−1`; index `2` | match | none |

## Not verifiable

- Unchanged from the previous review:
  - Lam (2005) V.3.16–V.3.21 and p. 119;
  - Gille–Szamuely;
  - Grove;
  - O'Meara (1955, 1963);
  - Serre's *A Course in Arithmetic* and *Local Fields*;
  - Scharlau;
  - Milnor.

  The paywalled ones are settled as `uncertified`. This round samples no locator into them. The scaling and O'Meara formulas were checked by computation, not against the texts.
- Not checked: whether `Completed/LocalGaloisGroups/Suggested.lean` builds at this head. This job may build only this folder's module and Tau Ceti modules.

## Source issues

- none
