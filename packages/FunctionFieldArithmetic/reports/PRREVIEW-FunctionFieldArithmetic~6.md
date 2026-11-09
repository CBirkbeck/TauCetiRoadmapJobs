# Review of FunctionFieldArithmetic (pull request #1474 at d62f4a9)

**Verdict:** needs changes

This is a full review. The folder changed by 239 lines since 98e6ff5, all of them in `README.md`; `Suggested.lean` and `metadata.toml` are unchanged. All five findings of the previous review are repaired (table under *Previous findings*).

On this head:
- the gate passes;
- the dependency check reports no problem;
- `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else;
- the one-tactic probe closes none of the 13 theorems.

There are three new findings:
- **R01 (P2).** Layer 2 restates results that AutomorphicLFunctionsAndLocalFactors already owns.
- **R02 (P3).** Two Tau Ceti declarations at the pin are cited only through roadmaps.
- **R03 (P3).** Four roadmaps named under *Downstream consumers* exist nowhere.

## R01 (P2) — §2.2 restates self-dual volume results that §§AL.0.3.1 and AL.0.6.1 own

**Location.**
- README lines 826–831 (§2.2): "Prove selfDual_local_volume: `μ_{ω,v}(O_v) = q_v^(−n_v/2)`; and selfDual_global_volumes: `μ_ω(∏_v O_v) = q^(1−g)`, `μ_ω(A(D)) = q^(deg D + 1 − g)`, `μ_ω(𝔸_K/K) = 1`."
- The API bullets at lines 835–838: the scaling under `ω ↦ fω`, the annihilator `π_v^(−n_v) O_v` of `O_v`, and `μ_ω = q^(1−g) · μ_int`.
- Line 57, under *This roadmap owns*: "the self-dual measure of a rational differential".

**Claim.** Line 95 of this README already gives the self-dual measures to AutomorphicLFunctionsAndLocalFactors, but §2.2 states four of their results again as its own targets. That supplier is earlier in the merge order (94 against 356), so each of these results has two owners:
- the local volume `μ_{ω,v}(O_v) = q_v^(−n_v/2)`;
- the local annihilator of `O_v`;
- the behaviour under `ω ↦ fω`;
- the comparison of the integral and self-dual measures, with quotient volume 1.

Only `μ_ω(A(D)) = q^(deg D+1−g)` is new: it needs the index formula of §2.1. Line 57 also contradicts line 95 about who owns the measure.

**Witness** (AutomorphicLFunctionsAndLocalFactors README at the #924 head):
- **§AL.0.3.1**, for every positive-characteristic local field, so for every `F_v`:
  - line 497: for `V=F`, `(P^m)^∨=P^(−ν−m)` and `vol(O)=q^(−ν/2)`;
  - line 496: `ν(ψ_b)=ν(ψ)+ord(b)`.
- **§AL.0.6.1, line 581**:
  - the conductor of `ψ_v` is `P_v^(−n_v)`, so `ν = n_v`;
  - "Compare the integral local Haar measures and quotient volume with these self-dual measures";
  - the self-dual measures are compatible with `ω↦aω`.

**Repair.**
1. In §2.2, delete selfDual_local_volume and the three API bullets as targets. Cite instead:
   - AutomorphicLFunctionsAndLocalFactors §AL.0.3.1, for `vol(O)=q^(−ν/2)`, the annihilator and `ν(ψ_b)=ν(ψ)+ord b`, with `ν = n_v` from §AL.0.6.1;
   - §AL.0.6.1, for `μ_ω = q^(1−g) μ_int` and `μ_ω(𝔸_K/K) = 1`.
2. Keep selfDual_global_volumes as the divisor-lattice statement `μ_ω(A(D)) = q^(deg D+1−g)`, with its Checks, and update the Layer 6.3 *Needs* (line 2419) to match.
3. At line 57, say "the volumes of divisor lattices for the self-dual measure of §AL.0.6.1".
4. In §2.3's *Needs*, add §§AL.0.1.7–AL.0.1.8 (lines 369 and 385), which give the indicator and coset transforms that fourier_indicator_divisorLattice specializes.

**Test.** On `𝔽_q(t)` with `ω = dt`, §AL.0.3.1 at `∞` with `ν = n_∞ = −2` gives `vol(O_∞) = q^(−(−2)/2) = q`. This is the value of §2.2's first Check. The kept target at `D = 0` then gives `μ_ω(A(0)) = q^(0+1−0) = q`, so the cited statements reproduce everything that was deleted.

## R02 (P3) — The local expansion at every place and the adelic point topology are at the pin but are cited through roadmaps

**Location.**
- Lines 244–247: "`completionIntegersEquivPowerSeries` at a rational place".
- Lines 1132–1134: "(AlgebraicCurves Layer 9; Tau Ceti `Place.completionIntegersEquivPowerSeries` at a rational place), so every statement applies at the places of Layers 0–7".
- Lines 1505–1507: "consume the local expansion isomorphism `ι : F_v ≃ κ(v)((T))` from AlgebraicCurves Layer 9, specified by a coefficient-field section `κ(v) → O_v` and a uniformizer".
- Lines 2295–2296: "with the affine point topology supplied by ReductiveGroupsPartII RG2.0".

**Claim.** The pinned Tau Ceti already has both objects, and the README describes the expansion as available only at rational places. The rules require citing what exists at the pins by exact name and file.
- **(a) The expansion at every place.** §4.5's `ι` is a pinned declaration, defined at every place, not only at rational ones. Applying the `k((T))` theorems (`TauCeti.LaurentSeries.isNonarchimedeanLocalField`, §4.2) at places of degree greater than one needs exactly this form.
- **(b) The point topology.** §6.1's point topology is pinned. ReductiveGroupsPartII RG2.0 itself names it at main lines 452–454 and 478.

**Witness** (pinned Tau Ceti):
- `TauCeti/FieldTheory/FunctionField/Place/Expansion/Laurent/CoefficientField.lean:94`: `TauCeti.Place.completionEquivLaurentSeriesOfSection`. For a coefficient-field section `s` and a uniformizer `t`, it gives `P.Completion ≃+* LaurentSeries P.ResidueField`.
- The same file, line 166: `completionEquivLaurentSeriesResidueField`, an isomorphism `≃ₐ[k]` when the residue field is separable, which holds over finite `k`.
- `Place/Expansion/CoefficientField.lean:252` and `:358`: the integral forms `completionIntegersEquivPowerSeriesOfSection` and `completionIntegersEquivPowerSeriesResidueField`.
- `TauCeti/Topology/Algebra/PointTopology/Basic.lean:110`: `TauCeti.PointTopology.instTopologicalSpaceWithConv`.
- `PointTopology/Group.lean:102`: `TauCeti.PointTopology.isTopologicalGroup`.

**Repair.**
1. Under *From Tau Ceti*, replace "at a rational place" with the four expansion declarations above and their files. Cite them at lines 1133 and 1505–1506; AlgebraicCurves Layer 9 remains the planning owner.
2. In §6.1 and its *Needs* (lines 2295 and 2329), cite `TauCeti.PointTopology.instTopologicalSpaceWithConv` and `TauCeti.PointTopology.isTopologicalGroup`, alongside `TauCeti.AlgHom.instGroup`.

**Test.** At the degree-two place `t²+1` of `𝔽_3(t)`, `completionEquivLaurentSeriesResidueField` gives `F_v ≃ₐ[𝔽_3] 𝔽_9((T))`. That is the input of §4.5's Check at that place, which the rational-place declaration cannot provide.

## R03 (P3) — *Downstream consumers* names four roadmaps that exist nowhere

**Location.** Lines 3327–3333: "**ExcursionOperatorsAndSpectralAction**", "**HigherLocalFieldsAndHigherClassFieldTheory** and **DrinfeldModulesAndTModules**", "**FiniteFieldsAndCharacterSums**".

**Claim.** None of these four names is a roadmap on main, an open pull request, a board package or an entry in the merge order. The roadmaps that actually exist under similar names do not match the listed use:
- ExcursionOperatorsAndSpectralActionPartII (#1832) does not cite this roadmap.
- HigherLocalClassFieldTheory (#1813) does not cite it.
- DrinfeldModulesAndTModulesPartII (#1697) cites Layers 0–5, which is not the listed Layers 3–4.

The list therefore describes uses that no roadmap makes.

**Witness.** `roadmaps list` and `roadmaps grep 'FiniteFieldsAndCharacterSums|HigherLocalFieldsAndHigherClassFieldTheory'` find these names only in this README and in consumer lists of other roadmaps. The merge order has DrinfeldModulesAndTModulesPartII (line 363) and ExcursionOperatorsAndSpectralActionPartII (line 200), but no unsuffixed roadmap.

**Repair.**
- Delete the four names.
- List DrinfeldModulesAndTModulesPartII with "Layers 0–5", the use its README states.
- Optionally add FunctionFieldArithmeticPartII and GlobalShtukasAndFunctionFieldLanglandsPartII, which cite Layers 0, 2, 4, 5 and 6.

**Test.** After the edit, every bold name under *Downstream consumers* resolves with `roadmaps list` or on main.

## Previous findings

| Previous | Status at d62f4a9 | Passage |
| --- | --- | --- |
| R01 (P3): *Curve additive analysis* cited as Layer AL.3 | Repaired | Line 90: "Layer AL.0, §AL.0.6.1 *Curve additive analysis*". Lines 97–104 give AL.3.10.2, AL.3.10.4, AL.3.4.1–3.4.2, AL.3.14.1 and AL.3.10.3 separately. A grep finds no bare "AL.3" citation left. All eight ids are headings at #924 (lines 579, 615, 1632, 1653, 1924, 1930, 1940, 2211) |
| R02 (P3): Layer 7 lacks the Layer 5 edge | Repaired | Line 536: "Layer 7 needs Layers 0, 2, 5 and 6; it uses Layer 5 only through §§5.1–5.5". Line 3272: "Layers 0, 2, 5 (§§5.1–5.5) and 6" |
| R03 (P3): semisimple-only sources cited for reductive `G` | Repaired | Lines 2325–2326, 2370, 2414–2416, 2496–2498, 2544–2548 and 2592–2593 now say "for `G` split semisimple over `𝔽_q`" (BHKT), "for semisimple `G`" (Ciubotaru–Harris) and "Morris I, §§5.3–5.6 … for connected reductive `G`". BHKT Prop. 8.2 is now p. 35 |
| R04 (P3): affine descent cited through ModularCurves | Repaired | Lines 308–327 name `TauCeti.DescentDatum.descended`, `isIso_toBaseChangeDescended_hom`, `isPullback_toDescended` and `TauCeti.homDescentEquiv` with files and hypotheses. The ModularCurves subsection is gone. Lines 281–288 add `profiniteCompletionArtinEquiv` and `localClassFieldCorrespondence` under `[CharZero K]` |
| R05 (P3): Yu's norm at §2.2.3 | Repaired | Lines 562–563: "Yu, §2.2.1, p. 8, for his degree and its sign; Yu, §2.3.4, p. 12, for the norm" |

## Verified sound

### Gate and scope

Head `d62f4a98b53dfdcdc4c88439fc29ecb079a91597`. The diff outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`). Gate rerun on this head:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2258 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. All suppliers precede this roadmap (line 356 of the order):

| Supplier | Order line |
| --- | --- |
| SmoothRepresentationsOfLocalGroups | 25 |
| AdelicAlgebraicGroups | 52 |
| GeometryOfNumbersAndQuadraticArithmetic | 55 |
| ArithmeticGaloisRepresentations | 58 |
| ArithmeticGaloisDuality | 61 |
| DeligneWeightsAndPurity | 72 |
| RelativeJacobiansAndIntegralCurveModels | 73 |
| AutomorphicLFunctionsAndLocalFactors | 94 |
| AutomorphicSpectralTheory | 96 |
| WeilConjectures | 125 |
| MetaplecticAutomorphicForms | 150 |
| LubinTateFormalModulesAndQuasiCanonicalLifts | 345 |

The rest are on main: AlgebraicCurves, ClassFieldTheory, SchemeAndStackFoundations, JacobianChallenge, ReductiveGroupsPartII, EtaleCohomologyFoundations and PadicMeasuresIwasawaAlgebras.

LubinTateFormalModulesAndQuasiCanonicalLifts has no pull request yet. It was resolved in its board package (`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md`), and this pull request must merge after it.

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else, in 20 s. The imports are `import Mathlib` plus three `TauCeti.*` modules, all built.
- **Signatures.** I compared the elaborated types of all 20 declarations (the worker's `#check @` file) with the README statements; all match.
  - `[CharP F p]` is on every Witt declaration.
  - `[Finite k]`, `hF` and `hk` are on every Layer 0 and Layer 5 theorem.
  - `ValuativeRel`, `TopologicalSpace` and `IsNonarchimedeanLocalField` are on both §4.2 `_all` theorems.
  - `effectiveDivisorCount_of_large`'s `2g ≤ n+1` is the README's `n > 2g−2`, and `n+1−g` is never truncated.
  - The file is unchanged since 98e6ff5, so nothing needed rechecking after edits.
- **LaurentSeries topology.** I checked the topology on `(LaurentSeries k)ˣ` used by `localAbelianExistence_laurentSeries` in a scratch file. The instance found is `LaurentSeries.instUniformSpace`, and `rfl` proves it equal to `Valued.toUniformSpace`, the `T`-adic topology. So `IsOpen H` means what the README says.
- **Padding probe.** I ran a scratch copy with each `sorry` replaced by `first | (rfl; done) | (simp; done) | (simp_all; done) | (infer_instance; done) | (trivial; done) | (norm_num; done) | exact TauCeti.ClassFieldTheory.injective_artinMap K | exact TauCeti.ClassFieldTheory.localAbelianExistence H | (aesop; done)`. Every theorem fell through to the failing fallback, so none of the 13 closes and there is no padding.
- **Headlines.** The Summary's end theorems are §§5.3, 4.2, 4.10, 6.4–6.5 and 7.6.
  - §5.3 and §4.2 are stated.
  - §§4.10, 6.4–6.5 and 7.6 are named in the docstring with their missing carriers: étale torsors and Lang covers; reductive adelic automorphic modules; Eisenstein series and densities.
  - The docstring claim that §5.8 lacks place Frobenius classes at the pin holds. `TauCeti/FieldTheory/FunctionField/Frobenius.lean` is about separating elements, and no function-field place Frobenius exists.

### Pinned declarations opened

| File:line (Tau Ceti unless noted) | Content and hypotheses |
| --- | --- |
| `AlgebraicGeometry/Descent/AffineMorphism.lean:80, 111, 130, 405, 435` | `[IsAffineHom p]`, `[IsAffineHom X.hom]`; `descended`, affine over `S`; `isIso_toBaseChangeDescended_hom` and `isPullback_toDescended` under `[Flat p]`, over an arbitrary base |
| `CategoryTheory/EffectiveEpi/Descent.lean:166, 241` | `homDescentEquiv` under `[EffectiveEpi (pullback.fst X.hom p)]` |
| `CategoryTheory/Limits/Shapes/Pullback/DescentDatum.lean:86` | `structure DescentDatum` |
| Mathlib `AlgebraicGeometry/Sites/Fpqc.lean:54, 76, 88, 98, 116, 125` | `fppfTopology` and `fpqcTopology` in `AlgebraicGeometry.Scheme`; subcanonical; `EffectiveEpi` for flat surjective maps that are quasi-compact or locally of finite presentation |
| `NumberTheory/ClassFieldTheory/LocalExistence/Correspondence.lean:79, 138` | `LocalNormSubgroups K` = open subgroups of finite index; `localClassFieldCorrespondence [CharZero K] : LocalNormSubgroups K ≃o AbelianLayer …` |
| `…/LocalExistence/ArtinMap.lean:113, 129` | `injective_artinMap`, `profiniteCompletionArtinEquiv`, both `[CharZero K]` |
| `…/LocalExistence/Existence.lean:159, 176` | `localAbelianExistence [CharZero K]`; the prime-to-`p` form in any characteristic |
| `RingTheory/LaurentSeries/LocalField.lean:118` | `isNonarchimedeanLocalField [Finite K]` |
| `FieldTheory/FunctionField/Divisor/Principal.lean:248`; `RiemannRoch/ClassNumber.lean:82, 143, 203, 211`; `Divisor/Basic.lean:160`; `Differential/CanonicalDivisor.lean:432`; `Place/Degree.lean:243`; `ConstantField.lean:153`; `ArtinSchreier/Genus.lean:350` | `Divisor.poles`, `finite_setOf_isEffective_degree_le`, `finite_ker_degreeClass`, `classNumber`, `classNumber_pos`, `degree_eq_zero_iff`, `degree_weilDifferentialDivisor`, `one_le_degree_of_isFunctionField`, `exists_intermediateField_isIntegrallyClosedIn`, `two_mul_genus_eq_of_exists_reduced_artinSchreier_pole_ratFunc` |
| `Place/Expansion/Laurent/CoefficientField.lean:94, 166, 452`; `Place/Expansion/CoefficientField.lean:252, 358`; `Topology/Algebra/PointTopology/Basic.lean:110`, `Group.lean:102` | The expansion and point-topology declarations of R02, and `traceResidue` |

A grep of the pinned Mathlib and Tau Ceti finds no zeta series, ASW operator, Lubin–Tate module or `L`-polynomial predicate. Layers 3–5 duplicate nothing at the pins.

### Cross-roadmap citations resolved

| Citation | Where | Result |
| --- | --- | --- |
| AL.0.6.1, AL.R.3, AL.3.4.1–2, AL.3.10.2–4, AL.3.14.1 | #924 head 19069a6 | Headings at lines 579, 615, 1632, 1653, 1924, 1930, 1940, 2211. Line 581 contains the adeles, the idele isomorphism, `Pic(X)`, the quotient `q^(g−1)`, the unipotent quotients with integration in stages, the residue character with conductor `P_v^(−n_v)` and Poisson summation. AL.3.10.4 states `χ(a)=ρ(Art_ar(a)⁻¹)`; AL.3.14.1 states `W(t_v)≠0` with `t_v=diag(ϖ_v^(−(n−1)n_v),…,1)`. The overlap of R01 is the only problem |
| ArithmeticGaloisDuality §R02.3.2 | #858, line 2074 | Degree onto `ℤ` (F. K. Schmidt), compact degree-zero classes, `C_F ≅ ker(deg) × ℤ` |
| RelativeJacobians §§1.3–1.5 | #1232, lines 299, 330, 357 | `α : O_{Y_T} ≅ L|_{Y_T}`, the direction the README states |
| SmoothReps SR.2.1–2.3, SR.4.1, SR.4.4 | #1688, lines 1915, 2044, 2204, 3190, 3458 | Exist |
| AdelicAlgebraicGroups AA.0 | #792, line 633 | Countable families of second countable locally compact groups. Layer 1 is for number fields only (Conventions, line 229), which justifies building §6.1 here |
| GeometryOfNumbers §§3.1–3.2 | #851, lines 843, 856, 867, 871, 879 | `hermitianEmbeddingCount`, `finite_hermitian_isometry_formula`, `finite_hermitian_norm_fiber` |
| DeligneWeights §§1.6, 1.9, 3.7 | #929, lines 989, 1025, 1262 | Exist |
| WeilConjectures WC.1, §§1.16, 5.20 | #1208, lines 236, 604, 1080 | Exist |
| MetaplecticAutomorphicForms §§2.5, 3.2a, 3.3, 3.3b | #1063, lines 520, 606, 618, 646 | Exist |
| AutomorphicSpectralTheory §§1.11–1.13, 2.15–2.16, 4.11–4.17 | #925 | All headings exist |
| ArithmeticGaloisRepresentations §§1.8, 2.5, 3.7, 5.13 | #856, lines 1226, 2081, 3063, 3828 | Exist |
| SchemeAndStackFoundations §§1.1, 2.11, 2.16, 3.3, 3.6, 3.7, 5.11 | main, lines 2071, 3656, 3896, 4713, 4905, 4937, 7273 | Exist, with the four named `picardComponent`/`abelMaps_highDegree` targets |
| EtaleCohomologyFoundations F.2.5, F.3, F.10.2, F.10.3 | main, lines 613, 676, 940, 1295 | Exist |
| PadicMeasures §5.1; ReductiveGroupsPartII RG2.0, RG2.0a, RG2.3.7, RG2.4; JacobianChallenge A–D | main | Exist (lines 3172; 437, 943, 5201, 5509; 111–218) |
| LubinTate §§0.1–0.2, 1.1–1.4, 2.1–2.5 | Board package | §0.1 is for any commutative `A`. Layer 1 holds over every DVR with finite residue field; its §1.3 Check gives the additive law for `tX + X^q` over `𝔽_q[[t]]`. Layer 2 is for `K/ℚ_p` only. Line 1854 records this roadmap's §4.1 as a consumer, so there is no cycle |

Consumers: every id that CurvesOverFiniteFields, GlobalShtukas (and Part II), FunctionFieldArithmeticPartII, CountingBundles, GlobalGaloisDeformationsPartII and ExoticMonoidal cite exists here:
- §§0.1–0.3, 2.1, 2.2, 4.8;
- §§5.1–5.8;
- §§6.1–6.6.

`overlaps.md` lists no dropped id.

**Ownership against the closest open roadmaps.**
- ClassFieldTheory (#1215, #1411) excludes `p`-primary existence. This roadmap derives unit-filtration reciprocity from suppliers rather than owning it.
- GlobalShtukas (#1490) consumes Layer 6.
- AutomorphicSpectralTheory (#925) is cited only for its function-field `GLₙ` unramified branch, which does not supply Layer 7.
- The one double ownership is R01.

### Seeded sample (15 targets)

| Target | Locator checked | Outcome |
| --- | --- | --- |
| 0.2 | roquette | Not verifiable (waived). Checked mathematically below. ArithmeticGaloisDuality §R02.3.2 supplies the degree surjectivity |
| 1.2 | hess | Not verifiable (uncertified). Checked mathematically |
| 2.1 | parshin line 291 (eq. (6), §2.1 p. 7); lines 416–420 (p. 10) | `A(D)` and its volume match |
| 2.3 | parshin lines 298–299 and footnote 4 (p. 7); lines 365–382 (p. 9); (9)–(10) at lines 419–420 | Formula (10) matches. The README's three source corrections are correct (see *Source issues*) |
| 3.1 | kw lines 276–278 (Prop. 3.1, p. 6); 280–319 (Thm 3.2, pp. 6–7); 362–399 (Thm 3.4, pp. 8–9) | Match: the perfect pairing, `ϕ₂`, and the inverse limit to `Hom_cont(G_p, ℤ_p)` |
| 3.3 | kw Thm 3.2 as above; lines 722–736 (Prop. 4.3, p. 15) | Match. "pp. 15–16" is one page wide but contains the result |
| 4.5 | milne lines 5072, 5107, 5152 (A.10–A.12, pp. 134–136); kw lines 703–719 (Prop. 4.2, p. 15), 739–755 (Prop. 4.4, pp. 15–16), 1184–1228 (Prop. 4.14, pp. 22–23); conrad_geom lines 41–117 (§2, pp. 1–3); yoshida lines 922–966 (App. I §7, p. 434) | Match. Yoshida p. 434 gives π-adic expansions by representatives, background for R02's pinned isomorphism |
| 4.7 | guignard lines 794–806 (Props 4.11–4.12, pp. 1319–1320), 830–864 (Prop. 4.14, pp. 1320–1321); russell lines 1654–1683 (§3.3, Thm 3.24, p. 34) | Match: `d ≥ N+2g−1`, relative dimension `d−N−g+1`, geometrically connected fibres. Russell works over an algebraically closed field; the README states only the principal-congruence form from it |
| 4.9 | conrad_geom lines 157–171 (Thm 3.2, p. 4) | Cartesian Lang dictionary and least modulus. The Frobenius translation is derived; table row below |
| 5.2 | roquette | Not verifiable (waived). Checked mathematically |
| 5.6 | roquette; WeilConjectures §5.20 (#1208, line 1080) | Roquette not verifiable. §5.20 exists. Checked mathematically |
| 6.3 | bhkt lines 1579–1590 (§8.1, p. 34); ciubotaru_harris lines 380–382 (p. 8); morris1 lines 458–460 (§4.5, p. 102) and 534–547 (§5.4, p. 104, citing SGA 3 XXVI 2.1 and Borel–Tits 3.17) | Match: a `ℤ[1/p]`-valued measure and the semisimple scope, now stated |
| 6.4 | harder lines 234–250 (Thm 1.2.1, Lemma 1.2.2, p. 255), 288–295 (Cor. 1.2.3, p. 256); morris1 lines 420–443 (§§4.1–4.3, p. 101), 529–531 (§5.3, p. 104), 599 (§5.6, p. 106); bhkt lines 1593–1599 (Prop. 8.2, p. 35) | Match. Harder's quotient is on the right, as the README notes |
| 6.7 | yu lines 1934–1935 (Lemma 5.3.3, p. 36), 1943–2033 (proof, pp. 37–38), 366–373 (§2.2.1, p. 8), 569 (§2.3.4, p. 12) | Match. Both source corrections are right (see *Source issues*) |
| 7.6 | fyz lines 628–711 (§2.6, (2.9)–(2.15), Thm 2.8, pp. 13–15) | Match: (2.12) at line 678 is the README formula, including `−½ n² deg ω_X` |

I also checked two corrections outside the sample:
- **FYZ Remark 2.1 (§7.1).** fyz lines 383–393 claim that odd `n` is unobstructed. The README's elliptic counterexample holds; values in the table.
- **FYZ (2.1) (§7.3).** fyz line 422 states it for every `α ∈ M_n(𝔸)`.

### Adversarial table (values computed this round)

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_divisor_degree_eq_one` | `𝔽₂(t)`; `𝔽₄(t)` over `𝔽₂`; real conic | `deg[∞]=1`. Without exact constants every place degree is even, so the image is `2ℤ` and `hk` is needed. A real pointless conic has only even degrees, so `[Finite k]` is needed | Pass | None |
| `riemannRoch_reducedBasis` | `E:y²=x³+x+1/𝔽₅`, `x`, `D=0`; `𝔽_p(t)`, `x=t^p`; non-exact `k̃` | `d=(0,−2)`. At `r=1`, `{1,x}` has dim 2 = `ℓ(2O)`; at `r=2`, `{1,x,x²,y}` has dim 4. Sum `−2=0+1·0−2`. `x=t^p`: `d=(0,−1,…,−1)`, `r=1` gives `1,…,t^p`, dim `p+1=ℓ(p∞)`, sum `1−p`. With `[k̃:k]=2`, `g=2`: the native genus is `2g−1=3`, which would give `−4−n` instead of `−2−n` | Pass | None |
| 2.1 lattices | `𝔽_q(t)`, `D=−∞,−2∞`; `deg v=2` | `i(−∞)=ℓ(−∞)=0`; `i(−2∞)=ℓ(0)=1`; `[A([v]):A(0)]=q²`, not `q` | Pass | None |
| 2.2 volumes (R01) | `𝔽_q(t)`, `ω=dt`; `tω` | `n_∞=−2`, so `μ(O_∞)=q`, identical to §AL.0.3.1's `q^(−ν/2)` at `ν=−2`. `μ(∏O)=q=q^(1−0)`. For `tω`, the factors are `q^(−1/2)` at 0 and `q^(1/2)` at `∞`, product 1 | Pass (math) | R01 |
| 2.3 transforms | `D` arbitrary; translate | Double transform: `q^(deg D+1−g)·q^(2g−2−deg D+1−g)=1`. Coset phase `ψ(cb)` with the positive kernel, consistent with §AL.0.1.8's `ψ(−L)` for the negative kernel | Pass | R01 (Needs) |
| `witt_additiveHilbert90` | `𝔽₄/𝔽₂, n=1`; `p=2,n=2`, `y²+y=t` | `ker(1−σ)=𝔽₂`; `{a+a²}={0,1}=ker Tr`; `Tr` is onto. `(y,0)+(y+1,0)=(1,y²+y)=(1,t)`; coordinatewise addition gives `(1,0)` | Pass | None |
| ASW duality (both lengths) | `𝔽₃`, class 1; `𝔽₂(t)`, `[t]`; `n=0` | `y³−y=1` has `y∈𝔽₂₇` with `Frob y=y+1`, value 1. Geometric Frobenius gives `2 mod 3`, `8 mod 9`. `℘[t]=(t²+t,t³+t²)`; `(t,0)` has order 4. `ZMod 1` and the length-0 quotient are both trivial | Pass | None |
| 3.3 one-pole comparison | `y³−y=t⁻²/𝔽₃`; `m=p` | `2g−2=−6+6=0`. `N₁=1+0+3=4`, `L=1+3T²`, `N₂=9+1+6=16`. `t^(−p)≡t^(−1)` | Pass | None |
| `localAbelianExistence_all` | `𝔽₂((T))`, `H=⟨𝔽₂ˣ,T,1+T²O⟩` | Index 2 = degree of `y²+y=T⁻¹`. `[T⁻¹,T)=Res(T⁻²dT)=0`; `[T⁻¹,1−aT)=−a`. Non-open index-`p` kernels exist (`U¹/(U¹)^p` is infinite) and are excluded by `hH` | Pass | None |
| `injective_artinMap_all` | `𝔽₂((T))`, `1+T` | `1+T` lies in every subgroup of index prime to 2; `[T⁻¹,1+T)=1≠0`, so `Art(1+T)≠1` | Pass | None |
| `localAbelianExistence_laurentSeries` | `H=Kˣ`; topology | `L=K`, `finrank 1 = index 1`. The topology is the `T`-adic one (`rfl` against `Valued.toUniformSpace`) | Pass | None |
| 4.1 LT ramification | `Q=3,m=2`; `Q=2,m=2` | Lower orders 6,3,3,1. `φ(2)=1`, `φ(8)=2`, so upper orders 6,3,1. `Q=2`: 2,2,1 in both numberings | Pass | None |
| 4.4/4.5 conductors | `x=β+p[T^(−m)]`, `m>p`; `𝔽₃`, `[T⁻²]` | Clamped bound at `r=1` is 1; unclamped is `1+⌈log_p(1/m)⌉≤0`. `u₁=3`, `u₂=1+2·3=7`; `3[T⁻²]` gives `u₂=3` | Pass | None |
| 4.5 ray groups | `𝔽_q(t)`: `m=0`, `[0]+[∞]`, `2[0]` | `C_m⁰` of order `1, q−1, q`. `(1+T)²=1+2T`, which is 1 in characteristic 2 | Pass | R02 (citation) |
| 4.7 Abel bundle / Rosenlicht | `ℙ¹`, `m=2[∞]`; elliptic, `m=[P]` | Fibre dim `n−N−g+1`: 0 at `n=1`, 1 at `n=2`. `u=t`: `(t−1)/t=1−T≡1 mod T`, `u([1]−[0])=1≠0`, so modulus `[∞]` fails. `2g+N−1=2` | Pass | None |
| 4.9 Lang Frobenius | `𝔽₃`, `m=2[∞]`, `a=[1]`, place `t²+1`; `𝔽₅`, `z⁴=t`, `t=2` | `(i−1)+(−i−1)=−2=1`; using `a` instead of `2a` gives 2. `z⁵=2z`: arithmetic ×2, geometric ×3 (`2⁻¹ mod 5`) | Pass | None |
| 4.10 classification (headline) | `B=ℤ/4`, `θ=2deg`; `θ(C⁰)=0` | `[B:imθ]=2` components, each a constant quadratic cover; constant degree `|B|` when `θ(a)` generates | Pass | None |
| `zeta_eulerProduct` | `ℙ¹/𝔽₂`, `T²` | `A₂=(2³−1)/1=7`; product `C(4,2)+1=7` (3 rational places, 1 of degree 2) | Pass | None |
| `zeta_logDeriv` | `ℙ¹/𝔽₂`, `r=2` | `2·7=14`; `N₁A₁+N₂A₀=3·3+5·1=14` | Pass | None |
| `effectiveDivisorCount_of_large` | `ℙ¹/𝔽₃, n=2`; `E/𝔽₅, n=1`; `g=1, n=0` | `2·13=26=3³−1`; `4A₁=9·4`, so `A₁=9=N₁`. `n=0` is excluded by `hn` (`2≤1` is false), where `A₀=1≠0` | Pass | None |
| `zeta_rationality` | `E/𝔽₅` | `Z(1−T)(1−5T)=1+3T+5T²`, `P(1)=9=h`, `a₁=9−6`, leading `5=q^g` | Pass | None |
| `isLPolynomialData_iff_eq_lPolynomial` | `E/𝔽₅`; `q=0,1` | Accepts `1+3T+5T²`. Rejects `1+2T+5T²` (`a₁=3`) and `1+3T+T²` (`a₂=5a₀`). Junk `q` gives `1+8T` and `1+7T+T²`, excluded by `q=#k` | Pass | None |
| 5.5 constant extension | `E/𝔽₂₅` | `α+β=−3`, `αβ=5`, `α²+β²=−1`, so `N₂=27` and `L=1+T+25T²` | Pass | None |
| 5.7 finite coefficients | `Λ=𝔽₃×𝔽₃`, `y²=t/𝔽₅` | `V^{I₀}=0×𝔽₃`, `P₀=(1,1−T)`; for the `ℓ`-dimensional identity, `(1−T)^ℓ=1−T^ℓ` while all traces vanish | Pass | None |
| 6.3 weights | Heisenberg `p=3` | Orbits: 3 of size 1 (`y=0`), 2 of size 3. `3·(1/9)+2·(1/3)=1`. Uniform weights give a different integral | Pass | None |
| 6.4–6.5 Harder (headline) | `GL₂` Borel; `𝔾_m/E/𝔽₅` | `⟨α,H₀(diag(π^a,1))⟩=log_q|π^a|=−a`, so finitely many `a` in `[c₁,c₂]`. Rank 9 with `deg Ξ=1`, infinite without `Ξ`. `ℤ[1/3]→𝔽₂` sends the kernel of `2x=0` from 0 to `𝔽₂` (not flat) | Pass | None |
| 6.6 Satake | `GL₂`, `h=1_{U diag(π,1) U}` | `S*h=qX₁+X₂`, `S h=q^(1/2)(X₁+X₂)`; on `δ^(−1/2)` the eigenvalue is `q+1`, against `2q^(1/2)` if mixed | Pass | None |
| 6.7 Yu | `n=2,g=2` | Valuation degree of `x₀` is `−2`, so the Yu degree is `+2`. Scalar `a^(−1)` gives `+2−2=0`; Yu's printed sign gives `4` | Pass | None |
| 7.1 obstruction | `E/𝔽₃:y²=x³+2x²+2x`, 2-isogeny | `#E(𝔽₃)=2`; `div(y/x)=[Q]−[P]−[O]=ν^*(P−O)`; `O` splits and `P` is inert, so `η(P−O)=−1` | Pass | None |
| 7.4 densities | rank 1, split `(O,πO)`; inert `π`; `𝔽₄²` | `(1−T)+T+T=1+T`; `1−T`. Three isotropic lines: `(1−T)(1+2T)+3T²=1+T+T²` | Pass | None |
| 7.5 Whittaker = density | `n=m=1`, `q=3` | Split: `2·3^(N−1)/3^N=2/3=1−3⁻¹`. Inert: `4/3=1+3⁻¹` | Pass | None |
| 7.6 FYZ (headline) | `n=1`, `ℙ¹`, split, self-dual | `deg𝓔=−2`; exponent `−(−2)(s−½)+1=2s`; `L₁(s)⁻¹=∏(1−q_v^(−1−2s))`; `Den=1`; matches fyz line 678 | Pass | None |
| 0.1 degrees | Degree-2 place; `r=3,d=2` | `deg=2`, `deg_Yu=−2`, `|π_v|=q⁻²=q^{deg_Yu}`. One factor of degree 3, `φ²` of order 3 | Pass | None |
| 4.5/4.2 at a non-rational place (R02) | `t²+1` over `𝔽₃` | The pinned `completionEquivLaurentSeriesResidueField` gives `F_v≃ₐ𝔽₉((T))`; the cited rational-place declaration does not apply | Pass (math) | R02 |

## Not verifiable

- **hess** (Lemma 1, Corollaries 3–4, Theorem 7, Corollary 11; sampled for §1.2). Recorded as uncertified and settled; §1.2 was checked mathematically in the table.
- **roquette** (§4.3.3, eq. (4); sampled for §§0.2, 5.2 and 5.6). Waived; checked mathematically.
- **sga4half** (Théorème 2.2, inside §5.7). Uncertified. §5.7 is not in the sample.
- **rosen**, **goss** and **stichtenoth** are uncertified and not in the sample.
- No source was fetched, and no missing-reference request was made.

## Source issues

- **Misprint** in parshin at §2.2, p. 9 (parshin lines 367–375): the source writes the adelic pairing as a sum of circle values; it should be their product, the character of the summed traced residues; affects nothing.
- **Error** in parshin at §2.2, p. 9 (parshin line 375): the source takes the additive character of `𝔽_q` to be injective; it should be a nontrivial character, impossible to make injective when `q` is not prime; affects nothing.
- **Error** in parshin at §2.1, p. 7, footnote 4, and p. 10 (parshin lines 298–299, 439–441): the source says the lattice indicators alone span the Bruhat–Schwartz space; it should say that indicators of translates span it; affects the proof.
- **Error** in fyz at Remark 2.1, p. 8 (fyz lines 383–393): the source asserts odd `n` is unobstructed by cup-product alternation; it should allow a nontrivial obstruction, as on `y²=x³+2x²+2x` over `𝔽₃`; affects a stated result.
- **Error** in fyz at (2.1), p. 9 (fyz line 422): the source states the Levi covariance for every adelic `α`; it should be stated for rational `α` globally and locally as (2.3); affects nothing.
- **Gap** in kw at Theorem 4.12, p. 21, and Proposition 4.14, p. 23 (kw lines 1136–1138, 1191): the source uses `⌈log_p(r/i)⌉` without clamping at zero; it should use `max(0, ⌈log_p(r/i)⌉)`; affects a stated result.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 297): the source invokes "Theorem 3.1" for Hilbert 90; it should be Proposition 3.1; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 299): the source writes `F(α+1)−α+1`; since `σα=α−1` it should be `F(α−1)−(α−1)`; affects nothing.
- **Misprint** in yu at Lemme 5.3.3, p. 36 (yu lines 1934–1935): the source quantifies over every `φ ∈ π`; it should require `φ ≠ 0`; affects a stated result.
- **Error** in yu at Lemme 5.3.3, proof, p. 38 (yu lines 2024–2033): the source gives `deg x₀ = −n(n−1)(g−1)` and the exponent `(n−1)(g−1)`; under §2.2.1's sign they should be `+n(n−1)(g−1)` and `−(n−1)(g−1)`; affects the proof.
