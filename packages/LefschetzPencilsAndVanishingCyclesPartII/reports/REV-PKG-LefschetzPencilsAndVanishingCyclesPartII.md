<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2399#issuecomment-6670939117 -->
Review (claude) of 615d698

Verdict: needs_changes

1. **F01** (P3) `GeometricallyIntegral` does include nonemptiness

   - **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md` line 143–146, "it does
     not by itself include finite type or nonemptiness, which the targets here state separately".
   - **Claim.** Mathlib's geometric integrality does not include nonemptiness.
   - **Witness.** `Mathlib/AlgebraicGeometry/Properties.lean` line 239–243: `class IsIntegral` has the
     field `nonempty : Nonempty X`; `GeometricallyIntegral f` (`Geometrically/Integral.lean` line 40)
     asks `IsIntegral` of every fibre product `X ×[Y] Spec K`, so each such fibre product is nonempty.
   - **Repair.** Replace the clause by: "it does not include finite type, which the targets state
     separately; it does include nonemptiness of every fibre product, since Mathlib's `IsIntegral`
     carries a `nonempty` field". Tested on the instance: with `K = k`, `GeometricallyIntegral sC`
     already yields `C` nonempty; the separate `(g ⁻¹ᵁ U).Nonempty` clause remains needed for the
     good open and is unaffected.

2. **F02** (P3) Stacks tag 0CDW is listed but never cited

   - **Location.** `README.md` line 556–557 (References, "33.25.10 (0CDW)") and `sources.toml`
     Stacks-Varieties `locator` ("… 33.25.10 (0CDW)"). No body line of the README cites 0CDW or
     Lemma 33.25.10 (grep over the file: the only occurrence is the References entry).
   - **Claim.** Every cited work is recorded in the manifest and every manifest locator is cited.
   - **Witness.** `Stacks-Varieties` line 2147: Lemma 25.10 (0CDW) states that a variety with a
     rational point at which it is smooth is geometrically integral, the fact the §2.2 bullet
     "`s_C` is geometrically integral" consumes through `rational_point_component`.
   - **Repair.** Cite it where it is used: in the §2.2 API bullet "`s_C` is geometrically integral, by
     `rational_point_component` …" add "(Stacks, Lemma 33.25.10 (0CDW))", and in the Scope bullet
     "*Connected smooth schemes with a rational point are geometrically integral*" add 0CDW to the
     lemma list. The manifest entry then stays as recorded.

3. **F03** (P3) A Check names the variable `T` inside `k[X_0]`

   - **Location.** `README.md` line 283, "Over `𝔽_q`, `h = T^q − T ∈ k[X_0]` (`m = 1`, so `φ` is the
     identity)".
   - **Claim.** The Check is stated in the roadmap's own conventions (Convention 2: `𝔸^m_k` is
     `Spec k[X_0, …, X_{m-1}]`, `𝔸¹_k` is `Spec k[T]`).
   - **Witness.** `h` lives in the source `k[X_0]` of `φ = polynomialGraph k 1 B`, whose variable is
     `X_0`; `T` is the variable of the target. With `h = X_0^q − X_0` one computes
     `φ(h) = T^q − T` for every `B` (since `X_0 ↦ T^(B^0) = T`), and `D(T^q − T)(𝔽_q) = ∅` because
     every `a ∈ 𝔽_q` satisfies `a^q = a`.
   - **Repair.** Write "`h = X_0^q − X_0 ∈ k[X_0]` (`m = 1`, so `φ(h) = T^q − T`): `D(φ(h)) ⊆ 𝔸¹` is
     nonempty and dense, yet contains no `𝔽_q`-point."

4. **F04** (P3) §2.1's `*Needs:*` line omits two inputs of its route

   - **Location.** `README.md` line 306–319, §2.1, the step "Localising at `k[X] ∖ {0}`, the algebra
     `A ⊗ k(X)` is étale and of finite type over the field `k(X)`" and the `*Needs:*` line that
     follows.
   - **Claim.** Every input of the route is a pinned declaration named on the `*Needs:*` line.
   - **Witness.** The step uses that `Etale π` gives `RingHom.Etale` of `π^*` (Mathlib
     `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean` line 52, `instance : HasRingHomProperty @Etale
     RingHom.Etale`) and that étale algebras are stable under base change (`Algebra.Etale.baseChange`,
     `Mathlib/RingTheory/Etale/Basic.lean` line 241). Neither is named; the line names only
     `Flat.generalizingMap`, `isOpenMap_of_generalizingMap`, `iff_exists_algEquiv_prod`,
     `under_ne_bot_of_algebraic_mem`.
   - **Repair.** Add to §2.1 `*Needs:*`: "Mathlib `AlgebraicGeometry.Etale` as the ring-hom property
     `RingHom.Etale` (`HasRingHomProperty` instance in `Morphisms/Etale.lean`) and
     `Algebra.Etale.baseChange` (`RingTheory/Etale/Basic.lean`)", and list both under "From Mathlib".
     Tested: both names elaborate at the pin (lines above), and the base change `k(X) ⊗_{k[X]} A` is
     essentially of finite type over `k(X)` as a base change of the finite-type `k[X]`-algebra `A`, so
     `iff_exists_algEquiv_prod` applies as the sketch says.

Four findings, all P3; no P1 or P2. The mathematics of the four headline theorems and of every
sampled target holds on every instance computed below; the Lean file elaborates with the four
`sorry` warnings only; no padding; no upward or cyclic supply. The repairs are a false claim about
a Mathlib definition, an unused reference, a notation slip in a Check, and two missing route inputs.

## Verified sound

**Principles.** No route-specific shortcut: the theorems hold over an arbitrary field (Layer 2) and
an arbitrary commutative ring (Layer 1), with `m ≥ 0` in §2.3. No re-planning: the base roadmap
LefschetzPencilsAndVanishingCycles (open pull request, merge order line 60) is not a supplier; its
§3.5 "descent of pencils to a finite field" (its README at the open head, lines 2421–2432) produces
an axis over some `𝔽_{q^r}` and replaces Frobenius by its `r`-th power, exactly as the Scope
paragraph says, and it states no curve through a prescribed rational point. No copied passages, no
algorithm, no sorry'd data, no `set_option`. The single supplier roadmap is SchemeAndStackFoundations
(merge order line 2; this roadmap is line 3).

**Sources, seeded sample.** Each sampled target was checked at its locator in the cached texts:

| Target | Locator | Cached line | Result |
|---|---|---|---|
| 1.1, 1.2, 1.3 | Mathlib `eval₂Hom`, `eval₂Hom_C`, `eval₂Hom_X'`, `eval₂Hom_monomial`, `comp_eval₂Hom` | `Mathlib/Algebra/MvPolynomial/Eval.lean` 158, 181, 185, 203, 189 | present, as described |
| 1.2 | `Nat.ofDigits_inj_of_len_eq` (`1 < b`, equal length, digits `< b`) | `Data/Nat/Digits/Defs.lean` 309–311 | hypotheses as the README states |
| 1.2 | `Nat.ofDigits_eq_sum_mapIdx`, `Nat.injOn_ofDigits`, `Finsupp.weight` | `Digits/Lemmas.lean` 36, 359; `Finsupp/Weight.lean` 82 | present; `weight w f = Σ f i • w i` |
| 1.3 | `IsClosedImmersion.spec_of_surjective` | `Morphisms/ClosedImmersion.lean` 97 | present |
| 2.1 | `Flat.generalizingMap`, `isOpenMap_of_generalizingMap`, `iff_exists_algEquiv_prod` (`[EssFiniteType K A]`), `under_ne_bot_of_algebraic_mem` (`[IsDomain S]`) | `UniversallyOpen.lean` 129, 105; `Etale/Field.lean` 194; `Ideal/GoingUp.lean` 193 | present, hypotheses match the route |
| 2.2 | `NoetherianSpace.finite_irreducibleComponents`, `isClosed_connectedComponent`, `etale_isStableUnderBaseChange`, `iff_smoothOfRelativeDimension_zero`, `smoothOfRelativeDimension_comp` (adds `n + m`), `AffineSpace.smoothOfRelativeDimension` (`Nat.card n`), `SpecIso` | `Topology/NoetherianSpace.lean` 192; `Connected/Basic.lean` 606; `Morphisms/Etale.lean` 70, 104; `Morphisms/Smooth.lean` 201; `AffineSpace.lean` 380, 224 | present |
| 2.2, 2.4 | SchemeAndStackFoundations §0.8 `etale_coordinates` (054L), `rational_point_component` (04KV, 056T, 033N) | main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 818–825 | both stated as cited; the affine form of the chart follows from the supplier's open form by restricting to an affine open (restriction of étale is étale, `Morphisms/Etale.lean` 88) |
| 2.3 | `Scheme.Hom.isOpenMap` (`[UniversallyOpen f]`, supplied by `UniversallyOpen.of_flat` for flat + lfp), `IsOpenMap.denseRange_of_isPreirreducibleSpace` (`[Nonempty U]`), `IsOpen.dense` | `UniversallyOpen.lean` 43, 142; `Topology/Irreducible.lean` 201, 197 | present |
| 2.4 | Stacks 054L, 056T, 033N | `Stacks-Morphisms` 3743; `Stacks-Varieties` 2084; `Stacks-Properties` 433 | statements as cited: affine `U ∋ x` with étale `U → 𝔸^d_V`; smooth over a field is geometrically normal and reduced; locally Noetherian normal iff disjoint union of integral normal |
| 2.4, Summary, consumers | KisinZhou2024 Prop. 5.2.3, Rem. 5.2.4 (p. 49), Cor. 5.2.7 (pp. 52–53), Prop. 5.3.5 (p. 54) | lines 2169, 2174, 2322–2351, 2392–2425 | as cited; the proofs of 5.2.7 (line 2345) and 5.3.5 (line 2413) invoke Poonen Cor. 3.4 on a smooth scheme `Y` |
| Scope | Poonen2004 Thm 3.3, Cor. 3.4 (p. 10) | lines 514–517, 536–539 | Thm 3.3: smooth quasi-projective `X`, finite set `F`, `H ∩ X` smooth of dimension `m − 1` containing `F`; Cor. 3.4: smooth projective geometrically integral `X`. Neither makes the subvariety meet a prescribed dense open. The README's description is exact |
| Scope | Tau Ceti `Smooth.geometricallyIntegral` (`[Smooth f] [GeometricallyConnected f]`), `residueDegree_eq_one_of_section`, `residueFieldMap_bijective_of_section`, namespace `TauCeti.AlgebraicGeometry` | `Morphisms/Smooth/GeometricallyIntegral.lean` 37; `RationalPoint/Basic.lean` 92, 117 | present at the pin |

Locators flagged as unverified by the author: none.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `polynomialGraph` (1.1) | `m = 1`, `B = 0` | `X_0 ↦ T^(0^0) = T^1 = T` (ℕ: `0^0 = 1`) | matches Check | none |
| | `m = 2`, `B = 0` | `X_1 ↦ T^(0^1) = T^0 = 1`; constant term of `φ(X_1)` is `1 ≠ 0` | origin not preserved; the `B ≥ 1` hypothesis is needed | none |
| | `m = 0`, field | map `= Polynomial.C`; `T ∉` image | not surjective, `m > 0` needed in 1.3 | none |
| | `m ≥ 2`, any `B` | `X_1 − X_0^B ↦ T^B − T^B = 0` | not injective, as the API says; its exponent `B` is not `< B` | none |
| | change of coefficients `k → K` | both composites send `X_i ↦ T^(B^i)` and `C a ↦ C (f a)`; `MvPolynomial.ringHom_ext` | agree | none |
| `polynomialGraph_coeff` (1.2) | ℤ, `h = X_0²X_1 − X_0X_1²`, `B = 3` | `w(2,1) = 2 + 3 = 5`, `w(1,2) = 1 + 6 = 7`, `w(0,2) = 6`; `φ(h) = T⁵ − T⁷`; coefficients `1, −1, 0` = `h`-coefficients `1, −1, 0` | holds | none |
| | `𝔽_2`, `h = X_1 − X_0²`, `B = 2` | hypothesis fails (`d_0 = 2`); `φ(h) = T² − T² = 0`; coefficient of `T^(w(0,1)) = T²` is `0 ≠ 1` | conclusion fails without the bound: negative control correct | none |
| | `B = 1`, any `m` | bounds force every `d`, `e` to be `0`; `w = 0`; both sides the constant term | holds | none |
| | `B = 0`, `m ≥ 1` | `e i < 0` impossible | vacuous, true | none |
| | `B = 0`, `m = 0` | `Fin 0` empty so both bounds hold vacuously; `h = C a`, `e = 0`, `w = 0`; both sides `a` | holds (the README's "for `B = 0` and `m ≥ 1`" is correctly restricted) | none |
| | `e ∉ supp h`, `B ≥ 2` | by injectivity of `w` on digit vectors `< B` (ofDigits, length `m`) no `d ∈ supp` has `w(d) = w(e)`; LHS `0`, RHS `0` | holds | none |
| | `e` with some `e_i ≥ B` (hypothesis dropped) | `h = X_1`, `B = 2`, `e = (2,0)`: `w(e) = 2 = w(0,1)`; LHS `1`, RHS `0` | the hypothesis on `e` is needed | none |
| `exists_avoiding_graph` (1.3) | `m = 1`, `h = X_0` | every `B ≥ 2` works: `φ(h) = T ≠ 0`; `φ` is the identity, a closed immersion | holds | none |
| | `𝔽_2`, `h = X_1 − X_0²` | `B = 2` excluded by the bound (`φ(h) = 0`); `B = 3`: `T³ − T² = T²(T − 1)`, `D = 𝔸¹ ∖ {0, 1}` | holds | none |
| | `m = 0` | `Spec k[T] → Spec k` not injective on points | not a closed immersion; `hm` needed | none |
| | zero ring | `h ≠ 0` impossible | vacuous | none |
| | surjectivity for `m > 0`, `B = 0` | `Σ a_j X_0^j ↦ Σ a_j T^j` since `X_0 ↦ T^(0^0) = T` | surjective for every `B` | none |
| 2.1 boundary polynomial | identity chart of `𝔸²`, `Z = V(X_0X_1)` | `h = X_0X_1`; `π(Z) = Z ⊆ V(h)` | holds | none |
| | `m = 0`, `V = Spec L` | only proper closed subset `∅`; `h = 1`, `V(1) = ∅` | holds | none |
| | `V = Spec k[x, x⁻¹]`, `Z = {x = 1}` | `h = X_0 − 1` | holds | none |
| | projection `𝔸² → 𝔸¹` (smooth, not étale), `Z = V(x_1)` | `π(Z) = 𝔸¹`; `k[x_0, x_1]` not algebraic over `k[X_0]` (`x_1` transcendental) | fails without étale: negative control correct | none |
| | route: injectivity of `π^*` | `π` open, `V ≠ ∅`, so `π(V)` contains the generic point `(0)`; a prime `𝔮` of `A` with `(π^*)⁻¹(𝔮) = 0` forces `ker π^* = 0` | holds; used to clear denominators in `S⁻¹A` | R04 adds two named inputs |
| 2.2 marked component | `𝔽_3`, `V = Spec k[x, z, z⁻¹]`, `π = (x, z² − 1 − 2x)`, `B = 2` | Jacobian `[[1, 0], [−2, 2z]]`, det `2z`, a unit; `π(0, 1) = (0, 1 − 1 − 0) = (0, 0)`; pullback `z² − 1 − 2T = T²`, i.e. `z² = (T + 1)²`; `(z + T + 1) − (z − T − 1) = 2(T + 1)`, a unit as `(T + 1)² = z²`; branches `z = ±(T + 1)`, each `≅ D(T + 1)`; at `T = 0`: `z = 1` on `z = T + 1`, `z = −1 ≠ 1` on the other | two components; the mark picks `z = T + 1`; `g(T) = (T, T + 1)` | none |
| | identity chart, `B = 2` | `g(T) = (T, T²)`, `q = id`; the model `(T², T)` gives `π ∘ g = (T², T) ≠ (T, T²) = a_2 ∘ q` | wrong-order model excluded | none |
| | `m = 0` | `W = V ×_{Spec k} 𝔸¹ = 𝔸¹` (as `V = Spec k`), `g` constant, no closed immersion used | uniform construction | none |
| | the mark lies in `W`: `y ≫ π = 0_{𝔸^m}` versus `0_{𝔸¹} ≫ a_B` | `constantCoeff_{k[T]} ∘ φ = constantCoeff_{k[X]}` iff `B ≥ 1` (each `X_i ↦ T^(B^i)` with `B^i ≥ 1`); `B ≥ 2` in the conclusion | the fibre-product point exists | none |
| | base change to `𝔽_9` | `C_K` connected (`C` geometrically integral), `W_K` still two components; preimage of a nonempty open under the surjection `C_K → C` nonempty | holds | none |
| `exists_marked_etale_curve` (2.3) | `U = D(X_0)`, `h = X_0`, `B = 2` | `g⁻¹(U) = D(T)`, `c = 0 ∉ D(T)`; nonempty, dense | holds with `y ∉ U` | none |
| | `𝔽_2`, `h = X_0²X_1 − X_0X_1²`, `B = 3` | `g = (T, T³)`; `φ(h) = T⁵ + T⁷ = T⁵(1 + T)²`; `D = 𝔸¹ ∖ {0, 1}`; `𝔽_2`-points none, `𝔽_4`-points `𝔽_4 ∖ 𝔽_2` | holds; no rational point in the good open | none |
| | `m = 0`, `V = Spec k` | `C = 𝔸¹`, `q = id`, `g` the structure map, `c = 0`; `g ≫ π` and `q ≫ a_B` both the unique map to `Spec (MvPolynomial (Fin 0) k)` | holds without `0 < m` | none |
| | context: `y` is a `k`-point | `y ≫ π ≫ Spec.map (algebraMap) = Spec.map (constantCoeff ∘ algebraMap) = Spec.map (id) = 𝟙` | implied by `hy` | none |
| | context: `c` is a `k`-point | same computation with `Polynomial.constantCoeff` | implied by the conclusion | none |
| | good open nonempty | `q` open (étale ⇒ flat + lfp ⇒ universally open), `C ∋ c` nonempty, so `q(C)` is a nonempty open of the irreducible `𝔸¹`; `D(φ(h))` is a nonempty open (`φ(h) ≠ 0`, `k[T]` a domain); they meet | `q⁻¹(D(φ(h))) ≠ ∅` | none |
| | good open inside `g⁻¹(U)` | `x ∈ q⁻¹(D(φ(h)))`, `g(x) ∉ U` ⇒ `h ∈ 𝔭_{π(g(x))} = 𝔭_{a_B(q(x))} = φ⁻¹(𝔭_{q(x)})` ⇒ `φ(h) ∈ 𝔭_{q(x)}` | contradiction | none |
| | the whole of `W` in the `𝔽_3` example | affine, `q` étale, `g`, `c`, smooth of relative dimension `1`, `g⁻¹(U) = W` dense, but `W` disconnected | only geometric integrality fails, as the Check says | none |
| `exists_same_field_curve` (2.4) | `Y = Spec k` | `m = 0`, `C = 𝔸¹`, `g` constant, `c = 0`, `g⁻¹(U) = C` | holds; an immersion `C → Y` would be false | none |
| | `Y = 𝔸¹_{𝔽_q}`, `U = D(T^q − T)` | `g = id`; `g⁻¹(U)(𝔽_q) = ∅` since `a^q = a` for all `a ∈ 𝔽_q` | holds; no rational point claimed | none |
| | `Y = 𝔸¹ ⊔ 𝔸¹`, `U = V` = first copy | `U` not dense in `Y`; `V.ι⁻¹(U) = V` dense in `V` | hypothesis as stated applies | none |
| | `Y = Spec 𝔽_{q²}` over `𝔽_q` | no `𝔽_q`-algebra map `𝔽_{q²} → 𝔽_q`; `Y(𝔽_q) = ∅` | hypothesis `y` unavailable: negative control correct | none |
| | cone `x² = a w²`, `q` odd, `a` a non-square, `y = 0`, `U = Y ∖ {0}` | over `𝔽̄_q` two lines `x = ±√a w`, swapped by Frobenius; `g(C_{k̄})` irreducible, hence in one line, and Frobenius-stable, hence in `L_1 ∩ L_2 = {0}`; `g⁻¹(U) = ∅`; for `q = 3`, `a = 2`: `x² + w² = 0`, lines `x = ±i w` | conclusion fails without smoothness at `y`; for `q` even every element is a square, so the restriction to odd `q` is right | none |
| | `Y = Spec k[x, w]/(xw)`, `y = (1, 0)`, `V = D(x)` | `V = Spec k[x, x⁻¹]` (as `x` a unit forces `w = 0`), smooth | holds; singularity at the origin unused | none |
| | chart step | `V₀` smooth ⇒ normal (056T), Noetherian ⇒ disjoint union of integral opens (033N); the open-and-closed piece through `y` is affine; translation `X_i ↦ X_i − a_i` is a `k`-automorphism; `y ≫ π' ` is the `k`-algebra map `k[X] → k` with `X_i ↦ 0`, i.e. `constantCoeff` by `MvPolynomial.ringHom_ext` | the hypotheses of 2.3 are met | none |
| | `g ≫ f = s_C` | `g' ≫ V₁.ι ≫ f = g' ≫ π' ≫ str = q ≫ a_B ≫ str = q ≫ Spec.map (algebraMap)` | holds | none |
| | Lean generality vs README | README: field `k`, `V` open with `V → Spec k` smooth, `U ∩ V` dense in `V`; Lean: `[Field k]`, `[Smooth (V.ι ≫ f)]`, `Dense (V.ι ⁻¹ᵁ U)`; conclusion clauses identical | agree | none |
| `GeometricallyIntegral` contract | Mathlib `IsIntegral` | has `nonempty` field (Properties.lean 239–243) | README's "does not include nonemptiness" is false | R01 |
| Residue fields | sections `c`, `y` | `residueDegree_eq_one_of_section`, `residueFieldMap_bijective_of_section` require `s ≫ f = 𝟙`; both `c ≫ s_C = 𝟙` and `y ≫ f = 𝟙` are in the statement | holds | none |
| Worked example 1 | `D(T⁵ + T⁷)` over `𝔽_2` | `T⁵ + T⁷ = T⁵(1 + T)²`; roots `0, 1` | `𝔸¹ ∖ {0, 1}` | none |
| Worked example 3 | `𝔽_3`, `a = 2` | squares mod 3 are `{0, 1}`, so `2` is a non-square; `−2 ≡ 1`, so `x² − 2w² = x² + w²`; `i² = −1` in `𝔽_9` | lines `x = ±iw`, conjugate | none |

**Generality.** README and Lean agree on every headline: Layer 1 over a commutative ring, Layer 2
over a field, `exists_marked_etale_curve` for all `m ≥ 0`, `exists_avoiding_graph` with `0 < m`.
Unused hypotheses: none found.

**Duplication by object.** Kronecker substitution `X_i ↦ T^(B^i)` with a coefficient theorem:
absent from Mathlib at the pin (the only base-`B` separation is `NoetherNormalization.lean` lines
82–94, private lemmas for `X_i ↦ X_i + c • X_0^(r_i)`) and from Tau Ceti (grep for `Kronecker`,
`injOn … weight`, `weight_inj`: no polynomial substitution). SubspaceTheorem on main (README line
127) cites a Tau Ceti `MvPolynomial.exists_injOn_weight`, absent at the pin and in any case an
injectivity lemma, not the map. `roadmaps grep` for "Kronecker substitution", `polynomialGraph`,
"same-field curve", "marked étale curve", `exists_avoiding_graph`, `exists_same_field_curve`: no
owner on main or at any open head. Board packages: ShimuraVarietiesPartII (SV2.6) and
GeometricSatakeAndFusionPartII (§5.5, root curves in Schubert cells, a different object) consume a
same-field curve and are later in the merge order; the review of GeometricSatakeAndFusionPartII
names this roadmap as the owner of the smooth-chart curve. This roadmap is the owner. The
open-pull-request index covers the roadmaps the brief lists.

**Supplier order.** `*Needs:*` lines cite only Mathlib, Tau Ceti, earlier layers and
SchemeAndStackFoundations §0.8 (both declarations present on main). Dependency check:

```
depcheck: 241 roadmaps, 2421 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No declared gaps (`plan.json` `gaps` empty, README states none).

**Shape and style.** Headings and sections in the house order; both definitions
(`polynomialGraph`, the marked component) carry API lists and five Checks each with negative
controls; every layer ends with Examples and Dependencies; no LaTeX delimiters, no process words,
no pull-request numbers, dates or machine paths (grep over the README and the Lean file). The
backticked names of this roadmap's own (`polynomialGraph`, `polynomialGraph_coeff`,
`exists_avoiding_graph`, `exists_marked_etale_curve`, `exists_same_field_curve`) are exactly the
five declarations of `Suggested.lean`; `roadmaps resolve` lists no unresolved citation or name.

**Lean.** `lake env lean` on `Suggested.lean` from the content checkout: four warnings, all
`declaration uses 'sorry'` (lines 48, 59, 74, 98), nothing else; import header `import Mathlib`
only; `theorem` throughout; no `set_option`, no sorry'd data; `polynomialGraph` has a real body.
`#check @name` on all five declarations in a scratch copy: the elaborated types agree with the
worker's signature file and with the README statements; no section binder is lost (no section
`variable`s exist). One-tactic probe on every sorried theorem with
`first | rfl | infer_instance | (simp; done) | (simp_all; done)`: all four leave the goal open; no
padding. Headline theorems of the README (§1.2, §1.3, §2.3, §2.4): all four statable and stated;
none forced through a stand-in; the §2.2 construction is correctly a README target (heavy data).

## Not verifiable

- KisinZhou2024, published version (Annals of Mathematics 202 (2025), DOI
  10.4007/annals.2025.202.3.3): paywalled; locators were checked against arXiv v2 only, as the
  manifest's `version_note` records.
- Poonen2004 in Annals pagination: only the author's PDF (p. 10) is in the cache; the README cites
  the author PDF page, which is what was checked.

## Source issues

- **Gap** in KisinZhou2024 at Corollary 5.2.7, proof, printed page 53 (and again in the proof of
  Proposition 5.3.5, printed page 54): the source says a smooth geometrically connected curve
  through a rational point of a smooth scheme `Y`, meeting a dense open, exists by Poonen's
  Corollary 3.4; it should be an argument for a quasi-projective, non-projective `Y` that also
  forces the curve to meet the dense open, since Poonen's Corollary 3.4 assumes `X` smooth
  projective geometrically integral and neither of Poonen's statements makes the subvariety meet a
  prescribed open; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "615d698f73c704342f87e0ae5eced4f5897e142d", "job": "REV-PKG-LefschetzPencilsAndVanishingCyclesPartII", "model": "fable", "worker": "chris-x19"} -->
