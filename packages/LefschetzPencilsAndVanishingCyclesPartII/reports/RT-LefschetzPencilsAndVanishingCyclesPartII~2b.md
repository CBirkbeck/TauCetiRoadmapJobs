<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13144#issuecomment-6793040127 -->
Red team round 2 pass b (claude) of 00fae12

Verdict: needs_changes

1. **F01** (P3) the cited library lemma gives separable factors, not finite separable ones

   **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:195-197`:
   "`Algebra.FormallyEtale.iff_exists_algEquiv_prod`: an étale algebra essentially of finite type over
   a field is a finite product of finite separable field extensions". The same lemma is cited for
   "finite separable" at `:422-424` (§2.1) and `:575-576` (§2.4 step 3).

   **Claim.** The named declaration yields finite separable field factors.

   **Witness.** Pinned `Mathlib/RingTheory/Etale/Field.lean:194-198`: the conclusion is
   `∀ i, Algebra.IsSeparable K (Ai i)` only, with no `Module.Finite`. Finiteness is in the next
   declaration, `Algebra.Etale.iff_exists_algEquiv_prod` (same file, line 270):
   `∀ i, Module.Finite K (Ai i) ∧ Algebra.IsSeparable K (Ai i)`, for `Etale K A`, with no
   `EssFiniteType` instance argument.

   **Repair.** Replace the contract bullet at `:195-197` by: "`Algebra.Etale.iff_exists_algEquiv_prod`:
   an étale algebra over a field is a finite product of finite separable field extensions
   (`Mathlib/RingTheory/Etale/Field.lean`)." Replace `Algebra.FormallyEtale.iff_exists_algEquiv_prod`
   by `Algebra.Etale.iff_exists_algEquiv_prod` at `:424`, `:432`, `:576`, `:583` and `:634`. In §2.1
   (`:421-424`) the clause "in particular of finite presentation, hence essentially of finite type,"
   and the citations of `Algebra.EssFiniteType.of_finiteType` (`:169-170`, `:431`) are then not needed
   and may be dropped. Tested on the instances that use it: §2.1, `k(X) ⊗_{k[X]} A` is
   `Algebra.Etale` over `k(X)` by `Algebra.Etale.baseChange`, so the lemma applies directly and each
   factor is finite separable, hence algebraic; `m = 0`, `A` étale over `k` and a domain, so one
   factor `L`, finite separable, and the rational point gives `L = k`. No statement of the roadmap
   changes: §2.1 uses only algebraicity, which separability already gives.

One P3 finding (S01). No P1 or P2 finding in this round. Both round-1 findings are repaired and the
repairs introduced no error.

## Round-1 findings at this head

| Earlier finding | State | Witness at `00fae12` |
|---|---|---|
| `~1a` (no numbered finding; two source issues) | nothing to repair | The README asserts neither as its own claim: `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:110-114` and `:647-653` only say what Poonen's Theorem 3.3 and Corollary 3.4 do and do not assert. Both source issues are carried into `## Source issues` below. |
| `~1b/F01` (P2) étale coordinates imported from a roadmap although proved at the pin | repaired | `README.md:77-79`: "*Étale coordinates at a smooth point*: Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace` and `AlgebraicGeometry.SmoothOfRelativeDimension.exists_etale_affineSpace`"; contract at `:213-220`; §2.4 step 1 at `:564-567`; *Needs* at `:582`; diagram `:31` now names only `rational_point_component`. No occurrence of `etale_coordinates` remains in the README or in `Suggested.lean`. The pinned declaration is at `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean` (public theorem after the private helpers at lines 50 and 69), valued in `𝔸(ULift.{u} (Fin n); S)` as the contract says. |
| `~1b/F02` (P3) ill-typed `AffineSpace (Fin m) (Spec k)`; instance used with no bridge | repaired | `README.md:126-131`: "`Fin m` enters lifted: `AffineSpace.SpecIso`, followed by the isomorphism induced by `MvPolynomial.renameEquiv` along `Equiv.ulift`, identifies `𝔸(ULift.{u} (Fin m); Spec k)` with `Spec k[X_0, …, X_{m-1}]`"; §2.2 at `:486-490` cites `AffineSpace.smoothOfRelativeDimension_fin` "transported along `AffineSpace.SpecIso` and `MvPolynomial.uniqueAlgEquiv`". Pins: `Mathlib/AlgebraicGeometry/AffineSpace.lean:223` (`SpecIso`), `:248` (`SpecIso_inv_over`), `:395` (`smoothOfRelativeDimension_fin`); `Mathlib/Algebra/MvPolynomial/Equiv.lean:63` (`uniqueAlgEquiv`). |

New errors from the repairs: none. Recomputed on the changed text: relative dimension of
`s_C = (Spec k[T] → Spec k) ∘ q` is `0 + 1 = 1` (identity chart, the `𝔽_3` branch `D(T+1)`, `m = 0`);
`Nat.card (ULift (Fin m)) = m` for `m = 0, 1, 2`; the §2.4 chart for `Y = Spec k` has `n = 0` and
is an isomorphism, matching step 3.

## Declarations and targets (running table)

`Suggested.lean` has no `variable` line; every binder is in the declaration's own signature. The
elaborated types in the job's signature listing were compared clause by clause with the README;
this pass ran no Lean.

| Declaration | Context (as elaborated) | README target | Agreement |
|---|---|---|---|
| `polynomialGraph` (def, real body) | `(k : Type*) [CommRing k] (m B : ℕ)` | §1.1 | same carrier `MvPolynomial (Fin m) k →+* Polynomial k`, `X_i ↦ T^(B^i)` |
| `polynomialGraph_coeff` | `[CommRing k] {m B}`, `hh` support bound, `he` query bound | §1.2 | same; no hypothesis on `B` on either side |
| `exists_avoiding_graph` | `[CommRing k]`, `0 < m`, `h ≠ 0` | §1.3 | same four conjuncts (`2 ≤ B`, bound, `φ(h) ≠ 0`, closed immersion) |
| `exists_marked_etale_curve` | `{k : Type u} [Field k]`, `[IsIntegral V] [IsAffine V] [Etale π]`, `hy`, `hU` | §2.3 | same ten clauses |
| `exists_same_field_curve` | `{k : Type u} [Field k]`, `hy`, `hyV`, `[Smooth (V.ι ≫ f)]`, `hU` | §2.4 | same eight clauses |

README targets without a Lean declaration (by design): surjectivity (§1.3, inside
`exists_avoiding_graph`), boundary polynomial (§2.1), marked component and its nine API bullets
(§2.2, heavy data), marked residue fields (§2.4, two pinned Tau Ceti theorems).

## Adversarial pass (values computed)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `polynomialGraph`, normalisation | `m = 1`, any `B` incl. `0`; `m = 2`, `B = 0`; `m = 0`; zero ring | `X_0 ↦ T^(B^0) = T` (`0^0 = 1`); `X_1 ↦ T^0 = 1`, value at `T = 0` is `1 ≠ 0`; map is `Polynomial.C`; both rings singletons | as README §1.1 | none |
| agreement with `powerSubstitution` (ArithmeticInterpolationDeterminants §0.3, on main) | `m = 2` | theirs `0 ↦ X`, `1 ↦ X^B`; ours `0 ↦ T^(B^0) = T`, `1 ↦ T^B` | equal | none |
| kernel element §1.1 | `X_1 − X_0^B`, `B = 0, 2` | `1 − 1 = 0`; `T² − T² = 0` | in kernel | none |
| `polynomialGraph_coeff` | `h = X_0²X_1 − X_0X_1²`, `B = 3`, `e = (2,1), (1,2), (0,2)` | weights `5, 7, 6`; coefficients `1, −1, 0` on both sides | holds | none |
| same, support bound dropped | `h = X_1 − X_0²`, `B = 2`, `e = (0,1)` | left: coefficient of `T²` in `T² − T²` is `0`; right `1` | hypothesis needed | none |
| same, query bound dropped | `h = X_1`, `B = 2`, `e = (2,0)` | weight `2`; left `1`, right `0` | hypothesis needed | none |
| same, junk values | `B = 0, m ≥ 1`; `B = 0, m = 0`; `B = 1` | no `e` with `e_i < 0`; `coeff (C a) 0 = a`; box `{0}`, weight `0` | true as typed | none |
| injectivity of `w_B` on the box | `B = 2`, `m = 2`: `(0,0),(1,0),(0,1),(1,1)` | weights `0, 1, 2, 3` | injective; `Nat.injOn_ofDigits` needs `1 < b`, which the `B ≥ 2` branch has | none |
| `exists_avoiding_graph` | zero ring; `ℤ/4`, `m = 1`, `h = 2`; `𝔽_q`, `h = X_0^q − X_0`; `m = 0` | no `h ≠ 0`; `φ(h) = 2 ≠ 0` and `D(2) = ∅`; `B ≥ q + 1`, `D(T^q − T)` has no `𝔽_q`-point; `k → k[T]` not onto | Lean true over rings; geometric clause restricted to fields in README | none |
| "no graph for all hypersurfaces" | `m = 2`; `m = 1` | image `V(X_1 − X_0^B)`, proper closed; identity of `𝔸¹` | as README | none |
| boundary polynomial §2.1 | identity chart, `Z = V(X_0X_1)`; `m = 0`; open immersion `𝔾_m → 𝔸¹`, `Z = {1}`; projection `𝔸² → 𝔸¹`, `Z = V(x_1)` | `h = X_0X_1`; `h = 1`; `h = X_0 − 1`; `π(Z) = 𝔸¹`, no `h` | holds; étale needed | none |
| §2.1 route | injectivity of `π^*`; algebraicity; `Ideal.under_ne_bot_of_algebraic_mem` (`[IsDomain S]`, `x ≠ 0`, `x ∈ I`, `IsAlgebraic R x`) | image of `π` nonempty open in irreducible `𝔸^m`, so inside no `V(p)`, `p ≠ 0`; `A ⊆ k(X) ⊗ A` since `A` is a domain; hypotheses of the pinned lemma met | sound | S01 (description of one cited lemma) |
| marked component §2.2 | `𝔽_3`, `π = (x, z² − 1 − 2x)` on `Spec k[x,z,z⁻¹]`, `B = 2` | Jacobian `2z`, unit; `π(0,1) = (0,0)`; `z² = T² + 2T + 1 = (T+1)²`; `(z−(T+1)) − (z+(T+1)) = −2(T+1)`, unit; mark `(T,z) = (0,1)` on `z = T + 1` | two components, the mark selects one | none |
| wrong model: all of `W` | same example | affine, `q` étale, smooth of dimension one, good open nonempty and dense; not connected | excluded by `GeometricallyIntegral` | none |
| `exists_marked_etale_curve` | `m = 0`, `V = Spec k`; `m = 1`, identity; `𝔸²`, `U = D(X_0)`, `h = X_0`, `B = 2`; `𝔽_2`, `h = X_0²X_1 − X_0X_1²`, `B = 3` | `C = 𝔸¹`, both sides of `π∘g = a_B∘q` are the structure map; `g = id`; `g⁻¹(U) = D(T) ∌ 0`; `g⁻¹(U) = D(T⁵ + T⁷)`, `T⁵ + T⁷ = T⁵(1+T)²` | holds; `y ∉ U` allowed | none |
| good-open argument §2.3 | `x ∈ C` with `q(x) ∈ D(φ(h))`, `g(x) ∉ U` | `π(g(x)) ∈ V(h)` and `π(g(x)) = a_B(q(x)) ∉ V(h)` | contradiction, as claimed | none |
| `exists_same_field_curve` | `Y = Spec k`; `U ∩ V = ∅`; `𝔸¹ ⊔ 𝔸¹`; `xw = 0` at `(1,0)`; `Spec 𝔽_{q²}`; cone `x² = aw²` | constant map from `𝔸¹`; `hU` false as `V ∋ y` is nonempty; applies with `V` the first copy; `V = D(x) ≅ 𝔾_m`; no section; image in `L_1 ∩ L_2 = {0}`, `g⁻¹(U) = ∅` | holds; smoothness and rationality needed | none |
| cone, `𝔽_3` | `a = 2` | squares in `𝔽_3` are `0, 1`; `x² − 2w² = x² + w²`; `Y(𝔽_3) = {0}` | as Worked example 3 | none |
| `GeometricallyIntegral` includes nonemptiness | `K = k`, identity point | `X ×_k Spec k ≅ X` integral; `IsIntegral` has the field `nonempty` (`Mathlib/AlgebraicGeometry/Properties.lean:239-241`) | README `:187-194` correct | none |
| direction of supply | depcheck | output below | no UPWARD, CYCLE or moved line | none |

Dependency check, verbatim:

```text
depcheck: 237 roadmaps, 2140 edges, 0 problem(s)
```

## Verified sound

Counts: 5 Lean declarations read (whole file, 116 lines); 9 README targets read (whole README, 703
lines); 11 source locators verified against the cached texts; 38 Checks and 3 worked examples
recomputed; 3 sibling citations checked; 32 pinned declarations opened or grepped at the pins.

- **Locators.** KisinZhou2024: Proposition 5.2.3 and Remark 5.2.4 on p. 49 (KisinZhou2024 lines
  2169, 2174); Corollary 5.2.7 on p. 52 with proof to p. 53 (lines 2322, 2337–2347); Proposition
  5.3.5 on p. 54 (lines 2392, 2413). Poonen2004: Theorem 3.3 and Corollary 3.4 on p. 10
  (Poonen2004 lines 514, 536), with dimension `≥ 1` in both and "projective" plus `m ≥ 2` in the
  connectedness remark (line 519), as the README says. Stacks-Morphisms line 3743 (Lemma 37.21,
  054L); Stacks-Varieties lines 528 (7.14, 04KV), 2084 (25.4, 056T), 2147 (25.10, 0CDW);
  Stacks-Properties line 433 (7.7, 033N).
- **Pinned declarations.** Every name under "Exact supplier contracts" exists at the pins:
  Mathlib `MvPolynomial.eval₂Hom_X'`, `comp_eval₂Hom`, `Nat.ofDigits_inj_of_len_eq`
  (`Data/Nat/Digits/Defs.lean:310`), `Nat.ofDigits_eq_sum_mapIdx`, `Nat.injOn_ofDigits`
  (`Data/Nat/Digits/Lemmas.lean:37, 360`), `IsClosedImmersion.spec_of_surjective`,
  `Etale.etale_isStableUnderBaseChange`, `Etale.iff_smoothOfRelativeDimension_zero`,
  `smoothOfRelativeDimension_comp`, `Algebra.EssFiniteType.of_finiteType`
  (`RingTheory/EssentialFiniteness.lean:95`), `Flat.generalizingMap`,
  `isOpenMap_of_generalizingMap`, `Scheme.Hom.isOpenMap`, `GeometricallyIntegral`,
  `Ideal.under_ne_bot_of_algebraic_mem`, `IsOpenMap.denseRange_of_isPreirreducibleSpace`,
  `TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, `isClosed_connectedComponent`,
  `AffineSpace.SpecIso`, `SpecIso_inv_over`, `smoothOfRelativeDimension_fin`,
  `MvPolynomial.uniqueAlgEquiv`; Tau Ceti `MvPolynomial.coeff_aeval_X_pow_weight`,
  `MvPolynomial.injOn_aeval_X_pow`, `Finsupp.exists_injOn_weight` (statements read in full, over
  `CommSemiring` and any variable type, as the README says),
  `AlgebraicGeometry.Smooth.exists_etale_affineSpace`,
  `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral`,
  `TauCeti.AlgebraicGeometry.residueDegree_eq_one_of_section`,
  `TauCeti.AlgebraicGeometry.residueFieldMap_bijective_of_section`.
- **Duplication by object.** No declaration at either pin states base-`B` weight injectivity on
  the box, the avoiding graph, or "connected with a rational point implies geometrically
  connected" (04KV; searched `Mathlib/AlgebraicGeometry/Geometrically/`,
  `TauCeti/AlgebraicGeometry/Geometrically/`, `TauCeti/AlgebraicGeometry/RationalPoint/`), so
  `rational_point_component` stays a roadmap citation.
- **Sibling citations.** SchemeAndStackFoundations §0.8 `rational_point_component` is on main
  (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:998-1001`) with the same hypotheses, and is
  kept under the same name at the head of that roadmap's open revision.
  ArithmeticInterpolationDeterminants §0.3 `powerSubstitution` is on main (`README.md:424-427`) and
  agrees with `polynomialGraph k 2 B`. The statement about the base roadmap's finite-field descent
  (`README.md:39-43` here) agrees with the open head of LefschetzPencilsAndVanishingCycles
  (its `README.md:2480-2494`); the base is not cited as a supplier.
- **Ownership against open work.** `roadmaps grep` over the open heads and main for the four
  theorem names, `polynomialGraph`, "Kronecker substitution", Poonen's Corollary 3.4 and curves
  through rational points: no second owner of any object stated here; the other Kronecker hits
  cite the same Tau Ceti module.
- **Headlines and padding.** Headlines per the README: `polynomialGraph_coeff`,
  `exists_avoiding_graph`, `exists_marked_etale_curve`, `exists_same_field_curve`; all four are
  stated, none through a stand-in. One-tactic probe by reading: `polynomialGraph_coeff` needs the
  conversion of exponent vectors to digit lists and `Nat.injOn_ofDigits` on top of the Tau Ceti
  theorem; `exists_avoiding_graph` needs the choice of `B`, §1.2 and a surjectivity proof. Neither
  is one library lemma.
- **Policy.** The pull request changes only the package folder (README, `Suggested.lean`,
  `sources.toml`, reports). Single `import Mathlib`; no `set_option`; `theorem` throughout; one
  `def` with a real body; no sorry'd data; no pull-request numbers or process narrative in the
  README or docstrings; every backticked name of this roadmap in the README is declared in
  `Suggested.lean` and conversely; every definition has at least three Checks (6 for
  `polynomialGraph`, 5 for the marked component). `plan.json` has `"gaps": []`, matching the brief.

## Not verifiable

- The elaborated types were taken from the job's signature listing; this pass is read-only and ran
  no Lean, so `#check @name` was not re-run. `Suggested.lean` is unchanged since the round-1
  repair, which reports an elaboration with exit 0.
- The published *Annals* numbering of Kisin–Zhou was not compared with arXiv v2; the README states
  that its locators refer to arXiv v2, which is the text checked.
- Poonen's journal page numbers (1099–1127) were not checked; the locators are to the author's
  version, which is the text checked.

## Source issues

- **Error** in Poonen2004 at Theorem 3.3, author's version p. 10 (Poonen2004 line 514): the source says a geometrically integral hypersurface through any finite set of closed points exists for every ambient projective space; it should exclude the projective line, where such a hypersurface is one rational point; affects a stated result.
- **Gap** in KisinZhou2024 at the proofs of Corollary 5.2.7, p. 53, and Proposition 5.3.5, p. 54 (KisinZhou2024 lines 2345 and 2413): the source says Poonen's Corollary 3.4 gives the curve inside a smooth scheme that is not shown projective or geometrically integral; it should give a same-field curve argument valid for a smooth chart; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "00fae125c64f3f3ec998a9f0558378a7c97cd8f9", "job": "RT-LefschetzPencilsAndVanishingCyclesPartII~2b", "model": "fable", "worker": "chris-x8"} -->
