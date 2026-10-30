# Review of FaltingsFinitenessAndIsogenyTheorems (pull request #1004 at b83ebd4)

**Verdict:** accepted

Independent AI review of the repaired head. The pull request files were not changed. No P1 or P2 finding remains; six P3 notes follow. The gate passes every check, the targeted build succeeds with `sorry` as the only warning, the dependency check reports no problem, and the adversarial table below carries computed values for the sampled targets, the fourteen Lean declarations and every target a finding touches.

## Status of the previous review's findings (d303ef8 → b83ebd4)

| Previous finding | Passage at this head | Status |
| --- | --- | --- |
| R01 (P1) graphs not direct in characteristic two | `README.md:1761–1765`: "`W_1 = {(x, vx) : x ∈ W^4} + {(y, −vy) : y ∈ (W^⊥)^4}` … as the ordinary sum … Directness and recovery require `2 ≠ 0`"; the `𝔽₂` control at 1813–1816 gives sizes `16, 16, 16` and dimension `4`. | Repaired. |
| R02 (P1) scheme covers not supplied by PELModuli | `README.md:698–717`: the owned target "Integral lifting after a finite extension" for a proper finitely presented DM stack over `O_K`, with Deligne–Mumford 4.19 for the local step; `734–735` now cite M6.3 as "fine smooth algebraic spaces". | Repaired. Deligne–Mumford Theorem 4.19 is at `dm1969 line 1091`, printed p. 103, and states exactly the finite-extension lift over the integral closure of the DVR. |
| R03 (P1) nonexistent supplier names | `README.md:405–409` cite `mulHeight_pow_finrank` with the equality `H_rel,K(x)^[L:K] = H_rel,L(x)` reversed into the orientation used here; `371–373`, `1357–1358`, `2188` cite the prose targets "The Mackey decomposition" and "The determinant of an induced representation"; `426` and `1305–1306` cite "the determinant consequence" of `BarsottiTate.hodgeTate`. | Repaired. All four resolve (see supplier table). |
| R04 (P2) DVR generality of the lattice theorem | `README.md:2275–2296`: stated for a discrete valuation ring `R`, with the complete case first, then maximality under completion and the isomorphism-descent step; the `𝔽₂[[t]]` versus `𝔽₂[t]_(t)` control at 2301–2303. | Repaired. Yu 4.8(2) (`yu line 583`) is stated for an arbitrary DVR, and §4.4 (`line 565`) is the non-complete setting. |
| R05 (P2) stable-lattice headline absent from Lean | `Suggested.lean:83–100`: `isStableLattice` (real body on `Submodule.IsLattice`) and `finite_stableLattices`. | Repaired; elaborates with the scalar tower, finite dimension, semisimplicity and existence hypotheses in its printed type. |
| R06 (P3) six HTML anchors | Removed; gate `residue=0`. | Repaired. |
| R07 (P3) undeclared local Lean labels | Headline table and API bullets now name targets in prose; `Suggested.lean:59` and `146` carry the two layer section comments. | Repaired. |
| R08 (P3) good-reduction predicates without API and Checks | `README.md:2092–2112` and `2598–2619`. | Repaired; the Checks are recomputed below (discriminants `64 ≡ 4` and `−11120`, nodal tangent cone `(y−x)(y+x)`). |
| R09 (P3) no `sources.toml` | The folder still holds only `README.md`, `Suggested.lean`, `metadata.toml`. | Not repaired. No roadmap on main carries a manifest either (`find` over the content checkout returns none), so this is recorded again as a P3 note, not as a blocker. |

## R01 (P3) — Two supplier sub-names do not exist in AbelianSchemesAndArithmeticModuli

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:357` "`AbelianScheme.dual` (with `dual_prod`)" and `:360` "`Hom.deg` (`deg_functionField`)"; repeated at 1062 and 2689.

**Claim:** The parenthesised names are declarations of the supplier.

**Witness:** At the head of its pull request, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` contains neither string; the index search over all open heads and main finds only an unrelated `selmer_equiv_dual_prod_free`. The mathematics is there in prose: A2.2 line 1094 (duality of products) and A6.1 line 2819 (function-field degree).

**Repair:** Drop the two invented names and cite A2.2 "duality of products" and A6.1 "the function-field degree" in words, as the other contracts do.

## R02 (P3) — AlgebraicModuliForArithmeticGeometry names are cited without their namespace

**Location:** `README.md:336–337` and `659–660`: "`DMSchematicClosure.stack`, `DMNormalization.stack`, `DMNormalization.finite`".

**Witness:** The supplier declares `ArithmeticModuli.DMNormalization.stack` (its README line 8909), `ArithmeticModuli.DMNormalization.finite` (8933) and `ArithmeticModuli.DMSchematicClosure.stack` (8943), all in §5.4.

**Repair:** Prefix the three names with `ArithmeticModuli.`.

## R03 (P3) — Revision hashes and pin narrative in R28.1.9

**Location:** `README.md:946–957`: "at Tau Ceti revision `4e9057a1…`" … "This module is absent at the pinned revision `a91d3aaf…`" … "use a dependency revision containing …".

**Claim:** The house style is timeless prose; revision identifiers and pin comparisons are process narrative.

**Witness:** The declaration is indeed absent at the pin (no hit under `.lake/packages/TauCeti`), so the statement is true today, but a reader a year from now cannot use it.

**Repair:** Keep one sentence: the generic input is ArithmeticGaloisDuality R02.3.1, which realises it through Tau Ceti's `ramifiedSupport` finiteness; delete both hashes and the "when importing the existing module" clause.

## R04 (P3) — Sentences damaged by the name-to-prose replacement

**Location:** `README.md:298` "sums over `Fin 4`. the orthogonal-sum form evaluates"; `:466` "This roadmap's the correspondence stack adds"; `:850` "Use the alias logarithmic growth of the Hodge metric of"; `:1165` "Use the alias the isogeny height formula of"; `:2626` "R28.5.14 the field specialization of the canonical Jacobian polarization and rational Torelli".

**Repair:** Capitalise 298; "This roadmap's correspondence stack" at 466; "Use, as an alias, the logarithmic growth of the Hodge metric from" at 850 and the same shape at 1165; "R28.5.14 (the field specialization of the canonical Jacobian polarization and rational Torelli)" at 2626.

## R05 (P3) — R28.1.4 keeps a dependency and a Check its route no longer uses

**Location:** `README.md:734–735` "*Needs:* … PELModuli … M6.3 (finite level covers by fine smooth algebraic spaces …, `n = 3, 4`)" and the first Check at 742–744 on levels 3 and 4.

**Claim:** After the repair the route obtains `e_1` by clearing denominators on an étale atlas of `J` (725) and the lift from the owned stack-lifting target (722–724); no step uses the level covers.

**Witness:** Lines 698–731 mention neither `A_{g,1,n}` nor a level structure; the Check tests a supplier property, not a statement of this section.

**Repair:** Remove the M6.3 item and the Check (M6.3 stays cited in R28.1.3, where `siegelStack` is used), or say in one clause what the level covers supply here.

## R06 (P3) — The cited works are still not registered in a manifest

**Location:** `README.md:2945–2988` (References); the folder has no `sources.toml`.

**Witness:** `ls` of the folder shows three files. The previous review's R09 asked for the manifest; no roadmap on main has one, and the gate's `source-material` rule passes.

**Repair:** As before: one key per work with locator, status and provenance, no local paths and no source text. This review edits no manifest.

## Verified sound

**Scope read.** The whole README (2,988 lines) and `Suggested.lean` (214 lines) at `b83ebd4785b75667ab50c9ab4ed2f0f6e4e3da03`; the change set since `d303ef8` (564 lines) line by line. The outside-folder diff against `origin/main` is empty. No route-specific shortcut, re-planned roadmap, computational algorithm, copied passage, sorry'd data, `set_option` or `lemma` was found. The `*Needs:*` lines cite only Mathlib, Tau Ceti, roadmaps on main, or roadmaps earlier in the merge order.

**Gate and build.** The worker's gate: every counter zero, `OK`. `lake build TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems.Suggested` completed with exactly the ten `declaration uses sorry` warnings (lines 74, 90, 104, 114, 134, 160, 169, 184, 195, 207). The dependency command returned exactly

```text
depcheck: 209 roadmaps, 1484 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line.

**Signatures.** A scratch file with `#check @name` for all fourteen declarations elaborated. Every binder survives: `[NumberField K]` on the four number-field theorems and both predicates; `[FiniteDimensional ℚ_[l] V]`, `[IsScalarTower ℤ_[l] ℚ_[l] V]` and `[IsSemisimpleModule (MonoidAlgebra ℚ_[l] Γ) ρ.asModule]` on `finite_stableLattices`; `[W.IsElliptic]`, `[Fact l.Prime]` on the elliptic statements; `2 ≤ g` on `finite_curves_goodReduction`. `A.dim = ↑g` coerces into `WithBot ℕ∞`; genus is `Module.rank K` of the first structure-sheaf cohomology. Nothing changed.

**Padding probe.** A copy of the file with each `sorry` replaced by `first | (simp; done) | rfl | infer_instance` was elaborated: all ten theorems fail to close (the `first` combinator fails at lines 80, 100, 109, 120, 144, 164, 180, 191, 203, 212). No declaration restates a definition, mirrors a Check or computes a value. The two `def`s have real bodies on native carriers (`CommGrp (Over …)`, `Submodule.IsLattice`).

**Headline theorems.** The README's end theorems are Satz 1 (R28.1.11), the corrected Satz 2 (R28.3.4), Sätze 3–4 (R28.4.5), the isogeny criterion (R28.4.7), Satz 5 (R28.5.3), Satz 6 and its unpolarized form (R28.5.11, R28.5.13), curve finiteness (R28.5.15) and elliptic isogeny-class finiteness (R28.6.5), with stable-lattice finiteness (R28.5.9) and direct-factor finiteness (R28.5.12) in the headline table. The Lean states R28.5.3, R28.5.9, R28.5.12, R28.5.13, R28.5.15 and R28.6.2–R28.6.5 on Tau Ceti's abelian varieties and Weierstrass curves. The docstring names R28.1.11, R28.2.1, R28.2.9, R28.3.4, R28.4.5–R28.4.8, R28.5.11, R28.5.14 and R28.6.7 as not statable and says what each lacks (semiabelian models and heights; the scheme-theoretic Tate representation; polarizations; Jacobians with their polarization). I checked the pins for those carriers: there is no polarization, no Tate module of a `TauCeti.AlgebraicGeometry.AbelianVariety`, no semiabelian model and no Jacobian of a scheme, so the list is right and no headline is forced through a stand-in.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`):

| File at the pin | What was checked |
| --- | --- |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43–50` | `localPolynomial` is computed on `W.minimal R`; in the good case it is `1 − C a X + C q X²` with `a = q + 1 − #Point`, so `coeff 1 = −a_v` as the README says (2749–2752); bad cases give `1 − X`, `1 + X`, `1`. |
| `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:475` | `valuationSubringAtPrime` is the localisation of `𝓞 K` at `v`, a non-complete DVR; the README's "native local ring" (2086–2087) matches. |
| `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40` | `GeometricallyConnected f`: every fibre over a field point is connected. |
| `Mathlib/Algebra/Module/Lattice.lean:67` | `Submodule.IsLattice`: finite generation and full span; no stability built in, hence the second conjunct of `isStableLattice`. |
| `TauCeti/RepresentationTheory/Induction/Mackey/Decomposition.lean:42` | `Rep.mackeyDecomposition` exists at the pin (the README's "pinned" at 371 is correct). |
| `TauCeti/Algebra/Module/Lattice.lean:73, 115` | `Submodule.IsLattice.finrank_eq_finrank`, `LinearEquiv.extendOfIsLattice` (needs `Module.Free R S`). |
| `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:293` | `AlgHom.centralizer_centralizer_range` needs `Module.Finite K N` and `IsSemisimpleRing S`. |
| `TauCeti/LinearAlgebra/QuadraticForm/FourSquares.lean:41` | `QuadraticMap.euler_four_squares` is the quadratic-map identity, distinct from the matrix identity owned here. |
| `TauCeti/NumberTheory/LocalField/Different/Wild.lean:61` | the wild different bound `≤ e − 1 + v(e)`. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/{Basic,Galois}.lean:94, 71` | rank two under `(ℓ : K) ≠ 0`; the Galois action on geometric points. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/{MulByInt/Hom,Hom/Basic,Hom/Add}.lean:63, 258, 282` | `degree_zsmul`, `comp_eq_zero_iff`, `add_comp`. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/{Basic,Product,Isogeny,End/Basic}.lean` | `AbelianVariety`, `dim : WithBot ℕ∞`, `prod`, `baseChange`, `IsIsogeny`, `End`. |

Every other Mathlib and Tau Ceti name in the contracts (40 Mathlib, 20 Tau Ceti) was located at the pin by file and line; `TauCeti.NumberField.finite_of_finrank_le_of_ramifiedSupport_subset` is absent at the pin, as the README states (R03 above).

**Cross-roadmap citations resolved** (on main, or at the open head the index serves):

| Supplier (where read) | Resolved |
| --- | --- |
| ArakelovGeometryAndAbelianHeights (#1000 head) | §2.0 `GroupScheme.IsSemiAbelianFamily` (671), `semiAbelianHom_extend` (673); §1.3 `arakelovDegree_eq_infinitePlace` (238), `_rescale` (241, `+[K:ℚ]·c`, so `c = −log t` gives the README's `−[K:ℚ] log t`), `_ofFractionalIdeal` (242, `−log N(𝔞) + Σ mult·λ_v`, matching `λ_v = −log c_v`); §2.1 `faltingsInner` (692, conjugate-linear in the first argument); §§5.0a–5.0b `ToroidalCompactification`, `toroidalFamily` (1345), `MinimalCompactification`, `minimalHodgePower`, `toroidalToMinimal`, `minimalHodgePower_pullback` (1362, over all of `Spec ℤ`); §5.1 `HasLogSingularities` and its three API names (1382–1388); §5.4 `modularMetric_logSing` (1480); Layers 3 and 4 headings as cited. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) | R07.1.3 `finitePart` (731), R07.1.8 `BarsottiTate.tateModule` (990), R07.1.14 `dim` (1249), R07.1.16 `discr_level` (1299), R07.1.17 `invariantDifferentialsAndAbsoluteDifferent` (1320), R07.1.19 `hodgeTate` (1700), R07.1.20 `schematicClosure_flat` (1739), R07.1.20a `quotientFiniteFlatSubgroup` (1782), R07.1.21 `exists_of_tateModule_summand` (1811), R07.1.33 `raynaudDeterminantTameDifferent` (2386): section numbers all agree. |
| ArithmeticGaloisRepresentations (#856) | §1.3 "Induction from open subgroups" holds "The Mackey decomposition" (940, `H` open, `D` closed in compact `Γ`) and "The determinant of an induced representation" (949, `sgn^r · (det U ∘ Ver)`); §1.6 (1026); §1.8 `ContinuousRep.iso_of_charpoly_eq` (1147); §5.1 `GaloisRep.frobeniusSet` (3149); §5.3 `iso_of_frobenius_charpoly_eq` (3206); §6.1 (3632) `TateModule.tateModuleRep` (3714), "The elliptic comparison" (3777), "Functoriality of the arithmetic adapter" (3812); §6.3 `TateModule.localEulerFactor` (3963, geometric Frobenius on `H¹` inertia invariants); §7.1 `ContinuousRep.extPower` (4104). |
| AbelianSchemesAndArithmeticModuli (#849) | A0.2 (678), A1.3 (780), A1.6 (909), A2.2 (1084), A2.5 (1211), A3.3 (1472), A3.6 `ThetaGroup.commutator/descend` (1592–1596), A3.7 (1631), A4.1 (1833), A6.1 (2817), A6.2 (2843), A6.5 (2907), A6.7 (2939), A6.8 (2959), A6.11 (3028), A6.13 (3057), A6.18 (3256), A6.20 (3332), A6.33 (3744), A6.38 (3853). The two sub-names of R01 are the only misses. |
| NeronModelsAndSemistableAbelianVarieties (#852) | §2.4 `ToricCharacter` (1169); §3.1 `SemistableReduction`, `toric_zero` (1377); §3.2 (1401); §3.3 (1433); §3.5 `ToricFiniteFiltration`, `FiniteFlatToricFiltration` (1507, 1524); §3.6 `Orthogonality`, `FiniteFlatOrthogonality` (1583, 1587); §3.7 (1628); §3.9 `PicardNeronIdentity` (1697); §3.10 both names (1722, 1726); §3.11 (1780); §3.12 (1813); §3.13 (1867); §4.13 (2672); §5.1 (2936); §5.2 `GoodIsogeny` (2999); §6.4 (3787); §6.5 `EquationGoodComparison` (3996). |
| PELModuli (#966) | M2.1 `rigidity` (2186); M6.3 `siegelStack` (3819, "M2.8 gives fine smooth algebraic spaces at levels 3 and 4"); M6.5 `coarseModuli` (3871); M6.7 `descentObstruction` (3932); M6.9 `PELModuli.hodgeLine` (4010); M6.10 `PELModuli.moduliPoint` (4043). |
| JacobianChallengePartII (#1225) | §1.2, §1.3, §1.3a, §1.4 "Canonical principal polarization" (258: `λ_X` without a global degree-one bundle, compatible with base change, equal to `φ_{O(θ_α)}` on a field fibre with a degree-one divisor); §§6.1–6.3 (1011–1035). The unpointed clause used in R28.5.14 is supplied there, not by Milne III 6.6 alone. |
| AbelianSchemesAndArithmeticModuliPartII (#1405) | B4.1 (1984) states strong geometric Torelli with `j′∘α = εβ∘j + c` for genus `g ≥ 2` over an algebraically closed field, as cited at 346–350. |
| PadicDifferentialEquationsAndRigidCohomology (#1002) | RD.5.116 "Zarhin's trick" (11335), étale-local polarization hypothesis, relative dimension `8·dim A`. |
| AdelicAlgebraicGroups (#792) | §3.3 "Primitive reduction and closed orbits" (2959) with the three bullet targets at 3109, 3127, 3135. |
| WeightsInEtaleCohomology (#1001) | Layer 2 is labelled R34.2 (273); §2.1 and §2.2 carry the two cited titles (277, 291). |
| DeligneWeightsAndPurity (#929) | §0.14 (767), §1.4 (960). |
| ShimuraVarieties (#933) | §2.7 `TauCeti.Shimura.baily_borel` (630), §8.18 `CanonicalModel.minimal_defined_over_reflex` (2622). |
| ArithmeticGaloisDuality (#858) | R02.3.1 `RestrictedRamification.finite_unramifiedOutside_of_finrank_le` (1954). |
| PadicPeriodRings (#940) | §2 `tateSen_H0/H1`, `tateSen_character` (368–370). |
| ComplexComparisonPartII (#848) | C0.3 `holomorphicBundleDictionary` (1020), C0.4 `CoherentAnalytification` (1071). |
| On main | SchemeAndStackFoundations §§0.20–0.21 (1302, 1394), §1.1 (2071), §1.18–§1.20 (2745, 2817, 2843; §1.20 owns `Stacks.ValuativeLift`, `StackDVRLiftingAfterExtension` and `IsProperStack.ofDVRLifting`, the sufficiency direction only, so the existence step owned in R28.1.4 is not a duplicate), §2.20, §3.2, §3.5, §3.6, §3.8, §4.15; AlgebraicVectorBundles L0B–L0C with `determinantObj` (`Suggested.lean:344`); ClassicalArithmeticCompletion §7.4 (14393), §7.21 (14867), §7.56 (15757, nondegenerate regular trace, as the README's proof route assumes); DiophantineApproximationAndTranscendence §0.2 `mulHeight_pow_finrank` (269, `Hrel,K(x)^[L:K] = Hrel,L(x)`), §0.3 `finite_setOf_absMulHeight₁_le` (364); HeightsAndUnits Layer 1 instances (`Suggested.lean:132, 135`); ClassFieldTheory Layer 13 `kroneckerWeber`; Chebotarev Layer 10 `hasDirichletDensity_frobeniusPrimeSet`; GlobalNumberFields Layer 10; NumberFieldArithmetic §§4.3, 6.4; LocalFieldsRamification Layer 3; EllipticCurves Layers 1, 2, 4; JacobianChallenge Layers D, E; RepresentationTheory/SemisimpleAlgebras Layers 2, 6. |

**Ownership.** The objects of the headline declarations were searched by name and by object over main and the 440 indexed open heads. No other roadmap declares `finite_stableLattices`, `finite_directFactors`, `finite_isogenyClasses`, `shafarevich_unpolarized`, `finite_curves_goodReduction` or the elliptic statements; FaltingsFinitenessAndIsogenyTheoremsPartII (#1738) declares only `regularOrderDiscriminant`, `class_index_bound` and `elliptic_isogeny_j_height_bound`. MordellLawrenceVenkatesh, AbelianVarietiesOverFiniteFields, CurvesOverFiniteFields and AdelicImagesAndModularCurves consume R28.5.1–R28.5.2 and R28.6 from here (they still cite the old names `finite_weilPolynomials`, `tate_semisimple`, `tate_end_iso`, `isogenous_iff_localFactors`, which this head no longer declares; that is their drift, not this roadmap's). No AlgebraicModuli target states the proper-stack lifting criterion of R28.1.4 (its only valuative mention is line 9817, for `P⁰ → B`). Ownership against pull requests the brief does not index was not checked.

**Sources for the seeded sample** (cache texts; `dm1969` = `79316edb…`, `yu` = `1e54bd79…`, `milne-av` = `f5ca4e63…` with printed page = PDF page − 6, `faltings-1983` = `f72a869f…` OCR with PDF page = printed − 347, `zarhin` = `45858dbb…`):

| Target | Locator read | Outcome |
| --- | --- | --- |
| Integral lifting after a finite extension | `dm1969 lines 1091–1104`, Theorem (4.19), printed p. 103 | For `f` separated of finite type over a Noetherian scheme and any DVR `V` with fraction field `K`, properness is equivalent to: every `Spec K → T` extends over the integral closure `V'` of `V` in some finite `K'/K`. Supports the local step with the finite extension exactly as stated; the global gluing is this roadmap's. |
| Local maximal-order lattices | `yu lines 524–597`: §4.3 (complete), Lemma 4.4, Theorem 4.5, §4.4 (DVR), Theorem 4.8(2) on printed pp. 13–14 | 4.8(2): over any DVR, lattices over a maximal order in a central simple algebra are isomorphic iff they have the same rank; the README's DVR generality and complete-case uniqueness of the division-algebra maximal order (only complete, `line 594–597`) agree with the source. |
| Arithmetic closed-orbit adapter | `milne-av lines 2689–2694`, I Theorem 15.5, printed p. 65 | Reductive `G`, arithmetic `Γ`, `Γ`-stable lattice `L`, closed orbit `X`: `L ∩ X` is finitely many `Γ`-orbits; Remark 15.6(c) (2730–2733) reads closedness over `k^al`, as the README's "geometrically closed" does. |
| Integral idempotents | `milne-av lines 2683–2686` (Prop. 15.4, p. 65), `2748–2767` (Application 15.8, pp. 66–67) | Finiteness of `R^×`-classes of idempotents in an order of a semisimple `ℚ`-algebra, reduced to 15.5; the source argues closedness by identifying the orbit with a Grassmannian (see Source issues), the README by `e² = e`, `tr e = r` in each block, which is correct. |
| Canonical polarization without a curve point | `milne-av lines 4281–4292` (III 6.6, p. 105), `4381–4400` (Summary 6.11, pp. 107–108) | Both assume a `k`-rational point `P`; the README cites them for the pointed theta polarization and takes the unpointed, base-change-compatible form from JacobianChallengePartII §1.4, which states it. |
| (headlines) | `faltings-1983 lines 570–572` (Satz 5, p. 362), `605–608` (Satz 6, p. 363), `679–681` (Korollar 1, p. 365), `707–709` (Bemerkung 2, p. 365); `milne-av 5365–5367` (IV 1.4, p. 132), `5932–5938` (IV 4.1–4.3, p. 144), `2665–2666` (I 15.3, p. 64); `zarhin 45–61` (1.1(ii), p. 2) | All locators correct; Satz 5's proof bounds the test extensions by degree `l^{8g²}` (line 579), which is the README's `l^{2d²}` at `d = 2g`. |

No README locator is flagged unverified.

**Adversarial pass.** Values were recomputed with a script (point counts by enumeration from the displayed Weierstrass equations, matrix products, discriminants by the standard `b₂, b₄, b₆, b₈` formula, root-modulus enumeration) or by hand where noted. "Retain" means the stated form survives the instance; no row asserts a proof of a finiteness theorem.

| Statement / convention | Instances | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Hodge metric factor (Conventions, R28.1.1) | `g = 2, 3` | `(i/2)² = −1/4` vs `2^{−2} i^{4} = +1/4`; `(i/2)³ = −i/8` vs `2^{−3} i^{9} = +i/8`; ratio `(−1)^{g(g−1)/2}` | Retain the corrected factor; `g = 1`: both `i/2`. |
| Faltings inner product orientation (515) | `α = dz, β = i dz`, area 1 | `⟨α,β⟩ = (i/2)∫ β ∧ ᾱ = i`, swapped gives `−i` | Conjugate-linear in the first argument, as the supplier's line 692. |
| Integral lifting, `ℙ¹` control (745) | `X = ℙ¹_R`, point `[1:2]` | Extends as the section `[1:2]` over `R`, `L = K`, valuative criterion of the scheme | Retain. |
| Integral lifting, `B(ℤ/2)` control (746–749) | generic torsor `ℚ(√2)` over `ℤ_(2)` | `disc = 8`, `v₂ = 3 ≠ 0`: ramified, no étale torsor over `ℤ_(2)`; over `ℚ(√2)` the torsor is `ℚ(√2) × ℚ(√2)`, trivial, extends; the extension `ℚ(√2)/ℚ` is ramified at 2 | Shows ramification must be allowed; agrees with DM 4.19. |
| Integral lifting, `𝔾_m` control (750–751) | generic point `2` | `v₂(2) = 1`; after any extension of ramification index `e`, valuation `e ≥ 1`, never a unit | Properness needed; retain. |
| R28.1.4 uniformity | `e_g = e_1·d^{gr}` | `d` = lcm over components of `U`, `e_1` from a finite atlas: both depend on `(g, J, r, M)` only | Retain; the lifting step does not change `e_g`. |
| R28.1.5 degree, section independence | `P = R`, trivial metric, `p = 1`, `p = x` | `0`; `log|N(x)| − log|N(x)| = 0` | Retain. |
| R28.1.5 fractional ideal | `I = ½ℤ`, `c = 1`, section `½` | `−log N(I) = log 2`; `log #(I/ℤ·½) − log|½| = 0 + log 2` | Retain; supplier's `λ_v = −log c_v` orientation agrees. |
| R28.1.5 rescaling | unit ideal, factor `t = 2` over `ℚ`, over `ℚ(i)` | `−log 2`; `−2 log 2`; supplier `+[K:ℚ]·c` with `c = −log 2` | Retain sign and weight. |
| R28.1.6 logarithmic metric | `‖1‖(t) = |log|t||`, `|t| ≤ ½`, `s = −log|t|` | `s ≤ 1+s`; `1/s ≤ 1.4427 < 1.6931 = 1+log 2`; `(log 2)(1+log 2) = 1.1736 > 1` | `C = n = 1` works on the punctured disc. |
| R28.1.6 power pole | `‖1‖ = |t|^{−1/2}` | ratio to `C(1+|log|t||)^n` → `∞` | Excluded; retain. |
| R28.1.8 Northcott comparison | `K = ℚ(i)`, `x_N = (N:1)` | `h_1 = ½ log(N²+1)`; `logHeight = 2 log N`; difference `½ log(1+N^{−2}) → 0` after dividing by `[K:ℚ] = 2`, `→ −∞` without | Division by the degree is necessary; retain. |
| R28.1.9 different bound | `ℚ₂(√2)/ℚ₂` | `e = 2`, `v(𝔇) = 3 = e − 1 + v_𝔓(2) = 1 + 2` | Wild bound exact here; retain. |
| R28.1.9 fixed-degree adapter | `K = ℚ`, `S = {2, ∞}`, degree 2 | fields `ℚ(i), ℚ(√2), ℚ(√−2)` (`disc −4, 8, −8`); degree-`≤2` set also has `ℚ` | Adapter removes `ℚ`; retain. |
| R28.1.10 rigidity level | `[−1]` on `A[2]`, `A[3]` | `−I = I` mod 2; `−I ≠ I` mod 3 | Level 2 fails; retain `n ≥ 3`. |
| R28.1.12 isotropic kernels | `E`, `λ = 2λ_E`, `H` cyclic of order 2; `H = E[2]` | `4 = deg μ · 2²` gives `deg μ = 1`; `4 = deg μ · 4²` has no integral solution | Both directions distinguish; retain. |
| R28.1.12 rational maximality | `y² = x³ − x + 1` over `ℚ` | `X³ − X + 1` at `±1` gives `1, 1`: irreducible, no rational line in `E[2]`; zero subgroup has order `1 ≠ 2` | Geometric Lagrangian condition needed; retain. |
| R28.1.13 uniform principal reduction | `g = 1`, `m = p²`, `H = B[p]` | `e_{p²}(x, py') = e_{p²}(px, y') = 1` for `x ∈ B[p]`; `#H = p² = √(p⁴)` | Maximal isotropic; `B' ≅ B`; retain. |
| R28.2.1 isogeny height formula | `[n]`, dimension `g`, degree `m` | `deg = n^{2g}`, `#s^*Ω¹ = n^{gm}`; `½·2g log n − (1/m)·gm log n = 0` | Retain. |
| R28.2.2 valuation bounds | `g = 2, m = 3, v_p(deg) = 1` | lower `m − 2gm = −9 = −(2g−1)m`; upper `3 = m` | Retain. |
| R28.2.2 sharpness | étale kernel of degree `p`, dual with kernel `μ_p` | valuations `+m` and `−m` versus `v_p(deg φ) = 1` | Factor `m` needed; retain. |
| R28.2.4 differential count | `μ_{l^∞}^{h'}`, étale `Γ`, ramified `K_i` | `l^{n m_i h'}`; `1`; `#(R_i/lR_i) = l^{m_i} ≠ l^{f_i}` | Retain `m_i`. |
| R28.2.5 twist sign | multiplicative, étale height-one | `C(1)`, `C(0)`; opposite sign would force `Σ m_i d_i = −mh/2` | Retain `+1` per formal dimension. |
| R28.2.6 characters | `χ = χ_0` at `l = 2`; quadratic `χ` | `a = 1`, `ψ = χ_0 mod 4`, order `2`; `a = 0` | Retain `q = 4` at 2. |
| R28.2.7 induced determinant (1363–1366) | trivial line of `{1} ⊂ C₂` | `[[0,1],[1,0]]`, determinant `−1 = sgn·1`; restriction `= 1 ⊕ 1` | Retain. |
| R28.2.9 identity | `K` quadratic, `l` inert, `G = E[l^∞]`; CM split `G = E[𝔩^∞]` | `2·1 = 2 = 2·2/2`; `1·1 + 1·0 = 1 = 2·1/2` | Retain local degrees. |
| R28.3.2 toy defect | `T = ℤ_l²`, `V(H) = ℚ_l(1,l)`, `T(G) = ℤ_l e₁` | `Q = l^{−1}ℤ_l e₁ ⊋ ℤ_l e₁` (defect `l`) at `k = 0`; at `k = 1`, `T(A_1) ∩ V(G) = l^{−1}ℤ_l e₁ = Q` (defect 1) | Retain. |
| R28.3.4 stationarity | `G = A[l^∞]` | `A_n ≅ A`, increment `n log l·(2g/2 − g) = 0` | Consistent; stationarity not constancy in general. |
| R28.3.5 polarization reduction | `λ = n λ_E`, cyclic `H` | `deg π = n = √(n²)`, `deg μ = 1` | Retain. |
| R28.4.1 four squares | `l = 2`: `(a,1,1,2)`, `F = X² + 7`; `l = 3`: `b = 1, c = 0` | `|F(1)|₂ = 1/8 < 1/4 = |F'(1)|₂²`; `1 ≡ −2 (mod 3)`, `a² = −2`, `a ≡ ±1` | Hensel applies at both; retain. |
| R28.4.2 matrix identity | `(2,3,5,7)` | `v·vᵀ = vᵀ·v = 87·I`, all off-diagonal `0` | Retain. |
| R28.4.2 right multiplication | `(0,1,0,0)` on `(x₁,…,x₄)`; on `e₃` | `(−x₂, x₁, x₄, −x₃)`; `e₃ ↦ −e₄` | Retain right-multiplication label. |
| R28.4.2 graphs, characteristic two (1813–1816) | `V = 𝔽₂²`, `W = ⟨e₁⟩ = W^⊥`, `v = I₄` | both graphs equal, `16` elements each, sum `16`, dimension `4`; external sum `256` | Ordinary sum; directness only under `2 ≠ 0`: R01 of the previous review repaired. |
| R28.4.2 degenerate form (1805–1807) | `𝔽₅`, `V = 𝔽₅`, `e = 0`, `W = V = W^⊥`, `v = 2I₄` | `v vᵀ = 4 = −1`; graphs `{(x,2x)}`, `{(y,−2y)}` meet in `0`, sum dimension `8 ≠ 4·dim V = 4` | Nondegeneracy needed for the dimension; retain. |
| R28.4.2 isotropy/recovery | `(s,t) = (x+y, v(x−y))`, `2 ≠ 0` | cross term `2e(x,y) = 0`; `½(s + v^{−1}t) = x` | Retain. |
| R28.4.2 identity-graph control | `v = I`, symplectic pair | pairing `1 + 1 = 2 ≠ 0` | Retain. |
| R28.4.5 End comparison | `y² = x³ − x` over `ℚ` vs `ℚ(i)` | ranks `1` vs `2` | Ground field retained. |
| R28.4.7 local factors | `11a1`: `a_2,a_3,a_5,a_7 = −2,−1,1,−2`; `37a1`: `−2,−3,−2,−1`; `37b1`: `0,1,0,−1` | 37 pair agree at `7` only | Finitely many places do not decide; retain. |
| R28.5.1 Weil polynomials | `n = 2`, `r = √2` | `(a,b) ∈ {(−2,2),(−1,2),(0,2),(1,2),(2,2),(0,−2)}`: six | Retain; `1 + 2T + 2T²` is the reverse of `X² + 2X + 2`. |
| R28.5.1 boundaries | `n = 0`; `r = 0`; `r < 0, n > 0` | `{1}`; `{X^n}`; `∅` | Retain. |
| R28.5.2 bound | `d = 2g`, two representations | rank `≤ 8g²`, `#(M/lM)^× < l^{8g²}` | Agrees with `faltings-1983 line 579`. |
| R28.5.3 / `finite_isogenyClasses` | `g = 0`; `K = ℚ`, `S = {11}` | one class; the `11a` class is one isogeny class with three isomorphism classes | Boundary and distinction consistent. |
| `hasGoodReductionAt` Checks | `y² = x³ − x` at 5; `𝔽₂[ε]/(ε²)` fibre | `Δ = 64 ≡ 4 (mod 5)`, unit; `ε ≠ 0`, `ε² = 0`, not reduced | Retain. |
| R28.5.4 auxiliary bound | `11a1`, `p = 2`, `(h,j,±)` with `j ≠ h/2` | evaluations `1, −3, 5, 1, 10, 2, −1, −3`; primes `{2,3,5}`; `np = 22` so `N = 22` works, `21` fails | Retain. |
| R28.5.4 negative control | `(11a1)³` | `P_1(8) = 82³`, `82 = 2·41`, `41 > 22` | Bound depends on `A`; retain. |
| R28.5.6 mod-`l` characters | `l ≡ 3 (mod 4)` | character of `ℚ(√−l)` is `χ_0^{(l−1)/2}` | Retain. |
| R28.5.9 lattice classification | `D = F`, `R, πR`; `𝔽₂[[t]]`, `𝔽₂[t]_(t)` | `π·` is an isomorphism `R → πR`, `R/πR ≠ 0`; `R/tR` has two elements in both DVRs | Isomorphic, not equal; the non-complete DVR is now covered (R04 repaired). |
| R28.5.9 Morita | `O = M₂(R)` on `F²` | simple lattice `R²` has `R`-rank `2`; free rank-one `O`-module has rank `4` | Morita, not freeness; retain. |
| R28.5.9 / `finite_stableLattices` | trivial `Γ` on `ℚ_l²`; `V = 0` | one class, `diag(1,l^k)` carries `ℤ_l²` to `ℤ_l ⊕ l^kℤ_l`; `F = {⊥}` | Retain. |
| `finite_stableLattices` non-semisimple control | `u = (1 1; 0 1)` on `L_k = ℤ_l e₁ ⊕ l^kℤ_l e₂` | `(u−1)L_k = l^kℤ_l e₁`, coinvariants `ℤ_l ⊕ ℤ_l/l^k`, torsion `l^k` pairwise distinct | Semisimplicity necessary; retain hypothesis. |
| `isStableLattice` whole-group invariance | `Γ = ℤ` acting by `l` on `ℚ_l` | `l·ℤ_l ⊆ ℤ_l` but `l^{−1}·1 ∉ ℤ_l`; no stable lattice, hypothesis `h` fails | Statement vacuous there, not false. |
| `finite_stableLattices` discrete `Γ` | any abstract group with semisimple `ρ` and stable `Λ_0` | `O = ℤ_l⟨ρ(Γ)⟩ ⊆ End(Λ_0)`, finitely generated, an order | The proof route needs no topology on `Γ`; Lean generality equals the README's. |
| R28.5.12 closed-orbit adapter | `E = M₂(ℚ)`, `O = M₂(ℤ)`: `(1 n; 0 0)`; `nE₁₂` | `(1 n;0 1)·diag(1,0)·(1 −n;0 1) = (1 −n; 0 0)`: one class; `gcd` of entries `n` is a `GL₂(ℤ)`-invariant: infinitely many classes | Closedness essential; retain. |
| R28.5.12 integral idempotents | `O = ℤ`; `O = M₂(ℤ)`; `(1 1/n; 0 0)` | `{0,1}`; ranks `0,1,2` with image and kernel saturated, so `3` classes; denominator `n` invariant | Retain; rational idempotents excluded. |
| `finite_directFactors` | `A = E²`, `End E = ℤ` | factors `0, E, E²` | Consistent. |
| `shafarevich_unpolarized` | `g = 0`; `g = 1`, `K = ℚ`, `S = {2}` | one class; Ogg's list (count not independently certified) | Consistent. |
| R28.5.14 no-point polarization | `y² = −(x⁶+1)` over `ℚ` | genus `(6−2)/2 = 2`; `−(x⁶+1) ≤ −1` for real `x`; at infinity `z² = −(1+u⁶)`, `z² = −1` at `u = 0`: no real point | Unpointed supplier clause necessary and present. |
| R28.5.14 Torelli sign | non-hyperelliptic `C = C′`, `β = −id`, `P = P′` | unique triple `(id, −, 0)` | Retain. |
| `curveHasGoodReductionAt` Checks | `ℙ¹_{ℤ_(2)}`; `y² = x⁵ − x + 1` at 5; `y² = x³ + x² + 5` at 5 | genus `0` (theorem adds `g ≥ 2`); `f' ≡ −1`, at infinity `z² = u − u⁵ + u⁶` with `∂_u = −1`; `Δ = −11120`, reduction `y² = x²(x+1)`, tangent cone `(y−x)(y+x)` | Retain. |
| `finite_curves_goodReduction` hypotheses | smooth, proper, geometrically connected, `topologicalKrullDim = 1`, `rank H¹(O) = g` | `GeometricallyConnected` at the pin means connected fibres over every field point; smooth plus connected gives integral | Lean generality equals the README's. |
| R28.6.1 bridge | `[2]`; zero map | degree `4 = 2²`; zero is not finite surjective | Retain. |
| `ellipticRationalRepresentation` | complex conjugation, `K = ℚ`, any `l` including `2` | determinant `χ_0(c) = −1`; eigenvalues `1, −1` | Retain. |
| `elliptic_semisimple` | `y² = x³ − x` over `ℚ(i)`, `l ≡ 1, 3 (mod 4)` | `ℚ_l ⊗ ℚ(i) = ℚ_l × ℚ_l` (two characters) vs the unramified quadratic field (irreducible over `ℚ_l`) | Semisimple in both; retain. |
| `elliptic_tate_hom_iso` | `E = E′`, `[2]`; `37a1`, `37b1` | `1 ⊗ [2]` acts as `2I₂`; both sides `0` since `a_2 = −2 ≠ 0` | Pure-tensor clause fixes the map; retain. |
| `elliptic_isogenous_iff_rationalTateModule` | `E = E′` | identity isogeny; identity module isomorphism | Both directions consistent. |
| `elliptic_isogenous_iff_ap` coefficient | good place | `localPolynomial = 1 − aX + qX²`, `coeff 1 = −a_v` (pin line 47) | Trace criterion correctly encoded; bad places are cofinitely irrelevant. |
| `finite_ellipticIsogenyClass` | `11a1` | three classes; `Hom(11a1,11a2)` degree `5`, `Hom(11a2,11a3)` degree `25 = 5·5` | Consistent with R28.6.6. |
| R28.6.7 centralizer reduction | `O = ℤ_l[ε]/ε²`, `ε = lE₁₂` | integral centralizer `(a b; 0 a)` rank `2`; mod `l` all of `M₂(𝔽_l)`, dimension `4` | Separability essential; retain. |
| R28.6.7 CM image | split `l`; inert `l` | diagonal plus antidiagonal span `4`; `ℤ_{l²} ⊕ ℤ_{l²} j` has rank `4` | Retain. |

**Shape.** Every layer ends with `### Examples` and `### Dependencies`; every definition kept in Lean has an API list and at least three Checks (`hasGoodReductionAt`: four; `isStableLattice`: three; `curveHasGoodReductionAt`: three; `ellipticRationalRepresentation`: the R28.6.2 Checks); every theorem carries a locator and a `*Needs:*` line; the README's backticked local names are exactly the fourteen declarations. No `optional`, `deferred`, pull-request number, round label or local path remains, apart from the revision hashes of R03.

## Not verifiable

- SGA 7 I, Exposé IX §§7.3–7.4; Faltings–Chai V §§4.2–4.5; Martens; Ogg's 24-curve count; Mumford §23; Reiner 18.1/18.7: no legal text in the cache or through the sources service (same state as the previous review). Ogg's count is cited as illustration only.
- The Faltings scan is OCR; the archimedean scalar `(i/2)^g` on p. 353 and the erratum's part (b) are only partly legible. The sign correction was checked algebraically above, not against the printed glyphs.
- Ownership against open pull requests that the brief does not index was not checked.
- No admitted headline is claimed proved; the table records computed controls and the resolution of every input the proof routes name.

## Source issues

- **Error** in milne-av at I Application 15.8, printed pp. 66–67: the source says the conjugacy orbit of a rank-`r` idempotent is the Grassmannian of its images; it should be the space of image–kernel decompositions, cut out by `e² = e` and `tr e = r`; affects the proof.
- **Error** in milne-av at I Proposition 15.2 and Application 15.9, printed pp. 64, 67: the source says norm-bounded elements of the lattice fall into finitely many unit orbits with every orbit closed; it should exclude norm zero, where `diag(n,0)` gives infinitely many integral classes; affects a stated result.
- **Error** in faltings-1983 at §4 Satz 2, printed p. 358: the source says all heights along the divisible tower equal the initial height; it should say the sequence is eventually stationary; affects a stated result; corrected in print at the note added in proof, p. 366, and in Invent. Math. 75 (1984), p. 381.
- **Misprint** in faltings-1983 at §6 proof of Satz 6, printed p. 364: the source cites Raynaud as Théorème 4.11; it should be Théorème 4.1.1; affects nothing.
- **Gap** in faltings-1983 at §6 proof of Satz 5, printed pp. 362–363: the source stops at the spanning statement for the traces; it should conclude with Korollar 2 (ii) ⇒ (i) and say that the test places avoid `S` and `l`; affects the proof.
