# Review of QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (pull request #1842 at 70c9a0e)

**Verdict:** needs changes

Incremental re-review of the 23 lines changed since 3cf9ad8 (all in `README.md`: the Scope paragraph, the GeometryOfNumbersAndQuadraticArithmetic contract, §8.6, the Layer 8 Dependencies and the References). The previous finding R01 is repaired. One P3 remains, introduced by the repair; it is a five-word citation fix. The gate passes, the dependency check reports no problem, `Suggested.lean` is unchanged and elaborates with `sorry` as the only warning, and every new locator agrees with its source.

## R01 (P3) — §8.6 Check names `borel_density_unipotent_generated` for the Zariski-density conclusion that GeometryOfNumbersAndQuadraticArithmetic calls `borel_density_zariski`

**Location.** `TauCetiRoadmap/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md` line 1405, second Check of the lattice-form target: "Zariski density of the lattice in S, the conclusion of `borel_density_unipotent_generated`, fails here".

**Claim.** The Check attributes the conclusion "the lattice is Zariski dense in S" to the supplier declaration `borel_density_unipotent_generated`.

**Witness.** GeometryOfNumbersAndQuadraticArithmetic at the head of #851, README line 1578: `borel_density_unipotent_generated` concludes that "every Γ-invariant linear subspace is H-invariant" (for a rational representation ρ); the same paragraph ends "This proves `borel_density_zariski`", and line 1840 applies `borel_density_zariski` "to identify its real Zariski closure with SO(q)". So the supplier's Zariski-density statement carries the name `borel_density_zariski`; `borel_density_unipotent_generated` is the invariant-subspace statement. The Check's mathematics is right either way: for `S = SO(2)`, `Γ = {1}` and the standard representation on ℝ², every line is Γ-invariant and none is S-invariant, so the invariant-subspace conclusion fails too, and the Zariski closure {1} is not SO(2).

**Repair.** Replace "the conclusion of `borel_density_unipotent_generated`" by "the conclusion of `borel_density_zariski`" (or "the Zariski density that `borel_density_unipotent_generated` yields"). Tested on the refuting instance: with the name corrected, the Check still separates the lattice form (unipotent elements only) from the supplier's unipotent-generated form (full Zariski density), and line 179's description of `borel_density_unipotent_generated` as the supplier's narrower-hypothesis statement needs no change.

## Previous findings

- R01 — repaired: line 179 now cites `ActionErgodicKernel` with `exists_actionErgodicKernel` (GeometryOfNumbersAndQuadraticArithmetic #851 README line 1502, inside §4.2, lines 1368–1687) with that paragraph's hypotheses and conclusion restated accurately, and the Borel density used by §8.6 is stated as a target of this roadmap with Morris locators; the §8.6 `*Needs:*` and Layer 8 Dependencies name the kernel and the new target. The repair introduced the P3 above and nothing else.

## Verified sound

**Gate and direction.** The worker's gate at 70c9a0e: `set_option=0 … depcheck=0 … build=0 OK`. Rerun of the dependency check on the README at this head: `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). Both suppliers the diff touches are earlier in the merge order: AdelicAlgebraicGroups at line 35 and GeometryOfNumbersAndQuadraticArithmetic at line 74, this roadmap at line 287. `git diff --stat origin/main...HEAD` outside the folder: empty. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped or defined only by an open revision. The plan's 22 `gaps` slugs equal the 22 `gap:` slugs of the README (the diff adds none: the previous review's suggested gap was replaced by a supplier citation that exists and by a target stated here).

**Lean.** `Suggested.lean` is unchanged since 3cf9ad8. `lake env lean` on the file from the worktree: exit 0 in 10.7 s, seven `declaration uses 'sorry'` warnings (lines 114, 170, 183, 199, 220, 238, 252) and nothing else. The one-tactic probe, the `#check @name` comparison of the 13 declarations with the README and the headline audit stand as in the previous report. The citations lead `LieGroup.minSmoothnessThree` (README line 56, outside the diff) is at the pin: `TauCeti/Geometry/Lie/Basic.lean:19,41` and `AutomaticSmoothness.lean:66` (`attribute [local instance] LieGroup.minSmoothnessThree`), as the previous report found.

**Changed passages against their sources and suppliers.**

- morris05 (arXiv math/0310402v5; its running heads carry the printed page numbers the README cites, PDF pages 149–152): Proposition 4.7.1 at line 6204, printed p. 139: for a lattice Γ in a closed subgroup G of `SL(ℓ, ℝ)`, the Zariski closure of Γ contains every unipotent element (1) and every hyperbolic element (2) of G. Lemma 4.7.3 (Poincaré recurrence) at line 6220, p. 140; Lemma 4.7.5 (a probability measure on `ℝP^{m−1}` invariant under a unipotent or hyperbolic g is supported on its fixed points) at line 6250, p. 141, with the proof's `[v]gⁿ = [Σ_{k≤r} C(n,k) v Tᵏ] → [v Tʳ]` at lines 6261–6290. The README's hypotheses (closed subgroup of `GL_ℓ(ℝ)`, closure in the coordinate ring with `det⁻¹`) are wider than Morris's `SL(ℓ, ℝ)`; the README's own route (below) proves that form, and Morris's Remark 4.7.2(1) at line 6213 is exactly the README's second Check.
- GeometryOfNumbersAndQuadraticArithmetic #851: `ActionErgodicKernel`/`exists_actionErgodicKernel` at README line 1502 (countable groups on nonempty standard Borel probability spaces first, then the locally compact second-countable continuous-action extension; integral identity; `κ(x,A) = 1_A(x)` a.e. for μ-essentially invariant A), inside §4.2; `ratner_measure_classification` 4.2.5 at line 1667; `borel_density_unipotent_generated` at line 1578 (connected real algebraic H generated by unipotent one-parameter subgroups, lattice Γ, rational ρ: Γ-invariant subspaces are H-invariant) with `borel_density_zariski` derived there (the P3). The README's sentence that the supplier states Borel density only for unipotent-generated algebraic groups is accurate: no other Borel density statement occurs in that README.
- AdelicAlgebraicGroups #792 §2.2 "Parabolic modulus and homogeneous integration" (line 1711) has the bullet "Invariant measure on a coset space (quotient-measure)" for a closed subgroup of a second countable locally compact group, which is what the new `*Needs:*` cites for the S-invariant probability on `S/Γ_S` (finiteness is the lattice hypothesis). AdelicAlgebraicGroups also states "Borel density for S-arithmetic groups" (line 4378: `Γ(M,S)` Zariski dense in a connected absolutely almost simple G): a different statement (arithmetic subgroups of almost simple groups), not the lattice form for an arbitrary closed subgroup S that Ratner's conclusion produces, so no second owner.
- Mathlib at the pin: `MeasureTheory.MeasurePreserving.conservative` (`Mathlib/Dynamics/Ergodic/Conservative.lean:64`, needs `[IsFiniteMeasure μ]`) and `MeasureTheory.Conservative.ae_frequently_mem_of_mem_nhds` (line 197, needs `[TopologicalSpace α] [SecondCountableTopology α] [OpensMeasurableSpace α]`, concludes `∀ᵐ x ∂μ, ∀ s ∈ 𝓝 x, ∃ᶠ n in atTop, f^[n] x ∈ s`). Both apply to a projective space (compact metrizable, Borel) with the continuous map `Λ^k ρ(u)` and the pushed-forward invariant probability.
- nv21: the published text's cache extraction is empty (no extractor at fetch time); the arXiv v3 text (same manifest key, 148 pages) has the argument at §27.3, Lemma 2, lines 6316–6332: translate ν so that x = e, `Γ_S := S ∩ Γ`, choose s with `Γ_S s U` dense, so `Γ_S (sUs⁻¹)` dense (27.5), Borel density "[Mor, 4.7.1]" puts `sUs⁻¹` in the closure, hence S; the unipotent radical is trivial by the compactness criterion. The README's route is this argument, with the same Morris locator, and Lemma 4 there (lines 6341–6351) is the "normal Lie ideal argument" the README names.

**Adversarial pass.** New rows for the changed statements; the rows of the previous report (3cf9ad8) for the untouched statements are carried forward below them.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.6 lattice form, Check 1 | `S = {[[1,t],[0,1]]}`, `Γ = ℤ`; `Γ = {1}` | a polynomial in `a,b,c,d,det⁻¹` restricted to S is a polynomial in t; vanishing on ℤ ⇒ zero, closure = S; `{1}` has infinite covolume, closure `{1}` ∌ `t = 1` | lattice hypothesis needed, Check correct | none |
| §8.6 lattice form, Check 2 | `S = SO(2)`, `Γ = {1}` | rotation by θ has eigenvalues `e^{±iθ}`, unipotent iff θ ∈ 2πℤ; unipotent set `{1} ⊆ {1}`; closure `{1} ≠ SO(2)`; standard rep: every line Γ-invariant, none S-invariant | lattice form holds, both supplier conclusions fail; name misattributed (R01) | R01 |
| §8.6 lattice form, Check 3 | `u = [[1,1],[0,1]]`, `v = (0,1)ᵀ` | `Nv = (1,0)ᵀ`, `N²v = 0`; `uⁿv = (n,1)ᵀ`, `[(1,1/n)] → [(1,0)]`; eigenspace of u is the line `(1,0)`, unique fixed line; Lemma 4.7.5 forces the point mass; the rotation-invariant measure has no atom | Check correct | none |
| §8.6 lattice form, step 1 | `k = 0` (W = 0); `S/Γ_S` with full-support Haar | `Λ⁰W` is the scalar line, trivially fixed; the set `{s : ρ(s)W is ρ(u)-stable}` is the preimage of the closed fixed locus, right-Γ_S-stable, conull; its open complement is null hence empty; `s = 1` gives `ρ(u)W = W` | sound (ρ(u) unipotent ⇒ `Λ^kρ(u)` unipotent, a decomposable fixed line fixes the subspace) | none |
| §8.6 lattice form, step 2 | `V_d = det^{−d}·(deg ≤ d)`; `f = x₁₁⁵` | `R_g(det^{−d}q) = det(g)^{−d}det(x)^{−d}q(xg)`, `deg_x q(xg) ≤ d`: V_d is R-stable; `x₁₁⁵ ∉ V_d` for ℓ ≥ 2 (would need `deg(det^d x₁₁⁵) = 5 + ℓd ≤ d`), but `det^{−5}x₁₁⁵ ∈ V_5` vanishes on Γ_S iff `x₁₁⁵` does, and `det u = 1` transfers vanishing at u | route sufficient; the one-line reduction from a general `det^{−e}q` to `det^{−deg q}q ∈ V_{deg q}` is left implicit | none |
| §8.6 lattice form, GL vs SL | `S = ℝ^× ⊂ GL₁`, `Γ = {±2ⁿ}` | unipotent elements `{1}`; closure of Γ in `ℝ[x, x⁻¹]`: infinitely many zeros ⇒ all of `ℝ^×` | consistent with Morris (2) (hyperbolic part, unused) | none |
| §8.6 route, density step | `Γ_S s U` dense, `Z := Zcl(Γ_S)(ℝ) ∩ S` | `Γ_S s U = Γ_S (sUs⁻¹) s ⊆ Z s`; `Z s` closed ⇒ `Z s = S` ⇒ `Z = S` (s ∈ S); matches nv21 (27.5) | sound, given the source's translation of ν so that the orbit passes through e (then `Γ_S = S ∩ Γ`); the README's "Γ_S = S ∩ Γ" presumes that translation, as the source does | none |
| §8.6 route, ergodic kernel | compact `Γ\G_∞` (standard Borel), U locally compact second countable, μ U-invariant | kernel values U-invariant and U-ergodic a.e., `μ = ∫ κ(x) dμ`; each component `G⁺`-invariant ⇒ μ is (integral of invariant measures) | hypotheses of `exists_actionErgodicKernel` met | none |
| §8.6 route, Poincaré in Mathlib | `ℝP^{m−1}`, `f = Λ^kρ(u)`, μ pushed forward | `IsFiniteMeasure` (probability), second countable, opens measurable, `MeasurePreserving` by invariance ⇒ a.e. `[v]` has `f^{[n_k]}[v] → [v]`; with `[v]gⁿ → [vTʳ]` this gives `[v] = [vTʳ]` fixed | Mathlib statements cover Lemma 4.7.3's use | none |
| Carried forward (previous report, 3cf9ad8): Conventions Fourier sign | `b(η)=e^{−π(η−1)²}`, x = 1/4 | `−i·e^{−π/16}` vs `+i·e^{−π/16}` vs `e^{−ix}e^{−x²/(4π)}` | separates the three conventions | none |
| (r1) §0.1 forward kernel | indicator of [0,1] at η = 1, 1/2 | `0`; `2i/π`; Mathlib kernel `−2i/π` | correct | none |
| (r1) §0.1 density j | SU(2), ax+b | `j = (sin(|x|/2)/(|x|/2))²`; `j(−x)=e^{x₁}j(x)` | even iff unimodular | none |
| (r1) §0.2 Nelson operator | character `e^{itx}`; trivial rep | `Δ = 1 + t²`; `Δ = 1` | sign pinned | none |
| (r1) §0.3 Definition 3.1 | identity; `dπ(∂_x)`; `e^{ix²}` multiplier | commutators 0 / order 1 / `[∂_x, M] = 2ixM` unbounded | `Ψ⁰ ⊊` bounded | none |
| (r1) §0.5 `quantize` | `E = 0`; character with inactive cutoff; `M = 0` | `b(0)·v`; `b(t/2π)·v`; `b = 0`, bound 0 | consistent, not vacuous | none |
| (r1) §0.5 adjoint | even real χ | `conj(a^∨(−x)) = (ā)^∨(x)` | `Op(a)* = Op(ā)` | none |
| (r1) §1.2 `C₁` | linear symbols | `C₁(a,b) − C₁(b,a) = ξ([x₀,y₀])` | factor ½ forced | none |
| (r1) §1.2 `C₂` Heisenberg | `[X,Y]=Z` | `{x,y} = ½[x,y]`; `e^z − 1 − z = −ε²/2+…` | `C₂ ≠ 0` | none |
| (r1) §1.9 bound vs L¹ | `a_K = θ(ξ)ψ(2^{−K}ξ)` | `‖a_K^∨‖_{L¹} ≍ K`; telescoped L¹ ≤ `2‖ψ^∨‖` | strictly stronger than L¹ | none |
| (r1) §1.10 symmetrization | Weyl algebra `X=q, Y=∂, Z=−1` | `sym(⟨ξ⟩⁴) = Δ² − Z²` | correct | none |
| (r1) §2.1 SL₂ parameters | `I(s)`, `D_k` | `λ(H) = ±s`; `k − 1` | ρ-shift consistent | none |
| (r1) §2.4(ii) | quadratic Casimir | `γ(sym p) − p = −|ρ|²` | consistent | none |
| (r1) §2.6 a-priori estimate | `G = H = {1}`, `a(h) = e^{1/h}` | `e^{1/h} > h^{−M}` | boundedness hypothesis present | none |
| (r1) §2.7 invariant distance | `q(x) = x²`, `x = h^δ` vs `h^{δ/2}` | `h^{2δ} < h^δ` vs `h^δ` | correct; source error listed in r1 | none |
| (r1) §3.1 dilation exponent | 2-dim orbit; SO(3) sphere | `t^{−1}ω_{tO}`; mass `2r = 2l+1` | exponent d | none |
| (r1) §3.2 fibre counts | 𝔰𝔩₂ over ℂ, ℝ | (2,1,1), (3,1,2) | bounds 2, 3 | none |
| (r1) §3.3 Rossmann SU(2) | spin l | `2 sin(rθ)/θ = ∫_O e^{xξ}dω` | needs `j^{1/2}` | none |
| (r1) §3.4 limits | spin-l, `h → 0`; U(1); point masses | `h(2l+1) → 0` vs 1; `in → ∅` | topology separates | none |
| (r1) §3.6 generic criterion | Sp₄(ℝ) holomorphic DS | GK dim 3 < 4 | empty limit | none |
| (r1) §3.7 trace exponent | character of ℝ; spin l | `d = 0`; `h·dim π = 2` | consistent | none |
| (r1) §3.9 approximate inverse | `G = ℝ`, `N = 2` | `4 · 1/4 = 1` | square used | none |
| (r1) §4.1 κ | `K = SO(3)`, torus | `(1+l+l²)² ≥ (2l+1)²`; `2L > r` | source error listed in r1 | none |
| (r1) §4.2 Plancherel mass | compact G, open U | `Σ dim π·dim π^U = vol(U)^{−1}` | consistent | none |
| (r1) §4.5 conjugation in `H_σ` | SO(3) ⊃ SO(2) | `1` vs `0`; `−1` vs `1` | (18.6) misprint | none |
| (r1) §4.5 compact H | σ of dim 2 | `H_σ = 1/2` | normalization pinned | none |
| (r1) §5.2 orthogonal, Lean | SO(3) ⊃ SO(2) | `X²+a²+b²+c²` vs `X²+a²`; coprime iff `b²+c² ≠ 0` | iff both ways | none |
| (r1) §5.2 small ι | `ι = ∅`, `Unit` | `(1,1)`; `(X²+b², 1)` | both sides true | none |
| (r1) §5.2 unitary, Lean | GL₂ ⊃ GL₁ | common root iff `bc = 0` | iff | none |
| (r1) §5.2 `ggpSpectralPolynomial` | `m = 1, x = 0`; `m = 0`; 𝔰𝔬₄ | `1`; `1`; forced root removed | needed | none |
| (r1) §5.3 torsor, Lean | SO(3) ⊃ SO(2) | `{b²+c² = s}`; `s = 0` two lines; `s < 0` empty over ℝ | consistent | none |
| (r1) §5.3 torsor, `ι = Unit` | 𝔰𝔬₂ ⊃ 𝔰𝔬₁ | fibre `{y}`, `h = 1` | Pfaffian encoded | none |
| (r1) §5.3 unitary torsor | GL₂ ⊃ GL₁ | `bc = p`, stable iff `p ≠ 0` | consistent | none |
| (r1) §5.3 surjectivity | four models | always solvable over k̄ | nonempty without stability | none |
| (r1) §5.3 sphericity | SL₂ on ℙ¹ | Borel stabilizer a torus; nilcone | trivial stabilizer needed | none |
| (r1) §6.1 `d_M = dim S` | SO(3)⊃SO(2), GL₂⊃GL₁ | `d_G + d_H = 1 = dim H` | holds | none |
| (r1) §6.2 narrow symbol mass | `b(hη) = h^{δ′dim s}Θ^∨(h^{δ′}η)` | `∫ b = h^{dim s}` | cancellation confirmed | none |
| (r1) §6.3 separation and tail | GL₂ ⊃ GL₁, `t = 2`; `Ξ(diag(t,1))` | `3r < √5/2`; `X^{−1/2}log X` | partition needed; polynomial gap right | none |
| (r1) §7.1 weights and PSL₂ window | spin l, `l = 1`; `h = 1/10` | weights `1, 2, 0`; `D_8, D_10` | consistent | none |
| (r1) §7.7 example polynomial | `q = 5, α = 2, n = 4` | `341/64 > 2`; `−5/2 < 1` | source error listed in r1 | none |
| (r1) §8.4 rigidity | principal SL₂ ⊂ SL₃ | e, not e² | full centralizer needed | none |
| (r1) §8.7 components | binary anisotropic; definite in indefinite | index 2 / trivial vs `{±1}` | source error listed in r1 | none |
| (r1) §9.1 periods | two copies | sum 2, not 4 | multiplicity once | none |
| (r1) §9.5 scaling | Haar times c | both sides `c^{−1}` | consistent | none |
| (r1) Global setting | `τ(G) = τ(H) = 2` | SO(n), U(n): 2; tori `2` | consistent | none |

**Seeded sample.** The sample targets (0.2, 0.5, 1.1, 1.8, 1.12, 2.2, 2.5, 2.6, 3.5, 4.1, 6.4, 7.2, 7.8, 8.2, 8.6) lie outside the diff except 8.6, whose new locators are verified above (morris05 lines 6204, 6220, 6250; nv21 arXiv v3 lines 6316–6351 for the route the published Lemmas 27.8–27.11 carry); the previous report's sample verification against the published text stands for the rest. The published-text cache file for nv21 (sha 85e14654…) contains no extracted text; the arXiv v3 copy under the same manifest key is the readable one, with the lemma numbering of the published version renumbered (published Lemma 27.8 = arXiv §27.3 Lemma 2).

**Ownership and duplication.** `roadmaps grep -i 'Borel density'` over main and the 467 open heads: AdelicAlgebraicGroups (S-arithmetic form, lines 240, 4378, 4436), GeometryOfNumbersAndQuadraticArithmetic (unipotent-generated algebraic form, line 1577) and this roadmap; no roadmap states the lattice form for an arbitrary closed subgroup, so this roadmap is its owner as the Scope now says. Pinned Mathlib and Tau Ceti have no Zariski-closure or Borel-density statement for lattices (grep `Borel density`, `Zariski` with `lattice`: none). Ownership against open pull requests was checked through the roadmaps index of 2026-11-07 and the sibling checkouts the brief lists.

**Shape.** The new target has its locators, a `*Needs:*` line naming only pinned Mathlib declarations and an earlier supplier, and three Checks that compute values and name a wrong model; the Scope lists the new ownership; the References entry for morris05 matches the manifest (`morris05`, arXiv math/0310402v5, certified; the manifest's `year = 2003` is the arXiv v1 year, the README's 2005 the book's). No process words, pull-request numbers or paths in the diff.

## Not verifiable

- rossmann78, kostant78, barbasch-vogan80, rangarao72, kostant63, kostant59, whitney57: settled as uncertified; outside the diff; not read.
- The published pagination of nv21 Lemmas 27.8–27.11 (pp. 183–186) could not be rechecked this round: the published-text cache file is empty and the arXiv v3 text is paginated differently (the argument is on its pp. 129–130). The previous report verified the printed pages.

## Source issues

- **Misprint** in morris05 at Lemma 4.7.3, printed p. 140: the measure is said to be a T-invariant probability measure "on A", a set not introduced; it should be on Ω; affects nothing.
