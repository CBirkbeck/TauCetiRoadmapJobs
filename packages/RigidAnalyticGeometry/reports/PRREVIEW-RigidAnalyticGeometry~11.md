# Review of RigidAnalyticGeometry (pull request #1807 at 4f06ba2)

**Verdict:** needs changes

Full review. `TauCetiRoadmap/RigidAnalyticGeometry/` is byte-for-byte the folder of the repair commit `72ca89d2` (`git diff --stat 72ca89d2..HEAD -- TauCetiRoadmap/RigidAnalyticGeometry` is empty); against `f0c1c5c`, the head the previous review read, it differs by 434 lines, all from that repair. What did change since the previous review is the pin: the head merges main's pin bump, so `lake-manifest.json` now pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the same as main (`ffac5139`). All eleven previous findings are repaired (below). The gate passes (`build=0`, `depcheck=0`; only `outside-folder=17`, which lists the pull request's own thirteen folders named in the brief). The one blocking finding is new and is caused by the pin bump: the pinned Tau Ceti now contains this roadmap's Layers 1–2, its fraction algebras, pushouts, subdomains, G-topologies and the §7.2 slope interface, so `Suggested.lean` restates seventeen proved theorems and states the remaining three through private copies of native carriers.

## R01 (P2) — `Suggested.lean` restates theorems the pinned Tau Ceti proves, and states the rest on private copies of native carriers

Location: `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` lines 10–25 ("It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`"), 47–63 and 115–122, 209, 252–270 (the definitions `weightedTate`, `TateAlgebra`, `IsAffinoidAlgebra`, `IsStrictRadius`, `pointNorm`, `supSeminorm`, `IsPresentationRing`, `IsSlopeLE`, `IsSlopeDecomposition`), and the twenty sorried theorems; `README.md` lines 110–123 ("Existing library interfaces": only the Tate-algebra module and `TauCeti.Huber.IsPowerBounded` are named as existing).

Claim: the twenty theorems are headline theorems the finished roadmap will prove, stated against the pins, and the nine definitions are the simple definitions needed to state them.

Witness: at the pinned Tau Ceti `2fd255d9` the directory `TauCeti/RingTheory/Affinoid/` (38 files), `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean`, `TauCeti/Analysis/Normed/Unbundled/Slope.lean`, `TauCeti/Topology/GTopology/` and `TauCeti/AlgebraicGeometry/Rigid/Affinoid/` exist; none of them exists at the previous pin `358314d4` (`git ls-tree 358314d4` on each path is empty). `TauCeti.IsAffinoidAlgebra` (`TauCeti/RingTheory/Affinoid/Basic.lean:30`) has the same body as the roadmap's predicate; `TauCeti.pointNorm` and `TauCeti.supSeminorm` (`SupSeminorm.lean:96,103`) the same bodies as `pointNorm` and `supSeminorm`; `Polynomial.IsSlopeLE` (`Unbundled/Slope.lean:64`) the same body as `IsSlopeLE`; `ContinuousLinearMap.IsSlopeDecomposition` (`SlopeDecomposition.lean:51`) has as fields exactly the conjuncts of `IsSlopeDecomposition`. A scratch copy of the file, importing these modules and converting the predicate through `TauCeti.isAffinoidAlgebra_iff` and the norms through `TauCeti.pointNorm_eq_spectralNorm` and `TauCeti.supSeminorm_eq_iSup`, closes fifteen of the twenty theorems with one native theorem each (elaborated with `lake env lean`, zero `sorry` warnings on them):

| Roadmap theorem | Native theorem at the pin (file under `TauCeti/RingTheory/Affinoid/` unless stated) |
| --- | --- |
| `isNoetherianRing` | `IsAffinoidAlgebra.isNoetherianRing` (`FiniteQuotient.lean:43`) |
| `isJacobsonRing` | `IsAffinoidAlgebra.isJacobsonRing` (`MaximalSpectrum.lean:53`) |
| `exists_finite_injective` | `IsAffinoidAlgebra.exists_finite_injective` (`NoetherNormalization.lean:163`) |
| `finite_residue` | `IsAffinoidAlgebra.finite_quotient_of_isMaximal` (`MaximalSpectrum.lean:46`) |
| `height_eq_ringKrullDim_of_isDomain` | `IsAffinoidAlgebra.height_eq_ringKrullDim_of_isDomain` (`KrullDimension.lean:97`) |
| `weightedTate_isAffinoid_iff` | `isAffinoidAlgebra_isRestricted_iff_pow_eq_norm` (`Polyradius.lean:68`), up to unpacking `Kˣ` |
| `bddAbove_pointNorm` | `IsAffinoidAlgebra.bddAbove_range_pointNorm` (`SupSeminorm.lean:302`) |
| `exists_pointNorm_eq_supSeminorm` | `IsAffinoidAlgebra.exists_pointNorm_eq_supSeminorm` (`MaximumModulus.lean:156`) |
| `supSeminorm_pow` | `IsAffinoidAlgebra.supSeminorm_pow` (`SupSeminorm.lean:360`) |
| `supSeminorm_eq_zero_iff` | `IsAffinoidAlgebra.supSeminorm_eq_zero_iff` (`SupSeminorm.lean:385`) |
| `exists_uniform_valueGroup_exponent` | `IsAffinoidAlgebra.exists_supSeminorm_pow_eq_norm` (`ValueGroup.lean:79`) |
| `isClosedEmbedding_of_finite_injective` | `IsAffinoidAlgebra.isClosedEmbedding_of_finite_injective` (`FiniteMap.lean:61`; the source only needs to be noetherian) |
| `powerBounded_iff` | `IsAffinoidAlgebra.isPowerBounded_iff_supSeminorm_le_one` (`PowerBounded.lean:169`) |
| `topologicallyNilpotent_iff` | `IsAffinoidAlgebra.isTopologicallyNilpotent_iff_supSeminorm_lt_one` (`PowerBounded.lean:197`) |
| `integral_iff_supSeminorm_le_one` | `AlgHom.isIntegral_map_unitClosedBall_iff_supSeminorm_le_one` (`PowerBounded.lean:135`), with `S = (Subring.unitClosedBall _).map π.toRingHom` |

Two more are native by object, differing only in convention: `mem_iff_supSeminorm_le_one_of_isReduced` is `IsAffinoidAlgebra.mem_iff_supSeminorm_le_one_of_isReduced_quotient` (`PowerBounded.lean:250`, with `Huber.IsBounded` for `Bornology.IsBounded` and `IsLeftRegular` in place of `IsUnit`, which is weaker), and `IsSlopeDecomposition.exists_projection` is `ContinuousLinearMap.IsSlopeDecomposition.exists_projection` (`SlopeDecomposition.lean:89`). Only three are absent at the pin: `banachFunctionAlgebra`, `exists_fg_smul_le_of_presentation` and `isNoetherian_of_presentation_of_discrete` (`exact?` fails on each; no `IsReduced`-normed theorem, no Kiehl Satz 5.1 statement in `TauCeti/`). The folder's generated `STATUS.md` records the same implementation ("§1.1 is done except for contractive renorming …"). So the docstring's claim is false for seventeen declarations, and the three true headlines are stated through private copies of `TauCeti.IsAffinoidAlgebra`, `TauCeti.supSeminorm` and the presentation ring, which the house rule on existing Tau Ceti APIs excludes ("prototype the new interface against that implementation instead of restating it behind a private stand-in").

Repair: in `Suggested.lean`, import `TauCeti.RingTheory.Affinoid.PowerBounded` (it brings `Basic`, `SupSeminorm` and the Tate module) and delete the nine definitions and the seventeen theorems listed above; keep the three absent headlines, restated on the native carriers: `banachFunctionAlgebra` with `(hA : TauCeti.IsAffinoidAlgebra K A)` and `TauCeti.supSeminorm K f`; the two Kiehl statements with `S` replaced by `(Subring.unitClosedBall (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1))).map π.toRingHom` (the native presentation ring, so `IsPresentationRing` goes too). Rewrite the docstring to say which headlines are stated (three) and that the Layer 1–2 and §7.2 theorems are Tau Ceti's at the pin. Tested: the scratch copy with these imports elaborates; the three remaining statements need no new definition. In the README, the targets stay (the README is the specification `STATUS.md` measures), but every backticked name of the roadmap's own that leaves `Suggested.lean` (lines 175–176, 192, 204, 209, 213, 283–284, 300–304, 333–334, 339–340, 344, 379–380, 392–394, 399, 613–614) becomes prose or the pinned name (`TauCeti.IsAffinoidAlgebra`, `TauCeti.supSeminorm`, `ContinuousLinearMap.IsSlopeDecomposition`, …), and "Existing library interfaces" (lines 110–123) and the `From Tau Ceti` contract name the modules now at the pin: `TauCeti/RingTheory/Affinoid/` (Layers 1–2, §§1.3–1.4 through `Pushout/`, `RationalFraction.lean`, `LaurentFraction.lean`, `Subdomain/`), `TauCeti/Topology/GTopology/` (§6.1: `GTopology`, `grothendieckTopology`, `isSheaf_iff`, `Saturated` for G0–G2, `topological`), `TauCeti/AlgebraicGeometry/Rigid/Affinoid/` (Layers 3–4: `AffinoidSubdomain`, `presheaf`, `weakGTopology`), `TauCeti/Analysis/Normed/Operator/SlopeDecomposition.lean` (§7.2). The gate's `readme-ids-missing` check will refuse any own name left backticked after the deletion.

## R02 (P3) — §6.3's composition law for Kiehl-proper morphisms has no source among those cited

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 549–553, "Prove its local nature on the base, composition and base-change laws, and properness of finite morphisms … Sources: [Bosch] §6.3; [Kiehl-E] §2."

Claim: [Bosch] §6.3 and [Kiehl-E] §2 support the composition law.

Witness: Bosch line 4962–4968 states that base change and fibre products are easy but that composition of proper morphisms "is quite difficult", referring to Lütkebohmert for discretely valued `K` and to Temkin for the general case; Kiehl-E lines 505–512 list only products, finite base field extension and finite morphisms. The statement is true (Temkin, Math. Ann. 318 (2000), through the comparison with Berkovich properness), but the roadmap's locators do not contain it, and §8.3 (lines 818–822) only admits Part II's properness comparison "with their discrete-valuation hypotheses".

Repair: add the two sources to the References and to the §6.3 Sources line, as uncertified citations by locator: W. Lütkebohmert, *Formal-algebraic and rigid-analytic geometry*, Math. Ann. 286 (1990), 341–371, for discretely valued `K`, and M. Temkin, *On local properties of non-Archimedean analytic spaces*, Math. Ann. 318 (2000), 585–607, doi:10.1007/s002080000123, §4 (the identification of Kiehl properness with properness of the associated Berkovich spaces), for general `K`; and say in §6.3 that the composition law is proved through that identification, not from the inner-cover definition alone.

## R03 (P3) — Broken link to the AdicSpaces roadmap

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 33, "[AdicSpaces](../AdicSpaces/README.md)".

Claim: the AdicSpaces roadmap lives at `TauCetiRoadmap/AdicSpaces/`.

Witness: on main (`ffac5139`) there is no `TauCetiRoadmap/AdicSpaces/`; the roadmap is archived at `Completed/AdicSpaces/README.md`, and `TauCetiRoadmap/RestrictedPowerSeries/README.md` line 54 links it as `../../Completed/AdicSpaces/README.md`.

Repair: write `[AdicSpaces](../../Completed/AdicSpaces/README.md)`.

## R04 (P3) — The Japanese-ring vocabulary is cited by a name that exists nowhere at the pin

Location: `TauCetiRoadmap/RigidAnalyticGeometry/README.md` line 32, "do not introduce another `Ring.IsJapanese`"; lines 161 and 210 ("the Japanese-ring criteria of SchemeAndStackFoundations", "affinoid domains are Japanese").

Claim: `Ring.IsJapanese` is the shared predicate.

Witness: the pinned Tau Ceti has `TauCeti.IsJapanese` (`TauCeti/RingTheory/Japanese.lean:125`, N-2 with inseparable extensions included, Stacks 032F), `TauCeti.IsN1` (line 118) and `TauCeti.IsNagata` (`TauCeti/RingTheory/Nagata.lean:65`), with `IsJapanese.of_finite` (`Japanese.lean:228`), `isJapanese_iff_isPurelyInseparable` (line 359) and `IsNagata.of_finite` (`Nagata.lean:76`); `Ring.IsJapanese` occurs in neither the pinned Mathlib nor Tau Ceti (`grep -rn 'Ring.IsJapanese'` over both is empty). It is SchemeAndStackFoundations §0.20's own name (its line 1388 on main), now implemented under the Tau Ceti name.

Repair: at line 32 and in §§0.2 and 1.2 name the pinned declarations (`TauCeti.IsJapanese`, `TauCeti.IsNagata`, `TauCeti.IsJapanese.of_finite`, `isJapanese_iff_isPurelyInseparable` for the inseparable step), keeping SchemeAndStackFoundations §§0.20–0.21 as the supplier of the permanence and excellence criteria it still owns.

## Previous findings

Folder unchanged since `72ca89d2`; each witness re-checked at this head.

- R01 (upward LocallyAnalyticDistributions row) — repaired: the supplier table (lines 27–34) has no LocallyAnalyticDistributions row; it appears only under `## Downstream consumers` (lines 888–892); the dependency check prints no UPWARD line.
- R02 (CompactOperators as consumer of §7.2) — repaired: lines 629–632 read "§7.2 is independent of CompactOperators' Riesz projectors (CompactOperators §3.1) … neither construction uses the other"; the Sources line is "[Urban] §2.3" alone (line 642).
- R03 (header) — repaired: lines 1–5 are `module`, `public import Mathlib`, the two `TauCeti.*` modules; gate `imports=0 mathlib-subimports=0 no-import-mathlib=0`.
- R04 (pull-request numbers, fork links) — repaired: no `PR #` in the file (gate `prnum=0`); the fork is cited once as provenance at lines 931–945 with a pinned commit, no per-file links.
- R05 (R0.3 vs R0.5) — repaired: line 259 "tensor construction from Part II R0.5, *completed-tensor-banach-module*" (AdicSpacesPartII line 2789 on main).
- R06 (undeclared backticked names) — repaired: `isClosedEmbedding_of_finite_injective` is declared (Suggested.lean line 163); `Sp A`, `rigidToAdic`, `RigidSpace` are no longer backticked as the roadmap's own (lines 39–41, 594, 802). Superseded in part by R01 above.
- R07 (stale pin sentence) — repaired: the sentence is gone; lines 112–116 name the module and `MvPowerSeries.norm_eq_gaussNorm` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:216`).
- R08 (padding) — repaired: `gaussNorm`, `gaussNorm_eq_norm`, `supSeminorm_eq_zero_of_subsingleton`, `scalarImage`, `stable_filtration_cofinal` are absent; `IsPresentationRing` uses `‖t‖ ≤ 1` (line 210).
- R09 (docstring) — repaired in form (lines 7–33 name the five unstatable headlines and their missing carriers); its statable list is now wrong at the new pin (R01).
- R10 (Checks) — repaired: §2.1 (319–328), §6.1 (495–508), §7.3 (674–688), §7.4 (708–718) have `**Checks.**` lists; the §7.3 non-normal example is the axes `XY = 0`, which is correct (`Y` vanishes on the admissible Zariski-open `X ≠ 0`, the `X`-axis minus the origin, and is nonzero), and the nodal cubic is used only in §8.1 for the two analytic branches, where it is right.
- R11 (third-party links) — repaired: Bosch by DOI (line 901), the Huber papers by the GDZ digitisations of Math. Z. 212 and 217 (lines 917, 920), Kiehl by the GDZ volume of Invent. Math. 2.

## Verified sound

**Gate at this head** (`--build --order`): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=17 source-material=0 build=0`; the 17 outside-folder files are the thirteen folders the brief names as the pull request's own. `git diff --stat origin/main...HEAD` excluding those folders is empty. Dependency check:

```
depcheck: 242 roadmaps, 2369 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean`: 20 `declaration uses sorry` warnings, nothing else. `#check @name` for all 29 declarations in one scratch file: every theorem keeps `[CompleteSpace K]` and `[IsUltrametricDist K]`; the nine "dropped binder" leads are the defs and abbrevs that drop only those two instances, which their bodies do not use. Each elaborated type matches its README statement (generality, hypotheses, direction of each iff). One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop` on a scratch copy): all 20 theorems fail it; the library-lemma probe is R01.

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`): `MvPowerSeries.IsRestricted.subring` (`Mathlib/RingTheory/MvPowerSeries/Restricted.lean:159`), `MvPowerSeries.gaussNorm` (`GaussNorm.lean:58`), `MvPowerSeries.norm_eq_gaussNorm` and the `NormMulClass` instance (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:216,583`), `spectralNorm` and `spectralNorm_unique` (`Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381,699`), `Ideal.height` (`Mathlib/RingTheory/Ideal/Height.lean`), `Submodule.projectionOnto` and `Submodule.projection` (`Mathlib/LinearAlgebra/Projection.lean:125,137`), `Submodule.IsTopCompl` (`Mathlib/Topology/Algebra/Module/Complement.lean:82`), `TauCeti.Huber.IsPowerBounded`, `powerBoundedSubring`, `topologicallyNilpotentIdeal` (`TauCeti/RingTheory/Huber/PowerBounded.lean:121,456,598`), `IsTopologicallyNilpotent` (`Mathlib/Topology/Algebra/TopologicallyNilpotent.lean:46`), `Huber.IsBounded` (`TauCeti/RingTheory/Huber/Bounded.lean:109`), and the native affinoid, slope, G-topology and site declarations listed under R01 and R04. Tau Ceti has no Tate acyclicity, rigid space, analytification or rigid–adic functor (`grep` for `acyclic`, `RigidSpace`, `rigidToAdic`, `analytification` under `TauCeti/AlgebraicGeometry/Rigid` and `TauCeti/RingTheory/Affinoid` is empty), so the docstring's five unstatable headlines remain unstatable.

**Cross-roadmap citations resolved on main `ffac5139`**: AdicSpacesPartII R0.3 (line 1769), R0.4 (2270), R0.5 (2759; *completed-tensor-banach-module* 2789), R0.9 (4071; its lines 4083–4100 consume `IsAffinoidAlgebra`, §1.1, §1.2 and `isClosedEmbedding_of_finite_injective`), R1.1 (8427), R1.7 (9806; consumes §§8.2–8.3), R1.9 (10509); AdicSpacesPartIII R3.1 (9136), R3.2 (9594), R3.3 (9870; *surjection-small-perturbation* 9884), R3.4 (10053), R3.5 (10179), R3.6 (10472; *completely-continuous-finite-cokernel* 10838 cites Kiehl-E Satz 1.2; *proper-cohomology-adic-completion* 11028 consumes §7.5), R3.7 (11218, *proper-gaga* 11458), and its supplier table rows 600, 602, 607 for the three named targets; AdicSpacesPartIV F1.1 (2998), R5.7 (2165), with 46 citations of this roadmap (§§1.2, 1.4, 1.5, 2.1, 2.2, Layers 3–4); RestrictedPowerSeries §2.4 (364), Layers 4–6 (452–608), §5.4 (587); PadicFunctionalAnalysis Layers 0–2 (190–384), §§1.2, 2.2, 2.4 (343, 400, 457); CompactOperators Layers 0–3 (149–613), §3.1 (615), no occurrence of "RigidAnalyticGeometry"; SchemeAndStackFoundations §0.20 (1302), §0.21 (1394). LocallyAnalyticDistributions at its open head (#854) consumes §7.2's `IsSlopeLE`, `IsSlopeDecomposition`, `IsSlopeDecomposition.exists_projection` at its lines 254, 861–863, 878, 3111–3113, 3143, 3180, 3202, 3226, as the Downstream consumers section says; it is cited here only as a consumer. Ownership: `roadmaps grep` finds `def IsAffinoidAlgebra` and `IsSlopeDecomposition` declared only in this folder (on main and in the pull requests carrying it); no roadmap on main or at an open head cites `TauCeti.IsAffinoidAlgebra` or `TauCeti.IsJapanese`, so no sibling has adapted to the new pin either.

**Sources at their locators** (seeded sample; cache line numbers). Kiehl-E: Definition 1.1 (line 315, strict complete continuity with the uniform scalar `a`), Satz 1.2 (328), Lemma 1.3 (333), Satz 1.4 (372), Definitions 2.1–2.3 (475–504, properness by two finite inner covers), finite maps proper (510), Satz 2.6 (626, statement garbled by OCR; its setting at 557–592 is the inner-cover reduction), Theorem 3.4 (647–660: `(R_k)` is `a`-good and the kernel and cokernel systems are null systems, which gives §7.5's two uniform shifts), Satz 3.5 (747, base change along affinoid subdomains), Theorem 3.7 (809, finitely generated ideals; `A` noetherian so every ideal), Satz 5.1 (878–885: one `N'` for all `|a| ≤ e`, and noetherianity for discrete valuation). Kiehl-AB: Definition 2.3 (601–605, increasing admissible affinoid exhaustion with dense restrictions) and Satz 2.4 (615–621: density, vanishing, generation). Conrad: Theorem 1.1.1 (156), Theorem 1.1.3 (201), Lemma 1.1.5 (274–286), Lemma 2.1.5 (570), Appendix A (1500, Lemmas A.1.1–A.1.2 for analytification). Huber-CV: definition of `L_A` (766, valuations `≤ 1` on `A°` and `< 1` on `A°°`), Theorem 4.1 (775), Corollaries 4.2–4.3 (818, 823). Huber-FR: Proposition 4.5 (i)–(v) (1436–1447), matching §8.3 clause by clause. FK: Proposition B.1.3(1) (10032). Urban: 2.3.1 (869–882, the reciprocal `Q*` whose roots are the eigenvalues, so §7.2's annihilator-root reading with `r = |p|^h` is the right direction), Corollary 2.3.3 (900), 2.3.6 (938). Bosch: Definition 6 (4933–4944, relative compactness with `ε ∈ √|K×|`), Lemma 7 (4946–4952, product, base change and separated intersection), Definition 8 (4956–4961), Theorem 9 and Lemma 10 (4982–4990). The README's §6.1 G0–G2 reference ([BGR] §9.1.2) agrees with the native `GTopology.Saturated` docstring.

**Adversarial table** (statements unchanged since `72ca89d2`; values recomputed).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsAffinoidAlgebra` | zero algebra; `K`; `K⟨T⟩/(T²)` | `0`: surjection from `T₀ = K`; `K`: `n = 0`; nilpotents kept | matches `TauCeti.IsAffinoidAlgebra` body | R01 |
| `exists_finite_injective` | `A = 0`; cusp | `0`: no injection (excluded by `Nontrivial`); cusp finite over `K⟨X⟩`, `d = 1` | native | R01 |
| `height_eq_ringKrullDim_of_isDomain` | `K⟨T⟩×K`; `T² − p` | `K⟨T⟩×0` height 0 in dimension 1, excluded by `IsDomain`; `(T²−p)` height 1 = dim | native, Conrad 2.1.5 | R01 |
| `weightedTate_isAffinoid_iff` | `n = 0`; `ρ = p^(−1/2)`; `ρ ∉ p^ℚ` | vacuous both sides; `m = 2, c = p`; `|X|sup = ρ`, no power in `|K×|` | both directions, native | R01 |
| `IsStrictRadius` | `r = 1`, `p^(−1/2)`, `0` | `1 = ‖1‖`; `(p^(−1/2))² = ‖p‖`; `0` excluded | matches `√|K×|` | R01 |
| `supSeminorm_pow`, `_eq_zero_iff` | zero ring; `n = 0`; `K⟨T⟩/(T²)`, `f = T` | `0 = 0`; `|1|sup = 0 ≠ 1`, so `0 < n` needed and present; `|T|sup = 0`, `T² = 0` | holds | R01 |
| §2.1 Check `K×K` | `(1,0)`, `(0,1)` | `|(1,0)|sup = 1`, product `0`, `1·1 = 1` | submultiplicative only | none |
| §2.1 Check `ℚ_p⟨T⟩/(T²−p)` | one point | residue field `ℚ_p(√p)`, `|T|sup = p^(−1/2) ∉ |ℚ_p×|` | as stated | none |
| `exists_uniform_valueGroup_exponent` | `A = 0`; nilpotent `f`; `T² − p` | `m = 1, c = 0`; `c = 0`; `m = 2`, `c = p` | native (`1 ≤ m` is `0 < m`) | R01 |
| `powerBounded_iff`, `topologicallyNilpotent_iff` | `p`, `T` in `ℚ_p⟨T⟩`; zero ring | `|p| < 1`, `pⁿ → 0`; `|T|sup = 1`, bounded, not `→ 0`; `0 ≤ 1`, `0 < 1` | native | R01 |
| `banachFunctionAlgebra` | zero ring; `K⟨T⟩` | `C = 1`, `0 ≤ 0 ≤ 0`; `|f|sup = ‖f‖` (`supSeminorm_eq_norm`) | holds; absent at the pin | keep (R01) |
| `mem_iff_supSeminorm_le_one_of_isReduced` | zero ring; `ℤ_p ⊂ ℚ_p`, `ϖ = p`; `ϖ = p²`; `π(ℤ_p⟨T,S⟩) ⊂ ℚ_p⟨T,S⟩/(S²−p²T)` | `B = 0`, `ϖ = 0` unit, `B/ϖB = 0` reduced, `0 ≤ 1`; `𝔽_p` reduced; `ℤ/p²` nonreduced, excluded; `S/p ∉ B` (`1 − p g₁ = 0` impossible mod `p`), `B/pB = 𝔽_p[T,S]/(S²)` nonreduced, excluded | holds; native with `IsLeftRegular` | R01 |
| `integral_iff_supSeminorm_le_one` | `T² − p`, `S = π(ℤ_p⟨T⟩)`, `a = T` | `T² = p ∈ S`; `|T|sup = p^(−1/2) ≤ 1` | native | R01 |
| `exists_fg_smul_le_of_presentation` | `N = 0`; `M = 𝒪_{ℂ_p}`, `N = 𝔪`, `ε < |x| < 1` | `N' = 0`; `N' = x𝒪`, `c𝔪 ⊆ x𝒪` for `|c| ≤ ε` | Kiehl Satz 5.1 line 881; absent at the pin | keep (R01) |
| `isNoetherian_of_presentation_of_discrete` | `ℚ_p`; `ℂ_p` | `ρ = |p|`; no `ρ < 1`, `𝒪_{ℂ_p}` not noetherian | hypothesis is discreteness | keep (R01) |
| `IsSlopeLE` | `Q = 0`; `Q = 1`; `X − c`, `|c| < 1 = r`; `1 − cT` | root `0`, fails; no roots, holds; `|c| < r`, fails; root `1/c`, `|1/c| > 1`, passes | matches §7.2 Checks and `Polynomial.IsSlopeLE` | R01 |
| §7.2 convention vs Urban 2.3.1 | `r = |p|^h`, monic annihilator | roots of `Q*` are eigenvalues `λ` with `v(λ) ≤ h` iff `|λ| ≥ r` | direction agrees | none |
| `IsSlopeDecomposition` wrong models | `M₁ = 0`; `c·id`, `|c| = r`; `|μ| < r` eigenvector in `M₁` | `Q = 1`; `Q = X − c`, constant term `−c` unit, `M₂ = 0`; annihilator root `μ` fails `IsSlopeLE` | summands determined (Urban 2.3.3) | R01 |
| `exists_projection` | `M₁ = 0`; `M₂ = 0` | `P = 0`; `P = id` | holds; native | R01 |
| §6.2–6.3 Checks | disc + circle; `|T|ⁿ ≤ |ϖ|`; unit disc in itself; finite affinoid | not admissible; radii `|ϖ|^(1/n) → 1`; `K⟨T⟩` not finite over `K`, not inner; rescaled generators, inner | as stated (Bosch Def. 6) | none |
| §6.3 composition law | — | Bosch 4964–4968: not proved there | unsourced | R02 |
| §7.3 Checks | axes `XY = 0`; open disc; `ℙ¹` | `Y` vanishes on `X ≠ 0`, `Y ≠ 0`; `H¹(𝒪) = 0`, global ring not affinoid; `ℙ¹` quasi-compact, not affinoid | as stated | none |
| §7.4 nonflat Check | `F = I_P(−1)` on `ℙ¹_{K⟨t⟩}`, `t = 0` | `H⁰(F) ⊆ H⁰(𝒪(−1)) = 0`; `I_P ⊗ 𝒪_{ℙ¹_K} = I_{P,fibre} ⊕ k_P`, so `F|fibre = 𝒪(−2) ⊕ k_P`, `H⁰ = K` | as stated | none |
| §7.5 shifts | `a = 0`; `a = 1`; degree 0 on `Sp A` | `R_0 = M`, `R_n = 0`; `R_n = M`; `R_n = aⁿM` | Theorem 3.4's `a`-good filtration and null systems give `d, e` | none |
| §8.2 Check | rank-two point below the Gauss point | `v(T) < 1`, `v(T)ⁿ > |ϖ|` all `n`; `L_A` per Huber-CV 766 | as stated | none |
| §8.3 | affinoid iff; two discs along the open disc | Huber-FR 4.5(v); non-quasi-separated, boundary points distinct | as stated | none |
| §0.1, §1.3 Checks | `p + T²`, `p + T + pT²`; `M = A`, `L = K`, `A/(T)` | Gauss norm 1 attained at `T = 1`, `|p|` at `0`; reduction `T`; both sides `A_L`, `A`, `L` | as stated (Conrad 1.1.5(1)) | none |

**Policy checks.** No `set_option`, no `lemma`, no `#eval`, no sorried data, `theorem` throughout; no LaTeX, no process words, no pull-request numbers; `metadata.toml` is `math.AG`; `STATUS.md` and `PROGRESS.md` are the repository's generated files; the References cite legal hosts (GDZ, arXiv, Annals, the author's page) and DOIs.

## Not verifiable

- **[BGR]** (paywalled, recorded `uncertified`): every BGR locator (§§3.5–3.8, 6.1–6.4, 7.2, 8.2, 9.1) is cited by locator only; the native `Polyradius.lean` and `GTopology/Basic.lean` cite the same §6.1.5 and §9.1.2.
- **Temkin, Math. Ann. 318 (2000)** and **Lütkebohmert, Math. Ann. 286 (1990)** (R02): the sources service found no legal open copy (arXiv search rate-limited, the DOI is Springer's), and I did not read them; the corollary number of Temkin's Kiehl-properness comparison is therefore not given in R02.
- **[Bosch]**: read from the cache text of the Purdue seminar copy; the README now cites the DOI only.
- **[Kiehl-E]**, **[Kiehl-AB]**: OCR of GDZ scans; Satz 2.6's statement (line 627) is garbled and was checked through its setting and Satz 3.5's reference to it.
- Ownership against open pull requests was checked with `roadmaps grep` for the declared names (`IsAffinoidAlgebra`, `IsSlopeDecomposition`, `IsSlopeLE`, `supSeminorm`) and the native names; the geometric objects (`Sp A`, rigid spaces, `r`) are owned here by the Scope section and consumed by AdicSpacesPartII by section.

## Source issues

- none
