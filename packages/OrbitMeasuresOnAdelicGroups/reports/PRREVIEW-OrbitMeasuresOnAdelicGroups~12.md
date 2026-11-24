# Review of OrbitMeasuresOnAdelicGroups (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/OrbitMeasuresOnAdelicGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 351 changed lines since `b8f3652`. I checked the rewritten Layer 4 (4.1 (a) and (b), now over a quadratic extension of fields of characteristic zero, with their labels) against ReductiveGroups §§7.1 and 9D.1, Steinberg 1965 and the three cited files of the formal proof at the named commit; the labels of 2.6 and 3.4a against AdelicAlgebraicGroups §§2.6 and 3.4a, Oesterlé and Sansuc; and `Suggested.lean` by elaboration and a one-tactic probe. Both findings of the previous review are repaired and no finding remains: accepted, with one small correction and no format note. The human reviewers' decision on sections leaving the family was applied, and three facts are listed for them.

## C01 — The statement of 4.1 (a) does not use that `g` is invertible

4.1 (a) and `exists_eq_aeval_of_separable_charpoly` take `g ∈ GL_n(k)` (`Suggested.lean`, line 68), but only the matrix of `g` enters, and the route (a cyclic vector from the separable characteristic polynomial) never uses invertibility. For `g = diag(0, 1)` over any field, `P = X(X − 1)` is separable, the commuting matrices are the diagonal ones, and `diag(a, b) = p(g)` with `p = a + (b − a)X`. The formal proof's own statements are also for an arbitrary endomorphism or matrix: `GlobalTheory.SepCentralizer.exists_eq_aeval_of_commute` takes `g : Module.End K V`, and `GlobalTheory.T.commute_of_commute_of_charpoly_separable'` a matrix `y` with `y.charpoly.Separable`. An implementer who needs the commutant of a singular matrix would have to prove the theorem again.

It would be enough to state the Lean theorem for `g : Matrix n n k`, and to say in (a) that the description of the commutant holds for every `n × n` matrix with separable characteristic polynomial; the sentences on the centraliser in `GL_n(k)` stay as they are.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.1 (a), README and Lean | `n = 0`; `1 × 1`; `g = 1` in `GL_2`; `𝔽_2`, `X² + X + 1`; `diag(0, 1)` | empty matrix `= p(g)`; `(b) = C b` evaluated at `g`; `gcd(P, P′) = X − 1`, `E_12` commutes, not scalar; commutant `𝔽_4 = k[g]`, 4 elements; `diag(a, b) = (a + (b − a)X)(g)` | holds; holds without invertibility | C01 |
| 4.1 (a), elaborated type | signature against README | `∀ {k} [Field k] {n} [Fintype n] [DecidableEq n] (g : GL n k), (↑g).charpoly.Separable → ∀ {y}, Commute ↑g y → ∃ p, y = aeval ↑g p`; no binder lost | agrees | none |
| 4.1 (a), padding probe | `simp`; `simp_all`; `exact ⟨_, rfl⟩` | "no progress"; "no progress"; type mismatch | not padding | none |
| 4.1 (b), involution | general `P`; `n = 1`; `n = 2`, `E = ℚ(i)` | `0 = c(P(0))^{−1}α^n P^c(α^{−1})`; `X − a` ⇔ `a c(a) = 1`; `X² − aX + b` ⇔ `b c(b) = 1`, `a c(b) = c(a)`, e.g. `X² − 3X + 1` | well defined | none |
| 4.1 (b), `γ` unitary, centraliser | any `R`; dimension count | `Tr(u αᾱ yȳ′) = Tr(u yȳ′)`; commutant of `α` is `R ⊗ L` acting on a free rank-one module; `Tr(u(tt̄ − 1)yȳ′) = 0` ⇒ `tt̄ = 1`; torus dimension `[L : F]/2 = n` = rank of `U(n)` | holds | none |
| 4.1 (b) without CM | `ℚ(√2)/ℚ`, `n = 1`, `α = 3 + 2√2` | `N(α) = 9 − 8 = 1`; centraliser `U(1)(R)` = norm-one torus | holds; text now states this generality | none |
| 4.1 `*Corollary of:*` | `R` a field; `R = F[ε]/(ε²)` | field: `γ` regular semisimple in `U(V)_{R̄} ≅ GL_n`, `SL_n` simply connected, §7.1 (c), (d), (e) give a torus; `F[ε]`: line now excludes it | holds | none |
| 4.1 `*Origin:*` | Steinberg1965 lines 198–227 | 2.7 (a): identity component of the centraliser connected reductive of rank `r`; 2.11 (a) ⇔ (b) ⇔ (e): regular ⇔ maximal torus ⇔ `α(x) ≠ 1`; printed pp. 53–54 | supported | none |
| 4.1 [FormalProof] form of (b) | statement at the named commit | `[NumberField F] [NumberField E]`, `IsCMExt F E σ`, `k` any commutative `F`-algebra; conclusion: characteristic polynomial, regularity, injectivity, centraliser = range | as recorded | none |
| 4.1 Example, `ℚ(i)²` | `diag(1, −1)` | `P = (X − 1)(X + 1)`; commutant diagonal; in `U(V)(ℚ)`: `diag(u₁, u₂)`, `u_iū_i = 1` | holds | none |
| 2.6 (sample), `*Origin:*` and `*Corollary of:*` | Oesterle1984 lines 241–252, 415–417, 470–471, 1010–1033 | measure of a top form and its density (I 2.3, Thm 2.4, p. 18); Tamagawa measure (I Def. 4.7, p. 22); modulus `‖det Ad‖^{−1}` (I Prop. 5.3, p. 23); quotient measures for an exact sequence (III 3.1–3.3, pp. 36–37) | supported | none |
| 2.6 fibre formula Check | `x² + y²` on `ℝ² ∖ 0` | relative form `dx/(2y) = dθ/2`, mass `π`; `∫_0^1 π dr = π` | holds | none |
| 3.4a (sample), `*Origin:*` | Oesterle1984 lines 508, 538–562, 621–625, 1166–1170; Sansuc1981 lines 2565–2571 | I Def. 5.9, p. 24; 5.12 and Ex. 5.14 (1), (2), p. 25; II Thm 1.3 (d), p. 27; III Thm 5.3, p. 41; Cor. 10.5 (10.5.1), p. 77: `τ(G′)τ(G″)/τ(G) = #coker` | supported | none |
| 3.4a *tamagawa-central-induced-quotient* | `GL_n → PGL_n`; `Res G_m → U(1)`; norm sequence | `det|_{G_m} = t^n`, `i = n`; `N|_{G_m} = t²`, `τ(U(1)) = 2`; kernel `U(1)` not induced, formula would give `1/2` | holds | none |
| Headlines (1)–(3), (4) (b) in `Suggested.lean` | carriers at the pins | no normalised adelic Haar measure, top-form measure or Tamagawa measure; bilinear `baseChange` only, no sesquilinear one; docstring names each | not statable, named | none |

- Source locators checked against the text (15): Steinberg1965 2.7 (a), 2.8, 2.11 (lines 198–227, pp. 53–54); Oesterle1984 I 2.3, Thm 2.4, Def. 4.7, Prop. 5.3, Def. 5.9, 5.12, Ex. 5.14 (1), (2), II Thm 1.3, III 3.1–3.3, III Thm 5.3, IV Cor. 3.3 (line 1778, p. 56); Sansuc1981 Prop. 10.4 (line 2465), Cor. 10.5 (line 2565, p. 77).
- Library declarations opened at the pins (3): Mathlib `LinearMap.BilinForm.baseChange` (Mathlib/LinearAlgebra/BilinearForm/TensorProduct.lean:135), `Matrix.unitaryGroup` (Mathlib/LinearAlgebra/UnitaryGroup.lean:105); no file of Mathlib or Tau Ceti pairs `charpoly` with `Separable` in a centraliser lemma.
- Cross-roadmap citations resolved at this head (5): ReductiveGroups §7.1 (a)–(e) and §9D.1 (README lines 3115, 6030), its `Suggested.lean` lines 342 and 360; AdelicAlgebraicGroups §§2.6 and 3.4a (README lines 1951, 3353). No other roadmap in the pull request cites 4.1 for its former content.
- [FormalProof] at commit `e2d63d2539`: the three files cited in 4.1 exist with the cited declarations.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1440 edges, 0 problem(s)`. Nothing changed outside `TauCetiRoadmap/`.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses sorry` (line 67). The elaborated type of the one declaration was compared with 4.1 (a): nothing lost.
- Record against the merge base: Layers 2, 3 and 4 and the ids 2.6, 3.4a and 4.1 are kept; 4.1's former statement is ReductiveGroups §7.1 (decision applied, below).
- Description read against the head: its paragraph on this roadmap agrees with it (retitled Layer 4 and 4.1, (a) with its Lean name, (b) over fields of characteristic zero, the two Lean theorems moved, the supplier dropped).

Overlap check: read AdelicAlgebraicGroups, HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs (the open-roadmap and results lists are empty). The general theorems behind 2.6 and 3.4a are owned by AdelicAlgebraicGroups §§2.6 and 3.4a and cited here by `*Corollary of:*`; `τ(U(1)) = 2`, `τ(U(V)) = 2` and Siegel's main theorem are owned by HermitianFormsAndLattices, a consumer; the general centraliser theorem is owned by ReductiveGroups §7.1; nothing is shared with ThetaKernelsForUnitaryDualPairs.

Source independence: changed passages only; 9 passages compared (the `*Origin:*` labels of 2.6, 3.4a and 4.1, the statement, route and Checks of 4.1, the docstrings of `Suggested.lean`) with 3 sources (Oesterle1984, Sansuc1981, Steinberg1965), none shared; largest share Oesterle1984, 14 of 31 citations of printed sources; contents not compared, since no layer is added, removed or reordered.

Research link: 2.6 and 3.4a are the Tamagawa-measure comparisons of Weil (1961), Oesterlé (1984) and Sansuc (1981) that HermitianFormsAndLattices uses for `τ(U(V)) = 2` and Siegel's main theorem; 4.1 is the case of Steinberg's centraliser theorem (1965) used in Alpöge's formal proof of GRH for Dirichlet L-functions (2026). Rests on the README, Oesterle1984 and Steinberg1965.

## Previous findings

- R01 — repaired: `Suggested.lean` states 4.1 (a) as `exists_eq_aeval_of_separable_charpoly`, and its docstring says of (b) "It lacks the unitary group `U(V)` as a group functor on commutative `F`-algebras".
- R02 — repaired: the `*Corollary of:*` line of 4.1 now reads "in (b) when `R` is a field" and "for an `R` that is not a field the commutativity in (b) is not deduced from it"; the Summary says "On points over a field".
- C01 — repaired: the `*Origin:*` of 4.1 cites "Steinberg (1965), 2.7 (a), 2.8 and 2.11, pp. 53–54", which the text supports.
- C02 — repaired: the [FormalProof] reference names its commit.
- C03 — repaired: (b) is stated for "a quadratic extension of fields of characteristic zero", with the CM form recorded as the formal proof's.
- C04 — repaired: DeligneLusztigTheory is no longer a supplier and is not cited.
- C05 — repaired: the description has a paragraph on this roadmap that agrees with the head.
- N01 — repaired: `Suggested.lean` declares no universe.

## Not verifiable

- Tate 1950, §§4.3–4.4; Weil 1961, Chapter II, §2.4; Platonov–Rapinchuk–Rapinchuk 2023, Theorem 3.71: books not among the texts held for this roadmap; I did not look elsewhere.
- Weil 1965, Proposition 6 and §§42–43: recorded as uncertified (paywalled), cited by its locator.
- The `*Method of the formal proof:*` paragraphs of 2.6 and 3.4a: I read statements of [FormalProof] at the named commit, not their proofs.

## Source issues

- none

## For the human reviewers

- Decision applied: the former 4.1 (a)–(e) is ReductiveGroups §7.1 (a)–(e) with its Checks, and its two Lean theorems are in ReductiveGroups `Suggested.lean` (lines 342, 360); 4.1 keeps its id, narrowed to the `GL_n` and unitary case.
- One clause of the former 4.1 (e), `F(C_G(s)°) = C_G(s)°` for a Frobenius or Steinberg endomorphism fixing `s`, is a target nowhere; DeligneLusztigTheory asserts it in its Layer 1 notation (README line 73) and still lists this roadmap's 4.1 as its consumer (line 1063).
- 3.4a *tamagawa-central-induced-quotient* is labelled "adapted"; its formula is the case of Sansuc1981, Cor. 10.5 (10.5.1), p. 77, with an induced torus as kernel. Scope and ownership says no general roadmap states it.
