# Review of FaltingsFinitenessAndIsogenyTheorems (pull request #1004 at d303ef8)

**Verdict:** needs changes

Independent AI review. The PR files were not changed. Five blocking findings and four P3 findings follow. The targeted build passes; the supplied gate fails its residue rule.

## R01 (P1) — The two graphs are not a direct sum in characteristic two

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:1734`, together with the arbitrary-characteristic scope at 1717. The definition uses “`⊕`” for the two graph subspaces inside `V^8`.

**Claim:** The construction is an internal direct sum in the stated arbitrary-field generality. Restricting the subsequent dimension and recovery theorems does not make this definition a direct sum in characteristic two.

**Witness:** Over `𝔽₂`, take symplectic `V = 𝔽₂²`, `W = ⟨e₁⟩ = W⊥`, and `v = I₄`. Both graphs coincide: each has 16 elements, their sum has 16, their external direct sum 256.

**Repair:** Define the subspace as the ordinary sum of the graphs over every field. State directness only under `2 ≠ 0`, alongside dimension and recovery. Add this characteristic-two example as a negative control. In the witness the corrected sum has dimension 4 and remains isotropic; no dimension-8 or recovery assertion applies. Over `ℚ₂`, `2` is nonzero, so the intended Faltings application is retained.

## R02 (P1) — The lifting argument consumes scheme covers not supplied by PELModuli

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:695` and 705: “through a finite surjective scheme cover of `J`” and “the finite scheme covers”.

**Claim:** R28.1.4 uses a finite scheme cover to obtain the integral lift and attributes the necessary level-cover input to PELModuli M6.3.

**Witness:** `TauCetiRoadmap/PELModuli/README.md:3825` supplies fine smooth algebraic spaces. Its M2.8, lines 2383–2386, explicitly excludes scheme representability. Neither statement supplies a finite scheme cover of the proper correspondence `J`.

**Repair:** Use the actual algebraic-space level-cover contract and explicitly own the proper-stack lifting statement needed here: after a finite extension of the number field, a generic lift through this proper DM correspondence extends over its ring of integers. Give its properness, finite-presentation and descent inputs; alternatively add and prove the finite scheme-cover theorem actually used. Check the repair over both residue characteristics 2 and 3: level 3 is available at 2 and level 4 at 3. Calling either fine algebraic space a scheme supplies no missing representability proof.

## R03 (P1) — Replace nonexistent supplier declaration names with their actual targets

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:401`–403: “`mulHeight_algebraMap`”; the same issue affects the aliases at 370–372 and 420.

**Claim:** These names identify exact supplied declarations. The height supplier instead names its theorem `mulHeight_pow_finrank`; the continuous Mackey, induction determinant and Hodge–Tate determinant inputs are supplied as prose targets, without the aliases used here.

**Witness:** On main, `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:269` and `Suggested.lean:239` supply `mulHeight_pow_finrank`. `mulHeight_algebraMap` occurs in neither file nor either pinned library.

**Repair:** Cite `mulHeight_pow_finrank` at §0.2, with its finite-tuple and number-field hypotheses, and reverse its equality when using the displayed orientation here. For `(2,1)` under `ℚ ⊆ ℚ(i)`, its two sides are `2² = 4`; for the zero tuple they are `1² = 1`. Also replace `ContinuousRep.finite_doubleCoset_mackey` and `ContinuousRep.det_ind` by ArithmeticGaloisRepresentations §1.3’s named Mackey and determinant targets, and `hodgeTate_det` by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19’s determinant consequence. The first two give determinant `−1` for an index-two trivial induction; the last gives `C(1)` for the determinant of `μ_{p^∞}`. The mathematics is supplied; the exact dependency names need correction. P1 follows the brief's rule for a dependency citing a declaration that does not exist where cited.

## R04 (P2) — Keep the DVR generality of the maximal-order lattice theorem

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:2215`–2219: “let `F/ℚ_l` be a finite extension”.

**Claim:** The owned general lattice-classification theorem is restricted to this number-field application.

**Witness:** `yu-maximal` lines 565–584 works over an arbitrary DVR, with a maximal order in a central simple fraction-field algebra. `R = 𝔽₂[[t]]`, `D = 𝔽₂((t))`, lattices `R,tR` satisfy it but are excluded here.

**Repair:** State the classification for a DVR `R`, its fraction field `F`, a finite-dimensional central simple `F`-algebra, a maximal `R`-order, and full lattices in one finite module. Keep the complete-DVR division-algebra construction as a supporting step, then supply the passage to arbitrary DVRs as in Yu §4.4. Retain the finite-extension-of-`ℚ_l` case as an application. In the witness multiplication by `t` is an `R`-linear isomorphism `R → tR`, extending to an `F`-linear automorphism; the repaired general statement covers it. Also check `𝔽₂[t]_(t)` to distinguish the complete and noncomplete versions.

## R05 (P2) — State stable-lattice finiteness in the acceptance test

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:36`, 2235–2250; `Suggested.lean:36`–48.

**Claim:** R28.5.9's finite stable-lattice classification is a headline target, but the Lean file neither states it nor identifies a missing carrier.

**Witness:** Mathlib `Algebra/Module/Lattice.lean:67` supplies `Submodule.IsLattice`; `Representation`, `IsSemisimpleModule`, `LinearEquiv` and `Finset` suffice. A scratch signature using precisely these carriers elaborated, with only its theorem's `sorry` warning.

**Repair:** Add the theorem for a finite-dimensional `ℚ_l` representation with semisimple associated group-algebra module and an existing stable full `ℤ_l` lattice. Quantify a finite family of stable lattices and equivariant rational automorphisms carrying representatives onto every stable lattice. Carry the `ℤ_l` action and scalar-tower hypothesis explicitly. One simple predicate combining the native lattice condition with invariance suffices. For the trivial action on `ℚ_l²`, one representative `ℤ_l²` works; the unipotent negative control has coinvariant torsion orders `l^k`, so semisimplicity must remain.

## R06 (P3) — Remove the six anchors rejected by the gate

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:476`, 1107, 1398, 1669, 1964 and 2533; for example `<a id="r28-1"></a>`.

**Claim:** These HTML anchors violate the supplied gate's residue rule.

**Witness:** The head gate reports `residue=6`, every other counter zero, and `FAIL`; its six reported lines are exactly the six anchors above.

**Repair:** Delete the anchors and use heading links wherever needed. With those six lines removed, the identified residue matches disappear; rerun the gate. No acceptance is possible while this gate remains failing.

## R07 (P3) — Make README names match the acceptance-test declarations

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:1547`–1557, 1738–1747 and 1760–1778; `Suggested.lean:56`–185.

**Claim:** API bullets and Checks advertise backticked local declaration names that the Lean file does not declare. The Lean file also lacks the layer section comments required when stating targets from multiple layers.

**Witness:** Examples are `PolarizationReduction.comp_eq`, `QuaternionIsotropic.subspace_isotropic` and `QuaternionIsotropic.not_isotropic_identity`. None is among the file's 12 declarations. The last is explicitly presented as a Check.

**Repair:** Keep the mathematical API and Checks in prose; remove undeclared local Lean labels rather than filling `Suggested.lean` with API padding. Preserve backticked names for actual headline declarations and actual suppliers. Add Layer R28.5 and R28.6 section comments at the appropriate points of the Lean file. The quaternion checks still compute 87 on the diagonal and 2 on the identity graph without claiming Lean declarations. The gate's zero missing-ID counter does not establish this stronger house rule.

## R08 (P3) — Give both good-reduction predicates their API and discriminating Checks

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:2047`–2052 and 2492–2497; `Suggested.lean:59` and 99.

**Claim:** The two retained definitions are described, but neither has its own API and three discriminating Checks. The surrounding finiteness Checks do not test the model predicates.

**Witness:** The README introduces `hasGoodReductionAt` in one paragraph and `curveHasGoodReductionAt` in another; it does not specify their isomorphism transport or test a smooth model against a non-smooth candidate.

**Repair:** Specify isomorphism invariance and the model-to-predicate introduction rule, including group compatibility for abelian varieties. Add at least three explicit Checks for each. Suitable computations include the zero abelian scheme, `y²=x³−x` at 5 (`Δ=64≡4`), and failure of smoothness for a nonreduced special fibre; For curves use `ℙ¹_ℤ₂` (genus 0), the proper smooth model of `y²=x⁵−x+1` over `ℤ₅` (genus 2, derivative `−1` modulo 5), and a candidate whose special fibre is `y²=x²(x+1)` over `𝔽₅` (node at `(0,0)`). A nodal candidate must fail smoothness even when its generic fibre is smooth. Keep these API statements and Checks in the README.

## R09 (P3) — Register the cited works in the source manifest

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:2825`–2863.

**Claim:** The folder cites numerous works but contains no `sources.toml`, contrary to the required source-registration contract.

**Witness:** The folder contains only `README.md`, `Suggested.lean` and `metadata.toml`. None of the four seeded targets has a recorded source entry.

**Repair:** Add the required manifest, one stable key per work, with the service provenance, exact locators and the appropriate fetched or uncertified status. Do not add source PDFs or extracted text to the folder. For the seeded sample, register Yu 4.8(2), Milne I 15.4–15.5/15.8 and III 6.6/6.11; distinguish Milne's pointed discussion from the unpointed supplier contract. This review did not edit a manifest.

## Verified sound

The complete 2,863-line README and the 187-line Lean file were read. The repository's writing and contributing rules and the main-branch HeightsAndUnits and JacobianChallenge roadmaps were read for shape. The requested head is `d303ef854fb63a7ed86e0129db5fc32ee56eaf29`; the worktree was clean, and the outside-folder diff was empty. No re-planning of a roadmap already on main, computational algorithm, sorry-valued data, `set_option`, or copied source passage was identified. Locating assistants found source and supplier text; the mathematical findings and computations here were made by the reviewer.

The four seeded source targets were checked against legally fetched text:

| Target | Source locator actually read | Outcome |
| --- | --- | --- |
| Local maximal-order lattices | `yu-maximal` lines 524–592; §4.3–4.4, Theorem 4.8(2), printed pp. 12–14 | The theorem begins on p. 13 and its lattice assertion is on p. 14. It supports the claim, with broader DVR generality: R04. The valuation/Morita inputs are in Lemma 4.4 and Theorem 4.5. |
| Arithmetic closed-orbit adapter | `milne-av` lines 2689–2694 and 2710–2733; I Theorem 15.5 and Remark 15.6, pp. 65–66 | Reductive group, arithmetic subgroup, invariant lattice and geometrically closed orbit all occur. The left-regular lattice stabilizer is `O×`; the conjugation representation preserves `O`. |
| Integral idempotents | `milne-av` lines 2683–2686, 2748–2767; I Proposition 15.4 and Application 15.8, pp. 65–67 | The finiteness statement matches. The roadmap correctly avoids the source's erroneous identification of an idempotent orbit with its Grassmannian of images. |
| Canonical polarization without a curve point | `milne-av` lines 4281–4292 and 4381–4400; III Theorem 6.6 and Summary 6.11, pp. 105–108; JacobianChallengePartII §1.4 | Milne's displayed construction assumes a point. The no-point and arbitrary-base-change clauses come from the explicitly cited supplier, whose text does state them. Do not read the two Milne locators alone as a proof of unpointed descent. |

The supplementary height citation was also fetched: `wu-heights` lines 132–183, §2, printed p. 4. Its normalization notation is inconsistent (see Source issues); R03’s corrected supplier theorem and the computed `2 → 4` relative-height comparison provide the precise contract used here.

No locator was explicitly flagged “unverified” or “uncertified” in the README. The sample's arithmetic and idempotent statements have the stated hypotheses. Milne's direct-factor theorem also uses the stronger ambient-automorphism equivalence, which implies the abstract-isomorphism finiteness stated here.

Build and signature checks:

- `lake build TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems.Suggested` completed successfully. Direct `lake env lean` elaboration of the requested file also succeeded. Both reported only the nine expected `sorry` warnings.
- A copy with `#check @name` for all 12 declarations elaborated. All number-field, ellipticity, prime, genus and geometric hypotheses survived. In particular `A.dim = g` coerces `g` into `WithBot ℕ∞`, and curve genus uses cardinal rank of the native structure-sheaf cohomology. No binder repair was needed in those 12 declarations.
- All nine admitted theorems were probed with `simp`, `rfl` and `infer_instance`, each required to close the goal. All nine still reached `sorry`. Object searches found no single pinned theorem proving one of these nine headlines directly. No Lean padding finding was established.
- The additional R28.5.9 signature described in R05 elaborated using only `import Mathlib`, a real-bodied stable-lattice predicate, and the stated theorem. It retained finite dimension, semisimplicity, scalar tower and stable-lattice existence in its printed type.

The README's end theorems are bounded-height finiteness (Satz 1), corrected stationarity (Satz 2), Tate semisimplicity and integral End/Hom comparison (Sätze 3–4), the isogeny criterion, isogeny-class finiteness (Satz 5), polarized/unpolarized Shafarevich (Satz 6), curve finiteness, and elliptic isogeny-class finiteness. Its headline table additionally includes stable-lattice finiteness and integral commutant generation. The file states the available unpolarized abelian/curve and elliptic results, plus direct-factor finiteness. Its docstring names the missing height, general Tate, polarization and Jacobian interfaces for the other end theorems. R05 is a separate statable omission, not a request to add elementary quaternion or boundary-case declarations.

Pinned declarations opened (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`):

| File at the pin | Declaration / content checked |
| --- | --- |
| `Mathlib/Algebra/Module/Lattice.lean:67` | `Submodule.IsLattice`: finite generation and full scalar span; no topology or stability condition is built in. |
| `TauCeti/Algebra/Module/Lattice.lean:115` | `LinearEquiv.extendOfIsLattice`: extension from full free lattices. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | `AbelianVariety`: proper, geometrically integral group scheme; smoothness is derived, and dimension at 118 is topological Krull dimension. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56` | `isogenies` / `IsIsogeny`: finite and surjective underlying scheme morphism. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Product.lean:61` | Native product carrier used by direct-factor finiteness. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:106` | Native Hom: pointed multiplicative coordinate pullbacks, with zero separately represented. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71` | Galois action on geometric points at every torsion level. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:94` | Rank two requires a separably closed coefficient field and invertibility of the prime, both available over the algebraic closure of a number field. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43` | `localPolynomial`: `1−aX+qX²`, `1−X`, `1+X`, or `1`. Infinite-residue-field cardinalities are junk values, excluded by these number-field completions. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61` | `Scheme.Modules.Cohomology`: small-Zariski sheaf cohomology. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:131` | `InvertibleSheaf.trivial`: free rank-one structure module. |
| `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:293` | `AlgHom.centralizer_centralizer_range`: finite ambient module and semisimple acting algebra; returns the image, not an assumed faithful algebra. |
| `TauCeti/LinearAlgebra/QuadraticForm/FourSquares.lean:41` | `QuadraticMap.euler_four_squares`: quadratic-map identity, not the alternating two-graph construction. |
| `Mathlib/NumberTheory/MahlerMeasure.lean:106` | `Polynomial.finite_mahlerMeasure_le`: the supplied bounded-degree bounded-measure finiteness theorem. |

Ownership searches used objects—Tate actions, polarizations, maximal orders, stable lattices, closed orbits, idempotents, direct factors, and Torelli—in the pins, main roadmaps, board packages and indexed open roadmap heads. The supplied Part II roadmap is a consumer of this base roadmap. No duplicate fully qualified name among the twelve local declarations was identified. Stable-lattice existence belongs to ArithmeticGaloisRepresentations §1.6; its semisimple isomorphism-class finiteness is the additional object owned here. Integral-order carriers and containing maximal orders belong to ClassicalArithmeticCompletion. Canonical Jacobian polarization and geometric strong Torelli are imported; the field identification and rational descent are the variants owned here.

The dependency command returned exactly:

```text
depcheck: 209 roadmaps, 1477 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This mechanical result does not validate the strength or spelling of supplier contracts: R02 and R03 remain.

Supplier resolution covered every external supplier named in the `Needs` blocks. The substantive interface checks included:

| Supplier and repository-relative locator | Resolved input / boundary |
| --- | --- |
| `TauCetiRoadmap/JacobianChallengePartII/README.md:259`, 1012, 1026, 1036 | No-point polarization with base change; stable Picard Lie, Hodge and determinant comparisons. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1993` | Geometric strong Torelli; uniqueness and perfect-field descent remain here. |
| `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:670`, 672, 1342, 1359 | Finite-presentation semiabelian families, dense-open extension, all-prime toroidal/minimal compactifications. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15757` on main | Containing maximal order with nondegenerate regular trace; characteristic-zero semisimple algebras meet that hypothesis. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3108`, 3126, 3134 | Closed-orbit lattice bounds, reductive-subgroup reduction, rational orbit finiteness. The generic subgroup transport is explicitly owned in R28.5.12. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:940`, 949, 1127, 3777, 3812 | Mackey, determinant/sign, trace recognition, geometric-point elliptic comparison, isogeny cokernels. The first two mathematical topics exist, although the proposed `ContinuousRep.*` aliases used here are not declarations there. Cite the topic names. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1318`, 1698, 1809, 2384 | Invariant differentials, Hodge–Tate weights, shifted closure theorem, Raynaud with `e≤p−1`. The determinant consequence is present under R07.1.19, though not named `hodgeTate_det`. |
| `TauCetiRoadmap/PELModuli/README.md:2383`, 3825, 3930 | Algebraic-space level covers and forms/descent; scheme-cover overclaim is R02. |
| `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:269` | Correct relative-height extension formula; exact-name defect is R03. |

The remaining located supplier sections are ClassFieldTheory Layer 13; Chebotarev Layer 10; GlobalNumberFields Layer 10; NumberFieldArithmetic §§4.3, 6.4; LocalFieldsRamification Layer 3; EllipticCurves Layers 1, 2, 4; JacobianChallenge D–E; SchemeAndStackFoundations §§1.1, 2.20, 3.2, 3.5, 3.6, 3.8, 4.15, 4.17; AlgebraicVectorBundles L0B–L0C; AlgebraicModuliForArithmeticGeometry §5.4; ComplexComparisonPartII C0.3–C0.4; AbelianSchemesAndArithmeticModuli A0–A6 as itemized in the contracts; ArithmeticGaloisDuality R02.3.1; NeronModelsAndSemistableAbelianVarieties §§2.4, 3.1–3.13, 4.13, 5.1–5.2, 6.4–6.5; HeightsAndUnits §1.1; DeligneWeightsAndPurity §§0.14, 1.4; WeightsInEtaleCohomology R34.2; ShimuraVarieties §§2.7, 8.18; PadicPeriodRings §2; PadicDifferentialEquationsAndRigidCohomology RD.5.116; RepresentationTheory/SemisimpleAlgebras Layers 2 and 6. No absent mathematical section was inferred merely from the worker's 57 unresolved-name leads.

The 130 adversarial rows below distinguish numerical tests from proofs. They do not claim that finitely many examples prove the headline finiteness theorems. “Retain” means no defect was found in that test; supplier- or source-dependent general proofs are separate obligations. All nine Lean headlines and all four seeded targets occur in the table.

| Statement / convention | Instances | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Infinite-place weights/product formula | `ℚ(i), x=2` | Norm `4`; weighted product `2²=4`, logarithmic sum `2 log 2=log 4`; weight 1 gives only `log 2` | Retain weight 2. |
| Semiabelian convention | `G_m`, `G_a`, zero group | Torus/abelian ranks `(1,0)`, no torus-by-abelian presentation for `G_a`, `(0,0)` | First/third included, additive group excluded. |
| Hodge metric, R28.1.1 | Dimension 1, `τ=i`; product of two such curves | Correct norms squared `1,1`; printed factor as described in README gives `1,−1` | Formula computation sound; original scan's factor not independently legible. |
| Conjugate-linearity convention | `α=dz, β=i dz`, area 1 | Pairing `i`; swapping arguments gives `−i=conj(i)` | Retain the stated `β∧bar(α)` ordering. |
| Polarization degree | Elliptic curve, `λ=2λ_E` | Kernel rank `4`, roadmap degree `4`; supplier degree `2` | Square conversion retained. |
| Tate-module rank/cokernel | Elliptic `[2]`, `l=2` and `l=3` | Tate ranks `2`; cokernel orders `4` and `1`, the respective parts of degree `4` | Retain. |
| Frobenius convention | `11a1` over `𝔽₂` | Point count `5`, trace `2+1−5=−2`; factor `1+2T+2T²` | Retain. |
| Bad local factor | Split Tate curve, residue cardinality `q=3` | Tate invariant line has eigenvalue `3`; coinvariant line eigenvalue `1`; factors `1−3T` versus required `1−T` | Correct coinvariant/dual-invariant convention. |
| Unit/character convention | `l=2`, unit `−1`; odd `l`, unit Teichmüller root | Principal unit part `1`, torsion part `−1`; odd-prime torsion order divides `l−1` | Retain `q=4` at 2. |
| Induction sign | Index-two subgroup, trivial rank-one module | Transposition matrix determinant `−1`; sign character `−1` | Retain sign factor. |
| R28.1.1 stable Picard determinant | Genus-two compact type and one-loop nodal curve | Picard toric ranks `0,1`; Hodge ranks `2,2`; exterior determinant ranks `1,1` | Properness of Picard is not needed. |
| R28.1.1 base-change comparison | Constant rank-two bundle over `k[t]`, at `t=0` | `Λ²(k[t]²)⊗k = k = Λ²(k²)` | Retain. |
| R28.1.2 uniqueness/extension | Generic identity of semiabelian model; `[2]` on `G_m` | Composites of extended inverse maps are `id`; map is `t↦t²` on generic and special fibres | Retain marked-generic-fibre uniqueness. |
| R28.1.3 curve/norm construction | Double cover of genus-one curve with two simple branch points | `2g'−2=2·0+2=2`, hence `g'=2`; norm after pullback is `[2]` | Retain. |
| R28.1.3 Hodge subline | `R=ℤ₂`, map of lines multiplication by 2 | Image `2R`, saturation `R`; quotient `R/2R` has two elements | Image is not a direct summand; saturation necessary. |
| R28.1.3 αβ and generic modular isomorphism | Scalar `[d]`, `d=2`, determinant rank `g=2` | Differential scalar `2`; determinant scalar `4=2²`; a rank-two Jacobian mapping to rank-one abelian variety cannot be an isomorphism | Retain. |
| R28.1.3 all-prime compactification | Level 3 at 2, level 4 at 3 | `3 mod 2=1`, `4 mod 3=1`; simultaneous inversion of 6 deletes both primes | All-prime requirement retained; R02 addresses the cover type. |
| R28.1.4 commensurability/degree bound | Lines `L=ℤ`, `M=2ℤ`, same real metric | `2L⊆M⊆(1/2)L`; degree difference magnitude `log 2`, bound `log 2` | Retain; lifting proof needs R02 repair. |
| R28.1.5 degree independence | `P=ℤ`, sections `1,2` | `log1−log1=0`, `log2−log2=0` | Retain. |
| R28.1.5 fractional-ideal formula | `I=(1/2)ℤ`, section `1/2` | `−log N(I)=log2`; index term `log1=0`, norm term `−log(1/2)=log2` | Retain. |
| R28.1.5 rescaling | Unit ideal, metric multiplied by 2 | Degree changes by `−log2` over `ℚ`, `−2log2` over `ℚ(i)` | Retain sign and multiplicity. |
| R28.1.5 base change | Same trivial line with norm factor 2, `ℚ⊆ℚ(i)` | Degrees `−log2`, `−2log2`; normalized heights both `−log2` | Retain. |
| R28.1.5 zero ideal | Zero fractional ideal | No nonzero section; rank `0≠1` | Excluded, not a geometric height. |
| Supplier height-extension identity | `(2,1)` and zero tuple, `ℚ⊆ℚ(i)` | Relative heights `2→4=2²`, `1→1=1²`; absolute heights `2→2` | R03 repairs name only. |
| R28.1.6 logarithmic metric | `t=1/2`, norm `−log|t|` | Norm `0.693…`, inverse `1.442…`, upper bound `1.693…` | The claimed constant works near zero. |
| R28.1.6 nonexample | `t=e^(−N)`, norm `|t|^(−1/2)` | Norm `e^(N/2)` versus `C(1+N)^n`; ratio tends to infinity | Power pole excluded. |
| R28.1.6 empty boundary | Trivial line, constant norm 2 | Norm/inverse `2,1/2`; constant bound `2` | Retain. |
| R28.1.7 Tate metric | `τ=i`, `q=e^(−2π)` | `‖dz‖²=1`; `‖du/u‖²=4π²=−2π log|q|` | Retain normalization. |
| R28.1.8 Northcott comparison | `x=(2:1)` over `ℚ(i)` | Fubini–Study height `½log5`; relative height `2log2`; difference from normalized height `½log(5/4)` | Retain division by field degree. |
| R28.1.8 zero-section guard | One nonzero local section and one identically zero section | `Real.log |Real.log 0|=0`; nonzero section at `e^(−N)` gives `log N` | Maximum/selected nonzero section avoids false minimum. |
| R28.1.8 non-logarithmic counterexample | Points `t=1/N`, pole metric | New height `½log(N²+1)−log N=½log(1+N^(−2))→0` | Infinitely many bounded-height points if power poles allowed. |
| R28.1.9 fixed-degree Hermite adapter | Quadratic extensions of `ℚ` ramified only at 2 | Discriminants `−4,8,−8`; exactly three quadratic subfields; degree-at-most-two set also contains `ℚ` | Retain fixed-degree subset and embedded-field count. |
| R28.1.9 different bound | `ℚ₂(√2)/ℚ₂` | `e=2`, different exponent `3`; `e−1+v(2)=1+2=3` | Wild upper bound correct. |
| R28.1.10 forms/rigidity | `[-1]` on elliptic 2- and 3-torsion | Mod 2: `−I=I`; mod 3: `−I≠I` | Level 2 does not rigidify. |
| R28.1.11 Satz 1 | Dimension zero, thresholds `c=−1,0` | Height `0`; admissible class counts `0,1` | Boundary consistent; general proof uses the repaired lift. |
| R28.1.12 kernel pairing | `λ=2λ_E` | Kernel order `4`; Lagrangian subgroup order `2`; square `2²=4` | Retain perfect pairing condition. |
| R28.1.12 descent iff | Cyclic order-2 subgroup versus all of `E[2]` | Cyclic quotient: `4=1·2²`; whole kernel would demand `4=deg μ·4²`, so `deg μ=1/4` | Both directions distinguish isotropic from nonisotropic. |
| R28.1.12 Weil pairing transport | Quotient by cyclic kernel, vectors `x,y` | Pulled-back pairing equals that of `2λ_E`, i.e. `2e_E(x,y)` in additive notation | Retain direction of pullback. |
| R28.1.12 product polarization | Elliptic degrees `4,9` | Product degree `36=4·9`; mixed-block pairing `0` | Retain. |
| R28.1.12 rational maximality | `y²=x³−x+1`, 2-torsion cubic | Neither `1` nor `−1` is a root; no rational line; rational isotropic zero subgroup order `1≠2` | Geometric Lagrangian condition necessary. |
| R28.1.13 uniform principal reduction | `λ=nλ_E`, `n=2`; `d=1` | Quotient degree `2=√4`; principal case degree `1`, zero kernel | Retain separation from semistable extension. |
| R28.1.13 recovery of source | Kernel order `s=√d` | Image of `B[d]` under quotient has order `d^(2g)/s`; quotient degree followed by recovery equals degree `[d]` | Recovery uses a bounded finite torsion group. |
| R28.2.1 isogeny height | `[2]` on an elliptic curve over degree-`m` field | Degree `4`, differential order `2^m`; increment `½log4−log(2^m)/m=0` | Retain. |
| R28.2.2 valuation bounds | Degree-`p` étale and multiplicative kernels | Valuations `m` and `−m`; `[p]` elliptic gives `0` between `−2m,2m` | Retain factor `m`. |
| R28.2.2 annihilation | `G=μ_(p²)` | Differentials `R/p²R`; multiplication by `p²` is zero, by `p` need not be | Retain annihilator assertion. |
| R28.2.3 inertia quotient | Good reduction; split/non-split Tate curve | Quotient ranks `0,1,1`; quotient inertia `1`; split/unramified quadratic Frobenius values `1,−1` | Retain quotient, not invariant-line assertion. |
| R28.2.4 differential cardinality | `μ_(2²)` over degree-two extension of `ℚ₂`; étale group | Orders `2^(2·2)=16` and `1`; ramification affects local degree, not only residue degree | Retain. |
| R28.2.5 local Hodge–Tate determinant | Multiplicative and étale height-one groups | Weights `1,0`; determinants `C(1),C(0)` | Retain positive twist. |
| R28.2.6 continuous characters | Cyclotomic and quadratic characters at `l=2` | Exponents `a=1,0`; finite factors of orders `2,≤2` | Retain. |
| R28.2.7 induced determinant | Quadratic split/inert places, local `d=1` | Split weights `1+1=2`; inert weight `2·1=2`; permutation signs finite | Retain local-degree weights. |
| R28.2.8 induced Frobenius | Inert quadratic place above `p=2` | Original root modulus `2`; induced square-root modulus `√2`; dimension-two determinant modulus `2` | Retain. |
| R28.2.9 determinant identity | Whole elliptic Tate module over quadratic field | Inert: `2·1=2=2·2/2`; split CM height-one factor: `1+0=1=2·1/2` | Retain. |
| R28.3.1 saturation | `W=2ℤ₂⊆ℤ₂`, then `W=0,T` | `2·1∈W`, `1∉W`; quotient torsion order `2`; endpoint quotients torsion-free | Excludes nonsaturated lattice. |
| R28.3.1 closure shift | Full ambient divisible group | Level orders `l^(nh)`; successive quotient orders `l^h`; all transition maps already isomorphisms | Shift unnecessary in this example. |
| R28.3.2 intersection shift | `T=ℤ_l²`, `H=ℚ_l(1,l)`, `G=ℚ_l e₁` | Defect order `l` at `k=0`; order `1` at `k=1` after enlarging `T` by `l^(−1)e₁` | Retain. |
| R28.3.3 local/global differential count | Full elliptic tower, `l=2,n=2,m=2` | Local product `2^(2·2·1)=16`; global differential order `16` | Retain shift-before-count order. |
| R28.3.4 stationarity | Full elliptic divisible group | Quotient `A/A[l^n]≅A`; increment `n log l·(1−1)=0` | Consistent; erratum certifies eventual, not initial, constancy generally. |
| R28.3.5 reduction data and composition | `λ=2λ_E`, cyclic order-2 kernel | `deg π=2`, `deg μ=1`, pullback degree `1·2²=4` | Retain composition and kernel conditions. |
| R28.3.5 principal/base change clauses | Principal `λ`, then finite extension | `H=0`, `π=id`, degree `1`; extended degree remains `1` | Retain; semistability is a separate clause. |
| R28.3.6 powers | Principally polarized elliptic curve, powers 1 and 8 | Dimensions `1,8`; Tate ranks `2,16`; polarization degrees `1¹=1,1⁸=1` | Retain. |
| R28.3.7 finite-index descent | `S₃` action and order-two subgroup | Averaging uses 3 cosets and factor `1/3`; trivial subgroup alone gives no semisimplicity conclusion for an infinite unipotent group | Finite index needed; normality not needed for averaging. |
| R28.3.7 End descent | CM elliptic curve over `ℚ⊆ℚ(i)` | Rational End dimensions `1,2`; conjugation invariants of `ℚ(i)` have dimension `1` | Retain invariants. |
| R28.3.7 isogeny conjugation | Scalar isogeny `[2]`, quasi-inverse `[2]`, degree 4 | `f x g/4=4x/4=x` | Retain division and rational scope. |
| R28.3.8 maximal isotropic tower | `g=2`, isotropic dimensions `r=2,1`, `l=2,n=1` | Descended degrees `2^(2(2−2))=1`, `2^(2(2−1))=4` | Maximality distinguishes bounded principal degree. |
| R28.4.1 four squares | `l=2`: `a²=−7,b=c=1,d=2` | Sum `−7+1+1+4=−1`; Hensel inequality `1/8<1/4` | Retain. |
| R28.4.1 odd prime | `l=3`, `a²=−2,b=1,c=d=0` | Sum `−2+1=−1`; derivative `2` is a unit mod 3 | Retain. |
| R28.4.2 quaternion transpose identities | `(2,3,5,7)` | Both products have diagonal `87` and all off-diagonal entries `0` | Retain both directions. |
| R28.4.2 multiplication convention | Right multiplication by `i` on `j` | `j i=−k`; displayed matrix sends third basis vector to minus fourth | Retain right-multiplication label. |
| R28.4.2 sum-form API | Symplectic basis pair in one, distinct, all eight coordinates | Pairings `1,0,8` respectively | Retain unnormalized orthogonal sum. |
| R28.4.2 graphs, odd characteristic | `dim V=2`, `W` a line | Each graph dimension `4`, intersection `0`, sum dimension `8=½·16` | Retain under `2≠0`. |
| R28.4.2 graphs, characteristic two | `V=𝔽₂²`, `W=⟨e₁⟩`, `v=I₄` | Graph dimensions `4,4`, intersection `4`, ordinary sum `4`, not `8` | R01: replace direct sum in definition. |
| R28.4.2 isotropy/recovery | `(s,t)=(x+y,v(x−y))`, `2≠0` | Pairing cross term `2e(x,y)=0`; recovery `(s+v⁻¹t)/2=(2x)/2=x` | Retain; at char 2 division cannot recover `x`. |
| R28.4.2 invariant subspace | Scalar similitude factor `c`, stable `W` | Orthogonality transforms `0↦c·0=0`; scalar matrix commutator `0` | Retain invariance. |
| R28.4.2 identity-graph negative control | Symplectic pair, `v=I`, char 0 | Graph pairing `1+1=2≠0` | Retain as README Check, not a Lean declaration. |
| R28.4.3 compact image argument | Toy `T=ℤ_l²`, `W=ℚ_l e₁`, `u_n=diag(1,l^n)` | Images `ℤ_l e₁+l^nℤ_l e₂`; limit `diag(1,0)` has image `W` | Both inclusion and surjectivity visible. |
| R28.4.4 idempotent endpoints | `W=0,V` | Idempotents `0,1`; images `0,V`; squares `0,1` | Retain. |
| R28.4.5 Tate semisimplicity | Zero abelian variety; non-CM elliptic | Zero module is semisimple; elliptic commutant has scalar dimension `1`, not full endomorphism dimension `4` | Boundary and distinction consistent. |
| R28.4.5 integral End comparison | CM curve `y²=x³−x` over `ℚ` vs `ℚ(i)` | Integral End ranks `1,2`; respective predicted commutant ranks `1,2` | Ground field retained. |
| R28.4.6 Hom comparison | Nonisogenous elliptic `E,F`; `E²` to `E×F` | Hom ranks `0`; then rank `2` from the shared `E` factor | Nonisogeny alone does not force zero in higher dimension. |
| R28.4.7 isogeny/local-factor iff | `37a1,37b1` at 2 and 7 | Traces at 2 `−2,0`, at 7 `−1,−1`; factors at 2 differ in coefficient `2` versus `0` | One matching prime does not imply isogeny. |
| R28.4.8 prescribed integral Tate modules | Same principally polarized abelian variety | Isogeny degree `1`; all valuation differences `0`; height quotient `1` | Retain; every prime is required in the general bound. |
| R28.5.1 Weil-polynomial finiteness | `n=2,r=√2`; `n=0`; `r=0` | Six quadratics; singleton `{1}` at degree 0; singleton `{X^n}` at radius 0 | Retain. |
| R28.5.1 negative radius | `r=−1`, `n=1` versus `n=0` | Counts `0,1`; no roots for constant polynomial | Retain degree-zero exception. |
| R28.5.2 trace test | Trivial 2D representation vs unipotent extension | Both traces `2`, characteristic polynomials `(X−1)²`; fixed-space dimensions `2,1` | Semisimplicity essential. |
| R28.5.2 conjugate spanning | Standard `S₃` representation over `ℚ₅` | Image algebra dimension `4`; only three class representatives span dimension at most `3` | Include conjugates, as stated. |
| R28.5.2 finite-quotient bound | `d=2,l=2` | Rank at most `8`; underlying ring size at most `2⁸=256`; unit group strictly smaller | Retain. |
| R28.5.3 / Lean finite isogeny classes | Dimension zero | Representative family size `1`; identity degree `1`; no bad places | Boundary agrees. |
| hasGoodReductionAt | Zero model; smooth elliptic model at 5 | Smooth/proper/connected true; elliptic discriminant `64≡4 mod5` | Positive tests; R08 adds API and negative controls. |
| R28.5.4 auxiliary polynomials | `11a1,p=2` | `P₀=T−1`, `P₁=T²+2T+2`, `P₂=T−2`; roots' moduli `1,√2,2` | Retain. |
| R28.5.4 auxiliary bound | Same example, all allowed `(h,j,±)` | Evaluations `1,−3,5,1,10,2,−1,−3`; prime divisors `{2,3,5}`; `np=22` | `N=22` works, `N=21` fails. |
| R28.5.4 bound negative control | Triple power of the curve | `P₁(8)=82³`, divisor `41>22` | Correct rejection of the same bound. |
| R28.5.5 twisted determinant | Quadratic permutation, odd rank | Sign `−1`; product `χ·ε^h` cancels `(-1)²=1` | Retain twist. |
| R28.5.6 mod-l characters | `l=2`; `l=3` quadratic cyclotomic character | `𝔽₂×={1}`; exponent `(3−1)/2=1`, complex-conjugation value `−1` | Infinity may ramify. |
| R28.5.7 Raynaud determinant | Local multiplicative and étale order-l groups | Differential lengths `1,0`; characters `χ₀,1`; counts `l,1` | Retain good/unramified-at-l hypotheses. |
| R28.5.8 large-prime height equality | `[l]` on elliptic curve over degree-m field | `h=2,d=m`; increment `(1−m/m)log l=0` | Consistent with determinant constraint. |
| R28.5.9 local maximal-order lattices | `D=F`, lattices `R,πR` | Both generic ranks `1`; multiplication by `π` is an isomorphism onto `πR`, while lattices are unequal | Retain; generalize via R04. |
| R28.5.9 matrix-order test | `O=M₂(R)`, module `F²` | Simple lattice has R-rank `2`; free rank-one O-module has R-rank `4` | Morita equivalence, not O-freeness, is required. |
| R28.5.9 semisimple factor multiplicity | `F×F`, modules `F×0`, `0×F` | Total dimensions both `1`; central idempotent `(1,0)` acts with ranks `1,0` | Generic module must be fixed. |
| R28.5.9 finite stable lattices | Trivial group on `ℚ_l²` | One equivariant isomorphism class; matrices `diag(1,l^k)` carry the standard lattice to the examples | Retain theorem, add Lean headline R05. |
| R28.5.9 nonsemisimple counterexample | Unipotent group on `L_k=ℤ_l e₁+ℤ_l l^k e₂` | `(u(1)−1)L_k=l^kℤ_l e₁`; coinvariant torsion orders `l^k` | Infinitely many classes without semisimplicity. |
| R28.5.10 small-prime height values | Prime-to-l isogeny between two lattices in same equivariant class | Both degree and differential l-valuations `0`; height-quotient l-valuation `0` | Retain dependence on lattice class. |
| R28.5.11 polarized Shafarevich | `g=0`, `d=1,4` | Class counts `1,0`; unique zero-variety polarization degree `1` | Boundary consistent. |
| R28.5.12 Zarhin trick | Principal `A` | `dim(A×A∨)^4=8g`; graph kernel rank `1`; quotient degree `1`; principal degree `1` | Retain field-defined trick. |
| R28.5.12 closed-orbit adapter | Central integer `2` versus scalar `1/2` in `E=ℚ,O=ℤ` | Integral intersections `{2}`, `∅`; orbit counts `1,0` | Retain. |
| R28.5.12 closed idempotent orbit | `e_n=(1 n;0 0)` | `e_n²=e_n`, trace `1`, determinant `0`; integral conjugation gives one rank-one class | Retain closedness by equations. |
| R28.5.12 nonclosed orbit control | `nE₁₂`, `n≥1` | Square `0`; gcd of entries `n`; arbitrarily many integral conjugacy classes | Closedness essential. |
| R28.5.12 integral idempotents | `O=ℤ`, then `M₂(ℤ)` | Classes represented by `{0,1}` and ranks `{0,1,2}`; counts `2,3` | Retain. |
| R28.5.12 rational-idempotent control | `(1 1/n;0 0)` | Square equals itself; least denominator `n` invariant under integral conjugation | Integrality essential. |
| R28.5.12 / Lean direct factors | `A=E²`, `End(E)=ℤ` | Factor dimensions `0,1,2`; factors `0,E,E²`; matrix idempotent ranks `0,1,2` | Consistent with finiteness. |
| R28.5.13 / Lean unpolarized Shafarevich | `g=0`; general Zarhin dimension | Zero case count `1`; auxiliary dimension `8g`, with `A` a direct factor | Retain. |
| R28.5.14 no-point polarization | Smooth completion `y²=−(x⁶+1)` | Squarefree degree six gives genus `(6−2)/2=2`; no affine real points and leading coefficient `−1` gives no real infinity points | No-point supplier is necessary and present. |
| R28.5.14 field/base-point compatibility | Pointed elliptic curve, base point translated | Theta translates; induced homomorphism remains degree `1`; dual/polarization composition has prescribed sign `−id` | Retain. |
| R28.5.14 Torelli boundary | Anisotropic conic versus `ℙ¹` | Jacobian dimensions `0,0`, same zero Jacobian; rational-point sets empty versus nonempty | Exclude genus 0 over nonclosed fields. |
| R28.5.14 Torelli sign/uniqueness | Nonhyperelliptic `C`, `β=−id`, same base point | Triple `(id,−,0)` gives `j=j`; sign `+` would require a nonexistent hyperelliptic involution | Retain. |
| R28.5.14 changed base point | Distinct `P,P′`, same `β` | Translation `[P−P′]`; at `Q=P`, both sides equal `[P−P′]≠0` | Retain base-point independence of curve map. |
| R28.5.15 / Lean curve finiteness | Genus-two compact-type degeneration | Curve special fibre has one node; Jacobian toric rank `0` and dimension `2` | Good Jacobian reduction does not imply good curve reduction. |
| curveHasGoodReductionAt | `ℙ¹` over `ℤ₂`; nodal candidate | `dim=1`, `H¹(O)=0`; smoothness true for projective line, false at a node | Definition applies to more than genus≥2; theorem adds `g≥2`. R08. |
| R28.6.1 elliptic bridge | `[2]`, zero homomorphism | Nonzero degree `4=2²`; zero not a finite surjective map | Retain distinction. |
| ellipticRationalRepresentation | Geometric elliptic Tate module and scalar extension | Integral rank `2`; rational dimension `2`; complex conjugation determinant `−1` also in `ℚ₂` | Correct geometric carrier, not rational points. |
| R28.6.2 / Lean elliptic semisimplicity | CM curve over `ℚ(i)`, `l=5` and 3 | CM tensor algebra `ℚ₅×ℚ₅` versus unramified quadratic extension of `ℚ₃`; character dimensions `1+1` versus irreducible `2` | Semisimplicity does not require splitting over `ℚ_l`. |
| R28.6.3 / Lean integral Tate Hom | `E=E′`, multiplication `[2]` | Tensor `1⊗[2]` acts as `2I₂`; zero tensor acts as `0` | Pure-tensor condition fixes canonical map. |
| R28.6.4 / Lean rational Tate iff | `E=E′` | Nonzero identity exists; module identity is invertible with determinant `1` | Both directions consistent. |
| R28.6.4 / Lean Frobenius trace iff | `11a1`; `37a1,37b1` | 11a traces at `2,3,5,7`: `−2,−1,1,−2`; 37 pair traces `−2,0` at 2 and `−1,−1` at 7 | Direct point enumeration agrees with README. |
| R28.6.5 / Lean finite elliptic class | Identity/variable change | Identity degree `1`; identity variable change sends `W` to `W` | Canonical isomorphism relation is correctly encoded. |
| R28.6.6 cyclic Hom | `End_K(E)=ℤ`; CM over `ℚ(i)` | Degrees `n² deg f₀`; `n=0,1,2` gives `0,d,4d`; CM Hom rank `2` rather than `1` | Retain End hypothesis. |
| R28.6.7 quotient torsion image | `W=0`, `W=A[l]` | Respectively `f=[l]`, torsion image `0`; `f=id`, image all `A[l]` | Retain. |
| R28.6.7 centralizer reduction | `ε=lE₁₂` acting on `ℤ_l²` | Integral centralizer rank `2`, reduction of algebra acts trivially so mod-l centralizer dimension `4` | Separability essential. |
| R28.6.7 separable control | Diagonal algebra `ℤ_l×ℤ_l` | Centralizer diagonal rank `2`; reduced centralizer diagonal dimension `2` | Projector commutes with reduction. |
| R28.6.7 integral commutant | Full diagonal and antidiagonal matrix pieces in split CM normalizer | Two diagonal plus two off-diagonal basis elements span rank `4=M₂` | Consistent with full commutant over `ℚ`. |
| Parshin conditional application | Degree-three étale cover, delete one fibre point | Three fibre points leave two branch points; bounded genus range `2,…,b` has `b−1` terms | Conditional finite-union argument retained; no unconditional covering theorem claimed. |

## Not verifiable

- The source service found no readable legal text for SGA 7 I, Exposé IX §§7.3–7.4 (Springer/title searches), Faltings–Chai Chapter V §§4.2–4.5 (publisher/title searches), Martens pp. 107–111 (JSTOR/title search), Ogg pp. 143–148 (Cambridge/title search), or Mumford §23 (publisher/bibliographic searches). Reiner, Theorems 18.1 and 18.7, pp. 175 and 179, also remained unread after the source service’s bibliographic search timed out; Yu 4.8 was read as the explicitly cited alternative for this sample. These attempts are recorded in the requested missing-reference artifact. This review is finished, not parked for them. Their absence is not treated as evidence that their statements are false.
- Ogg's exact count of 24 curves and the complete Cremona isogeny-class counts were not independently certified from those original classification sources. The small Frobenius traces in the table were recomputed directly from the displayed Weierstrass equations: `11a1=[0,−1,1,−10,−20]`, `37a1=[0,0,1,−1,0]`, `37b1=[0,1,1,−23,−50]`.
- The legally fetched Faltings scan is OCR. Its archimedean scalar and some displayed formulas are incompletely recognized, as is the beginning of erratum part (b). Thus the numerical sign correction in the README was checked algebraically, but the precise printed scalar, integration-domain typography and every alleged typographic error there are not independently certified. In particular, OCR cannot certify whether Lemma 2(b)'s dualizing-sheaf subscript is a printed ℤ or the stack symbol, so that alleged misprint is not registered below. The erratum's corrected stationarity statement and part (a) are readable (`faltings-1984` lines 46–64); part (b)'s lattice assertion was independently tested in the table.
- The unpointed, arbitrary-field polarization assertion is verified as an exact supplier contract, not proved by Milne III 6.6/6.11 alone. Those locators start with a rational point (`milne-av` line 4281). The supplier explicitly owns descent without that point.
- Generic source theorems are not re-proved by this review. The table supplies computed positive and negative controls, with the seeded sample checked against its source text and the remaining proof routes checked against the named contracts. No claim of a machine-checked proof of any admitted headline is made.

## Source issues

- **Error** in milne-av at I Application 15.8, printed pp. 66–67: the source says an idempotent conjugacy orbit is the Grassmannian of its images; it should be the space of image-and-kernel decompositions, closed by idempotency and rank equations; affects the proof.
- **Error** in milne-av at I Proposition 15.2 and Application 15.9, printed pp. 64, 67: the source says the norm-bounded orbit finiteness includes norm zero and all relevant orbits are closed; it should not include zero-norm elements without further hypotheses: matrices diag(n,0) already give infinitely many integral congruence classes; affects a stated result.
- **Error** in faltings-1983 at §4 Satz 2, printed p. 358: the source says all heights in the divisible quotient tower equal the initial height; it should assert eventual stationarity after a sufficiently large shift; affects a stated result; corrected in print at the note added in proof, p. 366, and faltings-1984, p. 381.
- **Misprint** in faltings-1983 at §6 proof of Satz 6, printed p. 364: the source says the Raynaud reference is Theorem 4.11; it should be Theorem 4.1.1; affects nothing.

- **Misprint** in wu-heights at §2, paragraph following Definition 2.1, printed p. 3: the source says a triangle-inequality absolute value failing the ultrametric inequality is nonarchimedean; it should be archimedean; affects nothing.
- **Misprint** in wu-heights at Lemma 2.5, printed p. 4: the source says independence of coordinates; it should say independence of the number field, which is what its proof treats; affects nothing.
- **Misprint** in wu-heights at Lemma 2.5 proof, printed p. 4: the source says the first sum ranges over places of K; it should range over places of L before regrouping above places of K; affects the proof.
- **Gap** in wu-heights at Lemma 2.2 and Definition 2.7, printed pp. 3–4: the source says local logarithms sum without extension-degree factors, then takes a field-degree root of an unspecified H_K; it should specify absolute-normalized local values and separately define the relative H_K used in that root; affects a stated result.
