<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6906324984 -->
Red team round 2 pass b (claude) of 518eebf

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §1.4 for `d ≤ 3`: the `p`-primary inputs of Kerz–Saito's theorem have no owner

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:542` ("the Lefschetz condition
   (their Theorem 3.5, p. 15, whose case `ℓ = char` rests on the weights of `p`-adic cohomology)"), its
   *Needs:* line `README.md:557`, and the contract `README.md:121` ("supplies the weights of `p`-adic
   cohomology that Kerz–Saito's Lefschetz condition uses").

   **Claim.** CrystallineCohomology §§CR.4.7–CR.4.8 and PadicDifferentialEquationsAndRigidCohomology §RD.7.7
   supply what Kerz–Saito's route needs when `ℓ = 2 = char`.

   **Witness.** kerz_saito line 369–380 and 405–406 (the homology theory with `p`-torsion coefficients and
   its Kato complex, from Jannsen–Saito–Sato), line 389 and 837 (Suwa, Lemma 2.1), line 843–845 (Suwa,
   Theorem 2.5; weights of the open `U`, from Colliot-Thélène–Sansuc–Soulé and Gros–Suwa). §CR.4.8 defines
   the sheaves and the `1 − F` sequence only; §RD.7.7 treats smooth projective varieties. `roadmaps grep -i`
   for "Jannsen.Saito.Sato", "Gros.Suwa", "Suwa" and for purity or duality of logarithmic Hodge–Witt
   sheaves finds no roadmap on main or at an open head. The same inputs enter Jannsen's route for `d > 3`.
   The three characteristic-two headlines (`d ≤ 3`) rest on them.

   **Repair.** Add a target to Layer 1, owned here, and point 1.4 at it:

   "### 1.4a The `p`-primary étale homology theory over a finite field

   Let `k` be a finite field of characteristic `p`, `Λ = ℤ/pⁿ`, and for `f : X → Spec k` separated of finite
   type put `H_a(X, Λ) = H^{−a}(X_ét, Rf^!Λ)`. Prove (Kerz–Saito, Example 1.4 and Lemma 1.5(2), p. 8; proof
   of Theorem 3.5, Case I, pp. 15–17, with the primary locators in Jannsen–Saito–Sato, Suwa, Gros–Suwa and
   Colliot-Thélène–Sansuc–Soulé recorded in `sources.toml`):

   - (a) *Duality.* For `f` smooth of pure dimension `d`, `Rf^!Λ ≅ W_nΩ^d_{X,log}[d]`, so
     `H_a(X, Λ) = H^{d−a}(X_ét, W_nΩ^d_{X,log})`; the homology theory has localization sequences for closed
     immersions, and its Kato complex is the complex of Kato's groups of 1.1.
   - (b) *Level.* For `X` affine, smooth and connected of dimension `d`, `H_{d+a}(X, Λ) = 0` for `a < −1`.
   - (c) *Localization and weights.* For `X` smooth projective over `k`, `Y ⊂ X` a simple normal crossings
     divisor and `U = X ∖ Y`, the localization sequence relating `H^i(U_{k̄}, ℚ_p(r))`, `H^i(X_{k̄}, ℚ_p(r))`
     and the cohomology of the strata of `Y`, where `H^i(−, ℚ_p(r)) = (lim_n H^{i−r}(−, W_nΩ^r_log)) ⊗ ℚ`; and
     Frobenius acts on `H^i(X_{k̄}, ℚ_p(r))` with weight `i − 2r`.

   For `X` smooth projective the weight statement follows from the `1 − F` sequence (CrystallineCohomology
   §CR.4.8, *Illusie and Shiho logarithmic exact sequences*), the slope spectral sequence (§CR.4.7, *Degree
   filtration and the slope spectral sequence*: the part of slope `r`) and Katz–Messing
   (PadicDifferentialEquationsAndRigidCohomology §RD.7.7).

   **Checks.** `X = ℙ¹`, `r = 1`, `i = 2`: `H¹(ℙ¹_{k̄}, WΩ¹_log) ⊗ ℚ = ℚ_p` with trivial Frobenius, weight
   `2 − 2 = 0`. `X = 𝔾_m`, `d = 1`: `H_1(𝔾_m, Λ) = H⁰(𝔾_m, W_nΩ¹_log) ∋ dlog t`, and `H_a = 0` for `a < 0`,
   as (b) requires. For `X` a supersingular elliptic curve `H⁰(X_{k̄}, WΩ¹_log) ⊗ ℚ = 0` (both slopes
   are `1/2`), while for an ordinary one it is `ℚ_p` (slopes `0` and `1`): the coefficients are not
   `ℓ`-adic cohomology with `ℓ` replaced by `p`.

   *Needs:* CrystallineCohomology §§CR.4.7–CR.4.8; PadicDifferentialEquationsAndRigidCohomology §RD.7.7;
   KTheoryFiniteLocalFields §3.0."

   In 1.4 replace "whose case `ℓ = char` rests on the weights of `p`-adic cohomology" by "whose case
   `ℓ = char` is 1.4a", add "1.4a" to the *Needs:* of 1.4 for both `d ≤ 3` and `d > 3`, and in `README.md:121`
   replace "supplies the weights of `p`-adic cohomology that Kerz–Saito's Lefschetz condition uses when `ℓ`
   is the characteristic" by "supplies, with the slopes of §CR.4.7, the weights for smooth projective
   varieties used in 1.4a(c)". Tested on the refuting instance: `K = 𝔽₂(s, t, u)`, `X = ℙ³`, `ℓ = 2`: the
   Lefschetz condition for an ample log-pair `(ℙ³, Y; U)` needs (a) for the singular `Y`, (b) for the affine
   `U` and (c) for `U`; each is now a named target.

2. **F02** (P2) §5.6(b): the route applies §1.5 and §5.6(a) to `K_{u,α,c}`, which need not be the function field of a smooth curve in positive characteristic

   **Location.** `README.md:1107` ("(b) under the same hypotheses `R^f_α = 1 + ⋂_{P ∈ D_{fα}} 𝔪_P` (Key Lemma
   4.7)"), with `README.md:1104` citing Lemmas 4.2, 4.3, 4.6; hypotheses at `README.md:561` and `1076`
   ("the function field of a smooth projective geometrically integral `k`-curve").

   **Claim.** Pop's Lemma 4.3(3), the input of Lemma 4.6 and Key Lemma 4.7, is covered by 1.5 and 5.6(a).

   **Witness.** pop_eei2 line 565–568 and 576–591 apply the local–global principle and Lemma 3.3 to
   `L = K_{u,α,c}` over `l = L ∩ k̄`, for every `u`. Instance: `k = 𝔽_q(a)`, `q ≡ 1 mod 4`, `K = k(x)`,
   `n = 2`, `c = 1`, `u = x^p − a`. Then `L = k(x, y, w)`, `y² = x^p − a`, `w² = αy⁴ + (1 − 2α)y² + α`, `l = k`;
   at `y = 0` the local ring is a discrete valuation ring with uniformizer `y`, and the Jacobian minor `4wy`
   vanishes: regular, not smooth. The open set `U_f` of 5.6 is empty for it.

   **Repair.** Add to 5.6, after item (b):

   "Lemma 4.3(3) of Pop 2017 applies (a) and 1.5 to `L = K_{u,α,c}` over its constant field `l`, a finite
   separable extension of `k`. In characteristic zero `L` is the function field of a smooth projective
   geometrically integral `l`-curve and (a) applies as stated. In characteristic `p > 0` the regular
   projective `l`-curve `Y` of `L` need not be smooth (see the Checks). Choose a finite purely inseparable
   extension `l′/l` such that the normalization `Y′` of `Y ×_l l′` is geometrically normal, hence smooth,
   over `l′` (Stacks, Lemma 33.27.4, tag 0BXT); `l′` is a global field, `L′ = L l′ = Frac(L ⊗_l l′)` is the
   function field of `Y′`, and `[L′ : L]` is a power of `p`, prime to `n`. Restriction
   `H³(L, ℤ/n(2)) → H³(L′, ℤ/n(2))` is injective, so a class `f ∪ α ∪ β*` nonzero over `L` is nonzero over
   `L′`; (a) over `L′/l′` gives a place `Q′` of `L′/l′` at whose completion the class, and `H^f_{δ*α}` for
   every `δ*`, is nonzero, with `v_{Q′}(f)` prime to `n` and `α` not an `n`-th power in `κ(Q′)`. Let `Q` be
   its restriction to `L`. Then `L_Q ⊆ L′_{Q′}`, so the classes are nonzero over `L_Q`; `v_{Q′} = e · v_Q` on
   `L` with `e` a power of `p`, so `v_Q(f)` is prime to `n`; and `κ(Q) ⊆ κ(Q′)`, so `α` is not an `n`-th
   power in `κ(Q)`. These are the conclusions Lemma 4.3(3) needs."

   Add the Check: "In characteristic `p` the auxiliary field need not be smooth over its constants. For
   `k = 𝔽_q(a)`, `K = k(x)`, `n = 2`, `c = 1`, `u = x^p − a` and `α ∈ 𝔽_pˣ`, the field `K_{u,α,1}` contains
   `y` with `y² = x^p − a`; the place `y = 0` has residue field containing `a^{1/p}`, and over
   `l′ = k(a^{1/p})` one has `y² = (x − a^{1/p})^p`, so the model is not normal there. Over `l′` the field is
   `l′(z, w₁)` with `z² = x − a^{1/p}`, `y = z^p` and `w₁² = α z⁴ + (1 − 2α) z² + α` (as
   `αy⁴ + (1 − 2α)y² + α` is the `p`-th power of this quartic in `z`), the function field of a smooth curve
   when the quartic is separable." Add "Stacks, Lemma 33.27.4 (tag 0BXT)" to the *Needs:* of 5.6 and
   to the References. Tested on the instance: `L′ = l′(z, w₁)` is smooth over `l′`, `[L′ : L] = p` is odd, and
   1.5 (function-field case, by 1.3 over `𝔽_q`) applies to it.

3. **F03** (P2) §7.1(f) drops the interpretation of `ℤ` in `A` from Nies's criterion

   **Location.** `README.md:1304`: "bi-interpretable with ℤ exactly when there is an interpretation of `A` in
   ℤ and a definable injection of `A` into a power of ℤ compatible with it".

   **Claim.** An "exactly when" with these two conditions.

   **Witness.** akns line 792–797 requires three things: `A` interpretable in `ℤ`, an interpretation `f` of
   `ℤ` in `A`, and an injective map `A → f*(ℤ)` definable in `A`. Instance: `A = (ℤ, +)`, generated by `1`,
   finite language. It is interpreted in the ring `ℤ` and the identity is a definable injection into `ℤ`
   compatible with that interpretation, yet `(ℤ, +)` interprets no copy of the ring `ℤ` (Presburger
   arithmetic is decidable), so it is not bi-interpretable with `ℤ`.

   **Repair.** Replace (f) by: "(f) a finitely generated structure `A` in a finite language is
   bi-interpretable with ℤ exactly when `A` is interpretable in ℤ and there are an interpretation `f` of ℤ
   in `A` and an injective map from `A` into the interpreted copy `f*(ℤ)`, or into a finite power of it,
   that is definable in `A` (Proposition 2.23 and Corollary 2.24, pp. 17–18, after Nies); and any two
   interpretations of `A` in ℤ are homotopic (Lemma 2.26, p. 18)." Add the Check: "The interpretation of
   `ℤ` in `A` cannot be dropped: `(ℤ, +)` is interpretable in the ring `ℤ` and embeds in it, but interprets
   no model of arithmetic and is not bi-interpretable with it." Tested on the instance: `(ℤ, +)` fails the
   second condition. In 7.2 the condition holds: `ℤ` is definable in `D` by 0.7(3), and the coordinate map
   is definable in `D`.

4. **F04** (P3) §0.12(a): "`E_u` has bad reduction at `v`" has no supplier

   **Location.** `README.md:385` ("then `v` ramifies in `L_u`, so `L_u` is a field and `E_u` has bad
   reduction at `v`"), *Needs:* at `README.md:403`.

   **Claim.** The *Needs:* line covers the step.

   **Witness.** The *Needs:* of 0.12 names EllipticCurves Layers 0, 1 and 5 and
   NeronModelsAndSemistableAbelianVarieties §5.2 only. The step is the criterion "good reduction implies
   unramified `T_ℓ`", statement (i) of *Néron–Ogg–Shafarevich (discrete strand)* in EllipticCurves Layer 4
   (`TauCetiRoadmap/EllipticCurves/README.md:851`); poonen_uniform line 428–429 uses it without proof.

   **Repair.** In `README.md:385` after "has bad reduction at `v`" insert "(the constant curve `E` has good
   reduction at `v` and `T_ℓ(E_u) = T_ℓ(E) ⊗ χ_u` for the quadratic character `χ_u` of `L_u/L`, on which the
   inertia group at `v` acts through `−1 ≠ 1` for an odd prime `ℓ ≠ p`; so `T_ℓ(E_u)` is ramified at `v`)".
   Add to the *Needs:* of 0.12 and to the Layer 0 Dependencies: "EllipticCurves Layer 4
   (Néron–Ogg–Shafarevich, statement (i): good reduction implies that `T_ℓ` is unramified, `ℓ` different
   from the residue characteristic)". Tested on the Check of 0.12: `κ = 𝔽₅`, `L = 𝔽₅(u)`, `v = ∞`,
   `v(u) = −1`, `y_u² = u³ + u + 1` of odd pole order three: `χ_u` is ramified at `v`, and `ℓ = 3` works.

Four new findings: S01 (P1), S02 (P2), S03 (P2), S04 (P3). The ten round-1 findings are repaired as
stated in their own terms; two of the repairs opened the new findings S01 and S04. No finding of the
last repair report was marked `not actionable in this package`, so nothing is re-raised.

## Round-1 findings at this head

| Finding | State | Witness at 518eebf |
|---|---|---|
| 1a/F01 (P1), §1.5 had no route | repaired | `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:567`: "Prove the two consequences that later layers use"; (a) by 1.2 and 1.3, (b) by coniveau and absolute purity. pop_eei2 line 420–452 and 489–494 use only these two. Its use over the auxiliary fields is S02. |
| 1a/F02 = 1b/F01 (P2), §1.4 for `d ≤ 3` | repaired, new defect | `README.md:542`: "For `d ≤ 3` the detection is Kerz–Saito's Theorem 8.1, p. 37, in its second alternative". kerz_saito line 1862 confirms the alternative and `a ≤ 4`. The inputs of that alternative for `ℓ = char` are unowned: S01. |
| 1a/F03 = 1b/F04 (P3), Poonen's Theorem 1.2 | repaired | `README.md:416`–`427` (§0.13a) and `Suggested.lean:74` `exists_formula_mem_primeField` with `[Infinite K]`; poonen_uniform line 49–51, 497–500. |
| 1b/F02 (P3), padding | repaired | `exists_formula_isAlgebraic_primeField` is absent from `Suggested.lean`; `README.md:407` reads "Prove:" and names the case `n = 1` of 0.14(b). |
| 1b/F03 (P3), prime `n` in §1.5 | repaired | `README.md:561`: "Let `n = n_K` (so `n = 2` if `char K ≠ 2` and `n = 3` if `char K = 2`)". |
| 1b/F05 (P2), function-field Brauer sequence | repaired | `README.md:99`, `509`, `600`, `1121` cite ArithmeticGaloisDuality §R02.3.2; the heading "R02.3.2 Global function fields: class-field inputs" exists at that roadmap's open head. |
| 1b/F06 (P3), `GoodIsogeny` is §5.2 | repaired, new defect | `README.md:27`, `116`, `337`, `403`, `486` cite §5.2; heading "5.2 Good reduction is isogeny invariant" exists. Dropping the Néron–Ogg–Shafarevich clause left a step of 0.12(a) without a supplier: S04. |
| 1b/F07 (P3), pinned names | repaired | `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap` at `TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean:476`; `weakApproximation_denseRange` at `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`. |

## The pass: statements, instances, values

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `kroneckerDimension` (0.1) | `𝔽₉`; `ℚ`; `𝔽₂(s,t,u)`; `ℚ̄` | `0`; `0 + 1`; `3 + 0`; `0 + 1`, not `Field.FG` | agrees with Conventions | none |
| `IsGeometricPrimeDivisor` (0.2) | `ℤ_(p) ⊂ ℚ`; `t`-adic in `ℚ(t)`; arc valuation on `ℚ(s,t)`; `⊤` in a finite field | residue char `p ≠ 0`; `1 + 1 = 2`; `1 + 1 ≠ 3`; not a discrete valuation ring | wrong models excluded | none |
| `exists_sentence_kroneckerDimension_eq` (0.8) | `n = δ`, `n < δ`, `n > δ`; `𝔽₃(t)` | `m ≤ δ` gives an anisotropic subform, `m = δ + 1` isotropic by 0.6(c) (`δ + 1 ≥ (δ − 1) + 2`, `δ + 1 ≥ δ + 1`); `(1 + i)² = 2i`, `(2i)² = −1`, `t̄⁴⁰ = (1 + i)²⁰ = (1 + i)⁴ = −1` | true | none |
| `exists_sentence_charZero` (0.10(e)) | `p = 2`; odd `p`; `Z = ∅`; `ℚ` | `2 = 0`; `s = 2·((p+1)/2)s`; `∅ = 2∅`; `ℤ ≠ 2ℤ` | true | none |
| `exists_formula_mem_primeField` (0.13a) | `ℚ(√2, t)`; `𝔽₉(t)`; `𝔽₂(t)`; `𝔽₉` | `ℚ`; `𝔽₃`; `𝔽₂[t] ∩ 𝔽₂[1/t] = 𝔽₂`; family empty, `𝔽₉ ≠ 𝔽₃`, excluded by `[Infinite K]` | true; poonen_uniform line 49–51 | none |
| `exists_formula_not_algebraicIndependent` (0.14) | `n = 0`; `n = 1`; `n = 2`, `(s, s²)`; finite `K`; slot count | false formula; constants; dependent; `t₁ ∈ κ`; `n + 1 ≥ (n − 1) + 2` and `n + 1 ≥ n + 1` | true | none |
| `exists_formula_isGeometricPrimeDivisor` (5.7) | `d = 0`; `d = 1`, `ℚ` and `𝔽_q(t)`; `d = 2`, `ℚ(t)`; `d = 2`, char `p`, `k₁` with `K/k₁` not smooth | no proper valuation ring; none and all; `ℤ_(p)[t]_{(p)}` has residue char `p`; a filtered fibre is a proper valuation ring containing `k₁`, a place | true as typed; route for `d = 2`, char `p`: S02 | S02 |
| `exists_formula_arithmeticNormalization` (6.9) | `(1,0)` `ℚ`; `(1,1)` `𝔽_q(t)`; `(0,0)` `𝔽₄`; `𝔽₂(t)`, `T = (t²)`; `e ∉ {d, d − 1}` | `ℤ`; `𝔽_q[t]`; `𝔽₄`; `𝔽₂[t]`; no basis, vacuous | true | none |
| `…_of_isDomain` (8.4) | `B = 𝔽₉`; `B = ℤ`; zero ring | `θ₉`; fails in `ℤ[i]`, `ℤ × ℤ`; `0 = 1` | true | none |
| `exists_sentence_realize_iff_nonempty_ringEquiv` (8.5) | `𝔽₄`; `ℚ`; `L` of char 2, `δ = 5` | `θ₄`; fails in `ℚ(i)`, `ℚ(t)`; `L` unconstrained | true | none |
| 0.5 Check | `t² = s` over `𝔽₂(s)` | coefficient field would give `π = (t − ρ)²`, value `1/2` | sound | none |
| 0.6(a), (c), (d), (e) | `X³ + sY²Z`; `⟨1,−c,t,−ct⟩`; `8⟨1⟩`; `⟨1,1,5,5⟩`; `X³ + r²Y³` | `r³ + sr = 0`; anisotropic at `n = r = 1`; anisotropic over `ℚ`; `2² + 1 = 5`; `3·ord(X) = 2 + 3·ord(Y)` impossible | sound | none |
| 0.10(d) | subfields of `ℚ(t)` of dimension one; `𝔽₅(t)` | number fields inside `κ`, union `κ`; 0.7(2) fails, union `∅` | sound | none |
| 0.11 Checks | `y² + xy = x³ + 1`, `y² + y = x³` over `𝔽₂` | `1 + 1 + 2 = 4`, trace `−1`; `1 + 2 = 3`, trace `0` | sound | none |
| 0.12 preamble, (a) | `L^{1/p}/L`; twist at `v(u) = −1` | `K[X]/(X^p − a)` reduced iff `a ∉ K^p`; inertia acts by `−1` on `T_ℓ` | sound; supplier missing | S04 |
| 0.12 Checks | `y² = x³ + x + 1` over `𝔽₅`; `P₀ = (2,1)`; `t = s²`, `b = 0` | `x = 0,2,3,4` give `2` points each, `x = 1` none: `9`, trace `−3`; `z = 1/2 = 3`, `b = 6 = 1`; `4s² + s² = 0` | sound | none |
| 0.14(b), char `p` | `(t₁, …, t_n)` with `t₁` transcendental | dependent iff `t₂, …, t_n` dependent over the closure of `𝔽_p(t₁)`; `trdeg ≤ 1 + (n − 2)` | sound | none |
| 1.2 against its supplier | `δ(K) = d`, char 0 and char `p` | `d − 1` variables over `k₁`, degree `(d − 1) + 2 = d + 1` in both | matches QuadraticFormInvariantsPartII §6.3 | none |
| 1.3 | `d = 1` henselian; `R = 𝔽_q`, `X` connected with constants `𝔽_{q′}`; dimension function | `Br(K)[ℓ] ≅ H¹(k, ℤ/ℓ)`; corestriction `H¹(𝔽_{q′}) → H¹(𝔽_q)` is an isomorphism, `KH₀ = ℤ/ℓ`; generic point has dimension `(d − 1) + 1 = d` | matches kerz_saito line 1852–1862 | none |
| 1.4 | `d = 1, 2, 3`; `d = 4`, `ℙ⁴`; `ℓ = 2` over `𝔽₂` | `(G)_{2,−1}`, `(G)_{2,0}`, `(G)_{2,1}`, `q ≤ 2` by line 1571; `a = 4 ≤ 4`; admissible is automatic over a field (line 508–510) | citation sound; inputs unowned | S01 |
| 1.5(a) | `k = ℚ(i)`, `𝔭 = (1 + i)`; `K = ℚ(x)`, `α = (−1)³`; image of `x′` | `2v(4) = 8 > 2v(2) = 4`; residues `0`, `H³(ℚ₂^h) = 0`, `α ≠ 0` at `ℝ`; horizontal or generic point of the fibre, `e = 1` | sound | none |
| 1.5(b) | `x₀` on a singular `{x}⁻` | purity is applied at the regular `𝒳`, not at the closure | sound | none |
| 1.6(d) | split and division over `K̂_x`; dyadic vertical `x` | every `c` a norm, class `0`; `char K̂_x = 0`, (b) applies | sound | none |
| 2.1, 2.2, 2.4 Checks | `(21, −1)`, `(7/3, −1)`; `⟨1,1,−3,−3⟩`; `a₀ = 3`, `a₁ = 145` | `(−1, 21)₂ = +1`, `v₃ = −1` odd; `3` not a norm from `ℚ₃(i)`; `145 = 2·72 + 1`, `3` nonsquare mod `5` | sound | none |
| 3.2, 3.4, 3.7 against §6.5 | folds `d + 1`, `2`, `d` over fields of dimension `d`, `1`, `d − 1` | each is `r + 1` with `r` the Kronecker dimension, the form of the supplier's statement | sound | none |
| 3.5 | all lower values `0`; some `w̃(a_j) > 0` | `w̃(a_d) ≥ 0` and not all zero, so `> 0`; `2NΣ ≥ 2N w̃(a_j) > N w̃(a_j)` | strict | none |
| 3.7 | `𝔭` prime | `w(a_d) ≤ N(w(x) + w(y)) ≤ 2N max`; `1 ∉ 𝔭` as `w(a_d) > 0` | sound | none |
| 5.5 | `x ∗ 1`, `x ∘ 2`; Hensel at `1`; `c = 0` | `x`, `x`; `v(β − 1) > 2v(c_n) ≥ 2v(n)`; `u₀ = u_{α,0} = 1`, field `K` | sound; pop_eei2 line 475 has the printed `2v(2n)` | none |
| 5.6(c) | `(1 + a)(1 + b)`; `𝔽₅(s)`, `b′ = 2s` | `1 + b + x − b = 1 + x`; `−1/3 = 3 ≠ 0` | sound | none |
| 5.6(b) through Lemma 4.3(3) | `u = x^p − a` over `𝔽_q(a)(x)` | minor `4wy = 0` at `y = 0`, local ring regular | hypothesis of 1.5 fails for `K_{u,α,c}` | S02 |
| 6.4, 6.5, 6.7 | `e = 0`; chain of dimensions; `(s + 2)/3` | empty intersection `K`; `e + 1, e, …, 2`, `e` applications; `s ↦ −1`, numerator `1` | sound | none |
| 7.1(f) | `(ℤ, +)` | interpretable in `ℤ`, identity injective, no interpreted arithmetic | false as worded | S03 |
| 7.2, 7.3 | `𝔽₂[t, t⁻¹]`; `ℤ[√5, t]`; `𝔽_p[s, t]` | `t² − st + 1 = 0`; core `ℤ[√5]`, conductor `(2)`; core `𝔽_p[t]` | sound | none |
| 8.3, 8.4 | `ℤ/4`; finite `B` among finitely generated rings | fails the field conjunct; `θ_q` forces a field with `q` elements | sound | none |
| gap:finite-field-divisor-adapted-fibration, route | pencil `f − tg` | `g/f` regular forces a constant; fibre at `t = 0` smooth, non-smooth locus closed and proper over `ℙ¹` | route consistent; declared gap, not raised | none |

Elaborated signatures: the ten elaborated types of the worker's file were compared with the README
statements one by one; no binder is lost and nothing changed (every theorem binds its fields inside the
statement). No Lean was run in this pass.

Dependency check output:

```text
depcheck: 242 roadmaps, 2280 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

- Declarations read: 10 of 10 (2 definitions with real bodies, 8 `sorry`'d theorems). Single
  `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, a docstring on each; every Lean name
  occurs in the README. No padding: none follows from the pins or from another declaration in one step.
- Headline theorems (Summary and Layers 0, 5, 6, 7, 8): fixed Kronecker dimension, the characteristic
  sentence, the prime subfield, algebraic dependence (with the constant field as its case `n = 1`),
  geometric prime divisors, the normalization formula, the domain sentence, the field sentence: all
  stated. Bi-interpretability with `ℤ` and the characteristic-two cases above dimension three are named
  in the module docstring as not statable. The principles of Layer 1 are inputs of the route.
- Targets read: all 75 numbered sections, with Conventions, supplier contracts and every *Needs:* line.
- Locators verified against the cached texts in this pass (31): kerz_saito line 105–126, 288, 369–406,
  464–474, 498–515, 741–760, 837–845, 1562–1574, 1576–1589, 1819–1862, 1963–2003; pop_eei2 line 238–268,
  272–299, 334–349, 377–455, 469–506, 508–520, 546–603, 607–633, 646–697, 699–752; poonen_uniform line
  49–51, 110–124, 420–431, 436–452, 497–503; akns line 783–797, 834–840; rumely line 22–32;
  cossart_jannsen_saito line 131–134; stacks line 2239–2241. All agree with the README except as S03 says.
- Checks tested with computed values: about 45 (the table shows the values); none false or vacuous; every
  definition (0.1, 0.2, 0.3, 2.1, 2.6, 3.3, 4.1, 4.2, 4.3, 4.4, 5.5, 6.1, 6.5) has at least three.
- Sibling and main citations checked at the cited roadmap's head or on main (23): LefschetzPencilsAndVanishingCycles
  §0.10 and §3.5; PadicDifferentialEquationsAndRigidCohomology §RD.7.7; AdicCoefficientsAndComparisonsPartII
  §§0.12, 6.8, 6.10 of its Layers PA.0 and PA.6; NeronModelsAndSemistableAbelianVarieties §§5.1, 5.2 and
  `GoodIsogeny`; ArithmeticGaloisDuality §§R02.3.2, R02.4.4; QuadraticFormInvariantsPartII §§2.5, 3.1,
  3.9, 4.2, 4.3, 5.7, 6.3, 6.5, 7.2 (6.3 and 6.5 read in full: hypotheses match the uses in 1.2, 3.2, 3.4,
  3.7); CrystallineCohomology §§CR.4.7, CR.4.8 on main (read: S01); EllipticCurves Layers 4 and 5 on main
  (read: S04). The citations found sound by the round-1 passes and untouched by the repair were not
  re-read.
- Pinned names: `Field.FG` (`Mathlib/Algebra/Field/Subfield/Basic.lean:458`),
  `algebraicIndependent_unique_type_iff` (`Mathlib/RingTheory/AlgebraicIndependent/Transcendental.lean:38`),
  the two approximation theorems of 1b/F07, and the four `TauCeti.Place` lemmas
  (`TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:130`, `145`;
  `Consequences/HighDegree.lean:247`; `Consequences/StrongApproximation.lean:88`). The pins contain no
  Kronecker dimension and no bi-interpretation.
- Declared gaps (5): the slugs of `design/plan.json` and of the README agree; each names a supplier and
  a section; cossart_jannsen_saito line 131–134 is the statement asked for; none asks for what is
  provided. Not raised.
- Ownership against open pull requests, by object, over main and the open heads: no roadmap states the
  Kato complex or Kato homology, Jannsen–Saito–Sato duality, purity or localization for logarithmic
  Hodge–Witt sheaves, or Pop's shifted-ring construction. This roadmap is their owner.
- Policy: the pull request changes only the package folder; no pull-request number, process word or
  machine path in the README, the Lean file or `sources.toml`; `plan.json` differs from the design only
  in its `gaps` list.

## Not verifiable

- kato_hasse, merkurjev_suslin, moret_bailly, lenstra_cm: uncertified, cited by locator only.
- Jannsen–Saito–Sato, Suwa, Gros–Suwa and Colliot-Thélène–Sansuc–Soulé (S01): not in the manifest; only
  Kerz–Saito's citations of them were read.
- The Stacks chapters Commutative Algebra and Resolution of Surfaces: the cached `stacks` text is the
  Varieties chapter; their tags were not re-read in this pass.
- Whether the published versions of poonen_uniform and pop_eei2 correct the points under Source issues:
  only the cached versions were read.
- Whether Pop's Lemma 4.3(3) can be proved in positive characteristic without the base change of S02:
  not decided; the repair does not depend on it.
- Elaboration of `Suggested.lean`: not rerun; the worker's elaborated signatures were used.

## Source issues

- **Gap** in pop_eei2 at Lemma 4.3(3), printed p. 2105: the source defines the good open set of the model of the auxiliary field as for a smooth curve; it should first pass to a purely inseparable constant extension, since in positive characteristic that field need not be smooth over its constants; affects the proof.
- **Misprint** in pop_eei2 at Notation/Remarks 3.5, printed p. 2102, and Recipe 5.1(1), printed p. 2109: the source bounds the congruence by twice the value of `2n`; it should use `n` in characteristic two, where `2n = 0`; affects a stated result.
- **Error** in poonen_uniform at Lemma 4.8, printed p. 9 (arXiv v1): the source takes the sums of two `z`-values inside the field and tests the form over it; it should take them in the quadratic extension and test there; affects a stated result.
- **Error** in poonen_uniform at Lemma 4.8, printed p. 9 (arXiv v1): the source builds the first parameter set from the `x`-coordinate; it should use `y/x`, whose pullback by a separable endomorphism has a simple pole at kernel points; affects the proof.

Source independence: 16 passages compared with 6 sources (kerz_saito, pop_eei2, poonen_uniform, akns, rumely, cossart_jannsen_saito), none shared beyond statements that a list of hypotheses forces (longest run 7 words, the conclusion of Corollary 0.4 of cossart_jannsen_saito, line 133–134); largest share dittmann_pop, 68 of about 283 source citations in the README; contents compared with dittmann_pop (its §§1–5): independent — Layer 0, §§5.4–5.6 and §§7.1–7.4 have no counterpart there, its §3 is split over Layers 2–3 and its §4 over Layers 4–5, and the order of the layers is forced by the *Needs:* lines (3.1 needs 1.2–1.4; 4.6 needs 3.8; 5.2 needs 4.7; 6.4 needs 5.7; 7.6 needs 6.9; 8.5 needs 7.6); no table, figure or list is taken over.

## For the human reviewers

- **Scope.** `README.md:379`–`400` and `README.md:1097` replace printed statements of poonen_uniform (Lemma 4.8) and pop_eei2 (Notation/Remarks 3.5) by corrected versions of the roadmap's own; S02 adds a third correction, to pop_eei2 Lemma 4.3(3). No refereed source states them.
- **Scope.** S01: the characteristic-two cases for `d ≤ 3` rest on `p`-adic results (Jannsen–Saito–Sato, Suwa, Gros–Suwa) that no roadmap plans; the repair makes this roadmap their owner.
- **Not tested.** kato_hasse, merkurjev_suslin, moret_bailly and lenstra_cm are cited by locator only (`sources.toml`: uncertified); 1.5 (background statement), 1.6(b), 0.9(a) and 0.11(b) rest on them.
- **Licence.** `sources.toml` records achter_casalaina_vial with the year 2026 (Annales de l'Institut Fourier 76); only arXiv:2210.05017v3 was read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "518eebfb01697023a1cd9d7a925ece9211a52e57", "job": "RT-LogicAndDefinabilityInNumberTheoryPartII~2b", "model": "fable", "worker": "chris-x80"} -->
