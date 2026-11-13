<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6866439826 -->
Review (claude) of f0a1227

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Hopf's isomorphism has no normalisation witness and no comparison with the perfect-group case on main

   **Location.** `packages/CohomologyOfGroups/design/README.md`, 6.8: "`H₂(G, ℤ) ≅ (R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`,
   naturally in presentations"; plan target 6.8, tests `hopf_cyclic`, `hopf_Z2`, `hopf_free`.

   **Claim.** 6.8 constructs a map (the `d²` of 6.7) but its three Checks only compute isomorphism
   types (`0`, `ℤ`, `0`): the map composed with inversion passes all of them and is equally natural.
   For perfect `G` the same identification is stated on main, and 6.8 does not say the two agree.

   **Witness.** `TauCetiRoadmap/StableHomotopyKTheory/README.md:1349` (main): "Identify the supplied
   presentation kernel (R∩[F,F])/[F,R] with H₂(P;ℤ), naturally under presentation comparisons".
   K2SymbolsBrauer §1.1 (open) needs the sign: its torus cycle maps to the inverse commutator.

   **Repair.** In 6.8 (README and plan): (i) state the map: the class of a 2-cycle of `G` goes to the
   boundary of a lift to `F`, a relative cycle `[x] − [y]` with equal images going to `xy⁻¹` in
   `R/⁅F, R⁆`; (ii) add the Check: for `ℤ² = ⟨a, b | [a, b]⟩` the class `[e₁|e₂] − [e₂|e₁]` goes to
   `bab⁻¹a⁻¹ = [a, b]⁻¹`, the opposite normalisation gives `[a, b]`; (iii) add the comparison bullet:
   for perfect `G` the isomorphism is the kernel–`H₂` identification of StableHomotopyKTheory §3.29
   with this normalisation; add `StableHomotopyKTheory §3.29` to the *Needs* line and the plan
   prerequisites "for the comparison". Tested on the witness: the lift `[a|b] − [b|a]` has boundary
   `([b] − [ab] + [a]) − ([a] − [ba] + [b]) = [ba] − [ab]`, and `[x] − [y] ≡ [xy⁻¹]` because
   `d[xy⁻¹|y] = [y] − [x] + [xy⁻¹]`; so the value is `ba(ab)⁻¹ = bab⁻¹a⁻¹`, a generator of
   `[F, F]/[F, [F, F]] ≅ ℤ` and the inverse of the other candidate.

2. **F02** (P3) integral statements quantified over `G : Type u`

   **Location.** README 8.4: "for every finite cyclic `G : Type u` (`[Group G] [IsCyclic G]`)"; plan
   targets 8.1, 8.3, 8.4, 8.5 (hypotheses `G : Type u`, `M : Rep ℤ G`) and 6.8 (`S : Type u`).

   **Claim.** With coefficients `ℤ : Type` the pinned carriers force the group into `Type`; the
   statements do not elaborate for `u > 0`.

   **Witness.** Mathlib `RepresentationTheory/Homological/GroupCohomology/Basic.lean:73`:
   `variable {k G : Type u}`; Tau Ceti `…/TateCohomology/Character.lean:57`:
   `variable (G : Type) [Group G] [Fintype G]` for `characterConnectingClass`.

   **Repair.** Write `G : Type` in README 8.4 and in the plan hypotheses of 8.1, 8.3, 8.4, 8.5, and
   `S : Type` in 6.8; add to the Conventions bullet on universes: "for `k = ℤ` the group lies in
   `Type`". Tested: `k = ℤ`, `G : Type` matches both pinned signatures above.

3. **F03** (P3) the supplier contract attributes a definition K3BlochGroups §5.2 does not state

   **Location.** README, Exact supplier contracts, From TauCetiRoadmap.K3BlochGroups: "The `r`-period
   there is the least `d ≥ 2` with `H_{d−1}(G, ℤ_(r))` cyclic of order `|G|_r` (Hutchinson13 line
   494–497)".

   **Claim.** §5.2 at its head uses "its r-period" in `finiteGroup_period_fromSylow` without defining
   it, and Hutchinson13 line 494–497 names a `d` with the property, not the least one. The reading
   is the only one under which Swan's values make sense, but it is this roadmap's assumption.

   **Witness.** K3BlochGroups README at its open head, §5.2 (line 1871): "its r-period is twice the
   order of the automorphisms of that Sylow subgroup induced by its normalizer"; no definition of the
   period occurs in the file.

   **Repair.** Reword the sentence as an assumption of the contract: "Assumed of §5.2: its `r`-period
   is the least `d ≥ 2` with `H_{d−1}(G, ℤ_(r))` cyclic of order `|G|_r`, the minimal `d` of
   Hutchinson13 line 494–497; by §5.2's duality this is the `p`-period of 8.4." Tested on `S₃`,
   `r = 3`: `H₁(S₃, ℤ_(3)) = 0`, `H₃(S₃, ℤ_(3)) = ℤ/3`, least `d = 4 = 2·|S₃/A₃|`; `d = 8` also has
   the property, so "least" is needed.

4. **F04** (P3) two supplier sections cited in Checks are missing from the README's contracts

   **Location.** README 3.6 Check "(the amalgam presenting `SL₂(ℤ)`, FreeGroupsAndLimitGroups §4.8)"
   and 5.4 Check "as for the torus in AlgebraicTopology §5.4".

   **Claim.** The Exact supplier contracts list FreeGroupsAndLimitGroups §§2.2, 4.1–4.2, 4.5–4.7 and
   AlgebraicTopology §§5.3, 8.15 only; the plan's supplier list has §4.8 and §5.4.

   **Witness.** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:937` (§4.8, line 944 has the
   amalgam `ℤ/4 ∗_{ℤ/2} ℤ/6`); `TauCetiRoadmap/AlgebraicTopology/README.md:2005` (§5.4).

   **Repair.** Add "§4.8: `SL(2, ℤ)` on its Bass–Serre tree recovers `ℤ/4 ∗_{ℤ/2} ℤ/6`, used in a
   Check of 3.6" and "§5.4: torus homology, compared with 5.4 in a Check" to the two contract
   subsections, and both to the Dependencies of Layers 3 and 5.

5. **F05** (P3) ownership remarks inside layer text

   **Location.** README 6.8: "is InductionRestrictionPartII RS.0.1's and is not restated here"; 8.1:
   "of K3BlochGroups §5.2, which is not restated here".

   **Claim.** The house style keeps "stated by roadmap X" in Scope and ownership; both remarks repeat
   Scope bullets and read as traces of a deletion.

   **Witness.** Scope and ownership already has "InductionRestrictionPartII RS.0.1 owns the exact
   sequence …" and "8.1 is Tate duality for arbitrary coefficients, of which §5.2's duality is the
   integral instance".

   **Repair.** Delete "and is not restated here" in 6.8 and ", which is not restated here" in 8.1;
   the comparison sentences stay.

Needs changes: five findings, all P3 (R01 to R05), each with a repair to apply; no P1 or P2
finding. The declared gap `gap:homological-low-degree` is a stated contract and is not a finding.
The round-4 finding is repaired.
Files reviewed: `packages/CohomologyOfGroups/design/README.md`,
`packages/CohomologyOfGroups/design/plan.json`, `packages/CohomologyOfGroups/sources.toml`. None
was modified; no source was fetched and the manifest is unchanged.

## Previous finding (round 4), checked first

| Finding | Status | Repaired passage and my check |
|---|---|---|
| F01 (P2), covering-space Check of 3.3 needs trivial coefficient action | repaired | README 3.3, first Check: "`M` a `k`-module with trivial action of `G`, `(C ⊗ M)_G` is the quotient chain complex `C_*(E; M)_G`, which AlgebraicTopology §5.3 identifies with `C_*(B; M)` through `p_*` … §5.3 compares constant coefficients only." The second Check is the sign-module negative control. Recomputed: `∂e = (t − 1)v`, and under `g ⊗ m ↦ g⁻¹m` the differential is `t⁻¹m − m = −2m`, so `(H₀, H₁) = (ℤ/2, 0)` against `(ℤ, ℤ)` on the base; trivial `M` gives differential `0` and `(ℤ, ℤ)` on both sides. Singular route: `0 → ℤ_sgn → ℤG → ℤ → 0`, `p_*` is `×2` on `H₁` and bijective on `H₀`, so `H₁ = ker 2 = 0`, `H₀ = coker 2 = ℤ/2`. Plan tests `free_cover` and `free_cover_sign` agree. AlgebraicTopology §5.3 on main (`TauCetiRoadmap/AlgebraicTopology/README.md` lines 1961–1972) says "for constant R-module coefficients M". |

Pattern searched in the rest of the design: every mention of §5.3 and Cartan–Leray (Scope bullet,
supplier contract, plan supplier entry, 3.2 rotation Check with trivial `ℤ`, 3.3's algebraic
statement). All now carry the constant-coefficient restriction or do not need it. The repair
report marked nothing `not actionable in this package`.

## Verified sound

### Principles, shape, supply

- Principles: no route-specific shortcut, no re-planned roadmap, no computational algorithm, no
  `set_option`, no sorry'd data (there is no Lean file at the design stage). Layers are named by
  their mathematics; none follows a source's chapters (arrangement check below).
- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, References.
  Plan: 41 targets (10 definitions, 3 constructions, 28 theorems), 136 tests, at least 3 per
  target; every target has a locator; no forward `target:` prerequisite.
- Process residue: scan for round labels, pull-request numbers, dates, paths, LaTeX delimiters,
  `lemma`, "optional/deferred": none except R05.
- Dependency check (command of the brief), output:

  ```text
  candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
  depcheck: 240 roadmaps, 2172 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. All cited suppliers are on main or earlier in the merge order:
  SchemeKTheoryOperations (37), InductionRestrictionPartII (64), ModularCurvesPartII (71),
  K3BlochGroups (139), MappingClassGroupsAndCanonicalRepresentations (293),
  IntegralIwasawaTheoryPartII (315); DerivedModuleAlgebra, ProfiniteCohomology, ClassFieldTheory,
  FreeGroupsAndLimitGroups, AlgebraicTopology, StableHomotopyKTheory on main. None is on the
  never-cite list.
- Gap `homological-low-degree`: same slug in the README contract and in `plan.json`; supplier
  DerivedModuleAlgebra §S.1. Read §S.1 on main (`TauCetiRoadmap/DerivedModuleAlgebra/README.md`
  lines 955, 991–1000): the homological form gives `E¹`, `E²`, `E^∞` and stabilisation only.
  The pinned Tau Ceti `Algebra/Homology/SpectralSequence/Bicomplex.lean` has no edge map or
  five-term sequence (declarations at lines 97–497 read). Precise, minimal, declared: no finding.
- Elaboration: not available (this lane does not elaborate; say so in the report). There is no
  `Suggested.lean`, so the one-tactic probe, the `#check` binder audit and the headline-coverage
  check have nothing to run on. Headline theorems read from the Summary: Hochschild–Serre
  (6.2–6.7), tree sequence (3.5), Künneth (5.1), double coset formula (7.1), stable elements
  (7.2), Tate duality (8.1), periodicity (8.5); each is a named target with hypotheses.

### Adversarial table (sampled targets, headlines, targets touched by findings)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions, conjugation pair | equivariance of `m ↦ g·m` for `f(x) = g⁻¹xg`; `S₃`, `H = ⟨(12)⟩`, `g = (123)` | `g·(g⁻¹xg·m) = x·(g·m)`; `gHg⁻¹ = ⟨(23)⟩`, `g⁻¹Hg = ⟨(13)⟩` | pair is compatible; direction pinned |
| 1.2 quotient action | `2ℤ/4 ◁ ℤ/4`, `M = ℤ` sign; `A₃ ◁ S₃`, `𝔽₃`; `N = 1`, `N = G` | `H⁰(N, M) = M`, generator acts `−1` (model without coefficient action: `+1`); `−1` on `Hom(A₃, 𝔽₃)`, invariants `0 = Hom(S₃, 𝔽₃)`; `M` with `G`-action; trivial action | sound |
| 1.3 additivity | `ℤ/2`, family of trivial `ℤ`; `A = ℤ^(ℕ)`; one-point and empty `ι` | `H₁ = (ℤ/2)^(ι)`; `id ∈ Hom(A, ℤ^(ℕ))` has infinitely many nonzero coordinates, not in `⊕ Hom(A, ℤ)`; identities; `0 = 0` | sum/product sides correct |
| 2.2 long exact sequences | `C` acyclic; `G = 1`; degree-0 complexes | `Hₙ(G; C) = 0` by 2.3's vanishing so `δ` bijective; total complex is `C`; bicomplex has one row | sound (CE56 not readable) |
| 2.3 two spectral sequences | `S₃`, `ℤ[S₃/A₃] → ℤ`; `S₃/⟨(12)⟩` | `d¹`: `id_ℤ` at `q = 0`, `ℤ/3 → ℤ/2` zero at `q = 1`; `E²_{0,1} = ℤ/2`, `E²_{1,1} = ℤ/3`, `E²_{0,2} = 0`; direct: `H₀(S₃, ℤ_sgn) = ℤ/2`, `H₁(S₃, ℤ_sgn) = (ℤ/3 ⊗ sgn)_{ℤ/2} = ℤ/3`. Second complex: `ℤ/2 → ℤ/2` iso, `H₀ = H₁ = 0`, `H₁(C) = ℤ²` | both sequences agree; no converse to vanishing |
| 3.1 equivariant homology | `k = ℤ/4`, `M = ℤ/2`, `k ⊕ (ℤ/2 → ℤ/4 → ℤ/2)`; telescope `F → F → ℤ[1/2]`; `0 → ℤ →2 ℤ → ℤ/2` with `M = ℤ/2` | tensored differentials `(0, id)`: `H₂ = ℤ/2 ≠ 0`; `a₀ = Σ 4^j = −1/3 ∉ ℤ` so cokernel of `Hom(u, ℤ)` nonzero; `ℤ/2 →0 ℤ/2` not injective although `H₁^G(C''; M) = 0` | flat / projective / exactness hypotheses each needed |
| 3.2 orbit spectral sequence | two-edge circle, reflection and rotation by `ℤ/2` | reflection: edges one free orbit, `E¹_{1,q} = 0` (`q > 0`), `E¹_{0,q} = (ℤ/2)²` for odd `q`, two columns so it survives; rotation: coinvariant complex `ℤ →0 ℤ`, `H₀ = H₁ = ℤ` | sound (the Check's "odd `q ≥ 3`" holds already for `q ≥ 1`) |
| 3.5 tree sequence | `ℤ` on the line, `M` any; sum model | `t(e) = t·v`, map `c_{t⁻¹} − 1 = t⁻¹ − 1`: `H₁ = M^ℤ`, `H₀ = M_ℤ`; sum gives `H₀(ℤ, ℤ) = ℤ/2` | sound |
| 3.6 (used by 6.8) | `BS(1, 2)`; HNN edge with stabiliser `A`, endpoints `H`, `t⁻¹H` | `c_t` on `A`: `a ↦ tat⁻¹ = φ(a)`, `m ↦ t·m`, equivariant since `t(am) = φ(a)(tm)`; `H₁`: `1 − 2 = −1`, `H₀`: `0`, so `H₁ = ℤ` | stable-letter convention matches Mathlib's `t a t⁻¹ = φ a` |
| 4.7 agreement of cups | `ℤ/2`, `𝔽₂` and `ℤ`; `∏_ℕ ℤ/p` | `x ∪ x ≠ 0` in `H² = Ĥ²`; `H⁰(ℤ/2, ℤ) = ℤ → Ĥ⁰ = ℤ/2`; `H¹_cont = ⊕ 𝔽_p` countable against `Hom(G, 𝔽_p)` uncountable | sound |
| 5.1 Künneth | `(ℤ/2)²`, `ℤ` | `H₂`: `H₁ ⊗ H₁ = ℤ/2`, Tor terms `0`; `H₃`: `ℤ/2 ⊕ ℤ/2 ⊕ Tor(ℤ/2, ℤ/2) = (ℤ/2)³`; shuffle `[g] × [h] = [(g,1)|(1,h)] − [(1,h)|(g,1)]` | sound; pinned Künneth needs projective cycles and `L_q/Z_q`, supplied by `N` projective and global dimension `≤ 1` |
| 5.4 Pontryagin ring | `ℤ/2`, `ℤ/n`, `ℚ`, general `k` | `Λ³(ℤ/2) = 0 ≠ H₃ = ℤ/2`; `Λ²(ℤ/n) = 0 = H₂`; colimit of `ℤ` along `×(m+1)` is `ℚ`, `Λ²ℚ = 0`; `x = Σ aᵢ ⊗ λᵢ`: `x² = Σ λᵢ² aᵢ² + Σ_{i<j} λᵢλⱼ(aᵢaⱼ + aⱼaᵢ) = 0` since integral degree-one classes square to `a ∧ a = 0` | `x² = 0` holds for every `k`, not only where `2` is invertible |
| 6.1 filtration | `N = 1`, `N = G`, `ℤ/2 ⊂ ℤ/4` degree 1; `A*_j ⊂ A_j` | `A_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ n`; `A_1 = 0`; `dim A_1 = 2`, `dim A*_1 = 1`; if `n − j + 1` arguments lie in `N`, one of the last `j` does, its coset is trivial and normalisation gives `0` | sound; matches HS53 line 380–408 |
| 6.2 Hochschild–Serre | index translation; `S₃ ⊃ A₃`, `𝔽₃` | `(p, q) ↦ (2p + q + 1, −p − 1)`: `s = −q′ − 1 = p`, `t = p′ + 2q′ + 1 = q`; `A_{p+r−1}` zero in degree `p + q + 1` iff `r ≥ q + 3`; `C̄/A_{p+2−r} = 0` iff `r ≥ p + 2`; actions `(−1)^{⌈q/2⌉}` give `H^q(S₃, 𝔽₃) = 𝔽₃` for `q ≡ 0, 3 mod 4` | both stabilisation hypotheses hold without a global bound |
| 6.3 homological form | `(Ind_1^G V)_N`; `ℤ/2 ⊂ ℤ/4`; `(ℤ/2)²` | `= Ind_1^Q V`, acyclic, so `Hₙ(Q; C_N(M)) = Hₙ((P ⊗ M)_G) = Hₙ(G, M)`; `E² = 𝔽₂` everywhere against `dim Hₙ = 1`; split case `n + 1` | sound |
| 6.4 edge maps | `ℤ/2 ⊂ ℤ/4`, `𝔽₂`, degree 1 | inflation of the nonzero character is nonzero; restriction evaluates at `2`: `0` | sound |
| 6.5 multiplicativity | `ℤ × ℤ ⊃ 0 × ℤ`; HS53 Thm. 3 indices | `ỹ ∪ x̃ ∈ A*_1`, restricts to `(σ, γ) ↦ y(σ)x(γ)`: `+x·y` with `(−1)^{0·0}`; `x ∪ y ↦ −x·y` with `(−1)^{1·1}`; HS53 line 692–698 has `(−1)^{i′j}` (fibre degree of `v` times base degree of `u`) and `d₁(u ∪ v) = d₁u ∪ v + (−1)^{i+j} u ∪ d₁v` | sign `(−1)^{pq′}` is the source's |
| 6.6 transgression | `ℤ/3 ⊂ ℤ/9`, `𝔽₃`; HS53 Thm. 4 proof | `f(3a + r) = a`: `df(x, y) = −carry(x, y)`, `df(2, 1) = −1`; factor set `s(2)s(1)s(0)⁻¹ = 3`, `u(3) = 1`; HS53 line 1007–1011: `df = −c` with the same factor set, and no `p`-dependent sign since `(−1)^{2·0} = 1` | `d₂ = −c ∪` for every `p`, with the README's extension-class convention |
| 6.7 low-degree sequences | `ℤ/2 ⊂ ℤ/4`, `ℤ`, `m = 2`; homology | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` with `1 ↦ 2` | sound; HS53 Thm. 2 has `m ≥ 1` |
| 6.8 Hopf | `ℤ/n`, `ℤ²`, free; torus cycle | `0`; `ℤ`; `0`; `[e₁|e₂] − [e₂|e₁] ↦ bab⁻¹a⁻¹`, the negative map gives `aba⁻¹b⁻¹` | statement true; normalisation unpinned: R01 |
| 7.1 double coset formula | `H = K = ⟨(12)⟩ ≤ S₃`; `K = 1`, degree 0; stable `z` | two double cosets of sizes `2`, `4`, second through `Hⁿ(1) = 0`; `Σ_{gH} g·m`; `Σ [P : P ∩ gPg⁻¹] = [G : P]` | sound; indices of `c_g`, `c_{g⁻¹}` land in the right subgroups |
| 7.2 stable elements | `S₃`, `p = 3`; homology form; `C₂ × S₃`, `M = 𝔽₂³` | `H²(3) = 0`, `H⁴(3) = ℤ/3`; stable `= tr(Hₙ(G)(p))` and `cor ∘ tr = [G : P]`, a unit on `p`-parts; `dim H¹(P, M) = 1 + 2 = 3` all `N_G(P)`-invariant, `dim H¹(G, Ind_P^G 𝔽₂) = 2` | sound; trivial action is needed for the abelian simplification (the centralising element acts on coefficients) |
| 8.1 Tate duality | `ℤ/2`, `M = ℤ`, `M = ℤ/2` | `Ĥ⁰(ℚ/ℤ) = 0 = Hom(Ĥ⁻¹(ℤ))`; `Ĥ¹(ℚ/ℤ) = ℤ/2 = Hom(H₁)`; `Ĥ⁰(Hom(ℤ/2, ℤ)) = 0 ≠ Hom(Ĥ⁰(ℤ/2)) = ℤ/2` | shifts and freeness correct |
| 8.2 `p`-groups | `Q₈`, `D₈`, order-21 group with `p = 21`, trivial group | cyclic subgroups only; contains `(ℤ/2)²`; orders `1, 3, 7` all cyclic but group not cyclic, `g²¹ = 1`; cyclic | primality needed and stated |
| 8.3 (used by 8.5) | truncation `C_n = F_n/B_n` | `0 → ℤ_χ → F_n/B_n → B_{n−1} → 0` with `B_{n−1} ⊂ F_{n−1}` free abelian, so `C_n` is free abelian; `B_n` has a finite free resolution | existence clause sound |
| 8.4 periods | `S₃`; `Q_{2^s}`; `p ∤ |G|`; `SL₂(𝔽_q)` | `3`-period `4`, `2`-period `2`; `Ĥ¹..Ĥ⁴ = 0, (ℤ/2)², 0, ℤ/2^s`, period `4`; least `d` would be `1`; `ℤ_(2)/q(q² − 1)` in degrees `≡ 3 mod 4` | sound; universe: R02; supplier wording: R03 |
| 8.5 periodicity | trivial group, `S₃`, `A₄`, `SL₂(𝔽₉)`, `p ∤ |G|` | all `Ĥ = 0`, `u = 0`; `d = 4`; contains `V₄`; `|SL₂(𝔽₉)| = 720`, Sylow `3` is `(ℤ/3)²`; every primary condition holds vacuously | four conditions agree on each instance |

Other sections were read in full and recomputed (1.1, 1.4, 1.5, 2.1, 3.3, 3.4, 4.1–4.6, 5.2, 5.3,
6.9, Layer examples); no discrepancy. Two values worth recording: 4.1's wrong model gives
`t·ψ(1) − 2ψ(1) + ψ(2) − ψ(1) = 2(t − 1)` at `(1, 1, 1)`, and 4.6's finite-index Check gives
`Σ_{Hg} [μ(g⁻¹x ⊗ n)]` on both sides.

### Sources: the seeded sample

| Target | Locator read | Result |
|---|---|---|
| 1.2 | HS53 line 345–354 (pp. 117–118); Loh19 Prop. 3.2.13, p. 124, line 5322–5351 | action `γ·f(γ⁻¹σγ)`, well defined on `G/K`; supported |
| 1.3 | Brown82 Ch. III | uncertified, not readable; proof in the README is self-contained |
| 2.2 | CE56 Ch. XVII | uncertified, not readable |
| 2.3 | HS53 Ch. I §5 Lemma 1 (p. 115, line 246), Lemma 2 and Prop. 5 (p. 116, line 273–288), §4 Prop. 4 (p. 114, line 214) | pages and numbers correct; they cover the bar-degree filtration, as the README attaches them |
| 3.1 | Brown82 Ch. VII | uncertified, not readable |
| 3.2 | HS53 Ch. I §4, p. 114, line 201–213; Brown82 Ch. VII | bicomplex supported; stabiliser formula follows from 1.3, 1.4, 2.3 |
| 4.7 | MilneCFT Ch. II Prop. 1.38, p. 73, line 3459–3484 | uniqueness, the two connecting rules and the cocycle formula as stated |
| 5.4 | Brown82 Ch. V | uncertified, not readable |
| 6.1 | HS53 line 368–419, pp. 118–119 | normalisation, `A_j`, `A*_j`, Prop. 1 and Lemma 1 as stated |
| 6.3 | Loh19 Thm. 3.2.12(1), p. 123, line 5306–5312; HS53 line 355–362 | supported |
| 6.5 | HS53 Ch. II §5 Thm. 3 and remark, p. 126, line 686–700; line 397–400 | sign and derivation rule as stated |
| 6.6 | HS53 Ch. III §3 Prop. 1, pp. 128–129, line 792–823; §6 Thm. 4, p. 133, line 984–990 | supported, hypotheses match (`K` acts trivially on `M`) |
| 7.2 | MilneCFT Ch. II Prop. 1.30, p. 70, line 3357–3359, and Cor. 1.33, p. 71, line 3382–3385; Hutchinson13 §3, p. 11, line 482–491 | `Cor ∘ Res = (G : H)` and injectivity of restriction on `p`-primary parts as stated, for every `G`-module; Hutchinson's stable-element statement is for `ℤ` coefficients, `k ≥ 1`; the README's general form is proved by its own route |
| 8.2 | Loh19 Cor. 1.6.18, 1.6.19, p. 53, line 2399–2419; Outlook 1.6.20, p. 54, line 2437–2456 | odd-prime statements and the 2-group outlook as stated |
| 8.4 | MilneCFT Prop. 3.4, Remark 3.5, p. 81, line 3793–3822; Hutchinson13 line 494–504, Cor. 3.3 line 511–515 | supported; cup description stated without proof there, as the README says |

Also checked: HS53 Ch. III §4 Thm. 2 and remark (line 825–830, 854–856); Loh19 Thm. 1.5.1
(p. 30), Prop. 1.6.11 and Remark 1.6.12 (p. 48), Thm. 3.2.18 (p. 129), Cor. 3.2.21 and
Thm. 3.2.22 (p. 135), Cor. 3.2.23 (p. 136), Example 3.2.25 (p. 137), Outlook 3.2.26 (p. 138),
Outlook 3.2.28 (p. 139), Thm. 4.3.7 (p. 165), §4.3.2 (p. 167); SerreArbres II §2.8 (line
5138–5184). All printed pages agree with the README. The manifest records all eight cited works.

### Library declarations opened at the pins

Every Mathlib and Tau Ceti name of the contracts and *Needs* lines (about ninety) was located by
search at the pins, with its file and line. Read for content:

- Mathlib `RepresentationTheory/Homological/GroupCohomology/Basic.lean:73, 183, 202, 210`
  (`{k G : Type u}`, `groupCohomology`, `groupCohomologyIsoExt`, `groupCohomologyIso`);
  `…/TateCohomology/Basic.lean:233, 241` (`isoGroupCohomology (n : ℕ) [NeZero n]`,
  `isoGroupHomology` with `m = −(n + 1)`, `[NeZero n]`: the README's "`n ≠ 0`" and "`n ≥ 1`");
  `GroupTheory/DoubleCoset.lean:79` (`DoubleCoset.Quotient`); `RepresentationTheory/Rep/Res.lean:43`.
- Tau Ceti `…/GroupCohomology/InflationRestriction.lean:132, 139` (hypothesis
  `∀ i < n, IsZero (Hⁱ⁺¹(S, A))`, as the contract says); `…/GroupHomology/Transfer/Basic.lean:79, 121`;
  `…/TateCohomology/Character.lean:57, 65` (`G : Type`); `…/Cup/Cyclic.lean:57, 146` (degree-zero
  cup with `δχ`, `G : Type`, `[CommGroup G]`: 8.4's all-degree statement is new);
  `…/TateCohomology/Periodic.lean:95, 302, 346` (namespace `Rep.FiniteCyclicGroup`);
  `Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:270, 307, 729` (projective cycles and
  `L_q/Z_q`); `…/ContCohomology/DiscreteGroup.lean:166` (`Nonempty (… ≃+ …)`, finite `G`, as the
  contract says); `…/GroupHomology/DirectedUnion.lean:113, 132` (surjective half only);
  `…/GroupHomology/Induced.lean:49`; `…/TateCohomology/Projective/Basic.lean:123, 232`;
  `Algebra/Homology/SpectralSequence/Bicomplex.lean:410, 442, 484`.

### Duplication and ownership

Object searches over main and the open heads (`roadmaps grep`, README text): Hopf's formula,
double coset formula, stable elements, Pontryagin product, periodic cohomology, Hochschild–Serre,
cap product, Tate duality, amalgam/Lyndon sequences, universal coefficients, Künneth. Results:

- Hopf's formula: StableHomotopyKTheory §3.29 (main) for perfect groups, cited in Scope; R01
  asks for the comparison. InductionRestrictionPartII RS.0.1 and K2SymbolsBrauer §1.1 consume
  Hopf's formula and do not own the general statement.
- "double coset formula": no match in any roadmap; ProfiniteCohomology §6.4 owns the profinite
  Mackey formula (cited). 7.1 for arbitrary discrete groups is owned here.
- Stable elements, integral duality, quaternion and Swan periods: K3BlochGroups §5.2 (lines
  1868–1871 at its head), cited; 7.2, 8.1, 8.4 extend and compare.
- Amalgam sequences: ModularCurvesPartII §15.4 and AutomorphyLiftingBeyondTaylorWiles §3.4 treat
  particular arithmetic amalgams; 3.5–3.6 for arbitrary trees are owned here.
- Hyperhomology: SchemeKTheoryOperations §6.7 (integral, lines 2549 and 2583 at its head, under
  the heading "6.7 Pointed sheaf models and K-coherence") and K3BlochGroups §4.1; cited, extended.
- Discrete Hochschild–Serre existence and the degree-one transgression:
  MappingClassGroupsAndCanonicalRepresentations §1.1 (lines 848–882 at its head); 6.2 realises it.
- `ℂ_p` cap product: IntegralIwasawaTheoryPartII §0.7 (line 276 at its head); 4.6 compares.
- Pontryagin products elsewhere (DGFloerPartII, GeneralAlgebraicKTheoryPartII, AlgebraicTopology)
  are of loop spaces and H-spaces, a different object from 5.4.

`scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped,
no id is defined only by an open revision, and main has no `CohomologyOfGroups` folder (no second
copy). Supplier sections resolved this round: DerivedModuleAlgebra §S.1; ProfiniteCohomology
§§3.1, 3.2, 5.5, 6.4, 10.1, 10.5, Layer 12; ClassFieldTheory §0.1; FreeGroupsAndLimitGroups
§§2.2, 4.1, 4.2, 4.5–4.8; AlgebraicTopology §§4.1–4.3, 5.3, 5.4, 8.15; StableHomotopyKTheory §3.29
(all on main); SchemeKTheoryOperations §6.7; K3BlochGroups §§4.1, 5.2;
MappingClassGroupsAndCanonicalRepresentations §1.1; IntegralIwasawaTheoryPartII §0.7;
InductionRestrictionPartII RS.0.1; ModularCurvesPartII §15.4 (open heads). `roadmaps resolve`
reports no citation and no Lean name found nowhere.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, IntegralIwasawaTheoryPartII, ProfiniteCohomologyPartII (open), ProfiniteCohomology, DerivedModuleAlgebra, ClassFieldTheory (main); the third list is empty. Shared objects and owners: finite-group stable elements with `ℤ_(r)`, integral duality, quaternion and Swan periods — K3BlochGroups; the `ℂ_p` cap product — IntegralIwasawaTheoryPartII; continuous cohomology, profinite five-term sequence and Mackey formula — ProfiniteCohomology; double-complex spectral sequences — DerivedModuleAlgebra; the Tate interface — ClassFieldTheory; integral hyperhomology — SchemeKTheoryOperations. ArithmeticGaloisDuality (compact and continuous coefficients, profinite Hochschild–Serre) and ProfiniteCohomologyPartII (Massey products, unitriangular lifting) share nothing owned here. HomologicalStabilityOfGeneralLinearGroups uses, in the route of its 2.3, "the natural Künneth sequence for a product of two groups" without stating or citing it; the Künneth sequence of group homology is owned here (5.1), and that roadmap, which is not in the merge order, is a consumer.

### Wording, arrangement, reuse

Wording: 19 passages set beside five sources (1.2 with HS53 line 345–354 and Loh19 line
5322–5351; 2.3 with HS53 line 236–288; 3.2 with HS53 line 201–213; 3.5 with SerreArbres line
5138–5184; 4.2 with MilneCFT line 3459–3484; 6.1 with HS53 line 368–408; 6.2 with HS53 line
489–491 and 654–657; 6.3 with Loh19 line 5306–5314; 6.5 with HS53 line 686–700; 6.6 with HS53
line 792–823 and 984–990; 6.7 with HS53 line 825–830; 6.8 with Loh19 line 1460–1466; 7.2 with
Hutchinson13 line 482–491 and MilneCFT line 3357–3385; 8.2 with Loh19 line 2399–2456; 8.4 with MilneCFT line 3793–3822 and
Hutchinson13 line 494–504). Shared material is formulas, standard names and hypothesis lists;
no sentence, displayed list or proof plan of a source is reproduced or followed clause by clause.
No table, figure or exercise list is taken over.

Arrangement: 99 source-key occurrences before References: HS53 34, Loh19 21, Brown82 14,
Hutchinson13 12, MilneCFT 9, SerreArbres 4, CE56 3, SwanPPeriod60 2. HS53's three chapters
(HS53 line 22–42: Cartan–Leray method, direct filtration, applications) meet only Layer 6, where
6.1 → 6.2 → 6.4, 6.5 → 6.6 → 6.7 is forced by the *Needs* lines; Layers 1–5, 7, 8 have no
counterpart in it.

Source independence: 19 passages compared with 5 sources, none shared; largest share HS53, 34 of 99 locators; contents compared with HS53: independent. Brown82 and CE56 (uncertified) and SwanPPeriod60 (waived) could not be read.

## Not verifiable

- Brown82 (14 locators: 1.3, 3.1, 3.2, 3.6, 4.4, 4.6, 5.1, 5.4, 7.1, 7.2, 8.1, 8.2, 8.3, 8.5) and
  CE56 (2.2, 8.1, 8.5): settled as uncertified; chapter locators, hypotheses and wording not
  checked against the texts. The statements were checked mathematically instead (table above).
- SwanPPeriod60: waived; read only through Hutchinson13 Thm. 3.1.
- Elaboration: not available in this lane, and there is no `Suggested.lean` at the design stage.
- The sign of the homological `d²` supplied through `gap:homological-low-degree` cannot be
  checked until the supplier states it; R01 fixes the normalisation on this side.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3, proof, printed p. 12 (Hutchinson13 line 518): the source says the degrees are those congruent to 3 modulo 3; it should be 3 modulo 4, as in the statement; affects the proof.
- **Gap** in Hutchinson13 at the paragraph before Theorem 3.1, printed p. 12 (Hutchinson13 line 494–497): the source says a number `d ≥ 2` with the periodicity property is called the period; it should be the least such `d`, since every multiple has the property; affects a stated result.

## For the human reviewers

- Brown82 and CE56 are cited by chapter only and are uncertified in `packages/CohomologyOfGroups/sources.toml`; SwanPPeriod60 is waived. Their wording was not compared. The most-cited source, HS53, was read at its outline and at the sampled locators.
- Loh19 is unpublished lecture notes on an author page (`licence_class = "author-page"` in `packages/CohomologyOfGroups/sources.toml`); it carries 21 of the 99 locators.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f0a12277923fa765d809e46c0c51da9def3b37b8", "job": "REV-DESIGN-CohomologyOfGroups~5", "model": "fable", "worker": "chris-x55"} -->
