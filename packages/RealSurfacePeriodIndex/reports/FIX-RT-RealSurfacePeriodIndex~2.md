# FIX-RT-RealSurfacePeriodIndex~2: red-team round 2 repaired

Files changed: `packages/RealSurfacePeriodIndex/README.md`, `packages/RealSurfacePeriodIndex/Suggested.lean` (two section comments only), `packages/RealSurfacePeriodIndex/sources.toml` (the EL73 entry). `design/plan.json` and `metadata.toml` are unchanged: no supplier gap was added.

## RT-RealSurfacePeriodIndex~2a/F01 (P3) — applied

Change: §0.14 step 3 "Becher's argument (§3) produces … Albert form" → own proof. A = φ′ ⊥ ⟨ad⟩ with d = −det φ is a torsion Albert form. If it were isotropic, ρ ≅ r₁π with π universal (I³F torsion-free), giving φ ≅ π ⊥ ⟨−ad, a⟩, which is isotropic. *Needs:* gains QuadraticFormInvariants Layers 0 and 1. One universality Check added; §0.15's locator adjusted.

Evidence: BEC05 line 102–104 and line 118–119 assume the Albert form; lines 110–117 build one only from a non-universal ⟨1, 1, −a, −ad⟩.

## RT-RealSurfacePeriodIndex~2a/F02 (P3) — applied differently

Change: §0.14 "u(F) ∈ {0, 1, 2, 4, 6} (EL73, cited by locator)" → "u(F) ≤ 6, hence …". EL73 now supplies only u ≤ 6, as recalled in BEC05 §1 p. 1 (line 23–28) and §3 p. 3 (line 102–103). Step 2 derives the values: parity for real F, EKM Corollary 36.4 (line 8879) for nonreal F. The References line and the manifest locator now say this.

Why differently: the clause "the text not having been read" is process narrative and stays out of the README; `version_note` records that the theorem number is unknown. EL73 is settled uncertified, so it is not requested again, and one web search found no legal source giving the number.

## RT-RealSurfacePeriodIndex~2a/F03 (P3) — applied

Change: §0.13 *Needs:* gains "QuadraticFormInvariants Layer 0; QuadraticFormInvariants Layer 2".

Pattern: a script compared every *Needs:* line with the supplier sections its body cites, and I read each hit. The others are Check-only comparisons (§0.7, §1.6), §6.11's description of hypotheses that §6.12 consumes, or false matches on full stops.

## RT-RealSurfacePeriodIndex~2a/F04, RT-RealSurfacePeriodIndex~2b/F07 (P3) — applied

Change in `Suggested.lean`:
- line 62 → `/-! ## Layer 0: real function fields: orderings, real closures, Brauer index and the Elman–Lam invariant -/`
- line 97 → `/-! ## Layer 7: period equals index: the main theorems and the u-invariant -/`

Both are the README headings word for word. No declaration changed.

## RT-RealSurfacePeriodIndex~2b/F01 (P2) — applied differently

Change: §2.2 defines κ_b as the connecting map of the fibre tangent sequence. It equals the PELModuli M2.10 Kodaira–Spencer class up to the dualisation sign (BEN18 line 268–269). It also defines the contraction, states Griffiths' formula up to sign, and adds a base-change API bullet. Checks: κ_b = 0 for a product family; rank 19 for quartics. §4.7 step 1 uses the reviewer's naturality argument. PELModuli is added to contracts, Scope, *Needs:* and Dependencies.

Why differently: nothing on main defines the map (ComplexCurveModuli covers curves only), but PELModuli M2.10, earlier in the merge order, owns it, so it is cited rather than defined again. The sign is pinned.

## RT-RealSurfacePeriodIndex~2b/F02 (P2) — applied

Change: §6.7 statement → own wording: fixed data; for every even l ≥ l₀ (l₀ depending on A, N, ι, 𝒰) some ι′ ∈ 𝒰 and t satisfy (1) real zero set ι′(𝒮), (2) smooth there, (3) rt negative off Ξ (§6.1). Step 3 now obtains l₀ from AlgebraicModuliForArithmeticGeometry §1.4; the API bullet matches.

Pattern: an n-gram scan of the README against B19 (runs of 8 or more words) finds only §6.7 and §9.10 following a source clause by clause; the remaining runs are hypothesis lists.

## RT-RealSurfacePeriodIndex~2b/F03 (P2) — applied

Change: §9.10 → "Some class of Br(S) has index different from its period exactly when both halves are nonempty and S(ℝ) has a nonorientable component (…; with source correction E25)". The context line explains why the source's extra case is empty (§9.8). The proof is a four-case split, adding §9.3 to *Needs:*. New Checks: the four-ℝℙ² surface from §5.5 (the halves condition is needed) and spheres or tori (nonorientability is needed).

## RT-RealSurfacePeriodIndex~2b/F04 (P3) — applied

Change in §1.8 step 3: "Blowing up a coherent ideal … resolves them" → the cover is étale off {s_t = 0}; that divisor is reduced (no vertical component, reduced on the general fibre), so the singular locus has dimension ≤ 1. Field resolution (ResolutionOfSingularitiesCharacteristicZero §7.8, `exists_resolution`) then preserves the generic points of the fibre components. "Blow-up" → "resolution"; §7.8 is added to *Needs:* and the Layer 1 Dependencies.

## RT-RealSurfacePeriodIndex~2b/F05 (P3) — applied

Change in §7.9: the two Checks are replaced, using coordinates u, v. Corrected w′: y₁ ≡ 2(1 + i)v and y₂ ≡ −2(1 + i)v − 2(u² + 1), determinant 4(1 + i). With w itself: y₂ ≡ −y₁. In general the determinant is 2(1 + i)(α₁ + α₂ + 2(1 + i)). The source excludes only two points of the bad line, and the pair it excludes, z₁ = u² + 1, z₂ = v, works.

## RT-RealSurfacePeriodIndex~2b/F06 (P3) — applied

Change in the §2.1 Check: "graph-like section family" → a member of |H| is {t₀a₀ + t₁a₁ = 0}. Its fibre is [a₁(s) : −a₀(s)], or ℙ¹ over the A² base points, so T_b is the blow-up of S there and p_b is birational of degree 1. For ℙ² with O(1) it is the bidegree (1, 1) divisor.

## Checks run

- **Elaboration.** `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout: exit 0, eight warnings `declaration uses 'sorry'` (lines 82, 91, 103, 114, 125, 135, 145, 158), no errors.
- **Signatures.** I put `#check @name` for all nine declarations in one scratch copy and elaborated it once. Every elaborated type keeps its binders: `Invertible 2`, `FiniteDimensional`, `EssFiniteType` where the README has finite generation, the trdeg hypotheses, and `¬IsSemireal`. They match the README statements and the supplied signature transcript. No declaration changed.
- **Dependency check.** The brief's command printed:

      depcheck: 263 roadmaps, 2557 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The new edge is PELModuli M2.10; PELModuli is at line 116 of the merge order and this roadmap at line 229.
- **Citations.** `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures.** The worker's check reported `tex=6`: TeX-style `_{…}` subscripts outside code spans. All six came from text added in this round: three on the PELModuli contract line (the M2.10 extension `0 → f*Ω¹_{S/U} → Ω¹_{X/U} → Ω¹_{X/S} → 0`), one in §2.2's statement (`Ω¹_{𝒯/B}`) and two in §2.2's base-change API bullet (`κ_{b′}`, `dg_{b′}`). Each subscripted term is now a code span, which is the README's existing convention (`T_{B,b}`, `O_{T_b}`). No wording or mathematics changed. Running the gate's own TeX scanner on the README now gives 0 hits. The dependency check was re-run after the edit and gave the same output as above: `depcheck: 263 roadmaps, 2557 edges, 0 problem(s)`. `Suggested.lean` was not touched, so the elaboration result above stands.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.14 step 3, A = φ′ ⊥ ⟨ad⟩ | signed discriminant; Witt difference | det A = det φ·d = −d², signed discriminant d²; A − φ = ⟨−a, ad⟩ = −a⟨1, −d⟩ | torsion Albert form | new text |
| §0.14 step 3, ρ similar to a Pfister form | ρ = ⟨r₁, r₂, r₃, r₄⟩ with r₁r₂r₃r₄ a square | r₄ ≡ r₁r₂r₃; r₁ρ = ⟨1, r₁r₂, r₁r₃, r₂r₃⟩ = ⟨1, −x⟩⊗⟨1, −y⟩ with x = −r₁r₂, y = −r₁r₃ | holds | new text |
| §0.14 step 3, universality | π ⊗ ⟨1, −z⟩ ∈ I³ torsion | = 0 in W(F); π ⊥ −zπ hyperbolic; equal dimension 4 gives π ≅ zπ; π(1, 0, 0, 0) = 1 gives z ∈ D(π) | holds | new text |
| §0.14 step 3, contradiction | cancellation of ⟨ad⟩ | φ′ ⊥ ⟨ad⟩ ≅ ⟨ad, −ad⟩ ⊥ π gives φ′ ≅ ⟨−ad⟩ ⊥ π; φ ≅ π ⊥ ⟨−ad, a⟩, π(v) = −a gives π(v) + a = 0 | φ isotropic | new text |
| §0.14 step 3, degenerate cases | F nonreal; √−1 ∈ F | no orderings, so ⟨1, −d⟩ is torsion because all forms are; √−1 ∈ F gives u(F) ≤ 4, so the case u = 6 is empty | holds | none |
| §0.14 new Check | π = ⟨1, −(1 + x²), −y, y(1 + x²)⟩ over ℝ(x, y) | π(x, 1, 0, 0) = x² − 1 − x² = −1; π(0, 0, x, 1) = −x²y + y + x²y = y | as predicted | Check added |
| §0.14 values | real F; nonreal F | real: signature 0 at P and signature ≡ dim mod 2, so dim is even; nonreal: EKM 36.4 excludes 3, 5, 7; with u ≤ 6 the set is {0, 1, 2, 4, 6}; ℂ: u = 1; ℝ: u = 0 | holds | narrowed |
| §0.15 step 1 | u(K) = 5 | excluded by the value set: odd values above 1 never occur | holds | wording |
| §2.2 κ_b, product family | T × B | `T_𝒯|_T` = T_T ⊕ T_B ⊗ O splits, connecting map 0 | κ = 0 | Check |
| §2.2 κ_b, quartics | T ⊂ ℙ³ of degree 4 | h⁰(O(4)) = 35, so `T_{B,b}` has dimension 34; H⁰(T_{ℙ³}) has dimension 4·4 − 1 = 15; Euler sequence twisted by −4: H⁰(O(−3)⁴) = H¹(O(−3)⁴) = 0 and H¹(O(−4)) = H²(O(−4)) = 0, so H⁰ = H¹ = 0 for T_{ℙ³}(−4); H⁰(T_T) = 0; rank 34 − 15 = 19 < h¹(T_T) = h^{1,1} = 20 | rank 19 | Check |
| §2.2 sign | dual extension | BEN18 line 268–269: dualising negates the class; boundary is cup with the class | κ_b = −(M2.10 class) under BEN18's cocycle convention | stated up to sign |
| §4.7 step 1 | lifts (v, ξ), (v, ξ′) | they differ by ξ − ξ′ ∈ T_T, so the map on quotients is well defined; a direction where T does not move gives normal field 0 and κ = 0 | naturality holds | new text |
| §6.7 l₀ | choices of steps 1–2 | D′ is fixed once ι′, H, h₁, h₂ are; A ample, so `A^{l/2}` ⊗ N(−R − D′) is very ample for all large l/2 | "every even l ≥ l₀" holds | wording |
| §6.7 Check Ξ = S(ℝ) | (3) | no real point outside Ξ | only (1), (2) remain | none |
| §9.10 | 4 × ℝℙ² in one half | §9.9 gives ind = per; old condition: 4 even, so false | agree | Check |
| §9.10 | spheres and tori | §9.6 gives ind = per | agree | Check |
| §9.10 | two halves, nonorientable | §9.7 gives index 4 = 2·per | agree | none |
| §9.10 | S(ℝ) = ∅; period 1 or 4 | §9.6, §7.4; ind(0) = 1; §9.4 index 4 | no class | none |
| §1.8 step 3 | l = 2, s₀ = s₁ = x | s_t = x(t²x + (1 − t)²); singular along x = 0, t = 1, a curve; at the generic point of z = ±x over t = 1, z ≠ 0, étale | resolution keeps it | new text |
| §1.8 vertical components | t = c ∉ {0, 1} | s_c = c^l s₁^l + (1 − c)^l s₀ ≠ 0, since the divisors D + E and l(D + E′) differ | no vertical component | new text |
| §7.9 Check 1 | 𝔪 = (u² + 1, v) | [z₂] = −[v] − ((1 − i)/2)[u² + 1], independent of [z₁] with determinant (1 − i)/2; y₂ ≡ −2(1 + i)v − 2(u² + 1); det(y₁, y₂) = 4(1 + i) | parameters | Check |
| §7.9 Check 2 | w = u | [u² + 1] = −(1 + i)([z₁] + [z₂]); det = c(α₁ + α₂ + c) = 0 with c = 2(1 + i); y₁ + y₂ ∈ 𝔪² | fails as stated | Check |
| §7.9 Check 2, excluded pair | z₁ = u² + 1, z₂ = v | α = (1, 0); det = (3 + 2i)·2(1 + i) ≠ 0 | parameters | Check |
| §2.1 Check | general pencil | fibre over s is [a₁(s) : −a₀(s)]; over the A² base points it is ℙ¹; ℙ², O(1): A² = 1 | blow-up, degree 1 | Check |

## Ownership and overlaps

- **Kodaira–Spencer.** The owner is PELModuli M2.10, cited by section. It is an open roadmap that adds a new folder and is earlier in the merge order. No declaration of `Suggested.lean` was added or renamed.
- **New statements.** The Albert-form step (§0.14) and the field-resolution step (§1.8) use existing suppliers: QuadraticFormInvariants Layers 0, 1 and 4 on main, and ResolutionOfSingularitiesCharacteristicZero §7.8 on main.
- **Overlaps.** `scratch/overlaps.md` lists no open pull request changing this roadmap and no dropped id.

## For the maintainer

- **New supplier.** This roadmap now cites PELModuli M2.10, an open roadmap earlier in the merge order. The dependency check accepts the edge; the pull request's merge-order paragraph may need to name PELModuli.
- **No ids moved.** No section ids or Lean names of this roadmap changed. §§6.7 and 9.10 keep their numbers and say the same mathematically: §9.10's criterion is equivalent to the source's by §9.8.
- **EL73.** Still cited without a theorem number. Whoever holds the text can supply it; it is settled as uncertified and was not requested again.
- **Review text.** Neither review contains instructions addressed to the worker; nothing suspicious was found.
