<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6871187541 -->
Review (claude) of 47da478

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The finite-group universal coefficient and Sylow statements have an earlier owner that is not cited

   **Location.** `packages/CohomologyOfGroups/design/README.md:1174` (5.2): “Prove, for `k` of global
   dimension at most one, any group `G` and a `k`-module `A` with trivial action, natural short exact
   sequences”; also 7.2's homological clause (lines 1658–1659, 1679–1680), Scope and ownership, Exact
   supplier contracts, and `design/plan.json` (5.2, 7.2, `suppliers`).

   **Claim.** 5.2 and 7.2 are presented as owned here with no deferral. ArithmeticGaloisDuality, an
   earlier roadmap (line 61 of `merge-order/ORDER.txt`), already states their finite-group integral
   instances. The design names that roadmap nowhere.

   **Witness.** ArithmeticGaloisDuality at its open head, §D7.2, *Finite-group universal coefficients
   and Sylow detection* (`TauCetiRoadmap/ArithmeticGaloisDuality/README.md:5005`): for finite `G`,
   `0 → H_n(G, ℤ) ⊗ A → H_n(G, A) → Tor₁(H_{n−1}(G, ℤ), A) → 0`, split; `H^{n+1}(G, ℤ) ≅ Ext¹(H_n(G, ℤ), ℤ)`;
   `Hⁿ(G, k) ≅ H_n(G, k)^*` for a finite field; corestriction `H_n(P, M) → H_n(G, M)` onto the
   `ℓ`-primary part, “proved here”.

   **Exact repair.**

   - Scope and ownership, new bullet: ArithmeticGaloisDuality §D7.2 owns, for a finite group, the
     integral homological universal coefficient sequence with trivial coefficients, the isomorphism
     `H^{n+1}(G, ℤ) ≅ Ext¹(H_n(G, ℤ), ℤ)`, the evaluation duality over a finite field, and the
     surjectivity of homological corestriction from a Sylow subgroup onto the primary part. 5.2 is the
     extension to every group and every `k` of global dimension at most one, with the `Hom` term of
     the cohomological sequence; 7.2's homological clause refines the surjectivity to an isomorphism
     from the stable classes.
   - Exact supplier contracts: add `### From TauCetiRoadmap.ArithmeticGaloisDuality` with §D7.2 and
     those four statements, “compared with 5.2 and 7.2”.
   - 5.2 and 7.2: add “ArithmeticGaloisDuality §D7.2 for the comparison” to *Needs:* and a comparison
     API bullet (for finite `G` and `k = ℤ` the sequences of 5.2 are those of §D7.2). Add it to the
     Dependencies of Layers 5 and 7 and to the plan (`suppliers`, prerequisites of 5.2 and 7.2).
   - New Check in 5.2 (the instance below): for `G = ℤ`, `H¹(ℤ, ℤ) = Hom(H₁(ℤ, ℤ), ℤ) = ℤ` and
     `Ext¹(H₀(ℤ, ℤ), ℤ) = 0`, so the finite-group formula `H^{n+1} ≅ Ext¹(H_n, ℤ)` fails at `n = 0`
     for an infinite group; the `Hom` term is needed.

   **Repair tested.** `G = C₂`, `A = ℤ/2`: 5.2 gives `H₂ = 0 ⊗ ℤ/2 ⊕ Tor₁(ℤ/2, ℤ/2) = ℤ/2`, the value
   of §D7.2's own Check, so the comparison holds. `G = ℤ`: 5.2 gives `H¹(ℤ, ℤ) = 0 ⊕ Hom(ℤ, ℤ) = ℤ`,
   while §D7.2's `Ext¹(H₀, ℤ) = Ext¹(ℤ, ℤ) = 0`; for finite `G`, `H¹(G, ℤ) = 0 = Ext¹(ℤ, ℤ)`. So 5.2 is
   a strict extension and nothing is deleted. Stable classes for `S₃`, `p = 3`, `H₃`: `H₃(A₃, ℤ) = ℤ/3`
   with `ℤ/2` acting by `+1` (dual of `H⁴`), corestriction is onto `H₃(S₃, ℤ)(3) = ℤ/3` and bijective,
   both statements agreeing. ArithmeticGaloisDuality does not name this roadmap (0 occurrences), so no
   cycle arises.

2. **F02** (P2) `H₂(A, ℤ) ≅ Λ²A` and the degree-two Künneth formula for abelian groups have an earlier owner that is not cited

   **Location.** `packages/CohomologyOfGroups/design/README.md:1248` (5.4): “Integral comparison: for
   `k = ℤ` (so `A : Type`), `ψ` is an isomorphism in degrees `≤ 2`; in particular `H₂(A, ℤ) ≅ Λ²A`”;
   the route at lines 1235–1236; Scope lines 94–95; plan 5.4.

   **Claim.** The Scope bullet for InductionRestrictionPartII lists only RS.0.1. The same roadmap also
   states, for finite abelian groups, the isomorphism `Λ²G ≅ H₂(G, ℤ)` and the degree-two Künneth
   decomposition that 5.4's route proves again.

   **Witness.** InductionRestrictionPartII at its open head, RS.6.8
   (`TauCetiRoadmap/InductionRestrictionPartII/README.md:1627–1640`): `multiplier_prod_abelian`,
   `M(A × B) ≅ M(A) ⊕ M(B) ⊕ (A ⊗ B)`, “proved as part of this target”;
   `abelian_multiplier_exteriorSquare`, `a ∧ b ↦ ⟨a, b⟩`, an isomorphism for finite abelian `G`. Line
   193: `⟨x, y⟩` is the class of `[x|y] − [y|x]`.

   **Exact repair.**

   - Scope and ownership, extend the InductionRestrictionPartII bullet: RS.6.8 owns, for abelian
     groups, the degree-two Künneth formula `H₂(A × B, ℤ) ≅ H₂(A, ℤ) ⊕ H₂(B, ℤ) ⊕ (A ⊗ B)` and, for
     finite abelian `G`, the isomorphism `Λ²G → H₂(G, ℤ)`, `a ∧ b ↦ ⟨a, b⟩`. 5.4's integral comparison
     is its extension to every abelian group, and its `ψ` is that map on finite ones.
   - Exact supplier contracts: add `### From TauCetiRoadmap.InductionRestrictionPartII` with RS.6.8
     (and RS.0.1 if it stays in Scope only, say so).
   - 5.4: in the route replace “in degree `2`, Künneth for finitely generated `A`
     (`Λ²(A ⊕ B) = Λ²A ⊕ Λ²B ⊕ A ⊗ B`) and colimits” by “in degree `2`, RS.6.8 for finite `A`, 5.1 with
     `H₂(ℤ, ℤ) = 0` for the free factors, and colimits”; add RS.6.8 to *Needs:*, to the Layer 5
     Dependencies and to the plan.
   - New API bullet in 5.4: `ψ(a ∧ b)` is the class of `[a|b] − [b|a]`, which is RS.6.8's `⟨a, b⟩`.

   **Repair tested.** By 5.1's shuffle formula `[g] × [h] = [(g, 1)|(1, h)] − [(1, h)|(g, 1)]`;
   pushing forward along the multiplication `A × A → A` gives `[a|b] − [b|a] = ⟨a, b⟩`, so the two
   maps are equal, not merely both isomorphisms (the opposite order would give `−⟨a, b⟩`). `C₂ × C₂`:
   both give `ℤ/2`, generated by `⟨a, b⟩`. `ℚ` and `ℤ²`: `Λ²ℚ = 0`, `Λ²ℤ² = ℤ`, both outside RS.6.8's
   finite hypothesis, so 5.4 remains a strict extension. InductionRestrictionPartII is line 64 of the
   merge order and does not name this roadmap.

3. **F03** (P3) Pinned Tau Ceti machinery that 4.4, 4.6 and 5.2 instantiate is not cited

   **Location.** `packages/CohomologyOfGroups/design/README.md:1002` (4.4): “`(φ ∪_μ ψ) = μ ∘ (φ ⊗ ψ) ∘ Δ`
   on `Hom_G(P, −)` computes `∪_μ`”; 4.6 lines 1038–1045; 5.2 line 1180; Exact supplier contracts,
   “From Tau Ceti”.

   **Claim.** The contracts present the diagonal cup product, its Leibniz rule and descent to
   cohomology, the cap product along a diagonal, the evaluation map and the identification
   `C(G; A)^* = Hom_k(C(G; k), A)` as constructions of this roadmap. The pin has them.

   **Witness.** At the Tau Ceti pin: `TauCeti.ChainComplex.cupCochain`, `d_comp_cupCochain`,
   `TauCeti.ChainComplex.cup` (`Algebra/Homology/Monoidal/Cup.lean:69, 278`), for a diagonal
   `D : E ⟶ A ⊗ B` in any `k`-linear monoidal category; `TauCeti.ChainComplex.cap`
   (`Monoidal/Cap.lean:271`); `TauCeti.ChainComplex.kronecker` (`Kronecker.lean:106`);
   `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso`
   (`RepresentationTheory/Homological/GroupCohomology/CoinvariantsTensor.lean:91`).

   **Exact repair.** Add to “From Tau Ceti”: (i) `TauCeti.ChainComplex.cupCochain`,
   `TauCeti.ChainComplex.d_comp_cupCochain`, `TauCeti.ChainComplex.cup`: the cup product of cochains
   along a diagonal with its Leibniz rule and descent; 4.4's product for `(P, Δ)` is this one for
   `C = Rep k G`, `A = B = E = P`, `D = Δ`. (ii) `TauCeti.ChainComplex.cap`: the cap product along a
   diagonal and an action, used in 4.6 where its single-category hypotheses apply. (iii)
   `TauCeti.ChainComplex.kronecker` and `HomologicalComplex.coinvariantsTensorObjLinearYonedaObjIso`:
   the evaluation map and `Hom((A ⊗ P)_G, N) ≅ Hom_G(P, Hom_k(A, N))`; 4.6's evaluation pairing and
   5.2's second map are these. (iv) `MonoidHom.groupHomologyIso_hom_naturality`,
   `MonoidHom.groupCohomologyIso_hom_naturality` (`…/GroupHomology/ChangeOfGroups.lean:217`,
   `…/GroupCohomology/ChangeOfGroups.lean:265`): resolution comparisons commute with change of
   groups, used in 2.1, 4.4 and 6.3. Add them to the *Needs:* lines of 4.4, 4.6 and 5.2 and reword
   4.4 to “is `TauCeti.ChainComplex.cup` for the diagonal `Δ`”.

   **Repair tested.** For `G` trivial and `P = k` in degree `0`, `Δ` is the unitor and
   `TauCeti.ChainComplex.cup` in bidegree `(0, 0)` is `μ ∘ (φ ⊗ ψ)`, the value of 4.4's first Check;
   the pinned Leibniz rule `(φ ⌣ ψ) ∘ d = (φ ∘ d) ⌣ ψ + (−1)^p φ ⌣ (ψ ∘ d)` carries the sign of 4.1.

4. **F04** (P3) The Scope bullet for IntegralIwasawaTheoryPartII §0.7 omits what that section owns next to 6.3–6.4

   **Location.** `packages/CohomologyOfGroups/design/README.md:116`: “IntegralIwasawaTheoryPartII §0.7
   owns the cap product `H^q(U, M^∨) × H_q(U, M) → ℂ_p` for a `ℂ_p[U]`-module `M`.”

   **Claim.** §0.7 also owns two statements adjacent to 6.3 and 6.4, and the design is silent on them.

   **Witness.** IntegralIwasawaTheoryPartII §0.7 at its open head: for `S ◁ G` and any commutative
   `k`, if `H_q(S, M) = 0` for `q > 0` then coinflation `H_n(G, M) → H_n(G/S, M_S)` is an isomorphism
   (`isIso_coinfNatTrans_app_of_isZero_groupHomology_res`); and `H_q(S, M) = 0` for `M` flat over
   `k[S]`.

   **Exact repair.** Extend the bullet: “§0.7 also owns the vanishing of positive-degree homology for
   coefficients flat over `k[S]` and the edge isomorphism: coinflation `H_n(G, M) → H_n(G ⧸ S, M_S)` is
   bijective when `H_q(S, M) = 0` for `q > 0`. This is the one-row case of 6.3 with the edge map of
   6.4; it is not restated here.” Add a Check to 6.4 comparing the two, and §0.7 to its *Needs:* “for
   the comparison”.

   **Repair tested.** `S = G`: the hypothesis forces `H_n(G, M) = 0 = H_n(1, M_G)` for `n > 0`, and
   6.3 has the single column `p = 0`, where both vanish. `S = 1`: coinflation is the identity, the
   edge map of 6.4's Check.

Four findings: two P2 (blocking), two P3. Both round-8 findings are repaired, and the repaired
passages survive the adversarial pass. The two blocking findings are of the kind round 8's second
finding was: an earlier roadmap already states an instance of a target here, and the design neither
cites it nor says how its own statement differs. No mathematical statement was found false.

No maintainer notes were supplied. The design has no `Suggested.lean`; elaboration is not available
(this lane does not elaborate), so no one-tactic probe and no `#check @name` audit could be run.

## Verified sound

### Previous findings

| Round-8 finding | Status | Repaired passage and what I checked |
| --- | --- | --- |
| F01, the extension-class cup formula over `k` | Repaired | Conventions, lines 158–169: “put `A_k = Additive A ⊗_ℤ k` … the *scalarised class* `c_k ∈ H²(Q, A_k)` is the class of the factor set followed by `a ↦ a ⊗ 1`”; 6.6, line 1446: “`d₂ … is u ↦ −c_k ∪ u`”. Plan 6.6 matches (statement, `d2_eq_neg_cup`, tests `tg_coefficients_Z27`, `tg_nonabelian_Q8`). |
| F02, the bar normalisation of the Hopf map | Repaired | Scope, lines 97–104: “K2SymbolsBrauer §1.1 owns the bar normalisation of the Hopf map … 6.8 is Hopf's formula for every group for that map”; contract at lines 376–384; 6.8, line 1537: “the one whose normalisation K2SymbolsBrauer §1.1 fixes”. §1.1 read at its head: differential, `[a] − [b] ↦ ab⁻¹`, torus value `[s,t]⁻¹` and naturality are there; existence and bijectivity are left to its supplier, as the design says. |

No finding of the repair report was marked not actionable.

The repaired pattern (an earlier roadmap owning an instance) was then searched for in the rest of
the design, by object, with `roadmaps grep` and by reading the closest roadmaps. That search
produced R01, R02 and R04.

### Adversarial table

Trivial coefficients unless stated. Rows for the repaired passages, the sampled targets, the
headline theorems and every target a finding touches.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, `c_k` | `ℤ/3 ⊂ ℤ/9`, `s ∈ {0,1,2}`; `s′ = b·s`; `k = ℤ`, `k = 0` | carry `= 3` at `(1,2), (2,1), (2,2)`, `0` at the other six; change of section adds `db`; `A ⊗ ℤ = A`; `A ⊗ 0 = 0` | Sound |
| 6.6, `d₂ = −c_k ∪ u` | `C₃ ⊂ C₉`, `𝔽₃`; `C₉ ⊂ C₂₇`, `𝔽₃`; `k = ℚ` | `df(2,1) = 0 − 1 + 0 = −1`; `f(3α + r) = α`: `df(a,b) = −carry(r,t)`, wrap by `27` changes `⌊·/3⌋` by `9 ≡ 0`; `ℤ/9 ⊗ ℚ = 0 = Hom(ℤ/9, ℚ)` | Sound; `+c_k` gives the other generator |
| 6.6 route | `o` of bidegree `(0,1)`, `u′` of `(p,0)` | product sign `(−1)^{0·0} = 1`; derivation term `(−1)^{0+1} o ∪ d₂u′ = 0`; `d₂o ∪ u′`: `(−1)^{2·0} = 1`; `o ∪ φ = φ(n̄)` | `d₂u = −c_k ∪ u`, no extra sign |
| 6.6, `Q₈ ⊃ ⟨i⟩`, `𝔽₂` | `s(σ) = j` | factor set `j² = 2 ∈ ℤ/4`; `H²(ℤ/2, ℤ/4⁻) = {0,2}/0 = ℤ/2`; `2 ⊗ 1 = 0`; `dim H¹(Q₈, 𝔽₂) = 2 = 1 + 1` | `c ≠ 0`, `c_{𝔽₂} = 0`, `d₂ = 0`: consistent |
| 6.8, Hopf map | `ℤ²`; `ℤ/n`, `n = 0, 1, 2`; kernel computations | `d([a|b] − [b|a]) = [ba] − [ab] ↦ ba(ab)⁻¹ = ⁅a,b⁆⁻¹`; `R ∩ [F,F] = 0` vs `nℤ`; `d([r|r′] − [1|1]) = [r] + [r′] − [rr′] − [1]`; `d([f|r] − [f|1]) + d([fr|f⁻¹] − [f|f⁻¹]) = [r] − [frf⁻¹]`; `r₂r₁(r₁x′r₂x′⁻¹)⁻¹ ≡ 1` mod `⁅F,R⁆` | Sound; agrees with §1.1 |
| 1.2, quotient action | `S₃ ⊃ A₃`, `𝔽₃`; `ℤ/4 ⊃ 2ℤ/4`, `M = ℤ_sgn` | `(gN·φ)(n) = g·φ(g⁻¹ng)`: `−1` on `Hom(A₃, 𝔽₃)`; `H⁰(N, M) = M`, action `−1` (wrong model `+1`) | Sound |
| 2.3, two sequences | `C = (ℤ[S₃/A₃] → ℤ)`; `S₃/⟨(12)⟩` | `d¹`: `ℤ → ℤ` iso, `ℤ/3 → ℤ/2` zero; `E² = (0, ℤ/2; 0, ℤ/3)`; `H₁(S₃, ℤ_sgn) = ℤ/3`; second complex: all `E² = 0` in degrees `≤ 1` | Sound |
| 3.1, flat vs projective | `k = ℤ/4`; `F → F → ℤ[1/2]` | `ℤ/2 →0 ℤ/2 →≅ ℤ/2`, `H₂ = ℤ/2`; `vu(e_i) = 2^{−i} − 2·2^{−i−1} = 0`; `a₀ = Σ 4^j = −1/3 ∉ ℤ` | Sound |
| 3.2, orbit sequence | two-edge circle, reflection and rotation | reflection: `E¹_{0,q} = H_q(ℤ/2)²`, column `1` zero for `q > 0`, column `2` zero: survives for every odd `q`; rotation: `C₁ = ℤG`, rows `q > 0` vanish | Sound (the Check says `q ≥ 3`; `q = 1` survives too) |
| 3.4, tree chains | vertex; line with `ℤ`; loop | `0 → 0 → k → k → 0`; `∂ = t − 1` on `k[ℤ]`, cokernel `k`; loop: `∂ = 0`, kernel `k` | Sound |
| 3.5, tree sequence (headline) | `ℤ` on the line, any `M` | `a = t`, `b = 1`: edge map `t⁻¹ − 1`; `H₁ = M^ℤ`, `H₀ = M_ℤ`; sum instead of difference: `H₀(ℤ, ℤ) = ℤ/2` | Sound |
| 3.6 | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `BS(1,2)`; `F₂`, both generators `−1` | `24/2 = 12`, cyclic; `1 − 2 = −1`, `1 − 1 = 0`, `H₁ = ℤ`; `ker(−2, −2) ≅ ℤ`, factors `ker(−2) = 0`, `ker(M → (ℤ/2)²) = 2ℤ` | Sound |
| 4.1, cochain cup | `ℤ²`; `ℤ` with `N = ℤ[ℤ]`, action omitted | `(x ∪ y)(e₁,e₂) = 1`, `(e₂,e₁) = 0`; `t − 2 + (1 + t) − 1 = 2(t − 1) ≠ 0` | Sound |
| 4.2, connecting maps | family `(−1)^{pq} x ∪ y` | `x ∗ δy = (−1)^{p(q+1)}(−1)^p δ(x ∪ y) = δ(x ∗ y)`; `δx ∗ y = (−1)^q δ(x ∗ y)` | Left rule excludes it, as stated |
| 4.3, identities | `F(x,y) = (−1)^{pq} β(y ∪ x)` | `F(δx, y) = (−1)^{pq+q}(−1)^q βδ(y ∪ x) = δF`; `F(x, δy) = (−1)^p δF` | Graded commutativity follows from 4.2 |
| 4.4, diagonal | `G = 1`; naive diagonal | unitor; degree `n ↦ 2n` | Sound; see R03 |
| 4.6, cap and evaluation | degree-2 chain; `x ∈ M^H`, `z = [n]` | `(x·φ(y))(m) = φ(y)(x⁻¹m)`: `⟨dφ, c⟩ = ⟨φ, ∂c⟩` with Mathlib's `d_single`; both sides `Σ_{gH} [μ(gx ⊗ n)]` | Sound; see R03 |
| 4.7, comparisons | `ℤ/2`, `M = ℤ`; `∏_ℕ ℤ/p` | `H⁰ → Ĥ⁰` is `ℤ → ℤ/2`; `⊕_ℕ 𝔽_p` countable vs `Hom` uncountable | Sound |
| 5.1, Künneth (headline) | `(ℤ/2)²`, `ℤ`, `n = 2, 3`; `M = 𝔽₂`, `N = ℤ[1/3]`; `G = H = 1`, `M = N = ℤ/2` | `ℤ/2`; `2 + 1 = 3` copies; tensor `2`, Tor `1`, middle `3`; `H₁ = 0` vs `Tor₁ = ℤ/2` | Sound |
| `gap:flat-kunneth` | `R` of global dimension `≤ 1` | weak dimension `≤ 1`: submodules of flat modules are flat, so boundaries of `L` are flat; splitting transports along `K′ ⊗ L′ → K ⊗ L` | Precise, one sentence; the sequence is stated nowhere at the pins |
| 5.2, universal coefficients | `C₂`, `A = 𝔽₂`; `G = ℤ` | `H² = Ext¹(ℤ/2, 𝔽₂) = 𝔽₂`; `H₂(C₂, ℤ/2) = ℤ/2`; `H¹(ℤ, ℤ) = Hom(ℤ, ℤ) = ℤ`, `Ext¹(ℤ, ℤ) = 0` | Sound; R01 |
| 5.3 | `G = H = ℤ`, `ℚ` | `(x × y)(e₁,e₂) − (x × y)(e₂,e₁) = 1 − 0` | No Koszul sign, as stated |
| 5.4, Pontryagin ring | `C₂ × C₂`; `ℤ/2`, degree 3; `ℚ`; `x = Σ x_i` | `Λ² = ℤ/2`; `Λ³ = 0` vs `H₃ = ℤ/2`; `Λ²ℚ = 0`; `x² = Σ x_i² + Σ_{i<j}(x_ix_j + x_jx_i) = 0`; `[a]·[b] = [a|b] − [b|a]` | Sound; R02 |
| 6.1, filtration | `N = G`; `N ≠ G`, `M ≠ 0`; `ℤ/4 ⊃ 2ℤ/4`, `n = 1` | `A_1 = 0`; cochain `m` at `(g,…,g)` lies in `A_j`; `A_1`: `f(2) = 0`, `A*_1`: also `f(1) = f(3)` | Sound |
| 6.2, Hochschild–Serre (headline) | coordinates; `S₃ ⊃ A₃`, `𝔽₃` | `s = −q′ − 1`, `t = p′ + 2q′ + 1` give `(2p + q + 1, −p − 1)`; `p + r − 1 > p + q + 1 ⟺ r ≥ q + 3`; `p + 2 − r ≤ 0 ⟺ r ≥ p + 2`; action `(−1)^{⌈q/2⌉}`: `+, −, −, +, +, −` | Sound |
| 6.3, homological form | `(P_n ⊗ M)_N`; `ℤ/4 ⊃ ℤ/2`; `(ℤ/2)²` | induced from `1 ≤ Q`; `E² = 𝔽₂` everywhere vs `H_n = 𝔽₂`; `n + 1` | Sound |
| 6.5, products | `ℤ² ⊃ 0 × ℤ` | `(ỹ ∪ x̃)(σ, γ) = y(σ)x(γ)`, in `A*_1`, restricts to `+x·y`; `(−1)^{pq′} = (−1)^{0·0}`; `x ∪ y ↦ −x·y = (−1)^{1·1}` | Agrees with HS53 line 692–696 |
| 6.7, low degree | `ℤ/2 ⊂ ℤ/4`, `M = ℤ`, `m = 2`; homology | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`, corestriction `1 ↦ 2` | Sound |
| 6.9, comparison | `C₃ ⊂ C₉`; `N = G` | `−carry` on both sides; `H²(1, −) = 0` | Sound |
| 7.1, double cosets (headline) | `S₃`, `H = K = ⟨(12)⟩`; types | double cosets of sizes `2` and `4`; second term through `Hⁿ(1) = 0`; `Hg⁻¹s = Hg⁻¹s′ ⟺ ss′⁻¹ ∈ K ∩ gHg⁻¹` | Sound |
| 7.2, stable elements (headline) | `C₂ × S₃`, `M = 𝔽₂³`; homology | `f(z) = e₃` is a cocycle; `(23)·e₃ = e₂ ≠ e₃`; `dim H¹(P, M) = 1 + 2`, `dim H¹(G, M) = 2`; stable `z`: `tr cor z = Σ [P : P ∩ g⁻¹Pg] z = [G : P] z` | Sound; R01 |
| 8.1, Tate duality (headline) | `C₂`, `M = ℤ`, `ℤ/2` | `Ĥ⁰(ℚ/ℤ) = ℚ/ℤ / 2ℚ/ℤ = 0 = Hom(Ĥ⁻¹(ℤ))`; `Ĥ¹(ℚ/ℤ) = ℤ/2 = Hom(H₁)`; `Hom(ℤ/2, ℤ) = 0` vs `Ĥ⁰(ℤ/2) = ℤ/2` | Sound |
| 8.2 | `ℤ/7 ⋊ ℤ/3` | `1 + 6 + 14 = 21`; `(1,0)(0,1) = (1,1)`, `(0,1)(1,0) = (2,1)` | Primality is a separate hypothesis |
| 8.3 | bounded free complex; `C₂`, `n = 0` | `0 → ℤ_χ → F_n/B_n → B_{n−1} → 0` with `B_{n−1}` free over `ℤ`: `C_n` is `ℤ`-free and cohomologically trivial; `χ² = 1` | Sound |
| 8.5, periodicity (headline) | `1`; `S₃`; `A₄`; `p ∤ |G|` | all `Ĥ = 0`, order `1`; `Ĥ⁴(S₃, ℤ) = ℤ/6`; `V₄ ≤ A₄`; every primary form holds with both sides `0` | Sound |

### Sources: the seeded sample

All fifteen targets. Printed pages follow from the page markers (HS53: scan page + 109; Loh19:
scan page − 8; SerreArbres: the printed number at the foot of each scan page).

| Target | Locator read | Result |
| --- | --- | --- |
| 1.2 | HS53 line 345–354 (pp. 117–118); Loh19 line 5322–5333, Prop. 3.2.13, p. 124 | Quotient operators `γ·f(γ⁻¹σγ)`; Löh's pairs `(x ↦ g⁻¹xg, x ↦ g·x)` for cohomology match the Conventions |
| 3.2 | HS53 line 201–216, Ch. I §4, p. 114 | Bicomplex and Prop. 4. Brown82 Ch. VII uncertified, unread |
| 3.4 | SerreArbres line 5132–5147, printed p. 168 | Invariant orientation, `∂y = t(y) − o(y)`, exactness for a tree |
| 4.1 | HS53 line 386–396, pp. 118–119; MilneCFT line 3477–3484, p. 73 | Formula with the action on the second factor; Leibniz sign `(−1)^p` |
| 4.2 | MilneCFT line 3459–3476, Prop. 1.38(a)–(d), p. 73 | Both rules with tensor-exactness hypotheses; uniqueness by dimension shifting |
| 4.3 | MilneCFT line 3485–3493, Prop. 1.39, pp. 73–74 | (a), (b), (c), (e) as cited; (d) is cited in 4.5 |
| 4.4 | HS53 line 389–392 | The cochain formula only. Brown82 Ch. V unread |
| 4.7 | no source locator; pinned declarations | `TauCeti.TateCohomology.cup` (`Cup/Product.lean:131`), `TauCeti.TopPairing.cup` (`Cup/Cohomology.lean:169`) |
| 5.1 | Loh19 line 5854–5866, Thm. 3.2.22, p. 135; line 5877–5900, Cor. 3.2.23, p. 136; line 5960, Example 3.2.25, p. 137 | PID, one flat complex, split not naturally; the README labels the source's scope correctly |
| 5.4 | Brown82 Ch. V | Uncertified, unread; statements checked by computation only |
| 6.3 | Loh19 line 5306–5312, Thm. 3.2.12(1), p. 123; HS53 line 355–362 | Homological sequence; HS53's transcription remark |
| 6.6 | HS53 line 792–823, Ch. III §3 Prop. 1, pp. 128–129; line 984–990 and 991–1015, Thm. 4, p. 133 | Definition, `τ = d_i`, `d₂u = −c ∪ u`; the route follows the idea of the proof in the roadmap's words |
| 6.9 | HS53 line 854–856, p. 130 | The five-term sequence for `m = 1` |
| 7.1 | Brown82 Ch. III §§8–9 | Uncertified, unread |
| 8.1 | Brown82 Ch. VI §7; CE56 Ch. XII | Uncertified, unread |

Also read: HS53 line 154–160 (corollary to Prop. 2), line 368–385 (normalized cochains, filtration),
line 652–657 (`φ(d₁e) = (−1)^i dφ(e)`), line 686–700 (Thm. 3 and the derivation rule), line 825–830
(Thm. 2); Hutchinson13 line 482–504 and 511–520; SerreArbres line 5170–5196 (Prop. 13, Remarque 1,
the amalgam example, printed p. 169); Loh19 statements at lines 1460, 2205, 2215, 2399, 2416, 2437,
5568, 5841, 5985, 6019, 7012, each on the printed page the README gives. The author flagged no
locator as unverified beyond the uncertified and waived entries. All eight cited works are in the
manifest; no fetch was needed and the manifest is unchanged.

### Pinned libraries

Every backticked Mathlib and Tau Ceti name in the README was searched at the pins; all resolve.
Opened with file and line:

- Mathlib: `groupHomology.inhomogeneousChains.d_single`
  (`RepresentationTheory/Homological/GroupHomology/Basic.lean:132`): for `n + 1 = 2` it is
  `(x⁻¹a)[y] − a[xy] + a[x]`, as the contract says. `cochainsFunctor` and `chainsFunctor`
  (`…/Functoriality.lean:522`, `818`), `HInfRes` (`:376`), `H1CoresCoinf` (`:543`),
  `groupHomology.indIso` (`…/Shapiro.lean:65`), `H1AddEquivOfIsTrivial` (`…/LowDegree.lean:1019`),
  `tateCohomology` (`…/TateCohomology/Basic.lean:146`, `[Fintype G]` at line 58),
  `isoGroupCohomology` (`:233`, `[NeZero n]`), `continuousCohomology`
  (`…/ContCohomology/Basic.lean:131`; its TODO at lines 38–39 records the discrete comparison as
  missing), `Rep.ihom` (`Rep/Basic.lean:774`), `HNNExtension.t_mul_of`
  (`GroupTheory/HNNExtension.lean:71`), `AlgebraicTopology.inclusionOfMooreComplexMap`
  (`AlgebraicTopology/AlternatingFaceMapComplex.lean:263`), `IsPGroup` (`GroupTheory/PGroup.lean:45`,
  no primality), `⁅g₁, g₂⁆ = g₁g₂g₁⁻¹g₂⁻¹` (`Algebra/Group/Commutator.lean:16`), and
  `…/GroupHomology/FiniteCyclic.lean` exists.
- Tau Ceti: `TauCeti.groupCohomology.corestriction` (`…/GroupCohomology/Corestriction.lean:136`),
  `TauCeti.groupHomology.transfer` (`…/Transfer/Basic.lean:79`), `HInfRes_exact`
  (`…/InflationRestriction.lean:139`), the Tate cup lemmas (`Cup/Associativity.lean:214`,
  `Cup/GradedComm.lean:168`, `Cup/Corestriction.lean:178`, `Cup/Restriction/AllDegrees.lean:141`,
  `Cup/Unit.lean:56`, `Cup/Delta.lean:242`, `443`), `characterConnectingClass`
  (`TateCohomology/Character.lean:65`), `periodicIsoOfGenerator` (`Periodic.lean:302`),
  `IsTransgressionLift` and `transgression` (`ContCohomology/Transgression.lean:147`, `702`),
  `corestriction_mackey` (`…/Mackey/AllDegrees.lean:279`), the filtered spectral sequence
  (`SpectralObject.lean:304`, `409`, `425`; `FirstPage.lean:89`; `Stabilization.lean:83`;
  `Abutment.lean:92`), the Künneth sequence (`Kunneth/Sequence.lean:729`, `793`; its header confirms
  projective cycles and quotients in `L`), `extToHomology` (`UniversalCoefficient/Basic.lean:121`),
  `groupHomology.exists_map_subtype_eq` and `isZero_groupHomology_of_directed`
  (`…/DirectedUnion.lean:113`, `132`), `Rep.dimensionShiftUp` (`Induction/DimensionShift.lean:83`).
- Object search at the pins for what Layers 1–8 build: no discrete-group cup product, conjugation
  on `groupCohomology`, Hochschild–Serre filtration, double coset formula, stable elements, Tate
  duality or Hopf formula exists there. What does exist and is not cited is R03. The pinned
  `Monoidal/KFlat/Basic.lean` has the K-flat laws that the route of `gap:flat-kunneth` attributes
  to DerivedModuleAlgebra §0.2; the Künneth sequence for flat terms itself is at neither.

### Suppliers, order and overlaps

Dependency check, run on the unchanged design:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2198 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Cited sections resolved now, on main or at the open head:

| Supplier | Sections found |
| --- | --- |
| DerivedModuleAlgebra (main) | §0.2 (line 794), §S.1 (line 955); its homological form stops at the second page, as the gap says; no Künneth sequence in the README |
| ProfiniteCohomology (main) | §3.1, §3.2, §5.5, §6.4, §10.1, §10.5, Layers 8 and 12 |
| ClassFieldTheory (main) | Layer 0, §0.1, with `Rep.isZero_res_of_projective`, `Rep.projective_of_isZero_res` |
| FreeGroupsAndLimitGroups (main) | §2.2, §§4.1–4.2, §4.5, §4.6, §4.7, §4.8 |
| AlgebraicTopology (main) | §§4.1–4.3, §5.3, §5.4 |
| StableHomotopyKTheory (main) | §3.29: kernel–`H₂` identification for perfect groups only |
| K2SymbolsBrauer (open) | §1.1, *The bar-calibrated kernel identification* |
| SchemeKTheoryOperations (open) | §6.7: hyperhomology and the directed-union identification for a representation over any `k` |
| K3BlochGroups (open) | §4.1, §5.2 with `finiteGroup_stableElements`, `finiteGroup_homologyDuality`, `quaternionPeriodicHomology`, `finiteGroup_period_fromSylow` |
| MappingClassGroupsAndCanonicalRepresentations (open) | §1.1 |
| IntegralIwasawaTheoryPartII (open) | §0.7 |
| ModularCurvesPartII (open) | §15.4 |
| InductionRestrictionPartII (open) | RS.0.1 (§0.1) |

The board-package index and the open-pull-request list were read: no second CohomologyOfGroups, on
main or open. `scratch/overlaps.md` lists no conflicting head, no dropped id and no id that only a
revision defines. ArithmeticGaloisDuality §R02.2 (*d₂ as cup product with the extension class*) and
NoncommutativeAndEquivariantIwasawa §F.3 state Hochschild–Serre for profinite groups on the
continuous carrier, with the same sign `−u ∪ x`; that is a different carrier, met here only through
6.9, and is no finding. HomologicalStabilityOfGeneralLinearGroups consumes SchemeKTheoryOperations
§6.7 for particular complexes and shares no owned object.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, IntegralIwasawaTheoryPartII, ProfiniteCohomologyPartII, ProfiniteCohomology, DerivedModuleAlgebra, ClassFieldTheory (the third list is empty); finite-group integral universal coefficients and homological Sylow surjectivity: owner ArithmeticGaloisDuality §D7.2 (R01); the homological edge isomorphism: owner IntegralIwasawaTheoryPartII §0.7 (R04); integral stable elements, duality and periods: owner K3BlochGroups §5.2, cited; outside the lists, `Λ²G ≅ H₂(G, ℤ)` for finite abelian `G`: owner InductionRestrictionPartII RS.6.8 (R02).

### Principles, shape and headlines

- No route-specific narrowing, algorithm, copied passage, `set_option` or sorry'd data. The
  finite-group hypotheses sit on 7.2 and Layer 8 only.
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, References.
  The plan has 41 targets (28 theorems, 10 definitions, 3 constructions) and 142 tests; every
  definition and construction has at least three, every target a locator, and no prerequisite
  points forward.
- Process residue: a search for round labels, pull-request numbers, paths, anchors and LaTeX
  delimiters found none.
- Both gaps have the same slug in the README and the plan, a named supplier and section, and a
  one-sentence `needs`.
- Headline theorems from the Summary: Hochschild–Serre (6.2–6.7), the tree sequence (3.5), Künneth
  (5.1), the double coset formula (7.1), stable elements (7.2), Tate duality (8.1), periodicity
  (8.5). Each has a target. There is no `Suggested.lean` at this stage, so statability, padding and
  binders are for the package review.

### Copyright and arrangement

Wording: the eleven sampled locators whose texts could be read and these eight further passages were set beside their sources:
4.2's uniqueness statement (MilneCFT line 3459–3476), 6.6's definition of a transgressive class
(HS53 line 815–823), 3.4 (SerreArbres line 5132–5147), 5.1's statement (Loh19 line 5854–5866), 7.2's
stability condition (Hutchinson13 line 482–491), 8.4's period (Hutchinson13 line 494–497), 6.7
(HS53 line 825–830), 6.5 (HS53 line 694–700). None reproduces a sentence; the longest shared runs
are formulas and three-word phrases such as “split (not naturally)”.

Arrangement: HS53 has 36 of the 109 source mentions. Its contents are Ch. I §§1–7 (general
methods), Ch. II §§1–5 (filtration, `E₁`, an identity, `d₁`, products), Ch. III §§1–6 (applications).
Only Layer 6 draws on it. Its subsections 6.1, 6.2, 6.5, 6.6, 6.7 use Ch. II §1, §§2 and 4, §5 and
Ch. III §§3, 6 and §4 in an order their *Needs:* lines force (6.2 needs 6.1; 6.5 needs 6.2; 6.6
needs 6.5; 6.7 needs 6.6). 6.3, 6.8 and 6.9 have no counterpart there, and Ch. III §§2 and 5 are
absent. The other seven layers do not map to it. No reuse of tables, figures or example lists.

Source independence: 19 passages compared with 5 sources, none shared; largest share HS53, 36 of 109 locators; contents compared with HS53: independent. Brown82 and CE56 (uncertified) and SwanPPeriod60 (waived) could not be read.

## Not verifiable

- Brown82 (Ch. II §7, III §§8–10, IV §4, V, VI §§7 and 9, VII) and CE56 (Ch. XII, XVII): settled as
  uncertified; the locators for 1.3, 3.1, 3.2, 3.6, 4.4, 4.6, 5.4, 7.1, 7.2, 8.1, 8.2, 8.3, 8.5 and
  2.2 were not read. The statements were checked by computation, not against those texts.
- SwanPPeriod60 Thms. 1 and 2: waived; read only as restated in Hutchinson13 line 499–504.
- Elaboration, the one-tactic probe and the binder audit: the design has no Lean file and this lane
  does not elaborate.
- InverseGaloisAndArithmeticFundamentalGroups IG.3.4, the supplier of the commuting-pair classes
  that RS.6.8 uses, was not opened; R02 relies on InductionRestrictionPartII's own statement of
  the cycle `[x|y] − [y|x]`.

## Source issues

- **Misprint** in Hutchinson13 at the proof of Corollary 3.3, printed p. 12 (Hutchinson13 line 518): the source says the localized homology is cyclic of the stated order when the degree is congruent to 3 modulo 3; it should be congruent to 3 modulo 4, as in the statement of the corollary; affects nothing.

## For the human reviewers

- **Not tested.** Brown82 has 15 of the 109 source mentions and is uncertified in
  `packages/CohomologyOfGroups/sources.toml`; its wording and contents were not compared with
  Layers 3, 4, 5, 7 and 8, which cite it by chapter.
- **Licence.** `packages/CohomologyOfGroups/sources.toml` records MilneCFT, fetched from its
  author's own site, with `licence_class = "open-repository"`, and Loh19 with `"author-page"`. Both
  are unpublished course notes; only statements and locators are taken from them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "47da4782b135aa7f0e45d51a31f93e30ba9cabb3", "job": "REV-DESIGN-CohomologyOfGroups~9", "model": "fable", "worker": "chris-x30"} -->
