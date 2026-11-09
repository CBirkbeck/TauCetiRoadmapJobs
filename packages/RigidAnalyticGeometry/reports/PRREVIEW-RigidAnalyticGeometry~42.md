# Review of RigidAnalyticGeometry (pull request #1807 at 64a16e1)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since `e473a36`. `git diff --stat e473a36..64a16e1` on `TauCetiRoadmap/RigidAnalyticGeometry/` is empty, so the folder is byte-identical to the one the previous review read, and to the one at `bdcbdaa` before it. The change since `e473a36` is in `ComplexKahlerGeometry` (README, `Suggested.lean`) and `TopologicalKTheory/README.md`, both among the pull request's own folders; neither cites this roadmap, and this roadmap cites neither. The pins have not moved (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). Main has moved to `8d9e0a0c`; the AdicSpacesPartIII witness of R01 is re-read there below and stands.

None of the six previous findings is repaired. Each is written again below with its witness re-checked at this head. Three block acceptance (R01–R03). The tested repairs of the previous report still apply unchanged, because the file they were tested against is unchanged.

## R01 (P2) — Kiehl's almost noetherianity has two owners: AdicSpacesPartIII R3.6 and this roadmap

**Location.**
- `README.md` line 29 (Tau Ceti row, Boundary column): "the Banach function algebra theorem and Kiehl's almost noetherianity of §§2.2–2.3 … are this roadmap's".
- `Suggested.lean` lines 20–21: "Kiehl's almost noetherianity of presentation rings of §2.3 and its noetherian corollary for discretely valued `K`", with the theorems `exists_fg_smul_le_of_presentation` (line 78) and `isNoetherian_of_presentation_of_discrete` (line 101).
- Against these, `README.md` line 446: "**Supplier contract: Part III R3.6, *almost-noetherian-integral-affinoid-modules*.**", and lines 452–454 give both backticked names.

**Claim.** This roadmap owns Kiehl-E Satz 5.1 and its discretely valued corollary as headline theorems.

**Witness.** AdicSpacesPartIII on main `8d9e0a0c`:
- lines 97–99: "R3.6 owns … integral-affinoid almost noetherianity";
- line 602: the table row *almost-noetherian-integral-affinoid-modules* | R3.6;
- lines 11149–11160: the theorem for `A₀` a quotient of `K°⟨X₁,…,Xₙ⟩`, which covers presentation images;
- its `Suggested.lean` line 45 names it a README-only target.

`roadmaps grep 'almost-noetherian-integral-affinoid-modules'` finds the id only in Part III on main and in this folder's line 446 (at #1807 and its #1808 copy). No open head moves the ownership.

**Repair** (unchanged from the previous report). Make AdicSpacesPartIII R3.6 the single owner:
- `Suggested.lean`: delete the two theorems and the import `TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic`, which nothing else uses; drop the Tate-algebra, Gauss-unit-ball and presentation-ring carriers from the docstring list (lines 12–15); replace lines 20–21 with "Kiehl's almost noetherianity of presentation rings and its noetherian corollary for discretely valued `K` are AdicSpacesPartIII R3.6's (*almost-noetherian-integral-affinoid-modules*); §2.3 consumes them."
- `README.md` line 29: delete "and Kiehl's almost noetherianity of §§2.2–2.3".
- `README.md` lines 446–454: remove the two backticked names, keep the statement as prose under the supplier contract, and replace "Identify its integral presentation … transport the following theorem" with a citation of Part III R3.6 (its lines 11165–11175 already identify the presentation ring with the image of the Gauss unit ball).

**Tested.** The previous report's scratch copy without these theorems and the Tate-algebra import elaborates with 3 `sorry` warnings and nothing else. The file is unchanged, so the test stands.

## R02 (P2) — Tate acyclicity and finite normalisation are statable at the pins but absent; the docstring says Tate acyclicity is not statable

**Location.**
- `Suggested.lean` lines 34–35: "Not statable at the pins … classical Tate acyclicity (Layer 5), which needs the structure presheaf on the pinned affinoid site with its sheaf condition".
- `README.md` line 246: "Deduce that affinoid domains are Japanese from §0.2."
- `README.md` line 518: "Prove classical Tate acyclicity".

**Claim.** No pinned carrier can state Tate acyclicity, and the docstring names every headline that cannot be stated.

**Witness.** At Tau Ceti `2fd255d9`, re-opened this round:
- `TauCeti.AffinoidSubdomain.weakGTopology` (`AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`);
- `TauCeti.AffinoidSubdomain.presheaf` (`AlgebraicGeometry/Rigid/Affinoid/Presheaf.lean:130`, `{K A}` implicit);
- `TauCeti.Ring.IsJapanese` (`RingTheory/Japanese.lean:48,125`).

**Repair** (unchanged). Add the imports `TauCeti.AlgebraicGeometry.Rigid.Affinoid.Site` and `TauCeti.RingTheory.Japanese` and the two theorems:

```lean
/-- Finiteness of normalisation (§§0.2, 1.2): affinoid domains are Japanese, in every
characteristic. -/
theorem isJapanese_of_isAffinoidAlgebra {A : Type*} [CommRing A] [IsDomain A] [Algebra K A]
    (hA : TauCeti.IsAffinoidAlgebra K A) : TauCeti.Ring.IsJapanese A := by
  sorry

open CategoryTheory in
/-- Tate's acyclicity theorem, sheaf form (Layer 5; BGR 8.2.1/1): the presheaf of affinoid
coordinate algebras is a sheaf for the weak affinoid G-topology. -/
theorem isSheaf_affinoidSubdomain_presheaf (A : Type*) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] :
    Presheaf.IsSheaf (TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).grothendieckTopology
      (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A)) := by
  sorry
```

Then in the docstring drop Layer 5 from the not-statable list, say that the higher Čech vanishing and the module form stay README targets, and add §§6.2–6.3 (the rigid category and the Kiehl-proper composition law) and §8.1 (analytification) with "no rigid-space carrier at the pin" as the reason. Name both theorems in §1.2 and Layer 5.

**Tested.** The previous report's scratch copy with `banachFunctionAlgebra` and these two theorems, the R01 deletions and the imports `Mathlib`, `Affinoid.PowerBounded`, `Rigid.Affinoid.Site` and `RingTheory.Japanese` elaborates with 3 `sorry` warnings, exit 0, and `#check @` keeps `[IsDomain A]` and `[Fact (TauCeti.IsAffinoidAlgebra K A)]`. The pins are unchanged, so the test stands.

## R03 (P2) — Layer 0–2 and §8.2 targets already proved at the Tau Ceti pin are written as work to do

**Location.**
- `README.md` lines 137–139: "Where a target of Layers 1–4 below is one of these theorems, the text cites it by its pinned name; the rest of those layers are targets."
- The unpinned targets are on lines 185–186, 209–214, 222–223, 242–246, 253, 331 and 866 (line 866: "Construct `Max A→Spa(A,A°)`, prove injectivity").

**Claim.** Every pinned theorem is cited by name, and what remains is still to be done.

**Witness.** Re-opened at the pin this round: `TauCeti.isWeaklyStable_of_completeSpace` (`Analysis/Normed/Field/WeaklyStable.lean:55`) proves §0.2's complete case; `TauCeti.ValuationSpectrum.maximalSpectrumToSpa_injective` (`AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:268`) proves §8.2's injectivity. `grep` finds neither `IsWeaklyStable` nor `maximalSpectrumToSpa` in the README.

**Repair** (unchanged). At each location write the pinned name in place of "Construct/Prove/Deduce", as lines 211–212 already do. Paths under `TauCeti/RingTheory/Affinoid/` unless stated; names in `TauCeti.IsAffinoidAlgebra` unless written in full.
- **§0.2 (lines 185–186):** `TauCeti.IsWeaklyStable`, `TauCeti.isWeaklyStable_of_perfectField`, `TauCeti.isWeaklyStable_of_completeSpace` (`WeaklyStable.lean:36,47,55`); keep as targets only the Gauss-fraction-field statements and the inseparable step.
- **§1.1 (lines 209–214, 222–223):** `residueNormedCommRing` (`QuotientNorm.lean:175`); `quotient` (`Basic.lean:66`); `of_finite` (`Integral/Basic.lean:117`); `isRestricted_subring`, `restrictedLift`, `existsUnique_algHom_isRestricted_subring` (`Restricted.lean:73,143,171`); `isOpenQuotientMap`, `quotientKerContinuousAlgEquiv` (`QuotientNorm.lean:65,73`); `toContinuousAlgEquiv`, `presentationContinuousAlgEquiv` (`QuotientNorm.lean:106,133`).
- **§1.2 (lines 242–246, 253):** `exists_ringKrullDim_eq_finite_injective` (`KrullDimension.lean:77`); `finite_quotient_of_isMaximal_radical` (`FiniteQuotient.lean:51`); `comap_isMaximal` (`MaximalSpectrum.lean:59`); `height_map_quotientMk_eq_ringKrullDim_quotient`, `exists_mem_minimalPrimes_height_eq_ringKrullDim_quotient` (`KrullDimension.lean:118,138`).
- **§1.5 (line 331):** `supSeminorm_eq_norm_of_normMulClass` (`SpectralRadius.lean:163`).
- **§8.2 (line 866):** `TauCeti.ValuationSpectrum.maximalSpectrumToSpa`, `maximalSpectrumToSpa_injective` (`MaximalIdealPoint.lean:237,268`).

Add `TauCeti/Analysis/Normed/Field/WeaklyStable.lean` and `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean` to the Tau Ceti row on line 29 and to "Existing library interfaces".

**Tested.** Every name above was located at the pin by the previous review at the file and line given; the two named in the witness were re-opened this round. The pin is unchanged.

## R04 (P3) — §1.5 describes the two directions of the polyradius criterion the wrong way round

**Location.** `README.md` lines 329–330: "Its forward direction scales powers of the variables to norm one; its converse uses automatic continuity and the value-group theorem of §2.2."

**Claim.** In the pinned `TauCeti.isAffinoidAlgebra_isRestricted_iff_pow_eq_norm`, the forward direction is the scaling construction.

**Witness.** `Polyradius.lean` at the pin: the iff (line 68) has forward half `exists_pow_eq_norm_of_isAffinoidAlgebra_isRestricted` (line 56, the value-group theorem applied to `X i`) and reverse half `isAffinoidAlgebra_isRestricted_of_pow_eq_norm` (line 43, the finite monomial extension); neither uses automatic continuity.

**Repair** (unchanged). Replace the sentence with: "Its reverse direction scales a power of each variable to norm one and applies the finite monomial extension (`TauCeti.isAffinoidAlgebra_isRestricted_of_pow_eq_norm`); its forward direction applies the value-group theorem of §2.2 to the variables, whose supremum norms are their weighted Gauss norms (`TauCeti.exists_pow_eq_norm_of_isAffinoidAlgebra_isRestricted`)."

**Tested** on `ℚ_p` with `ρ = p^(−1/2)`: the reverse direction takes `n = 2`, `c = p`, and `X²/p` has Gauss norm `ρ²/|p| = 1`; the forward direction reads `|X|sup² = |p|` off the value-group theorem.

## R05 (P3) — Four locators are missing, imprecise or point to a text that does not contain the statement

**Location and witness** (all re-checked at this head; the line numbers are unchanged).
1. **§7.5, line 818:** "Source: [Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7"; the `J`-adic paragraph (lines 819–825) has no locator. The `J`-adic statement is Kiehl-E Theorem 3.7 (Kiehl-E line 809, p. 210); the text before 3.7 is the proof of Satz 3.5 on affinoid base change; the shifts follow from Theorem 3.4 (line 647, p. 206).
2. **§7.3, line 753:** "Sources: [Kiehl-AB]" with no locator. Quasi-Stein spaces are Kiehl-AB Definition 2.3 (line 601, p. 270); density, Theorem B and Theorem A are Satz 2.4.1–2.4.3 (line 615, p. 271); the identity principle is Conrad Lemma 2.1.4 (Conrad line 554, p. 12).
3. **§8.1, lines 837–840 and 854:** the relative analytification over `Sp A` has no locator; [Conrad] Appendix A is the absolute case over `k` (Conrad lines 1500–1502). The relative functor is ConradRA Example 2.2.11 (ConradRA lines 854–899, pp. 1069–1070), recorded in the manifest under `ConradRA` but cited nowhere in the README.
4. **§7.1 item 1, line 655:** "PFA §§1.2 and 2.2". The model-space operators `ZeroAtInftyContinuousMap.linearCombination` are PadicFunctionalAnalysis §2.1 at this head (its README lines 416–425); §2.2 (line 430) is bases and property (Pr).

**Repair** (unchanged). §7.5: line 818 becomes "Source: [Kiehl-E] Theorem 3.4", and the `J` paragraph ends "Source: [Kiehl-E] Theorem 3.7". §7.3: "[Kiehl-AB] Definition 2.3 and Satz 2.4; [Conrad] Lemma 2.1.4". §8.1: cite "[Conrad-RA] Example 2.2.11" for the relative case and add the References entry "**[Conrad-RA]** B. Conrad, *Relative ampleness in rigid geometry*, Ann. Inst. Fourier 56 (2006), 1049–1126, doi:10.5802/aif.2207". §7.1: "PFA §§1.2 and 2.1–2.2".

## R06 (P3) — The README is not in the house shape, and the dependency check cannot see its layer dependencies

**Location.** README line 1 `# Rigid analytic geometry`, no `**Summary.**`; `grep -c` at this head: 0 `*Needs:*`, 0 `### Examples`, 0 `### Dependencies`; the 14 `## ` headings (lines 18–1017) include no `## Exact supplier contracts` and no `## How to read the build`, and `## Dependency order and completion` sits at line 922.

**Claim.** The README follows the shape the brief and main use.

**Witness.** The heading list above; the 24 `**Checks.**` blocks are prose paragraphs. The #1808 copy of this folder (`roadmaps show RigidAnalyticGeometry --pr 1808`) already has `# Roadmap: rigid analytic geometry` and 24 `*Needs:*` lines.

**Repair** (unchanged). Restructure to the house shape: `# Roadmap: rigid analytic geometry` with a `**Summary.**`; `## Exact supplier contracts` with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>` subsections; `## How to read the build`; one `*Needs:*` line per target and `### Examples` and `### Dependencies` closing each layer; Checks as bullet lists.

#1808 changes this folder and merges after this pull request, so whichever head lands the folder must carry this shape and R01–R05. At its current head #1808 has the shape but still carries the §1.5 sentence, "PFA §§1.2 and 2.2" (its line 786), "Sources: [Kiehl-AB]" (line 895) and the old §7.5 source line (line 941).

## Previous findings

- R01 — not repaired: `README.md` line 29 still reads "the Banach function algebra theorem and Kiehl's almost noetherianity of §§2.2–2.3 … are this roadmap's"; `Suggested.lean` still declares `exists_fg_smul_le_of_presentation` (line 78) and `isNoetherian_of_presentation_of_discrete` (line 101).
- R02 — not repaired: `Suggested.lean` lines 34–35 still read "Not statable at the pins … classical Tate acyclicity (Layer 5), which needs the structure presheaf on the pinned affinoid site". No Japanese or sheaf theorem is stated.
- R03 — not repaired: lines 137–139 still say "the rest of those layers are targets"; line 866 still reads "Construct `Max A→Spa(A,A°)`, prove injectivity". Neither `IsWeaklyStable` nor `maximalSpectrumToSpa` occurs in the README.
- R04 — not repaired: lines 329–330 still read "Its forward direction scales powers of the variables to norm one; its converse uses automatic continuity and the value-group theorem of §2.2."
- R05 — not repaired: line 753 still "Sources: [Kiehl-AB]"; line 818 still "the argument preceding Theorem 3.7"; line 655 still "PFA §§1.2 and 2.2"; References still without [Conrad-RA].
- R06 — not repaired: line 1 still `# Rigid analytic geometry`; still 0 `*Needs:*`, 0 `### Examples`, 0 `### Dependencies`.

## Verified sound

**Change set and pins.**
- `git diff --stat e473a36..64a16e1 -- TauCetiRoadmap/RigidAnalyticGeometry` is empty.
- `git diff --name-only origin/main...HEAD` touches exactly the 14 folders the brief names as the pull request's own; outside them the diff is empty.
- `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, unchanged.

**Gate.**
- The worker's run on this head passes every check, `build=0`, `OK`.
- My re-run from the worktree gives every count 0 except `outside-folder=20`; the files listed are all in the other 13 folders the brief names as the pull request's own. Not a finding.

**Dependency check** (this round, main `8d9e0a0c`):

```
depcheck: 240 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` this round: 3 `declaration uses sorry` warnings (lines 64, 78, 101), nothing else, exit 0. The elaborated types in `signatures.md` match the README statements: `banachFunctionAlgebra` keeps `[NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A] [IsReduced A]` and the three binders on `K`; the presentation theorems keep `Module.Finite`, `hπ` and `hK`. The "`of` (theorem, line 18)" entry of `signatures.md` is an extractor artifact from the docstring words "theorem of §2.2"; the file declares no such name.

**Library declarations re-opened at the pin this round (7).** `AffinoidSubdomain.weakGTopology` (`Site.lean:63`); `AffinoidSubdomain.presheaf` (`Presheaf.lean:130`); `Ring.IsJapanese` (`Japanese.lean:48,125`); `isWeaklyStable_of_completeSpace` (`WeaklyStable.lean:55`); `maximalSpectrumToSpa_injective` (`MaximalIdealPoint.lean:268`). The other 21 declarations of the previous report's list and the 43 qualified names the README cites were checked at the same pin by the previous reviews; the pin is unchanged and `roadmaps resolve` finds no Lean name missing.

**Cross-roadmap citations resolved this round.**
- **AdicSpacesPartIII on main `8d9e0a0c`:** ownership paragraph lines 95–103 (including "RigidAnalyticGeometry §7.5 supplies proper formal functions … R3.6 transports them"); table row line 602; *almost-noetherian-integral-affinoid-modules* at lines 11149–11160; `Suggested.lean` line 45.
- **PadicFunctionalAnalysis at this head** (unchanged since `e473a36`): §1.2, §2.1 (line 416), §2.2 (line 430), §2.4 resolve.
- **ComplexKahlerGeometry and TopologicalKTheory** (the only folders changed since `e473a36`): neither cites this roadmap, and this roadmap cites neither.
- The section-level resolutions of the earlier reviews are carried for an unchanged text (AdicSpacesPartII R0.3–R0.5, R0.9, R1.1, R1.7, R1.9; Part III R3.1–R3.7; Part IV R5.7, F1.1; RestrictedPowerSeries §§2.4, 5.2, 5.4, 6.2; CompactOperators §§0.1, 3.1; SchemeAndStackFoundations §§0.20–0.21).

**Overlaps and ownership.**
- #1808 changes this folder and conflicts with this head; the merge-order paragraph of this pull request puts the stacked move after it, so the order is stated.
- #1854 conflicts only in `AlgebraicCurves/Suggested.lean`, `BordismFormalGroups/README.md` and `CharacteristicClasses/README.md`.
- No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id that others cite.
- Ownership of the almost-noetherian target against open work was re-checked with `roadmaps grep` (R01); the remaining ownership checks of the earlier reviews are carried, the folder being unchanged.

**Sources (seeded sample).** No sample target falls in a changed passage, because there is none. The previous two reviews' verifications stand for an unchanged text: §0.1 Checks recomputed; §1.2 Conrad 1.1.1, 1.1.3, 2.1.5; §1.3 Conrad 1.1.5; §2.3 Kiehl-E Satz 5.1 (line 878); §6.3 Bosch §6.3, Kiehl-E §2, Lütkebohmert Corollary 3.2, Temkin Corollaries 4.5–4.6; §7.2 Urban 2.3.1–2.3.4; §7.3 Kiehl-AB Definition 2.3 and Satz 2.4, Conrad Lemma 2.1.4; §7.5 Kiehl-E Theorems 3.4 and 3.7; §8.1 ConradRA Example 2.2.11; §8.2 Huber-CV Theorem 4.1 and Corollaries 4.2–4.3; §8.3 Huber-FR Proposition 4.5. §§0.2, 1.5, 2.1, 6.1 and 6.2 cite only [BGR] (see *Not verifiable*).

**Remarks on untouched text** (no change requested): §8.2's "constructible subsets are determined by their classical traces" and the rational-subset bijection are Huber-CV Corollary 4.3 (line 823, p. 473) and the paragraph after it, not Theorem 4.1 or Corollary 4.2; PadicFunctionalAnalysis's `## Downstream consumers` does not list this roadmap, which is for PFA's own review.

**Adversarial table.** Every statement is untouched by this head, so every row is carried from the previous report (r36), which computed them; the three declared theorems were re-elaborated this round.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `banachFunctionAlgebra` (r36; re-elaborated) | zero ring; `K⟨T⟩` with Gauss norm; `K×K` with max norm; `K` with `‖x‖′=2|x|`; `K⟨T⟩/(T²)` | `0≤C·0`; `‖f‖=|f|sup`, `C=1`; `max(|a|,|b|)` both sides, `C=1`; `‖1‖′=2` against `|1|sup=1`, `C=2`; `‖T‖=1`, `|T|sup=0`, no `C` | holds; `[IsReduced A]` and `C>1` needed | none |
| `exists_fg_smul_le_of_presentation` (r36; re-elaborated) | `N=0`; `ℂ_p`, `n=0`, `N=𝔪`; `ε=1`; `A=0` | `N′=0`; `N′=x𝒪` with `ε<|x|<1`; `c=1` would force `𝔪⊆N′`; `M=0` | true (Kiehl-E Satz 5.1) | R01 (delete) |
| `isNoetherian_of_presentation_of_discrete` (r36; re-elaborated) | `ℚ_p`; `𝔽_p((t))`; `ℂ_p`; `A=0` | `ρ=1/p`, `ℤ_p⟨X⟩` noetherian; `ρ=|t|`; no `ρ<1` since `|p^(1/n)|→1`, `𝒪_{ℂ_p}` not noetherian; zero ring noetherian | true; `hK` necessary | R01 (delete) |
| proposed `isSheaf_affinoidSubdomain_presheaf` (r36) | `A=0`; `K⟨T⟩` with `{|T|≤|c|}`, `{|c|≤|T|≤1}`; open disc ∪ circle; `K⟨T⟩/(T²)` | `Max 0=∅`, sections `0`, terminal; on `|T|=|c|` a Laurent series splits into `n≥0` and `n<0` parts; no finite affinoid subcover, so not a weak cover; one point, trivial gluing | true (BGR 8.2.1/1); elaborates | R02 (add) |
| proposed `isJapanese_of_isAffinoidAlgebra` (r36) | `Tₙ`; cusp `K⟨X,Y⟩/(Y²−X³)`; char `p` with `T^(1/p)` | UFD, own closure; closure `K⟨t⟩`, `t=Y/X`, finite; `K⟨S⟩`, `S^p=T`, free on `1,…,S^(p−1)` | true; elaborates | R02 (add) |
| §1.5 strict-radius criterion (r36) | `ρ=p^(−1/2)` over `ℚ_p`; `ρ=e^(−1)`; zero variables | `n=2`, `c=p`, `‖X²/p‖=1`; no `n` with `e^(−n)∈p^ℤ`; vacuous both sides | pinned (`Polyradius.lean:68`); labels swapped | R04 |
| §0.1 Checks (r36) | `p+T²` over `ℚ_p`; `p+T+pT²`; `n=0` | `|p+1|=1` at `T=1` vs `|p|` at `0`; reduction `T`; `T₀=K` | as stated | none |
| §1.3 Check (r36) | `A=K⟨T⟩`, `M=A/(T)`, complete `L/K` | `A_L⊗_A M=L`; `M⊗̂_K L=L` | as stated | none |
| §2.1 Checks (r36) | `p+T²`; `(1,0),(0,1)` in `K×K`; `ℚ_p⟨T⟩/(T²−p)`; zero ring | sup `1` vs `|p|` at `0`; `|(1,0)(0,1)|sup=0` vs `1`; `|T|sup=p^(−1/2)∉p^ℤ`; `|1|sup=0` | as stated | none |
| §2.2 value group and annulus (r36) | `T²−p`; `K⟨X,Y⟩/(XY−c)` | `|T|sup²=|p|`, `|p⁻¹T²|sup=1`; `|X|sup=|Y|sup=1`, `|XY|sup=|c|` | as stated | none |
| §2.3 reduced-quotient Checks (r36) | zero ring; `ℚ_p⟨T,S⟩/(S²−p²T)`; `ℤ_p`, `ϖ=p²` | `0≤1`; `(S/p)²=T`, `B/pB=𝔽_p[T,S]/(S²)`; `ℤ_p/p²` nonreduced | sufficient, not necessary | none |
| §6.1 Checks (r36) | `ℕ` discrete, bounded functions; singleton cover; constant `ℤ` on `{a,b}` | sup over finitely many pieces bounded by the max; `n↦ϖ^(−n)` unbounded; `F(∅)=ℤ` not terminal, sheafification `ℤ×ℤ` | as stated | none |
| §6.2 Checks (r36) | `|ϖ|=1/p`, `|T|^n≤|ϖ|`; open disc ∪ circle | radii `p^(−1/n)→1`, union `{|T|<1}`; no finite affinoid refinement | as stated | none |
| §6.3 Checks (r36) | `{|T|≤|ϖ|}` in the unit disc; disc in itself; `{0}` | `|T|sup=|ϖ|<1`; `|T|sup=1`, dimension 1 vs finiteness over `Sp K`; `T↦ε` into `K[ε]/(ε²)` does not factor through `T↦0` | as stated | none |
| §6.3 composition law (r36) | discretely valued `K`; general `K` | Lütkebohmert Corollary 3.2 (DVR); Temkin Corollaries 4.5–4.6 | sourced | none |
| §7.2 Checks (r36) | `c·id`, `|c|=r`; `U=0`; `X−c`, `|c|<1=r`; `1−cT` | root `c`, `M₁=M`; `Q(0)` unit, `M₁=0`; `|c|<r` fails; root `1/c`, `|1/c|>1` | match pinned definitions | none |
| §7.3 Checks (r36) | `XY=0`; open disc; `ℙ¹` | `Y=0` on `X≠0`; `H¹(𝒪)=0`, global functions not affinoid; quasi-compact, global functions `K` | as stated | R05 (locator) |
| §7.4 nonflat Check (r36) | `I_P(−1)` on `ℙ¹_{K⟨t⟩}` | `H⁰=0`; fibre `𝒪(−2)⊕k_P`, `H⁰=K` | as stated | none |
| §7.5 shifts (r36) | `a=0`; `a=1`; identity in degree 0 | `R₀=M`, `R_n=0`; `R_n=M`; `R_n=a^nM`; `d=k₀`, `e=i₀+m` | as stated | R05 (locator) |
| §8.1 relative analytification (r36) | `C=K`; affinoid `C` (ConradRA Ex. 2.2.11) | usual analytification; finite-residue points biject; `Ô_{X,ι(x)}≃Ô_{X^an,x}` | supports the text; locator missing | R05 |
| §8.1 Check (r36) | `y²=x²(x+1)`, char `≠2` | algebraic local ring a domain; two analytic branches `y=±x√(1+x)` | as stated | none |
| §8.2 classical points (r36) | Huber-CV 4.1, 4.2–4.3; rank-two point below the Gauss point | `L_A` the constructible closure of `Max A`; dense; `v(T)<1`, `v(T)^n>|ϖ|` all `n` | as stated; injectivity pinned | R03 |
| §8.3 (r36) | Huber-FR Proposition 4.5 (i)–(v) | fully faithful; local image; quasi-separated equivalence; affinoid iff | as stated | none |

**Headline theorems** and where each stands: Noether normalisation, maximum modulus and integral reduction are pinned; the Banach function algebra theorem is stated (line 64); finite normalisation and Tate acyclicity are statable but absent (R02); almost noetherianity is Part III's (R01); the rigid category, the Kiehl-proper composition law and analytification are not statable for lack of a rigid-space carrier and are to be named in the docstring (R02); the rigid–adic equivalence, the quasi-Stein theorem, Kiehl's theorem with formal functions and GAGA are not statable and already named.

**Padding.** File and pins unchanged since `bdcbdaa`; the earlier probe stands: `exact?` fails on `banachFunctionAlgebra` and `isNoetherian_of_presentation_of_discrete`, and nothing at the pin states either. No declaration is padding.

## Not verifiable

- **[BGR]** is recorded as `uncertified` (paywalled). Every BGR locator is taken by locator only, including 6.2.4 for `banachFunctionAlgebra` and 8.2.1/1 for the proposed Tate theorem. §§0.2, 1.5, 2.1, 6.1 and 6.2 rest on BGR alone.
- **[Temkin]** was read from the author's preprint; the published corollary numbering was not checked.
- **[Kiehl-E], [Kiehl-AB], [Lütkebohmert]** are OCR of GDZ scans. The cited statements are legible; Lütkebohmert's Theorem 3.1 is not.
- **§8.2 constructible density as a Lean statement on `maximalSpectrumToSpa`:** not tested for statability; the README keeps it as a target and the docstring does not list it either way.

## Source issues

- none
