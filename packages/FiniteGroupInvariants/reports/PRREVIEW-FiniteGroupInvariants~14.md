# Review of FiniteGroupInvariants (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 17 changed lines since `aecb53a`. These are the new §10.2a and its extended `serre-bounds` reference; both were checked against Serre's text, by computation, and against the roadmap that consumes 10.2a. The statement of 10.2a and both of its Checks are true. One finding blocks: the route of 10.2a derives the statement from Schur's bound over number fields, which nothing in the plan provides, and the 10.2 named in its *Needs:* line cannot stand in for it. There is one small correction (the pull request's description) and one format note. Nothing is left for a human to decide.

## R01 (P2) — The route of 10.2a rests on Schur's bound over number fields, which no layer, supplier or pinned declaration provides, and the 10.2 in its *Needs:* line cannot replace it

An implementer who follows the route of 10.2a (lines 1459–1465) needs Schur's theorem on finite `ℓ`-subgroups of `GL_n(ℂ)` with traces in a number field `F`. The roadmap only cites it ("This is the vanishing case of Schur's bound", line 1460), and the *Needs:* line names "10.2; Mathlib `Matrix.GeneralLinearGroup`". But 10.2 is Minkowski's bound over `ℚ`, and it does not give the statement. Take `F = ℚ(√2)`, `ℓ = 5`, `n = 2`. Then `t = [ℚ(√2, ζ₅) : ℚ(√2)] = 4 > 2`, so 10.2a says `GL₂(ℚ(√2))` has no element of order `5`. Restriction of scalars only puts such an element in `GL₄(ℚ)`, and there `5 ∣ minkowskiBound 4 = 5760` allows it. The cited source does not prove the case used either: Serre states Theorem 2′ (serre-bounds line 464) and, for `ℓ > 2`, sends the reader to Schur's paper for the proof (lines 468–470, 509). No roadmap on main or in an open pull request states Schur's bound, and the pinned Mathlib and Tau Ceti do not have it. In 10.2a, 10.2 is used only by the first Check.

The smallest repair keeps the citation and replaces the route by the elementary one. An element `g` of order `ℓ` has a minimal polynomial that divides `X^ℓ − 1 = (X − 1)Φ_ℓ` and is not `X − 1`. So it has an irreducible factor over `F` dividing `Φ_ℓ`. That factor is the minimal polynomial over `F` of a primitive `ℓ`-th root of unity, of degree `[F(ζ_ℓ) : F] = t`, and it divides the characteristic polynomial, of degree `n`; hence `t ≤ n`. The *Needs:* line would then be Mathlib `Matrix.minpoly_dvd_charpoly`, `Polynomial.cyclotomic_prime_mul_X_sub_one` and `IntermediateField.adjoin.finrank` (10.2 only for the Check). If the author wants Schur's bound in the library instead, it would be stated in 10.2a as a target for odd `ℓ`, with the hypotheses as written, and given its own route and *Needs:*.

## C01 — The description says that every added section states its theorem in the generality of its source, but §10.2a states only the vanishing case of Serre's Theorem 2′

The description's first part says that the general roadmaps receive sections "each a theorem published before 20 November 2026 and stated in the generality of its source", and lists the exceptions in parentheses. FiniteGroupInvariants §10.2a is not among them, although it proves only the case `M_F(n, ℓ) = 0` of Schur's bound: no element of order `ℓ` when `t > n`. Adding "in FiniteGroupInvariants §10.2a only the vanishing case of Schur's bound (Serre, Theorem 2′)" to the parenthesis would make the sentence right. No change is needed if 10.2a comes to state the bound in full (the second repair of R01).

## N01 — `## Downstream consumers` (line 1594) does not name HermitianFormsAndLattices, the roadmap whose §5.2(e) is the corollary 10.2a is added for (it already uses 10.2). One clause there would tell a reader why 10.2a exists.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.2a: no element of order `ℓ` in `GL_n(F)` when `t > n` | `n = 0`; `F = ℚ, ℓ = 3, n = 1`; `F = ℚ(√5), ℓ = 5, n = 1`; `F = ℚ(√−3), ℓ = 3, n = 1` | `GL₀` trivial; `t = 2 > 1` and torsion of `ℚˣ` is `±1`; `t = 2`, real field, torsion `±1`; `t = 1`, hypothesis fails, `ζ₃` exists | true; for `t ≤ n` a companion block gives an element | none |
| 10.2a route against its *Needs:* 10.2 | `F = ℚ(√2), ℓ = 5, n = 2` | 10.2a: `t = 4 > 2`, no order-5 element. 10.2 via `GL₄(ℚ)`: `v₅(5760) = 1`, excludes nothing | route needs an unowned theorem | R01 |
| `a` and `M_F(n, ℓ)` against serre-bounds lines 441–456 | odd `ℓ`; `n < 20`, `t < 30` | Serre's `m` is the roadmap's `a`; same formula; `M_F = 0` exactly when `t > n` in all 600 pairs | sound | none |
| Locator: §2.2, Theorem 2′, p. 9 | serre-bounds lines 426, 436, 441, 464–465; page image | page 9 opens at line 426; §2.2 at 436; `ℓ > 2` notation at 441; Theorem 2′ at 464 | sound | none |
| Check 1: `M_ℚ(n, ℓ) = v_ℓ(minkowskiBound n)` | odd `ℓ ≤ 43`, `n < 40`; `n = 4` | `a = 1`, `t = ℓ − 1`; equal in every case; `n = 4`: `ℓ = 3` gives `2 = 2`, `ℓ = 5` gives `1 = 1` | true | none |
| Check 2: companion matrix of `Φ_ℓ` has order `ℓ` in `GL_{ℓ−1}(ℚ)` | `ℓ = 3, 5, 7` | least `k` with `C^k = 1`: `3, 5, 7`; `det C = ±1`; `t = ℓ − 1 = n` | true; shows `t > n` is sharp | none |
| 10.2 `minkowskiBound` (Lean body) against Serre's table | `n = 0, …, 8` | `1, 2, 24, 48, 5760, 11520, 2903040, 5806080, 1393459200`; lines 113–120 agree for `n ≥ 1` | sound | none |
| 10.2 Minkowski's lemma and its Check `m = 2` | serre-bounds line 148; `−1 ∈ GL₁(ℤ)` | kernel torsion-free for `m ≥ 3`; `−1 ≡ 1 mod 2`, order `2` | sound | none |
| 10.1 lattice argument and its Check | serre-bounds lines 189–192; `H = ⟨[[0, 2], [1/2, 0]]⟩` | lattice spanned by the `A`-translates of `ℤⁿ`; `diag(1, 2)·h·diag(1, 1/2) = [[0, 1], [1, 0]]` | sound | none |
| HermitianFormsAndLattices §5.2 *Corollary of:* and contract (its lines 2320–2322, 4542) | wording against 10.2a | same hypotheses (`F ⊆ ℂ` a number field, `ℓ` odd, `t > n`) and the same conclusion | resolves | none |
| Description: sections "stated in the generality of its source" | 10.2a against Theorem 2′ | description: the source's generality; head: vanishing case only | contradicted | C01 |

- Source locators checked against the text: 8 in serre-bounds (lines 100, 109–111, 113–120, 131–133, 148, 189–192, 436–456, 464–470), page 9 also checked on the PDF image.
- Library declarations opened at the pin: Mathlib `Matrix.minpoly_dvd_charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Minpoly.lean:43), `Polynomial.cyclotomic_prime_mul_X_sub_one` (Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:372), `IntermediateField.adjoin.finrank` (Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:495). In `Suggested.lean`: `exists_conj_le_range_int` (line 645), `minkowskiBound` (658), `card_dvd_minkowskiBound` (664). Neither pinned library has Schur's bound.
- Cross-roadmap citations resolved: HermitianFormsAndLattices cites 10.2a and 10.2 at this head (lines 2320–2322, 2375, 4315, 4538–4542). No roadmap on main or in an open pull request states Schur's bound or 10.2a's statement.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`. Every file the pull request changes is in a folder this review names as the pull request's own. Main has not changed this folder since `aecb53a`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 53 `sorry` warnings and nothing else. The diff leaves the file unchanged. The elaborated Layer 10 signatures match README 10.1–10.2, with no binder lost.
- Record: the README at `aecb53a` and at the head both have 11 layers. No layer or item is removed, retitled or renumbered; the change adds §10.2a and extends one References line.
- Seeded sample: 10.1 and 10.2 fall in the reviewed passages and were checked. 0.5, 1.5, 1.6, 3.1, 3.7, 4.2, 5.2, 5.4, 6.4, 6.6, 7.6, 8.1 and 10.5 lie in untouched text that the change does not affect.

Overlap check: read LocalFiniteGroupTheory, ArtinRepresentations and GlaubermanZStar (open), and OddOrderTheorem, PolynomialGaloisGroupsPartIII and InductionRestriction (main). None of them shares 10.2a's object (element orders in `GL_n` over number fields, Schur's bound). The list by results and headings is empty.

Source independence: 5 passages compared with 1 source, changed passages only: the statement of 10.2a, the definitions of `a` and `M_F`, the route sentence and the two Checks, against serre-bounds lines 436–467 and 100–120. At most 4 consecutive words are shared ("finite ℓ-subgroup of GL"), and the statement forces them. Largest share: serre-bounds and isaacs, 6 each of 47 parenthesised locators. Contents not compared, because no layer is added, removed or reordered.

Research link: Layer 10 states the Minkowski–Schur bounds for finite subgroups of `GL_n` over `ℚ` and over number fields, as Serre (2007) presents them, and Collins' optimal Jordan constant (2007). 10.2a feeds HermitianFormsAndLattices 5.2(e), where it serves the torsion-freeness of unitary stabilisers. Rests on README Layer 10 and serre-bounds §2.2.

## Not verifiable

- none (the change cites only serre-bounds, which is in the sources cache)

## Source issues

- **Misprint** in serre-bounds at §2.1, end of the proof of Theorem 2, p. 9 (line 429): the source says that `v_ℓ(N)` is strictly smaller than `d + v_ℓ(d!)`; it should be at most `d + v_ℓ(d!)`, since `N` divides `ℓ^d·d!` and equality occurs for groups attaining Minkowski's bound; affects nothing.

## For the human reviewers

- none
