# Review of IntegralLattices (pull request #1239 at 71db65f)

**Verdict:** needs changes

This is a full re-review of the repaired head. The gate passes, the dependency check is clean, and the eleven findings of the previous review are repaired or nearly so (table under *Verified sound*). Two new blocking findings come from the pinned Tau Ceti, which already contains a large part of what Layer 4, 3C and the supplier table plan or declare missing; the rest are locators and shape.

## R01 (P2) — Native declarations are planned again; the supplier table attributes native declarations to roadmaps

**Location:** `TauCetiRoadmap/IntegralLattices/README.md` N0 (lines 1324–1338: "Prove independence of the chosen basis, compact openness, equality with the unimodular reference for almost all `p`, and eventual integrality of a rational element"), N1 (1340–1353), 3C (776–780), 4B (1393–1403), and the table *From other roadmaps* (449–460).

**Claim:** these are targets of this roadmap, and the order, Picard, restricted-product, spinor-norm and Hilbert-symbol declarations are Global Number Fields', Restricted Products', Orthogonal and Spin Groups' and Quadratic Form Invariants'.

**Witness (pinned Tau Ceti 358314d):** `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/Basic.lean` (the integral orthogonal subgroup of a basis: compact, open, depends only on the `ℤ_p`-span, contains every rational isometry at almost all `p`); `Integral/CompactOpen.lean` (`OrthogonalCompactOpens.integral`, `eventually_localSpinorNormImage_integral_eq_unitSquareClasses`); `Integral/SpinorNorm.lean` (`map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses`: odd `p`, dimension at least two); `SpinorNormImage.lean` (`localSpinorNormImage`), `AdelicSpinorNorm.lean` (`adelicSpinorNorm`); `TauCeti/NumberTheory/IntegralLattice/Diagonalization.lean` (`exists_basis_iIsOrtho_localIntegralForm`, `exists_basis_iIsOrtho_localIntegralForm_eq_unit_mul_pow`: odd-prime diagonalization and Jordan data). Of the 46 roadmap declarations in the table, these are native: `NumberFieldOrder` (`Orders/Basic.lean:59`), `conductor`, `IsProperFractionalIdeal`, `properFractionalIdeals`, `invertible_isProper`, `IdealClassMonoid`, `mkIdealClassMonoid`, `Pic` (`Orders/Picard.lean:34`), `mkPic`, `mkPic_surjective`, `NarrowPic` (`Orders/NarrowPic.lean:55`), `narrowPrincipal`, `narrowToPic`, `narrowToPic_surjective`, `finite_pic` (`Orders/RayClass.lean:208`), `card_narrowPic`; `RestrictedProductGroup`, `RestrictedProductGroupWithFactor`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`; `orthogonalGroup`, `spinorNorm`, `spinorNorm_reflection`, `OrthogonalCompactOpens`, `finiteAdelicOrthogonal` (`OrthogonalGroup/FiniteAdelic.lean:80`), `transvection`; `hasseInvariant`, `hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:46`), `localHasse`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`; `atFinitePlace`, `atRealPlace`. The quadratic-order theorem is native under the name `isProperFractionalIdeal_iff_isUnit_of_finrank_eq_two` (`Orders/Quadratic.lean:143`), not `isProper_iff_isUnit_of_finrank_eq_two`, which exists only in `Completed/GlobalNumberFields/Suggested.lean:777`.

**Repair:** In N0, N1, 3C and 4B delete what the files above prove and cite it (N0's stabilizer family is `OrthogonalCompactOpens.integral` of a basis of `L`; N1's unit-square-class image at odd unimodular primes and at almost all primes is native; 3C's diagonalization and Jordan grouping are native; keep as targets the two double-coset bijections, the odd-prime classification by rank and unit determinant class, the dyadic image computation and the spinor-genus count). Move every native declaration to *From Tau Ceti* with its file; cite the library name for the quadratic-order theorem; keep in the roadmap table only what is not at the pin (`picEquivUnitsIdealClassMonoid`, `finite_narrowPic`, `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic`, `hilbertProductFormula`, `hilbertSymbol_productFormula`, `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent`, `orthogonalBaseChange`, `orthogonalBaseChangeReal`, `transvectionLiftHom`, Root Systems Layer 5). On the rank-one test of N1 the native `exists_localSpinorNormImage_ne_unitSquareClasses` already records the trivial image, so the Check survives as a citation.

## R02 (P2) — The module docstring misstates the pins, and a statable headline is absent

**Location:** `TauCetiRoadmap/IntegralLattices/Suggested.lean:40–52`: "no finite-adelic orthogonal group and no spinor norm", "no Hilbert symbol over `ℚ_p`", "no orders of quadratic fields with their Picard groups and no ring class field".

**Claim:** Layer 4, 3G and B2–B3 headlines are not statable for lack of those carriers; the docstring's headline list omits Layer 1's classification of finite quadratic forms.

**Witness:** the five declarations named in R01 exist at the pin. A scratch file stating Nikulin's Theorem 1.11.3 elaborates with only the `sorry` warning:
```lean
theorem nikulin_1_11_3 (q₁ q₂ : FiniteQuadraticModule.{u}) (h₁ : q₁.IsNondegenerate)
    (h₂ : q₂.IsNondegenerate)
    (hb : Nonempty (q₁.toFiniteBilinearModule.Isometry q₂.toFiniteBilinearModule)) :
    Nonempty (q₁.Isometry q₂) ↔ q₁.gaussSign = q₂.gaussSign := sorry
```
The README's Summary (line 10) and 1H (lines 566–572) present this theorem as what the roadmap builds; it is neither stated nor named as unstatable (nikulin1980 line 724 for the statement).

**Repair:** State 1.11.3 as above (1H). Rewrite the unstatable list to the true missing pieces: for 3G it is the genus symbol, not the Hilbert symbol; for 4B the adelic group and the lattice-indexed reference family are native, so either state the class-set bijection at Gram level (`GramSameGenus`, `OrthogonalCompactOpens.integral`, `finiteAdelicOrthogonal`, Mathlib `Doset.Quotient` in `Mathlib/GroupTheory/DoubleCoset.lean:79`) or say exactly which piece is missing; for B2 with `Δ < 0` the carriers `Pic`, `NumberFieldOrder` and Mathlib's `QuadraticAlgebra ℚ Δ 0` with its `Field` instance exist, so either state the bijection or name the missing piece (a finite-generation proof for the order `ℤ[ω]` inside the quadratic algebra), not "orders with their Picard groups". Only the ring class field is genuinely absent (no `ringClassField` at the pin).

## R03 (P3) — 1G attributes the completeness of the relations to Nikulin 1.8.2

**Location:** `README.md:548–551`: "so that the generator decomposition becomes a classification: two orthogonal sums of generators are isometric exactly when one is carried to the other by the relations" (Nikulin Proposition 1.8.2).

**Claim:** Proposition 1.8.2 is the source for the "exactly when".

**Witness:** nikulin1980 lines 438–481: "A trivial calculation yields Proposition 1.8.2", relations a)–k), no statement that they generate all relations; Nikulin's classification runs through Theorem 1.11.3 (line 724), which R02 asks for.

**Repair:** Either cite a text that proves completeness (Kawauchi–Kojima, *Algebraic classification of linking pairings on 3-manifolds*, Math. Ann. 253 (1980), for the bilinear 2-primary part, together with Theorem 1.11.3; or a text with a normal-form theorem for finite quadratic forms), recorded in `sources.toml`, or restate 1G as: the relations of 1.8.2 hold, and isometry is decided by the bilinear form (odd `p`: rank and unit determinant class; `p = 2`: the bilinear classification) together with 1.11.3. The three Checks of 1G stay as they are (`u⊕u ≅ v⊕v` is relation of 1.8.2; `q_1(2) ≅ q_5(2)` is `θ` modulo squares).

## R04 (P3) — `minGenerators` duplicates Mathlib's `AddGroup.rank`

**Location:** `Suggested.lean:97` (`minGenerators`), used in `NikulinExistenceConditions`, `padicDiscriminant_eq_squareClass_gramDet` and `exists_evenLattice_of_lt`; README 1G and the Layer 8 table.

**Witness:** `Mathlib/GroupTheory/Rank.lean:30–41`: `Group.rank` with `@[to_additive]` (so `AddGroup.rank`), `rank_spec`, `rank_le`: the minimum size of a generating set.

**Repair:** Delete `minGenerators`; write `AddGroup.rank A` (finite abelian groups are `AddGroup.FG` through `Monoid.fg_of_finite` at `Mathlib/GroupTheory/Finiteness.lean:516` and `Group.fg_iff_monoid_fg` at line 715) in the five uses, and cite `AddGroup.rank` in the Mathlib table for 1G. On `0`, `ℤ/6`, `(ℤ/2)²` both give `0, 1, 2`.

## R05 (P3) — Locators

- `README.md:2336` (hard-theorems row for 7A) cites "Conway–Sloane §2" for proper against full mass; §2 is the history section. The statement is in §6: conway-sloane-mass1988 lines 324–328 (printed p. 266), "the factor `2m_p(f)` is the proper `p`-mass, the 2 is the index of `SO_n` in `O_n`, replaced by 1 in dimension 0".
- `README.md:1711` (6B) cites Serre V.2.3 for existence. serre1973 lines 2217–2238 (V.2.3) are the definite finiteness and mass discussion; existence for `8 ∣ n` is V.1.4.3 (`Γ₈`) with the remark after Theorem 2 (line 2178), necessity is Corollary 2 of Theorem 2 (line 2176).
- `README.md:387` cites `Mathlib/LinearAlgebra/Matrix/Cartan.lean`; at the pin that module is deprecated (line 5, `deprecated_module (since := "2026-09-08")`) and `CartanMatrix.E` lives in `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean`.
- `README.md:1834` ("Characteristic signature and the general signature-neighbor corollary") carries no locator; the route is Serre V.2.1 Theorem 2 (serre1973 line 2170) and Milnor–Husemoller II.
- `README.md:1119–1135` (B4) "Cox, §3": the fact used (the opposite form is the inverse class) is Cox Theorem 3.9, p. 50.
- `README.md:2497` lists Serre as a source for "7H", which is not a milestone here.
- `README.md:438`: "the labels 0A–0G, 1A–1F, 1J, 1K and 2A–2F name the native declarations" contradicts "Minkowski's second theorem is 2F below"; read 2A–2E.

## R06 (P3) — Shape and style

- Milestones 3D, 3E, 3F, 3G, 3H, 4A, 4B, 4C, 4G, 5A, 5F, 5I, 6D, 6F, 7A and 7G have no **Checks** at the milestone (3E/3G, 4A/4C and 7A only in the appendix), and 3D, 3E, 3F, 3H, 4A, 4B, 4G, 5F, 5I, 6D, 6F carry no locator at the claim; 3C–3H and 4A–4C carry their inputs only in the layer table, not in a *Needs:* line. On `U` over `ℤ₂` (3D), `⟨1⟩` against `⟨17⟩` (3F) and `A₂` at 3 (3B) the missing Checks are already computed in the prose; promote them.
- `README.md:1820–1842`: the 6A/6D supplement is ASCII prose with capitals ("n=4k,k>=1", "absolute2", "both have480", "ACTUAL", "ODD", "EARLY", "SUMS", "TOGETHER WITH") and implementer imperatives ("Export", "Keep", "Retain"); the mathematics is right (table below), the form is not the README's.
- `README.md:1917–1926` (7C) narrates OrthogonalTamagawaAndLatticeMass's §1.4 inputs (TauberianBoundaryConvergence N2/N3, "AA split-measure compatibility"); this is the successor's dependency text and belongs there.
- `README.md:425` "the old labels 0A, 2C"; the 8S paragraph's "are belong to"; line 1564 backticks `localConditions`, which is the name of a rejected design and not a declaration; appendix "Constructors. From a Gram matrix by an algorithm" for genus symbols.

## Verified sound

**Repair status of the previous review (cdfcd0f).**

| Previous | Passage now | Status |
| --- | --- | --- |
| R01 cycle | lines 26–34 "nothing here consumes OTM, so the supply runs one way"; every *Needs:* line and Dependencies row read; depcheck 0 problems | repaired; the Eichler-dependent Nikulin results are assigned to a named `IntegralLatticesPartII` |
| R02 general local input | 3B "Let `K` be a finite extension of `ℚ_p` … valuation ring `𝒪`" (753–760); 3I over unramified `R`; Check `ℤ₂[ζ₃]`, Gram `[2]`, `N = 2` | repaired |
| R03 build gate | `module` header; gate `build=0`; my elaboration: 22 `sorry` warnings, nothing else | repaired |
| R04 foundation | Layer 0 "has no targets" (522–530); labels 0A–2E native; Theta Series import description (54–60) now matches `TauCetiRoadmap/ThetaSeries/Suggested.lean:1–12` | repaired |
| R05 rank 24 | lines 1750–1752 and scope row: Rank-24 lattice constructions Layers 3 and 6 (`TauCetiRoadmap/Rank24LatticeConstructions/README.md:223, 312`) | repaired |
| R06 rank-8 headline | `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight`, 6A ×2, 6B, 6C ×2, 6G stated | repaired |
| R07 padding | `ArchimedeanVolume.lean` deleted; rejection tests gone; probe below | repaired |
| R08 computational deliverables | Layer 9 is the single theorem 9B | repaired |
| R09 locators | Cox and Cohen with pages, marked uncertified; mass paper pages 259–286; Kirschmer gone | partly; R05 above |
| R10 form | Summary, Scope, Conventions, supplier contracts, How to read, Examples and Dependencies per layer | partly; R06 above |
| R11 "smallest" | gone; the two remaining "smallest" claims (Δ = 12 for `Pic ≠ NarrowPic`, determinant 11 for a non-ambiguous class) were checked: units of norm −1 exist for Δ = 5, 8; for determinants ≤ 10 every class is ambiguous (Δ ∈ {−3,−4,−7,−8,−11,−12,−15,−16,−19,−20,−24,−28,−32,−35,−36,−40}), while Δ = −44 has `(3, ±2, 4)` | repaired |

**Gate and build.** The worker's gate at this head: every counter 0, `build=0`, OK. `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean`: exit 0, 22 warnings, all `declaration uses sorry`. Dependency check:

```text
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. IntegralLattices is not in the merge order; its suppliers on main are Completed GlobalNumberFields, RestrictedProducts, OrthogonalSpinGroups and the active QuadraticFormInvariants, GlobalQuadraticForms, ClassFieldTheory, RepresentationTheory/RootSystems, RepresentationTheory/LieGroups, DifferentialGeometry, TauberianBoundaryConvergence (mentioned only); AdelicAlgebraicGroups (open PR #792) is named as an owner, not consumed. The diff outside the folder is empty. No `set_option`, no sorry'd data, no admitted `example`, no extra imports, no copied passage.

**Padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | decide` fails at exactly the 22 admitted lines (91, 203, 247, 258, 276, 301, 340, 349, 372, 384, 418, 441, 458, 465, 474, 483, 495, 502, 525, 595, 621, 661); none closes.

**Signatures.** The worker's elaborated types of the 53 declarations were compared with the README; none lost a binder. Generality agrees: `vanDerBlij` (unimodular, nondegenerate, finite-dimensional ambient, `Int.ModEq 8`), `milgram` (even, nondegenerate), 2F (`IsPosDef`, native `successiveMinimum : Fin (finrank ℤ L) → ℕ`, `determinant : ℤ`), 2G and 4E at Gram level, 5B with the four typed clauses and `Nat.card q` as `|A_q|`, 5G with `t₊ ≤ l₊`, `t₋ ≤ l₋` guarding the truncated subtraction, 5J seven clauses in README order, 6A with evenness as even diagonal and unimodularity as `det = ±1`, 6C with `finrank ℚ V = 8`, 7C with `det ≠ 0`, 7E with `ChartedSpace`, `IsManifold … 1`, Borel, Lindelöf, `C¹` and immersion hypotheses, 9B with pairwise non-isometry. `signature = (sigPos, sigNull, sigNeg)` (`Signature.lean:81`) matches `(tp, 0, tm)`.

**Library declarations opened at the pins.**

| Declaration | File:line | Note |
| --- | --- | --- |
| `Group.rank`, `AddGroup.rank`, `rank_spec`, `rank_le` | `Mathlib/GroupTheory/Rank.lean:33–41` | R04 |
| `CartanMatrix.E` | `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean`; `Cartan.lean:5` deprecated | R05 |
| `QuadraticAlgebra` `Field` instance | `Mathlib/Algebra/QuadraticAlgebra/Basic.lean:513` | R02 |
| `Doset.Quotient` | `Mathlib/GroupTheory/DoubleCoset.lean:79` | R02 |
| `FiniteQuadraticModule` (extends `toFiniteBilinearModule`) | `TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.lean:64` | 1.11.3 statable |
| `oddCyclic` | `…/OddCyclic/Basic.lean:62`: `b = θxy/m`, `q = θ(m+1)x²/(2m)` | 1H Check `q(1) = 2θ/3` |
| `dyadicU`, `dyadicV`, `gaussSign`, `gaussSign_dyadicU` | `…/Dyadic/RankTwo/Basic.lean:67,140`; `GaussSum.lean:447`; `Dyadic/GaussSum.lean:81` | native values |
| `exists_isometry_prod_pi_generators` | `…/FiniteBilinearModule/Decomposition.lean:103` | returns indexed families; `NikulinDecomposition` repackages |
| `successiveMinimum`, `minimum`, `IsEven`, `IsUnimodular`, `IsCharacteristicVector`, `gramDet`, `determinant`, `signature` | `PosDef/SuccessiveMinima.lean:45`; `PosDef/Minimum.lean:81`; `Even.lean:67`; `Unimodular.lean:58`; `Characteristic/Basic.lean:40`; `Gram.lean:119,193`; `Signature.lean:81` | as the README states |
| `inducedRiemannianMetric`, `riemannianVolume` | `TauCeti/Geometry/Manifold/Riemannian/Induced.lean:92`; `VolumeDensity/Volume.lean:76` | pullback metric of an immersion; chart-defined volume |
| Localization bridge | `TauCeti/NumberTheory/IntegralLattice/Localization.lean` | 3A natives |
| Diagonalization at odd `p` | `TauCeti/NumberTheory/IntegralLattice/Diagonalization.lean` | R01 |
| Integral orthogonal family, spinor images | `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/{Integral/*,SpinorNormImage,AdelicSpinorNorm,FiniteAdelic,FullAdelic,Diagonal/Full}.lean` | R01, R02 |
| Orders, `Pic`, `NarrowPic`, quadratic invertibility | `TauCeti/NumberTheory/NumberField/Global/Orders/{Basic.lean:59,Picard.lean:34,NarrowPic.lean:55,Quadratic.lean:143,RayClass.lean:208}` | R01, R02 |
| `hilbertSymbol`, `hilbertSymbol_eq_cohomological` | `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46`; `FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:185` | R01 |
| Global invariants, local realization, local classification | `TauCeti/NumberTheory/QuadraticForm/Global/{Invariants,LocalRealization,Classification}.lean` | GQF material partly native; `hasseMinkowski` absent |

Every name in *From Tau Ceti* was found at the pin (119 names grepped, none missing). Not at the pin, as the docstring says: `D₁₆⁺`, genus symbols, `ringClassField`, `finite_narrowPic` (but `card_narrowPic` exists), `hasseMinkowski_equivalent`.

**Cross-roadmap citations resolved.**

| Citation | Resolved at | Result |
| --- | --- | --- |
| GlobalNumberFields names | `Completed/GlobalNumberFields/Suggested.lean:749–991` | all present; `isProper_iff_isUnit_of_finrank_eq_two` at 777 (library name differs, R01) |
| ClassFieldTheory `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic`, `hilbertProductFormula` | `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:4318, 4327, 4350, 4396` | present; `Module.finrank ℚ K = 2` hypothesis as the README says |
| QFI `hasseInvariant`, `localHasse`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula`; Layer 6D; 7C | `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:601, 1182, 1319, 2552, 2578`; README 2167, 2641 | present |
| GQF `atFinitePlace`, `atRealPlace`, `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent`; 6.3 | `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:104, 111, 439, 544`; README 723 | present |
| RestrictedProducts names; Layers 1–3 | `Completed/RestrictedProducts/Suggested.lean:84–87`; README 246 | present (and native) |
| OSG names; 0C, 2C, 2F; Layers 0–3; successor clause | `Completed/OrthogonalSpinGroups/Suggested.lean:100, 412, 418, 845, 901, 1010, 1022, 1248`; README 368, 684, 717, 49–55 | present; OTM is the named owner of strong approximation |
| RootSystems Layer 5, `Nat.card P.weylGroup` | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:321, 293` | present |
| LieGroups matrix groups; DifferentialGeometry 12.1, 12.4 | `…/LieGroups/README.md:32, 111`; `TauCetiRoadmap/DifferentialGeometry/README.md:915, 923` | present |
| Rank-24 Layers 3 and 6 | `TauCetiRoadmap/Rank24LatticeConstructions/README.md:223, 312` | present |
| Theta Series: imports native modules; consumes 6D | `TauCetiRoadmap/ThetaSeries/Suggested.lean:1–12`; `README.md:48–49, 97–99` | present |
| OTM §§0.3, 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 4.1 | `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:155, 177, 192, 210, 391, 405, 444, 473, 525` at the head of its open pull request | present. Note for the author: OTM's head still cites IntegralLattices §6E (line 541), §4D (159) and §§7H/7I (573), which this head no longer has; that is OTM's drift to repoint |
| `Completed/IntegralLattices/README.md`, TauberianBoundaryConvergence | on main | present |

Ownership against the open pull requests listed in the brief was searched by object (genus, class number, spinor genus, finite quadratic forms, `E₈` order, `SO(n)` volume): OrthogonalTamagawaAndLatticeMass at the head of its open pull request builds a Gram presentation of classes and consumes this roadmap for the rest; no other sibling builds these objects. Open pull requests not given with files were not searched.

**Adversarial pass.** `⟨a⟩` has Gram `[a]`; `U = [[0,1],[1,0]]`; discriminant values are half-norms modulo 1.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| B1 content/discriminant | `A₂`, `I₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]` | `(c, Δ) = (2,−3), (1,−4), (2,1), (1,8), (2,−23)`; `disc N_L = −4 det L`: `−12 = −4·3` | pass |
| B1 content under sublattice | `x²+y²` on `⟨2e₁,e₂⟩` | form `4x²+y²`, content `1`, determinant `4 = 2²·1` | pass |
| B2 oriented map, Δ = 12 | `f = x²−3y²`, `f' = −x²+3y²` | `𝔞_f = ℤ+√3ℤ = 𝒪₁₂ = 𝔞_{f'}`; rotated `f'` is `3x²−y²` with ideal `(3,√3) = √3·𝒪₁₂`; `x² ≡ −1 (mod 3)` impossible; `N(2+√3) = 1` so `Pic` trivial, `NarrowPic` order 2 | pass; sign clause needed |
| B2 Δ = −3, Δ = 1 | `x²+xy+y²`; `xy` | one class, `Pic ℤ[ζ₃]` trivial; split branch, `ℤ×ℤ` not a field | pass |
| B3 split representatives | `m = 2, 5, 8` | classes `1 = φ(2)` (`x²−y² ~ 2xy+y²` via `(x,y) ↦ (x+y,y)` then rotation); `φ(5) = 4` with genera `{1,4},{2,3}`; `φ(8) = 4`, four genera | pass |
| B3 narrow count via ideles | `(ℤ̂ˣ)²/(𝒪̂ₘˣ·±(1,1))` | `(a,b) ↦ ab⁻¹` onto `(ℤ/m)ˣ`; `−1·(−1)⁻¹ = 1`; wide `Pic` is `φ(m)/2` for `m ≥ 3` | pass |
| B3 torus integral points | `m = 5, 8` | `T(ℤ_p) = {t : t² ≡ 1 (p^{v})}`; quotients `(ℤ/5)ˣ/{±1}` order 2, `(ℤ/8)ˣ/(all)` order 1; `{±1}` instead gives 2 at `m = 8` | pass |
| B4 improper automorphism criterion | `!![4,1;1,6]` | norm-4 vectors `±e₁` only (`(1,−1)`: 8, `(0,1)`: 6); second column `y = ±1−4x`, `92x² ∓ 46x = 0` so `x = 0` or `±1/2`; `O = SO = {±I}`, `w = 2`, `2w = 4` | pass |
| B4 unit counts | Δ = −3, −4, −23; `U`; `x²−2y²` | `#𝒪ˣ = 6, 4, 2`; `|O(U)| = 4 = 2|SO(U)|`; `(3,2)` solves Pell, `O` infinite | pass |
| B5 reduced forms | Δ = −23; `m = 5` | `(1,1,6), (2,1,3), (2,−1,3)`: `h⁺ = 3`, `h = 2`; split count `φ(5) = 4` | pass |
| B6/B7 torus and measures | Δ = −4; Δ = 12; Δ = 1 | circle, `2π`; `log(2+√3) > 0` makes `T(ℝ)/T(ℤ)` compact; `𝔸ˣ/ℚˣ ≅ ℤ̂ˣ×ℝ_{>0}`, `∫dt/t = ∞`; modulus kernel compact | pass |
| B7 class-of-squares fibre | `a ↦ a/ā` | image of `[𝔞]` is `[𝔞]²` since `𝔞𝔞̄ = N(𝔞)𝒪`; base is the principal genus | pass |
| B8 mass | Δ = −3; Δ = −23 | `1/(2·6) = 1/12`; `3/(2·2) = 3/4 = 1/4 + 1/2`; `h/(2w) = 1/2` wrong; `a·(2w)⁻¹ + ((h⁺−a)/2)·w⁻¹ = h⁺/(2w)` for every `a` | pass |
| 7A `m⁺ = 2m` | ambiguous class; split class; rank 0 | `1/|SO| = 2/|O|`; `2/|O| = 2·(1/|O|)`; rank 0: `1 ≠ 2` | pass, guard needed |
| 7G low rank | rank 0; `⟨a⟩`, `a > 0` | `(m, m⁺) = (1,1), (1/2, 1)` | pass |
| 1G `l(A)` | `(ℤ/2)²⊕ℤ/3`; `0`; `(ℤ/2)²` | `max(2,1) = 2`, not `3`; `0`; `2` (`AddGroup.rank` gives the same) | pass; R04 |
| 1G generator relations | `u(2)`, `v(2)`; `q_1(2)`, `q_5(2)` | half-norm values `0,0,½` vs `½,½,½`, Gauss sums `2`, `−2`; `(1+i)²`-type sums `4 = 4` for `u⊕u`, `v⊕v`; `¼ = 5/4` in `ℚ/ℤ` | pass; R03 for the source |
| 1H odd values | `oddCyclic 3 θ`, `θ = 1, 2`; `q_θ(5)`, `(θ∣5) = −1` | `1+2e(2/3) = −i√3`, sign `6 = −2 + 0`; `1+2e(1/3) = i√3`, sign `2 = −2+4`; `−4+4 = 0` with order 5 not a square | pass (nikulin1980 line 717) |
| 1H Theorem 1.11.3 | `u(2)` vs `v(2)` | same bilinear form, signs `0 ≠ 4`, not isometric | consistent; statable (R02) |
| 1I Milgram | `⟨2⟩`, `⟨−2⟩`, `⟨1⟩`, `E₈` | `1+i = √2 e(1/8)` sign 1; `1−i` sign `−1`; odd `⟨1⟩` excluded; `0 ≡ 8` | pass |
| 1L via 1I on `L_even` | odd rank: `A = ℤ/4`, `q(w/2) = w²/8`; even rank: `F₂²` | Gauss sums `2e(w²/8)` in both cases, so `σ(L_even) = σ(L) ≡ w² (mod 8)`; route acyclic | pass |
| 1L counterexamples | `⟨2⟩`; `⟨1⟩`, `w = 1, 3`; `I₈` | all vectors characteristic, `2k²` even vs `σ = 1`; `1, 9 ≡ 1`; `8 ≡ 0` | pass |
| 2F Minkowski II | `⟨a⟩`; `ℤ²`; `diag(1,4)`; `A₂`; `2ℤ⁵+ℤ(1,…,1)`; `E₈` | `2√a ≤ 2√a`; `π ≤ 4`; `2π ≤ 8`; `6.28 ≤ 6.93`; det `4⁵/4 = 256`, minima all 4 (`±2e_i`, index 2), `(8π²/15)·32 ≈ 168 ≤ 512`; `(π⁴/24)·16 ≈ 64.9 ≤ 256` | pass |
| 2G finiteness | rank 1, `d ≤ 0`; rank 2, `d = 3`; `U` | empty set; `[1,0;0,3]`, `[2,±1;±1,2]`: two classes; `[0,1;1,2k]` unbounded | pass |
| 3B Jordan over `𝒪` | `ℤ₂[ζ₃]`, `[2]`; `U` at 2; `⟨1⟩⊕⟨3⟩` vs `⟨5⟩⊕⟨7⟩` | rank 1, `𝔰 = 𝔫 = 2𝒪`; one type II block; `35/3 ≡ 1 (mod 8)`, characteristic norms `4 ≡ 12` | pass |
| 3C | p = 3, ranks 0, 1 | one class; `⟨1⟩`, `⟨2⟩` | pass; native diagonalization (R01) |
| 3F finite test | `⟨1⟩`, `⟨17⟩` | `17 ≡ 1 (mod 8)` so isometric at 2; determinants `1 ≠ 17` | pass |
| 3I exponents | `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩`, `U`, `U(2)`, `E₈`, `R = ℤ₂[ζ₃]` `[2]` | `N = 1, 2, 2 (from `N_M = 5`, `N_Q = 7`), 2, 5, 8, 2`; formula `t + ∑ i n_i n_j + ∑ d_i − b + c` agrees in every case (cho2015 lines 1223–1251) | pass |
| 3I type of `⟨2⟩` | scale 2 | `𝔫 = 𝔰 = 2ℤ₂` so type I; "`𝔫 = ℤ₂`" would say type II | pass |
| 7C counts | `U` mod `2^r`; `U` mod 3, 9; `⟨1⟩`, `⟨2⟩` mod `2^r` | `a` unit forces `b, c ∈ {0, 2^{r−1}}`, `d = a⁻¹`: `2^{r+1}` each kind, `2^{r+2}`, `α₂ = 4`; `r = 1`: `SL₂(𝔽₂)`, 6; `4, 12`, `4/3`; `4, 8` | pass |
| 7C odd formula | `n = 2m`: `#O^ε_{2m}/p^{m(2m−1)}`; `U` at 3; `I₂` | degrees `2m²−m` match; `ε = (−(−1)∣3) = 1`, `4/3`, raw `(−1∣3)` gives `8/3`; `∏_{p odd}(1−(−1∣p)/p) = 4/π` | pass |
| 7C normalized products | `n = 1, 0`; `n = 2`, `−det` square | empty product 1; no factor 2; `∏(1−p⁻¹)⁻¹` diverges | pass |
| 7E sphere areas and volumes | `j = 1, 2, 3`; `n = 0, 1, 2, 3` | `2, 2π, 4π`; `1, 1, 2π, 8π²`; `E_{in}−E_{ni}` has `−tr(X²)/2 = 1` and maps to the unit tangent `e_i` | pass |
| 7E Gamma identity | `n = 0, 1, 3` | `2 = 2/1`; `2π^{−1/2}√π = 2 = 4/2`; `2π^{−3}·√π·1·(√π/2) = π^{−2} = 16/(16π²)` | pass |
| 7E measure definition | `n = 0`; `E` of wrong dimension | a chart forces `dim E = 0`, volume 1; otherwise no instance exists, vacuous | pass |
| 9B exhaustion | Δ = −23: `{!![2,1;1,12], !![4,1;1,6]}`; `{!![4,1;1,6]}`; three Gram matrices of one class | `1/4+1/2 = 3/4`; `1/2 < 3/4`; `3·(1/4) = 3/4` without the pairwise condition | pass |
| 5B conditions | `q = 0`, ranks 0, 8, 1; `⟨2⟩` vs `⟨10⟩` | `1 ≡ 1`, `8 ≡ 0`, `1 ≢ 0`; determinants differ by 5, nonsquare in `ℚ₂`, both realize `q_1(2)` | pass |
| `padicDiscriminant` | `q_θ(p^k)`, `u(2^k)`, `v(2^k)`; empty filter | valuations `k, 2k, 2k = v_p(order)`; product 1 at a prime with no generators, matching `|A_q| = 1` at rank 0 | pass |
| `padicDiscriminant_eq_squareClass_gramDet` | `A₂` at 3; `⟨2⟩` at 2 | `det 3 ≡ 2·3·(square)`: both `K(q₃)` with `q = 1/3`; the dyadic exception excludes the second | pass |
| 5G 1.12.2 | `⟨2d⟩` into `U` | `e+df` primitive, complement `⟨−2d⟩` with `−q` | pass (nikulin1980 line 788) |
| 5G 1.12.4 | `(1,0)` into `(1,1)`; into `(0,0)`; `t = 0` | `2 ≤ 2` and `⟨2d⟩ ↪ U`; `1 ≤ 0` fails; reduces to 6B | pass (line 806–811) |
| 5J clauses | `(0,4,0,0)`, `(1,3,0,1)`, `(1,4,0,2)`, `(0,4,0,4)`; `⟨2⟩`, `U(2)`, `D₄` | excluded by exactly clauses 4, 5, 6, 7; `(1,1,0,1)`, `(0,1,1,2)`, `(0,4,0,2)` pass all seven | pass (line 1633–1640) |
| 6A even/odd | `U` vs `⟨1⟩⊕⟨−1⟩`; `E₈²` vs `D₁₆⁺`; `U⊕E₈⊕E₈(−1)` | parity separates; definiteness excluded; `(9,9)` gives `U⁹` | pass |
| 6A supplement: `D_n⁺` | `n = 4k`; `n = 4, 8, 16` | alternating functional kills adjacent sums and `h`, rank `n−1`; `h² = k`, parity `k mod 2`; `D₁₆⁺` roots span `D₁₆` (norm-4 shell of `h+D₁₆`), `E₈²` roots span all | pass |
| 6A supplement: parity kernel | `L_even`, `w` | index 2, det 4; `w² ≡ rank (mod 2)` from norm-one lines plus alternating rest; `ℤ/4` or `𝔽₂²`; `w/2+e` integral iff `4 ∣ w²`, even iff `8 ∣ w²` | pass |
| 6A supplement: `W` neighbors | `(1,1), (1,−1)`; `((½,½),(1,−1))`; `((−½,½),(−1,−1))` | Gram `[[0,2],[2,0]]`; `[[0,1],[1,0]]` twice | pass |
| 6A supplement: odd route | `v` isotropic, `B(v,w) = 1`, `a' = w'²` odd; `u = w' + ((ε−a')/2)v` | `u² = ε`, `B(u,v) = 1`, `y = v−εu`: `y² = −ε`, `B(u,y) = 0`; Hilbert symbols of units at odd `p` are 1; real sign `(−1)^{s(s−1)/2}` | pass |
| characteristic signature (seed) | `J = L⊕W`, `(w,1,1)` | odd, signature `(r+1,s+1)`, `(w,1,1)² = w²`; in `I_{r+1,s+1}` all coordinates odd, `w² ≡ (r+1)−(s+1)` | pass |
| 6A supplement: even route | `I_even` cosets | half-norms of `w/2`, `w/2+e₁` are `(r−s)/8` and `(r−s)/8 + 1`; sign flip of coordinate 1 maps `w/2` to `w/2 − e₁ ≡ w/2 + e₁` | pass |
| 6B | `n = 0, 4, 8` | zero lattice; `D₄` det 4; `E₈` | pass |
| 6C | `I₈`/`E₈`; `I₉`/`E₈⊕I₁`; `D₁₂⁺` | parity; norm-1 counts 18 vs 2; `h² = 3`, no norm-1 vector | pass |
| 6G | orbit chain | `240·126·23040 = 696729600 = 2¹⁴3⁵5²7`; half `348364800`; `|O(A₂)| = 12 = 2·6` | pass |
| 6H | `E₈²⊕U` vs `D₁₆⁺⊕U` | rank 18, det −1, signature `(17,1)`, both even | pass |
| 4C rank 1 | `⟨1⟩` | `J_L = J²`; `W ∩ ℚˣJ² = ±W²`; quotient infinite | pass |
| 4C Δ = −4 | `I₂` at 2 | `θ₂(K₂⁺) ⊇ {1, 2 = N(1+i), 5 = N(2+i), 10}`, index 2; `J/(ℚˣJ_L) ≅ ℤ₂ˣ/⟨5⟩(ℤ₂ˣ)²` order 2; one class | pass |
| 4F transvections | `U⊕⟨2⟩`, `w ↦ w+au`; `x²+y²−3z²` | `E_{u,w+au} = E_{u,w}`; anisotropic over `ℚ` (mod 3 descent), indefinite over `ℝ` | pass |
| 4G neighbors | `L = M`, `p = 2` | indices `1 ≠ 2`, not a neighbor | pass |
| `GramSameGenus`, `IsGenusMass`, `IsPrimitiveEmbedding` | `G` indefinite in `IsGenusMass`; `ℤ → ℤ` by 2; `GramIsometric` | empty `S`, `m = 0`, vacuous; cokernel `ℤ/2` fails saturation; `PᵀHP = H` forces `det P = ±1` | pass |
| `localDensityCount` | `r = 0`; `n = 0` | `ZMod 1`: count 1; `n(n−1)/2 = 0` | pass |
| `sphereArea 0` | `j = 0` | `2/Γ(0)` with Mathlib `Γ(0) = 0`: junk `0`; unused (`Icc 2 n`) | pass |

**Seeded sample.**

| Target | Text inspected | Verdict |
| --- | --- | --- |
| B1 | mathematics only; Cox 1989 and Cohen uncertified, Cassels unavailable | content/discriminant/order checked on five lattices; `𝒪(L)` has discriminant `Δ` |
| B2 | Cox Theorem 7.7 (p. 137) cited uncertified; the oriented `Δ > 0` branch and split branch are the roadmap's own | the Δ = 12 witness and the narrow-class computation are correct; the dictionary is stated into the consumed `Pic`/`NarrowPic`, both native (R01, R02) |
| B3 | Cox Theorem 9.18 for the ring class field is cited through Class Field Theory's declarations | split counts `φ(m)`, genera `[(ℤ/m)ˣ : squares]`, torus quotient recomputed |
| B4 | Cox §3 (uncertified); Pell via Mathlib `Pell.exists_of_not_isSquare` (present) | criterion and all three cases recomputed; R05 asks for Theorem 3.9 |
| B5 | Cox Theorems 2.8, 2.13 (pp. 27, 29, uncertified); Cohen §5.6 (uncertified) | reduced forms for Δ = −23 and split count recomputed |
| B6, B7 | mathematics; Restricted Products natives | anisotropic/split dichotomy and the idele-modulus argument correct |
| B8 | conway-sloane-mass1988 line 31 (equation (1)), lines 324–328 (proper mass) | formula `h⁺/(2w)` derived and checked on Δ = −3, −23 |
| Characteristic signature after the odd theorem | serre1973 lines 2170–2182 (V.2.1 Theorem 2, corollaries, remark) and 2188–2216 (Theorems 3–6) | the route is Serre's; correct; needs the locator (R05) |

Also read at their locators: nikulin1980 313–316 (1.3.3), 426–481 (1.8.1–1.8.2), 488–494 (1.9.1), 605–615 (1.10.1, 1.10.2), 716–726 (1.11.2, 1.11.3), 788–832 (1.12.2–1.12.4), 1128–1130 (1.16.3), 1630–1656 (3.6.2); cho2015 113–117 (Definition 2.1), 246–256 (bound/free), 1223–1251 (Lemma 5.1, Theorem 5.2); conway-sloane-mass1988 157–160 (§3 guard), 305 (§6), 1086–1104 (§12, the count `N(p^r)/p^{rn(n−1)/2}`); allcock-gal-mark lines 53–54, 160–187 (signways); voight (arXiv 2308.11566) present in the cache. The seven Nikulin, two Cho, three Serre and three Conway–Sloane statements agree with the README as written, including the hypotheses `t₊ + t₋ = l(A_{q_p})`, the dyadic exception, `t₊ ≤ l₊`, `t₋ ≤ l₋`, `2(t₊+t₋) ≤ l₊+l₋`, and the seven 2-elementary clauses.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms* (91:9, 92:1, 92:5, 93:28–29, 101:8, 102:7, 103:4, 104:5, 106:13): no legal copy in the cache or found by the service; the 3B invariance of norm ideals at `p = 2`, the 4C rank-three count and the 6C classification rest on it.
- Cassels, *Rational Quadratic Forms* and *Geometry of Numbers* (2F, 4F, B4): not readable; 2F checked by computation only.
- Cox (B2, B4, B5) and Cohen (B2, B5): cited uncertified by the README; not in the cache; the mathematics was recomputed, the page numbers were not checked this round.
- Milnor–Husemoller (1H, 1I, 1L, 6A, 6H), van der Blij (1L), Wall (1H), Gan–Yu Theorem 7.3 (7C), SPLAG chapters 4, 15, 16 (3E, 6A), Ebeling, Kitaoka, Kneser: paywalled or absent; Nikulin and Serre support the statements inspected above.
- The Serre text in the cache comes from a university course page; its lines are cited as the worker's service recorded them.
- Statability of 4B and B2 at the pins (R02) was argued from the native carriers, not elaborated; only Theorem 1.11.3 was elaborated.

## Source issues

- none
