# Review of ClusterAlgebras (pull request #2250 at 69eae7d)

**Verdict:** accepted

This is an incremental re-review of the 21 lines changed since 75d3b8e. All changes are in README §0.4, and this review has no findings of its own.

## Previous findings

- R01 — repaired: :447–453 now reads "let `z^a` denote the basis monomial of the full `QuantumMonoidAlgebra` … `TwistedMonoidAlgebra.lift` of `a↦z^a`. Prove that it is an isomorphism … Transport §4.3's coefficient and lattice maps along this isomorphism". At :488–492 the chart map is `χ` composed with `basis.repr.symm`, with the index `Multiplicative (ℤ^I)` identified with `ℤ^I`.
- R02 — repaired: the description now says "the twelve theorem targets are the only `sorry`s" and lists `ncard_clusterVariables` under "New targets". Its Layer 0 bullet says "§0.4 uses Tau Ceti's `twistedMonoidAlgebra` for the based torus and specifies the basis-preserving isomorphism".

## Verified sound

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| §0.4 comparison `T(R,u,Λ)→QuantumMonoidAlgebra` (:450–452) | rank 2, `Λ(e₁,e₂)=1` | Tau Ceti `of e₁·of e₂=u•of(e₁+e₂)`, `of e₂·of e₁=u⁻¹•of(e₁+e₂)` (`of_mul_of` :336) | §4.3 Check :1437: `z^{e₁}z^{e₂}=q z^{e₁+e₂}`, `z^{e₂}z^{e₁}=q⁻¹z^{e₁+e₂}`, `q=u` | `lift` hypotheses `z^0=1` and the product rule hold |
| same, bijectivity | basis to basis | `lift(of a)=z^a` (`lift_of` :422) | `z^a` is a basis (§4.3 target :1410) | an isomorphism, as stated |
| same, degenerate | `L=0`; zero ring; `u=1`, `Λ=0` | `R→R`, identity; `0→0` | `monoidAlgebraEquiv` (:456) and §4.3 `β=0` give `AddMonoidAlgebra` on both sides, `X^a↦z^a` | holds |
| same, scope | `R=ℕ` | `T(ℕ,1,Λ)` is defined over a semiring (`Twisted/Basic.lean`:282) | §4.3 :1393 needs a commutative ring | the "Over a commutative ring" scope is needed and stated |
| positive degree datum `(L,{0},0)` (:449) | `P={0}`, `δ=0` | `δ>0` on `P∖{0}=∅` holds vacuously | `{n∈P : δ(n)≤k}={0}`, finite (ScatteringDiagrams §0.1 :144–150) | a valid *PositiveDegrees* |
| transported coefficient map (:452–453) | `φ:ℤ[v^{±1}]→ℤ`, `v↦1`, `Λ(e₁,e₂)=1` | `X^{e₁}X^{e₂}−X^{e₂}X^{e₁}=(v−v⁻¹)X^{e₁+e₂}↦0` | target `T(ℤ,1,Λ)` is commutative; §4.3 Check :1442 says the commutator vanishes | agree |
| chart map `=χ∘repr.symm` (:488–492) | `single a r` | `BasedChart.eval(single a r)=r·M(a)` (`Finsupp.linearCombination`, Suggested :76) | `χ(repr.symm(single a r))=χ(r•of a)=r·M(a)` | equal; scratch proof `ext a; simp` closes |
| §0.4 factor set over a semiring | `α(a,b)=u^{formPairing Λ a b}`, any `CommSemiring R` | cocycle: `Λ(a+b,c)+Λ(a,b)=Λ(a,c)+Λ(b,c)+Λ(a,b)` | `=Λ(b,c)+Λ(a,b+c)`; `Λ(0,·)=Λ(·,0)=0` | `IsFactorSet` (:99) proved in scratch |

The rows for statements this diff leaves untouched stand as in the previous review, of 75d3b8e.

- **Gate:** my run at 69eae7d reports every counter 0, OK; the worker's run also reports `build=0`. Depcheck prints `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Lean:** `lake env lean` on `Suggested.lean` gives 12 warnings, all `declaration uses sorry`, and no errors. `Suggested.lean` is unchanged since 75d3b8e. I made a scratch copy importing `TauCeti.Algebra.MonoidAlgebra.Twisted.Basic`. It proves `IsFactorSet` for §0.4's factor set and `BasedChart.eval = lift.toLinearMap ∘ₗ (basis …).repr.symm ∘ₗ Finsupp.domLCongr Multiplicative.ofAdd` for a based chart in a noncommutative `B` over a commutative semiring, with no errors.
- **Sources:** the changed lines carry no source locator. None of the 15 seeded-sample subsections falls in the change (§0.4 only); they stand as previously reviewed.
- **Library declarations at the pins:** Tau Ceti 2fd255d, `Twisted/Basic.lean`:99, 282, 288, 322, 336, 356, 360, 376, 397, 422 and 456. Mathlib `Basis.repr` and `Finsupp.domLCongr` are used in the scratch proof.
- **Cross-roadmap citations:** ScatteringDiagrams on main (7342e8f) resolves. §4.3 is at :1391–1449; its basis target is at :1410, its lattice and coefficient maps at :1414–1418 and its Checks at :1437 and :1442. §0.1 *PositiveDegrees* is at :144–150. The 16 `citations.md` leads are all `Suggested.lean`'s own declarations, and none is in the changed lines.
- **Description:** the supplier headings and the layer-dependency table at the head name the same roadmaps as main's (:161–167). Tau Ceti is the only added supplier, and the Layer 0 bullet states it. The title and description match this head.
- **Overlap check:** I read ScatteringDiagrams (main, 0.18); the open-roadmap and results lists are empty.
  - Tau Ceti owns `twistedMonoidAlgebra`. ScatteringDiagrams §4.3 owns `QuantumMonoidAlgebra` and its maps.
  - The comparison between the two is owned here (§0.4). Searches of main and the open heads for `QuantumMonoidAlgebra` and `twistedMonoidAlgebra` find no other statement of it. HeisenbergImprimitivity, CompactQuantumMetricSpaces and NoncommutativeAndEquivariantIwasawa only consume Tau Ceti's carrier.
- Remark (untouched text): Layer 0 Dependencies :730, "ScatteringDiagrams §4.3 supplies its coefficient and lattice maps", now reads through the §0.4 transport.

## Not verifiable

- No item in the changed passages.

## Source issues

- none
