<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6874558772 -->
Review (claude) of 7bfdf06

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the pinned vanishing of the homology of free groups is not cited

   - **Location.** `packages/CohomologyOfGroups/README.md` 3.6, lines 1138–1142 ("For a set `S`,
     `F = FreeGroup S` and every `M : Rep k F`, `Hₙ(F, M) = 0` … for `n ≥ 2`"); 6.8, lines 1909–1910
     ("since `H₂(F, ℤ) = 0` (3.6)") and its `*Needs:*` (line 1913); Exact supplier contracts.
   - **Claim.** The vanishing is this roadmap's throughout, and 6.8 waits for 3.6.
   - **Witness.** Pinned Tau Ceti, `TauCeti/AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean:259`:
     `theorem isZero_groupHomology_freeGroup (k : Type) [CommRing k] {n : ℕ} (hn : 2 ≤ n) : IsZero
     (groupHomology (Rep.trivial k (FreeGroup S) k) n)`, with `S : Type` (line 111), in namespace
     `TauCeti`.
   - **Repair.**
     1. Exact supplier contracts, From Tau Ceti, add: "`TauCeti.isZero_groupHomology_freeGroup`
        (`AlgebraicTopology/ClassifyingSpace/WedgeCircles.lean`): for `S : Type`, a commutative ring
        `k : Type` and `n ≥ 2`, `Hₙ(FreeGroup S, k) = 0` with trivial coefficients, through the wedge of
        circles. It is the trivial-coefficient homological case of 3.6 for `S, k : Type`. Used in 6.8."
     2. 3.6, after "(`freeGroup_isZero_of_two_le`)": "For `S, k : Type` and trivial coefficients `k`
        the homological vanishing is Tau Ceti's `TauCeti.isZero_groupHomology_freeGroup`; the target
        adds every coefficient representation, cohomology and the universe `u`."
     3. 6.8: replace "since `H₂(F, ℤ) = 0` (3.6)" by "since `H₂(F, ℤ) = 0` (Tau Ceti
        `TauCeti.isZero_groupHomology_freeGroup` with `k = ℤ`)"; in its `*Needs:*` replace "3.6" by
        "Tau Ceti `TauCeti.isZero_groupHomology_freeGroup`"; in the Layer 6 Dependencies replace
        "Layers 1–4 and 3.6" by "Layers 1–4; Tau Ceti's vanishing of the homology of free groups with
        trivial coefficients, for 6.8"; in How to read the build delete ", using the free groups of
        Layer 3".
   - **Tested.** 6.8 needs `IsZero (groupHomology (Rep.trivial ℤ (FreeGroup S) ℤ) 2)` for `S : Type`;
     the pinned statement at `k := ℤ`, `n := 2`, `hn : 2 ≤ 2` has exactly this type. `Suggested.lean`
     is unchanged: `freeGroup_isZero_of_two_le` is for every `M : Rep k (FreeGroup S)` in universe `u`
     and for cohomology, which the pin does not state (the one-tactic probe leaves it open).

2. **F02** (P3) the Alexander–Whitney and shuffle maps exist at the pin and are built again

   - **Location.** `packages/CohomologyOfGroups/README.md` 4.4, lines 1243–1244 ("Prove that the
     Alexander–Whitney map `(g₀, …, gₙ) ↦ Σ_{p+q=n} (g₀, …, g_p) ⊗ (g_p, …, gₙ)` is one on
     `Rep.standardResolution`"); 5.1, lines 1400–1402 ("the map induced by the Eilenberg–Zilber shuffle
     map of the standard resolutions"); their `*Needs:*` lines; Exact supplier contracts.
   - **Claim.** Neither map is at the pins; 4.4 and 5.1 construct them.
   - **Witness.** Pinned Tau Ceti: `CategoryTheory.SimplicialObject.alexanderWhitney`
     (`AlgebraicTopology/SimplicialObject/AlexanderWhitney.lean:172`, coassociative at line 313);
     `SSet.shuffle` (`AlgebraicTopology/SimplicialSet/Shuffle.lean:689`);
     `SSet.eilenbergZilberHomotopyEquiv` (`…/SimplicialSet/EilenbergZilber.lean:761`). Mathlib
     `Rep.standardComplex` is an alternating face map complex (`…/Homological/Resolution.lean:168`).
   - **Repair.**
     1. Exact supplier contracts, From Tau Ceti, add: "`CategoryTheory.SimplicialObject.alexanderWhitney`
        with `CategoryTheory.SimplicialObject.alexanderWhitney_coassoc`
        (`AlgebraicTopology/SimplicialObject/AlexanderWhitney.lean`): for simplicial objects `A`, `B`
        of a preadditive monoidal category with finite coproducts, the chain map from the alternating
        face map complex of the degreewise tensor product to the tensor product of those of `A` and
        `B`, in degree `n` the sum over `p + q = n` of the front `p`-face tensored with the back
        `q`-face; it is coassociative. The complex of `Rep.standardResolution` is the alternating face
        map complex of a simplicial object of `Rep k G` (Mathlib `Rep.standardComplex`). Used in 4.4.
        `SSet.alexanderWhitney`, `SSet.shuffle`, `SSet.eilenbergZilberHomotopyEquiv`
        (`AlgebraicTopology/SimplicialSet/AlexanderWhitney.lean`, `…/Shuffle.lean`,
        `…/EilenbergZilber.lean`): for simplicial sets `K`, `L` and coefficient objects `R`, `S`, the
        shuffle map `C(K; R) ⊗ C(L; S) → C(K × L; R ⊗ S)` and the Alexander–Whitney map are inverse
        chain homotopy equivalences, by homotopies natural in `K` and `L`. Used in 5.1; equivariance
        for a group acting on `K` and `L` is not stated there and is read off that naturality."
     2. 4.4: replace "Prove that the Alexander–Whitney map … is one on `Rep.standardResolution`" by
        "The Alexander–Whitney map `(g₀, …, gₙ) ↦ Σ_{p+q=n} (g₀, …, g_p) ⊗ (g_p, …, gₙ)` is Tau Ceti's
        `CategoryTheory.SimplicialObject.alexanderWhitney` for the simplicial object underlying
        `Rep.standardResolution`, composed with the diagonal `x ↦ x ⊗ x` of that simplicial object;
        prove that it lifts `k ≅ k ⊗ k`, so that it is a diagonal approximation"; add the two names to
        its `*Needs:*`.
     3. 5.1: after "Eilenberg–Zilber shuffle map of the standard resolutions" insert "(Tau Ceti
        `SSet.shuffle` for the simplicial sets with `n`-simplices `G^{n+1}` and `H^{n+1}`, a homotopy
        inverse of the Alexander–Whitney map by `SSet.eilenbergZilberHomotopyEquiv`, equivariant for
        `G × H` because both maps and both homotopies are natural in the simplicial sets)"; add the
        three names to its `*Needs:*` and "Tau Ceti's Alexander–Whitney and Eilenberg–Zilber maps" to
        the Dependencies of Layers 4 and 5.
   - **Tested.** The repair changes citations and one route sentence; no statement moves. 5.1's witness
     `[g] × [h] = [(g, 1)|(1, h)] − [(1, h)|(g, 1)]` stays the normalisation of the cross product: I did
     not compare the sign convention of `SSet.shuffle` with it, and the fix worker states that
     comparison in 5.1 (the two `(1, 1)`-shuffles, signs `+` and `−`) from `SSet.shuffleChain`
     (`…/Shuffle.lean:436`). The values computed with the witness (rows 5.1 and 5.3 below) do not depend
     on which declaration supplies the map.

3. **F03** (P3) three pinned declarations the layers consume are absent from the contracts

   - **Location.** `packages/CohomologyOfGroups/README.md` 5.4, lines 1552–1558 ("whose surjective half
     is Tau Ceti's `groupHomology.exists_map_subtype_eq`. … `TauCeti.groupHomology.isZero_groupHomology_of_directed`
     (`…/GroupHomology/DirectedUnion.lean`)"); 1.1, line 689 (`Rep.ofHom`).
   - **Claim.** Exact supplier contracts names every declaration consumed.
   - **Witness.** Neither `exists_map_subtype_eq` nor `isZero_groupHomology_of_directed` occurs between
     the headings "Exact supplier contracts" and "How to read the build" (lines 235–637); both exist at
     the pin, `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:113` and `:132`.
   - **Repair.** From Tau Ceti, add: "`groupHomology.exists_map_subtype_eq` (root namespace) and
     `TauCeti.groupHomology.isZero_groupHomology_of_directed`
     (`RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean`): for a directed family of
     subgroups `S i` with union `G` and `A : Rep k G`, every class of `Hₙ(G, A)` is the image of a
     class of some `Hₙ(S i, A)`, and `Hₙ(G, A) = 0` when every `Hₙ(S i, A) = 0`. Used in 5.4." From
     Mathlib, add `Rep.ofHom` to the line that lists `Rep.res` and `Rep.ofMulAction`.
   - **Tested.** With the bullet, every backticked library name after line 637 occurs in the contracts
     (the mechanical comparison that produced the witness lists exactly these three names and no other).

Three findings, all P3, none blocking. The five repairs of round 1 hold. No statement of the package
was found false; `Suggested.lean` elaborates with `sorry` as its only warning and has no padding.
The three findings are of one kind: declarations of the pinned Tau Ceti that the README builds on,
or builds again, without citing them. The earlier round's sentence "no free-group … (co)homology in
the pinned Mathlib or Tau Ceti" is refuted by R01's witness.

## Round 1 findings, one by one

- **F01 (P2), `gap:flat-kunneth` addressed to the wrong supplier — repaired** (differently from the
  proposal, and soundly). Contract, `packages/CohomologyOfGroups/README.md` lines 476–483: "What
  SpectralSequencesAndConvergencePartII must provide (gap:flat-kunneth): in §4.3 … that the
  two-column exact sequence above, whose first map is the edge map (the cross product), is natural in
  `K` and `L`." 5.1 (lines 1410–1427) takes the sequence from §4.3 and proves the splitting itself.
  Checked at that roadmap's open head: §4.3 states the spectral sequence "natural in `K` and `L` from
  page `2`", the edge map, the flat abutment and the two-column sequence, and does not state the
  naturality of that sequence. The gap is precise (one clause, with `Tor_i = 0` for `i ≥ 2` and
  bounded-above representatives), minimal (the split, non-natural part is proved in 5.1 from pinned
  declarations) and declared with the same slug, supplier and section in `design/plan.json`.
- **F02 (P2), 6.5 rebuilt the page pairings — repaired.** Lines 1757–1762: "So
  SpectralSequencesAndConvergencePartII §5.2 gives the pairings of the pages of 6.2 … for which every
  `d_r` is a derivation … and, the filtration being finite in each degree (6.1), the product on
  `E_∞`". §5.2 at the open head has the same sign `(−1)^{p+q}` and the limit-page clause under
  SpectralSequencesAndConvergence §5.3, whose hypotheses 6.1's filtration meets (row below).
- **F03 (P3), Scope on group extensions — repaired.** Lines 59–64: "Its Layer 3 owns the
  composite-functor spectral sequences with their low-degree sequences (§§3.2–3.4), of which the
  Hochschild–Serre spectral sequences are instances".
- **F04 (P3), cohomological locator for a homological statement — repaired**, and the pattern too:
  3.3 (lines 1038–1039), 2.1 (851–853), 2.3 (912–914), 3.2 (1014–1015), 6.3 (1709–1710) all say "in
  cohomology" and cite the closing remark of HS53 Ch. I §7, p. 118 (HS53 line 355–362, read). No
  further instance: 6.4's homological clause cites no cohomological source, 7.2's homological clause
  cites Hutchinson13 line 482–491, which is homological.
- **F05 (P3), surplus `cited_for` — repaired.** `MilneCFT` no longer lists Target 4.7. Recomputed
  for all eight works: every target that cites a work is in its `cited_for` and conversely (0
  differences in either direction).

## Adversarial table

Rows for the passages the repairs changed, the sampled targets, the headline theorems and the
targets the findings touch. Values were recomputed in this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.3 contract, index translation (5.1) | `K = L = C(ℤ/2; ℤ)` over `ℤ`, `m = 3` | tensor over `p + q = 3`: `ℤ/2 ⊕ 0 ⊕ 0 ⊕ ℤ/2`; Tor over `p + q = 2`: `Tor₁(H₁, H₁) = ℤ/2`; total `(ℤ/2)³ = H₃((ℤ/2)², ℤ)`; Tor over `p + q = 3` instead: `0`, total `(ℤ/2)²` | `i + j = n + 1 ↔ p + q = m − 1` correct | none |
| 5.1 flat factor | `M = 𝔽₂`, `N = ℤ[1/3]`, `G = H = ℤ/2`, degree 2 | `H_*(ℤ/2, N) = N, ℤ/2, 0, …`; tensor `0 + 𝔽₂ + 𝔽₂`; Tor `Tor₁(𝔽₂, ℤ/2) + Tor₁(𝔽₂, ℤ[1/3]) = 𝔽₂ + 0`; `𝔽₂³ = H₂((ℤ/2)², 𝔽₂)` | agrees | none |
| 5.1 no flat factor | `G = H = 1`, `M = N = ℤ/2` | `H₁(ℤ/2 ⊗ ℤ/2) = 0`, Tor term `ℤ/2` | sequence fails; hypothesis needed and present | none |
| 5.1 splitting route | `G = H = 1`, `M = ℤ[1/3]` (flat), `N = 𝔽₂`; `K′ = (F →u F)`, `L′ = (ℤ →2 ℤ)` | `K′ ⊗ L′ → K ⊗ L′ → K ⊗ L`: each step tensors a quasi-isomorphism with a bounded-above flat complex (`L′`, then `K`); `H₀ = 𝔽₂`, `H₁ = Tor₁(ℤ[1/3], 𝔽₂) = 0` on both ends | quasi-isomorphism; retraction transports along the natural cross product | none |
| `gap:flat-kunneth` | `R = ℤ`, `L = ℤ/2[0]`, `(ℤ →4 ℤ) → (ℤ →2 ℤ)`, `f₀ = 1`, `f₁ = 2` | `m = 1`: `Tor₁(ℤ/4, ℤ/2) = {0, 2} → Tor₁(ℤ/2, ℤ/2)`, `2 ↦ 0`; middle `f₁ ⊗ 1 = 0` | square commutes; clause is a statement about the supplier's second map | none |
| 6.5, hypotheses of §5.2 | `φ ∈ A_r ∩ C̄ᵖ`, `ψ ∈ A_s ∩ C̄^q`, `p + q − r − s + 1` arguments in `N` | at most `p − r` among the first `p` and `q − s` among the last `q` gives `p + q − r − s`, one short: one factor vanishes; `g_i = 1`: `φ` (`i ≤ p`) or `ψ` vanishes | `A_r ∪ A_s ⊂ A_{r+s}`, normalized cochains closed | none |
| 6.5, `E_∞` clause | 6.1's filtration, degree `n` | `A_s` is zero in degrees `n`, `n + 1` for `s > n + 1`; `A_s = C̄` for `s ≤ 0`: the bounds `p₀ = n + 2`, `p₁ = 0` of SpectralSequencesAndConvergence §5.3 | applies with no global bound | none |
| 6.5 sign | HS53 line 692–698: `(−1)^{i′j}`, `E₁^{j,i}`; `d₁` rule `(−1)^{i+j}` | `j = p`, `i′ = q′`: `(−1)^{pq′}`; rule `(−1)^{p+q}` | README's sign is the source's | none |
| 6.6 route (uses 6.5) | `u = o ∪ u′`, `o ∈ E₂^{0,1}`, `u′ ∈ E₂^{p,0}` | product sign `(−1)^{0·0}`; `d₂(o ∪ u′) = d₂o ∪ u′ + (−1)^{0+1} o ∪ 0 = −c_k ∪ u′`; `ℤ/3 ⊂ ℤ/9`: `df(2, 1) = f(1) − f(3) + f(2) = −1` | `d₂ = −c_k ∪`, as HS53 line 984–990 | none |
| 1.1 conjugation, `conjRes` | `S₃`, `H = ⟨(12)⟩`, `g = (13), (123), (132)` | `gHg⁻¹ = ⟨(23)⟩`; `g⁻¹(23)g = (12)` for `(13)` and `(123)`, `(13) ∉ H` for `(132)`; equivariance `ρ(g)ρ(g⁻¹βg) = ρ(β)ρ(g)` | HS53 line 154–160 has the same coefficient map `σ·f(σ⁻¹…σ)` | none |
| 1.2 quotient action | `S₃ ⊃ A₃`, `𝔽₃`; `ℤ/4 ⊃ 2ℤ/4`, sign module | `−1` on `H¹(A₃, 𝔽₃)`, invariants `0 = Hom(S₃, 𝔽₃)`; `M^N = M` with `Q` acting by `−1` | agrees with HS53 line 345–354 | none |
| 1.4 Shapiro, orbits | `ℤ/2` on `G ⊔ pt` | `H₀ = ℤ ⊕ ℤ`, `H₁ = 0 ⊕ ℤ/2`; by points `ℤ³` | agrees | none |
| 2.1 hyperhomology | `S₃`, `C = (ℤ[S₃/A₃] → ℤ)` | `C ≃ ℤ_sgn[1]`; `H₀(S₃, ℤ_sgn) = ℤ/2`; `H₁(S₃, ℤ_sgn) = ker(H₁(A₃) = ℤ/3 → H₁(S₃) = ℤ/2) = ℤ/3`; so `0, ℤ/2, ℤ/3` | agrees with 2.3's first sequence (`d¹`: iso on `q = 0`, zero on `q = 1`) | none |
| 2.2 long exact sequences | `C` acyclic in `0 → C′ → C → C″ → 0`; `G = 1` | `Hₙ(G; C) = 0` by the second sequence of 2.3, so `δ` is bijective; for `G = 1` the chains functor is the identity | consistent with 2.1, 2.3 | none |
| 3.4 tree complex | line with `ℤ` translating; one loop | `∂ = t − 1` on `k[ℤ]`, injective, cokernel `k`; loop: `∂ = 0`, not injective | exact only for trees; SerreArbres line 5142–5147 | none |
| 3.5 tree sequence | `ℤ` on the line, `a = t`, `b = 1` | edge map `c_{t⁻¹} − 1 = t⁻¹ − 1`: `H₁ = M^ℤ`, `H₀ = M_ℤ`; sum: `H₀(ℤ, ℤ) = ℤ/2` | signs as SerreArbres line 5178–5184 (`t` induced, `o` opposite) | none |
| 3.6 amalgam, HNN, free | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `BS(1, 2)`; `F₂`, both generators `−1` | `(ℤ/4 ⊕ ℤ/2 ⊕ ℤ/3)/⟨(2, 1, 0)⟩ = ℤ/4 ⊕ ℤ/3 = ℤ/12`; `1 − 2 = −1` iso and `1 − 1 = 0`: `H₁ = ℤ` (abelianisation of `⟨a, t ∣ tat⁻¹ = a²⟩`); `ker(−2, −2) ≅ ℤ` against `0 ⊕ 0` | agrees | R01 (citation) |
| `freeGroup_isZero_of_two_le` | `S = ∅`; one letter; zero ring; trivial `M = k`, `S, k : Type` | `0`; `H₂(ℤ, M) = 0`; `0`; the pinned `TauCeti.isZero_groupHomology_freeGroup` | true; strictly more general than the pin | R01 |
| `coprod_groupHomology_bijective` | `A = B = 1`; `ℤ/2 ∗ ℤ/2`, odd `n ≥ 3`; `n = 1` twisted | `0 → 0`; `(ℤ/2)² → (ℤ/2)²`; `0 ⊕ 0` against `ℤ` | `2 ≤ n` needed and present | none |
| 4.2 connecting maps, uniqueness | family `x ∪′ y = (−1)^{pq} x ∪ y` | `x ∪′ δy = (−1)^{p(q+1)}(−1)^p δ(x ∪ y) = (−1)^{pq} δ(x ∪ y) = δ(x ∪′ y)`; `δx ∪′ y = (−1)^{(p+1)q} δ(x ∪ y) = (−1)^q δ(x ∪′ y)` | excluded by the left rule; rules are MilneCFT line 3467–3476 | none |
| 4.1 without the action | `G = ℤ`, `φ = id`, `ψ(1) = 1 ∈ ℤ[ℤ]` | `t·1 − 2·1 + (1 + t) − 1 = 2(t − 1)` at `(1, 1, 1)` | not a cocycle | none |
| 4.4 Alexander–Whitney | degree 2 on `(g₀, g₁, g₂)` | `(g₀) ⊗ (g₀, g₁, g₂) + (g₀, g₁) ⊗ (g₁, g₂) + (g₀, g₁, g₂) ⊗ (g₂)`: front `p`-face, back `q`-face, the summands of the pinned `alexanderWhitney_f` | same map as the pin's | R02 |
| 4.5 projection formula | `H = G`; `x = res z`; degree `0` | `x ∪ y`; `[G : H](z ∪ y)`; `Σ g·μ(x ⊗ y) = μ(Σ g x ⊗ y)` for invariant `y` | agrees; MilneCFT line 3492 | none |
| 4.6 evaluation and face | `ℤ²`, `z = [e₁|e₂] − [e₂|e₁]` | `⟨x ∪ y, z⟩ = 1·1 − 0·0 = 1`; back face `y ∩ z = y(e₂)[e₁] − y(e₁)[e₂] = [e₁]`, `⟨x, [e₁]⟩ = 1`; front face `−[e₁]` | adjunction without sign consistent | none |
| 4.7 Tate, discrete, profinite | `ℤ/2`, `𝔽₂`; bidegree `(0, q)`; `∏_ℕ ℤ/p` | `x ∪ x ≠ 0` on both; norm image times `H^q` is `cor(res)` of a class killed in `Ĥ⁰`; `⊕_ℕ 𝔽_p` countable against `Hom(G, 𝔽_p)` uncountable | (a) through the quotient in degree 0, (c) only through finite quotients, as stated | none |
| 5.3 cross product | `ℤ × ℤ`, `ℚ`, bidegree `(1, 1)` | `(x × y)(e₁, e₂) − (x × y)(e₂, e₁) = 1 − 0`; Koszul sign would give `−1`; `(V ⊗ V)^* ⊋ V^* ⊗ V^*` for `V = ℚ^{(ℕ)}` | no sign; finiteness needed | R02 (citation) |
| `nonempty_groupHomology_two_addEquiv_exteriorPower` | `1`, `ℤ/n`, `(ℤ/2)²`, `ℤ²`, `ℚ` | `0`; `0`; `ℤ/2`; `ℤ`; `0` on both sides | true; `Λ³(ℤ/2) = 0 ≠ H₃` is not claimed | none |
| 6.1, 6.2 filtration and convergence | `ℤ/4 ⊃ 2ℤ/4`, `n = 1`; classical `(p, q)` | `A₁`: `f(2) = 0`; `A*₁`: also `f(1) = f(3)`; position `(2p + q + 1, −p − 1)`: `s = p`, `t = q`; `A_{p+r−1}` zero in degree `p + q + 1` for `r ≥ q + 3`, `C̄/A_{p+2−r} = 0` for `r ≥ p + 2` | bound `max(q + 3, p + 2)` correct | none |
| 6.2 on `S₃`, `𝔽₃` | action `(−1)^{⌈q/2⌉}` | invariants for `q ≡ 0, 3 mod 4`: degrees `0, 3, 4, 7, …` | `H*(S₃, 𝔽₃)` | none |
| 6.7 low degree | `ℤ/2 ⊂ ℤ/4`, `ℤ` and `𝔽₂` | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; homology `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; with `𝔽₂` inflation on `H²` is zero | hypothesis needed | none |
| 6.8 and `nonempty_groupHomology_two_addEquiv_hopf` | `ℤ/n`; `ℤ²`; `R = 1`; `A₅` | `R ∩ [F, F] = 0`; `d([a|b] − [b|a]) = [ba] − [ab] ↦ ba(ab)⁻¹ = ⁅a, b⁆⁻¹`; `0`; `ℤ/2`; boundary of `[x|y] − [x′|y′]` goes to `r₂(x′r₂x′⁻¹)⁻¹ ∈ ⁅F, R⁆` | true; needs only `H₂(F, ℤ) = 0` | R01 |
| 6.9 comparison | `ℤ/3 ⊂ ℤ/9`; `N = G` | `−[carry]` on both sides; `H²(1, −) = 0` | agrees; HS53 line 854–856 | none |
| 7.1, `doubleCosetTerm`, `res_comp_corestriction_eq_finsum` | `K = G`; `H = G`; `K = 1`, `n = 0`; `H = K = ⟨(12)⟩ ≤ S₃` | one coset, `cor ∘ c_g = cor`; `res`; `Σ_{gH} g·m`; two cosets, the second through `Hⁿ(1) = 0` | true; `H.comap (conj g⁻¹) = gHg⁻¹`; `DoubleCoset.Quotient K H` is `K\G/H`, finite as a quotient of `G/H` | none |
| 7.1 homology | degree 0, `K = 1` | left: `tr^G_H[m] = Σ_{Hx ∈ H\G} [x·m]`; right: over `1\G/H = G/H`, `c_{g⁻¹}` gives `Σ_{gH} [g⁻¹·m]`, and `x = g⁻¹` matches `H\G` with `G/H` | agrees; `c_g` instead would land outside `H` | none |
| `IsStableClass`, `bijOn_res_sylow_isStableClass` | `G = P`; `S₃`, `p = 3`; `p ∤ |G|`; `n = 0`, `M = ℤ`; `C₂ × S₃`, `𝔽₂³` | all stable; `0` in degree 2, `ℤ/3` in degree 4; both sets `{0}`; `0` against `ℤ`; cocycle `z ↦ e₃` has `c_{(23)}` restriction `e₂ ≠ e₃`, stable dimension `2 = dim H¹(G, Ind_P^G 𝔽₂)` of `3` | true for `n ≠ 0`; `res cor z = Σ [P : P ∩ gPg⁻¹] z = [G : P] z` | none |
| `tate_duality` | `ℤ/2`, `M = ℤ`, `i = 0, 1`; `G = 1` | `(ℚ/ℤ)/2 = 0 = Hom(Ĥ⁻¹(ℤ) = 0)`; `Hom(ℤ/2, ℚ/ℤ) = ℤ/2 = Hom(H₁)`; all `0`; `Ĥ⁻¹(G, ℚ/ℤ) = (ℚ/ℤ)[|G|]` receives every map from a group killed by `|G|` | true for every `M`; integral form needs freeness (`M = ℤ/2`: `0 ≠ ℤ/2`) | none |
| 8.2 | `p = 21`, `ℤ/7 ⋊ ℤ/3`; `Q₈`; `D₈` | `2³ ≡ 1 mod 7`; `1 + 6 + 14` elements; `(1, 0)(0, 1) = (1, 1) ≠ (2, 1)`; `Q₈` has one involution; `D₈ ⊃ (ℤ/2)²` | primality needed, stated; Loh19 line 2399–2419 is for odd `p`, as the README says | none |
| 8.3 | truncation of a free complex | `F_n/B_n` is an extension of `B_{n−1} ⊂ F_{n−1}` by `ℤ_χ`: free over `ℤ`; `B_n` has a finite free resolution; `ℤ_χ ⊗ ℤ_χ = ℤ` | period divides `2(n + 1)` | none |
| 8.4 and `cup_characterConnectingClass_bijective` | `G = 1`; `ℤ/m`; `S₃`; `Q_{2^s}`; `p ∤ |G|` | `orderOf 1 = 1`, `χ = 0`, groups `0`; `Ĥ⁰ = ℤ/m → Ĥ² = ℤ/m` by a generator; `Ĥ²(S₃)(3) = 0`, `Ĥ⁴(S₃)(3) = ℤ/3`: period `4 = 2·|S₃/A₃|`; `Ĥ² = (ℤ/2)²`, `Ĥ⁴ = ℤ/2^s`: `4`; least `d = 1` | true; description as MilneCFT line 3813–3817 | none |
| `tfae_periodic_cohomology` | `G = 1`; `S₃`; `A₄`; `SL₂(𝔽₉)`; `QuaternionGroup (2^m)`, `m ≥ 1` | `d = 1`, `u = 0`, card `1`; `d = 4`; `V₄`; `|G| = 720 = 9·80`, `(ℤ/3)²`; order `4·2^m ≥ 8` | true; `d ≠ 0` excludes `Ĥ⁰ = ℤ/|G|` | none |

## Verified sound

- **Elaboration.** `lake env lean` on `packages/CohomologyOfGroups/Suggested.lean`, run from the
  content repository: exit 0, nine warnings, each `declaration uses 'sorry'` (lines 83, 91, 106,
  115, 144, 168, 182, 199, 213), no error. `import Mathlib` then three `TauCeti.*` modules, all
  used. No `set_option`, no sorried data, `theorem` only, three definitions with real bodies.
- **Padding probe, all nine theorems.** On a scratch copy each `sorry` was replaced by
  `first | rfl | simp | infer_instance | trivial | (constructor <;> simp) | exact?`: nine errors, one
  per theorem (`simp` only unfolds coercions; `exact?` finds nothing; one times out). None closes.
  None restates a definition, mirrors a Check or treats a boundary case.
- **Signatures.** `#check` of the three definitions in the same run and the worker's listing of all
  12 elaborated types, compared with the README: no binder lost; `k G : Type u` in Layers 1–7,
  `Type` over `ℤ` in 5.4, 6.8 and Layer 8; `2 ≤ n` in 3.6, `n ≠ 0` in 7.2, `[H.FiniteIndex]` in 7.1.
- **Headline theorems.** From the Summary: Hochschild–Serre (6.2–6.7), tree sequence (3.5), Künneth
  (5.1), double coset formula (7.1), stable elements (7.2), Tate duality (8.1), periodicity (8.5).
  Stated: 7.1, 7.2, 8.1, 8.5, and the consequences 3.6 (two theorems), 5.4, 6.8, 8.4. Named in the
  module docstring as not statable, each with its missing carrier: 6.2–6.5, 6.6–6.7, the sequences
  of 3.5–3.6, 5.1–5.3, 8.3. Checked at the pin: the `Q`-action on `H^q(N, M)` exists in degree 0
  only (`Rep.quotientToInvariantsFunctor`, `Mathlib/RepresentationTheory/Invariants.lean:263`); no
  group-level cross product, cup product of `groupCohomology` or normalized cochains (grep of
  `RepresentationTheory/Homological` in both libraries).
- **Names at the pin.** Pins confirmed against `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti
  `2fd255d9`). 163 backticked library names of the README resolved to a definition line; those
  whose first match was in an unrelated file were opened by hand in the file the README names,
  among them `TauCeti.TateCohomology.cup` (`Cup/Product.lean:131`), `cup_δ_of_flat`
  (`Cup/Delta.lean:242`), `δ_cup_of_leftInverse` (`Cup/Delta.lean:443`), `cup_projection`
  (`Cup/Corestriction.lean:178`), `TauCeti.TateCohomology.map` (`Functoriality.lean:249`),
  `characterConnectingClass` (`TateCohomology/Character.lean:65`), `TauCeti.groupHomology.transfer`
  (`Transfer/Basic.lean:79`), `δ_comp_corestriction` (`Corestriction.lean:187`),
  `TauCeti.FactorSet.cohomologyClass` (`GroupExtension/Cohomology.lean:120`),
  `IsTransgressionLift.cocycle` (`Transgression.lean:354`), `TauCeti.TopPairing.cup`
  (`Cup/Cohomology.lean:169`), `TauCeti.SerreGraph.IsTree` (`Serre/Tree.lean:47`),
  `CochainComplex.exists_quasiIso_projective` (`ProjectiveResolution.lean:71`, for a complex
  strictly bounded above, as the README says), `Rep.ihom` (`Rep/Basic.lean:774`),
  `DoubleCoset.Quotient` (`GroupTheory/DoubleCoset.lean:79`), the `TODO` of
  `ContCohomology/Basic.lean:38–39`. None missing. The 12 names of the roadmap's own are the 12
  declarations of `Suggested.lean`.
- **Duplication at the pins, by object.** Searched both libraries for free products and amalgams
  with group (co)homology, Hopf's formula, exterior powers with `groupHomology`, double cosets with
  cohomology, stable classes with Sylow subgroups, Tate duality, periodicity, hyperhomology,
  Hochschild–Serre, universal coefficients for groups. Found: the free-group vanishing (R01), the
  Alexander–Whitney and shuffle maps (R02); `Cup/Cyclic.lean` has degree 0 only, as the README
  says; `TateCohomology/Pi.lean` (products in Tate cohomology) is not restated by 1.3, which is about
  `groupHomology` and `groupCohomology`.
- **Sources: the seeded sample.** 1.1 and 1.2: HS53 line 154–160 (corollary to Prop. 2, p. 113) and
  345–354 (pp. 117–118); Loh19 line 5322–5334 (Prop. 3.2.13, p. 124). 1.4, 3.4: SerreArbres line
  5136–5164 (printed p. 168). 3.5: SerreArbres line 5170–5184 (Prop. 13, Remarque 1, printed
  p. 169), amalgam example line 5190–5196. 2.1: HS53 line 201–216 (§4, Prop. 4, p. 114), line 83–86
  (Prop. 1, p. 111), line 355–362 (p. 118). 4.2: MilneCFT line 3459–3476 (Prop. 1.38, p. 73), Loh19
  line 6019–6027 (Outlook 3.2.28, p. 139, sign `(−1)^{pq}`). 4.5: MilneCFT line 3485–3496
  (Prop. 1.39, pp. 73–74). 4.7: no source locator; it rests on pinned declarations. 5.1: Loh19 line
  5854–5866 (Thm. 3.2.22, p. 135: a principal ideal domain, one complex flat, split not naturally),
  5877–5900 (Cor. 3.2.23, p. 136), 5960 (Example 3.2.25, p. 137). 6.9: HS53 line 854–856 (p. 130).
  8.2: Loh19 line 2399–2419 (p. 53, odd primes), 2437–2456 (Outlook 1.6.20, p. 54). 8.4: MilneCFT
  line 3793–3822 (p. 81); Hutchinson13 line 494–504, 511–515 (p. 12). Also 6.1 (HS53 line 368–385),
  6.5 (line 397–400, 686–700), 7.2 (MilneCFT line 3357, 3382; Hutchinson13 line 482–491). The page
  offsets of the manifest's `version_note`s hold for all four texts. No slip.
- **Manifest.** Eight works, each cited in the README and in its References; `cited_for` equals the
  set of citing targets for every work.
- **Supplier-order audit.**

      depcheck: 243 roadmaps, 2203 edges, 0 problem(s)

  No UPWARD or CYCLE line. Sections opened at the current heads: on main, DerivedModuleAlgebra §S.1
  (line 955), ProfiniteCohomology §§3.1, 3.2, 5.5, 6.4, 10.1, 10.5 and Layers 8, 12, ClassFieldTheory
  Layer 0 §0.1, FreeGroupsAndLimitGroups §§2.2, 4.1–4.8, AlgebraicTopology §§4.1–4.3, 5.3, 5.4,
  StableHomotopyKTheory §3.29; at open heads, SpectralSequencesAndConvergencePartII Layers 2, 3 and
  §§3.2–3.4, 4.2, 4.3, 5.2, SchemeKTheoryOperations §6.7 (group hyperhomology and directed unions are
  inside it), K3BlochGroups §§4.1, 5.2 with `quaternionPeriodicHomology` and
  `finiteGroup_period_fromSylow`, ArithmeticGaloisDuality §D7.2 and Layer R02.2,
  InductionRestrictionPartII RS.0.1, RS.0.3, RS.6.8, K2SymbolsBrauer §1.1,
  MappingClassGroupsAndCanonicalRepresentations §1.1, IntegralIwasawaTheoryPartII §0.7,
  ModularCurvesPartII §15.4. All exist and say what the contract assumes.
- **Declared gaps.** `gap:homological-low-degree` (DerivedModuleAlgebra §S.1) and `gap:flat-kunneth`
  (SpectralSequencesAndConvergencePartII §4.3): each precise, minimal and declared with the same
  slug in `design/plan.json` and under Exact supplier contracts. §S.1's homological form stops at the
  second page and convergence (main, lines 991–999); SpectralSequencesAndConvergence §3.6 states
  edge morphisms and the five-term sequence for cohomological indexing only. Not findings.
- **Shape.** Eight layers, each with Examples and Dependencies; 41 numbered targets, each with at
  least three Checks (counted mechanically, minimum 3); no LaTeX delimiters, process words,
  pull-request numbers, machine paths or target tables (scan of all 2324 lines; the only matches of
  the word list are "Shapiro's lemma" and source lemma numbers). Layer order is forced by the
  `*Needs:*` lines (2 on 1; 3 on 1–2; 5 on 3–4; 6 on 1–4; 8 on 4, 5, 7).
- **Ownership against open work.** `roadmaps grep` over main and the 468 open heads for Hopf's
  formula, the double coset formula, stable elements, Mayer–Vietoris of amalgams and HNN
  extensions, the Künneth theorem of group homology, the Pontryagin ring of an abelian group: the
  only other texts are the suppliers the Scope already names (InductionRestrictionPartII,
  K2SymbolsBrauer, K3BlochGroups), each for the instance the Scope assigns it. No other roadmap
  cites this one except SpectralSequencesAndConvergencePartII's list of consumers.
- **Overlaps file.** No open pull request changes this roadmap, drops an id it cites or defines one
  only in a revision; no second copy on main.

Overlap check: read SpectralSequencesAndConvergencePartII, K3BlochGroups, ArithmeticGaloisDuality, SpectralSequencesAndConvergence (open), ProfiniteCohomology, DerivedModuleAlgebra (main); FiniteGroupExtensionSplitting and ProfiniteCohomologyPartII were read in round 1 and no id of theirs is cited; nothing shared beyond what the Scope assigns: hyper-derived and composite-functor spectral sequences, the Künneth sequence of complexes and pairings of filtered complexes to SpectralSequencesAndConvergencePartII; first-quadrant double complexes to DerivedModuleAlgebra; continuous cohomology to ProfiniteCohomology; the finite-group instances to K3BlochGroups and ArithmeticGaloisDuality.

Source independence: 15 passages compared with 5 sources (HS53, Loh19, MilneCFT, SerreArbres, Hutchinson13), none shared beyond formulas and clauses of under ten words that the mathematics forces; largest share HS53, 42 of 108 locators; contents compared with HS53: independent (its three chapters are general methods, the direct method, applications; only 6.1, 6.2, 6.5, 6.6, 6.7 meet Ch. II §§1–5 and Ch. III §§3–4, interleaved with 6.3, 6.4, 6.8, 6.9, in the order 6.1 → 6.2 → 6.5 → 6.6 → 6.7 that their `*Needs:*` lines force). Brown82 and CE56 could not be read.

## Not verifiable

- **Brown82** (uncertified; 14 targets, chapter and section locators), among the sample 7.1: the
  text is not legally readable here. 7.1 was checked mathematically (table) and against the
  continuous Mackey formula at the pin.
- **CE56** (uncertified), among the sample 2.2 (Ch. XVII): not readable; 2.2 follows from the
  exactness of the chain and cochain functors (table).
- **SwanPPeriod60** (waived): read only through Hutchinson13 line 499–504.
- The sign convention of the pinned `SSet.shuffle` against 5.1's witness: not compared (R02).

## Source issues

- **Misprint** in Hutchinson13 at the proof of Corollary 3.3, p. 12 (Hutchinson13 line 518): the source says the nonzero groups occur for degrees congruent to 3 modulo 3; it should be modulo 4, as in the statement of the corollary; affects nothing.
- **Gap** in MilneCFT at Ch. II Remark 3.5, p. 81 (MilneCFT line 3813–3817): the source says the periodicity isomorphism is cup product with the class of the chosen character and postpones the proof; it should be proved, as 8.4 plans; affects a stated result.

## For the human reviewers

- **Licence.** `Loh19` is recorded as `author-page`: unpublished lecture notes on the author's university page with no stated licence; cited by locator in 16 targets, no passage reused (`packages/CohomologyOfGroups/sources.toml`, `Loh19`).
- **Not tested.** Brown82 is the only locator of 1.3, 3.1, 4.6, 7.1 and 8.3's general form and was not read; wording and arrangement were compared with the five readable sources only (`sources.toml`, `Brown82`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7bfdf06b298d00f25d45d4204c7d227e6ecd82c2", "job": "REV-PKG-CohomologyOfGroups~2", "model": "fable", "worker": "chris-x52"} -->
