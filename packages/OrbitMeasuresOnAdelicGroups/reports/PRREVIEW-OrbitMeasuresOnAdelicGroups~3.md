# Review of OrbitMeasuresOnAdelicGroups (pull request #2879 at 44bf70f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/OrbitMeasuresOnAdelicGroups/`
**Verdict:** needs changes

**Summary.** The mathematics holds up. Every Check, worked example and route constant I recomputed is correct, the Oesterlé and Sansuc locators support the statements as written, and the two Lean statements say what 4.1 says. There is one finding, about ownership: 4.1 restates, in every characteristic, the centraliser targets that EndoscopicTransferAndUnitaryTraceComparison §1.3 on main already owns in characteristic zero, and does not cite them. There are four small corrections and no format notes. The human reviewers have two things to decide: the family premise, and the six cited texts that could not be read.

## R01 (P2) — 4.1 restates in every characteristic the centraliser targets that EndoscopicTransferAndUnitaryTraceComparison §1.3 on main owns in characteristic zero, without citing them

As written, the characteristic-zero case of three statements has two owners. They are the reductivity of `C_G(s)°`, the connectedness of `C_G(s)` when the derived group is simply connected, and the criterion that `C_G(s)` is a maximal torus when it is abelian. An implementer cannot tell which roadmap's target to formalise. EndoscopicTransferAndUnitaryTraceComparison is on main, so it comes before this roadmap, and the open roadmap is the one that has to cite.

Its §1.3 (README on main, line 142) makes these facts targets of its own. It lists, over `F̄` for `F` of characteristic 0, reductivity of the semisimple centraliser, connectedness for a simply connected `G_der`, and the strongly regular torus criterion as API to prove, with a root-decomposition route. Here, 4.1 (a), (c) and (d) (lines 427–434) state the same over every algebraically closed field. Neither 4.1's *Needs:* line (lines 459–462) nor the supplier contracts (lines 500–541) cite §1.3. The Scope (line 498) mentions §1.3 but runs the other way: it calls §1.3's targets cases of this roadmap's statements and closes with "The statements here are the general forms".

The general statement is still worth stating, because FiniteReductiveGroups §0.3 needs positive characteristic. The smallest repair has three parts:
- In 4.1, add one sentence saying that in characteristic zero the reductivity in (a), statement (c) and the torus criterion in (d) are the targets of EndoscopicTransferAndUnitaryTraceComparison §1.3, and that 4.1 extends them to every characteristic.
- Add §1.3 to the *Needs:* line, and add a `From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison` contract.
- Reword the Scope sentence to match.

The Lean statements can stay general: in characteristic zero they then follow from §1.3. If you prefer, 4.1 could instead be narrowed to positive characteristic.

## C01 — Two citations carry no locator, and one carries only a chapter

These citations cannot be checked against their sources:
- [Tate] for the volume `κ_F` of the norm-one idele classes, in *tamagawa-multiplicative-group* (line 263);
- [Weil 1965] for the residue form `dx/dQ`, in *homogeneous-gauge-measure* (line 164);
- [Weil], Chapter II, for the measure of a top form, in *top-form-measure* (line 52), which gives a chapter only.

Give a theorem or section and a page for each. For Tate, that is the theorem computing the volume of the norm-one idele classes in the printing cited under References. For Weil 1965, it is the section that introduces `dx/dQ`.

## C02 — Oesterlé's Proposition 5.3 gives the inverse of the modular character used here

*tamagawa-measure-unipotent-radical* (line 92) cites [Oesterlé], Proposition 5.3, p. 23, for the modulus of `G(𝔸)`. It states that the modular character of `H(𝔸)` is `mn ↦ |χ(m)|_𝔸`, and its Borel Check gives `|t|_𝔸²`. Oesterlé's proposition gives the modulus as `g ↦ ‖det Ad(g)‖⁻¹` (Oesterle1984 lines 470–471, in Bourbaki's convention), so a reader who checks the locator finds the opposite exponent. The README's convention is that of Mathlib's `MeasureTheory.Measure.modularCharacter` through AdelicAlgebraicGroups §2.2, and I recomputed it as correct: on the Borel subgroup of `SL₂`, right translation by `a(s)` multiplies the left Haar measure by `|s|^{−2}`. One clause after the citation, saying that Oesterlé's modulus is the inverse character, would remove the apparent contradiction.

## C03 — The description's dependency sentence does not fit this roadmap

"Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first." No sub-roadmap of the family is a supplier here. The two that the README names, HermitianFormsAndLattices and FiniteReductiveGroups, consume this roadmap and merge after it. The only supplier still open is LogicAndDefinabilityInNumberTheory. Suggested text: "The only supplier still in an open pull request is LogicAndDefinabilityInNumberTheory, which merges first; within the family, HermitianFormsAndLattices and FiniteReductiveGroups consume this roadmap and merge after it."

## C04 — The family index describes this roadmap as treating quotients by central tori

In `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 55–56 credit this roadmap with "Tamagawa numbers of semidirect products and of quotients by central tori". The quotient formula of 3.4a holds only for central *induced* tori, and its own `U(1)` Check shows it failing for a central torus that is not induced. The line also omits `τ(G_m)` and the top-form measures. A more accurate line: "Tamagawa measures of top forms and on homogeneous spaces of adelic groups, the Tamagawa numbers of `G_m`, of groups with a unipotent radical and of quotients by central induced tori, and centralisers of semisimple elements."

## Questions for the author

- DifferentialGeometry 5.5a on main builds densities on real manifolds and their integrals, with chart independence proved by the absolute-determinant change of variables. Should the real case of *top-form-measure* cite it for chart independence? I did not check whether 5.5a yields a measure, rather than an integration functional, in the form 2.6 needs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.6 *top-form-measure*, `G_m` Check | `ω = dT/T` on `ℤ_p^×` | `∫_{ℤ_p^×}|1/T|_p dT = 1 − p⁻¹`; AdelicAlgebraicGroups §2.4 Check gives `1 − q_v⁻¹` | holds |
| 2.6 fibre formula, `x² + y²` over `ℝ` | `ω = dx∧dy`, `ω′ = dr` | `dx/(2y) ∧ (2x dx + 2y dy) = dx∧dy`; circle mass `∫ dφ/2 = π`; `∫_0^1 π dr = π` = disc area | holds |
| 2.6 scaling `2ω` | `ℝ`, `ℂ`, `ℚ_2` | `|2|_ℝ = 2`, `|2|_ℂ = 4`, `|2|_2 = 1/2` | holds |
| 2.6 sign against LogicAndDefinability §2.12 | `a = xy`, `d = 2`, `d′ = 1` | `ρ∧π*ω′ = (−1)^{(d−d′)d′} π*ω′∧ρ`; §2.12 gives `−dx/x`, 2.6 gives `+dx/x`; same measure | holds |
| *tamagawa-measure-unipotent-radical*, modulus | Borel `B ⊂ SL₂`, `a(s)` | `Ad(a(t))` on `𝔫`: `t²`; left Haar `du dt/|t|³`; `μ(E·a(s)⁻¹) = |s|² μ(E) = |χ|` (Mathlib convention) | holds (C02) |
| same, product measure left Haar | left `n′`, left `m′` | `(m,n) ↦ (m, (m⁻¹n′m)n)` shear preserves `ω_M∧ω_N`; agrees with AdelicAlgebraicGroups §3.1 `δ⁻¹ dn dm` in `(n,m)` coordinates | holds |
| same, `Δ_K = Δ_G|_K` for normal `K` | Weil formula | `∫_{G/K}∫_K f(gk)` is left Haar; right `k₀` scales by `Δ_K(k₀)` | holds |
| *homogeneous-gauge-measure*, Borel on `G_m` Check | `n(u)a(t)` coordinates | left `a(s)`: `(u,t) ↦ (s²u, st)`, Jacobian `s³`, so `du∧dt/t³`; right form `du∧dt/t`; base `|t|^{−3}|dt|` | holds |
| same, `SL₂ × G_m` on `𝔸²` Check | `x = e₁` | stabiliser `[[s,u],[0,s⁻¹]]`; `(1,s)` pulls `dy₁∧dy₂` to `s^{−2}`; `det Ad_H = s²` | holds |
| same, affine group of the line Check | `(a,b)` | `Ad(a,b)(α,β) = (α, aβ − bα)`, determinant `a`; `dy ↦ a dy` | holds |
| (iii), `SL₂` on `F²` | `H = N` | primitive vectors `1 − q⁻²`; `#SL₂(k)q⁻³ = 1 − q⁻²`; `|ω_N|(N(𝒪_v)) = 1` | holds |
| (iii), `GL₂` on `PGL₂` | `H` scalars, cokernel `ℤ/2` | `(1−q⁻¹)(1−q⁻²)/(1−q⁻¹) = 1 − q⁻² = #PGL₂(k)q⁻³`; `ρ = κ_F` both | holds |
| (iii), hypothesis needed | `G_m` on `𝔸¹`, `x = 1`, `H = 1` | `X*(G) = ℤ → 0` not injective; `∏(1 − q⁻¹) = 0`, so no product measure | exclusion correct |
| (iii), constants | general | `|d|^{−dim G/2}/|d|^{−dim H/2} = |d|^{−dim X/2}`; `ρ_G = ρ_H` from equal Artin `L` of `X*⊗ℚ` | holds |
| (iv), `x²+y²+z²` Check | `{Φ = r}` | area/`2√r`; mass `4πr/(2√r) = 2π√r`; `∫_0^1 = 4π/3` | holds |
| (iv), order of factors | `Φ = y` | `ω_X∧dy = dx∧dy ⇒ ω_X = dx`; reversed gives `−dx` | holds |
| (iv), `∏c_v` | `F ⊂ 𝔸_F` | covolume `|d_F|^{1/2}` (AnalyticNumberTheoryPartII §5.3h) ⇒ `∏c_v = |d_F|^{−dim A/2}` | holds |
| 3.4a *tamagawa-multiplicative-group*, `ℚ` | `{1}×Ẑ^×` | `d^×x({x_∞∈[1,e]}×Ẑ^×) = 1` ⇒ `μ¹ = 1 = κ_ℚ` | holds |
| same, `ℚ(i)` | `h = R = 1`, `w = 4`, `|d| = 4` | `κ = 2π/(4·2) = π/4`; `2dxdy/|z|² = dθ⊗2dr/r`; `2π·(1/2)/4 = π/4`; `dt/t` gives `π/2` | holds |
| same, route constants | finite `v` | `λ_v|dx/x|_v = N𝔇_v^{1/2} d^×x_v` (§5.3j); `∏N𝔇_v = |d_F|` ⇒ `τ_{G_m} = κ⁻¹d^×x` | holds |
| *tamagawa-number-unipotent-radical*, side of translate | `(a,b)`, `a > 0` | left Haar `da db/a²`; `(a,0)(1,b′) ⇒ (da/a)db′`; `(1,b)(a,0) ⇒ (da/a)(db/a)` | holds |
| same, fibres | `m ∈ M(𝔸)¹` | conjugation scales `τ_N` by `|χ(m)|^{±1} = 1`; fibre volume `τ(N)`; Heisenberg `1·1 = 1` | holds |
| *tamagawa-central-induced-quotient*, `GL_n` | `T₁ = G_m` | `det|_{G_m} = t^n`, `i = n`, `τ(PGL_n) = n`; Sansuc Cor 10.5: `τ(T₁)τ(G₃)/τ(G₂) = i` | holds |
| same, `GL₂×G_m` | scalars of `GL₂` | `ℤdet ⊕ ℤpr₂ → 2ℤ`, `i = 2`, kernel `ℤpr₂ = X*(G₃)`; `2 = τ(PGL₂)τ(G_m)` | holds |
| same, `U(1)` | quadratic `E/F` | `N|_{G_m} = t²`, `τ(U(1)) = 2`; norm sequence `i = 1` gives `1/2 ≠ 1`, kernel not induced | holds |
| same, lattice index | `A ⊂ L`, index `i` | `Hom(L,ℤ) ⊂ Hom(A,ℤ)` index `i` ⇒ `da₂ = i·da_{T₁}⊗da₃` ⇒ `τ¹₂ = i⁻¹τ¹_{T₁}⊗τ¹₃` | holds |
| 4.1 Checks | `GL_n`, `PGL₂`, `SL₂` | `w·diag(1,−1)·w⁻¹ = −diag(1,−1)` in `PGL₂`; `w·diag(t,1)·w⁻¹ ≡ diag(t,1)` iff `t² = 1` | holds |
| 4.1 route, `n_β` | `SL₂` matrices | `[[1,1],[0,1]][[1,0],[−1,1]][[1,1],[0,1]] = [[0,1],[−1,0]]`; `Ad(n_β)𝔤_β = 𝔤_{−β}` | holds |
| 4.1 (c), reduction | `s = zs′` | `g = z₁d` commutes with `s′` iff `d` does ⇒ `C_G(s) = Z°·C_{G^der}(s′)` | holds |
| Lean 4.1 (a) | `#print` at pin | `reductiveCommHopfAlgProperty` includes smooth and geometrically connected; reduced centraliser has the points of `C_G(s)`; one-tactic probe fails | faithful |
| Lean 4.1 (c) | `#print` at pin | simply connected = central isogenies onto `G^der` are isomorphisms; geometric connectedness over `k̄` | faithful |
| R01, ownership | EndoscopicTransfer §1.3 line 142 (main) | §1.3 owns char-0 reductivity, connectedness, torus criterion; 4.1 states all characteristics; no citation | finding |
| Headlines 1–3, statability | grep at pins | no restricted-product Haar measure on adeles or ideles, no gauge-form measure in Mathlib or Tau Ceti | docstring accurate |

- Source locators checked against the text: 11. Oesterle1984: Introduction p. 13; I Def. 4.7 p. 22; Prop. 5.3 p. 23; Def. 5.9 p. 24; Def. 5.12 p. 25; Ex. 5.14 (1), (2) p. 25; III Thm 3.3 p. 37; III Thm 5.3 p. 41; IV Cor. 3.3 p. 56. Sansuc1981: Cor. 10.5 p. 77. All support the statements as written.
- Library declarations opened at the pins: 14 cited names resolved by `#check`. Definitions read: Tau Ceti `Reductive/Basic.lean:71`, `Radical/Basic.lean:58`, `Unipotent/Basic.lean:132`, `Isogeny/Basic.lean:78`, `SimplyConnected/Basic.lean:65`, `Adeles/LocallyCompact.lean:41`; Mathlib `Calculus/Implicit.lean:159`, `GroupCohomology/Shapiro.lean:58`, `GroupCohomology/Hilbert90.lean:30`.
- Cross-roadmap citations resolved:
  - AdelicAlgebraicGroups §§0.3, 1.1, 1.4, 2.1, 2.2, 2.4, 2.5, 3.4 and nine slugs;
  - ReductiveGroupsPartII RG2.0, RG2.3.7;
  - ReductiveGroups Layers 3, 5, 7, 7C, 9E;
  - AnalyticNumberTheoryPartII §§5.3f, 5.3h, 5.3j, 5.3k;
  - LogicAndDefinabilityInNumberTheory §§2.7, 2.12 at its open head;
  - consumers HermitianFormsAndLattices §§6.0–6.5 and FiniteReductiveGroups §0.3.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`.
- Elaboration: a copy of `Suggested.lean` elaborates with only the two `sorry` warnings.
- Signatures: `#check @name` of both declarations matches the README statements. No binder is lost, and nothing was changed.

Overlap check: I read the scope of HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups and FiniteReductiveGroups (open), and of AdelicAlgebraicGroups, ReductiveGroupsPartIII and EndoscopicTransferAndUnitaryTraceComparisonPartII (main); the list by results was empty.
- Nothing is shared with these, except that HermitianFormsAndLattices and FiniteReductiveGroups consume this roadmap.
- One object is shared outside these lists: the characteristic-zero centraliser facts of 4.1, owned by EndoscopicTransferAndUnitaryTraceComparison §1.3 on main (R01).
- GeometryOfNumbersAndQuadraticArithmetic §3.3 (main) uses special cases inside its own targets (τ(PGL₁(D)) = 2, orthogonal stabilisers, `dx/dQ`). The general statements are owned here.
- The nonarchimedean top-form measure and its Fubini formula are owned by LogicAndDefinabilityInNumberTheory §§2.7 and 2.12, which this roadmap cites.

Source independence: 11 passages compared with 2 sources at their locators, plus 5 further passages (routes of *tamagawa-measure-unipotent-radical*, *homogeneous-gauge-measure* (iii), *tamagawa-number-unipotent-radical*, *tamagawa-central-induced-quotient*, 4.1) compared with Oesterle1984; none shared, and nothing is translated clause by clause. Largest share Oesterle1984, 11 of 17 locators. Contents compared with Oesterle1984 (Chapters I–VI, p. 14): independent. Weil, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg and Humphreys could not be read.

Research link: Layers 2–3 are the Tamagawa-measure comparisons of Weil (1961, 1965), Sansuc (1981) and Oesterlé (1984), which HermitianFormsAndLattices uses for τ(U(V)) = 2, local densities and Siegel's main theorem for Hermitian lattices. Layer 4 is Steinberg's connectedness theorem (1968), used in Deligne–Lusztig theory by FiniteReductiveGroups. This rests on the README's overview and its Downstream consumers.

## Not verifiable

- Weil, *Adeles and Algebraic Groups*, Chapter II and §2.4: a book with no open copy; not in the manifest.
- Platonov–Rapinchuk–Rapinchuk, Theorem 3.71, p. 196: a 2023 Cambridge University Press book, behind a paywall.
- Weil 1965, Acta Mathematica 113: the sources service resolved DOI 10.1007/BF02391774 only to a paywalled page.
- Tate's thesis in Cassels–Fröhlich: no open copy; not in the manifest.
- Steinberg, Memoirs AMS 80, Theorem 8.1: the sources service found no legal source.
- Humphreys, *Conjugacy classes in semisimple algebraic groups*, §2.11: the sources service found no legal source.

## Source issues

- none

## For the human reviewers

- The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14) and the description say that the family follows a formal proof of RH for Dirichlet L-functions announced on 20 November 2026. I did not verify this. This roadmap's content is standard Tamagawa theory and does not depend on it.
- Not tested: six cited texts (Weil 1961, Platonov–Rapinchuk–Rapinchuk, Tate, Weil 1965, Steinberg, Humphreys) could not be read legally, so I did not compare the wording against them. The source with the largest share, Oesterle1984, was read.
