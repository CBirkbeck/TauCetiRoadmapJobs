<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13144#issuecomment-6849094587 -->
Red team round 2 pass a (claude) of 00fae12

Verdict: needs_changes

1. **F01** (P3) the pinned declaration cited for "finite separable" does not state finiteness

   **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:195-197`: "`Algebra.FormallyEtale.iff_exists_algEquiv_prod`: an étale algebra essentially of finite type over a field is a finite product of finite separable field extensions"; used at `:422-424`, `:431-432` (§2.1), `:575-576`, `:583` (§2.4 step 3), `:634`.

   **Claim.** That declaration gives a finite product of *finite* separable field extensions.

   **Witness.** `Mathlib/RingTheory/Etale/Field.lean:194-198`: under `[EssFiniteType K A]`, `FormallyEtale K A ↔ ∃ … , ∀ i, Algebra.IsSeparable K (Ai i)`; no `Module.Finite`. Finiteness is `Algebra.Etale.iff_exists_algEquiv_prod` (`:271-275`: `Module.Finite K (Ai i) ∧ Algebra.IsSeparable K (Ai i)`), which takes `Etale K A` and no `EssFiniteType`.

   **Repair.** Replace the name by `Algebra.Etale.iff_exists_algEquiv_prod` at all six places, and:

   - `:195-197` → "`Algebra.Etale.iff_exists_algEquiv_prod`: an étale algebra over a field is a finite product of finite separable field extensions (`Mathlib/RingTheory/Etale/Field.lean`)."
   - `:421-424` → "the base change `k(X) ⊗_{k[X]} A` is étale over the field `k(X)` (`Algebra.Etale.baseChange`), so it is a finite product of finite separable extensions (`Algebra.Etale.iff_exists_algEquiv_prod`); as `A` is a torsion-free `k[X]`-module it embeds in the base change, so every element of `A` is algebraic over `k[X]`."
   - Drop `Algebra.EssFiniteType.of_finiteType` from `:169-170`, `:431` and `Mathlib/RingTheory/EssentialFiniteness.lean` from `:698`: the étale form needs no essential finiteness.

   Tested on the refuting instance: for `A = k(X) ⊗ A₀` the instance `Algebra.Etale.baseChange` (`Mathlib/RingTheory/Etale/Basic.lean:241`) gives `Etale k(X) A`, which is the hypothesis of the `Etale` form, and its conclusion contains `Module.Finite`, as the README sentence says. For `m = 0`, `V₀ = Spec L` with `L/k` finite separable, as §2.4 step 3 says. The mathematics of §2.1 and §2.4 is unaffected (separable already implies algebraic; step 3 needs only a field).

2. **F02** (P3) the Summary compares Frobenius of one sheaf at points of two schemes

   **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:10-12`: "Over `k = 𝔽_q` both marked residue fields are `𝔽_q`, so a lisse sheaf on `Y` has the same Frobenius at `c` and at `y`, with no passage to a power of Frobenius."

   **Claim.** A lisse sheaf on `Y` has a Frobenius at `c`.

   **Witness.** `c` is a point of `C`, not of `Y` (identity chart of `𝔸²`, `g(T) = (T, T³)`: `c = 0 ∈ 𝔸¹`). §2.4 (`:591-592`) states the correct form: the geometric Frobenius at `c` maps to that at `y`.

   **Repair.** "…so the pullback along `g` of a lisse sheaf on `Y` has at `c` the Frobenius the sheaf has at `y`, with no passage to a power of Frobenius." Tested on the same instance: `g^*F` at `c = 0` has stalk `F` at `g(0) = y` with the `𝔽_q`-Frobenius of both residue fields.

Two P3 findings (S01, S02). No P1 or P2. Both round-1 findings are repaired and the repairs
introduced no error.

## Round 1 findings at this head

| Earlier finding | Status | Witness at `00fae12` |
|---|---|---|
| r1a: no numbered finding (source issues only) | nothing to repair | Scope ("Not in this roadmap") and "Downstream consumers" describe Poonen's Theorem 3.3 and Corollary 3.4 with their hypotheses and assert neither beyond the source (`Poonen2004` lines 514–517, 536–539). |
| r1b F01 (P2): étale coordinates imported from SchemeAndStackFoundations although pinned Tau Ceti proves them | repaired | `README.md:77-79` "*Étale coordinates at a smooth point*: Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace` …"; `:213-220` contract; `:564` "By Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace`"; `:582`; `:637-638`; diagram `:31` keeps only `rational_point_component`. Pin: `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:98` (affine open `V ∋ x`, `∃ n`, étale `g` to `𝔸(ULift.{u} (Fin n); S)` over `S`), as the contract says. No occurrence of `etale_coordinates` is left in the README or the Lean file. |
| r1b F02 (P3): ill-typed `AffineSpace (Fin m) (Spec k)`; `smoothOfRelativeDimension` on the wrong carrier | repaired | `README.md:126-131` uses `𝔸(ULift.{u} (Fin m); Spec k)`, `AffineSpace.SpecIso`, `MvPolynomial.renameEquiv` along `Equiv.ulift`, `MvPolynomial.uniqueAlgEquiv`, `SpecIso_inv_over`; `:486-490` and `:584-585` cite `AffineSpace.smoothOfRelativeDimension_fin` with the transport. Pins: `Mathlib/AlgebraicGeometry/AffineSpace.lean:43, 223, 248, 395`; `Mathlib/Algebra/MvPolynomial/Equiv.lean:63`; `Mathlib/Algebra/MvPolynomial/Rename.lean:213`. |

New error from the repairs: none found. Recomputed on the repaired text: `n = 1` gives relative
dimension `1` for `𝔸(ULift (Fin 1); Spec k) → Spec k`, isomorphisms have relative dimension `0`,
so `s_C` has `0 + (0 + 1) = 1`; `n = 0` gives `Spec k[∅] ≅ Spec k`, consistent with §2.4 step 3.

## Verified sound

Counts: 5 Lean declarations read (whole file, 116 lines); 9 README targets read (whole README, 703
lines); 12 source locators verified; 38 Checks and 3 worked examples recomputed; 3 sibling
citations checked; 44 pinned declarations opened at the pins.

### Declaration table (context and values)

The file has no `variable` or `include` line; every binder is in the declaration's own signature.
The five elaborated types in the job's signature listing were compared with the README clause by
clause; none lost a binder. No Lean was run in this pass and no file of the package was changed.

| Declaration | Context | Instances tried | Values computed | Result |
|---|---|---|---|---|
| `polynomialGraph` (def, real body) | `(k : Type*) [CommRing k] (m B : ℕ)` | `m = 1`; `m = 0`; `m = 2, B = 0`; `m = 2, B = 2`; zero ring | `X_0 ↦ T^(B^0) = T` for all `B`; map is `Polynomial.C`; `X_1 ↦ T^0 = 1`; `X_1 ↦ T²`, `X_0² ↦ T²`; unique map of singletons | as README §1.1 |
| `polynomialGraph_coeff` | `{k} [CommRing k] {m B}`, `hh` (support bound), `he` (query bound) | `h = X_0²X_1 − X_0X_1²`, `B = 3`, `e = (2,1), (1,2), (0,2)`; `h = X_1 − X_0²`, `B = 2`, `e = (0,1)` (no `hh`); `h = X_1`, `B = 2`, `e = (2,0)` (no `he`); `B = 0, m = 0`; `B = 0, m ≥ 1`; `B = 1` | weights `5, 7, 6`, both sides `1, −1, 0`; LHS `0` vs RHS `1`; LHS `1` vs RHS `0`; `coeff (C a) 0 = a`; no `e` satisfies `he`; `h` constant, `e = 0`, weight `0` | true as typed; both bounds needed |
| `exists_avoiding_graph` | `{k} [CommRing k] {m}`, `0 < m`, `h ≠ 0` | zero ring; `ℤ/4`, `m = 1`, `h = 2`; `𝔽_q`, `h = X_0^q − X_0`; `m = 0` over a field; `h = X_1 − X_0²` over `𝔽_2` | no `h ≠ 0` exists; `φ(h) = 2 ≠ 0` and `D(2) = ∅`; `B ≥ q + 1`, `D(T^q − T)(𝔽_q) = ∅`; `k → k[T]` not onto; `B = 2` excluded (`φ(h) = 0`), `B = 3` gives `T³ − T² = T²(T − 1)` | true as typed; geometric clause only over a field, as the README says |
| `exists_marked_etale_curve` | `{k : Type u} [Field k] {m}`, `[IsIntegral V] [IsAffine V] [Etale π]`, `hy`, `hU` | `m = 0`; identity chart `𝔸²`, `U = D(X_0)`, `B = 2`; `𝔽_3` chart `(x, z² − 1 − 2x)` on `Spec k[x, z, z⁻¹]`; wrong model `C = W` there | `V ≅ Spec k`, `C = 𝔸¹`, both sides of `g ≫ π = q ≫ Spec φ` are `Spec` of `C a ↦ C a`; `g⁻¹(U) = D(T) ∌ 0`; Jacobian `2z` unit, `π(0,1) = (1−1−0) = 0`, `z² = (T+1)²`, factors differ by the unit `2(T+1)`, mark on `z = T+1`; `W` satisfies every clause but `GeometricallyIntegral` | true; `y ∉ U` allowed; the integrality clause excludes the wrong model |
| `exists_same_field_curve` | `{k : Type u} [Field k]`, `hy`, `hyV`, `[Smooth (V.ι ≫ f)]`, `hU` | `Y = Spec k`; `Y = 𝔸¹ ⊔ 𝔸¹`; `k[x,w]/(xw)` at `(1,0)`, `V = D(x)`; `Spec 𝔽_{q²}`; cone `x² = a w²`, `q` odd; `U = D(T^q − T)` | constant map from `𝔸¹`, `g⁻¹(U) = C`; hypothesis holds on `V`; `V ≅ 𝔾_m` smooth; no section, hypothesis empty; no smooth `V ∋ 0`, and Frobenius-stable irreducible image is `{0}`, `g⁻¹(U) = ∅`; `g⁻¹(U)` has no `𝔽_q`-point | true; smoothness at `y` and rationality needed; no rational point of the good open claimed |

### README target table

| Target | Instances | Values | Result |
|---|---|---|---|
| §1.1 kernel element `X_1 − X_0^B` | `B = 0`; `B = 2` | `1 − 1 = 0`; `T² − T² = 0`; coefficient at `X_1` is `1` | nonzero kernel element for `m ≥ 2`, `k ≠ 0` |
| §1.1 origin preservation | `B = 0, m = 2` over `ℤ`; `B = 0, m = 1` | value `1 ≠ 0`; `X_0 ↦ T`, preserved | `B ≥ 1` needed only for `m ≥ 2` |
| §1.3 surjectivity | `m = 1, B = 0`; `m = 0` | `Σ a_j X_0^j ↦ Σ a_j T^j`; image is `k` | `m > 0` needed |
| §1.3 "no single graph" | `m = 2`; `m = 1` | image `V(X_1 − X_0^B)` proper; graph is the identity | as stated |
| §2.1 boundary polynomial | identity chart, `Z = V(X_0X_1)`; `m = 0`; `𝔾_m ⊆ 𝔸¹`, `Z = {1}`; projection `𝔸² → 𝔸¹`, `Z = V(x_1)` | `h = X_0X_1`; `h = 1`; `h = X_0 − 1`; `π(Z) = 𝔸¹`, no `h` | holds; étaleness needed |
| §2.1 route | `π^*` injective (open image in irreducible target); étale ring map; base change to `k(X)`; algebraicity; `Ideal.under_ne_bot_of_algebraic_mem` (`[IsDomain S]`, `IsAlgebraic R x`) | each step matched to a pinned declaration; the product-of-fields step is S01 | sound |
| §2.2 marked component and 9 API bullets | `𝔽_3` example; identity chart; `m = 0`; base change to `𝔽_9` | two components, each `≅ D(T+1)`; `W = C = 𝔸¹`; `W = C = 𝔸¹`, `g` constant; branch `z = T + 1` stays connected, `W_K` has two components | as stated |
| §2.3 good open | `q⁻¹(D(φh)) ⊆ g⁻¹(U)` on `U = D(X_0)`, `h = X_0`, `B = 2` | `D(T) ⊆ D(T)` | holds |
| §2.4 steps 1–3 | `D(x) ⊆ Spec k[x,w]/(xw)`, `y = (1,0)`; `m = 0` | chart `x`, translated to `x − 1`, value `0` at `y`; `L → k` forces `L = k`, `y ∈ U` | holds |
| §2.4 residue fields | sections `c`, `y` | residue degree `1` at both by `residueDegree_eq_one_of_section` (`TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:97`) | holds |
| Worked example 1 | `T⁵ + T⁷ = T⁵(1 + T)²` over `𝔽_2` | zeros `{0, 1}`; `𝔽_4`-points of the open: `2` | as stated |
| Worked example 3 | `𝔽_3`, `a = 2` | `x² − 2w² = x² + w²`, lines `x = ±i w` over `𝔽_9` | as stated |

All 38 Checks were recomputed (§1.1: 6, §1.2: 5, §1.3: 7, §2.1: 4, §2.2: 5, §2.3: 3, §2.4: 8); none
is false, vacuous or a restatement, and every defined object (`polynomialGraph`, the étale chart
with its boundary polynomial, the marked component) has at least three.

### Pins, siblings, ownership

- Pinned declarations opened and matched to the README's description: Mathlib `eval₂Hom_C`,
  `eval₂Hom_X'`, `comp_eval₂Hom`, `eval₂Hom_monomial`, `MvPolynomial.aeval_def`,
  `MvPolynomial.constantCoeff`, `Polynomial.constantCoeff`, `Nat.ofDigits_inj_of_len_eq`,
  `Nat.ofDigits_eq_sum_mapIdx`, `Nat.injOn_ofDigits` (both need `1 < b`; §1.2 treats `B ≤ 1`
  separately), `IsClosedImmersion.spec_of_surjective`, `Etale.etale_isStableUnderBaseChange`,
  `Etale.iff_smoothOfRelativeDimension_zero`, the `HasRingHomProperty @Etale RingHom.Etale`
  instance, `Algebra.Etale.baseChange`, `smoothOfRelativeDimension_comp` (`n + m` for `f ≫ g`),
  `AffineSpace.SpecIso`, `SpecIso_inv_over`, `smoothOfRelativeDimension_fin`,
  `MvPolynomial.uniqueAlgEquiv`, `MvPolynomial.renameEquiv`, `Flat.generalizingMap`,
  `isOpenMap_of_generalizingMap`, `Scheme.Hom.isOpenMap`, `GeometricallyIntegral`
  (`geometrically IsIntegral`; `IsIntegral.nonempty` at `Mathlib/AlgebraicGeometry/Properties.lean:240`),
  `Ideal.under_ne_bot_of_algebraic_mem`, `IsOpenMap.denseRange_of_isPreirreducibleSpace`,
  `NoetherianSpace.finite_irreducibleComponents`, `isClosed_connectedComponent`; Tau Ceti
  `MvPolynomial.coeff_aeval_X_pow_weight`, `MvPolynomial.injOn_aeval_X_pow`,
  `Finsupp.exists_injOn_weight`, `Smooth.exists_etale_affineSpace`,
  `SmoothOfRelativeDimension.exists_etale_affineSpace`,
  `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral`, `residueDegree_eq_one_of_section`,
  `residueFieldMap_bijective_of_section`.
- Duplication by object: the pinned Tau Ceti Kronecker module has no statement for the weights
  `B^i` or for the box of exponents `< B` (whole file read); the digit argument in
  `Mathlib/RingTheory/NoetherNormalization.lean` is in `private` lemmas (`:72`, `:93`), as the
  README says. Stacks 04KV is at neither pin (searched every `GeometricallyConnected` declaration
  of both libraries), so `rational_point_component` remains a roadmap dependency.
- Sibling citations: SchemeAndStackFoundations §0.8 `rational_point_component` on main
  (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:1233`, same hypotheses: connected, smooth
  over a field, rational point) and at the head of its open revision under the same name and
  section. ArithmeticInterpolationDeterminants §0.3 `powerSubstitution` on main
  (`Suggested.lean:49`: `aeval` of `0 ↦ X`, else `X^B`), equal to `polynomialGraph k 2 B` as a ring
  map (`X^(B^0) = X`, `X^(B^1) = X^B`); its injectivity bounds only `degreeOf 0`. The base roadmap
  (open) states descent to some `𝔽_{q^r}` with eigenvalues `α ↦ α^r`, as "Where the base roadmap
  stops" says; it is not cited as a supplier.
- Ownership against open work: searched main and the open heads by object (Kronecker
  substitution, curve through a rational point, Poonen's Corollary 3.4, the Kisin–Zhou paper, the
  five Lean names). No second owner; the roadmaps that cite Kisin–Zhou §5.3 use it for Chebotarev
  and recognition statements, not for the curve step. This roadmap is the owner of the
  specialised substitution, the boundary polynomial, the marked component and both curve theorems.
- Headlines: `exists_marked_etale_curve`, `exists_same_field_curve` (end theorems),
  `polynomialGraph_coeff`, `exists_avoiding_graph` (milestones); all four are stated, with one
  real-bodied definition. One-tactic probe by reading: `polynomialGraph_coeff` needs injectivity
  of the base-`B` weight on the box on top of the Tau Ceti theorem; `exists_avoiding_graph` needs
  the choice of `B`, that theorem and surjectivity. No padding found.
- Policy: the pull request changes only the package folder; no pull-request number or process
  narrative in the README or docstrings; `theorem` only; single `import Mathlib`; no `set_option`,
  no sorry'd data, no algorithm.
- Note (not a finding): `[IsIntegral V]` in `exists_marked_etale_curve` could be dropped (an affine
  scheme étale over `𝔸^m_k` is a finite disjoint union of integral opens), but the route of §2.1
  uses it and §2.4 supplies it.

### Sources

`KisinZhou2024` lines 2345–2347 (proof of Corollary 5.2.7, p. 53) and 2413–2416 (proof of
Proposition 5.3.5, p. 54), page markers at lines 2146, 2278, 2337, 2383; `Poonen2004` lines 514–517
(Theorem 3.3, p. 10), 519–521 (connectedness remark, projective and `m ≥ 2` only), 536–539
(Corollary 3.4, p. 10); `Stacks-Varieties` line 528 (7.14, 04KV); `Stacks-Properties` line 433
(7.7, 033N); 054L, 056T and 0CDW as recorded by the round-1 passes and unchanged. Each supports
the claim made of it.

### Dependency check

```text
depcheck: 206 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README: no Lean name found nowhere.

## Not verifiable

- The published (Annals 2025) numbering of Kisin–Zhou: only arXiv v2 was read, and the README
  says its locators refer to v2.
- Elaboration: no Lean was run (read-only pass); the comparison used the job's elaborated
  signatures, and the padding probe was done by reading.
- Ownership against open pull requests outside the indexed heads was not checked.

## Source issues

- **Gap** in KisinZhou2024 at proof of Corollary 5.2.7, p. 53 (reused in the proof of Proposition 5.3.5, p. 54): the source says a curve through the rational point of a smooth scheme, meeting a dense open, exists by Poonen's Corollary 3.4; it should be obtained otherwise, since that corollary assumes a smooth projective geometrically integral variety of dimension at least one; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "00fae125c64f3f3ec998a9f0558378a7c97cd8f9", "job": "RT-LefschetzPencilsAndVanishingCyclesPartII~2a", "model": "fable", "worker": "chris-x16"} -->
