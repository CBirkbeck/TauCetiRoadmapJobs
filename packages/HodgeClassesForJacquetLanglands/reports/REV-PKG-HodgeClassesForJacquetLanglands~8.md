<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6902176643 -->
Review (claude) of 4798c86

Verdict: needs_changes

1. **F01** (P3) §4.3 names Funke–Millson without a locator or a reference entry

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:1549` (§4.3): "The first formula
   carries the factor `2^{−q/2}` relative to Funke–Millson." The References (lines 2790–2803) list
   IP23, Mil17 and Wal85 only.

   **Claim.** The Schwartz form of §4.3 is `2^{−q/2}` times the form of a work the README does not
   identify.

   **Witness.** FM06 line 1118 (§6.2, p. 25 of arXiv:math/0408050v1): the constant there is
   `2^{q/2}(−i/4π)^{q+ℓ}`, with values in the tensor algebra. IP23 line 2187 (§8.4, p. 51) records the
   rescaling and the projection `V^{⊗ℓ} → S^ℓV`, and takes invariance and closedness from the same work
   (IP23 lines 2191–2194).

   The statement is correct; the citation is incomplete. The work was not in `sources.toml`; reading
   it for this review added the entry `FM06` there (arXiv version 1, certified).

   **Exact repair.**

   1. §4.3, replace the sentence at line 1549 by: "The first formula is `2^{−q/2}` times the form of
      Funke and Millson, whose constant is `2^{q/2}(−i/4π)^{q+ℓ}`, composed with the projection
      `V^{⊗ℓ} → S^ℓV` (FM06, §6.2, p. 25; IP23, §8.4, p. 51); the invariance with its `K′`-character and
      the closedness are FM06, Theorems 5.6 and 5.7, p. 20."
   2. References, add: "[FM06] Jens Funke and John Millson, *Cycles with local coefficients for
      orthogonal groups and vector-valued Siegel modular forms*, American Journal of Mathematics 128
      (2006), 899–948, arXiv:math/0408050. Section and theorem numbers are those of the published
      version as IP23 cites it; page numbers are those of arXiv version 1."
   3. `sources.toml`, entry `FM06`: add `venue = "American Journal of Mathematics 128 (2006), 899–948"`
      and a `version_note` saying that the text read is arXiv version 1, whose §6.2 and Theorems
      5.6–5.7 are the items IP23 cites under those numbers from the published version.

   **Repair test.** `(1/(4πi))^{q+ℓ} = (−i/4π)^{q+ℓ}`, so the ratio of the two constants is `2^{−q/2}`;
   for `(p, q) = (4, 2)` it is `1/2`. FM06 line 886 (Theorem 5.6, p. 20) puts `φ_{q,ℓ}` in the
   invariants of `ℂ(χ_{−ℓ−m/2}) ⊗ S(V) ⊗ ⋀^q𝔭^* ⊗ T^ℓ(V)`, that is `K′`-weight `ℓ + m/2`, the value of
   §4.3; line 900 (Theorem 5.7, p. 20) is the closedness.

One finding, P3. The four findings of round 7 are repaired, the repaired passages survive the
adversarial pass, `Suggested.lean` elaborates with `sorry` as the only warning and none of its
theorems is padding. The finding is a named source in §4.3 that has no locator and no entry under
References.

## Verified sound

### Round 7 findings, checked first

| Round 7 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2): §1.8 of EndoscopicTransferAndUnitaryTraceComparison cited for the dual group | §9.1, lines 2334–2349: "Prove that the dual group of the unitary similitude group `G = GU_E(V)` of §8, a group over `F` with `F`-valued multiplier, is `Ĝ = GL₄(ℂ) × ℂ^×`"; *Needs:* (line 2376) and Dependencies (line 2478) no longer cite §1.8; Scope lines 104–108 say how §1.8 differs | **Repaired.** §1.8 at its open head (line 412) is the group over `ℚ` with `ℚ`-valued multiplier, dual `ℂ^× × ∏_σ GL`. ReductiveGroupsPartII *dual-based-root-datum* (main, line 6737) and *dual-of-weil-restriction* (line 7088) exist. |
| F02 (P3): §1.4 negative control false for alternating forms | Lines 1060–1068: "Some symmetry of `H` is needed: … Gram matrix `1 + E₁₂` …" and "Symmetry up to sign suffices for the identity itself" | **Repaired**; all values recomputed (table). |
| F03 (P3): §10.1 locator | Line 2495: "(IP23, §12.2.4, pp. 96–97; §10.4, p. 68)"; §7.1, line 1905: "§§10.1–10.4, pp. 65–68" | **Repaired.** IP23 line 2989: §10.4 begins on p. 68. |
| F04 (P3): Tau Ceti's conjugate Hodge star not cited | Scope lines 48–54, `From Mathlib` lines 196–198, `From Tau Ceti` lines 234–240, §1.3 Check lines 1038–1042 | **Repaired.** `Orientation.barHodgeStar` and `barHodgeStar_barHodgeStar` are at `TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean:126` and `:144`; `complexWedgePairing_barHodgeStar` (line 161) has the slot order `h(β, α)` the README states. |

The repaired patterns were searched in the rest of the package: no other supplier is cited for a
group it does not treat; no other necessity claim is made without an instance; the two remaining
citations of IP23 §10.2, p. 66 (§7.4 and the Notes) are about splittings and are right. One further
instance of an incomplete citation was found: R01.

### Computed adversarial table

Exact arithmetic over `ℚ(i)`. Basis of `⋀²`: `e₁₂, e₁₃, e₁₄, e₂₃, e₂₄, e₃₄`; `c = d_U(e₁₂₃₄)`;
`A = [H(e_i, e_j)]`.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.3 basis list | `diag(2,3,5,7)`, `c = −1` | images `−6e₃₄, 10e₂₄, −14e₂₃, −15e₁₄, 21e₁₃, −35e₁₂` | list correct |
| §1.3 existence and uniqueness (Lean) | any `σ`, `H = 0`; perfect wedge pairing | the functional `y ↦ det[H(u_i, y_j)]` is `σ`-semilinear alternating in `u`, so one `L`; `H = 0` gives `L = 0` | true for every ring endomorphism |
| §1.3 against Mathlib's star | `σ = id`, bijective `B` | `B₂(⋆(Lu), y) = vol(Lu ∧ y) = B₂(u, y)`, so `⋆∘L = id` | `L = ⋆⁻¹` in degree `(2,2)` |
| §1.3 new Check (Tau Ceti star) | unit form on `ℂ⁴`, `c = 1` and `c = −1` | `L(e₁₂) = e₃₄` and `−e₃₄`; `L(i e₁₂) = ∓i e₃₄`; `L∘L = 1` | `L = ±barHodgeStar` |
| §1.4 headline `comp_self` | 3 random Hermitian `A`, `c ∈ ℚ(i)`; `diag(1,1,0,0)`, `c = 2`; `H = 0` | `L∘L = det A/N(c)`: `580`, `3341/25`, `−25`; `0`; `0 = 0/N(c)` | true, degenerate included |
| §1.4 new Check 3 | `1 + E₁₂`, `σ = id`, `c = −1` | `det = 1`; `L(L e₁₂) = e₁₂`, `L(L e₁₃) = e₂₃`, `L(L e₂₃) = −e₁₃ + e₂₃` | as stated |
| §1.4 new Check 4 | 3 random integer `A` with rational `c`; standard symplectic; rows `(0,1,2,3),…` | `L∘L = (det A/c²)⋀²(A⁻¹Aᵀ)` on all (the factor `⋀²(A⁻ᵀA)` fails on `1 + E₁₂`); `1 = det`; `64 = det` | as stated |
| §1.5 negative control | `diag(i,1,1,1)`, `c = −1` | `L e₁₂ = −i e₃₄`, `L e₃₄ = −e₁₂` | as stated |
| §1.7 headline `map_similitude` | 2 random similitudes (Cayley transform times a scalar) of random Hermitian forms; scalar `1 + 2i` on a non-Hermitian form, `c = 3`; `H = 0` | holds with `ν²/det g`, fails with its conjugate; `N(det g) = ν⁴`, `det g ≠ ν²`; holds; `0 = 0` | true; §1.2 consistent |
| §1.7 Checks | `g = t ∈ F^×`; `g = −1` | `ν = t²`, `det = t⁴`, `⋀²t = t²`; `ν = 1 = det`, `⋀²g = 1` | correct |
| §0.5 | `Q₈`; `χ₃∘det` | `(2 + 2 + 6·(−2))/8 = −1`; `χ₃(t²) = 1`, `diag(−1,1) ∈ K₁(3^r)` acts by `−1` | Checks correct |
| §0.5 rank and weight | `d = 0, 1, 2` | one line of degree 1 with two-dimensional cohomology per split place: `1, 2, 4`; weight `d + 0` | `2^d`, degree `d` |
| §0.7 | weights | `d + d − 2d = 0`; `V₁(d) ≃ V₁^∨` from `V₁ ≃ V₁^∨(−d)` | consistent |
| §2.3 | dimensions | `5 + 5 − 1 − 1 = 8 = 7 + 2 − 1` | correct |
| §2.4 image formula | `g = ([b₁, α₁], [b₂, α₂])` | `det(g₁)α₁α₂ = Nrd(b₁)α₁⁻¹α₂`; its norm is `Nrd(b₁)²N(α₂)/N(α₁) = Nrd(b₁)Nrd(b₂)`, the multiplier of `[b₁, b₂]`; `(t₁b₁, t₁α₁)` changes both entries by the central `t₁` | well defined, in the fibre product |
| §3.5 | dualization against the supplier | supplier (maximal `π`-isotypic): `θ(π) = A_{q₁}`; here `θ(π^∨) = A_{q₁}`; compact dual of `SO(2,2)`: `(1 + t²)²` | labels are IP23's; `1, 2, 1` |
| §4.3 | normalisation against FM06 | `2^{q/2}(−i/4π)^{q+ℓ}` there, `(4πi)^{−(q+ℓ)}` here | factor right; citation: **R01** |
| §4.6 | `ℓ = 1` | `ι⁻¹(z_μ) = −4πi·x_μφ₀`; pairing `−1`, `−εi`; product `(x₁ + εi x₂)φ₀` | no sign `(−1)^ℓ` |
| §5.2 | `T` | `[t₁, t₂] ↦ t₁t₂` identifies `T` with `{(u, α) : u = N(α)}`; `Z → T` is `(t, α) ↦ (t², α)`, kernel `(±1, 1)` | consistent |
| §5.3 | `j(s) = ([s, s], s)` | `η(s⁻²·s) = η(s⁻¹) = 1` | correct |
| §§7.8–7.9 | weights | `k_v + 1` at `Σ`; `−k_v − 1` elsewhere; Gaussian of signature `(2,0)`: `+1`, of `(0,2)`: `−1` | consistent with §§4.3, 7.1 |
| §8.3 | `δ` exchanging blocks | `ᵗδ̄ I₂,₂ δ = −I₂,₂`; `δ² = 1` | multiplier `−1` |
| §§8.6–8.7 | `(p,q) = (1,1), (0,4), (3,3)` | `(k−1, k−1)`, `(0, 2k)`, `(k+1, k+1)`; weights `2k−2`, `2k`, `2k+2`; after shift `(1,1)`, `(2−k, k+2)`, `(3,3)` | table correct |
| §9.1 `θ̂` on the torus | antidiagonal form | characters `e_i ↦ e₀ − e_{5−i}`; dual torus `(s; ν̂) ↦ (s₄⁻¹, …, s₁⁻¹; ν̂∏s_i)`; simple roots to simple roots | equals `(θ₄(g), ν det g)` |
| §9.1 `θ₄` | `J₄` | `J₄² = −1`; `θ₄(1 + tE₁₂) = 1 + tE₃₄`, `θ₄(1 + tE₂₃) = 1 + tE₂₃` | fixes the pinning |
| §9.1 sign of `det` | `r∘θ̂` against `r` | `r(g, ν) ≅ ν⁻¹det g⁻¹⋀²g`; with `ν det g`: unchanged; with `ν det g⁻¹`: `ν⁻¹det g·⋀²g` | only the stated sign admits `A` |
| §9.1 Check | `F = ℚ(√2)` | `2·17 = 34`; `1 + 2·16 = 33` | correct |
| §9.2 | lowest line | `⋀²(ρ_E|·|^{1/2})|·|^{−2} = |·|^{−1}`; `(|·|^{−1})^{⊗d}|·|^d = 1` | `ℚ_ℓ(−d)` |
| §9.3 | `c` unramified; `c = log χ` | crystalline; nonzero in `H¹(G_K, ℂ_ℓ)`; a continuous map `𝒪_v^× → ℚ_ℓ` is zero for `v ∤ ℓ` | iff holds |
| §§10.7–10.8 | `d = 0` | rank one, type `(0,0)`, trivial reciprocity for the trivial cocharacter | immediate, as stated |

The rows of rounds 6 and 7 that carry computed values are relied on for §§0.2–0.3, 0.6, 1.1–1.2,
1.8, 2.1, 2.5–2.7, 3.2–3.4, 4.2, 4.5, 7.4, 8.1, 9.4, 10.1–10.2 and 10.6, which no repair touched.

### Seeded source sample

No locator in the manifest is flagged unverified. All 15 targets were read against the text.

| Target | Evidence read | Result |
| --- | --- | --- |
| 0.5 | IP23 lines 770–831 (§3.2, pp. 18–19); 4508–4530 (§12.3, p. 98); Wal85 lines 93–164 (Lemmas I.1, I.2.1, I.2.2, pp. 123–124), 826–843 (§II.1, pp. 147–148) | Agrees; the printed degree `2d` (line 822) is noted in the README. |
| 0.7 | IP23 lines 206–239 (§1.1, p. 5), 840–856 (Theorem 3.2, p. 20), 4526–4537 (Theorem 12.4) | Agrees. |
| 1.4 | IP23 lines 1175–1213 (Definition 5.2, Proposition 5.3, pp. 28–29) | Agrees; the README proves more (no nondegeneracy). |
| 1.7 | IP23 lines 1249–1276 (Proposition 5.6, (5.7)–(5.10), pp. 30–31) | Agrees. |
| 2.2 | IP23 lines 1314–1339 ((5.11), Proposition 5.10, p. 32) | Agrees. |
| 2.4 | IP23 lines 1341–1349, 1437–1480 (Proposition 5.11, (5.13), pp. 32–36) | Agrees, formula included. |
| 3.5 | IP23 lines 1994–2035 (§§7.2, 7.2.1, 7.2.2, pp. 47–48) | Agrees; convention as in the Conventions. |
| 5.2 | IP23 lines 1000–1033 (§4.3, pp. 23–24) | Agrees; the bijection of components the source asserts is not taken over. |
| 7.6 | IP23 lines 3361–3380 (Lemma 10.4, p. 75) | Agrees. |
| 7.10 | IP23 lines 3065–3128 (§10.5, Proposition 10.1, pp. 70–71), 3467–3509 (Lemma 10.8, pp. 77–78) | Agrees. |
| 8.2 | IP23 lines 3722–3757 (§11.2, Proposition 11.2, pp. 82–83) | Agrees. |
| 8.3 | IP23 lines 3836–3846 (Lemma 11.3, p. 83) | Agrees. |
| 9.2 | IP23 lines 4243–4286 (§11.5, pp. 92–93), 4129–4132 (Proposition 11.9) | Agrees. |
| 9.3 | IP23 lines 4133–4148 (Remark 11.10, p. 90) | Agrees. |
| 10.8 | IP23 lines 4293–4301 (Definition 12.1, p. 94), 4533–4564 (Theorem 12.4(ii), p. 99) | Agrees. |

### Lean acceptance test

- `lake env lean` on `packages/HodgeClassesForJacquetLanglands/Suggested.lean`, from the content
  checkout: exit 0; three `declaration uses 'sorry'` warnings (lines 70, 81, 95) and nothing else.
  One import, `Mathlib`; no `set_option`, no `lemma`, no sorry'd data.
- `#check @name` for the four declarations in a scratch copy: the types are those of
  `scratch/signatures.md`; every theorem keeps `[FiniteDimensional E U]`, `σ`, `vol`, `hkl`;
  `comp_self` keeps `hH` and `b`; `map_similitude` keeps `g`, `ν`, `hg`. They agree with §§1.3, 1.4
  and 1.7. Nothing changed.
- One-tactic probe on all three theorems
  (`first | simp [IsExteriorStar] | rfl | infer_instance | aesop | simp_all [IsExteriorStar]`): none
  closes. No padding.
- Headlines of the Summary: §10.7, §10.8, §10.9 and the exceptional isomorphism as algebraic groups
  are named in the module docstring with the missing carriers, as are §§6.5, 7.10, 8.8, 4.5–4.6 and
  9.4. The statable ones (§§1.3, 1.4, 1.7) are stated. No statable headline is absent.
- The four backticked names of the roadmap's own in the README are the four declarations.

### Library declarations opened at the pins

| Declaration | File and line |
| --- | --- |
| `exteriorPower.wedgePairing`, `Module.Basis.topVector`, `isUnit_apply_topVector`, `instIsPerfPairWedgePairing` | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean:42`, 78, 92, 130 |
| `exteriorPower.pairingDual`, `pairingDual_ιMulti_ιMulti` | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64`, 71 |
| `exteriorPower.hodgeStar` (and its documented identities); `LinearMap.BilinForm.exteriorPower` | `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean:48` (22–27); `BilinForm.lean:34` |
| `MvPolynomial.funext`; `groupCohomology.H1ofAutOnUnitsUnique` | `Mathlib/Algebra/MvPolynomial/Funext.lean:83`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107` |
| `LinearMap.map_exteriorPower_finrank_eq_det_smul`, `Module.Basis.exteriorPowerTopEquiv` | `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean:157`, 175 |
| `QuaternionAlgebra.rescaleJEquiv`, `normMulEquiv` | `TauCeti/Algebra/Quaternion/SymbolEquiv.lean:226`, 426 |
| `tensorAlgEquivTensorMatrix`; `BrauerGroup.quaternionClass_mul` | `TauCeti/Algebra/Quaternion/TensorProduct.lean:192`; `BrauerClass.lean:255` |
| `symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57` |
| `HodgeStructureOn`, `tateTwist`, `internalHom` | `TauCeti/Geometry/Hodge/Structure.lean:62`; `Tate/Twist.lean:63`; `InternalHom/Basic.lean:50` (module index) |
| `IsCoveringMap.singularTransfer` | `TauCeti/AlgebraicTopology/Singular/Transfer/Basic.lean:42` (module index) |
| `Orientation.barHodgeStar`, `barHodgeStar_barHodgeStar`, `complexWedgePairing_barHodgeStar` | `TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean:126`, 144, 161 |

### Supplier citations resolved

Every cited section was looked up this round, at the supplier's open head or on main.

- Open heads: MotivesAndAlgebraicCycles §§2.2, 2.3, 2.6, 2.7, 7.1, 7.15;
  ArithmeticLocallySymmetricSpaces §§ALS.0.4, 0.6, 3.6, 5b.1, 5b.4; ShimuraVarieties §§1.3, 1.6, 4.2,
  4.3, 4.9, 6.7, 8.1, 8.3, 8.5, 8.6, 8.7 with the six cited names; ShimuraData §§3.1, 3.3, 3.6, 3.10,
  4.3, 4.9 (`kostantRepresentatives`, `sv4_rationalHodge`); AutomorphicBundles §§0.1, 0.2, 3.4, 3.5,
  3.7, 3.8 with the seven names; AutomorphicFormsOnReductiveGroups §§2.6, 4.2, 5.1, 5.2, 5.4, 5.7
  (§5.4, line 809, states the bidegree formula as cited); AutomorphicSpectralTheory §§0.25, 0.26, 4.7
  (`compact_quotient_spectrum`); AutomorphicLFunctionsAndLocalFactors §AL.3.6.3;
  ArithmeticGaloisRepresentations §1.2; GL2AutomorphicRepresentationsAndTransfer §§R16.1.8,
  R16.4.4, R16.4.5, R16.6.3, R17.3.1, R17.3.5–R17.3.8, R17.4.2, R17.4.13, R17.4.16;
  MetaplecticAutomorphicForms, all 33 cited sections and 14 names (§§3.4, 3.24, 3.32a, 3.35, 3.36
  and 5.6 read in full: they say what the README transcribes, §3.35 with the dualization remark);
  GeometryOfNumbersAndQuadraticArithmetic §4.3 (`polynomial_fischer_decomposition`, line 1548);
  ComplexComparisonPartII C6 (`artinComparison`); PadicHodgeTheory §§3.3, 4.4, 7.2, 8.1;
  PadicPeriodRings §1.4; SelmerIwasawaCohomology §§2.7, 4.9;
  EndoscopicTransferAndUnitaryTraceComparison §1.8 (named in Scope only, as a different group).
- On main: AdelicAlgebraicGroups §§3.4, 4.3; ComplexKahlerGeometry K6.0, K6.1 (labels, lines 2425,
  2478); ClassFieldTheory Layers 6–8, 10, 11 with the six names, and §5.4, which its table maps to
  W.4 (line 276; heading at line 2293); GlobalNumberFields with the five names; ReductiveGroups
  Layers 3, 6; ReductiveGroupsPartII §§RG2.5.1, RG2.5.2; AlgebraicTopology §§2.6, 5.3;
  EtaleCohomologyFoundations §§0.8, F.2.1, F.2.2, F.3; RepresentationTheory/SchurWeyl Layer 9
  (`harmonicTensors`, line 1308) and SpinRepresentations; `Completed/HodgeStructures`;
  OrthogonalSpinGroups.
- `scratch/citations.md`: no cross-roadmap citation is unresolved; its eight unresolved Lean names
  are the seven planned ShimuraVarieties names, each found in that roadmap at its head, and this
  roadmap's own `map_similitude`.

No forbidden roadmap is cited.

### Declared gaps

The eight slugs agree between the README and `design/plan.json`, each under a heading
`What <Supplier> must provide (gap:<slug>)` with a named earlier supplier. None asks for what a
supplier has: the nearest existing statement, the one-split-place comparison of
HilbertModularVarietiesAndShimuraCurves §§R18.4.24b–R18.4.25a, is the quaternionic curve only.
Acceptance would be conditional on all eight; it is withheld for R01.

### Dependency check

    depcheck: 240 roadmaps, 2275 edges, 0 problem(s)

No `UPWARD`, `CYCLE` or `moved:` line.

### Duplication and overlap

- `IsExteriorStar`, `PGU_E`/`PGU_B` and an exceptional isogeny for `GSU` occur in no roadmap, on main
  or at an open head. No roadmap states `H¹_g(K, ℚ_ℓ)` or the unramifiedness of de Rham additive
  characters. The dual group of `GU_E(V)` over `F` has no other owner.
- Four open roadmaps cite the same article (AutomorphicFormsOnReductiveGroups,
  MetaplecticAutomorphicForms, ModularityAndLanglandsExtensions, MotivesAndAlgebraicCycles) for
  inputs this roadmap imports; ModularityAndLanglandsExtensions §3.21 is the general Adams–Johnson
  comparison, not the cohomology computation of §8.2.
- HilbertModularVarietiesAndShimuraCurves §R18.4.25 and AutomorphicGaloisRepresentations §3.1 treat
  the multiplicity space of `H¹` of a quaternionic curve (one split real place, any central
  character, over a splitting field, with integral lattices). §0.5 is the statement for every `d`,
  over `ℚ(π)` itself and as an object of `M^L` with its Hodge structure; no roadmap states that, so
  this roadmap owns it. The two carriers differ and neither is cited for the other's.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped,
  none is defined only by a revision, and there is no second copy on main. The two other packages on
  the board are on other subjects.

Overlap check: read MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, ShimuraData, EndoscopicTransferAndUnitaryTraceComparison (open), AdelicAlgebraicGroups, SpinGeometry (main), the third list being empty, and also AutomorphicBundles, HilbertModularVarietiesAndShimuraCurves and AutomorphicGaloisRepresentations; the coefficient local systems are AutomorphicBundles' and are cited; the oscillator, splittings and theta lifts are MetaplecticAutomorphicForms' and are cited; nothing else is shared.

### Shape, policy and copyright

- 75 numbered targets, each with a Checks block of at least three bullets, a *Needs:* line and a
  locator; 11 layers, each with Examples and Dependencies (counted mechanically).
- No pull-request number, date, round label, machine path, HTML anchor, LaTeX delimiter, `T017`
  block, "optional" or "deferred" in the README or the Lean file.
- Wording: the 15 sampled passages and 7 further ones were put beside the sources (§0.5 against
  IP23 lines 820–831; the hypotheses of §7.10 against lines 3092–3099; the definition of `r` and `A`
  in §9.1 against lines 4197–4215; the proof route of §9.3–9.4 against lines 4133–4148; the docstring
  of `IsExteriorStar` against lines 1147–1168; the rational Hecke algebra of the Conventions against
  Wal85 lines 142–153; §4.3 against FM06 lines 1112–1125). Nothing beyond formulas, standard names
  and forced lists of hypotheses is shared.
- Arrangement: IP23 has 103 of the 115 comma-form source locators (Mil17 7, Wal85 5). Its sections
  map to the layers as `§§2–3, 4.1 → 0`, `§5 → 1–2`, `§§6, 7.2 → 3`, `§8 → 4`,
  `§§4.2–4.3, 12.2 → 5`, `§9 → 6`, `§10 → 7`, `§§11.1–11.3 → 8`, `§§11.4–11.5 → 9`, `§12 → 10`: §§5
  and 11 are split, §§6–7 merged, §4 moved after §8, the appendix left to a supplier. The order of
  Layers 3–10 is forced by the *Needs:* lines (§4.4 needs §3.1; §5.4 needs §§3.4, 4.1; §7.4 needs
  §6.2; §8.1 needs §§6.5, 7.10; §9.2 needs §8.1; §10.6 needs §§8.8, 10.4).
- Reuse: the table under Worked examples is the roadmap's own form. No public formalisation with
  these Lean names was found.

Source independence: 22 passages compared with 4 sources (IP23, Wal85, Mil17 as read in round 7, FM06), none shared; largest share IP23, 103 of 115 locators; contents compared with IP23: independent.

## Not verifiable

- The supplier contracts and gaps were checked for existence, statement and ownership, not as
  proofs: none of the cited open roadmaps is formalised.
- The three Lean theorems have `sorry` bodies; they were checked by exact computation on the
  instances of the table and by the argument recorded there, not by a Lean proof.
- Mil17 was not reopened this round: no passage citing it changed since round 7 read it.
- IP23 Proposition A.14 (p. 113) was read only through MetaplecticAutomorphicForms §3.32a, which
  restates its hypotheses.
- The published version of FM06 was not read; the arXiv version carries the numbers IP23 cites.

## Source issues

- **Misprint** in IP23 at §3.2, printed page 19: the source says the isotypic component is concentrated in degree `2d`; it should be degree `d`, the dimension of the quaternionic variety, as §12.2.10 uses; affects nothing.
- **Misprint** in IP23 at Proposition 8.2, printed page 55: the source says the compact contraction carries a factor `(−1)^ℓ`; it should have none, the Fock sign and the negative definite pairing cancelling; affects nothing.
- **Gap** in IP23 at Remark 2.2, printed page 17: the source says any Haar measures on the finite adelic groups make the pushforward independent of the levels; it should use rational volumes modulo the closure of the central rational points; affects a stated result.
- **Gap** in IP23 at §2.2.2, printed page 16: the source says a representation trivial on the real-split, rationally anisotropic central torus gives a local system; it should also require central units of small levels to act trivially; affects nothing.
- **Gap** in IP23 at §4.3, printed page 24: the source says the components are in bijection with the torus Shimura variety; it should claim only the map to it, the derived group not being simply connected; affects nothing.
- **Gap** in IP23 at §12.2.4, printed page 97: the source says the auxiliary representation is a summand of the restriction to elements of positive norm at infinity; it should restrict further to the norm-image subgroup of §10.4; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4798c86eb7a91127b493a79725ded2bd9657470d", "job": "REV-PKG-HodgeClassesForJacquetLanglands~8", "model": "fable", "worker": "chris-x30"} -->
