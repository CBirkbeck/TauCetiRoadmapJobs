<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6873701514 -->
Review (claude) of cf9d800

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `gap:flat-kunneth` asks DerivedModuleAlgebra for a sequence an earlier roadmap already states

   - **Location.** `packages/CohomologyOfGroups/README.md` lines 436–448 (contract), 77–83 (Scope),
     1356–1357 and 1367 (5.1), 1534 (Layer 5 dependencies); `design/plan.json`, second entry of `gaps`.
     "What DerivedModuleAlgebra must provide (gap:flat-kunneth): in §0.2, for a commutative ring `R` of
     global dimension at most one and chain complexes `K`, `L` … with `L` flat in every degree, the
     sequence …"
   - **Claim.** No roadmap earlier in the merge order provides the two-term Künneth sequence of two
     complexes one of which is flat in every degree; Scope says the Künneth sequences are "owned by a
     spectral-sequence roadmap", unnamed.
   - **Witness.** SpectralSequencesAndConvergencePartII §4.3, lines 1480–1511: for commutative `R` and
     bounded-above `K`, `L`, when `Tor_i^R = 0` for `i ≥ 2` the two columns give
     `0 → ⊕ Hⁱ(K) ⊗ Hʲ(L) → Hⁿ(K ⊗^L L) → ⊕_{i+j=n+1} Tor₁ → 0`; edge map the cross product (lines 1504–1505);
     flat `K` gives `Tot(K ⊗ L)` (line 1507); natural from page 2.
   - **Why it is the same statement.** A chain complex indexed by `ℕ` is bounded above in cohomological
     degrees; global dimension at most one gives `Tor_i = 0` for `i ≥ 2`; `i + j = n + 1` in
     cohomological degrees is `p + q = n − 1` in homological ones. Only the (non-natural) splitting is
     not in §4.3. Line 1829–1833 of that README names this roadmap as the consumer of "the Künneth and
     universal-coefficient sequences of group (co)homology as Layer 4".
   - **Repair.**
     1. Scope (lines 77–83): replace "owned by a spectral-sequence roadmap" by "owned by
        SpectralSequencesAndConvergencePartII §§4.2–4.3", and replace the sentence on what
        DerivedModuleAlgebra §0.2 must provide by: "Its §4.3 gives, when `Tor_i^k = 0` for `i ≥ 2`, the
        natural two-term Künneth sequence of two bounded-above complexes one of which is flat in every
        degree, with the cross product as first map; this roadmap proves the group-homology sequences
        of 5.1 from it and their splitting from Tau Ceti's."
     2. Exact supplier contracts: delete the `gap:flat-kunneth` bullet under DerivedModuleAlgebra. Add
        `### From TauCetiRoadmap.SpectralSequencesAndConvergencePartII` with the bullet: "§4.3 (*The
        Künneth spectral sequence*): for a commutative ring `R` with `Tor_i^R = 0` for `i ≥ 2` and
        bounded-above complexes `K`, `L` of `R`-modules, one of them flat in every degree, the exact
        sequence `0 → ⊕_{i+j=n} Hⁱ(K) ⊗ Hʲ(L) → Hⁿ(K ⊗ L) → ⊕_{i+j=n+1} Tor₁^R(Hⁱ(K), Hʲ(L)) → 0`,
        natural in `K` and `L`, whose first map is the cross product (Tau Ceti
        `HomologicalComplex.homologyCross`, `Algebra/Homology/Monoidal/Homology/Cross.lean`). Chain
        complexes indexed by `ℕ` are bounded above in this indexing, and `i + j = n + 1` reads
        `p + q = n − 1`. No splitting is assumed. Used in 5.1."
     3. 5.1 route: replace "`gap:flat-kunneth` applies" by "SpectralSequencesAndConvergencePartII §4.3
        gives the exact natural sequence. For the splitting, choose quasi-isomorphisms `K′ → K` and
        `L′ → L` from complexes of projective modules indexed by `ℕ` (§2.6 there); over `k` their cycles
        and boundaries are projective and the cycles split off, so
        `HomologicalComplex.homologyKunnethShortComplexSplitting` gives a retraction of the cross
        product of `K′`, `L′`; `K′ ⊗ L′ → K ⊗ L` is a quasi-isomorphism and the cross product is
        natural, so the retraction transports." Update the `*Needs:*` line of 5.1 and the Layer 5
        Dependencies accordingly.
     4. Remove the `flat-kunneth` entry from the `gaps` of `design/plan.json`; the acceptance is then
        conditional on `homological-low-degree` only.
   - **Tested on the refuting instance.** The README's own flat Check of 5.1: `k = ℤ`, `K = C(ℤ/2; 𝔽₂)`,
     `L = C(ℤ/2; ℤ[1/3])`. `Tor_i^ℤ = 0` for `i ≥ 2`, `L` flat in every degree, both indexed by `ℕ`:
     §4.3 applies and gives in degree 2 the terms `𝔽₂²` (tensor) and `𝔽₂` (Tor), total `𝔽₂³ =
     H₂((ℤ/2)², 𝔽₂)`. The non-example `M = N = ℤ/2`, `G = H = 1` is still excluded: neither complex is
     flat, and §4.3 then abuts to `Tor₁(ℤ/2, ℤ/2) ≠ 0 = H₁(1, ℤ/2 ⊗ ℤ/2)`.

2. **F02** (P2) 6.5 builds again the pairing of pages of a multiplicatively filtered complex

   - **Location.** `packages/CohomologyOfGroups/README.md` lines 1681–1690. "Prove that for a pairing
     `μ : M ⊗ M' ⟶ P` the pages of 6.2 carry pairings `E_r^{p,q} ⊗ E_r^{p',q'} → E_r^{p+p',q+q'}` for
     which every `d_r` is a derivation"; its `*Needs:*` is "4.1, 4.3, 6.1, 6.2; Tau Ceti
     `CochainComplex.filtrationFunctorMap`".
   - **Claim.** The page pairings, the derivation rule and the product on `E_∞` are proved here from the
     filtration alone.
   - **Witness.** SpectralSequencesAndConvergencePartII §5.2, lines 1627–1650: for decreasingly filtered
     complexes and a chain map `φ` with `φ(F^p ⊗ F^{p′}) ⊆ F^{p+p′}`, pairings on every page with
     `d_r(xy) = d_r(x)y + (−1)^{p+q} x d_r(y)`, the `E_∞` pairing induced by `H(A) ⊗ H(B) → H(C)`,
     naturality. Line 1832 names this roadmap as its consumer.
   - **Repair.** Start 6.5 with: "The pairings of the pages, the derivation rule
     `d_r(u ∪ v) = d_r u ∪ v + (−1)^{p+q} u ∪ d_r v` and the product on `E_∞`, induced by the cup product
     on `G` with `A_pH ∪ A_{p'}H ⊂ A_{p+p'}H`, are SpectralSequencesAndConvergencePartII §5.2 for the cup
     product `C̄(G, M) ⊗ C̄(G, M') → C̄(G, P)`, a chain map for the sign of 4.1, with
     `A_r ∪ A_s ⊂ A_{r+s}` (6.1)." Keep as this roadmap's target the identification on `E₂`
     (`(−1)^{pq'}` times the cup product on `Q`, HS53 Ch. II §5 Thm. 3) and the sign Check. Add
     "SpectralSequencesAndConvergencePartII §5.2" to the `*Needs:*` of 6.5, to the contract subsection
     created in R01, to the Layer 6 Dependencies and to Scope.
   - **Tested.** §5.2's hypotheses on the instance of 6.5's sign Check (`G = ℤ × ℤ ⊃ N = 0 × ℤ`,
     `M = ℤ`): the cup product satisfies `d(φ ∪ ψ) = dφ ∪ ψ + (−1)^p φ ∪ dψ`, §5.2's sign; its page
     rule has the sign `(−1)^{p+q}` of 6.5; with `d₁ = (−1)^q d` both sides of the rule on `E₁` carry
     `(−1)^{q+q'+pq'}` and `(−1)^{q+q'+pq'+p}`, so `ỹ ∪ x̃ ↦ +x·y` and `x ∪ y ↦ −x·y` are unchanged.

3. **F03** (P3) Scope misdescribes what SpectralSequencesAndConvergencePartII says of group extensions

   - **Location.** `packages/CohomologyOfGroups/README.md` lines 53–60: "it leaves the first-quadrant
     edge morphisms and low-degree sequences to DerivedModuleAlgebra §S.1 and does not treat the
     spectral sequences of group extensions."
   - **Witness.** That README, line 1351: invariants under `N` followed by invariants under `G/N`
     satisfy its 3.1; lines 1320–1325 (§3.4): `E²_{p,q} = L_pG(L_qF(A))` with
     `L₂(G∘F)(A) → L₂G(F(A)) → G(L₁F(A)) → L₁(G∘F)(A) → L₁G(F(A)) → 0`; line 1830: "the extension
     spectral sequences as Layer 3".
   - **Repair.** Replace the clause after "DerivedModuleAlgebra §S.1" by: "Its Layer 3 owns the
     composite-functor spectral sequences with their low-degree sequences (§§3.2–3.4), of which the
     Hochschild–Serre sequences are the instances for invariants, respectively coinvariants, under `N`
     followed by those under `G ⧸ N`; 6.2 and 6.3 construct them on the filtration of the cochains and
     on the explicit bicomplex, where the edge maps, products and transgression are computed, and do
     not compare them with §3.2's and §3.4's." With R01 and R02 the bullet then names Layers 2–5.

4. **F04** (P3) 3.3 cites a cohomological proposition for a homological statement

   - **Location.** `packages/CohomologyOfGroups/README.md` lines 985–986: "This is the algebraic form of
     the Cartan–Leray spectral sequence (HS53 Ch. I §5 Prop. 5, p. 116)."
   - **Witness.** HS53 line 283–288: Prop. 5 is stated for a cochain complex `U` with
     `Hⁱ(Π, U_j) = 0` for `i > 0`, in cohomology only. The transcription to homology is the remark at
     HS53 line 355–362 (p. 118), which 6.3 already cites.
   - **Repair.** "(HS53 Ch. I §5 Prop. 5, p. 116, in cohomology; the homological transcription is the
     remark of Ch. I §7, p. 118, HS53 line 355–362)". Add "Ch. I §7 remark on homology (p. 118)" to the
     `locator` of `HS53` in `sources.toml`.

5. **F05** (P3) the manifest records a citation the README does not make

   - **Location.** `packages/CohomologyOfGroups/sources.toml`, entry `MilneCFT`, `cited_for`:
     `"Target 4.7"`.
   - **Witness.** `MilneCFT` occurs in the README in Conventions, 4.1, 4.2 (twice), 4.3, 4.5, 7.2, 8.4
     (twice) and References: 4.7 (lines 1294–1323) has no citation of it.
   - **Repair.** Remove `"Target 4.7"` from that `cited_for`. The other seven entries agree with the
     README section by section (counted below).

Five findings: two blocking (P2), three P3. The mathematics of the package survived the adversarial
pass without a false statement; `Suggested.lean` elaborates with `sorry` as the only warning, has no
padding and no library duplicate. All five findings are about one supplier,
SpectralSequencesAndConvergencePartII, whose Layers 3–5 the package does not take into account, and
about two locator and manifest slips.

SpectralSequencesAndConvergencePartII is at line 63 of the merge order (this roadmap is at line
318). It is neither on main nor an open roadmap pull request: it is an accepted board package. I read
it as `packages/SpectralSequencesAndConvergencePartII/README.md` at board head `9566021` (the head its
accepted package review names) and as `packages/SpectralSequencesAndConvergencePartII/design/README.md`
in this checkout; the passages cited below are in both. Line numbers are those of the package README
at `9566021`.

## Adversarial table

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `c_g`, `conjRes` | `S₃`, `H = ⟨(12)⟩`, `g = (13), (123), (132)`; wrong model `m ↦ g⁻¹m` | `gHg⁻¹ = ⟨(23)⟩` for both `(13)`, `(123)`; `g⁻¹Hg = ⟨(13)⟩` for `(123)`; `(132)⁻¹(23)(132) = (13) ∉ A`; `g²xg = (23)` fixes 1, `xg⁻¹` sends `1 ↦ 2` | pair `(b ↦ g⁻¹β(b)g, m ↦ g·m)` equivariant: `g·(g⁻¹βg)m = β·gm`; inverse model excluded | none |
| 1.2 quotient action | `ℤ/4 ⊃ 2ℤ/4`, `M = ℤ` with sign; `S₃ ⊃ A₃`, `𝔽₃` | `N` acts by `(−1)² = 1`, `Q` by `−1` on `M^N`; `−1` on `H¹(A₃, 𝔽₃)`, invariants `0 = Hom(S₃, 𝔽₃)` | agrees | none |
| 1.4 Shapiro, orbits | `ℤ/2` on `G ⊔ pt` | `H₀ = ℤ²`, `H₁ = 0 ⊕ ℤ/2`; sum over points gives `ℤ³` | agrees | none |
| 2.1 hyperhomology | `S₃`, `C = (ℤ[S₃/A₃] → ℤ)` and with `S₃/⟨(12)⟩` | `E¹`: `d¹` iso on `q = 0`, `ℤ/3 → ℤ/2` zero on `q = 1`: `H₀ = 0`, `H₁ = ℤ/2`, `H₂ = ℤ/3 = H₁(S₃, ℤ_sgn)`; second case `H₀ = H₁ = 0`, `H₁(C) = ℤ²` | both sequences of 2.3 agree | none |
| 3.1 flat versus projective | `k = ℤ/4`, `ℤ/2 → ℤ/4 → ℤ/2` tensored with `ℤ/2`; `F →u F → ℤ[1/2]` dualised | `ℤ/2 →0 ℤ/2 →id ℤ/2`: `H₂ = ℤ/2`; `a₀ = Σ 4ʲ = −1/3 ∈ ℤ₂ ∖ ℤ`: cokernel nonzero | hypotheses needed, as stated | none |
| 3.3 free complexes | `ℝ/2ℤ → ℝ/ℤ`, `M = ℤ_sgn` and `ℤ`; `C = ℤ` trivial | `1 ⊗ m ↦ t⁻¹m − m = −2m`: `H₀ = ℤ/2`, `H₁ = 0`; trivial `M`: `ℤ, ℤ`; `H₁(C_G) = 0 ≠ G^ab` | agrees; source is cohomological | R04 |
| 3.5 tree sequence | `ℤ` on the line; sum instead of difference | edge map `c_{t⁻¹} − 1 = t⁻¹ − 1`: `H₁ = M^ℤ`, `H₀ = M_ℤ`; sum gives `H₀(ℤ, ℤ) = ℤ/2` | signs as SerreArbres Remarque 1 (`t` plus, `o` minus) | none |
| 3.6 amalgams, HNN, free | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `BS(1, 2)`; `F₂` with both generators `−1`; `ℤ/2 ∗ ℤ/2` | cokernel of `1 ↦ (−2, 3)` is `ℤ/4 ⊕ ℤ/3 = ℤ/12`; `1 − 2 = −1` iso and `1 − 1 = 0`: `H₁ = ℤ` (sum: `ℤ/3`); `ker(−2, −2) ≅ ℤ` versus `0 ⊕ 0`, defect `ker(ℤ → (ℤ/2)²) = 2ℤ`; `(ℤ/2)²` odd, `0` even | agrees; degree-one direct sum correctly restricted | none |
| `freeGroup_isZero_of_two_le` | `S = ∅`, one letter, `k = 0` | trivial group: `0`; `ℤ`: `H₂ = 0`, `H₁ = M^ℤ`; zero ring: all `0` | true | none |
| `coprod_groupHomology_bijective` | `A = B = 1`; `ℤ/2 ∗ ℤ/2`; `n = 1` twisted | `0 → 0`; `(ℤ/2)² → (ℤ/2)²` for odd `n ≥ 3`; fails at `n = 1` (`0 ⊕ 0` versus `ℤ`) | `n ≥ 2` needed and present | none |
| 4.1, 4.3 cup product | `ℤ²` projections; model without the action on `ℤ[ℤ]` | `(x ∪ y)(e₁, e₂) = 1`, `(e₂, e₁) ↦ 0`, pairing `+1`; coboundary `t − 2 + (1 + t) − 1 = 2(t − 1)` | sign is MilneCFT Prop. 1.38 and Tau Ceti's `cup_δ_of_flat` (`p.negOnePow`) | none |
| 4.2 uniqueness | family `(−1)^{pq} x ∪ y` | `x ∪′ δy = δ(x ∪′ y)`, `δx ∪′ y = (−1)^q δ(x ∪′ y)` | excluded by the left rule | none |
| 4.6 cap, evaluation | `ℤ²`, `z = [e₁|e₂] − [e₂|e₁]`; degree 0 finite index | back face: `y ∩ z = [e₁]`, `⟨x, y ∩ z⟩ = 1 = ⟨x ∪ y, z⟩`; front face `−[e₁]`; both sides `Σ_{gH} [μ(gx ⊗ n)]` | adjunction without sign consistent | none |
| 5.1 Künneth | `(ℤ/2)²` over `ℤ`, degrees 2, 3; `𝔽₂` and `ℤ[1/3]`; `G = H = 1`, `ℤ/2` | `ℤ/2`; `1 + 1 + 1 = (ℤ/2)³`; `𝔽₂² + 𝔽₂ = 𝔽₂³`; `0` versus `Tor = ℤ/2` | true with one flat factor | R01 (supplier) |
| 5.3 cross product | `ℤ × ℤ`, `ℚ`; `ℤ^{(ℕ)}` | `(x × y)(e₁, e₂) − (x × y)(e₂, e₁) = 1 − 0`; `(V ⊗ V)^* ⊋ V^* ⊗ V^*` | no Koszul sign; finiteness needed | none |
| `nonempty_groupHomology_two_addEquiv_exteriorPower` | `1`, `ℤ/n`, `(ℤ/2)²`, `ℤ²`, `ℚ` | `0 = 0`; `Λ²(ℤ/n) = 0 = H₂`; `ℤ/2 = ℤ/2`; `ℤ = ℤ`; `Λ²ℚ = 0 = H₂(ℚ)` | true; degree 3 fails (`Λ³(ℤ/2) = 0 ≠ ℤ/2`) and is not claimed | none |
| 6.1 filtration | `ℤ/4 ⊃ 2ℤ/4`, `n = 1`; `N = G`; `N = 1` | `A₁`: `f(2) = 0`; `A*₁`: also `f(1) = f(3)`; `A₁ = 0`; `A_j ∩ C̄ʲ ≠ 0` for all `j` | "some `F_t = 0` iff `N = G` or `M = 0`" holds | none |
| 6.2 indexing and convergence | classical `(p, q)` | Tau Ceti position `(2p + q + 1, −p − 1)`: total `p + q`, `s = −q′ − 1 = p`, `t = p′ + 2q′ + 1 = q`; vanishing from `r ≥ q + 3` and `r ≥ p + 2` | bound `max(q + 3, p + 2)` correct | none |
| 6.2 on `S₃` | `𝔽₃` | action `(−1)^{⌈q/2⌉}`: invariants for `q ≡ 0, 3 mod 4` | matches `H*(S₃, 𝔽₃)` | none |
| 6.5 products | `ℤ × ℤ ⊃ 0 × ℤ` | `ỹ ∪ x̃ ∈ A*₁` restricts to `(σ, γ) ↦ y(σ)x(γ)`: `+x·y`, sign `(−1)^{0·0}`; `x ∪ y ↦ −x·y`, sign `(−1)^{1·1}` | HS53 Thm. 3 sign `(−1)^{pq′}` consistent with `d₁ = (−1)^q d` | R02 (supplier) |
| 6.6 transgression | `ℤ/3 ⊂ ℤ/9`; `ℤ/9 ⊂ ℤ/27` over `𝔽₃`; `Q₈ ⊃ ⟨i⟩` | `df(2, 1) = 0 − 1 + 0 = −1 = −carry`; `A_k = 𝔽₃`; factor set `j² = 2 ∈ ℤ/4`, `2 ⊗ 1 = 0`, `d₂ = 0`, `2 = 1 + 1` | `d₂ = −c_k ∪` as HS53 Thm. 4 | none |
| 6.7 low degree | `ℤ/2 ⊂ ℤ/4`, `ℤ` and `𝔽₂` | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; inflation on `H²(−, 𝔽₂)` zero; homology `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` | hypothesis needed | none |
| 6.8 and `nonempty_groupHomology_two_addEquiv_hopf` | `ℤ/n`, `ℤ²`, `F = R`, `R = 1`, `A₅` | `R ∩ [F, F] = 0`; `[ba] − [ab] ↦ ba(ab)⁻¹ = ⁅a, b⁆⁻¹`; `[F, F]/[F, F] = 0`; `0`; `ℤ/2` | true; `K₁ → R/[F, R]` kills `d(K₂)`: `r₁r₂(r₁x′r₂x′⁻¹)⁻¹ ∈ [F, R]` | none |
| 6.9 comparison | `ℤ/3 ⊂ ℤ/9`; `N = G` | `−[carry]` on both sides; target `H²(1, −) = 0` | agrees | none |
| `doubleCosetTerm`, `res_comp_corestriction_eq_finsum` | `K = G`; `H = G`; `K = 1`, `n = 0`; `H = K = ⟨(12)⟩ ≤ S₃` | one coset, `cor ∘ c_g = cor`; one coset, `res`; `Σ_{gH} g·m`; `id + (through Hⁿ(1) = 0)` | true; `H.comap (conj g⁻¹) = gHg⁻¹`; `Quotient K H` is `K\G/H`; finite as a quotient of `G/H` | none |
| `IsStableClass`, `bijOn_res_sylow_isStableClass` | `G = P`; `S₃`, `p = 3`; `n = 0`, `M = ℤ`; `C₂ × S₃` with `𝔽₂³`; `p` invertible in `k` | all classes stable; `H²(3) = 0`, `H⁴(3) = ℤ/3`; `0` versus `ℤ`; stable dimension `2 = dim H¹(G, M)` of `3`; both sides `0` | true for `n ≠ 0`; fails at `n = 0`, excluded | none |
| `tate_duality` | `ℤ/2`, `M = ℤ`, `i = 0, 1`; `M = ℤ/2`; `G = 1` | `0 = 0`; `ℤ/2 = ℤ/2`; integral form `0 ≠ ℤ/2` without freeness; all groups `0` | second-variable perfection true for every `M`; first variable only injective, not claimed | none |
| `cup_characterConnectingClass_bijective` | `G = 1`; `ℤ/m` | `orderOf 1 = 1`, `χ = 0`, groups `0`; `Ĥ⁰ = ℤ/m → Ĥ² = ℤ/m` by `δχ` | true; order `x ∪ δχ` as MilneCFT Remark 3.5 | none |
| 8.2 | `p = 21`, `ℤ/7 ⋊ ℤ/3` | `1 + 6 + 14` elements, `g²¹ = 1`; `(1, 0)(0, 1) = (1, 1) ≠ (2, 1)` | primality needed, stated | none |
| 8.3 | `ℤ/m`; `ℤ/2` with `n = 0`; truncation | period divides 2; `ℤ_sgn = ker ε`; `F_n/B_n` is an extension of `B_{n−1}` by `ℤ_χ`, free over `ℤ` | true; `C_i ⊗ M` induced, hence cohomologically trivial | none |
| 8.4 period | `S₃`; `Q_{2^s}`; `p ∤ |G|` | `3`-period 4, `2`-period 2; `Ĥ² = (ℤ/2)²`, `Ĥ⁴ = ℤ/2^s`: 4; least `d = 1` | definition consistent with Swan's values for `p ∣ |G|` | none |
| `tfae_periodic_cohomology` | `G = 1`; `S₃`; `A₄`; `SL₂(𝔽₉)`; `QuaternionGroup 1, 0` | all four hold (`d = 1`, `u = 0`, card `1`); `d = 4`; fails (c) by `V₄`; `|G| = 720`, `(ℤ/3)²`; `m ≥ 1` gives order `≥ 8`, order `4·2^m` never an odd prime power | true | none |

## Verified sound

- **Elaboration.** `lake env lean` on `packages/CohomologyOfGroups/Suggested.lean` from the content
  repository: nine warnings, each `declaration uses 'sorry'` (lines 83, 91, 106, 115, 144, 168, 182,
  199, 213), no error. No `set_option`, no sorried data, `theorem` only, `import Mathlib` followed by
  three `TauCeti.*` modules that are all used. The three definitions have real bodies.
- **Signatures.** The 12 elaborated types of the worker's `#check @name` listing were compared with
  the README statements one by one: no binder lost, generality equal (`k G : Type u` in Layers 1–7,
  `G : Type` over `ℤ` in 5.4, 6.8 and Layer 8, `Fintype G` in Layer 8, `n ≠ 0` in 7.2, `2 ≤ n` in 3.6).
- **Padding probe, all nine theorems.** Each `sorry` replaced by
  `first | rfl | simp | infer_instance | constructor <;> simp` on a scratch copy: all nine remain
  open. No theorem restates a definition, mirrors a Check or treats a boundary case.
- **Headline theorems.** From the Summary: Hochschild–Serre (6.2–6.7), tree sequence (3.5), Künneth
  (5.1), double coset formula (7.1), stable elements (7.2), Tate duality (8.1), periodicity (8.5).
  Stated: 7.1, 7.2, 8.1, 8.5, and 3.6, 5.4, 6.8, 8.4. Named in the module docstring as not statable,
  each with the missing carrier: 6.2–6.5 (the `Q`-representation on `H^q(N, M)`, absent at the pin:
  only `Rep.quotientToInvariantsFunctor` in degree 0), 6.6–6.7, 3.5–3.6 sequences, 5.1–5.3, 8.3.
- **Pinned declarations.** 83 Tau Ceti and 36 Mathlib names of the README were looked up at the pins
  (definition line found for each); among them `TauCeti.groupCohomology.corestriction`
  (`GroupCohomology/Corestriction.lean:136`), `TauCeti.TateCohomology.cup` (`Cup/Product.lean:131`),
  `cup_δ_of_flat` (`Cup/Delta.lean:242`, sign `p.negOnePow`), `characterConnectingClass`
  (`TateCohomology/Character.lean`), `MonoidHom.groupHomologyIso_hom_naturality`
  (`GroupHomology/ChangeOfGroups.lean:217`), `groupHomology.inhomogeneousChains.d_single`
  (`GroupHomology/Basic.lean:132`, matching the README's formula), the `TODO` of
  `ContCohomology/Basic.lean:38`. None missing.
- **Duplication at the pins.** No free-group or free-product (co)homology, Hopf formula, exterior
  square of `H₂`, discrete double coset formula, stable classes, Tate duality or all-degree cyclic
  cup periodicity in the pinned Mathlib or Tau Ceti (`Cup/Cyclic.lean` has degree 0 only, as the
  README says).
- **Sources, the seeded sample and every HS53, Loh19, MilneCFT, SerreArbres and Hutchinson13
  locator of the README.** 1.1 and 1.2: HS53 line 154–160 and 345–354, Loh19 Prop. 3.2.13 (p. 124).
  1.4, 3.5, 3.6: SerreArbres II §2.8, printed pp. 168–169, Prop. 13, Remarque 1, the amalgam
  example. 2.1: HS53 Ch. I §4 (p. 114), Prop. 1 (p. 111). 3.3: HS53 Prop. 5 (p. 116), Loh19
  Prop. 1.6.11 (p. 48). 4.3: MilneCFT Prop. 1.39 (pp. 73–74). 5.1: Loh19 Thm. 3.2.22, Cor. 3.2.23,
  Example 3.2.25 (pp. 135–137). 6.2: HS53 Ch. II Thm. 1 (p. 121), Thm. 2 and Prop. 3 (p. 125),
  Ch. I Prop. 7 (p. 117), Loh19 Thm. 3.2.12 and Remark 3.2.14. 6.5: HS53 line 686–700 and 397–400.
  6.9: HS53 line 854–856 (p. 130). 7.2: MilneCFT Prop. 1.30 (p. 70), Cor. 1.33 (p. 71),
  Hutchinson13 line 482–491. 8.3: Loh19 Thm. 4.3.7 (p. 165) and proof (to p. 167). Also 6.6 (HS53
  line 984–990, `d₂ = −c ∪ u`), 6.7 (line 825–830), 8.2 (Loh19 line 2399–2419), 8.4 (MilneCFT line
  3793–3822; Hutchinson13 line 494–504, Cor. 3.3). Page offsets of the manifest's `version_note`s
  confirmed. One slip: R04.
- **Manifest.** Eight works, all cited, all eight in the README's References; `cited_for` compared
  with the README section by section (HS53 18 sections, Loh19 16, Brown82 14, MilneCFT 8, SerreArbres
  4, Hutchinson13 3, CE56 3, SwanPPeriod60 1): one surplus entry, R05.
- **Supplier-order audit.**

      depcheck: 243 roadmaps, 2202 edges, 0 problem(s)

  Every cited section was opened: DerivedModuleAlgebra §S.1 and §0.2, ProfiniteCohomology §§3.1,
  3.2, 5.5, 6.4, 10.1, 10.5 and Layers 8, 12, ClassFieldTheory Layer 0, FreeGroupsAndLimitGroups
  §§2.2, 4.1–4.2, 4.5–4.8, AlgebraicTopology §§5.3–5.4, StableHomotopyKTheory §3.29 (on main);
  SchemeKTheoryOperations §6.7, K3BlochGroups §§4.1, 5.2, ArithmeticGaloisDuality §D7.2 and Layer
  R02.2, InductionRestrictionPartII RS.0.1, RS.0.3, RS.6.8, K2SymbolsBrauer §1.1,
  MappingClassGroupsAndCanonicalRepresentations §1.1, IntegralIwasawaTheoryPartII §0.7,
  ModularCurvesPartII §15.4 (open heads). Each says what the contract assumes of it. The one lead of
  the citations tool (SpectralSequencesAndConvergencePartII, Layer 2) resolves at the board package;
  its Layer 2 is as described.
- **`gap:homological-low-degree`.** Precise, minimal and declared with the same slug in the plan:
  DerivedModuleAlgebra §S.1's homological form stops at `E²`, convergence and stabilisation;
  SpectralSequencesAndConvergence §3.6 states edge morphisms and the five-term sequence in
  cohomological indexing only. Not a finding.
- **Shape.** Eight layers, each ending with Examples and Dependencies; 41 numbered targets, each with
  at least three Checks (3 to 5); no LaTeX delimiters, no process words, no pull-request numbers, no
  machine paths, no target tables. The layers are the roadmap's own: no layer carries a source's
  chapter name.
- **Ownership.** Hopf's formula for a general group: no other owner (InductionRestrictionPartII and
  K2SymbolsBrauer say they do not assume it; StableHomotopyKTheory §3.29 is the perfect case). 8.2:
  GlaubermanZStar attributes the 2-rank-one classification to LocalFiniteGroupTheory, which this
  brief forbids citing and whose files are nowhere readable; 8.2 stating it is right.
  HomologicalStabilityOfGeneralLinearGroups uses a Künneth sequence of a product of groups in a
  route without owning it: a consumer of 5.1.
- **Overlaps file.** No open pull request changes this roadmap, drops an id it cites or defines one
  only in a revision; no second copy on main.

Overlap check: read ProfiniteCohomology, FiniteGroupExtensionSplitting, DerivedModuleAlgebra (main), K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, InductionRestrictionPartII, ProfiniteCohomologyPartII (open); no object shared beyond those the Scope already assigns (continuous cohomology: ProfiniteCohomology; first-quadrant double complexes: DerivedModuleAlgebra; finite-group instances: K3BlochGroups, ArithmeticGaloisDuality, InductionRestrictionPartII). Outside the three lists: the Künneth sequence of complexes and the pairings of filtered complexes are owned by SpectralSequencesAndConvergencePartII (R01, R02).

Source independence: 16 passages compared with 5 sources (HS53, Loh19, MilneCFT, SerreArbres, Hutchinson13), none shared beyond formulas and statements of a dozen words; largest share HS53, 36 of 109 locators; contents compared with HS53: independent (its three chapters are general methods, the direct method and applications; only 6.1, 6.2, 6.5, 6.6, 6.7 meet Ch. II §§1–5 and Ch. III §§3–4, in an order their `*Needs:*` lines force, and they are interleaved with 6.3, 6.4, 6.8, 6.9). Brown82 and CE56 could not be read.

## Not verifiable

- **Brown82** (uncertified, 14 citations, chapter and section locators): 1.3, 3.1, 3.2, 3.6, 4.4, 4.6,
  5.1, 5.4, 7.1, 7.2, 8.1, 8.2, 8.3, 8.5. The text is not available legally to this worker. The
  statements were checked mathematically instead (table above); 8.1, 8.3 and 8.5 rest on Brown82 and
  CE56 alone for their full generality. The locators of 1.3 (Ch. III), 4.4–5.4 (Ch. V) and 3.1–3.2
  (Ch. VII) are whole chapters.
- **CE56** (uncertified): 2.2, 8.1, 8.5, by chapter.
- **SwanPPeriod60** (waived): Theorems 1 and 2, read only through Hutchinson13 Thm. 3.1.
- **LocalFiniteGroupTheory**: no file readable; ownership of 8.2 against it was not checked.

## Source issues

- **Misprint** in Hutchinson13 at the proof of Corollary 3.3, p. 12 (Hutchinson13 line 518): the source says the third homology groups occur for degrees congruent to 3 modulo 3; it should be modulo 4, as in the statement of the corollary; affects nothing.
- **Gap** in MilneCFT at Ch. II Remark 3.5, p. 81 (MilneCFT line 3813–3822): the source says the periodicity isomorphism is cup product with the class of the chosen character and defers the proof; it should be proved, as the roadmap's 8.4 does; affects a stated result.

## For the human reviewers

- **Not tested.** Brown82 has 15 of the 109 source citations and is the only source for several targets; its text and table of contents were not read, so wording and arrangement were not compared with it (`sources.toml`, `Brown82`).
- **Licence.** `Loh19` is recorded as `author-page` (lecture notes on the author's university page, no stated licence); it is cited by locator only and no passage is reused (`sources.toml`, `Loh19`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf9d800354353ff1d83bfaddcb535d96f46cb5eb", "job": "REV-PKG-CohomologyOfGroups", "model": "fable", "worker": "chris-x26"} -->
