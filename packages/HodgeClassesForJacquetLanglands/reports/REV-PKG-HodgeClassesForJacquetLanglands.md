<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2450#issuecomment-6674429649 -->
Review (claude) of 028c72e

Verdict: needs_changes

1. **F01** (P2) gap:derham-local-system-cohomology asks for what PadicHodgeTheory §7.2 provides

   - **Location.** `README.md` lines 377–381 (the PadicHodgeTheory contract: "for a proper smooth
     variety `X` over a finite extension `K` of `ℚ_p` and a de Rham `ℚ_p`-local system `𝕃` on `X`, the
     `G_K`-representation `H^i_et(X_{K̄}, 𝕃)` is de Rham"), repeated in `design/plan.json` gap
     `derham-local-system-cohomology` (line 4035) and consumed at README lines 472, 498, 1985.
   - **Claim.** The package declares the de Rham property of étale cohomology with de Rham
     local-system coefficients as a supplier gap, saying PadicHodgeTheory has "constant coefficients
     only" (package report, gap table).
   - **Witness.** PadicHodgeTheory at its open head, §7.2 "Lisse integral coefficients and proper
     comparison" (lines 1251–1265 of `roadmaps show PadicHodgeTheory`): it defines de Rham lisse
     sheaves, and for any lisse `L` on proper smooth `X` over a complete discretely valued `k/ℚ_p`
     with perfect residue field states the `B_dR`-comparison `H^i(X_k̄, L) ⊗ B_dR ≃ H^i_dR(X, E) ⊗_k B_dR`
     for de Rham `L` with bundle `E`, Galois-equivariant and strictly filtered (Scholze, Theorem 8.4
     and 8.8). That is exactly the first clause of the gap. The other two clauses (de Rham at one
     classical point of a geometrically connected smooth `K`-variety implies de Rham; subquotients of de
     Rham representations are de Rham) I found nowhere in PadicHodgeTheory §§3.3, 7.2, 8.1 or
     PadicPeriodRings §4.2, so they stay.
   - **Repair.** In the README's PadicHodgeTheory contract and in `plan.json`'s `needs` for this slug,
     delete the first clause and keep the two remaining ones (the one-point rigidity and the
     subquotient closure), with the IP23 locator; add PadicHodgeTheory §7.2 to the supplier list of
     that contract ("§7.2 de Rham lisse sheaves and the filtered `B_dR`-comparison for proper smooth
     `X`"), and cite PadicHodgeTheory §7.2 in the `*Needs:*` lines of §0.2 (line 498) and §9.4
     (line 1985) and in the proof route of §0.2 (line 472) in place of the gap for that clause. Tested
     on the instance that refuted the gap: §0.2's third API bullet ("de Rham at the places above `ℓ`")
     then follows from §7.2 for the lisse sheaf `𝕍_ℓ` once it is known to be de Rham, which is what
     the remaining two clauses of the gap supply (de Rham at the special point, then rigidity).

2. **F02** (P3) Tau Ceti names `exteriorPower.map_top_eq_det_smul` and `exteriorPower.topEquiv` do not exist at the pin

   - **Location.** `README.md` line 49 ("The determinant action on the top exterior power is Tau Ceti's
     `exteriorPower.map_top_eq_det_smul`"), lines 184–186 (the Tau Ceti contract), 662, 677, 788,
     819–820.
   - **Claim.** Tau Ceti supplies `exteriorPower.map_top_eq_det_smul` (an endomorphism of a free
     module of rank `n` acts on `⋀ⁿ` by its determinant) and `exteriorPower.topEquiv` (a basis
     trivializes the top power).
   - **Witness.** At Tau Ceti `2fd255d9` neither name occurs anywhere under `TauCeti/`. The
     determinant statement exists as `LinearMap.map_exteriorPower_finrank_eq_det_smul`
     (`TauCeti/LinearAlgebra/ExteriorPower/Basis.lean` line 157: `map (finrank R M) f = det f • id`
     for free `M`), with the basis form `Module.Basis.map_exteriorPower_top_eq_det_smul` (line 144) and
     `Module.Basis.exteriorPower_ιMulti_eq_det_smul` (line 123). There is no `topEquiv`; the basis
     trivialization of the top power is Mathlib's `Module.Basis.topVector`
     (`Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean` line 78) with
     `exteriorPower.isUnit_apply_topVector` (line 92) and `wedgePairing_eq_apply_topVector_smul`
     (line 103). The package report's check was made at an older Tau Ceti pin (`a91d3aaf`); the pin
     moved.
   - **Repair.** Replace every `exteriorPower.map_top_eq_det_smul` by
     `LinearMap.map_exteriorPower_finrank_eq_det_smul` (file
     `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean`), and replace `exteriorPower.topEquiv` by
     Mathlib's `Module.Basis.topVector` with `exteriorPower.isUnit_apply_topVector`, moving that item
     from the Tau Ceti contract to the Mathlib contract. Checked: `#check @LinearMap.map_exteriorPower_finrank_eq_det_smul`
     and `#check @Module.Basis.topVector` elaborate at the pins; §1.1's formula
     `vol(H, d_U) = det[H(b_i, b_j)]/(σ(c)·c)` with `c = d_U(b₁ ∧ … ∧ b_n)` needs only that
     `b.topVector = ιMulti b` spans the top power and `vol b.topVector` is a unit, which these give.

3. **F03** (P3) GL2AutomorphicRepresentationsAndTransfer §R17.3.1 has no `globalJL_local`, `globalJL_central`, `globalJL_inverse`

   - **Location.** `README.md` lines 281–282 ("§R17.3.1 global Jacquet–Langlands with `globalJL_local`,
     `globalJL_central`, `globalJL_inverse`").
   - **Claim.** The supplier declares these three names.
   - **Witness.** GL2AutomorphicRepresentationsAndTransfer at its open head, §R17.3.1 (lines
     1583–1596 of `roadmaps show`): the correspondence is written `JL_D`, and its API is prose bullets
     "Local components", "Central character", "Inverse", "Twist", "Split algebra"; none of the three
     backticked names occurs anywhere in that README or its `Suggested.lean`.
   - **Repair.** Write "§R17.3.1 global Jacquet–Langlands `JL_D` with its local-components,
     central-character and inverse clauses". The statements consumed (local transfer at every place,
     equal central character, inverse on non-one-dimensional discrete series) are exactly those
     bullets, so nothing else changes.

4. **F04** (P3) SelmerIwasawaCohomology §4.9 has no `blochKatoCondition`

   - **Location.** `README.md` line 374 ("§4.9 `blochKatoCondition` with `H¹_f(K, ℚ_p) = H¹_ur(K, ℚ_p)`").
   - **Claim.** The supplier declares `blochKatoCondition`.
   - **Witness.** SelmerIwasawaCohomology at its open head, §4.9 "The Bloch–Kato local condition on
     `T` and `W`" (line 1924 of `roadmaps show`) defines `H¹_f(K,V)` in prose as the kernel of
     `H¹(K,V) → H¹(K, V ⊗ B_cris)` and names no declaration; the identity `H¹_f(F_v, ℚ_p) = H¹_ur(F_v, ℚ_p)`
     is its Checks bullet (line 1943). The name occurs nowhere in that roadmap.
   - **Repair.** Drop the backticks: "§4.9 the Bloch–Kato local condition `H¹_f`, with
     `H¹_f(K, ℚ_p) = H¹_ur(K, ℚ_p)` for the trivial representation".

5. **F05** (P3) AutomorphicLFunctionsAndLocalFactors citation names a layer, not the section

   - **Location.** `README.md` lines 264, 1383, 1482, 1737, 1879 ("AL.3, *Rankin–Selberg nonvanishing on
     the boundary*").
   - **Claim.** The nonvanishing of `L^S(s, π₁ × π₂)` on `Re(s) ≥ 1` is a target of Layer AL.3.
   - **Witness.** AutomorphicLFunctionsAndLocalFactors at its open head: Layer AL.3 is the whole
     Rankin–Selberg layer (line 1865); the statement cited is §AL.3.6.3 "Rankin–Selberg nonvanishing on
     the boundary" (line 2171), which states exactly the no-zeros claim on `Re(s) ≥ 1` with simple
     poles only at `1 + it` for `π₂ ≅ π₁^∨ ⊗ |det|^{−it}`.
   - **Repair.** Cite "§AL.3.6.3" at the five locations. The statement consumed is unchanged; in §6.1
     the pole case is excluded by `χ_v ≠ 1` at ramified places and in §8.1 by cuspidality of `Sym²σ`'s
     input.

Independent review of `packages/HodgeClassesForJacquetLanglands/README.md`, `Suggested.lean`,
`metadata.toml` and `sources.toml` against the pinned libraries (Mathlib `1b1ccf4b`, Tau Ceti
`2fd255d9`, the pins of the content checkout's `lake-manifest.json`), the roadmaps on main and the
open roadmap pull requests at their heads (index of 2026-11-06). One P2 and four P3 findings; no P1.
Every finding is a citation or gap repair; the mathematics of the package, including the three Lean
statements, survived the adversarial pass.

## Verified sound

**Principles.** No route-specific shortcut: the Hermitian exterior construction is stated for every
field `E`, ring endomorphism `σ` and sesquilinear form (Layer 1), the Schwartz forms for every even
signature (Layer 4), and the end theorems at IP23's full generality (`d < n`, even weights, any
`L = ℚ(π)`). No roadmap is re-planned: ownership of the Hermitian exterior construction, the
Kudla–Millson harmonic Schwartz forms, the Fock comparison and the IP23 theta identities was checked
by object with `roadmaps grep` ("Kudla.Millson", "Fock model", "exceptional isomorphism",
"Hermitian exterior|exterior operator", "harmonic Schwartz", "Ichino", "Matsushima", "Shimizu") over
main and all 459 open pull requests: no other roadmap builds them (OrthogonalSpinGroups excludes
Hermitian and unitary groups, Completed/OrthogonalSpinGroups lines 88–89; SpinRepresentations Layer 6
owns only `Spin₆ ≃ SL₄`, cited). No copied passages (spot-checked §§0.2, 1.1, 1.3, 5.3, 9.4 against
the source text: all paraphrase). No algorithm. Lean: single `import Mathlib`, no `set_option`, no
`lemma`, no sorried data, three `sorry`s on theorems only.

**Supplier order.** Depcheck output:

```
depcheck: 242 roadmaps, 2498 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line and the supplier tables cite only roadmaps
earlier in the merge order (positions checked: HodgeClassesForJacquetLanglands is 168; its latest
suppliers are MetaplecticAutomorphicForms 165 and EndoscopicTransferAndUnitaryTraceComparison 163)
or roadmaps on main (ComplexKahlerGeometry, ClassFieldTheory, ReductiveGroups, ReductiveGroupsPartII,
RepresentationTheory, EtaleCohomologyFoundations) or Completed (GlobalNumberFields,
OrthogonalSpinGroups, HodgeStructures). The five later roadmaps the package report names as moved
down (ModularityAndLanglandsExtensions, AutomorphicGaloisRepresentations, PadicHodgeRegulators,
HilbertModularVarietiesAndShimuraCurves, AutomorphicBundles) are cited nowhere as suppliers; the
"Downstream consumers" paragraph names two of them only as consumers.

**Declared gaps (seven).** Each has a named supplier earlier in the order, the same slug in
`plan.json` and the README, and a single-sentence `needs`:

- `compact-matsushima`: ArithmeticLocallySymmetricSpaces §ALS.5b.4 (line 4384 of `roadmaps show`)
  takes `FrankeInput(G, K, V)` as a hypothesis for every `G`; Matsushima's formula for anisotropic
  `G` appears only as a Checks bullet (lines 4446–4447). Precise, minimal.
- `vhs-hodge-decomposition`: ComplexKahlerGeometry §K6.1 (`TauCetiRoadmap/ComplexKahlerGeometry/README.md`,
  "Compact Kähler Hodge theory and analytic cycles") proves the Hodge decomposition for constant
  coefficients only; "variation" occurs in that README only as links to VariationalMethods.
  Precise, minimal.
- `quaternion-ramification-classification`: ClassFieldTheory Layer 10 (main, lines 1552–1608) has
  the Brauer sequence and `brauerSupport`, but no classification of quaternion algebras by
  ramification sets and no embedding criterion ("quaternion" occurs at lines 218, 252, 1041, 1885,
  1887, none stating them). Precise, minimal.
- `norm-subgroup-restriction`: GL2AutomorphicRepresentationsAndTransfer has no statement on the
  restriction of automorphic representations of `B^×` to `H_N^+` or `H_∞^+` ("norm subgroup",
  "H_N" absent; the nearest are §R17.3.2 and §R17.3.6). Precise, minimal.
- `quaternionic-doubling-residue`: MetaplecticAutomorphicForms §§6.4, 6.10–6.12 state the
  Siegel–Weil formula and doubling for orthogonal, symplectic, unitary and metaplectic data; §3.3c
  has only the nonarchimedean quaternionic conservation inputs. Precise, minimal.
- `quaternionic-shimizu-lift`: MetaplecticAutomorphicForms has no global lift from `B^×` to
  `GU(B₁ ⊗_E B₂)°` ("Shimizu" occurs only at §6.22 for the toric contraction; `B₁ ⊗_E B₂` only in
  the local §3.32a). Precise, minimal.
- `derham-local-system-cohomology`: not minimal, R01.

**Sources: seeded sample and flagged locators.** The manifest records one work, IP23, certified
from the publisher's open-access copy; no locator is flagged unverified. Every sampled target was
read at its locator in the cached text (page markers of the printed pages agree with the locators):

| Target | Locator | Source lines | Verdict |
| --- | --- | --- | --- |
| 0.2 | §2.2.2, pp. 16–17, (2.1) | IP23 lines 680–706 | hypotheses (`ρ` through `G/Z_s`, compact), (2.1) Hecke-equivariant, Matsushima sum over `π_f^K ≃ Π_f^K` with `m(π)`: as stated |
| 0.5 | §3.2, pp. 18–19; §12.3, p. 98 | lines 770–831, 4498–4523 | `L = ℚ(π) ⊃ ℚ(k)`, `L`-structure unique up to homothety, `V_{B,π_B}` via `Hom_{H_ℚ}` independent of `K`: as stated; p. 19 prints degree `2d`, p. 98 line 4502 uses `H^d`: the README's reading (degree `d`) is right |
| 0.6 | §3.3, p. 19; Prop. 12.3, p. 98 | lines 832–836, 4513–4523 | the sign-line decomposition is implicit in the Matsushima reduction of Prop. 12.3 and the sign vectors of (10.2)–(10.3) (lines 3093–3098); the explicit types `(k_v/2, 1−k_v/2)` are the README's own computation (verified below) |
| 1.1 | Def. 5.2, p. 28 | lines 1175–1183 | `vol(H,d) = h(v,v)` with `d(v) = 1`, in `F^×` with class the determinant: as stated; rescaling by `N(α)⁻¹` at lines 1169–1171 |
| 1.3 | §5.2, pp. 27–29 | lines 1147–1213 | `L = ψ⁻¹∘ι∘∧²φ`, conjugate-linear, the six basis images with `d(v₁₂₃₄) = −1`: as stated |
| 1.7 | Prop. 5.6, pp. 30–31, (5.10) | lines 1249–1276 | isogeny `GSU_E(V) → GU_B(Ṽ)⁰`, kernel `{±1}`, (5.10) `L∘∧²g = ν(g)²det(g)⁻¹∧²g∘L` for `g ∈ GU_E(V)`, dimension 16: as stated; the README's extension of (5.10) to all sesquilinear `H` is its own (verified below) |
| 2.3 | Prop. 5.10, (5.12), p. 32 | lines 1326–1339 | `H = GSU ∩ G(U(V₁)×U(V₂))`, isogeny onto the identity component with kernel `{±1}`, both dimensions 8: as stated |
| 2.4 | Prop. 5.11, (5.13), p. 32; §5.3.1, pp. 35–36 | lines 1341–1342, 1475–1480 | image `([b₁,b₂], det(g₁)α₁α₂)`, kernel `t ↦ (t,t⁻¹)` (line 1435): as stated |
| 3.1 | §6.1, p. 38; §6.3, pp. 42–44; §10.3, p. 66 | lines 1568–1595, 1737–1861, 2887–2896 | signatures `(4,2)/(0,6)`, `(2,2)/(0,4)`, `(2,0)/(0,2)` at lines 2888–2895: as stated |
| 3.2 | Lemma 6.1, p. 41 | lines 1706–1715 | `(t₁,t₂,ν) ↦ (N(t₁t₂), νN(t₁), νt₁t₂^ρ)` modulo centre `(z,z,z)`: as stated |
| 3.4 | Cor. 6.3, p. 45 | lines 1915–1927 | lattices and the map: as stated; the inverse formula is the README's (verified below) |
| 4.1 | §8.2, pp. 49–50, (8.1) | lines 2098–2119 | undivided pairing over `𝔖_ℓ`, contraction, `r ≥ 2`, highest weight vector `(e₁+ie₂)^ℓ`, orthogonal projection (8.1): as stated |
| 6.5 | Prop. 9.5, p. 61; §9.5.4, p. 64 | lines 2624–2647, 2770–2803 | hypotheses (`B` split at archimedean places, `U(V)` anisotropic, `π` irreducible unitary with `π_v ≃ θ(τ_v)` a.e.): as stated; the conjugation note is a source gap (below) |
| 9.4 | Remark 11.10, p. 90 | lines 4133–4148 | `H¹_g(k,ℚ_ℓ) = 0` by finiteness of the class group, local identifications for `v ∤ ℓ` and `v ∣ ℓ`: as stated |
| 10.4 | Prop. 12.3, p. 98 | lines 4509–4523 | data `(E, τ̃, φ, φ̃, η, K, K₁, K₂, v₁, v₂)`, `I_ξ` an isomorphism of `ℂ`-spaces via Matsushima and Prop. 10.1: as stated |

Also read for the headline and finding-touched targets: Theorem 1, p. 5 (lines 225–239); Theorem
3.2, p. 20 (840–856); Prop. 5.1, pp. 25–26; Lemma 5.4 and (5.6), pp. 29–30; Prop. 5.13, pp. 34–35;
Example 5.14, pp. 36–37; Lemma 6.2, p. 44; Lemma 9.2, p. 58; Prop. 10.1, pp. 70–71; Lemmas 10.7–10.8,
pp. 77–78; Prop. 11.2 and Lemma 11.3, p. 83; Prop. 11.4 and Remark 11.5, pp. 85–87; Prop. 11.6,
pp. 87–88; Cor. 11.7, Props. 11.8–11.9, p. 90; Def. 12.1 and §§12.2.1–12.2.2, pp. 94–95; Theorem
12.4, pp. 98–99. All agree with the README's statements and hypotheses.

**Library declarations opened at the pins.** Mathlib: `exteriorPower.wedge` and `wedgePairing`
(`WedgePairing.lean` lines 36–44: `wedgePairing vol hkl x y = vol (x ∧ y)` after the cast `hkl`),
`instIsPerfPairWedgePairing` (line 130, needs `Module.Finite` and `Module.Free`), `pairingDual` and
`pairingDual_ιMulti_ιMulti` (`Pairing.lean` lines 64–74: value `det (f j (v i))`), `hodgeStar`
(`HodgeStar.lean` line 48, needs a bijective bilinear form; the module docstring lists
`Δ • ⋆⋆x = (−1)^{kl} x` as a TODO, as the README says), `LinearMap.BilinForm.exteriorPower`
(`BilinForm.lean` line 34), `map_apply_ιMulti` (`Basic.lean` line 273), `MvPolynomial.funext`
(`Funext.lean` line 83), `groupCohomology.H1ofAutOnUnitsUnique` (`Hilbert90.lean`). Tau Ceti:
`TauCeti.Hodge.HodgeStructureOn` (`Geometry/Hodge/Structure.lean` line 62), `.tateTwist`
(`Tate/Twist.lean` line 63), `.internalHom` (`InternalHom/Basic.lean` line 271),
`TauCeti.QuaternionAlgebra.normMulEquiv` (`Algebra/Quaternion/SymbolEquiv.lean` line 426: `ℍ[R,a,N(z)b] ≃ₐ ℍ[R,a,b]`),
`.rescaleJEquiv` (line 226), `.tensorAlgEquivTensorMatrix` (`TensorProduct.lean` line 192: the
common-slot lemma), `TauCeti.BrauerGroup.quaternionClass_mul` (`BrauerClass.lean` line 255),
`TauCeti.symPowerRep` (`RepresentationTheory/ClassicalGroups/SymmetricPower.lean` line 57). The two
missing names are R02.

**Cross-roadmap citations resolved** (at the open heads or on main, every section present with the
content cited): ShimuraVarieties §§4.2, 4.3, 4.9, 6.7, 8.1, 8.5, 8.6, 8.7 and its six README-named
declarations (`TauCeti.Shimura.ReflexNorm`, `reciprocity_finite_action`, `ReflexNorm.map_full`,
`abelian_canonical`, `CanonicalModel.datum_map_defined_over_compositum`, `ZeroDimShimura.shimuraSet`;
§8.7 assumes `G^der` simply connected, as the README says); ShimuraData §§3.1, 3.3, 3.10
(`kostantRepresentatives`), 4.3 (`sv4_rationalHodge`); ArithmeticLocallySymmetricSpaces §§ALS.1.1,
1.2, 1.8, 3.3, 3.6, 5b.1, 5b.4 and `FrankeInput`; MotivesAndAlgebraicCycles §§2.2, 2.3, 2.6, 2.7, 7.1,
7.15 (its §7.15 defines `HT(V)` with functoriality and the non-asserted scalar-extension map, citing
IP23 §2.1 and Definition 12.1); ComplexComparisonPartII C6.3 `artinComparison`;
EtaleCohomologyFoundations §§F.2.1, F.2.2, F.3; MetaplecticAutomorphicForms §§0.15–0.17, 2.5, 3.3c,
3.7, 3.9, 3.16, 3.23–3.28, 3.32a, 3.33, 3.34, 3.35, 3.36, 3.38, 5.6, 6.4, 6.10, 6.10a, 6.11, 6.12,
6.13, 6.14, 6.15, 6.22 with all twelve backticked names (§3.35 states `θ(π)|G⁰ = A_{q₁}(k−2,0,0)`
with minimal `K`-type `(k,0,0)` and the compact lift of highest weight `(k−2,0,0)`, with the dual
labelling the README records; §3.36 states the unramified parameter the README's §6.5 quotes; §5.6
integrates the conjugate of its input, as the Conventions say); GL2AutomorphicRepresentationsAndTransfer
§§R16.1.8, R16.4.4, R16.4.5, R16.6.3, R17.3.1, R17.3.5, R17.3.7, R17.3.8, R17.4.2, R17.4.13, R17.4.16
(names: R03); AutomorphicFormsOnReductiveGroups §§2.6, 4.2, 5.1, 5.2, 5.4 (the Hermitian bidegree
formula `H^{p+R₊,p+R₋}(𝔤,𝔨;A_q(λ)⊗F) ≃ Hom_{𝔩∩𝔨}(Λ^{2p}(𝔩∩𝔭),ℂ)` at line 820), 5.7;
AutomorphicSpectralTheory §§0.25, 0.26, 4.7 (`compact_quotient_spectrum`);
AutomorphicLFunctionsAndLocalFactors §AL.3.6.3 (R05); AdelicAlgebraicGroups §3.4 (anisotropic
quotients compact, line 3406); ClassFieldTheory Layers 6–8, 10 (all five names, lines 1605–1608), 11
(`globalArtinMap`), §5.4 (`localArtinMap_quadratic_eq_nontrivial_iff_not_norm`); GlobalNumberFields
Layers 1, 2, 4, 6, 9, 10 with the five names; ReductiveGroups Layers 3, 6; ReductiveGroupsPartII
§§RG2.5.1, RG2.5.2; EndoscopicTransferAndUnitaryTraceComparison §1.8 (dual group
`ℂ^× × ∏ GL_n(ℂ)` of Shin's unitary similitude groups; the `F`-level dual `GL₄(ℂ) × ℂ^×` with its
`Gal(E/F)`-action is the one-factor case, and ReductiveGroupsPartII §RG2.5.1 is cited alongside);
RepresentationTheory/SchurWeyl §9.4 (`harmonicTensors`, Lean `SchurWeyl/Suggested.lean` line 341),
SpinRepresentations Layer 6 (`spin6_equiv_sl4`); PadicHodgeTheory §§3.3, 4.4, 8.1 (constant
coefficients; §7.2 is R01); PadicPeriodRings §1.4 (`H¹(G_K, ℂ_p)` spanned by `log χ`, line 205);
SelmerIwasawaCohomology §§2.7, 4.9 (name: R04); ArithmeticGaloisRepresentations §1.2 (`tateTwist`,
arithmetic Frobenius, `χ_ℓ` of Hodge–Tate weight `+1`: the README's conventions agree);
GeometryOfNumbersAndQuadraticArithmetic §4.3 (`polynomial_fischer_decomposition`); OrthogonalSpinGroups'
exclusion of Hermitian groups. `roadmaps resolve` reports nothing unresolved.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exactly three
warnings `declaration uses 'sorry'` (lines 70, 81, 95), no other message, exit 0, 3.9 s. A scratch
copy with `#check @IsExteriorStar`, `@existsUnique_isExteriorStar`, `@IsExteriorStar.comp_self`,
`@IsExteriorStar.map_similitude` was elaborated: every binder the README's statements need
(`Field E`, `Module E U`, `FiniteDimensional E U`, `σ`, `H`, `vol`, `hkl : 2 + 2 = finrank E U`, the
Hermitian hypothesis `hH`, the similitude hypothesis `hg`) is in each declaration's own signature;
no section variable is used; the elaborated types equal README §§1.3, 1.4, 1.7. Nothing changed.

**Padding probe.** On a scratch copy each of the three sorried theorems was tried with `simp [IsExteriorStar]`
(also `at *`), `infer_instance` and `rfl`: all six attempts fail (unsolved goals, type class instance
expected, `rfl` failed). No declaration restates a definition, mirrors a Check, computes a value or
treats a boundary case; the one `def` has a real body on Mathlib carriers. No padding.

**Headline theorems.** From the README's Summary and package report: (1) the `L`-rational Hodge
class realizing Jacquet–Langlands (Theorem 3.2(i)/12.4(i)); (2) the conditional all-`ℓ` Galois
statement (3.2(ii)/12.4(ii)); (3) the weight-two rational correspondence (Theorem 1); (4) the
exceptional isogeny and projective isomorphism (Props. 5.6–5.7); (5) simultaneous nonvanishing
(Prop. 10.1), near-equivalence rigidity (Prop. 9.5), purity (Prop. 11.6, Cor. 11.7); (6) the
restriction formulas (Props. 8.1–8.2); (7) triviality of geometric unipotent extensions (Remark
11.10); (8) the exterior operator's existence and uniqueness, square law and similitude equivariance.
(8) is stated (`existsUnique_isExteriorStar`, `comp_self`, `map_similitude`) and is the only group
statable at the pins: Tau Ceti has no Shimura variety, automorphic representation, global theta lift,
Fock model, algebraic group scheme of unitary similitudes, or de Rham condition on Galois
representations (greps for `Shimura`, `Kudla`, `IsDeRham`, `HodgeTate` under `TauCeti/` hit only
unrelated files). (1)–(7) are each named in the module docstring with the missing carrier. (4)'s
point-level content is `map_similitude`, as the docstring says.

**Adversarial table.** Values computed independently with an exact Gaussian-rational script
(scratch `py/layer1.py`) for Layer 1 and by hand elsewhere.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3 `IsExteriorStar` matches IP23's `L` | `H = diag(1,1,1,1)`, `d(e₁₂₃₄) = −1`, Mathlib's `wedgePairing vol hkl x y = vol(x∧y)` and `pairingDual (f₁∧f₂)(v₁∧v₂) = det[f_j(v_i)]` | `L(e₁₂) = −e₃₄`, `L(e₁₃) = +e₂₄`, `L(e₁₄) = −e₂₃`; signs of `e_K ∧ e_J` recomputed as `+,−,+` | equals IP23 lines 1207–1212 | none |
| 1.3 for `σ = id`, symmetric bijective `B` | Mathlib `hodgeStar`: `B₂(⋆x, y) = vol(x∧y)`; `L`: `vol(Lx∧y) = B₂(x,y)` | `B₂(⋆(Lx), y) = vol(Lx∧y) = B₂(x,y)`, so `⋆∘L = id` | `L = ⋆⁻¹` in degrees `(2,2)` as the README says | none |
| 1.3 uniqueness and existence for every `σ` | `H = 0`; `σ` any ring endomorphism | `L = 0` unique; two `σ`-semilinear solutions agree on pure wedges, which span over `E`, so agree | holds | none |
| 1.4 `comp_self` | three random non-diagonal Hermitian `4×4` over `ℚ(i)` with random `c` | `vol = 52648178395/9216, 251884457/7200, 1253287491/24832`; `L(L x) = vol·x` on `(1+2i)·e_K` for all six `K` | holds | none |
| 1.4 degenerate | `H = diag(1,−2,0,0)` | `L²(e₁₂) = 0 = vol` | holds | none |
| 1.4 `σ = id` symmetric | random `AᵀA + diag(1,2,−3,5)`, `c = 3/2` | `L² = (90778477/62208)·id = det/c²` | holds | none |
| 1.4 `σ = id` non-symmetric (negative control) | random with `h₁₂ = 7, h₂₁ = −2` | `L²(e₁₂)` has six nonzero coordinates, `vol = −1261/324` | fails, so `hH` is needed | none |
| 1.4 char 2, `σ = id`, alternating (symmetric) form on `𝔽₂⁴`, `c = 1` | hyperbolic `H` | `L(e₁₂) = e₃₄`, `L(e₃₄) = e₁₂`, `L(e₁₃) = e₁₃`; `det H = 1`; `L² = id` | holds; the identity is polynomial in the entries, so char 2 is covered | none |
| 1.4 `σ² ≠ id` | nonzero Hermitian `H` | `H x (λy) = λ H x y` and `H x y = σ²(H x y)` force `σ² = id` on `E` | only `H = 0` is Hermitian; statement vacuous there, not false | none |
| 1.1 basis independence of `det[H(b_i,b_j)]/(σ(c)c)` | `b′ = bP` | numerator `×σ(det P)det P`, `c′ = det P·c` | ratio unchanged for every `σ` | none |
| 1.1 Checks | `diag(1,1,1,1)`, `c = −1`; `diag(1,2,1,−5)`, `c = −1` then `c = −2` | `1`; `−10`; `−10/4 = −5/2` | holds | none |
| 1.7 `map_similitude` | three random similitudes `t·A⁻¹UA` of `AᴴA` over `ℚ(i)` (`U` a Cayley unitary) | `ν = 89/16, 17/4, 1/16`; `N(det g) = ν⁴` exact; identity exact with `ν²/det g`; fails with `σ(ν²/det g)` | holds | none |
| 1.7 scalar `g = t = 2+i` | `ν = N(t) = 5`, `det = t⁴` | `ν²/det g = −7/25 − 24i/25 = σ(t)²/t²`; `L(t²x) = σ(t)²Lx` | holds | none |
| 1.7 derivation for every sesquilinear `H` | `H(gu, w) = ν H(u, g⁻¹w)` | `RHS = ν² vol(L(u₁∧u₂) ∧ ∧²g⁻¹y) = (ν²/det g) vol(∧²g L(u₁∧u₂) ∧ y)` | no Hermitian hypothesis needed, as stated | none |
| 1.8 `β` choice | `g ↦ gα` | `ν²/det g ↦ (σ(α)/α)²·(ν²/det g)`; `βα⁻²` restores the class | holds | none |
| 2.1 explicit plane | `β = (1+2i)+j·i`, `α = 2−i`, `J = −3` | `Nrd β = 5 + 3 = 8`, `N(α) = 5`, multiplier `8/5`, `det = 8/(3−4i) = 24/25 + 32i/25` | holds | none |
| 2.3 dimensions | — | `5+5−1−1 = 8`; `7+2−1 = 8`; IP23 line 1336–1338 `2²+2² = 8`, `2·3+1+1 = 8` | holds | none |
| 2.4 image | `g = ([b₁,α₁],[b₂,α₂])` | `det(g₁)α₁α₂ = Nrd(b₁)α₁⁻²α₁α₂ = Nrd(b₁)α₁⁻¹α₂` | holds | none |
| 2.6 tensor model | `J₁ = −2`, `J₂ = 5`, `H = diag(1,2,1,−5)`, `c = −1` | `L: e₁₃ ↦ e₂₄, e₂₃ ↦ −2e₁₄, e₁₄ ↦ 5e₂₃, e₂₄ ↦ −10e₁₃`; `L(e₁₂) = −2e₃₄ = J₁e₃₄`, `L(e₃₄) = 5e₁₂ = J₂e₁₂` | equals IP23 lines 1533–1536 and the README's Layer 1 Example | none |
| 3.1 signatures | split and compact real places | Hermitian `diag(1,−J₁)⊗diag(1,−J₂)` has signs `(+,−,−,+)` for `J_i > 0` and Morita swaps `(p,q)` (IP23 lines 1853–1860): `(2,2)`; `W₀`: `(2,0)`; sum `(4,2)`; compact: `(0,4)+(0,2) = (0,6)` | holds, equals IP23 lines 2888–2895 | none |
| 3.2 torus map | `(z,z,N(z))`; `t₁ = t₂ = 1` | `(N(z)², N(z)², N(z)²)`; `(1, ν, ν)` | holds | none |
| 3.3 real torus | `y = (1,1,1,−1)`; `y = (1,1,i,i)` | `(−1,−1,−1)`; `(1,1,−1)` | holds | none |
| 3.4 weight map | `(2,0,0)`, `(0,0,2)`, `(1,0,0)`, inverse | `(1,−1,1,−1)`, `(1,1,−1,−1)`, half-integers excluded; `k₁+k₃ = l₁`, `k₁+k₄ = l₂`, `k₁+k₂ = l₃`; back: `(3k₁+k₂+k₃+k₄)/2 = k₁` using `Σk = 0`; parity `Σl = 2k₁` | mutually inverse | none |
| 3.4 Borel reordering | `l = (k−2,0,0)` | `((k−2)/2, −(k−2)/2, (k−2)/2, −(k−2)/2)`; reordered `(1,3,2,4)`: `((k−2)/2,(k−2)/2,−(k−2)/2,−(k−2)/2) = Λ` of IP23 line 4036 | holds | none |
| 4.1 harmonics | `⟨v²,w²⟩`; `V = ℝ²` definite | `2⟨v,w⟩²`; contraction kills `e₁e₂`, sends `e₁², e₂²` to `1`: `ℋ² = ⟨e₁²−e₂², e₁e₂⟩ ∋ (e₁+ie₂)²`, `e₁² ∉` | holds | none |
| 0.5 degree and rank | `d = 0, 1, 2` | degree `d` (p. 98 line 4502: `H^{2d}(X₁×X₂)_{π₁⊠π₂} = H^d ⊗ H^d`); rank `2^d = 1, 2, 4` | holds; p. 19's `2d` is a misprint | none |
| 0.6 sign lines | `k = (2,2)`; `k = (2,4)`; `d = 1` | `(1,0)+(1,0), (1,0)+(0,1), (0,1)+(1,0), (0,1)+(0,1)`; `(1,0)+(2,−1) = (3,−1)`, `(1,0)+(−1,2) = (0,2)`, `(0,1)+(2,−1) = (2,0)`, `(−1,3)`; classical `(k−1,0)` twisted by `(2−k)/2` gives `(k/2, 1−k/2)` of weight 1 | holds | none |
| 0.7 weights | `V₁ ≃ V₁^∨(−d)` | `Hom(V₁,V₂) = V₁^∨⊗V₂ = V₁(d)⊗V₂`; weight `d+d−2d = 0` | holds | none |
| 6.3 doubling point | `s = 3/2` | `b/a = ζ(4)ζ(6)ζ(8)/(ζ(3)ζ(1)ζ(−1))`, finite at nonarchimedean `v`; global `ζ^S(s−1/2) = ζ^S(1)` gives the pole (IP23 line 2760) | holds | none |
| 6.5 near equivalence | `τ′ := θ(Π̄′)` vs its conjugate | IP23 line 2646 gives `θ(π̄_v) ≃ τ̄_v` a.e.; `τ̄_v ≃ τ_v^∨ ≃ τ_v` at almost all `v` since `ξ_E∘Nrd = 1` on `H_N^+` | both candidates nearly equivalent to `τ`; README's conjugated candidate is correct | none (source gap recorded) |
| 7.9 types | `Σ`: `k_v + 1`; outside: `−k_v + (−1)` | `k_v+1`; `−(k_v+1)`; IP23 (10.13) lines 3447–3453 | holds | none |
| 7.10 hypotheses | Prop. 10.1 (i)–(iii) | `E_{v₀}/F_{v₀}` ramified, `B_{i,v₀}` split, `K_{v₀}` hyperspecial; "for all `ε`", `2^n` signs | as stated | none |
| 8.2 dimensions | `q₀, q₁, q₂` | `(4,0)`; `(1,1),(2,2)×2,(3,3)`; `(0,4)` (IP23 lines 3741–3755); total `4 = 1+2+1` | holds | none |
| 8.6/8.7 Hodge types | `(1,1)`, `w⁻¹ = (23)`; `(0,4)`, `w = 1`; `k = 4` | `τ_Z = α⁻²` so `k′ = k−1`, type `(1,1)+(k−2, k−2) = (k−1,k−1)`; `τ_Z = α^{2k−4}` so `k′ = 0`, `(0,4)+(0,2k−4) = (0,2k)`; at `k = 4`: `(3,3) ↦ (1,1)`, `(0,8) ↦ (−2,6)`, `(8,0) ↦ (6,−2)` after `(−2,−2)` | holds (IP23 lines 4061–4076) | none |
| 9.2 lowest line | `W_{−1} = ρ_E⊗|·|^{1/2}` | `⋀²W_{−1}⊗|·|^{−2} = det ρ_E ⊗ |·|^{−1}`, `det ρ_E = ξ_E∘N = 1`; `d` factors: `ℚ_ℓ(−d)`; `(d)`-twist trivial; weights `2,4,6` ↔ `(−1),(−2),(−3)` | holds | none |
| 9.3 de Rham characters | `log χ`; `Frob ↦ 1` | Hodge–Tate ⇔ `ℂ_ℓ`-admissible ⇔ inertia acts through a finite quotient (Sen) ⇔ `c|_I = 0` (torsion-free target) | iff holds; `H¹_g = H¹_f` for `ℚ_p(0)` by BK Ex. 3.9 | none |
| 9.4 lattice counterexample | `𝔽_ℓ`, class number divisible by `ℓ` | `Hom(Cl, 𝔽_ℓ) ≠ 0` | the ℚ_ℓ hypothesis is needed | none |
| 10.6 descent | `(i)` over `ℚ(i)/ℚ` | average `(i + (−i))/2 = 0`: averaging fails, the determinant argument does not | holds | none |
| 5.2 / 5.3 | kernel of `Z → T`; `j(s)` | `([t,1],α) ↦ ([t²,1],α)` trivial iff `t² = 1, α = 1`: `([−1,1],1)`; `η((s·s)⁻¹s) = η(s⁻¹) = 1` | holds | none |
| 7.2 central character | `m = 3` | `ξ_E³ = ξ_E` cancels `ξ_E` | holds | none |
| Conventions: Tate twist | `tateTwist` in Tau Ceti | `F` shifted by `m`, weight by `−2m`, so `ℚ(1)` has type `(−1,−1)` | agrees with the README | none |

**README shape.** Summary; Scope and ownership; Conventions; Exact supplier contracts (per
supplier); How to read the build; eleven layers (`## Layer 0`–`## Layer 10`) each with `### Examples`
and `### Dependencies` (11 of each); Downstream consumers; Worked examples; Notes on the source;
References. All 75 subsections have at least three Checks (minimum counted: 3). Every target carries
a locator and a `*Needs:*` line. No LaTeX delimiters, no process words, no pull-request numbers, no
dates, no machine paths (grep for `$`, `\(`, "optional", "deferred", "TODO", "checkpoint",
"handoff", "pull request", "PR #", "round", "so far", "current", "removed": no hit). Mathematics in
Unicode with ASCII in code spans. `metadata.toml` has `topic = "math.NT"`. The seven gap slugs of the
README equal those of `plan.json`.

**Ownership against open pull requests** was checked with `roadmaps grep` over all 459 open roadmap
pull requests at their heads and over main; the three packages under review on the board
(AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated.

## Not verifiable

- None. The only cited work is IP23, read in full at every locator above from the certified
  publisher copy.

## Source issues

- **Misprint** in IP23 at §3.2, printed page 19: the source says the `π_B`-isotypic component of the
  cohomology of the quaternionic Shimura variety is concentrated in degree `2d`; it should be degree
  `d`, the dimension of the variety, as the source itself uses on page 98 (`H^d(X₁)_{π₁} ⊗ H^d(X₂)_{π₂}`);
  affects nothing.
- **Misprint** in IP23 at the proof of Proposition 11.6, printed page 88: the displayed Hodge type of
  the `(1,1)` row is written with an unclosed parenthesis; it should read the pair `(k_v − 1, k_v − 1)`;
  affects nothing.
- **Misprint** in IP23 at the group diagram of §4.1, printed page 22: the rank-one quaternionic block
  is labelled as an `E`-unitary group; it should be the `B`-unitary group `U_B(V♯₀)`, as in §5.3.1
  (page 34); affects nothing.
- **Gap** in IP23 at the proof of Proposition 9.5, printed page 61: the source takes `τ′ = θ(π̄)`,
  whose local components are the conjugates `τ̄_v` at almost all places, while the statement needs
  `τ′_v ≃ τ_v`; it should add that `τ̄_v ≃ τ_v` at almost all `v` (the contragredient of a
  representation of the norm subgroup with central character `ξ_E`) or take the conjugate; affects
  the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "028c72e64ab668e8a384f02a2b9c5aea9b34d15b", "job": "REV-PKG-HodgeClassesForJacquetLanglands", "model": "fable", "worker": "chris-x17"} -->
