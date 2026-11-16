# FIX-PKG-GrossZagierAndArithmeticHeightsPartII~10

This round settles the four findings of `REV-PKG-GrossZagierAndArithmeticHeightsPartII~9`. I checked each one against the cached legal sources (Z, Bor99, BHKRY, LZ, LL2, K) and against the README's own targets. All four are correct. F01, F03 and F04 are applied as asked. F02 is applied with one change to the suggested route clause, because that clause was inaccurate for G_B (see F02).

Files changed:

- `packages/GrossZagierAndArithmeticHeightsPartII/README.md`
- `packages/GrossZagierAndArithmeticHeightsPartII/sources.toml`: only `locator` fields changed, for Z, LZ, LL2 and Bor99, to cover the passages newly cited. No work was added and nothing was fetched.

Unchanged: `Suggested.lean`, `metadata.toml`, `design/plan.json`. No new supplier gap was needed.

## F01 (P2) — applied

Old: det(1 − g′) and 1 − d units; expected codimension on that whole set. New: domain det(1 − g′) ≠ 0, 1 − d ≠ 0 (isomorphism, rs equivalence); graph pullback for 1 − d ∈ O_F^×; expected codimension, Tor vanishing and Int(g′) = Int(g,u) for u ≠ 0, automatic for rs g′ with n ≥ 2. Locator Z Lemmas 4.1–4.4, Prop. 4.6; u = 0 Check; *Needs* §0.5.

Evidence: Z line 927–929 defines the domain by nonvanishing. Z line 1017 adds only 1 − d ∈ O_F^×. Z line 1029 and line 1072 assume u ≠ 0. Z line 1268–1270 puts the unit condition on det(1 − ξγ′) in Lemma 4.11.

The same pattern elsewhere: the Layer 9 Examples paragraph now also asks for a nonzero relative vector. The §9.5 locator "Z §§4.3–4.5" named a section Z does not have (Z §4 ends with §4.4 at line 1300, and §5 starts at line 1335). It is now "Z §§4.3–4.4; Lemma 4.11, Proposition 4.12 and Remark 4.13".

## F02 (P2) — applied

Old: every series Σ_(m≥0) a(m)q^m. New: m ∈ ℚ_(≥0) and compatibility with the cusp stabilizer (a(m) vanishes off cosets with Q(μ) ≡ m mod ℤ; a(m)(ω_L(−1)φ) = (−1)^n·a(m)(φ), so a(m) is even). Citation and API bullet updated; two Checks (T-condition, parity); §12.7 gains the compatibility clause, phrased through the §12.4(b) projection for G_B.

The T-condition Check is the reviewer's ev_μ·q¹ witness. The parity witness is mine: L = O_F ⊕ O_F ⊕ 3O_F with a = ev_μ − ev_(−μ) for μ = (0, 0, 1). The citation now notes that Bor99's power series are formal sections of the bundle (pp. 4–5), and that BHKRY 4.2.3 is the scalar case with integral exponents.

The one deviation: the suggested §12.7 clause said G_B(m, φ) depends only on φ restricted to the vectors of norm m. That is false. A coset μ + L̂ with Q(μ) ≡ m may contain no vector of V of norm m, and still f_(m,φ) ≠ 0. The text now says G_B depends on the even projection of §12.4(b).

Evidence:
- Bor99 lines 234–247 define PowSer at a cusp through the vector bundle.
- README §12.6a(f)(i) already stated both conditions for the orthogonal version.
- The sign comes from BHKRY line 4978–4979, where ω_p(m(−1)) acts by χ_(k,p)(−1)^n. Then ∏_p χ_(k,p)(−1) = χ_(k,∞)(−1) = −1 gives ω_L(−1)φ = (−1)^n·φ(−·).
- ω_L(T)φ = e(−Q)φ (BHKRY line 4975–4978, with ψ_f = e(−·) on ℚ). So c(−m) is supported on Q ≡ m, as §12.4(b) says.

## F03 (P3) — applied

Old: "vol(K) is the volume of the level K for the fixed Haar measure". New: vol(K) for a Haar measure independent of K, T and φ (LZ: "suitable"); since Haar measures differ by positive scalars, the content is that c_K·vol(K, dg) has sign (−1)^n and is independent of K, T and φ, so c_(K′) = [K : K′]·c_K.

Evidence: LZ line 3636–3637, "a suitable Haar measure", and no sentence of the README fixed one.

The same pattern elsewhere: §8.3 also said "the fixed Haar measure", on L♭ ⊗ F. There it is fixed by the Conventions (the self-dual measure for the trace pairing). The text now says so, and notes that the constancy of §8.4 does not depend on the choice. K line 3446–3450 leaves dy unspecified.

## F04 (P3) — applied

Old: "for a type-four curve indexed by Λ". New: "for either of the two connected components V_Λ^± ≅ ℙ¹ of the stratum of a type-four vertex lattice Λ", citing LL2 Proposition 2.28(2) and Remark 2.29; the last clause adds "which writes the vertical class as a combination of these components". New Check: the whole stratum gives 2(1 − q) on Λ and 2 on the shell.

Evidence: LL2 line 1619–1621 (Lemma 2.55 takes one component V_Λ^+) and line 1127–1128 (Remark 2.29: two copies of ℙ¹).

The same pattern elsewhere: the §5.2 Check "On a type-four curve C ≅ ℙ¹" now reads "On a connected component C ≅ ℙ¹ of a type-four stratum". The Layer 5 and Layer 6 Examples already said "projective line" and "component", and are unchanged.

## Checks run

- `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged. It has one `import Mathlib`, a module docstring and an empty namespace, with no declaration and no `set_option`.
- `#check @name` comparison: `Suggested.lean` declares no name, so there was nothing to elaborate or compare, and nothing changed.
- Dependency check, exact output: `depcheck: 244 roadmaps, 2291 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The set of backticked spans in the README is the same as before the edits (compared mechanically).
- Scan of the added README lines for process words, LaTeX delimiters and machine paths: no hit.
- `sources.toml` parses as TOML after the locator edits.
- Ownership against open pull requests: no new construction, carrier or target was introduced, so there is no new ownership question. The edits restate hypotheses of existing targets and add Checks.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §9.4 determinant identity | n = 2, g′ = diag(h, d) | det(1 − g′) = (1 − h)(1 − d); g = h, so (1 − d)·det(1 − g) = (1 − d)(1 − h) | Holds |
| §9.4 domain | d = 1; 1 − d a nonzero nonunit; det(1 − g′) a nonzero nonunit | d = 1 is outside U(V_n)°; a nonunit 1 − d lies in U(V_n)°, where only the isomorphism is asserted; a nonunit det(1 − g′) with 1 − d a unit falls under Prop. 4.6 | Matches Z Lemmas 4.2, 4.4 and Prop. 4.6 |
| §9.4 expected codimension, u ≠ 0 | general n; n = 2 with u = 0 | Expected relative dimension of the pullback: 2(n−2) − (n−1) = n − 3; actual: Z(u) ⊂ N_(n−1), a Cartier divisor (§0.5), of relative dimension n − 3. At n = 2, u = 0: actual Spf O_F̆ (codimension 0) against expected codimension 1 | u ≠ 0 added; witness Check added |
| §9.4: rs ⇒ u ≠ 0 | n = 1, 2, 3 | n = 2: {u} must be a basis of V₁, so u ≠ 0; n = 3: {u, hu} a basis of V₂; n = 1: V₀ = 0, nothing asserted | Stated for n ≥ 2 |
| §9.4 witness | h, d ∈ F^1 not ≡ 1 mod ϖ | the residues of F^1 number q + 1 ≥ 4, so such h, d exist; g′u₀ = d·u₀, so the span has dimension 1 < 2 = dim V₂ | Not rs, no Int |
| §12.5(c), T-condition | F = ℚ(i), L = O_F³, h = diag(1, 1, −1), μ = ((1+i)/2, 0, 0) | L′ = ½L; Q(μ) = 2/4 = ½; c(−1)(μ) = 0, so the pairing is 0; ev_μ(1_(μ+L̂)) = 1 with ½ ≢ 1 | Excluded after the repair; Check added |
| §12.5(c), parity | L = O_F ⊕ O_F ⊕ 3O_F, μ = (0, 0, 1) | L′ third factor (1/6)O_F; 2μ = (0, 0, 2) ∉ L; Q(±μ) = −1 ≡ 1; a = ev_μ − ev_(−μ) is odd with a(1_(μ+L̂)) = 1; c(−1) even, so the pairing is 0 | Excluded after the repair; Check added |
| sign of ω_L(−1) | n = 3 | ω_L(−1)φ = −φ(−·); weight −1: f = (−1)^(−1)·ω_L(−1)f = f(−·), so f is even; dual weight 3: a(m)(−φ(−·)) = −a(m)(φ), so a(m) is even | Matches §12.4(b) and the repair |
| §12.7 series compatible | φ = 1_(μ+L̂) with Q(μ) ≢ m; m = 0 | Q(μ + λ) − Q(μ) ∈ ℤ, so there is no norm-m vector and Z = 0; the projection is 0, so f_(m,φ) = 0 and G_B = 0; at m = 0, μ ∉ L̂ gives φ(0) = 0 | Holds; clause worded through the projection, not norm-m restriction |
| §13.4 constant | K′ ⊂ K of index m; dg ↦ λ·dg, λ > 0; n = 2, 3 | vol(K′) = vol(K)/m gives c_(K′) = m·c_K; c_K·vol(K, λdg) = λ·c_K·vol(K, dg), so the sign is kept; signs +, − | Holds for every Haar measure |
| §8.3 measure | rescale by c | partial integrals scale by c (existing Check); constancy (§8.4) unaffected | Measure named |
| §6.5 per component | q = 3, x ∈ Λ; shell; whole stratum | −12 + 10 = −2 = 1 − q; shell 1; whole stratum −4 and 2; Fourier on Λ: −12/9 + 10/3 = 2 = q − 1 | Per-component reading; Check added |
| §5.2 Check | C ≅ ℙ¹, deg ω = q − 1 | χ(O) − χ(ω) = 1 − q = −2 at q = 3 | Holds; wording per component |

## For the maintainer

- No name that other roadmaps cite changed. No section or target was renumbered. §9.5's locator now names Z §4.4, where it had named a §4.5 that Z does not have.
- `Suggested.lean` is unchanged and states nothing, because no headline is statable at the pins. Its docstring is still accurate.
- No text in the review asked for anything outside this package, and none was suspicious.
