# FIX-PKG-GrossZagierAndArithmeticHeightsPartII~6

This round repairs the seven findings of `REV-PKG-GrossZagierAndArithmeticHeightsPartII~5`. I checked each one against the cached legal sources, the supplier roadmaps and the README's own definitions before editing. All seven are correct.

Files changed:

- `packages/GrossZagierAndArithmeticHeightsPartII/README.md`
- `packages/GrossZagierAndArithmeticHeightsPartII/sources.toml`: one new entry, `McGraw03` (paywalled, recorded `uncertified` by the sources service). The locators of `LZ`, `Z` and `Bor99` are extended to the passages newly cited.

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No supplier gap was added or changed.

## F01 (P2) — applied

Verified: LZ line 320 (§1.7, p. 8) makes nondegeneracy of rank-(n−1) spans a standing assumption. The proof of Lemma 2.9.2 (LZ lines 555–560) uses finiteness of the vertex lattices containing L. The witness holds: each Λ_j has Gram matrix ϖ·(H ⊥ ⟨1⟩), so Λ_j^∨ = ϖ⁻¹Λ_j, the type is 3, and L ⊂ Λ_j.

§0.7: "for L of rank r ≥ n−1, Z(L) is noetherian" → noetherian for rank n, and for rank n−1 with L ⊗ F nondegenerate. Z(L) stays defined for all L, and the route now proves vertex-lattice finiteness. The degenerate hyperplane is a new negative-control Check. Every rank-(n−1) consumer (§§1.1–1.4, 2.3–2.5, 3.2, 5.1, 6.2, 8.3, 8.6) already assumes a nondegenerate span.

## F02 (P1) — applied

Verified: Z (2.11), line 517 (p. 9), defines conjugate self-reciprocity. Z Lemma 7.13 (line 2022, p. 36) concerns char_F, with coefficients in O_F[1/d]. Z Remark 7.14 (line 2035) concerns the ordinarily self-reciprocal char_ℚ. For α = T − i: ᾱ(0) = i and i⁻¹·T·ᾱ(T⁻¹) = −i(1 + iT) = T − i, while the ordinary reciprocal is T + i.

§11.1: "monic, integral, self-reciprocal" → "monic of degree n, conjugate self-reciprocal (α = ᾱ(0)⁻¹Tⁿᾱ(T⁻¹)), coefficients in O_F[1/d]". §11.3: "integral self-reciprocal characteristic polynomial" → char_F conjugate self-reciprocal over O_F[1/d], char_ℚ ordinarily self-reciprocal. §11.3 Check → "conjugate". New Check: T − i versus T + i and T² + 1. No other occurrence exists (searched "reciprocal").

## F03 (P2) — applied

Verified. For n = 1, γ = 1 and the unit function, GL₀ is trivial and ω = η̃(1) = 1. So Orb(s) ≡ 1 and ∂Orb = 0, the orbit is a point, and Orb ≠ 0.

§9.3 body: "constant on the orbit exactly when Orb = 0" → sufficiency in every rank; the converse for acting rank m = n−1 ≥ 1, via a = diag(ϖ,1,…,1) with log|det a| = −log q; invariance is automatic for m = 0. The API bullet and the third Check are qualified the same way. A new boundary Check records the n = 1 witness. No other occurrence (searched "orbit invariant", "exactly when Orb").

## F04 (P3) — applied

Verified. For x = u⁻¹e, h(x,x) = −u⁻² has F₀-valuation −1, so N(x) = ∅ by §5.1, and every class involved is 0.

§5.3 second Check: "differs by the nonzero class" → nonzero exactly when N(x) ≠ ∅. Nonvanishing is shown on the nonempty divisor N(e) (h(e,e) = 1, n = 2): localizing at a generic point, a DVR, gives O_D(−D) positive length. The empty case is a negative control. The same pattern in §5.2's second Check is qualified to N(x) ≠ ∅. §0.5 was already correct.

## F05 (P3) — applied

Verified. ℚ₃(√3) has e = 2 and f = 1, so q = 3.

§9.8 last Check: "q = n = 3 only for F₀ = ℚ₃" → "exactly when p = 3, residue degree one and n = 3, any ramification". The totally ramified ℚ₃(√3) example (T² − 3, q = 3, [F₀:ℚ₃] = 2) is added, and the chain 3 ≥ 3 ≥ 3 ≥ 3 still makes §9.5(b) apply. No other occurrence (searched).

## F06 (P2) — applied differently

Verified. §12.5 assumes n ≥ 3, integral input weight 2 − n and unitary lattices. The rational branch with p = 1, 2, 3 needs weights (3/2, 1/2), (2, 0) and (5/2, −1/2).

I took the review's second option, explicit subtargets of §12.6a whose dependencies avoid §12.5, and narrowed what the Borcherds argument must cover:

- (e): for F₀ = ℚ and p ≥ 3, U is isotropic (Meyer). Borcherds products for even lattices with ρ_Λ⁻ input have unitary characters of finite order (Bor98 Theorem 13.3; Bor99 proof of Theorem 4.1, the case b⁻ > 2). They give Σ_(m≥0) Z′(m, c(−m)) = 0 in CH¹(M′_K)_ℚ.
- (f): the half-integral-weight obstruction criterion (Bor99 Theorem 3.1, on the subspace where the centre acts by the weight, p. 10).
- (f)(ii): rationality of the holomorphic forms (McGraw03). The route needs it because Bor99 Theorem 4.5 only places the series in the span of Galois conjugates; Borcherds says so on p. 9.
- p ≤ 2, at every base ℚ included, goes through the pullback (c). This avoids the rank-one/two embedding trick for characters.

The route gives algebraicity (Koecher, ShimuraVarieties §2.8; GAGA) and the ±λ multiplicity count. Needs: §12.5(c) removed; ShimuraVarieties §§2.3, 2.8 and QSeries §8.5 added. Contracts, the Layer 12 intro and Dependencies, Scope, Examples and References are updated to match.

Why "applied differently": the review's first option (make §12.5 a specialization of a general target) would have reorganized §12.5. Rationality (McGraw) is an input the review did not name, but the route needs it.

## F07 (P1) — applied

Verified. x² = 3(y² + z²) forces 3 | x, then 3 | y and 3 | z, so the form is anisotropic. (1, 1, 0) is a zero of x² − y² − z².

§12.6a route: "For F₀ = ℚ, M′_K is not compact" → compact exactly when U is anisotropic, possible only for p ≤ 2. Both cases occur, and the rational branch uses no compactness. New Check: the two ternary forms, the quaternary pair x² + y² − 3z² − 3w² (anisotropic by the same descent) and x² + y² − z² − w², and the isotropic vector (1,1,1,1,0) of the signature-(3,2) enlargement used by (c). Nothing about isotropy is imposed; all p ≥ 1 and all totally real bases are kept.

## Checks run

- Elaboration: `lake env lean packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean`, run from the content checkout, exits 0 with no output (9.6 s). No `TauCeti.*` import, so nothing was built.
- `#check @name` comparison: `Suggested.lean` declares nothing (module docstring and empty namespace), so there were zero declarations to compare and nothing changed.
- Dependency check (`gate --depcheck … --movable`), exact output:

  ```text
  depcheck: 245 roadmaps, 2252 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere. The new citations ShimuraVarieties §§2.3, 2.8 and QSeriesPartitionsAndMockModularForms §8.5 resolve; I read both at their heads.
- No gate failures were listed for this round.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.7 rank-(n−1) noetherianity | V₃ = H ⊥ ⟨ϖ⟩, L = ⟨e, a⟩; nondegenerate L = ⟨e⟩, n = 2 | det Gram(L) = 0, Λ_j^∨ = ϖ⁻¹Λ_j, type 3, infinitely many; for ⟨e⟩, W^⊥ anisotropic and Λ squeezed between ϖM^∨ and M | Hypothesis added; witness is the negative control |
| §0.7 finiteness route | Λ ⊂ Λ^∨ ⊂ ϖ⁻¹Λ, L ⊂ Λ | W-projection in L^(∨,W); h(y,y) = h(x,x) − h(w,w) bounded below; Λ ⊃ ϖΛ^∨ ⊃ ϖM^∨ | Route sound |
| §5.3 Check | x = e (h = 1), x = u⁻¹e | N(e) ≠ ∅: length of O_D(−D) at a generic point ≥ 1. N(u⁻¹e) = ∅: 0 = 0 | Nonzero only for N(x) ≠ ∅ |
| §5.2 Check | same two labels | wrong reading differs by [O_D(−D)] (≠ 0) versus 0 | Qualified |
| §9.3 converse | n = 1, γ = 1; n = 2, ℚ₃, a = diag(3,1) | Orb ≡ 1, ∂Orb = 0, singleton orbit; for m = 1, log|det a| = −log 3, ∂Orb changes by log 3·Orb | m ≥ 1 needed |
| §9.3 ω-omission Check | Orb = 0, η(det a) = −1 | raw ∂Orb(a⁻¹γa) = η(det a)·∂Orb(γ) = −∂Orb(γ) | Kept, qualified to m ≥ 1 |
| §9.8 equality case | ℚ₃, ℚ₃(√3), ℚ₉ (unramified quadratic over ℚ₃) | q = 3, 3, 9; equality q = n = 3 for the first two only | Repaired |
| §11.1 conjugate reciprocity | α = T − i; α = T² + 1 over ℚ | conjugate: −i(1 + iT) = T − i ✓; ordinary reciprocal of T − i: T + i ✗; T² + 1 ordinary ✓ | Definition fixed |
| §11.1 α(0)ᾱ(0) = 1 | T − i | α(0)ᾱ(0) = (−i)(i) = 1 | Consistent |
| §12.6a(e) isotropy | p = 3, 4 over ℚ | dimension ≥ 5 indefinite ⇒ isotropic (Meyer) | Holds |
| §12.6a(e) weight/bundle | Bor98 §13, p. 46 (line 2515): weight k = homogeneity degree −k | Ψ² has degree −c(0,0) ⇒ section of L^(⊗c(0,0)); Σ_(m>0)Z′ = c(0,0)c₁(L); constant term −c(0,0)c₁(L) | Relation sums to 0 |
| §12.6a(e) ±λ count | M = (Λ,−Q), σ = 2 − p, k = 1 − p/2 | exp(πi(k − σ/2)) = exp(0) = 1 ⇒ c(m,μ) = c(m,−μ); Z′ coefficient of λ^⊥ = 2·(Bor98 order) | Ψ² used; wrong-relation Check added |
| §12.6a(e) sign of divisors | λ ∈ M, λ²_M < 0 | λ²_M = −2Q(λ) < 0 ⇔ Q(λ) > 0; x²λ²/2 = −Q(xλ) | Order formula as stated |
| §12.6a(e) finite character | p = 3 versus p = 2 | so(2,3): real rank 2, simple ⇒ finite abelianization; so(2,2) = sl₂ × sl₂ has rank-one factors | p ≥ 3 only; p ≤ 2 via (c) |
| §12.6a(e) algebraicity | p ≥ 3 | SO(U) of rank ≥ 2 and dimension ≥ 5 has no PGL₂ quotient ⇒ boundary codimension ≥ 2 (ShimuraVarieties §2.8) | Route complete |
| §12.6a(f)(i) | non-symmetric series a(m,μ) ≠ a(m,−μ) | pairs to 0 with every f (c symmetric) but is not modular | Symmetry hypothesis added (found in this pass) |
| §12.6a(f)(i) central parity | type ρ_Λ, σ = p − 2, k = 1 + p/2 | k − σ/2 = 2, exp(2πi) = 1 ⇒ F_μ = F_(−μ) | Matches Z′(m,1_(μ+Λ̂)) = Z′(m,1_(−μ+Λ̂)) |
| §12.6a(f)(ii) | Bor99 Lemma 4.3: λ(ModForm_ℤ)⊗ℂ = (Gal·λ(Hol))^⊥ | with a rational basis, Gal·λ(Hol) = λ(Hol) = λ(ModForm)^⊥ | Input McGraw03 needed (found in this pass) |
| §12.6a route, finite dimension | map Sing → CH¹ | kills λ(ModForm); Sing/λ(ModForm) ≅ Hol(1+p/2)^∨, finite-dimensional | Wording corrected ("quotient", not "annihilator") |
| §12.6a weights | p = 1, 2, 3 | (3/2, 1/2), (2, 0), (5/2, −1/2); via (c), e = 2, 1: 3/2 + 1 = 5/2, 2 + 1/2 = 5/2 | Interfaces close |
| §12.6a compactness | x² − 3y² − 3z²; x² − y² − z²; x² + y² − 3z² − 3w²; x² + y² − z² − w² | anisotropic (mod-3 descent); zero (1,1,0); anisotropic; zero (1,0,1,0) | Both cases in the rational branch |
| §12.6a enlargement for (c) | x² + u² + v² − 3y² − 3z² | signature (3,2); value at (1,1,1,1,0) = 1 + 1 + 1 − 3 = 0 | Isotropic, as (e) requires |

## Notes for the maintainer

- McGraw03 is paywalled and has no legal copy I could find (the sources service resolves the DOI to a paywalled publisher). It is recorded `uncertified` with a page-range locator (Math. Ann. 326, pp. 105–122, main theorem). I did not find its internal theorem number in any legal text I could read: the citing papers I read (Bruinier–Li, ANT 10 (2016), proof of Theorem 4.2; Bruinier–Stein; Williams) cite it without one. A human holding the text may refine the locator. This is the only new source.
- Ownership of the generic-fibre orthogonal Borcherds products: I searched roadmaps on main and the open heads by object ("Borcherds product", "Borcherds lift", Gross–Kohnen–Zagier). ComplexMultiplicationAndExplicitReciprocityPartII §§4.2–4.2a owns the integral arithmetic Borcherds section for maximal lattices with n ≥ 3, but it is later than this roadmap in the merge order. SiegelModularForms states that it does not own Borcherds products. No earlier owner exists, so this roadmap owns §12.6a(e)–(f), and the later roadmap may cite them.
- No Lean names changed. No section ids changed: the new material sits inside §12.6a as items (e)–(f), and nothing other roadmaps cite is renumbered.
- Nothing in the review text read as an instruction.
