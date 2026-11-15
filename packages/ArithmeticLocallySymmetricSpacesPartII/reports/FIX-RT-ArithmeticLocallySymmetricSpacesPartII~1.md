# FIX-RT-ArithmeticLocallySymmetricSpacesPartII~1

Settles the 14 findings of red-team round 1 (passes a and b). Overlapping findings are settled once and named together. Files changed: `packages/ArithmeticLocallySymmetricSpacesPartII/README.md`, `Suggested.lean` (one docstring paragraph), `sources.toml` (`cited_for`, one locator) and `design/plan.json` (top-level `gaps` only).

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F01, RT-ArithmeticLocallySymmetricSpacesPartII~1b/F03 (P1) — applied differently

Every "LieHighestWeight Layer 0" citation and the LieHighestWeight contract subsection are deleted. §0.3 now imports absolute irreducibility and self-duality from LocallyAnalyticDistributionsPartII §5.2 (i), which itself consumes Tau Ceti's sl₂ classification. §5.1 computes the raising-operator kernel and cokernel in Tau Ceti `Module.Basis.symmetricPower`. The Tau Ceti sl₂ names are not added, because nothing here consumes them directly.

Evidence: LieHighestWeight on main, heading "Layer 0: normalized rank-one tensor comparisons"; its former-numbering table sends the old sl₂ Layer 0 to Tau Ceti `TauCeti.exists_int_of_hasEigenvalue`, `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` and `TauCeti.Sl2Std.isInternal_cgSummand`. LieHighestWeight §5.1 works over an algebraically closed field, so it does not give self-duality over ℚ_p either. Pattern repaired at Scope, the §0.3 Needs, the Layer 0 Dependencies, the §5.1 Needs and the Layer 5 Dependencies.

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F02, RT-ArithmeticLocallySymmetricSpacesPartII~1b/F01, RT-ArithmeticLocallySymmetricSpacesPartII~1b/F02 (P2) — applied

Gaps flat-microlocalisation, algebraic-quotient-comparison and integral-central-faithfulness are deleted from the README and from the plan `gaps`. A new contract cites LocallyAnalyticDistributionsPartII §§0.2, 2.1, 3.4, 3.7, 3.10, 4.1, 4.14 and 5.2 (i), (iii), with the old Checks recomputed under it. In §0.3 the action quotient and the Burnside route become a citation of §5.2. gap:generic-cyclic-growth becomes the new target §0.4 here.

Evidence: the sibling's head has §3.4 (K[[G]]→Û(h)_K, flat on both sides), §3.10 (M_W≅M̂_W, natural in M), §4.14 (injectivity for every λ∈ℤ_p^m, G=G₁^m, p odd) and §5.2 (iii) (K[[G]]/Ann(W_k)≅End_K(W_k)). Its scope lists "Fu's growth estimates for quotients of Û(g) by generic elements (Fu, §3)" under "Applications outside this roadmap". So the growth estimate has no owner. NoncommutativeAndEquivariantIwasawa (merge order #30) cannot state it on Û, which is owned at #199, without an upward edge. Pass b's alternative of keeping the gap would leave that defect in place, so the estimate is owned here. The Tau Ceti Burnside entry and its Needs/Dependencies uses are removed with the route.

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F03 (P2) — applied

References, aw14: "deformation index n≥1 … excludes the first congruence kernel" → "§5.4 assumes … n≥0, which covers ker(G(O_L)→G(O_L/p^(n+1))) for every n≥0, the first congruence kernel being the case n=0; every odd p is very good for type A₁". The gap parenthesis that repeated the misreading is deleted together with that gap.

Evidence: aw14 line 393 prints the exponential series of Proposition 4.3 as a sum over "m>0", and line 405 writes the same series from m=0. Its m=0 term is needed for the limit x_α(r)·a. So the extraction renders ⩾ as ">". The same holds at line 365, where the n-th deformation must contain F₀A∋1. The extraction has no "≥" anywhere. fu24 line 169 deduces Theorem 1.5, for first congruence kernels, from aw14 Theorems 4.6 and 5.4. LocallyAnalyticDistributionsPartII §4.13 applies them at n=0.

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F04, RT-ArithmeticLocallySymmetricSpacesPartII~1b/F04 (P2) — applied differently

§4.1 now defines D^±, π_{κ_v,0}, π^ε_κ, m_ε(κ,K_f) and `S_κ(K_f)=Hom(π^+_κ, L²_cusp^{K_f})`, with an API list and Checks. "dim H_cusp^q=2^{r₁}dim S_κ" becomes "=Σ_ε m_ε, with m_ε=m_{−ε}". So dim S_κ≤dim H_cusp^q, with equality at r₁=0 and twice dim S_κ at r₁=1. 2^{r₁} is asserted only under a sign-realising unit hypothesis. The §3.2 pullback sentence moved to §4.1.

Pass a's definition is applied, but not its unconditional factor 2^{r₁}. Complex conjugation pairs ε only with −ε. Conjugation by diag(u,1), u∈O_F^×, equates other patterns only when it normalises K_f. With r₁≥2, nothing equates m_{(+,+)} with m_{(+,−)} in general (pass b's witness). The §4.2 route needs only the inequality, so `Suggested.lean` is unchanged in substance; its docstring names the carrier precisely.

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F05 (P2) — applied

§3.3: "E containing the embeddings needed for V_κ … V_{κ,E} … p-adic extension W_t" → E is the normal closure of F in ℂ, with ι_p:E→ℚ_p from complete splitting. Hom(F,E), Hom(F,ℂ) and Hom(F,ℚ_p) are identified. `V_{t,E}=⊗_σ Sym^{t_σ}(E²)` is constructed for every t, with complex extension `weightRep Γ t` and p-adic extension W_t. New Check: t=(3,0) over ℚ(i).

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F06, RT-ArithmeticLocallySymmetricSpacesPartII~1b/F05 (P2) — applied differently

gap:skew-rank now asks only for the rank: `rank_R M=dim_{Q(R)} M[R⁰⁻¹]`, finite, additive (via §1.12), zero exactly on torsion, a on R^a, for a left noetherian domain R. A new From Mathlib paragraph records the Ore set, localisation, division ring and module localisation. The plan's `needs` was changed to match.

Both proposed repairs still asked the supplier to prove the Ore condition, but pinned Mathlib already proves it. `IsNoetherianRing.strongRankCondition` (Mathlib/LinearAlgebra/InvariantBasisNumber.lean:250) gives the strong rank condition for a nontrivial left noetherian ring. `nonempty_oreSet_of_strongRankCondition` (Mathlib/LinearAlgebra/Dimension/Localization.lean:299) then makes R⁰ left Ore in a domain. Mathlib/RingTheory/OreLocalization/Ring.lean:209–211 has the `DivisionRing` instance, and Ring.lean:88 the module over it. No exactness or rank invariant exists at the pin.

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F07 (P3) — applied

The AdelicAlgebraicGroups contract: "semisimple simply connected group … every simple factor noncompact … equivalently `Res_{F/ℚ}SL₂`" → *strong-approximation-sufficiency* for connected, absolutely almost simple, simply connected G with G(F_∞) noncompact. The one-point quotient comes from the section's strong-approximation bullet, applied to SL₂ over F, never to `Res_{F/ℚ}SL₂`. The same repair is made at Scope and in the §4.2 route.

Evidence: AdelicAlgebraicGroups §4.2 on main, the *strong-approximation-sufficiency* bullet ("connected, absolutely almost simple and simply connected … G_S noncompact").

## RT-ArithmeticLocallySymmetricSpacesPartII~1a/F08 (P3) — applied

Conventions and §3.4: "CompletedCohomologyPartII §§5.6–5.7" → "§5.7". Evidence: CompletedCohomologyPartII §5.7 lists §5.6 in its own *Needs*, and only §5.7's torsion conclusion is used here.

## RT-ArithmeticLocallySymmetricSpacesPartII~1b/F06 (P3) — applied differently

E2 "Remark 5.8, p. 21" → "pp. 20–21". E3 "used in Theorem 5.1, p. 21" → "used in the proof of Theorem 5.1, p. 21 (statement p. 16)". The serre77 reference gains "page numbers are the printed pages of the Numdam scan".

Disputed part: "third edition 1983". The scan's own front matter reads "Astérisque, tome 46 (1977)" and "© Société mathématique de France, 1977" (serre77 lines 9 and 11). The 1983 occurs only in the Numdam identifier. The README's "Astérisque 46 (1977)" agrees with the text read, so no edition is asserted.

## Checks run

- **Elaboration.** `lake env lean packages/ArithmeticLocallySymmetricSpacesPartII/Suggested.lean`, run from the content checkout. Output: two warnings `declaration uses 'sorry'`, at 73:8 and 92:8. No errors.
- **Signatures.** A scratch copy of the file with `#check @embeddingStdRep`, `#check @weightRep`, `#check @finrank_groupCohomology_weightRep_le` and `#check @bianchi_groupCohomology_linear_growth` was elaborated once. The four types are unchanged from the worker's `signatures.md`. Their binders, hypotheses (`¬IsTotallyReal F`, `𝔞 ≠ ⊥`, the kernel inclusion; `IsTotallyComplex F` with `finrank ℚ F = 2`) and quantifier order (∃C ∀t i, ∀a; ∃c C, 0<c, ∃n₀ ∀n ∀i∈{1,2}) agree with README §3.1, §4.2 and §5.8. The file has no section variables, so no binder is lost.
- **Dependency check.** Command as in the brief:

      moved: ArithmeticLocallySymmetricSpacesPartII moved in the merge order from #180 to #199, right after its last supplier LocallyAnalyticDistributionsPartII; checked as moved (the worker moves it there when it submits)
      depcheck: 245 roadmaps, 2237 edges, 0 problem(s)

  No UPWARD or CYCLE line.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no roadmap Lean name found nowhere. That tool did not check Mathlib or Tau Ceti names, so each new library name was opened at the pin: `OreLocalization.OreSet`, `OreLocalization`, `IsNoetherianRing.strongRankCondition`, `nonempty_oreSet_of_strongRankCondition` and `Module.Basis.symmetricPower` (TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:162). The cited LocallyAnalyticDistributionsPartII sections have the same numbers at the pull request's head and in its board package.
- **Style.** No LaTeX delimiters or process words. No brace formula outside a code span beyond the three that were already in the README.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.4 generic growth | m=1, k≥α; α=(3,3), k=(1,t); m=2, k=(4,4), α=(1,1); k=0; δ=1; δ=0; δ=Δ₁−Δ₂ | 2α−α²/(k+1)≤2α; dim W=2(t+1)≤6(t+1)+12; (625−256)/25=14.76≤2(5+5)=20; bound 2Σα_i≥1=dim W₀; Hom=0; k+1 unbounded (excluded); at (n,n) Hom=W, (n+1)² (not generic: vanishes in Û_(λ,λ)) | holds; the generic hypothesis is needed; added the Δ₁−Δ₂ negative Check |
| §0.4 telescoping step | (k+1)²−(k+1−α)² | α(2(k+1)−α)≤2α(k+1) | holds |
| §0.4 right side as B_c | m=1: s=∅; m=2: s={0},{1} | B=2α; B=2α₁x₁+2α₀x₀, proper faces only | of the form in §0.1 |
| §0.3 imported quotient | k=(1,2); k=0; p=3, m=1, k=1 | 6²=36; 1; e, f, ef=E₁₁, fe=E₂₂ span M₂(ℚ₃), dimension 4 | agrees with LocallyAnalyticDistributionsPartII §5.2 (iii) |
| §1.2 via §3.10/§4.14 | M=A; M=0; M=A/Aδ with δ=1; m=1 | both quotients End(W_k), 36 at k=(1,2); 0; 0 both sides; constant 2α | holds |
| §3.3 every t | t=0; F=ℚ(i), t=(3,0); F=ℚ; cubic F with Galois closure E of degree 6 | dim 1; dim 4, −I acts by (−1)³=−1; E=ℚ, d=1; 3 embeddings F→ℚ_p for p split in E | defined for every t; matches `weightRep` |
| §4.1 Σ_ε m_ε | r₁=0 (ℚ(i)); r₁=1 (ℚ, Γ(3), κ=4); r₁=2 | 1 pattern; m_+=m_−=1, H¹_cusp=2=dim S₄⊕S̄₄; 4 patterns in 2 conjugation orbits | 2^{r₁} fails to follow at r₁=2 without the unit hypothesis; restricted |
| §4.1 uniqueness of π_{κ_v,0} | κ_v=2 (n=0) at a complex place | the trivial representation has H⁰ and H³ but no H¹ | "only" holds for degree-one cohomology; wording fixed |
| §4.1 unit symmetry | diag(u,1) with u_v<0 at a real v; u_v>0; complex v | outer swap D⁺↔D⁻; inner (√u scaling); inner | m_ε↦m_{ε·sign(u)}; with all signs realised, Σ=2^{r₁}m_+ |
| §4.1 wrong model "every pattern" | F=ℚ, Γ(3), κ=4 | would give 2, not dim S₄(Γ(3))=1 | excluded by a Check |
| gap:skew-rank | R a division ring; ℚ_p[X,Y]; M₂(ℚ_p); zero ring; left vs right | rank(R^a)=a; rank (X,Y)=1, R/(X,Y)=0; zero divisors (excluded); not nontrivial (excluded); Mathlib's OreSet is s′r=r′s (left Ore), matching left noetherian | narrowed statement holds |
| AdelicAlgebraicGroups contract | ℚ(i), U=SL₂(Ẑ[i]); totally real F; Res_{F/ℚ}SL₂ with [F:ℚ]=2; PGL₂/ℚ | SL₂(ℂ) noncompact, one coset; SL₂(ℝ)^{r₁} noncompact; splits as SL₂×SL₂ over ℚ̄, not absolutely almost simple; not simply connected (section's negative control) | contract restated |
| aw14 deformation index | G₁; G₂=ker mod p² | L_{G₁}=p·sl₂(ℤ_p), (1/p)L=sl₂(ℤ_p)=p⁰𝔤 → n=0; n=1 | first congruence kernel covered |
| §5.1 raising operator | n=0; n=2 | e=0 on ℂ: ker 1, coker 1; y²↦2xy, xy↦x², x²↦0: rank 2, ker 1, coker 1 | holds |
| E2/E3 locators | fu24 lines 1010–1016, 782, 1017 | Remark 5.8 begins p. 20, its second item on p. 21; Theorem 5.1 on p. 16, its proof on p. 21 | corrected |

## Ownership

Ownership against open work was checked with `roadmaps grep` over main and the open heads, and in the board packages, by object. The Sym^n≅V(n) comparison has no owner, and none is needed after the §5.2 citation. Fu §3's generic cyclic growth has no owner, so it is owned here (§0.4); LocallyAnalyticDistributionsPartII explicitly leaves it to applications. The canonical-dimension criterion is not in LocallyAnalyticDistributionsPartII (no "canonical dimension" or "10.13" there), so gap:canonical-dimension-zero stays with NoncommutativeAndEquivariantIwasawa. Moved notions: none moved down.

## For the maintainer

- **Merge order.** This roadmap now names LocallyAnalyticDistributionsPartII (#199) as a supplier, so the worker moves it from #180 to #199. No roadmap on main or on the board cites ArithmeticLocallySymmetricSpacesPartII, so the move breaks nothing.
- **NoncommutativeAndEquivariantIwasawa** is no longer asked for four of its six former gaps. It is still asked for gap:skew-rank (narrowed) and gap:canonical-dimension-zero, both at §F.1.
- **plan.json.** Only the top-level `gaps` list changed. Node entries in `design/plan.json` still name the four removed gap slugs in their dependency lists, as a design-stage record; this job may not edit them.
- **Names.** No Lean name changed. One README section was added (§0.4) and nothing was renumbered.
- **Untrusted text.** Nothing in the reviews or the fetched texts asked for anything outside this job.
