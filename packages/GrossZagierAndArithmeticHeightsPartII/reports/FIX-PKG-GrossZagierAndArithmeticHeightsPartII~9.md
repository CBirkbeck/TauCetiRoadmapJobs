# FIX-PKG-GrossZagierAndArithmeticHeightsPartII~9

This round settles the five findings of `REV-PKG-GrossZagierAndArithmeticHeightsPartII~8`. I checked each one against the cached legal sources (LL1, LL2, YZZ09, LZ, Z, Bor99, including the PDF glyphs of LL2 and YZZ09), the supplier README of EndoscopicTransferAndUnitaryTraceComparisonPartII at its open head, and the README's own targets. All five are correct. Three are applied as asked. Two are applied differently because the suggested wording was itself incomplete or inaccurate (F02, F03).

Files changed:

- `packages/GrossZagierAndArithmeticHeightsPartII/README.md`
- `packages/GrossZagierAndArithmeticHeightsPartII/design/plan.json`: only the `jr-afl-local-inputs` entry of the top-level `gaps` list changed (its `needs`, now identical to the README line, and `neededBy`, which gains "14.4").
- `packages/GrossZagierAndArithmeticHeightsPartII/sources.toml`: the `locator` fields of LZ, Z, LL1 and LL2 now cover the passages newly cited. No new work was added and nothing was fetched.

Unchanged: `Suggested.lean` and `metadata.toml`.

## F01 (P2) — applied

Changed: the two "Source corrections" bullets on LL2 Lemma 2.57 (with its sentence "The two-lattice case occurs with a = 3") and on YZZ09 §4.1 are deleted. §6.7 (r ≥ 2, a ≥ 3) and §12.6a(b) (p ≥ 3) already state the printed results and are unchanged.

Evidence. I read the font of each glyph on the PDF pages. In LL2 (p. 34, Lemma 2.57: "r > 2" and "a_(n−1) > 3"; p. 37: "a_(n−1) > 3 by Lemma 2.57") and in YZZ09 (p. 1158 "n > 3"; p. 1159 "dim V′ > 5"), every ">" is a glyph of the AMS symbol font MSAM10. In that font, code 0x3E is ⩾. The "⩽" on the same pages comes from the same font. The strict "<" in "a_(n−2) < a_(n−1)" and the strict ">" in LL2 Lemma 2.24 ("t(L♭′) > 1", p. 17) come from the math-italic font, so they really are strict. The text extractions of LL1, LL2 and YZZ09 contain 56, 125 and 6 signs ⩽ and no ≥ or ⩾.

Pattern: I listed every strict inequality in the README passages that cite LL1, LL2 or YZZ09 (Layers 5–6, §§10.1–10.3, §12.6a). The remaining ones are §6.3 "t(A) > 1" (strict as printed), §6.7 "a_(n−1) > a_(n−2)" (strict as printed) and Borcherds' sums Σ_(t>0), Σ_(m>0), Q(λ) > 0 (Bor98, Bor99, not affected). No other change.

## F02 (P2) — applied differently

Changed: line 11 and the contract paragraph (line 136) no longer attribute smooth transfer to the jr-local-comparison contract. gap:jr-afl-local-inputs (README identical to plan.json) is split: (i) the unramified odd-residue passage and fundamental lemma; (ii) existence of smooth transfer and its semi-Lie Weil compatibility at every p-adic place. §14.4 *Needs* gains the gap.

Detail. Line 11 now says that EndoscopicTransferAndUnitaryTraceComparisonPartII requests from EndoscopicTransferAndUnitaryTraceComparison only the matching and the twisted orbital distributions, with transfer taken as a relation between named test functions. The existence of smooth transfer and its Weil compatibility (Z §13.2, footnote 9, p. 63; §14, p. 68; Appendix A, Theorem A.1, p. 73) are requested below. Line 136 says that the contract contains neither of these, and that both are part (ii) of the gap.

Part (ii) of the gap covers every finite extension F₀/ℚ_p, p = 2 included, and every quadratic étale F (ramified, unramified or split). It asks for transfer existence in both directions in Zhang's formulations (Z Definitions 2.1–2.2, p. 10), and for Theorem A.1. The gap's `neededBy` gains 14.4, and the §14.4 route names the partner functions it needs.

Why differently: the suggested repair put existence inside the gap's unramified, odd-residue-characteristic clause. Zhang needs it at every finite place, not only at unramified odd ones:

- Z §14 requires partial transfer for every non-archimedean v (Z line 3840, p. 68).
- S must contain all places of residue characteristic 2 (Z line 3591, p. 63) and every place where the test data are not the unit functions.
- Theorem A.1 is stated for any quadratic extension of local fields (Z lines 4117–4118) and is applied at all finite h_f (Z line 3914, p. 69).

The supplier exclusion is confirmed at the head of EndoscopicTransferAndUnitaryTraceComparisonPartII (README:54 lists the contract, README:56 says existence and Fourier compatibility are not inputs).

## F03 (P3) — applied differently

Changed. The §10.3 Check no longer says "the supersingular locus is empty". At a split v the statement is not asserted. For nonsingular T it is not needed: A₀ⁿ → A would be a quasi-isogeny, but the p-divisible group dimensions differ by one at the φ₀-place. The basic locus is nonempty (explicit n = 2 point). The §11.5 Check now says the CM/divisor intersection is empty at split v.

Why differently: the suggested §11.5 text says the supports themselves "do not meet the special fibre". That is not right: the CM cycle is proper (§11.2) and so specialises into every fibre. What is empty is their intersection (§12.10). The §10.3 text follows the suggestion, but states the dimension count at the place of F through which φ₀ passes. Only that place gives a mismatch when F₀ ≠ ℚ.

Evidence (computed):

- The E × E point: take F = ℚ(i), p ≡ 1 mod 4 and E supersingular. Let i act by ((0,−1),(1,0)); its eigenvalues on Lie(E²) are the two distinct square roots of −1 in 𝔽_p, which gives signature (1,1). The product polarization has Rosati involution the transpose, which sends i to −i.
- A₀ = y² = x³ − x is ordinary at 5: #E(𝔽₅) = 8, so a₅ = −2.
- Dimension counts: (2,0) against (1,1) for n = 2. For general F₀: n·m_w against n·m_w − 1, with m_w the number of CM-type embeddings inducing w.

Pattern: no other README sentence says a supersingular or basic locus is empty at split places; §12.10 and the Layer 12 Examples state the vanishing of the intersection, which is correct.

## F04 (P3) — applied

Changed: §10.3 now cites LZ §13.1, (13.1.0.1), pp. 80–81, §13.3, p. 81, and the proof of Theorem 13.6.1, pp. 83–84, plus LL1 (8.2)–(8.3), pp. 37–38. §10.1 cites §13.3, p. 81 and §§11.1–11.4, pp. 73–76. §5.2 adds LL2 §2.4, (2.14), p. 24. §12.6a cites Bor99 p. 9. In sources.toml the locators of LZ, LL1, LL2 and Z are extended.

Evidence:

- LZ: §13.1 at LZ lines 3514–3528 (p. 81 begins at 3529); §13.3 at lines 3544–3559 (p. 82 begins at 3567); proof of Theorem 13.6.1 at lines 3638–3649.
- LL1: (8.2) at LL1 line 1715 (p. 37); (8.3) at line 1754 (p. 38).
- LL2: (2.14) at LL2 lines 1193–1208 (p. 24).
- Bor99: Lemma 4.4 at line 437 and Theorem 4.5 at line 444; p. 9 begins at line 436.

Pattern: the same §10.1 locator also has "LZ §§11.1–11.4, pp. 73–77". §11.4 ends on p. 76, because §11.5 starts at LZ line 3325 on p. 76 and p. 77 begins at line 3349. It now reads "pp. 73–76". Z's locator in sources.toml now also lists the passages cited for F02: Definitions 2.1–2.2 (p. 10), Definition 13.1, Remark 13.2 and footnote 9 (p. 63), §14 (p. 68) and Theorem A.1 (p. 73).

## F05 (P3) — applied

Changed. The §12.1 Check ("not modular on its own") is now restricted to c₁(ω) ≠ 0 in CH¹(M)_ℚ, for example compact M of positive dimension, where ω is ample. There the dropped term is a nonzero constant series, which is not holomorphic of weight n. Otherwise the term is zero: for n = 1, and for n = 2 over ℚ with V isotropic (Δ trivialises a power of ω).

Pattern: the third Check of §12.6a already carries the compactness qualification. The Layer 12 Examples sentence ("otherwise its negative sign is required") concerns ĉ₁(ω̂) for F₀ = ℚ and n ≥ 3. There ω extends to an ample bundle on the Baily–Borel compactification, whose boundary has codimension n − 1 ≥ 2, so the class is nonzero. No change.

## Checks run

- Elaboration, from the content checkout: `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean` (absolute path) exited 0 with no output, in 3.1 s. The file has a single `import Mathlib`, one module docstring and an empty namespace, and declares nothing. So the `#check @name` comparison of elaborated types had no input: there is no declaration to compare and nothing changed in it.
- Dependency direction (`gate --depcheck … --movable`), exact output:

      depcheck: 239 roadmaps, 2275 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- Citation resolver on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- Gap parity: each of the four `gaps` entries of design/plan.json appears verbatim as `(gap:<slug>): <needs>` in the README (checked mechanically: 4/4).
- Pattern scan of README, sources.toml and Suggested.lean for machine paths, LaTeX delimiters, round or job labels and pull-request numbers: no hit. sources.toml parses (24 works).
- No gate failures were listed for this round.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §6.7 after F01 (LL2 Lemma 2.57 as printed, r ≥ 2, a ≥ 3) | r = 2, a = 3; L♭ = ⟨e₁, e₂, e⟩, h(e,e) = βu², x₀ of norm β | h(u⁻¹e ± x₀, u⁻¹e ± x₀) = βu²/(uū) + β = −β + β = 0; h(e, u⁻¹e ± x₀) = (−u)⁻¹·βu² = −βu, u-adic valuation 1; invariants (1,1,2,2) | a = 3 occurs, which agrees with ⩾ 3 as printed; the deleted "correction" was not one |
| §12.6a(b) after F01 (p ≥ 3 against YZZ09 n ⩾ 3, dim V′ ⩾ 5) | p = 3, 2 | 𝔰𝔬(3,2): dim(𝔲 ∩ 𝔭) ≥ 2; 𝔰𝔬(2,2) at x₀ = x₁: dim = 1; p ≤ 2 with e such that p + e ≥ 3 gives dim V′ = p + e + 2 ≥ 5 | Consistent with YZZ09 as printed |
| Gap (ii), existence of transfer | n = 1; F split; F/F₀ unramified with p odd; ℚ₂(i)/ℚ₂ | n = 1: GL₀ is trivial and Orb(γ, f′) = ω(γ)f′(γ), so transfer is multiplication by ω. Split: γγ̄ = 1 forces γ = (a, a⁻¹), so S_n ≅ GL_n(F₀) ≅ U(V) and matching is conjugacy (elementary). Unramified: η̃ = (−1)^v. Ramified dyadic: η̃ is a chosen extension (Z §2.3), required at places of S (Z line 3591) | Holds at the stated generality; narrower (unramified, odd) would miss S |
| Gap (ii), Weil compatibility | h = diag(a, a⁻¹), (1 b; 0 1), w (Z (11.1)); split E | The first two act by characters and scaling on the vector variable and preserve matching; w acts by the partial Fourier transform up to γ_V; split case trivial (Z lines 4117–4118) | Stated as Z Theorem A.1, semi-Lie formulation only |
| §14.4 *Needs* + gap | the test function at v against away from v | at v: unit functions, fundamental lemma (part (i)); away from v: an arbitrary nonnegative unitary test function needs a partner on Zhang's side (part (ii)) | *Needs* gains the gap; Layer 14 Dependencies already list it |
| §10.3 split Check | n = 2, F₀ = ℚ; n general, F₀ general; E × E | dimensions (2,0) against (1,1); n·m_w against n·m_w − 1; i ↦ ((0,−1),(1,0)) has eigenvalues ±√−1 ∈ 𝔽_p distinct for p ≡ 1 mod 4, giving (1,1); Rosati(i) = iᵗ = −i; #E(𝔽₅) = 8 for y² = x³ − x, a₅ = −2, ordinary; #E(𝔽₃) = 4, a₃ = 0, supersingular, as expected for p ≡ 3 mod 4 | Z(T) empty at split v; basic locus nonempty |
| §11.5 split Check | n = 1; n = 2 | n = 1: δ ∈ F^1 is scalar and u ≠ 0 gives A₀ → A, with dimensions (1,0) against (0,1). n = 2: u, δu independent (α irreducible), Gram matrix totally positive definite, dimensions (2,0) against (1,1) | Intersection empty; supports themselves are not |
| §12.1 Check | n = 1; n = 2 isotropic over ℚ; n = 2 over a real quadratic F₀ | CH¹ = 0, so the term is 0; c₁(ω) = 0 since Δ has no zeros, so the term is 0; compact curve, deg ω > 0, and a constant c ≠ 0 with (2i)²·c = c is impossible | Qualified Check true in all three |
| Locators (F04 and pattern) | page markers | LZ 3529, 3567, 3607/3644; LL1 1684/1722; LL2 1172/1219; Bor99 389/436/488; LZ 3185/3311/3349; Z 539/597, 3557/3608, 3824/3878, 4103/4176 | All locators as now written |

## For the maintainer

- Ownership of Jacquet–Rallis smooth transfer. I searched for it by object in the open heads and on main ("smooth transfer"). EndoscopicTransferAndUnitaryTraceComparisonPartII excludes it from its contract (its README:56). GanGrossPrasadUnitaryGroups asks EndoscopicTransferAndUnitaryTraceComparison for finite-place transfer in the GL_n × GL_(n+1) formulation, at all ramification and p = 2, under its gap:relative-finite-transfer. This roadmap now asks the same supplier for transfer existence in Zhang's S_n formulations (part (ii) of gap:jr-afl-local-inputs). No roadmap states either as a target, and the supplier and section ("Layers 2 and 4") are unchanged. The supplier receives two requests for one theorem in two formulations and may serve both from one statement plus the passage between them.
- Ownership against the open roadmap pull requests was checked through the roadmap index tools (`roadmaps grep`, `roadmaps show`) at their heads.
- No name that other roadmaps cite changed. The only consumer-visible change is the content of gap:jr-afl-local-inputs (new part (ii); `neededBy` gains 14.4).
- No untrusted text contained instructions. The review's "For the human reviewers" section was not acted on.
