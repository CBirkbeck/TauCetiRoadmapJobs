# FIX-RT-BallQuotientsAndComplexHyperbolicLattices~1

Repair of red-team round 1 (passes a and b). Seven findings: six applied, one pair (a/F04, b/F02) settled once. Nothing disputed.

## RT-BallQuotientsAndComplexHyperbolicLattices~1a/F01 (P2) — applied

`selberg_lemma` and `IsNeat`: "no eigenvalue is a nontrivial root of unity" → "the eigenvalues generate a torsion-free group" (`∀ ζ ∈ Subgroup.closure {…}, IsOfFinOrder ζ → ζ = 1`, the form of `Neat.IsNeatAut`). Conventions: "weaker than Borel/§4.3" → "Ad(γ) neat in the §4.3 sense". §6.3 route: products of eigenvalues are ≡ 1 mod 𝔐. Evidence: WitteMorris2015 line 3002 to line 3005 and line 3445.

## RT-BallQuotientsAndComplexHyperbolicLattices~1a/F02 (P3) — applied

§10.4(a): "apply §10.3 to φ₂⁻¹ ∘ φ₁ and its inverse" → "§10.3 gives g_i: S_i → S_Γ for each smooth model (gap:normality-analytification); g_i is an isomorphism by ShimuraVarieties §3.3's criterion (étale, bijective on complex points); f = g₂⁻¹ ∘ g₁, unique because S₁ is reduced and S₂ separated". *Needs:* and the Layer 10 Dependencies gain ComplexComparisonPartII §C−1.2.

## RT-BallQuotientsAndComplexHyperbolicLattices~1a/F03 (P2) — applied

`gaps[1].needs`: "The Riemann extension theorem for … normal spaces" → the full sentence (open U, nowhere-dense analytic subset, consequence for maps), target any analytic space (README says why). `gaps[0].needs` and README line 116: one local-ring theorem (simultaneously normal, simultaneously regular) with its three consequences delivered together, and which consumer uses which. `detail` fields aligned.

## RT-BallQuotientsAndComplexHyperbolicLattices~1a/F04, RT-BallQuotientsAndComplexHyperbolicLattices~1b/F02 (P3) — applied

Layer 5 Examples: "(Mostow1980 line 85 and line 3089)" → "(Mostow1980 Theorem A, line 85, and Theorem 17.3, line 3089, for non-arithmetic lattices, with line 95 and line 3096: non-cocompact lattices of the family are arithmetic, so the non-arithmetic ones are cocompact)". Lines 95 and 3096 checked. The Mostow1980 manifest locator and References entry were updated.

## RT-BallQuotientsAndComplexHyperbolicLattices~1b/F01 (P3) — applied

§11.1: "BaldiUllmo2023 Proposition 2.3.3, line 333 to line 339" → "BaldiUllmo2023 line 280 to line 284", with a clause saying that this source defines p on the whole of 𝐆(ℝ) and uses the integral points of a faithful representation. Line 280 to line 284 checked. The §11.2 citation of line 336 to line 339 is kept.

## RT-BallQuotientsAndComplexHyperbolicLattices~1b/F03 (P3) — applied

- §12.2 *Needs:* gains 12.1.
- §12.3 *Needs:* gains "10.6 (the finite morphism S_Γ′ → S_Γ, for the reduction to a neat subgroup)".
- The Layer 12 Dependencies already cover Layer 10.

## Other places repaired for the same pattern

For a/F01, every occurrence of the old notion of neatness was changed:

- the Scope sentence on AdelicAlgebraicGroups §4.3;
- the §1.2 Check for h_t: the group is ⟨e²ᵗ⟩;
- the §6.3 statement and citations: Remark 4.8.5(2), and Raghunathan1972 Theorem 6.11;
- the §6.3 Checks:
  - Γ(3): the group is ⟨λ⟩;
  - characteristic p: the group is ⟨t^k⟩;
  - new Check diag(2, −1/2): products of eigenvalues matter;
- the §6.4 definition, the stability argument and the step from m to 1;
- the §6.4 Checks:
  - diag(1/2, i, 2) becomes the negative control;
  - ⟨γ²⟩ is neat;
  - for n = 1, single eigenvalues decide;
- the §11.3 neatness step;
- the module docstring and the docstrings of `selberg_lemma` and `IsNeat`;
- `sources.toml`: the Borel1969 locator, and Raghunathan1972 Theorem 6.11 with `cited_for` 6.3.

For a/F03 the README's gap contract (line 124) was generalised the same way. For a/F04 the References entry for Mostow1980 changed. Nothing outside `gaps` in `design/plan.json` changed (checked by script).

## Checks

- **Elaboration.** `lake env lean packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean` was run from the content checkout. The output is seven `declaration uses 'sorry'` warnings (lines 101, 131, 160, 169, 175, 187, 213) and no other message.
- **`#check @name`.** One scratch copy with `#check @name` for all 16 declarations was elaborated once. The file has no `variable` or `include` block, so no binder can be lost. The elaborated `selberg_lemma` type is: field F, finite ι with decidable equality, `Group.FG Λ`; it concludes normal ∧ finite index ∧ the closure of the characteristic-polynomial roots in `(AlgebraicClosure F)ˣ` is torsion-free. That matches §6.3. `IsNeat : {n : ℕ} → Subgroup (projectiveUnitaryGroup n) → Prop`. `IsLattice.exists_neat` is unchanged in form. The other 13 are unchanged.
- **Dependency check.** `depcheck: 239 roadmaps, 2264 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the edited README finds no cross-roadmap citation and no Lean name that occurs nowhere.
- **Gate failures listed:** none.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `selberg_lemma` (strong) | ι = ∅ | charpoly = 1, no root, closure = {1} | holds, Λ′ = Λ |
| same | F = 𝔽_p | Λ finite; Λ′ = {1}; charpoly (X−1)^N, closure {1} | holds |
| same | Γ(3) ⊂ SL₂(ℤ) | group ⟨λ⟩; trace ≡ 2 mod 3 excludes −2, 0, 1; −1 means order 3 | holds |
| same | g = diag(2, −1/2), Λ = ⟨g⟩ | 2·(−1/2) = −1, so Λ′ = Λ fails; ⟨g²⟩: ⟨4^k⟩ torsion-free; route with 𝔞 = 15ℤ[1/2]: g ≡ diag(2,1) mod 3, diag(2,2) mod 5, so Λ′ = ⟨g⁴⟩ | new Check; strong and weak forms differ |
| same | char p, ⟨diag(t,1), [[1,1],[0,1]]⟩ | eigenvalue group ⟨t^k⟩ ≅ ℤ or 1; order-p unipotents remain | holds; torsion-freeness fails as stated |
| same | roots of unity in GL₁(ℚ̄) | not f.g.; every finite-index subgroup has torsion | hypothesis needed |
| route, char 0 | ζ of order d = ℓ₁^a·d′ | η = ζ^(ℓ₁^a) ≡ 1 mod 𝔐₁, so ℓ₁ ∣ ord η unless η = 1; then d = ℓ₁^a, likewise ℓ₂^b, so d = 1 | sound |
| `IsNeat` | n = 0 | U(1,0) scalars; conjugationMap = id; closure {1} | every subgroup neat |
| same | Ad of diag(1, e^{2πi/3}, 1) | eigenvalues e^{±2πi/3} | not neat |
| same | lift diag(1/2, i, 2) | ratios 1 (×3), ±2i, ±i/2, 4, 1/4; 2i·(i/2) = −1 | ⟨γ⟩ not neat, though torsion-free |
| same | γ^(2k), lift diag(4^(−k), (−1)^k, 4^k) | ratios 1, (−4)^(±k), 16^(±k); group ⟨(−4)^k⟩ | ⟨γ²⟩ neat |
| same | h_t, n = 1 | e^{±2t}, 1, 1; group ⟨e^{2t}⟩ | neat |
| same | n = 1, lift eigenvalues λ₀, λ₁ | group ⟨λ₀/λ₁⟩ cyclic | strong = weak |
| `IsLattice.exists_neat` | route | Ad(Γ) f.g. (§6.2); strong §6.3; Ad injective, so pulled back normal of finite index | holds |
| same | PSL(2,ℤ) | Γ(3) image: λ² never a nontrivial root of unity | holds |
| §6.4: Γ_b ⊂ N_b | γ = m·η | eigenvalues of Ad(m) are roots of unity in a torsion-free group, so all 1; Ad(m) diagonalizable, so 1 | sound |
| §11.3 neatness | Ad(γ) eigenvalues | the 𝔥⊗ℂ eigenvalues plus 1 lie in ⟨eigenvalues of ρ(γ̃)⟩, torsion-free (neat level) | sound |
| §10.4(a) route | S₁ = S₂ = S_Γ | g_i = id, f = id | sound |
| same | S₂ ≠ S_Γ | f^an = φ₂⁻¹φ_Γφ_Γ⁻¹φ₁ = φ₂⁻¹φ₁ | sound |
| same | t ↦ (t², t³) | bijective, not an isomorphism; excluded because the cusp target is not smooth | Check stands |
| gap normality-analytification | cusp, node, 𝔸¹, dual numbers | t ↦ (t², t³) on both sides; two lines; ℂ smooth; the nonreduced point is excluded | Checks stand |
| gap normal-riemann-extension | quadric cone, x²; cusp, y/x; ℂ → cusp, t ↦ (t², t³) | holomorphic; not holomorphic at 0; map into a non-normal target is holomorphic | general target sound |

## For the maintainer

- No Lean name changed. Consumers of `IsNeat` and `selberg_lemma` inside this roadmap (§§6.4, 8, 9.5, 10.6, 11.3, 12) use only consequences of neatness, and the stronger notion implies the weaker one.
- No roadmap is known to cite these names.
- `design/plan.json` still mentions BaldiUllmo2023 Proposition 2.3.3 at its line 2356, outside `gaps`, which this job may not edit.
- No source was fetched; `needs-references.toml` was not written.
- Ownership against the open pull requests was checked with `roadmaps grep` for Selberg's lemma; the only hit, RealSemisimpleLieGroups, leaves it outside its scope. AdelicAlgebraicGroups (main) owns neat subgroups of arithmetic groups only.
- No suspicious text was found in the reviews.
