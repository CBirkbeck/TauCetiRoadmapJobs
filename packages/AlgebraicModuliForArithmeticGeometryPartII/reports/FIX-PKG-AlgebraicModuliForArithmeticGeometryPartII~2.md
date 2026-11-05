# FIX-PKG-AlgebraicModuliForArithmeticGeometryPartII~2

Files: `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md` (README), `.../Suggested.lean`, `.../sources.toml`, `.../design/plan.json` (top-level `gaps` only). One review was given; its ten findings are settled below in its order (its summary calls them R01–R10).

## F01 (P2) — applied differently

Old: the docstring said numerical Néron–Severi and relative finiteness had no carrier. New: `RelNumericallyTrivial` (§0.4), `numericallyTrivialClasses` and `relNumericallyTrivialClasses` (§1.1), `numericalClassGroup_free_finite` (§1.2) and `relNumericalClassGroup_free_finite` (§1.3) are stated. Both headlines use the same closure construction, with a named relative subgroup.

Differences from the suggested repair:
- **Docstrings.** The generated subgroup is described by its closure. The claim that it equals Pic^τ is a §1.1 API bullet, because it rests on §0.4's subgroup theorem and is not definitional.
- **Étale bound.** I did not write that the bound ρ ≤ dim H²_ét(X, μ_ℓ) "lacks étale cohomology". Mathlib has the small étale site (`AlgebraicGeometry.Scheme.smallEtaleTopology`, `Mathlib/AlgebraicGeometry/Sites/Etale.lean` line 50) and site cohomology (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`), so that claim would be false at the pin. The bound is a step in the proof of §1.2, not a headline, and stays a README target.
- **Pattern repair.** The docstring no longer lists "numerical Picard rank" as missing for the AHK rank. The cone sentence now names the curve-class space, its cones and the restriction map.

## F02 (P2) — applied

Old needs: a compound "Chow-cover and stratification reduction … detects the relative numerical kernel". New needs, in README and `plan.json`: finitely many points s₁…s_n such that L has degree zero on every integral curve in every fibre exactly when it does over s₁…s_n. The §1.3 route is rewritten as an injection Num(X/S) ↪ ⊕ Num(X_{s_j}) (finite free by §1.2), and the Euler-polynomial witness is added to the gap line.

## F03 (P2) — applied differently

- **(i)** Applied, with two changes:
  - The bound is stated as C·m^(n−1) for n ≥ 1, which avoids the junk exponent m^(−1) at n = 0, where π is an isomorphism.
  - The ≤ direction and the slack are both needed. For the normalization P¹ → nodal cubic and L of degree 3: h⁰ = 3m on the cubic against 3m+1 on P¹.
- **(ii)** The repair said "nef L". That is this roadmap's §1.5 notion, so asking an earlier supplier for it would recreate the defect. It is stated instead as "nonnegative degree on every integral curve". Growth is "along m divisible by some a", matching §1.6's definition.
- The comparison with `bigLineBundle` is now a §1.6 API bullet. §1.6 also gains "L big iff π*L big", and its route is written out.

## F04 (P3) — applied

- §2.4: the node id → ComplexComparisonPartII §C3.2d.4 `picard_brauer_obstruction` over T = Spec k.
- §5.3: the node id → AlgebraicModuliForArithmeticGeometry §7.3 `picard_infinitesimal_lifting`. Both were resolved at their heads (ComplexComparisonPartII README line 2010, under the heading at 2009; AlgebraicModuliForArithmeticGeometry line 9265, under §7.3 at 9173).
- Scope, the JacobianChallenge/StableReduction contract and the §0.1 route no longer attribute the length-weighted law to J-A2. It is now §0.1's own law, with locator STACKS Lemma 33.44.6, tag 0AYW, Varieties line 4474.

## F05 (P3) — applied

- §0.3: KLE05 Theorem 6.3 → line 2498.
- §5.1: HW23 lines 90 and 111; the proof of (2a) → line 1513. The same "line 1520" occurred in §1.4 (formerly §1.2) and §5.4 and is corrected there too.
- §5.6: Proposition 2.51 → BMP23 line 1177 (second assertion) and Proposition 9.16(a) → line 4789, p. 106. Both are presented as three-dimensional counterparts, and the lemma is proved here from §3.2.
- §5.9: AHK07 §1, p. 2, line 63.
- §2.12: WIT22 p. 34.
- Suggested.lean: SCH23 p. 7.

## F06 (P3) — applied

- §3.1 → "SchemeAndStackFoundations §§2.6, 4.9".
- §3.5 → "§§0.9, 0.11, 0.23, 2.6".
- The repeated items in §0.1 and §2.3 are removed.

Same padded block elsewhere:
- §1.2 → §§2.1–2.2, 2.11, 2.15
- §2.2 → §§2.1–2.2, 2.6, §4.9 and AlgebraicVectorBundles L1A–L1B
- §2.3 → §§2.1–2.2, 2.10–2.11, 2.15, 2.22
- §2.4 → §§2.1–2.2, 2.11
- §2.9 → §§2.1–2.3 (torsors are §2.3)
- §5.3 → AlgebraicModuliForArithmeticGeometry §7.3 only

## F07 (P3) — applied

The second line of each listed pair is deleted. The same pattern was found and removed in a few more places:
- §0.2: two repeats.
- §0.3: the generic-line pair is merged into one Check.
- §0.4: "identity X = S".
- §1.2: the P⁰/P¹ repeat.
- §3.6: "k′ = k".
- §5.1: the P⁰_R line, which repeats 𝒳 = S.
- §5.4: the identity-family line is merged.

Every definition keeps at least three Checks (§1.6, §2.8, §2.11 and §5.1 keep exactly three).

## F08 (P3) — applied

- **Scope and §3.2** now say how §3.2 differs from StableReduction Layer 2 contraction descent: it tests integral curves in fibres and assumes O_Y ≅ f_*O_X only, not universally.
- **Scope and §3.8** cite StableReduction Layer 2 for the scheme case of (i). §§5.3–5.4 now cite StableReduction Layer 2 in their routes and *Needs:* lines instead of §3.8.
- **§0.1's comparison** is now described as `c1_degree_curve` applied over κ(s), plus the length-weighted law.

## F09 (P3) — applied

- **New Layer 1 order:**
  - §1.1 Num
  - §1.2 Néron–Severi (formerly §1.3)
  - §1.3 relative finiteness with ρ(X/S) ∈ ℕ (formerly §1.4)
  - §1.4 N₁/NE (formerly §1.2)
  - §1.5 nef
  - §1.6 big
- **Moves and deletions.** ρ ∈ ℕ and the ρ Checks moved from §1.1 to §§1.2–1.3. The "Hence g* …" sentence in §0.6 is deleted.
- **Cross-references updated** in §§1.1–1.5, 2.6, 5.1, 5.2, 5.8, 5.9, the Layer 1 and Layer 2 Dependencies, the EtaleCohomologyFoundations contract and `sources.toml` `cited_for`.

## F10 (P3) — applied

None of the four names occurs on main, in any of the 352 open heads, in any board package or in `ORDER.txt`. Scope now describes those topics as outside the roadmap without naming owners. Downstream consumers keeps only EnriquesSurfacesAndIntegralNonexistence and K3SurfacesAndSymplecticBoundedness.

## Checks

- **Elaboration.** `lake env lean` on Suggested.lean, run from the content checkout: only five `declaration uses sorry` warnings, at lines 86, 97, 112, 134 and 158.
- **Policy.** No `set_option`, `lemma`, `#eval` or sorry'd data, and a single `import Mathlib` plus the two existing `TauCeti.*` imports.
- **Binder audit.** A scratch file with `#check @name` for all 10 declarations was elaborated once. Every elaborated type matches its README statement:
  - `[IsProper f]` is present on `RelNumericallyTrivial` and `relNumericallyTrivialClasses`.
  - `[IsProper f] [AlgebraicGeometry.IsNoetherian S]` is present on `relNumericalClassGroup_free_finite`.
  - The five existing declarations are unchanged.
- **One-tactic probe.** `first | infer_instance | simp | trivial` fails on the new freeness goal, so the new theorems are not padding.
- **Dependency check output:** `depcheck: 48 roadmaps, 533 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- **Citation resolver.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name found nowhere.
- **Library names added to the README, checked at the pins:**
  - `Scheme.Hom.fiber`, `fiberι` and `fiberToSpecResidueField` (`Mathlib/AlgebraicGeometry/Fiber.lean` lines 37, 40, 45).
  - The `IsProper (pullback.snd f g)` instance (`Morphisms/Proper.lean` line 82).
  - `AlgebraicGeometry.IsNoetherian` (`Noetherian.lean` line 277).
- **Gate failure tex=5 (TeX-only brace subscripts outside code).** There were five hits:
  - §0.1 proof route: `deg_κ(L|_{C_i}) = deg(c₁(L) ∩ [C_i])`.
  - §1.3 proof route, three hits: `L ↦ (L|_{X_{s_j}})_j` and `Num(X/S) → ⊕_j Num(X_{s_j}/κ(s_j))`.
  - §1.3 Noetherian Check: `S = Spec ∏_{n∈ℕ} k`.

  Each formula is now in a code span, with the mathematics unchanged and no other text edited. Running the gate's own scanners on the README gives tex=0, latex=0 and residue=0. After the edit the dependency check again gives `depcheck: 48 roadmaps, 533 edges, 0 problem(s)`. Suggested.lean is unchanged, so its elaboration result above still stands.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `RelNumericallyTrivial` | f = 𝟙 S; P¹_k → Spec k; pr₁ : P¹×P¹ → P¹; Bl_x(P¹_R) → Spec R | 𝟙: fibres Spec κ(s), no curves, every L holds; P¹: O(m) degree m, holds iff m = 0; pr₁: O(a,b) has degree b on every fibre, holds iff b = 0; Bl: O(E) generic degree 0, degree −1 on E, fails | sound; all fibres needed | none |
| `numericallyTrivialClasses` | X = ∅; P¹; elliptic E/k̄ | ∅: Pic = 1, quotient 0; P¹: set {[O]}, quotient ℤ; E: set = Pic⁰(E), quotient ℤ | sound | docstring does not claim set = subgroup |
| `relNumericallyTrivialClasses` | 𝟙 S; pr₁; Bl_x(P¹_R) | ⊤, quotient 0; classes with b = 0, quotient ℤ; aH+bE trivial iff a = 0, −b = 0, a+b = 0, quotient ℤ² | sound | none |
| `numericalClassGroup_free_finite` | ∅; Spec k; P¹_ℂ over ℝ; P¹×Spec k[ε]; E/k̄; Enriques | 0; 0; Pic ℤ, ℝ-degree 2d, Num ℤ; Pic = ℤ ⊕ H¹(O)ε = ℤ, Num ℤ; E(k̄)×ℤ → ℤ; ℤ/2 killed, ℤ^10 | sound | stated |
| `relNumericalClassGroup_free_finite` | S = ∅; 𝟙 S; Bl_x(P¹_R); S = Spec ∏_ℕ k (excluded) | 0; 0; (a,b) ↦ (a, −b, a+b) injective, rank 2; Num(P¹_S/S) = C(βℕ, ℤ) = bounded sequences, not finitely generated | sound; Noetherian needed | stated; negative-control Check added in §1.3 |
| Gap relative-numerical-component-reduction | Spec k; 𝟙 S; Bl_x(P¹_R); xy = tz² family; P¹⊔P¹ | n = 1; n = 0; closed point needed (O(E): −1 on E); smooth total space, O(L₁) degrees (−1, 1) at t = 0, trivial generically; O(1)⊔O(−1) degree 1, Euler 2n+2 = χ(O(n)) on two lines | sound | restated |
| Gap proper-bigness-birational-comparison | Bl_p P² → P², O(1); P¹ → nodal cubic, degree 3; n = 0 | (m+1)(m+2)/2 on both, (π*H)² = 1 = H²; 3m vs 3m+1, difference 1 ≤ C·m⁰, degrees 3 = 3; π iso | sound; ≤ and slack both needed | restated |
| Gap projective-nef-big-criterion | O(1) on P²; O(1,0) on P¹×P¹; Spec K; H+E on Bl_p P² (excluded) | 1 > 0 and h⁰ ≥ m²/2; 0 and h⁰ = m+1; [K:k] > 0 and h⁰ = [K:k]; (H+E)² = 0 but h⁰ ≈ m²/2, (H+E)·E = −1 | sound; curve-nonnegativity needed | restated |
| §1.6 L big iff π*L big | nodal cubic normalization | 3m vs 3m+1, both linear | sound | added |
| §1.3 route injection | Bl_x(P¹_R) with s₁ = η, s₂ closed | (a,b) ↦ (a; −b, a+b), kernel 0 | sound | rewritten |
| §1.3 Check ρ(X/S) ≤ ρ(X/k) | P¹×P¹ → P¹ over k | 1 ≤ 2; surjection Num(X/k) ↠ Num(X/S) via §0.5 | sound | none |
| §0.1 length law | double line V(y²) ⊂ P² | χ(O_C(1)) = 1+2 = 3, χ(O_C) = 0+1 = 1, degree 2 = 2·1 | sound | locator 0AYW |
| §0.1 finite pullback | z ↦ z² on P¹ | deg π*O(1) = 2 = 2·1 | sound | route via `proper_pushforward` |
| §0.1 restriction of scalars | P¹_ℂ over ℝ | dim_ℝ = 2 dim_ℂ, so degree 2·1 | sound | none |
| §5.6 descent | pr₁, O(a,0); E → Spec k, O(p−q) | M = O(a), m = 1; numerically trivial, infinite order, no power is a pullback | sound | citations restructured |

## Ownership and notes for the maintainer

- **Ownership by object.** Searched for numerical triviality, Num, Néron–Severi and the relative Picard rank on main and all open heads.
  - SchemeAndStackFoundations §5.10 `Num.free_finiteRank` (smooth projective surfaces over algebraically closed fields) and AbundanceStatement §4B (projective, characteristic zero) are special cases. §1.2 now says so.
  - No other roadmap owns the general proper-field or relative versions, so this roadmap owns them.
  - No `Suggested.lean` name occurs in any other roadmap.
- **Section renumbering.** Layer 1 sections 1.2–1.4 are renumbered. No roadmap on main or at an open head cites this roadmap, so no citation elsewhere breaks.
- **Names for other roadmaps.**
  - New Lean names: `RelNumericallyTrivial`, `numericallyTrivialClasses`, `relNumericallyTrivialClasses`, `numericalClassGroup_free_finite`, `relNumericalClassGroup_free_finite`.
  - The three restated gaps keep their slugs; their supplier contracts with AlgebraicModuliForArithmeticGeometry §1.6 and SchemeAndStackFoundations §5.3 changed wording.
- **No suspicious instructions** were found in the review text. No source text was missing, and no `needs-references.toml` was written.
