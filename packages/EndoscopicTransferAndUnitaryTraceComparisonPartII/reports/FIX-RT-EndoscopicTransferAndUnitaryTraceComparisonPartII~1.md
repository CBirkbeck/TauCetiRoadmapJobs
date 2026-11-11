# Repair of EndoscopicTransferAndUnitaryTraceComparisonPartII (red team, round 1)

This round settles the findings of red-team passes `RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1a` (three findings) and `~1b` (six findings). The two reviews do not overlap, so each finding has its own section. I checked every witness myself.

Files changed:
- `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md`
- `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json`: only the `jr-local-comparison` entry of its top-level `gaps` list
- `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml`: only the `cited_for` list of Leslie25

`Suggested.lean` and `metadata.toml` are unchanged.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1a/F01 (P1) — applied

**Verification.** I recomputed the witness. Take unramified E/F, a=b=1, reference labels, and c∈O_E^× with N(c)=−1. The target (c,c) contracts to (1,1). Each block is regular, but no regular source element has contraction spectrum {1,1}. The tensor unit has SRO=RO(1_O_E,c)²=1, because the stable class in rank one is a single orbit (D=ker(ℤ/2→ℤ/2)=0). The old §1.4 required 0 there, which contradicts §4.10.

Leslie25 line 848 states the clause without any restriction. EndoscopicTransferAndUnitaryTraceComparison §2.11 tests only strongly G-regular targets: its O^{G,ω}_{γ₁} is an empty sum when nothing matches.

**Change.**
- §1.2 defines *source-regular* targets (contracted blocks with coprime characteristic polynomials, D_ab≠0), with an API bullet; matched targets are source-regular.
- §1.4: zero clause only at source-regular targets; kernel bullet and Checks 2–3 restricted likewise. New Check: collision witness, control (1,1+π) with factor −q⁻¹.

**Same pattern elsewhere.**
- The §4.9 ordinary graded identities had the same defect (e₀⊗e₀ at (1,1) has value 1). They are now tested at G-regular targets only, and the §4.9 route says so.
- §1.5 route and §1.2 Check 3 wording.
- A §4.10 Check: at (1,1+π) the theorem forces RO^κ=−q.
- Source correction E17 (Leslie25 p. 19 and Definition 2.10); `sources.toml` now cites E17.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1a/F02 (P1) — applied differently

**Verification.** The §3.2 route uses Tate continuation, but its *Needs* line did not list it. No Tate zeta integral is pinned (I searched for `localZetaIntegral` and `TateZeta` in the pinned Mathlib and Tau Ceti).

**Change.**
- New supplier contract "From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors" with AL.1.1.2, AL.1.2.1 and AL.1.2.3. That roadmap is position 95 in the merge order; this one is 152.
- §3.2 *Needs*, its route and the Layer 3 Dependencies cite these sections.

**How this differs from the suggested repair.**
- AL.1.3.2 (the functional equation) is not cited. Regularity at s=0 needs only z=L·z₀ in the unramified case and entireness in the ramified case.
- The route also needs η∘N_(F_i/F) to be nontrivial for i∈S₁. This uses two pinned Tau Ceti declarations, now consumed in the Tau Ceti contract and in §3.2: `TauCeti.ClassFieldTheory.artinMap_norm` (norm functoriality) and `TauCeti.index_normGroup_of_isCyclic` (norm index 2).

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1a/F03 (P3) — applied

**Verification.**
- Mathlib `HasStrictFDerivAt.implicitFunction` (`Mathlib/Analysis/Calculus/Implicit.lean`) is the implicit function of `HasStrictFDerivAt.implicitFunctionDataOfComplemented`. Its left function is f and its right function is x↦P(x−a). Nothing in that file asserts analyticity.
- Tau Ceti `ImplicitFunctionData.analyticAt_implicitFunction` (`TauCeti/Analysis/Analytic/Inverse.lean`) is pinned. It holds over any nontrivially normed field, with complete E, F and G.

**Change.**
- The Mathlib and Tau Ceti contracts describe both declarations.
- §0.6 *Needs* and its route combine them: the polynomial contraction and the affine projection are analytic, so the section is analytic.
- Layer 0 Dependencies updated.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b/F01 (P2) — applied

**Verification.** EndoscopicTransferAndUnitaryTraceComparison §4.9(b) uses `b_{E/F}` but never defines it, and it has no Satake formula. I searched with `roadmaps grep` and found no owner of the GL_n(E)→GL_n(F) spherical base-change homomorphism:
- that roadmap's §6.8 BC* is for unitary similitude groups;
- GL2AutomorphicRepresentationsAndTransfer R17.4.1 is a GL₂ conjugacy-class rule.

**Change.**
- §2.2 *defines* BC_m (m≥0): Z_i↦T_i² transported through the SR.4.1 Satake isomorphisms. API: unital, injective, BC₁(1_(π^dO_E^×))=1_(π^(2d)O_F^×). New Check: unsquared map gives non-norm support.
- Base §4.9 dropped from the contract, *Needs* (§§2.2, 2.3, 3.6, 4.3) and Dependencies; §4.3 gains §2.2. Scope and build overview updated.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b/F02 (P2) — applied

**Verification.** No consumer invokes the existence of Jacquet–Rallis transfer or its Fourier compatibility. §§3.3, 3.6 and 3.8 take relation (4.3)/(4.7) as a hypothesis, and §§4.4–4.5 prove it.

**Change.**
- Gap sentence (README and `plan.json` `needs`): "local smooth transfer with partial Fourier compatibility" → "the transfer relations (4.3) and (4.7) as relations between test functions"; "with Definition 7.4" added.
- New sentence maps parts to consumers; Theorem 4.2 and Fourier compatibility are not inputs.
- §4.5 *Needs* and `neededBy` gain the gap.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b/F03 (P3) — applied

**Verification.** GeometryOfNumbersAndQuadraticArithmetic §2.9 (line 774 at its head) gives `signedHermitianAdjoint` only for endomorphisms of one space.

**Change.**
- §0.1 now constructs X^τ as the W₁→W₂ block of the adjoint of (v₁,v₂)↦(Xv₂,0) on W₁⊕W₂ with the form h₁⊕h₂.
- A new API bullet gives uniqueness and involutivity, and the transformation law now assumes g_i unitary.
- A new Check: for ⟨1⟩,⟨π⟩ the adjoint is π⁻¹z̄, not z̄.
- *Needs* and the supplier contract now name `signedHermitianAdjoint_comp` and `signedHermitianAdjoint_involutive`.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b/F04 (P3) — applied

The Conventions Check used r₊ and r₋ before §4.1 defines them. It now reads: in the unramified setting, a unit c with N(c)=−1 gives r₁(c)=−N(c)=1, the value at 1 of the unsigned Gram map (r₊ of §4.1), and such a unit exists in every residue characteristic.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b/F05 (P3) — applied

**Verification.** At n=2, T=−I₂ is invertible but not regular, so §0.6 gives no cutoff there.

**Change.** The §0.8 route now cuts f by 1_(r₁⁻¹(B)), where B is a compact open neighbourhood of T in the invertible locus. The cut-off function is compactly supported in invertible Hom maps and has the same fibre integrals over B. The §0.6 cutoff is used only in §0.9. A new Check: f=1_(M₂(O_E)) gives r_!f≡1 on −I₂+πHerm₂(O_E).

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~1b/F06 (P3) — applied

**Verification.** z=diag(π,πu) with u∈O_F^×∖{1} lies in Ω(V₂,V₂): det(−z⁻¹)=π⁻²u⁻¹ has even valuation. Its eigenvalues have odd valuation.

**Change.** The Layer 1 example now says that the target determinant has odd valuation while every source contraction has determinant of even valuation, and gives z as the case whose eigenvalues are odd. It also notes that (π,1)-label targets are source-regular.

## Adversarial pass on changed and added statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §1.2 source-regular | (c,c), N(c)=−1; (c,c′), −N(c′)=1+π | D=1−1=0, so not source-regular; D=1−(1+π)=−π≠0, so source-regular | definition separates the two |
| §1.2 matching ⇒ source-regular | δ with r₁(δ)=diag(1,1+π) | charpoly (T−1)(T−1−π) separable; equals the product of the block charpolys | holds |
| §1.4 zero clause | collision (c,c); label (π,1) target (x,y) | SRO(tensor unit)=1 at (c,c), not tested; at (π,1) the §4.10 target is 0, and the zero clause requires 0 | no contradiction |
| §1.4 matched control | (c,c′) above | Δ=η(−π)·abs(π)=−q⁻¹ (q=2: −1/2) | holds |
| §4.9 ordinary clause | e₀⊗e₀ at (1,1); at (1,u), u−1 a unit | 1, untested; 1=Δ·O^κ with Δ=1 | holds |
| §4.10 Check | (1,1+π) | 1=(−q⁻¹)(−q) | consistent with the unit FL |
| §2.2 BC_m | m=0; m=1, d=1; m=2, T_(1,0),E | identity; Z↦T² gives 1_(π²O_F^×) (Z↦T gives 1_(πO_F^×)); q(T₁²+T₂²)=Sat T_(2,0),F−(q−1)T₁T₂, coefficient −1 at q=2 | holds; wrong model excluded |
| §2.2 injectivity, unit | monomial Z^λ; 1_K | Z^λ↦T^(2λ), distinct monomials; 1↦1 | holds |
| §2.2 square | a=b=1 | q⁻¹X² both ways | unchanged, holds |
| §0.1 X^τ | ⟨1⟩,⟨π⟩, X=z | conj(zv)w=conj(v)·π·(π⁻¹z̄w); (X^τ)^τ: conj(π⁻¹z̄v)πw=conj(v)zw, so the result is z | holds; z̄ alone fails at z=1 (gives 1 instead of π⁻¹) |
| §0.1 split, rank 0 | (A,B) at n=1; n=0 | (A,B)^τ=(B,A); Hom=0 | holds |
| §0.6 analytic section | rank one, X₀=1 | dr(h)=−Tr(h); on the F-line −2 is invertible, also over ℚ₂ | analytic implicit theorem applies; complete spaces |
| §0.8 cutoff | n=2, T=−I₂, f=1_(M₂(O_E)) | XX*∈I₂−πHerm₂(O_E) ⇒ det X a unit; fibre integral vol U(Λ₂)=1 | constant 1 near −I₂ |
| §0.8 rank one | f=1_O_E, T=−1 | B=−1+πO_F gives 1_(O_E^×) on the fibre; value 1 | holds |
| §3.2 Tate input | η_i unramified; trivial; ramified (ℚ₃(√3)/ℚ₃, f=1_O) | L(0)=1/2; pole at 0; ∫_(O^×)η=0, so the value is 0 and entire | nontriviality is load-bearing |
| §3.2 nontriviality | F_i=F, E⊄F; F_i=E | η_i=η nontrivial (index 2); η∘N_(E/F) trivial, i∉S₁ | consistent with S₁ |
| Conventions Check | c with N(c)=−1, residue char 2 | r₁(c)=−N(c)=1; c exists by `TauCeti.map_normUnits_unitFiltration` at depth 0 | holds |
| Layer 1 example | z=diag(π,πu); label (π,1) | det(−z⁻¹)=π⁻²u⁻¹, valuation −2; v(xy) odd | no match |
| gap scope | §3.3 hypothesis | uses relation (4.3) only | existence/Fourier unused |

## Checks run

- **Lean elaboration.** `lake env lean packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/Suggested.lean`, run from the content checkout: exit 0, no output. It has no `TauCeti.*` import, so nothing was built.
- **Signature check.** `Suggested.lean` declares nothing, so the `#check @name` comparison is vacuous and no binders changed. I also elaborated a scratch file of `#check @…` for the five library declarations newly cited. All exist at the pins, with the hypotheses stated in the README:
  - `HasStrictFDerivAt.implicitFunction` (needs `CompleteSpace 𝕜`, finite-dimensional target)
  - `HasStrictFDerivAt.implicitFunctionDataOfComplemented`
  - `ImplicitFunctionData.analyticAt_implicitFunction` (complete E, F, G)
  - `TauCeti.ClassFieldTheory.artinMap_norm`
  - `TauCeti.index_normGroup_of_isCyclic` (cyclic Galois, `IsNonarchimedeanLocalField`)
- **Dependency check.**

```text
depcheck: 237 roadmaps, 2146 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. The one new edge is AutomorphicLFunctionsAndLocalFactors.
- **Citations.** `roadmaps resolve` with the pinned packages reports no unresolved cross-roadmap citation. Its only lead is `IntegralHermitianLattice.ofCarrier`, which is unchanged and is a target of GeometryOfNumbersAndQuadraticArithmetic §2.7, not a pinned declaration.
- **Cited sections, read at their heads.** AL.1.1.2, AL.1.2.1 and AL.1.2.3 (AutomorphicLFunctionsAndLocalFactors); EndoscopicTransferAndUnitaryTraceComparison §§2.11, 4.9 and 6.8; GeometryOfNumbersAndQuadraticArithmetic §2.9; SmoothRepresentationsOfLocalGroups SR.4.1 and SR.4.3.

## Notes for the maintainer

**Ownership.**
- This roadmap now owns two constructions: the GL_n spherical base-change homomorphism BC_n, and the two-space Hermitian adjoint. Neither has an owner on main, at the open heads or in the board packages; I searched by object with `roadmaps grep`.
- If SmoothRepresentationsOfLocalGroups later states BC_n, §2.2 should cite it instead.

**Defects in other roadmaps.**
- EndoscopicTransferAndUnitaryTraceComparison §4.9(b) uses `b_{E/F}` without defining it. That is a defect of that roadmap and cannot be settled here.
- The same literal-reading issue as E17 is in Leslie19 Definition 1.2. This README does not cite it.

**Effect on other roadmaps.** No Lean names or section ids changed, and no roadmap names this one as a supplier.

**Other.** The narrowed `jr-local-comparison` contract no longer asks the base roadmap for the existence of transfer. GanGrossPrasadUnitaryGroups' separate `relative-finite-transfer` gap still does.
