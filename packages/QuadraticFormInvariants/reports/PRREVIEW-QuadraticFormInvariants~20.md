# Review of QuadraticFormInvariants (pull request #1215 at 024927f)

**Verdict:** needs changes

This is an incremental re-review: 116 lines of this folder changed since `b9e8822`. Of the review of `b9e8822`, findings R03 to R08 are repaired; R01 and R02 are not and are restated below. The same pull request rewrote `GlobalQuadraticForms` in this round, and that rewrite makes several passages here false. They are R03. All three findings are P3.

## R01 (P3) — An edit outside the folders this pull request owns fails the gate

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions against main. The worker's gate at `024927f` reports `outside-folder=1` on this file; every other check is 0 and `build=0`.

**Claim.** The pull request owns `ClassFieldTheory`, `GlobalQuadraticForms` and this folder. Its title and description never mention `LocalGaloisGroups`.

**Witness.** `git diff --stat b9e8822 HEAD -- Completed/LocalGaloisGroups` is empty: the file and the description are both unchanged since the last review. My own gate run lists the same file.

**Repair.** Either name the migration of `Completed/LocalGaloisGroups/Suggested.lean` in the pull-request description, or revert the file to main.

## R02 (P3) — Four open pull requests change this roadmap, and no merge order is stated

**Location.** The pull-request description. It names none of #617, #1187, #1411 or #1797. `overlaps.md` lists each of them as conflicting with this pull request in this folder.

**Claim.** Each of the four carries its own copy of `QuadraticFormInvariants`. Whichever merges second conflicts, or silently undoes the other's changes.

**Witness.**
- #1797 (`f2f59c7`): its `Suggested.lean` is byte-identical to `b9e8822`'s. Merged after this head, it would restore `qfiNativeBrauerCommGroup` and the hypothesis-form `hilbertSymbol_unramified`, undoing the repairs of the previous R03 and R04.
- #617 (`b254b25`): it edits main's README lines 703–705 and `Suggested.lean` line 2525 about `muNRepCoeffDictionary`. This head contains no such text.
- #1411 (`0333060`): it adds two imports to main's 3873-line `Suggested.lean`. This head replaces that file with 297 lines.
- #1187: it bumps Tau Ceti and rewrites main's copy (41 Lean lines, 152 README lines).

**Repair.** In the description, state that this pull request merges before #617, #1411 and #1797, and that each of them then drops its `QuadraticFormInvariants` hunks; or state the reverse order and rebase this one. Also say whether #1187 merges before this pull request or after it. If before, this file's declarations must re-elaborate at #1187's Tau Ceti pin.

## R03 (P3) — GlobalQuadraticForms no longer imports this namespace, so the attributions are false and nine aliases are padding

**Location.**
- `README.md:26–30`: "`formClass`, `discr`, `wittRing` and `toWittRing` (`GlobalQuadraticForms`); `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one` and `exists_of_realization` (`GlobalQuadraticForms`)".
- The same attribution appears at:
  - `README.md:36` ("Three names that `GlobalQuadraticForms` cites from this namespace");
  - `README.md:143` and `812` (`discr` is declared "because `GlobalQuadraticForms` consumes it under that name");
  - `README.md:1600`;
  - `Suggested.lean:31–39`.
- `README.md:2636–2640` says GlobalQuadraticForms consumes "the evaluation against the unramified class of 6B–6C" and "the cohomological comparison" of 6C.

**Claim.** At this head, GlobalQuadraticForms imports and cites nothing from `TauCetiRoadmap.QuadraticFormInvariants`. Four of the attributions therefore state something false:
- the scope list;
- the lead sentence of the new old → new list;
- the reason given for declaring `discr`;
- the module docstring.

Two items of the new GlobalQuadraticForms consumer bullet name inputs that GlobalQuadraticForms never uses.

The aliases had one justification: consumers import them. Nine of them now have no importer, and each restates a Tau Ceti declaration: `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one` and `exists_of_realization`. That is padding. The rewritten `hilbertSymbol_unramified` closes with the single term `(TauCeti.exists_unramified_class _).imp fun _ h => ⟨h.1, h.2.1, TauCeti.hilbertSymbol_unramified h.2.2.2⟩`.

**Witness.**
- `GlobalQuadraticForms/Suggested.lean` imports only Mathlib and five Tau Ceti modules (lines 3–8).
- Its README line 136 says "There is no roadmap supplier", and it never mentions the unramified class or the cohomological comparison.
- `roadmaps grep` finds the nine names cited only by main's GlobalQuadraticForms, which this pull request replaces.

**Repair.**
1. Delete the nine declarations from `Suggested.lean`. Keep:
   - `hilbertSymbol`, `localHasse` and `hasseInvariant_eq_localHasse`, which `Completed/OrthogonalSpinGroups/Suggested.lean:84–86` imports;
   - `hilbertSymbol_productFormula`, cited by IntegralLattices 3G and 6A;
   - `hilbertSymbol_eq_cohomological`, cited with `hilbertSymbol_productFormula` by QuaternionArithmetic's supplier paragraph on 6C;
   - the private reindexing lemma and the five headline examples.

   I tested this repair: a scratch copy without the nine elaborates with exit 0 and no messages.
2. Turn README 36–46 into a list that attributes the names to no roadmap: "The following names of this namespace are Tau Ceti's declarations; one line per name, old → new". Add one line per deleted name:
   - `discr` → `TauCeti.RegularFormClass.discr`, read through `TauCeti.multiplicativeSquareClassEquiv`;
   - `wittRing` → `TauCeti.WittRing`;
   - `toWittRing` → `TauCeti.WittRing.mk`;
   - `hilbertSymbol_neg_self` → `TauCeti.hilbertSymbol_neg_self`;
   - `hilbertSymbol_comm` → `TauCeti.hilbertSymbol_comm`;
   - `hilbertSymbol_mul` → `TauCeti.hilbertSymbol_mul_right`;
   - `hilbertSymbol_unramified` → `TauCeti.exists_unramified_class` with `TauCeti.hilbertSymbol_unramified`;
   - `exists_hilbertSymbol_eq_neg_one` → `TauCeti.exists_hilbertSymbol_eq_neg_one`;
   - `exists_of_realization` → `TauCeti.RegularFormClass.exists_of_realization`.
3. Rewrite the scope list (26–34), README 1599–1600 and `Suggested.lean:31–39` to name the actual importers: OrthogonalSpinGroups, IntegralLattices and QuaternionArithmetic.
4. Replace "this roadmap's" with the Tau Ceti names at these lines:
   - 141–143, 809–813, 900–903 (`discr`);
   - 1383 (`hilbertSymbol_unramified`);
   - 1512, 1519 and 1523.
5. In the GlobalQuadraticForms consumer bullet, drop the unramified-class evaluation and the cohomological comparison. Add a QuaternionArithmetic bullet for 6C.

## Previous findings

- R01 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still 62+/50− against main and unchanged since `b9e8822`; the description still omits it, and the gate reports `outside-folder=1`. Restated as R01.
- R02 — not repaired: the description is unchanged and names none of #617, #1187, #1411 or #1797; #1797's `Suggested.lean` now lags this head and would revert two repairs. Restated as R02.
- R03 — repaired: `Suggested.lean:135–140` now states "∃ Δ : Kˣ, ¬ IsSquare Δ ∧ (normalizedValuation K Δ).toAdd = 0 ∧ ∀ b, hilbertSymbol Δ b = if Even … then 1 else -1". It elaborates. The repair introduced a new problem: no roadmap imports the theorem any more (R03).
- R04 — repaired: `qfiNativeBrauerCommGroup` is gone, and the file elaborates with exit 0, including `hasseInvariant_eq_localHasse`.
- R05 — repaired: `README.md:1236–1242` now says the `⟨1,…,1⟩` list "checks only the second correction exponent" and adds `⟨−1,−1,−1⟩`, for which the formula with its first factor dropped would give `1`.
- R06 — repaired:
  - line 2119 now reads "Over every field in which `2` is invertible";
  - lines 1182–1184 now require "the Witt class of one summand";
  - line 319 now lists "Layers 0–4, 8–10, 12 and 13".
- R07 — repaired: GlobalQuadraticForms at this head cites no `signedDiscr`, `localHasse_congr` or `discr_mk`, and README 36–46 maps all three to Tau Ceti. That list's lead sentence is now false (R03).
- R08 — repaired: `## Downstream consumers` (2631–2656) is present, with eight bullets. Two items of the GlobalQuadraticForms bullet are wrong (R03).

## Verified sound

**Gate.**
- The worker's gate at `024927f` reports 0 on every check except `outside-folder=1` (R01), and `build=0`.
- My own run gives `outside-folder=5`. The four extra entries are this pull request's own ClassFieldTheory and GlobalQuadraticForms files.

**Depcheck.** The output is `depcheck: 239 roadmaps, 2334 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 27 s with no messages.
- One scratch file holds `#check @` for all 15 declarations and for 14 Tau Ceti names; it elaborates with exit 0.
- I compared each elaborated type with its README statement:
  - The three "dropped `[Invertible (2 : K)]`" leads in `signatures.md` are false positives. `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry an anonymous `[Invertible 2]`.
  - The new `hilbertSymbol_unramified` carries `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Invertible 2]`, as 6B states.

**Docstring probes.** These were run in the same scratch file, and both elaborate.
- The new `discr` docstring: `discr ⟦⟨n, w⟩⟧ = QuotientGroup.mk (∏ i, w i)`, by `rw [discr, discr_mk, ← multiplicativeSquareClassEquiv_mk, MulEquiv.symm_apply_apply]`.
- The new `localHasse` docstring: over a nonarchimedean local field, isometric `weightedSumSquares` tuples have equal `localHasse`, from `localHasse_congr`, `localHasse_mk` and the private reindexing lemma.

**Library declarations opened at the pin** (15, Tau Ceti as pinned):
- `exists_unramified_class` (`NumberTheory/LocalField/QuadraticForm/UnramifiedClass.lean:206`). Its fourth clause, `Δ ≡ 1 mod 4`, is the one dropped by `-`.
- `hilbertSymbol_unramified` (same file, line 263).
- `RegularFormClass.discr_mk` (`LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:129`).
- `RegularFormClass.signedDiscr` (same file, line 260): `C(m,2) • [−1] + d`.
- `multiplicativeSquareClassEquiv` and its `_mk` (`FieldTheory/SquareClassGroup/Multiplicative.lean:84, 96`).
- `RegularFormClass.localHasse_mk` and `localHasse_congr` (`NumberTheory/LocalField/QuadraticForm/Hasse.lean:100, 108`). Both carry the local-field binders.
- `localSymbol_eq_zero_iff_cup` (`FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:157`): only `[Field K] [Invertible 2]`, `hζ` and `tr`.
- `ClassFieldTheory.localSymbol` (`NumberTheory/ClassFieldTheory/Local/Symbol.lean:320`): `[Field F]` only.
- `wittClass_mem_fundamentalIdeal_sq_iff` (`LinearAlgebra/QuadraticForm/Witt/Discriminant.lean:289`).
- `cliffordInvariant_add_of_signedDiscr_eq_zero` (`RegularFormClass/Clifford.lean:657`) and `WittRing.cliffordInvariant_add_of_mem_fundamentalIdeal_sq` (`Witt/Clifford.lean:93`). Both assume something of `x` only.
- `cliffordInvariant_eq_hasseInvariant_mul` (`RegularFormClass/Clifford.lean:570`): the exponents are `(rank − 1).choose 2` and `(rank + 1).choose 4`, against the plain `discr`, as in README 1170.
- `BrauerGroup.instCommGroup` (`Algebra/BrauerGroup/Group.lean:174`), a global instance.

**Cross-roadmap citations resolved** (11):
- ProfiniteCohomology Layer 0 is "discrete modules and continuous sections", with open stabilizers and the continuous section (main README 583, 598, 620).
- The eight consumer bullets resolve to their sources:
  - IntegralLattices: main 114, 476, 897–898, 2229, 2305;
  - OrthogonalSpinGroups: main 261–264, 335–336, 612–616;
  - ClassicalArithmeticCompletion: main 13, 223–225, 1028;
  - SpinRepresentations: main 61–62;
  - SchemeAndStackFoundations: main 130, 186;
  - QuadraticFormInvariantsPartII: #1834 at 67, 1201, 1354, 1418;
  - GeometryOfNumbersAndQuadraticArithmeticPartII: #1691 at 15, 482, 583;
  - GlobalQuadraticForms: resolves at this head except two items (R03).
- "None of these roadmaps supplies an input to this one" holds. The supplier contracts (240–341) name only Mathlib, Tau Ceti, LocalFieldsRamification, ClassFieldTheory, ProfiniteCohomology and SemisimpleAlgebras.
- ClassFieldTheory has not changed since `b9e8822`, so its citations, resolved in the last review, stand.

**Citation leads.** The two leads in `citations.md`, `LocalFieldsRamification.map_norm_unitFiltration_zero` and `ProfiniteCohomology.f2Pairing`, are on main: `Completed/LocalFieldsRamification/Suggested.lean:857` and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:5332`.

**Overlaps.**
- There are no dropped ids, and no ids that only an open revision defines.
- The four conflicting pull requests are R02.
- Of the closest roadmaps in vocabulary, #1200's GlobalQuadraticForms cites this roadmap only as "results used here are Tau Ceti declarations" (its line 79). It shares no owned object with this roadmap.
- The ownership audit of earlier rounds stands; the changed passages add no owned object.

**Seeded sample.** Where the sample meets the diff, I checked these targets:
- "The Clifford invariant" (its Examples);
- "The `I²` homomorphism" (item 1);
- "Base change and the remaining API" (the Layer 5 Examples that follow it).

The rows for them are in the table below. The other ten sampled targets are untouched, and their checks carry forward from the earlier reviews.

**Remarks on untouched text** (not findings, no change asked):
- GeometryOfNumbersAndQuadraticArithmeticPartII declares `gap:quadratic-extension-witt-exactness` on this roadmap (its line 71). The new consumer bullet need not repeat it.
- Several further roadmaps in open pull requests cite this one: MetaplecticAutomorphicForms, GL2AutomorphicRepresentationsAndTransfer, HilbertModularVarietiesAndShimuraCurves, K2SymbolsBrauer, KTheoryFiniteLocalFields and GeometryOfNumbersAndQuadraticArithmetic. The consumer list is not required to be exhaustive.

**Adversarial table.** The first block holds the changed statements, with values computed at this head. The second block carries forward the rows of the review of `b9e8822` (r18) for statements this diff leaves untouched.

| Statement | Instance | Values on each side | Result | Change |
|---|---|---|---|---|
| `hilbertSymbol_unramified` (`Suggested.lean:135`) | `ℚ₂`, `Δ = 5` | `(5,2) = −1` with `v(2) = 1`; `(5,−1) = (5,5) = +1` with `v = 0`; `(5,10) = −1` with `v(10) = 1` | true | none |
| same | `ℚ₃`, `Δ = −1` | `(−1,3)₃ = (−1/3) = −1` with `v = 1`; `(−1,2)₃ = +1` with `v = 0` | true | none |
| same, negative control | `ℚ₂`, `Δ = −1` | `(−1,−1)₂ = −1`, while `v(−1) = 0` predicts `+1`: false for this unit, so `∃` and not `∀` is right | true | none |
| same, one-term probe | `(exists_unramified_class _).imp …` | closes; no importer at this head | padding | R03 |
| 6B bullet (README 1381–1389) | `ℚ₂` values | `(5,2) = −1` (`ω(5) = 3`); `(5,−1) = +1` (`ε(5) = 2`); `(−1,−1) = −1` (`ε(−1)` odd) | match | none |
| `discr` docstring (`:65`) | `⟨1,−1⟩` over `ℚ`; rank 0 | class of `−1`; class of `1`, the empty product; Lean probe elaborates | true | none |
| `localHasse` docstring (`:99`) | `ℚ₃`: `⟨1,1⟩ ≅ ⟨−1,−1⟩`; `ℚ₂`, same pair | `ℚ₃`: `(1,1) = +1 = (−1,−1)₃`. `ℚ₂`: `+1 ≠ −1`, and the pair is not isometric. Probe elaborates. | true | none |
| `I²` additivity (README 1182) | `ℝ`: `⟨1⁴⟩ ⊥ ⟨1³⟩` | `C(5,4) = 5`, `C(4,4) = 1`, `C(8,4) = 70`, so `1 = [ℍ][ℍ]`; `d±(⟨1⁴⟩) = (−1)^6 = 1`, so it lies in `I²` | true | none |
| `I²` failure (README 1189) | `ℝ`: `⟨1,1⟩ ⊥ ⟨1⟩` | `c(⟨1³⟩) = [ℍ]`, against `c(⟨1,1⟩) · c(⟨1⟩) = 1 · 1`; `d±(⟨1,1⟩) = −1`, so it is not in `I²` | fails as stated | none |
| `⟨1ⁿ⟩` list (README 1234) | `n = 1..8` | `C(n+1,4) = 0,0,1,5,15,35,70,126`, so `1,1,ℍ,ℍ,ℍ,ℍ,1,1`; `(−1,[1]) = 1` | match | none |
| `⟨−1,−1,−1⟩` (README 1239) | `ℝ` | `(e₁e₃)² = (e₂e₃)² = −1`, anticommuting, so `C₀ ≅ ℍ`; the formula gives `[ℍ]³·[ℍ]·[ℍ] = [ℍ]`; without the first factor, `[ℍ]² = 1` | discriminating | none |
| 7C identification (README 2119) | `#check`; `ℝ`; `𝔽_q` | binders `[Field K] [Invertible 2]`. `ℝ`: the cup is `≠ 0` and the sign is `−1 = (−1,−1)_ℝ`. `𝔽_q`: `H² = 0`, there is no `tr`, and the statement is vacuous. | true | none |
| ProfiniteCohomology contract (README 319) | main README 583 and 598 | Layer 0 is discrete modules, open stabilizers and continuous sections | resolved | none |
| Old → new list (README 36–46) | `#check @` ×5; `⟨1,1⟩` | `signedDiscr(⟨1,1⟩) = C(2,2)•[−1] + [1] = [−1]`; names exist; "GlobalQuadraticForms cites" is false | partly false | R03 |
| Scope list and module docstring | GlobalQuadraticForms head | 0 of the 14 attributed names are imported | false | R03 |
| Consumer bullets (README 2631) | 8 roadmaps | 7 resolve; GlobalQuadraticForms: unramified class 0 hits, cohomological comparison 0 hits | partly false | R03 |
| Four-fold criterion (`:228`), r18 | `a = 1`; `ℝ, a=b=−1`; `ℚ₂, (2,5)` | all hold; all fail; all fail | consistent | none |
| 6D classification (`:241`), r18 | `ℚ₂`: `⟨1,1⟩` against `⟨2,2⟩` and `⟨−1,−1⟩`; rank 0 | same triple, isometric; `s` differs, not isometric; both sides true | consistent | none |
| Cup-norm (`:256`), r18 | `ℝ, a=b=−1`; `𝔽_q`; `a = 1` | cup `≠ 0` and no solution; `H² = 0`, every unit a norm; `(1) = 0` | agree | none |
| Evens value (`:267`), r18 | `ℚ₂(i)`, `a = 1+2i` | `t = 2`, `N = 5`; right side `(2)∪(5) ≠ 0` | consistent | none |
| Relative `w₂` (`:284`), r18 | `ℚ₂(i)`, `a = 1+2i` | `(2)∪(5) = 0 + (2)∪(5) + (−1)∪(5)`, with `(−1,5)₂ = +1` | equal | none |
| `hilbertSymbol_comm`, `_mul`, `exists_…_neg_one`, `exists_of_realization`, r18 | `ℚ, (−1,3)`; `ℚ₂, (−1,21)`; `ℚ₂, a=−1`; `(2,[1],−1)` | `−1 = −1`; `+1 = (−1)(−1)`; `b = 3`; realized by `⟨−1,−1⟩` | true | R03 (deletion) |
| `hasseInvariant_eq_localHasse` (`:170`), r18 | `ℚ₂`, `![−1,−1]` | `ε[(−1,−1)] = −1 = localHasse` | agree | none |
| `hilbertSymbol_productFormula` (`:197`), r18 | `ℚ`: `(−1,−1)`, `(2,5)` | product `1` in both cases | true | none |
| `hilbertSymbol_eq_cohomological` (`:208`), r18 | `ℚ₂, (−1,−1)`; `ℚ` | sign `−1`; vacuous without `tr` | true | none |
| Layer 3 `discr` Checks, r18 | rank 0; `⟨1,−1⟩`; `⟨1⟩` and `⟨4⟩` | `[1]`; `[−1]`; `[1]` on both | match | none |
| `localHasse` Checks, r18 | `ℚ₂ ![−1,2]`; `![−1,−1]` | `+1`; `−1, −1, +1` at 2, ∞, 3 | match | none |
| Central simplicity; Hasse scaling; dim ≤ 3, r18 | `ℍ[K,a,0,b]`; `n = 0, 2`; `ℝ`, ranks 3 and 4 | `4ab ≠ 0`; scaling identity; `⟨1⁴⟩` and `⟨(−1)⁴⟩` share `([1],1)` | match | none |
| Odd-residue formula; 6A counts; 6B case 3, r18 | `ℚ₃ (3,3)`, `ℚ₅ (5,5)`; `ℚ₂`, `ℚ₃`, `ℚ₂(√2)`; `ℚ₂, a=−1` | `−1`, `+1`; `8`, `4`, `16`; `3` is not a sum of two squares | match | none |
| 6D isotropy; `SD₁₆` value; `Pin⁺`, r18 | `⟨1,1,1⟩` over `ℚ₂`, `ℚ₃`; `ℚ₂, d=−1, t=2`; matrices | anisotropic, isotropic; false value `0` against `≠ 0`; `(e₁t)⁴ = −1` | match | none |
| Milestone 2; universes; cup compatibility; 6C index; item 14, r18 | `ℚ₂, (−1,−1)`; `#check`; `ℚ₃`; `ℚ₂(i)`; `ℚ` | `invMap = 1/2`, sign `−1`; `Type`; symbol `+1` and cup `0`; index `2`; product `1` | consistent | none |

**Gaps.** None declared.

## Not verifiable

- O'Meara (1963) 63:11, now attached to the evaluation against the unramified class (README 1381, `Suggested.lean:131`), is `omeara1963`. That source is settled as uncertified. The attribution agrees with the README's own References entry "63:11-13 (symbol computation, bimultiplicativity, nondegeneracy)". The statement was checked against `TauCeti.exists_unramified_class` and by the values above.
- Lam (2005) V.3.20, the source of the Clifford formula behind the changed Examples, is not in `sources.toml`, and its publisher text is paywalled. The formula was checked against `TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul` at the pin and on the instances in the table.
- The other unreadable sources are unchanged from the previous review: Gille–Szamuely, Grove, O'Meara (1955), Serre's *A Course in Arithmetic* and *Local Fields*, Scharlau and Milnor.

## Source issues

- none
