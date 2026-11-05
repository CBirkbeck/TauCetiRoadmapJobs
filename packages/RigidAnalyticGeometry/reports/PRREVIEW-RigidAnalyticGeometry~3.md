# Review of RigidAnalyticGeometry (pull request #1807 at 4aa8b0b)

**Verdict:** needs changes

This pull request changes four lines of `TauCetiRoadmap/RigidAnalyticGeometry/README.md` (the CompactOperators sentence in §7.2); the rest of the folder is as on main. The brief asks for a full review, so the findings below cover the whole folder, and most of them pre-date this pull request. The gate fails on this head (`imports`, `mathlib-subimports`, `no-import-mathlib`, `prnum`, `depcheck`, and the 14 build warnings that the submodule imports produce), so there is no acceptance until R01, R03 and R04 are repaired.

## R01 (P2) — Upward supplier: LocallyAnalyticDistributions in the supplier table

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 36, "LocallyAnalyticDistributions, PR #854, §§4.2, 4.16 | The `C₀` tensor comparison, geometric slope tests, Fredholm-window existence and finite-slope complexes"; also lines 604–608 ("LAD §4.16 owns … Sources: [Urban] §2.3; LAD §4.16; CompactOperators Layer 3").

Claim: the row says these LAD results are "used here", which makes LocallyAnalyticDistributions a supplier of this roadmap.

Witness: the dependency check on this head prints `UPWARD: RigidAnalyticGeometry (on main) -> LocallyAnalyticDistributions (#64) at README lines [36]`; LocallyAnalyticDistributions is not on main and sits at position 65 of the merge order, while this roadmap is on main. LocallyAnalyticDistributions §4.16 (open head) consumes this roadmap's §7.2 (`IsSlopeDecomposition`, `exists_projection`) in its own `*Needs:*` lines, so the edge in this direction is a cycle.

Repair: delete row 36. Add a `## Downstream consumers` section that names LocallyAnalyticDistributions §4.16 (the geometric slope comparison, Fredholm windows and finite-slope complexes), AdicSpacesPartII R0.9 and R1, AdicSpacesPartIII R3.1–R3.7 and AdicSpacesPartIV F1.1 and R5.7 as consumers, and move the consumer wording of rows 33–35 ("This roadmap supplies … to R0.9 and R1", "Consumers of strict-polyradius affinoidness …") there. In §7.2 keep "LAD owns the geometric comparison, functoriality and uniqueness" as a scope statement, and change the Sources line to "[Urban] §2.3" alone. Nothing in §7.2's statements uses an LAD result, so no target moves.

## R02 (P2) — The rewritten sentence claims a consumer that does not exist

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 597–598, "CompactOperators consumes this interface for its Riesz summands"; line 608, "Sources: [Urban] §2.3; LAD §4.16; CompactOperators Layer 3".

Claim: CompactOperators builds its Riesz summands on `IsSlopeDecomposition`.

Witness: `TauCetiRoadmap/CompactOperators/README.md` on main contains no occurrence of "RigidAnalyticGeometry"; its Riesz projector (§3.1, lines 615–640) is constructed from the differentiated resolvent and the Fredholm determinant (`p=(Cb)^h`, `E=1−p`), with no slope-decomposition input. After this change §7.2 names CompactOperators Layer 3 both as its consumer and, on line 608, as its source.

Repair: replace the clause with "§7.2 is independent of CompactOperators' Riesz projectors (CompactOperators §3.1), which are built from its resolvent; neither construction uses the other", and delete "CompactOperators Layer 3" from the Sources line (the comparison of the two projectors, if wanted, is an LAD §4.16 matter and belongs in the Downstream consumers section of R01).

## R03 (P3) — Gate: `Suggested.lean` has no `import Mathlib` and 14 `Mathlib.<submodule>` imports

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 1–16.

Claim: the header lists `TauCeti.*` first and 14 individual Mathlib modules.

Witness: gate checks `imports`, `mathlib-subimports` (14 lines) and `no-import-mathlib` fail, and the build emits 14 "designed for use with the module system" warnings, one per Mathlib submodule import.

Repair: make the header `import Mathlib`, then `import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic` and `import TauCeti.RingTheory.Huber.PowerBounded`. Tested: a copy of the file with exactly this header elaborates under `lake env lean` with `sorry` as the only warning (see Verified sound).

## R04 (P3) — Pull-request numbers and fork links in the supplier table

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 29–36 (seven `PR #…` citations) and lines 852–854 (links to a personal fork at fixed commits).

Claim: suppliers are cited by pull-request number and by fork URL.

Witness: gate `prnum` lists lines 29, 30, 31, 33, 34, 35, 36; RestrictedPowerSeries, PadicFunctionalAnalysis, CompactOperators, AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartIV are all roadmaps on main.

Repair: cite each by roadmap name and section ("RestrictedPowerSeries §§2.4, 4–6", "AdicSpacesPartII R0.3–R0.5 and R1.7", …), link to `../<Name>/README.md`, and drop the three fork references at lines 852–854 (keep the PhD-sources line 855, which is provenance).

## R05 (P3) — Locator: the completed tensor target is in Part II R0.5, not R0.3

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 261, "tensor construction from Part II R0.3, *completed-tensor-banach-module*".

Claim: the target *completed-tensor-banach-module* lives in AdicSpacesPartII R0.3.

Witness: `TauCetiRoadmap/AdicSpacesPartII/README.md` on main states *completed-tensor-banach-module* at line 2789, inside "### R0.5 completed tensor products of Banach modules" (line 2759); R0.3 (line 1769) is the completed tensor product of Huber rings.

Repair: write "Part II R0.5, *completed-tensor-banach-module*" at line 261 (line 240's "Part II R0.3's completed tensor product" for the ring-level pushout is correct and stays).

## R06 (P3) — Backticked Lean names of this roadmap that `Suggested.lean` does not declare

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 196 (`isClosedEmbedding_of_finite_injective`), lines 39–40 (`Sp`, `RigidSpace`, `rigidToAdic`), line 488 (`RigidSpace K`), line 563 (`rigidToAdic`).

Claim: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

Witness: `grep -n isClosedEmbedding_of_finite_injective\|RigidSpace\|rigidToAdic TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` returns nothing; AdicSpacesPartII R0.9 cites the closed-embedding theorem by this name ("Supplied by RigidAnalyticGeometry §1.2 and §1.1 (`isClosedEmbedding_of_finite_injective`)").

Repair: declare the closed-embedding theorem, which is statable at the pins: for `[NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A]`, the same for `B`, `IsAffinoidAlgebra K A`, `IsAffinoidAlgebra K B`, `φ : A →ₐ[K] B` injective with `Module.Finite A B` through `φ.toRingHom.toAlgebra`, conclude `IsClosedEmbedding φ`. Write the geometric names (`Sp`, `RigidSpace`, `rigidToAdic`) in prose until a carrier exists at the pins.

## R07 (P3) — Stale pin sentence

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 111, "The prototype uses Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`."

Claim: the file is written against those commits.

Witness: `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; the sentence is process narrative that is already wrong.

Repair: delete the sentence; the rest of the paragraph (import the native Tate algebra, use `MvPowerSeries.norm_eq_gaussNorm`) stands.

## R08 (P3) — Padding in `Suggested.lean`

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 53–59 (`gaussNorm`, `gaussNorm_eq_norm`), 136–138 (`supSeminorm_eq_zero_of_subsingleton`), 243–251 (`scalarImage`, `stable_filtration_cofinal`).

Claim: each is a headline statement.

Witness: `gaussNorm` re-spells the pinned `MvPowerSeries.gaussNorm` (`Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean:57`) and the theorem is one library lemma. `supSeminorm_eq_zero_of_subsingleton` is the zero-ring boundary case and closed in the probe with `IsEmpty (MaximalSpectrum A)` plus `Real.iSup_of_isEmpty`. `stable_filtration_cofinal` quantifies over an arbitrary ring, module and filtration with no roadmap object; its own docstring says it "only states an algebraic implication".

Repair: delete the five declarations; in `IsPresentationRing` replace `gaussNorm K t ≤ 1` by `‖t‖ ≤ 1`. The README keeps the zero-algebra convention (Convention 4) and the §7.5 filtration statements.

## R09 (P3) — Module docstring does not name the unstatable headlines

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 18–35.

Claim: the docstring calls the file "representative interfaces" and says the geometric constructions are "specified in the README with their owners".

Witness: the form requires the docstring to say which headline theorems are not statable at the pins and what each lacks; Tate acyclicity (Layer 5), Kiehl's proper mapping theorem (§7.4), the quasi-Stein theorem (§7.3), the rigid–adic equivalence (§8.3) and proper GAGA (§8.4) are headlines of this roadmap, and none is named.

Repair: rewrite the docstring as "Rigid analytic geometry: target signatures", stating that the roadmap is README.md, that this file states the headline theorems against the pinned Mathlib and Tau Ceti, and listing the five theorems above with the missing carrier for each (a G-topologised `Sp A` with its structure sheaf, rigid spaces and coherent sheaves on them, the rigid–adic functor).

## R10 (P3) — Sections without Checks

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` §2.1 (lines 297–316), §6.1 (464–477), §7.3 (617–638), §7.4 (640–656).

Claim: every definition has at least three discriminating Checks.

Witness: these four sections define the evaluation norms, G-topologies and their sites, quasi-Stein exhaustions and the base-change maps, and carry no `**Checks.**` list; every other section does.

Repair: add a `**Checks.**` list to each. For §2.1: on `K⟨T⟩` the supremum seminorm is the Gauss norm; on `K×K` the element `(1,0)` has supremum 1 and is not nilpotent; the root `T` of `T²−p` in `ℚ_p⟨T⟩/(T²−p)` has supremum `p^(−1/2)`, equal to the coefficient bound. For §6.1: the open-set site of a topological space; the non-admissible cover of the closed disc by the open disc and the unit circle; the G₀–G₂ completion of the weak affinoid topology on the disc. For §7.3: the open unit disc as a quasi-Stein space with `H¹(𝒪)=0`; `Sp A` with its identity cover; the node `y²=x²(x+1)` as a non-normal space where the identity principle fails for a branch. For §7.4: base change of `H¹(ℙ¹,𝒪(−2))=K` along a finite extension `L/K`; a rational subdomain of the base; a zero sheaf.

## R11 (P3) — Reference links to third-party copies of paywalled texts

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 808–811 (Bosch, "Author text" at a Purdue seminar page), 822–827 (Huber papers at a Stanford seminar page).

Claim: these are author texts or papers at legal hosts.

Witness: the Purdue file is the Springer edition of LNM 2105 (its title pages carry the Springer ISBN 978-3-319-04417-0), not an author preprint; the Stanford files are scans of the Math. Z. articles on a seminar reading page, not the author's page or an institutional repository.

Repair: cite Bosch by publisher and DOI without a link, or link Bosch's own 2005 Münster preprint and say that its numbering is used; cite the Huber papers by journal, volume and pages, and link the GDZ digitisation of Mathematische Zeitschrift, which lists 223 volumes, where the articles are available.

## Verified sound

**Gate and dependency check.** Gate at this head: `set_option=0 blob=0 latex=0 … prnum=7 … imports=1 mathlib-subimports=14 no-import-mathlib=1 … depcheck=1 … build=14 FAIL` (R01, R03, R04). The dependency check I ran prints:

```
UPWARD: RigidAnalyticGeometry (on main) -> LocallyAnalyticDistributions (#64) at README lines [36]
depcheck: 236 roadmaps, 2186 edges, 1 problem(s)
```

The same check on AdicSpacesPartII, AdicSpacesPartIII, AdicSpacesPartIV and RestrictedPowerSeries reports 0 problems; AdicSpacesPartII R0.3–R0.5 (lines 1769–3085), the sections this roadmap consumes, contain no citation of RigidAnalyticGeometry, so the mutual citations with Part II are acyclic at the layer level (Part II R0.9 and R1 consume Layers 1–2 and 8 here).

**Elaboration.** `lake env lean` on `Suggested.lean`: 21 `declaration uses 'sorry'` warnings, nothing else. The repaired header of R03 (`import Mathlib` plus the two `TauCeti.*` lines, rest unchanged) elaborates with the same warnings only. I compared the 33 elaborated signatures in the worker's listing with the README: the 11 "dropped binder" leads are all `def`/`abbrev` (`weightedTate`, `TateAlgebra`, `gaussNorm`, `IsAffinoidAlgebra`, `IsStrictRadius`, `pointNorm`, `supSeminorm`, `IsPresentationRing`, `IsSlopeLE`, `IsSlopeDecomposition`) or the proved `gaussNorm_eq_norm`; each drops only `[CompleteSpace K]`/`[IsUltrametricDist K]`, which their bodies do not use. Every sorried theorem keeps `[CompleteSpace K]` and its own hypotheses; no theorem lost a binder.

**One-tactic probe** (copy in scratch): `supSeminorm_eq_zero_of_subsingleton` closes (R08); `stable_filtration_cofinal` is a routine induction, not one tactic, and is padding by the free-variable rule (R08); `isNoetherianRing` follows from the pinned `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Noetherian.lean:101`) and Mathlib's `isNoetherianRing_of_surjective` in three steps; I left it in place.

**Library declarations opened at the pins.** `MvPowerSeries.IsRestricted.subring` (`Mathlib/RingTheory/MvPowerSeries/Restricted.lean:107`), `MvPowerSeries.gaussNorm` (`GaussNorm.lean:57`), `spectralValue` and `spectralNorm` (`Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:115, 381`; `spectralNorm_zero` at 419), `Ideal.height` (`Mathlib/RingTheory/Ideal/Height.lean:35`), `Submodule.projectionOnto` (`Mathlib/LinearAlgebra/Projection.lean:125`), `TauCeti.Huber.IsPowerBounded` (`TauCeti/RingTheory/Huber/PowerBounded.lean:117`). No `IsAffinoidAlgebra`, `supSeminorm`, `pointNorm` or `GTopology` exists in Tau Ceti at pin `358314d4` (no `RingTheory/Affinoid` or `Topology/GTopology` directory), so the file duplicates nothing at the pins; `Ring.IsJapanese` (line 32) is SchemeAndStackFoundations' own name (its §0.20, line 1305), not a missing declaration.

**Cross-roadmap citations resolved on main.** AdicSpacesPartII R0.3 (line 1769), R0.4 (2270), R0.5 (2759), R0.9 (4071, which cites this roadmap's `IsAffinoidAlgebra` as its carrier), R1.7 (9806), R1.9 (10509); AdicSpacesPartIII R3.1–R3.7 (9136–11218) with targets *surjection-small-perturbation* (R3.3, line 9884), *almost-noetherian-integral-affinoid-modules* and *affinoid-completed-field-extension* (R3.6 table rows 602 and 607), *gelfand-spectrum-banach-ring* (R3.9); AdicSpacesPartIV F1.1 (2998, consuming §1.5) and R5.7 (2165); RestrictedPowerSeries §2.4 (364), Layers 4–6 (452–702), §5.4 (587); PadicFunctionalAnalysis §1.2 (343), §2.2 (400), §2.4 (457); CompactOperators Layers 0–3 and `IsCompletelyContinuous` (lines 49, 110, 206); SchemeAndStackFoundations §0.20 Japanese/Nagata and §0.21 excellent rings. LocallyAnalyticDistributions §4.16 at its open head consumes `IsSlopeLE`, `IsSlopeDecomposition`, `exists_projection` (its lines 254, 861–863). Ownership of the slope interface: no other open roadmap declares `IsSlopeDecomposition` (`roadmaps grep`), so this roadmap is the owner.

**Sources read at their locators** (manifest ids; line numbers in the cache texts). Conrad: Theorem 1.1.1 (line 156, Kiehl's rank criterion `ρ(Ω¹_{C_q/T}) ≤ ρ + dim C_q − dim S_p`), Theorem 1.1.3 (201, excellence of `𝒪_{X,x}`), Lemma 1.1.5 (274, faithful flatness of `A → k'⊗̂A` and `A'⊗_A M ≃ A'⊗̂_A M` for finite `M`, no algebraicity of `k'/k`), Lemma 2.1.5 (570, every maximal ideal of an affinoid domain has height `d`), Theorem A.1.3 (1580, reduced/normal/connected/irreducible pass to the analytification). HuberCV: Theorem 4.1 (775, `L_A` is the constructible closure of `Max A` in `Spv A`), Corollary 4.2 (818, density in `Spa(A,A°)`), Corollary 4.3 (823, constructible sets with equal classical traces coincide; §8.2 states this and should cite 4.3 as well). HuberFR: Proposition 4.5(i)–(v) (1436–1447) matches §8.3 clause by clause. FK: Proposition B.1.3 (10032, power-bounded iff `A₀[f]` is a ring of definition). KiehlE (GDZ, OCR): Satz 1.2 (328, Schwartz: closed image and finite cokernel), Lemma 1.3 (333, perturbation of a surjection), Satz 1.4 (372, descent of strict complete continuity for topologically free source), Satz 2.6 and Satz 3.5 (626, 747, base change to an affinoid subdomain), Theorem 3.4 (647, `a`-good filtration `R_k`, kernel and cokernel systems pro-zero), Theorem 3.7 (809, ideal `a=(a₁,…,a_s)`), Satz 5.1 (878, one finite `N'` for all `|a| ≤ ε`; noetherian when `k` is discretely valued). KiehlAB (GDZ, OCR): Definition 2.3 and Satz 2.4 (601, 615, quasi-Stein density, Theorem B, Theorem A). Urban: 2.3.1, Lemma 2.3.2, Corollaries 2.3.3–2.3.5 and 2.3.6 (869–938).

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 / `weightedTate_isAffinoid_iff` | `n=0`; `ρ=p^(−1/2)` over `ℚ_p`; `ρ` outside `p^ℚ` | `n=0`: carrier is `K`, affinoid, right side vacuous. `ρ=p^(−1/2)`: `m=2, c=p`, `ρ²=|p|`. `ρ∉p^ℚ`: `|X|sup=ρ` (maximal ideals are the points of the `ρ`-polydisc), `ρ^m∉|K|` for all `m`, contradicting `exists_uniform_valueGroup_exponent` | holds in both directions | none |
| `IsStrictRadius` | `r=1`, `r=p^(−1/2)`, `r=0` | `1=‖1‖` with `m=1`; `(p^(−1/2))²=‖p‖`; `r=0` excluded by `0<r` | matches `√|K×|` | none |
| §1.1 Check `K×K` | `𝔪₁=0×K` | `𝔪₁ⁿ=0×K` for all `n`, intersection `0×K≠0`; `(0×K)∩(K×0)=0` | as stated | none |
| §1.2 / `height_eq_ringKrullDim_of_isDomain` | `K⟨T⟩×K`; cusp; `T²−p` | `K⟨T⟩×0` has height 0 in a ring of dimension 1 (non-domain, excluded by `[IsDomain A]`); cusp finite over `K⟨X⟩`, dim 1, every maximal ideal height 1; residue field `ℚ_p(√p)`, `|T(x)|=p^(−1/2)` | Conrad 2.1.5 | none |
| `finite_residue` | zero ring | `MaximalSpectrum 0` empty, vacuous | holds | none |
| §2.1 / `supSeminorm_pow` | zero ring, `n=0`, `n=1` | zero ring: `0=0` for `n≥1`; `n=0`: `|1|sup=0` but `|f|sup⁰=1`, so `0<n` is needed and present | holds | none |
| `supSeminorm_eq_zero_iff` | zero ring; `K⟨T⟩/(T²)`, `f=T` | `0=0 ↔ IsNilpotent 0` true; `|T|sup=0`, `T²=0` | holds | none |
| §2.2 / `exists_uniform_valueGroup_exponent` | `f` nilpotent; `A=0`; `A=ℚ_p⟨T⟩/(T²−p)`, `f=T` | `c=0` gives `0=‖0‖`; `A=0`: `c=0`; `|T|sup=p^(−1/2)`, `m=2`, `c=p` | uniform `m` is BGR 6.2.1/4 (uncertified) | none |
| §2.2 annulus Check | `A=K⟨X,Y⟩/(XY−c)`, `0<|c|<1` | points `|x|,|y|≤1`, `xy=c`; `|X|sup=1` at `(1,c)`, `|Y|sup=1`, `|XY|sup=|c|`; `Ã=K̃[X,Y]/(XY)` not a domain, `|X|sup|Y|sup=1≠|c|` | consistent with "multiplicative norm iff reduced and `Ã` domain" | none |
| §2.2 `K[ε]/(ε²)` | multiplicativity vs norm | `|a+bε|sup=|a|` multiplicative, `|ε|sup=0`, not a norm; `Ã=K̃` domain, `A` nonreduced | consistent | none |
| `powerBounded_iff`, `topologicallyNilpotent_iff` | zero ring; `f=p` in `ℚ_p⟨T⟩`; `f=T` | zero ring: all elements power-bounded and `0≤1`, `0<1`; `|p|sup=|p|<1`, `pⁿ→0`; `|T|sup=1`, `Tⁿ` bounded, not `→0` | holds | none |
| `banachFunctionAlgebra` | zero ring; `K⟨T⟩` with Gauss norm | `C=1`, `0≤0≤0`; `|f|sup=‖f‖`, `C=1` | holds | none |
| `mem_iff_supSeminorm_le_one_of_isReduced` | `A=ℚ_p`, `B=ℤ_p`, `ϖ=p`; `ϖ=p²`; `A=ℚ_p⟨T,S⟩/(S²−p²T)`, `B=π(ℤ_p⟨T,S⟩)`; `A=ℚ_p[ε]/(ε²)` | `𝔽_p` reduced, `ℤ_p={|f|≤1}`; `ℤ/p²` nonreduced, hypothesis fails; `S/p∉B` (`1=pg₁(T)` impossible), `B/pB` nonreduced, hypothesis fails; nonreduced `A`: any open `B` contains `p^kε`, reducedness forces `p^kε∈ϖⁿB` for all `n`, boundedness forces `p^kε=0`, so no such `B` exists | holds; minimal `N` with `ϖ^N fⁿ∈B` is `0` by the reduced-quotient step | none |
| `integral_iff_supSeminorm_le_one` | `A=ℚ_p⟨T⟩/(T²−p)`, `S=π(ℤ_p⟨T⟩)`, `a=T` | `T²=p∈S`, integral; `|T|sup=p^(−1/2)≤1` | holds (BGR 6.3.4/1, uncertified) | none |
| `exists_fg_smul_le_of_presentation` | `N=0`; `M=𝒪_{ℂ_p}`, `N=𝔪`, `ε<|x|<1` | `N'=0`; `N'=x𝒪`: `|a|≤ε<|x|` gives `a𝔪⊆x𝒪` | matches Kiehl Satz 5.1 | none |
| `isNoetherian_of_presentation_of_discrete` | `K=ℚ_p`; `K=ℂ_p` | `ρ=|p|` works; `ℂ_p`: `‖c‖` dense below 1, no `ρ<1`, hypothesis fails, and `𝒪_{ℂ_p}` is not noetherian | hypothesis is exactly discreteness | none |
| `IsSlopeLE` | `Q=0`; `Q=1`; `Q=X−c`, `|c|<1=r`; `1−cT` | `Q=0`: `α=0` is a root, `spectralNorm 0=0<r`, fails (unless `A=0`, no `χ`); `Q=1`: no roots, holds; `X−c`: root `c`, `|c|<r`, fails; `1−cT`: root `1/c`, `|1/c|>1≥r`, passes | matches §7.2 Checks | none |
| §7.2 convention vs Urban | `r=|p|^h`, `Q` monic annihilator | Urban's `Q*=X^dQ(1/X)` has roots `1/λ` of valuation `≤h` iff `|λ|≥|p|^h=r`; `det(1−Tu)` roots are `1/λ` | direction agrees | none |
| §7.2 LAD coefficient test | `Q=∏(X−λᵢ)`, `|λᵢ|≥r` | `aⱼ/a₀=±e_j(1/λ)`, `|e_j(1/λ)|≤r^(−j)`, so `|aⱼ/a₀|rʲ≤1`; converse by the ultrametric root bound on `Q*/a₀` | consistent | none |
| `IsSlopeDecomposition` wrong models | `M₁=0`; eigenvector with `|λ|≥r` placed in `M₂`; eigenvector with `|μ|<r` placed in `M₁` | `Q=1` works for `M₁=0`; `P=X−λ` kills `v∈M₂`, not bijective, excluded; annihilator of `M₁` has root `μ`, `|μ|<r`, fails `IsSlopeLE`, excluded | definition determines the summands (Urban 2.3.3 uniqueness) | none |
| `exists_projection` | `M₁=0`; `M₂=0` | `P=0`; `P=id` | holds from the continuous `projectionOnto` and stability | none |
| §7.1 Checks | `h:ΣaₙTⁿ↦ΣaₙϖⁿTⁿ`; `K²` vectors | tail `≥N` bounded by `|ϖ|^N`; `id−h` kills constants, `|1−ϖⁿ|=1` for `n≥1`, image `TK⟨T⟩`, cokernel `K`; `det[[1,δ],[δ',1]]=1−δδ'≠0`; `f=e=id_K` gives `f−e=0` | as stated | none |
| §7.5 / `stable_filtration_cofinal` | `a=0`; `a=1`; identity of `Sp A` in degree 0 | `a=0`: `R₀=Mⁱ`, `Rₙ=0`; `a=1`: `Rₙ=Mⁱ`; degree 0: `Rₙ=aⁿM`; filtration: `F(n+d)=aⁿF(d)⊆aⁿM` | true; Lean statement is free-variable algebra | R08 |
| §6.2 / §6.3 Checks | open disc + unit circle; `|T|ⁿ≤|ϖ|`; unit disc in itself; finite affinoid | not admissible; radii `|ϖ|^(1/n)→1`; `K⟨T⟩` not finite over `K`, not inner; `B` finite over `A`: rescale generators by `c` with `|c||xᵢ|sup<1`, presentation still surjective, inner | as stated | none |
| §8.2 Check | rank-two point below the Gauss point | `v(T)<1`, `v(T)ⁿ>|ϖ|` for all `n`, outside `⋃{|T|ⁿ≤|ϖ|}` | as stated; HuberCV 4.1–4.3 | cite 4.3 (R-free note) |
| §8.3 | affinoid iff; gluing examples | HuberFR 4.5(v); two discs along the open disc non-quasi-separated | as stated | none |
| §1.3 `A_L⊗_A M ≃ M⊗̂_K L` | `M=A`, `L=K`, `M=A/(T)` | `A_L`, `A`, `L` on both sides | Conrad 1.1.5(1) | none |
| §0.1 Checks | `p+T²`, `p+T+pT²` over `ℚ_p` | Gauss norm 1, value `1` at `T=1`, `|p|` at `0`; reduction `T` | as stated | none |

**Policy checks.** No `set_option`, no sorried data, no `lemma`, no `#eval`; `theorem` throughout; the folder's `STATUS.md`/`PROGRESS.md` are generated status files the repository allows; `metadata.toml` is `math.AG`. Other changes of the pull request outside this folder are all in the roadmap folders the brief names as its own.

## Not verifiable

- **[BGR]** (Springer, paywalled; recorded `uncertified`): every BGR locator in the README (2.3.2/7, 3.5.1–3.5.3, 3.7.3, 3.7.5, 3.8.1/7, 3.8.3/7, 4.1/3–4, 4.4/2, 5.3.1/1, 6.1.1–6.1.5, 6.2.1–6.2.4, 6.3.1/4–6, 6.3.4–6.3.5, 7.2, 8.2, 9.1) is cited by locator only. The uniform exponent of §2.2 and the integral-closure statement of §2.3 therefore rest on the locator, not on the text.
- **[Bosch]** §§6.3–6.4: the README's link is the Springer edition on a third-party page (R11); I did not rely on it, and the manifest entry the fetch recorded should be reclassified as uncertified.
- **[Kiehl-E]**, **[Kiehl-AB]**: GDZ scans recognised by OCR; the statements quoted above are legible, some proof lines are garbled.
- **[Huber-CV]**, **[Huber-FR]**: read from the README's own links on a seminar page (R11); the GDZ Mathematische Zeitschrift digitisation (223 volumes listed) is the legal copy to link.
- Ownership against open pull requests was checked through `roadmaps grep` for the slope interface only; the geometric objects (`Sp`, `RigidSpace`, `rigidToAdic`) are owned here by the Scope section and consumed by AdicSpacesPartII R0.9/R1.7 by name.

## Source issues

- none
