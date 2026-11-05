# Review of DeligneWeightsAndPurity (pull request #929 at 6045677)

**Verdict:** accepted

Incremental re-review of the 101 lines changed since 87323d1 (the head the previous review read): the §1.6 rewrite and its new supplier contract, the §1.8 Hasse comparison, the §8.13 API and Checks, the §9.7 and Scope consumer prose, the deleted link, reference and roadmap name, and the module docstring of `Suggested.lean`. No new finding. Every previous finding is repaired without introducing a new problem, the gate passes, and the elaboration is clean.

## Previous findings

- R01 — repaired: §1.6 (`TauCetiRoadmap/DeligneWeightsAndPurity/README.md:991`) now reads “The numerical bound … is the supplied theorem of SchemeAndStackFoundations §5.11, applied over `𝔽_{q^m}`; it is not a target here”; Scope (lines 66–74) and the contract “SchemeAndStackFoundations §5.11 (the Weil bound via surfaces)” (line 463) name `weil_bound` and `genus_baseChange`; the docstring of `Suggested.lean:18–19` says the numerical curve bound is supplied by §5.11. Resolved on main (aa43542): `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7273` (§5.11, “the curve-cohomological route is a downstream comparison”), `README.md:4647` (§3.1, `genus_baseChange`), `Suggested.lean:2598` (`weil_bound`, smooth proper geometrically integral, `|#X(𝔽_q) − (q+1)| ≤ 2·genus·√q`) and `Suggested.lean:1859` (`genus_baseChange`, proper, `cohomologyDim … 0 = 1`, same genus after any field extension). The all-degrees application matches ArithmeticGaloisRepresentations §5.13 at its head (“Curve point-counting input”).
- R02 — repaired: §1.8 (line 1017) compares §1.4 with “the pinned Hasse bound `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card`, whose point-count form is `WeierstrassCurve.hasse_bound`”; the contract moved to “From Mathlib and Tau Ceti” (line 201). At Tau Ceti `a91d3aa`: `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:52` (`W.frobeniusTrace ^ 2 ≤ 4 * Nat.card F`), `:65` (`(#Point − (q+1))² ≤ 4q`, count on Mathlib’s point type, so including infinity), `PointCount.lean:115` (`frobeniusTrace = q + 1 − Nat.card Point`). The claim “proved without `sorry`, through the degree of `rπ − s`” holds: `HasseBound.lean` and `Isogeny/Frobenius/Trace.lean` contain no `sorry` token, and the private lemma at `HasseBound.lean:42` is the degree of `r π − s`.
- R03 — repaired: no occurrence of “StandardConjectures”; Scope (line 30) and §9.7 (line 3078) describe the consumer without a name and cite EtaleDualityAndPerverseSheaves, which at its open head says “the extension to an abelian category with Tate twist is constructed here” and takes the vector-space primitive decomposition from this roadmap.
- R04 — repaired: line 310 reads “AutomorphicLFunctionsAndLocalFactors §AL.3.11 (the weight-facing acceptance suite)”; at that roadmap’s open head the heading is “### AL.3.11 The weight-facing acceptance suite”.
- R05 — repaired: §8.13 (lines 2535–2558) has five API bullets and four Checks; all recomputed below (table rows 8.13a–8.13d) and correct.
- R06 — repaired: no occurrence of `[Sch]` in the README.

## Verified sound

### Gate, dependency check, elaboration

- My rerun of the gate on 6045677: `gate DeligneWeightsAndPurity: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker’s run adds `build=0`.
- Dependency check with `--movable`: `depcheck: 201 roadmaps, 1320 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. The new `*Needs:*` edge of §1.6 points to SchemeAndStackFoundations, on main.
- `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- `lake env lean` on `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): zero errors, five `sorry` warnings (lines 82, 96, 111, 154, 174). The diff touches only the module docstring; the ten declarations and their elaborated types (worker’s `signatures.md`) are those the previous review checked, including the one dropped binder (`[FiniteDimensional K V]` on `primitivePiece`, correct for an intersection with a kernel; both Lefschetz theorems carry it). One-tactic probes were not rerun: no statement changed since the previous report found none closes by `simp`, `simp_all` or `aesop`.
- Headline theorems: unchanged list (abelian point-count bound, zeta rationality, degree-factor extraction, graded Lefschetz decomposition and pairings stated; cohomological headlines named as not statable in the docstring). The docstring now correctly assigns the numerical curve bound to SchemeAndStackFoundations and keeps only the Jacobian-root clauses as needing the Tate-module carrier.

### Adversarial computations

Rows for the three changed statements are new; every other row of the previous report (sections 0.1–0.19, 1.1–1.5, 1.7, 1.9–1.10, 2.1–2.11, 3.1–3.11, 4.1–4.4, 5.1–5.19, 6.1–6.5, 7.1–7.15, 8.1–8.12, 8.14–8.24, 9.1–9.12, 10.1–10.6 and the ten Lean declarations) is carried forward unchanged from `PRREVIEW-DeligneWeightsAndPurity~2`, whose instances and values apply to this head verbatim since those passages did not change. “Pass” means the instance agrees with the statement; it is not a proof of the general theorem.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.6 (rewritten) | `ℙ¹/𝔽_q`; `E/𝔽₂` with `a=1`, `m=1,2`; `ℙ¹_{𝔽_{q²}}` over `𝔽_q` | `g=0`: empty product `P=1`, `N_m=q^m+1`, `Z=1/((1−t)(1−qt))`, both bounds `0≤0`; `a₁+a₂=1`, `a₁a₂=2`, `N₁=1−1+2=2`, `|2−3|=1≤2√2≈2.83`, `Z=(1−t+2t²)/((1−t)(1−2t))`; `a₁²+a₂²=1−4=−3`, `N₂=1+3+4=8`, `|8−5|=3≤4`; the curve `y²+xy=x³+x²+1` over `𝔽₂` has exactly `2` points so the instance exists; `ℙ¹_{𝔽_{q²}}`: `N_m=0` (odd `m`), `2(q^m+1)` (even), `Z=1/((1−t²)(1−q²t²))`, `N₁=0≠q+1` so the `g=0` formula fails without geometric connectedness | pass |
| 1.8 (rewritten) | `y²=x³−x` over `𝔽₃`; `E/𝔽₂` with `2` points; affine-only miscount | affine points `(0,0),(1,0),(2,0)` plus `∞`: `#E=4`, `a=0`, `P=X²+3`, roots `±i√3` of modulus `3^{1/2}`, pinned `0²≤12`; `q=2,a=1`: `1≤8`, roots of `X²−X+2` modulus `√2`; affine-only `a=1` gives `X²−X+3`, discriminant `−11`, roots modulus `√3` but `a≠a_q=0`, so the Check separates the point-type convention | pass |
| 8.13a `Spec 𝔽_p` over `ℤ[1/ℓ]` | `K=ℚ̄_ℓ`; wrong model `D(−1)` | `K′=i^!ℚ̄_ℓ=ℚ̄_ℓ(−1)[−2]`, `D′ℚ̄_ℓ=ℚ̄_ℓ(−1)[−2]`, `ℋ²` weight `2≤−0+2`; `D(−1)` puts weight `2` in degree `0`, needs `w≤−2` against `w≥0` | pass |
| 8.13b `ℚ̄_ℓ⊕ℚ̄_ℓ(1)` on `Spec 𝔽_p` | correct `D′`; wrong model `D[−2]` | eigenvalues `1,p⁻¹`, weights `0,−2≤0`; `D′=(ℚ̄_ℓ(−1)⊕ℚ̄_ℓ(−2))[−2]`, `ℋ²` weights `2,4`, `4≤−w+2⇒w≤−2` vs `w≥0`: pure of no weight; `D[−2]` gives `ℋ²` weights `0,2≤2`, falsely pure of weight `0` | pass |
| 8.13c `Spec ℤ[1/ℓ]` | `ℚ̄_ℓ`; `ℚ̄_ℓ(1)` | `K′=ℚ̄_ℓ`, `D′ℚ̄_ℓ=ℚ̄_ℓ`, eigenvalue `1` at every `p`, pure of weight `0`; `ℚ̄_ℓ(1)`: eigenvalue `p⁻¹` weight `−2`, `D′=ℚ̄_ℓ(−1)` weight `2≤2`, pure of weight `−2` | pass |
| 8.13d `j_!ℚ̄_ℓ` on `ℙ¹_{𝔽_q}` | `n=1` smooth formula | `K′_{𝔾_m}=ℚ̄_ℓ(0)[0]`, `D′(j_!ℚ̄_ℓ)=Rj_*ℚ̄_ℓ`, `(R¹j_*ℚ̄_ℓ)_0=ℚ̄_ℓ(−1)` weight `2>−0+1`: not pure of weight `0`, while weights `≤0` hold | pass |
| 8.13 API laws | `ℚ̄_ℓ[1]`, `ℚ̄_ℓ(1)` on `Spec 𝔽_p`; `X` smooth of dimension `n` over `𝔽_p` | `ℚ̄_ℓ[1]`: `ℋ^{−1}` weight `0≤1−1`, `D′=ℚ̄_ℓ(−1)[−3]`, `ℋ³` weight `2≤−1+3`: pure of weight `1=0+1`; `ℚ̄_ℓ(1)`: weights `≤−2`, `D′=ℚ̄_ℓ(−2)[−2]`, `ℋ²` weight `4≤2+2`: pure of weight `−2=0−2`; `K′_X=f^!i^!ℚ̄_ℓ=ℚ̄_ℓ(n)[2n]⊗(−1)[−2]=ℚ̄_ℓ(n−1)[2n−2]`; `D′K=(DK)(−1)[−2]` shifts the weight test by `+2` in degree and `+2` in weight, so the two purity notions agree | pass |
| 9.7 (prose only) | chain `e₀→e₂→e₄`, `n=2` | statement unchanged; values as in the previous report (`P⁰=Ke₀`, `P²=0`, `λ²P⁰=𝒱(4)`); the consumer sentence now names EtaleDualityAndPerverseSheaves, resolved at its open head | pass |

### Seeded source sample

All fifteen targets opened at their locators in legally fetched texts (Numdam for WI and WII, the author’s page for AV); printed pages, with the sources-cache line numbers. None of the sampled passages changed in this diff; each supports the statement as written.

| Target | Locator opened | Supports the statement as written |
| --- | --- | --- |
| 0.17 | WI line 159–169, proof of (1.7)⇒(1.6), p. 277 | yes: distinct-weight factors are coprime and the weight classes are Galois-stable, which is the separation the no-equivariant-map lemma uses |
| 1.1 | AV line 3088–3104, Chapter II §1, pp. 75–76 | yes: Frobenius is the identity on the space with `f ↦ f^q`, fixes `0`, hence an endomorphism of `A` with characteristic polynomial of degree `2g` |
| 2.1 | WI line 408–416, (3.1), pp. 283–284 | yes: `U₀ ⊂ ℙ¹`, weight `β` through closed-point stalks, `ℚ_ℓ(r)` of weight `−2r` |
| 2.4 | WI line 453–467, (3.7), p. 285; line 363, Scholie (2.10), p. 282 | yes: `(⊗^{2k})_{Sp} ≅ ℚ_ℓ(−kβ)^N` by Weyl, hence `H²_c = ℚ_ℓ(−kβ−1)^N` via (2.10) |
| 3.8 | WI line 874–880, Proposition (6.6), p. 296; line 943–948, (6.13), p. 298 | yes: finite `K` of integers `≠ 1` (the `n_{ij} = 0` case kept), density-zero `L`, denominator `∏(1 − δ_j^{deg x} t)` in lowest terms |
| 4.1 | WI line 950–958, Lemme (7.1), p. 298; line 1015–1019, (7.1.2)–(7.1.5), p. 300 | yes: even `d`, `q^{d/2−1/2} ≤ |α| ≤ q^{d/2+1/2}`, induction with the four exact sequences |
| 5.2 | WII line 606–611, Définition (1.1.10), p. 151; line 662–668, (1.1.14), p. 153 | yes: Weil sheaf as geometric sheaf with `W(𝔽̄/𝔽_q)` action; equivalence with `(ℱ, F^*ℱ ≅ ℱ)` |
| 5.7 | WII line 870–878, (1.3.7), p. 158; line 1003–1004, Lemme (1.3.15), p. 161 | yes: `G` an extension of `ℤ` by `G⁰`; compact normaliser of a compact Zariski-dense subgroup |
| 5.15 | WII line 1854–1858, Proposition (1.11.1), p. 184; line 1935–1939, Remarque (1.11.5), p. 186 | yes: smooth relative curve with section, monodromy images lisse over an open; extension to all finite-type morphisms |
| 6.3 | WII line 2450–2452, Lemme (3.2.4), p. 201; line 2460–2461 and 2554–2561, (3.2.6), (3.2.14), pp. 201–203 | yes: `w(α) ≤ 1 + 2^{−k}`, step `k → k+1` on the surface `U₀ × U₀` under hypotheses (A)–(C) then removed |
| 7.2 | WII line 2622–2627, (3.3.2), p. 205 | yes: “entier” means algebraic-integer Frobenius eigenvalues; weights of an integral mixed sheaf are `≥ 0` |
| 7.12 | WII line 2640–2653, (3.3.4)–(3.3.6), p. 206; line 2680–2685, (3.3.10), p. 207 | yes, clause by clause, including `w ≥ 2(i − d)` for integral sheaves and the `ι`-mixed variant without the integral clauses |
| 7.14 | WII line 2656–2664, (3.3.7)–(3.3.8), p. 206; line 2671–2672, p. 207 | yes: couples `(v(α), v(q^n/α))`, lower triangle for `H_c` or proper `H`, upper triangle for smooth ordinary `H`; the bounds `r, s ≥ i − d` follow from the integrality of `α/q^{i−d}` and of its conjugate |
| 9.4 | WII line 2797–2800, Exemple (3.4.11), p. 210 | yes: spreading out `f₀ : Y₀ → X₀/S₀` proper smooth and (3.3.9) on closed fibres gives potential punctual purity |
| 10.4 | WII line 4107–4108, Théorème (6.1.13), p. 246; line 4164–4170, Variante (6.2.7), p. 248; (3.3.7)–(3.3.8) as above | yes: nearby cycles of a mixed sheaf are mixed; purity over `ℤ[1/ℓ]` with `K_X(−1)[−2]` over `𝔽_p` and (6.2.6) preserved |

Also opened for the changed passages: WII line 4164–4170, Variante (6.2.7), p. 248 (the §8.13 locator: `K_X = Ra^!ℚ_ℓ`, `D′`, the `(−1)[−2]` comparison, proper direct images); the previous report’s AV III Theorem 11.1 and Corollary 11.4 (printed 118–119) remain the §1.6 and §1.8 locators and were not reopened.

### Library declarations opened at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`)

`TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:42,52,65` (`card_mul_sq_sub_frobeniusTrace_mul_add_sq_nonneg`, `frobeniusTrace_sq_le_four_mul_card`, `hasse_bound`); `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:115` (`frobeniusTrace_eq_card_point`); `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Trace.lean` (no `sorry` token; the two `sorry` strings under `EllipticCurve/` are in docstrings of `Isogeny/Frobenius/Basic.lean:66` and `Affine/Point/FrobeniusFixed.lean:87–88`). The declarations the previous reports listed are at the same pins and were not reopened.

### Cross-roadmap citations resolved

On main (aa43542): SchemeAndStackFoundations §3.1 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:4647`, `Suggested.lean:1859`) and §5.11 (`README.md:7273`, `Suggested.lean:2598`); EtaleCohomologyFoundations §F.5 (`README.md:1179`: trait dualizing complex by the dimension-one Kummer calculation, finite-type exceptional pullback, SGA 4½ Th. finitude §4, which covers the `ℤ[1/ℓ]` base of §8.13) and §F.6 (`README.md:1200`, smooth purity `f^!Λ ≅ Λ(d)[2d]`). At open heads: ArithmeticGaloisRepresentations §5.13 (“Curve point-counting input”, applies §5.11 to `D × 𝔽_{Q^r}`); EtaleDualityAndPerverseSheaves (Scope paragraph on the abelian-category extension with Tate twist); AutomorphicLFunctionsAndLocalFactors §AL.3.11. The worker’s citation check at this head lists no cross-roadmap citation or Lean name found nowhere, and my grep confirms the removal of StandardConjectures, the EllipticCurves Layer 3 contract, the dead relative link and `[Sch]`.

### Ownership

Unchanged from the previous report: the curve numerical bound now has its single owner (SchemeAndStackFoundations §5.11) cited, and §1.6 keeps only the Jacobian clauses, which no roadmap on main or at the sibling heads states (CurvesOverFiniteFields and AbelianVarietiesOverFiniteFields cite this roadmap’s DWP.1 as supplier). Ownership against pull requests whose files the brief did not provide was not checked.

### Shape

The changed passages keep the house form: prose statements with hypotheses, `*Needs:*` item by item, locators in parentheses, Checks as prose bullets (three for §1.6, four for §8.13), no LaTeX, no process words, no pull-request numbers, no local paths. The Layer DWP.1 Dependencies line (line 1076) lists the new suppliers.

## Not verifiable

- [Int] SGA 7 II, Exposé XXI §5, cited by §§7.9–7.10 (unchanged in this diff): paywalled publisher only, no local copy; cited by locator, indirectly confirmed by WII (3.3.2)–(3.3.3), lines 2622–2633, as in the previous report.

## Source issues

- none

The four entries of the previous report (two WII sign and normalisation misprints at (2.2.8)/(3.5.1) and (3.5.6)–(3.5.7), the WII point-count sign at (3.5.6), and the BFP orientation gap at Proposition 4.2) stand; no passage opened this round adds to them.
