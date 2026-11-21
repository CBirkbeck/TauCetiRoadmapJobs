# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #2910 at 39bcc3d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** needs changes

**Summary.** One finding blocks acceptance: 7.31a (b) asserts that the line bundle `ℒ_A` extends to a cubical line bundle on `G` over the normal model `Y`, with its two isomorphisms, but the README gives no proof of that step and no source, and itself names the obstruction; the consumer roadmap takes exactly this clause. Everything else in the sample checked out: every [FormalProof] locator names a file and a declaration that exist and state what the README says, and [DN] and the Stacks lemmas support 9.1 and 7.17a as written. There are three small corrections and two format notes, none blocking. A human should note that the main source is an unrefereed Lean repository and that Lan's two papers could not be read.

## R01 (P2) — 7.31a (b) asserts that `ℒ_A` extends to a cubical line bundle on `G` over the normal model `Y`, and nothing supports the extension of the line bundle or of its two isomorphisms

An implementer of 7.31a (b) has no route and no reference for this clause, and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties builds on it: its Conventions take "the cubical line bundle that … §7.31a (b) attaches to the principal polarisation and to `w_0`", and the Scope paragraph of this README (line 558) says the same.

The statement is on line 297: "Then `ℒ_A` extends to a rigidified symmetric line bundle `ℒ_G` on `G` with a cubical structure, and these isomorphisms extend". The Route (lines 449–455) covers only what follows once a line bundle on `G` is given: `GlobalTheory.T.exists_cubical_rigidified_extension` extends the rigidification, the symmetry and the cubical structure over a normal locally noetherian base, and I confirmed that its hypotheses include a line bundle `M` on `G` restricting to `L`. For the line bundle itself the Route says "is not given here, and no source is cited for it", and explains why the obvious argument fails: `Y` is only normal, and on `G` over a normal base that is not regular the closure of a divisor of `ℒ_A` need not be Cartier. The declaration it then names, `GlobalTheory.T.exists_rigidified_symmetric_cubicalBundle_extension`, is stated for the unitary moduli scheme of (b′) on a model satisfying chart conditions of that proof (I read its statement), not for the model `Y` that the Route of (b) builds from Lan's models for a general datum of type A or C.

The smallest change is one of these two:

- remove the two sentences "If moreover the lattice `L` … the same holds on every `Y_L` below by pull-back" from the statement of (b), keep the definition of `ℒ_A` and its properties on `A` (which I verified: `φ_{ℒ_A} = λ∘(w_0 + w̄_0) = λ`, `(a × 1)^*Λ = (1 × ā)^*Λ`, `ℒ_A ≅ (1, w_0)^*Λ(ℒ_A)`), and let (b′) (ii), which [FormalProof] proves, carry the cubical line bundle; the Scope sentence on line 558 then names (b′), and the consumer cites (b′) (ii);
- or keep the clause and give it a complete route or a source that proves the extension over a normal base, with its hypotheses. Over the regular locus of `Y` the README's own argument works (the closure of a divisor is Cartier there, and an isomorphism of rigidified line bundles extends because the fibres of `G` are irreducible); what is missing is the non-regular locus at the bad primes.

## C01 — The first two Checks of 6.9a are not instances of 6.9a: neither `𝔾_m` nor an elliptic curve carries an action of `𝒪_E`

The Checks "`G = 𝔾_m`: `H = 𝒪²`, `α = (1, 0)`, `β = (0, 1)`" and "A supersingular elliptic curve: `dV = 0`, `α = (0, a)`" (lines 193–194) read as examples of the theorem, but its hypotheses cannot hold in relative dimension one. `𝒪_E` is unramified over the ring of integers of the maximal totally real subfield, so `E` is not imaginary quadratic (every quadratic field ramifies over `ℚ`) and `[E:ℚ] ≥ 4`; `End(𝔾_m) = ℤ` admits no ring homomorphism from `𝒪_E`, and the endomorphism algebra of a supersingular elliptic curve has maximal commutative subfields of degree two. A constant `𝔾_m` is also not abelian at the generic points.

The computed values are right as values of the chart formulas `H = Lie ⊕ ω`, `α = (dV, a^T)`, which do not involve the action (`V = 1` on `𝔾_m`; `u·β(y) = pair(α u, y)` gives `β = (0, 1)`). Saying so ("in the chart formulas, with `d = 1` and without the action") would suffice; an instance of the theorem itself would be `𝔾_m ⊗ 𝒪_E` at a boundary point, or a supersingular curve tensored with `𝒪_E`.

## C02 — 7.31a (b′) imposes "`M/ℓ^{v_ℓ(M)} ≥ 3` for every prime `ℓ`" on (i) and (iii), which [FormalProof] proves without it

The level condition stands in the common setting of (b′) (line 327), so (i)–(iii) are all stated under it. In [FormalProof] the moduli scheme exists at every level (`N1ab`, in `HeckeKer.lean`: any `Level`, with only `1 ≤ p + q`); the local models at `p` are indexed by levels good at that one prime (`Idx`, in `Clauses.lean`); only the global model asks for a level good at every prime (`N6`, its hypothesis `∀ p, l.GoodAt p`). The README's statement is true but narrower than its source for (i) and (iii). Moving the condition from the setting to (ii), and asking in (iii) for `M/p^{v_p(M)} ≥ 3` at the residue characteristic `p` of `𝔭` only, would state what is proved.

## C03 — The description's list of dependencies omits EquivariantIntersectionTheory

The description says "The README cites roadmaps by name and section: ShimuraCompactifications, PELModuli, SchemeAndStackFoundations, StableReduction (relative ampleness), ArakelovGeometryAndAbelianHeights and AbelianSchemesAndArithmeticModuli on main, and SingularHermitianMetricsAndL2Methods of this family". The head has an eighth supplier with its own contract, EquivariantIntersectionTheory §1.1 (linearisations, used by 9.1; on main), and names AutomorphicBundles §7.3 for comparison in the Scope of 7.31a. The sentence would be right with "…, AbelianSchemesAndArithmeticModuli and EquivariantIntersectionTheory on main". If R01 is settled by the first option, the description's "and, for a principal polarisation, its cubical line bundle" changes with it.

## N01 — In 6.9a the letter `d` is both the relative dimension of `G_0` and, through `w_0 = (1 + √−d)/2` of the Conventions, the prime `d ≡ 7 (mod 16)`; one of the two would read better under another letter (the Conventions already disentangle `E`).

## N02 — The References entry for [FormalProof] says the forms of "6.2a (b), 6.9a, 7.12a and 7.31a (b′)" are taken from it, while forms are also recorded at 6.7a, 7.17a and 9.1; and Faltings 1983, Kollár 1987, Griffiths 1970, Mumford 1972 and EGA II are listed without a theorem or page and are not cited from the text of a target.

## Questions for the author

- Do [Lan16], Propositions 6.1 and 6.4, give the existence of the minimal input for every lattice collection `J` at every prime, as 7.31a (a) states, or only its properties once constructed? I could not read the paper (no copy in a place I may read from), so the locator is unchecked.
- In the Route of 7.31a (b), is the family on Lan's model `M̃^tor_{K,Σ,J₀}` at a bad prime known to be pulled back from a regular base (an auxiliary Siegel model)? If so the bundle `(1 × λ)^*𝒫` would extend there as a biextension and `ℒ_G = (1, w_0)^*` of it would settle R01; I could not check this against [Lan17].

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 6.2a (b) (headline; sampled) | [FormalProof] `GlobalTheory.Published.SemiAbelianLieSeminegative` | char 0 field, smooth rel. dim 1, projective, geom. connected, semi-abelian `G`, mono `W → Lie G`: `deg det W ≤ 0`; README same | agrees | none |
| 6.2a (a) constant `c_λ` | `g = 1` principal; general `g`, `H`-orthonormal `dz₁` | `∫ i dz∧dz̄ = 2 Im τ`, `c_λ = 1/2π`, `h = Im τ/π`; general: `2(g−1)!√deg λ`; README same | agrees | none |
| 6.2a (a) determinant identities | `g = 1` | Faltings `Im τ`; Deligne `(2π)^{−1}·2 Im τ = Im τ/π`; `det h_λ = π^{−1} Im τ` | agree | none |
| 6.2a (a) vs supplier conditions | SingularHermitianMetricsAndL2Methods §5.3 (i), §2.5 (ii) | `H ≥ c·Id` gives `(det H)^{−1} ≤ c^{−g}`; `log(1+t) ≤ log t + log 2` gives (ii) with `m = q` | compatible | none |
| 6.2a (a) [FormalProof] bounds | `period_gram_comparison_bound` | `c·Id ≤ Γ^{−1} ≤ C(e + Σ log(1/‖t_i‖²))·Id`; derivative `≤ C·exp((…)/2)`; README same | agrees | none |
| 6.2a Checks | constant surface on `ℙ¹`; `E₀ × E_t`; `{c} × X(N)` | `O² → O(1)` degree 1; `O ⊕ ω_t` has quotient `O`; fibre `𝔾_m × E`, bundle `O ⊕ ω` | agree | none |
| 6.7a (sampled) | [FormalProof] `LogPeriods`, `BdryChart.IsRiem`, `boundary_chart_log_period_family` | rank `2g`, unimodular alternating `E`, `Im(Px·H·(Py)^*) = E`, `T_i`, co-isotropic `W`, span at 0, kernel clause, `0 < ρ ≤ 1`; README (a)–(e) same | agrees | none |
| 6.7a Check | Tate curve `q = u`, `τ = w/2πi`; `γ = (1 b; 0 1)` | `H = 1/Im τ = 2π/log(1/|u|)`; `Im(1·H·τ̄) = −1`; `P(w+2πi) = P∘T`; `P∘γ` lattice `ℤ+(τ+b)ℤ ≠ ℤ+τℤ` | agrees; kernel clause needed | none |
| 6.9a (sampled) | [FormalProof] `curve_lie_eigen_degree`, `ConjData`, `PowFns`, `FibPF` | Hodge sequence `ω → H → Lie`, conjugate `Fr Lie → H → Fr ω`, `β(a·y) = ρ(ā)^{T,(p)}β(y)`; README same | agrees | none |
| 6.9a chart claims | `beta_comp_alpha`, `dotProduct_beta`, `formal_isomorphism_transport`, `multiplication_by_p_factors_frobenius`, `bil_sy_skew` | `u·β(y) = pair(αu, y)`, `β∘α = 0`; transport preserves pairing; `[p] = V∘Fr`, `lin V = hw`; `S^T = −S` | agree | none |
| 6.9a Checks | `𝔾_m`; supersingular curve; trivial `L_0` | `[E:ℚ] ≥ 4`, `End 𝔾_m = ℤ`: no `𝒪_E`-action in dimension 1; chart values `α = (1,0)`, `β = (0,1)` correct | not instances of the theorem | C01 |
| 7.12a (sampled) | `global_model_power_free`, `fibre_power_free_pullback`, `powFns_of_abelian_generic` | level good at every prime, model dominating local models: `PowFns` and `FibPF` at every point of residue char `p`; `FibPF t₂ z ↔ FibPF t (f z)` | agrees | none |
| 7.17a (headline; sampled) | modular curve; Stacks 0C4K, 0893; `PoinSt` | `12·deg ω = N·#cusps`, ample iff `a > 12d/N`, `a = 0` degree `−d·#cusps`; 0C4K: quasi-compact base, `L ⊗ f^*M^a` ample for `a ≫ 0` | agrees | none |
| 7.17a all `a ≥ a₀` | `a` not a multiple of the descending power `m` | `(L ⊗ ω^r)^m = L^m ⊗ f^*M^r`, ample ⊗ pull-back of ample | true | none |
| 7.31a (b) model (headline; sampled) | `V_𝔭 = W ∪ {𝔭}`; `K(N)`, `N = 3, 6, 12, 15` | complement finite closed set; parts away from `p`: 12 → 3, 4; 15 → 5, 3; 6 → 2 (contains `−I`); 3 → 1 | sound | none |
| 7.31a (b) cubical clause | `ℒ_A = (1, λw_0)^*𝒫`; `exists_cubical_rigidified_extension` | `φ = λ(w_0 + w̄_0) = λ`; declaration needs a line bundle `M` on `G` as input; none supplied over normal `Y` | unsupported | R01 |
| 7.31a (b′) (sampled) | `Host`, `Datum`, `Level`, `Moduli`, `Model`, `N1ab`, `N6`, `N2`, `PushInvertible` | `d % 16 = 7`, prime, `2w_0 = 1 + √−d`; dim `[E:ℚ]/2·p·q`; unique map for reduced `S`; dual-number rigidity; normal, projective, flat; `GoodAt` only in `N6` | agrees; narrower than source in (i), (iii) | C02 |
| 7.31a Checks 2–5 | `X(15)`, `F(i)`; `diag(p^{−1},1)`; `ℓ` odd; Zarhin | `i ∉ ℚ(ζ_15)`; conjugate `[[1,p^{−1}],[0,1]]`; `v_ℓ((1+ℓ^k)²−1) = k`; `dim A_8 = 36` | agree | none |
| 9.1 (sampled) | [DN] Théorème 2.3; `exists_descent_linearised_lineBundle_finiteGroup_quotient` | DN: over `ℂ`, closed points with closed orbit, stabiliser trivial on fibre; formal: number field, integral projective, affine quotient | agree with README's account | none |
| 9.1 Checks | `ℙ¹`, `t ↦ −t` | `O([0])`: action `−1` on `T_0`, degree 1 odd; `O(2[0])`: action `+1`, `= π^*O(1)` | agree | none |

- Source locators checked against the text: 39 ([FormalProof]: 35 declarations in 30 files, all found and read; [DN] Théorème 2.3 and Lemme 2.2, DN lines 390–410, ground field DN line 41; Stacks lines 3885–3896 for Tags 0C4K and 0893).
- Library declarations opened at the pins: `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:38` (absolute ampleness only), `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (over a field), `TauCeti/AlgebraicGeometry/AffineGroupScheme/Torus.lean:59` (tori over a field only), `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/` (affine and relative-affine quotients only); no semi-abelian scheme and no linearisation anywhere in the pinned Tau Ceti or Mathlib. The docstring's claims hold.
- Cross-roadmap citations resolved: 46 section ids on main (ShimuraCompactifications 21, PELModuli 8, SchemeAndStackFoundations 6, ArakelovGeometryAndAbelianHeights 9, AbelianSchemesAndArithmeticModuli 7, EquivariantIntersectionTheory 2, StableReduction Layer 2) and 4 at open heads (SingularHermitianMetricsAndL2Methods §§2.5, 3.2a, 5.3; AutomorphicBundles §7.3); none missing.
- Dependency check output: `depcheck: 170 roadmaps, 1987 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Outside the folder the pull request changes only the three files of the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output. The file declares nothing, so there was nothing to `#check` and no one-tactic probe to run; its three headlines (6.2a, 7.17a, 7.31a) are each named in the docstring with the carriers they lack.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, DiscreteSeriesCoefficientsAndAutomorphicMetrics (open), ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, PELModuli (main); nothing shared. ArakelovGeometryAndAbelianHeights §5.3 owns the growth of the determinant metric and is cited by 6.2a (a); DiscreteSeriesCoefficientsAndAutomorphicMetrics 10.1 owns goodness of invariant metrics on automorphic bundles, a different object; ShimuraCompactifications §7.31 takes the minimal input as a hypothesis, which 7.31a (a) supplies.

Source independence: 14 passages compared with 3 sources ([FormalProof] 10, [DN] 2, Stacks 2), none shared; largest share [FormalProof], 41 of 51 locators; contents compared with [FormalProof] (a Lean source tree without prose, ordered by its directories): independent, the layers being numbered after ShimuraCompactifications, a roadmap.

Research link: The headline targets are inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README and [FormalProof], read). 6.2a is the semipositivity of Hodge bundles of Faltings (1983); 7.17a and 7.31a extend Lan's integral compactifications (2016, 2017); these two rest on the README alone.

## Not verifiable

- [Lan16], Propositions 6.1 and 6.4, pp. 32–35 (7.31a (a)): the DOI resolves only to the publisher's page, which is in no class I may read from.
- [Lan17], Theorem 6.1 (the Route of 7.31a (b)): no copy in a place I may read from.
- Faltings 1983, Kollár 1987, Griffiths 1970, Mumford 1972, Faltings–Chai 1990, EGA II: listed in the References without a locator; nothing to check.

## Source issues

- **Misprint** in DN at Théorème 2.3, printed page 11: the source says the equivariant bundle is called `F` and then that `E` descends; it should be that `F` descends; affects nothing.

## For the human reviewers

- Scope: 6.9a, 7.12a and 7.31a (b′) rest on [FormalProof] alone, a Lean repository announced on 20 November 2026 and not refereed; no published text states these forms (README References).
- Licence: the licence of the [FormalProof] repository was not read; the README restates 35 of its declarations as mathematics and `Suggested.lean` declares nothing.
- Not tested: [Lan16] and [Lan17] could not be read, so 7.31a (a) and the bad-prime step of 7.31a (b) were not checked against them.
