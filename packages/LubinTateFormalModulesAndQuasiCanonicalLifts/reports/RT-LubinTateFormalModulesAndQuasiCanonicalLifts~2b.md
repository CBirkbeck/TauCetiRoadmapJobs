<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6860521967 -->
Red team round 2 pass b (claude) of 281d0dd

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Logarithm identities and the height are attributed to a roadmap and listed as API, but are pinned Tau Ceti declarations

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:527–529`: "Over a `ℚ`-algebra,
   the normalized logarithm `ℓ_F` of BordismFormalGroups §F1 satisfies `ℓ_F ∘ [a]_F = a·ℓ_F`, and … `ℓ_G ∘ φ = c·ℓ_F`;
   both follow from the uniqueness of additive series"; also lines 79–83 and 432.

   Claim: these identities are API to prove here from a roadmap's uniqueness statement; the height and its
   coordinate independence come from BordismFormalGroups §F1.

   Witness: pinned `TauCeti/RingTheory/FormalGroup/Logarithm/Naturality.lean:62`,
   `TauCeti.FormalGroupHom.subst_log`: `subst f.toPowerSeries G.log = coeff 1 f.toPowerSeries • F.log`; line 88
   `coeff_one_injective`; `…/Height/Basic.lean:200` `FormalGroup.height`, line 316 `TauCeti.FormalGroupHom.height_eq`.
   The "From Tau Ceti" contract lists none of them.

   Repair. Replace the bullet at 527–529 by:

   > - Over a `ℚ`-algebra, `ℓ_G ∘ φ = c·ℓ_F` for a homomorphism `φ : F → G` with linear coefficient `c` is
   >   Tau Ceti's `TauCeti.FormalGroupHom.subst_log`, and such a `φ` is determined by `c`
   >   (`TauCeti.FormalGroupHom.coeff_one_injective`); applied to `φ = [a]_F` it gives `ℓ_F ∘ [a]_F = a·ℓ_F`.
   >   Both are cited, not proved here.

   Add to "From Tau Ceti", after the `FormalGroup.log` bullet:

   > - `TauCeti.FormalGroupHom.subst_log`, `TauCeti.FormalGroupHom.coeff_one_injective` and
   >   `FormalGroup.subst_zsmulSeries_log` (`TauCeti/RingTheory/FormalGroup/Logarithm/Naturality.lean`): over a
   >   `ℚ`-algebra the logarithm is natural along homomorphisms with factor the linear coefficient, a
   >   homomorphism is determined by that coefficient, and `ℓ_F ∘ [n]_F = n·ℓ_F`.
   > - `FormalGroup.height` and `TauCeti.FormalGroupHom.height_eq`
   >   (`TauCeti/RingTheory/FormalGroup/Height/Basic.lean`): the `p`-height of a formal group law over a field
   >   of characteristic `p`, read off the first nonzero term of `[p]_F`, and its invariance under nonzero
   >   homomorphisms.

   In line 432 replace "BordismFormalGroups §F1, with its identities in §0.1" by "Tau Ceti `FormalGroup.log`
   and `TauCeti.FormalGroupHom.subst_log`, used in §0.1". In §4.3 (line 1514) replace "determines `φ` (§0.1)" by
   "determines `φ` (`TauCeti.FormalGroupHom.coeff_one_injective`)". Tested on the instance of 1a/F01: additive
   law over `ℤ₃`, `φ = 2X`: `subst_log` reads `ℓ(2X) = 2·ℓ(X)`, `6 = 2·3` at `x = 3`.

2. **F02** (P3) §6.4 cites two propositions that do not state the classification of quadratic orders

   Location: `README.md:1872–1874`: "every `O₀`-order in `O_F` is exactly one `O_s`, … conductor … `O_s^× = O₀^×(1 + ϖ₀^s O_F)`
   (G86, §5, Proposition 5.3, p.325; Y95, §5, Proposition 4, p.300)".

   Claim: both propositions support the classification, the conductor and the unit group.

   Witness: Y95 lines 305–310, Proposition 4, is the equivalence of four conditions (proper lattices free, simply
   transitive Galois action, dual free, symmetry of the `a_i`); it names no `O_s`. G86 lines 199–201 state the
   dichotomy before Proposition 5.3; Proposition 5.3(2), lines 205–209, gives only the quotient group.

   Repair. Replace the parenthesis by:

   > (G86, §5, p.325: the two cases `O′ = O` and `O′ = A + π^s O` stated before Proposition 5.3, and Proposition
   > 5.3(2) for the quotient `(O/π^s O)^×/(A/π^s A)^×`; the classification, the conductor and the unit group are
   > the integral-basis computation of the proof route)

   and delete "Y95, §5, Proposition 4, p.300" from §6.4 (it stays in §§6.3 and 6.5, where it is the statement
   used). In `sources.toml` no change: both locators remain cited elsewhere.

3. **F03** (P3) §5.3 has fewer than three discriminating Checks

   Location: `README.md:1691–1694`. Check 1 ("The zero map corresponds to `a = 0`") holds for every additive
   identification, including the one with the inclusion reversed; Check 2 is the theorem at `L₁ = L₂`.

   Witness: the wrong model `{a : aL₂ ⊂ L₁}` passes Checks 1 and 2 (`0·L₂ ⊂ L₁`; `L₁ = L₂ = T` is symmetric).
   Only Check 3 excludes it.

   Repair. Replace Check 1 by:

   > - The direction of the inclusion: for the multiplicative module over `ℤ_p`, `L₁ = T` and `L₂ = p⁻¹T`, the
   >   set is `{a ∈ ℚ_p : aT ⊂ p⁻¹T} = p⁻¹ℤ_p`. Here `a = 1` is the quotient isogeny `g_(L₂)` itself (in the
   >   coordinate where `g_(L₂) = [p]`, the series `[p]`), of degree `p` and not an isomorphism since
   >   `T ≠ p⁻¹T`, and `a = p⁻¹` is the isomorphism `G ≅ G_(L₂)`. With the inclusion reversed the set would be
   >   `{a : a·p⁻¹T ⊂ T} = pℤ_p`, which does not contain `1`: the quotient isogeny would not be a homomorphism.

   Tested on the wrong model: `1 ∈ p⁻¹ℤ_p`, `1 ∉ pℤ_p`.

4. **F04** (P3) The docstring title of `finrank_adjoin_primitive_lubinTate_root` claims an identification the statement does not make

   Location: `Suggested.lean:133–134`: "**Primitive-root presentation of the supplied Lubin–Tate fields** (LT65,
   Theorem 2, pp.383–384; README §2.3, compared with RelativeFarguesFontaine §2.5)".

   Claim: the theorem presents the fields supplied by another roadmap.

   Witness: the statement (lines 138–147) mentions only `f`, the roots of `(f.comp)^[m] X` in `AlgebraicClosure K`,
   `Module.finrank` and `IntermediateField.adjoin`; no object of RelativeFarguesFontaine §2.5 occurs, and that
   roadmap is not in the pinned libraries.

   Repair. Replace the first two docstring lines by:

   > /-- **Degree and splitting of the Lubin–Tate division fields** (LT65, Theorem 2, pp.383–384; README
   > §2.3). Let `K` be a nonarchimedean local

   (the rest of the docstring unchanged).

5. **F05** (P3) `finrank_adjoin_primitive_lubinTate_root` is stated in universe 0 only

   Location: `Suggested.lean:130`: "variable {K : Type} [Field K] [ValuativeRel K] [TopologicalSpace K]
   [IsNonarchimedeanLocalField K]", shared by both Layer 2 theorems; elaborated type "∀ {K : Type} …".

   Claim: README §2.3 states the degree and splitting for every finite extension of `ℚ_p`.

   Witness: only `TauCeti.ClassFieldTheory.artinMap` forces `Type` (pinned
   `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:106`, `variable (K : Type)`); `IsNonarchimedeanLocalField`,
   `AlgebraicClosure`, `IntermediateField.adjoin` and `TauCeti.unitFiltration` (`…/UnitFiltration/Basic.lean:93`,
   `{K : Type*}`) are universe polymorphic. The degree theorem cannot be applied to `K : Type 1`.

   Repair. Delete the section `variable` line; give the first theorem the binders
   `{K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]` and
   the second the same with `{K : Type}`, with one line in its docstring: "`K : Type` because the pinned
   `TauCeti.ClassFieldTheory.artinMap` is stated in universe 0." Re-elaborate with `#check @name` and compare.

6. **F06** (P3) Two BKO21 locators point at the wrong sections

   Location: `README.md:2222`: "(BKO21, §2, pp.947–948; §5, pp.955–959)" for the definition of `Θ_n` and `Ψ_n`
   (§8.3); `README.md:2309–2310`: "(BKO21, §4, pp.954–955; §5.0.2, pp.958–959; LT65, §1, p.383)" for formal traces
   (§9.1).

   Claim: BKO21 §2 or §5 defines the fixed fields; BKO21 §4 treats formal traces.

   Witness: BKO21 line 516 (§4, printed p.954) is where `Θ_n = Φ_n^Δ` and `Ψ_n = Θ_n^(G⁺)` are defined; §2 (lines
   225–262) has only `G^±` and `Ψ_∞`. §4 (lines 514–550) contains the Kummer pairing and one field trace
   `Tr_(Φ_m/Φ)`, no trace of formal points; that is line 736 and Definition 5.4 (p.959).

   Repair. In §8.3 replace the parenthesis by:

   > (BKO21, §4, p.954, for the fixed fields `Θ_n` and `Ψ_n`; §2, pp.947–948, for `G^±` and the characterization
   > of `Ψ_∞`; §5.0.2, p.959, for `Ψ_s ⊂ Ψ′_(s+1)`)

   In §9.1 replace it by:

   > (BKO21, §5.0.2, p.959, the trace `Tr_(s+1/s)` on formal points with Definition 5.4 and Theorem 5.5(ii);
   > LT65, §1, p.383)

   In `sources.toml`, BKO21 `locator`: "§2, pp.947–948, footnote 2; §4, p.954; Lemma 5.1, p.956; §§5.0.1–5.0.2,
   pp.955–959, Definition 5.4 and Theorem 5.5"; `cited_for` keeps "8.3" and "9.1".

Six P3 findings (S01–S06); no P1 and no P2. All eleven round-1 findings are repaired at this head and
no repair introduced an error.

## Round-1 findings at this head

| Id | State | Repaired passage (README line) | Witness recomputed |
|---|---|---|---|
| 1a/F01 (P2) | repaired | §0.3, 629–633: "for an isomorphism `φ : F → G` … with linear coefficient `c ∈ O_K^×` it satisfies `ℓ_G(φ(x)) = c·ℓ_F(x)`" and Check 651–654 | additive law over `ℤ₃`, `φ = 2X`, `x = 3`: `6 = 2·3`; it is the pinned `TauCeti.FormalGroupHom.subst_log` evaluated (see S01) |
| 1a/F02 (P2) | repaired | `Suggested.lean` 176–209, README 1505–1515 | `2ℓ − ℓ(X⁴)` for `f = 2X + X⁴`: `X⁴` coefficient `2(−1/14) − 1 = −8/7`, `v₂ = 3 ≥ 1`; `ℓ₁⁻¹∘ℓ_F` has `X⁴` coefficient `−1/14 − 1/2 = −4/7 ∈ ℤ₂` |
| 1a/F03 (P2) | repaired | `Suggested.lean` 104–122, README 753–765 | `n = 0`: `H = 0`, both sides `0`; `n = 2`, `f = g = 2X + X²`: `XY` coefficients `2` against `0` for `X + Y`; degree-`r` part `(π − π^r)H_r`, `π − π^r ≠ 0` |
| 1a/F04 (P3) | repaired | §3.2 Checks, 1232–1249 | `h = X + cX²`: law `X + Y − 2cXY`, `[a] = aX + c(a − a²)X²`, `(1 − ζ)(1 − ζ²) = 3`; `h = X + 2X²`: `1 − 4 = −3` |
| 1a/F05, 1b/F03 (P3) | repaired | table 426–488, "Former numbering / Former title / Now" | the titles cited at the open heads of ComplexMultiplicationAndExplicitReciprocityPartII (README 97), RelativeFarguesFontainePartII (83, 858, 874, 1538) and AnticyclotomicLocalUnits (14, 168, 434, 740) are rows of the table |
| 1b/F01 (P1) | repaired | §2.3, 993–1006; contracts 262–280; Check 1034–1040 | VectorBundlesAndIsocrystals README 1095–1099 defines `G_LT`; RelativeFarguesFontaine README 1296–1300 builds `E_n = E(LT[π^n])` on it; Frobenius of a height-one module over `k_K` lies in `End = O_K`, so is `[π′]`; `uπ` control: `[u⁻¹]` does not reduce to `X` |
| 1b/F02 (P2) | repaired | contracts 296–309; §3.6, 1337–1352; Check 1361–1365 | EndoscopicTransferAndUnitaryTraceComparison README 4593–4595 classifies `(G, ρ, α_m)`; `ρ∘[ϖ]` has height `h ≠ 0` |
| 1b/F04 (P3) | repaired | Conventions 123–128; Summary 22–26 | `𝔽_q[[t]]`, `tX + X^q`: height 1; quadratic `F/F₀`: `[π₀] = [π_F]^e∘[unit]`, order `q₀^(nh)` |
| 1b/F05 (P3) | repaired | §0.3, 638–641 | H70 line 241 (Theorem 1) is on printed p.218 |
| 1b/F06 (P3) | repaired | §9.3 *Needs*, 2385; Layer 9 Dependencies, 2394 | the proof route uses §§9.1, 9.2, 8.4, 8.5, 4.4, 0.3 only |

## Verified sound

Counts: 9 declarations read (2 definitions, 7 theorems), each against its elaborated type; 50 README
targets read (§§0.1–9.3) with 204 Checks, of which 199 evaluated (the five not computed: §0.2 Checks 5 and 6,
§3.3 Check 4, §3.7 Check 2, §6.1 Check 3); 73 of 88 source-locator occurrences checked for theorem number,
printed page and content against the cached texts of LT66, H70, H68, G86, Y95, VZ07 and BKO21 (69 support
their statements, 4 are S02 and S06; the 15 of LT65 are uncertified); 33 cross-roadmap section citations
resolved (on main, in `Completed/`, or at the open heads); 56 pinned declarations grepped at the pins, all
present under the names and files the README gives.

Dependency check, exact output:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Suppliers and their lines in the merge order:
RamificationOfCompleteDiscretelyValuedFields 2, FiniteFlatGroupsAndIntegralPadicHodgeTheory 66,
VectorBundlesAndIsocrystals 124, RelativeFarguesFontaine 127, EndoscopicTransferAndUnitaryTraceComparison 149,
GrossZagierAndArithmeticHeights 340; BordismFormalGroups, ClassFieldTheory, EllipticCurves, ModularCurves are
on main and LocalFieldsRamification is in `Completed/`. No declared gap. The labels `§§0B, 0C, 2B, 7C–7F` of
ModularCurves and `§2.6` of ClassFieldTheory resolve through those roadmaps' own former-label tables
(ModularCurves README 4501–4538; ClassFieldTheory README 267). The overlap lead (the open pull request of
the same name) is this roadmap's own draft: the roadmap is not on main, so there is no second copy.
Ownership: `roadmaps grep` finds no other roadmap, on main or at an open head, that constructs the
Lubin–Tate module from a series, Honda types, lattice quotients or the BKO towers; FunctionFieldArithmetic,
AnticyclotomicLocalUnits, RelativeFarguesFontainePartII cite this roadmap for them. No declaration name of
`Suggested.lean` occurs in another roadmap's Lean file.

Elaborated signatures: the nine types of the supplied listing were compared with the README statements. No
binder is lost; the only difference from the README's generality is the universe of S05. No Lean was run.

Headline theorems: Lubin–Tate theorem and interpolation (stated), degree and splitting, norm group
(stated), Honda type and Honda model over `W(𝔽_(p²))` (stated), supersingular elliptic formal group
(stated); unit formula and `Gal(K_π/K) ≅ O_K^×`, Tate module, universal deformation, general Honda theory,
quasi-canonical classification and moduli, BKO squares: each named in the module docstring with the
missing carrier. Padding probe: none of the seven theorems follows from the pins by one tactic or one
lemma; both definitions are used by kept theorems.

### Declarations

| Declaration | Context | Instances tried | Values on each side | Result |
|---|---|---|---|---|
| `IsLubinTateSeries` | `[CommRing O] [IsLocalRing O]` | `(1+X)^p − 1` over `ℤ_p`; `πX`; `pX + X^p` over `W(𝔽_(p²))`, `q = p²`; infinite residue field, `q = Nat.card = 0` | `(0, p, X^p)`; reduction `0 ≠ X^q`; reduction `X^p ≠ X^(p²)`; `X^0 = 1` contradicts constant term `0`, so empty | determines the object |
| `IsLubinTatePolynomial` | same | `πX + X^q`; `πX + X^q + X^(q+1)`; `π` a unit | monic, degree `q`, `(0, π, X^q)`; degree `q+1`; reduction `π̄X + X^q ≠ X^q` | determines the object |
| `exists_formalGroup_of_isLubinTateSeries` | DVR, finite residue field, `Irreducible π`; no completeness | `f = (1+X)^p − 1`; `f = tX + X^q` over `𝔽_q[[t]]`; uniqueness against a noncommutative `G` | `X + Y + XY`; `X + Y`, `(X+Y)^q = X^q + Y^q`; Mathlib `FormalGroup` fixes linear part `X + Y` (`lin_coeff_X`, `lin_coeff_Y`), so arity-two uniqueness gives `G = F` | true as typed |
| `exists_lubinTate_interpolation` | adds `(K) [IsFractionRing O K]` | `n = 0`; `n = 1`, `a = 0, 1`; `n = 2` over `ℤ₂`; `H′` with nonzero constant term | `0 = 0`; `0`, `X`; `(1+X)²(1+Y)² − 1` both sides; excluded by the hypothesis `constantCoeff H′ = 0`; degree `r`: `(π − π^r)H′_r` determined, `π − π^r = π(1 − π^(r−1)) ≠ 0` | true as typed |
| `finrank_adjoin_primitive_lubinTate_root` | local field, `CharZero`, `1 ≤ m` | `ℚ₂`, `2X + X²`, `m = 1, 2`; `ℚ₃`, `m = 1, 2`; `t = 0` | `1`, `2` (`X² + 2X + 2` Eisenstein); `2`, `6`; excluded by `ht′` (`f^{∘0} = X`) | true as typed (S05) |
| `artinMap_fixes_lubinTate_roots_iff` | same, `K : Type` | `m = 0`; `x = π`; `x = u`, `u ≢ 1 mod π`, `m = 1`; `ℚ_p`, cyclotomic | both sides hold for all `x` (`zpowers ϖ ⊔ U(K,0) = Kˣ`); `[1]`, fixes; acts by `[u⁻¹] ≠ id`, and `u ∉ π^ℤ U(K,1)`; `p^ℤ(1 + p^m ℤ_p)` | true as typed |
| `exists_hondaType_log_of_map_zsmulSeries` | `[Fact p.Prime] [CharZero K] [G.IsComm]` | `p = 2`, `s = 1`, `F_(2X+X⁴)`; Honda model; multiplicative group | `−8/7 ∈ 2ℤ₂`; `pX`; excluded (`[p]` reduces to `X^p`) | true: `ℓ([sp]) = sp·ℓ`, and `g₁ ≡ g₂ mod p` gives `ℓ(g₁) ≡ ℓ(g₂) mod p` since `n·a_n ∈ O` |
| `exists_strictIso_hondaLog_of_map_zsmulSeries` | same | constant term of `ℓ`; `p = 2`, `s = 1`; opposite sign | `(p − s)a₀ = 0` with `p − s ≥ 1`, so `a₀ = 0`; `−4/7 ∈ ℤ₂`; `2s/p ∉ O` for odd `p` | true (H70 Theorem 2 for `σ² = 1`, `q = p²`) |
| `exists_lubinTate_endomorphism_formalGroup` | `IsUnit W.Δ`, point count in `ℤ` | `y² + y = x³`, `p = 2`; ordinary reduction | `#E(𝔽₄) = 2 + 6 + 1 = 9 = 5 + 4`, `s = −1`; excluded by the count (`a ≠ ±2p`) | true: `(Frob − sp)² = 0`, no nilpotents |

### README targets (values computed; "no change" rows carry the instance)

| Target | Instances tried | Values | Result |
|---|---|---|---|
| §0.1 | `𝔾̂_m/𝔽_p`; `ℚ(i)` with conjugate action; `X + X^p` | `[p] = X^p`, height 1; `−i ≠ i`; `a(X + X^p) = aX + a^pX^p` | sound; S01 |
| §0.2 | closedness of `I`; `ℤ₃`, `I = 9ℤ₃` | `F(x,y) − x − y = xy·G(x,y) ∈ I` for any ideal; radical `3ℤ₃ ∋ 3 ∉ 9ℤ₃` | sound |
| §0.3 | `p = 2`, `r = 1, 2`; `ζ_p − 1` | `‖2‖ = 1/2 ≮ 1/2`, `‖4‖ = 1/4`; `log ζ_p = 0` | sound |
| §0.4 | `ℚ₂(√−1)`, `X² + 3` | root field `ℚ₂(√−3)`, unramified (`−3 ≡ 5 mod 8`) | sound |
| §§1.1–1.4 | `f = (1+X)^p − 1`, `g = pX + X^p`; `g = πX + X^q + πX²`, also `q = 2` | `c(p² − p) = p(p−1)/2`, `c = 1/2`; `c(π − π²) = π` in both cases | sound |
| §2.1 | `μ₃/ℤ₃`; `𝔽₃[ε]` | primes `(T−1)`, `(T²+T+1)`, `(3, T−1)`; `[3] = X³` | sound |
| §§2.2–2.6 | `π′ = uπ`; `Art(π′)`; `Art(π)` on `K_(π′)`; norm of `t_m` | `χ_π·η_u = u⁻¹·u = 1`; `u`; degree even unless `q = 2, m = 1`, where `K(t₁) = K` | sound |
| §§3.1–3.7 | `[1+p]` over `𝔽_p`; `X ↦ (1+εc)X`; `εX^q` | `X + X^p + X^(p+1)`; `X + Y + (1−εc)XY`; `ε(āX)^q = āεX^q` | sound |
| §§4.1–4.2 | `(p ± T²) ⋆ ℓ_(−1)`; `X + X²/p` | `0`, `2p(−p)^(−j)` (`2/p` at `j = 2`); `XY`: `−2/p`, `X²Y²`: `(−2 + 12 − 30)/p³ = −5/2` at `p = 2` | sound |
| §§4.3–4.4 | BKO21 Lemma 5.1 signs; ordinary curve | `Frob = [sp]`, parameter `sp`, type `p − sT²`; Frobenius is `[β]`, `v_p(β) = 2 ≠ 1` | sound |
| §§5.1–5.5 | unramified quadratic, line in `H[ϖ₀]`; `𝔾̂_m` | stabilizer `k_(F₀)^×`, degree `q₀ + 1` against `q₀² − 1`; `(X − c)/(1 + c)` | sound; S03 |
| §§6.1–6.6 | `L_s/T`; cubic `O₀ + ϖ₀O_F`; `a = π_F`, `L = T` | `ϖ₀^(−s)O₀ ∩ O_F = O₀`, order `q₀^s`; lengths `3 ≠ 2·1`; class `[π_F⁻¹T] = [T]` | sound; S02 |
| §§7.1–7.6 | unit counts; `ℚ₃(√3)`; `p = 5` | `(q₀²−1)q₀^(2s−2)` and `(q₀−1)q₀^(2s−1)` over `(q₀−1)q₀^(s−1)`; `[3]`: `X³` coefficient `π + π³ = 4π`, vertices `(1,2), (3,1), (9,0)`; `6, 30, 150` | sound |
| §§8.1–8.5 | subgroups for `Ψ′_s ∩ Ψ_s`, `Ψ′_sΨ_s`; `j² = 1` | product `μ_(p²−1)(1+pℤ_p)(1+p^sO)`; degree `p^(s−1)(p+1)·p^s/p^(s−1) = p^s(p+1)`; `j⁴ = 1` in a torsion-free group | sound; S06 |
| §§9.1–9.3 | `ℚ_p(√p)`; `p = 5`, `ℓ_H(x) = 25` | `N(1+√p) = 1 − p`, `1 + Tr = 1`; `[30]x`, logarithms `750`, `−750`, `−750` | sound; S06 |

Wording: 14 passages set beside the sources (§3.1 with Y95 lines 80–100 and LT66 lines 284–298; §3.3 with VZ07
lines 2878–2884; §4.1 with H70 lines 308–326; §4.2 with H70 lines 431–436 and 482–485; §5.2 with Y95 lines
117–131 and G86 lines 184–198; §5.3 with Y95 lines 139–153; §6.1 with G86 lines 77–83; §6.3 with Y95 lines
186–216; §6.6 with Y95 lines 173–183; §7.3 with BKO21 lines 715–730; §8.1 with BKO21 lines 227–238; §4.3 with
BKO21 lines 573–578; the docstring of `exists_hondaType_log_of_map_zsmulSeries` with H70 lines 738–741). No
run of more than six consecutive words is shared; shared material is formulas and standard names.

Arrangement: Y95 has the largest share, 23 of 88 locators. Its sections are 0 introduction, 1 notation,
2 liftings and the moduli space, 3 isogeny construction, 4 quasi-canonical liftings, 5 numerical invariants,
6 Newton polygon, 7 valuation functions, 8–10 proofs, 11–13 period map, 14 endomorphisms. The pairs are
`Layer 5 ↔ §3`, `Layer 6 ↔ §4` and `§7.2 ↔ §6` only: Layers 0–4, 8, 9 and §§7.3–7.6 have no counterpart, and
Y95 §§5, 7–14 have none here; Layer 5 also holds descent (§5.4) and the elliptic comparison (§5.5), Layer 6
the canonical lift, quadratic orders and the comparison with a supplier. The order 5 → 6 → 7.2 is forced by
the *Needs* lines of §6.2 (§5.2, §5.3) and §7.2 (§6.6). Reuse: no table, figure or list is taken over.

Source independence: 14 passages compared with 7 sources, none shared; largest share Y95, 23 of 88 locators; contents compared with Y95: independent. LT65 (15 locators) could not be read (uncertified).

## Not verifiable

- LT65, 15 locators (§§0.2, 0.3, 1.1–1.4, 2.2–2.6, 8.1, 8.2, 9.1): settled as uncertified; the statements were
  checked by computation, the page numbers not at all.
- The normalization of `G_LT` in VectorBundlesAndIsocrystals Layer 5 (`F = σ/π`, with a renormalization): the
  supplier states the normalization, not the series `[π]`; whether its variance gives `π′ = π` or its
  inverse-variance form is the content of the §2.3 target and cannot be read off the supplier's text.
- Elaboration: no Lean command is given for this pass; the supplied elaborated signatures were used. The
  repairs of S04 and S05 need one elaboration.
- §3.3 Check 4 (a formal-group cocycle with no compatible action correction for ramified `O_K`): no explicit
  cocycle is given and none was computed.
- Resemblance of `Suggested.lean` to a public formalisation outside the pinned libraries: no external
  repository was read.
- Ownership against open pull requests was checked through `roadmaps grep` and the five supplier heads read
  in full sections; the other open heads were searched, not read.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed page 956 (BKO21 lines 576–578): the source says Frobenius trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `p ∓ x²` and parameter `±p`, as its own proof (`φ_q = ±p`) and set-up (`a_p = 0`, parameter `−p`) require; affects a stated result.

## For the human reviewers

- **Licence.** The cached BKO21 text is headed as read from a locally held file and carries a JSTOR download stamp (BKO21 lines 26–28), while `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml` (BKO21 entry) records the CaltechAUTHORS record, `licence_class = "institutional"`.
- **Licence.** VZ07 is recorded with the address of the whole Astérisque 312 volume (227 pages); the cached text holds every chapter, of which the roadmap cites pp.57–66.
- **Not tested.** LT65, 15 of 88 locators, is uncertified: its wording and its contents were not compared with the roadmap (it is not the source with the largest share).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "281d0dddbebc8fcd941a54f0771c0ea699b94f43", "job": "RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2b", "model": "fable", "worker": "chris-x27"} -->
