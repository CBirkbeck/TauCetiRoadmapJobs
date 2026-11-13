<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6858225014 -->
Red team round 1 pass b (claude) of 5df5bbf

Verdict: needs_changes

1. **F01** (P2) Layers 8–11 reproduce the section list of FSY's appendix

   **Location.** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:830` (Layer 8), `:869` (Layer 9),
   `:948` (Layer 10), `:978` (Layer 11); also `:638` (Layer 6).

   **Claim.** The layers are the roadmap's own organisation.

   **Witness.** FSY has the largest share of locators (37 of about 166). Its appendix contents are FSY lines
   45–51. By number only:

   | Roadmap | FSY appendix | Targets ↔ statements |
   |---|---|---|
   | Layer 6 (6.1–6.5) | A.3 | 6.1–6.5 ↔ definition, (A.5), Remark A.6, (A.7)–(A.9) |
   | Layer 8 | A.4 | 8.1 ↔ A.12; 8.2 ↔ A.13. Nothing else in either. |
   | Layer 9 | A.5 | 9.1 ↔ A.15, A.18; 9.2 ↔ (A.16)–(A.17); 9.4 ↔ A.19; 9.5 ↔ A.20; 9.3, 9.6 ↔ A.22 |
   | Layer 10 | A.6 | 10.1 ↔ A.24; 10.2 ↔ A.27. Nothing else in either. |
   | Layer 11 | A.7 | 11.1 ↔ A.28, A.29; 11.2 ↔ A.30; 11.3–11.4 ↔ A.31 (11.5–11.6 are MT) |

   Layers 8, 9, 10 map one to one, in order and with the same scope, onto A.4, A.5, A.6; Layer 11 is A.7 plus
   the MT appendix. The order 8 → 9 → 10 → 11 is forced (9.1 needs 8.1; 10.1 needs 9.1, 9.2, 9.5, 8.1, 8.2;
   11.1 needs 10.1), so the order is no finding; the scope of each layer is.

   **Repair.** Regroup by what the end theorems need, keeping every target's text:

   1. Dissolve Layer 8. 8.1 becomes the last target of Layer 6 (its Needs are 6.2–6.4, 6.6, 2.2, 4.7, 5.1, 5.3,
      5.6, all earlier). 8.2 becomes the last target of Layer 7 (Needs 8.1, 7.1, 7.6, 4.1, 5.3). Layer 6 is then
      "exponential mixed Hodge structures and their classical objects", Layer 7 "the Deligne filtration, strict
      realization and its classical case".
   2. Move 12.1, 12.2, 12.3 and 12.9 into Layer 9, after 9.3 (Needs: 2.1, 9.2, 9.3, 7.1, 7.2, 7.5 and the
      blow-up suppliers, all available there). Layer 9 is then "pair cohomology with its de Rham models,
      Künneth and duality, filtered", with Yu, ESY and CY as sources beside FSY; 9.3's sentence
      "Compatibility with `F_irr` is 12.9" becomes a reference inside the layer. Layer 12 keeps 12.4–12.8
      (Newton theory).
   3. Merge Layers 10 and 11 into one layer, "Fourier cohomology of a mixed Hodge module on the line", with
      targets in the order 10.1, 10.2, 11.1–11.6.
   4. Add the old → new numbering to the "Former-numbering map" table (one row per moved id: 8.1, 8.2, 10.1,
      10.2, 11.1–11.6, 12.1–12.3, 12.9), since KloostermanMomentsAndPotentialAutomorphy,
      MappingClassGroupsAndCanonicalRepresentations and the "Downstream consumers" section cite these ids, and
      update the Summary, "How to read the build" and each "Dependencies" paragraph.
   5. Cite, beside FSY, the primary sources FSY itself names for the main results: for 9.2, Sabbah–Yu, *On the
      irregular Hodge filtration of exponentially twisted mixed Hodge modules*, Forum Math. Sigma 3 (2015),
      Theorem 1.3(4) (named at FSY line 3009); for 7.6, Sabbah, *Irregular Hodge theory*, Mém. SMF 156 (2018),
      Theorems 0.2(2), 0.3(2) and 0.3(4) (named at FSY lines 2956–2960). Both go through the sources service
      under new keys; neither was read in this pass.

   Tested on the witness: after 1–3 no layer has the scope of one FSY subsection (Layer 6 = A.3 + A.4 + KS
   §4.2–4.4 material; Layer 9 = A.5 + Yu §§1–2 + CY; merged Fourier layer = A.6 + A.7 + MT appendix).

2. **F02** (P2) Mixed Hodge modules are narrowed to smooth quasi-projective varieties, and 5.5, 5.6 use them outside that range

   **Location.** `README.md:43` "Hodge modules live on smooth quasi-projective varieties"; `:516` (4.6)
   "`MHM(X)` … on a smooth quasi-projective `X`"; `:555` (5.1); against `:611` (5.5) "Let `U` be smooth of
   dimension `d`" and `:621` (5.6) "Let `X` be a smooth connected variety … `M` a mixed Hodge module on `X`".

   **Claim.** The roadmap builds Saito's theory at the source's generality, and its targets use only objects it
   defines.

   **Witness.** Sai90 lines 66–67 define `MHM(X)` for every separated reduced complex algebraic variety, and
   Theorem 0.1 (Sai90 lines 73–80) gives the operations for every morphism; §4.2 is at Sai90 line 3217. For
   Hironaka's smooth proper non-projective threefold `X`, 5.6 is stated but `MHM(X)` is undefined by 4.6.
   TopologicalMirrorSymmetryForHitchinSystems already asks this roadmap for the separated finite-type case.

   **Repair.**

   - Conventions, "Varieties": replace the second sentence by "Mixed Hodge modules are defined on every
     separated complex variety `X`: on an affine open `U ⊂ X` with a closed embedding into a smooth `V` they are
     the objects of `MHM(V)` supported on `U`, independent of the embedding by Kashiwara's equivalence, and
     these glue over an affine cover (Sai90, §2.1, Sai90 lines 1060–1068, and §4.2, p. 316, Sai90 line 3217)."
   - 4.6: state the definition for a separated complex variety by that gluing, the present text being the
     smooth case; keep the Check on `G_m`.
   - 5.1 and 5.2: state the operations and weight bounds for arbitrary morphisms of separated complex
     varieties (Sai90, Theorem 0.1, p. 222, Sai90 lines 73–80); the proof route's factorisation "immersion
     followed by a projective projection" is applied on affine opens and glued.
   - 5.5, 5.6: no change is then needed. Layers 9–12 keep "smooth quasi-projective" for the pairs `(U, f)`,
     which is their sources' hypothesis (FSY line 2997).

   Tested on the witness: with the repaired 4.6, `MHM(X)` exists for the Hironaka threefold and 5.6 applies to it.

3. **F03** (P2) Ownership of complex-coefficient analytic constructible and perverse sheaves is not settled against EtaleDualityAndPerverseSheaves

   **Location.** `README.md:9` "This roadmap owns … the bounded algebraically constructible derived categories
   of `ℚ`- and `ℂ`-sheaves on analytifications with the six operations, middle perversity"; `:25` "the finite
   and adic constructible categories stay with ComplexComparisonPartII and the étale roadmaps".

   **Claim.** No earlier roadmap states `D^b_c(X^an, ℂ)` or its perverse heart.

   **Witness.** EtaleDualityAndPerverseSheaves (earlier in the merge order) §3.5 states the comparison with
   "`D^b_c(X^an, Λ)`" and "algebraically constructible perverse sheaves on `X^an`"; its §5.9 defines geometric
   origin on `D^b_c(X(ℂ), ℂ)` with `Rf_*`, `Rf_!`, `f^*`, `f^!`, `⊗`, `RHom` and "the analytic perverse heart".

   **Repair.** That roadmap takes the analytic categories as given (its §3.5 proof imports them from
   ComplexComparisonPartII §§C6.0–C6.6, whose comparison sections C6.3–C6.6 at its current head are for
   finite, integral `ℓ`-adic and `ℚ_ℓ` coefficients) and compares; it constructs no Verdier duality or `t`-structure for a coefficient field. Say so, and fix the
   carrier, by appending to the ComplexComparisonPartII bullet of "Scope and ownership":

   "EtaleDualityAndPerverseSheaves §3.5 (`complexAnalyticComparison`) and §5.9 compare étale complexes with
   algebraically constructible complexes on `X^an` and use the analytic perverse heart with complex
   coefficients; they construct neither. Layer 1 constructs both for `Λ ∈ {ℚ, ℂ}` on the same carrier, the
   derived category of `Λ`-module sheaves on `T_X` of EnhancedDerivedSheaves §0.1, with the pointwise
   support and cosupport conditions that §3.5 uses, so that the two roadmaps name one category and one heart."

   Add to the API of 1.3 the bullet: "For `Λ = ℂ` the heart is the analytic perverse heart used by
   EtaleDualityAndPerverseSheaves §§3.5 and 5.9." Tested on the witness: the object named in §5.9 then has this
   roadmap's 1.2–1.3 as its single constructing owner, and the edge points downward (Layer 1 consumes nothing
   from that roadmap).

4. **F04** (P2) gap:regular-holonomic-stability asks again for comparisons its supplier already proves

   **Location.** `README.md:80` and the same slug in `design/plan.json`: "… with the corresponding composition,
   adjunction and duality comparisons for algebraic maps of smooth complex varieties".

   **Claim.** The gap is minimal.

   **Witness.** SpringerResolutionAndCharacteristicCycles §9.1 at its current head: "Prove the resulting
   composition, identity, adjunction and proper-duality comparisons on their bounded coherent/holonomic
   domains", with API "the derived transfer comparisons identify the operations for a composite with the
   composites of operations". Regular holonomic complexes lie in that domain.

   **Repair.** In the README and in the `gaps` entry of `design/plan.json`, replace the `needs` sentence by:
   "Stability of the bounded derived category with regular holonomic cohomology under `f_+`, `f_!`,
   arbitrary `f^†`, external product and restriction to the diagonal, for algebraic maps of smooth complex
   varieties; duality, smooth pullback and intermediate extension are supplied by §9.7, and the composition,
   adjunction and proper-duality comparisons by §9.1 on holonomic complexes." Tested on the witness: nothing in
   the new sentence is in §9.1 or §9.7 (neither section mentions external products, the diagonal, or
   regularity of `f_+`).

5. **F05** (P3) Three supplier contracts have no consuming target; one Needs line omits a cited supplier

   **Location.** `README.md:34` and `:126`: "§3.3 (degrees and Riemann–Roch for vector bundles on curves) …
   AlgebraicCurves Layer 9 … and Layer 12 (the nonsingular projective model of a curve)"; `:1063` (12.1).

   **Claim.** Every contract is used, and each Needs line lists what its statement uses.

   **Witness.** No `*Needs:*` line and no "Dependencies" paragraph names AlgebraicCurves or
   SchemeAndStackFoundations §3.3 (the curve index they served is now imported from
   PadicDifferentialEquationsAndRigidCohomology §RD.6.53, line 161). 12.1 cites SchemeAndStackFoundations §4.17
   in its statement but not in its Needs.

   **Repair.** Delete "§3.3 (degrees and Riemann–Roch for vector bundles on curves)," and the sentence on
   AlgebraicCurves from line 126, rename that subsection "From TauCetiRoadmap.SchemeAndStackFoundations",
   delete "Riemann–Roch for vector bundles on curves," "3.3," and the AlgebraicCurves sentence from line 34.
   Add "SchemeAndStackFoundations §4.17" to the Needs of 12.1 and to the 12.1 clause of the Layer 12
   "Dependencies" paragraph.

Five findings: four P2 (R01–R04) and one P3 (R05). No P1. No finding concerns `Suggested.lean`.
No finding of the repair reports was marked `not actionable in this package`, so nothing is re-raised.

## The adversarial pass (computed values)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `twistedDeRham_concentration_finrank` | `n = 0` | `LaurentRing 0 = ℂ`; `Δ = {0}`, span `⊤`; no nonempty exposed face misses `0`; `topCohomology = ℂ/⊥`, finrank 1; `0!·vol = 1·1` (Dirac mass); `forms 0 r = ⊥` for `r ≠ 0` | holds |
| same | `n = 1`, `φ = x` | `Δ = [0,1]`, vol 1; face `{1}`: `θφ_σ = z ≠ 0`; quotient by `m x^m + x^{m+1}`: dim 1; kernel of `θ + x` zero | 1 = 1 |
| same | `φ = x + x⁻¹` | vol 2; relation `x ≡ x⁻¹`, basis `1, x`; dim 2 | 2 = 2 |
| same | `n = 2`, `φ = x + y` | triangle, vol 1/2; edge: `θ_xφ_σ = x`, `θ_yφ_σ = y`, no common zero; `H² = H¹⊗H¹`, dim 1 | 1 = 2!·½ |
| same, hypothesis | `n = 1`, `φ = 0`; `n = 2`, `φ = x` | span `{0} ≠ ⊤`; segment, span ≠ `⊤`; cohomology in degrees 0, 1 resp. 1, 2 | excluded by `hfull` |
| `IsNewtonNondegenerate` | `φ = (x+y)²`; empty face; whole polytope | edge: `2x(x+y)`, `2y(x+y)` vanish at `(1,−1)`; `σ.Nonempty` excludes `∅`; `ℓ = 0` face contains `0` | degenerate; guards work |
| `twistedDifferential` sign | `n = 2`, `J = {1,2}` | `(d²ω)_{12} = D₁D₂ω_∅ − D₂D₁ω_∅ = 0`; with all signs `+`: `2D₁D₂ω_∅` | law excludes the unsigned model |
| 2.2 Fourier | `δ_a`, `O`, twice | `τ − a ↦ ∂_t − a`: `E^{at}`; `∂_τ ↦ −t`: `δ_0`; second transform `s = −τ`: `δ_{−a}`; `[τ, −∂_τ] = 1` | consistent; MT line 2107 has both signs opposite, as stated |
| 2.3 | `O ⋆ O` | `Tor₀(δ_0, δ_0) = 0`, `Tor₁ = δ_0`: constant `H^{−1}` | holds |
| 2.5 | `δ_a` | `𝔻E^{at} = E^{−at} = r_+E^{at}`; without `r`: `E^{at} ≠ E^{−at}` for `a ≠ 0` | holds |
| 1.4 normalised `var` | `Rj_*L[1]`, `j_!L[1]`, `T = 1 + 2πiB` | `var = (2πi)⁻¹(1 − πiB)`, `var∘can = B`; `j_!`: `var = B`, `var∘N_φ = B² = 0` | both Checks recomputed |
| 3.2 sign | Tate family | `Tα = α − β`, `i·Q(α+τβ, α+τ̄β) = 2 Im τ`, `Q(α, (−log T)α) = +1`, `Q(α, (log T)α) = −1` | `−N` is forced |
| 3.3 (b) | weights `−1, 0`, `Ne = a` | `gr N = 0` forces `M₋₂ = 0`; `N M₀ ⊄ M₋₂` | not admissible, as stated |
| 3.3 boundary | `F⁰ = O(e₀ + x e₁)`, `s = 1/x` | saturated limit `ℂe₁`: dims `(1, 0)` against `(0, 1)` | fails (a) |
| 3.4 | Legendre | `χ = 2·(−1) + (1+1+0) = 0`, `H⁰ = H² = 0`, `H¹ = 0` | consistent |
| 4.1 strictness | identity `ℂ → ℂ`, shifts 1 and 0 | `coker R_F u = ℂ[z]/z`, `z`-torsion; filtered cokernel 0 | holds |
| 4.1 point image | `F_p(i_+V) = Σ F_{p−1−k}V∂^k` | from right modules: `F_q(M) = F_{q−1}(M^r)`; `F_pH¹ = F_pV` | holds |
| 4.2 indices | `O`, `x^k`, `δ`, `∂^kδ` | `0`, `−k`, `1`, `k+1`; right-to-left shift `α ↦ α + 1` gives ranges `α < 1`, `α > 0` | holds |
| 4.2 log block | `A e₁ = e₀` | `N e₁ = −e₀`; `var∘can e₁ = −e₀`; `var_top(x⁻¹e₁) = −2πi e₁ − 2π² e₀` | recomputed, equal |
| 4.2 | `D/D(x∂_x)²` | `can` iso; `N_φ(∂m₁) = −∂m₀`; `x∘N_φ = 0` | holds |
| 4.5 | `P¹ → pt`; blow-up of `A²` | weights `0, 2 = 1 ± 1`; `pℚ ⊕ δ_0ℚ(−1)`, both weight 2 | holds |
| 5.2 duality | `ℚ(−1)`, `ℚ[−1]` | `≤ 2 ↦ ≥ −2`; `≤ −1 ↦ ≥ 1` | holds |
| 5.4 | `pℚ_{A¹}`, Jordan block 2 | `ℚ(−1)[−1]`; `coker N` dim 1; weights of `coker N` are `w + 1 + k` | holds |
| 5.5 node | `xy = 0` | `H^{k+1}((S¹)²)`: `ℚ²`, `ℚ` in degrees 0, 1 | holds |
| 6.1 closure | perverse sheaves on `A¹` with `RΓ = 0` | `RΓ` lives in degrees `−1, 0`; the six-term sequence gives `H^•(K) = H^•(I) = H^•(C) = 0` | abelian subcategory |
| 6.2 adjunction | constant `a^*V[1]`, `E ∈ EMHS` | `Hom = Hom(V, a_*E[−1]) = 0`, `Ext¹ = Hom(V, a_*E) = 0` | left adjoint |
| 6.6 | `K` | `0 → O → FT K → δ_0 → 0`, nonsplit: `O(∗0)` | holds |
| 7.1 normalisation | `δ_0V` | `F_{⌊1−λ⌋}(i_+V)` mod `∂` `= F_{⌊−λ⌋}V = F^{⌈λ⌉}V` | holds |
| 9.4 iff | `(G_m, x)`, `(A¹, x²)` | weights `0`, `2`, `H_mid = 0`; rank one, weight 1 | both sides agree |
| 10.2 | `g = x`; `g = xy`; `g = 0`; unit | `ℚ(−1)`; `ℚ(−1)²`, `ℚ(−2)`; `H^r(V)`, `H^{r−2}_c(V)(−1)`; `0` | holds |
| 11.2 | `K` | `i^!j_!ℚ[1] = i^*Rj_*ℚ`: `ℚ`, `ℚ(−1)`; `O(∗0)`: `H⁰ = H¹ = ℂ` | holds |
| 11.5 | `D/D(τ∂_τ)²` | `τ∂_τ ↦ −(t∂_t + 1)`; `N_∞ = τ∂_τ`, `N_0 = −(t∂_t+1)` | intertwined |
| 11.6 ranks | general `M` | rank `M″ = dim H⁰(A¹, M) = dim H⁰(P¹, M_min) + Σ dim P_k`; `P_k(−1)` has weight `w+1+k`, constant piece `w+k+2` | consistent |
| 12.1, 12.3 | `(G_m, x)`, `(A¹, x²)` | `O(⌊1−λ⌋∞)`: jump 1; compact twist `O(−1)`: jump 0; `O(−1+⌊2−2λ⌋)`: jump ½ | holds |
| 12.4 sections | `a ≥ 0`, `a = −1` at `n = 0` | `⟨m, v_ρ⟩ ≥ −⌊a p_ρ⌋ ⇔ m ∈ aΔ`; at `a = −1`: `0` against `ℂ` | cutoff needed, present |
| 12.5 | `x²`; `x + x⁻¹`; `k[s⁴,s³t,st³,t⁴]` | `ℂ[x]/(x²)`, dim 2; `ℂ[x,y]/(xy, x−y)`, dim 2; `t⁴·s⁶t² = s⁴·s²t⁶`, `s²t² ∉ S` | holds |
| 12.8 | `x + y + 1/(xy)` | vol `3/2`, `2!·3/2 = 3` | holds |
| 12.9 annihilator | `(G_m, x)`, `(A¹, x²)` | jumps `0 ↔ 1`, `½ ↔ ½` with `F^{>d−λ}` | holds |

## Verified sound

- **Declarations read: 13** (all of `Suggested.lean`), each against the elaborated type in the supplied
  signatures table and its README statement in 12.4 and 12.6: binders agree, no section variable is in play
  (the file has no `variable`), and nothing changed. I ran no Lean. No padding: the twelve definitions are
  each used in the statement of the single theorem. No statable headline is missing: the pinned Tau Ceti has
  no `D`-module, variation, perverse-sheaf or constructible carrier (searched by object), so the docstring's
  list of non-statable headlines is right.
- **Targets read: 64**, every line of the README, with every Check recomputed (about 200; the table above
  records the discriminating ones). None found false, vacuous or a restatement.
- **Locators verified: 46** against the cached texts: AS lines 395–398, 442–445, 569–573, 583–590, 617; Yu
  lines 1340–1342, 1376–1378, 1397–1416, 1423–1436, 1442; FSY lines 2773–2791, 2848–2896, 2897–2960,
  2961–2993, 2996–3068, 3090–3102, 3208–3225, 3231–3277; Sai88 lines 80–82, 127, 138–140, 1773, 3352, 3740,
  4017–4026; Sai90 lines 66–71, 94–104, 166–171, 2769, 3080–3086, 3127–3134, 3513–3519, 3656–3662; Kash86
  lines 24–26, 78–85, 103–107, 135–146; MT lines 2104–2107; ESY lines 944–948, 1150–1175; Sab05 lines
  596–597, 804, 1834, 5345–5352, 5402–5411, 6405–6408; KS §4.2–4.4 page numbers.
- **Sibling citations checked: 49 section ids in 18 roadmaps**, each at main or at its current open head:
  every cited section and declaration name exists. Contract text compared in full for
  SpringerResolutionAndCharacteristicCycles §§9.1, 9.6, 9.7; ShimuraVarieties §3.5b.1 (lift convention
  `Φ̃(z+e_j) = T_jΦ̃`, stable-lattice hypothesis); ComplexComparisonPartII §§C5.6 (`exp(−2πi·Res)`), C6.1
  (finite coefficients only; compact supports over any ring); GroebnerGeometry §G2; AnalyticToricGeometry
  Layer 0 items 6–9.
- **Pinned declarations checked: 27** by search at the pins, with the file paths the README states: the
  Mathlib names `DerivedCategory`, `Polynomial.derivative_mul`, `PowerSeries`, `LaurentSeries`,
  `AddMonoidAlgebra` (structure with `coeff`), `AddMonoidAlgebra.coeffLinearEquiv`, `Finsupp.lsum`,
  `Finsupp.lsingle`, `IsExposed` (quoted: `B.Nonempty → ∃ l, B = {x ∈ A | ∀ y ∈ A, l y ≤ l x}`, so the
  empty set and `A` itself are exposed), `ZLattice.covolume.tendsto_card_div_pow`,
  `Convex.addHaar_frontier`; and all sixteen Tau Ceti names. `LinearMap.mulLeft`, `LinearMap.pi`,
  `LinearMap.proj`, `convexHull`, `affineSpan` and `MeasureTheory.volume` were not searched separately: the
  supplied signatures show `Suggested.lean` elaborating with them.
- **Declared gaps: 7**, each present with the same slug in `design/plan.json` and the README, with a named
  supplier; only R04 is raised.
- **Policy.** The pull request changes only the package folder. No `lemma`, `set_option`, pull-request number
  or process narrative in the README or docstrings; one `import Mathlib`.
- **Dependency check.** `depcheck: 238 roadmaps, 2162 edges, 0 problem(s)`; no UPWARD or CYCLE line.
  StratifiedSpacesAndTameTopology is another author's open pull request adding a new folder, which is an
  allowed supplier.
- **Ownership** searched by object (mixed Hodge modules, Riemann–Hilbert, `V`-filtration, variations of mixed
  Hodge structure, Fourier–Laplace, exponential and irregular Hodge objects, Newton polytopes) in main and all
  open heads: this roadmap is the only constructing owner, with the one unsettled case of R03.

Source independence: 15 passages compared with 9 sources (FSY, Yu, Kash86, Sai88, Sai90, Sab05, ESY, AS, MT), none shared beyond statements the mathematics forces; largest share FSY, 37 of about 166 locators; contents compared with FSY: Layers 8–11 follow its appendix sections A.4–A.7 (R01).

## Not verifiable

- Dimca, Schmid, SZ, Verdier, Kash76 and Kou are uncertified and Zucker is waived: their locators (1.1–1.5,
  3.1–3.4, 4.2, 12.5) were not read.
- Kash84 and Sab10 locators, DL §§3.3–3.9 and CY §§3.1–3.2 were not opened in this pass, for time; their
  texts are in the cache.
- The README's remark that the proof in KS §4.4 assigns ambient weights incorrectly (6.4) was not checked.
- The two sources proposed in R01 (Sabbah–Yu 2015; Sabbah 2018) are named from FSY's own citations and were
  not read.
- The content repository's open pull request for this same roadmap carries an older text of this README (it
  still has a Koszul-complex bullet in "Scope and ownership"); I did not compare the two texts further.

## Source issues

- **Misprint** in FSY at Appendix A.2, p. 62 (FSY line 2832): the source says the dual of the constant Hodge module on a `d`-fold is itself with Tate twist `(−d)`; it should be the twist `(d)`, of weight `−d`; affects nothing.
- **Misprint** in FSY at Example A.3, p. 63 (FSY line 2876): the source says the inverse image of the constant module to a reduced divisor is its degree-zero cohomology; it should be the degree `−1` cohomology, so that the inverse image is the divisor's constant object shifted by one; affects nothing.
- **Misprint** in FSY at Example A.27, p. 71 (FSY line 3222): the source says the direct image along `tg` composed with the closed immersion is the zero map; it should say the function `tg` vanishes on that divisor, the direct image factoring through the origin; affects nothing.
- **Error** in Yu at §4(a), p. 26 (Yu lines 1377–1378): the source says a Laurent polynomial whose Newton polytope has the origin in its interior is a proper map to the line; it should say only that the Newton filtration is then exhaustive, the fibres being positive-dimensional affine varieties for `n ≥ 2`; affects nothing.
- **Misprint** in Yu at Theorem 4.1 and Corollary 4.2, pp. 26–27 (Yu lines 1397, 1414): the source says the Newton polytope equals `n`; it should say its dimension equals `n`; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5df5bbfd4cf36d11d5bded0138e4ffae68231b5b", "job": "RT-MixedHodgeModulesAndIrregularHodgeTheory~1b", "model": "fable", "worker": "chris-x13"} -->
