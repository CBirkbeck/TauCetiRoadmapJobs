<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2203#issuecomment-6643518426 -->
Red team round 2 pass b (claude) of f88d25f

Verdict: needs_changes

1. **F01** (P3) 7.2 cites a Check name that does not exist at the supplier's head

   **Location:** `packages/ProfiniteCohomologyPartII/README.md:1373-1374`, "(ArithmeticGaloisDuality §R02.1.4, Check `torsor_discrete_fails`)".

   **Claim:** the discontinuous-splitting example is a named Check `torsor_discrete_fails` of §R02.1.4.

   **Witness:** ArithmeticGaloisDuality at its head (#858): `roadmaps grep 'torsor_discrete_fails'` returns "no match on main or in any open roadmap pull request"; neither its README nor its `Suggested.lean` carries the name. The example is the unnamed third Check under *The splitting torsor* (head lines 871–874). Introduced by the a-F08 repair.

   **Repair:** replace "(ArithmeticGaloisDuality §R02.1.4, Check `torsor_discrete_fails`)" by "(ArithmeticGaloisDuality §R02.1.4, the third Check of *The splitting torsor*)". Retest: the cited Check states `Γ = 𝔽₂^ℕ`, `C = ⊕_ℕ 𝔽₂`, `B = A ⊕ C` with the sheared action, and the non-continuity into the discrete `Hom(C, A)`, which is what 7.2 uses.

2. **F02** (P3) the K2SymbolsBrauer citation names a declaration that exists nowhere

   **Location:** `packages/ProfiniteCohomologyPartII/README.md:288-289`, "(through `Steinberg.toElementary_upperUnipotent`)".

   **Claim:** K2SymbolsBrauer §6.14 provides its factorization through a declaration `Steinberg.toElementary_upperUnipotent`.

   **Witness:** K2SymbolsBrauer at its head (#1302), §6.14 "The upper unipotent subgroup `T_n(A)` maps isomorphically onto `U_n(A)` (Milnor 9.14)" (head line 1106–1120) names no Lean declaration; its `Suggested.lean` has no `upperUnipotent`; `roadmaps grep 'toElementary_upperUnipotent'`: "no match on main or in any open roadmap pull request". The round-1 resolver flagged it; pass a called it a planned target, which it is not.

   **Repair:** delete the parenthesis "(through `Steinberg.toElementary_upperUnipotent`)" and cite the section by its title: "K2SymbolsBrauer §6.14, *The upper unipotent subgroup `T_n(A)` maps isomorphically onto `U_n(A)`*: for a commutative ring `A` and `m ≥ 3`, every element of `Uₘ(A)` is uniquely a lexicographically ordered product of elementary matrices." Retest: the section states exactly that (unique `λ_ij`, lexicographic order, `n ≥ 3`).

3. **F03** (P3) naturality of the Ш² × Ш¹ pairing is cited to a section that does not state it

   **Location:** `packages/ProfiniteCohomologyPartII/README.md:268-269` ("statement (3): the perfect pairing `Ш²(K, A) × Ш¹(K, A^D) → ℚ/ℤ`, natural in `A`") and `:2000-2001` ("natural in `M` (ArithmeticGaloisDuality §R02.4.5a)").

   **Claim:** §R02.4.5a (3) supplies the pairing together with its naturality in the module, which 11.7 uses to dualize `Ш²(ℚ, D₈) → Ш²(ℚ, P₈)`.

   **Witness:** at head #858, §R02.4.5a (3) reads "There is a perfect pairing `Ш²(K, A) × Ш¹(K, A^D) → ℚ/ℤ`" with no naturality clause (head lines 4017–4028); the naturality is stated in §R02.4.3 *Poitou–Tate duality*, part (a): "natural in `M`: for `f : M → N`, `⟨f_* a, b⟩ = ⟨a, f^D_* b⟩`" (head line 3457), from which (3) is derived.

   **Repair:** in the supplier contract and in 11.7 write "statement (3) of §R02.4.5a, with the naturality `⟨f_* a, b⟩ = ⟨a, f^D_* b⟩` of §R02.4.3 *Poitou–Tate duality*, part (a)", and add §R02.4.3 to the 11.7 *Needs* line and the Layer 11 Dependencies. Retest: 11.7's dual map `Ш¹(ℚ, P₈^D) → Ш¹(ℚ, D₈^D)` is `f^D_*` for `f : D₈ → P₈`, which is what the cited identity relates to `f_*` on `Ш²`.

Three P3 findings (S01–S03), none blocking. Every round-1 finding is repaired at this head; one repair (a-F08) introduced the locator error S01. The pins used are Mathlib `f6090c7` and Tau Ceti `358314d4` (the `lake-manifest.json` of the content checkout; both package checkouts are at those heads). The round-1 passes checked older pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`), so every library declaration was re-resolved below.

## Round-1 findings at this head

| Finding | Status | Witness at f88d25f |
|---|---|---|
| a-F01 (P1) unconstrained entries | repaired | `Suggested.lean:66-69` field `entry_eq_zero : ∀ i j, (j ≤ i ∨ (i = 0 ∧ j = Fin.last n ∧ 2 ≤ n)) → entry i j = 0`; README 0.3 ("the normalization `DefiningSystem.entry_eq_zero`"), 1.5 ("the other entries being zero"), new 0.3 Check with `Γ = 1`, `𝔽₂`, `n = 2`. For `n = 1` the corner stays `χ 0` and no field clashes (checked `n = 0, 1, 2`). |
| a-F02 / b-F05 (P3) gauge sign | repaired | README 0.4 Check: "`= −d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)`"; recomputed with the `𝔽₉` witness: LHS `−1 = 2`, RHS `d(a₀₁ ∪ u₁)(σ,σ) = 1 − 0 + 1 = 2`, wrong sign gives `1`. |
| a-F03 (P2) DG carriers | repaired | `Suggested.lean:32-37`: "the generic carriers exist at the pins (Tau Ceti's `TauCeti.IsDGAlgebra` and `TauCeti.DGCategoryData`)"; at the pin `Algebra/Homology/DG/Algebra/Defs.lean:182`, `CategoryTheory/DG/HomComplexData.lean:74`, `CategoryTheory/DG/Basic.lean:71` (`abbrev DGCategory`). Supplier contract lists them. |
| a-F04 / b-F01 (P3) exponent Checks | repaired | 3.2: "For `2 ≤ n ≤ 2p − 1` the exponent of `U¹` is exactly `p` … For `n ≤ 1`, `U¹ = 1`"; 3.3: nontrivial elementary abelian, trivial group `1`. |
| a-F05 (P3) fixed vectors | repaired | 5.2 Check: "every allowed `h̄` is a `σ`-fixed vector … but the converse fails: … `e₂₅` is fixed … but is not the image". Recomputed: `e₂₅ ∈ B^a`, span of images has dimension 5 with `(2,5)` coordinate zero. |
| a-F06 (P2) missing headline | repaired | `Suggested.lean:112-116` `isConj_pow_superdiagonalSubgroup_two`, `n ≤ 6`, `a ≡ 1 [MOD p]`, `IsConj Q (Q ^ a)` in `U¹`; README 3.4, Summary and docstring name it. Truth checked below (all cases). |
| a-F07 (P2) discrete coefficients | repaired | `[DiscreteTopology R]` on `DefiningSystem`, `value`, `MasseyDefined`, `MasseyContainsZero` (`Suggested.lean:56, 73, 80, 86`). |
| a-F08 (P3) infinite-Hom control | repaired, introduced S01 | 7.2 Check now shears the middle: "`g·(a, c) = (a + Σ gᵢcᵢ, c)`"; AGD head #858 line 871–874 has this example. The label "Check `torsor_discrete_fails`" it added exists nowhere (S01). |
| a-F09 (P3) zero ring | repaired | 7.1 Check: "If `R` is nontrivial and `r + s ≥ n` … For the zero ring `U` and every `P_(r,s)` are trivial." |
| a-F10 (P3) rank-one qualifiers | repaired | 9.3, 9.4, 9.6 Checks: "every `N_i` free of rank one over `R` with a chosen basis"; witness `R = ℤ/4`, `N_i = ℤ/2`: `64` against `4096`. |
| a-F11 (P3) repeated Checks | repaired | 4.1 `D₈`/`Q₁₆` (`[a², b] = a⁴ ↦ 1/2`, recomputed by hand); 4.2 `S₃` (`srs⁻¹r⁻¹ = r⁻² = r`, other convention `r²`); 6.3 `V^Q = ⟨d, e⟩`, kernel order 4, dual identities (recomputed, table below). |
| a-F12 (P3) comparison locator | repaired | 0.2 cites `TopRep.resolutionX`, `TopRep.homogeneousCochains` (pin: `RepresentationTheory/Homological/ContCohomology/Basic.lean:54, 113`) and the Tau Ceti low-degree comparisons; HW kept only in 0.1/0.3. |
| a-F13 / b-F03 (P2) local twisting | repaired | 11.9: "use InverseGaloisAndArithmeticFundamentalGroups §IG.4.1 … which allows any profinite source and a map that need not be surjective"; crossed homomorphism `z(g) = β(g)s(π(g))⁻¹`; Needs and Layer 11 Dependencies cite §§IG.4.1 and IG.4.2. IG head #850 line 3693–3705 states IG.4.1 as cited. |
| a-F14 (P3) `n = 2` blocks | repaired | 3.4 Check: "For `n = 2, 3` the block sizes do not fit … `Q⁻¹ = Q`"; recomputed `Q = 1 + E₀₂`, `Q² = 1` over `𝔽₂`. |
| b-F02 (P3) 6.3–6.5 locators | repaired | 6.3: "this roadmap's own finite example … in the sense of HW, Definition 4.3, p. 13"; 6.4 carries "(HW, Definition 4.3, p. 13, for `H¹_cyc`.)"; 6.5 deleted, `γ` is a 6.3 Check (recomputed `γ(t²) = d + e`). |
| b-F04 (P3) docstring headline claim | repaired | `Suggested.lean:39-43`: "Two finite-group results consumed downstream are not stated: … (README 5.6) and … (README 5.7). Their carriers … are definitions of this roadmap". |
| b-F06 (P3) `IsUpperUnitriangular` | repaired | README 164: "### From Tau Ceti — Unitriangular matrices: `Matrix.IsUpperUnitriangular` (`LinearAlgebra/Matrix/Triangular.lean`)"; pin line 85; 1.1 Needs no longer says Mathlib. |
| b-F07 (P3) docstring "not constrained" | repaired | `Suggested.lean:53-55`: "The entries with `i ≥ j`, and the corner entry `(0, n)` when `n ≥ 2`, are zero (`entry_eq_zero`)". |

No repair other than a-F08 introduced an error; the a-F06 theorem is true in every case (table below).

## Verified sound

Read: all 275 lines of `Suggested.lean` (16 declarations: 1 structure, 7 definitions, 1 instance, 8 theorems with `sorry`), all 2132 lines of the README (67 numbered targets, 219 Check bullets, 6 convention paragraphs, the Summary), `sources.toml`, `metadata.toml`, `design/plan.json` (`gaps`), the rules files, both round-1 reports and the repair report. Locators verified: 39 (30 HW, 4 Michailov, 5 Moravec; Dwyer is uncertified). Sibling sections checked at the supplier as it is now: 22 (ProfiniteCohomology Layers 0, 1, 2, 3, 5, 6, 8, 9, 10, 11, 12 on main; DGAInfinity Layers 1 and 8 on main; ProfiniteProPGroups Layer 5 in Completed; ClassFieldTheory Layer 5 on main; ArithmeticGaloisDuality §§R02.1.4 (four sub-targets), R02.3.0d, R02.4.5a, R02.4.5b at #858; InverseGaloisAndArithmeticFundamentalGroups §§IG.4.1, IG.4.2 at #850; K2SymbolsBrauer §6.14 at #1302). Pinned declarations resolved at Mathlib `f6090c7` and Tau Ceti `358314d4`: 72, every name of the supplier contracts and of `Suggested.lean`'s imports (the three `TauCeti.*` modules exist). Checks tested: every bullet read against its target; the finite ones recomputed in scratch (table). Policy: the diff against `origin/main` touches only `packages/ProfiniteCohomologyPartII`; no pull-request number or process word in README or docstrings; `theorem` only; no `set_option`, `#eval`, `#print`, admitted data or admitted example; one `import Mathlib` plus three existing Tau Ceti modules; every Lean name appears in the README and every backticked own name is declared.

Dependency check, run unmodified:

```text
depcheck: 234 roadmaps, 2111 edges, 0 problem(s)
```

No UPWARD or CYCLE line. ORDER.txt has the roadmap at line 50 after K2SymbolsBrauer (40), ArithmeticGaloisDuality (48), InverseGaloisAndArithmeticFundamentalGroups (49); ProfiniteCohomology, DGAInfinity, ProfiniteProPGroups and ClassFieldTheory are on main. HeightsRationalPointsAndObstructions (line 155) is named only under Downstream consumers, not in any *Needs* line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere (its index misses S01 and S02, which the direct greps above catch).

Declared gaps: both slugs are in `plan.json` and the README with the same supplier and section strings, which are the exact layer headers on main ("Layer 9: the Galois interface: Hilbert 90 and Kummer theory"; "Layer 8: Hochschild cochains, deformations, Massey products, and formality"). Minimal: ProfiniteCohomology on main has no Artin–Schreier or characteristic-`p` `cd_p` statement (its Layer 11 only warns off local-field values); DGAInfinity Layer 8 defines matric Massey products with indeterminacy but states no independence of the value set from representatives. Precise: each `needs` sentence carries its hypotheses.

Ownership: `roadmaps grep` by object (Massey products in Galois cohomology, Bogomolov multiplier, Dwyer's correspondence, two-boundary subgroups, a local-field predicate, the eight Lean names) finds no competing construction on main or at any open head; the Massey hits are DGAInfinity's generic products (imported here) and a page-Massey product in BordismFormalGroups. Ownership against open pull requests without files in the brief was checked only through the index.

### Declarations and targets, with instances

| Declaration or target (context) | Instances tried; values on each side | Result |
|---|---|---|
| `DefiningSystem` (`[Group Γ] [TopologicalSpace Γ] [CommRing R] [TopologicalSpace R] [DiscreteTopology R]`) | `n = 0`: one entry `(0,0)`, zeroed by `j ≤ i`. `n = 1`: `(0,1)` is `χ 0`, excluded from `entry_mul` and from `entry_eq_zero` (`2 ≤ 1` false). `n = 2`, `Γ = 1`, `𝔽₂`, `χ = 0`: every entry forced, one structure. Adjacent `(i, i+1)` for `n ≥ 2`: `entry_mul` with empty sum forces `χ i` additive. | consistent; `entry_mul` is the unitriangular product law `(AB)_ij = A_ij + B_ij + Σ_{i<m<j} A_im B_mj` |
| `DefiningSystem.value`, `MasseyContainsZero` | `n = 2`, `Γ = (ℤ/3)²`, `χ = (x, y)`: value `−x(g)y(h)`; coboundary form `f h − f (g h) + f g` matches the corner law `a₀ₙ(gh) = a₀ₙ(g) + a₀ₙ(h) + Σ a₀ₘ(g)a_mn(h)` rewritten. `n = 1`: empty sum, `f = 0` works. Zero ring: everything `0`, both predicates true. | sign and direction agree with Kraines (HW line 27–30) |
| `masseyDefined_iff_exists_lift` (`[IsTopologicalGroup Γ]`, `2 ≤ n`) | `→`: `β(g) = 1 + Σ entry`, kernel `= ⋂ entry⁻¹(0)` open. `←`: entries of `β` are locally constant since `ker β` open and cosets open (needs the group hypothesis, present). Indiscrete `Γ`: both sides force `χ = 0`. Constant nonzero `χ`: both sides false. | true as typed; generality equals README 1.6 |
| `masseyContainsZero_iff_exists_lift` | `U`-lift `β`: corner entry `f` satisfies `value = f h − f(gh) + f g` (checked from the product law); conversely a continuous primitive is a corner entry. `Γ = ℤ/2`, `𝔽₂`, `(χ, χ)`: no lift to `D₈` (order-4 preimage), `χ ∪ χ ≠ 0`. `Γ = ℤ/4`: rotation of order 4 lifts, and `Σ_{i<4} (χ∪χ)(σ^i, σ) = 0+1+0+1 = 0`. | both directions hold |
| `isConj_pow_superdiagonalSubgroup_two` (`[Fact p.Prime]`, `n ≤ 6`, `a ≡ 1 [MOD p]`) | `p ≥ 5`: `2p > 6 ≥ n`, exponent `p`, `Q^a = Q`. `p = 3, n ≤ 5`: same. `p = 2, n ≤ 3`: exponent `2`. `p = 3, n = 6`: 50 random `Q`: `Q⁴ = Q + Q₀₂Q₂₄Q₄₆E₀₆`, `e₂₆(t)Q⁴e₂₆(t)⁻¹ = Q` with `t = Q₂₄Q₄₆`, `Q⁹ = 1`; `a ≡ 4, 7 (mod 9)` via `Q⁷ = (Q⁴)⁴`. `p = 2, n = 4, 5, 6`: 90 random `Q`: `D² = O² = 1`, `D, O ∈ U¹`, `Q⁻¹ = OD`, `Q⁴ = 1`. `n = 0, 1`: trivial group. `a = 0` impossible (`0 ≢ 1`). | true; conjugators lie in `U¹`; Tau Ceti's `superdiagonalSubgroup 2` is "`j < i + 2 ⇒` identity entry", i.e. HW's `U¹` |
| `bogomolovMultiplier`, `…_eq_bot` (`G : Type`) | `groupCohomology.map A.subtype (𝟙 (res …)) 2 : H²(G, X) ⟶ H²(A, res X)` (Functoriality.lean:141 docstring: `Hⁿ(H, A) ⟶ Hⁿ(G, B)` for `f : G →* H`), so the kernel is the restriction kernel. `n ≤ 1`: trivial group. `n = 2`: `C_p`, abelian, `⊥`. `n = 3`: `𝔽_p³` abelian, `⊥` although `H² = 𝔽_p³`. `n = 4`: `[e₀₂, e₂₄] = e₀₄ ≠ 1`, Michailov Thm 3.1 (`ℓ = 2 ≤ m − 2`). | definition is Moravec (3.0.1); theorem true |
| `IsTwoBoundary` (`[Zero R] [One R]`) | `n = 3, r = s = 1`: positions `(0,2),(0,3),(1,3)`, corner once. `n = 4, r = 2, s = 1`, `𝔽₃`: `3⁴ = 81` elements (enumerated). Diagonal forced to `1`. Closed under products for every `r, s` (cross terms only at `(0, n)`), normal in `U` (computed `gXg⁻¹` support). `r ≥ n`: whole last column, harmless. | matches HW Definition 5.2 |
| `IsLocalField` (`K : Type`) | finite field: no nontrivial valuative relation, excluded. `ℚ`: not locally compact for any valuative topology, countable, excluded. `𝔽₂((t))`, `ℚ₂`: included. `ℂ`: `Γ_K = 1`. | definition determines the intended class |
| `refinedLocalLifting` (`hK`, `[Fact p.Prime]`, `1 ≤ r, s`, `r + s + 1 = n`) | nonarchimedean: HW Prop 5.3 (easy cases `H² = 0`; nonsplit: `δ` onto by local duality, `δc = −o`, wrong sign gives `2o ≠ 0` for odd `p`; split: retraction stabilizer `S`, `|S| = 2187` at `n = 4`, `𝔽₃`, support description exact, `ρ̃` multiplicative on 3600 pairs). `ℂ`: `Γ = 1`. `ℝ`, `p` odd: `Hom(C₂, p`-group`) = 1`. `ℝ`, `p = 2`: 8.1 pairing perfect (`(im t)^⊥ = ker t^∨`, `(ker t)^⊥ = im t^∨`), so `δ` onto; `n = 3`, `ρ(σ) = [e₀₂e₂₃]`: any lift squares to `e₀₃ ≠ 1`, corrected lift `e₂₃` agrees mod `P`. Conclusion form: `ρ'(g)x ≡ ρ(g)` mod `Z` with `x ∈ P` iff `ρ' ≡ ρ` mod `P`, as `Z ⊆ P`. | true at the stated generality |
| `localMasseyVanishing` (`3 ≤ n`) | `ℝ, p = 2, n = 2`: `⟨χ, χ⟩ = {χ ∪ χ} ≠ {0}` (Hamilton), hypothesis needed. `n = 3` over `C₂`: `(χ,0,χ)`, `(χ,0,0)`, `(0,χ,0)` all contain `0` with zero fill-ins; `(χ,χ,·)` undefined. `H² = 0` fields: immediate. | true |
| `triangularCorner`, `triangularCorner.normal` | `n = 0`: generating set `{1}`, closure `⊥`. `n ≥ 1`: corner matrices closed under product, conjugation by `diag d` gives `d₀td_n⁻¹`, central in `U`; so the closure is the corner. `T₃(𝔽₃)`, `diag(−1,1,1)`: `1 + E₀₂ ↦ 1 − E₀₂`, not central. | instance needed for the quotient; definition determines `Z(W)` |
| `twistedRefinedLocalLifting` | `p = 2`: `T = U`, corner = centre, reduces to `refinedLocalLifting`. Trivial diagonal: same. `ℝ, p = 3`, sign diagonal: `K′ = ℂ`, `[K′:K] = 2`, restricted obstruction `0`, `cor ∘ res = 2` invertible on the `3`-torsion `H²(K, P)`; naturality of the pullback class under restriction is IG.4.1's "Pullback is natural for continuous homomorphisms of the profinite source". `ρ|_{Γ_{K′}}` lands in `U/Z` because the diagonal dies on `Γ_{K′}`. | true |
| `exists_masseyDefined_not_masseyContainsZero_zmod_eight` | HW Thm 7.5 route: local lifts give `χ₀₁ ∪ χ₁₂, χ₁₂ ∪ χ₂₃ ∈ Ш²(ℚ, ℤ/8) = 0`, so defined (0.3's `n = 3` criterion in Kraines' sign); `0 ∈` product would give a global lift to `U₈`, excluded since `δχ₁₂ = η ≠ 0`. Mod-2 analogue impossible by `localMasseyVanishing` plus HW Thm 5.1. | true |
| 0.1 cochain algebra | `Γ = 1`: `d` out of degree `q` is `f·(1 + Σ_{i=1}^q(−1)^i + (−1)^{q+1})` `= 0` (`q` even), `= f` (`q` odd). `C₂` on `𝔽₉`: cup `(σ,σ)` `= −i` vs `i`. `ℤ/3`, `f(σ) = 1`: `(f ∪ dg)(σ,σ,σ) = 2`. Compact-open on `C(Γ^q, R)` with `Γ^q` compact, `R` discrete: `{f₀} = ⋂_r {f : f(f₀⁻¹ r) ⊆ {r}}`, finitely many clopen compacts, discrete. | Checks true |
| 0.4 gauge | `A′ = G⁻¹AG + G⁻¹dG`: `dA′ + A′² = G⁻¹(dA + A²)G` (expanded, degree-0 `G`, sign `(−1)^1` on `A dG`); `G⁻¹E₀ₙG = E₀ₙ`; adjacent entries `a_{i,i+1} + du_i`; clearing the corner `c` shifts the value by `dc`. `ℤ/8`: `G⁻¹` polynomial, `U^{n+1} = 0`. | route sound; gap declared for the generic statement |
| 1.1 | `U₃(𝔽₇)`, `(2,3,5)`: `(0,2)` entry `4`. `U₄`: `e₀₂, e₁₃, e₀₃` give `|R|³`. Zero ring, `n = 0`: one point. | Checks true |
| 1.2 `[Uᵃ, Uᵇ] = U^{a+b+1}`, every commutative ring | `U₅(𝔽₂)`: generated commutator subgroups of orders `64, 8, 2, 2` `= |U¹|, |U²|, |U³|, |U³|` (enumerated). Generators: `e_ij(t) = [e_ik(t), e_kj(1)]`, `k = i + a + 1`, `j − k ≥ b + 1`. `U₃(ℤ)`: `[U,U] = {e₀₂(t)}`. | true |
| 1.4 centre | `g` commuting with all `e_{i,i+1}(1)`: columns `0..n−1` and rows `1..n` vanish off the diagonal, only `(0,n)` survives; uses only `1 ∈ R`. `𝔽₅`, `(2,3),(4,1)`: factor set `2`. `U₄`: `[e₀₂(t), e₂₃(1)] = e₀₃(t)`. `n = 1`: `Z = U`. | true for every commutative ring, `n ≥ 1` |
| 2.2 action formula | `n = 5`, `𝔽₃`: all 35 pairs (generator, basis vector) agree with conjugation by the sparse lift (computed). `[e_{l,l+1}(t), e_kl(1)] = e_{k,l+1}(−t)` expanded by hand. | signs right |
| 2.3 `B_bdry` | `A`-stability: `e₂₃·e₀₂ = e₀₂ − e₀₃`, `e_{n−3,n−2}·e_{n−2,n} = e_{n−2,n} + e_{n−3,n}`, other generators act trivially or produce distance-4 terms. `n = 3`: dimension 3; `n = 4`: `(e₀₂,e₀₃,e₁₄,e₂₄)` in dimension 5. | true |
| 2.4 sparse conjugation | 1360 entries at `n = 3..6` over `𝔽₃`, 0 mismatches; `S⁻¹` product formula exact; witness `M₀₃ = 2`. | formula exact |
| 2.5 reversal | `U₄(𝔽₃)`: `τ(e₀₂(1)) = e₁₃(2)`; 20 random pairs: involution and homomorphism, 0 failures. | true |
| 3.1–3.2 | `N_n = R·E₀ₙ`, `N_{n+1} = 0`; `E₀₂E₂₄ = E₀₄`, `E₂₄E₀₂ = 0`. `p = 3, n = 6`: `g³ = 1 + E₀₆`, `g⁹ = 1` (computed). `n ≤ 1`: exponent `1`. | true |
| 3.3 outer exponent | brute force: `C₁, C₂, C₄, C₆ ↦ 1, 1, 4, 3`; `Q₈ ↦ 1` (every element conjugate to its inverse). Definition agrees with HW Def 3.2 (least divisor `e \| d` through which the unit action factors). | Checks true |
| 3.4 outer exponent of `U¹` | `p` odd, `2 ≤ n ≤ 6`: `a = 2` scales a nonzero image in `B`, conjugation in `U¹` fixes it, so `e = 1` is inadmissible, `e = p`. `p = 2`: all odd `a` act trivially, `e = 1`. | README statement true; HW's "`p` also for `p = 2`" is the recorded source error |
| 4.1 | `C₂²`: `M = ℤ/2`, cyclic restrictions zero, class not in `B_Bog`. `D₈`: `Q₁₆ = ⟨a, b \| a⁸, b² = a⁴, bab⁻¹ = a⁻¹⟩`, `⟨ā², b̄⟩ ≅ C₂²`, `[a², b] = a²·a² = a⁴ ↦ 1/2`. | Checks true |
| 4.2–4.3 | `S₃`: `κ̃(s ⋏ r) = r`, other convention `r²`; `M(S₃) = 0` so `ker κ̃ = B̃₀(S₃) = 0` (Moravec line 90–91: `B̃₀(G) ↣ G ⋏ G ↠ γ₂(G)`). Relations match Moravec (4.0.1) with `ᵐn = mnm⁻¹`. | true |
| 5.1 Check 3 (cyclic quotient) | `b\|_N = 0` from `b(σ) ∈ (σ − 1)M = 0`; `b(σn) = b(σ)`, `b(nσ) = b(σ)`; descends; cyclic quotient makes it a coboundary. | true (used by 5.6) |
| 5.3 | `𝔽₂`, `T₀ = id`, `T = diag(1,0)`: fails at `(1,1)`. `T₀ = 0 ⇒ T = 0`. General field, any dimension: every vector of `im T₀` is an eigenvector. | true |
| 5.4 | `n = 3`, `𝔽₃`, `a = (1,1,1)`, `b = e₀₂ + e₁₃`: `SQS⁻¹ = Q`; `b = e₀₂`, `a₂ = 1`: `(SQS⁻¹)₀₃ = 2 = −1`. | computed |
| 5.6 `n = 3` branch | dual sequence `0 → 𝔽_p² → B̂ → 𝔽_p → 0`, `(h − 1)B̂ = 𝔽_p T₀(h)` since `B̂ = 𝔽_p² ⊕ 𝔽_p m₀` with trivial action on `𝔽_p²`; 5.3 gives `T = cT₀`. `n = 4, p = 2`: boundary dual `4` cyclically trivial `= 4` coboundaries (computed). | true |
| 5.7 | `Θ_Q` values agree with HW line 1015–1016; cases (1)–(4) as HW. | matches source |
| 6.1 | `dim B^a = 6`, `4096` candidates, `1036` with a fixed class, span dimension `5`, all with `(2,5) = 0`, `e₂₅ ∈ B^a` (computed). | Checks true |
| 6.2 | `s, t` commuting involutions; full `B^∨`: `64` cocycles, `8` cyclically trivial, `4` coboundaries; `B_bdry^∨`: `16, 4, 4` (computed with the inverse-transpose action). | `H¹_cyc ≅ 𝔽₂`, boundary kernel `0` |
| 6.3–6.4 | `N_s², N_t², N_sN_t, N_tN_s = 0`; `dim V^Q = 2`; action kernel order `4`; `(s−1)d* = b*`, `(t−1)e* = b*`; `β` a cocycle on all 256 pairs, locally a coboundary at all 16 elements, no global coboundary among 32; `γ` a cocycle with `γ(t²) = d + e`. | Checks true |
| 7.1 | `P_(1,1)` at `n = 3`: 3 coordinates; `n = 4, r = 2, s = 1`: `81`; `r + s ≥ n`: `j = r` gives `[e₀ᵣ, e_rn] = e₀ₙ ≠ 1` for nontrivial `R`. | true |
| 7.2–7.3 | finite `P/Z` gives discrete `Hom` (AGD *Finitely generated `C`*); sheared `∏_ℕ ℤ/2` example as at AGD head; trivial action on `B` gives cocycle `0`. `δ[c] = [γ ∪ c]` with `γ` first (AGD head lines 876–883). | citations resolve (except the name in S01) |
| 7.4 | `ℚ₂, p = 3`: `μ₃ = 1`, `H² = 0`; `ℚ₇, p = 3`: `H² ≅ ℤ/3`; `𝔽₂((t))`: declared gap; `p = 2`, char `≠ 2`: `μ₂ ⊆ K`, never easy. Duality: `H²(K, ℤ/p) ≅ Hom(H⁰(K, μ_p), H²(K, μ_p))`. | true |
| 7.5–7.7 | HW lines 867–926: `∂[β] = −α̃*η`, pointwise product homomorphism (expansion at line 879–880); (i)–(iii) with `u₀ = u′₀ ≠ 0` in HW, normalized to `1` here by rescaling `(u, v) ↦ (cu, c⁻¹v)`; `ρ_{v,u}` occurs at HW lines 915, 925 (the recorded misprint). | match the source |
| 8.1 | trivial `𝔽₂`: `x ∪ x ≠ 0`; free `𝔽₂[C₂]`: `ker t = im t` of order 2, `H¹ = 0`; class of a 2-cocycle on `C₂` read at `(σ,σ)` since `N = 0` on `𝔽₂`. | pairing perfect |
| 8.2 | `ℚ` countable, excluded; `Γ_ℂ = 1`, `Γ_ℝ = C₂`. | true |
| 9.1–9.7 | `(−u,1)(a,χ)(u,1) = (a + g·u − u, χ)` expanded; `R = ℤ/4`, `N_i = ℤ/2`, `n = 3`: `U(W) = U₄(𝔽₂)`, `64 ≠ 4096`; corner action `d₀ f d_n⁻¹`; 9.5 sign-action witness `d⁰1(σ) = −2 = 1` in `𝔽₃`; 9.7 at `n = 3`: three summands, external sum would have four. HW line 1189–1195 displays the external `⊕` (recorded error). | consistent with HW §7 |
| 10.1–10.3 | `p = 2`: `K′ = K`; `ℝ, p = 3`: `K′ = ℂ`; non-`p`-primary failure: `H²(ℝ, ℤ/2) = ℤ/2 → H²(ℂ, ℤ/2) = 0`. | Checks true |
| 11.1–11.2 | `e₀₁e₁₂e₀₁⁻¹ = e₀₂e₁₂`; `e₀₁e₁₃e₀₁⁻¹ = e₀₃e₁₃`; `e₂₃e₀₂e₂₃⁻¹ = e₀₂e₀₃⁻¹` (expanded). Boundary of `−1`: lift `f(e₀₃) = −1`, `f(e₀₂) = f(e₁₃) = 1`; `(σf − f)(e₀₂) = (−1)^{χ₂₃(σ)}`, `(σf − f)(e₁₃) = (−1)^{χ₀₁(σ)}`; Kummer classes `[(2q)⁴] = [16q⁴]` and `[p⁴]` in the order `(02, 13)`. | matches HW line 1243–1245 |
| 11.3–11.6 | `x⁸ − 16` factorization: roots `√2, √−2, 1 + i` give `16`; one of `2, −2, −1` is a square in every `ℚ_v`, `v` odd, and in `ℝ`. At `2`: `p, q` squares, `([16q⁴],[p⁴]) = ([16],[1])`. Globally `v₂(16) = 4`, `v_p(p⁴) = 4`. `L_w ∋ √2q, √q ⇒ √2`. Invariance equations match HW lines 1268–1273; `([16],[1],[1])` invariant with trivial `C`-action on `Ш¹(L, μ₈) ≅ ℤ/2`. | true |
| 11.7–11.10 | duality of `f_*` and `f^D_*` (S03 for the citation); exactness gives `χ₁₂` with `δχ₁₂ = η ≠ 0`, local boundaries `0`; split `U₈ = P₈ ⋊ C`, `z(gh) = β(g)β(h)s(πh)⁻¹s(πg)⁻¹ = z(g)·^{s(πg)}z(h)`. | true |
| Conventions | `[e₀₁(1), e₁₂(1)] = e₀₂(1)` is Tau Ceti's `commutatorElement_transvectionUnit` (`⁅x,y⁆ = xyx⁻¹y⁻¹`); reverse form `e_kj(−dc)` matches 2.2's minus sign; `Uᵐ = superdiagonalSubgroup (m+1)` matches the pin's `j < i + r` membership. | consistent |

### Supplier ledger

| Supplier (where read) | Cited for | Found |
|---|---|---|
| ProfiniteCohomology, main | Layers 0, 1, 2, 3 (finite-group comparison with `groupCohomology`), 5 (connecting maps), 6 (corestriction), 8, 9 (`kummerIso`, `n` invertible), 10 (`cor ∘ res`, Shapiro), 11 (`cd_p`), 12 (associativity and graded commutativity) | all present at the cited layers; Layer 9 header is the gap's section string |
| DGAInfinity, main | Layer 1 DG algebras and DG categories; Layer 8 matric Massey products with indeterminacy | present; header strings exact |
| ProfiniteProPGroups, Completed | Layer 5 extensions classified by `H²`, splitting iff zero, finite embedding problems | present (lines 139–144, 191 of that layer) |
| ClassFieldTheory, main | Layer 5 local Tate duality for finite modules | present (line 159–163 of that layer, with the discrete-topology hypothesis) |
| ArithmeticGaloisDuality #858 | §R02.1.4 four sub-targets; §R02.3.0d (`Ш^i`, Cartier dual, maps of coefficient modules induce maps on kernels); §R02.4.5a (3); §R02.4.5b (`Ш¹(ℚ, μ₈) = 0`, `Ш²(ℚ, ℤ/8) = 0`, order-two alternative) | present; S01 (name) and S03 (naturality location) |
| InverseGaloisAndArithmeticFundamentalGroups #850 | §IG.4.1 (any profinite source, non-surjective `π`, torsor under `H¹(Π, A_π)`, naturality of pullback); §IG.4.2 twisting (global field, surjective) and the two cyclic degree-eight lifts (`p ≡ q ≡ 1 (mod 8)`, `ℚ(√p)`, `ℚ(√2q)`, surjective onto `(ℤ/8)²`, degree 64, three quadratic subfields) | present, hypotheses as cited |
| K2SymbolsBrauer #1302 | §6.14 lexicographic unique factorization, `m ≥ 3`, commutative ring | present; S02 (declaration name) |

### Pinned declarations (Mathlib `f6090c7`, Tau Ceti `358314d4`)

Mathlib: `IsNonarchimedeanLocalField` (NumberTheory/LocalField/Basic.lean:45, extends `IsValuativeTopology`, `LocallyCompactSpace`, `ValuativeRel.IsNontrivial`), `ValuativeRel`, `Field.absoluteGaloisGroup`, `continuousCohomology` (ContCohomology/Basic.lean:131), `TopRep.resolutionX` (:54), `TopRep.homogeneousCochains` (:113), `ContinuousCohomology.tateShafarevich` (Sha.lean:71), `groupCohomology` (:184), `groupCohomology.map` (Functoriality.lean:141), `Rep.trivial` (Rep/Basic.lean:288), `Rep.res` (Rep/Res.lean:42), `ConjClasses`, `IsConj.pow` (Conj.lean:52), `CharacterModule.dual_surjective_of_injective` (CharacterModule.lean:101, namespace `CharacterModule`), `DiscreteTopology (ZMod N)` (Topology/Instances/ZMod.lean:26), `IsTopologicalGroup`, `Subgroup.normalClosure_normal`. Tau Ceti: `upperUnitriangularGroup` (:107), `UpperUnitriangularGroup.ext` (:153), `.map` (:177), `superdiagonalSubgroup` (Nilpotent.lean:137), `mem_superdiagonalSubgroup_iff` (:181), `superdiagonalSubgroup_eq_bot_of_le` (:210), `commutator_superdiagonalSubgroup_le` (:220, inclusion only), `upperTriangularGroup` (:55), `UpperTriangularGroup.diag` (:131), `diagonalHom` (:147), `ker_diag` (:214), `upperUnitriangularGroup_le_upperTriangularGroup` (:190, namespace `TauCeti.UpperTriangularGroup`), `Matrix.IsUpperUnitriangular` (Triangular.lean:85), `transvectionUnit` (Transvection.lean:144), `commute_transvectionUnit` (:212), `commutatorElement_transvectionUnit` (:248), `…_reverse` (:256), `transvectionUnit_mem_upperTriangularGroup` (UpperTriangular/Transvection.lean:34), `AbsoluteGaloisGroup` (abbrev, Krull topology; :312), `absoluteGaloisGroupEquivFixingSubgroup` (Extension.lean:181), `finiteExtension_isNonarchimedeanLocalField` (FiniteExtension/Basic.lean:207), `KummerCoeff` (Coefficients.lean:126), `ClassFieldTheory.dualityMap{0,1,2}_kummerCoeff_bijective` (FiniteModule.lean:253, 260, 267), `h2MuEquivZMod` (RootsOfUnity.lean:89), `FiniteEmbeddingProblem` (:60, surjective `π`), `.obstruction` (:87), `.exists_isSolution_iff_obstruction_eq_zero` (:110), `FactorSet.exists_cohomologyClass_eq` (:261), `FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` (:319), `exists_continuous_section` (Section.lean:230), `InternalHom` (:308), `homAction` (:165), `InternalHom.evalPairing` (:350), `ContCohomology.C1, d0, d1, Z1, Z2, B1, B2, H1, H2, DiscreteH1, B1_eq_bot_of_smul_eq_self` (LowDegree.lean), `explicitH1AddEquivContinuousCohomology`, `explicitH2AddEquivContinuousCohomology`, `explicitCup11` (Cup/Product.lean:595), `explicitCup11_eq_zero_iff` (Heisenberg.lean:181), `IsHeisenbergCochain` (:91, coboundary `−(a ⌣ b)`), `H1pi_eq_zero_iff_exists_smul_sub_eq` (FiniteCyclic.lean:94), `explicitH2CyclicEquiv` (:381), `dualityMap1` (Duality/Basic.lean:454), `ContinuousCohomology.corestriction_res` (AllDegrees.lean:173), `isIso_shapiroMap` (Shapiro/AllDegrees.lean:208), `IsDGAlgebra`, `DGCategoryData`, `DGCategory`. The three imported modules exist.

## Not verifiable

- No Lean was run (read-only brief; the worker's elaboration failed on a missing object file). The signatures were checked by reading against the pinned definitions; the repair report's `#check` run was at the previous pins, so no fresh elaboration at Mathlib `f6090c7` / Tau Ceti `358314d4` exists.
- Dwyer, Theorem 2.4: uncertified in the manifest; cited through HW Proposition 2.2.
- Michailov Theorem 3.1, Case II (4.4), and HW Proposition 6.1's case analysis were read against the source but not recomputed beyond the `Θ_Q` values.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep` over the index of 2026-11-04.
- The two declared gaps are conditional inputs; their minimality was checked against main, not their future form.

## Source issues

- **Error** in HW at Definition 3.2 and Lemma 4.7, printed pp. 9, 14: the source says the outer exponent of `U¹` equals `p` for `2 ≤ n ≤ 6`; it should be `1` at `p = 2` under its own least-divisor definition, the factorization through `(ℤ/p)ˣ` being what holds; affects a stated result.
- **Misprint** in HW at proof of Lemma 4.7, printed p. 14: the source says the exponent of `U¹` is divisible by `9`; it should be divides `9`; affects the proof.
- **Misprint** in HW at proof of Proposition 5.3, printed p. 19: the source says the easy-case homomorphism lifts to `Z`; it should be lifts to `U`; affects the proof.
- **Misprint** in HW at proof of Proposition 5.3, printed p. 21: the source writes `ρ_{v,u}` twice; it should be `ρ_{u,v}`, row first; affects the proof.
- **Gap** in HW at Proposition 5.3 and proof of Theorem 5.1, printed pp. 19, 22: the source proves the proposition for nonarchimedean fields and applies it at every place; it should supply the real and complex cases; affects the proof.
- **Error** in HW at Lemma 5.5, printed p. 19: the source says the sections form a torsor under the discrete module `Hom(C, A)` for any discrete `C`; it should assume `C` finitely generated or use the pointwise topology; affects the proof.
- **Error** in HW at Proposition 7.3, printed p. 26: the source says all defining systems of the classes correspond to lifts of one adjacent character; it should fix the adjacent cocycles; affects a stated result.
- **Misprint** in HW at proof of Lemma 4.13, printed p. 17: the source writes the last factor as `e₀₃` with parameter `1`; it should be `a₂`; affects the proof.
- **Misprint** in HW at proof of Proposition 6.1, printed p. 23: the source says the endpoint-zero subgroup is a copy of `4 × 4` unitriangular matrices; it should be `5 × 5`; affects the proof.
- **Error** in HW at §7, printed p. 28: the source displays `P_{r,s}` as an external direct sum of the two boundary parts; it should be their internal sum meeting in the corner; affects a stated result.
- **Misprint** in Michailov at §3 after (3.2), printed p. 5: the source says `γ_{n−1}(UT_n)` is trivial; it should be the corner subgroup, with `γ_n` trivial; affects a stated result.
- **Misprint** in Michailov at Theorem 3.1, Case II, printed p. 8: the source uses a distance-one element in the minimal wedge; it should use two distance-`ℓ` elements of the group; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f88d25fd07db6e429e218b909e5fd6264b1ebbfc", "job": "RT-ProfiniteCohomologyPartII~2b", "model": "fable", "worker": "chris-x10"} -->
