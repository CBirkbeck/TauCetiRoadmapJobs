# Review of RigidAnalyticGeometry (pull request #1807 at bdcbdaa)

**Verdict:** needs changes

This is a full review. The folder changed by 646 lines since `7e8275c`, and the pins have not moved (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). All four findings of the review at `7e8275c` are repaired (see *Previous findings* at the end). Six new findings follow. Three are blocking:

- **R01:** an ownership conflict with AdicSpacesPartIII over Kiehl's almost noetherianity.
- **R02:** two headline theorems are statable at the pins but absent. The docstring wrongly says one of them is not statable.
- **R03:** about a dozen Layer 0–2 and §8.2 "targets" are already proved at the Tau Ceti pin and are not cited.

R01 reverses part of the previous review's R01 repair, which told you to keep `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete` because they are absent at the pin. Being absent at the pin does not make a theorem this roadmap's. AdicSpacesPartIII on main owns both theorems (witness below).

## R01 (P2) — Kiehl's almost noetherianity is AdicSpacesPartIII R3.6's, but the Scope table and `Suggested.lean` claim it as this roadmap's

**Location.**
- `README.md` line 29 (Tau Ceti row, Boundary column): "the Banach function algebra theorem and Kiehl's almost noetherianity of §§2.2–2.3 … are this roadmap's".
- `Suggested.lean` lines 17–21: "Stated below, because the pinned Tau Ceti does not prove them: … Kiehl's almost noetherianity…". The two theorems themselves are at lines 74–107.
- Against this, `README.md` line 446 has the heading "**Supplier contract: Part III R3.6, *almost-noetherian-integral-affinoid-modules*.**", and line 47 calls it one of Part III's "algebraic targets".

**Claim.** This roadmap owns Satz 5.1 and its discrete corollary, and they are its headline theorems.

**Witness.** AdicSpacesPartIII on main:
- line 99: "R3.6 owns … integral-affinoid almost noetherianity";
- line 602: "*almost-noetherian-integral-affinoid-modules* | R3.6 | Finite approximations … and noetherianity for discrete valuation";
- lines 11150–11168 state it for any ring of definition that is a quotient of `K°⟨X⟩`, and Part III itself identifies that ring with the image of the Gauss unit ball;
- its `Suggested.lean` line 45 calls it a "README-only target of this roadmap".

So there are two owners. Part III's statement is the more general one, and this roadmap's §2.3 already labels it a supplier contract. The README contradicts itself.

**Repair.** Make AdicSpacesPartIII R3.6 the single owner.
- `Suggested.lean`: delete `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete`. In the docstring, replace the "Kiehl's almost noetherianity…" clause with: "Kiehl's almost noetherianity of presentation rings and its noetherian corollary for discretely valued `K` are AdicSpacesPartIII R3.6's (*almost-noetherian-integral-affinoid-modules*); §2.3 consumes them."
- README line 29: delete "and Kiehl's almost noetherianity of §§2.2–2.3".
- README lines 446–454: drop the two backticked names; the gate checks every backticked own name. Keep the statement as prose under the supplier contract. Part III already performs the identification with `π(Tₙ°)`, so drop "Identify its integral presentation… transport the following theorem" and cite Part III R3.6 for it.

**Tested.** The scratch copy described under R02, which no longer has the two theorems, elaborates with no error.

## R02 (P2) — Tate acyclicity and finite normalisation are statable at the pins but absent; the docstring says Tate acyclicity is not statable

**Location.** `Suggested.lean` lines 34–35: "Not statable at the pins, … classical Tate acyclicity (Layer 5), which needs the structure presheaf on the pinned affinoid site with its sheaf condition". README line 248 ("Deduce that affinoid domains are Japanese from §0.2") and Dependency order item 1 ("prove characteristic-free weak stability and its Japanese application").

**Claim.** No pinned carrier can state Tate acyclicity, and the docstring names every headline that cannot be stated.

**Witness.** At the Tau Ceti pin:
- `TauCeti.AffinoidSubdomain.weakGTopology` is at `AlgebraicGeometry/Rigid/Affinoid/Site.lean`. Its docstring says it is "defined on the same inclusion preorder as `AffinoidSubdomain.presheaf` … No sheaf condition is asserted here".
- `TauCeti.AffinoidSubdomain.presheaf` is at `Presheaf.lean:130`.
- `TauCeti.Ring.IsJapanese` is at `RingTheory/Japanese.lean:125`.

README lines 476–480 also say the presheaf and the site are pinned and that "Layer 5 proves the sheaf condition". Both statements below elaborate.

**Repair.** Add the import lines

```lean
public import TauCeti.AlgebraicGeometry.Rigid.Affinoid.Site
public import TauCeti.RingTheory.Japanese
```

and the two theorems:

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

Then rewrite the docstring:
- drop Layer 5 from the not-statable list;
- say that the higher Čech vanishing and the module form stay README targets;
- add §6.2–6.3 (the rigid category and the Kiehl-proper composition law) and §8.1 (the analytification comparisons), with "no rigid-space carrier at the pin" as the reason.

Name both new theorems in §0.2/§1.2 and Layer 5.

**Tested.** A scratch copy carrying the R01 and R02 changes (the Banach function algebra theorem plus these two) gives `lake env lean`: 3 `declaration uses sorry` warnings, nothing else, exit 0. `#check @` shows every binder kept.

## R03 (P2) — Layer 0–2 and §8.2 targets that the Tau Ceti pin already proves are stated as work to do

**Location.** README lines 137–139: "Where a target of Layers 1–4 below is one of these theorems, the text cites it by its pinned name; the rest of those layers are targets." The targets that are already pinned are on lines 185–186, 209–214, 222–223, 242–246, 253, 331 and 866.

**Claim.** Every pinned theorem is cited, and what remains is still to be done.

**Witness.** Each README target below is already proved at Tau Ceti `2fd255d9`. Paths are under `TauCeti/RingTheory/Affinoid/` unless another tree is named, and every name is in namespace `TauCeti.IsAffinoidAlgebra` unless written in full.

**§0.2** (bounded-functional criterion, complete and perfect cases):
- `TauCeti.IsWeaklyStable`, `TauCeti.isWeaklyStable_of_perfectField`, `TauCeti.isWeaklyStable_of_completeSpace` (`Analysis/Normed/Field/WeaklyStable.lean:36,47,55`).

**§1.1:**
- quotient norms: `residueNormedCommRing` (`QuotientNorm.lean:175`);
- closure under quotients and finite extensions: `quotient` (`Basic.lean:66`) and `of_finite` (`Integral/Basic.lean:117`);
- `A⟨X⟩` and its universal property: `isRestricted_subring`, `restrictedLift`, `existsUnique_algHom_isRestricted_subring` (`Restricted.lean:73,143,171`);
- quotient topologies: `isOpenQuotientMap`, `quotientKerContinuousAlgEquiv` (`QuotientNorm.lean:65,73`);
- independence of presentation and equivalence of complete norms: `presentationContinuousAlgEquiv`, `toContinuousAlgEquiv` (`QuotientNorm.lean:133,106`).

**§1.2:**
- `d = dim A`: `exists_ringKrullDim_eq_finite_injective` (`KrullDimension.lean:77`);
- quotients by ideals with maximal radical: `finite_quotient_of_isMaximal_radical` (`FiniteQuotient.lean:51`);
- contraction of maximal ideals: `comap_isMaximal` (`MaximalSpectrum.lean:59`);
- componentwise heights: `height_map_quotientMk_eq_ringKrullDim_quotient` and `exists_mem_minimalPrimes_height_eq_ringKrullDim_quotient` (`KrullDimension.lean:118,138`).

**§1.5:**
- the strict case "Gauss = sup" is the step `supSeminorm_eq_norm_of_normMulClass` used in `Polyradius.lean:62`.

**§8.2** ("Construct `Max A→Spa(A,A°)`, prove injectivity"):
- `TauCeti.ValuationSpectrum.maximalSpectrumToSpa` and `maximalSpectrumToSpa_injective` (`AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean`).

So the sentence at lines 137–139 is false, and the Scope row's "remaining targets of Layers 0–4 … are this roadmap's" claims work that is already proved at the pin.

**Repair.**
- At each location above, write the pinned name instead of "Construct/Prove/Deduce", following the pattern of lines 211–212.
- Add `TauCeti/Analysis/Normed/Field/WeaklyStable.lean` and `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean` to the Tau Ceti row (line 29) and to "Existing library interfaces".
- In §0.2, keep only the Gauss-fraction-field and inseparable-step targets, which are not pinned.

**Tested.** Every name above was located by `grep` at the pin with its file and line, and the statements were read there. The qualified names the README already cites all resolve (see *Verified sound*).

## R04 (P3) — §1.5 describes the two directions of the polyradius criterion the wrong way round

**Location.** README lines 329–330: "Its forward direction scales powers of the variables to norm one; its converse uses automatic continuity and the value-group theorem of §2.2."

**Claim.** In the displayed `T_{n,ρ} strictly K-affinoid ↔ ∀ i, ρᵢ∈√|K×|`, the forward direction is the scaling construction.

**Witness.**
- The forward direction is affinoid ⇒ radii. `TauCeti.exists_pow_eq_norm_of_isAffinoidAlgebra_isRestricted` (`Polyradius.lean:56`) proves it with `exists_supSeminorm_pow_eq_norm` applied to `Xᵢ`.
- The converse is `isAffinoidAlgebra_isRestricted_of_pow_eq_norm` (line 43), the finite monomial extension.
- Neither direction uses automatic continuity.

Over `ℚ_p` with `ρ = p^(−1/2)`: the converse takes `n = 2`, `c = p` and scales `X²/p⁻¹`. The forward direction reads `|X|sup² = |p|` off the value-group theorem.

**Repair.** Write instead: "Its reverse direction scales a power of each variable to norm one and applies the finite monomial extension (`TauCeti.isAffinoidAlgebra_isRestricted_of_pow_eq_norm`); its forward direction applies the value-group theorem of §2.2 to the variables, whose supremum norms are their weighted Gauss norms (`TauCeti.exists_pow_eq_norm_of_isAffinoidAlgebra_isRestricted`)."

## R05 (P3) — Four locators are missing, imprecise or point to a text that does not contain the statement

**Location and witness.**
- **§7.5, J-adic formal functions (README lines 820–825).** The paragraph has no locator. The statement is Kiehl-E Theorem 3.7 (Kiehl-E line 809, p. 210). Line 818 cites "the argument preceding Theorem 3.7". That argument is the proof of Satz 3.5 (lines 780–806), which concerns affinoid base change, not the shifts `d` and `e`. Those follow from Theorem 3.4 alone (line 647, p. 206: the `a`-good filtration and the null systems).
- **§7.3 (line 753): "Sources: [Kiehl-AB]" gives no locator inside the paper.** The quasi-Stein definition is Kiehl-AB Definition 2.3 (line 601, p. 270). Density, Theorem B and Theorem A are Satz 2.4.1–2.4.3 (line 615, p. 271). The identity principle is Conrad Lemma 2.1.4 (Conrad line 554, p. 12).
- **§8.1 (lines 837–840, 854).** Relative analytification over `Sp A` is attributed to "[Conrad] §1 and Appendix A". That appendix treats only locally finite type `k`-schemes (Conrad lines 1501–1502). The relative functor, with its point bijection and its completed-local-ring isomorphism, is in B. Conrad, *Relative ampleness in rigid geometry*, Ann. Inst. Fourier 56 (2006) 1049–1126, Example 2.2.11, pp. 1069–1071 (doi:10.5802/aif.2207, open access). I read it there; it is not in the manifest.
- **§7.1 item 1 (line 655): "PFA §§1.2 and 2.2" for "every Banach `A`-module is a continuous quotient of `c₀(I,A)`".** PFA §1.2 gives bounded lifting. The model-space surjection is §2.1's `ZeroAtInftyContinuousMap.linearCombination` (PadicFunctionalAnalysis README line 395 at this head). AdicSpacesPartIII's `Suggested.lean` line 46–47 also cites "PadicFunctionalAnalysis §§2.1–2.2's model-space surjections".

**Repair.**
- §7.5: line 818 becomes "Source: [Kiehl-E] Theorem 3.4", and the J-paragraph ends "Source: [Kiehl-E] Theorem 3.7".
- §7.3: write "[Kiehl-AB] Definition 2.3 and Satz 2.4; [Conrad] Lemma 2.1.4".
- §8.1: add a References entry **[Conrad-RA]** with the citation above, cite "[Conrad-RA] Example 2.2.11" for the relative case, and record it in `sources.toml`.
- §7.1: write "PFA §§1.2 and 2.1–2.2".

## R06 (P3) — The README is not in the house shape, and the dependency check cannot see its layer dependencies

**Location.** Headings at README lines 1, 18, 63, 922 and 1017. There are 0 `*Needs:*` lines, 0 `### Examples` and 0 `### Dependencies` (counted with `grep -c`). 24 `**Checks.**` paragraphs are written as continuous prose.

**Claim.** The README follows the shape the brief and main use.

**Witness.**
- The title is `# Rigid analytic geometry`, with no `**Summary.**`.
- The supplier table sits under `## Scope and ownership` instead of `## Exact supplier contracts`.
- There is no `## How to read the build`; `## Dependency order and completion` sits near the end instead.
- No layer has `### Examples` or `### Dependencies`, and no target has a `*Needs:*` line, so "every layer its dependencies" fails.
- Checks are paragraphs, not one bullet per test.
- The revision of this folder at the head of #1808 already has the house title, `**Summary.**`, `## Exact supplier contracts` and 24 `*Needs:*` lines.

**Repair.** Restructure to the house shape:
- `# Roadmap: rigid analytic geometry` and `**Summary.**`;
- move the supplier table and "Existing library interfaces" to `## Exact supplier contracts`, with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>` subsections;
- `## How to read the build`;
- a `*Needs:*` line per target, with `### Examples` and `### Dependencies` closing each layer;
- Checks as bullet lists.

Because #1808 changes this folder and merges after this pull request, the shape work belongs in whichever of the two heads lands the folder. That head must also carry R01–R05.

## Verified sound

**Change set and pins.**
- `git diff --stat 7e8275c..HEAD` on the folder: 280+/366−, matching `changes.md`.
- `lake-manifest.json` pins are unchanged (Tau Ceti `2fd255d9…`, Mathlib `1b1ccf4b…`), and `.lake/packages` is at the same revisions.
- `git diff --stat origin/main...HEAD` outside the 14 folders the brief names is empty.

**Gate.**
- The worker's run passes every check.
- My re-run from the worktree gives `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=20 source-material=0`. All 20 outside-folder files are in the pull request's own folders (the `git diff --name-only` directory count lists only those 14), so this is not a finding.
- `STATUS.md`, `PROGRESS.md` and `metadata.toml` (`math.AG`) are roadmap files.

**Dependency check.**

```
depcheck: 245 roadmaps, 2472 edges, 0 problem(s)
```

The house-shaped #1808 revision of this README, with 24 `*Needs:*` lines, also gives 0 problems (2473 edges). So no UPWARD or CYCLE line is hidden by R06's missing `*Needs:*`. The two-way exchange with AdicSpacesPartII and III is at theorem-group level, as the README states at line 23.

**Elaboration.** `lake env lean` on `Suggested.lean` gives 3 `declaration uses sorry` warnings (lines 64, 78, 101), nothing else, exit 0.

**Elaborated signatures.**
- `#check @` of the three declarations matches the README:
  - `banachFunctionAlgebra` keeps `[NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A] [IsReduced A]` and all three `K` binders;
  - the presentation theorems keep `Module.Finite`, `hπ`, `hK`.
- The "`of` (theorem, line 18)" entry and the "Unknown identifier `of`" error in `signatures.md` are an artifact of the extractor. It read the docstring words "theorem of §2.2" (lines 17–18) as a declaration; the file has no such declaration.

**Library declarations opened at the pins.**
- The README cites 43 distinct qualified library names. 42 of them elaborate under `#check @` in one scratch file. `TauCeti.Huber.CompletedTensor` (`Huber/TensorProduct/Completion.lean:73`) I confirmed by `grep`, because its module is not built here. The checked names include `supSeminorm_le_norm` (`SupSeminorm.lean:323`), `supSeminorm_pow` with `n ≠ 0` (line 360, matching the README's "`n≥1`, exponent zero requires a nonzero algebra"), `isSlopeLE_iff_splittingField` (`Slope.lean:83`) and `mem_iff_supSeminorm_le_one_of_isReduced_quotient` (`PowerBounded.lean:250`, with `IsLeftRegular`).
- `AlgHom.isIntegral_map_unitClosedBall_iff_supSeminorm_le_one` (`PowerBounded.lean:135`, no reducedness hypothesis).
- `Polynomial.IsSlopeLE` (`Unbundled/Slope.lean:64`, which includes `0 < r`) and `ContinuousLinearMap.IsSlopeDecomposition` (`Operator/SlopeDecomposition.lean:51`): monic, unit constant term, `BijOn` on `M₂`. Both match §7.2 word for word.
- `Subring.unitClosedBall` is Tau Ceti's (`Analysis/Normed/Ring/Ultra.lean:84`), and `MvPowerSeries.IsRestricted.subring` is Mathlib's (`RingTheory/MvPowerSeries/Restricted.lean:159`).
- `grep` under `TauCeti/` for the three headline names, "Satz 5.1" and almost-noetherian statements is empty.

**Padding probe.**
- `exact?` in a file without the sorried declarations fails on both `banachFunctionAlgebra` and `isNoetherian_of_presentation_of_discrete`.
- Nothing at the pin states either theorem. The nearest is `isNoetherianRing_isRestricted_subring_of_division` (`Groebner.lean:402`), which would also need `restrictedIntegerEquiv`, a degree on `K°` and an image argument.
- So no declaration is padding.

**Cross-roadmap citations resolved.**

On main `3b3f7ef`:
- AdicSpacesPartII R0.3 (line 1769), R0.4 (2270), R0.5 (2759), R0.9 (4071), R1.1 (8427), R1.7 (9806), R1.9 (10509);
- AdicSpacesPartIII R3.1 (9136), R3.2 (9594), R3.3 (9870), R3.4 (10053), R3.6 (10472), R3.7 (11218);
- AdicSpacesPartIV R5.7 (2165), F1.1 (2998);
- RestrictedPowerSeries §2.4 (364), §5.2 (541), §5.4 (587), §6.2 (630);
- CompactOperators §0.1 (151), §3.1 (615);
- `Completed/AdicSpaces/README.md` exists.

At this head:
- PadicFunctionalAnalysis Layers 0–2 and §§1.2, 2.2, 2.4 (lines 334, 401, 440; numbering unchanged from main);
- SchemeAndStackFoundations §0.20 (1302) and §0.21 (1394), with `Ring.IsJapanese` at line 1305.

At its open head: LocallyAnalyticDistributions §4.16 (line 3036), which cites this §7.2 as its supplier. Part II line 350 attributes *reduced-affinoid-supremum-norm* to this §§2.1–2.2, so `banachFunctionAlgebra` has a single owner.

**Overlaps.**
- #1808 changes this folder and conflicts with this head. This pull request's merge-order paragraph puts #1808 after it, so the order is stated.
- #1854 conflicts only in `AlgebraicCurves/Suggested.lean`.
- No id that this README cites is dropped by any open pull request, and none is defined only by an open revision. This pull request drops no id that is cited elsewhere.
- `roadmaps grep` for "almost-noetherian", "Banach function algebra" and "reduced-affinoid-supremum-norm" over open heads and main finds only the R01 conflict.

**Sources at their locators (seeded sample).**
- §0.1: no external locator; Checks recomputed below.
- §1.2: Conrad §1.1 (lines 129–148: excellence, universal catenarity, regular locus, formal fibres); Theorem 1.1.1 (line 156, p. 4); Lemma 2.1.5 (line 570, p. 12); Theorem 1.1.3 (line 201, p. 5) for Layers 3–4.
- §§1.3–1.4: Conrad Lemma 1.1.5 (line 274, p. 6). The pinned files `RationalFraction.lean`, `LaurentFraction.lean`, `Subdomain/Rational.lean` and `Subdomain/Laurent.lean` exist.
- §7.1: Kiehl-E Definition 1.1 (line 315, p. 198), Satz 1.2 (328), Lemma 1.3 (333), Satz 1.4 (372, p. 199), §2 (471, p. 202); Bosch §6.3 (line 4876, p. 129) and §6.4 (5024, p. 133).
- §7.2: Urban 2.3.1 (line 869, p. 1706) and 2.3.2–2.3.4. Urban's slope ≤ h concerns roots of `Q*`, which are the annihilator roots of the README's `Q`, so the direction agrees.
- §7.3: Kiehl-AB Definition 2.3 and Satz 2.4; Conrad Lemma 2.1.4 (see R05).
- §7.4: Kiehl-E Satz 2.6 (626, p. 205) and Satz 3.5 (747, p. 209), for affinoid subdomains. The finite flat and field-extension cases are Part III R3.6 contracts (Part III line 608).
- §7.5: Kiehl-E Theorem 3.4 (647, p. 206) gives an `a`-good filtration and null kernel and cokernel systems. A uniform `e` for all `n` follows by taking `e = i₀ + m`.
- §8.1: Conrad A.1.2 (1531) and A.1.3 (1580, p. 33) for the absolute case; see R05.
- §8.3: Huber-FR Proposition 4.5 (i)–(v) (line 1436, p. 543).
- §8.4: no external source; Part III R3.7 exists.
- R02 of the previous review: Lütkebohmert Corollary 3.2 (line 413) under the standing DVR hypothesis (line 109); Temkin Corollaries 4.5–4.6 (lines 792–815); Bosch Definition 8 and the composition remark (lines 4956–4968).
- §2.3: Kiehl-E Satz 5.1 (line 878, p. 212); the discrete case is at lines 863–868.

**Adversarial table** (instances and values computed in this review):

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `banachFunctionAlgebra` | zero ring; `K⟨T⟩` Gauss; `K×K` max; `K` with `‖x‖′=2|x|`; `K⟨T⟩/(T²)` | `0≤C·0`; `‖f‖=|f|sup`, `C=1`; `max(|a|,|b|)` both, `C=1`; `‖1‖′=2`, `|1|sup=1`, needs `C=2`; `‖T‖=1`, `|T|sup=0`, no `C` | holds; `[IsReduced A]` and `C>1` both needed | none |
| `exists_fg_smul_le_of_presentation` | `N=0`; `ℂ_p`, `n=0`, `N=𝔪`; `ε=1`; `A=0` | `N′=0`; `N′=x𝒪`, `|cm|<ε<|x|`; `c=1` forces `N⊆N′`, false for `𝔪`; `M=0` | true (Kiehl-E Satz 5.1) | R01 |
| `isNoetherian_of_presentation_of_discrete` | `ℚ_p`; `𝔽_p((t))`; `ℂ_p`; `A=0` | `ρ=1/p`, `ℤ_p⟨X⟩` noetherian; `ρ=|t|`; no `ρ<1`, `𝒪_{ℂ_p}` not noetherian; zero ring | true; hypothesis necessary | R01 |
| proposed Tate sheaf | `A=0`; `K⟨T⟩` with `{|T|≤|c|}`, `{|c|≤|T|≤1}`, `0<|c|<1`; open disc ∪ circle; `K⟨T⟩/(T²)` | sections on `∅` are `0`, terminal; `Σ_{n∈ℤ}b_nT^n` on `|T|=|c|` splits into `n≥0` and `n<0` parts; that cover has no finite affinoid subcover, so it is not a weak cover; one point, trivial gluing | true; elaborates | R02 |
| proposed Japanese theorem | `T_n`; cusp `K⟨X,Y⟩/(Y²−X³)`; char `p`, adjoin `T^{1/p}` | UFD, closure is itself; closure `K⟨t⟩`, finite; `K⟨S⟩`, `S^p=T`, free of rank `p` | true; elaborates | R02 |
| §1.5 criterion | `ρ=p^(−1/2)`; `ρ∉p^ℚ`; `n=0` | `n=2`, `c=p`; no power in `p^ℤ`; vacuous on both sides | pinned; direction labels swapped | R04 |
| §2.1 Checks | `p+T²`; `(1,0),(0,1)` in `K×K`; `ℚ_p⟨T⟩/(T²−p)`; zero ring | sup `1`, value `|p|` at `0`; `|(1,0)(0,1)|sup=0`, product of sups `1`; one point, `|T|sup=p^(−1/2)∉p^ℤ`; `|1|sup=0≠1` | as stated | none |
| §2.2 value group, annulus | `T²−p`; `K⟨X,Y⟩/(XY−c)` | `m=2`, `|T|²=|p|`, `|p⁻¹T²|sup=1`; `|X|sup=|Y|sup=1`, `|XY|sup=|c|` | as stated | none |
| §2.3 reduced-quotient Checks | zero ring; `ℚ_p⟨T,S⟩/(S²−p²T)`; `ℤ_p`, `ϖ=p²` | `0≤1` both; `(S/p)²=T`, `B/pB=𝔽_p[T,S]/(S²)`; `ℤ_p/p²` nonreduced although `ℤ_p=ℚ_p°` | sufficient, not necessary, as stated | none |
| §7.2 Checks | `c·id`, `|c|=r`; `U=0`; `X−c`, `|c|<1=r`; `1−cT` | root `c`, `M₁=M`; `Q(0)` unit kills `M₁`, so `M₁=0`; `|c|<r` fails; root `1/c`, `|1/c|>1` | match pinned definitions | none |
| §7.4 nonflat Check | `I_P(−1)` on `ℙ¹_{K⟨t⟩}` | `H⁰=0`; fibre `𝒪(−2)⊕k_P` (`Tor₁=k_P`, `Ext¹(𝒪(−2),k_P)=0`), `H⁰=K` | as stated | none |
| §7.5 shifts | `a=0`; `a=1`; identity, degree 0 | `R₀=M`, `R_n=0`; `R_n=M`; `R_n=a^nM`; `d=k₀`, `e=i₀+m` | as stated; locator in R05 | R05 |
| §7.3 Checks | `XY=0`; open disc; `ℙ¹` | `Y=0` on `X≠0`; `H¹(𝒪)=0`, ring of global functions not affinoid; quasi-compact, global functions `K`, so not quasi-Stein | as stated | R05 |
| §8.1 Check | `y²=x²(x+1)`, char `≠2` | algebraic local ring a domain; analytic germ has two branches `y=±x√(1+x)` | as stated | R05 |
| §8.2–8.3 | rank-two point below the Gauss point; Huber 4.5 | `v(T)<1`, `v(T)^n>|ϖ|` for all `n`; (ii) full faithfulness, (iii) local image, (iv) quasi-separated equivalence, (v) affinoid iff | as stated | R03 (§8.2 pinned map) |
| §6.3 composition law | discretely valued `K`; general `K` | Lütkebohmert Cor. 3.2 under the DVR hypothesis; Temkin Cor. 4.5–4.6 | sourced | none |

**Headline theorems** (from the README's summary and layers) and where each stands:
- Noether normalisation, maximum modulus, integral reduction: pinned.
- Banach function algebra: stated.
- Finite normalisation and Tate acyclicity: statable but absent (R02).
- Almost noetherianity: Part III's (R01).
- Rigid category, Kiehl-proper composition and analytification (§§6.2–6.3, 8.1): not statable, no rigid-space carrier (to be named, R02).
- Rigid–adic equivalence, quasi-Stein, Kiehl's theorem and formal functions, GAGA: not statable; already named in the docstring.

## Previous findings

- **R01 (restated pinned theorems, private carriers): repaired.** `Suggested.lean` lines 10–15 now read "on the pinned carriers: the affinoid predicate `TauCeti.IsAffinoidAlgebra`, the supremum seminorm `TauCeti.supSeminorm` … No definition is made here". The nine definitions and the seventeen pinned theorems are gone, and README lines 119–150 name the four Tau Ceti trees. The repair's instruction to keep the two almost-noetherian theorems is withdrawn by this review's R01.
- **R02 (composition law unsourced): repaired.** Lines 631–634 read "[Lütkebohmert] Corollary 3.2 (discretely valued `K`); [Temkin] Corollaries 4.5–4.6 (general `K`, through the comparison with Berkovich properness)", and References lines 997–1002 add both entries.
- **R03 (AdicSpaces link): repaired.** Line 34 reads `[AdicSpaces](../../Completed/AdicSpaces/README.md)`, and the target exists.
- **R04 (`letI` in signatures): repaired.** Both theorems are deleted, and the gate reports `statement-hygiene=0`.

## Not verifiable

- **[BGR]** (recorded `uncertified`, paywalled): every BGR locator in §§0.2, 1.1, 1.4, 1.5, 2.1–2.3 and Layers 5–6 is taken by locator only, including 6.2.4 for `banachFunctionAlgebra` and 8.2.1/1 for the proposed Tate theorem.
- **[Temkin]**: read from the author's preprint. Agreement of the published Math. Ann. corollary numbering was not checked.
- **[Kiehl-E], [Kiehl-AB], [Lütkebohmert]**: OCR of GDZ scans. Lütkebohmert's Theorem 3.1 (line 411) is illegible; Corollary 3.2 is legible.
- **Conrad 2006**: read from the journal's open-access PDF, which is not in `sources.toml`.
- **§8.2 constructible density**: whether it is statable on the pinned `maximalSpectrumToSpa` was not tested. Its module is not built in this worktree, and I built nothing.

## Source issues

- **Gap** in Kiehl-E at Satz 5.1, p. 212: the source says the case of a general open subalgebra defining the topology reduces easily to quotients of `V⟨X₁,…,Xₙ⟩` and omits the reduction; it should give that reduction or restrict the statement to such quotients; affects nothing (this roadmap and AdicSpacesPartIII use only quotients of `V⟨X⟩`).
