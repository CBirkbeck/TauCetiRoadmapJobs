<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6915353077 -->
Red team round 2 pass a (claude) of 2bca2d0

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §2.9's route has no owner for the passage from one `GL`-class to finitely many `G`-classes

   **Location.** `README.md:1469–1476` (§2.9, route): "the connected refinement of Faltings's lemma over `L`
   leaves finitely many `GL`-classes of the standard representation; … The finiteness of `GL`-classes alone
   does not give finiteness of `G`-classes".

   **Claim.** The route's inputs (§§2.3, 2.11, MordellLawrenceVenkatesh §1.2, ArithmeticGaloisDuality
   §R02.3.1) give finitely many `G(ℚ_p)`-classes.

   **Witness.** `G = GL₂ × GL₂ ⊂ GL₄`, `Γ = ℤ`: `1 ↦ (diag(1,2), diag(3,4))` and `1 ↦ (diag(1,3), diag(2,4))`
   are `GL₄`-conjugate, not `G(ℚ̄_p)`-conjugate. §2.11 splits one geometric class only; MordellLawrenceVenkatesh
   §1.2 is `GL_d` only; LV Lemma 2.6 (LV lines 550–567) has no owner.

   **Repair.** (a) Add to §2.3, after the paragraph ending "(§2.11 with the centralizer of the image).":

   > Prove also the geometric finiteness inside a linear class. Let `k̄` be algebraically closed of
   > characteristic zero, `G → GL_M` a faithful representation and `ρ₀ : Γ → GL_M(k̄)` a semisimple
   > representation of a group `Γ`. Then the homomorphisms `Γ → G(k̄)` whose composite with `G → GL_M` is
   > `GL_M(k̄)`-conjugate to `ρ₀` form finitely many `G(k̄)`-conjugacy classes (LV, proof of Lemma 2.6,
   > printed pp. 906–907, LV lines 550–567, with the cosets taken for the centralizer of the image, as LS,
   > proof of Lemma 5.49, p. 61, LS lines 2832–2836, require). A route: let `L` be the Zariski closure of
   > `ρ₀(Γ)`; its identity component is reductive, so `L` is linearly reductive (ReductiveGroups Layer 6)
   > and `H¹(L, Lie G) = 0` for every homomorphism `L → G`. The conjugates in question are `Ad(g)ρ₀` for `g`
   > in the transporter `{g ∈ GL_M : gLg⁻¹ ⊂ G}`, a variety of finite type on which `G` acts on the left
   > and `Z_(GL_M)(L)` on the right; the vanishing makes every double coset open in it, so there are
   > finitely many.

   Add the Check: "For `G = GL₂ × GL₂ ⊂ GL₄` and `Γ = ℤ`, the homomorphisms `1 ↦ (diag(1,2), diag(3,4))` and
   `1 ↦ (diag(1,3), diag(2,4))` are `GL₄`-conjugate and not `G(k̄)`-conjugate; the `GL₄`-class of
   `diag(1,2,3,4)` meets `G` in `binomial(4,2) = 6` classes, a finite number greater than one." Add
   "ReductiveGroups Layer 6" to §2.3's `*Needs:*`, and to the ReductiveGroups contract (`README.md:347–356`)
   the clause "Layer 6 (reductive groups; in characteristic zero a group is linearly reductive exactly when
   its identity component is reductive)"; the Layer 2 `Dependencies` line already reads "Layers 3–7b".

   (b) Replace the route sentence of §2.9 from "on each, the connected refinement" to "centralizer of the
   image." by:

   > on each, Faltings's lemma over `L` (MordellLawrenceVenkatesh §1.2) leaves finitely many `GL`-classes
   > of the standard representation, which is semisimple because the representation is G-completely
   > reducible; each `GL`-class contains finitely many `G(ℚ̄_p)`-classes of homomorphisms into `G` by the
   > geometric finiteness of §2.3; the extensions from `G_L` to `G_K` of one homomorphism form finitely many
   > classes, because the `H¹` of the finite group `Gal(L/K)` in the Lie algebra of the centralizer
   > vanishes in characteristic zero; and each geometric class splits into finitely many `G(ℚ_p)`-classes by
   > §2.11 applied to the centralizer of the image.

   Tested on the witness: the transporter of the torus `L = {diag(a,b,c,d)}` into `GL₂ × GL₂` is the union
   of the `4!` permutation cosets, which form `4!/(2!·2!) = 6` double cosets `G·w·Z(L)`, so the two
   homomorphisms lie in two of six classes and the count is finite.

2. **F02** (P2) gap:polarized-fixed-part asks for a theorem an earlier roadmap already states

   **Location.** `README.md:428` (and the entry of the same slug in `design/plan.json`, `gaps`): "the theorem
   of the fixed part for every polarized integral variation of Hodge structure on a smooth connected complex
   quasi-projective variety, not only for those of geometric origin".

   **Claim.** No roadmap earlier in the merge order provides it.

   **Witness.** MappingClassGroupsAndCanonicalRepresentations §5.4 (merge order line 291; this roadmap 320),
   its README:1777–1781: for an admissible graded-polarizable real variation `W` on a smooth quasi-projective
   `X`, `H⁰(X, W) ⊗ ℝ → W` is a morphism of variations. MixedHodgeModulesAndIrregularHodgeTheory §5.6 (line
   261): the constant case.

   **Repair.** Delete README:428 and the `polarized-fixed-part` entry of `plan.json` `gaps`. In the scope
   bullet (`README.md:170–173`) replace "and the theorem of the fixed part for every polarized integral
   variation are asked of it" by "is asked of it", and add the bullet:

   > - **MappingClassGroupsAndCanonicalRepresentations** §5.4 owns the theorem of the fixed part for
   >   admissible graded-polarizable real variations on a smooth quasi-projective variety, and
   >   **MixedHodgeModulesAndIrregularHodgeTheory** §5.6 its case of a constant local system.

   Add the contract subsection:

   > ### From TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations
   >
   > - §5.4 (limit theorem and theorem of the fixed part): a polarizable pure real variation is admissible,
   >   and for an admissible graded-polarizable real variation `W` on a smooth quasi-projective complex
   >   variety `X`, `H⁰(X, W)` carries a real mixed Hodge structure for which `H⁰(X, W) ⊗ ℝ → W` is a morphism
   >   of variations. Applied to `W = End(V) ⊗ ℝ` for a polarized integral variation `V`: the flat sections
   >   are a rational subspace and a real sub-Hodge structure of every fibre, hence a rational one, the
   >   same in every fibre after parallel transport. Consumed in §3.1.

   In §3.1's route replace "(gap:polarized-fixed-part)" by "(MappingClassGroupsAndCanonicalRepresentations
   §5.4)", and in its `*Needs:*` and in Layer 3's `Dependencies` replace
   "AbelianSchemesAndArithmeticModuliPartII §B2.4 with gap:polarized-fixed-part" by
   "MappingClassGroupsAndCanonicalRepresentations §5.4; AbelianSchemesAndArithmeticModuliPartII §B2.4".
   Shorten `README.md:424–427` to end at "is semisimple. Consumed in §3.1." Tested on §3.1's instance: on
   the finite étale cover where the monodromy lies in `G_mon°`, `Lie H′` is the space of flat sections of
   `Lie M^der ⊂ End(V)`, so it is a constant sub-Hodge structure, which is what the route uses.

   In S02 the admissibility of a pure polarizable real variation is read off the limit theorem of
   MappingClassGroupsAndCanonicalRepresentations §5.4 (its conditions (a) and (b) for a one-step weight
   filtration are the second and third assertions of that theorem); MixedHodgeModulesAndIrregularHodgeTheory
   §3.3 states it as an API line for rational variations with quasi-unipotent monodromy.

   Two findings. S01 is blocking: §2.9 is consumed by §§4.5, 6.1 and 7.6, and its route lacks the one
   step that LV Lemma 2.6 supplies. S02 concerns a declared gap that is not minimal. No statement of
   `Suggested.lean` and no bold README target was found false at this head.

## Round-1 findings, verified at this head

`README.md` is `packages/MordellLawrenceVenkateshPartII/README.md`.

| Earlier finding | Status | Witness at this head |
|---|---|---|
| 1a/F01, 1b/F01 (gap:hodge-tate-image-cocharacter) | repaired | README:472 now asks for "a cocharacter of the Zariski closure of `ρ(G_K)` over `C_p` that acts by `t^i` on the `C_p(i)`-isotypic part"; no identification of two spaces and no fixed tensors remain. Same slug and same statement as SheafConvolutionOnAbelianVarieties' contract (its README:140). `design/plan.json` `gaps` has the identical sentence (compared by script). §7.2's route (README:2407–2418) derives the similitude conjugacy itself. |
| 1a/F02, 1b/F02 (compound Eulerian gaps) | repaired | README:340–343: four gaps, each one statement; `plan.json` has the same four with §2.56, §2.56, §2.39, §2.18. §8.3 `*Needs:*` (README:2712–2713) names the first three, §8.8 (README:2834) only the central limit; §8.8's route takes `E[(D/√n)²] = (n+1)/(6n) ≤ 1/4` from §8.3. |
| 1a/F03 (MordellLawrenceVenkatesh §§0.3–0.4 misdescribed) | repaired | README:293–298 states the field case, as the supplier does at its head (§0.3 "Let `σ` be a field automorphism of `E`", §0.4 "automorphism of the field `E` of finite order `e`"), and gives the one-cycle reduction used by §2.2. |
| 1a/F04, 1b/F03 (LS Lemma 6.5 correction not listed) | repaired | README:3359–3367 lists it with both witnesses; README:1811 points to it. LS lines 3082 and 3095 read. |

No repair introduced an error (recomputations in the table of the adversarial pass below).

## Dependency check

    depcheck: 262 roadmaps, 2548 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no
Lean name found nowhere. The supplier S02 proposes (MappingClassGroupsAndCanonicalRepresentations) is
earlier in the merge order.

## The computed pass

### Suggested.lean (context: `namespace TauCetiRoadmap.MordellLawrenceVenkateshPartII`, `open MvPolynomial`, no `variable`, no instance in scope)

No Lean was run in this pass. The elaborated types of the worker's signature transcript were compared
with the README statements, one by one; nothing lost a binder and nothing changed since round 1 (the
file is unchanged). The transcript's entry "`,` (structure, line 26)" is the word "structure," of the
module docstring, not a declaration.

| Declaration | README place | Instances tried | Values | Result |
|---|---|---|---|---|
| `eulerian n q` | Layer 8 intro, §8.4 | rows `n = 0..5`; `q ≥ n` | `(1)`; `(1)`; `(1,1)`; `(1,4,1)`; `(1,11,11,1)`; `(1,26,66,26,1)`; `eulerian 1 1 = 0`, `eulerian 0 1 = 0` | descents with `i + 1 < n`, as ClassicalArithmeticCompletion §2.18 (its README:3010); real body; not at either pin (grep: only graph trails and transport coordinates) |
| `eulerian_central_mass_le_half` | §8.4 | `n = 0..5` | `n=0`: `0 ≤ 1` (outside `hn`); `n=1`: `2 ≤ 1` false (excluded); `4 ≤ 4`; `36 ≤ 36`; `488 ≤ 576`; `11420 ≤ 14400` | true as typed; `hn : 2 ≤ n` in the signature; `range n` is the whole row for `n ≥ 1` |
| `HypersurfaceMonomial n d` | §9.1 | `(2,3)`, `(2,4)`, `(0,d)` | 10, 15, 1 monomials | carrier `{m // m.degree = d}`, `Finsupp.degree` at the pin |
| `IsSmoothHypersurface` | §9.1 | `F = 0`; `x₀^p+x₁^p+x₂^p` over `𝔽_p`; `x₀²+x₁²+x₂²` over `𝔽₃`; `n = 0`, `F = x^d` | fails at `x = (1,0,0)`; all partials 0 and `(1,−1,0)` on it, fails; partials `2x_i` vanish only at 0, holds; no nonzero zero, holds | `aeval x F = 0` is kept, so the criterion is right when `p ∣ d` |
| `HasGoodReductionOutside S F` | §9.1 | `S = {2}`: `x₀²+x₁²+x₂²`, `3·` it; `S = {4}` | holds; zero mod 3, fails; a composite entry of `S` is never tested against a prime | as §9.1; `Field (ZMod p)` from the local `Fact` |
| `integralHypersurfaces_not_zariskiDense` | §9.3 | quantifier order; `e = 0`; multiples | `∃ n₀ ∀ n ∃ D₀ ∀ d ∀ S ∃ G`: `D₀` depends on `n` only, `G` on `S`; a nonzero constant `G` asserts there is no such form; `G(cF) = c^e G(F)` | LV Theorem 10.1 with Proposition 10.2 (LV lines 2885–2896, 2916–2918) |

Headline theorems of the README (Summary and Scope item 6): the coefficient non-density theorem (§6.1),
the higher-dimensional Lawrence–Venkatesh theorem and its finiteness clause (§§7.6–7.7), the integral
hypersurface parameters (§9.3), Shafarevich finiteness (§§10.6, 10.9, 10.10), with the point-count bound
(§7.8) and the Eulerian criterion (§8.4). §9.3 and §8.4 are stated; the module docstring names the others
with the missing carriers (no abelian scheme over a non-field base, no numerical equivalence classes and
no étale or crystalline cohomology of a family at the Tau Ceti pin: grep of the pinned tree). Padding
probe: none of the six declarations follows from one tactic or one library lemma, restates a definition
or mirrors a Check.

### README targets and conventions

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions, modular character | Borel of `GL₂` | `det Ad|Lie B = a/b`; inverse `a⁻¹b`; pairing with `diag(t,1)`: `−1` | consistent with §§5.1, 5.3 |
| Conventions, Hodge–Tate signs | `ℚ_p(−1)`, `H¹(E)`, `V_pE` | weight 2, jump `+1`, HT `−1`; jumps `0,1`, HT `0,−1`; jumps `0,−1`, HT `0,1` | consistent in §§5.4, 5.8, 7.2, 8.1 and with SheafConvolutionOnAbelianVarieties §3.3 (its README:672) |
| §1.9 route | `(γF^m)^r = N·F^(mr)`, `k = r·ord N`; `C₃`, `FγF⁻¹ = γ⁻¹` | `(NF^(mr))^(ord N) = F^(mr·ord N)` as `F^(mr)` centralizes `Γ`; `(γF)² = γγ⁻¹F² = F²` | ok |
| §2.1 Check 4 | standard free `V = E^N`; nonsplit quadratic form over `E` | coordinatewise `σ` is a rational lift; a lift needs `σ^*q` similar to `q`, which can fail rationally | "need not be surjective" is right for `GO`, and surjectivity holds on points for `GL`, `GSp` |
| §2.2 with the MordellLawrenceVenkatesh contract | `E₀×E₀` swap, `φ = (a,b)∘swap`; `σ = id`, `d` factors | `k = 2`, `Z(φ) ≅ Z(ab)` on one factor; `dim Z_G(id) = d·dim H` | ok |
| §2.3 `O₂` Check | `r_b(x,y) = (by, b⁻¹x)` | by `diag(a,a⁻¹)`: `r_(a²b)`; by `r_c`: `r_(c²/b)`; classes `ℚ₃^×/ℚ₃^(×2)`: 4 | ok |
| §2.3 `SL₂² ⋊ C₂` Check | `λ = (diag(t,t⁻¹), 1)`, `g = (a,b)·swap` | `λgλ⁻¹ = (λ₁a, bλ₁⁻¹)·swap`, no limit; image `⟨(1,D),(1,W)⟩` | ok; the same instance is LanglandsParameterStacks §2.3's Check |
| §2.5 | `SL₃`: `diag(t,1,t⁻¹)`, `diag(t²,t,t⁻³)` | root weights `1,1,2` and `1,4,5` | ok |
| §2.7 | weights `2,0,−2` | `T(1/2)=1`, `T(1)=2`, `T(2)=2`, `T(3)=0`; `T(A)=T(A+h⁰)=B` | ok |
| §2.9 route | `GL₂×GL₂ ⊂ GL₄`, `diag(1,2,3,4)` | one `GL₄`-class, `binomial(4,2) = 6` geometric `G`-classes (3 in the normalizer with the swap) | step unowned: S01 |
| §2.10 | `H = 1` in `GL₂`; diagonal torus of `GL₃` | 2 classes of pairs; 13 ordered set partitions | ok |
| §2.11 | `GL₂/ℚ₃` tori; `𝔾_a ⋊ μ₂`; `ℤ/p` over `𝔽_p` | `H¹(N)`: 4, `H¹(T) = 1`; 4 ↔ 4; `p` classes | ok |
| §3.1 route | `M → M^ad × M/M^der` | an isogeny, so cocharacters with equal images are equal; the `(H′)^ad` part needs the flat sections of `Lie M^der` to be a constant sub-Hodge structure | input is the general fixed part: S02 |
| §3.1 polarization Check | isotropic planes of `Σx_i²` in `ℂ⁴` | `v ∈ F¹ ∩ F̄¹` gives `Σ|v_i|² = 0` | ok |
| §3.3 | curve with varying plus constant elliptic `H¹` | `1 ≥ 0 + 1` in `X × D_mon`; `3 ≥ 2 + 3` false in `X × LGr(2,4)`; route `dim U ≤ d − codim Z ≤ 0` | ok |
| §3.4 route | `σ⁻¹(H^m)`; norm; Krull | finitely many coefficients in `ℚ̄_p`, so a finite extension of `K_v`; conjugates stay in the ideal of the `K_v`-rational period equations; `H′ ∈ ∩𝔪^k` in the domain `R/I_W` | ok |
| §4.1 with the new correction | `SO₂`: `{(a,b,ab)}`; `SO₄`: image of `SL₂³` | pair projections onto, `dim 2 < 3`; `dim 9 < 12`, kernel `{(1,[±1,z])}` of dimension 3 | hypothesis needed and present |
| §4.2 | 8 indices, `σ = (13)(24)(57)(68)` | orbits `{1,3},{2,4},{5,7},{6,8}`, two classes each | ok |
| §5.3 | `GL₆` `2+2+2`; `GL₁₂` `4+4+4` | `det Ad|Lie P = det m_bottom⁴·det m_top⁻⁴`, so `4(a₀ − a₂)`; generic `(2,1,0)`; `(1,4,1)`: `dim F¹∩f₀ = 1`, `dim F¹∩f₁ = 5`, averages `1/4, 1, 1/4` against `1/2` | ok |
| §5.6 | `𝔾_a`, `ψ = −1`; `ψ(x,y) = (−x,2y)`, `u = (2,0)` | `v = −u/2`; `u + ψ(u) = 0`, `ψ(v) − v = (2,0)` for `v = (−1,0)` | ok |
| §5.9 | `SL₂`, `w = s`; general | both sets `{−α}`; first set is minus the inversion set, of size `ℓ(w)` | ok |
| §5.10 | `GL₂`, weights `(1,0)`; LV Proposition 11.3 | `T(1) + T(1) = 2 > B = 1`; source conclusion "greater than `e`" (LV lines 3711–3721) | ok |
| §7.2 (repaired) | `GSO₄`: `diag(t,1,t,1)`, `diag(t,t,1,1)`; `ℚ_p(−1)`; ordinary `H¹(E)` | multipliers `t`, `det = t²`; planes `⟨e₁,e₃⟩`, `⟨e₁,e₂⟩` isotropic, meeting in a line; HT `t⁻¹`, inverse `t`; HT `0,−1`, inverse `0,1` | ok |
| §7.5 | `z ≤ h⁰`, `e = d` | `3h⁰/2 + d ≤ A + h⁰` iff `h⁰/2 + d ≤ A`, true as `A ≥ h⁰ + d` | implies §7.4's hypotheses |
| §7.8 | `M = 1`; general `M`; `x = q^(m/2+1) ≥ 4` | `‖g₁‖² = 19`; `‖g_M‖² = (2M+1)(8M²+8M+3)/3`; `|μ̂(j)| ≤ x^j`; `sup|g∗μ| ≤ (2M+1)b + (32/9)x^(2M) < (2M + 1 + 32/27)b`; `dim Z ≤ 3b²(2M + 2.19)/(8M²+8M+3) ≤ 3b²/M` | holds with the cutoff at `2M` |
| §8.1 | `GL`, `GSp` (`n` even), `GO` (`n` odd); `GO₂`; `GO₆` | reductions `2Σm² < N²+N`, `Σm² < N²/2 + N`, `Σm² − m_mid < N²/2`; `4 < 4` false; `h⁰ = 8`, `16 < 20` | ok with the parity restriction |
| §8.2–8.4 | `n = 2, 3`; reference law | `β = (1/4,1/2,1/4)`, `(1/36,2/9,1/2,2/9,1/36)`; second moments `1/2`, `2/3`; `Σ_(j≥1) 1/(2·3^j) = 1/4`; `Σ j²/3^j = 3/2`; `(n+1)/6 ≥ 3/2` iff `n ≥ 8` | ok |
| the four Eulerian gaps | `n = 2, 3, 4`; `(1,1,0,0,1,1)∗(1,1)` | `Σ qA = 1, 6, 36`; `Σ(q−(n−1)/2)²A = 1/2, 2, 10 = n!(n+1)/12`; `121 ≥ 11`; convolution `(1,2,1,0,1,2,1)` fails at the zero | precise; the interval hypothesis is needed and present |
| §8.5 | `GL₂` profile, `c ≥ 5(e+4)` | `x ≤ 1/5`, `T(x) + T(x) = 2x ≤ 2/5 < 1 = B` | ok |
| §8.6 | cubic curve; quartic surface; quintic threefold; `(n,d) = (5,4)` | `(1,1)`; `(1,19,1)`; `(1,101,101,1)`; `(0,21,141,21,0)` | ok |
| §8.7–8.8 | plane quartics; `n = 2`; normal limit | `14` against the printed `19` (LV lines 2960–2965); `d²/2`; `E|D| ∼ √(n/6)·√(2/π)`; `(n+1)/(6n) ≤ 1/4` iff `n ≥ 2`; `40/√n < 1/2` iff `n > 6400` | ok |
| §9.2 | `(3,3)`, `(3,4)`, `(5,3)`; quadrics | Jacobian degree `(n−1)d/2 − n − 1`: `−1`, `0`, `0`; primitive rank 1 or 0 | only cubic surfaces excepted |
| §10.1, §10.7 | `([2]×id)⁻¹(H′)` | `Stab = E₁[2] × 0`, order 4; `d(H) = 4d(H′)` | ok |
| §10.3 | `ℚ(i)`, `S = {(2+i)}` | `1/(2+i) = (2−i)/5`: `x² − (4/5)x + 1/5`; `disc ℤ[1/10][i] = −4` | ok |
| §10.6, §10.9 against LS | exceptional degrees | LS excludes `binomial(a(i)+a(i+1), a(i+1))/6`, `i ≥ 2` (LS lines 3885–3889, 4014–4019); here `D_j`, `j ≥ 1`, `D₁ = 53130/6 = 8855` | same set |
| §10.10 | `q(mh)`; `φ² = 2` | `m²q(h)`; genus `1 + φ²/2 = 2` | ok |

## Verified sound

- **Declarations read:** 6 of 6 in `Suggested.lean` (2 theorems, 4 definitions), with the module
  docstring. Single `import Mathlib`; no `set_option`, `lemma`, `#check`, sorry'd data, `True`
  placeholder or process comment. Every Lean name appears in the README and every backticked name of
  this roadmap in the README is declared.
- **Targets read:** all 79 numbered sections of Layers 0–10, the conventions, the supplier contracts,
  the worked examples and the source corrections: every line of both files (README 3405 lines).
  Every section has a `*Needs:*` line and a locator; every definition has at least three Checks.
- **Round-1 repairs:** 4 of 4 verified (table above).
- **Locators verified against the cached texts in this pass: 31.** LS lines 1191–1200, 1832–1866,
  2645, 2813–2848, 3082–3100, 3133–3137, 3205–3220, 3259–3279, 3391–3409, 3417–3446, 3549–3556,
  3605–3625, 3722–3745, 3812–3835, 3877–3891, 4013–4043, 4268–4310. LV lines 536–569, 2673, 2709,
  2853–2880, 2885–2903, 2916–2919, 2929–2970, 3113–3128, 3341–3379, 3703–3721, 3865–3869. Beauville
  lines 84–89 and 129–136. BC lines 1341–1352. The page markers agree with the stated pages.
- **Checks tested:** about 55 recomputed (the table lists those with numerical content); none false or
  vacuous.
- **Sibling citations checked:** the heading of every cited section, 121 ids in 33 roadmaps, on main or
  at the open head (`roadmaps show`); statements read and compared for MordellLawrenceVenkatesh
  §§0.3–0.4, 0.24, 1.2, 1.13, SheafConvolutionOnAbelianVarieties §§3.1, 3.3, 4.8, 5.2–5.3, 6.7, 8.2–8.3
  (§8.2 is a bold paragraph of its Layer 8, README:1307), LanglandsParameterStacks §§2.3–2.4,
  ArithmeticGaloisRepresentations §1.11 (the named target at its README:1496),
  HeightsRationalPointsAndObstructions §5.2, LefschetzPencilsAndVanishingCycles §§5.8, 5.10,
  DeligneWeightsAndPurity §2.2, PadicHodgeTheory §4.4, ClassicalArithmeticCompletion §2.18,
  ReductiveGroupsPartII §RG2.0.2 (target *smooth-group-analytic-charts*, its README:640),
  ArithmeticGaloisDuality §R02.3.1 (Hermite, its README:1954), AbelianSchemesAndArithmeticModuliPartII
  §B2.4 and Layer B3, MixedHodgeModulesAndIrregularHodgeTheory §§3.3, 5.6 and
  MappingClassGroupsAndCanonicalRepresentations §5.4. Only S01 and S02 differ from what the README
  says or needs.
- **Pinned declarations:** the 15 Tau Ceti names and 3 Mathlib names of the supplier contracts exist
  at the pins in the stated files (`Parabolic.lean` 154, `Mixed/Basic.lean` 72, `Mixed/Morphism.lean` 77,
  `AbelianVariety/Basic.lean`, `Effective/Basic.lean` 45, `RegularSequence.lean`, `Filtration.lean`,
  `Finsupp/Weight.lean`).
- **Declared gaps:** the nine slugs and their `needs` sentences are identical in the README and in
  `design/plan.json` (compared by script); none has supplier `none`. Minimality was searched by object
  over main and the open heads: no other roadmap states discrete log-concave convolution, the descent
  variance or its central limit theorem, the Deligne–André normality, Ax–Schanuel for period maps or
  the relative crystalline comparison; gap:hodge-tate-image-cocharacter is the contract
  SheafConvolutionOnAbelianVarieties states under the same slug. S02 is the one exception.
- **Ownership:** no declaration of `Suggested.lean` shares a fully qualified name with another roadmap
  (`roadmaps grep`; FiniteGroupInvariants has an unrelated `eulerian` in its own namespace). No roadmap on
  main or at an open head defines Hodge–Deligne systems, H⁰-algebras, the semilinear coefficient
  normalizer or strong balance. GaloisSectionsPadicPeriodMaps and LogicAndDefinabilityInNumberTheory are
  later in the merge order and plan none of these objects.
- **Policy:** the pull request changes only files of the package folder; no pull-request number, process
  narrative or machine path in the README or docstrings.

## Not verifiable

- Ownership against the board package `LawrenceVenkateshMethod` was not checked: this checkout has only
  its `reports` folder, and it is on neither main nor the list of open roadmap heads.
- Serre, *Galois cohomology* (§2.11's two locators): recorded as uncertified; not read.
- No Lean was run; the six types were read from the worker's signature transcript.
- The proof routes of §§5.8, 5.10–5.12 and 7.4 were compared with the cited statements (hypotheses and
  conclusions agree with LS Lemmas 8.10, 8.12, 8.16 and LV Propositions 10.6, 11.3), not re-derived.
- LV call their proof of Proposition 10.2 an outline and omit the Hodge-number asymptotics (LV lines
  2915, 2929–2930); the Lean headline rests on §§8.6–8.9, whose orders of magnitude were rechecked and
  whose constants were not.
- Whether the Lefschetz-pencil theorems of LefschetzPencilsAndVanishingCycles §§5.8, 5.10 are stated for
  a base field of characteristic zero as §9.2 uses them was read from their statements (no restriction on
  the characteristic other than the case `p = 2`), not from their layer conventions.

Source independence: 22 passages compared with 4 sources (LS 13, LV 6, Beauville 2, BC 1), none shared beyond formulas, standard names and hypothesis lists the mathematics forces; two examples (LS Examples 6.7 and 8.6) are restated in the roadmap's own conventions with their locators; largest share LS, 84 of 126 lines carrying a locator; contents compared with LS: independent (Layer 0 ↔ §5.2, Layer 1 ↔ §§5.3–5.5, Layer 2 ↔ §§5.6–5.10 with §2.11 added, Layer 3 ↔ §6.1, Layer 4 ↔ §6.2 with §7, Layers 5–6 ↔ §8, Layer 10 ↔ §9, Layer 8 ↔ Appendix A with LV §10.2, Layers 7 and 9 from LV §§10–12, Beauville and BC; eleven layers against five sections and an appendix, not one to one, and the order of Layers 0–6 is forced by the `*Needs:*` lines of §§1.1, 2.1, 3.1, 4.4, 5.12 and 6.1).

## Source issues

- **Error** in LV at Lemma 2.6, proof, printed p. 906 (LV lines 555–559): the source says the transporter of the image closure into the group is finitely many double cosets for that closure, and then passes to its identity component; it should be double cosets for the centralizer of the image, which blocks that reduction; affects the proof; corrected in print at LS, proof of Lemma 5.49, pp. 61–62.
- **Misprint** in LV at the display before (10.8), printed p. 971 (LV lines 2960–2965): the source says the parameter space of degree-`d` hypersurfaces in `ℙⁿ` has dimension `binomial(n+d, d−1) − 1`; it should be `binomial(n+d, d) − 1`; affects nothing.
- **Error** in LV at Lemma 12.1, printed p. 995 (LV lines 3865–3869): the source says the cutoff is `q^((n/2+1)N) < b/3`, though its kernel has frequencies up to `2N`; it should be `q^((n/2+1)·2N) < b/3`; affects a stated result.
- **Error** in LS at Lemma 6.5, p. 67 (LS line 3082): the source says the index-class lemma holds for every `SO_N`; it should exclude `SO₂` and `SO₄`, whose adjoint quotient is not simple; affects nothing.
- **Error** in LS at §5.8.2, p. 57 (LS lines 2645–2647): the source says that for reductive `G` the parabolic determines the filtration on every representation up to reindexing; it should say it does not (`t` and `t⁻¹` on `𝔾_m`); affects nothing.
- **Gap** in LS at Lemma 5.49, p. 61 (LS lines 2819–2822): the source says the Frobenius roots are algebraic integers of the given absolute value and then applies Faltings's lemma; it should assume characteristic polynomials with integer coefficients; affects a stated result.
- **Gap** in LS at Lemma 8.10, p. 78 (LS lines 3549–3556): the source says the balanced candidate objects exist for a semisimple crystalline representation, with no purity in the statement; it should assume purity of one weight, as its last step uses; affects a stated result.
- **Misprint** in LS at Definition 9.1, p. 85 (LS lines 3877–3879): the source says a hypersurface is primitive when no geometric point translates it to itself; it should be no nonzero geometric point; affects nothing.
- **Misprint** in LS at the proof of Lemma A.4, p. 91 (LS line 4280): the source says the propagated bound at index `i` has the crossing index `j` in the denominator; it should have the running index `i`; affects the proof.
- **Misprint** in LS at the proof of Lemma A.5, p. 91 (LS line 4303): the source says the tail sums are greater than the geometric reference; it should be less than, giving the upper bound `3/2`; affects the proof.

## For the human reviewers

- **Licence.** The LV text was read from a publisher-formatted copy on an institutional host (`sources.toml`, source `LV`, `fetched_from`); whether that host may distribute it was not settled. The arXiv v3 has the same numbering.
- **Licence.** Source `Serre` is recorded as uncertified and was not read; §2.11 cites it by locator for two standard theorems.
- **Scope.** Four declared gaps ask ClassicalArithmeticCompletion, a roadmap on main, for statements on descent statistics, one of them a central limit theorem (`README.md:340–343`); whether that roadmap takes them is its maintainers' decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2bca2d04be645537788247cd061b61795a981ab6", "job": "RT-MordellLawrenceVenkateshPartII~2a", "model": "fable", "worker": "chris-x55"} -->
