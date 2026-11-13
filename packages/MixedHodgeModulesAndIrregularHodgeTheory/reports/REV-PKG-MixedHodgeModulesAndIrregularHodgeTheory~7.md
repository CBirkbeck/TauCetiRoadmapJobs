<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6851805623 -->
Review (claude) of cf50494

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §12.2 states the blow-up quotients with an undefined `c` and a range the source does not give

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:1080`, §12.2: “the successive quotients are sums of `O_E(−μ)` on the exceptional divisor with `0 < μ < c`, whose derived direct images vanish (Yu, Proposition 4.4, Lemma 4.5 and proof, pp. 29–31)”; the proof route repeats `0 < μ < c`, and the second Check argues in codimension three.

   **Claim:** Yu's Proposition 4.4 gives quotients `O_E(−μ)` for a range of twists governed by a number `c`.

   **Witness:** `c` is not defined anywhere in §12.2. Yu line 1506: the exceptional divisor is a `P¹`-bundle over the centre `Ξ`; Yu lines 1534–1537: every quotient is a sum of the relative `O(−1)`. The centre has codimension two, so only `μ = 1` occurs. §12.9 of the same README already says `O_E(−1)`.

   **Exact repair:**

   1. In the theorem, replace the sentence by: “In Yu's interpolation between the pulled-back complex and the complex of the new pole divisor, the centre `Ξ` has codimension two (a component of the transverse intersection of the zero divisor with a pole component, Yu, Proposition 4.3), the exceptional divisor `E` is a `P¹`-bundle over `Ξ`, and the successive quotients are sums of `O_E(−1)`, whose derived direct images to `Ξ` vanish (Yu, Proposition 4.4, Lemma 4.5 and proof, pp. 29–31).”
   2. In the proof route, replace “`R(π|_E)_* O_E(−μ) = 0` for `0 < μ < c`” by “`R(π|_E)_* O_E(−1) = 0`, the case `c = 2`, `μ = 1`”.
   3. Replace the second and third Checks by: “The centre has codimension two, so the only twist is `−1`: for a point blown up in a surface, `H^•(P¹, O(−1)) = 0`.” and “The twist `−1` cannot be replaced by `−2`: `H¹(P¹, O(−2)) ≠ 0`, so a quotient `O_E(−2)` would survive the direct image.”

   Tested on the instance of the first Check: `z/x` blown up at `z = x = 0` in a surface has a point as centre, `E = P¹`, quotient `O(−1)`, and `H⁰(P¹, O(−1)) = H¹(P¹, O(−1)) = 0`.

2. **F02** (P3) The Summary cites a theorem of AS that the References and the manifest do not list

   **Location:** `README.md:3`, Summary: “the concentration, volume and Hodge comparison theorems for a Newton-nondegenerate Laurent polynomial (AS, Theorem 1.4; Yu, Theorems 4.1 and 4.6)”.

   **Claim:** The locator agrees with the one used at the target.

   **Witness:** §12.6 (`README.md:1149`), the References entry (`README.md:1228`) and the `AS` locator in `sources.toml` all give “Theorem 4.13, Theorem 5.1, Theorem 4.1 and (4.3)”. AS line 100: Theorem 1.4 is the general statement with `r` auxiliary variables and non-integral exponents; the torus statement is Theorem 5.1 (AS lines 583–590).

   **Exact repair:** In the Summary replace “AS, Theorem 1.4” by “AS, Theorem 5.1”. Nothing else changes. Tested: Theorem 5.1 is the statement for the torus of dimension `N + r` with a full-dimensional polytope, which is what §12.6 and the Lean theorem state.

Two findings, both P3, both in `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`; none blocking. The four round-6 findings are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, its one theorem is not padding, and the dependency check reports no problem.

## Verified sound

### Round-6 findings

| Finding | Repaired passage (current README) | Status |
|---|---|---|
| F01 (P1), sign of the primitive polarization | §3.2: “the primitive part `P_k = ker(N^{k+1})` of `gr^M_{w+k}` is polarized by `Q(·, (−N)^k ·)`”; Conventions: “`N = −(2πi)⁻¹ N_j`”; §4.3: “`ψ_g S ∘ (id ⊗ (−N)^k)`” and “`φ_{g,1} S ∘ (can ⊗ id) = ψ_{g,1} S ∘ (id ⊗ (−var))`”; §5.3 refers to these forms | Repaired. Recomputed below. |
| F02 (P3), §8.1 uses 5.6 | §8.1 route: “the criterion from 6.6 and 5.6 … hence `a^* V[1]` by 5.6”; `*Needs:*` and Layer 8 Dependencies list 5.6 | Repaired. |
| F03 (P3), three locators | §2.2 cites FSY Appendix A.1, p. 61 and MT, Appendix, p. 39; §5.2 cites “Sai90, Introduction, p. 225”; §6.6 no longer names Katz (no occurrence of the name in the README) | Repaired. FSY lines 2776–2779, MT lines 2104–2107 and Sai90 lines 166–171 read: each supports the passage. |
| F04 (P3), Hochster applied to the wrong ring | §12.5 route: face semigroups `C_σ ∩ ℤ^n` are Cohen–Macaulay by Hochster; “Cohen–Macaulayness of the cone algebra itself is not used”; scope bullet and GroebnerGeometry contract say “cones over the faces” | Repaired. |

Adversarial pass on the repaired passages:

- §3.2, Tate family: `T⁻¹b = b − a`, so `(Tα)(b) = −1`, `Tα = α − β`, `(log T)α = −β`, `Q(α, −(log T)α) = Q(α, β) = 1`.
- §4.3, the `φ` form is well defined: if `can x = 0` then `ψS(x, var(can x″)) = ψS(x, N x″) = −ψS(Nx, x″) = −ψS(var(can x), x″) = 0`. Its parity is opposite to that of `ψS`: `φS(can x′, can x) = ψS(x′, −Nx) = ψS(Nx′, x) = ε·ψS(x, Nx′) = −ε·φS(can x, can x′)`; for weight two on a curve, `ψS` alternating gives `φS` symmetric, as the centres `w − 1` and `w` require.
- §12.5: every nonzero `m ∈ C_Δ` has `m/h(m)` in the relative interior of a face not containing `0` (otherwise the ray would continue inside that face), so `C_Δ` is the union of the cones over such faces; for `x + x⁻¹` the graded ring is `ℂ[x, y]/(xy)` and `ℂ[x, y]/(xy, x − y)` has dimension `2`.

The repaired patterns were searched for in the rest of the text. The form `Q(·, N^k ·)` occurs only inside the negative statement of the Tate Check; §§4.5, 5.4, 11.3 and 11.6 use only `ker N`, `coker N` and `M(N)`. No other locator names a work absent from the manifest. The remaining locator slips of that kind are R01 and R02.

### Principles, shape, residue

No route-specific shortcut, re-planned roadmap, upward or cyclic supply, copied passage, algorithm, sorry'd data or `set_option`. The README has the house sections in order, 12 layers each ending with Examples and Dependencies, and 65 `**Checks.**` blocks, each with at least three bullets. Every definition has an API list. No pull-request number, date, machine path, HTML anchor, LaTeX delimiter or process word in the README or the Lean file. `metadata.toml` is `topic = "math.AG"`.

The whole README was read this round, including the sections the round-6 table did not cover (1.2, 1.3, 1.5, 2.1, 2.4, 3.1, 4.4, 4.6, 5.1, 5.3, 6.1–6.5, 7.5, 7.6, 8.2, 9.1, 9.5, 10.1, 11.1, 11.4, 12.1); values computed for them are in the table.

### Lean

`lake env lean` on `packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`, run from the content checkout: one diagnostic, `Suggested.lean:146:8: warning: declaration uses sorry`. The only import is `import Mathlib`. The file is unchanged since round 6; the 13 elaborated signatures were compared with §§12.4 and 12.6: no section variable exists, every binder is explicit, the generality matches the README.

One-tactic probe on the only sorried theorem, on a scratch copy, seven variants in one elaboration: `simp` (unsolved goals), `rfl` (fails), `infer_instance` (not a class), `exact ⟨fun _ _ => le_rfl, inferInstance, rfl⟩` (instance synthesis fails), `aesop` (fails), `simp` with the definitions unfolded (unsolved goals), `decide` (free variables). Not padding. There is no `example`, no `#check`, no other theorem.

Headline theorems of the Summary: Saito's projective direct image and abelianness (4.5, 4.7), `E₁`-degeneration and the strict bifiltered realization (7.5, 7.6), classicality of `tg` cohomology (10.1), Fourier costalk and Hodge numbers (11.2, 11.3), monodromy weights at infinity (11.6), the Newton–Hodge comparison (12.7): each is named in the module docstring with its missing carrier (`D`-modules, perverse sheaves on analytifications, Hodge modules, `Π`, the Deligne filtration). The concentration and volume theorem (12.6) is stated in full. No statable headline is absent; none goes through a stand-in.

Backticked names the README presents as this roadmap's own (`LaurentRing`, `eulerDerivation`, `twistedEuler`, `forms`, `twistedDifferential`, `cocycles`, `coboundaries`, `topCohomology`, `latticePoint`, `newtonPolytope`, `faceEulerEval`, `IsNewtonNondegenerate`, `twistedDeRham_concentration_finrank`): all 13 are declared.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.5 Fourier duality (sampled) | `δ_a`; `O`; `D/D(τ∂_τ − α)` | `𝔻E^{at} = E^{−at} = r_+E^{at}`; `δ_0` both sides; adjoint of `τ∂_τ − α` is `−(τ∂_τ + 1 + α)`, `FT(𝔻M) = D/D(t∂_t − α)`, `𝔻FT(M) = D/D(t∂_t − α)`, fixed by `r` | sound |
| §2.4 | `O_{G_m}` | `0 → δ_0 → FT(O(∗0)) → O → 0`, rank `1` on `G_m`; `FT(O) = δ_0`, rank `0` | sound |
| §3.2 | Tate family | `Q(α, −(log T)α) = 1`, `Q(α, (log T)α) = −1` | sound |
| §3.4 (sampled) | constant on `P¹ ∖ {0, ∞}`; Legendre | `H^i(P¹, ℚ) = ℚ, 0, ℚ(−1)`; `χ = 2·(−1) + 2 = 0`, `H¹ = 0` | sound; source unread |
| §4.3 | Tate data, `w = 2` | `ψS(α, −Nα) → 1`; `φS(can α, can α) = 1`; parity of `φS` opposite to `ψS` | sound |
| §4.7 (sampled) | `δ_0ℚ → j_!pℚ_{G_m}`; `ℚ(1) → E` | image `= W_0`; `W_{−2} ∩ F^{−1}E` is the image | sound |
| §5.1 | `pℚ_X ⊗^H pℚ_X`; `D(pℚ_{A¹})` | `Δ^*ℚ[2d] = pℚ_X[d]`; weight `1 − 2 = −1` | sound |
| §5.2 | `G_m → pt` | `H⁰a_* = ℚ(−1)`, `2 ≥ 1`; `H^{−1}a_* = ℚ`, `0 ≥ 0`; `H⁰a_! = ℚ`, `0 ≤ 1`; `H¹a_! = ℚ(−1)`, `2 ≤ 2` | sound |
| §5.4 (sampled) | `pℚ_{A¹}`; `δ_0V`; block of size two | `i^! = [φ_1 → ψ_1(−1)]`: `ℚ(−1)[−1]`; `V` in degree `0`; `coker N` of dimension `1`; smooth case weight `(w − 1) + 2 = w + 1` | sound |
| §5.5 | node in `A²` | `H^{k+1}((S¹)²)`: `ℚ²`, `ℚ` in degrees `0, 1` against `ℚ` in degree `0` | sound |
| §5.6 (sampled) | `pℚ_X`; `F⁰ = O(e₀ + x e₁)` on `A¹` | `V = H⁰(X, ℚ)`; fibre split at `x = 0`, class `i ∉ ℚ` at `x = i`; fails 3.3(a) at `∞` | sound |
| §6.2 | `δ_0ℚ`; `pℚ_{A¹}`; general `N` | `N ⋆ pℚ = a^*RΓ(N)[1]`, so `ker η = a^*H^{−1}(A¹, N)[1]`, `coker η = a^*H⁰(A¹, N)[1]`; `K`; `0` | sound |
| §6.3 (sampled) | `K ⊗_E K` | fibre at `c ≠ 0`: `H^•(A¹, j_!ℚ_{A¹∖{0,c}}) = ℚ` in degree `1`; at `c = 0`: `0`; so `K` | sound |
| §6.5 | `pℚ_{A¹}`; `δ_aV` | `d/dθ + 1` bijective on `ℂ[θ]`: `0`; `V` | sound |
| §7.1 | `δ_0V` | image of `F_{⌊1−λ⌋}(i_+V)` in `H¹` is `F_{⌊−λ⌋}V = F^{⌈λ⌉}V` | sound |
| §7.2 | chart at infinity | `z∂_θ + τ = −zx²∂_x + τ`; `z∂_τ(m ⊗ e) = θm ⊗ e` as ESY (2.3.1) | sound |
| §7.3 (sampled) | norm `abs(t)^{1/2}`, index `1/4`; trivial line on `P¹` | `⌈1/4 − 1/2⌉ = 0`, `⌈1/4⌉ = 1`: lattices `O`, `tO`; twistor weights `−1, 1` against Hodge weights `0, 2` | sound |
| §7.4 (sampled) | `δ_0V`; `pℚ_{P¹}` | two-term complex, `F^pV → V` injective; fibre `0` | sound |
| §9.2 (sampled) | `(G_m, x)`; `(A¹, t)` | cokernel of `m x^m + x^{m+1}` spanned by `1`; `d/dt + 1` bijective | sound |
| §9.4 | `(A¹, x²)` | `f_*ℚ = ℚ ⊕ j_!L`, `RΓ(j_!L) = 0`, pure of weight `1`, fibre of dimension `1` | sound |
| §9.6 (sampled) | `k = 0, 1`, general `k` | `I(ℚ)` with identity; `I(ℚ(−1))`, `I(ℚ)`; de Rham dimension `k!·(1/k!) = 1`, jumps `k` and `0` | sound |
| §10.2 | `g = x`; `g = xy`; `g = 0`; unit | `I(ℚ(−1))` both ways; `H²_Z = ℚ(−1)²`, `H³_Z = ℚ(−2)`; `H^r(V)`, `H^{r−2}_c(V)(−1)`; `0` | sound |
| §11.4 | `δ_0ℚ`; general pure `M` | `M′ = a^*H⁰(A¹, M)[1]`, weights `≥ w + 1`; `pℚ_{A¹}` of weight `1` | sound |
| §11.5 (sampled) | `O`; `δ_a`; `δ_0` | `φ_{t,1}δ_0 = ℂ = ψ_{∞,1}O`; `0 = 0`; `φ_{t,1}O = 0 = ψ_∞δ_0` | sound |
| §11.6 | `δ_0ℚ` | `gr^W_w ψM″ = ψ gr^W_{w+1}M″`: fibre `ℚ` in weight `1`, as MT (A.2) | sound |
| §12.1/12.3 | `(A¹, x²)` on `P¹` | degree-one term `O(−1 + ⌊2(1−λ)⌋)`: `H⁰ = ℂ` for `0 < λ ≤ 1/2`, `0` for `1/2 < λ ≤ 1`; jump `1/2` | sound |
| §12.2 (sampled) | `z/x` at `z = x = 0` | charts `f = z′` and `1/x′`; centre of codimension `2`, `H^•(P¹, O(−1)) = 0`, `H¹(P¹, O(−2)) = ℂ` | statement sound at `c = 2`; R01 |
| §12.4 (sampled) | `n = 2` signs; `(x + y)²`; `x + x⁻¹ + y + y⁻¹` | `(d²ω)_{12} = D₁D₂ω_∅ − D₂D₁ω_∅ = 0`; `θ_x = 2x(x + y)`, `θ_y = 2y(x + y)` vanish on `x + y = 0`; edge `x + y` has `θ_x = x ≠ 0`; fibre over `0` of dimension one, so not proper | sound |
| §12.5 | `x²`; `x + x⁻¹` | `(1 − t)/(1 − t^{1/2}) = 1 + t^{1/2}`, value `2`; `ℂ[x, y]/(xy, x − y)` of dimension `2` | sound |
| §12.6 headline (sampled, Lean) | `n = 0`; `x`; `x + x⁻¹`; `x² + x`; `Σx_i`; `x` on `G_m²`; `φ = 0`, `n = 1` | `ℂ/⊥` of dimension `1 = 0!·δ({0})`, no nonempty face misses `0`; `1`; `2`; `2` (irregularity `2` at `∞`); `1`; span of dimension `1 < 2`; `Δ = {0}` not full | sound |
| §12.8 (sampled) | `x`; `x + y + 1/(xy)` | `I(ℚ)` against `I(ℚ(−1))`; area `½·abs((−1)(−1) − (1)(−2)) = 3/2`, `2!·3/2 = 3` | sound |
| §12.9 | `(A², x² + y²)`; `(G_m, x)` | `1/2 + 1/2 = 1`; `λ ≤ 0`: annihilator `0 = F^{>1−λ}` | sound |
| Summary locator | AS line 100 against lines 583–590 | Theorem 1.4 is the general `r`; Theorem 5.1 the torus | R02 |

### Seeded source sample

| Target | Locator read | Outcome |
|---|---|---|
| 2.5 | FSY lines 3145–3148 (p. 69) | supported: the dual localization identity with the involution `t ↦ −t` |
| 3.4 | Zucker | not readable (below) |
| 4.7 | Sai90 lines 66–71 (p. 222); §2.3 at line 665 (p. 239); §4.1 at line 3158 (p. 314) | supported |
| 5.4 | FSY lines 2848–2870 (pp. 62–63); lines 3256–3277 (p. 72) | supported |
| 5.6 | FSY line 3164 (the rigidity step, citing Steenbrink–Zucker) | the use is supported; SZ §4 and Sai90 §4 themselves: SZ unread |
| 6.3 | KS lines 1109–1113 (Definition 7, p. 31), 1278–1291 (Proposition 4, Lemma 1, p. 36); FSY lines 2922–2928 (p. 64) | supported |
| 7.3 | Sab05 lines 5345–5352 (p. 130), 5402–5411 (p. 131), 6405–6408, 1834, 992; §8.4 at printed p. 206 | supported; printed page is the file page minus six |
| 7.4 | Sab10 lines 1360–1370 (Theorem 6.1, pp. 31–32), 1554–1560 (Proposition 6.10, p. 36), 1589–1590 | supported; Sab10 twists by `E^{−t}`, harmless under `r` |
| 9.2 | FSY lines 3007–3018 (p. 66) | supported |
| 9.6 | FSY lines 3061–3085 (pp. 67–68) | supported |
| 11.5 | MT lines 2108–2116 (p. 39) | supported |
| 12.2 | Yu lines 1463–1474, 1506, 1533–1537, 1549–1553 (pp. 28–30) | supported for `O(−1)`; the README's range is R01 |
| 12.4 | Yu lines 1336–1342 (p. 25), 1376–1395 (p. 26); FSY line 1474 (p. 35) | supported; the equivalence of the two nondegeneracy conditions is the README's own argument and is correct |
| 12.6 | AS lines 395–398, 442–445, 569–573, 583–590; Yu lines 1397–1416 | supported |
| 12.8 | DL lines 251–296 (pp. 280–281), 331–339 (p. 282); FSY lines 695–716 (pp. 16–17) | supported |

Also read for the wording comparison: ESY lines 1076–1094, 1265–1298 (Theorems 3.3.1, 1.2.2 and Proposition 3.1.2 are on pp. 25, 6 and 23). No locator is flagged by the author as unverified beyond the settled uncertified and waived works. All 21 cited works have one manifest key each; nothing was fetched or added, and no `needs-references.toml` was written.

### Library declarations opened at the pins

Tau Ceti: `Geometry/Hodge/Structure.lean:62`; `Mixed/Basic.lean:72`; `Mixed/Morphism.lean:77`; `Mixed/Strictness.lean:88`, `:110`, `:131`; `Mixed/Category.lean:56`; `Mixed/Abelian.lean:33`; `Polarization.lean:72`, `:159`, `:221`; `Tate/Basic.lean:93`, `:102`; `Tate/Twist.lean:63`; `RingTheory/CohenMacaulay/Ring.lean:40` (Noetherian plus Cohen–Macaulay localizations; nothing on semigroup algebras); `AlgebraicTopology/LocalCoefficient.lean:46`. Mathlib: `Algebra/Module/ZLattice/Covolume.lean` (`tendsto_card_div_pow`), `Analysis/Convex/Measure.lean` (`Convex.addHaar_frontier`), `Algebra/MonoidAlgebra/Module.lean:73`, `Algebra/MonoidAlgebra/Defs.lean:64`, `Analysis/Convex/Exposed.lean:55`, `RingTheory/LaurentSeries.lean:101`, `Algebra/Polynomial/Derivative.lean:228`. Every backticked library name resolves. `scratch/library-matches.md` was read: no pinned declaration proves the headline.

### Suppliers, gaps, ownership

Headings resolved at the open heads: SpringerResolutionAndCharacteristicCycles §§8.2–8.5, 9.1, 9.2, 9.4–9.7; ComplexComparisonPartII §§C6.0, C6.1 and the names `complexSchemeAnalytification`, `CanonicalLogExtension`, `deligneRiemannHilbert`, `regularSingularDeRhamComparison`; PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a, RD.6.53; LefschetzPencilsAndVanishingCycles §§1.3, 1.4, 1.5, 1.7, 3.4; ShimuraData §§3.1–3.3; ShimuraVarieties §§3.5b.1–3.5b.2; AlgebraicTopologyPartII §§16.1a–16.1e; StratifiedSpacesAndTameTopology §§7.2–7.3 (another author's open new roadmap); SchemeKTheoryOperations §5.7; AnalyticToricGeometryPartII §§0.1–0.3; FormalConnectionsOpers §F2.2. On main: SchemeAndStackFoundations §§0.17, 2.2, 2.6, 2.18, 2.20, 3.3, 4.11, 4.17, 5.5; GroebnerGeometry §G2; EtaleCohomologyFoundations §§G.1–G.2; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2, 6.2; EnhancedDerivedSheaves §§0.1–0.4, E1.4; AlgebraicCurves Layers 9 and 12; completed AnalyticToricGeometry and HodgeStructures. No drift; the worker's resolver also lists nothing.

The seven declared gaps have the same slugs, suppliers and sections in `design/plan.json` and under `## Exact supplier contracts`. Each is precise and minimal; none has supplier `none`. They are contracts, not findings.

Ownership by object, read at the heads:

- Analytic algebraically constructible categories and their perverse hearts. ComplexComparisonPartII §C6.1 and EtaleDualityAndPerverseSheaves §3.5 own them for finite, `O_E` and `E` coefficients (the comparison with étale sheaves). This roadmap owns the `ℚ` and `ℂ` categories of Layer 1; its Scope states the split.
- Regular Riemann–Hilbert for regular holonomic `D`-modules: owned here (1.5). ComplexComparisonPartII has no regular holonomic text at its head. SheafConvolutionOnAbelianVarieties requests the same equivalence from ComplexComparisonPartII as `gap:holonomic-riemann-hilbert-index`; that is a citation to repoint in that roadmap, not a second owner, and is passed to the human reviewers below.
- Variations: pure ones are ShimuraData §§3.1–3.3; completed HodgeStructures names variations as a successor and owns none. Mixed variations and admissibility are owned here.
- PadicDifferentialEquationsAndRigidCohomology takes the irregular Hodge filtration of FSY as filtered input and does not construct it.

Searched by object over main and the 440 open heads (`roadmaps grep`): “mixed Hodge module”, “irregular Hodge”, “exponential mixed Hodge”, “Kashiwara–Malgrange”, “regular Riemann–Hilbert”, “admissible variation”, “twisted de Rham”, “Newton nondegenerate”, “Fourier–Laplace”, “algebraically constructible”. The hits are consumers (EllAdicHomotopyTypesAndWeights, SheafConvolutionOnAbelianVarieties, TopologicalMirrorSymmetryForHitchinSystems, PadicDifferentialEquationsAndRigidCohomology) or unrelated uses of the words (analytic Fourier–Laplace transforms, gauge-theoretic and prismatic twisted de Rham complexes); no other roadmap states these objects.

The board packages index was read: three packages, none on this subject. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision, and no second copy exists on main.

Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, SheafConvolutionOnAbelianVarieties, ComplexComparisonPartII, PadicDifferentialEquationsAndRigidCohomology, EtaleCohomologyFoundations, HodgeStructures (the third list is empty); constructible analytic categories are split by coefficients (finite and adic: ComplexComparisonPartII and EtaleDualityAndPerverseSheaves; rational and complex: this roadmap), regular Riemann–Hilbert is owned by this roadmap; nothing else shared.

Dependency check, full output:

```text
depcheck: 210 roadmaps, 1920 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Copyright and arrangement

Wording: 17 passages were set beside their sources (FSY lines 2848–2870, 2961–2971, 2996–3018, 3061–3085, 3090–3110, 2922–2928; ESY lines 1076–1094, 1265–1298; Yu lines 1336–1342, 1533–1537; AS lines 395–398; MT lines 2108–2116; Sab05 lines 5345–5352, 5402–5411; Sab10 lines 1360–1370; Sai90 lines 66–71, 166–171; DL lines 331–339; KS lines 1109–1113), including the module and theorem docstrings of `Suggested.lean`. No sentence is shared; the longest common run is four words of standard vocabulary. Displayed formulas (the definitions of 9.1, the costalk identities of 5.4) are forced by the mathematics. No table, figure or list of examples is taken over.

Arrangement: FSY has the largest share, 37 of 169 locators. Its body (§§1–5) is on Kloosterman connections and has no counterpart here; Layers 1, 3, 4, 5, 7 and 12 have no counterpart in its Appendix A. Layers 8, 9, 10, 11 run parallel to A.4, A.5, A.6, A.7. That order is forced: 9.1 needs 8.1, 10.1 needs 9.1, 9.2 and 9.5, 11.1 needs 10.1. The scopes differ: Layer 9 adds the general Künneth and duality theorems (Yu), Layer 11 adds stationary phase and the weights at infinity (MT), Layer 6 draws on KS and Layer 7 on ESY, Sab05 and Sab10. No finding.

Source independence: 17 passages compared with 10 sources, none shared; largest share FSY, 37 of 169 locators; contents compared with FSY: independent (the order of Layers 8–11 is forced by their `*Needs:*` lines).

## Not verifiable

- **Zucker** (waived): Theorem 4.8, §§5–8 for the sampled §3.4 were not read. The Checks of §3.4 were computed independently.
- **Verdier, Dimca, Schmid, SZ, Kash76, Kou** (settled uncertified): not read. For the sampled §5.6, the rigidity theorem in SZ §4 was not read; FSY line 3164 confirms that it is the theorem used.
- Saito's own sign for the primitive forms (Sai88 5.2.10) was not traced through the OCR text; the README fixes the sign by the curve case and does not rely on it.

## Source issues

- **Misprint** in FSY at Appendix A.2, printed p. 61: the source says the right filtration is the left one with index lowered by the dimension; it should be raised by the dimension; affects a stated result.
- **Misprint** in FSY at Appendix A.2, printed p. 62: the source says the dual of the constant perverse object carries the twist minus the dimension; it should be plus the dimension, giving weight minus the dimension; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p. 63: the source says the inverse image of the constant object on a divisor sits in degree zero; it should be the divisor's constant object shifted by one; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p. 71: the source says a composed direct image from the zero locus is the zero map; it should say the function is zero there, its direct image factoring through the origin; affects the proof.
- **Misprint** in FSY at Theorem A.30, printed p. 71: the source says the costalk is taken at the origin of the output line; it should be the origin of the input line carrying the module; affects a stated result.
- **Misprint** in AS at §4, printed p. 68: the source says forms of degree l are bounded by weight k/e minus l; it should be k/e plus l; affects the proof; corrected in print at Yu, footnote to Theorem 4.1, p. 27.
- **Error** in Yu at §4(a), p. 26: the source says a Laurent polynomial with the origin interior to its Newton polytope is a proper map to the line; it should claim only exhaustiveness of the filtration, since fibres are positive-dimensional affine varieties; affects nothing.

## For the human reviewers

- **Ownership.** SheafConvolutionOnAbelianVarieties (open) declares `gap:holonomic-riemann-hilbert-index` on ComplexComparisonPartII for the regular holonomic Riemann–Hilbert equivalence; this package states it as §1.5 (`README.md:255`) and names that roadmap as a consumer (`README.md:1199`).
- **Licence.** `sources.toml` records `licence_class = "answered-by:CBirkbeck"` for Sai88, Sai90, Kash86 and AS, read from publisher-hosted copies; DL is read from an author page and Kash84 from an institutional host.
- **Not tested.** Zucker (waived) and six uncertified works (Verdier, Dimca, Schmid, SZ, Kash76, Kou) were not read; none has the largest share of locators.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf50494f1db41042b6b8fe0033f1c7f6b927846d", "job": "REV-PKG-MixedHodgeModulesAndIrregularHodgeTheory~7", "model": "fable", "worker": "chris-x55"} -->
