# Review of CharacteristicClasses (pull request #1807 at 3adc047)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since ac36c47. `TauCetiRoadmap/CharacteristicClasses/` is byte-identical to the head the previous review read (`git diff ac36c47..HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty), and the pull request description is unchanged. The commits since then touch only `TauCetiRoadmap/ClassifyingSpaces/README.md` and `TauCetiRoadmap/TopologicalKTheory/README.md`; neither repairs anything this folder was asked to change. All five findings of the previous review therefore stand and are written again below, with their witnesses re-read at this head. R01 is blocking.

## R01 (P2) — the compact-generation coreflection is cited from AlgebraicTopology Stage 4.5, which says it does not own it

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:25–28`: "AlgebraicTopology Stage 4.5 supplies the compact-generation coreflection and the compactly generated substrate on which the stable colimits are formed". Also `:436–440`: "Consume AlgebraicTopology Stage 4.5's compact-generation coreflection k, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, with its counit …".

Claim: supplier drift. The supplier is cited for an object it says another roadmap owns, and that other roadmap is one this roadmap may never cite. Among the roadmaps this one may consume, the coreflection has no owner.
- `TauCetiRoadmap/AlgebraicTopology/README.md:125–127` at this head: HomotopySpheres §3A.1 "owns the compact-generation coreflection and CW comparison consumed by 4.5's kified CW product, 8.10 and 8.11a/b". Stage 4.5 consumes it; it owns only the realization product comparison.
- HomotopySpheres is on the never-cite list.
- At the pin, Mathlib's `Topology/Category/CompactlyGenerated.lean` has `of`, `ofHom`, `compactlyGeneratedToTop` and `fullyFaithfulCompactlyGeneratedToTop`, no coreflector; the only pinned coreflector is `TopCat.toDeltaGenerated` (`Topology/Category/DeltaGenerated.lean:64`).

Witness: `grep -n "Stage 4.5" TauCetiRoadmap/CharacteristicClasses/README.md` returns lines 26 and 436, both about the coreflection; `AlgebraicTopology/README.md:125–127` as quoted.

Repair: the stable carriers do not need the coreflection. TopologicalKTheory T1.6a already forms them "in CompactlyGenerated, with underlying weak-CW union topology" (`TauCetiRoadmap/TopologicalKTheory/README.md:672–675` at this head).
- Lines 25–29: replace the sentence with "TopK T1.6a forms the fixed-rank and stable colimits in Mathlib's `CompactlyGenerated`, with underlying weak-CW union topology; the stable O/SO and ΩBSO comparisons are downstream consumers of these classifiers, not inputs to the finite oriented-cover comparison."
- Lines 436–440: delete "Consume AlgebraicTopology Stage 4.5's compact-generation coreflection … for the stable carriers." Write instead: "Compute singular chains and cochains of the stable carriers on the underlying weak-CW union topology of TopK T1.6a; C3.6's direct-union argument applies to that space."
- If a k-ification is still wanted (products of stable carriers), state it as this item's own target: the functor, its universal property against compact Hausdorff test spaces, and the fact that singular simplices are unchanged because every standard simplex is compact Hausdorff.

Test: afterwards `grep -n "Stage 4.5"` returns nothing, and the remaining AT4.5 citations are the pushout names `relativeCWPushout`, `homotopyPushoutGluingComparison` and `relativeCWPushoutCWModel`, present at `AlgebraicTopology/README.md:659, 673, 731`.

## R02 (P3) — C1.1d and C1 item 2 plan, or take from a supplier's plan, principal-bundle and Bockstein API that the pinned Tau Ceti has

Location: `README.md:452–456` ("define a global trivialization as an equivariant bundle isomorphism P≃X×G … Construct its equivalence with global sections, using the bundle division map, and prove the inverse formulas and pullback laws"); `:479–481` ("Changing the hemisphere sections to s_N a and s_S b changes c to a⁻¹cb"); `:571–574` ("Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and Bockstein construction …"); `:1579–1580` ("LieHighestWeight L9's `LieAlgebra.HasCentralRadical`").

Claim: the README names none of the pinned carriers it re-plans. `grep -c "PrincipalBundle\|singularCohomologyBockstein\|trivializationOfSection"` on the README gives 0.
- `Topology/FiberBundle/Principal.lean` at the pin: `TauCeti.PrincipalBundle`, `TauCeti.PrincipalBundle.division`, `TauCeti.PrincipalBundle.trivializationOfSection` (a section continuous on an open U gives the equivariant trivialization `p ↦ (p.proj, division G (σ p.proj) p)`; U = X is the README's τ), `TauCeti.PrincipalBundle.pullback`, `Bundle.Trivialization.coordChange_eq_mul`.
- `Topology/FiberBundle/GroupCocycle.lean`: `TauCeti.fiberBundleCoreOfGroupCocycle`, its principal instance (line 294), `TauCeti.homeomorphOfCohomologous` (line 198), whose change of sections by `h` gives `h_i⁻¹ g_ij h_j`; with i = N, j = S, h_N = a, h_S = b this is the README's `a⁻¹cb`.
- `AlgebraicTopology/Cohomology/Bockstein.lean`: `TopCat.singularCohomologyBockstein` (line 127), `TopPair.singularCohomologyBockstein` (line 278), the exactness lemmas `singularCohomology_exact_coefficient₁/₂/₃` and naturality.
- `LieAlgebra.HasCentralRadical` is Mathlib's class (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`), as LieHighestWeight's README line 30 says.

Witness: `#check @TauCeti.PrincipalBundle.trivializationOfSection`, `@TauCeti.PrincipalBundle.division`, `@TauCeti.PrincipalBundle.pullback`, `@Bundle.Trivialization.coordChange_eq_mul` all elaborate at the pin (previous review's scratch `Probe3.lean`).

Repair:
- In C1.1d's first paragraph consume `TauCeti.PrincipalBundle`, `PrincipalBundle.division`, `trivializationOfSection` (global case) and `PrincipalBundle.pullback` by name and file. Keep as targets the packaging as an equivalence, the C(X,G)-torsor of trivializations, homotopies of trivializations and the relative extension statements.
- In the clutching paragraph glue on open thickenings of the hemispheres with `fiberBundleCoreOfGroupCocycle`, and read the change of sections from `homeomorphOfCohomologous`.
- In item 2 cite `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein` with their exactness and naturality lemmas; keep AT6.1 only for what the pin lacks (the 0→ℤ→ℤ→𝔽₂ normalization, pair-connecting compatibility, cup Leibniz).
- At line 1580 write "Mathlib's `LieAlgebra.HasCentralRadical`".

## R03 (P3) — the README lacks the house shape, most definitions have no Checks, and only one target has a `*Needs:*` line

Location: the whole README. Headings at this head: `# Characteristic classes and Chern–Weil theory` (1), `## Carriers, scope and suppliers` (12), `## Conventions` (173), `## C1.`–`## C7.` (228–2127), `## Dependency order and references` (2331). `grep -c '\*\*Checks\.\*\*'` gives 8; `grep -c '\*Needs:\*'` gives 1 (C1.5a, line 808).

Claim: no `# Roadmap:` title, no `**Summary.**`, no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k:` headings, per-layer `### Examples`/`### Dependencies`, or `## Downstream consumers`; references are merged into the dependency section; pinned declarations are listed inline in C1.0, C1.1a, C2.1, C2.2, C5.1, C6.1 and C7.1. The seeded sample (C1.0 at 230–292, C2.0 at 847–919, C5a.1–C5a.7 at 1680–2016) has no Checks and no `*Needs:*`. Other definitions without Checks: C1.2a, C1.2b, C1.5, C2.4–C2.6, C3.1, C3.2, C3.3, C4.1–C4.2, C5a.2, C5a.3, C6.1–C6.3, C7.3a.

Witness: the counts above, re-run at this head.

Repair: retitle to `# Roadmap: characteristic classes and Chern–Weil theory` with a `**Summary.**` paragraph; rename the scope section to `## Scope and ownership`; move the pinned-name lists into `## Exact supplier contracts` (From Mathlib, From Tau Ceti, From TauCetiRoadmap.<X>); turn the first paragraph of "Dependency order" into `## How to read the build`; rename `## Ck.` to `## Layer k:` with `### k.n` subsections and per-layer `### Examples`/`### Dependencies`; give every definition above three Checks (the items already compute usable values: the degree-one CE differential against `d₁₂_apply_apply_ofTrivial`, `τ(−a/(2π)) = −θ/(2π)`, `F_t` at t = 0, 1, the sup-ball map and its inverse, the rank-0 Thom model `X₊`, the metric-change identity); give each target its own `*Needs:*` line; split `## Downstream consumers` and `## References`.

## R04 (P3) — the module docstring's "not statable" list omits headline items the README's opening paragraph names

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:44–93`.

Claim: the README's opening names as aims the integral Chern, Pontryagin and Euler classes, the mod 2 Stiefel–Whitney classes, the compact connected Lie-group CE/de Rham comparisons and the Todd, L and Â classes; the docstring does not name as not statable:
- C5a.1's de Rham/Chevalley–Eilenberg ring isomorphism (the pins have only `oneCochain`, `twoCochain`, `d₁₂`, `d₂₃` in Mathlib `Algebra/Lie/Cochain.lean:43–156`; Tau Ceti's `Algebra/Lie/Cochain.lean` is low-degree only);
- C3.2–C3.3's Whitney, uniqueness and integral-correction laws for `w`, `c`, `p` (mentioned only inside the universal-rings bullet);
- C6.1's bundle-level `Td(E)`, `L(E)`, `Â(E)` with their Whitney laws;
- C5.1's `I(G) ≅ Sym(t*)^W` for a compact connected Lie group (no maximal torus or Weyl group of a compact Lie group at the pin; `LieSubalgebra.lieChevalleyRestrictionIso` is over an algebraically closed field of characteristic 0).
The closing paragraph (90–93) says C7.1's genus polynomials "are proved at the pin"; `L₃` is a README target (line 2142), correctly not stated.

Witness: `grep -n "C5a.1\|C3.2\|C5.1" Suggested.lean` returns nothing; C6.1 appears only in the series sentence at line 90.

Repair: add four bullets with these reasons, and change "the low-degree genus polynomials of C7.1 are proved at the pin" to "the pinned genus polynomials `Td₁–Td₃`, `L₁`, `L₂`, `Â₁`, `Â₂` that C7.1 consumes".

## R05 (P3) — the order with #1854, which also changes this folder, is still not stated

Re-raises r36 R09 and r39 R05.

Location: pull request description, merge-order paragraph: "No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request."

Claim: #1854, by the same author, carries `TauCetiRoadmap/CharacteristicClasses/` at 56715a5 and its copy differs from this one (`roadmaps show CharacteristicClasses --pr 1854` against this README: hunks at 519–529, 674–677, 877, 899–900 and more); the worker's `overlaps.md` reports the two heads in conflict on `CharacteristicClasses/README.md`. The order with #1808 is stated; the order with #1854 is not.

Witness: `roadmaps list` row "#1854 … CharacteristicClasses … 56715a5 … Cut the dependency loops main acquired after the pin bump".

Repair: name #1854 in the merge-order paragraph with its position, and rebase whichever merges later onto the repaired folder.

## Previous findings

- R01 — not repaired: `README.md:25–28` still reads "AlgebraicTopology Stage 4.5 supplies the compact-generation coreflection and the compactly generated substrate"; `:436–440` still consumes "Stage 4.5's compact-generation coreflection k".
- R02 — not repaired: `README.md:452–456`, `:479–481`, `:571–574`, `:1579–1580` unchanged; no pinned principal-bundle or Bockstein name in the README.
- R03 — not repaired: same headings, 8 `**Checks.**` blocks, 1 `*Needs:*` line.
- R04 — not repaired: `Suggested.lean:44–93` unchanged; C5a.1, C3.2–C3.3, C6.1, C5.1 still absent from the "not statable" list.
- R05 — not repaired: the merge-order paragraph is unchanged and does not name #1854.

## Verified sound

**Scope of this round.** The folder changed by 0 lines since ac36c47. The two files changed outside it are the pull request's own sibling folders:
- `TauCetiRoadmap/ClassifyingSpaces/README.md`: adds a Stage/item map and pinned-name citations. This roadmap cites ClassifyingSpaces only descriptively (`README.md:159`, "treats discrete groups with the weak-topology countable join", and `:424`); ClassifyingSpaces line 100 at this head still says "Groups are discrete throughout", so the citation still holds.
- `TauCetiRoadmap/TopologicalKTheory/README.md` (65+/28−): HomotopySpheres §4A–4B citations replaced by DGFloerPartII 4.2a–4.2c; T1.6a now owns ΩBO≃O and ΩBSO≃SO; T1.6d's comparison re-targeted to 4.2b's Ω₇. Nothing this roadmap cites moved except by line number: T1.5a (414), T1.6a (489), the CompactlyGenerated stable-carrier passage (672–675, previously 647–650), T1.6d (821), T6 item 4 (1294); TopK still names C1.1a–b and C1.1 as consumers (147, 152–154). This roadmap's line 27–29 ("the stable O/SO and ΩBSO comparisons are downstream consumers of these classifiers") remains consistent with T1.6a now owning those comparisons.
- `git diff --stat origin/main...HEAD` excluding the 14 named folders is empty.

**Gate and build.**
- The worker's gate at 3adc047: every check 0 and `OK`, including `build=0`, `depcheck=0`, `outside-folder=0`.
- `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean`: exit 0 in 11 s; the only warnings are `declaration uses sorry` at 125:8, 149:8, 165:8, 187:8.
- Dependency check this round:

```text
depcheck: 239 roadmaps, 2376 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for CharacteristicClasses (it is on main, not in `ORDER.txt`).

**Signatures.** `signatures.md` lists the same 5 entries as last round; `ContMDiffConstSMul` at line 37 is the docstring word "instance", not a declaration. The four theorems' elaborated types are unchanged and match their README sentences (C2.1 at 940–953, C2.2 at 1013–1019, C7.3a at 2305–2319); no binder lost. No `#check` re-run was needed, the file being byte-identical to the one elaborated last round.

**Padding, pins, sources, ownership.** Unchanged from the previous review at ac36c47 (its padding probe `Probe2.lean`: none of the four closes in one tactic; its `Probe1.lean`: 133 `#check` lines resolving at Tau Ceti 2fd255d9 / Mathlib 1b1ccf4b; the seeded sample read at dupont-ln, hatcher-vbkt, cohen-fiber-bundles, dupont-ccc, alekseev-meinrenken-chern-weil, hatcher-at, zentner-instanton-sheet2 at the lines listed there). The overlap lead "SpinGeometry §G4.1a only at #1674" is still false: main's SpinGeometry defines it at line 397.

**Adversarial table** (statements untouched since ac36c47; each row carried from the previous report, r39, with its values):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_singularCohomology_thomPair_fiber` (L125) | B = pt, F = ℝ, K = ℤ; e = id vs e = −id | `o ↦ ω`: restriction = g; `o ↦ −ω` under −id: −((−1)·g) = g, the two clauses agree (reflection acts by −1 on `H¹(ℝ,ℝ∖0)=ℤ`) | consistent (r39) |
| same | K = 𝔽₂; rank 0; B = ∅; g = 0 | −g = g; `H⁰(F,∅)=M`, u = sign function, (g,−g) on two components; `H^n(∅,∅)=0`; `H^n(E,E₀;A) ≅ Hom(H₀B,A)` injects into ∏_b A, so u = 0 | true, unique in each (r39) |
| `exists_isThomClass_of_orientation` (L149) | trivial line on S¹, K = ℤ; Möbius; K = 0 ring | u = pr*gen; no orientation (cover connected); all groups 0, span{0} = ⊤ | true; pinned minus `[CompactSpace B]` (r39) |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L165) | TS² (cells 0,2); S²×ℝ²; realified O(1) | e = 2 / no section; e = 0 / constant; e = 1 / none | both sides agree (r39) |
| same | su(F) on HP¹ (rank 3, cell dim 4); rank 0, B ≠ ∅; rank 1 | `e ∈ H³(S⁴)=0`, no section → excluded by `hdim` (4 > 3); e = ±1 ≠ 0 / `E_b = 0`; trivial: e = 0 / section | dimension bound necessary; `hn` not needed for truth (r39) |
| `not_exists_isImmersion_realProjectiveSpace` (L187) | k = 1, 2, 3; ℕ-subtraction | targets `2^(k+1)−2` = 2, 6, 14; RP² → ℝ² open-map contradiction; `w̄(RP⁴) = 1+a+a²+a³`, `w̄₃ = a³`; `w̄₇(RP⁸) = a⁷`; Whitney immerses in `ℝ^(2m−1)`, so non-vacuous | true (r39) |
| C1.0 metric change | `h₁(u,v) = h₀(Hu,v)` | `h₁(H^{−1/2}u,H^{−1/2}v) = h₀(u,v)`; Sylvester eigenvalues `√λᵢ+√λⱼ > 0` | correct (r39) |
| C1.0 cover | n ≥ 1; rank 0 | pinned iff `0 < det g`; rank 0: one frame, two orientations | matches "for n≥1" (r39) |
| C2.0 cells | rank 0; empty base; sup-ball map | `S(E)=∅`, `D(E)≅X`, model `X₊`; point; `‖(‖v‖∞/‖v‖₂)v‖₂ = ‖v‖∞`, inverse returns v | correct (r39) |
| C5a.1 CE sign | degree 1; Koszul `2d` | `(−1)^{0+1}a([X₀,X₁]) = −a([X,Y])` = Mathlib `d₁₂ f x y = −f⁅x,y⁆`; `(L_Xa)(Y)−(L_Ya)(X) = 2da(X,Y)` | correct (r39) |
| C5a.1 H¹ | closed 1-forms | `da = 0 ⇔ a([g,g]) = 0`; exact 1-forms 0 | `ann([g,g])` (r39) |
| C5a.2 normalization | θ ↦ e^{iθ}; generator count | `dχ(a) = ia`, `(i/2π)ia = −a/2π`; rank K generators, central d = 1 | agrees with Conventions 200–203 (r39) |
| C5a.3 Weil | θ_t = tθ; Bianchi; rank one | `tΩ+((t²−t)/2)[θ,θ]` = Dupont `U_s`; `dΩ = −[θ,Ω]`; `CS = −θ/2π` | correct (r39) |
| C5a.4 Koszul | regular sequence; quotient | `H(ℝ[P]⊗Λ(e), De=P) = ℝ`; `K_I/I₊ = Λ(e)`, D = 0; `\|eᵢ\| = 2dᵢ−1` | consistent (r39) |
| C5a.5 transgression | page r = 2dᵢ | `d_r: E^{0,2dᵢ−1} → E^{2dᵢ,0}`; `π₁(BK)=π₀(K)=0` | well-formed (r39) |
| C5a.6 Poincaré series | SU(2), U(2), SU(3), trivial | `1+t³`; `(1+t)(1+t³)`; `(1+t³)(1+t⁵)`; `P(−1)=0`; trivial 1 | agree (r39) |
| C5a.7 degrees | U(n), SU(n), E8; SU(2)/N(T); n = 2 strict upper triangular | `Σ(2d−1)=n²`, `n²−1`; `3+15+23+27+35+39+47+59 = 248`; `H⁰=ℤ, H¹=0, H²=ℤ/2`; centre g ⊄ [g,g] = 0 | agree with Hatcher 4D.3 and §3.G (r39) |
| C7.AdjointHopf | basis; Z = diag(1,−1); roots 0, x−y, y−x | all skew and traceless; `c₂(End₀) = −(x−y)²`, `p₁ = c₁²−4c₂` (zentner line 50) | correct (r39) |
| same, on HP¹ | c₁ = 0, ⟨u,[HP¹]⟩ = 1 | ⟨p₁⟩ = −4; `e ∈ H³(S⁴)=0`; section ⇒ ε¹⊕P, `e(P)=0`, `p₁(ε⊕P) = 0` | no section, not stably trivial (r39) |
| C7.3a | m = 2^k | `(1+a)^{2m} ≡ 1`; `(1+a)^{2^k−1} = Σ_{j<2^k} aʲ`; `w_j = binom(m+1,j)` | correct (r39) |
| C7.1 Checks | CP⁶; HP³; HP² | `(2170−1911+686)/945 = 1`; `L₃(HP³) = 0`; `L₂(HP²) = 1` | correct (r39) |
| C3.3 `p_r = e²` | real rank m = 2r | `(−1)^{m(m−1)/2} = (−1)^r`, times `(−1)^r` from `p_r` | +1, as stated (r39) |
| R01: stable carriers | singular simplex Δⁿ | compact Hausdorff, so `C(Δⁿ,kX) = C(Δⁿ,X)`; TopK T1.6a's carrier (this head, 672–675) has the weak-CW union topology | coreflection not needed (r39, line numbers updated) |
| R02: C1.1d | X = pt, G = Circle; clutching | `trivializationOfSection` on U = X gives `p ↦ (p.proj, division(σp.proj, p))`, inverse `(x,g) ↦ σ(x)g`; `h_N⁻¹ g_NS h_S = a⁻¹cb` | same conventions as the pin (r39) |
| R02: Bockstein | 0→ℤ→ℤ→𝔽₂→0 on RP² | `β(a) = y ≠ 0 ∈ H²(RP²;ℤ) = ℤ/2`; on a point `H¹(pt;ℤ) = 0` | pinned construction applies (r39) |
| R04: C5a.1, C5.1 | pinned Lie cochains; pinned Chevalley | degrees 1→2→3 only; algebraically closed char 0 vs compact group over ℝ | not statable, as R04 says (r39) |

No statement changed, so no new row was computed this round.

## Not verifiable

- Milnor–Stasheff (`milnor-stasheff`): §4 (C7.3a), Theorem 10.4 (C2.1 and the Thom headlines), §12 (C2.2), Theorem 15.3, §18 Lemma 18.1 (C2.0), §19 (C7.1).
- Milnor, *Topology from the Differentiable Viewpoint* §6 (`milnor-tdv`; C2.3a).
- Milnor, *Construction of Universal Bundles II* §§2–3 (`milnor-universal-ii`; C1.1b).
- Bott–Tu §§6, 11–14, 20–23 (`bott-tu`).

All four are settled uncertified in the manifest, cited by locator; the text was not read.

## Source issues

- none (no source was opened this round; the two misprints recorded by the previous review, in cohen-fiber-bundles Proposition 3.7 and zentner-instanton-sheet2 Exercise 2, are already in the register).
