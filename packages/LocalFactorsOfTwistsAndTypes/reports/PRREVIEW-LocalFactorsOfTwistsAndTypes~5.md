# Review of LocalFactorsOfTwistsAndTypes (pull request #2889 at d6f67f5)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence. The paragraph added to 4.1 on what the family uses presents the irreducibility of a product of two irreducible unitarisable representations as a case of clause (ii); it is Bernstein's theorem, which no clause of 4.1 states, so a result the family uses is shown as covered when it is not. Everything else recomputed or reread holds: the statements, the Checks, the 19 formal-proof locators (all exist), the supplier citations and the Lean headline. There are five small corrections and one format note, none blocking. The family's premise and one licence fact are left for the human reviewers.

## R01 (P2) — The irreducibility of a product of two irreducible unitarisable representations is not a case of 4.1 (ii)

In 4.1 (lines 398–401) the text says: "Of (ii) it uses three cases: a product of two irreducible unitarisable representations is irreducible; …". Clause (ii) is Zelevinsky's criterion for products of segment representations `Z(Δ_i)` or `L(Δ_i)`. The first "case" is Bernstein's theorem on unitary representations, a different theorem. An implementer of the family who needs it is sent to (ii) and finds nothing there, and no other clause of 4.1 states it.

An instance that (ii) does not reach: the Speh representation `u(St, 2)` of `GL₄(F)`, the Langlands quotient of `Stν^{1/2} × Stν^{−1/2}`. It is irreducible and unitarisable. It is not generic, so by (vii) it is not a product of `L(Δ_i)` with unlinked segments; it is its own Zelevinsky dual, so it is not a product of unlinked `Z(Δ_i)` either. Its product with a unitary character is irreducible by Bernstein's theorem, and (ii) says nothing about it. The formal proof keeps the three statements apart from the segment criterion as well: `GlobalTheory.Published.BernsteinUnitaryProductIrreducible` (`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/BernsteinUnitaryProductIrreducible.lean`) and `GlobalTheory.Published.UnlinkedProductIrreducible` (`…/PublishedTheorems/GaloisGeometry₂/UnlinkedProductIrreducible.lean`). The second and third "cases" are cases of (vi), not of (ii): unramified twists include `ν^j`, and (vi) is Proposition 8.5, not Theorem 4.2.

The smallest change: replace "Of (ii) it uses three cases" by a sentence that says what each is. For example: "Besides these clauses the family uses that a product of two irreducible unitarisable representations is irreducible (Bernstein's theorem; in characteristic zero it is part of the unitary classification of AutomorphicSpectralTheory §7.0b), and two cases of (vi): …". If the roadmap is to own Bernstein's theorem over every nonarchimedean field, state it as a clause of 4.1 with a locator.

## C01 — Downstream consumers still names three sections that do not cite this roadmap, and omits three that do

Line 837 says that BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.35 (b)–(c) "consumes 4.1"; line 839 says that "AutomorphicSpectralTheory §3.6c consumes 5.1, and LevelOneAutomorphicFormsForClassicalGroups consumes 6.6 in its Conventions". None of the three names this roadmap. AutomorphicSpectralTheory is on main and its §3.6c assumes "RH in the number-field case" with no citation; LevelOneAutomorphicFormsForClassicalGroups at its open head does not contain the name; the base-change roadmap at its head cites this one only in §§10.29a, 10.30, 10.34, 14.2 and 15.1.

The sections that do consume 4.1 are ThetaKernelsForUnitaryDualPairs §3.47 (clauses (ii), (iv)) and §5.7d (clauses (ii)–(iv), (vi)); the base-change roadmap's §14.2 consumes 6.3. The paragraph lists none of them. Naming these, and saying "states the same hypothesis as 5.1 (6.6)" for the two roadmaps that only share a predicate, would make the paragraph true.

## C02 — 6.4 attributes to Henniart's Théorème 1.1 the supercuspidal form that the formal proof uses

Lines 605–608 say that the case with `π₁`, `π₂` supercuspidal, `F` of characteristic zero and `τ` over the irreducible representations of `GL_{n−1}(F)` "is Henniart's Théorème 1.1 (Henniart 1993)", and that the statement for generic `π_i` rests on other sources. Three texts say the 1993 theorem is the generic one: Henniart 2002, §1.9 (its text, lines 208–213) calls the statement for generic `π`, `π′` "[3, Thm. 1.1]" and gives the supercuspidal one in §1.4 as its corollary; Jacquet–Liu (its text, lines 53–54) and Chai (its text, lines 21–23) say the same. The route two lines below already cites it that way.

The form described is the formal proof's: `GlobalTheory.Published.LocalConverseGL` (`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/LocalConverseGL.lean`) has `CharZero`, cuspidal `π₁`, `π₂` of `GL_{m+1}` and all irreducible `τ` of `GL_m`, with pair `ε`-factors. Naming it there, as the convention paragraph promises, and saying it is a case of Henniart's theorem for generic representations, would be accurate. I could not read Henniart 1993 itself.

## C03 — Two formal-proof locators name a declaration that is not the statement, and two forms are left unnamed

- 3.3 (d), lines 257–259: "(d) is … (`GlobalTheory.InertZeta.Heis`)". `Heis` is only the description of the radical (row, column and corner relations, its group law, existence of an element with given row and corner). The length formula of (d) is `Pointwise`, the count `q^{2ℓ(g₀)+2Ne+f}` is `SmallCorner` with `Count`, and the sum is `GenFun`, all in the same file.
- 7.2 (iii), lines 807–810: "(iii) follows from … (`GlobalTheory.Core.Rk.IP.EulerRight`)". `EulerRight` is the unfolding identity of the doubling integral for `Re s > rank + 1`; it does not state convergence. The step used is `GlobalTheory.LFun.Bounded.converges` (`Development/AbelianVarietyTheory/Definitions/Foundations/NormEulerPolySubOneLe.lean`): parameters bounded by `Nw^κ` give convergence and non-vanishing for `Re s > κ + 1`, which with `κ = (n − 1)/2` is the abscissa `(n + 1)/2` of (iii).
- 3.4, lines 332–334: the "upper bound for the parameter of a `K₀`-fixed eigenvector with a bounded coefficient" is `GlobalTheory.Core.Rk.BdSplit.norm_le_of_isSatVecGL`, in the file 3.1 already cites; it is stated for completions of number fields. The docstring of `satake_bound_gl` sends the reader to "README 3.4" for forms of the formal proof, and 3.4 names none for case (i).
- References, line 915: the formal proof is said to have the form of 4.1 (vi), but 4.1 locates only (iii) and (iv). The form is `UnlinkedProductIrreducible` (see R01).

## C04 — Three published results still carry no locator

4.1 (i) is located only in the form `Z(𝔪)` (Theorem 6.1; I confirmed that its parts (b), (c) give `Z` only), while the text now says the family uses the form `L(𝔪′)`, as does the route of 6.5. A citation, or a derivation from SmoothRepresentationsOfLocalGroups §SR.3.3 *langlands-classification* with 1.1 and clauses (ii), (v), would close it. In 2.1 (lines 125–127) Morris 1993 and Bushnell–Kutzko 1998 are cited by title, with no theorem or section.

## C05 — The description no longer describes the head

Two things. The validation paragraph says the checks pass with two exceptions: the rule that a pull request changes only its own roadmap folder (it reports the family index files as changes outside it), and the merge-order check, "which reports that this roadmap is not yet placed in the merge order"; at this head every automatic check passes and the dependency check reports no problem, so "all automatic checks pass" is right. And the suppliers changed: SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4 is now a supplier (7.2), a roadmap still in an open pull request, which neither the prose nor the list of open suppliers names; ArithmeticGaloisRepresentations §§2.4–2.5 is no longer one (Weil–Deligne representations now come from SmoothRepresentationsOfLocalGroups §SR.5.2). The description should say both.

## N01 — TeX escapes in code spans

`1_{\{1\}}` (line 203) and `1_{\{ℓ = m\}}` (line 351) use TeX brace escapes inside code spans; `1_{1}` and `1_{ℓ = m}` read correctly.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 | `n = 1`; `χ₁ × χ₂`, `St` for `n = 2` | centred segments on one line nest, so unlinked; Zelevinsky 9.7 (a) read; ET §2.16 and AST §7.0b (`k = 1`) read | holds | none |
| 2.1 (added paragraph) | `GL_n`, vertex | `G_{y,0+} ⊇` a conjugate of `K₁`, so depth zero ⇔ `π^{K₁} ≠ 0`; formal form: fixed vectors pass to the support | holds | none |
| 2.1 (c), (d) | `GL₂`, `z = diag(ϖ, 1)`; `GL₁` | `T_s² = (q−1)T_s + q`, constant term `q ≠ 0`; SR *jacquet-lemma-smooth*: image is the eventual Hecke range | holds | none |
| 3.1 | trivial rep; `G = ℤ`, `ρ(m) = z^m` | `θ(1_S) = #S`; `|θ| = |z| > 1`; formal `norm_le_card`: `‖a‖ ≤ S.card` | holds | none |
| 3.2 | `n = 2`, `λ = (1,0)`; `Q = q²` | `Q^{1/2}(X₁+X₂)`; `Q^{⟨λ,ρ⟩} = q^{⟨λ,2ρ⟩}` | holds | none |
| 3.3 (b), (c) | `n = 4, q = 2`; `n = 2, q = 3`; `n = 3, q = 2` | `1, 90, 6192, 403200`; `12, 108, 972, 8748`; `18, 288, 4608 = (q³+1)q^{4m−3}` | holds | none |
| 3.3 Checks, `c(α)` | `n = 2, q = 3, α = 5`; `n = 3, q = 2, α = 7/2`; trivial `α` | series minus closed form: `0` through `X⁴` in all four cases | holds | none |
| 3.3 (d) | `N = 3, q = 2`; `n = 2, a = 0` | `Σ q^{2N⌊j/2⌋+j}X^j = (1+qX)/(1−y²)` to `X⁵`; `1/(1−yα) + (y/α)/(1−y/α) = (1−y²)/…`; formal `Count`: `q^{2(l+Ne)+f}` | holds | C03 |
| 3.4 (i) (headline) | trivial `α`; `GL₄` example | `Q^{m(n−1)/2}h_m(α_triv) = h_m(Q^{n−1},…,1)`; `θ(T₂) = 48.5, 279.3, 1088.25` against `35, 130, 357` | holds | none |
| 3.4 (ii) | `G₄`, `α = (q^{5/2}, q^{5/2})` | `q⁹ = 512, 19683` against `#(D/K₀) = 432, 9072`; formal bound `(q²)^{(n−1)/2}` | holds | none |
| `satake_bound_gl` | `n = 0, 1`; `r = 0`; `h ↦ θ(h^∨)` | `T₀ = [K₀]` proved; `θ(T_n⁻¹T_{n−r}) = Q^{r(n−r)/2}e_r(α⁻¹)`; exponent elaborates as `(1 − n)/2` | matches 3.4 (i) | none |
| 4.1 (ii), added paragraph | `u(St, 2) × χ` on `GL₅` | unitarisable factor, not generic, self-dual under Zelevinsky's involution: outside (ii) | false label | R01 |
| 4.1 (vi) | supports with no `σ′ν^j`, `|j| ≤ 1` | a union of two segments is a segment only if they meet or abut: unlinked; Prop. 8.5 read | holds | none |
| 4.2 | `rec(Sp(2))` | `L([ν^{−1}, 1]) = ν^{−1/2}St`, central character `|·|⁻¹ = rec₁(ω)` | holds | none |
| 5.1 | twist by `|det|^{−1/4}` | zeros shift by `1/4`, symmetric about `Re s = 3/4` | holds | none |
| 6.1 | `St` of `GL₂`; `α = β = 1` | `Σ q^{−m(σ+1)}` finite iff `σ > −1`; `Σ (m+1)²q^{−mσ}` diverges at `0` | holds | none |
| 6.2 | `χ × (χ₁ × χ₂)`; `|·|^{1/2} × St` | Tate product; `L(s+1,1)` against `L(s+1,1)L(s,1)`; Henniart 2002 §2.6 states multiplicativity | holds | none |
| 6.3 (headline) | `St`; trivial rep of `GL₂`; formal form | `α = 0`; not generic; formal: `CharZero`, pairs `±α`, `0 < α < 1/2` | holds | none |
| 6.4 (headline) | Jacquet–Liu Conj. 1.1, Thm 1.3; Henniart 2002 §§1.4, 1.9 | generic `τ`, ranks `≤ ⌊n/2⌋`, any nonarchimedean `F`; 1993 theorem is the generic one | holds; attribution | C02 |
| 6.5 (headline) | `St` under 1, 3, 4; `geometricArtinMap` | `r₂(St) = ω^{−1/2} ⊗ Sp(2)`, determinant exponent `−1 + 1 = 0`; ClassFieldTheory C.6: precomposition with inversion | holds | none |
| 7.1 | `n = 1, 2, 3`; formal `LocUnrInert` | shifts `{0}`, `{½, −½}`, `{1, 0, −1}`; formal `z′ + n/2 − i`, `i < n`, equals these at `z′ = z − ½` | holds | none |
| 7.2 (headline) | trivial rep; `U(2)` inert | abscissa `(n−1)/2 + 1 = (n+1)/2`; `(q_v, q_v⁻¹)` exceeds `q_v^{1/2}`; formal `κ + 1 < Re s` | holds | C03 |
| Downstream consumers | 11 cited sections | 8 cite this roadmap; AST §3.6c, LevelOne, BC §10.35 do not; TK §§3.47, 5.7d, BC §14.2 do and are absent | false pointers | C01 |

- Source locators checked against the text: 15 published (Zelevinsky 3.4, 4.2, 6.1, 7.5, 8.5, 9.3, 9.7 (a), (b); Henniart 2002 §§1.4, 1.9, 2.3, 2.6, 2.7 with pages 589–595; Jacquet–Liu Thm 1.3; Chai Thm 1.1) and 21 into the formal proof (19 in the README, 2 more in the Lean docstrings; every file and declaration exists, statements read).
- Library declarations opened at the pins: Mathlib `NumberTheory/HeckeRing/Defs.lean` 75, 189; Tau Ceti `NumberTheory/HeckeRing/Associativity.lean` 484, `NumberTheory/LFunctions/Data/Basic.lean` 82, `NumberTheory/LFunctions/Hecke/Primitive.lean` 91, `NumberTheory/ClassFieldTheory/Local/ArtinMap.lean` 114, `NumberTheory/ModularForms/Newforms/Satake.lean` 91.
- Cross-roadmap citations resolved: on main, SmoothRepresentationsOfLocalGroups (*pro-iwahori-torus*, *jacquet-lemma-smooth*, *wd-raw-parameters*, *wd-parameter-operations*, *iwahori-decomposition*, *positive-hecke-homomorphism*), EndoscopicTransferAndUnitaryTraceComparison §§2.16, 10.1, 10.23, 10.26, 10.28–10.30 and PartII §4.8, AutomorphicSpectralTheory §§3.6c, 7.0b, ClassFieldTheory C.6 and Layer 9, GL2AutomorphicRepresentationsAndTransfer §R16.0.1, ReductiveGroups 7c–7e, ReductiveGroupsPartII *moy-prasad-filtration*, ClassicalArithmeticCompletion §7.12b, MetaplecticAutomorphicForms §6.10a, AutomorphicLFunctionsAndLocalFactorsPartII §§2.3, 3.4, 10.2; at open heads, SmoothRepresentationsOfLocalGroupsPartII §§0.3–0.4, RiemannHypothesisStatementsAndConsequences §§9.2, 9.3, 9.5, HermitianFormsAndLattices §§2.1 (a), 4.2 (a), and the five consuming family roadmaps.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`. Nothing outside the folder changes except the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the `sorry` warning (line 123). `#check @` of the declarations compared with README 3.4 (i): every binder present, nothing changed. No `set_option`, no `lemma`, no sorried data.
- One-tactic probe on a scratch copy: `simp`, `rfl`, `constructor <;> simp`, `constructor <;> positivity` all leave `satake_bound_gl` open; a proved probe `heckeT n ϖ hϖ 0 = [K₀ 1 K₀]` compiles. The three definitions are the carriers the headline needs; no padding.
- Earlier small corrections: the reciprocity map of 6.5 is now "composed with inversion (ClassFieldTheory C.6)", repaired; 3.2 now has a locator; the rest are C01, C04, C05 and N01 above.
- Ownership against open pull requests: searched by object over the open heads and main; Bernstein's theorem and the unitary classification are AutomorphicSpectralTheory §7.0b on main.

Overlap check: read BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, FiniteReductiveGroups, ThetaLiftsForDefiniteUnitaryGroups, RowTowerAndRallisIdentities (open); SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII, EndoscopicTransferAndUnitaryTraceComparison (main). The open family roadmaps consume 2.1, 3.3, 3.4, 4.1, 6.3–6.5, 7.1, 7.2 and own none; `rec` and segments are owned by SmoothRepresentationsOfLocalGroups; pair factors over `p`-adic fields by EndoscopicTransferAndUnitaryTraceComparison §10.29, cited, with 6.2 keeping positive characteristic; coarse local transfer by AutomorphicLFunctionsAndLocalFactorsPartII §10.2, cited.

Source independence: 15 passages compared with 4 published sources (Zelevinsky 1980, Henniart 2002, Jacquet–Liu 2018, Chai 2019) and 21 statements with the formal proof; none shares wording beyond what the mathematics forces. Largest share: the formal proof, 19 of about 47 locators; its directory layout compared with the layers: independent (the cited files lie in six unrelated directories). Among published sources Zelevinsky 1980 has most (10), all in 4.1 and 1.1: independent. Henniart 1993, Jacquet–Piatetski-Shapiro–Shalika 1983, Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 and Harris–Kudla–Sweet 1996 could not be read.

Research link: 6.4 is the local converse theorem of Jacquet–Liu (2018) and Chai (2019); 6.5 is Henniart's uniqueness of the local Langlands correspondence (1993, 2002) behind Harris–Taylor (2001); 4.1 is Zelevinsky (1980). Layers 3 and 7 serve the formal proof of Alpöge (2026). Rests on the README's references and the four texts read.

## Not verifiable

- Henniart 1993, Théorème 1.1 and its corollary: paywalled; read only as recalled in Henniart 2002 §§1.4, 1.9.
- Jacquet–Piatetski-Shapiro–Shalika 1983, Theorem 3.1, §2, §8 (6.1, 6.2, 6.3, 6.5): no legal copy found in the cache.
- Moy–Prasad 1996, Morris 1993, Bushnell–Kutzko 1998 (2.1) and Harris–Kudla–Sweet 1996, §6 (7.1): not readable; 2.1 (c) for general `G` and `x` was checked only on `GL₂`.
- The announcement of the formal proof: not read; the formal proof's source was read directly.
- Whether the Props under `GlobalTheory.Published` in the formal proof are proved there or assumed was checked only for `GenericUnitaryDualGL`.

## Source issues

- none

## For the human reviewers

- **Scope.** The family follows a formal proof announced on 20 November 2026; 3.3, 3.4 (ii), 7.1 (local formula) and 7.2 cite only that proof, which is not a refereed publication (README References, line 915).
- **Licence.** The formal proof's repository says it "was published without a license". `integralGL` has the same one-line body as its `GlobalTheory.SplitWeil.KO`, and `heckeT` the same diagonal as `Formalism.UG.diagJ`; names and binders differ (`Suggested.lean`, lines 85–103).
- **Not tested.** Six published sources could not be read (listed under Not verifiable); wording was not compared with them.
