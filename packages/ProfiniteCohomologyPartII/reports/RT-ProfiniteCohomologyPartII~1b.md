<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2203#issuecomment-6414128880 -->
Red team round 1 pass b (claude) of adfb460

Verdict: accepted

1. **F01** (P3) Check of 3.2 is false for `n ≤ 1`

   Location: `packages/ProfiniteCohomologyPartII/README.md:819`, "At `n ≤ 2p − 1` the exponent of
   `U¹` is `p`."

   Claim: for every `n ≤ 2p − 1` the exponent of `U¹ ⊆ Uₙ₊₁(𝔽_p)` equals `p`.

   Witness: for `n = 0` and `n = 1`, `U¹` is the trivial group (Layer 3 allows `n ≥ 0`, 3.1; the
   Lean target 4.5 also quantifies over all `n`). Computed: `U¹ ⊆ U₂(𝔽₃)` has one element, exponent
   `1 ≠ 3`. The bound of 3.2 gives "divides `p`", and equality needs `n ≥ 2` (then `e₀₂(1)` has order
   `p`).

   Repair: replace the Check by "For `2 ≤ n ≤ 2p − 1` the exponent of `U¹` is exactly `p`: it divides
   `p` by the bound with `m = 1`, and `e₀₂(1)` has order `p`. For `n ≤ 1`, `U¹ = 1` and the exponent
   is `1`."

2. **F02** (P3) 6.3–6.5 cite a locator that does not support them; 6.5 has no consumer

   Location: `packages/ProfiniteCohomologyPartII/README.md:1218-1220` ("constructed here as finite
   models of the phenomena discussed in HW, Remark 3.4, p. 10"); 6.4 (lines 1237–1244) and 6.5
   (lines 1252–1258) carry no locator of their own.

   Claim: the module `V` of 6.3, the cyclically trivial class of 6.4 and the cocycle `γ` of 6.5 model
   the phenomena of HW Remark 3.4.

   Witness: HW Remark 3.4 (HW line 379–384) concerns the differential `δ` of (3.1) on
   `H¹(k, Ĥ^ab)` for a homogeneous space with abelian stabilizers over `ℂ((x))((y))((z))`, where
   `δ(β) ≠ 0`. Nothing in 6.3–6.5 involves `δ`, a homogeneous space or that field; 6.4 is an
   example of `H¹_cyc(Q, V^∨) ≠ 0` for an action through a non-cyclic quotient (the shape of HW
   Definition 4.3 and Example 6.3, HW line 527–535 and 1029–1032), and 6.5 is a cocycle
   `γ : Q → V` whose only stated property is `γ(t²) ≠ 0`. No target of the roadmap has 6.5 in its
   `*Needs:*` line (grep over the README: 6.5 occurs only in its own section and in 6.3's sentence),
   and no Check or theorem uses `γ`. Policy: every target has a locator.

   Repair: in 6.3 replace the cited sentence by "This explicit module and the cocycle of 6.4 are this
   roadmap's own finite examples of a nonzero `H¹_cyc` for an action through a non-cyclic quotient,
   in the sense of HW, Definition 4.3, p. 13, and in the spirit of HW, Example 6.3, p. 24; they are not
   HW's examples." Give 6.4 the locator "(HW, Definition 4.3, p. 13, for `H¹_cyc`.)". For 6.5, either
   name the target that consumes `γ` and give it a locator, or delete 6.5 and keep its content as a
   Check of 6.3: "There is a cocycle `γ : Q → V` with `γ(s) = a`, `γ(t) = b + c`, `γ(r) = 0`; its
   value `γ(t²) = d + e` is nonzero although `t²` acts trivially, so a cocycle on `Q` is not
   determined by the action alone."

3. **F03** (P3) 11.9 cites a supplier target whose hypotheses the local use does not meet

   Location: `packages/ProfiniteCohomologyPartII/README.md:1999-2005`, "Over `ℚ` or any completion,
   … lifts of the endpoint pair are crossed homomorphisms to `P₈` times the section
   (InverseGaloisAndArithmeticFundamentalGroups §IG.4.2, *Twisting abelian-kernel solutions*)".

   Claim: over every completion `ℚ_v`, every lift of `(χ₀₁, χ₂₃)|_v` to `U₈ = P₈ ⋊ C` is `z·s∘χ` for
   a crossed homomorphism `z`, by the cited target.

   Witness: at its head (#850), *Twisting abelian-kernel solutions* (IG.4.2) is stated for "`K` a global
   field" and an embedding problem "`π : Γ_K ↠ Q`" (surjective); over `ℚ_v` the field is local and
   `(χ₀₁, χ₂₃)|_v : Γ_{ℚ_v} → C` is in general not onto `C` (at `v = p` the character `χ₂₃` of
   `ℚ(√2q)` is unramified of order dividing `8`, and at a real place both characters are trivial).
   The statement actually needed is covered by IG.4.1 *Finite abelian-kernel obstruction and
   pullback*, stated for an arbitrary profinite `Π` and a `π` that "need not be surjective", whose
   lifts up to `A`-conjugacy form a torsor under `H¹(Π, A_π)`; conjugation by `P₈` changes the middle
   coordinate by a coboundary, which is zero for the trivial action on `ℤ/8` (11.9's own second Check).

   Repair: in 11.9 replace "(InverseGaloisAndArithmeticFundamentalGroups §IG.4.2, *Twisting
   abelian-kernel solutions*)" by "(InverseGaloisAndArithmeticFundamentalGroups §IG.4.1, *Finite
   abelian-kernel obstruction and pullback*: for the split extension `1 → P₈ → U₈ → C → 1` and the
   continuous `(χ₀₁, χ₂₃)|_v`, surjective or not, the lifts up to `P₈`-conjugacy form a torsor under
   `H¹(Γ_{ℚ_v}, P₈)` with base point `s ∘ (χ₀₁, χ₂₃)`)", and in the `*Needs:*` line and the Layer 11
   Dependencies replace "§IG.4.2" by "§§IG.4.1 and IG.4.2" (IG.4.2 remains the owner of the two
   cyclic degree-eight lifts). Keep the global-field citation of IG.4.2 for `K = ℚ` if wanted; it is
   not needed.

4. **F04** (P3) the module docstring says every headline is stated, while the Layer 5 deliverables are neither stated nor named

   Location: `packages/ProfiniteCohomologyPartII/Suggested.lean:29` ("Every headline theorem of the
   roadmap is stated."); `packages/ProfiniteCohomologyPartII/README.md:2042-2045` (Downstream
   consumers: the global proof "consumes … the fixed-class and cyclic-kernel results (Layer 5)").

   Claim: nothing the finished roadmap is tested against is missing from the Lean file.

   Witness: 5.6 (`H¹_cyc(G, B_bdry^D) = 0`, HW Lemma 4.15) and 5.7 (fixed-class generation for
   `n = 4, 5`, HW Proposition 6.1) are named by the README as what the downstream consumer takes from
   Layer 5, with the same standing as the Bogomolov vanishing of Layer 4 that is stated. They do not
   appear in `Suggested.lean`, and the docstring does not name them as not stated or say what carrier
   they lack (`B = U¹/U³` with its `A`-action, `B_bdry`, the twisted dual `B_bdry^D`, `H¹_cyc` are all
   README-defined). The brief's rule: a headline not statable at the pins is named in the docstring
   with what it lacks; one statable but absent is a defect. Whether 5.6 counts as a headline is the
   roadmap's call; the docstring must make it.

   Repair (minimal): replace the sentence at line 29 by "Every end theorem named in the README's
   summary is stated. The finite-group results of Layers 2–6 consumed downstream (5.6, the vanishing
   of `H¹_cyc(G, B_bdry^D)`, and 5.7, fixed-class generation for `n = 4, 5`) are not stated: their
   carriers — the module `B = U¹/U³` with its `A`-action, the boundary submodule `B_bdry`, its twisted
   dual and the cyclic restriction kernel `H¹_cyc` — are definitions of this roadmap, not of the
   pinned libraries." Alternatively state 5.6 with those definitions, if the author judges it a
   headline.

5. **F05** (P3) the 0.4 gauge Check has the wrong sign on its middle primitive (confirms review F02)

   Location: `packages/ProfiniteCohomologyPartII/README.md:451-453`, "`−(du₀ ∪ a₁₂ + a₀₁ ∪ du₁ + du₀ ∪ du₁) = −d(u₀ ∪ a₁₂ + a₀₁ ∪ u₁ + u₀ ∪ du₁)`".

   Claim: the displayed 1-cochain is a primitive of the change of value.

   Witness: by the Leibniz rule of 0.1 with `a₀₁`, `a₁₂` cocycles: `d(u₀ ∪ a₁₂) = du₀ ∪ a₁₂`,
   `d(a₀₁ ∪ u₁) = da₀₁ ∪ u₁ − a₀₁ ∪ du₁ = −a₀₁ ∪ du₁`, `d(u₀ ∪ du₁) = du₀ ∪ du₁`. So the displayed
   right side equals `−(du₀ ∪ a₁₂ − a₀₁ ∪ du₁ + du₀ ∪ du₁)`, which differs from the left side by
   `2(a₀₁ ∪ du₁)`, nonzero for odd `p` (for `Γ = ℤ/3`, `R = 𝔽₃` with trivial action `du₁ = 0`, so take
   the nontrivial action of 0.4's second Check).

   Repair: write "`= −d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)`".

6. **F06** (P3) `Matrix.IsUpperUnitriangular` is attributed to Mathlib (confirms review F01)

   Location: `packages/ProfiniteCohomologyPartII/README.md:164` (the Mathlib contract list) and
   `:492` ("Mathlib `Matrix.IsUpperUnitriangular`").

   Witness: at the pinned Mathlib (6b7abb3) no file contains `IsUpperUnitriangular`; at the pinned
   Tau Ceti (a91d3aa) it is `def IsUpperUnitriangular` in `TauCeti/LinearAlgebra/Matrix/Triangular.lean`,
   line 85, namespace `Matrix`.

   Repair: move the name to the Tau Ceti list of the supplier contracts as
   "`Matrix.IsUpperUnitriangular` (`LinearAlgebra/Matrix/Triangular.lean`)" and write "Tau Ceti
   `Matrix.IsUpperUnitriangular`" in 1.1's `*Needs:*` line.

7. **F07** (P3) the `DefiningSystem` docstring says the non-permitted entries are unconstrained (confirms review F03)

   Location: `packages/ProfiniteCohomologyPartII/Suggested.lean:54-55`, "The entries with `i ≥ j` and
   the corner entry `(0, n)` are not constrained by any field."

   Witness: `continuous_entry : ∀ i j, Continuous (entry i j)` (line 61) constrains every entry; for
   `R` with a non-discrete topology a discontinuous corner entry is excluded.

   Repair: "The entries with `i ≥ j` and the corner entry `(0, n)` are constrained only by
   continuity; no equation involves them."

Files reviewed: `packages/ProfiniteCohomologyPartII/README.md` (2089 lines, every line) and
`packages/ProfiniteCohomologyPartII/Suggested.lean` (244 lines, every line), with `sources.toml`,
`metadata.toml` and `design/plan.json` (the `gaps` list). Pass-a report: none is posted on the pull
request at the time of this pass (the two comments on #2203 are the round-1 review); the review's
three P3 notes are confirmed below as R05–R07 so that the repair applies them with the rest.

Dependency check, run from the board checkout with the brief's command:

```text
depcheck: 56 roadmaps, 641 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ProfiniteCohomologyPartII sits at line 50 of `merge-order/ORDER.txt`,
after K2SymbolsBrauer (40), ArithmeticGaloisDuality (48) and InverseGaloisAndArithmeticFundamentalGroups
(49); ProfiniteCohomology, DGAInfinity, ProfiniteProPGroups and ClassFieldTheory are on main.
`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Verified sound

Counts: 16 Lean declarations read (7 theorems, 6 definitions, 1 structure with 4 fields, 1
instance), 68 README targets read, 61 locators verified against the three cached texts (every HW,
Michailov and Moravec locator of the README and of the Lean docstrings; Dwyer is uncertified), 92
Checks tested (every Check and Example of the README), 23 sibling and supplier citations resolved
(ProfiniteCohomology Layers 0–3, 5, 8–12 on main; DGAInfinity Layers 1 and 8 on main;
ProfiniteProPGroups Layer 5 on main; ClassFieldTheory Layer 5 on main; ArithmeticGaloisDuality
§§R02.1.4 with its four named parts and `torsor_discrete_fails`, R02.3.0d, R02.4.5a statement (3),
R02.4.5b at #858; InverseGaloisAndArithmeticFundamentalGroups §IG.4.1 *Finite abelian-kernel
obstruction and pullback*, §IG.4.2 *Twisting abelian-kernel solutions* and *Two independent cyclic
degree-eight lifts* at #850; K2SymbolsBrauer §6.14 with `Steinberg.toElementary_upperUnipotent` at
#1302), 49 Tau Ceti and 14 Mathlib declaration names grepped at the pins.

Mathematics recomputed (values in the pass table of the scratch worklist):

- Dwyer's criteria as typed: for `n ≥ 2` the adjacent pairs `(i, i+1)` are never the excluded
  corner, so `entry_mul` with the empty sum forces each `χ i` to be an additive map, and
  `continuous_entry` forces continuity; the noncorner entries of a coset of `Z` are well defined
  since the corner is adjacent only for `n = 1`; the corner entry `f` of a lift `Γ → U` satisfies
  `f(gh) = f(g) + f(h) + Σ a₀ₘ(g)aₘₙ(h)`, which is `value(g, h) = f h − f(gh) + f g`; openness of
  the kernel and continuity into a discrete group are equivalent for a topological group, which is
  why `[IsTopologicalGroup Γ]` is needed and present. Instances: `n = 1` makes `MasseyContainsZero`
  true for every continuous cochain (0.3's last Check, hence the hypothesis `2 ≤ n`); `Γ = ℤ/2`,
  `R = 𝔽₂`, `χ ≠ 0`: defined, not containing zero (`D₈`); `Γ = ℤ/4`: containing zero.
- The sign convention: Kraines' `d a_ij = −Σ a_im ∪ a_mj` (HW line 27, footnote line 37) is
  `entry_mul`; the value `−Σ a₀ₘ ∪ aₘₙ` (HW line 29) is `DefiningSystem.value`; the corner-zero
  section of `U₃` has factor set `+a₀₁(g)a₁₂(h)` (computed over `𝔽₅`: `2·1 = 2`), so the value is
  `−β*u` as in HW Proposition 2.2(iii) (HW line 189–191).
- The gauge argument of 0.4: `dA' + A'A' = G⁻¹(dA + AA)G` for `A' = G⁻¹AG + G⁻¹dG` (expanded with
  `d(G⁻¹) = −G⁻¹ dG G⁻¹`), `G⁻¹E₀ₙG = E₀ₙ` since column `0` and row `n` of `U` vanish, and clearing
  the corner changes the value by `−da'₀ₙ`; the adjacent entries change by `du_i`.
- Layer 1: `[Uᵃ, Uᵇ] = U^{a+b+1}` for every commutative ring (`e_ij(t) = [e_ik(t), e_kj(1)]` with
  `k = i + a + 1`, both factors in the right filtration steps; Tau Ceti's
  `superdiagonalSubgroup r` is "entries vanish for `j < i + r`", so HW's `Uᵐ` is
  `superdiagonalSubgroup (m+1)` and `U¹ = superdiagonalSubgroup 2`, as the Conventions and the
  Lean target say); the centre of `Uₙ₊₁(R)` is the corner for every ring and `n ≥ 1` (commuting
  with all `e_{i,i+1}(1)` forces the identity outside `(0, n)`); orders `64, 8, 2, 2` in `U₅(𝔽₂)`
  recomputed by enumeration.
- Layer 2: the action formula (4.2) with its minus sign (`[e_kl, e_{l,l+1}]⁻¹ = e_{k,l+1}(−1)`),
  stability of `B_bdry` (the only moves are `e₀₂ ↦ e₀₂ − a₂e₀₃`, `e_{n−2,n} ↦ e_{n−2,n} +
  a_{n−3}e_{n−3,n}`), the sparse-conjugation formula (recomputed for 160 random pairs over `𝔽₃`,
  `n = 3, …, 6`, and by hand at distances 3 and 4), `τ(e_ij(t)) = e_{n−j,n−i}(−t)` and
  `τ(S)₀₂ = 1` in `U₃`.
- Layer 3: `(1 + M)^{p^m} = 1 + M^{p^m}` with `M^{p^m} ∈ N_{2p^m}`; `g = 1 + E₀₂ + E₂₄ + E₄₆` over
  `𝔽₃` has `g³ = 1 + E₀₆`; outer exponents `1, 1, 4, 3` of `C₁, C₂, C₄, C₆` and `1` for `Q₈`;
  at `p = 3`, `n = 6`, `Q⁴ = Q + Q₀₂Q₂₄Q₄₆E₀₆` and `e₂₆(t)Q⁴e₂₆(t)⁻¹ = Q` with `t = Q₂₄Q₄₆` (by
  hand and for 50 random `Q`); at `p = 2`, `4 ≤ n ≤ 6`, `D² = O² = 1` because the top-right block
  `X` of `O = 1 + X` has `X² = 0` (150 random `Q`). The README's correction of HW Lemma 4.7 at
  `p = 2` is right: `(ℤ/2)ˣ` and `(ℤ/1)ˣ` are both trivial, so the least admissible divisor is `1`.
- Layer 4: `κ̃` is a homomorphism for the three displayed relations in the convention
  `[x, y] = xyx⁻¹y⁻¹`, `ˣy = xyx⁻¹`, which is Moravec's (Moravec line 137–138, (4.0.1) line
  443–448); Theorem 3.2 and §4 give `B₀(G) ≅ Hom(B̃₀(G), ℚ/ℤ)` with `B̃₀(G) = ker κ̃` (Moravec line
  218–219, 459–463); Michailov Theorem 3.1 Case II is the collection with `c_ik = e_{i,i+ℓ} ⋏
  e_{i+ℓ,k}` and linearity in the parameters (Michailov line 178–186, 271–307). `H²(C₂ × C₂, ℚ/ℤ)
  = ℤ/2` is killed by cyclic subgroups but not by the group itself.
- Layer 5: fixedness `a_ib_{i+1} = a_{i+2}b_i`, `SQS⁻¹ = Q` for second-diagonal fixed `b` (every
  correction term of 2.4 is a multiple of that equation); `b_i = a_ia_{i+1}` is fixed and
  `Q = e_{n−2,n}(b_{n−2})⋯e₀₂(b₀)e₀₃(a₂)` has `Q₀₃ = a₂`; for `n = 5` the six values of `Θ_Q`
  and the four cases for `b` with `b₀b₁`, `b₂b₃` or `b₀b₃ ≠ 0`; for `n > 3` the two boundary
  blocks move only through `a₂` and `a_{n−3}`.
- Layer 6: `B^a` of dimension six with the stated basis; `1036` elements of `U¹` with a fixed class
  and image span of dimension five with zero `(2,5)` coordinate (recomputed by solving the linear
  commutation system over `𝔽₂` for all `4096` candidates); for 6.2, `s` and `t` are commuting
  involutions of `B`, `8` cyclically trivial cocycles and `4` coboundaries on `B^∨`, `4` and `4`
  on `B_bdry^∨` (recomputed); the 6.4 coboundary equations `v = 0, u = 1` versus `u = 0`; the 6.5
  relations `(1 + t + t² + t³)(b + c) = 4(b + c) + 6N_t(b + c) = 0`, `γ(st) = γ(ts)`.
- Layer 7: `P_(r,s)` is a subgroup for all `r, s` (a product of two elements of `U` with that
  support differs from their sum only at the corner), normal (conjugating `E₀ⱼ` and `E_in` by an
  upper unitriangular matrix stays in the support), `81` elements for `n = 4, r = 2, s = 1` over
  `𝔽₃`; `H²(K, ℤ/p) ≅ Hom(μ_p(K), H²(K, μ_p))` by `dualityMap2_kummerCoeff_bijective`
  (hypotheses at the pin: `IsNonarchimedeanLocalField K`, `IsUnit (n : K)`, finite discrete `A`
  killed by `n`, as the contract says); the retraction criteria `u₀vₙ = 1`, invariance under
  changing `u` after `r` and `v` before `n − s`; `M ∈ S ⟺ u(M − 1) ∈ W*_{n−r−1} ∧ (M − 1)v ∈
  W^{n−s−1}` (using `MW^m = W^m`), `2187` elements and multiplicativity of `ρ̃` recomputed.
- Layer 8: the `C₂` pairing is perfect since `(im t)^⊥ = ker t^∨` and `(ker t)^⊥ = im t^∨`; over
  `ℝ` with `p = 2`, `n = 3`, adjacent entries `(1, 0, 1)`: `u² = 1 + (x + y)E₀₃` and `P_(1,1)`
  contains the `(0,2)` and `(1,3)` coordinates, so the lift exists exactly as 8.3 says; adjacent
  entries `(1, 1, 1)` give `ū² ≠ 1` in `U/Z`, so the product is not even defined (`χ ∪ χ ≠ 0`).
- Layers 9–10: the twisted defining equation from `α_Λ(gh) = α_Λ(g)α_Λ(h)` right-multiplied by
  `χ_j(gh)⁻¹` is HW (7.3) (HW line 1126–1135); `(−u, 1)(a, χ)(u, 1) = (a + g·u − u, χ)`;
  the descent of 10.3: the obstruction to lifting `ρ̄ : Γ_K → T/P` lies in `H²(K, P)` (abelian
  normal kernel, IG.4.1), restriction to `Γ_{K′}` is injective on the `p`-primary `P` since
  `cor ∘ res = [K′ : K]` with `[K′ : K] | (p − 1)^{n+1}`, and over `K′` the diagonal is trivial so
  `refinedLocalLifting` applies; this is HW's own argument (HW line 1196–1200) with the local
  field `K′` in place of `L ⊗ k_v`.
- Layer 11: the boundary of `−1` is `([16q⁴], [p⁴])` in the order `(02, 13)` (the lift `f` with
  `f(e₀₃) = −1` has `(σf)(e₀₂) = (−1)^{χ₂₃(σ)}`, the Kummer class of `(2q)⁴`); the kernel of
  `H¹(ℚ, μ₈²) → H¹(ℚ, D₈^D)` is `{0, ([16q⁴], [p⁴])}` by exactness; `16` is an eighth power at
  every `v ≠ 2` and `p, q` are squares in `ℚ₂`; `16 = x⁸` forces `√2`, `√−2` or `i` into the field;
  the invariance conditions are HW's (HW line 1267–1273) and are insensitive to the sign of the
  exponent of `[a₀₃]` because `Ш¹(L, μ₈)` has order two; the middle coordinate of `z·s∘χ` is `z₁₂`;
  both cups vanish locally from a local lift to `U₄(ℤ/8)` and globally from `Ш²(ℚ, ℤ/8) = 0`
  (ArithmeticGaloisDuality §R02.4.5b states exactly `Ш¹(ℚ, μ₈) = 0` and `Ш²(ℚ, ℤ/8) = 0`).
- Lean versus README: generality agrees for all seven theorems (topological group and discrete
  commutative ring for Dwyer; every prime and every `n` for Bogomolov; `IsLocalField K`, `r, s ≥ 1`,
  `r + s + 1 = n` for the local theorems; no continuity hypothesis on `χ` in `localMasseyVanishing`
  because `MasseyDefined` forces it); `IsLocalField` has a real body on Mathlib's
  `IsNonarchimedeanLocalField` (which at the pin provides `IsDiscreteValuationRing 𝒪[K]`, `Finite
  𝓀[K]`, `CompleteSpace K`) and `≃+* ℝ`, `≃+* ℂ`; `ZMod 8` carries the discrete topology instance
  at the pin; `triangularCorner` is a normal closure with the instance that makes the quotient a
  group; `bogomolovMultiplier` uses `groupCohomology.map A.subtype (𝟙 (Rep.res A.subtype _)) 2`
  with Mathlib's `map : groupCohomology A n ⟶ groupCohomology B n` for `φ : res f A ⟶ B` and
  `abbrev res (f) (M)`; no `set_option`, no `lemma`, no sorry'd data, no process words or
  pull-request numbers in README or docstrings.
- Headlines and padding: the six end theorems of the summary are the seven stated declarations
  (two Dwyer criteria); the global theorem is explicitly out of scope; no declaration restates a
  definition, mirrors a Check or computes a value; the instance is needed for the quotient type.
- Ownership: `Massey`, `Bogomolov`, `IsLocalField`, `IsTwoBoundary`, `triangularCorner`,
  `DefiningSystem`, `Dwyer` and `unramified Brauer` grepped over main and all 367 open roadmap pull
  requests: no other roadmap defines these objects (hits are bibliographic or AGD's citations of HW
  for Lemma 5.5, which it imports by name). No `Suggested.lean` elsewhere declares the same fully
  qualified names.
- Declared gaps: both slugs are in `design/plan.json` `gaps` and in the README supplier contracts
  with the same supplier and section titles as on main; each `needs` is one precise sentence; neither
  is already provided (no Artin–Schreier cohomology or `cd_p(Γ_K) ≤ 1` for characteristic `p` in
  ProfiniteCohomology Layers 9/11 or in Tau Ceti, whose `cohomologicalDimensionAt ≤ 1` results are
  for free pro-`p` groups; DGAInfinity Layer 8 defines Massey products and records indeterminacy
  but states no independence of representatives). DGAInfinity's DG algebras and categories are over
  a commutative ring `k`, so the `𝔽_p` and `ℤ/8` uses are within the supplier's generality.
- Checks per definition: `DefiningSystem`/`MasseyDefined`/`MasseyContainsZero` 5,
  `bogomolovMultiplier` 3, `IsTwoBoundary` 5, `IsLocalField` 3, `triangularCorner` 3; none is a
  restatement or vacuous.
- The twelve entries of "Corrections to the printed sources" were each read at the locator and are
  accurate (see Source issues).

## Not verifiable

- Dwyer, Theorem 2.4: paywalled, recorded `uncertified`; its sign convention is taken from HW
  (HW line 179–181, footnote line 37).
- The mechanical `#check` elaboration of the sixteen declarations: no Lean toolchain at the pins is
  reachable from this checkout (the Lean server available to this pass is bound to another
  project), so the comparison was done by reading each signature against its README statement; the
  package report records an elaboration with seven `sorry` warnings and a `#check` pass over 21
  declarations.
- ProfiniteProPGroups Layer 5 "classification of extensions by `H²`" in the exact generality the
  contract words (finite abelian module): the contract routes the consumption through Tau Ceti's
  `FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`, whose hypotheses at the pin
  (abelian kernel `hcomm`, surjective `π` and `α`, finite `E`, `Q`) were checked; the roadmap's own
  Layer 5 text was not read line by line.
- The claims of 11.1 Check 1 and 11.3–11.6 about local eighth powers were checked by hand, not by a
  computer-algebra computation of `L`.

## Source issues

- **Error** in HW at Lemma 5.5, printed page 19: the source says the sections of an additively split
  exact sequence of discrete modules form a torsor under the discrete module `Hom(C, A)` for any
  discrete `C`; it should be restricted to finitely generated `C` (the pointwise topology is not
  discrete otherwise); affects a stated result (every use in the paper has finite `C`).
- **Gap** in HW at Proposition 7.3, printed page 26: the source says defining systems for the
  Massey product of the classes are in bijection with lifts of the fixed character `α`; it should
  say defining systems with the fixed adjacent cocycles (other representatives of the classes give a
  conjugate character); affects a stated result.
- **Error** in HW at Definition 3.2 and Lemma 4.7, printed pages 9 and 14: the source says the outer
  exponent of `U¹` is `p` for every prime, and in the proof that it is divisible by `p`; by the
  definition it is `1` when `p = 2` (the unit groups modulo `2` and modulo `1` are both trivial);
  affects a stated result (the factorization through `(ℤ/p)ˣ`, which is what is used, holds).
- **Misprint** in HW at proof of Lemma 4.7, printed page 14: the source says the exponent of `U¹` is
  divisible by `9` at `p = 3`, `n = 6`; it should say divides `9`; affects nothing.
- **Misprint** in HW at proof of Lemma 4.13, printed page 17: the source displays the factor `e₀,₃`
  with parameter `1` in the product for `Q`; it should be `e₀,₃` with parameter `a₂`, as `Q₀,₃ = a₂`
  on the previous page; affects the proof (meaning clear).
- **Misprint** in HW at proof of Proposition 6.1, printed page 23: the source says the subgroup on
  the indices `j ≤ 4` is a copy of the unitriangular `4 × 4` case; it should be `5 × 5` (indices
  `0, …, 4`); affects nothing.
- **Misprint** in HW at §7, printed page 28: the source displays `P_{r,s}` as an external direct sum
  of the last-column and first-row Hom summands; it should be their internal sum, which share
  `Hom(N_n, N_0)`; affects nothing.
- **Gap** in HW at Proposition 5.3 and proof of Theorem 5.1, printed pages 19 and 22: the source
  proves the refined lifting for nonarchimedean local fields and applies it to the restriction of
  `α` to every `Γ_{k_v}`, archimedean places included; it should include the archimedean case
  (trivial for `ℂ` and for odd `p`; for `ℝ` and `p = 2` the same proof works with the `C₂` cup
  pairing in place of local duality); affects the proof.
- **Misprint** in HW at proof of Proposition 5.3, printed page 19: the source says every
  homomorphism `Γ_K → U/Z` lifts to `Z` in the easy cases; it should say lifts to `U`; affects
  nothing.
- **Misprint** in HW at proof of Proposition 5.3, printed page 21: the source writes `ρ_{v,u}` twice
  for the retraction `ρ_{u,v}`; it should be `ρ_{u,v}` (row first); affects nothing.
- **Error** in Michailov at §3, printed page 5: the source says `γ_{n−1}(UT_n(𝔽_p))` is trivial; it
  should say `γ_{n−1}` is the corner subgroup of order `p` and `γ_n` is trivial; affects nothing.
- **Misprint** in Michailov at Theorem 3.1 Case II, printed page 8: the source writes the
  minimal-distance commutator with the distance-one element `t_{i,i+1}`, which is not in
  `UT^ℓ_n(𝔽_p)` for `ℓ ≥ 2`; it should be `t_{i,i+ℓ}` paired with `t_{i+ℓ,i+2ℓ}`; affects the proof
  (meaning clear).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "adfb460", "job": "RT-ProfiniteCohomologyPartII~1b", "model": "fable", "worker": "fable-rt225"} -->
