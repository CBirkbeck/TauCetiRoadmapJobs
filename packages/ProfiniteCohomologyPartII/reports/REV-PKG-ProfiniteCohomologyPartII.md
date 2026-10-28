<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2203#issuecomment-6412875760 -->
Review (claude) of adfb460

Verdict: accepted
Conditional on the announced gaps: `char-p-galois-h2-vanishing`, `integral-gauge-massey-independence`

1. **F01** (P3) `Matrix.IsUpperUnitriangular` is Tau Ceti's, not Mathlib's

   **Location.** `packages/ProfiniteCohomologyPartII/README.md` line 164 (the "From Mathlib" bullet "`Subgroup.center`, `Subgroup.normalClosure`, `QuotientGroup.mk`, `Matrix.IsUpperUnitriangular`, …") and line 492 (1.1 *Needs:* "Mathlib `Matrix.IsUpperUnitriangular`").

   **Claim.** The predicate is a Mathlib declaration.

   **Witness.** At the pinned Mathlib there is no `IsUpperUnitriangular` (grep of the whole tree: none). At the pinned Tau Ceti it is `TauCeti/LinearAlgebra/Matrix/Triangular.lean` line 85, `def IsUpperUnitriangular [LT m] [Zero R] [One R] (M : Matrix m m R) : Prop`, inside `namespace Matrix` (line 69); the padding probe's goal display `(↑a).IsUpperUnitriangular` confirms it is what `upperUnitriangularGroup` unfolds to.

   **Repair.** Delete `Matrix.IsUpperUnitriangular` from the "From Mathlib" bullet at line 164, add it to the "Unitriangular and triangular groups" bullet of "From Tau Ceti" (line 169), and in 1.1 write "Tau Ceti `Matrix.IsUpperUnitriangular`". Tested: the name resolves at the Tau Ceti pin and nowhere in Mathlib.

2. **F02** (P3) the 0.4 gauge Check has a wrong sign on its middle term

   **Location.** `packages/ProfiniteCohomologyPartII/README.md` lines 451–453: "For `n = 2` the gauge changes the value by `−(du₀ ∪ a₁₂ + a₀₁ ∪ du₁ + du₀ ∪ du₁) = −d(u₀ ∪ a₁₂ + a₀₁ ∪ u₁ + u₀ ∪ du₁)`".

   **Claim.** The displayed equality of 2-cochains.

   **Witness.** With the Leibniz sign of 0.1 (line 303), `d(a₀₁ ∪ u₁) = da₀₁ ∪ u₁ − a₀₁ ∪ du₁ = −a₀₁ ∪ du₁`, so the right side contributes `+a₀₁ ∪ du₁` where the left side has `−a₀₁ ∪ du₁`. Instance: `Γ = ℤ/2 = ⟨σ⟩` on `𝔽₉ = 𝔽₃(i)` by `i ↦ −i`, `u₀ = 0`, `u₁ = i`, `a₀₁(σ) = i` (a cocycle since `i + σ(i) = 0`). Then `du₁(σ) = i`, `(a₀₁ ∪ du₁)(σ, σ) = i·σ(i) = 1`, `(a₀₁ ∪ u₁)(σ) = i·σ(i) = 1`, `d(a₀₁ ∪ u₁)(σ, σ) = 1 − 0 + 1 = 2`; left side at `(σ, σ)` is `−1 = 2`, right side is `−2 = 1`. The conclusion (the change is a coboundary) is right, since `a₀₁ ∪ du₁ = −d(a₀₁ ∪ u₁)` is one too.

   **Repair.** Write `−d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)`. Tested on the instance: both sides are then `2` at `(σ, σ)`.

3. **F03** (P3) `DefiningSystem` docstring: "not constrained by any field" overstates

   **Location.** `packages/ProfiniteCohomologyPartII/Suggested.lean` lines 54–55: "The entries with `i ≥ j` and the corner entry `(0, n)` are not constrained by any field."

   **Claim.** Those entries are free.

   **Witness.** `continuous_entry : ∀ i j, Continuous (entry i j)` (line 61) quantifies over all `i j`, so these entries must be continuous (harmless, constants qualify, but the sentence is literally false).

   **Repair.** Replace "by any field" with "by any equation (only by `continuous_entry`)".

Reviewed at the pull request's head `adfb460` (board checkout confirmed at that commit before reading). Files reviewed: `packages/ProfiniteCohomologyPartII/README.md` (2089 lines, 68 targets, 68 `*Needs:*` lines, every `### k.n` subsection has one), `Suggested.lean` (244 lines, 20 declarations counting structure fields), `sources.toml` (4 entries), `metadata.toml`, `design/plan.json` (`gaps` only). No previous review. The acceptance is conditional on the two declared supplier gaps (see `## Verified sound`, "Gaps").

## Verified sound

**Principles.** No route-specific shortcut: Dwyer's criteria are stated for every topological group and every discrete commutative ring, refined lifting for every `IsLocalField`, including `ℝ` and `ℂ` (the source proves the nonarchimedean case only). No re-planning: the cochain algebra specialises DGAInfinity Layer 1/8 carriers (main, `TauCetiRoadmap/DGAInfinity/README.md` lines 293 and 520–538); the cyclic degree-eight lifts (HW Lemma 7.6) are imported from InverseGaloisAndArithmeticFundamentalGroups §IG.4.2 (its head: "Two independent cyclic degree-eight lifts", surjective onto `(ℤ/8)²`, degree 64, three quadratic subfields), not re-proved; Grunwald–Wang and `Ш` duality from ArithmeticGaloisDuality. No copied passage (spot-checked the sampled targets against the source text), no algorithm, no `set_option`, no `lemma`, no sorry'd data (every `def`/`instance` has a real body; `triangularCorner.normal` is a one-term instance needed to form the quotient in `twistedRefinedLocalLifting`), no LaTeX delimiters, no process words, pull-request numbers or machine paths in README or Lean (grep).

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: exit 0 in 7.5 s, the only diagnostics are seven "declaration uses `sorry`" warnings (lines 94, 112, 139, 171, 188, 220, 240). The three `TauCeti.*` imports exist at the pin with their oleans. `#check @` on all 20 names in a scratch copy: every elaborated type carries exactly the binders the README states (`[IsTopologicalGroup Γ]`, `[DiscreteTopology R]`, `2 ≤ n`, `Fact p.Prime`, `IsLocalField K`, `1 ≤ r`, `1 ≤ s`, `r + s + 1 = n`, `3 ≤ n`); no section variable was lost (the file uses none). Nothing changed as a result. One-tactic padding probe (`first | rfl | simp | infer_instance | trivial | simp_all`) on a scratch copy: all seven sorried theorems fail; none is padding, and no declaration restates a definition, mirrors a Check or computes a value.

**Headline theorems.** README summary (lines 14–19) names seven: `masseyDefined_iff_exists_lift`, `masseyContainsZero_iff_exists_lift`, `bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot`, `refinedLocalLifting`, `localMasseyVanishing`, `twistedRefinedLocalLifting`, `exists_masseyDefined_not_masseyContainsZero_zmod_eight`. All seven are stated against the pins; the module docstring names what is not stated (the DG-algebra carriers of 0.1–0.2 and Layer 9) and why. Every Lean name appears in the README; every backticked name of the roadmap's own in the README is declared (the `resolve` tool reports none missing; the worker's four leads `continuous_entry`, `entry_castSucc_succ`, `entry_mul`, `Steinberg.toElementary_upperUnipotent` are structure fields of `DefiningSystem` and K2SymbolsBrauer §6.14's API name respectively).

**Lean statements against the README and the sources.**
- `DefiningSystem.entry_mul`: `a_ij(gh) = a_ij(g) + a_ij(h) + Σ_{i<m<j} a_im(g) a_mj(h)` is `d a_ij = −Σ a_im ∪ a_mj` for `(d a)(g,h) = a(h) − a(gh) + a(g)` and `(a ∪ b)(g,h) = a(g) b(h)` (trivial action), and is the `(i,j)` entry of a product of unitriangular matrices; it matches HW line 27 (Kraines' sign). `value = −Σ a_0m(g) a_mn(h)` matches HW line 29. For adjacent pairs the equation forces `χ i` to be a homomorphism (empty sum), as 1.6 says.
- Dwyer's criteria: HW Proposition 2.2 and Corollary 2.3 (lines 182–194) are over `Γ_k` and `𝔽_p`; the README's generalisation to a topological group and a discrete commutative ring is justified entrywise (the matrix identity is over any commutative ring). `IsTopologicalGroup` is needed for the converse direction only (cosets of the open kernel are open), and is in scope. The centre of `Uₙ₊₁(R)` is the corner line for every commutative ring (commuting with `e_{i,i+1}(1)` forces row `i+1` and column `i` of `g − 1` to vanish), so `U/Z` is as the README says.
- `bogomolovMultiplier`: `groupCohomology.map A.subtype (𝟙 (Rep.res …)) 2` has the restriction direction `groupCohomology (Rep.trivial ℤ G _) 2 ⟶ groupCohomology (Rep.res …) 2` (Mathlib `RepresentationTheory/Homological/GroupCohomology/Functoriality.lean` line 141: `map (n) : groupCohomology A n ⟶ groupCohomology B n` for `φ : res f A ⟶ B`); the infimum over abelian subgroups is Moravec (3.0.1) (line 175–180) and HW (4.1) (lines 462–470, bicyclic equivalently abelian). `superdiagonalSubgroup 2` is HW's `U¹`: Tau Ceti `Nilpotent.lean` line 181 `mem_superdiagonalSubgroup_iff r : … ↔ ∀ i j, j < i + r → g i j = 1 i j`, so `r = 2` kills exactly the first superdiagonal; HW lines 161–163. Michailov Theorem 3.1 (line 171) covers `UT^ℓ_m(𝔽_p)` for `1 ≤ ℓ ≤ m − 2`, i.e. `n ≥ 3` here; `n ≤ 2` is the trivial or cyclic case.
- `IsTwoBoundary n r s`: row `0`, columns `j ≥ n − s` written `n ≤ j + s` (no ℕ-subtraction), column `n`, rows `i ≤ r`, strictly above the diagonal; HW Definition 5.2 (lines 789–790). `refinedLocalLifting`: `∃ ρ'`, open kernel, `∀ g ∃ x ∈ P_(r,s)` with `ρ'(g)·x ≡ ρ(g) mod Z`, i.e. agreement modulo `P_(r,s)`; this is HW Proposition 5.3 (lines 821–823, with `r + s = n − 1`, hence `r, s ≤ n − 2` automatic) extended to `IsLocalField`.
- `IsLocalField`: Mathlib `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean` lines 45–49) extends `IsValuativeTopology`, `LocallyCompactSpace`, `ValuativeRel.IsNontrivial`, so the existential over the topology is tied to the valuation. HW's "local field" is nonarchimedean (lines 819–820).
- `localMasseyVanishing`: HW Remark 5.4 (lines 824–828) and Introduction item (2) (lines 99–103); `n ≥ 3` is needed (Check: `⟨χ, χ⟩ = {χ ∪ χ} ≠ {0}` over `ℝ`).
- `triangularCorner`: for `n ≥ 1`, `t(1 + sE₀ₙ)t⁻¹ = 1 + s·t₀₀(t⁻¹)ₙₙ E₀ₙ` for upper triangular `t`, so the corner matrices are already normal and the normal closure adds nothing; for `n = 0` the defining set is `{1}`. `twistedRefinedLocalLifting`: an `x ∈ T` satisfying `IsTwoBoundary` has unit diagonal, so `ρ' ≡ ρ` modulo `P_(r,s)` and the diagonals agree; this is HW's local step (lines 1196–1200).
- `exists_masseyDefined_not_masseyContainsZero_zmod_eight`: HW Theorem 7.5 (lines 1203–1204); `ZMod 8` carries Mathlib's discrete topology (`Topology/Instances/ZMod.lean` lines 24–26), `AbsoluteGaloisGroup ℚ` is Tau Ceti's `Gal(Kˢ/K)` (`AbsoluteGaloisGroup/Basic.lean` line 312).

**Sources: the seeded sample** (all in the certified arXiv extractions; `HW` = arXiv 1904.06512v2, `Michailov` = 1308.3408v2, `Moravec` = 1203.3190v1).
- 0.2: HW Introduction pp. 1–2 (lines 11–35) defines Massey products in a DG ring and computes Galois cohomology by `C•(k, 𝔽_p)`; supports the statement.
- 0.4: HW §7 p. 26 lines 1097–1099 ("choosing other cocycles corresponds to conjugating `α`"); supports the statement (see R02 for the Check).
- 1.1: HW §2 p. 4 lines 158–163 (`Uᵐ` generated by `e_ij`, `j − i > m`); Michailov §3 p. 5 lines 152–158 (generation, `UT^ℓ_n = ⟨t_ij : j − i ≥ ℓ⟩`); supports.
- 1.2: HW line 159 (`U^{m+1} = [U^m, U]`), Michailov (3.2) line 160 (`[UT^r, UT^s] = UT^{r+s}` over `𝔽_p`); supports; the README's extension to every commutative ring is proved by the commutator formula `[e_ik(t), e_kj(1)] = e_ij(t)` (Tau Ceti `Transvection.lean` line 248).
- 1.4: HW pp. 4–5 lines 159, 170–172 (`Z = ⟨e₀ₙ⟩`, `u ∈ H²(U/Z, Z)`); supports; the positive factor-set sign is the README's own computation, checked below.
- 1.6: HW Proposition 2.2, Corollary 2.3, Remark 2.4, p. 5 lines 179–198; Dwyer Theorem 2.4 is uncertified (paywalled) and is cited through HW's statement that the sign convention differs (lines 179–181, footnote line 37); supports.
- 2.2: HW (4.2) p. 12 lines 478–484, with `e_{i,j}(e_{k,l}) = e_{k,l} + e_{i,l}` if `j = k`, `e_{k,l} − e_{k,j}` if `i = l`; supports; signs rechecked from `[e_ij, e_jl] = e_il` and `[x⁻¹, y]` (see table).
- 3.3: HW Definition 3.2 p. 9 lines 346–349 ("smallest divisor `e | d` such that the action factors through `(ℤ/d)* → (ℤ/e)*`"); supports.
- 4.5: HW Proposition 4.1 p. 11 line 456, proof p. 12 lines 457–471 citing Michailov Theorem 3.1; Michailov Theorem 3.1 p. 5 lines 171–172 and Case II pp. 8 lines 271–307; supports.
- 7.6: HW (5.5) p. 21 line 895 and (i)–(iii) lines 905–910; supports (two `ρ_{v,u}` at lines 915 and 925 are the interchanges the README records).
- 8.2: HW p. 19 lines 819–820 (nonarchimedean convention); Mathlib `IsNonarchimedeanLocalField` as above; Tau Ceti `finiteExtension_isNonarchimedeanLocalField` (`NumberTheory/LocalField/FiniteExtension/Basic.lean` line 207, any finite extension); supports.
- 8.3: HW Proposition 5.3 line 821 (nonarchimedean) and proof of Theorem 5.1 p. 22 lines 965–967 (applied "to each `Γ_{k_v}`"); the README's archimedean target is the gap the source leaves; supports the README's reading.
- 11.4: HW proof of Lemma 7.7 p. 30 lines 1276–1286 (`16` not an eighth power in `L`, quadratic subfields `ℚ(√p), ℚ(√2q), ℚ(√2qp)`, Grunwald–Wang, `Ш¹(L, μ₈) ≅ ℤ/2` generated by `[16]`); supports.
- 11.7: HW Lemma 7.7 p. 29 lines 1235–1237 (non-injectivity by global duality from non-surjectivity on `Ш¹` of duals); supports.
- 11.8: HW proof of Theorem 7.5 p. 30 lines 1287–1289 (`χ₁₂` with `∂χ₁₂ = γ`); supports.
- Author-flagged unverified locators: none in `sources.toml` (Dwyer is settled `uncertified`).

**Adversarial pass.** One row per statement checked (sampled targets, headlines, targets touched by findings, and the computed Checks I recomputed independently with a short script in the scratch directory).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 cup with translation | `ℤ/2` on `𝔽₉`, `a(σ)=1`, `b(σ)=i` | `(a∪b)(σ,σ) = 1·σ(i) = −i`; untranslated `a(σ)b(σ) = i` | differ as claimed | none |
| 0.1 Leibniz sign | `ℤ/3`, `𝔽₃`, `f=g`, `f(σ)=1` | `(dg)(σ,σ) = 1−0+1 = 2`, `(f∪dg)(σ,σ,σ) = 2`; unsigned rule off by `2·2 = 1 ≠ 0` | sign needed | none |
| 0.2 comparison | trivial `Γ`; degree-1 round trip | `H⁰ = R`, `H^q = 0`; `F(1,h) = f(h)` | holds | none |
| 0.3 `DefiningSystem`, `value` | `n=2`, `(ℤ/3)²`, `𝔽₃` | value `−x∪y`; `x∪y ≠ −x∪y` since `2(x∪y) ≠ 0` | sign discriminates | none |
| 0.3 zero inputs | `n=4`, `a₀₂=x`, `a₂₄=y`, rest `0` | `entry_mul` holds on all five non-corner pairs; value `−x∪y ≠ 0`; all-zero family value `0` | product ∋ `0`, ≠ `{0}` | none |
| 0.3 junk `n` | `n = 1`; `n = 0` | no equation, value `0`; value `0` | criteria need `n ≥ 2` | none |
| 0.4 gauge Check | `ℤ/2` on `𝔽₉`, `a₀₁(σ)=i`, `u₁=i`, `u₀=0` | left `−(a₀₁∪du₁)(σ,σ) = 2`; right `−d(a₀₁∪u₁)(σ,σ) = 1` | identity false, conclusion true | R02 |
| 1.1 ordered product | `U₃(𝔽₇)`, `(a,b,c) = (2,3,5)` | `(0,2)` entry `c + ab = 5 + 6 = 4 ≠ 5` | parameters ≠ entries | none |
| 1.1 distance factors | `U₄`, finite `R` | `e₀₂, e₁₃, e₀₃` give `|R|³ = |U¹|` | holds | none |
| 1.2 orders | `U₅(𝔽₂)` | entries with `j−i ≥ 2, 3, 4`: `6, 3, 1` → `64, 8, 2`; `[U¹,U¹] = U³` of order `2` | matches | none |
| 1.2 reverse inclusion | `[e₀₂(1), e₂₄(1)]` | `= e₀₄(1)` by `Transvection.lean` 248 | distance-4 generator | none |
| 1.4 centre | any commutative `R`, `n ≥ 1` | `g` commutes with all `e_{i,i+1}(1)` ⇒ `g − 1 = tE₀ₙ`; zero ring trivial; `n=1`: `Z = U` | holds | none |
| 1.4 factor set | `U₃(𝔽₅)`, `(2,3)`,`(4,1)` | corner of `s(x)s(y)`: `x₀₁y₁₂ = 2·1 = 2` | `+` sign | none |
| 1.5/1.6 sign | `n=2` | value `−χ₀∪χ₁`; `β*u = +χ₀∪χ₁` | opposite signs | none |
| 1.6 lift ⇒ system | `β : Γ →* U/Z` | `(i,j)` entry of `β(g)β(h)` is `entry_mul`; kernel open ⇒ entries locally constant (needs `IsTopologicalGroup`) | holds, binder present | none |
| 1.6 example | `ℤ/2`, `𝔽₂`, `(χ,χ)` | lift to `(ℤ/2)²` exists; any `u ∈ D₈` over `(1,1)` has `u² = e₀₂(1) ≠ 1` | no lift to `U`, `χ∪χ ≠ 0` | none |
| 1.6 example | `ℤ/4`, `𝔽₂` | order-4 element over `(1,1)` gives a lift; `x² = 0` in `H*(ℤ/4,𝔽₂)` | consistent | none |
| 2.2 action formula | `n=5`, `p=3`, all adjacent generators × all 7 basis vectors | conjugation by sparse lifts equals (4.2) in every case (script) | holds | none |
| 2.2 signs | `[e_ij,e_jl]=e_il` ⇒ `e_ij e_jl e_ij⁻¹ = e_il e_jl`; `e_lj e_kl e_lj⁻¹ = e_kl·[e_kl⁻¹,e_lj] = e_kl e_kj(−1)` | `+e_il`, `−e_kj` | matches (4.2) | none |
| 2.3 boundary stability | `n > 3`, (4.2) | `e₂₃·e₀₂ = e₀₂ − e₀₃`; `e₃₄·e₀₃ = e₀₃ − e₀₄ = e₀₃` in `B`; `n=3`: `e₀₃ = e_{n−3,n}` | dims `4` / `3` | none |
| 2.4 conjugation formula | distance 3, by expanding `Σ(−1)^k(QN^k + NQN^k)` | `Q_{i,i+3} + a_iQ_{i+1,i+3} − Q_{i,i+2}a_{i+2}` (cubic terms cancel) | matches HW (4.8) | none |
| 2.4 Check | `𝔽₃`, `a₂=1`, `Q₀₂=1` | `M₀₃ = −1 = 2` | minus sign kept | none |
| 3.2 exponent | `p=3`, `n=6`, `M = E₀₂+E₂₄+E₄₆` | `M³ = E₀₆`, `g³ = 1 + E₀₆ ≠ 1`, `g⁹ = 1`; `2·3 > 6` false, `2·9 > 6` true | bound sharp | none |
| 3.3 outer exponent | `C₁, C₂, C₄, C₆, Q₈`, elementary abelian | `1, 1, 4, 3, 1`; `p` (odd), `1` (`p=2`) | matches Checks | none |
| 3.4 `p=2` involutions | `n = 4,5,6`, 30 random `Q ∈ U¹` each | `D² = O² = 1`, `Q⁻¹ = OD` (script) | holds | none |
| 4.1 negative control | `C₂ × C₂` | `H²(·,ℚ/ℤ) = ℤ/2`; cyclic restrictions `0`; restriction to the group itself nonzero | cyclic tests insufficient | none |
| 4.5 small `n` | `n ≤ 1, 2, 3, 4` | `U¹ = 1`, `C_p`, `𝔽_p³` (abelian), non-abelian (`[e₀₂,e₂₄] = e₀₄`) | Michailov needed from `n = 4` | none |
| 5.4 fixedness | `n=3`, `𝔽₃`, `a=(1,1,1)`, `b=e₀₂+e₁₃` | `−b₀a₂ + a₀b₁ = 0`; `M₀₃ = 0 − 1 + 1 = 0 = Q₀₃` | holds; `b = e₀₂`, `a₂=1` gives `−1` | none |
| 5.6 boundary dual | `n=4`, `p=2`, `s=(1,1,0,1)`, `t=(1,0,1,1)` | `B_bdry` stable; cyclically trivial cocycles `4`, coboundaries `4` (script) | kernel `0` | none |
| 6.1 failure at `n=6` | `p=2`, `a=(1,1,0,0,0,1)` | `|B^a| = 64` (dim 6); of `4096` candidates `1036` have a commuting lift; span dim `5`, all `(2,5)`-coordinates `0`, `e₂₅ ∈ B^a` (script) | matches | none |
| 6.2 nonzero kernel | same `G`, full `B^∨` | `s,t` commuting involutions; cyclically trivial cocycles `8`, coboundaries `4` (script) | `ℤ/2` | none |
| 7.1 subgroup, abelian range | `r+s ≤ n−1`; `n=4, r=s=2` | cross terms need `k ∈ [n−s, r]`, empty; `[e₀₂,e₂₄] = e₀₄ ≠ 1` | abelian iff claimed | none |
| 7.1 count | `𝔽₃`, `n=4`, `r=2`, `s=1` | `3⁴ = 81` (script) | matches | none |
| 7.3 connecting map | inhomogeneous `m=1`, `γ(g) = g·s − s` | `d(s∘c)(g,h) = g·s(c(h)) − s(g·c(h)) = γ(g)(g·c(h))` | `+[γ ∪ c]`, same as AGD §R02.1.4 | none |
| 7.4 easy cases | `ℚ₂, p=3`; `ℚ₇, p=3`; `𝔽₂((t)), p=2` | `μ₃(ℚ₂) = 1` ⇒ `Hom(0,·) = 0`; `7 ≡ 1 (3)` ⇒ `ℤ/3`; gap case | as claimed | none |
| 7.5 duality input | `Z ≅ μ_p` needs `μ_p ⊆ K` | Tau Ceti `dualityMap1_kummerCoeff_bijective` needs `IsUnit (p : K)`, `A` finite killed by `p` | hypotheses present | none |
| 7.6 retractions | `u = e₀ᵀ`, `v = eₙ`; `ρ(e_in(t)) = t u_i vₙ` | corner entry; invisible indices `> r`, `< n−s` | holds | none |
| 7.7 stabiliser | `𝔽₃`, `n=4,r=2,s=1`, `u=(1,2,1,0,2)`, `v=(1,0,2,1,1)` | `|S| = 2187 = 3^7` (conditions `M₀₁ = 0`, `M₃₄ = 0`, `M₀₂ + 2M₁₂ = 0`); support criterion exact; `ρ̃` additive on 3600 random pairs (script) | matches | none |
| 7.7 `n=3` | `u=e₀`, `v=e₃` | `S = {M₀₁ = M₂₃ = 0}` | matches | none |
| 8.1 pairing | trivial `𝔽₂`; free `𝔽₂[C₂]` | `t = σ−1 = 1+σ`, `t² = 0`; `H¹ = ker t/im t`: `𝔽₂`, `0`; structure theorem (uniserial `𝔽₂[t]/t²`) gives perfectness | holds | none |
| 8.2 `IsLocalField` | `ℚ`, `ℚ_p`, `𝔽_q((t))`, `ℝ`, `ℂ` | countable vs locally compact nondiscrete; disjuncts | determines the class | none |
| 8.3 archimedean lifting | `ℝ`, `p=2`, `n=3,4,5`, every `(r,s)`; exhaustive | homs `C₂ → U/Z`: `40, 288, 3008`; without lift mod `P`: `0, 0, 0`; not lifting themselves: `12, 96, 1056` (script) | headline true there; "need not lift `α̃` itself" witnessed | none |
| 8.3 `p` odd, `ℂ` | `ℝ`, `p=3`; `ℂ` | hom from `C₂` to a `3`-group trivial; `Γ_ℂ = 1` | trivial | none |
| 8.4 `n ≥ 3` | `ℝ`, `p=2`, `n=2` | `⟨χ,χ⟩ = {χ∪χ}`, `χ∪χ ≠ 0` (quaternions) | hypothesis needed | none |
| 10.1 descent | `p=2`; `ℝ, p=3`; `M=ℤ/2` | `K′ = K`; `K′ = ℂ`, degree `2`; `H²(ℝ,ℤ/2) = ℤ/2 → 0` | `p`-primary needed | none |
| 10.2 `triangularCorner` | `n=0`; `𝔽₃`, `diag(−1,1,1)` | set `{1}`; `1+E₀₂ ↦ 1−E₀₂` | normal, not central | none |
| 10.3 twisted lifting | trivial diagonal; `p=2`; `ℝ`, `p` odd | reduces to `refinedLocalLifting`; `T = U`; `H²(C₂, P)` is `2`- and `p`-torsion ⇒ `0` | holds | none |
| 11.1 modules | `P₈`, `D₈` orders; conjugations | `8⁴`, `8³`; `e₀₁e₁₂e₀₁⁻¹ = e₁₂e₀₂`; `P₈` abelian (no cross terms), normal | matches | none |
| 11.2 quotient action | `e₀₁e₁₃e₀₁⁻¹`, `e₂₃e₀₂e₂₃⁻¹` | `e₀₃e₁₃`, `e₀₂e₀₃⁻¹`; trivial mod `e₀₃` | `μ₈²` cyclotomic | none |
| 11.3 Wang class | `v` odd; `ℝ`; `ℚ₂`; `ℚ` | `(2/v)(−2/v)(−1/v) = (4/v) = 1` ⇒ one of `2,−2,−1` square ⇒ `16` eighth power; `√2 ∈ ℝ`; `v₂(16) = 4`; `v_p(p⁴) = 4` | `w ≠ 0` | none |
| 11.4 field `L` | `p=17`, `q=41` | `17, 41 ≡ 1 (8)`; subfields `ℚ(√17), ℚ(√82), ℚ(√1394)`; `q` square in `ℚ₂` ⇒ `√2 ∈ L_w` | matches | none |
| 11.5 invariance | restriction of `w` | `([16],[1],[1])`: `s·[1] = [1]·[1]`, `t·[16] = [16]·[1]⁻¹` with trivial `C`-action on `Ш¹(L,μ₈)` | invariant | none |
| 11.6 no lift | quadruple over `([16],[1],[1])` | `s·a₁₂ = [16]·a₁₂` impossible as `s` acts trivially and `[16] ≠ 0` | holds | none |
| 11.7 | finite abelian groups | dual of a non-surjection is not injective | holds | none |
| 11.8–11.10 headline | `χ₁₂` with `δχ₁₂ = η ≠ 0`, local `δ = 0` | local lifts ⇒ both cups in `Ш²(ℚ,ℤ/8) = 0` ⇒ defined (0.3, `n=3`); containing `0` ⇒ global lift, excluded | holds | none |
| `IsTwoBoundary` junk | `n = 0` | `i < j` impossible ⇒ only the identity | harmless | none |
| `MasseyDefined` on `ℂ` | `Γ = 1` | any system; `f(1) = value(1,1)` solvable | `localMasseyVanishing` trivial there | none |

Unused hypotheses (notes, not findings): `1 ≤ r`, `1 ≤ s` in the two lifting theorems are HW's range; no instance with `r = 0` was tested.

**Duplication by object.** Pinned Mathlib has no Massey product, no Bogomolov multiplier, no unitriangular-group filtration, no two-boundary subgroup and no `IsLocalField` (grep of `Mathlib` for `Massey`, `Bogomolov`, `IsLocalField`: none). Pinned Tau Ceti has the unitriangular groups, the superdiagonal filtration with the forward inclusion only (`commutator_superdiagonalSubgroup_le`, `Nilpotent.lean` line 220), transvection commutators, the explicit low-degree cohomology, the Heisenberg criterion, embedding problems and local duality; every one of these is cited, not restated (the 41 Tau Ceti names in the supplier contracts all resolve at the pin, file and line checked, e.g. `FiniteEmbeddingProblem` `Basic.lean` line 60 with `IsSolution` = open kernel and `α ∘ β = π`, no surjectivity, line 92; `exists_isSolution_iff_obstruction_eq_zero` `Cohomology.lean` line 110 with the abelian-kernel hypothesis; `h2MuEquivZMod` `RootsOfUnity.lean` line 89; `corestriction_res` `AllDegrees.lean` line 173; `explicitCup11_eq_zero_iff` `Heisenberg.lean` line 181). Mathlib names: `IsNonarchimedeanLocalField`, `groupCohomology.map`, `Rep.trivial`, `Rep.res`, `ConjClasses`, `IsConj.pow` (`Algebra/Group/Conj.lean` 52), `CharacterModule.dual_surjective_of_injective` (`CharacterModule.lean` 101, namespace at 45), `ContinuousCohomology.tateShafarevich` (`ContCohomology/Sha.lean` 71), `TopRep.homogeneousCochains` (113), `TopRep.resolutionX` (54), `continuousCohomology` (131), `Subgroup.normalClosure_normal` all exist at the pin; the one mis-attribution is R01. Roadmaps: `roadmaps grep` over main and all 367 open pull requests for `Massey`, `Bogomolov`, `Dwyer`, `IsLocalField`, two-boundary, `unitriangular`: Massey products exist only as DGAInfinity Layer 8's generic products (consumed here) and BordismFormalGroups' spectral-sequence products; every Bogomolov hit outside this package is the height conjecture; HeightsRationalPointsAndObstructions (open) owns unramified Brauer groups and the Brauer–Manin pairing but no Massey product, Bogomolov multiplier or unitriangular computation (its `Massey` hits are HW citations for `unramifiedBrauer`); InverseGaloisAndArithmeticFundamentalGroups cites HW Lemma 7.6 for the cyclic lifts this roadmap imports; no board package and no open `Suggested.lean` declares a name in `TauCetiRoadmap.ProfiniteCohomologyPartII`. This roadmap is the owner of every object it defines; ownership was checked against all open pull requests through the grep tool.

**Suppliers and merge order.** Gate output: `depcheck: 56 roadmaps, 641 edges, 0 problem(s)`; no UPWARD or CYCLE line. `ORDER.txt` places ProfiniteCohomologyPartII at line 50, after K2SymbolsBrauer (40), ArithmeticGaloisDuality (48) and InverseGaloisAndArithmeticFundamentalGroups (49); ProfiniteCohomology, DGAInfinity, ProfiniteProPGroups and ClassFieldTheory are on main (`TauCetiRoadmap/<Name>/README.md`). HeightsRationalPointsAndObstructions (line 155) is named only as a downstream consumer, never as a supplier. Every cited section resolves now: ProfiniteCohomology Layers 0–3, 5, 6, 8–12 (main README lines 583–2088; Layer 9 is "the Galois interface: Hilbert 90 and Kummer theory", line 1363, the gap's section verbatim; Layer 3 comparison with discrete `groupCohomology`, line 213; Layer 12 graded cup, line 228); DGAInfinity Layer 1 (line 293) and Layer 8 (520); ProfiniteProPGroups Layer 5 (lines 868–874, `FiniteEmbeddingProblem`); ClassFieldTheory Layer 5 "local coefficients, the Brauer group, the local invariant, and duality"; ArithmeticGaloisDuality at its head: §R02.1.4 with "Pointwise Hom of discrete modules", "The splitting torsor", "The connecting map is cup product with the torsor class" (same sign and cochain formula as 7.3), "Finitely generated `C`: the discrete case" and the Check `torsor_discrete_fails` (lines 742–841 of its README), §R02.3.0d (line 1705; `Ш` is Mathlib's `tateShafarevich`, Cartier dual with the contragredient cyclotomic action), §R02.4.5a statement (3) (perfect pairing `Ш²(K,A) × Ш¹(K,A^D) → ℚ/ℤ`), §R02.4.5b (`Ш¹(ℚ,μ₈) = 0`, `Ш²(ℚ,ℤ/8) = 0`, and the `Ш¹(L,μ₈) ≅ ℤ/2` Check); InverseGaloisAndArithmeticFundamentalGroups at its head: §IG.4.1 "Finite abelian-kernel obstruction and pullback" (no surjectivity of `π`, torsor under `H¹(Π, A_π)`), §IG.4.2 "Twisting abelian-kernel solutions" and "Two independent cyclic degree-eight lifts"; K2SymbolsBrauer at its head: §6.14 with `Steinberg.toElementary_upperUnipotent` (commutative `A`, `n ≥ 3`, lexicographic order). No upward citation, no cycle, no unowned prerequisite, no supplier cited for a statement it does not make.

**Gaps.** Both are precise, minimal and declared in both places (`plan.json` `gaps` slugs equal the README's `gap:` slugs under the suppliers' subsections, lines 216–220 and 230–233). `gap:char-p-galois-h2-vanishing`: ProfiniteCohomology Layer 9 on main states Hilbert 90 and Kummer theory for `m` invertible and nothing in characteristic `p`; Layer 11 defers `cd_p` of local Galois groups to ClassFieldTheory, which only remarks `cd_p G_K = 1` in characteristic `p` (main, line 1307); Mathlib and Tau Ceti have no Artin–Schreier vanishing; the `needs` sentence states one conclusion with its hypotheses. `gap:integral-gauge-massey-independence`: DGAInfinity Layer 8 constructs exponential gauge only "when `k` is a `ℚ`-algebra" (main, lines 528–531) and records indeterminacy without an independence-of-representatives statement over a general ring; the roadmap needs it over `𝔽_p` and `ℤ/8`. Acceptance is conditional on these two.

**Shape and style.** Headings as upstream; `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, Layers 0–11 each with `### Examples` and `### Dependencies`, `## Downstream consumers`, `## Worked examples`, `## References`. Every definition has an API list and at least three Checks (counted for 0.1, 0.3, 1.3, 1.4, 2.1, 2.3, 2.5, 3.1, 3.3, 4.1, 4.2, 5.1, 5.2, 6.3, 6.5, 7.1, 7.2, 7.6, 8.2, 9.1–9.4, 9.7, 10.2, 11.1, 11.3, 11.8); every theorem has hypotheses in the sentence and a locator; convention witnesses computed (Massey sign, commutator, cup translation, corner sign). `sources.toml`: four entries with one key each, arXiv versions and page conventions recorded (HW v2 header "5 Jan 2022", extraction line 5; Michailov v2 footer date 5 July 2019, line 35), Dwyer `uncertified` with DOI; no local path.

## Not verifiable

- Dwyer, *Homology, Massey products and maps between groups*, Theorem 2.4: paywalled, settled as uncertified; the README cites it only through HW's statement (lines 179–181) and does not rely on its text.
- HW Lemma 4.13's full factorization at `n > 4` and Proposition 6.1 case (4) were read in the source but not recomputed beyond the `n = 3` and `n = 5` instances in the table.

## Source issues

- **Misprint** in HW at proof of Proposition 5.3, printed page 19 (line 846): the source says that in the easy case a homomorphism to `U/Z` lifts to `Z`; it should be lifts to `U`; affects nothing.
- **Misprint** in HW at proof of Proposition 5.3, printed page 21 (lines 915, 925): the source writes the retraction with its arguments interchanged, `ρ_{v,u}`; it should be `ρ_{u,v}`, row first, as in (5.5); affects nothing.
- **Gap** in HW at Proposition 5.3 and the proof of Theorem 5.1, printed pages 19 and 22: the source proves the proposition for nonarchimedean local fields and applies it at every place of the number field; it should also cover `ℝ` and `ℂ` (the same argument works with the `C₂` pairing in place of local duality); affects the proof.
- **Error** in HW at Lemma 4.7 (and its proof), printed page 14 (lines 566–567, 583): the source says the outer exponent of `U¹` equals `p` for `2 ≤ n ≤ 6`, and that it is divisible by `p`; for `p = 2` the proof shows every element conjugate to its inverse, so by Definition 3.2 the least admissible divisor is `1`; it should say the action factors through `(ℤ/p)*`; affects a stated result (the value), not its use.
- **Misprint** in HW at proof of Lemma 4.7, printed page 14 (line 571): the source says the exponent of `U¹` is divisible by `9` at `p = 3`, `n = 6`; it should be divides `9`; affects nothing.
- **Misprint** in HW at proof of Lemma 4.13, printed page 17 (line 729): the displayed factorization of `Q` has the factor `e₀₃` with parameter `1`; it should have parameter `a₂`, since `Q₀₃ = a₂`; affects nothing.
- **Misprint** in HW at proof of Proposition 6.1, printed page 23 (lines 985–986): the source calls the subgroup on indices `j ≤ 4` a copy of the `4 × 4` unitriangular group; it should be `5 × 5`; affects nothing.
- **Misprint** in HW at §7, printed page 28 (lines 1189–1195): the source displays `P_{r,s}` as an external direct sum of the last-column and first-row Hom summands, counting `Hom(N_n, N_0)` twice; it should be the internal sum meeting in the corner; affects nothing.
- **Gap** in HW at Lemma 5.5, printed page 19 (lines 830–837): the source treats `Hom(C, A)` as a discrete module for an arbitrary discrete `C`; it should assume `C` finitely generated (the pointwise topology is not discrete otherwise); affects the proof as stated, not its application with finite `C`.
- **Error** in HW at Proposition 7.3, printed page 26 (lines 1114–1117): the source asserts a bijection between all defining systems of the classes and the lifts of one homomorphism `α`; the proof gives it for the defining systems whose adjacent entries are the cocycles determined by `α`; affects a stated result.
- **Error** in Michailov at §3, printed page 5 (lines 164–165): the source says `γ_{n−1}(UT_n(𝔽_p))` is trivial; it should be `γ_n`, since `γ_{n−1}` is the corner subgroup; affects nothing.
- **Misprint** in Michailov at Theorem 3.1, Case II, printed page 8 (line 295): the source expands the minimal-distance wedge with the element `t_{i,i+1}`, which does not lie in `UT^ℓ_n` for `ℓ ≥ 2`; it should use `t_{i,i+ℓ}` and `t_{i+ℓ,i+2ℓ}`; affects the proof (one step).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "adfb460", "job": "REV-PKG-ProfiniteCohomologyPartII", "model": "fable", "worker": "fable-rev214"} -->
