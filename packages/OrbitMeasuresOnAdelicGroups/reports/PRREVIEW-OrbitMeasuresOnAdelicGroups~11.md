# Review of OrbitMeasuresOnAdelicGroups (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/OrbitMeasuresOnAdelicGroups/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 325 changed lines since `b8f3652`. I checked the rewritten Layer 4, the new labels of 2.6, 3.4a and 4.1 against AdelicAlgebraicGroups §§2.6 and 3.4a and ReductiveGroups §§7.1 and 9D.1, the seeded sample against Oesterlé and Sansuc, and the Lean file by elaboration. The new 4.1 is correct as stated, but two findings block acceptance: `Suggested.lean` states nothing of headline (4) although its `GL_n` clause can be stated with the pinned Mathlib and no library lemma proves it, and the `*Corollary of:*` line of 4.1 credits ReductiveGroups §7.1, a theorem over fields, with the commutativity in 4.1 (b) over every commutative `F`-algebra. There are five small corrections and one format note; the human reviewers' decision on sections leaving the family was applied, and four facts are listed for them.

## R01 (P2) — Headline (4) can be stated with the pinned Mathlib, but `Suggested.lean` states none of it and gives no reason

The file is the roadmap's acceptance test. As it stands, it tests nothing of the one headline that can be stated today. Its docstring says only "the fourth (4.1) is not stated here, so the file has no declaration" (`Suggested.lean`, line 8), without naming a missing carrier as the form requires.

Clause (a) of 4.1 needs only Mathlib's `Matrix.charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140), `Polynomial.Separable` (Mathlib/FieldTheory/Separable.lean:43), `Commute` and `Polynomial.aeval`. The statement below elaborates at the pin with `sorry` as its only warning. It is not padding: `exact?` times out on it and fails on the commutativity form, and `simp_all` and `aesop` make no progress. Neither Mathlib nor Tau Ceti at the pins has a lemma deriving a polynomial expression, or commutativity, from a separable characteristic polynomial.

The smallest change is to state (a), for instance

```lean
theorem eq_aeval_of_commute_of_charpoly_separable {k : Type*} [Field k] {n : Type*} [Fintype n]
    [DecidableEq n] (g y : Matrix n n k) (hg : g.charpoly.Separable) (hy : Commute g y) :
    ∃ p : Polynomial k, y = Polynomial.aeval g p := by
  sorry
```

if wanted with the commutativity of `Subgroup.centralizer {g}` in `GL n k`, and to name it in 4.1. For (b), either state it with the few definitions it needs (the trace form, the involution of `E[X]/(P)`) or say in the docstring which carrier is missing.

## R02 (P2) — The `*Corollary of:*` line of 4.1 credits ReductiveGroups §7.1, a theorem over fields, with the commutativity in 4.1 (b) over every commutative `F`-algebra

The README's Conventions say that what a `*Corollary of:*` line covers "is deduced from" the named theorem (lines 36–43). The line at line 562 lists the commutativity of "the centralisers" and "their being the points of a maximal torus", so it covers the centraliser of `γ` in `U(V)(R)` in 4.1 (b) for every commutative `F`-algebra `R`. For an `R` that is not a field, that deduction is not available.

ReductiveGroups §7.1 at this head is stated for `s ∈ G(k̄)` with `k̄` algebraically closed, and its (e) only for `s ∈ G(k)` with `k` a field. In (b), `γ = φ ∘ (α·) ∘ φ^{−1}` is an `R`-point that depends on `u` and `φ`. Take `R = F[ε]/(ε²)`. Then `γ` is not the base change of a point over a field, and the commutativity of its centraliser in `U(V)(R)` also needs the infinitesimal part (the centraliser of `γ` in the Lie algebra is commutative), which §7.1 does not state. When `R` is a field the deduction does go through: over `R̄`, `γ` is regular semisimple in `U(V)_{R̄} ≅ GL_n`, whose derived group `SL_n` is simply connected, so §7.1 (c), (d) and (e) make its centraliser a maximal torus. Statement (b) itself is true: its route computes the centraliser directly, and that is where the commutativity comes from for every `R`. The Summary's sentence "Their commutativity is a case of Steinberg's theorem on the centralisers of semisimple elements, ReductiveGroups §7.1" (line 5) goes equally far.

The smallest change: in the line at line 562, write "for (a), and for (b) when `R` is a field", and add that for other `R` the commutativity follows from the identification computed in (b). Restrict the Summary sentence the same way.

## C01 — The `*Origin:*` of 4.1 names Steinberg (1968) and Humphreys (1995) without any theorem or section

A reader cannot find which published result 4.1 is adapted from (line 550), and no locator in 4.1 can be checked. The text on `main` cited Steinberg, Theorem 8.1 and Humphreys, §2.11 for connectedness. ReductiveGroups §7.1 at this head cites Steinberg 1965, 2.7 (a), 2.8 and 2.11, among others for the regularity criterion that 4.1 specialises. For (a), the fact that a matrix with separable characteristic polynomial is cyclic, so that its commutant is `k[g]`, is standard linear algebra and could cite a textbook with its locator. Giving the locators would repair the label.

## C02 — The [FormalProof] paths of 4.1 point into an unpinned repository where those files no longer exist

The README cites `https://github.com/leanprover-community/riemann-hypothesis` with no commit (line 710, an entry this change extends). The three files cited in 4.1 (lines 572–588) are not on that repository's `main` today. They exist at commit `e2d63d2539` with the cited declarations, and they were renamed on 23 November 2026. For example, `GlobalTheory.SepCentralizer.exists_eq_aeval_of_commute` is now in `.../DivisorProofs/MatrixEqAevalOfCommute.lean`. The same holds for the files named in 2.6 (iv) (line 222) and in 3.4a (lines 368, 516). Naming the commit in the [FormalProof] reference would make every path checkable. Citing the declaration names alone would also work.

## C03 — The CM hypothesis of 4.1 (b) is not used by its route

The route uses only an extension `E/F` with an involution `c` whose fixed field is `F`, which is the generality of ReductiveGroups §9D.1 (any separable quadratic extension, characteristic not two). For the real quadratic `E = ℚ(√2)`, `n = 1` and `α = 3 + 2√2` (norm `9 − 8 = 1`), statement (b) holds: the centraliser of `γ` in `U(1)(R)` is all of `U(1)(R)`, the norm-one torus. The roadmap records the formal proof's form on purpose (its Conventions). It would cost one sentence to state the wider form beside it, as the Conventions allow, or to say in the method label that CM is the proof's restriction. The Conventions line "(b) is over a CM extension of number fields (ReductiveGroups §9D.1)" (line 22) also reads as if §9D.1 imposed CM, which it does not.

## C04 — DeligneLusztigTheory becomes a supplier only for a remark that supports none of 4.1's statements

The new contract "From TauCetiRoadmap.DeligneLusztigTheory" (line 669) and the Layer 4 Dependencies entry serve only the sentence at line 592, a pointer to where the Frobenius clause of the former 4.1 (e) now lives. DeligneLusztigTheory is not on `main`; it is added by this same pull request and rests on étale cohomology. If it is held back or split off, this roadmap on `main` is left naming a supplier that is not there, for a sentence that supports none of its statements. It would be enough to keep the pointer under Scope and ownership and drop the supplier contract and the Dependencies entry.

## C05 — The description does not say what changes in this roadmap's Layer 4

The description says that "ReductiveGroups [receives] the two centraliser theorems, accepted in the family's files". It does not say which roadmap they come from. Nor does it say that OrbitMeasuresOnAdelicGroups 4.1 now states only the formal proof's `GL_n` and unitary case (Layer 4 retitled), that this roadmap's `Suggested.lean` loses its two declarations, or that EndoscopicTransferAndUnitaryTraceComparison §1.3 is no longer a supplier. One sentence would cover it, for example: "OrbitMeasuresOnAdelicGroups 4.1 now states the centralisers of elements of `GL_n` with separable characteristic polynomial and of the regular elements of unitary groups attached to an irreducible polynomial; its former general statement and its two Lean theorems are ReductiveGroups §7.1, and it no longer cites EndoscopicTransferAndUnitaryTraceComparison §1.3."

## N01 — `universe u` in `Suggested.lean` (line 49) is declared and used by nothing

## Questions for the author

- The fibre formula of 2.6 *top-form-measure* over `ℝ` and `ℂ` is labelled "this roadmap's own formulation" (line 61). It is the classical Fubini formula for the relative (Gelfand–Leray) form of a submersion. Is there a published statement to cite, for example the homogeneous-space case in Weil 1961, Chapter II, §2.4? I could not open Weil 1961 to check.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.6 *top-form-measure*, scaling Check | `ω → 2ω` over `ℝ`, `ℂ`, `ℚ_2` | `|2|_ℝ = 2`, `|2|_ℂ = 4`, `|2|_{ℚ_2} = 1/2`; text: 2, 4, 1/2 | holds | none |
| 2.6 fibre formula Check | `x² + y²` on `ℝ² ∖ 0` | relative form `dx/(2y) = dθ/2`, fibre mass `π`; `∫_0^1 π dr = π` = disc area | holds | none |
| 2.6 `*Corollary of:*` | against AdelicAlgebraicGroups §2.6 | AA: no fibre formula; (i) general; (ii), (iii) only for `H` normal — exactly the line's list | holds | none |
| 2.6 (iii) Checks | `SL_2` on `F²`; `GL_2` on `PGL_2` | `q(q²−1)q^{−3} = 1 − q^{−2}` = primitive vectors of `𝒪²`; `(1−q^{−1})(1−q^{−2})/(1−q^{−1}) = 1 − q^{−2}` | holds | none |
| Headline (1), 3.4a *tamagawa-multiplicative-group* | `F = ℚ`, `ℚ(i)` | `κ_ℚ = 1 = ∏ d^×x_p(ℤ_p^×)`; `κ = 2π·1·1/(4·2) = π/4`; `dt/t` gives `π/2` | holds | none |
| 3.4a `*Corollary of:*` | against AdelicAlgebraicGroups §3.4a | AA: `τ(G_m) = 1`, `τ(N) = 1`, `τ(M ⋉ N) = τ(M)`, restriction; no `GL_j` formula, no central quotient | holds | none |
| Headline (3), *tamagawa-central-induced-quotient* | `GL_n → PGL_n`; `Res G_m → U(1)` | Sansuc (10.5.1) `τ(G′)τ(G″)/τ(G) = #coker`; `det|G_m = t^n` ⇒ `τ(PGL_n) = n`; `N|G_m = t²` ⇒ `τ(U(1)) = 2` | holds | note for humans |
| Headline (4), 4.1 (a) | distinct diagonal; `ℝ`, `X²+1`; `g = 1` in `GL_2`; `𝔽_2`, `X²+X+1`; `n = 0` | diagonal torus; `{a + bg} ≅ ℂ^×`; `gcd(P, P′) = X − 1`, centraliser non-abelian; `𝔽_4^×` order 3; trivial | holds | none |
| 4.1 (a) route | `P = ∏ P_i` distinct | char. poly on `V_i` is `P_i^{m_i}`, `∏ P_i^{m_i} = P` ⇒ `m_i = 1`, `dim V_i = deg P_i`; `Σ v_i` cyclic (CRT) | holds | none |
| 4.1 (b), involution and unitarity | general `P`; `n = 1` | `P^c(α^{−1}) = c(P(0))α^{−n}P(α) = 0`; `αᾱ = 1` preserves trace form; `n = 1`: condition ⇔ `αc(α) = 1` | holds | none |
| 4.1 (b), CM hypothesis | `ℚ(√2)/ℚ`, `n = 1`, `α = 3 + 2√2` | `N(α) = 9 − 8 = 1`; centraliser = `U(1)(R)` = norm-one torus | holds without CM | C03 |
| 4.1 `*Corollary of:*` for (b) | `R` a field; `R = F[ε]/(ε²)` | field: §7.1 (c), (d), (e) over `R̄` give a torus; `F[ε]`: `γ` not a field point, §7.1 silent | over-claim | R02 |
| 4.1 Example, `U(V)` on `ℚ(i)²` | `diag(1, −1)` | `P = (X−1)(X+1)` separable; centraliser in `GL_2` diagonal; in `U(V)(ℚ)`: `diag(u_1, u_2)`, `u_iū_i = 1` | holds | none |
| Headline (4) in `Suggested.lean` | Lean statement of (a) | elaborates, `sorry` only warning; `exact?` timeout/fails; `simp_all`, `aesop` no progress | statable, absent | R01 |
| Headlines (1)–(3) in `Suggested.lean` | carriers at pins | no normalised adelic Haar measure, top-form measure or Tamagawa measure in Mathlib or Tau Ceti; docstring names each | not statable, named | none |
| Decision: old 4.1 vs ReductiveGroups §7.1 | clause by clause | (a)–(d) and (e) fields of definition present; Frobenius clause only in DeligneLusztigTheory Layer 1 notation | moved | note for humans |

- Source locators checked against the text (12): Oesterle1984 I 2.3 and Thm 2.4, p. 18 (lines 241–252); I Def. 4.7, p. 22 (line 415); I Prop. 5.3, p. 23 (line 470); I Def. 5.9, p. 24 (line 508); I 5.12, p. 25 (line 538); I Ex. 5.14 (1), (2), p. 25 (lines 557–562); II Thm 1.3, p. 27 (line 621); III 3.1–3.2, Thm 3.3, pp. 36–37 (lines 1010–1033); III Thm 5.3, p. 41 (line 1166); Sansuc1981 Prop. 10.4 (line 2465) and Cor. 10.5, p. 77 (line 2565).
- Library declarations opened at the pins: Mathlib `Matrix.charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140), `Polynomial.Separable` (Mathlib/FieldTheory/Separable.lean:43). Mathlib and Tau Ceti were searched for a separable-polynomial centraliser lemma and none was found.
- Cross-roadmap citations resolved at this head (8): AdelicAlgebraicGroups §§2.6, 3.4a; ReductiveGroups §§7.1, 9D.1 and its `Suggested.lean` lines 330–362; DeligneLusztigTheory Layer 1 (README line 73); HermitianFormsAndLattices; FiniteReductiveGroups no longer cites 4.1, and no other roadmap on `main` or in an open pull request does.
- [FormalProof]: the three 4.1 declarations exist at commit `e2d63d2539`; `tamagawa_adelicHaar_eq_map_product_measure` there matches the form recorded in 2.6 (iv).
- Automatic checks: all passed. Dependency check: `depcheck: 130 roadmaps, 1454 edges, 0 problem(s)`. Nothing changed outside the pull request's own folders.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output (no declarations, no warnings), so there was no `#check @name` comparison to make.

Overlap check: read AdelicAlgebraicGroups, HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs (the open-roadmap and results lists are empty). The general theorems behind 2.6 and 3.4a are owned by AdelicAlgebraicGroups §§2.6 and 3.4a, cited here by `*Corollary of:*`. `τ(U(1)) = 2`, `τ(U(V)) = 2` and Siegel's main theorem are owned by HermitianFormsAndLattices, a consumer. The general centraliser theorem is owned by ReductiveGroups §7.1. Nothing is shared with ThetaKernelsForUnitaryDualPairs.

Source independence: changed passages only; 8 passages compared (the `*Origin:*` labels of 2.6 and 3.4a against Oesterle1984 I 2.3–5.14, II 1.3, III 3.1–5.3 and Sansuc1981 10.4–10.5; 4.1's statement, route, Checks and labels) with 2 sources, none shared (the sources are in French, and no clause follows them). Largest share Oesterle1984, 14 of 30 citations of printed sources. Contents not compared, since no layer was added, removed or reordered.

Research link: 2.6 and 3.4a are the Tamagawa-measure comparisons of Weil (1961), Oesterlé (1984) and Sansuc (1981) that HermitianFormsAndLattices uses for `τ(U(V)) = 2` and Siegel's main theorem. 4.1 is the case of Steinberg's centraliser theorem used in Alpöge's formal proof of GRH for Dirichlet L-functions (2026). Rests on the README and Oesterle1984.

## Not verifiable

- Tate 1950, §§4.3–4.4; Weil 1961, Chapter II, §2.4; Platonov–Rapinchuk–Rapinchuk 2023, Theorem 3.71: books; the roadmap's sources cache holds only Oesterle1984 and Sansuc1981, and I did not look elsewhere.
- Steinberg 1968 and Humphreys 1995 in the 4.1 `*Origin:*`: no locator is given, so nothing could be checked (C01).
- Weil 1965: recorded as uncertified (paywalled) and cited by its locator.
- The `*Method of the formal proof:*` paragraphs of 2.6 and 3.4a: I read the statements in [FormalProof] at commit `e2d63d2539`, not their proofs.

## Source issues

- none

## For the human reviewers

- Decision applied: the former 4.1 (a)–(e) is ReductiveGroups §7.1 (a)–(e) with its Checks, and its two Lean theorems are in ReductiveGroups `Suggested.lean` (lines 330–362). 4.1 keeps its id, narrowed to the formal proof's `GL_n` and unitary case.
- One clause of the former 4.1 (e), `F(C_G(s)°) = C_G(s)°` for a Frobenius or Steinberg endomorphism fixing `s`, is stated nowhere as a target. It is asserted only in the notation paragraph of DeligneLusztigTheory Layer 1 (its README line 73).
- 2.6 *top-form-measure* (without the fibre formula), *tamagawa-measure-unipotent-radical*, *homogeneous-gauge-measure* (i)–(iii) for normal `H`, and 3.4a's first two statements are stated almost word for word in AdelicAlgebraicGroups §§2.6 and 3.4a under the same slugs; this roadmap keeps them as corollaries.
- 3.4a *tamagawa-central-induced-quotient* is labelled "adapted". Its formula is the case of Sansuc1981, Cor. 10.5 (10.5.1), p. 77, where the kernel is an induced torus. Scope and ownership says no general roadmap states it.
