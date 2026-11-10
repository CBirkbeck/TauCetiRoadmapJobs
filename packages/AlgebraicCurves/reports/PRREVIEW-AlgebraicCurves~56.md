# Review of AlgebraicCurves (pull request #1807 at b0d6406)

**Verdict:** needs changes

This head repairs all five findings of the previous review; see the first table under Verified sound. The findings below come from a full re-review of the folder: one P2 (the generality of the Layer 11 headline) and six P3.

## R01 (P2) — The Layer 11 finiteness headline is narrowed to perfect fields

**Location.** `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 71–73: "`[Algebra k F] [PerfectField k] (hF : TauCeti.IsFunctionField k F)`". README §11.4, lines 1918–1919: "over a perfect field `k`, a function field with exact constants and genus `g ≥ 2` has finitely many `k`-automorphisms".

**Claim.** Perfectness is used in exactly one place. Route step 1 (lines 1928–1931) needs the genus to stay `g` after passing to `k̄`. Rosenlicht's §3 argument proves finiteness whenever the genus survives that passage, over any field. The headline therefore leaves out every smooth curve over an imperfect field, for example every good-reduction curve over `𝔽_q(t)`, which is the main positive-characteristic arithmetic setting. The source supports the general form, and the principles ask for the general statement.

**Witness.** Take `y² = x⁵ − 1` over `k = 𝔽₃(t)`. It has exact constants (there is a rational place at `∞`) and genus 2. Its model is smooth, so the genus stays 2 over `k̄`, and `Aut` is finite. The headline does not apply because `𝔽₃(t)` is imperfect. The source is `Rosenlicht1955` lines 200–212 (p. 5): an exceptional field becomes rational over `k̄`.

**Repair.**

1. **`Suggested.lean`.** State the general theorem as the Layer 11 headline. It elaborates at the pins with only the `sorry` warning:

   ```lean
   theorem finite_algEquiv_of_genus_constantCompositum_eq {k : Type u} {K : Type u'} {F : Type v}
       {F' : Type v'} [Field k] [Field K] [Field F] [Field F'] [Algebra k K] [Algebra k F]
       [Algebra k F'] [Algebra K F'] [Algebra F F'] [IsScalarTower k K F'] [IsScalarTower k F F']
       [IsAlgClosed K] (hF : TauCeti.IsFunctionField k F) (hex : IsIntegrallyClosedIn k F)
       (hc : TauCeti.constantCompositum F K F' = ⊤)
       (hgK : TauCeti.genus K F' = TauCeti.genus k F) (hg : 2 ≤ TauCeti.genus k F) :
       Finite (F ≃ₐ[k] F) :=
     sorry
   ```

   This needs `universe u u' v v'`. The theorem is true: an automorphism `σ` of `F` extends to `F′ = F·K` because `σ ⊗ id` preserves the unique minimal prime of `F ⊗[k] K`. Then Rosenlicht's §2 Theorem applies to `F′/K`. If `F′` degenerates to `K`, its genus is 0, so `hgK` fails.

2. **README §11.4.** Make this the headline, with locator Rosenlicht 1955, §3, p. 5, together with §2, Theorem, p. 4. Keep the perfect-field theorem as its corollary, with `F′ := Frac(F ⊗[k] k̄)`:
   - `F′` is a domain by `TauCeti.isDomain_tensorProduct_of_separating`;
   - its genus is `g` by `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`.

   In a scratch copy, the perfect case follows from the general statement by the term `finite_algEquiv_of_genus_constantCompositum_eq hF hex hc (TauCeti.genus_eq_genus_of_constantCompositum_eq_top hF hex hc) hg`. It elaborates with 0 errors.

**Tested on the refuting instance.** `y² = x⁵ − 1` over `𝔽₃(t)` meets the new hypotheses. Rosenlicht's `y⁵ − y = a x⁵` over a separably closed imperfect field fails `hgK` (genus `0 ≠ 6`), so it stays excluded.

## R02 (P3) — The §11.4 route uses pinned algebraic-group and rigidity results its *Needs:* line does not name

**Location.** README lines 1936–1942 (steps 3–4: "a closed subgroup `G′` of `PGL_{5g−5}` … whose identity component `G` has finite index"; "the rigidity of morphisms from `G × X` to an abelian variety"). The *Needs:* line is at lines 1948–1953, and step 1 cites "§8.2, the smooth-model branch".

**Claim.** Step 3 consumes the `PGL` group scheme and identity components, and step 4 consumes the rigidity lemma. None of them appears among the *Needs:*. Step 1's genus equality is pinned directly for separable algebraic constant extensions, which needs no smooth model.

**Witness.**

- `TauCeti.ProjectiveGeneralLinear.groupScheme` (`TauCeti/Algebra/AlgebraicGroup/ProjectiveGeneralLinear/Basic.lean:132`);
- `TauCeti.HopfAlgebra.identityComponentHopfIdeal` (`Connected/Comultiplication.lean:213`);
- `TauCeti.AlgebraicGeometry.eq_snd_comp_lift_comp` (`AlgebraicGeometry/Rigidity.lean:191`);
- `TauCeti.genus_eq_genus_of_constantCompositum_eq_top` (`ConstantExtension/Genus/Basic.lean:273`), which assumes only `[Algebra.IsSeparable k k′]`.

**Repair.**

1. Add the four names above to the §11.4 *Needs:* line.
2. In step 4, say that rigidity is applied with the proper curve as the first factor to `(P, σ) ↦ φ(σP) − φ(P) − φ(σP₀)`. This map vanishes on `X × {e}`, so it is identically `0`, which gives Rosenlicht's identity.
3. In step 1, cite `TauCeti.genus_eq_genus_of_constantCompositum_eq_top` (`k̄/k` is separable for perfect `k`).
4. State whatever of step 3 the pin lacks as a §11.4 target: the projective transformations that preserve the tricanonical image form a closed subgroup scheme of `PGL_{5g−5}` whose identity component has finite index (Rosenlicht 1955, §2, second Lemma, pp. 3–4).

## R03 (P3) — Layer 6 says Hilbert's different formula does not consume perfectness; §8.7's own Check refutes this

**Location.** README lines 941–943: "by an audit of which proofs consume it, Thm. 3.1.11, Thm. 3.3.7, Def. 3.4.3, Thm. 3.4.6, Thm. 3.4.13, Thm. 3.5.10 and Thm. 3.8.7 do not".

**Claim.** Thm. 3.8.7 fails without separable residue extensions, and perfect `k` is what supplies them. §8.7 correctly assumes residue separability, as does the pinned `TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one` (`Different/Hilbert.lean:155–159`). The audit sentence is therefore false for Thm. 3.8.7.

**Witness.** The §8.8 `V₄` example over `k = 𝔽₂(s, u)` (lines 1392 and 1410–1414):

- `G₀ = V₄` and `G₁ = 1`, since `v(σy − y) = v(t) = 1`;
- the Hilbert sum is `3`, while `d = 1 + 1 = 2`.

**Repair.** Delete "Thm. 3.8.7" from the list. Alternatively, say that it consumes perfectness only through separability of the residue extension, which §8.7 assumes.

## R04 (P3) — §8.1 item 2 and §12B.0a state the same target and cite each other

**Location.**

- §8.1, lines 1218–1219: "prove the induced scalar maps, linear disjointness and `[F : k(x)] = [F_K : K(x)]`".
- §12B.0a, lines 2052–2058: "Prove the regular-field equivalence of §8.1 item 2 … `[F : k(t)] = [F_K : K(t)]`".
- The *Needs:* lines at 1231 ("§12B.0 for item 3") and 2097 ("§8.1").
- "How to read the build", line 297: "the early model of §12B.0 needs Layer 2 only".

**Claim.** One target is stated in two layers. The two sections' *Needs:* lines point at each other, which makes a two-way edge between Layer 8 and Layer 12. The build paragraph contradicts §12B.0's own *Needs:* (Layers 0, 2, 3, 4–5 and §8.1).

**Witness.** The two quoted equalities are the same statement with `x` renamed `t`. Line 1231 has §8.1 citing §12B.0, and line 2097 has §12B.0 citing §8.1.

**Repair.**

- State the regular-extension targets once, in §8.1 item 2, and have §12B.0a cite them.
- Split §12B.0's *Needs:* per sub-item:
  - the core model: Layers 0 and 2;
  - 12B.0a–b: §8.1 item 2;
  - 12B.0c: Layers 3–5.
- Make "How to read the build" give the item order: §8.1 items 1–2, then §12B.0, then §8.1 item 3, then §§8.2 and 8.5.

## R05 (P3) — The cited Mathlib ramification API is deprecated at the pin, and the README reverses which name replaces which

**Location.** README lines 185–190: "`Mathlib/NumberTheory/RamificationInertia/`: `Ideal.ramificationIdx`, `Ideal.inertiaDeg` and `Ideal.sum_ramification_inertia` … Their docstrings announce replacement by `ramificationIdx'` and `inertiaDeg'`". §6.3, lines 988–991, relies on `Ideal.sum_ramification_inertia`.

**Claim.** At the Mathlib pin that module is deprecated. `Ideal.sum_ramification_inertia` is deprecated too, and it is stated in terms of the primed `ramificationIdx'` and `inertiaDeg'`. It is the new unprimed `Ideal.ramificationIdx` that replaces the primed one, not the reverse.

**Witness.**

- `Mathlib/NumberTheory/RamificationInertia/Basic.lean:44` has `deprecated_module "Use RingTheory.RamificationInertia.Basic" (since := "2026-07-01")`.
- `Basic.lean:607–610` has the deprecated theorem with `ramificationIdx'`.
- `Mathlib/RingTheory/RamificationInertia/Ramification.lean:53` says `Ideal.ramificationIdx` "will eventually replace … `Ideal.ramificationIdx'`".

**Repair.**

- Cite `Mathlib/RingTheory/RamificationInertia/` with `Ideal.ramificationIdx`, `Ideal.inertiaDeg` and `Ideal.sum_ramification_inertia_eq_finrank`. The last is at `RingTheory/RamificationInertia/Basic.lean:73` and assumes `S` finite and flat over a domain `R`, which holds for `R_x ⊆ R′_x`.
- Say that the `NumberTheory` module is deprecated.
- Delete the replacement sentence.
- In §6.3, use `Ideal.sum_ramification_inertia_eq_finrank`.

## R06 (P3) — §2.3 equates Stichtenoth's holomorphy rings with Mathlib's `Set.integer`, but the two index `S` in opposite ways

**Location.** README lines 534–535: "Holomorphy rings `𝒪_S` (Stichtenoth §3.2) are then Mathlib's S-integers `Set.integer`."

**Claim.** The two notions index `S` in opposite ways:

- `𝒪_S = ⋂_{P∈S} 𝒪_P` consists of the elements integral at `S` (§6.4, line 1007).
- `Set.integer S K` consists of the elements integral outside `S`, over the height-one primes of a single Dedekind chart.

**Witness.** `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65–68`. On `k(x)` with `S = {P_x}`, `𝒪_S = k[x]_(x)`, while `Set.integer {(x)}` for `R = k[x]` is `k[x][1/x]`.

**Repair.** Write: "for `x` with no pole in `S`, `𝒪_S = Set.integer (T) F` with `R = R_x` and `T` the height-one primes of `R_x` outside `S`". Checked: `S = {P_x}`, `x = X` gives `T` = all primes but `(X)`, and `Set.integer T = k[X]_(X)`.

## R07 (P3) — Renaming the Layer 8 heading drops an anchor that ArithmeticDynamics cites

**Location.** README line 1196: "## Layer 8: constant-field extensions, Galois ramification, and inseparability". On main the heading ends with "inseparability ⚠".

**Claim.** The renamed heading changes the anchor, and no old-to-new mapping is given.

**Witness.** ArithmeticDynamics at the head of #1335 cites `AlgebraicCurves §layer-8-constant-field-extensions-galois-ramification-and-inseparability-` at lines 345, 409, 5601 and 5864. This head generates the anchor without the trailing hyphen. Every other anchor it cites (Layers 0–3, 6, 7, 11 and 12) is unchanged.

**Repair.** Add one mapping sentence, for example in "How to read the build": "The anchor `#layer-8-constant-field-extensions-galois-ramification-and-inseparability-` of the former Layer 8 heading is now `#layer-8-constant-field-extensions-galois-ramification-and-inseparability`."

## Verified sound

**Previous review (62d686c): finding by finding.**

| Id | Passage at this head | Status |
|---|---|---|
| R01 | `Suggested.lean` docstring lists the pinned headlines by name. README line 18: "its module docstring names the headlines that the Tau Ceti pin already proves". Route (lines 40–45): "The pinned Tau Ceti also carries the scheme side". §§8.1, 8.2, 8.5, 9.3, 11.2–11.4, 12B, 12C and 12E cite each name the repair listed. | repaired |
| R02 | `Suggested.lean` line 71 states `[PerfectField k]`, every characteristic. The scope exclusion (lines 80–81) keeps only "the quantitative positive-characteristic automorphism bounds". | repaired, beyond what was asked; R01 above asks for more |
| R03 | `Suggested.lean` has one declaration, which does not close in one tactic (probe below). | repaired |
| R04 | Line 217 `WeierstrassCurve.Affine.FunctionField`; line 1675 `W.toAffine.FunctionField`; line 1627 `…/Elliptic/Weierstrass/Equation.lean`; `Curves/`; LocalFieldsRamification linked with Layer 3 (lines 71 and 151). | repaired |
| R05 | House headings, `**Summary.**`, *Needs:* lines, three Checks per subsection, `### Examples` and `### Dependencies` in every layer. A grep for process and time words finds nothing. The §3.6 quotation is paraphrased (lines 1198–1200). | repaired |

**Gate, dependency check, build.**

- The worker's gate at b0d6406: every check 0, `build=0`, `OK`.
- My gate run (`--base origin/main`): every check 0 except `outside-folder=26`. All 26 paths are in the 13 folders the brief names as this pull request's own. `git diff --stat` over every other path is empty.
- Depcheck: `depcheck: 236 roadmaps, 2296 edges, 0 problem(s)`, with no UPWARD and no CYCLE line. The same check on JacobianChallenge and SchemeAndStackFoundations also reports 0 problems.
- `lake env lean` on `Suggested.lean`: one warning, `71:8 declaration uses sorry`.

**Signatures.** `#check @TauCetiRoadmap.AlgebraicCurves.finite_algEquiv_of_two_le_genus` in a scratch copy gives `∀ {k F} [Field k] [Field F] [Algebra k F] [PerfectField k], IsFunctionField k F → IsIntegrallyClosedIn k F → 2 ≤ genus k F → Finite Gal(F/k)`. This matches README §11.4, and no binder is lost.

**Padding probe.** `infer_instance` fails (no instance), `simp` makes no progress, and the pinned `TauCeti.finite_algEquiv_of_two_le_genus` fails (`IsAlgClosed k` cannot be synthesized). The declaration is not padding.

**Names and paths at the pins.**

- Dotted backticked names: 263 `#check`s with 0 errors. The only warning is the deprecation behind R05.
- Unprefixed tokens: 130. Every library identifier among them resolves. The misses are mathematical variables, this roadmap's own `finite_algEquiv_of_two_le_genus`, and Tau Ceti's `AbelianVariety` (`AlgebraicGeometry/AbelianVariety/Basic.lean:95`).
- File paths: all 34 `Mathlib/…` and `TauCeti/…` paths exist. 19 Mathlib names have the file attribution the README gives them, including `ClassGroup.equivPic` in `PicardGroup.lean` and Ostrowski in `NumberTheory/RatFunc/Ostrowski.lean`.

**Pinned statements compared with the README's description.**

| Declaration and location | What the README says, confirmed at the pin |
|---|---|
| `Divisor.degree_principal` (`ProductFormula.lean:255`) | no exactness |
| `Divisor.classGroupHom` / `ker_classGroupHom` (`AffineModel.lean:210`) | every Dedekind `R` in a tower; kernel is the closure of the non-integral places |
| `degreeZeroClassGroupEquiv` | single place of degree 1 |
| `Divisor.two_mul_dim_le_degree_add_two` (`Clifford.lean:317`) | exact, `0 ≤ deg ≤ 2g − 2`, no `[Infinite k]` |
| `genus_le_genus_of_constantCompositum_eq_top` (`Genus/Basic.lean:243`) | algebraic `k′/k`, no exactness |
| `genus_eq_genus_add_finsum_singularityDegree` | exactness on both sides, `[F′:F] = [k′:k]` |
| `hurwitz_genus_formula` (`Hurwitz.lean:72`) | cross-multiplied form |
| `Place.ramificationIdx_le_differentExponent_add_one` | separability of `F′/F` only |
| `exists_isWeierstrassCoordinates_of_genus_eq_one` (`Weierstrass/Equation.lean:343`) | exact, genus 1, degree-1 place |
| `WeierstrassCurve.Affine.genus_functionField` | `[IsElliptic]` |
| `genus_eq_of_sq_eq` | `2 ≠ 0`, squarefree, ℕ-division `(m − 1)/2` |
| `genus_eq_of_isHomogeneous` (`PlaneCurve/Projective.lean:643`) | homogeneous of degree `d`, nonsingular over an algebraically closed `K` |
| `natCard_le_eighty_four_mul_genus_sub_one` (`HurwitzBound.lean:83`) | tame over `F^G` |
| `_of_not_dvd`, `card_algEquiv_…_of_charZero` | as the README describes |
| `eq_one_of_two_mul_genus_add_three_le_card` | as the README describes |
| `finite_algEquiv_of_two_le_genus` (`HigherGenus.lean:124`) | `IsAlgClosed`, gaps distinct in `k` |
| `finsum_traceResidue_…` (`Independence.lean:386`) | as the README describes |
| `SchemeWeilDivisor.genus_eq_genus_functionField` (`SerreDuality.lean:245`) | as the README describes |
| `isDomain_tensorProduct_of_separating` (`Separable/Regular.lean:142`) | as the README describes |
| `Place.differentExponent_eq_finsum_…` (`Hilbert.lean:159`) | residue separable |

**Cross-roadmap citations resolved.**

- **JacobianChallenge (main).** It cites no AlgebraicCurves. The layers resolve:
  - Layer A at line 111;
  - Layer B at line 135 (`χ = deg + 1 − g`, `g = dim H¹`, Serre duality);
  - Layer E at lines 332 and 343–349 (`JacobianVariety` on `AbelianVariety`, `dim Jac X = g`);
  - Layer F at line 448 (Abel–Jacobi and the Albanese property);
  - Layer C is excluded, as the README says.
- **FormalLaurentPuiseux (main).** L1 at line 70, L2 at 112, and L3 at 140–157 (residue invariance under coordinate change in all characteristics).
- **LocalFieldsRamification (Completed).** Layer 3 at line 724, Herbrand at 878, Hasse–Arf at 1022.
- **SchemeAndStackFoundations (this head).** §4.15 at line 5538 has `Mbar.aut_finite` and `isom_stable_curves`, which is DM (1.11). The supplier contract at line 548 consumes AlgebraicCurves Layers 3, 4, 7, 8, 10 and 12.
- **EllipticCurves (main).** Lines 118, 357–377, 597–619 and 1615–1621.
- **BelyiMaps (main).** 9.1 at line 2847 and 10.6 at line 3476. Its "Layer 8" wording predates this pull request: 12B.0d is already on main.
- **ModularForms.** Lines 58–64.
- **Consumers.**
  - On main: EtaleCohomologyFoundations (Layers 8 and 12), ModularCurves (Layers 7–9 and 12), AlgebraicVectorBundles, AbhyankarLemma.
  - Open: FunctionFieldArithmetic #1474 (line 37), CurvesOverFiniteFields #1729 (line 1078), HyperellipticCurves #1707 (line 96), CanonicalModelsAndGonality #1726 (lines 28, 85 and 107).

**Ownership and overlaps.**

- `roadmaps grep` for the automorphism finiteness theorem, Rosenlicht and `84(g − 1)` across main and the open heads finds only consumers.
- GroupActionsOnRiemannSurfaces #1728 (line 342–344) cites AlgebraicCurves Layer 12 for the compact-Riemann-surface dictionary, which the README excludes (lines 84–85). That drift is on #1728's side.
- RamificationOfCompleteDiscretelyValuedFields #1410 owns separable-residue local filtrations, while §8.8 owns fierce complete-DVR differents. AlgebraicCurves is on main and so is earlier.
- #1808 and #1854 conflict with this head. This description says no open pull request precedes it and that #1808 follows, so the order is stated.
- No cited id is dropped by an open pull request. The one id this pull request drops is R07.

**Sources checked against the text.**

- `Rosenlicht1955`:
  - §2 first Lemma at lines 54–106 (pp. 2–3, tricanonical, `5g − 5`);
  - second Lemma at lines 107–139 (pp. 3–4, identity component of `G′`);
  - Theorem at line 140 (p. 4, algebraically closed `k`, `g > 0`);
  - §3 at lines 193–212 (p. 5) and its Theorem and converse at lines 406–420 (p. 10);
  - the `y^p − y = a x^p` example, genus `(p − 1)(p − 2)/2`, at lines 425–429.
- `DeligneMumford1969`: Theorem (1.11) at line 368, printed p. 84.
- `Fulton2008`: k algebraically closed and char 0 at lines 80–83; §8.3 Prop. 5 at 3937–3939; the nonsingular genus `(n − 1)(n − 2)/2` at line 3997 (p. 112); §8.5 Prop. 8 at line 4122.
- `Stacks`: 09GI at line 379 (algebraic elements form a subextension).

**Adversarial table.**

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Lean headline (perfect `k`) | `ℂ(x)`; `E/ℂ`; `y²=x⁵−1/ℚ`; `y³+y=x⁴/𝔽̄₃`; `y⁵−y=ax⁵` over separably closed imperfect `k`; `y²=x⁵−1/𝔽₃(t)` | `g=0`: `PGL₂(ℂ)` infinite, `hg` fails. `g=1`: `E(ℂ)` infinite, `hg` fails. `g=2`: finite. `g=3`, gaps `{1,2,5}`, `2=5` in `𝔽₃`, `|PGU₃(3)|=27·28·8=6048`. `g=6` infinite, perfectness fails. `g=2` finite but not covered | true; narrowed | R01 |
| 2 | Rosenlicht §3 example | `p=5`, `p=3` | genus 6, 1. Quintic regular at `[1:a^{1/5}:0]` (max ideal `(Z)`). `w=y−a^{1/p}x` gives `w^p=y`, `Fk̄=k̄(w)`, genus 0 | holds | none |
| 3 | Proposed general headline | `y²=x⁵−1/𝔽₃(t)`; `y⁵−y=ax⁵` | hypotheses hold (`g(F·k̄)=2`), finite. `hgK`: `0≠6` fails | consistent | R01 |
| 4 | §0.3 `ord` | `k(X)`, `P_X` | `ord X=1`, `ord(X²+X)=1`, `ord X⁻¹=−1`, `v(X)=exp(−1)`. `2·ord` not surjective | holds | none |
| 5 | §1.1 places | `𝔽₂`; `ℝ` | `P_X`, `P_{X+1}`, `P_∞`: `3=2+1`. Degree 2 ⇔ `b²<4c` | holds | none |
| 6 | §1.2 orders | `(X²+1)/X³` over `ℚ` | `ord_∞=−(2−3)=1`, `ord_X=−3`, `ord_{X²+1}=1`: `1−3+1·2=0` | holds | none |
| 7 | §2.3 charts | `y²=x³−x`; `y²=x⁴+1` | one place over `∞`, `ord x=−2`, `ord y=−3`, `ord(x/y)=1`. `(y/x²)²=1+x⁻⁴→1`: two places, `ord x=−1` | holds | none |
| 8 | §2.3 `Set.integer` | `k(x)`, `S={P_x}` | `𝒪_S=k[x]_(x)`; `Set.integer {(x)}=k[x][1/x]` | mismatch | R06 |
| 9 | §3.2 product formula | `ℂ(x)/ℝ`; `y²=x³−x` | `2−2=0` without exactness. `P−O` principal ⇒ `[F:k(f)]=1`, contradiction | holds | none |
| 10 | §3.4 genus junk | `ℂ(x)/ℝ` | `deg−ℓ+1=2(deg_ℂ−ℓ_ℂ)+1≤−1`; pinned genus 0 | holds | none |
| 11 | §3.6 bridge | `y²=x⁴+1/ℚ` | `ord_{∞₁}(y−x²)=−2+4=2`, `ord_{∞₂}=−2`; `2([∞₁]−[∞₂])=0` | holds | none |
| 12 | §4.1 filtration | `D=−P_∞` | `v(0)=0≤exp(−1)` holds; the additive form with `ord 0=0` would demand `0≥1` | holds | none |
| 13 | §4.4 Riemann–Roch | `ℙ¹`, `n=−2`; `W₀=0` | `0=−2+1−0+ℓ(0)`. `W₀`: `1≠2` | holds | none |
| 14 | §5.2 genus zero | `x²+y²=−1/ℝ` | all places even degree, no degree-1 divisor | holds | none |
| 15 | §5.4 gaps | `y²=x⁵−1` at `∞` and `(0,i)` | `⟨2,5⟩`: `{1,3}`. `0⁵−1=−1=i²`: `{1,2}` | holds | none |
| 16 | §5.6 class number | `y²=x³−x/𝔽₃` | `x³−x≡0` on `𝔽₃`, `N₁=4=h` | holds | none |
| 17 | §7.3 cotrace | `k(x^{1/4})/k(x)`; `y²=x` | `d=3=2·1+1`; `−4P′_∞+P′₀+P′_∞`, degree `−2=2·0−2` | holds | none |
| 18 | §7.4 Hurwitz | `y²=x³−x`; `y²=x⁵−1`; `y²+y=x³/𝔽₂` | `0=−4+4`; `2=−4+6`; `dt=(w²/z²)dz`, `d=6−2=4`, `0=−4+4`; tame count `−3` is odd | holds | none |
| 19 | §8.4 Clifford | `y²+y=x⁵/𝔽₂`, `D=2P_∞` | `g=4·1/2=2`, `ℓ=2`: `4≤4`, `deg 2≤2g−2=2` | holds | none |
| 20 | §8.5 genus drop | `y²=x^p−t`; `y²=x³+a/𝔽₂(a)` | `2g−2=−4+p+1`. `u²=x−a`, `u^p=y`. `v²=x³`, `x=u²`, `v=u³` | holds | none |
| 21 | §8.7 / Layer 6 audit | `V₄` over `𝔽₂(s,u)` | `G₀=V₄`, `G₁=1`, `d=2`, Hilbert sum `3` | audit false | R03 |
| 22 | §8.1 / 12B.0a | *Needs:* lines | §8.1→12B.0, 12B.0→§8.1; the same `[F:k(x)]=[F_K:K(x)]` | duplicated | R04 |
| 23 | §6.3 Mathlib API | Mathlib pin | deprecated since 2026-07-01, stated with `ramificationIdx'` | stale | R05 |
| 24 | §10.1 elliptic | `y²=x³−x`; `y²=x³+a/𝔽₂(a)`; `y²=x³−t/𝔽₃(t)` | `Δ=−16(−4)=64`. `2g−2=−6+4+2=0`, `Δ=a₃⁴=0`. `Δ=−27b₆²=0` in char 3 | holds | none |
| 25 | §10.3 chart | 200 random rational points; `y²+y=x³` | `w f_w + z f_z − w(−2+a₁z+a₃w) = 3f` at every point. `w³·W(z/w,−1/w)=f`. Constant term `w(−1+a₃w+a₆w²)`: Eisenstein. `f_w(0,0)=1`. `(dx)=−4Q_∞+4Q_∞` | holds | none |
| 26 | §10.4–10.5 genus | `y²=x⁵−1`, `y²=x⁶−1`; Klein quartic; node | `2`; ℕ `(6−1)/2=2`; `3·2/2=3`; node `g=0`; `d=1,2` give `0` | holds | none |
| 27 | §9.3 residues | `x dx/(x²+1)`; `dx/x` | `dt/(2t)`: `1/2`, trace `1`; at `∞`: `−1`; traced sum `0`, untraced `−1/2` | holds | none |
| 28 | §11.5 Hurwitz bound | `(2,3,7)`, `(2,3,8)`; `y²=x⁶−1` | `1/42`, `1/24`; `(iy/x³)²=x⁻⁶−1`, order `24≤84` | holds | none |
| 29 | §11.6 Hermitian | `q=41, 37, 64` | `68921>68796`; `50653<55860`; `262144>169260`; translation law iff `b^q+b=a^{q+1}` | holds | none |
| 30 | §12C, §12E | `y²=x`; `ℙ¹`, `K=−2[∞]` | degree `2=[k(y):k(x)]`; `h¹(𝒪(−2))=h⁰(𝒪)=1` | holds | none |

## Not verifiable

- **`Stichtenoth2009`** is settled as uncertified, so I could not read it. This covers the sampled locators in §§0.3, 1.1, 2.3, 3.2, 3.4, 4.1, 5.2, 5.4, 7.3 and 10.1, and every other Stichtenoth locator. The numbering agrees with the pinned Tau Ceti docstrings for:
  - Thm. 1.1.6, 1.1.13, 1.2.2, 1.4.11 and 1.4.17; Cor. 1.4.12; Def. 1.5.2;
  - Prop. 1.6.3; Rem. 1.6.4; Thm. 1.6.8 and 1.6.13; Lemma 1.6.14;
  - Thm. 3.4.6; Prop. 3.4.11; Cor. 3.4.12; Thm. 3.4.13 and 3.8.7;
  - Prop. 6.1.2, 6.1.3, 6.1.6 and 6.1.7; Ex. 3.18.

  §5.2's second Check attributes the finite-field degree-one divisor to Rem. 1.6.4, but the docstrings cite Rem. 1.6.4 only for the real conic, so I could not confirm that attribution.
- **Uncertified texts, cited by locator only:** `Hartshorne1977`, `Goldschmidt2003`, `VillaSalvador2006`, `Deuring1973`, `Rosen2002`, `Serre1979`, `Roquette1970`, `Stichtenoth1973a` and `Stichtenoth1973b`.
- **Not checked:** the order `|PGU₃(3)| = 6048` in the §11.4 Check is the classical `q³(q³ + 1)(q² − 1)` and was not checked against a text.

## Source issues

- none
