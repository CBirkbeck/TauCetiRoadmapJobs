<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1576#issuecomment-6398515709 -->
Red team round 1 pass b (claude) of b1efe60

Verdict: needs changes

1. **F01** (P1) Cited roadmap `SymplecticLFunctionsModSquares` exists nowhere

   **Location.** `packages/SymplecticReidemeisterTorsionModSquares/README.md:15` ("SymplecticLFunctionsModSquares consumes the resulting topology …") and `:1219` (section "Downstream consumers", first sentence).

   **Claim.** A roadmap named `SymplecticLFunctionsModSquares` consumes §§7.5, 7.6 and 8.2.

   **Witness.** `tauceti-roadmap roadmaps grep 'SymplecticLFunctionsModSquares'` returns "no match on main or in any open roadmap pull request" (main e9512ca, 362 open pull requests, index 2026-10-25T13:04Z); it is not a board package (`board/packages` has no such folder) and `design/plan.json` never mentions it (0 occurrences). A roadmap cited by name that exists nowhere is blocking under this pass's rules, whether cited as supplier or consumer.

   **Repair.** Replace line 15 by: "The arithmetic application (central values of symplectic L-functions modulo squares, Hurwitz and PEL geometry) is outside this roadmap's ownership and is not planned by any roadmap on main or in an open pull request." Replace the first sentence of "Downstream consumers" (line 1219) by: "No roadmap on main or in an open pull request consumes these results. Consumers can use the normalized topological theorem (§7.5), the odd-finite-field mapping-class identity (§7.6), real full-mod-two vanishing (§8.2), the circle formula (§4.4), normalized specialization (§3.5) and the boundary theorem (§2.8)." Keep the rest of that paragraph. Tested: after the edit the README names only roadmaps that exist (list under "Verified sound").

2. **F02** (P2) Three declared gaps bundle several theorems in one `needs` sentence

   **Location.** `README.md:111` (gap:arithmetic-scheme-frobenius-detection), `:91` (gap:real-chern-bockstein), `:99` (gap:dyadic-number-field-chern-rank); the same sentences in `design/plan.json` `gaps`.

   **Claim.** Each slug is one contract a supplier can close.

   **Witness.** gap:arithmetic-scheme-frobenius-detection asks for (i) Frobenius detection of quadratic quotients and independent pairs at closed points (consumed by §5.3 and §7.4, every characteristic), (ii) a cQ^d lower bound for the weighted nonsplit count in characteristic zero (§7.1 only), and (iii) a uniform O(q^(d−1)) bound on closed points of residue order q (§7.1 only); (i) is a Chebotarev statement, (iii) a Lang–Weil-type point count. A supplier that proves (i) cannot close the slug. gap:real-chern-bockstein asks for the components c₂₂, c₃₁, the metaplectic identification of c₂₂, and the Bockstein compatibility (§8.1 uses the identification, §8.2 the compatibility). gap:dyadic-number-field-chern-rank asks for a surjection, a rank bound and an injectivity statement (all §5.4). The brief's test for a declared gap is one precise `needs`; compound `needs` are a P2.

   **Repair.** Split, keeping the existing slugs for their first clause and adding slugs to `plan.json` `gaps` and to the README contracts:
   - `gap:arithmetic-scheme-frobenius-detection` — needs: "For every normal integral affine finite-type ℤ[1/2]-scheme, detect finite étale quadratic quotients and independent pairs of μ₂-classes by Frobenius at closed points, in every characteristic." Consumers: §5.3, §7.4, §7.1.
   - `gap:arithmetic-scheme-nonsplit-weight` (supplier Chebotarev, Layer 13 arithmetic-scheme extension) — needs: "For a connected nontrivial double cover of a normal integral affine finite-type ℤ[1/2]-scheme of characteristic zero and Krull dimension d, give c>0 and Q₀ with logarithmically weighted nonsplit closed-point count at least cQ^d for all Q≥Q₀." Consumer: §7.1.
   - `gap:arithmetic-scheme-residue-order-count` (supplier Chebotarev, Layer 13 arithmetic-scheme extension) — needs: "For a normal integral affine finite-type ℤ[1/2]-scheme of characteristic zero and Krull dimension d, one constant C with at most Cq^(d−1) closed points of residue field order q for every prime power q." Consumer: §7.1.
   - `gap:real-chern-bockstein` — needs: "Provide the real c₂₂ and c₃₁ components of the universal standard-representation étale c₂ for Sp₂ᵣ(ℝ) discrete, r≥1, and prove c₂₂ is the discrete pullback of the real metaplectic double-cover class." Consumer: §8.1. New `gap:real-chern-bockstein-compatibility` (KTheoryFiniteLocalFields §1.8) — needs: "Prove that the étale coefficient Bockstein of the slant of c₃₁ with a mod-two 3-cycle equals the slant of c₂₂ with the group Bockstein of that cycle." Consumer: §8.2.
   - `gap:dyadic-number-field-chern-rank` — needs: "For every number field F give the degree-three second Chern surjection from indecomposable K₃(F) onto H¹(F,ℤ₂(2))/2, normalized on the standard representation, with F₂-dimension of the target at least r₂(F)." New `gap:dyadic-number-field-chern-reduction` (K3BlochGroups §6.7) — needs: "Prove the coefficient reduction H¹(F,ℤ₂(2))/2 → H¹(F,μ₂) injective for every number field F, with real-place corrections." Consumer of both: §5.4.
   Update the `*Needs:*` lines of §§5.3, 5.4, 7.1, 7.4, 8.1, 8.2 to the slugs they use. Tested on §7.1: its route uses all three arithmetic-scheme slugs; §5.3 and §7.4 use only the first.

3. **F03** (P3) §6.3 cites Chebotarev Layer 7 for a prime in the class 1+h modulo 2h, which Layer 7 does not supply

   **Location.** `README.md:1037–1047` (§6.3, proof route and `*Needs:* Chebotarev Layer 7; Chebotarev Layer 13.`).

   **Claim.** The auxiliary prime r ≡ 1+h (mod 2h), unramified in E and K, comes from Chebotarev Layer 7.

   **Witness.** Chebotarev on main, Layer 7, 7.1 `exists_auxiliaryPrime`: the prime satisfies q ≡ 1 (mod n), q unramified in K and L, and cyclotomic irreducibility; no other residue class is offered. With n = 2h this gives (r−1)/h even, exactly the failing case of the section's own third Check (h = 4, r = 17). The needed input exists at the Mathlib pin: `Nat.forall_exists_prime_gt_and_eq_mod` in `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` (Dirichlet: for a unit a : ZMod q and any bound n there is a prime p > n with (p : ZMod q) = a).

   **Repair.** Add to "From Mathlib" (line 33): "`Nat.forall_exists_prime_gt_and_eq_mod` supplies a prime above any bound in the unit class 1+h modulo 2h." In §6.3's route replace "Use the coprime congruence class 1+h modulo 2h to choose r avoiding finitely many primes." by "Choose r > N in the unit class 1+h modulo 2h with `Nat.forall_exists_prime_gt_and_eq_mod`, N exceeding the primes ramified in E and K; Chebotarev 7.2 gives irreducibility of the r-th cyclotomic polynomial over K." Set `*Needs:* Nat.forall_exists_prime_gt_and_eq_mod; Chebotarev Layer 7 (7.2); Chebotarev Layer 13.` Tested: gcd(1+h, 2h) = 1 for even h, so the class is a unit; r = 13 for h = 4 lies in it and 17 does not.

4. **F04** (P3) "AlgebraicTopology Stage 6.3" is cited for chain-level Poincaré–Lefschetz duality, which is item 6.4 on main

   **Location.** `README.md:55` ("Stage 6, especially 6.1 and 6.3: cup products, relative fundamental classes and chain-level Poincaré–Lefschetz duality"), `:57` (gap:poincare-boundary-cone, supplier section "Stage 6.3"), and the Stage 6 `*Needs:*` entries at `:269`, `:515`, `:578`, `:804`.

   **Claim.** Stage 6.3 states the duality.

   **Witness.** AlgebraicTopology on main, Stage 6: item 1 defines cochains, item 2 cup products, item 3 the integral orientation local system `or_U(x)=H_m(U,U∖{x};ℤ)` and the boundaryless interior construction, item 4 both Poincaré–Lefschetz isomorphisms by cap product and `compactTriadPoincareLefschetz` for compact manifolds, with empty boundary giving Poincaré duality.

   **Repair.** Line 55: "Stage 6, especially 6.1, 6.3 and 6.4: cup products, the orientation local system and relative fundamental classes, and chain-level Poincaré–Lefschetz duality (`compactTriadPoincareLefschetz`)." The gap's `section` in `plan.json` is frozen after the design; record in the README contract "(gap:poincare-boundary-cone, against Stage 6.4's `compactTriadPoincareLefschetz`)". Tested: the three objects the contract names (relative adjoint, boundary cochains, outward-first duality) are all item-4 objects.

5. **F05** (P3) Line locators that point at page breaks or off the statement

   **Location.** `README.md` citations with these `line` values.

   **Claim.** Each `line N` is the statement cited.

   **Witness and repair** (verified against the cached texts; each replacement line begins the cited statement):
   - AV-v1 line 3397 (§1.4, "Appendix B.4.1") is a page marker; B.4.1 begins at AV-v1 line 3415, (B.13) at line 3427 (also fixes the §1.5 citation of line 3407, a diagram line).
   - AV-v1 line 3494 (§1.6, "B.4.2–B.4.3") is a page marker; B.4.2 begins at line 3498, (B.15) at 3513, B.4.3 at 3526.
   - AV-v1 line 3536 (§1.7, "B.5, (B.18)") is a page marker; B.5 begins at line 3565, (B.18) is line 3583.
   - AV-v1 line 3591 (§1.8, "(B.18)–(B.19)") is a page marker; (B.19) is line 3588.
   - AV-v1 line 3629 (§2.7, "B.6, (B.20)–(B.23)") is a page marker; B.6 begins at line 3653, (B.20) with the formula for r is line 3675.
   - AV-v1 line 3822 (§4.1 and §4.4, "B.9.1, (B.31)") is a page marker; B.9.1 begins at line 3842, (B.31) is line 3854.
   - AV-v1 line 82 (§7.6, "(1.5), p. 3") is a page marker; (1.5) is line 94.
   - AV-v1 line 509 (§2.3) is on p. 12 and concerns orientation-independence of the fibre volume (the §2.2 fact); triangulation-independence is AV-v1 lines 3766–3769. Cite line 3766 in §2.3 and move 509 to §2.2.
   - JRV line 854 (References, "Lemma 6.1, p. 18") is a page marker; Lemma 6.1 is JRV line 855.
   All other 59 distinct line locators land on the cited statement (counts below). Pages: all cited page ranges contain the marker page of the cited line; Thom line 2527 is PDF page 65 = printed p. 81 as cited; JRV Theorem 5.1 is on p. 16 as cited.

Files reviewed in full: `packages/SymplecticReidemeisterTorsionModSquares/README.md` (1233 lines, 60 targets), `packages/SymplecticReidemeisterTorsionModSquares/Suggested.lean` (57 lines, one declaration), `sources.toml`, `metadata.toml`, `design/plan.json` (gaps). Pins: Tau Ceti a91d3aa, Mathlib 6b7abb3c, read from local read-only copies at exactly those commits. The board checkout has no Lake environment, so the Lean file is **not built** here; its names and binders were checked against the pinned sources by grep (details under "Verified sound").

Dependency gate output (no UPWARD or CYCLE line):

```text
depcheck: 52 roadmaps, 588 edges, 0 problem(s)
```

## Verified sound

**Lean declaration (1 read), against the pins by grep, not built.** `zassenhaus_primary_formula`: `TauCeti.QuadraticMap.orthogonalGroup Q : Subgroup (V ≃ₗ[K] V)` (TauCeti `LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`, namespace `TauCeti.QuadraticMap`), so `A.val.toLinearMap` typechecks; `CliffordAlgebra.orthogonalSpinorNorm Q hQ : orthogonalGroup Q →* Multiplicative (SquareClassGroup K)` with the file's variables `[Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V] [Invertible (2:K)]` and `hQ : Q.Nondegenerate` = Mathlib `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean`), all carried explicitly in the declaration; `TauCeti.squareClassHom : Kˣ →* Multiplicative (SquareClassGroup K)` so both sides have the same type; `Module.Basis` (namespace `Module`), `LinearMap.restrict (hf : ∀ x ∈ p, f x ∈ q)`, `LinearMap.det`, `Matrix.det`, `QuadraticMap.associated` all exist at the pin; `associated_eq_self_apply` gives B(v,v)=Q(v) as the Conventions say. The import `TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Basic` exists and publicly re-exports the square-class module. The pinned reflection convention is `orthogonalSpinorNorm (reflectionOrthogonal Q v) = squareClassHom (unitOfInvertible (Q v))`, i.e. [Q v], as README line 9 states. Elaboration itself: not built (no Lake environment in the board checkout).

**Truth of the Lean statement (adversarial instances; D = Gram det on V₋ times det((1+A)/2 on U)).**

| instance | V₋, U | D | spinor norm at the pin | result |
|---|---|---|---|---|
| V = 0, A = 1 | 0, 0 | 1·1 = 1 | 1 | ok |
| A = 1 on I₂ | 0, V | det(1) = 1 | 1 | ok |
| A = −1 on (2) | V, 0 | 2 | reflection in v, Q(v)=2: [2] | ok; (3) gives [3] |
| A = −1 on hyperbolic plane | V, 0 | −1 | ∏Q over e±f = 2·(−2): [−1] | ok |
| reflection in e₁+e₂ on I₂ over ℚ | span(e₁+e₂), span(e₁−e₂) | 2·1 = 2 | [Q(e₁+e₂)] = [2] | ok |
| rotation [[0,−1],[1,0]] on I₂ over ℚ | 0, V | det t/4 = 2/4 | two reflections, Q = 1 and 2: [2] | ok ([1/2]=[2]) |
| 3-cycle in the S₃ permutation form | 0, V | det(1+A)/8 = 2/8 | [2]² = 1 | ok ([1/4]=1) |
| [i,j] = −I on the quaternion norm I₄ | V, 0 | 1 | 1 | ok |
| diag(U,U^{−T}) on H⊕H over 𝔽₃, U unipotent | 0, V | (2·2)(2·2)/16 = 1 | unipotent is a square: 1 | ok |
| −diag(U,U^{−T}) over 𝔽₃ | V, 0 | disc(H⊕H) = 1 | [−1]^{…}·1 = disc = 1 | ok |

The formula is JRV Theorem 5.1/(5.1) (JRV lines 782–800) with Ψ = the associated form; JRV's (−2)^{−(dim V−v₋)} q₋(−1) equals det((1+A)/2 on U). The `hU` binder is a proposition, the basis `b` only changes the Gram determinant by a square, and the exponent dim V is stable (Fitting), so the universal quantification is not vacuous and the statement is at the README's generality (every field with 2 invertible, full O(Q), no even-dimension or determinant hypothesis; README §4.1 says the same).

**Headlines and padding.** The module docstring lists every other headline (boundary theorem §2.8, evenness §3.2, circle and mapping-torus formulas §§4.4, 4.6, Gaussian witness §4.8, goodness §§5.1–7.3, universal comparison §§7.4–7.6, real vanishing §8.2) with the missing carrier; none is statable at the pins (no cellular cochains with local coefficients on smooth manifolds, no signed Poincaré-complex structure, no oriented bordism, no étale Chern class of a discrete group representation). The single declaration is a theorem of JRV used as the acceptance test of §4.1; nothing restates a definition, a Check or a small value. No `lemma`, `set_option`, pull-request number or process word in the package (grep).

**Targets read: 60 of 60** (Layers 0–8). Values computed on each side:

| statement | instances | values | result |
|---|---|---|---|
| §0.3 boundary of R in degree 0, f=(a) | a = 0 and a ≠ 0 | D^{−1}=R, D^0=R, d=(a·x,0), cross pairing −α(y)+β(x) | matches Check 2 |
| §0.6 parity | C⁰=C¹=K², d=J; 𝔽₂ model d=1 | rank d⁰ = 2 even; over 𝔽₂ the closedness law 2xy=0 holds, χ≤0 = 0, lower rank 1 | theorem and negative control both correct |
| §0.6 proof | form T(d⁰x,y) | T(dx,y) = −T(dy,x) from closedness + symmetry; radical = ker d⁰ by strictness | alternating, even rank |
| §1.3 signs | n = 0..4 | n(n−1)/2 = 0,0,1,3,6 | 1,1,−1,−1,1 |
| §2.4 duality sign (−1)^{dχ} | point d=1; closed 3-manifold; point d=2 | −1; +1; +1 | matches |
| §2.5/2.6/2.8 S³, constant K² | χ½ = 2−0 | ∂D⁴ gives (−1)^{1}RT = 1, RT = [−1], N = 1 | matches AV (2.6), Thm 2.2 |
| §2.8 rank 4 on S³ | χ½ = 4 | RT = RT(K²)²·[(−1)^{2·2}] = 1 | matches |
| §2.7 (B.23) | C=K² in degree 0, n=4; C=K² in degree 2 with alternating f | χ(C)=2, χ½(D)=−2, r≡0; χ(C)=2, D acyclic rank-2 block, r≡1 | matches Checks 2 and 3 |
| §3.2 L(3,1), constant K² | char 3; char 0 | dim H¹ = 2·dim Hom(ℤ/3,K) = 2; 0 | χ½ = 0; 2 |
| §3.2 mapping torus, T = 1 on 4-dim H¹ | Wang | H⁰=0, H¹ = ker(1−T) dim 4 | χ½ = −4 |
| §3.4/3.5 ℚ[s]_(s) family | A = diag(1+s,(1+s)⁻¹)⊕I₂ on H⊕H | generic h=2, r=1: RT = −(2+s)²/(4(1+s)) ≡ [−(1+s)], N = [1+s]; special h=4: RT = 1, N = 1 | commutes with s→0 |
| §4.3 sign budget | h/2 + n/2 + r with r = (n−h)/2 | = n, even | sign 1 |
| §4.3 Checks | rotation on I₂; A = 1 on I₂ | det P = 1/2, RT = [2]; RT = [−1], (−1)^{1}RT = 1 | matches |
| §4.4 𝔽₃ unipotent | n=4, h=2, r=1 | RT = (−1)^{3}·1·1 = [−1], θ = 1 | matches |
| §4.4 route | V₋ block | det(1−A) = 2^{dim V₋}, dim V₋ even by det A = 1 | square |
| §4.5 dimension | g=2, r=1; constant genus-2 | 4r(g−1) = 4; dims 2, 8, 2, χ = −4 | matches |
| §4.6 formula | T with x⁴+1 | det(1−T) = 2 | matches |
| §4.7 | genus-2 relator | a₁-coefficient 1−ρ(a₁b₁a₁⁻¹); dim V³/ι(V) = 4 | matches |
| §4.8 Gaussian systems | exact arithmetic in ℚ(i) | system 1: relator = I, all four intertwining residuals 0, t(R) conjugate to R, charpoly of T̃ = x⁶+x⁴+x²+1 = (x²+1)(x⁴+1), T̃ι(v) = ι(M⁻¹v), quotient x⁴+1, det(1−T̃) = 4, det(1−M⁻¹) = 2, h = 0; reversed twist order: residual nonzero exactly on b₂; system 2: (x²+1)³ → (x²+1)², 8/2 = 4; (1−i)²i = 2 | every value in §4.8 and "Worked examples" reproduced |
| §5.4 | ℚ; ℚ(i); K3BlochGroups §2.4 Check | r₂ = 0; 2^1 = 2; ℤ/48→ℤ/24 | matches |
| §5.5 | residue degree ≥ 2 | ≤ [L:ℚ]π(√X) log X / X = O(X^{−1/2}) | bound stated is weaker, true |
| §5.7 | E₁=E₂ quadratic; disjoint quadratics | 2 vs 4; 3 of 4 | matches |
| §5.8 | p ≡ 3 mod 4 in ℚ(i) | norm p², weight → 0 | matches |
| §6.3 | h=4, r=5,13,17 | (r−1)/4 = 1,3,4; conjugation image nontrivial, nontrivial, trivial | matches; see R03 |
| §6.4 | δ=1/2; δ=1/4 | h=8, N=4: 7/128 > 1/128; h=12, N=6: 5/256 > 1/1024; minimal h gives δ/(2h) ≥ δ³/16 | recurrence correct |
| §7.1 | Spec ℤ[1/2,t] | Σ_{p≤Q} p log p ~ Q²/2; bad weight ≤ CQ^{d−1}·o(Q) + O(Q^{d−1/2}(log Q)²) = o(Q^d) | matches |
| §7.2 | Sp₂(𝔽₃) | order 24, Sylow order 8, index 3, 8⁻¹ = 2 in 𝔽₃ | matches |
| §7.3 | 𝔽₉ | H₂(SL₂(𝔽₉);ℤ) = ℤ/3 (Schur multiplier of 2.A₆), H₂[2] = 0 | matches KTheoryFiniteLocalFields §1.9 |
| §8.1/8.2 | C₂ | β(t) = t² ≠ 0, β(t²) = 0; integral class reduces to t² | matches |

**Checks tested: 73 of about 190** with the values above or in the preceding list; the remainder read for consistency with their section's formulas; no false, vacuous or restated Check found; every definition has at least three.

**Locators verified: 68 distinct line locators** (AV-v1 65, JRV 2, Thom 1) read in the cached texts; 59 land on the cited statement, 9 are listed in R05. Statements restated in the README checked against the source text: Theorem 2.1 (AV-v1 line 422), (2.6) and the evenness claim (578–603), Theorem 2.2 (605), Lemmas 2.7.1–2.7.2 (700–742), Lemma 2.9.1 (767), Definition 2.11.1 (881), Lemmas 2.11.1–2.11.3 (890, 903, 913), Lemmas 2.12.1–2.12.3 with the h and N ≥ h/2 choices (953, 973, 992–1066), §§2.13–2.16 (1096–1152), §1.3.3 (230–248), A.1–A.7 (2832–3107), B.1–B.5 (3181–3597), B.6 with (B.23) (3653–3750), B.7–B.7.1 (3751–3801), B.9 with (B.30)–(B.31) and the characteristic-zero remark (3835–3875), Lemma C.2.1 and (C.2) (4073–4084), C.3–C.4 (4142–4246); JRV Theorem 5.1 and (5.1) (782–800); Thom Théorème IV.13 (2527). The README's Layer 4 proves the circle and mapping-torus formulas in every odd characteristic where AV-v1 assumes characteristic zero (AV-v1 lines 3869–3871, 4073); the route given (alternating form B((A−A⁻¹)x/2, y) with radical ker(1−A), strict splitting, Zassenhaus) is correct as checked above.

**Sibling citations checked: 12 roadmaps, 31 section citations**, all present where cited: TangentialBordism (#942 head: B1, B2.1–B2.5, B3.1 with Ω^SO_0=ℤ, Ω^SO_{1,2,3}=0), StableHomotopyKTheory (#1227: §§1.17, 1.30, 1.32), KTheoryLowDegrees (#1248: §§14.1–14.4; `detLine_shift/quasiIso/acyclic/cone`, [R—u→R] coefficient u⁻¹ agrees with Conventions), KTheoryFiniteLocalFields (#1281: §§1.5 with multiplier (q^{di}−1)/(q^i−1) = q²+1 at d=i=2, 1.8 universal equivariant Chern classes and slant, 1.9 finite-rank symplectic degree three, H₂(SL₂(𝔽₉))=ℤ/3, 𝔽₃→[−1], 𝔽₅→[2]), MetaplecticAutomorphicForms (#1063: §2.4b, zero-dimensional cover μ₂), K3BlochGroups (rev/1430: §§2.4, 2.5, 4.20, 6.7; ℤ/48→ℤ/24 Check agrees), AlgebraicTopology (Stages 2, 4, 5 with Wang sequence and `p_* transfer = d·id`, 6; see R04), GeometricTopology (Layers 1, 11, smoothing-and-triangulation comparison, which main marks "far horizon" — covered by gap:smooth-cell-comparison), Chebotarev (Layers 7, 11 with 11.3, 13; see R03), PadicMeasuresIwasawaAlgebras (§5.1 with `detLine_dual`), SchemeAndStackFoundations (§§0.9, 0.21, 2.9, 2.11 with the Kummer sequence and Pic[n]), RepresentationTheory/LieGroups (Layer 5, universal cover with kernel π₁). The nine gap slugs in the README equal the nine in `plan.json`; every supplier is on main or earlier in the merge order or an other-author new-folder pull request. Tau Ceti's `Geometry/Symplectic/Lagrangian/Basic.lean` is indeed over ℝ (`Module ℝ V`), as line 7 says; `SymplecticGroup.det_eq_one` is over `[CommRing R]`, as line 33 says.

**Duplication by object.** `roadmaps grep` over main and all open pull requests for "Reidemeister torsion", "Zassenhaus", "semicharacteristic", "spinor norm", "spinor norm" with "eigenspace"/"characteristic polynomial": no roadmap states the Zassenhaus formula, the semicharacteristic, the normalized torsion or the torsion–Chern comparison; OrthogonalSpinGroups on main has no eigenspace formula; GeometryOfNumbersAndQuadraticArithmetic (#851) uses the spinor norm for spinor genera only; FunctionFieldArithmetic (rev/1474) cites AV-v1 §3.2 for the L-function determinant identity only. MorseNovikov (#1161, not in the merge order, not a sibling of this brief) plans its own determinant line and based acyclic torsion over a field (its N4); this package does not cite it and takes those objects from the earlier owners KTheoryLowDegrees §14.4 and PadicMeasuresIwasawaAlgebras §5.1, so the overlap is MorseNovikov's to resolve, not this package's.

## Not verifiable

- Lean elaboration of `Suggested.lean` and the `#check @zassenhaus_primary_formula` comparison: not built (no Lake environment in the board checkout; names, namespaces and binders checked by grep at the pins instead).
- TangentialBordism's position in the merge order: it is an open pull request (#942) absent from ORDER.txt and from `plan.json`; the gate accepts it, but its final placement relative to this roadmap is for the intake.
- Minimality of the O(q^(d−1)) clause of gap:arithmetic-scheme-frobenius-detection: whether an earlier roadmap (WeilConjectures or another Lang–Weil owner) already states a uniform point-count bound for fibres of a finite-type ℤ-scheme was not established.
- Ownership against open pull requests other than those listed in the brief and those found by `roadmaps grep` was not checked file by file.

## Source issues

- **Error** in AV-v1 at proof of Lemma 2.7.1, p. 16 (line 700): the source says integral H₂ of Sp₂ᵣ(𝔽_q) and SL₂ᵣ(𝔽_q) vanishes for every odd q; it should be that H₂ has odd order, since H₂(SL₂(𝔽₉);ℤ) ≅ ℤ/3; affects the proof (the conclusion H₃/2 = H₃(𝔽₂) survives).
- **Error** in AV-v1 at §2.7, p. 17 (lines 745–747) and Lemma 2.11.1, p. 20 (lines 890–892): the source says one nonsquare raw torsion RT(M,ρ) over k makes k good, and that L(√α) is controlling for α = RT(M,ρ); it should be the normalized class (−1)^{χ½/2}RT, which is what the proofs use (S³ with the constant K² system has RT = [−1], nonsquare over 𝔽₃, but normalized value 1); affects the proof (the paper's witness has χ½ = 0, so its application stands).
- **Misprint** in AV-v1 at (C.2), p. 87 (lines 4080–4082): the source says δ is the discriminant of the form on the fixed space H¹(S,ρ)^{T=1}; it should be the generalized 1-eigenspace, as in (B.31), since the fixed space can be isotropic (the 𝔽₃ unipotent model has δ = 0 there); affects a stated result in the non-semisimple case only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b1efe60", "job": "RT-SymplecticReidemeisterTorsionModSquares~1b", "model": "fable", "worker": "fable-rt33"} -->
