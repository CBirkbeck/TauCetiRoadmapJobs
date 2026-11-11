# Review of AdicSpacesPartIII (pull request #1807 at 096aff5)

**Verdict:** needs changes

The pull request changes this folder in one place. R3.6 *proper-cohomology-adic-completion* now proves Kiehl's Theorems 3.4 and 3.7 itself, and *affinoid-completed-field-extension* now cites RigidAnalyticGeometry §1.3. The new R3.6 route is mathematically sound and its Kiehl-E locators check out against the text (see Verified sound). The folder still fails the push gate (`imports`, `build`). Large parts of F0.1, F0.2 and R3.8, in both `Suggested.lean` and the README, restate declarations that the pinned Tau Ceti already proves. The findings below are mostly about those whole-folder problems.

## R01 (P2) — `Suggested.lean` imports another roadmap's module and states its targets on carriers that are not at the pins

Location: `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` line 13, "`import TauCetiRoadmap.AdicSpacesPartII.Suggested`". It is used at lines 130, 137, 159, 179, 191–196, 224, 255–266, 333, 446, 461 and 606. README Convention 12 (line 173) says "The class `TauCetiRoadmap.AdicSpacesPartII.IsAdicRing` … are imported from AdicSpacesPartII R0.1a–R0.1b in its `Suggested.lean`".

Claim: 20 declarations are stated against `TauCetiRoadmap.AdicSpacesPartII.IsAdicRing`, `…Huber.IsAdicHom` and `…Huber.IsNoetherianType`. These are roadmap definitions, not pinned carriers, and the gate's `imports` rule fails on this line.

Witness: the pin has the same three classes with the same fields. They are `TauCeti.IsAdicRing` (`TauCeti/RingTheory/AdicRing/Basic.lean:37`, with `ideal`:46 and `ideal_spec`:51), `TauCeti.Huber.IsAdicHom` (`TauCeti/RingTheory/Huber/AdicHom/Basic.lean:39`) and `TauCeti.Huber.IsNoetherianType` (`TauCeti/RingTheory/Huber/NoetherianType/Basic.lean:38`).

Repair:
- Delete line 13.
- Import `TauCeti.RingTheory.AdicRing.Basic`, `TauCeti.RingTheory.Huber.AdicHom.Basic` and `TauCeti.RingTheory.Huber.NoetherianType.Basic`.
- Replace the three Part II names by the pinned ones throughout.
- Rewrite Convention 12 and the first row of the F0 supplier table (README line 218) to cite those Tau Ceti files.
- Re-run the gate. `imports` must pass, and `lake env lean` on the file must then elaborate without the Part II olean.

## R02 (P2) — F0.1 restates adic-ring constructions that the pinned Tau Ceti proves

Location: `Suggested.lean` lines 118–266: `IsAdicRing.isNoetherianRing_restrictedMvPowerSeriesCompletion`, `AdicRing.CompletedAway` with `isAdicRing`, `isNoetherianRing_flat` and `existsUnique_lift`, `AdicRing.CompletedTensorProduct` with `tensorIdeal`, `inl`, `inr`, `isAdicRing`, `existsUnique_lift` and `isNoetherianRing`, and `IsAdicRing.finite_limit`. Also the README targets *completed-localization* (line 730), *completed-tensor-product-adic* (line 890), *finite-module-inverse-limit* (line 969) and the noetherian clause of *restricted-power-series-adic*.

Claim: these are planned as new `sorry` targets.

Witness: all of them are proved at the pin.
- `TauCeti.AdicRing.CompletedAway` is in `TauCeti/RingTheory/AdicRing/CompletedAway.lean`: definition at line 109, `isAdicRing`:157, `existsUnique_lift`:296, `isNoetherianRing`:306, `flat`:311.
- `TauCeti.AdicRing.CompletedTensorProduct` is in `…/CompletedTensorProduct.lean`: `tensorIdeal`:87, definition at line 93, `isAdicRing`:154, `inl`/`inr`:176/180, `existsUnique_lift`:352.
- `CompletedTensorProduct.isNoetherianRing` is at `…/CompletedTensorProduct/Noetherian.lean:93`.
- `TauCeti.Huber.isNoetherianRing_restrictedMvPowerSeriesCompletion_of_isAdic` is at `TauCeti/RingTheory/Huber/Restricted/Adic.lean:96`.
- `TauCeti.ModuleTower.IsAdicSystem.finite_lim` and `ker_limπ` are at `TauCeti/Algebra/Category/ModuleCat/Tower/AdicSystem.lean:195` and `:187`. They do not need noetherianity.

Repair:
- Delete these 15 declarations from `Suggested.lean`.
- Cite the pinned names in `### From Mathlib and Tau Ceti`.
- Reduce the four README targets to whatever the pin lacks; for example, check `CompletedAway.restrict`, `quotientPowEquiv` and `idealEquiv`, which are already at the pin.
- AdicSpacesPartIV README line 433 cites `TauCetiRoadmap.AdicSpacesPartIII.AdicRing.CompletedTensorProduct`. Add a sentence mapping that name to `TauCeti.AdicRing.CompletedTensorProduct`.

## R03 (P2) — F0.2 *formal-spectrum* plans pinned `TauCeti.FormalScheme.Spf` declarations under the same names

Location: README lines 1061–1110 and 1237–1260. Quoted: "`FormalScheme.Spf.homeomorphSpecQuotient` … `FormalScheme.Spf.globalSectionsIso` … `FormalScheme.Spf.basicOpenSectionsIso` (`Γ(D(f), O) ≅ AdicRing.CompletedAway A f`…)", and "`Spf.quotientSheaf` … `quotientDiagram` … `Spf.completedNeighbourhoodDiagram`".

Claim: these are specified as this roadmap's own definitions and theorems.

Witness: the pin declares `TauCeti.FormalScheme.Spf.{carrier, homeomorphSpecQuotient, basicOpen, isBasis_basicOpen, quotientSheaf, quotientDiagram, structureSheaf, quotientProjection, globalSectionsIso, basicOpenSectionsIso, structureSheafIso, completedNeighbourhoodDiagram, stalkResidueIso}`. They are in `TauCeti/AlgebraicGeometry/FormalScheme/Spf/{Carrier,StructureSheaf,IdealIndependence,CompletedNeighbourhood}.lean`.

Repair:
- Cite these declarations in the supplier contracts.
- Delete them from *formal-spectrum* and *spf-ideal-independence*.
- Keep only what the pin lacks: the locally ringed space packaging, `restrictBasicOpenIso`, the section topology and *spf-morphism-correspondence*.

## R04 (P2) — R3.8 restates the pinned projective trace, and the README says the pin lacks it

Location:
- `Suggested.lean` lines 857–896: `LinearMap.projectiveTrace`, `projectiveTrace_eq_trace`, `projectiveTrace_baseChange`, `projectiveTrace_cyclic` and `projectiveTrace_nonfree`.
- README line 160, Convention 11: "The local `projectiveTrace` spellings in R3 are compatibility material for the pinned library, whose standard traces require a finite basis".

Claim: the trace of a non-free finite projective module is treated as missing from the pins.

Witness: `TauCeti/LinearAlgebra/Trace/Projective.lean` proves all of it.
- `LinearMap.projectiveTrace` is at line 72, with the identical body.
- `projectiveTrace_cyclic`:96, `projectiveTrace_eq_trace`:118 and `projectiveTrace_baseChange`:158 are there too.
- `projectiveTrace_nonfree` is at `TauCeti/Examples/LinearAlgebra/Trace/Projective.lean:45`.
- My probe closed `_eq_trace`, `_baseChange` and `_cyclic` each with one `exact` of the pinned lemma.

Repair:
- Delete these five declarations.
- Import `TauCeti.LinearAlgebra.Trace.Projective` and define `Algebra.projectiveTrace` through `_root_.LinearMap.projectiveTrace`.
- Rewrite Convention 11 and *projective-module-trace* / *projective-trace-cyclicity* as citations of the pin.
- AdicSpacesPartIV, PerfectoidSpaces and EtaleCohomologyFoundations cite `LinearMap.projectiveTrace` as Part III's. Add a one-line mapping so they repoint.

## R05 (P2) — `formalFunctions`, `grothendieckExistence` and `grothendieckExistence_hom` restate SchemeAndStackFoundations' theorems

Location:
- `Suggested.lean` lines 280–364.
- README lines 46–48: "The theorem on formal functions … and Grothendieck's existence theorem for proper schemes … are SchemeAndStackFoundations' (§4.9, §4.10); F0 states them as adapters".

Claim: Part III's acceptance test states, as its own headlines, two theorems that a roadmap on main owns and already states.

Witness: SchemeAndStackFoundations `Suggested.lean` on main states `grothendieck_existence` (line 860) and `grothendieck_existence_fullyFaithful` (line 879), on X-modules over the thickenings `V(I^{n+1})`. Its §4.9 (README line 5734) owns `Scheme.Modules.Cohomology.formalFunctionsIso`.

Repair:
- Delete the three theorems from `Suggested.lean`.
- Keep `IsPowQuotient` only if the comparison *pow-quotient-formal-module-comparison* itself is stated as a Part III theorem.
- In the README, keep these targets as citations of SchemeAndStackFoundations §4.9–§4.10, not as Part III targets.

## R06 (P3) — The Summary still says R3 cites Kiehl's theorems, which this roadmap now proves

Location: README lines 17–18: "it cites Kiehl's theorems on quasi-Stein spaces, his proper mapping theorem and proper GAGA."

Claim: the Summary says another roadmap supplies these.

Witness:
- Scope lines 95–97 say "Part III R3.4, R3.6 and R3.7 own Kiehl's Theorems A and B …".
- R3.6 (line 10728) says "prove `kiehlProperMapping`".
- RigidAnalyticGeometry at this head maps §§7.3–7.5 and 8.4 to these R3 targets (its README lines 71–75).

Repair: replace the clause with "and it proves Kiehl's Theorems A and B on quasi-Stein spaces (R3.4), his proper mapping theorem and formal functions (R3.6) and proper GAGA (R3.7)".

## R07 (P3) — The new R3.6 Checks end with a duplicated orphan line

Location: README lines 11088–11089: "…for `X = Spa A`, `F = O`, it is `Â ≅ lim A/𝔞ᵏ`." followed by "for `X = Spa A`, `F = O`, it is `Â ≅ lim A/𝔞ᵏ`."

Claim: the edit to *proper-cohomology-adic-completion* left the old last line in place.

Witness: the diff against main keeps context line 11089 after the new text, which already ends with the same Check.

Repair: delete line 11089. While editing, write these Checks as a `**Checks.**` bullet list.

## R08 (P3) — *affinoid-completed-field-extension* sends pinned carriers to Part II targets

Location: README lines 11124–11128: "§1.3 states it for `Huber.CompletedTensor K A K'` and `Huber.BanachModule.CompletedTensor`, the carriers of Part II's *completed-tensor-product* and *completed-tensor-banach-module* … *Needs:* … Part II *completed-tensor-product*, *completed-tensor-banach-module*."

Claim: these carriers are presented as Part II targets.

Witness:
- RigidAnalyticGeometry §1.3 (lines 798 and 817) cites them as pinned Tau Ceti declarations.
- They are `TauCeti.Huber.CompletedTensor` (`TauCeti/RingTheory/Huber/TensorProduct/Completion.lean:73`) and `TauCeti.Huber.BanachModule.CompletedTensor` (`…/Huber/BanachModule/CompletedTensor.lean:201`).

Repair: write the full `TauCeti.` names, cite the pinned files, and drop the two Part II items from *Needs:*.

## R09 (P3) — The gate's `build` check fails on a linter warning from a padding declaration

Location: `Suggested.lean` line 893, `projectiveTrace_nonfree` with "`[Module.Projective (ℚ × ℚ) (Ideal.span {((1 : ℚ), (0 : ℚ))})]`".

Claim: the module elaborates, but it emits a non-`sorry` warning (`linter.concreteInstances`), so the gate's build rule fails.

Witness: the gate record reports "Suggested.lean:893:8: The instance assumption … does not contain free variables".

Repair: delete the declaration (R04 and R10). The README Check stays; the pin proves it in `TauCeti/Examples/LinearAlgebra/Trace/Projective.lean:45`.

## R10 (P3) — Padding in `Suggested.lean`

Location:
- `firstOrderIdeal_not_fg` (line 277)
- `Huber.formalModelFibre_torsion` (line 511)
- `ValuationSpectrum.mem_fracPowLE_iff` (line 556)
- `GelfandSpectrum.test_padic`, `test_zero_ring` and `test_dualNumbers` (lines 823, 827, 831)
- the proved `example` (line 840)
- `LinearMap.projectiveTrace_nonfree` (line 893)

Claim: these mirror README Checks or restate a definition. Their own docstrings say "The boundary Check …", "The flatness boundary Check …", "The dual-number Check …" and "The nonfree Check …".

Witness: `test_zero_ring` closes with one tactic: `exact ⟨fun α ↦ by simpa [Subsingleton.elim (1 : A) 0] using α.1.map_one'⟩`. `mem_fracPowLE_iff` restates `fracPowLE` for another representative of `q`.

Repair:
- Delete these from `Suggested.lean` and update the R3.9 and R3.8 rows of the table under "How to read the build".
- DiamondsAndVStacks cites `GelfandSpectrum.test_padic` and `test_zero_ring` by name, so give the README Check labels there.

## R11 (P3) — The module docstring is not in the required form and does not say which headlines are not statable

Location: `Suggested.lean` lines 16–105: "# Foundations of adic spaces, Part III: representative target signatures. These signatures are suggested forms, not an exhaustive checklist." Lines 59–100 carry README specification text: Hasse invariants, dévissage interfaces, the `2`-gon over `ℚ₃`.

Claim: the docstring lists README-only topics but does not name each unstatable headline and the carrier it lacks.

Witness: Raynaud's theorem, flattening, Kiehl's Theorems A/B, the proper mapping theorem, formal GAGA and proper GAGA are README headlines. None is paired with its missing carrier (formal schemes, coherent sheaves on `TauCeti.AdicSpace`, rigid analytification).

Repair:
- Title it "Foundations of adic spaces, Part III: target signatures" and say that README.md is the roadmap.
- List each unstatable headline with the carrier it lacks at the pins.
- Move lines 59–100 to the README.

## R12 (P3) — The trace contracts wait on a Mathlib pull request and use process wording

Location: README lines 337–345: "Follow the design of [Mathlib #44636] (head `655ffd91…`) … Build the required material in Tau Ceti against that design … compatibility with the current pin; replace them by standard imports when the generalized API is available." Also lines 161, 11925, 11952 and 12000.

Claim: the section ties the roadmap to an unmerged Mathlib pull request and its commit hash, says to wait for it, and gives instructions for work in Tau Ceti.

Witness: the README rules say to defer to Mathlib but never wait for it, to use no process words ("current"), and that the pinned `TauCeti.LinearAlgebra.Trace.Projective` already supplies the API (R04).

Repair: replace the section with a contract citing the pinned Tau Ceti trace, and remove the Mathlib pull-request numbers and the hash.

## R13 (P3) — The ModularCurves supplier row cites declarations that do not exist

Location: README line 235: "`TauCetiRoadmap.ModularCurves.EllipticCurve`, `EllipticCurve.toOver`, `EllipticCurve.ofWeierstrass` | `TauCetiRoadmap/ModularCurves/Suggested.lean`".

Claim: an imported elliptic-curve carrier is cited at a file that does not declare it.

Witness: ModularCurves `Suggested.lean` on main declares none of the three names. It builds on the pinned `TauCeti.AlgebraicGeometry.EllipticCurveGeom` (`TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom/Basic.lean:577`; ModularCurves `Suggested.lean` line 182).

Repair: cite `TauCeti.AlgebraicGeometry.EllipticCurveGeom` and its group law `grpObj` at the pin, and rewrite `EllipticModuli.ofElliptic` on it.

## R14 (P3) — `kiehl-proper-mapping-theorem` cites Kiehl's finiteness lemma, not the coherence theorem

Location: README line 10733: "(Kiehl-E §2, Satz 2.6, pp. 204–205; …)".

Claim: the citation is attached to the statement that `Rⁱf_*F` is coherent for proper `f : X → Y`.

Witness: Kiehl-E Satz 2.6 (p. 205, line 626) is finiteness of `Hⁱ` over an affinoid base. Coherence is Theorem 3.3 (p. 206, line 643), deduced on p. 209 (line 745) from Satz 2.6 and Satz 3.5.

Repair: change the locator to "Kiehl-E §3, Theorem 3.3, p. 206; proof p. 209 from Satz 2.6 and Satz 3.5". Satz 2.6 stays on *proper-affinoid-cohomology-finite*.

## R15 (P3) — `IsSmoothGeomIrredAffine` has no defining target, and its Checks cannot tell the fibrewise reading from the total-space reading

Location: README lines 6323–6330: "The predicate itself is defined for any ring map `A → B` … geometric irreducibility and dimension on the first reduction."

Claim: the predicate is used in a hypothesis (line 6554) but never stated with exact clauses or a locator. All three Checks take `A = k` and `ϖ = 0`.

Witness: take `k[s] → k[s,t]`, `ϖ = 0`, `n = 1`. Every fibre is `A¹` (fibrewise reading: holds), but the total space has dimension 2 (total-space reading: fails). Also, `k[u] → k[u,u⁻¹]` has an empty fibre.

Repair:
- State the definition as a target. For every `m ≥ 1`, `A/ϖᵐ → B/ϖᵐ` is smooth. For every prime `p ⊇ ϖA`, `B ⊗ κ(p)` is nonempty, geometrically irreducible and of dimension `n` (BL II §1, Thm 1.5(b)).
- Add the two examples above as Checks.

## R16 (P3) — The README backticks Lean names that `Suggested.lean` does not declare, and names Checks as Lean declarations

Location: Convention 13 (lines 184–191). Examples: `FormalScheme.Hom.IsProper` (line 2301), `smoothGeomIrred_test_identity` (line 6328), `idealOfCoefficients_test_polynomial_core` (line 6381), `AdicSpace.Coh.test_point` (line 9951).

Claim: the house rule is that a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it, and that a Check never names a Lean counterpart.

Witness: `roadmaps resolve` lists 778 unresolved names for this README. None of the four examples is in `Suggested.lean`.

Repair:
- Write README-only API facts as prose without this roadmap's backticked names.
- Turn Check labels into prose bullets.
- Rewrite Convention 13 to match.

## R17 (P3) — The README says "compact Hausdorff" for `compactSpace_nonempty`, which states only compactness

Location: README line 12531: "prove that `M(A)` is compact Hausdorff and that `M(A) ≠ ∅` when `A ≠ 0` (together `GelfandSpectrum.compactSpace_nonempty`)".

Claim: the README credits Hausdorffness to the Lean statement.

Witness: the elaborated type is `CompactSpace (Huber.GelfandSpectrum A) ∧ (Nontrivial A → Nonempty (Huber.GelfandSpectrum A))`, with no `T2Space`.

Repair: either add `T2Space (GelfandSpectrum A)` to the conclusion (it holds, since the topology is induced from `A → ℝ` by an injective map), or drop "Hausdorff" from the sentence that names the declaration.

## R18 (P3) — The completion clause of *proper-formal-morphism* is narrower than EGA III₁ 3.4.1

Location: README lines 2298–2301: "a closed subset `Y′ ⊆ Y` and `X′ = g⁻¹(Y′)`, the completion `ĝ : X̂_{/X′} → Ŷ_{/Y′}` is proper (EGA III₁ Ch. III, 3.4.1, p. 119)".

Claim: the README requires `X′` to be the full preimage.

Witness: EGA III₁ 3.4.1 (p. 119, line 4461) allows any closed `Y′` of the source with `g(Y′) ⊆ Z′`.

Repair: state it for a closed `X′ ⊆ X` with `g(X′) ⊆ Y′`. The preimage case becomes a Check.

## Verified sound

**Gate and dependencies.**
- I re-ran the dependency check. Output: `depcheck: 236 roadmaps, 2147 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- The gate failures are `imports` (R01) and `build` (R09). All other counters are 0.
- No file outside the folder's own pull-request scope is changed for this folder.

**Elaborated signatures.** I elaborated a scratch file with `#check @name` for 50 declarations, plus probes. Results:
- The probes closed `projectiveTrace_eq_trace`, `_baseChange` and `_cyclic` against the pinned Tau Ceti lemmas in one term, and `test_zero_ring` in one tactic.
- Every binder needed by the README statements is present.
- No `def` lost a section variable: `CompletedTensorProduct` carries its `[IsAdicHom]` binders explicitly, and `projective_sections` carries the `IsScalarTower R Rᵢ Mᵢ` binders.

**Seeded sample**, against the text at each locator:
1. *spf-morphism-correspondence*: verified.
   - EGA I 10.4.6 is on p. 186 (line 7458).
   - 10.2.2 is on p. 182, and the remark after it is on p. 183 (line 7342).
   - 0 3.8.1 is on p. 35 (line 1205).
   - Stacks 0AHY equation (2.0.1) is stated for locally topologically ringed spaces. The README states it for locally ringed spaces and adds its own automatic-continuity argument, which is correct for a finitely generated ideal.
2. *locally-noetherian-formal-scheme*: verified. EGA I 10.4.2, 10.4.3 and 10.4.5 are on p. 185; 10.4.8 is on p. 186; 10.6.5 is in place.
3. *proper-formal-morphism*: verified (EGA III₁ 3.4.1, p. 119), apart from the narrowing in R18. 5.4.3 is the Remarque on non-algebraizable proper formal schemes (line 5960).
4. *formal-functions-affine*: verified. EGA III₁ 4.1.7 is on p. 125; 4.1.7.9 and the footnote crediting Serre are on p. 126; Stacks 02OB is Lemma 30.20.4. The index shift `n+1−c` is right.
5. *existence-devissage*: verified. Stacks 088A is Lemma 30.25.2 with the same two hypotheses. EGA III₁ 5.3.1 is on p. 154, and 5.3.2 is in place.
6. *generic-fibre-fibre-products*: partly verified. Conrad-MR Thm 3.1.5(a) is on p. 16 and Conrad-AWS Exercise 3.3.8 on p. 32. BL I and Huber96 are under Not verifiable.
7. *quasi-finite-formal-model*: partly verified. Conrad-MR's proof of A.1.2 cites [BL2, Cor. 5.3] on p. 38. BL II is under Not verifiable.
8. *Affine Checks for `IsSmoothGeomIrredAffine`*: the three Checks are true, but see R15.
9. *ideal-of-coefficients*: all five Checks recomputed (table below). The BL II locators are under Not verifiable.
10. *module-flattening-by-blow-up*: the degenerate cases were recomputed. BL II is under Not verifiable.
11. *formal-completion-and-algebraic-comparison*: the example was recomputed. Huber96 and Huber94 are under Not verifiable.
12. *coherent-sheaf-operations*: verified. Kiehl-AB Def. 2.1.2 is on p. 270. Kiehl-E p. 197 covers base change for a finite field extension and supports of `O/𝒥`. Conrad-RA Ex. 2.2.11 is on p. 13.
13. *finite-morphism-coherent-algebra-equivalence*: verified. Conrad-RA Cor. 2.2.8 is on p. 12, and its use in the proof of Thm 3.1.5 is on p. 21.
14. *quasi-stein-dense-restriction*: verified. Kiehl-AB Def. 2.3 is on p. 270; Satz 2.4 and Hilfssatz 2.5 are on p. 271; the norm-rescaling proof is on p. 272.
15. *gelfand-spectrum-banach-ring*: verified. KL15 Def. 2.3.2 and Thm 2.3.4 are on p. 34, Thm 2.3.10 on p. 35, and Rem. 2.3.11(b) on p. 36. Berkovich is under Not verifiable.

**The change in this pull request.**
- Kiehl-E Def. 3.1 and Thm 3.4 are on p. 206 (lines 632–660). The Rees-ring proof is on pp. 207–209. Satz 3.5 is on pp. 209–210. Thm 3.7 is on p. 210 (line 809), and Kiehl proves it only by "induction on the number of generators".
- RigidAnalyticGeometry §1.3 at this head (lines 794–844) states the faithfully flat extension that R3.6 now cites.
- All six Mathlib names in the new *Needs:* exist at the pin: `reesAlgebra` (ReesAlgebra.lean:40), `Ideal.Filtration.Stable` (Filtration.lean:174), `submodule_fg_iff_stable`:337, `Ideal.exists_pow_inf_eq_pow_smul`:389, `AdicCompletion.flat_of_isNoetherian` (AsTensorProduct.lean:378) and `ofTensorProductEquivOfFiniteNoetherian`:327.

**Other library and supplier checks.**
- Library declarations opened at the pins: about 40. They are cited in R01–R04, R08 and R13, plus `LinearMap.trace` (Mathlib Trace.lean:75, defined through a basis, 0 otherwise), `trace_comp_comm'` (:265), and `TauCeti.Huber.IsStronglyNoetherian` and `PairOfDefinition.locUniformSpace` (both used as cited).
- KL15 Def. 2.7.3 and Prop. 2.7.5 (pp. 56–57): `GlueingSquare` replaces condition (c) with the maximal-ideal contraction, which is exactly what the proof of 2.7.5 uses (KL15 line 2249). This is faithful.
- KL15 Def. 2.8.1(a)–(c) matches `isUniform_tfae`.

**Cross-roadmap citations resolved: 14.**
- SchemeAndStackFoundations §4.9 (README line 5734) and §4.10, `Suggested.lean` lines 842, 850, 860 and 879.
- DerivedModuleAlgebra §S.1 (lines 65 and 955).
- CompactOperators §0.1 (line 151).
- PadicFunctionalAnalysis §0.4 and §§2.1–2.4.
- RigidAnalyticGeometry §1.3 at this head.
- Part II `Suggested.lean`: `AdicSpace.Affinoid`:664, `Affinoid.spa`:717, `Chart`:765, `LocallyOfFiniteType`:885, `Smooth`:1311, `Etale`:1317, `TateAlgebra.ofMvPolynomial`:516, `isNoetherianRing_of_isAdicComplete`:205.
- ModularCurves: fails, see R13.

**Overlap.** `scratch/overlaps.md` lists no dropped or conflicting ids. A search of the open heads shows that DiamondsAndVStacks (#820), ClassicalAdicEtaleCohomology (#875) and PerfectoidSpaces cite Part III as the owner of `Huber.GelfandSpectrum`; none restates it. Ownership against #1187 (AdicSpacesPartII/IV), #875, #1808 and #1854 was not checked file-by-file, because their files were not provided.

**Adversarial table.** Each row gives the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| R3.6 Thm 3.4 (*proper-cohomology-adic-completion*) | `a=0`; `a=1`; `X=Spa A`, `i=0`; `A=K⟨T⟩`, `F=A⊕A/(T)`, `a=T` | `a=0`: `R₀=M`, `R_k=0` for `k≥1`, `Q_k=0`. `a=1`: `F/aᵏF=0`, so `R_k=M`. Tate case: `R_k=aᵏM`, `Q_k=0`. Last: `E=0⊕A/(T)` and `aᵏF∩E=(TᵏA⊕0)∩(0⊕A/(T))=0` for `k≥1` | holds | R07 only |
| R3.6 uniform shift | `Q_{k+s}→Q_k` vanishes for `k≥k₁` | With `e=s+k₁`, the map `Q_{k+e}→Q_k` factors through `Q_{k′+s}→Q_{k′}` with `k′=max(k,k₁)`; that middle map is 0 | holds | none |
| R3.6 Thm 3.7 induction | `𝔞=𝔟+aA`; `𝔞=0`; `𝔞=A` | Each term `𝔟ⁱa^{2k−i}` has `i≥k` or `2k−i≥k`, so `𝔞^{2k}⊆𝔟ᵏ+aᵏA⊆𝔞ᵏ`. `𝔞=0`: both sides are `M`. `𝔞=A`: both are 0 | holds | none |
| *kiehl-proper-mapping-theorem* | locator | Satz 2.6 is finiteness over `Sp A` (p. 205); coherence is Thm 3.3 (p. 206) | locator wrong | R14 |
| *formal-functions-affine* | `P¹_{k[t]}`, `O(−2)`, `p=1`; `A²∖0→Spec k[t]` | `H¹=k[t]`, `H¹(F_n)=k[t]/(tⁿ⁺¹)`, kernel `(tⁿ⁺¹)`, so `c=0`. Non-proper case: image `k[x][t]/(tⁿ⁺¹)` ≠ `k[x,x⁻¹][t]/(tⁿ⁺¹)` | holds | none |
| *spf-morphism-correspondence* | `Spf ℤ_p⟦T⟧→Spf ℤ_p⟦S⟧`; `Spec 𝔽_p`, `Spec ℚ_p → Spf ℤ_p` | `S↦g` is continuous iff `g∈(p,T)`. One map from `Spec 𝔽_p`. For `ℚ_p`, `φ(p)=p` is not nilpotent, so the set is empty | holds | none |
| *proper-formal-morphism* | `Spf ℤ_p⟨T⟩→Spf ℤ_p` | Reduction `A¹_{𝔽_p}→pt` is closed but not universally closed, so not proper | holds | R18 (scope) |
| *quasi-finite-formal-model* | `O_K⟨ζ,ξ⟩/(ζξ−ϖ)→O_K⟨ζ⟩` | Generic fibre is `|ϖ|≤|ζ|≤1`, an open immersion. Special fibre over `ζ=0` is `A¹_k`. After blowing up `(ζ,ϖ)`, the chart `ζη=ϖ` with `η=ξ` is an open immersion | holds | none |
| `IsSmoothGeomIrredAffine` | `k→k`, `k→k[T]`, `k→k×k`; `k[s]→k[s,t]` | The three given Checks hold. Fibrewise dimension is 1, total dimension is 2 | not discriminating | R15 |
| *ideal-of-coefficients* | `ϖ²+ϖξ+ϖ³ξ²`; `(aζ,ϖ)`; `(a²ζ,ϖ)`; `ℤ_p[ε]/(ε²)`; `Spf(A/ϖ)` | Content `(ϖ)`. `(a,ϖ)`, and `(ϖ)` after `a↦0`. `(a²,ϖ)` is minimal while `(a,ϖ)` satisfies (i) but is not minimal. Coordinates of `ε` are `(0,1)`, so `𝒞=A`. `𝒥=0` is open but `𝒞=0` is not | holds | none |
| *module-flattening-by-blow-up* | `X=T=Spf O_K`, `ℳ=O_K/ϖ` | `M_K=0`; strict transform 0 (flat); pull-back not flat | holds | none |
| *formal-completion-and-algebraic-comparison* | `A¹_{O_K}→Spec O_K` | `φ`: closed disc ↪ adic line, injective (separated), not surjective (not universally closed) | holds | none |
| *coherent-sheaf-operations* | `i: Spa K→` disc at 0, applied to `T: O→O` | `i*T=0: K→K`; `coker T=(K⟨T⟩/(T))~`, stalk `K` at 0 | holds | none |
| *finite-morphism-coherent-algebra-equivalence* | `O[S]/(S²−T)`; `𝒜=0` | Double cover `S↦S²`; `∅→X` | holds | none |
| *quasi-stein-space* | `P¹_K` | `H¹(O(−2))=K≠0`, so not quasi-Stein | holds | none |
| `denseBanach_inverseSystem_exact` | `V_n=0`; constant `V`, identity transitions | Trivial case. Otherwise set `x₀=0`, `x_{n+1}=x_n−y_n` | holds | none |
| `GelfandSpectrum`, `compactSpace_nonempty` | bounds; `A=0` | `α(x)ⁿ≤C‖x‖ⁿ` gives `α≤‖·‖`, so the spectrum is closed in `∏[0,‖x‖]` and compact. For `A=0`, `α(1)=1≠0=α(0)`, so it is empty | holds | R17 |
| `smoothingFun_eq_sSup` | `ℚ_p`; `TrivSqZeroExt K K`, `ε=inr 1`; `A=0` | `α≤|·|` and `α(x⁻¹)≤|x⁻¹|` give `α=|·|_p`. `‖ε‖=1`, `ε²=0`, smoothing value 0, `sSup=0`. `sSup ∅=0` in ℝ | holds | R10 (tests) |
| `isUniform_tfae` | (3)⇒(2); (1)⇒(3) | `‖x^{2^k}‖^{2^{−k}}≥c^{1−2^{−k}}‖x‖→c‖x‖`. `‖x²‖≥ν(x)²/C≥(c²/C)‖x‖²` | holds | none |
| `laurent_exact_of_finite` | the pieces `{f,1}/1`, `{1}/f`, `{f²,1}/f` | `R₁₂` cuts out `|f|²≤|f|` and `|f|≥1`, i.e. `|f|=1`. `ρ₁,ρ₂` are unique because `A[1/s]` is dense and the target is homeomorphic to a completion (Hausdorff), so the statement is not vacuous | holds | R01 (carrier) |
| `GlueingSquare`, `projective_sections` | KL15 2.7.3(c) | The replacement condition equals the consequence used in KL15 line 2249 | faithful | none |
| `ringKrullDim_genericFibre_le/_eq` | `O⟨T⟩/(ϖT)`; `O⟨T⟩`; `A=0` | `0≤1`; `1=1`; `⊥=⊥`. If `𝔪A=A` then `ϖ` is a unit, which forces `A=0` | holds | R10 (control) |
| `isAdmissibleAlgebra_iff_flat` | rank one | `a | ϖⁿ`, so ϖ-torsion-free implies torsion-free, which is flat over a valuation ring | holds | none |
| `fracPow_inter_spa` | `q=0`; unit `g` | `{|f|≤1}=R({f,1}/1)`; `v(gᵃ)≠0` | holds | none |
| `etale_iff_projectiveTraceForm_bijective` | `𝔽₂×𝔽₂`; `𝔽₂[x]/(x²)` | Gram matrix `I₂`, perfect, étale. Form is 0, not étale | holds | none |
| `exists_unique_frobeniusLift_of_etale` | `R=0`; uniqueness | Trivial. Any lift ≡ Frobenius mod `p`, unique by formal étaleness | holds | none |
| `projectiveTrace_nonfree` | `ℚ×0⊂ℚ×ℚ` | Projective trace `(1,0)`; Mathlib trace 0 (no basis) | holds; already proved at the pin | R04, R09 |
| `CompletedTensorProduct.isNoetherianRing` | `B=A⟨T⟩/J` | `B⊗̂C=C⟨T⟩/JC⟨T⟩` is noetherian (EGA I 10.13.5(ii), p. 209) | holds; already proved at the pin | R02 |
| `grothendieckExistence` | `Qₙ` | `IsPowQuotient` of `tₙ` gives that `I^{n+1}` kills `Qₙ` | holds; restates SchemeAndStackFoundations | R05 |
| *affinoid-completed-field-extension* | `K′=K`; `A=K` | Identity map; `K→K′` is faithfully flat | holds | R08 |

## Not verifiable

- **BL I** (Math. Ann. 295) and **BL II** (Math. Ann. 296). These cover Cor. 4.6 p. 310; Cor. 5.3 p. 426; Def. 2.1, Rem. 2.2 and Prop. 2.3 pp. 407–408; Thm 4.1 p. 419; Thm 1.5 and Prop. 1.8 p. 406. The GDZ volume pages fetched are script-rendered with no text, and the GDZ article resolver for BL II (PPN002338238) returned "login or subscription required". The README’s claim (line 6357) that BL II Remark 2.2 omits a flatness hypothesis is therefore unchecked.
- **Huber96** (Vieweg book; §1.9 pp. 96–98) is not freely available.
- **Huber94** (Math. Z. 217, Rem. 4.6(iv) p. 544): the GDZ volume page is script-rendered, and no article PDF was found.
- **Berkovich** (AMS book; Thm 1.2.1 and 1.3.1) is not freely available. KL15 confirms the same statements, and its proof of Thm 2.3.10 cites Berkovich Cor. 1.3.2, not Thm 1.3.1.

## Source issues

- none
