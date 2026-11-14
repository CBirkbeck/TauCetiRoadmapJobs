<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6871889771 -->
Review (claude) of 77b4002

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Pinned Tau Ceti declarations that 1.1, 1.4, 3.5 and 7.1 instantiate are not cited

   **Location.** `packages/CohomologyOfGroups/design/README.md:563` (1.1): “and for finite `G` the same
   map on `Ĥⁿ(H, M)`, `n ∈ ℤ`, through the Tate complex”; 1.1's *Needs:* (line 566); 1.4's route
   (lines 638–642); Exact supplier contracts, “From Tau Ceti”; `design/plan.json` 1.1 and 1.4.

   **Claim.** 1.1 presents the map on Tate cohomology induced by a group isomorphism with a
   compatible coefficient map as built here, and 1.4, 3.5 and 7.1 use the explicit form of Shapiro's
   isomorphisms with no supplier. The pin has both.

   **Witness.** Tau Ceti at the pin, `RepresentationTheory/Homological/TateCohomology/Functoriality.lean`:
   `TauCeti.TateCohomology.map` (line 249), `mapIso` (262), `map_comp_isoGroupCohomology_hom` (468),
   `map_comp_isoGroupHomology_hom` (491). `…/GroupCohomology/Shapiro.lean:109`
   (`TauCeti.groupCohomology.coindIso_hom`), `…/GroupHomology/Shapiro.lean:98`
   (`TauCeti.groupHomology.indIso_inv`).

   **Exact repair.**

   - “From Tau Ceti”, new bullet: `TauCeti.TateCohomology.map`, `TauCeti.TateCohomology.mapIso`,
     `TauCeti.TateCohomology.map_comp_isoGroupCohomology_hom`,
     `TauCeti.TateCohomology.map_comp_isoGroupHomology_hom`
     (`…/TateCohomology/Functoriality.lean`): for an isomorphism `e : G ≃* H` of finite groups and a
     linear map `φ` with `φ ∘ ρ(g) = σ(e g) ∘ φ`, the induced map `Ĥⁿ(G, M) → Ĥⁿ(H, N)` for every
     `n ∈ ℤ`, an isomorphism when `φ` is; in positive degrees it is `groupCohomology.map` along
     `e.symm`, in degrees `≤ −2` `groupHomology.map` along `e`. Used in 1.1.
   - 1.1: replace “through the Tate complex” by “which is `TauCeti.TateCohomology.map` for
     `e : H ≃* gHg⁻¹`, `x ↦ gxg⁻¹`, and `φ(m) = g·m`”; add the four names to *Needs:* and to the
     plan's prerequisites of 1.1.
   - “From Tau Ceti”, new bullet: `TauCeti.groupCohomology.coindIso_hom`,
     `TauCeti.groupHomology.indIso_inv` (`…/GroupCohomology/Shapiro.lean`,
     `…/GroupHomology/Shapiro.lean`): Shapiro's isomorphism in cohomology is restriction followed by
     evaluation at `1`; its inverse in homology is the change-of-group map of the unit `a ↦ 1 ⊗ a`.
     Add them to the *Needs:* of 1.4 (the identifications of 3.5 and the route of 7.1 go through
     1.4) and to the plan.

   **Repair tested.** `e.symm` is `x ↦ g⁻¹xg` with `m ↦ g·m`, the cohomological pair of the
   Conventions; `e` with `m ↦ g·m` is the homological pair. For `G = S₃`, `H = A₃`, `g = (12)`,
   `M = ℤ`: in degree `−2` the map is `groupHomology.map` on `H₁(A₃, ℤ) = A₃`, inversion, `−1`; in
   degree `2` it is `−1` on `H²(A₃, ℤ) ≅ Hom(A₃, ℚ/ℤ)`, the value of the Layer 1 Examples. For `g ∈ H`
   both are the identity in the degrees where the comparison lemmas apply, as 1.1 states.

2. **F02** (P3) The plan's prerequisites of 5.4 omit the Mathlib module its *Needs:* line names

   **Location.** `packages/CohomologyOfGroups/design/README.md:1386–1388` (5.4): “Mathlib
   `groupHomology` of finite cyclic groups (`RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean`)”;
   `design/plan.json`, target 5.4, `prerequisites`.

   **Claim.** The README and the plan list the same prerequisites for each target.

   **Witness.** The plan's 5.4 has six prerequisites (5.1, 3.6, SchemeKTheoryOperations §6.7, two
   directed-union declarations, InductionRestrictionPartII RS.6.8) and no Mathlib entry; a search of
   the plan for `FiniteCyclic` finds only `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` (8.4).

   **Exact repair.** Add `mathlib:Rep.FiniteCyclicGroup.groupHomologyIsoEven` and
   `mathlib:Rep.FiniteCyclicGroup.groupHomologyIsoOdd` to the plan's prerequisites of 5.4, and name
   these two declarations in 5.4's *Needs:* in place of the bare file path.

   **Repair tested.** Both exist at the pin
   (`RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85` and its module docstring,
   lines 28–31). They give `H₂(ℤ/n, ℤ) = 0` and `H₃(ℤ/2, ℤ) = ℤ/2`, the values of 5.4's first and
   third Checks.

Two findings, both P3; neither is blocking, but each carries a repair, so the verdict asks for a
fix round. All four round-9 findings are repaired and the repaired passages survive the adversarial
pass. No mathematical statement was found false. The two declared supplier gaps,
`gap:homological-low-degree` and `gap:flat-kunneth`, are precise, minimal and declared in both
files; they are contracts and not findings.

No maintainer notes were supplied. The design has no `Suggested.lean`; elaboration is not available
(this lane does not elaborate), so no one-tactic probe and no `#check @name` audit was run. Those
are for the package review.

## Verified sound

### Previous findings

| Round-9 finding | Status | Repaired passage and what I checked |
| --- | --- | --- |
| F01 (P2), finite-group universal coefficients and Sylow statements owned by ArithmeticGaloisDuality | Repaired | Scope, lines 130–140: “ArithmeticGaloisDuality §D7.2 owns, for a finite group `G`, the integral universal coefficient sequence … Here 5.2 is the pair of universal coefficient sequences for every group”. Contract at lines 488–498; 5.2 comparison bullet and `G = ℤ` Check (lines 1319–1336); 7.2 comparison bullet (1861–1863). §D7.2 read at its head (line 5003 of its README): the four statements are there as restated. |
| F02 (P2), `Λ²A ≅ H₂(A, ℤ)` and degree-two Künneth owned by InductionRestrictionPartII | Repaired | Scope, lines 102–109: “RS.6.8 owns, for abelian groups `A, B : Type`, the degree-two Künneth isomorphism … and, for finite abelian `A`, the isomorphism `Λ²A ≅ H₂(A, ℤ)`”. Contract (502–512); 5.4 route and bullets (1380–1402); 5.1 bullet (1274–1279). RS.6.8 read at its head, README and `Suggested.lean` (`multiplier_prod_abelian`, `abelian_multiplier_exteriorSquare`): the inclusions, the class of `[(a,1)|(1,b)] − [(1,b)|(a,1)] ↦ a ⊗ b` and `a ∧ b ↦ [a|b] − [b|a]` are stated there. RS.0.3 (`multiplier_hallPart`) as restated. |
| F03 (P3), pinned cup, cap, Kronecker and change-of-group machinery not cited | Repaired | Contract, lines 328–360; 4.4 (1095–1101): “which is Tau Ceti's `TauCeti.ChainComplex.cup` in `Rep k G` for `A = B = E = P` and `D = Δ`”; 4.6 chain-level and Kronecker bullets (1158–1172) and the face Check (1190–1194). The repair's deviation (back face, sign `(−1)^{q(n−q)}`) is correct: see the table. |
| F04 (P3), IntegralIwasawaTheoryPartII §0.7's vanishing and edge isomorphism | Repaired | Scope, lines 143–147: “§0.7 also owns … the edge isomorphism: coinflation `Hₙ(G, M) → Hₙ(G ⧸ S, M_S)` is bijective for every `n` when `H_q(S, M) = 0` for every `q > 0`”. Contract (530–532), 6.4 Check (1570–1577). §0.7 read at its head (line 274): `isIso_coinfNatTrans_app_of_isZero_groupHomology_res`, any `k`, `S ◁ G`. |

No finding of the repair report was marked not actionable. The repaired patterns were looked for
again in the rest of the design: earlier roadmaps owning an instance (the sweep below found no
further owner) and pinned machinery a target instantiates (this produced R01).

### Adversarial table

Trivial coefficients unless stated. Rows for the passages the repairs changed, the fifteen sampled
targets, the headline theorems and the targets a finding touches. Untouched targets outside the
sample rest on the round-9 table, whose rows carry computed values.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1, Tate conjugation (R01) | `S₃ ⊃ A₃`, `g = (12)`, `M = ℤ`; `g ∈ H` | pinned `map` along `e.symm = (x ↦ g⁻¹xg)`: `−1` on `Ĥ² = ℤ/3`; along `e`: `−1` on `Ĥ⁻² = A₃`; identity for `g ∈ H` | Sound; cite the pin |
| 1.2, quotient action | `S₃ ⊃ A₃`, `𝔽₃`; `ℤ/4 ⊃ 2ℤ/4`, `M = ℤ_sgn`; `N = 1` | `(gN·φ)(n) = φ(g⁻¹ng) = φ(n⁻¹) = −φ(n)`; `H⁰(N, M) = M`, generator acts by `−1`, model without coefficient action `+1`; `M` in degree `0`, `0` above | Sound |
| 1.3, additivity | `ι` a point; `ι = ∅`; `A = ℤ^{(ℕ)}`; `ℤ/2`, `ℤ^{(ι)}` | identities; `0 = 0`; `id ∈ Hom(A, ℤ^{(ℕ)})` has infinitely many nonzero coordinates, not in `⊕ Hom(A, ℤ)`; `(ℤ/2)^{(ι)}` | Sound |
| 1.5, discrete comparison | trivial group; `ℤ` discrete; `ℤ` profinite topology; sign | `A, 0, 0, …` both sides; `Hom(ℤ, ℤ) = ℤ`; open kernel `nℤ`, finite image in `ℤ` is `0`; `F(1, g) = f(g) − f(1) = f(g)`, reversed model `−f ≠ f` in `ℤ/3` | Sound |
| 2.1, hyperhomology | `ℤ/2`, `C = ℤ`; `S₃`, `ℤ[S₃/A₃] → ℤ`; trivial group | `ℤ/2`; kernel `ℤ(e₁ − e₂) = ℤ_sgn`, `H₀(S₃, ℤ_sgn) = ℤ/2`, `H₁(S₃, ℤ_sgn) = ℤ/3` (from `H₂(S₃) = 0 → H₁(sgn) → H₁(A₃) = ℤ/3 →0 H₁(S₃) = ℤ/2`); coinvariant complex `ℤ →≅ ℤ` gives `0`; `Hₙ(C)` | Sound |
| 2.3, two sequences | same `S₃` complex; `S₃/⟨(12)⟩` | `d¹`: `ℤ →≅ ℤ` (`q = 0`), `ℤ/3 →0 ℤ/2` (`q = 1`); `E²_{0,1} = ℤ/2`, `E²_{1,1} = ℤ/3`, equal to `H₀, H₁(S₃, ℤ_sgn)`; second complex: `d¹` iso on `q = 0, 1`, so `H₀ = H₁ = 0` | Sound |
| 3.5, tree sequence (headline) | `ℤ` on the line, any `M` | `a = t`, `b = 1`: edge map `t⁻¹ − 1`; `H₁ = ker = M^ℤ`, `H₀ = coker = M_ℤ`; sum instead of difference: `H₀(ℤ, ℤ) = ℤ/2` | Sound |
| 4.1, cochain cup | `ℤ²`; pinned Leibniz | `(x ∪ y)(e₁, e₂) = 1`, `(e₂, e₁) = 0`; `(φ ⌣ ψ)∘d = (φ∘d) ⌣ ψ + (−1)^p φ ⌣ (ψ∘d)` (`Monoidal/Cup.lean`), the sign of HS53 line 395 | Sound |
| 4.4 = pinned `cup` | Alexander–Whitney on a homogeneous simplex | `φ(g₀..g_p) ⊗ ψ(g_p..gₙ)`, inhomogeneous `φ(g₁..g_p) ⊗ g₁⋯g_p ψ(g_{p+1}..)`; `tensorCochain` adds no sign (`Tensor/Cochain.lean:133`) | Sound |
| 4.6, chain-level form | `Δc = Σ front_j ⊗ back_{n−j}`; `ℤ²`, `y = e₂^*`, `z = [e₁|e₂] − [e₂|e₁]`; `q = 0`; descent | symmetry gives `(−1)^{q(n−q)} back_q ⊗ front_{n−q}`, `capChain` applies `φ` to the first factor (`Monoidal/Cap.lean:74`), so the stated factor leaves `φ(back) ⊗ front`; back face `y(e₂)[e₁] − y(e₁)[e₂] = [e₁]`, front face `−[e₁]`; sign `+1`; `∂(y ∩ c) = (−1)^{q(n−q)+q+q(n−1−q)} y ∩ ∂c = y ∩ ∂c` for a cocycle `y` | Sound |
| 4.6, adjunction and associativity | homogeneous `c ⊗ m`, `x` of degree `p`, `y` of degree `q` | `⟨x ∪ y, c ⊗ m⟩ = x(front_p)(y(back_q)(m)) = ⟨x, y ∩ (c ⊗ m)⟩`; `(x ∪ y) ∩ z`: `x` on the first `p` of the back `p + q` face, the same as `x ∩ (y ∩ z)`; `ℤ²`: `⟨x, [e₁]⟩ = 1` | Sound only with the back face, as stated |
| 4.6, Kronecker form | degree `2`, contragredient action | `⟨dφ, m[x|y]⟩ = φ(y)(x⁻¹m) − φ(xy)(m) + φ(x)(m) = ⟨φ, ∂(m[x|y])⟩` with Mathlib's `d_single` | Sound, no sign |
| 5.1, Künneth (headline), degree two | `(ℤ/2)²`; `(ℤ/3)²`; `ℤ²`; `H = 1`; `n = 0` | `Tor₁(H₀, H₁) = 0`; `0 ⊕ ℤ/2 ⊕ 0`; `0 ⊕ ℤ/3 ⊕ 0`; `0 ⊕ ℤ ⊕ 0`; `H₂(G)`; sum over `p + q = −1` empty, no `Tor` term | Sound; inverse of RS.6.8's `e` on all three summands |
| 5.2, comparison | finite `G`, `n ≥ 0`; `G = ℤ`; field | `Hom(H_{n+1}(G, ℤ), ℤ) = 0` (killed by `|G|`), `n = 0`: `Ext¹(ℤ, ℤ) = 0 = H¹(G, ℤ)`; `H¹(ℤ, ℤ) = ℤ`, `Ext¹ = 0`; `Ext = 0` | Sound |
| 5.4, Pontryagin ring | cycle; `[a]·[b]`; `(ℤ/3)²`; `ℤʳ × T`; `ℤ/2`, degree 3 | `d([a|b] − [b|a]) = [ba] − [ab] = 0`; push-forward of `[(a,1)|(1,b)] − [(1,b)|(a,1)]` is `[a|b] − [b|a]`; generator of `ℤ/3`, opposite orientation `−1 ≠ 1`; `Λ²ℤʳ ⊕ ℤʳ ⊗ T ⊕ Λ²T`; `Λ³ = 0 ≠ ℤ/2` | Sound |
| 6.1, filtration | `N = G`; `N = 1`; HS53 line 380–385, 401–408 | `A_1 ∩ C̄ⁿ`: vanishing when `n` arguments lie in `N`, so `0`; normalized cochains vanish when one argument is `1`, so `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ n`; definitions agree with the source | Sound |
| 6.2, Hochschild–Serre (headline) | `S₃ ⊃ A₃`, `𝔽₃` | action `(−1)^{⌈q/2⌉}`: `+, −, −, +, +` for `q = 0..4`; `H^q(S₃, 𝔽₃) = 𝔽₃` for `q ≡ 0, 3 mod 4` | Sound |
| 6.4, edge maps and §0.7 Check | `ℤ² ⊃ 0 × ℤ`, `M = k[N]`; `M = k`, `k ≠ 0`; `N = 1`; `N = G` | `M = Ind_{ℤ×0}^{ℤ²} k`: `Hₙ(ℤ², M) = k, k, 0`; `M_N = k`, `Hₙ(ℤ, k) = k, k, 0`; `H₂(ℤ², k) = k → H₂(ℤ, k) = 0` not injective; identity; `Hₙ(G, M) → Hₙ(1, M_G)` zero for `n > 0` | Sound |
| 6.7, low degree | `ℤ/2 ⊂ ℤ/4`, `M = ℤ`, `m = 2`; homology; central `A ⊂ E` | `H¹(N, ℤ) = 0`; `0 → ℤ/2 → ℤ/4 → ℤ/2 → H³(ℤ/2, ℤ) = 0`, orders `2·2 = 4`; `0 → 0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; `H₁(A, ℤ)_Q = A`: the terms of RS.0.1 | Sound |
| 7.1, double cosets (headline) | `S₃`, `H = K = ⟨(12)⟩` | two double cosets, sizes `2` and `4`; `K ∩ gHg⁻¹ = 1` for the second; `res ∘ cor = id` for `n > 0` | Sound |
| 7.2, stable elements (headline) | stable `z ∈ Hₙ(P, M)`; `z = tr w`; `(ℤ/3)² ⋊ ℤ/2`; `P` normal | `tr cor z = Σ_{PgP} [P : P ∩ g⁻¹Pg] z = [G : P] z`; `tr^P_{P∩gPg⁻¹} tr^G_P w = tr^{gPg⁻¹}_{P∩gPg⁻¹} c_g tr^G_P w`; inversion on `Λ²P = ℤ/3` is `(−1)² = 1`, `H₂(G, ℤ) = ℤ/3`; invariants ≅ coinvariants as `|G/P|` is invertible | Sound; agrees with RS.0.3 and §D7.2 |
| 8.1, Tate duality (headline) | `ℤ/2`, `M = ℤ`, integral form `i = 0, 1, 2`; `M = ℤ/2` | `ℤ/2 = Hom(Ĥ⁰)`; `0 = Hom(Ĥ⁻¹ = 0)`; `ℤ/2 = Hom(Ĥ⁻² = H₁)`; `Ĥ⁰(Hom(ℤ/2, ℤ)) = 0 ≠ ℤ/2`; shift `Ĥⁱ(Hom(M, ℤ)) ≅ Ĥ^{i−1}(M^∨)` matches `−1 − (i − 1) = −i` | Sound |
| 8.5, periodicity (headline) | trivial group; `p ∤ |G|`; `S₃`; `d < 0` in (b) | all `Ĥ = 0` of order `1`; all four primary forms hold with `0`; `Ĥ⁴(S₃, ℤ) = ℤ/6`; `Ĥ^d(ℤ) ≅ Hom(Ĥ^{−d}(ℤ), ℚ/ℤ)` moves `d` to `−d > 0` | Sound |
| `gap:homological-low-degree`, `gap:flat-kunneth` | slug, supplier, section, one-sentence `needs` in the README and the plan | same slugs; DerivedModuleAlgebra §S.1 and §0.2; neither statement exists at the pins (Tau Ceti's Künneth sequence needs projective cycles) | Precise and minimal |

### Sources: the seeded sample

Printed pages from the page markers (HS53: scan page + 109; Loh19: scan page − 8; MilneCFT: the
running head).

| Target | Locator read | Result |
| --- | --- | --- |
| 1.2 | HS53 line 345–354 (pp. 117–118); Loh19 line 5322–5333, Prop. 3.2.13, p. 124 | The quotient operators; Löh's pairs `(x ↦ g⁻¹xg, x ↦ g·x)` (cohomology) and `(x ↦ gxg⁻¹, x ↦ g·x)` (homology) are those of the Conventions |
| 1.3 | Brown82 Ch. III | Uncertified, unread |
| 1.5 | HS53 line 129–141, pp. 112–113 | Homogeneous cochains and the passage `f(1, σ₁, σ₁σ₂, …)` to inhomogeneous ones |
| 2.1 | HS53 line 201–213, Ch. I §4, p. 114; line 83–86, Prop. 1, p. 111 | The bicomplex `C(Π, U)`; independence of the resolution |
| 2.3 | HS53 line 236–247 (Lemma 1, p. 115), 273–274 (Lemma 2, p. 116), 283–288 (Prop. 5, p. 116), 214–216 (Prop. 4, p. 114) | As cited |
| 4.1 | HS53 line 386–396, pp. 118–119; MilneCFT line 3459–3484, Prop. 1.38, p. 73 | Formula with the action on the second factor; `(−1)^p`; rules (c), (d) |
| 4.6 | Brown82 Ch. V | Uncertified, unread; checked against the pinned `capChain` and by computation |
| 5.1 | Loh19 line 5854, Thm. 3.2.22, p. 135; line 5877, Cor. 3.2.23, p. 136; line 5960, Example 3.2.25, p. 137 | As cited; the README states the source's narrower scope |
| 5.4 | Brown82 Ch. V | Uncertified, unread |
| 6.1 | HS53 line 368–385 (p. 118), 401–411 (Prop. 1, p. 119), to line 475 (p. 121) | Normalized cochains, both filtrations, Prop. 1 |
| 6.4 | HS53 line 711–719, Ch. III §1, p. 126 | Restriction and inflation as the two edge maps |
| 6.7 | HS53 line 825–830 (Thm. 2, p. 129), 854–856 (remark, p. 130); Loh19 line 5595, proof of Thm. 3.2.18, p. 129 | As cited; the source's `m ≥ 1` is split here into `m ≥ 2` and the five-term case |
| 7.2 | MilneCFT line 3357–3359 (Prop. 1.30, p. 70), 3382–3389 (Cor. 1.33, p. 71); Hutchinson13 line 482–491, §3, p. 11 | As cited; Hutchinson's homological stability condition uses the transfer, as 7.2's homological clause does |
| 8.1 | Brown82 Ch. VI §7; CE56 Ch. XII | Uncertified, unread |
| 8.5 | Loh19 line 7089–7126, §4.3.2, pp. 167–168; Brown82 Ch. VI §9; CE56 Ch. XII | Löh's section proves the direction from periodic resolutions to Sylow subgroups; the other two unread |

The author flagged no locator as unverified beyond the uncertified and waived entries. All eight
cited works are in the manifest; no fetch was needed and the manifest is unchanged.

### Pinned libraries

Opened this round, with file and line at the pin:

- Tau Ceti `Algebra/Homology/Monoidal/Cap.lean`: `capChain` (74), defined as
  `D.f n ≫ tensorCochain (a.f q) φ (𝟙 (B.X q)) n`, so the cochain is applied to the first factor;
  `capChain_comp_d` (88) with the sign `(−1)^p`; `cap` (271). Its docstring says the singular case
  evaluates on the front face.
- `Algebra/Homology/Monoidal/Cup.lean`: `cupCochain` (69), `d_comp_cupCochain` (86), `cup` (278).
  `Algebra/Homology/Monoidal/Tensor/Cochain.lean:133` (`tensorCochain`, no sign).
- `Algebra/Homology/Kronecker.lean:106` (`kronecker`).
- `RepresentationTheory/Homological/GroupCohomology/CoinvariantsTensor.lean`:
  `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso` (91), `Rep.groupCohomologyIhomIso`
  (167).
- `…/GroupHomology/ChangeOfGroups.lean:217` (`MonoidHom.groupHomologyIso_hom_naturality`) and
  `…/GroupCohomology/ChangeOfGroups.lean:265`.
- `…/GroupHomology/DirectedUnion.lean:113, 132`; `Algebra/Homology/UniversalCoefficient/Basic.lean:153, 180`.
- Mathlib `RepresentationTheory/Homological/ContCohomology/Basic.lean:131` (`continuousCohomology`,
  valued in `TopModuleCat k`; TODO at lines 38–39 records the discrete comparison as missing).

All 107 backticked library names of the README were searched at the pins by their final component;
all resolve. An object search of `RepresentationTheory/Homological` at the Tau Ceti pin found no
conjugation map on `groupCohomology`, discrete double coset formula, stable-element theorem, Tate
duality, Hopf formula or Künneth theorem for group homology. What exists and is not cited is R01.

### Suppliers, order and overlaps

Dependency check on the unchanged design:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2200 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Resolved this round at their open heads: ArithmeticGaloisDuality §D7.2
(merge order line 61), InductionRestrictionPartII RS.0.1, RS.0.3, RS.6.8 (line 64),
IntegralIwasawaTheoryPartII §0.7 (line 315). None of the three names this roadmap, so no cycle.
The other supplier sections are unchanged since round 9, whose table resolves each; the citation
resolver lists nothing missing, and `scratch/overlaps.md` lists no conflicting head, no dropped id
and no id that only a revision defines. The plan parses: 41 targets (28 theorems, 10 definitions,
3 constructions), 147 tests, every definition and construction with at least three, no forward
prerequisite, 13 suppliers matching the README's contract sections.

Ownership sweep by object over main and the open heads (double coset formula, stable elements,
Hopf's formula, Pontryagin ring, HNN, Hochschild–Serre, cap product, periodicity, diagonal
approximation, Cartan–Leray, Künneth for group homology, hyperhomology, conjugation). Read in
addition: ArithmeticLocallySymmetricSpaces ALS.3.7 and ALS.6.2 (Mackey and Hochschild–Serre for
covers of locally symmetric spaces, a different carrier), TorsionCohomologyInfrastructure,
ModularCurvesPartII (continuous cohomology), KTheoryLowDegrees (no shared object). No further
owner. The board-package index and the open-pull-request list hold no second CohomologyOfGroups.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, IntegralIwasawaTheoryPartII, ProfiniteCohomologyPartII, ProfiniteCohomology, DerivedModuleAlgebra, ClassFieldTheory (the third list is empty); finite-group integral universal coefficients and homological Sylow surjectivity: owner ArithmeticGaloisDuality §D7.2, cited; the homological edge isomorphism and the `ℂ_p` cap product: owner IntegralIwasawaTheoryPartII §0.7, cited; integral stable elements, duality and periods: owner K3BlochGroups §5.2, cited; continuous cohomology of profinite groups: owner ProfiniteCohomology, cited; double-complex spectral sequences: owner DerivedModuleAlgebra §S.1, cited; the Tate-cohomology interface: owner ClassFieldTheory Layer 0, cited.

### Principles, shape and headlines

- No route-specific narrowing, algorithm, copied passage, `set_option` or sorry'd data. Finite
  groups are assumed in 7.2 and Layer 8 only.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, References.
  Layers are named by their mathematics; no sentence says the roadmap follows a source.
- Process residue: a search for pull-request numbers, round labels, machine paths, HTML anchors,
  LaTeX delimiters and the listed process words found none.
- Both gaps carry the same slug in the README and the plan, a named supplier and section and a
  one-sentence `needs`.
- Headline theorems from the Summary: Hochschild–Serre (6.2–6.7), the tree sequence (3.5), Künneth
  (5.1), the double coset formula (7.1), stable elements (7.2), Tate duality (8.1), periodicity
  (8.5). Each has a target and a row above. Statability, padding and binders are for the package
  review, since the design has no Lean file.
- A remark that needs no change: 4.6's chain-level bullet writes the complexes as `X ⊗ N` and
  `X ⊗ P`, while `groupHomologyIso` uses `(A ⊗ P)_G` with the coefficients first; the coefficient
  object sits in degree `0`, so exchanging the factors introduces no sign.

### Copyright and arrangement

Wording: thirteen passages were set beside their sources this round: 1.2 (HS53 line 345–354;
Loh19 line 5322–5333), 1.5 (HS53 line 129–141), 2.1 (HS53 line 201–213), 2.3 (HS53 line 236–288),
4.1 (HS53 line 386–396; MilneCFT line 3477–3484), 6.1 (HS53 line 368–385 and 401–411), 6.4 (HS53
line 711–719), 6.7 (HS53 line 825–830), 7.2 (MilneCFT line 3382–3389; Hutchinson13 line 482–491),
8.4 (Hutchinson13 line 494–504), 8.5 (Loh19 line 7089–7126). None reproduces a sentence. The
longest shared run is six words in 6.1's definition of the filtration (HS53 line 383), a condition
that can be written in one way only. The round-10 repair added no text taken from a source.

Arrangement: HS53 has 36 of the 109 source mentions. Its contents are Ch. I §§1–7, Ch. II §§1–5,
Ch. III §§1–6. Only Layer 6 draws on Chapters II and III, in an order its *Needs:* lines force
(6.2 needs 6.1; 6.5 needs 6.2; 6.6 needs 6.5; 6.7 needs 6.6); 6.3, 6.8 and 6.9 have no counterpart
there, and Ch. III §§2 and 5 are absent. The other seven layers do not map to it. No table, figure
or list of examples is taken over.

Source independence: 13 passages compared with 4 sources, none shared; largest share HS53, 36 of 109 locators; contents compared with HS53: independent. Brown82 and CE56 (uncertified) and SwanPPeriod60 (waived) could not be read.

## Not verifiable

- Brown82 (Ch. II §7, III, III §§8–10, IV §4, V, VI §§7 and 9, VII) and CE56 (Ch. XII, XVII):
  settled as uncertified. The locators for 1.3, 3.1, 3.2, 3.6, 4.4, 4.6, 5.4, 7.1, 7.2, 8.1, 8.2,
  8.3, 8.5 and 2.2 were not read; those statements were checked by computation and against the
  pinned libraries only.
- SwanPPeriod60 Thms. 1 and 2: waived; read only as restated at Hutchinson13 line 499–504.
- Elaboration, the one-tactic probe and the binder audit: the design has no Lean file and this
  lane does not elaborate.
- The remaining supplier sections (DerivedModuleAlgebra, ProfiniteCohomology, ClassFieldTheory,
  FreeGroupsAndLimitGroups, AlgebraicTopology, StableHomotopyKTheory, K2SymbolsBrauer,
  SchemeKTheoryOperations, K3BlochGroups, MappingClassGroupsAndCanonicalRepresentations,
  ModularCurvesPartII) were not reopened this round; they rest on the round-9 resolution and on
  this round's citation resolver, which lists nothing missing.

## Source issues

- **Misprint** in Hutchinson13 at the proof of Corollary 3.3, printed p. 12 (Hutchinson13 line 518): the source says the localized homology is cyclic of the stated order when the degree is congruent to 3 modulo 3; it should be congruent to 3 modulo 4, as in the statement of the corollary; affects nothing.

## For the human reviewers

- **Not tested.** Brown82 has 15 of the 109 source mentions and is uncertified in
  `packages/CohomologyOfGroups/sources.toml`; its wording and contents were not compared with
  Layers 3, 4, 5, 7 and 8, which cite it by chapter.
- **Licence.** `packages/CohomologyOfGroups/sources.toml` records MilneCFT with
  `licence_class = "open-repository"` and Loh19 with `"author-page"`; both are unpublished course
  notes from which only statements and locators are taken.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "77b40025f960474676c2290272366578f4f07edb", "job": "REV-DESIGN-CohomologyOfGroups~10", "model": "fable", "worker": "chris-x30"} -->
