# Review of LocalPurity (pull request #1808 at 43a6b84)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/LocalPurity/` has not changed since `a96d197` (0 lines). The commits since then touch only AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses and ComplexKahlerGeometry, none of which cites LocalPurity or is cited by it. The pins have not moved: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

None of the six findings of the previous review is repaired. Each is restated below and was re-checked at this head. The gate still fails on `outside-folder` (R02).

## R01 (P2) — §1.3's proof routes rest on four Stacks results that no target, supplier or pin owns

**Location.** `TauCetiRoadmap/LocalPurity/README.md:281-287`: "specialize formal module gluing along `A → Â` … (05ER); its monoidal and finiteness preservation (05EU) … not a second general gluing theory. For *completion_fullyFaithful_of_localCohomology*, use … (0EII) and … (0EKP)".

**Claim.** Two §1.3 targets have routes built on results that nothing owns:
- *finite_extend_of_completion* (0BLH) uses formal glueing of module categories (Proposition 15.91.16, 05ER) and its finiteness and tensor preservation (Remark 15.91.20, 05EU).
- *completion_fullyFaithful_of_localCohomology* (0EKS) uses the formal-sections comparison (Lemma 52.12.7, 0EII) and the completion criterion (Lemma 52.15.1, 0EKP).

None of the four is a target here, an item of Scope (lines 39–50), a row of the alignment table (lines 400–417), or a supplier's. Stacks proves 0EKS by citing exactly 0EKP and 0EII (stacks-0EKS lines 2200–2202), so without them that target has no content. A consumer already relies on the missing piece: PurityForFlatCohomology takes "formal-section comparisons on punctured spectra" from LocalPurity §1.3.

**Witness.**
- `roadmaps grep '05ER|0EII|0EKP'` over main and 460 open heads finds these tags only in LocalPurity's own copies (main, #1807, #1808, #1854).
- At the Tau Ceti pin, `RingTheory/FormalGlueing/` contains only `Torsion.lean`.
- RelativeFarguesFontaine §6.5 covers one-element Beauville–Laszlo glueing (Stacks 15.92), not 15.91.16.
- PurityForFlatCohomology README 1195–1196, at its open head, makes the §1.3 citation above.

**Repair.**
1. In §1.3, state three README-only targets, each with its locator:
   - *formalGlueing_completion* (05ER with 05EU). For `A` Noetherian and `𝔪 = (f_1, …, f_t)`, the map `A → Â` is flat (`AdicCompletion.flat_of_isNoetherian`) and `A/𝔪 ≅ Â/𝔪Â`. Modules are then equivalent to glueing data: an `Â`-module, `A_{f_i}`-modules and compatible isomorphisms. The equivalence preserves finite modules and tensor products, so it carries finite algebras to finite algebras. It builds on Tau Ceti's `FormalGlueing/Torsion.lean`.
   - *formalSections_of_localCohomology* (0EII). Let `A` be Noetherian and `f`-adically complete, with `f ∈ 𝔞`. Let `M` be finite with `H¹_𝔞(M)` and `H²_𝔞(M)` killed by a power of `f`. Then `Γ(U, M~) → lim Γ(U, M~/fⁿ)` is bijective, where `U = Spec A ∖ V(𝔞)`. Its route uses SchemeAndStackFoundations §2.7 `localCohomology_module_comparison`.
   - *completion_fullyFaithful_of_sections* (0EKP, (1) ⇒ (4)). For `X` Noetherian and quasi-affine with `Γ(X, 𝒪_X) ≅ lim Γ(Y_n, 𝒪_{Y_n})`, completion is fully faithful on finite locally free modules.
2. Add the three targets to Scope, to the alignment table and to §1.3's *Needs:*.
3. Add *formalSections_of_localCohomology* to PurityForFlatCohomology's line under Downstream consumers.
4. Delete "not a second general gluing theory".

## R02 (P3) — Gate `outside-folder`: two edits outside the declared folders

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md:331`: "`LFunctions` consumes this package and supplies its own character-specific continuation".
- `TauCetiRoadmap/SymplecticGeometry/README.md:77`: "adapters consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** The pull request edits two roadmap folders that are neither in its title nor among the folders named as its own.

**Witness.** `git diff --stat origin/main...HEAD`, with the 15 declared folders excluded, lists exactly these two files, one line each. The worker's gate at `43a6b84` reports `outside-folder=2`, the only failing check.

**Repair.** Revert both lines on this branch, or name both folders in the description so that each gets its own review.

## R03 (P3) — No stated order against #1854, which rewrites this folder differently

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** Pull request #1854, by the same author, also changes both files of this folder, differently from this head, and the description does not mention it:
- Its README has 594 lines, against 440 here.
- Its `Suggested.lean` differs from this head's in the module docstring.

**Witness.**
- `diff` of this head's README against `roadmaps show LocalPurity --pr 1854` gives 520 lines.
- `scratch/overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/LocalPurity/README.md`, `TauCetiRoadmap/LocalPurity/Suggested.lean`".

**Repair.** Say in the merge-order paragraph which of #1808 and #1854 is rebased on the other. Carry a single LocalPurity version: either drop the folder from one of them or make the two copies identical.

## R04 (P3) — *Needs:* lines miss inputs that the routes use; two supplier entries are consumed by nothing

**Location.**
- §2.2 text at lines 351–356 and 368–376, and its *Needs:* at lines 378–381.
- §1.4 *Needs:* at line 307.
- §1.2 route and *Needs:* at lines 238–248.
- Mathlib contract at lines 121 and 127.

**Claim and witness.**
1. **Gluing schemes is not listed.** Two §2.2 routes glue schemes:
   - `finiteEtale_extend_of_regular_codimTwo` ("the local extensions glue");
   - the glueing step of *spread_from_localScheme* (stacks-0BQ5 lines 2600–2602).

   Mathlib's `Scheme.GlueData` (`Mathlib/AlgebraicGeometry/Gluing.lean:91`) is not named anywhere in the README.
2. **Separatedness has no supplier.** Line 355 claims that "separated" descends. SchemeAndStackFoundations §0.9 `finite_presentation_limits` lists flat, smooth, étale, proper, finite, closed immersion, open immersion and isomorphism (its README 915–918 at this head), but not separated.
3. **The two depths need a bridge.** §1.4 consumes §2.7 `depth_localCohomology_vanishing`, which is stated for §0.17's sequence depth `depth_I M`. Convention 4 fixes Mathlib's Ext-defined `IsLocalRing.depth`. The bridge between them is §0.17 `depth_eq_iff_ext` (its README 1285), and §0.17 is absent from the README.
4. **Two §1.2 route inputs are missing.** The route uses "`V` is normal" and a cover of `U` by `D(f)`. The pinned results are:
   - `TauCeti.Algebra.Etale.isIntegrallyClosed_localization_atPrime_of_isIntegrallyClosed` (`RingTheory/Etale/Normal.lean:90`), absent from the README;
   - `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (`AlgebraicGeometry/PuncturedSpectrum.lean:81`), listed only in the contract, at line 143.
5. **Two Mathlib entries are unused.** `Algebra.HasGoingDown` and `IsRegularLocalRing.of_isRegularRing_of_isLocalRing` each occur only once, at lines 127 and 121.

**Repair.**
1. Add `Scheme.GlueData` to §2.2's *Needs:* and to the Mathlib contract.
2. Either cite Limits, Lemma 32.8.6 inside *spread_from_localScheme*, or drop "separated". Neither consumer needs it: 0EY7 and AbhyankarLemma §2.1 use only finite and étale.
3. Add SchemeAndStackFoundations §0.17 (`depth_eq_iff_ext`) to §1.4's *Needs:*.
4. Add the two Tau Ceti names to §1.2's *Needs:*.
5. Delete the two unused Mathlib entries.

## R05 (P3) — The layers have no `### Examples` or `### Dependencies`, and §§1.3–1.4 have no example

**Location.** Layer 1 ends at line 307 and Layer 2 at line 391, each without the two closing subsections. §§1.3–1.4 state nine targets with no Check or example.

**Claim.** The house shape ends every layer with `### Examples` and `### Dependencies`. No instance illustrates either hypothesis of the local Lefschetz part: the henselian pair or the annihilation of local cohomology.

**Witness.** `grep -c '^### Examples'` and `grep -c '^### Dependencies'` both return 0 on this README. #1854's copy of the folder has both subsections.

**Repair.**
- Under Layer 1 `### Examples`, add a positive and a negative instance:
  - `A = k⟦x, y, z⟧` with `f = z`. Depth is 3, so `H¹_𝔪 = H²_𝔪 = 0`, and `(A, (z))` is henselian because `A` is complete. So 0BLJ and 0BLM apply.
  - `A = k⟦x, y⟧` with `f = x`. Here `xⁿ · x^{−n−1}y^{−1} = x^{−1}y^{−1} ≠ 0` in `H²_𝔪(A)`, so 0BM6's hypothesis fails.
- Under Layer 2 `### Examples`, point to the existing Checks.
- Under each `### Dependencies`, collect that layer's *Needs:* items.

## R06 (P3) — The SGA 1 reference describes Corollaire 3.2 as unproved there

**Location.** README 437–439: "Théorème 3.1 and Corollaire 3.2 (Zariski–Nagata purity, stated there without proof; …)".

**Claim.** Only Théorème 3.1 is recalled without proof. For Corollaire 3.2, SGA 1 gives a proof when `dim A = 2`: normality gives depth `≥ 2`, depth gives freeness, and then the discriminant applies. That is the dimension-two route this roadmap takes from Tau Ceti.

**Witness.** sga1 line 8358 marks 3.1 "sans démonstration". Lines 8380–8388 prove 3.2 for `dim A = 2` (printed p. 212).

**Repair.** Write: "Théorème 3.1, recalled without proof, and Corollaire 3.2, its local form, proved there when `dim A = 2` by freeness and the discriminant".

## Previous findings

These are the findings of the review of `a96d197`.

- R01 — not repaired: README 284–287 still reads "The target here is the finite-morphism specialization, not a second general gluing theory. For *completion_fullyFaithful_of_localCohomology*, use formal-section comparison (… 0EII) and … (0EKP)". No target states 05ER, 05EU, 0EII or 0EKP.
- R02 — not repaired: `Completed/ArithmeticDirichletSeries/README.md:331` "`LFunctions` consumes this package and supplies its own character-specific continuation" and `TauCetiRoadmap/SymplecticGeometry/README.md:77` "consumed by HeegaardFloer and consumed by DGFloer" are unchanged, and the gate reports `outside-folder=2`.
- R03 — not repaired: the description's merge-order paragraph still reads "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**", without #1854, and the two heads still conflict in both LocalPurity files.
- R04 — not repaired: §2.2 *Needs:* (378–381) still ends "`Scheme.Cover.glueMorphisms`, `IsLocalRing.depth`". Line 355 still says "separated, proper, finite or étale". §1.4 *Needs:* (307) still lacks §0.17. Lines 121 and 127 are unchanged.
- R05 — not repaired: `grep -c '^### Examples'` = 0 and `grep -c '^### Dependencies'` = 0.
- R06 — not repaired: README 438–439 still says "(Zariski–Nagata purity, stated there without proof; Corollaire 3.2 is a local form of clause (2) of 0BMA)".

## Verified sound

**Gate, build and dependencies, rerun at `43a6b84`.**
- `gate … LocalPurity --base origin/main`: every field is 0 except `outside-folder`, including `readme-ids-missing`, `sorry-data`, `set_option`, `imports`, `statement-hygiene`, `stray-files`, `depcheck` and `dirty`.
  - The rerun lists 28 `outside-folder` paths. Twenty-six are in the 15 folders the brief names as the pull request's own, and the worker's gate counts 2. Those two are R02.
- Dependency check output, verbatim: `depcheck: 238 roadmaps, 2312 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- LocalPurity and its only roadmap supplier, SchemeAndStackFoundations, are both on main.
- `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` gives exactly four warnings, `declaration uses 'sorry'`, at lines 34, 45, 58 and 69.

**Signatures and padding, rerun.**
- In a scratch copy I ran `#check @` on all four declarations. The results equal `scratch/signatures.md` and the README statements:
  - regular local with `2 ≤ ringKrullDim`;
  - `B` finite, torsion free, normal at every prime and étale at primes not over `𝔪`;
  - `[IsNoetherian X]` with purity at every `x ∉ U`;
  - `[IsLocallyNoetherian X]` with regular stalks of dimension `≥ 2`.
- The file has no `variable` block, so no binder can be lost.
- In the same copy I replaced each `sorry` by `first | simp | rfl | infer_instance | trivial | exact inferInstance`. All four fail: line 36 with "type class instance expected", lines 52, 61 and 74 with "failed to synthesize instance". Nothing is padding.
- The README's four end theorems (lines 33–35) are all stated, and the docstring correctly says none is unstatable.

**Library declarations opened at the pins in this review (5).**
- Mathlib `AlgebraicGeometry.Scheme.GlueData` (`Mathlib/AlgebraicGeometry/Gluing.lean:91`).
- Tau Ceti:
  - `TauCeti.IsLocalRing.puncturedSpectrum_eq_iSup_basicOpen` (`AlgebraicGeometry/PuncturedSpectrum.lean:81`);
  - `isIntegrallyClosed_localization_atPrime_of_isIntegrallyClosed` (`RingTheory/Etale/Normal.lean:90`);
  - the folder `RingTheory/FormalGlueing/`, which contains only `Torsion.lean`;
  - `TauCeti.IsLocalRing.PurityHolds` and `TauCeti.FiniteEtaleScheme.pullback`, through the elaborated types.
- The other 66 declarations the previous review opened are at the same pins and unchanged.

**Cross-roadmap citations resolved (14).**
- SchemeAndStackFoundations at this head (unchanged since `a96d197`):
  - §0.9 `finite_presentation_limits` (902, 913);
  - §0.14 *henselian_finiteEtale_equivalence* (1205, 1217);
  - §0.17 `depth_eq_iff_ext` (1275, 1285);
  - §2.7 `localCohomology_module_comparison` and `depth_localCohomology_vanishing` (3668, 3685, 3698);
  - §4.7 (5532);
  - §4.8 `CoherentFormalModule` (5576, 5586).
- The same sections on main at `3f7196b`: 848/859, 1068/1080, 3482/3499/3512, 5339 and 5383/5393.
- Consumers, all resolving to names this head declares or states:
  - PurityOfBranchLocus at this head (12, 33, 56–58);
  - AbhyankarLemma on main (28, 55, 265–268);
  - PurityForFlatCohomology at its open head (98–100, 564–567, 1195–1196, 1233).
- No id of this folder is dropped: the folder is unchanged, and the overlap scan lists no dropped id.

**Ownership and duplication.**
- `roadmaps grep --lean-only` for the four headline names finds them only in LocalPurity's own `Suggested.lean` copies: main, #1807, #1808 and #1854.
- #1807's `Suggested.lean` equals main's.
- The 05ER/0EII/0EKP search is under R01.

**Sources, re-located in the cache for the seeded sample.** None of these passages changed. Each was re-located at its line and agrees with the README:
- stacks-0BMA: 0BLF line 2245, 0BLH 2266, 0BLI 2283, 0BM6 2342, 0BLJ 2351, 0BM9 2391, 0BLL 2421, 0BLS 2449, 0BLM 2459 (p. 52), 0BMA 2503 (p. 53), 0EY7 2604 (p. 56), 0EL8 2028.
- stacks-0EKS: 0EII line 1923, 0EKP 2094 (conditions (1)–(4) with (1) ⇒ (4) at 2106), 0EKS 2193.
- stacks-0BQ5: 0BQ5 line 2571 and 0EY3 2627.
- stacks-09ZL: 09ZL line 1758.
- sga2: Exposé X, Proposition 3.3 line 3386 and Théorème 3.4 (i) line 3390.
- sga1: Exposé X, 3.1 line 8359, 3.2 line 8370 and 3.3 line 8394 (pp. 212–213).
- The README flags no locator as unverified.

**Remark on untouched text** (no change requested here): PurityForFlatCohomology cites `purityHolds_of_isRegularLocalRing` without the `IsLocalRing.` prefix (its README 99 and 567). That is a matter for its own review.

**Adversarial pass.** No statement changed, so every row is carried from the review of `a96d197` (r42), with the values computed there. The Lean row was rerun for this review.

| Statement | Instances | Values computed | Result | From |
|---|---|---|---|---|
| 0BMA (1) `IsLocalRing.purityHolds_of_isRegularLocalRing` | `d=2` `k⟦x,y⟧`; `d=1` `ℤ_(p)`, `V = Spec ℚ(√p)`; `d=0` a field | `d=2`: Tau Ceti base case plus 0BM9, so every cover extends. `d=1`: normalization `ℤ_(p)[√p]`, disc `4p`, not a unit, so `V` does not extend. `d=0`: `U=∅`, excluded by `hd` | true; `hd` needed | r42 |
| 0BMA (2) `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` | `B=0`; `A×κ`; `A[z]/(z²−x)`; `A[z]/(z²−u)`; `d=1` | `B=0`: étale. `A×κ`: `x·(0,1)=0`, so not torsion free and excluded. `z²−x`: disc `4x`, nonunit at the height-one prime `(x)`, so `hpunct` fails. `z²−u`: disc `4u`, a unit. `d=1`: disc `4p`, not étale | true; torsion freeness and `hd` needed | r42 |
| §2.1 reduction for `d=2` | Lean probe | `TauCeti.Algebra.etale_of_finiteNormal_of_ringKrullDim_eq_two` with `IsEtaleAt.isUnramifiedAt` elaborates | correct | r42 |
| 0BM9 essential surjectivity, *finiteNormalEquiv* | `V=U⊔U`, `V=∅`, `A×κ`, `d=1` | `Γ(U⊔U)=A×A`. `V=∅` gives `0`. `A×κ` restricts to `U`, but `Γ(U)=A ≠ A×κ`. `d=1`: `Γ=ℚ(√p)`, not finite | true as corrected | r42 |
| Convention 5, "removes exactly the closed-point factors" | `B=∏B_i` with kernel `𝔭` | `0 ≠ 𝔭 ≠ 𝔪` would make `A_𝔭 → (B_i)_𝔮` flat and non-injective, which is impossible. So each kernel is `0` or `𝔪` | true | r42 |
| 0BLH | `k[x,y]_{(x,y)}`, `V=U`; `Y′=∅` | `Y=X`; `Y′=∅` forces `Y=∅` | matches tag | r42; route R01 |
| 0BLL | `k[x,y]_{(x,y)}`; `k[x²,xy,y²]` with the `μ₂`-cover | Both sides hold; both sides fail, with fibre dimension `3 ≠ 2` | consistent | r42 |
| 0BLI, 0BM6, 0BLJ | `k⟦x,y,z⟧`, `f=z`; `k⟦x,y⟧`, `f=x` | Depth 3: `H¹=H²=0` and the pair is henselian. Depth 2: `xⁿ·x^{−n−1}y^{−1} ≠ 0` in `H²_𝔪` | match tags | r42; R05 |
| 0EKS, 0EL8 | `k⟦x,y,z⟧`, `𝔞=𝔪`, `f=z` | Complete, `H¹=H²=0`: fully faithful on finite locally free modules | match tags | r42; route R01 |
| 0BLS, 0BLM | `k⟦x,y,z⟧`, `f=z` | `V_0` extends by 0BMA (1) for `k⟦x,y⟧`, so `V` extends | consistent | r42; R04.3 |
| *spread_from_localScheme* | `S=Spec ℤ`, `U=Spec ℤ[1/p]`, `s=(p)` | `V=Spec ℚ`; `U` and `Spec ℤ_(p)` glue to `S`; `U` is retrocompact | true | r42; R04.1–2 |
| 0EY7 `finiteEtale_extend_of_purity` | `Spec ℤ_(p)`, `U={η}`; `𝔸²∖0`; `U=X`; `U=∅` | Purity fails at the closed point and `ℚ(√p)` does not extend. Origin: covers extend. `U=X`: vacuous, an equivalence. `U=∅`: only `∅` | true | r42 |
| *restrictOpen_fullyFaithful_of_depth* | `𝔸²∖0`; `Spec k[x,y]/(xy)` minus the origin | Depth 2: `Γ(U)=k[x,y]`. Depth 1: `Γ(U)=k[x^±]×k[y^±]`, 4 idempotents against 2 | true; depth needed | r42 |
| `finiteEtale_extend_of_regular_codimTwo` | `𝔸²∖0`; `𝔾_m ⊂ 𝔸¹` with `t↦t²`; `⊔_ℕ 𝔸²` minus the origins | True. Dimension 1: hypothesis fails, and the Kummer cover is ramified at 0. The non-quasi-compact case is affine-local, then glued | true; SGA 2 X 3.3 | r42; R04.1 |
| Checks of §§1.2, 2.1, 2.2 | as written | `dim_k k[x,y]/(x²,xy,y²) = 3 ≠ 2`; `det[[2,0],[0,2p]] = 4p`; `Γ(U⊔U)=A×A` | correct | r42 |
| The four Lean signatures against the README | `#check @`; one-tactic probe | Types equal `signatures.md`. Probe fails at lines 36, 52, 61 and 74 | match; no padding | this review |

## Not verifiable

- The Stacks tag pages for 05ER (Proposition 15.91.16) and 05EU (Remark 15.91.20) are not in the sources cache. The previous review read them on the open Stacks site; this review did not reopen them. They only bear on R01's repair.
- Ownership against open pull requests was checked through the roadmap index (460 heads) and the sibling checkouts this job provides.

## Source issues

- **Error** in stacks-0BMA at Lemma 58.20.3 (0BM9), p. 51: the source says sections give an equivalence onto all finite normal `A`-algebras étale over `U`; it should require `B` torsion free over `A`, since `A × A/𝔪` is not in the essential image; affects a stated result.
- **Error** in stacks-0BMA at Lemma 58.21.3 (0BMA), part (2), p. 53: the source says every finite normal `B` étale over the punctured spectrum is étale; `A × A/𝔪` is a counterexample, so it should require `B` torsion free over `A`; affects a stated result and the proof's going-down step.
- **Misprint** in stacks-0BQ5 at Lemma 32.20.4 (0EY3), p. 54: the source takes `U ⊂ U′ ⊂ X` for the open containing `s`; it should be `U ⊂ U′ ⊂ S`, since `X` names the scheme over `U′`; affects nothing.
