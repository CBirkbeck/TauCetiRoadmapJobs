<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16344#issuecomment-6896440610 -->
Review (claude) of 2541e33

Verdict: accepted
Conditional on the announced gaps: `clifford-multiplicity-dvd-index`

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding. The single round-6 finding is repaired, and the passages the repair added hold on every instance computed below. The acceptance is conditional on the one declared supplier gap, `gap:clifford-multiplicity-dvd-index` (InductionRestriction Layer 7). Elaboration: not available (this lane does not elaborate); the package is at the design stage and has no `Suggested.lean`, so no Lean command was run.

## Verified sound

### The round-6 finding, checked first

- **F01 (Layers 6–8 stated at a group's own system and used at the ambient one) — repaired.**
  - `design/README.md` §6.3, lines 1055–1080, the new bullet: “Change of level … let `H` be a finite group, `e` a positive multiple of `exp(H)`, `v` a place of `ℚ(ζ_e)` over `p`, and `w` the place of `ℚ(ζ_{exp H}) ⊆ ℚ(ζ_e)` below `v` … scalar extension `e_B ↦ 1 ⊗ e_B` is a bijection from the blocks of `k_w[X]` to those of `k_v[X]`”, with `a_B`, `λ_B`, defect classes, `Br_P`, defect groups, block induction, covering, `Irr`, `IBr`, decomposition numbers, heights, `Irr₀` and the Brauer correspondent preserved.
  - Conventions, lines 183–188: “A statement of Layers 6–8 about a subgroup, a quotient or a quotient of a subgroup `H` of `G` … is read at this system of `G`; it follows from the same statement for `H` at the place of `ℚ(ζ_{exp H})` below `v` by the change of level of §6.3”.
  - *Needs:* §6.3 is now on §§6.4, 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 8.2, 8.3, 8.4 and 9.2 (lines 1121, 1163, 1205, 1251, 1287, 1313, 1334, 1392, 1415, 1437, 1496). §7.3 (line 1256) and §7.5 (line 1316) carry the compatibility bullets.
  - Plan: 6.3 has the API entry `blocks_changeOfLevel`, three new tests and the base prerequisites §§1.3, 2.1, 2.3, 2.4, 4.1, 6.1, 7.1, 8.2; `target:6.3` is a prerequisite of 7.1, 7.2, 7.3, 7.5, 7.6; 7.3 has `dominates_changeOfLevel`; 9.2 reads `Irr₀(b')` through 6.3. No cycle: 6.3 needs only 6.2 and the base.
  - The repair test of round 6 (`C₂ ≤ S₃`, `Q₈ ≤ SL(2,3)`, `A₄ ≤ A₅`) is recomputed in the table below and agrees.
- No finding of the last repair report was marked not actionable. Maintainer notes: none.

### The base inputs of the repair, resolved at the head of the base's open pull request

Read ModularCharactersAndBlocks at its open head (a new roadmap folder): Conventions, §§1.1, 1.3, 2.3, 2.4, 4.1, 4.2, 6.2, 7.1, 7.2, 8.1, 8.2.

- §6.2 states the scalar extension for fields `k ⊆ k'` of characteristic `p` with `k` splitting a subgroup `H`: same blocks, the central character over `k'` extends `λ_b`, same defect classes, `Br_P(e_b)`, defect groups and principal block. This is what README lines 340–343 and 1063–1066 cite.
- §2.3 proves `rad(k[G]) = k ⊗_{k₀} rad(k₀[G])` for `k₀ = 𝔽_p(ζ_{e'}) ⊆ k`, and the bijection on simples for `k ⊆ k̄`. For `k_w ⊆ k_v`, both contain `k₀` of `X`, and `k_v ⊗_{k₀} = k_v ⊗_{k_w} (k_w ⊗_{k₀})` gives the form of README line 311.
- §2.4: “`d` commutes with `modRepK0.baseChange` and with a change of splitting modular system”.
- §1.3: `existsUnique_blockIdempotent_map_residue`, a central idempotent has a unique central lift. §4.1: `e_χ` defined over `F`. §4.2: `exists_blockIdempotent_iff_centralCharacter_congr`, `SameBlock`. §7.1: `b^G` through `λ_B(z) = λ_b(z_H)`, `brauer_first_main`. §8.2: covering through orbit sums of block idempotents, for arbitrary `N ⊴ G`. §7.2: the second main theorem for the system of §1.1. §8.1: normal `p`-subgroups.

### Principles, shape, policy

Read the README in full (1565 lines) and the plan (9 layers, 35 targets, 4 suppliers, 1 gap).

- Nine layers named by their mathematics; each ends with Examples and Dependencies. 35 `*Needs:*` paragraphs, 35 Checks blocks, none with fewer than three Checks (counted mechanically; the plan has at least three tests per target).
- No sentence says the roadmap follows a source. No LaTeX delimiter, machine path, pull-request number, round label, `set_option`, sorry'd data or algorithm (searched).
- `sources.toml`: 15 entries, distinct keys, 10 certified and 5 uncertified; unchanged this round; every work in References has an entry.
- The gap `clifford-multiplicity-dvd-index`: same slug in the plan and in the README (lines 122, 392, 1414, 1417, 1458); supplier InductionRestriction, Layer 7.
  - Precise: one statement, hypotheses `N ⊴ G`, `χ ∈ Irr(G)`, `θ` a constituent of `χ|_N`.
  - Minimal: `FDRep.clifford_restrict_dvd_finrank` (`TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean:113`) gives `dim V ∣ dim W`, `[G : inertia V] ∣ dim W` and `[G : inertia V] ∣ [G : N]`, not `χ(1)/θ(1) ∣ |G : N|`. InductionRestriction on main (Layer 7, README line 721) states no degree divisibility by the index.

### Sources: the 15 sampled targets

No locator is flagged unverified. Lines opened this round:

| Target | Lines read | Result |
|---|---|---|
| 2.1 | glauberman lines 98–104 | Theorem 1: absolutely irreducible, `|A|` prime to the degree, twists equivalent |
| 2.2 | glauberman lines 234–237, 263–264; hartley-turull lines 304–305 | Theorem 2 (a); the name “canonical extension”; the determinantal-order form |
| 2.3 | glauberman lines 173–177, 238–239 | Lemma 1 (a), (b); Theorem 2 (b) |
| 4.1 | glauberman lines 481–485, 503–523, 524–526 | Lemma 4 (`A` cyclic, normal in an operator group `B`); Definition (a), and (b) with every term normal in `A`; Lemma 5 under (b) |
| 4.3 | glauberman lines 537–543, 562–564 | Theorem 4 (b), (c); the decomposition `A = B × E` with `p = |A/A₁|` |
| 4.4 | glauberman lines 601–602, 607–609, 623–626 | Corollaries 7, 8, 9 |
| 4.5 | glauberman lines 540–541; spath-vallejo lines 118–130 | Theorem 4 (a); `π(G, A) = π(T, A/B) ∘ π(G, B)` for `B ⊴ A`, `T = C_G(B)` |
| 4.6 | glauberman lines 636–643 | Theorem 5 (a)–(d); (b) is stated there for automorphisms of `ℚ(ζ_{|GA|})`, which restrict onto those of `ℚ(ζ_{|Γ|})` |
| 5.1 | glauberman line 644 | Theorem 5 (e) |
| 5.2 | geck lines 29–36; hartley-turull lines 84–86, 91 | the statement, its completion, Theorem A, the reduction to prime order |
| 6.3 | martinez lines 718–726; reynolds lines 60–61 | numerical defect and height; Reynolds' form through the defect group |
| 7.3 | martinez lines 1895–1897, 1904–1910, 1924–1932 | Corollary 8.2, Definition 8.3, Proposition 8.4, the central-character identity, Theorem 8.5 (i), (ii) |
| 7.4 | martinez lines 1823–1830; reynolds lines 133–137, 149–151; sambale line 509 | Theorem 7.12; Theorems 1, 2; Theorem 1.19 |
| 8.1 | martinez lines 2011–2013 | Theorem 8.10, proved there by reference to navarro-1998 Theorem 5.9 (uncertified) |
| 8.3 | reynolds lines 531–540; martinez lines 2131–2132 | Theorem 8, the Schur step at line 538 (the declared gap); Corollary 8.12 |

Also read, outside the sample: martinez lines 2222–2224 (Theorem 9.2), 2265–2268, 2279–2296 (§7.5, §7.6), 1985–1988 (Theorem 8.8), 2321–2329, 2360–2361 (Layer 9, §8.4); reynolds lines 542–543 (Theorem 9); sambale lines 499–502 (Theorem 1.18). All agree with the statements.

### Adversarial pass (computed)

Rows for the changed passages, the sampled targets and the headlines. Sections not listed carry computed rows in the round-6 table and were not changed.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.3 change of level, fields | `C₂ ≤ S₃`, `p = 2`; `Q₈ ≤ SL(2,3)`; `A₄ ≤ A₅`; `e = exp(H)` | `ℚ ⊆ ℚ(ζ₃)`: `𝔽₂ ⊆ 𝔽₄`; `ℚ(i) ⊆ ℚ(ζ₁₂)`: `2` ramified in `ℚ(i)`, `e = f = 2` in `ℚ(ζ₁₂)`, `𝔽₂ ⊆ 𝔽₄`; `2` has order `2` mod `3`, `4` mod `15`: `𝔽₄ ⊆ 𝔽₁₆`; `w = v` | holds |
| 6.3 change of level, blocks biject | `C₂`, `𝔽₂ → 𝔽₄`; `C₃` from level `ℚ`, `p = 2` | one block, idempotent `1`, both sides; over `𝔽₄`, `(1 + α²r + αr²) + (1 + αr + α²r²) = 2 + (α + α²)(r + r²) = r + r²`, and `(r + r²)² = r² + r`: one block of `𝔽₂[C₃]` splits in two | holds; the non-example fails as stated |
| 6.3 change of level, `Irr`, heights | `C₂`; `Q₈`; `A₄` | `ω_1(t) − ω_sgn(t) = 2 ∈ 2ℤ₂ ⊆ m_v`; degrees `1,1,1,1,2`, `a = d = 3`, heights `0,0,0,0,1`; degrees `1,1,1,3`, `a = d = 2`, heights `0,0,0,0` | holds |
| 6.3 change of level, radical | `k₀ ⊆ k_w ⊆ k_v` | `k_v ⊗_{k_w} (k_w ⊗_{k₀} rad k₀[X]) = k_v ⊗_{k₀} rad k₀[X] = rad k_v[X]` | holds from base §2.3 |
| Conventions, new sentence | `S₃`, `p = 2`, `D = ⟨t⟩` | `Br_D(1 + r + r²) = 1` over `𝔽₂` and over `𝔽₄`; own system of `C₂` is `(ℚ₂, ℤ₂, 𝔽₂)` | holds |
| 7.3 domination, new bullet and defect groups | `S₃`, `N = C₃`, `p = 2, 3`; `S₃ × C₂`, `N = S₃`; `N = G` | `π(1 + r + r²) = 3 = 1`, `π(r + r²) = 2 = 0`; `π(1) = e₊ + e₋`; images `1`, `0`, and `|N : N ∩ D| = 3` (unit) against `6 = 0`; augmentation `1` on `B₀` only. Fibres of `G/D → G/DN` have `|N : N ∩ D|` elements | holds; not a bijection at `p = 3` |
| 7.5 regularity, extended bullet | `S₃`, `N = C₃`, `p = 2` | `λ_{B₀}(𝒞⁺_t) = 3 = 1`, `λ_{std}(𝒞⁺_t) = 0`; values in `𝔽₂`, unchanged in `𝔽₄` | holds |
| 9.2 (headline, changed) | `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `2 = 2`; `4 = 4`; `N_G(C₃)` of order `24/4 = 6`, two blocks of three characters: `3 = 3` twice | holds |
| 2.1 normalised extension | general; `Q₈`, `A = ⟨i⟩`; `Γ = 1`, `A = C₂` | `c^n` and `c^r` coboundaries, `in + jr = 1`; `h^r = h^n = 1` forces `h = 1`; `(√−1 ρ(i))² = 1`, `det = −1`, `gcd(2, 2) = 2`; trivial against sign, `det = 1` against `−1` | holds; coprimality needed |
| 2.2 canonical extension (headline) | `SL(2,3)`; `S₃`; order of a linear character | trace `−1`, det `1` at order `3`; twists have det `λ² ≠ 1`; `1` against `sgn`; trivial on `S` gives order dividing `|Γ|`, and conversely | holds |
| 2.3 values | `SL(2,3)`; `4, 3` and `4, 8` | `2, −2, 0, −1, −1, 1, 1`, all rational; `χ̂ω` takes `−ω`; `ℚ(i) ∩ ℚ(ζ₃) = ℚ`, `ℚ(i) ∩ ℚ(ζ₈) = ℚ(i)` | holds |
| 2.4 Gallagher (headline) | `SL(2,3)` over `χ₂`; `Z(Q₈)`; `N = G`, `N = 1` | `3 = 3`; `1` against `4`; `{θ}`; identity | holds; extension needed |
| 4.1 induced action, two series | `C₁₅` on `Q₈ × C₁₁`; Lemma 4 | `3⁵ = 243 = 22·11 + 1`; `C_Γ(C₃) = {±1} × C₁₁`, `C_Γ(C₅) = Q₈`; both series give `χ₂ × 1`; `χ̂(β⁻¹(a)β⁻¹(t)) = ε χ*(β⁻¹ t)` with `β⁻¹(a)` a generator | holds |
| 4.2 `p`-group case (headline) | `SL(2,3)`; `3^{1+2}_+`, `C₂`; `S = 1` | `(2 sgn + sgn)/3 = sgn`; `(3ω − ω)/2 = ω`; quotient `0` | holds |
| 4.3 independence | `C₁₅` example; `C₉` on `C₁₉` | `χ₂ × 1` twice; multiplication by `u ≠ 1` fixes only `0`: `C = 1`, `Irr_S = {1}` | holds |
| 4.4 count (headline) | `SL(2,3)`; `3^{1+2}_+`; `C₇ ⋊ C₃` with `r ↦ r⁻¹` | `2 = 2 = 2`; three fixed characters, `|Z| = 3`, classes `{1}, {z}, {z²}`; `s r⁻¹ s⁻¹ = (r⁻¹)²`, `C = ⟨s⟩`, fixed classes `{1}, sC₇, s²C₇`, the two characters of degree `3` swapped: `3 = 3 = 3` | holds |
| 4.5 Glauberman correspondence (headline) | `S = 1`; prime index `T`; swap on `C₃²`; swap on `C₂²` | identity; `π(Γ, S) = π(C_Γ(T), S/T) ∘ π(Γ, T)` fixed by induction and the `p`-group property; `ψ_a ψ_a = ψ_{2a}` on the diagonal; two invariant characters with one image | existence and uniqueness hold; coprimality needed |
| 4.6 equivariance | swap on `C₃²`, inversion, `j = 2`; kernel | `ψ_{−2a} = ψ_{2a} ∘ α⁻¹`; `ψ_{4a} = ψ_a`; `φ(K) ⊆ K` from `φ(s) • α(g) = α(s • g)` | holds |
| 5.1 degree relation (headline) | `SL(2,3)`; `3^{1+2}_+`; `θ = 1` | class of `a` has `|Γ||A|/(|A||C|) = |Γ : C|` elements; `2 ∣ 4`; `3 ∣ 9`; `|Γ : C| ∤ 1` for the reverse | holds |
| 5.2 degree-divisibility | reduction; `SL(2,3)`; abelian `Γ` | `θ*(1) ∣ μ(1) ∣ θ(1)`, `μ = π(Γ, T)(θ)`; `1 ∣ 2`, `2 ∤ 1`; `1 ∣ 1` | holds |
| 6.2 Brauer heights (headline) | `S₃`; `A₅`; `SL(2,3)`, `p = 3` | `a = d = 1`, degrees `1, 1`, and `2 ∣ 2`; `a = d = 2`, degrees `1, 3, 3, 5`, and `4 ∣ 4`; `ν₃(2) = 0`, `3 ∣ 3` | holds |
| 6.3 heights | `SL(2,3)`, `p = 2`; `S₃`, `std` | `0, 0, 0, 1, 1, 1, 0`; `ν = 1 = a`, `d(std) = 0`, no truncation | holds |
| 7.4 Fong–Reynolds (headline) | general; `S₃`, `C₃`; `S₄`, `V₄`, `p = 3` | `a_G − a_T = ν(|G : T|)`, so `h(ψ^G) = h(ψ)`; `0 = 0`; stabiliser of order `24/3 = 8`, two extensions, degree `3`, defect zero | holds |
| 8.1 vanishing | `S₃`; `SL(2,3)`, `p = 3` | `std(t) = 0`; `χ₃ = 3, 3, −1, 0, 0, 0, 0` | holds |
| 8.2 uniqueness step | `G = P C_G(P)` | `G/C_G(P) ≅ P/Z(P)`, so `p`-regular elements centralise `P`; `xu` `p`-regular only for `u = 1`; `C_{G/P}(x̄) = C_G(x)/P` | holds |
| 8.3 height formula | general; `SL(2,3)`, `p = 2` | `ν(χ(1)) ≥ ν(|G : T|) + ν(|N : D|) + ν(ξ(1)) = ν(|G : D|) + ν(ξ(1))` as `p ∤ |T : N|`; heights `{0, 1}` | holds, equality conditional on the gap |
| 8.4 Reynolds (headline) | `D₈`; `A₄`; `D = 1` | `0, 0, 0, 0, 1`; all `0`; one character | both directions hold |
| 9.1 predicate (headline) | `S₄`, `p = 2`; `G = 1` | height `1` with `D₈` nonabelian; one block of defect zero | holds |
| Gap | `N = G`; `Z(Q₈)`; nonnormal `C₂ ≤ S₃` | `1 ∣ 1`; `2 ∣ 4`; `2 ∤ 3` | precise; normality needed |

### Pins and citations resolved

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, unchanged since round 6. Reopened this round:

- Mathlib: `Ideal.exists_smul_eq_of_isGaloisGroup` (`Mathlib/NumberTheory/RamificationInertia/Galois.lean:127`), `arrowAction` (`Mathlib/Algebra/Group/Action/Basic.lean:103`), `Rep.indResAdjunction` (`Mathlib/RepresentationTheory/Induced.lean:155`), `Subgroup.exists_right_complement'_of_coprime` (`Mathlib/GroupTheory/SchurZassenhaus.lean:277`).
- Tau Ceti: `FDRep.clifford_restrict_dvd_finrank` and `FDRep.clifford_restrict_inertia_eq_top_of_coprime` (`TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean:113`, 142), `TauCeti.clifford_restrict_character` (`Induction/Clifford/Decomposition.lean:305`), `isSemisimpleRepresentation_comp_subtype` (`Induction/Clifford/Basic.lean`).
- The repair added no library name. The other declarations were opened at these same pins in round 6, whose list carries file and line.

Cross-roadmap citations, resolved now:

- ModularCharactersAndBlocks at its open head: every cited section exists (above).
- InverseGaloisAndArithmeticFundamentalGroups at its open head, earlier in the merge order: IG.3.4 (README line 3034) holds the target *Conjugacy of coprime complements* (line 3305), with `N` or `G/N` solvable and conjugacy by an element of `N`.
- CharacterTheory on main: §§2.1, 3.5, 3.6, 4.3, 4.4 (lines 349, 497, 521, 741, 760) and `fieldOfValues_eq_map_fixedField_stabilizer` (line 790).
- InductionRestriction on main: Layers 1, 2, 5, 7 (lines 241, 268, 607, 721).

Dependency gate, run on the candidate:

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after InverseGaloisAndArithmeticFundamentalGroups (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD and no CYCLE line. The citations report lists no cross-roadmap citation and no Lean name found nowhere.

### Ownership and overlaps

Read the board package index. Searched main and the open heads by object: Glauberman correspondence, canonical extension, Gallagher, Fong–Reynolds, Osima, Alperin–McKay, height zero, change of level.

- Fong–Reynolds, Glauberman correspondence, Alperin–McKay, Osima: no match outside this roadmap.
- “Canonical extension”, “height zero”, “Gallagher”, “change of level”: matches only in automorphic, arithmetic-geometric and analytic-number-theory roadmaps, on other objects.
- LocalFiniteGroupTheory (open) L3 states Glauberman's lemma on fixed points of a transitive action and the fixed-coset statement for a normal invariant subgroup. This roadmap's targets in §1.2 are the fixed-class bijection and the coset statement for any invariant subgroup; Glauberman's lemma appears only as a step of the route, proved from IG.3.4. LocalFiniteGroupTheory may not be cited as a supplier, and rounds 4–5 settled this arrangement; it stands.
- OddOrderTheorem §1.3 states Hall-subgroup and centraliser forms of coprime action, no character statement, and cites the same IG.3.4 target.
- The overlap report lists no pull request changing this roadmap, no dropped id and no id defined only by an open revision.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem, LocalFiniteGroupTheory, FiniteGroupInvariants, CharacterTheory, InductionRestriction, FiniteGroupExtensionSplitting; domination for normal `p`-subgroups, defect classes, the central character of a block and the scalar extension of blocks: ModularCharactersAndBlocks; conjugacy of coprime complements: InverseGaloisAndArithmeticFundamentalGroups; the permutation lemma for the Galois action: FiniteGroupInvariants; nothing else shared.

### Headlines and the acceptance file

Headlines, from the Summary and *How to read the build*: the canonical extension (§2.2), Gallagher's correspondence (§2.4), the `p`-group characterisation (§4.2), the counting theorem (§4.4), the Glauberman bijection with its constituent, field and degree properties (§§4.5–5.1), Brauer's theorem on heights (§6.2), Fong–Reynolds with heights (§7.4), Reynolds' theorem (§8.4), and the two predicates (Layer 9). There is no `Suggested.lean` at the design stage: no padding probe, no `#check @name` comparison, no import audit. The two new plan API names (`blocks_changeOfLevel`, `dominates_changeOfLevel`) are plan-only; the README adds no backticked name of its own.

### Copyright, licences and scope

- Wording: the 15 sampled statements and seven further passages (the change-of-level bullet, the §7.3 route, the §7.5 definition and its bullet, the §7.6 statement, the §8.2 route, the §8.4 route, the Layer 9 predicates) were set beside glauberman, hartley-turull, geck, spath-vallejo, martinez, reynolds and sambale at the lines above. The longest shared run is six words, in the extended first main theorem (martinez line 1987), which the mathematics forces. The change-of-level bullet has no counterpart in any cited source.
- Arrangement: martinez has the largest share, 38 of the 90 line locators that name their source. Its contents (martinez lines 26–61: Lectures 1–9) were set beside Layers 6–9. Layer 6 draws on Lectures 2–3; Layer 7 on Lectures 3, 4, 7, 8, 9, with §§7.2–7.6 in the order Lecture 7, 8, 7, 9, 8–9; Layer 8 on Lectures 8, 9 and on reynolds. No one-to-one run.
- Layers 2–4 share the order extension, cyclic case, solvable case with glauberman (24 locators). The dependency lines force it (§3.2 needs §§2.2–2.4, §4.1 needs §3.2, §4.2 needs §3.4), and the scopes differ: the fixed-class lemma is in Layer 1, the degree bound in Layer 5, and the uniqueness of the family is not in that paper.
- Reuse: no table, figure or list is taken over.

Source independence: 22 passages compared with 7 sources, none shared; largest share martinez, 38 of 90 locators; contents compared with martinez: independent.

## Not verifiable

- `isaacs` (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), `isaacs-1973`, `navarro-1998` (Chapter 3, Theorem 5.9), `navarro-2018` (Chapter 2), `feit` (Chapter IV): settled as uncertified, cited by locator; the texts are not available and were not requested.
- kessar-malle, mnst and ruhstorfer: outside the sample and untouched by the repair; their lines were not reread this round.
- Lean elaboration and the one-tactic probe: there is no acceptance file at the design stage.

## Source issues

- **Misprint** in martinez at §3.2, printed p. 18 (martinez line 725): the source says a character has height zero when the block's numerical defect equals the `p`-part of its degree; it should be that the `p`-part of the degree equals `p` to the power `a − d(B)`; affects a stated result.

## For the human reviewers

- **Licence.** `martinez`, the source with the largest share of locators, is unpublished course notes (Firenze 2024) read from an author page; `sources.toml` records it as certified with licence class author-page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2541e33325053e563defbbf1131e8efca127ee10", "job": "REV-DESIGN-ModularCharactersAndBlocksPartII~7", "model": "fable", "worker": "chris-x82"} -->
