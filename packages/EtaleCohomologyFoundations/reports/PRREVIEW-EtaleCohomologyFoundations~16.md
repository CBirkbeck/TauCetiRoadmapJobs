# Review of EtaleCohomologyFoundations (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 85 changed lines since `aecb53a`. The review checked the two added sections (§F.2.5a, compact-support cohomology of a quotient by a finite group, and §F.10.4a, equivariant perfectness for a free action) against Dudas–Michel, Illusie–Zheng, SGA 1 and SchemeAndStackFoundations §1.17, with computed examples. It also checked the edited guide, scope paragraph, supplier row and references. There is one finding. §F.10.4a states Illusie–Zheng's theorem only over an algebraic closure of a finite field. The source proves it over every algebraically closed field, and neither the route of §F.10.4a nor the route of §F.2.5a, which supplies its quotient, uses a finite field. There are three small corrections and one format note, none blocking. One fact about an unpublished source is left for the human reviewers.

## R01 (P2) — §F.10.4a states Illusie–Zheng's theorem only over an algebraic closure of a finite field, though the source proves it over every algebraically closed field and the route never uses a finite field

This section is the general roadmap's statement of equivariant perfectness for free actions. As written, no consumer working over another algebraically closed field (for example `ℚ̄`, or the `k̄` of §F.10.4) can use it. It does not even contain §F.10.4. The Kummer `C_ℓ`-torsor `t ↦ t^ℓ` on `𝔾_m` over `ℚ̄` is covered by §F.10.4 and by Illusie–Zheng 3.2 (b), but the first hypothesis of §F.10.4a (line 2228) excludes it. Yet the route presents §F.10.4a as §F.10.4's argument "over the quasi-projective base `X/Γ` in place of a smooth affine curve" (line 2242).

The setting of Illusie–Zheng 3.1 (illusie-zheng-odds-and-ends line 790–791) is an algebraically closed field `k` of characteristic exponent `p`, with `X` a separated algebraic `k`-space of finite type. In that setting Theorem 3.2 (b) (line 798) gives perfectness of `RΓc(X, ℤ_ℓ)` over `ℤ_ℓ[G]` for a free action. The route (lines 2240–2252) uses four inputs: `π` is a finite étale torsor; the projection comparison; finiteness and boundedness from §F.3; and the limit of §F.4.4. All four are stated over a separably closed field. The quotient that §F.10.4a takes from §F.2.5a needs no hypothesis on the field either: SGA 1 V 1.8 (sga1 line 3710–3730) and SchemeAndStackFoundations §1.17 (`finiteGroupQuotient_projective`, over any Noetherian base) provide it. Only the cohomological clause of §F.2.5a carries a restriction to `𝔽̄_q`, inherited from Dudas–Michel (dudas-michel-2015 line 971–973). That restriction is the source's own, but the route of §F.2.5a does not use it either.

The smallest change is to replace "an algebraic closure of a finite field of characteristic p" with "an algebraically closed field of characteristic exponent p". Make the replacement at line 2228, and also in §F.2.5a at line 1703, at least for the existence clause that §F.10.4a uses. Dudas–Michel would stay as the locator of the `𝔽̄_q` case in §F.2.5a. Optionally, `X` could be widened from quasi-projective to separated of finite type, using Illusie–Zheng's induction on dimension (line 817–818).

## C01 — Illusie–Zheng's (3.2.1)–(3.2.2) are stated for `RΓ`, not for the `RΓc` that §F.10.4a cites them for

At lines 2236–2238 and 2251–2252 the README cites "Theorem 3.2 (b) and (3.2.1)–(3.2.2), for `RΓc(X, ℤ_ℓ)`". Theorem 3.2 (b) does cover `RΓc` (illusie-zheng-odds-and-ends line 798). The two displayed formulas, however, concern ordinary cohomology (lines 809–813). The paper treats `RΓc` in one closing sentence: the proof is analogous once `X/G` is made a separated scheme by induction on `dim X` (lines 817–818). A reader who opens (3.2.1) to check the `RΓc` claim therefore finds a statement about `RΓ`. A more accurate locator would be "(3.2.1)–(3.2.2), stated for `RΓ`, and the last sentence of the proof of 3.2 for `RΓc`". The derived reduction to `Λ[Γ]` is (3.2.2) with `M = Λ[Γ]`, or equally §F.4.4.

## C02 — The pinned Tau Ceti already has the torsor and quotient steps of both routes, and neither the routes nor the supplier table name them

The route of §F.10.4a cites only Mumford §7 for the step "free action ⇒ finite étale `Γ`-torsor" (line 2240), and Mumford is not openly readable. On `Γ`-stable affine opens, the pinned Tau Ceti already has this step:
- `TauCeti.AffineInvariantQuotient.isFinite_projection_of_free` and `TauCeti.AffineInvariantQuotient.etale_projection` (`TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Free.lean`, lines 46 and 54);
- the torsor square `TauCeti.AffineInvariantQuotient.isPullback_of_free` (`Torsor.lean`, line 94).

These declarations use scheme-theoretic freeness: for `g ≠ 1`, the elements `g • a − a` generate the unit ideal. Over an algebraically closed field this is the same as saying that no closed point is fixed.

The route of §F.2.5a needs two more facts, both also in Tau Ceti:
- that `π` is finite: `TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType` (`FiniteGroup/Affine.lean`, line 78);
- that `Γ` is transitive on geometric fibres: `TauCeti.AffineInvariantQuotient.exists_comp_specComap_eq` (same file, line 112).

Naming these in the two routes and in the Tau Ceti row of the supplier table (line 2350) would spare an implementer from proving them again.

## C03 — The description's claim that each addition keeps its source's generality does not hold for §F.10.4a

The description says the general roadmaps receive sections "each a theorem published before 20 November 2026 and stated in the generality of its source". §F.10.4a is narrower than Illusie–Zheng (R01). If R01 is repaired, the sentence becomes true as it stands. Otherwise it needs a qualification: "except EtaleCohomologyFoundations §F.10.4a, which keeps the restriction to `𝔽̄_q` of the roadmaps that use it".

## N01 — The list of consumers (line 2299) omits the three roadmaps that cite the new sections

The list leaves out EtaleDualityAndPerverseSheaves §7.6, ReductiveGroups Layer 9F and FiniteReductiveGroups, which are the citers of §§F.2.5a and F.10.4a. Adding them would help a reader.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §F.2.5a existence of `X/Γ` | `Γ = 1`; `𝔾_m`, `x ↦ −x`; `𝔾_m`, `x ↦ x⁻¹`; `X = ∅` | `X`; `k[x^{±1}]^{μ₂} = k[x^{±2}]`, so `𝔾_m`; symmetric Laurent polynomials `= k[x + x⁻¹]` (`xⁿ + x⁻ⁿ ∈ ℤ[t]`), every `p`; `∅` | holds | none |
| §F.2.5a formula, Check 1 | `𝔾_m`, `μ₂`, `p ≠ 2` | `H¹_c = coker(ℚ̄_ℓ → ℚ̄_ℓ²) = ℚ̄_ℓ`, action trivial; dimensions `(0, 1, 1)` on both sides | Check true | none |
| §F.2.5a formula, Check 2 | `𝔾_m`, `x ↦ x⁻¹` | the swap on `ℚ̄_ℓ²/diagonal` is `−1`, `+1` on `H²_c`; invariants `(0, 0, 1)` equal `H_c(𝔸¹)` | true for every `p` | none |
| §F.2.5a coefficients (negative control) | `𝔾_m`, `x ↦ x⁻¹`, coefficients `𝔽₂`, `p ≠ 2` | `H¹_c(𝔾_m, 𝔽₂)^Γ = 𝔽₂` because `−1 = 1`, but `H¹_c(𝔸¹, 𝔽₂) = 0` | `ℚ̄_ℓ` (`|Γ|` invertible) is needed; the statement has it | none |
| §F.2.5a compatibility with `g` | `Γ = μ₂`, `g: x ↦ x⁻¹` (commutes with `Γ`) | `g` descends to `y ↦ y⁻¹` on `X/Γ = 𝔾_m`; `−1` on `H¹_c(X/Γ)` and on `H¹_c(X)^Γ` | holds | none |
| §F.10.4a perfectness, Check 1 | trivial torsor `Γ × Y` | `RΓc = Λ[Γ] ⊗_Λ RΓc(Y, Λ)`; `RΓc(Y, Λ)` is `Λ`-perfect (§F.3) | Check true | none |
| §F.10.4a, Check 2 | point with trivial `C_ℓ`, `Λ = 𝔽_ℓ` | `Tor_i^{𝔽_ℓ[C_ℓ]}(𝔽_ℓ, 𝔽_ℓ) = H_i(C_ℓ, 𝔽_ℓ) = 𝔽_ℓ` for every `i`: unbounded | Check true; agrees at `ℓ = 2` with the Check of §F.10.4 | none |
| §F.10.4a with `|Γ|` invertible | free `ℤ/p` on `𝔸¹` by `x ↦ x + 1`, `ℓ ≠ p` | `RΓc = Λ(−1)[−2]` with trivial action, projective over `Λ[ℤ/p]`; `χ_c = 1`, not divisible by `p`, consistent because ranks need not be constant | holds | none |
| §F.10.4a perfectness route | finite ring `Λ[Γ]`, Tor amplitude in `[0, 2 dim X]` | `coker(P⁻¹ → P⁰)` is flat and finitely presented, hence projective; the truncation is bounded | sound | none |
| §F.10.4a derived reductions | `ν = 2`, `μ = 1`; `ℤ_ℓ[Γ] → Λ[Γ]` | `⊗ᴸ_{(ℤ/ℓ²)[Γ]} 𝔽_ℓ[Γ] = ⊗ᴸ_{ℤ/ℓ²} 𝔽_ℓ` gives `RΓc(X, 𝔽_ℓ)` (§§F.3, F.4.4); the `ℤ_ℓ` case is the same | holds | none |
| §F.10.4a generality | Kummer `t ↦ t^ℓ` on `𝔾_m` over `ℚ̄` | covered by §F.10.4 and by Illusie–Zheng 3.2 (b); excluded by §F.10.4a's hypothesis on the field | narrower than its source | R01 |
| §F.10.4a locator | illusie-zheng-odds-and-ends lines 790–818 | 3.2 (b) covers `RΓc`; (3.2.1)–(3.2.2) concern `RΓ`; `RΓc` is "analogous" (lines 817–818) | imprecise | C01 |
| Dudas–Michel Proposition 13.6 (i) | dudas-michel-2015 lines 2636–2643, 971–973 | `H ⊂ Aut X` finite, `g` of finite order in the centraliser; `H^i_c(X)^H ≅ H^i_c(X/H)` as `ℚ_ℓ[g]`-modules; quasi-projective over `𝔽̄_q` | matches §F.2.5a | none |
| SGA 1 V §1 | sga1 lines 3634–3730 | 1.1: fibres are orbits; 1.5: `X` finite over `Y`; 1.8: a quotient exists iff `X` has a `Γ`-stable affine cover | supports the existence clause | none |
| SchemeAndStackFoundations §1.17 | main README, line 3450 | `finiteGroupQuotient_projective`: Noetherian `S`, `Y` projective, any finite `Γ`; `Y/Γ` is projective | supports "`X̄/Γ` projective" | none |
| Torsor step of the routes | Tau Ceti `Free.lean` lines 46 and 54, `Torsor.lean` line 94 | affine free quotient: finite, étale, torsor square, at the pin | the route cites Mumford only | C02 |
| §F.4.4 vanishing (seeded; §F.10.4a relies on §F.4.4) | `ℙ¹`; bhatt-scholze-proetale line 1924 | `H² = lim ℤ/ℓⁿ = ℤ_ℓ ≠ 0` at `2 = 2 dim`; `H³`: the `lim¹` of the finite groups `H²(ℤ/ℓⁿ)` vanishes | holds | none |
| Headline `nagataCompactification` | `𝔸¹ → Spec k` | factors as `𝔸¹ ⊂ ℙ¹ → Spec k` | holds | none |
| Headline `arithmeticExactSequence` | `X = Spec k` | `1 → 1 → G_k → G_k → 1` | holds | none |
| Headline `etaleCohomologicalDimension` | `ℙ¹`, `ℤ/ℓ` | `H² = ℤ/ℓ(−1) ≠ 0` at `2 = 2 dim`; `H³ = 0` | holds | none |
| Headline `affineArtinVanishing` | `𝔸¹` in characteristic `p`, `ℤ/p` | `H¹ ≠ 0` (allowed, `1 = dim`); `H² = 0` | holds | none |
| Headline `finite_H_constantSheaf` | `𝔾_m`, `ℤ/n` with `n` invertible | `H¹ = ℤ/n`, finite | holds | none |

- Source locators checked against the text: 8, namely dudas-michel-2015 13.6 (i) with its §6 convention, illusie-zheng-odds-and-ends 3.1, 3.2 (b) and (3.2.1)–(3.2.2), sga1 V 1.1, 1.5 and 1.8, and bhatt-scholze-proetale 5.6.2.
- Library declarations opened at the pinned Tau Ceti (`2fd255d`): `Quotient/Affine.lean`; `Quotient/FiniteGroup/Affine.lean` lines 59–112; `Free.lean` lines 46 and 54; `Torsor.lean` line 94; `Relative.lean`.
- Cross-roadmap citations resolved: SchemeAndStackFoundations §1.17 on main (lines 3417–3536); the citers of §§F.2.5a and F.10.4a in EtaleDualityAndPerverseSheaves §7.6, ReductiveGroups and FiniteReductiveGroups at this head; the original statement in FiniteReductiveGroups on main (lines 932–938).
- Record: no section id removed or retitled; two sections added; `Suggested.lean` unchanged since the merge base.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gave six `declaration uses 'sorry'` warnings and nothing else.
- Seeded sample: of its fifteen targets only the two of §F.4.4 bear on the change, since §F.10.4a relies on that section. Both were checked; the others lie in untouched, unaffected text.
- Overlap check: the review read ClassicalAdicEtaleCohomology, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles and InverseGaloisAndArithmeticFundamentalGroups on main, and SchemeAndStackFoundations on main and at its open head. Quotients of projective schemes by finite groups are owned by SchemeAndStackFoundations §1.17, which is cited. The compact-support quotient formula and free-action perfectness are owned here: they moved from FiniteReductiveGroups, which now cites them. EtaleDualityAndPerverseSheaves §7.6 and InverseGaloisAndArithmeticFundamentalGroups (a route sentence on curves, covered by §F.10.4) consume them. Nothing else is shared.

Source independence: changed passages only. Six passages were compared with three sources: dudas-michel-2015 lines 2636–2643 against the statement and route of §F.2.5a; illusie-zheng-odds-and-ends lines 790–818 against the statement and route of §F.10.4a; sga1 lines 3710–3730 against the existence clause of §F.2.5a; and the Checks of §F.2.5a against dudas-michel-2015 §13. The longest shared run is 6 words, the forced phrase "perfect complex of `ℤ_ℓ[G]`-modules". In the changed passages the largest shares belong to illusie-zheng-odds-and-ends and Mumford, with 2 of 6 locators each. Arrangement not compared: two sections were inserted and no layer was added, removed or reordered.

Research link: the roadmap builds the foundations, from SGA 4, SGA 4½ and Bhatt–Scholze (2015), that Deligne's Weil II (1980) rests on. The added §§F.2.5a and F.10.4a are cohomological inputs of Deligne–Lusztig character theory (Deligne–Lusztig 1976, via EtaleDualityAndPerverseSheaves §7.6), and §F.10.4a is Illusie–Zheng (2013) Theorem 3.2 (b). Rests on the README's references and illusie-zheng-odds-and-ends lines 802–818.

## Not verifiable

- D. Mumford, *Abelian varieties* (1970), §7, cited in the routes of §§F.2.5a and F.10.4a: there is no legal open copy, the manifest does not record it, and it is not in the sources cache. The quotient facts it is cited for were checked in SGA 1 V §1 and in the pinned Tau Ceti instead.
- The published version of Illusie–Zheng (Int. Math. Res. Not. 2013) is behind a paywall. The review read arXiv v3, which is the version the README links.

## Source issues

- none

## For the human reviewers

- The cohomological clause of §F.2.5a (README line 1712) has a single locator: Dudas–Michel's 2015 Beijing lecture notes (dudas-michel-2015, on an author's page), which are not a refereed publication. Its other text, Mumford §7, is not openly readable.
