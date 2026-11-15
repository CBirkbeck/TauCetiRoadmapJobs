# FIX-PKG-RealSurfacePeriodIndex~8

Resolution of the four findings of review `REV-PKG-RealSurfacePeriodIndex~7` (all P3). Only `packages/RealSurfacePeriodIndex/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

The finding is right: §0.12 stated ind(α_L) | ind(α) for finite L/K only and said nothing about the period, while §1.5 step 1 applies both divisibilities to k(X) ⊂ K(X_K) (transcendental) and §7.8 step 2 applies the index one to K_i ⊂ K (algebraic, infinite). Edits:

- §0.12 conventions: "A splitting field … (`baseChange`)" → α_L is defined for every extension L/K, finite or not, by the group homomorphism `TauCeti.BrauerGroup.baseChange`.
- §0.12 statement: "for a finite extension L/K, ind(α_L) | ind(α) | [L : K]·ind(α_L)" → "for every field extension L/K, finite or not, per(α_L) | per(α) and ind(α_L) | ind(α); for finite L/K, ind(α) | [L : K]·ind(α_L)".
- Step 3 now starts with the extension-agnostic argument and cites three pinned declarations: `TauCeti.BrauerGroup.baseChange_mk`, `TauCeti.Algebra.deg_baseChange` and `TauCeti.Algebra.index_dvd_deg`. The finite-only reverse bound follows.
- The single API bullet is split into two bullets. A new Check covers ℝ ⊂ ℝ(t) and ℝ ⊂ ℂ(t).
- §7.8 step 2 adds "(ind(α) divides ind(α_i) by §0.12, K/K_i being algebraic, possibly infinite, and α_i ≠ 0 because α ≠ 0)". Its *Needs:* line gains §0.12.

Pattern: I checked every other §0.12 use (§§0.13, 0.15, 1.6 step 4, 1.8 with its Check on ind(α_Ω), 2.8, 2.9, 2.10, 7.3, 8.10, 9.4). Each is a finite extension or a degree bound; the one infinite case, Ω in the §1.8 Check, is now covered by the extended statement. The new pinned names were added to the Tau Ceti contract, the §0.12 *Needs:* line and the Layer 0 Dependencies.

## F02 (P3) — applied

The finding is right. Main's SchemeAndStackFoundations §4.13 says regular schemes are Tau Ceti's, and the pin has `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (`AlgebraicGeometry/Scheme/Regular/Scheme.lean:90`) and the instance `isRegular_Spec` (`:118`). A scratch file elaborated `example : IsRegular (Spec (CommRingCat.of ℝ)) := inferInstance`. Edits:

- Tau Ceti contract: "regular by SchemeAndStackFoundations §4.13" → "regular by `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (line 90) …, `isRegular_Spec` (line 118)".
- §1.9 step 1: the §4.13 citation is replaced by the Tau Ceti declaration, applied to S → Spec ℝ.
- §1.9 *Needs:* the same replacement. Layer 1 Dependencies gain the name and keep §4.13, which §1.8 uses for Bertini.

The same pattern also occurred in §3.1 step 3, which cited "Serre's criterion is SchemeAndStackFoundations §4.13". Main's §4.13 hands Serre's criterion to `TauCeti.forall_isDomain_and_isIntegrallyClosed_iff_satisfiesSerreR_one_and_satisfiesSerreS_two` (pin `RingTheory/SerreCondition/Normal.lean:214`). That citation, the §3.1 *Needs:* line and the Layer 3 Dependencies now name the pinned declaration, and a Tau Ceti contract bullet records it. Layer 3 no longer cites §4.13. The SchemeAndStackFoundations contract entry for §4.13 now names only Bertini's smoothness theorem (`bertini_smoothness`, as on main), which is what §§1.8, 2.1 and 4.x use it for.

## F03 (P3) — applied

The finding is right. The pinned instance (`Mathlib/Algebra/Order/Ring/Defs.lean:107`) assumes `[NoZeroDivisors R] [Nontrivial R]`, and `IsStrictOrderedRing` extends `Nontrivial` (lines 74–76). The `#check` output confirms both binders. Change: "an ordered ring without zero divisors is strictly ordered" → "a nontrivial ordered ring without zero divisors is strictly ordered". No other paraphrase of this declaration exists; the Layer 0 Dependencies list only its name.

## F04 (P3) — applied

The finding is right: orientability plays no part in the Picard correction. Change: the Check "If S(ℝ) is orientable and every class … Picard correction" → two Checks.

1. S = ℙ²_ℝ with the Hamilton class. H²_G has four elements, two of them lifts of α: ξ₀ = π*ω², with components (1, 0, 0), and ξ₀ + κ(O(1)), whose first component is h. So the condition holds on the nonorientable ℝℙ², ind = per = 2, and it asks for some lift, not every lift.
2. When cl_R is onto, ξ + κ(M) with cl_R(M) = [ξ]₁ has [·]₁ = 0.

Pattern: the other "orientable" uses (§9.6 step 3, the §9.9 Check "w₁ = 0 and a = [α̃]₁ always works", Theorem 0.6 in §9.10) concern real Enriques surfaces, where im cl_R = w₁^⊥ (MotivesAndAlgebraicCycles §7.10). There orientability is exactly what makes cl_R onto, so they are correct and unchanged.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.12 per(α_L) \| per(α), any L/K | ℝ ⊂ ℝ(t), ℝ ⊂ ℂ(t) (Hamilton); K = L; α = 0 | 2 \| 2; 1 \| 2; equality; 1 \| 1 | true; `baseChange` is a `MonoidHom` (`#check`) |
| §0.12 ind(α_L) \| ind(α), any L/K | ℚ̄(x,y) ⊂ ℂ(x,y), (x,y); Albert class over ℝ(x,y) ⊂ ℂ(x,y); ℍ over ℝ(t) | 2 \| 2; over ℂ(x,y), (x,x) = (x,−1) = 0 and (y,xy) = (y,x) ≠ 0, so per = ind = 2 \| 4; 2 \| 2 | true |
| §0.12 step 3 route | D = ℍ, L = ℂ and L = ℝ(t) | deg_L(L ⊗ ℍ) = 2 (`deg_baseChange`); index 1 \| 2 and 2 \| 2 (`index_dvd_deg`) | sound; binders of the three names checked |
| §0.12 reverse bound, finite only | ℝ ⊂ ℂ, Hamilton; ℝ ⊂ ℂ(t) | 2 \| 2·1; [L : K] infinite, and the bound is not stated (read as `finrank` = 0 it would be the empty 2 \| 0) | scoped correctly |
| §0.12 new Check | ℝ(t) real, so ⟨1,1,1,1⟩ is anisotropic; ℍ ⊗ ℂ ≅ M₂(ℂ) | ind 2 and 1 | consistent with statement |
| §7.8 step 2 parenthetical | K_i = ℝ(x,y), K = ⋃_m ℝ(x^{1/2^m}, y), α_i = (x, y) | α = α_K = 0 (x is a square in K); ind(α) = 1 \| 2 = ind(α_i) | divisibility holds; "α_i ≠ 0 because α ≠ 0" goes in the stated direction only (here α_i ≠ 0, α = 0) |
| §7.8 conclusion | α ≠ 0 in Br(K)[2], ind(α_i) = 2 | ind(α) \| 2 and per(α) = 2 \| ind(α), so ind(α) = 2 | sound |
| Contract: regular via `IsRegular.of_smooth` | ℙ²_ℝ → Spec ℝ; quadric cone xy = z²; Spec ℝ[ε]/(ε²) | smooth over regular Spec ℝ (instance elaborated), coheight ≤ 2 everywhere, so UFD stalks; cone not smooth at the vertex, and its stalk is not a UFD (xy = z²); ℝ[ε]/(ε²) not smooth, not regular | sound; matches the §1.9 negative control |
| §3.1 Serre criterion | z² = xy (A₁); z² = x²y | hypersurface CM ⇒ S2; singular locus is the origin, codimension 2 ⇒ R1 ⇒ normal; singular along the line x = z = 0, codimension 1, R1 fails, normalisation z/x | consistent with "rs vanishes to order 1" |
| Contract: `IsOrderedRing.toIsStrictOrderedRing` | zero ring; ℤ; ℝ[ε]/(ε²) | zero ring excluded by nontriviality; ℤ strict; ℝ[ε]/(ε²) has zero divisors, excluded | paraphrase now equals pinned binders |
| §7.7 Check 1 | ℙ²_ℝ, Hamilton class | Pic/2 = ℤ/2, Br[2] = ℤ/2, \|H²_G\| = 4 (equivariantly formal: H² ⊕ H⁰·ω²); lifts (1,0,0) and (1,h,·); ind(ℍ ⊗ ℝ(x,y)) = 2 | sound |
| §7.7 Check 2 | ℙ¹ × ℙ¹ over ℝ, S(ℝ) = T²; n odd | cl_R(O(1,0)), cl_R(O(0,1)) span H¹(T², 𝔽₂) = 𝔽₂²; n odd: the condition is vacuous | sound |
| SchemeAndStackFoundations §4.13 contract wording | main §4.13 text | `bertini_smoothness`: general member of a very ample (immersive) system on a smooth variety over an infinite field is smooth | matches main |

## Checks

- **Elaboration.** `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout (file unchanged): exit 0, eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else. All imported Tau Ceti object files were present; nothing was built.
- **`#check @name`.** I copied `Suggested.lean` into a scratch file, appended `#check @name` for all nine declarations and elaborated it once. Every binder of the README statements is present: `[IsAlgClosed k] [CharZero k]`, `[IsRealClosed R]`, `[Algebra.EssFiniteType _ K]`, the `trdeg` and `¬ IsSemireal K` hypotheses, `[Invertible 2]` and `[FiniteDimensional K V]`. Nothing changed.
- **Pinned declarations.** A second scratch file confirmed `index_dvd_deg`, `deg_baseChange`, `baseChange_mk`, `baseChange` (a `MonoidHom`), `IsRegular.of_smooth`, `isRegular_Spec`, the Serre criterion and `IsOrderedRing.toIsStrictOrderedRing`, and `IsRegular (Spec ℝ)` by `inferInstance`.
- **Dependency check.** Whole output:

      depcheck: 244 roadmaps, 2247 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **`roadmaps resolve`.** It reports no cross-roadmap citation and no Lean name found nowhere. `bertini_smoothness` resolves to main's SchemeAndStackFoundations §4.13.
- **No gate failures** were listed for this round.

## For the maintainer

- No Lean name changed, and no supplier gap or plan entry changed. Every new supplier citation is a pinned Tau Ceti declaration, so no roadmap edge was added.
- The SchemeAndStackFoundations §4.13 edge remains, for Bertini only. Layer 3 no longer depends on §4.13.
- No construction was added, so the ownership question does not arise. The "For the human reviewers" items of the review (Tsen–Lang ownership against QuadraticFormInvariantsPartII, the scope of the Proposition 4.4/4.5 replacement, licences) were not acted on, as instructed.
- Nothing suspicious was found in the review text.
