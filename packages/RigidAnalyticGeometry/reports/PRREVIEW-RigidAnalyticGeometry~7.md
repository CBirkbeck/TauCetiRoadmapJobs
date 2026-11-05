# Review of RigidAnalyticGeometry (pull request #1807 at f0c1c5c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 4aa8b0b. `TauCetiRoadmap/RigidAnalyticGeometry/` is byte-for-byte the folder the previous review read (`git diff --stat 4aa8b0b..HEAD -- TauCetiRoadmap/RigidAnalyticGeometry` is empty); the pull request's later commits touch only BordismFormalGroups, ClassifyingSpaces and TopologicalKTheory, none of which cites this roadmap. So none of the eleven previous findings is repaired, and each is written again below with its witness re-checked at this head, against main at `3b51055` and the pins (Tau Ceti `358314d4`, Mathlib `f6090c70`). The gate still fails on `imports`, `mathlib-subimports`, `no-import-mathlib`, `prnum` (7 lines), `depcheck` and the 14 build warnings the submodule imports cause; there is no acceptance until R01, R03 and R04 are repaired.

## R01 (P2) — Upward supplier: LocallyAnalyticDistributions in the supplier table

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 36, "LocallyAnalyticDistributions, PR #854, §§4.2, 4.16 | The `C₀` tensor comparison, geometric slope tests, Fredholm-window existence and finite-slope complexes"; also lines 604–608 ("LAD §4.16 owns … Sources: [Urban] §2.3; LAD §4.16; CompactOperators Layer 3").

Claim: the row says these LocallyAnalyticDistributions results are "used here", which makes that roadmap a supplier of this one.

Witness: the dependency check on this head prints `UPWARD: RigidAnalyticGeometry (on main) -> LocallyAnalyticDistributions (#64) at README lines [36]`; LocallyAnalyticDistributions is not on main (no folder at `3b51055`) and is line 65 of the merge order, while this roadmap is on main. At its open head LocallyAnalyticDistributions §4.16 consumes this roadmap's §7.2 (`IsSlopeDecomposition`, `exists_projection`) in its `*Needs:*` lines 863 and 3142, so the edge in this direction closes a cycle.

Repair: delete row 36. Add a `## Downstream consumers` section naming LocallyAnalyticDistributions §4.16 (geometric slope comparison, Fredholm windows, finite-slope complexes), AdicSpacesPartII R0.9 and R1, AdicSpacesPartIII R3.1–R3.7 and AdicSpacesPartIV F1.1 and R5.7 as consumers, and move the consumer wording of rows 33–35 there. In §7.2 keep "LAD owns the geometric comparison, functoriality and uniqueness" as a scope statement and make the Sources line "[Urban] §2.3" alone. No statement of §7.2 uses a LocallyAnalyticDistributions result, so no target moves.

## R02 (P2) — §7.2 claims a consumer that does not exist

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 597–598, "CompactOperators consumes this interface for its Riesz summands"; line 608, "Sources: [Urban] §2.3; LAD §4.16; CompactOperators Layer 3".

Claim: CompactOperators builds its Riesz summands on `IsSlopeDecomposition`.

Witness: `TauCetiRoadmap/CompactOperators/README.md` on main (`3b51055`) contains no occurrence of "RigidAnalyticGeometry" (`grep -c` gives 0); its Riesz projector (§3.1, line 615 onward) is built from the differentiated resolvent and the Fredholm determinant (`p=(Cb)^h`, `E=1−p`, convention 7 at line 120), with no slope-decomposition input. Line 608 names CompactOperators Layer 3 as this section's source while line 597 names it as its consumer.

Repair: replace the clause with "§7.2 is independent of CompactOperators' Riesz projectors (CompactOperators §3.1), which are built from its resolvent; neither construction uses the other", and delete "CompactOperators Layer 3" from the Sources line.

## R03 (P3) — Gate: `Suggested.lean` has no `import Mathlib` and 14 `Mathlib.<submodule>` imports

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 1–16.

Claim: the header lists the two `TauCeti.*` modules first and 14 individual Mathlib modules.

Witness: gate checks `imports`, `mathlib-subimports` (14 lines) and `no-import-mathlib` fail at this head, and the targeted build emits 14 "designed for use with the module system" warnings, one per Mathlib submodule import.

Repair: make the header `import Mathlib`, `import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic`, `import TauCeti.RingTheory.Huber.PowerBounded`, nothing else. Re-tested at this head: a scratch copy with exactly that header and the rest of the file unchanged elaborates under `lake env lean` with 21 `declaration uses 'sorry'` warnings and nothing else, the same as the file as it stands.

## R04 (P3) — Pull-request numbers and fork links in the supplier table

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 29–36 (seven `PR #…` citations) and lines 852–854 (links to a personal fork at fixed commits).

Claim: suppliers are cited by pull-request number and by fork URL.

Witness: gate `prnum` lists lines 29, 30, 31, 33, 34, 35, 36; RestrictedPowerSeries, PadicFunctionalAnalysis, CompactOperators, AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartIV are all roadmaps on main at `3b51055`.

Repair: cite each by roadmap name and section ("RestrictedPowerSeries §§2.4, 4–6", "AdicSpacesPartII R0.3–R0.5 and R1.7", …), link to `../<Name>/README.md`, and drop the three fork references at lines 852–854 (keep line 855, which is provenance).

## R05 (P3) — Locator: the completed tensor target is in Part II R0.5, not R0.3

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 261, "tensor construction from Part II R0.3, *completed-tensor-banach-module*".

Claim: *completed-tensor-banach-module* lives in AdicSpacesPartII R0.3.

Witness: `TauCetiRoadmap/AdicSpacesPartII/README.md` on main states *completed-tensor-banach-module* at line 2789, inside "### R0.5 completed tensor products of Banach modules" (line 2759); "### R0.3 the completed tensor product" (line 1769) is the ring-level construction.

Repair: write "Part II R0.5, *completed-tensor-banach-module*" at line 261; line 240's "Part II R0.3's completed tensor product" for the ring-level pushout is correct and stays.

## R06 (P3) — Backticked Lean names of this roadmap that `Suggested.lean` does not declare

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 196 (`isClosedEmbedding_of_finite_injective`), lines 39–40 (`Sp`, `RigidSpace`, `rigidToAdic`), line 488 (`RigidSpace K`), line 563 (`rigidToAdic`).

Claim: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

Witness: none of these names occurs in `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`; AdicSpacesPartII cites the closed-embedding theorem by this name at its lines 343 and 4100 ("Supplied by RigidAnalyticGeometry §1.2 and §1.1 (`isClosedEmbedding_of_finite_injective`)").

Repair: declare the closed-embedding theorem, which is statable at the pins: for `[NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A]`, the same for `B`, `IsAffinoidAlgebra K A`, `IsAffinoidAlgebra K B`, `φ : A →ₐ[K] B` injective with `Module.Finite A B` through `φ.toRingHom.toAlgebra`, conclude `IsClosedEmbedding φ`. Write the geometric names (`Sp`, `RigidSpace`, `rigidToAdic`) in prose until a carrier exists at the pins.

## R07 (P3) — Stale pin sentence

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 111, "The prototype uses Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`."

Claim: the file is written against those commits.

Witness: `lake-manifest.json` at this head pins Tau Ceti `358314d4` and Mathlib `f6090c70`; the sentence is process narrative that is already wrong.

Repair: delete the sentence; the rest of the paragraph (import the native Tate algebra, use `MvPowerSeries.norm_eq_gaussNorm`) stands.

## R08 (P3) — Padding in `Suggested.lean`

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 53–59 (`gaussNorm`, `gaussNorm_eq_norm`), 136–138 (`supSeminorm_eq_zero_of_subsingleton`), 243–251 (`scalarImage`, `stable_filtration_cofinal`).

Claim: each is a headline statement.

Witness: `gaussNorm` re-spells the pinned `MvPowerSeries.gaussNorm` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:57`) and its theorem is one library lemma (`MvPowerSeries.norm_eq_gaussNorm`, already its proof). `supSeminorm_eq_zero_of_subsingleton` is the zero-ring boundary case and closed in the previous probe with `IsEmpty (MaximalSpectrum A)` plus `Real.iSup_of_isEmpty`. `stable_filtration_cofinal` quantifies over an arbitrary ring, module and filtration with no roadmap object; its own docstring says it "only states an algebraic implication".

Repair: delete the five declarations; in `IsPresentationRing` replace `gaussNorm K t ≤ 1` by `‖t‖ ≤ 1`. The README keeps the zero-algebra convention (Convention 4) and the §7.5 filtration statements.

## R09 (P3) — Module docstring does not name the unstatable headlines

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 18–35.

Claim: the docstring calls the file "representative interfaces" and says the geometric constructions are "specified in the README with their owners".

Witness: the form requires the docstring to say which headline theorems are not statable at the pins and what each lacks; Tate acyclicity (Layer 5), Kiehl's proper mapping theorem (§7.4), the quasi-Stein theorem (§7.3), the rigid–adic equivalence (§8.3) and proper GAGA (§8.4) are headlines of this roadmap and none is named.

Repair: rewrite the docstring as "Rigid analytic geometry: target signatures", stating that the roadmap is README.md, that this file states the headline theorems against the pinned Mathlib and Tau Ceti, and listing the five theorems above with the missing carrier for each (a G-topologised `Sp A` with its structure sheaf, rigid spaces and coherent sheaves on them, the rigid–adic functor).

## R10 (P3) — Sections without Checks

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` §2.1 (lines 297–316), §6.1 (464–477), §7.3 (617–638), §7.4 (640–656).

Claim: every definition has at least three discriminating Checks.

Witness: a scan of the `###` sections at this head finds exactly these four content sections with no `**Checks.**` list (18 of the 22 numbered sections have one); they define the evaluation norms, G-topologies and their sites, quasi-Stein exhaustions and the base-change maps.

Repair: add a `**Checks.**` list to each. §2.1: on `K⟨T⟩` the supremum seminorm is the Gauss norm; on `K×K` the element `(1,0)` has supremum 1 and is not nilpotent; the root `T` of `T²−p` in `ℚ_p⟨T⟩/(T²−p)` has supremum `p^(−1/2)`. §6.1: the open-set site of a topological space; the non-admissible cover of the closed disc by the open disc and the unit circle; the G₀–G₂ completion of the weak affinoid topology on the disc. §7.3: the open unit disc as a quasi-Stein space with `H¹(𝒪)=0`; `Sp A` with its identity cover; the node `y²=x²(x+1)` where the identity principle fails for a branch. §7.4: base change of `H¹(ℙ¹,𝒪(−2))=K` along a finite extension `L/K`; a rational subdomain of the base; the zero sheaf.

## R11 (P3) — Reference links to third-party copies of paywalled texts

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 808–811 (Bosch, "Author text" at a Purdue seminar page), 822–827 (Huber papers at a Stanford seminar page).

Claim: these are author texts or papers at legal hosts.

Witness: the Purdue file is the Springer edition of LNM 2105, not an author preprint; the Stanford files are scans of the Math. Z. articles on a seminar reading page, not the author's page or an institutional repository.

Repair: cite Bosch by publisher and DOI without a link, or link Bosch's own 2005 Münster preprint and say that its numbering is used; cite the Huber papers by journal, volume and pages, and link the GDZ digitisation of Mathematische Zeitschrift, where the articles are available.

## Previous findings

- R01 — not repaired: line 36 still reads "LocallyAnalyticDistributions, PR #854, §§4.2, 4.16 | The `C₀` tensor comparison, geometric slope tests, Fredholm-window existence and finite-slope complexes"; the dependency check prints the same UPWARD line.
- R02 — not repaired: lines 597–598 still read "CompactOperators consumes this interface for its Riesz summands"; line 608 still lists "CompactOperators Layer 3" as a source.
- R03 — not repaired: lines 1–16 are the two `TauCeti.*` imports followed by 14 `Mathlib.<submodule>` imports; no `import Mathlib`.
- R04 — not repaired: lines 29–36 carry the seven `PR #…` citations; lines 852–854 the fork links.
- R05 — not repaired: line 261 still reads "tensor construction from Part II R0.3, *completed-tensor-banach-module*".
- R06 — not repaired: `isClosedEmbedding_of_finite_injective` (line 196), `Sp`, `RigidSpace`, `rigidToAdic` (lines 39–40, 488, 563) are still backticked and still absent from `Suggested.lean`.
- R07 — not repaired: line 111 still reads "The prototype uses Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`."
- R08 — not repaired: `gaussNorm`, `gaussNorm_eq_norm`, `supSeminorm_eq_zero_of_subsingleton`, `scalarImage`, `stable_filtration_cofinal` are still at lines 53–59, 136–138, 243–251.
- R09 — not repaired: the docstring at lines 18–35 still opens "Rigid analytic geometry: representative interfaces" and names no unstatable headline.
- R10 — not repaired: §2.1, §6.1, §7.3 and §7.4 still have no `**Checks.**` list.
- R11 — not repaired: lines 810 and 824–827 still link the Purdue and Stanford seminar copies.

## Verified sound

**Change set.** `git diff --stat 4aa8b0b..HEAD -- TauCetiRoadmap/RigidAnalyticGeometry` is empty; against `origin/main` the folder differs by the same 4 README lines (§7.2's CompactOperators sentence) the previous review read. `git diff --stat origin/main...HEAD` outside this folder and the thirteen folders the brief names as the pull request's own is empty. The three folders changed since 4aa8b0b (BordismFormalGroups, ClassifyingSpaces, TopologicalKTheory) contain no occurrence of "RigidAnalyticGeometry", so nothing this roadmap relies on moved.

**Gate and dependency check at this head.** `set_option=0 blob=0 latex=0 tex=0 prnum=7 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=14 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=14 FAIL` (R01, R03, R04). The dependency check I ran prints:

```
UPWARD: RigidAnalyticGeometry (on main) -> LocallyAnalyticDistributions (#64) at README lines [36]
depcheck: 236 roadmaps, 2239 edges, 1 problem(s)
```

LocallyAnalyticDistributions is line 65 of `ORDER.txt` and has no folder on main at `3b51055`.

**Elaboration.** `lake env lean` on `Suggested.lean` at this head: 21 `declaration uses 'sorry'` warnings (22 `theorem`s, `gaussNorm_eq_norm` proved) plus the 14 module-system import warnings; nothing else. The repaired header of R03 (scratch copy, `import Mathlib` plus the two `TauCeti.*` lines, rest unchanged) elaborates with the same 21 `sorry` warnings only. The file has no `set_option`, no `lemma`, no `#eval`, no sorried data. The worker's 33 elaborated signatures are those of the previous review (the file is unchanged); the 11 "dropped binder" leads are the `def`/`abbrev`s and the one proved theorem that drop only `[CompleteSpace K]`/`[IsUltrametricDist K]`, which their bodies do not use; every sorried theorem keeps `[CompleteSpace K]` and its own hypotheses.

**Library declarations opened at the pins** (unchanged pins): `MvPowerSeries.gaussNorm` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:57`), `MvPowerSeries.IsRestricted.subring` (`Restricted.lean:107`), `spectralNorm` (`Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381`), `Ideal.height` (`Mathlib/RingTheory/Ideal/Height.lean:35`), `Submodule.projectionOnto` (`Mathlib/LinearAlgebra/Projection.lean:125`), `TauCeti.Huber.IsPowerBounded` (`TauCeti/RingTheory/Huber/PowerBounded.lean:117`). The citation lead `Ring.IsJapanese` (README line 32) is SchemeAndStackFoundations' own name (its §0.20, line 1305 on main) and occurs nowhere in the pinned Mathlib or Tau Ceti, as expected for a supplier-roadmap name: not a finding.

**Cross-roadmap citations resolved on main `3b51055`.** AdicSpacesPartII R0.3 (line 1769), R0.5 (2759, *completed-tensor-banach-module* at 2789), R0.9 (4071; lines 343 and 4100 cite this roadmap's `isClosedEmbedding_of_finite_injective` and `IsAffinoidAlgebra`); CompactOperators §3.1 (615) with no citation of this roadmap; SchemeAndStackFoundations §0.20 (1305). LocallyAnalyticDistributions at its open head consumes `IsSlopeLE`, `IsSlopeDecomposition`, `IsSlopeDecomposition.exists_projection` (its lines 254, 861–863, 878, 3111–3113, 3142). Ownership of the slope interface: `roadmaps grep --fixed IsSlopeDecomposition` finds it declared only here (main) and cited by LocallyAnalyticDistributions and by this pull request's own folders, so this roadmap remains the owner.

**Sources re-opened at their locators** (seeded sample; manifest ids, line numbers in the cache texts). Conrad: Theorem 1.1.1 (line 156), Theorem 1.1.3 (201), Lemma 1.1.5 (274), Lemma 2.1.5 (570). HuberCV: Theorem 4.1 (775), Corollaries 4.2–4.3 (818, 823). HuberFR: Proposition 4.5 (1436). KiehlE: Satz 1.2 (328), Satz 1.4 (372), Theorem 3.4 (647), Satz 5.1 (878). KiehlAB: Definition 2.3 (601), Satz 2.4 (615). Urban: 2.3.1 (869), Corollary 2.3.3 (900), 2.3.6 (938). FK: Proposition B.1.3 (10032). Each is at the line the previous review recorded and supports the statement as written there; the sampled sections §§0.1, 0.2, 1.1, 1.2, 1.5, 2.1, 2.3, 6.1, 7.1–7.5, 8.1, 8.2 are unchanged, so the previous review's locator verdicts carry forward.

**Adversarial table.** Every statement is untouched since 4aa8b0b; each row carries the values of the review at 4aa8b0b.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 / `weightedTate_isAffinoid_iff` (review at 4aa8b0b) | `n=0`; `ρ=p^(−1/2)` over `ℚ_p`; `ρ` outside `p^ℚ` | `n=0`: carrier is `K`, affinoid, right side vacuous. `ρ=p^(−1/2)`: `m=2, c=p`, `ρ²=|p|`. `ρ∉p^ℚ`: `|X|sup=ρ`, `ρ^m∉|K|` for all `m`, contradicting `exists_uniform_valueGroup_exponent` | holds both ways | none |
| `IsStrictRadius` (4aa8b0b) | `r=1`, `r=p^(−1/2)`, `r=0` | `1=‖1‖`, `m=1`; `(p^(−1/2))²=‖p‖`; `r=0` excluded by `0<r` | matches `√|K×|` | none |
| §1.1 Check `K×K` (4aa8b0b) | `𝔪₁=0×K` | `𝔪₁ⁿ=0×K`, intersection `0×K≠0`; `(0×K)∩(K×0)=0` | as stated | none |
| §1.2 / `height_eq_ringKrullDim_of_isDomain` (4aa8b0b) | `K⟨T⟩×K`; cusp; `T²−p` | `K⟨T⟩×0` height 0 in dimension 1 (non-domain, excluded); cusp dim 1, all maximal ideals height 1; residue field `ℚ_p(√p)`, `|T(x)|=p^(−1/2)` | Conrad 2.1.5 | none |
| `finite_residue` (4aa8b0b) | zero ring | `MaximalSpectrum 0` empty | holds | none |
| §2.1 / `supSeminorm_pow` (4aa8b0b) | zero ring, `n=0`, `n=1` | zero ring `0=0`; `n=0`: `|1|sup=0≠1=|f|sup⁰`, so `0<n` needed and present | holds | none |
| `supSeminorm_eq_zero_iff` (4aa8b0b) | zero ring; `K⟨T⟩/(T²)`, `f=T` | `0=0 ↔ IsNilpotent 0`; `|T|sup=0`, `T²=0` | holds | none |
| §2.2 / `exists_uniform_valueGroup_exponent` (4aa8b0b) | `f` nilpotent; `A=0`; `ℚ_p⟨T⟩/(T²−p)`, `f=T` | `c=0`; `c=0`; `|T|sup=p^(−1/2)`, `m=2`, `c=p` | BGR 6.2.1/4 (uncertified) | none |
| §2.2 annulus Check (4aa8b0b) | `K⟨X,Y⟩/(XY−c)`, `0<|c|<1` | `|X|sup=|Y|sup=1`, `|XY|sup=|c|`; `Ã=K̃[X,Y]/(XY)` not a domain | consistent | none |
| §2.2 `K[ε]/(ε²)` (4aa8b0b) | multiplicativity vs norm | `|a+bε|sup=|a|`, `|ε|sup=0` | consistent | none |
| `powerBounded_iff`, `topologicallyNilpotent_iff` (4aa8b0b) | zero ring; `p`, `T` in `ℚ_p⟨T⟩` | `0≤1`, `0<1`; `|p|<1`, `pⁿ→0`; `|T|sup=1`, `Tⁿ` bounded, not `→0` | holds | none |
| `banachFunctionAlgebra` (4aa8b0b) | zero ring; `K⟨T⟩` | `C=1`, `0≤0≤0`; `|f|sup=‖f‖` | holds | none |
| `mem_iff_supSeminorm_le_one_of_isReduced` (4aa8b0b) | `ℤ_p⊂ℚ_p`, `ϖ=p`; `ϖ=p²`; `π(ℤ_p⟨T,S⟩)⊂ℚ_p⟨T,S⟩/(S²−p²T)`; `ℚ_p[ε]/(ε²)` | `𝔽_p` reduced, `ℤ_p={|f|≤1}`; `ℤ/p²` nonreduced, hypothesis fails; `S/p∉B`, `B/pB` nonreduced, hypothesis fails; nonreduced `A` admits no such `B` | holds | none |
| `integral_iff_supSeminorm_le_one` (4aa8b0b) | `ℚ_p⟨T⟩/(T²−p)`, `S=π(ℤ_p⟨T⟩)`, `a=T` | `T²=p∈S`; `|T|sup=p^(−1/2)≤1` | holds (BGR 6.3.4/1, uncertified) | none |
| `exists_fg_smul_le_of_presentation` (4aa8b0b) | `N=0`; `M=𝒪_{ℂ_p}`, `N=𝔪`, `ε<|x|<1` | `N'=0`; `N'=x𝒪`, `a𝔪⊆x𝒪` for `|a|≤ε` | Kiehl Satz 5.1 | none |
| `isNoetherian_of_presentation_of_discrete` (4aa8b0b) | `ℚ_p`; `ℂ_p` | `ρ=|p|`; `ℂ_p`: no `ρ<1`, `𝒪_{ℂ_p}` not noetherian | hypothesis is discreteness | none |
| `IsSlopeLE` (4aa8b0b) | `Q=0`; `Q=1`; `X−c`, `|c|<1=r`; `1−cT` | `0`: root `0`, fails; `1`: no roots, holds; `X−c`: `|c|<r`, fails; `1−cT`: root `1/c`, `|1/c|>1≥r`, passes | matches §7.2 Checks | none |
| §7.2 convention vs Urban (4aa8b0b) | `r=|p|^h`, monic annihilator | `Q*` roots `1/λ` of valuation `≤h` iff `|λ|≥|p|^h=r` | direction agrees | none |
| §7.2 LAD coefficient test (4aa8b0b) | `Q=∏(X−λᵢ)`, `|λᵢ|≥r` | `|aⱼ/a₀|=|e_j(1/λ)|≤r^(−j)` | consistent | none |
| `IsSlopeDecomposition` wrong models (4aa8b0b) | `M₁=0`; `|λ|≥r` eigenvector in `M₂`; `|μ|<r` eigenvector in `M₁` | `Q=1`; `X−λ` not bijective on `M₂`, excluded; annihilator root `μ` fails `IsSlopeLE`, excluded | summands determined (Urban 2.3.3) | none |
| `exists_projection` (4aa8b0b) | `M₁=0`; `M₂=0` | `P=0`; `P=id` | holds | none |
| §7.1 Checks (4aa8b0b) | `h:ΣaₙTⁿ↦ΣaₙϖⁿTⁿ`; `K²` | tail bound `|ϖ|^N`; `id−h` image `TK⟨T⟩`, cokernel `K`; `det=1−δδ'≠0`; `f=e=id` gives `0` | as stated | none |
| §7.5 / `stable_filtration_cofinal` (4aa8b0b) | `a=0`; `a=1`; degree 0 | `R₀=Mⁱ`, `Rₙ=0`; `Rₙ=Mⁱ`; `Rₙ=aⁿM`; `F(n+d)=aⁿF(d)⊆aⁿM` | true, free-variable algebra | R08 |
| §6.2 / §6.3 Checks (4aa8b0b) | disc + circle; `|T|ⁿ≤|ϖ|`; unit disc in itself; finite affinoid | not admissible; radii `|ϖ|^(1/n)→1`; `K⟨T⟩` not finite over `K`, not inner; rescaled generators, inner | as stated | none |
| §8.2 Check (4aa8b0b) | rank-two point below the Gauss point | `v(T)<1`, `v(T)ⁿ>|ϖ|` for all `n` | as stated; HuberCV 4.1–4.3 | none |
| §8.3 (4aa8b0b) | affinoid iff; gluing | HuberFR 4.5(v); two discs along the open disc non-quasi-separated | as stated | none |
| §1.3 `A_L⊗_A M ≃ M⊗̂_K L` (4aa8b0b) | `M=A`, `L=K`, `M=A/(T)` | both sides `A_L`, `A`, `L` | Conrad 1.1.5(1) | none |
| §0.1 Checks (4aa8b0b) | `p+T²`, `p+T+pT²` over `ℚ_p` | Gauss norm 1; values `1` at `T=1`, `|p|` at `0`; reduction `T` | as stated | none |

**Policy checks.** No `set_option`, no sorried data, no `lemma`, no `#eval`; `theorem` throughout; `STATUS.md`/`PROGRESS.md` are the repository's generated status files; `metadata.toml` is `math.AG`; no change outside the pull request's own folders.

## Not verifiable

- **[BGR]** (Springer, paywalled; recorded `uncertified`): every BGR locator in the README is cited by locator only; the uniform exponent of §2.2 and the integral-closure statement of §2.3 rest on the locator, not on the text.
- **[Bosch]** §§6.3–6.4: the README's link is the Springer edition on a third-party page (R11); not relied on.
- **[Kiehl-E]**, **[Kiehl-AB]**: GDZ scans recognised by OCR; the statements at the lines above are legible, some proof lines are garbled.
- **[Huber-CV]**, **[Huber-FR]**: read from the cache texts fetched from the README's own links on a seminar page (R11); the GDZ digitisation of Mathematische Zeitschrift is the legal copy to link.
- Ownership against open pull requests was checked through `roadmaps grep` for the slope interface only; the geometric objects (`Sp`, `RigidSpace`, `rigidToAdic`) are owned here by the Scope section and consumed by AdicSpacesPartII R0.9/R1.7 by name.

## Source issues

- none
